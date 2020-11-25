Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B41CF2C48A9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 20:44:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62B66E901;
	Wed, 25 Nov 2020 19:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F676E901;
 Wed, 25 Nov 2020 19:44:43 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23107975-1500050 for multiple; Wed, 25 Nov 2020 19:44:23 +0000
MIME-Version: 1.0
In-Reply-To: <20201030144346.GJ6112@intel.com>
References: <20201022194256.30978-1-ville.syrjala@linux.intel.com>
 <160406758530.15070.9622609556730885347@build.alporthouse.com>
 <20201030144346.GJ6112@intel.com>
Subject: Re: [PATCH] drm/modes: Switch to 64bit maths to avoid integer overflow
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date: Wed, 25 Nov 2020 19:44:23 +0000
Message-ID: <160633346339.26272.10139293716347662274@build.alporthouse.com>
User-Agent: alot/0.9
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: intel-gfx@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBWaWxsZSBTeXJqw6Rsw6QgKDIwMjAtMTAtMzAgMTQ6NDM6NDYpCj4gT24gRnJpLCBP
Y3QgMzAsIDIwMjAgYXQgMDI6MTk6NDVQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4g
UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDIwLTEwLTIyIDIwOjQyOjU2KQo+ID4gPiBGcm9tOiBW
aWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+ID4gPiAKPiA+
ID4gVGhlIG5ldyA+OGsgQ0VBIG1vZGVzIGhhdmUgZG90Y2xvY2tzIHJlYWNoaW5nIDUuOTQgR0h6
LCB3aGljaAo+ID4gPiBtZWFucyBvdXIgY2xvY2sqMTAwMCB3aWxsIG5vdyBvdmVyZmxvdyB0aGUg
MzJiaXQgdW5zaWduZWQKPiA+ID4gaW50ZWdlci4gU3dpdGNoIHRvIDY0Yml0IG1hdGhzIHRvIGF2
b2lkIGl0Lgo+ID4gPiAKPiA+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiA+ID4gUmVw
b3J0ZWQtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29t
Pgo+ID4gPiAtLS0KPiA+ID4gQW4gaW50ZXJlc3RpbmcgcXVlc3Rpb24gaG93IG1hbnkgb3RoZXIg
cGxhY2UgbWlnaHQgc3VmZmVyIGZyb20gc2ltaWxhcgo+ID4gPiBvdmVyZmxvd3MuIEkgdGhpbmsg
aTkxNSBzaG91bGQgYmUgbW9zdGx5IE9LLiBUaGUgb25lIHBsYWNlIEkga25vdyB3ZSB1c2UKPiA+
ID4gSHogaW5zdGVhZCBrSHogaXMgdGhlIGhzdyBEUExMIGNvZGUsIHdoaWNoIEkgd291bGQgcHJl
ZmVyIHdlIGFsc28gY2hhbmdlCj4gPiA+IHRvIHVzZSBrSHouIFRoZSBvdGhlciBjb25jZXJuIGlz
IHdoZXRoZXIgd2UgaGF2ZSBhbnkgcG90ZW50aWFsIG92ZXJmbG93cwo+ID4gPiBiZWZvcmUgd2Ug
Y2hlY2sgdGhpcyBhZ2FpbnN0IHRoZSBwbGF0Zm9ybSdzIG1heCBkb3RjbG9jay4KPiA+ID4gCj4g
PiA+IEkgZG8gaGF2ZSB0aGlzIHVucmV2aWV3ZWQgaWd0IHNlcmllcyAKPiA+ID4gaHR0cHM6Ly9w
YXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82OTUzMS8gd2hpY2ggZXh0ZW5kcyB0aGUK
PiA+ID4gY3VycmVudCB0ZXN0aW5nIHdpdGggc29tZSBvdGhlciBmb3JtcyBvZiBpbnZhbGlkIG1v
ZGVzLiBDb3VsZCBwcm9iYWJseQo+ID4gPiBleHRlbmQgdGhhdCB3aXRoIGEgbW9kZS5jbG9jaz1J
TlRfTUFYIHRlc3QgdG8gc2VlIGlmIGFueXRoaW5nIGVsc2UgbWlnaHQKPiA+ID4gdHJpcCB1cC4K
PiA+ID4gCj4gPiA+IE5vIGlkZWEgYWJvdXQgb3RoZXIgZHJpdmVycy4KPiA+ID4gCj4gPiA+ICBk
cml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgfCA0ICsrLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rl
cy5jCj4gPiA+IGluZGV4IDUwMWI0ZmU1NWEzZC4uNTExY2RlNWM3ZmE2IDEwMDY0NAo+ID4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9tb2Rlcy5jCj4gPiA+IEBAIC03NjIsNyArNzYyLDcgQEAgaW50IGRybV9tb2RlX3Zy
ZWZyZXNoKGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKQo+ID4gPiAgICAgICAg
IGlmIChtb2RlLT5odG90YWwgPT0gMCB8fCBtb2RlLT52dG90YWwgPT0gMCkKPiA+ID4gICAgICAg
ICAgICAgICAgIHJldHVybiAwOwo+ID4gPiAgCj4gPiA+IC0gICAgICAgbnVtID0gbW9kZS0+Y2xv
Y2sgKiAxMDAwOwo+ID4gPiArICAgICAgIG51bSA9IG1vZGUtPmNsb2NrOwo+ID4gPiAgICAgICAg
IGRlbiA9IG1vZGUtPmh0b3RhbCAqIG1vZGUtPnZ0b3RhbDsKPiA+IAo+ID4gWW91IGRvbid0IHdh
bnQgdG8gcHJvbW90ZSBkZW4gdG8gdTY0IHdoaWxlIHlvdSBhcmUgaGVyZT8gV2UgYXJlIGF0Cj4g
PiA4a3g0aywgdGhyb3cgaW4gZGJsc2NhbiBhbmQgc29tZSB2c2NhbiwgYW5kIHdlIGNvdWxkIHNv
b24gaGF2ZSB3YWNreQo+ID4gcmVmcmVzaCByYXRlcy4KPiAKPiBpOTE1IGhhcyAxNmt4OGsgaGFy
ZCBsaW1pdCBjdXJyZW50bHksIGFuZCB3ZSByZWplY3QgdnNjYW4+MQo+ICh3aXNoIHdlIGNvdWxk
IGFsc28gcmVqZWN0IERCTFNDQU4pLiBTbyB3ZSBzaG91bGQgbm90IGhpdAo+IHRoYXQsIGF0IGxl
YXN0IG5vdCB5ZXQuIE90aGVyIGRyaXZlcnMgbWlnaHQgbm90IGJlIHNvIHN0cmljdAo+IEkgZ3Vl
c3MuCj4gCj4gSSBoYXZlIGEgbmFnZ2luZyBmZWVsaW5nIHRoYXQgb3RoZXIgcGxhY2VzIGFyZSBp
biBkYW5nZXIgb2YKPiBvdmVyZmxvd3MgaWYgd2UgdHJ5IHRvIHB1c2ggdGhlIGN1cnJlbnQgbGlt
aXRzIHNpZ25pZmljYW50bHkuCj4gQnV0IEkgZ3Vlc3Mgbm8gcmVhbCBoYXJtIGluIGdvaW5nIGZ1
bGwgNjRiaXQgaGVyZSwgZXhjZXB0Cj4gbWF5YmUgbWFraW5nIGl0IGEgYml0IHNsb3dlci4KClJl
dmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLUNocmlz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
