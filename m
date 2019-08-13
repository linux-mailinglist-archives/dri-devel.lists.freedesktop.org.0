Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 208578BF4E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 19:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136066E1FB;
	Tue, 13 Aug 2019 17:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3336E1F2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 17:07:13 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C89CA20679;
 Tue, 13 Aug 2019 17:07:12 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <CAFd5g44Es4emKyQSxUkqckGJ02_o3sAcDLwUCW8ZFGX14j5=xg@mail.gmail.com>
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-13-brendanhiggins@google.com>
 <20190813043140.67FF320644@mail.kernel.org>
 <CAFd5g44Es4emKyQSxUkqckGJ02_o3sAcDLwUCW8ZFGX14j5=xg@mail.gmail.com>
Subject: Re: [PATCH v12 12/18] kunit: test: add tests for KUnit managed
 resources
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
User-Agent: alot/0.8.1
Date: Tue, 13 Aug 2019 10:07:12 -0700
Message-Id: <20190813170712.C89CA20679@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565716032;
 bh=fgW6Va1LDRwdq/a+4YEJkeWaGkuqaoxvU1J721UrWZU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=treWSrq2kr/VcJofxmrL4w25Mma1xe0c8v1GBc5/aXPXBX/Qh1u42KfGgRAMZ0E7B
 JnDwwQ837FHdqo8RQtK1lGQzBKI6OSJ9LmUHBI9Mkjtg2i718ItycmKZiAhZvxCmXX
 sM2LnPO88BoqSh26Dp8VQGdXD9L0EbFEm7nrZp44=
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
 Timothy" <Tim.Bird@sony.com>, Avinash Kondareddy <akndr41@gmail.com>,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 Julia Lawall <julia.lawall@lip6.fr>, Josh Poimboeuf <jpoimboe@redhat.com>,
 kunit-dev@googlegroups.com, Theodore Ts'o <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTMgMDA6NTc6MzMpCj4gT24gTW9uLCBB
dWcgMTIsIDIwMTkgYXQgOTozMSBQTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+IHdy
b3RlOgo+ID4KPiA+IEJUVywgbWF5YmUga3VuaXQgYWxsb2NhdGlvbiBBUElzIHNob3VsZAo+ID4g
ZmFpbCB0aGUgdGVzdCBpZiB0aGV5IGZhaWwgdG8gYWxsb2NhdGUgaW4gZ2VuZXJhbC4gVW5sZXNz
IHdlJ3JlIHVuaXQKPiA+IHRlc3RpbmcgZmFpbHVyZSB0byBhbGxvY2F0ZSBwcm9ibGVtcy4KPiAK
PiBZZWFoLCBJIHRob3VnaHQgYWJvdXQgdGhhdC4gSSB3YXNuJ3Qgc3VyZSBob3cgcGVvcGxlIHdv
dWxkIGZlZWwgYWJvdXQKPiBpdCwgYW5kIEkgdGhvdWdodCBpdCB3b3VsZCBiZSBhIHBhaW4gdG8g
dGVhc2Ugb3V0IGFsbCB0aGUgaXNzdWVzCj4gYXJpc2luZyBmcm9tIGFib3J0aW5nIGluIGRpZmZl
cmVudCBjb250ZXh0cyB3aGVuIHNvbWVvbmUgbWlnaHQgbm90Cj4gZXhwZWN0IGl0Lgo+IAo+IEkg
YW0gdGhpbmtpbmcgbGF0ZXIgd2UgY2FuIGhhdmUga3VuaXRfa21hbGxvY19vcl9hYm9ydCB2YXJp
YW50cz8gQW5kCj4gdGhlbiB3ZSBjYW4gcHVudCB0aGlzIGlzc3VlIHRvIGEgbGF0ZXIgdGltZT8K
PiAKClN1cmUuIFNvdW5kcyBnb29kLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
