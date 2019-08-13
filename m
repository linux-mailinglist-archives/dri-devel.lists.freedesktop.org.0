Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1A78BF40
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 19:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25F36E1E8;
	Tue, 13 Aug 2019 17:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78AA6E1E8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 17:06:28 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B0912067D;
 Tue, 13 Aug 2019 17:06:28 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <CAFd5g4415URtJBKPhsEw98GxiExJr-fstW6SQ6nmV9ts9ggK-g@mail.gmail.com>
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-10-brendanhiggins@google.com>
 <20190813042159.46814206C2@mail.kernel.org>
 <CAFd5g44XyQi-oprPcdgx-EPboQYaHY6Ocz8Te6NX2SxV=mVhQA@mail.gmail.com>
 <20190813055615.CA787206C2@mail.kernel.org>
 <CAFd5g4415URtJBKPhsEw98GxiExJr-fstW6SQ6nmV9ts9ggK-g@mail.gmail.com>
Subject: Re: [PATCH v12 09/18] kunit: test: add support for test abort
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
User-Agent: alot/0.8.1
Date: Tue, 13 Aug 2019 10:06:27 -0700
Message-Id: <20190813170628.9B0912067D@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565715988;
 bh=mXleQo1BfGDF4Gvt8gwvemAiKY2B7AKwDPdsZQzGEig=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=2YP/hufKMPeHV9Iqtm97Hg+EE9Q7yk3dpGfTYo+YIFuTd+znybtuf6QsdhYKGv2OL
 bffgiZjbx8+MzDPbg9zNDOCLOmmjE13s1gxUgB6nndEdwsA+9gYRAddFBIlqnsF3wh
 t+HdplopKKhd7nK05G6fCJXNmNCfRN1TXzWpMoO0=
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

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTMgMDA6NTI6MDMpCj4gT24gTW9uLCBB
dWcgMTIsIDIwMTkgYXQgMTA6NTYgUE0gU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPiB3
cm90ZToKPiA+Cj4gPiBRdW90aW5nIEJyZW5kYW4gSGlnZ2lucyAoMjAxOS0wOC0xMiAyMTo1Nzo1
NSkKPiA+ID4gT24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgOToyMiBQTSBTdGVwaGVuIEJveWQgPHNi
b3lkQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gUXVvdGluZyBCcmVuZGFuIEhp
Z2dpbnMgKDIwMTktMDgtMTIgMTE6MjQ6MTIpCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9rdW5pdC90ZXN0LmggYi9pbmNsdWRlL2t1bml0L3Rlc3QuaAo+ID4gPiA+ID4gaW5kZXggMjYy
NWJjZmViMTlhYy4uOTMzODFmODQxZTA5ZiAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2luY2x1ZGUv
a3VuaXQvdGVzdC5oCj4gPiA+ID4gPiArKysgYi9pbmNsdWRlL2t1bml0L3Rlc3QuaAo+ID4gPiA+
ID4gQEAgLTE4NCw2ICsxOTEsMTMgQEAgc3RydWN0IGt1bml0IHsKPiA+ID4gPiA+ICAgICAgICAg
c3RydWN0IGxpc3RfaGVhZCByZXNvdXJjZXM7IC8qIFByb3RlY3RlZCBieSBsb2NrLiAqLwo+ID4g
PiA+ID4gIH07Cj4gPiA+ID4gPgo+ID4gPiA+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBrdW5pdF9z
ZXRfZGVhdGhfdGVzdChzdHJ1Y3Qga3VuaXQgKnRlc3QsIGJvb2wgZGVhdGhfdGVzdCkKPiA+ID4g
PiA+ICt7Cj4gPiA+ID4gPiArICAgICAgIHNwaW5fbG9jaygmdGVzdC0+bG9jayk7Cj4gPiA+ID4g
PiArICAgICAgIHRlc3QtPmRlYXRoX3Rlc3QgPSBkZWF0aF90ZXN0Owo+ID4gPiA+ID4gKyAgICAg
ICBzcGluX3VubG9jaygmdGVzdC0+bG9jayk7Cj4gPiA+ID4gPiArfQo+ID4gPiA+Cj4gPiA+ID4g
VGhlc2UgZ2V0dGVycyBhbmQgc2V0dGVycyBhcmUgdXNpbmcgc3BpbmxvY2tzIGFnYWluLiBJdCBk
b2Vzbid0IG1ha2UgYW55Cj4gPiA+ID4gc2Vuc2UuIEl0IHByb2JhYmx5IG5lZWRzIGEgcmV3b3Jr
IGxpa2Ugd2FzIGRvbmUgZm9yIHRoZSBvdGhlciBib29sCj4gPiA+ID4gbWVtYmVyLCBzdWNjZXNz
Lgo+ID4gPgo+ID4gPiBObywgdGhpcyBpcyBpbnRlbnRpb25hbC4gZGVhdGhfdGVzdCBjYW4gdHJh
bnNpdGlvbiBmcm9tIGZhbHNlIHRvIHRydWUKPiA+ID4gYW5kIHRoZW4gYmFjayB0byBmYWxzZSB3
aXRoaW4gdGhlIHNhbWUgdGVzdC4gTWF5YmUgdGhhdCBkZXNlcnZlcyBhCj4gPiA+IGNvbW1lbnQ/
Cj4gPgo+ID4gWWVzLiBIb3cgZG9lcyBpdCB0cmFuc2l0aW9uIGZyb20gdHJ1ZSB0byBmYWxzZSBh
Z2Fpbj8KPiAKPiBUaGUgcHVycG9zZSBpcyB0byB0ZWxsIHRyeV9jYXRjaCB0aGF0IGl0IHdhcyBl
eHBlY3RlZCBmb3IgdGhlIHRlc3QgdG8KPiBiYWlsIG91dC4gR2l2ZW4gdGhlIGRlZmF1bHQgaW1w
bGVtZW50YXRpb24gdGhlcmUgaXMgbm8gd2F5IGZvciB0aGlzIHRvCj4gaGFwcGVuIGFzaWRlIGZy
b20gYWJvcnQoKSBiZWluZyBjYWxsZWQsIGJ1dCBpbiBzb21lIGltcGxlbWVudGF0aW9ucyBpdAo+
IGlzIHBvc3NpYmxlIHRvIGltcGxlbWVudCBhIGZhdWx0IGNhdGNoZXIgd2hpY2ggYWxsb3dzIGEg
dGVzdCBzdWl0ZSB0bwo+IHJlY292ZXIgZnJvbSBhbiB1bmV4cGVjdGVkIGZhaWx1cmUuCj4gCj4g
TWF5YmUgaXQgd291bGQgYmUgYmVzdCB0byBkcm9wIHRoaXMgdW50aWwgSSBhZGQgb25lIG9mIHRo
b3NlCj4gYWx0ZXJuYXRpdmUgaW1wbGVtZW50YXRpb25zLgoKT2suCgo+IAo+ID4gRWl0aGVyIHdh
eSwgaGF2aW5nIGEgc3BpbmxvY2sgYXJvdW5kIGEgcmVhZC93cml0ZSBBUEkgZG9lc24ndCBtYWtl
IHNlbnNlCj4gPiBiZWNhdXNlIGl0IGp1c3QgbWFrZXMgc3VyZSB0aGF0IHR3byB3cml0ZXMgZG9u
J3Qgb3ZlcmxhcCwgYnV0IG90aGVyd2lzZQo+ID4gZG9lcyBub3RoaW5nIHRvIGtlZXAgdGhpbmdz
IHN5bmNocm9uaXplZC4gRm9yIGV4YW1wbGUgYSBzZXQgdG8gdHJ1ZQo+ID4gYWZ0ZXIgYSBzZXQg
dG8gZmFsc2Ugd2hlbiB0aGUgdHdvIGNhbGxzIHRvIHNldCB0cnVlIG9yIGZhbHNlIGFyZW4ndAo+
ID4gc3luY2hyb25pemVkIG1lYW5zIHRoZXkgY2FuIGhhcHBlbiBpbiBhbnkgb3JkZXIuIFNvIEkg
ZG9uJ3Qgc2VlIGhvdyBpdAo+ID4gbmVlZHMgYSBzcGlubG9jay4gVGhlIGxvY2sgbmVlZHMgdG8g
YmUgb25lIGxldmVsIGhpZ2hlci4KPiAKPiBUaGVyZSBzaG91bGRuJ3QgYmUgYW55IGNhc2VzIHdo
ZXJlIG9uZSB0aHJlYWQgaXMgdHJ5aW5nIHRvIHNldCBpdAo+IHdoaWxlIGFub3RoZXIgaXMgdHJ5
aW5nIHRvIHVuc2V0IGl0LiBUaGUgdGhpbmcgSSBhbSB3b3JyaWVkIGFib3V0IGhlcmUKPiBpcyBt
YWtpbmcgc3VyZSBhbGwgdGhlIGNvcmVzIHNlZSB0aGUgd3JpdGUsIGFuZCBtYWtpbmcgc3VyZSBu
byByZWFkcwo+IG9yIHdyaXRlcyBnZXQgcmVvcmRlcmVkIGJlZm9yZSBpdC4gU28gSSBndWVzcyBJ
IGp1c3Qgd2FudCBhIGZlbmNlLiBTbwo+IEkgdGFrZSBpdCBJIHNob3VsZCBwcm9iYWJseSBoYXZl
IGlzIGEgV1JJVEVfT05DRSBoZXJlIGFuZCBSRUFEX09OQ0UgaW4KPiB0aGUgZ2V0dGVyPwo+IAoK
QXJlIHRoZSBnZXRzIGFuZCBzZXRzIGluIHByb2dyYW0gb3JkZXI/IElmIHNvLCBXUklURV9PTkNF
IGFuZCBSRUFEX09OQ0UKYXJlbid0IHJlcXVpcmVkLiBPdGhlcndpc2UsIGlmIGl0J3MgcG9zc2li
bGUgZm9yIG9uZSB0aHJlYWQgdG8gd3JpdGUgaXQKYW5kIGFub3RoZXIgdG8gcmVhZCBpdCBidXQg
dGhlIHRocmVhZHMgYXJlIG9yZGVyZWQgd2l0aCBzb21lIG90aGVyCmJhcnJpZXIgbGlrZSBhIGNv
bXBsZXRpb24gb3IgbG9jaywgdGhlbiBhZ2FpbiB0aGUgbWFjcm9zIGFyZW4ndCBuZWVkZWQuCkl0
IHdvdWxkIGJlIGdvb2QgdG8gcmVhZCBtZW1vcnktYmFycmllcnMudHh0IHRvIHVuZGVyc3RhbmQg
d2hlbiB0byB1c2UKdGhlIHJlYWQvd3JpdGUgbWFjcm9zLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
