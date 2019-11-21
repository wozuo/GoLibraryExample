//
//  ViewController.swift
//  GoLibraryExample
//
//  Created by Marc Tarnutzer on 21.11.19.
//  Copyright © 2019 Marc Tarnutzer. All rights reserved.
//

import UIKit
import HTMLEscaper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Loaded viewDidLoad")
        let someString = "<script>alert(123);</script>"
        print("HTML escaped string: \(someString.escapedHTMLString() ?? "")")
    }
}

extension String {
    public func escapedHTMLString() -> String? {
        return self.withCString() {
            guard let v = escape_html(UnsafeMutablePointer(mutating: $0)) else { return nil }
            return String(bytesNoCopy: v, length: strlen(v), encoding: .utf8, freeWhenDone: true)
        }
    }

    public func unescapedHTMLString() -> String? {
        return self.withCString() {
            guard let v = unescape_html(UnsafeMutablePointer(mutating: $0)) else { return nil }
            return String(bytesNoCopy: v, length: strlen(v), encoding: .utf8, freeWhenDone: true)
        }
    }
}
