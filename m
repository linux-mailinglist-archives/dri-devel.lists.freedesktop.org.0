Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B46A4CE631
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 16:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCA46E06E;
	Mon,  7 Oct 2019 14:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E586E06E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 14:57:40 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E805206C2;
 Mon,  7 Oct 2019 14:57:37 +0000 (UTC)
Subject: Re: [PATCH v18 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <CAHk-=whX-JbpM2Sc85epng_GAgGGzxRAJ2SSKkMf9N1Lsqe+OA@mail.gmail.com>
 <56e2e1a7-f8fe-765b-8452-1710b41895bf@kernel.org>
 <20191004222714.GA107737@google.com>
 <ad800337-1ae2-49d2-e715-aa1974e28a10@kernel.org>
 <20191004232955.GC12012@mit.edu>
 <CAFd5g456rBSp177EkYAwsF+KZ0rxJa90mzUpW2M3R7tWbMAh9Q@mail.gmail.com>
 <63e59b0b-b51e-01f4-6359-a134a1f903fd@kernel.org>
 <CAFd5g47wji3T9RFmqBwt+jPY0tb83y46oj_ttOq=rTX_N1Ggyg@mail.gmail.com>
 <544bdfcb-fb35-5008-ec94-8d404a08fd14@kernel.org>
 <CAFd5g467PkfELixpU0JbaepEAAD_ugAA340-uORngC-eXsQQ-g@mail.gmail.com>
 <20191006165436.GA29585@mit.edu>
 <CAHk-=wjcJxypxUOSF-jc=SQKT1CrOoTMyT7soYzbvK3965JmCA@mail.gmail.com>
 <20191007104048.66ae7e59@gandalf.local.home>
From: shuah <shuah@kernel.org>
Message-ID: <176fa69d-1767-ea9b-476d-c685c2a68d46@kernel.org>
Date: Mon, 7 Oct 2019 08:57:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007104048.66ae7e59@gandalf.local.home>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570460259;
 bh=M/mh7ZDKuNzaoClSYB7rLWBjChHoOPyPKzoupCtmj/s=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=OknCZl7G7XB2x/+wPMOTWsiPriTJeKEbR+zS47+ClfRbCU63jUlK1d+xBxWuJuzCB
 c521NSoNfrmZ7l21+c+4hgme2giarn46R0KzyXhix6klLtQym1/TJUpxv1eArw06l2
 ryeCnoXId3pvz7NjvXBDnl/VEqPPEm1JHVs1Iizw=
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
 linux-nvdimm <linux-nvdimm@lists.01.org>, Kevin Hilman <khilman@baylibre.com>,
 Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, shuah <shuah@kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Julia Lawall <julia.lawall@lip6.fr>, Josh Poimboeuf <jpoimboe@redhat.com>,
 kunit-dev@googlegroups.com, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvNy8xOSA4OjQwIEFNLCBTdGV2ZW4gUm9zdGVkdCB3cm90ZToKPiBPbiBTdW4sIDYgT2N0
IDIwMTkgMTA6MTg6MTEgLTA3MDAKPiBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGludXgtZm91
bmRhdGlvbi5vcmc+IHdyb3RlOgo+IAo+PiBPbiBTdW4sIE9jdCA2LCAyMDE5IGF0IDk6NTUgQU0g
VGhlb2RvcmUgWS4gVHMnbyA8dHl0c29AbWl0LmVkdT4gd3JvdGU6Cj4+Pgo+Pj4gV2VsbCwgb25l
IHRoaW5nIHdlICpjYW4qIGRvIGlzIGlmIChhKSBpZiB3ZSBjYW4gY3JlYXRlIGEga3NlbGZ0ZXN0
Cj4+PiBicmFuY2ggd2hpY2ggd2Uga25vdyBpcyBzdGFibGUgYW5kIHdvbid0IGNoYW5nZSwgYW5k
IChiKSB3ZSBjYW4gZ2V0Cj4+PiBhc3N1cmFuY2VzIHRoYXQgTGludXMgKndpbGwqIGFjY2VwdCB0
aGF0IGJyYW5jaCBkdXJpbmcgdGhlIG5leHQgbWVyZ2UKPj4+IHdpbmRvdywgdGhvc2Ugc3Vic3lz
dGVtcyB3aGljaCB3YW50IHRvIHVzZSBrc2VsZiB0ZXN0IGNhbiBzaW1wbHkgcHVsbAo+Pj4gaXQg
aW50byB0aGVpciB0cmVlLgo+Pgo+PiBZZXMuCj4+Cj4+IEF0IHRoZSBzYW1lIHRpbWUsIEkgZG9u
J3QgdGhpbmsgaXQgbmVlZHMgdG8gYmUgZXZlbiB0aGF0IGZhbmN5LiBFdmVuCj4+IGlmIGl0J3Mg
bm90IGEgc3RhYmxlIGJyYW5jaCB0aGF0IGdldHMgc2hhcmVkIGJldHdlZW4gZGlmZmVyZW50Cj4+
IGRldmVsb3BlcnMsIGl0IHdvdWxkIGJlIGdvb2QgdG8ganVzdCBoYXZlIHBlb3BsZSBkbyBhICJs
ZXQncyB0cnkgdGhpcyIKPj4gdGhyb3ctYXdheSBicmFuY2ggdG8gdXNlIHRoZSBrdW5pdCBmdW5j
dGlvbmFsaXR5IGFuZCB2ZXJpZnkgdGhhdAo+PiAieWVhaCwgdGhpcyBpcyBmYWlybHkgY29udmVu
aWVudCBmb3IgZXh0NCIuCj4+Cj4+IEl0IGRvZXNuJ3QgaGF2ZSB0byBiZSBtZXJnZWQgaW4gdGhh
dCBmb3JtLCBidXQganVzdCBjb25maXJtYXRpb24gdGhhdAo+PiB0aGUgaW5mcmFzdHJ1Y3R1cmUg
aXMgaGVscGZ1bCBiZWZvcmUgaXQgZ2V0cyBtZXJnZWQgd291bGQgYmUgZ29vZC4KPiAKPiBDYW4n
dCB5b3UganVzdCBjcmVhdGUgYW4gZXh0NCBicmFuY2ggdGhhdCBoYXMgdGhlIGtzZWxmdGVzdC1u
ZXh0IGJyYW5jaAo+IGluIGl0LCB0aGF0IHlvdSBidWlsZCB1cG9uLiBBbmQgcHVzaCB0aGF0IGFm
dGVyIHRoZSBrdW5pdCB0ZXN0IGlzCj4gbWVyZ2VkPwo+IAo+IEluIHRoZSBwYXN0IEkndmUgaGFk
IHRvIHJlbHkgb24gb3RoZXIgYnJhbmNoZXMgaW4gbmV4dCwgYW5kIHdvdWxkIGp1c3QKPiBob2xk
IHR3byBicmFuY2hlcyBteXNlbGYuIE9uZSB3aXRoIGV2ZXJ5dGhpbmcgbm90IGRlcGVuZGVudCBv
biB0aGUgb3RoZXIKPiBkZXZlbG9wZXIncyBicmFuY2gsIGFuZCBvbmUgd2l0aCB0aGUgd29yayB0
aGF0IHdhcy4gQXQgdGhlIG1lcmdlCj4gd2luZG93LCBJIHdvdWxkIGVpdGhlciBtZXJnZSB0aGUg
dHdvIG9yIGp1c3Qgc2VuZCB0d28gcHVsbCByZXF1ZXN0cwo+IHdpdGggdGhlIHR3byBicmFuY2hl
cy4KPiAKCkkgZG8gc29tZXRoaW5nIHNpbWlsYXIgd2hlbiBJIGFtIHdvcmtpbmcgb24gdG9wIG9m
IGEgYnJhbmNoIHRoYXQgaXNuJ3QKYWxyZWFkeSBpbiB0aGUgbWFpbmxpbmUuIEluIGFueSBjYXNl
LCByZXBlYXRpbmcgbXlzZWxmCgpMZXQncyB3b3JrIG9uIHRvcCBvZiAtIGl0IGlzIHJlYmFzZWQg
dG8gNS40LXJjMSBhbmQgcmVhZHkgZm9yIHVzZS4KCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3NodWFoL2xpbnV4LWtzZWxmdGVzdC5naXQvbG9nLz9oPXRl
c3QKCkxldCdzIHVzZSB0aGF0IGZvciBrdW5pdCB3b3JrIGZvciA1LjUuIEkgd29uJ3QgYWRkIGFu
eSBrc2VsZnRlc3QgcGF0Y2hlcwp0byBpdCBhbmQga2VlcCBpdCBkZWRpY2F0ZWQgZm9yIGt1bml0
IHdvcmsuIFdoZW4gdGVzdHMgYXJlIHJlYWR5IGZvcgp1cHN0cmVhbSwgSSBjYW4ga2VlcCBhZGRp
bmcgdGhlbSB0byB0aGlzIGJyYW5jaC4KCnRoYW5rcywKLS0gU2h1YWgKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
