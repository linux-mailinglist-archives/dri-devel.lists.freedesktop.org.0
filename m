Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D45758AF02
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 07:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042506E04E;
	Tue, 13 Aug 2019 05:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39A46E04E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 05:57:07 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8B2BB206C2;
 Tue, 13 Aug 2019 05:57:07 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <CAFd5g46LHq1sQaio2Vj5jt54YN-Y2HuCT8FbALQhJoekkYJ-uQ@mail.gmail.com>
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-11-brendanhiggins@google.com>
 <20190813042455.4A04320644@mail.kernel.org>
 <CAFd5g46LHq1sQaio2Vj5jt54YN-Y2HuCT8FbALQhJoekkYJ-uQ@mail.gmail.com>
Subject: Re: [PATCH v12 10/18] kunit: test: add tests for kunit test abort
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
User-Agent: alot/0.8.1
Date: Mon, 12 Aug 2019 22:57:06 -0700
Message-Id: <20190813055707.8B2BB206C2@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565675827;
 bh=FyGUGMmt6VbbQd/XPCpah8cHXNq/mUzxgtr490TM5WA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ozCoFjdxFrUh5LQxMnAtmWn3xu8MGm+3oEgO4YFweTz+BBIbWxX5rPJEIqeQ7XIte
 ULgzVckj3NDd47TQ8NJczzulniOe62Jxa8qjpvHzK5dOOwZuG9dYrC1oX/YMzL6A1L
 EcSDLC5VAWszW8A7ahShAkQ2OWzEn+8uo7cZUSzE=
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

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMjI6MDY6MDQpCj4gT24gTW9uLCBB
dWcgMTIsIDIwMTkgYXQgOToyNCBQTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+IHdy
b3RlOgo+ID4KPiA+IFF1b3RpbmcgQnJlbmRhbiBIaWdnaW5zICgyMDE5LTA4LTEyIDExOjI0OjEz
KQo+ID4gPiArCj4gPiA+ICtzdGF0aWMgaW50IGt1bml0X3RyeV9jYXRjaF90ZXN0X2luaXQoc3Ry
dWN0IGt1bml0ICp0ZXN0KQo+ID4gPiArewo+ID4gPiArICAgICAgIHN0cnVjdCBrdW5pdF90cnlf
Y2F0Y2hfdGVzdF9jb250ZXh0ICpjdHg7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICBjdHggPSBrdW5p
dF9remFsbG9jKHRlc3QsIHNpemVvZigqY3R4KSwgR0ZQX0tFUk5FTCk7Cj4gPgo+ID4gQ2FuIHRo
aXMgZmFpbD8gU2hvdWxkIHJldHVybiAtRU5PTUVNIGluIHRoYXQgY2FzZT8KPiAKPiBZZXMsIEkg
c2hvdWxkIGRvIHRoYXQuCgpMb29rcyBsaWtlIGl0J3MgYXNzZXJ0ZWQgdG8gbm90IGJlIGFuIGVy
cm9yLiBJZiBpdCdzIHB1c2hlZCBpbnRvIHRoZSBBUEkKdGhlbiB0aGVyZSdzIG5vdGhpbmcgdG8g
ZG8gaGVyZSwgYW5kIHlvdSBjYW4gaGF2ZSBteSByZXZpZXdlZC1ieSBvbiB0aGlzCnBhdGNoLgoK
UmV2aWV3ZWQtYnk6IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
