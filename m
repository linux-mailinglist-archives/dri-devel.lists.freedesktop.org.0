Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0503D8A165
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 16:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273976E50E;
	Mon, 12 Aug 2019 14:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8586E02D;
 Mon, 12 Aug 2019 14:43:24 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17970900-1500050 for multiple; Mon, 12 Aug 2019 15:43:17 +0100
MIME-Version: 1.0
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <886f647b-24a6-ee24-4f50-68153fec6c53@amd.com>
References: <20190810153430.30636-1-chris@chris-wilson.co.uk>
 <20190810153430.30636-3-chris@chris-wilson.co.uk>
 <886f647b-24a6-ee24-4f50-68153fec6c53@amd.com>
Message-ID: <156562099543.2301.5895998761855095437@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 3/4] dma-fence: Refactor signaling for manual invocation
Date: Mon, 12 Aug 2019 15:43:15 +0100
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

UXVvdGluZyBLb2VuaWcsIENocmlzdGlhbiAoMjAxOS0wOC0xMiAxNTozNDozMikKPiBBbSAxMC4w
OC4xOSB1bSAxNzozNCBzY2hyaWViIENocmlzIFdpbHNvbjoKPiA+IE1vdmUgdGhlIGR1cGxpY2F0
ZWQgY29kZSB3aXRoaW4gZG1hLWZlbmNlLmMgaW50byB0aGUgaGVhZGVyIGZvciB3aWRlcgo+ID4g
cmV1c2UuIEluIHRoZSBwcm9jZXNzIGFwcGx5IGEgc21hbGwgbWljcm8tb3B0aW1pc2F0aW9uIHRv
IG9ubHkgcHJ1bmUgdGhlCj4gPiBmZW5jZS0+Y2JfbGlzdCBvbmNlIHJhdGhlciB0aGFuIHVzZSBs
aXN0X2RlbCBvbiBldmVyeSBlbnRyeS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxz
b24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiA+IENjOiBUdnJ0a28gVXJzdWxpbiA8dHZy
dGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZG1hLWJ1Zi9NYWtl
ZmlsZSAgICAgICAgICAgICAgICAgICAgfCAgMTAgKy0KPiA+ICAgZHJpdmVycy9kbWEtYnVmL2Rt
YS1mZW5jZS10cmFjZS5jICAgICAgICAgICB8ICAyOCArKysKPiA+ICAgZHJpdmVycy9kbWEtYnVm
L2RtYS1mZW5jZS5jICAgICAgICAgICAgICAgICB8ICAzMyArLS0KPiA+ICAgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3QvaW50ZWxfYnJlYWRjcnVtYnMuYyB8ICAzMiArLS0KPiA+ICAgaW5jbHVkZS9s
aW51eC9kbWEtZmVuY2UtaW1wbC5oICAgICAgICAgICAgICB8ICA4MyArKysrKysrCj4gPiAgIGlu
Y2x1ZGUvbGludXgvZG1hLWZlbmNlLXR5cGVzLmggICAgICAgICAgICAgfCAyNTggKysrKysrKysr
KysrKysrKysrKysKPiA+ICAgaW5jbHVkZS9saW51eC9kbWEtZmVuY2UuaCAgICAgICAgICAgICAg
ICAgICB8IDIyOCArLS0tLS0tLS0tLS0tLS0tLQo+IAo+IE1obSwgSSBkb24ndCByZWFsbHkgc2Vl
IHRoZSB2YWx1ZSBpbiBjcmVhdGluZyBtb3JlIGhlYWRlciBmaWxlcy4KPiAKPiBFc3BlY2lhbGx5
IEknbSBwcmV0dHkgc3VyZSB0aGF0IHRoZSB0eXBlcyBzaG91bGQgc3RheSBpbiBkbWEtZmVuY2Uu
aAoKaWlyYywgd2hlbiBJIGluY2x1ZGVkIHRoZSB0cmFjZS5oIGZyb20gZG1hLWZlbmNlLmggb3Ig
ZG1hLWZlbmNlLWltcGwuaAp3aXRob3V0IHNlcGFyYXRpbmcgdGhlIHR5cGVzLCBhbWRncHUgZmFp
bGVkIHRvIGNvbXBpbGUgKHdoaWNoIGlzIG1vcmUKdGhhbiBsaWtlbHkgdG8gYmUgc2ltcGx5IGR1
ZSB0byBiZSBmaXJzdCBkcm0gaW4gdGhlIGxpc3QgdG8gY29tcGlsZSkuCgpEb2luZyBtb3JlIHdv
cmsgd2Fzbid0IHRocm91Z2ggY2hvaWNlLgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
