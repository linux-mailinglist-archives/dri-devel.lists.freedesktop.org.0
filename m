Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B763269EA6
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 00:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA446E039;
	Mon, 15 Jul 2019 22:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CEFE6E039
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 22:04:07 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0030420665;
 Mon, 15 Jul 2019 22:04:06 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <CAFd5g47481sRaez=yEJN4_ghiXZbxayk1Y04tAZpuzPLsmnhKg@mail.gmail.com>
References: <20190712081744.87097-1-brendanhiggins@google.com>
 <20190712081744.87097-4-brendanhiggins@google.com>
 <20190715204356.4E3F92145D@mail.kernel.org>
 <CAFd5g47481sRaez=yEJN4_ghiXZbxayk1Y04tAZpuzPLsmnhKg@mail.gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v9 03/18] kunit: test: add string_stream a std::stream
 like string builder
User-Agent: alot/0.8.1
Date: Mon, 15 Jul 2019 15:04:06 -0700
Message-Id: <20190715220407.0030420665@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563228247;
 bh=lzmzGxC84ycn5YPcgrlTTZCsaQHNzr70lnAMErLcD6E=;
 h=In-Reply-To:References:From:To:Subject:Cc:Date:From;
 b=yjILvyTeOyRdWTjel54BWNGgZ1ntKYib3gQKxCNMZGijJY1OIFiN5Q/Cq5W/Sq65r
 OjyZGX9OeeT3oFA8a4sDcYrXowZlMFMynYaGOGbEAJsQkEWD3FqBmHRAOOmQwn1vSW
 sbrWnUD7cVteQcJnCcGYDIxrhTqiEX8IEogTyyrs=
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

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDctMTUgMTQ6MTE6NTApCj4gT24gTW9uLCBK
dWwgMTUsIDIwMTkgYXQgMTo0MyBQTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+IHdy
b3RlOgo+ID4KPiA+IEkgYWxzbyB3b25kZXIgaWYgaXQgd291bGQgYmUgYmV0dGVyIHRvIGp1c3Qg
aGF2ZSBhIGJpZyBzbG9wIGJ1ZmZlciBvZiBhCj4gPiA0SyBwYWdlIG9yIHNvbWV0aGluZyBzbyB0
aGF0IHdlIGFsbW9zdCBuZXZlciBoYXZlIHRvIGFsbG9jYXRlIGFueXRoaW5nCj4gPiB3aXRoIGEg
c3RyaW5nX3N0cmVhbSBhbmQgd2UgY2FuIGp1c3QgcmVseSBvbiBhIHJlYWRlciBjb25zdW1pbmcg
ZGF0YQo+ID4gd2hpbGUgd3JpdGVycyBhcmUgd3JpdGluZy4gVGhhdCBtaWdodCB3b3JrIG91dCBi
ZXR0ZXIsIGJ1dCBJIGRvbid0IHF1aXRlCj4gPiB1bmRlcnN0YW5kIHRoZSB1c2UgY2FzZSBmb3Ig
dGhlIHN0cmluZyBzdHJlYW0uCj4gCj4gVGhhdCBtYWtlcyBzZW5zZSwgYnV0IG1pZ2h0IHRoYXQg
YWxzbyB3YXN0ZSBtZW1vcnkgc2luY2Ugd2Ugd2lsbAo+IGFsbW9zdCBuZXZlciBuZWVkIHRoYXQg
bXVjaCBtZW1vcnk/CgpXaHkgZG8gd2UgY2FyZT8gVGhlc2UgYXJlIHVuaXQgdGVzdHMuIEhhdmlu
ZyBhbGxvY2F0aW9ucyBpbiBoZXJlIG1ha2VzCnRoaW5ncyBtb3JlIGNvbXBsaWNhdGVkLCB3aGVy
ZWFzIGl0IHdvdWxkIGJlIHNpbXBsZXIgdG8gaGF2ZSBhIHBvaW50ZXIKYW5kIGEgc3BpbmxvY2sg
b3BlcmF0aW5nIG9uIGEgY2h1bmsgb2YgbWVtb3J5IHRoYXQgZ2V0cyBmbHVzaGVkIG91dApwZXJp
b2RpY2FsbHkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
