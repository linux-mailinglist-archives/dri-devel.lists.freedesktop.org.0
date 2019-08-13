Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ED38B250
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 10:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778426E0A1;
	Tue, 13 Aug 2019 08:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B4F6E0A1;
 Tue, 13 Aug 2019 08:25:37 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17979392-1500050 for multiple; Tue, 13 Aug 2019 09:25:30 +0100
MIME-Version: 1.0
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <091b5d17-241e-53a8-17e0-b61b30720bbb@amd.com>
References: <20190810153430.30636-1-chris@chris-wilson.co.uk>
 <20190810153430.30636-3-chris@chris-wilson.co.uk>
 <886f647b-24a6-ee24-4f50-68153fec6c53@amd.com>
 <156562099543.2301.5895998761855095437@skylake-alporthouse-com>
 <40961588-a377-9c92-379f-e24e3b711ce7@amd.com>
 <156562159336.2301.12364265101196283146@skylake-alporthouse-com>
 <091b5d17-241e-53a8-17e0-b61b30720bbb@amd.com>
Message-ID: <156568472775.2301.10010424738623757564@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 3/4] dma-fence: Refactor signaling for manual invocation
Date: Tue, 13 Aug 2019 09:25:27 +0100
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBLb2VuaWcsIENocmlzdGlhbiAoMjAxOS0wOC0xMyAwNzo1OToyOCkKPiBBbSAxMi4w
OC4xOSB1bSAxNjo1MyBzY2hyaWViIENocmlzIFdpbHNvbjoKPiA+IFF1b3RpbmcgS29lbmlnLCBD
aHJpc3RpYW4gKDIwMTktMDgtMTIgMTU6NTA6NTkpCj4gPj4gQW0gMTIuMDguMTkgdW0gMTY6NDMg
c2NocmllYiBDaHJpcyBXaWxzb246Cj4gPj4+IFF1b3RpbmcgS29lbmlnLCBDaHJpc3RpYW4gKDIw
MTktMDgtMTIgMTU6MzQ6MzIpCj4gPj4+PiBBbSAxMC4wOC4xOSB1bSAxNzozNCBzY2hyaWViIENo
cmlzIFdpbHNvbjoKPiA+Pj4+PiBNb3ZlIHRoZSBkdXBsaWNhdGVkIGNvZGUgd2l0aGluIGRtYS1m
ZW5jZS5jIGludG8gdGhlIGhlYWRlciBmb3Igd2lkZXIKPiA+Pj4+PiByZXVzZS4gSW4gdGhlIHBy
b2Nlc3MgYXBwbHkgYSBzbWFsbCBtaWNyby1vcHRpbWlzYXRpb24gdG8gb25seSBwcnVuZSB0aGUK
PiA+Pj4+PiBmZW5jZS0+Y2JfbGlzdCBvbmNlIHJhdGhlciB0aGFuIHVzZSBsaXN0X2RlbCBvbiBl
dmVyeSBlbnRyeS4KPiA+Pj4+Pgo+ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8
Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+ID4+Pj4+IENjOiBUdnJ0a28gVXJzdWxpbiA8dHZy
dGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+ID4+Pj4+IC0tLQo+ID4+Pj4+ICAgICBkcml2ZXJzL2Rt
YS1idWYvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgIDEwICstCj4gPj4+Pj4gICAgIGRy
aXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtdHJhY2UuYyAgICAgICAgICAgfCAgMjggKysrCj4gPj4+
Pj4gICAgIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYyAgICAgICAgICAgICAgICAgfCAgMzMg
Ky0tCj4gPj4+Pj4gICAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2JyZWFkY3J1bWJz
LmMgfCAgMzIgKy0tCj4gPj4+Pj4gICAgIGluY2x1ZGUvbGludXgvZG1hLWZlbmNlLWltcGwuaCAg
ICAgICAgICAgICAgfCAgODMgKysrKysrKwo+ID4+Pj4+ICAgICBpbmNsdWRlL2xpbnV4L2RtYS1m
ZW5jZS10eXBlcy5oICAgICAgICAgICAgIHwgMjU4ICsrKysrKysrKysrKysrKysrKysrCj4gPj4+
Pj4gICAgIGluY2x1ZGUvbGludXgvZG1hLWZlbmNlLmggICAgICAgICAgICAgICAgICAgfCAyMjgg
Ky0tLS0tLS0tLS0tLS0tLS0KPiA+Pj4+IE1obSwgSSBkb24ndCByZWFsbHkgc2VlIHRoZSB2YWx1
ZSBpbiBjcmVhdGluZyBtb3JlIGhlYWRlciBmaWxlcy4KPiA+Pj4+Cj4gPj4+PiBFc3BlY2lhbGx5
IEknbSBwcmV0dHkgc3VyZSB0aGF0IHRoZSB0eXBlcyBzaG91bGQgc3RheSBpbiBkbWEtZmVuY2Uu
aAo+ID4+PiBpaXJjLCB3aGVuIEkgaW5jbHVkZWQgdGhlIHRyYWNlLmggZnJvbSBkbWEtZmVuY2Uu
aCBvciBkbWEtZmVuY2UtaW1wbC5oCj4gPj4+IHdpdGhvdXQgc2VwYXJhdGluZyB0aGUgdHlwZXMs
IGFtZGdwdSBmYWlsZWQgdG8gY29tcGlsZSAod2hpY2ggaXMgbW9yZQo+ID4+PiB0aGFuIGxpa2Vs
eSB0byBiZSBzaW1wbHkgZHVlIHRvIGJlIGZpcnN0IGRybSBpbiB0aGUgbGlzdCB0byBjb21waWxl
KS4KPiA+PiBBaCwgYnV0IHdoeSBkbyB5b3Ugd2FudCB0byBpbmNsdWRlIHRyYWNlLmggaW4gYSBo
ZWFkZXIgaW4gdGhlIGZpcnN0IHBsYWNlPwo+ID4+Cj4gPj4gVGhhdCdzIHVzdWFsbHkgbm90IHNv
bWV0aGluZyBJIHdvdWxkIHJlY29tbWVuZCBlaXRoZXIuCj4gPiBUaGUgcHJvYmxlbSBpcyB0aGF0
IHdlIGRvIGVtaXQgYSB0cmFjZXBvaW50IGFzIHBhcnQgb2YgdGhlIHNlcXVlbmNlIEkKPiA+IHdh
bnQgdG8gcHV0IGludG8gdGhlIHJldXNhYmxlIGNodW5rIG9mIGNvZGUuCj4gCj4gT2ssIHdlIGFy
ZSBnb2luZyBpbiBjaXJjbGVzIGhlcmUuIFdoeSBkbyB5b3Ugd2FudCB0byByZXVzZSB0aGUgY29k
ZSB0aGVuPwoKSSBhbSByZXVzaW5nIHRoZSBjb2RlIHRvIGF2b2lkIGZ1biBhbmQgZ2FtZXMgd2l0
aCBzaWduYWwtdnMtZnJlZS4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
