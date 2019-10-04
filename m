Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBA6CC588
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 23:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180BF6EC29;
	Fri,  4 Oct 2019 21:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A8D6EC29
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 21:59:26 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F2D2021D81;
 Fri,  4 Oct 2019 21:59:23 +0000 (UTC)
Subject: Re: [PATCH v18 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: Linus Torvalds <torvalds@linux-foundation.org>,
 "Theodore Y. Ts'o" <tytso@mit.edu>
References: <20190923090249.127984-1-brendanhiggins@google.com>
 <20191004213812.GA24644@mit.edu>
 <CAHk-=whX-JbpM2Sc85epng_GAgGGzxRAJ2SSKkMf9N1Lsqe+OA@mail.gmail.com>
From: shuah <shuah@kernel.org>
Message-ID: <56e2e1a7-f8fe-765b-8452-1710b41895bf@kernel.org>
Date: Fri, 4 Oct 2019 15:59:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=whX-JbpM2Sc85epng_GAgGGzxRAJ2SSKkMf9N1Lsqe+OA@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570226366;
 bh=W73YLXhXs87A3g1korb/FdZux/uM+XbdVy58joNqtAw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=c7fOk7RUHivPSo4Br+sR7Ulb8toFXC/ZDyjo7M4McI2vK/fU2u5yUL6sgZqCG9/0N
 ojFH2VfZcCuNDqHBacwdU9j3hm2X7p3FAwv0T6qBCIoIakX+ukDWwwzuMnkOhquBaJ
 BRLuBCpyg/Pa+cLfW2XKs0phXp09dZr4S7bAKusM=
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
 Frank Rowand <frowand.list@gmail.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, khilman@baylibre.com,
 knut.omang@oracle.com, kieran.bingham@ideasonboard.com, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 jdike@addtoit.com, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree@vger.kernel.org, shuah <shuah@kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Tim.Bird@sony.com,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 Julia Lawall <julia.lawall@lip6.fr>, Josh Poimboeuf <jpoimboe@redhat.com>,
 kunit-dev@googlegroups.com, Richard Weinberger <richard@nod.at>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, logang@deltatee.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvNC8xOSAzOjQyIFBNLCBMaW51cyBUb3J2YWxkcyB3cm90ZToKPiBPbiBGcmksIE9jdCA0
LCAyMDE5IGF0IDI6MzkgUE0gVGhlb2RvcmUgWS4gVHMnbyA8dHl0c29AbWl0LmVkdT4gd3JvdGU6
Cj4+Cj4+IFRoaXMgcXVlc3Rpb24gaXMgcHJpbWFyaWx5IGRpcmVjdGVkIGF0IFNodWFoIGFuZCBM
aW51cy4uLi4KPj4KPj4gV2hhdCdzIHRoZSBjdXJyZW50IHN0YXR1cyBvZiB0aGUga3VuaXQgc2Vy
aWVzIG5vdyB0aGF0IEJyZW5kYW4gaGFzCj4+IG1vdmVkIGl0IG91dCBvZiB0aGUgdG9wLWxldmVs
IGt1bml0IGRpcmVjdG9yeSBhcyBMaW51cyBoYXMgcmVxdWVzdGVkPwo+IAoKVGhlIG1vdmUgaGFw
cGVuZWQgc21hY2sgaW4gdGhlIG1pZGRsZSBvZiBtZXJnZSB3aW5kb3cgYW5kIGxhbmRlZCBpbgps
aW51eC1uZXh0IHRvd2FyZHMgdGhlIGVuZCBvZiB0aGUgbWVyZ2Ugd2luZG93LgoKPiBXZSBzZWVt
ZWQgdG8gZGVjaWRlIHRvIGp1c3Qgd2FpdCBmb3IgNS41LCBidXQgdGhlcmUgaXMgbm90aGluZyB0
aGF0Cj4gbG9va3MgdG8gYmxvY2sgdGhhdC4gQW5kIEkgZW5jb3VyYWdlZCBTaHVhaCB0byBmaW5k
IG1vcmUga3VuaXQgY2FzZXMKPiBmb3Igd2hlbiBpdCBfZG9lc18gZ2V0IG1lcmdlZC4KPiAKClJp
Z2h0LiBJIGNvbW11bmljYXRlZCB0aGF0IHRvIEJyZW5kYW4gdGhhdCB3ZSBjb3VsZCB3b3JrIG9u
IGFkZGluZyBtb3JlCmt1bml0IGJhc2VkIHRlc3RzIHdoaWNoIHdvdWxkIGhlbHAgZ2V0IG1vcmUg
bWlsZWFnZSBvbiB0aGUga3VuaXQuCgo+IFNvIGlmIHRoZSBrdW5pdCBicmFuY2ggaXMgc3RhYmxl
LCBhbmQgcGVvcGxlIHdhbnQgdG8gc3RhcnQgdXNpbmcgaXQKPiBmb3IgdGhlaXIgdW5pdCB0ZXN0
cywgdGhlbiBJIHRoaW5rIHRoYXQgd291bGQgYmUgYSBnb29kIGlkZWEsIGFuZCB0aGVuCj4gZHVy
aW5nIHRoZSA1LjUgbWVyZ2Ugd2luZG93IHdlJ2xsIG5vdCBqdXN0IGdldCB0aGUgaW5mcmFzdHJ1
Y3R1cmUsCj4gd2UnbGwgZ2V0IGEgZmV3IG1vcmUgdXNlcnMgdG9vIGFuZCBub3QganVzdCBleGFt
cGxlcy4KPiAKdGhhbmtzLAotLSBTaHVhaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
