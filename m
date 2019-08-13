Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C138AE83
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 07:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4E76E03B;
	Tue, 13 Aug 2019 05:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6DD6E03B
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 05:06:16 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id v12so3098390pfn.10
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 22:06:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Abf3cK9D+gRrRGwQh2kwak/YzDDkHOqgDtvVTIo4q7A=;
 b=jCvHgZIAYtXRiGoeHr0913cJD7S+tuhQtrw/EbxbyWho5WE/bh2VDV9ZhNQl5xWprK
 j9LdSuMHOuAHkPDl4lJHcgjeqUPWsLfho7e2/r6GHVtvYrnI1bKY+qc/KbrJ79bn6KJM
 lgWBHYs9AnoePmxpyOpxRdObXd+CrxZ+0kDKA8QSr9y7iiVcTExgxJoj8OFk/BzN0IR8
 zVvT5EqvyL9mOGLXLhdDIOdHSTPcRB+QnBcp+R/yaWRqyLXNXNvwojaPOkKlnITcprOz
 c/CfazOjZqv7ahyH+v+EAX7dWf7p7eB46L57H0pYlwrWEPWgsz0z7lOLBC700jHjQvNS
 UyBg==
X-Gm-Message-State: APjAAAWOZ3vbhrERWps06Oa7PItZ/kLAS1NWE1GVxaOOxmlEBlQ4tzQc
 Cb+HZX514IgJ97rdhau7sReROAFMZz6ovvDOMxuqGg==
X-Google-Smtp-Source: APXvYqzlm/LZa7vLxmhuF4EQXYFyYKJYlrIat9BhnUUptmEmQR49KGysQZ4JhDoNNZWx7O5yEaH2e2yfA6hMO6s/qoE=
X-Received: by 2002:a63:205f:: with SMTP id r31mr30781941pgm.159.1565672775425; 
 Mon, 12 Aug 2019 22:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-11-brendanhiggins@google.com>
 <20190813042455.4A04320644@mail.kernel.org>
In-Reply-To: <20190813042455.4A04320644@mail.kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 12 Aug 2019 22:06:04 -0700
Message-ID: <CAFd5g46LHq1sQaio2Vj5jt54YN-Y2HuCT8FbALQhJoekkYJ-uQ@mail.gmail.com>
Subject: Re: [PATCH v12 10/18] kunit: test: add tests for kunit test abort
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Abf3cK9D+gRrRGwQh2kwak/YzDDkHOqgDtvVTIo4q7A=;
 b=Y+dmDbanwPRKrcGCv4/WQS9jtPyx6cpYSiNcTCluUKOVyeyn7wl8RZe0u1cf6FlML6
 wfRe3v8dcFvKIShJjXRgh8cEGNhzCFLCfZTUSJEGO2Ea0/S9/l8EIDzT2hfdmu4vYl3/
 XIR90pnuI3K4kV1d5Bm11Pn57c+GfE4dVDOOxOsnLShgWMYlA1pJcJoF7sOPZtexCwYP
 ELhxZQwrFnEmjZhgXx2mjuE3HiLK9TadecMdLzAo0eHIWgo1V1G1uOa5P7ZTv3NrW55Q
 IwxyHJePJisriyJmWo1d+yNh53aHnfmOSYFZCbC26Ph2JuMFkmU8c4wQttP2Gfux7zEx
 HKsA==
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 shuah <shuah@kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Theodore Ts'o <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgOToyNCBQTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gUXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMTE6
MjQ6MTMpCj4gPiArCj4gPiArc3RhdGljIGludCBrdW5pdF90cnlfY2F0Y2hfdGVzdF9pbml0KHN0
cnVjdCBrdW5pdCAqdGVzdCkKPiA+ICt7Cj4gPiArICAgICAgIHN0cnVjdCBrdW5pdF90cnlfY2F0
Y2hfdGVzdF9jb250ZXh0ICpjdHg7Cj4gPiArCj4gPiArICAgICAgIGN0eCA9IGt1bml0X2t6YWxs
b2ModGVzdCwgc2l6ZW9mKCpjdHgpLCBHRlBfS0VSTkVMKTsKPgo+IENhbiB0aGlzIGZhaWw/IFNo
b3VsZCByZXR1cm4gLUVOT01FTSBpbiB0aGF0IGNhc2U/CgpZZXMsIEkgc2hvdWxkIGRvIHRoYXQu
Cgo+ID4gKyAgICAgICB0ZXN0LT5wcml2ID0gY3R4Owo+ID4gKwo+ID4gKyAgICAgICBjdHgtPnRy
eV9jYXRjaCA9IGt1bml0X2ttYWxsb2ModGVzdCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHNpemVvZigqY3R4LT50cnlfY2F0Y2gpLAo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgR0ZQX0tFUk5FTCk7Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
