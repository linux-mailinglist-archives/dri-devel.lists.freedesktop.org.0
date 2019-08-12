Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B9C8A191
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 16:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1696B6E554;
	Mon, 12 Aug 2019 14:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D306E554;
 Mon, 12 Aug 2019 14:53:19 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17971039-1500050 for multiple; Mon, 12 Aug 2019 15:53:15 +0100
MIME-Version: 1.0
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <40961588-a377-9c92-379f-e24e3b711ce7@amd.com>
References: <20190810153430.30636-1-chris@chris-wilson.co.uk>
 <20190810153430.30636-3-chris@chris-wilson.co.uk>
 <886f647b-24a6-ee24-4f50-68153fec6c53@amd.com>
 <156562099543.2301.5895998761855095437@skylake-alporthouse-com>
 <40961588-a377-9c92-379f-e24e3b711ce7@amd.com>
Message-ID: <156562159336.2301.12364265101196283146@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 3/4] dma-fence: Refactor signaling for manual invocation
Date: Mon, 12 Aug 2019 15:53:13 +0100
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

UXVvdGluZyBLb2VuaWcsIENocmlzdGlhbiAoMjAxOS0wOC0xMiAxNTo1MDo1OSkKPiBBbSAxMi4w
OC4xOSB1bSAxNjo0MyBzY2hyaWViIENocmlzIFdpbHNvbjoKPiA+IFF1b3RpbmcgS29lbmlnLCBD
aHJpc3RpYW4gKDIwMTktMDgtMTIgMTU6MzQ6MzIpCj4gPj4gQW0gMTAuMDguMTkgdW0gMTc6MzQg
c2NocmllYiBDaHJpcyBXaWxzb246Cj4gPj4+IE1vdmUgdGhlIGR1cGxpY2F0ZWQgY29kZSB3aXRo
aW4gZG1hLWZlbmNlLmMgaW50byB0aGUgaGVhZGVyIGZvciB3aWRlcgo+ID4+PiByZXVzZS4gSW4g
dGhlIHByb2Nlc3MgYXBwbHkgYSBzbWFsbCBtaWNyby1vcHRpbWlzYXRpb24gdG8gb25seSBwcnVu
ZSB0aGUKPiA+Pj4gZmVuY2UtPmNiX2xpc3Qgb25jZSByYXRoZXIgdGhhbiB1c2UgbGlzdF9kZWwg
b24gZXZlcnkgZW50cnkuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8
Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+ID4+PiBDYzogVHZydGtvIFVyc3VsaW4gPHR2cnRr
by51cnN1bGluQGludGVsLmNvbT4KPiA+Pj4gLS0tCj4gPj4+ICAgIGRyaXZlcnMvZG1hLWJ1Zi9N
YWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAgMTAgKy0KPiA+Pj4gICAgZHJpdmVycy9kbWEt
YnVmL2RtYS1mZW5jZS10cmFjZS5jICAgICAgICAgICB8ICAyOCArKysKPiA+Pj4gICAgZHJpdmVy
cy9kbWEtYnVmL2RtYS1mZW5jZS5jICAgICAgICAgICAgICAgICB8ICAzMyArLS0KPiA+Pj4gICAg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfYnJlYWRjcnVtYnMuYyB8ICAzMiArLS0KPiA+
Pj4gICAgaW5jbHVkZS9saW51eC9kbWEtZmVuY2UtaW1wbC5oICAgICAgICAgICAgICB8ICA4MyAr
KysrKysrCj4gPj4+ICAgIGluY2x1ZGUvbGludXgvZG1hLWZlbmNlLXR5cGVzLmggICAgICAgICAg
ICAgfCAyNTggKysrKysrKysrKysrKysrKysrKysKPiA+Pj4gICAgaW5jbHVkZS9saW51eC9kbWEt
ZmVuY2UuaCAgICAgICAgICAgICAgICAgICB8IDIyOCArLS0tLS0tLS0tLS0tLS0tLQo+ID4+IE1o
bSwgSSBkb24ndCByZWFsbHkgc2VlIHRoZSB2YWx1ZSBpbiBjcmVhdGluZyBtb3JlIGhlYWRlciBm
aWxlcy4KPiA+Pgo+ID4+IEVzcGVjaWFsbHkgSSdtIHByZXR0eSBzdXJlIHRoYXQgdGhlIHR5cGVz
IHNob3VsZCBzdGF5IGluIGRtYS1mZW5jZS5oCj4gPiBpaXJjLCB3aGVuIEkgaW5jbHVkZWQgdGhl
IHRyYWNlLmggZnJvbSBkbWEtZmVuY2UuaCBvciBkbWEtZmVuY2UtaW1wbC5oCj4gPiB3aXRob3V0
IHNlcGFyYXRpbmcgdGhlIHR5cGVzLCBhbWRncHUgZmFpbGVkIHRvIGNvbXBpbGUgKHdoaWNoIGlz
IG1vcmUKPiA+IHRoYW4gbGlrZWx5IHRvIGJlIHNpbXBseSBkdWUgdG8gYmUgZmlyc3QgZHJtIGlu
IHRoZSBsaXN0IHRvIGNvbXBpbGUpLgo+IAo+IEFoLCBidXQgd2h5IGRvIHlvdSB3YW50IHRvIGlu
Y2x1ZGUgdHJhY2UuaCBpbiBhIGhlYWRlciBpbiB0aGUgZmlyc3QgcGxhY2U/Cj4gCj4gVGhhdCdz
IHVzdWFsbHkgbm90IHNvbWV0aGluZyBJIHdvdWxkIHJlY29tbWVuZCBlaXRoZXIuCgpUaGUgcHJv
YmxlbSBpcyB0aGF0IHdlIGRvIGVtaXQgYSB0cmFjZXBvaW50IGFzIHBhcnQgb2YgdGhlIHNlcXVl
bmNlIEkKd2FudCB0byBwdXQgaW50byB0aGUgcmV1c2FibGUgY2h1bmsgb2YgY29kZS4KLUNocmlz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
