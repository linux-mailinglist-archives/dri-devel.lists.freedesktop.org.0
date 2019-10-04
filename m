Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 852DBCC4FA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 23:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DE56E33C;
	Fri,  4 Oct 2019 21:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4B16E33C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 21:42:38 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id d1so7884709ljl.13
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2019 14:42:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kSvi6bN3MgmA9q6zMgIL0cUcdQWLY9tbHblghBTgstI=;
 b=mWQNmFw19U8G5nKhA9xTCNiRTcg4bDmCMzM6jmRRYHpnE6EWB+kf62D7uKDJDgZztD
 VQRaWoX/jiuW5/a85BBY0B3J8R34BRpmgsbUxfhD5HsRgEZw8XY4KPDpU0Vjkdc3chrD
 jNExWuXAkQC4x6XIgicH7BBAe2wr1xrESOjS3k3b/aM5BO1x8GxygcWBRUXHHlVAZWuU
 jlKlI8rPqn/Ja7PoFEzkzYcjU0QpGg5vHKdNcQ1y1SzcEpQblDdJSMn6Sc9gOA7yhht/
 pk+BIJsjU7pmzxsNUzebvkAj0xVVUN6jbX9ahjEvnSvVPsGXMGkY47IaH4bsdnBKeET+
 dqGQ==
X-Gm-Message-State: APjAAAVwMFPCs857JM8qeo8tcsf1tZdIMXnUHmdlWgQEOBY0wr7kCWKn
 Ilx9mSpHvYdy7pBOPMmbI50N+/UIXFY=
X-Google-Smtp-Source: APXvYqygJtWquaHUL0s33337XtWvoAoEDWuSIeq6GKL4yWRGlUBR/1oO4cWdn+KI89zzAOwnjW5JmA==
X-Received: by 2002:a2e:7a04:: with SMTP id v4mr10905733ljc.237.1570225355977; 
 Fri, 04 Oct 2019 14:42:35 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47])
 by smtp.gmail.com with ESMTPSA id e21sm1371490lfj.10.2019.10.04.14.42.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2019 14:42:34 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id y127so5485530lfc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2019 14:42:33 -0700 (PDT)
X-Received: by 2002:a19:7d55:: with SMTP id y82mr10113290lfc.106.1570225353484; 
 Fri, 04 Oct 2019 14:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190923090249.127984-1-brendanhiggins@google.com>
 <20191004213812.GA24644@mit.edu>
In-Reply-To: <20191004213812.GA24644@mit.edu>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 4 Oct 2019 14:42:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=whX-JbpM2Sc85epng_GAgGGzxRAJ2SSKkMf9N1Lsqe+OA@mail.gmail.com>
Message-ID: <CAHk-=whX-JbpM2Sc85epng_GAgGGzxRAJ2SSKkMf9N1Lsqe+OA@mail.gmail.com>
Subject: Re: [PATCH v18 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: "Theodore Y. Ts'o" <tytso@mit.edu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=kSvi6bN3MgmA9q6zMgIL0cUcdQWLY9tbHblghBTgstI=;
 b=hBuewRInP5i+6gtlRLW9UtlDY0YPe0z67E0xbXSSSKYA7biQf+uXTlrPp7zLuAUPeq
 5uQ2rwixtXebf99m1RfUdMDyjGKPh3VgF3DuF8NvshRtQGRa2wNkvwDCWMNQ0VKjXHWB
 ZmI6XqYkyQwmdmiffnmLI1+ZMJ0oT9STysqR8=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Petr Mladek <pmladek@suse.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Amir Goldstein <amir73il@gmail.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Frank Rowand <frowand.list@gmail.com>, knut.omang@oracle.com,
 kieran.bingham@ideasonboard.com, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 jdike@addtoit.com, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree@vger.kernel.org,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Tim.Bird@sony.com,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 Julia Lawall <julia.lawall@lip6.fr>, Josh Poimboeuf <jpoimboe@redhat.com>,
 kunit-dev@googlegroups.com, Richard Weinberger <richard@nod.at>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, logang@deltatee.com,
 khilman@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgNCwgMjAxOSBhdCAyOjM5IFBNIFRoZW9kb3JlIFkuIFRzJ28gPHR5dHNvQG1p
dC5lZHU+IHdyb3RlOgo+Cj4gVGhpcyBxdWVzdGlvbiBpcyBwcmltYXJpbHkgZGlyZWN0ZWQgYXQg
U2h1YWggYW5kIExpbnVzLi4uLgo+Cj4gV2hhdCdzIHRoZSBjdXJyZW50IHN0YXR1cyBvZiB0aGUg
a3VuaXQgc2VyaWVzIG5vdyB0aGF0IEJyZW5kYW4gaGFzCj4gbW92ZWQgaXQgb3V0IG9mIHRoZSB0
b3AtbGV2ZWwga3VuaXQgZGlyZWN0b3J5IGFzIExpbnVzIGhhcyByZXF1ZXN0ZWQ/CgpXZSBzZWVt
ZWQgdG8gZGVjaWRlIHRvIGp1c3Qgd2FpdCBmb3IgNS41LCBidXQgdGhlcmUgaXMgbm90aGluZyB0
aGF0Cmxvb2tzIHRvIGJsb2NrIHRoYXQuIEFuZCBJIGVuY291cmFnZWQgU2h1YWggdG8gZmluZCBt
b3JlIGt1bml0IGNhc2VzCmZvciB3aGVuIGl0IF9kb2VzXyBnZXQgbWVyZ2VkLgoKU28gaWYgdGhl
IGt1bml0IGJyYW5jaCBpcyBzdGFibGUsIGFuZCBwZW9wbGUgd2FudCB0byBzdGFydCB1c2luZyBp
dApmb3IgdGhlaXIgdW5pdCB0ZXN0cywgdGhlbiBJIHRoaW5rIHRoYXQgd291bGQgYmUgYSBnb29k
IGlkZWEsIGFuZCB0aGVuCmR1cmluZyB0aGUgNS41IG1lcmdlIHdpbmRvdyB3ZSdsbCBub3QganVz
dCBnZXQgdGhlIGluZnJhc3RydWN0dXJlLAp3ZSdsbCBnZXQgYSBmZXcgbW9yZSB1c2VycyB0b28g
YW5kIG5vdCBqdXN0IGV4YW1wbGVzLgoKICAgICAgICAgICAgIExpbnVzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
