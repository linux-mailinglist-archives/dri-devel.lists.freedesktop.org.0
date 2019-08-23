Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E86F9AAA0
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 10:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854526EC1E;
	Fri, 23 Aug 2019 08:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273266EC1A;
 Fri, 23 Aug 2019 08:48:17 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i15Et-0002rs-2t; Fri, 23 Aug 2019 08:48:07 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B3CE3307764;
 Fri, 23 Aug 2019 10:47:31 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id DD53F20A21FCF; Fri, 23 Aug 2019 10:48:03 +0200 (CEST)
Date: Fri, 23 Aug 2019 10:48:03 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>,
 David Rientjes <rientjes@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Wei Wang <wvw@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jann Horn <jannh@google.com>,
 Feng Tang <feng.tang@intel.com>, Kees Cook <keescook@chromium.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH 3/4] kernel.h: Add non_block_start/end()
Message-ID: <20190823084803.GD2369@hirez.programming.kicks-ass.net>
References: <20190820081902.24815-1-daniel.vetter@ffwll.ch>
 <20190820081902.24815-4-daniel.vetter@ffwll.ch>
 <20190820202440.GH11147@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820202440.GH11147@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7s9/nci+zKyvrE92H9Lp/Liq0lrM5HNKhcwL7sRJw+4=; b=P6eKagALn8nMspRlT5ktoTdyRi
 EJMa61U6Y0iSY8RaLjdPRr77ly3h6vUScMsTZrWkUBrBqE3vXFEvaoagy2NMYcOpOJHcslrk5VKn2
 2nroaMZss/Rv2u5Qaqh9AWTDRg0zOg4sqb3QW4/JUaO1luNcGy8Yt345WcvQIpkHW5/NBWKLbpfwW
 nsdaqhbiKoEyLRU4OzJeYFwB8Udi0RSzefldCm1Fhc/tVL9iYpB2NCqtJjhHL3Pi939WHS/qV1XN9
 2lCLbOBIjA9+feGg4R8SM6OQa6s8WpBgzTEydowrpjEApaqiiLp6b/5ELAhy9r3SIMP+RjfnF9XaV
 UbGf8VRQ==;
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMTA6MjQ6NDBQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIEF1ZyAyMCwgMjAxOSBhdCAxMDoxOTowMUFNICswMjAwLCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+ID4gSW4gc29tZSBzcGVjaWFsIGNhc2VzIHdlIG11c3Qgbm90IGJsb2Nr
LCBidXQgdGhlcmUncyBub3QgYQo+ID4gc3BpbmxvY2ssIHByZWVtcHQtb2ZmLCBpcnFzLW9mZiBv
ciBzaW1pbGFyIGNyaXRpY2FsIHNlY3Rpb24gYWxyZWFkeQo+ID4gdGhhdCBhcm1zIHRoZSBtaWdo
dF9zbGVlcCgpIGRlYnVnIGNoZWNrcy4gQWRkIGEgbm9uX2Jsb2NrX3N0YXJ0L2VuZCgpCj4gPiBw
YWlyIHRvIGFubm90YXRlIHRoZXNlLgo+ID4gCj4gPiBUaGlzIHdpbGwgYmUgdXNlZCBpbiB0aGUg
b29tIHBhdGhzIG9mIG1tdS1ub3RpZmllcnMsIHdoZXJlIGJsb2NraW5nIGlzCj4gPiBub3QgYWxs
b3dlZCB0byBtYWtlIHN1cmUgdGhlcmUncyBmb3J3YXJkIHByb2dyZXNzLiBRdW90aW5nIE1pY2hh
bDoKPiA+IAo+ID4gIlRoZSBub3RpZmllciBpcyBjYWxsZWQgZnJvbSBxdWl0ZSBhIHJlc3RyaWN0
ZWQgY29udGV4dCAtIG9vbV9yZWFwZXIgLQo+ID4gd2hpY2ggc2hvdWxkbid0IGRlcGVuZCBvbiBh
bnkgbG9ja3Mgb3Igc2xlZXBhYmxlIGNvbmRpdGlvbmFscy4gVGhlIGNvZGUKPiA+IHNob3VsZCBi
ZSBzd2lmdCBhcyB3ZWxsIGJ1dCB3ZSBtb3N0bHkgZG8gY2FyZSBhYm91dCBpdCB0byBtYWtlIGEg
Zm9yd2FyZAo+ID4gcHJvZ3Jlc3MuIENoZWNraW5nIGZvciBzbGVlcGFibGUgY29udGV4dCBpcyB0
aGUgYmVzdCB0aGluZyB3ZSBjb3VsZCBjb21lCj4gPiB1cCB3aXRoIHRoYXQgd291bGQgZGVzY3Jp
YmUgdGhlc2UgZGVtYW5kcyBhdCBsZWFzdCBwYXJ0aWFsbHkuIgo+ID4gCj4gPiBQZXRlciBhbHNv
IGFza2VkIHdoZXRoZXIgd2Ugd2FudCB0byBjYXRjaCBzcGlubG9ja3Mgb24gdG9wLCBidXQgTWlj
aGFsCj4gPiBzYWlkIHRob3NlIGFyZSBsZXNzIG9mIGEgcHJvYmxlbSBiZWNhdXNlIHNwaW5sb2Nr
cyBjYW4ndCBoYXZlIGFuCj4gPiBpbmRpcmVjdCBkZXBlbmRlbmN5IHVwb24gdGhlIHBhZ2UgYWxs
b2NhdG9yIGFuZCBoZW5jZSBjbG9zZSB0aGUgbG9vcAo+ID4gd2l0aCB0aGUgb29tIHJlYXBlci4K
PiA+IAo+ID4gU3VnZ2VzdGVkIGJ5IE1pY2hhbCBIb2Nrby4KPiA+IAo+ID4gdjI6Cj4gPiAtIElt
cHJvdmUgY29tbWl0IG1lc3NhZ2UgKE1pY2hhbCkKPiA+IC0gQWxzbyBjaGVjayBpbiBzY2hlZHVs
ZSwgbm90IGp1c3QgbWlnaHRfc2xlZXAgKFBldGVyKQo+ID4gCj4gPiB2MzogSXQgd29ya3MgYmV0
dGVyIHdoZW4gSSBhY3R1YWxseSBzcXVhc2ggaW4gdGhlIGZpeHVwIEkgaGFkIGx5aW5nCj4gPiBh
cm91bmQgOi0vCj4gPiAKPiA+IHY0OiBQaWNrIHRoZSBzdWdnZXN0aW9uIGZyb20gQW5kcmV3IE1v
cnRvbiB0byBnaXZlIG5vbl9ibG9ja19zdGFydC9lbmQKPiA+IHNvbWUgZ29vZCBrZXJuZWxkb2Mg
Y29tbWVudHMuIEkgYWRkZWQgdGhhdCBvdGhlciBibG9ja2luZyBjYWxscyBsaWtlCj4gPiB3YWl0
X2V2ZW50IHBvc2Ugc2ltaWxhciBpc3N1ZXMsIHNpbmNlIHRoYXQncyB0aGUgb3RoZXIgZXhhbXBs
ZSB3ZQo+ID4gZGlzY3Vzc2VkLgo+ID4gCj4gPiBDYzogSmFzb24gR3VudGhvcnBlIDxqZ2dAemll
cGUuY2E+Cj4gPiBDYzogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgo+ID4g
Q2M6IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPgo+ID4gQ2M6IEFuZHJldyBNb3J0b24g
PGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gPiBDYzogTWljaGFsIEhvY2tvIDxtaG9ja29A
c3VzZS5jb20+Cj4gPiBDYzogRGF2aWQgUmllbnRqZXMgPHJpZW50amVzQGdvb2dsZS5jb20+Cj4g
PiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gPiBD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiA+IENjOiAiSsOpcsO0
bWUgR2xpc3NlIiA8amdsaXNzZUByZWRoYXQuY29tPgo+ID4gQ2M6IGxpbnV4LW1tQGt2YWNrLm9y
Zwo+ID4gQ2M6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+
Cj4gPiBDYzogV2VpIFdhbmcgPHd2d0Bnb29nbGUuY29tPgo+ID4gQ2M6IEFuZHkgU2hldmNoZW5r
byA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPgo+ID4gQ2M6IFRob21hcyBHbGVp
eG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+ID4gQ2M6IEphbm4gSG9ybiA8amFubmhAZ29vZ2xl
LmNvbT4KPiA+IENjOiBGZW5nIFRhbmcgPGZlbmcudGFuZ0BpbnRlbC5jb20+Cj4gPiBDYzogS2Vl
cyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+Cj4gPiBDYzogUmFuZHkgRHVubGFwIDxyZHVu
bGFwQGluZnJhZGVhZC5vcmc+Cj4gPiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+
ID4gQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4g
KHYxKQo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRl
bC5jb20+Cj4gCj4gSGkgUGV0ZXIsCj4gCj4gSWlyYyB5b3UndmUgYmVlbiBpbnZvbHZlZCBhdCBs
ZWFzdCBzb21ld2hhdCBpbiBkaXNjdXNzaW5nIHRoaXMuIC1tbSBmb2xrcwo+IGFyZSBhIGJpdCB1
bmRlY2lkZWQgd2hldGhlciB0aGVzZSBuZXcgbm9uX2Jsb2NrIHNlbWFudGljcyBhcmUgYSBnb29k
IGlkZWEuCj4gTWljaGFsIEhvY2tvIHN0aWxsIGlzIGluIHN1cHBvcnQsIGJ1dCBBbmRyZXcgTW9y
dG9uIGFuZCBKYXNvbiBHdW50aG9ycGUKPiBhcmUgbGVzcyBlbnRodXNpYXN0aWMuIEphc29uIHNh
aWQgaGUncyBvayB3aXRoIG1lcmdpbmcgdGhlIGhtbSBzaWRlIG9mCj4gdGhpcyBpZiBzY2hlZHVs
ZXIgZm9sa3MgYWNrLiBJZiBub3QsIHRoZW4gSSdsbCByZXNwaW4gd2l0aCB0aGUKPiBwcmVlbXB0
X2Rpc2FibGUvZW5hYmxlIGluc3RlYWQgbGlrZSBpbiB2MS4KPiAKPiBTbyBhY2svbmFjayBmb3Ig
dGhpcyBmcm9tIHRoZSBzY2hlZHVsZXIgc2lkZT8KClJpZ2h0LCBJIGhhZCBtZW1vcmllcyBvZiBz
ZWVpbmcgdGhpcyBiZWZvcmUsIGFuZCBJIGp1c3QgZm91bmQgYSBmYWlybHkKbG9uZyBkaXNjdXNz
aW9uIG9uIHRoaXMgZWxzZXdoZXJlIGluIHRoZSB2YWNhdGlvbiBpbmJveCAoKmdyb2FuKikuCgpZ
ZWFoLCB0aGlzIGlzIHNvbWV0aGluZyBJIGNhbiBsaXZlIHdpdGgsCgpBY2tlZC1ieTogUGV0ZXIg
WmlqbHN0cmEgKEludGVsKSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
