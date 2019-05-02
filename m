Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B9412828
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 08:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13CE896D8;
	Fri,  3 May 2019 06:54:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58124891DA
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 21:18:57 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id t87so1170905pfa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 14:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IMDXeiJnZScTm/Z2fnilFyDCMvT/so814pMi9HZOjlE=;
 b=hAbaNNMz+7G8hYfBNj8bG95ejHQakjapObfUVGm9p2U5kFa6/BOoeeZds4gWRvkYCk
 r9jGaY7/RaagHiMJNzSLVNoBJ5TleTLT/H2unystdPtvTIigDmWXDPgTDcTRiLq9kIEx
 2S5GUALnydMKT/ITTegnK/cSEB+mmp4Qwrm/TMI9vneYS2vH6IkyoxwMlj68I+mkLaro
 vWTdfsmsBsjNISk5FMsvUiKCj0ut6iIgjHrv+G1VSJcsnwt4d8MgMsjV2Pip6zb5A+NN
 W6C1hSASJZMIcJ16LGeOsgBf4LM53+LjvGFBxyfYmNp7VB8lzA1s6Tf5x8DxKFzdHQmb
 Wa+w==
X-Gm-Message-State: APjAAAWlFlXjzqCBeOxL86mKKIEf9m/RONWMaG40ClFSSoz1rRaCIHRM
 +pG7XPIo/RqVUWr0YiB8+QA=
X-Google-Smtp-Source: APXvYqyX3j/ct3IijwmpxxuiCJMGeDGeHP5eVJgN3Sl6Ovmj2WM37sI+ZAhRzZjNxXrFUHk4WRTuBA==
X-Received: by 2002:a65:5089:: with SMTP id r9mr6248599pgp.14.1556831937028;
 Thu, 02 May 2019 14:18:57 -0700 (PDT)
Received: from [192.168.1.70] (c-24-6-192-50.hsd1.ca.comcast.net.
 [24.6.192.50])
 by smtp.gmail.com with ESMTPSA id l1sm232976pgp.9.2019.05.02.14.18.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 14:18:56 -0700 (PDT)
Subject: Re: [PATCH v2 04/17] kunit: test: add kunit_stream a std::stream like
 logger
To: Brendan Higgins <brendanhiggins@google.com>,
 Greg KH <gregkh@linuxfoundation.org>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-5-brendanhiggins@google.com>
 <20190502110008.GC12416@kroah.com>
 <CAFd5g47ssM7RQZxQsUJ86UigcF-Uz+Kwv2yvKN_gZK-TtW89bA@mail.gmail.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <6fcf1218-a026-fd7b-236f-ea95f6312e1d@gmail.com>
Date: Thu, 2 May 2019 14:18:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFd5g47ssM7RQZxQsUJ86UigcF-Uz+Kwv2yvKN_gZK-TtW89bA@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 03 May 2019 06:54:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IMDXeiJnZScTm/Z2fnilFyDCMvT/so814pMi9HZOjlE=;
 b=F6aEAFFTMEY1A2qy1v4j/PN2GP6GkE/6G2UBiv6QtH3csxGy/tWQz9UyALBQT0H1TD
 MeqU6hM9umqY0cg0Apce+C6xD7p/xobhUeh9MvWiRshhDTYwjMCFPRJXDlmB1nI2J9BP
 OzIBfpWyS6JYvMDV31/EOZgJHoSWDTYYtNA+I4V1u8ppBrJn22kX8LSoN6iqCo9WhEY7
 d+Gb6Xl5Xs5otxILTZsg9XkKBj+kf5e2zhHYN3mehnTBbPBGx+Rmo9Huu3e7g+KZRBMy
 FLtK+ZKMR1Bm1xie5Eekig7pGAK9pe7NuFPMeA4bw49W6KmIoFN+i8IYZC8Mr/CFaKXa
 I9Cg==
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
Cc: Petr Mladek <pmladek@suse.com>, linux-doc@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-kselftest@vger.kernel.org,
 shuah@kernel.org, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Kevin Hilman <khilman@baylibre.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Dan Williams <dan.j.williams@intel.com>, kunit-dev@googlegroups.com,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS8yLzE5IDE6MjUgUE0sIEJyZW5kYW4gSGlnZ2lucyB3cm90ZToKPiBPbiBUaHUsIE1heSAy
LCAyMDE5IGF0IDQ6MDAgQU0gR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdy
b3RlOgo+Pgo+PiBPbiBXZWQsIE1heSAwMSwgMjAxOSBhdCAwNDowMToxM1BNIC0wNzAwLCBCcmVu
ZGFuIEhpZ2dpbnMgd3JvdGU6Cj4+PiBBIGxvdCBvZiB0aGUgZXhwZWN0YXRpb24gYW5kIGFzc2Vy
dGlvbiBpbmZyYXN0cnVjdHVyZSBwcmludHMgb3V0IGZhaXJseQo+Pj4gY29tcGxpY2F0ZWQgdGVz
dCBmYWlsdXJlIG1lc3NhZ2VzLCBzbyBhZGQgYSBDKysgc3R5bGUgbG9nIGxpYnJhcnkgZm9yCj4+
PiBmb3IgbG9nZ2luZyB0ZXN0IHJlc3VsdHMuCj4+Cj4+IElkZWFsbHkgd2Ugd291bGQgYWx3YXlz
IHVzZSBhIHN0YW5kYXJkIGxvZ2dpbmcgZm9ybWF0LCBsaWtlIHRoZQo+PiBrc2VsZnRlc3QgdGVz
dHMgYWxsIGFyZSBhaW1pbmcgdG8gZG8uICBUaGF0IHdheSB0aGUgb3V0cHV0IGNhbiBiZSBlYXNp
bHkKPj4gcGFyc2VkIGJ5IHRvb2xzIHRvIHNlZSBpZiB0aGUgdGVzdHMgc3VjY2VlZC9mYWlsIGVh
c2lseS4KPj4KPj4gQW55IGNoYW5jZSBvZiBoYXZpbmcgdGhpcyBsb2dnaW5nIGZyYW1ld29yayBl
bmZvcmNpbmcgdGhhdCBmb3JtYXQgYXMKPj4gd2VsbD8KPiAKPiBJIGFncmVlIHdpdGggeW91ciBj
b21tZW50IG9uIHRoZSBsYXRlciBwYXRjaCB0aGF0IHdlIHNob3VsZCBoYW5kbGUKPiB0aGlzIGF0
IHRoZSB3cmFwcGVyIHNjcmlwdCBsYXllciAoS1VuaXQgdG9vbCkuCgpUaGlzIGRpc2N1c3Npb24g
aXMgYSBsaXR0bGUgY29uZnVzaW5nLCBiZWNhdXNlIGl0IGlzIHNwcmVhZCBhY3Jvc3MgdHdvCnBh
dGNoZXMuCgpJIGRvIG5vdCBhZ3JlZSB0aGF0IHRoaXMgc2hvdWxkIGJlIGhhbmRsZWQgaW4gdGhl
IHdyYXBwZXIgc2NyaXB0LCBhcwpub3RlZCBpbiBteSByZXBseSB0byBwYXRjaCAxMiwgc28gbm90
IHJlcGVhdGluZyBpdCBoZXJlLgoKLUZyYW5rCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
