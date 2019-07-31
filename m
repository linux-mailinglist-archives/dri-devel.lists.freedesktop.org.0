Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 509187EEC0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8296ECF6;
	Fri,  2 Aug 2019 08:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4567489B0C
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 09:23:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6BBE337;
 Wed, 31 Jul 2019 02:22:59 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C82033F71F;
 Wed, 31 Jul 2019 02:22:58 -0700 (PDT)
Subject: Re: [PATCH v2 6/7] drm/panfrost: Add support for GPU heap allocations
To: Rob Herring <robh@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <20190725011003.30837-1-robh@kernel.org>
 <20190725011003.30837-7-robh@kernel.org>
 <ab9c3277-9e34-2712-975b-7c59b64e52d0@arm.com>
 <9eaf879c-bd7b-aded-e8f6-8efc2394fef5@arm.com> <20190725161344.GA2950@kevin>
 <482dc837-3ca8-dd93-bbc6-0eb97f3627e7@arm.com> <20190725174006.GA2876@kevin>
 <1c54bd6c-a594-614d-7de0-badb00269ea1@arm.com>
 <CAL_JsqLepsMdvJbi_=3xxgVH-Hasu_6=MK6NnXK0CdM7YPwubg@mail.gmail.com>
 <20190730185455.GA3205@kevin>
 <CAL_JsqKVr6Wr7ufxKQHG0pGaUm3nWryDB1iB-qbzTbFEg1EPeQ@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <068e6d09-d988-c64f-010d-1724de7de33b@arm.com>
Date: Wed, 31 Jul 2019 10:22:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKVr6Wr7ufxKQHG0pGaUm3nWryDB1iB-qbzTbFEg1EPeQ@mail.gmail.com>
Content-Language: en-GB
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <Robin.Murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMzAvMDcvMjAxOSAyMDowOCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gVHVlLCBKdWwgMzAs
IDIwMTkgYXQgMTI6NTUgUE0gQWx5c3NhIFJvc2VuendlaWcKPiA8YWx5c3NhLnJvc2VuendlaWdA
Y29sbGFib3JhLmNvbT4gd3JvdGU6Cj4+Cj4+PiBJbiBhbnkgY2FzZSwgcGVyIHByb2Nlc3MgQVMg
aXMgYSBwcmVyZXF1aXNpdGUgdG8gYWxsIHRoaXMuCj4+Cj4+IE9oLCBJIGhhZG4ndCByZWFsaXpl
ZCB0aGF0IHdhcyBzdGlsbCBhIHRvZG8uIEluIHRoZSBtZWFudGltZSwgd2hhdCdzIHRoZQo+PiBp
bXBsaWNhdGlvbiBvZiBzaGlwcGluZyB3aXRob3V0IGl0PyAoSS5lLiBpbiB3aGljaCB0aHJlYXQg
bW9kZWwgYXJlCj4+IHVzZXJzIHZ1bG5lcmFibGUgd2l0aG91dCBpdD8pIE1hbGljaW91cyB1c2Vy
c3BhY2UgcHJvY2VzcyBzbm9vcGluZyBvbgo+PiBvdGhlciBmcmFtZWJ1ZmZlcnMgKG9uIFgxMSwg
dGhleSBjb3VsZCBkbyB0aGF0IGFueXdheS4uLik/IE1hbGljaW91cwo+PiB1c2Vyc3BhY2UgYWN0
dWFsbHkgaW50ZXJmZXJpbmcgd2l0aCBvcGVyYXRpb24gb2Ygb3RoZXIgcHJvY2Vzc2VzIChpcwo+
PiB0aGlzIHJlYWxseSBleHBsb2l0YWJsZSBvciBqdXN0IGEgdGhlb3JldGljYWwgY29uY2Vybik/
IE1hbGljaW91cyAzRAo+PiBhcHBzIGJyZWFraW5nIG91dCBvZiB0aGUgc2FuZGJveCAoaS5lLiBX
ZWJHTCkgdmlhIGEgZHJpdmVyIGJ1ZyBhbmQKPj4gc25vb3Bpbmcgb24gb3RoZXIgcHJvY2Vzc2Vz
PwoKSGF2aW5nIGEgc2luZ2xlIGFkZHJlc3Mgc3BhY2UgbWVhbnM6CgpNYWxpY2lvdXMgdXNlcnNw
YWNlIGNhbjogc25vb3AgYW5kIG92ZXJ3cml0ZSBncmFwaGljcyBidWZmZXJzIGZyb20gb3RoZXIK
YXBwbGljYXRpb25zLiBJIGRvbid0IGJlbGlldmUgeW91IGNhbiBkaXJlY3RseSBtYXAgdGhlIGJ1
ZmZlciBpbnRvIHRoZQpvdGhlciBhcHBsaWNhdGlvbiwgYnV0IHRoZSBHUFUgcHJvdmlkZXMgcGxl
bnR5IG9mIGZ1bmN0aW9uYWxpdHkgdG8KaW1wbGVtZW50IGEgbWVtY3B5LWxpa2Ugc2hhZGVyIHdo
aWNoIGNhbiBjb3B5IHRvL2Zyb20gYnVmZmVycyB5b3UgZG9uJ3Qgb3duLgoKV2ViR0w6IEluICp0
aGVvcnkqIHRoZSBkcml2ZXIgc2hvdWxkIGVuc3VyZSB0aGF0IGFueSBidWZmZXIgYWNjZXNzZXMg
YXJlCmNvbnRhaW5lZCBiZWZvcmUgbGV0dGluZyB0aGUgc2hhZGVycyBydW4uIFNvIHRoaXMgc2hv
dWxkbid0IGFjdHVhbGx5CmFsbG93IGJyZWFraW5nIG91dCBvZiB0aGUgc2FuZGJveC4gVGhpcyBp
cyBiZWNhdXNlIHRoZSBicm93c2VyIG1heSB1c2UKb25lIHByb2Nlc3MgZm9yIG11bHRpcGxlIHRh
YnMgKGFuZCBvbmUgcHJvY2VzcyA9IG9uZSBBUyBpbiBtb3N0IGNhc2VzKQphbmQgdGhleSBzaG91
bGQgYmUgc2FuZGJveGVkLiBCdXQgb2J2aW91c2x5IGl0IG9ubHkgcmVxdWlyZXMgb25lIGRyaXZl
cgpidWcgZm9yIHRoaXMgdG8gYnJlYWsgYXMgd2VsbC4KCgpBbHNvIG5vdGUgdGhhdCBpZiB0aGUg
ZHJpdmVyICJ0cnVzdHMiIGFueSBvZiB0aGUgZGF0YSBzaGFyZWQgd2l0aCB0aGUKR1BVIChlLmcu
IGZvbGxvd3MgcG9pbnRlcnMgc3RvcmVkIGluIEdQVSBhY2Nlc3NpYmxlIG1lbW9yeSBvciB1c2Vz
CnZhbHVlcyB0byBsb29rIHVwIGluIGFuIGFycmF5IHdpdGhvdXQgYm91bmRzIGNoZWNraW5nKSB0
aGVuIGEgbWFsaWNpb3VzCnVzZXJzcGFjZSBtYXkgYmUgYWJsZSB0byBpbmplY3QgY29kZSBpbnRv
IGFub3RoZXIgcHJvY2Vzcy4gU28gdGhpcyBjb3VsZApiZSBhIHByaXZpbGVnZSBlc2NhbGF0aW9u
IHJvdXRlLgoKPiBJIGRvbid0IGtub3cuIEhvd2V2ZXIsIGl0J3Mgbm90IHRoYXQgdW5jb21tb24u
IGZyZWVkcmVubyBpcyBvbmx5IG5vdwo+IGluIHRoZSBwcm9jZXNzIG9mIHN1cHBvcnRpbmcgaXQu
IHZjNCBjYW4ndC4gdjNkIGRvZXNuJ3QgeWV0IHN1cHBvcnQKPiBzZXBhcmF0ZSBhZGRyZXNzIHNw
YWNlcy4KCkluZGVlZCBpdCBkb2Vzbid0IHNlZW0gdG8gYWN0dWFsbHkgY29uY2VybiBtYW55IHBl
b3BsZS4gRm9yIGV4YW1wbGUKYWxtb3N0IGFsbCBHUFVzIGFsbG93IGFueSBwcm9jZXNzIHRvIGVm
ZmVjdGl2ZWx5IERvUyB0aGUgR1BVIGJ5CnN1Ym1pdHRpbmcgZXh0cmVtZWx5IGxvbmcgcnVubmlu
ZyBqb2JzLiBNb3N0IE9TZXMganVzdCByZXNldCB0aGUgR1BVIGluCnRoaXMgY2FzZSAtIHdoaWNo
IG1pZ2h0IHRha2Ugd29yayBmcm9tIGFub3RoZXIgcHJvY2VzcyB3aXRoIGl0LiBBbHRob3VnaApr
YmFzZSBhY3R1YWxseSBkb2VzIHRyeSBmYWlybHkgaGFyZCB0byBwcmV2ZW50IHRoYXQuCgpBbHRo
b3VnaCBzb21ld2hhdCBhbXVzaW5nbHksIHlvdSBtaWdodCBoYXZlIG5vdGljZWQgdGhpcyBsb3Zl
bHkKd29ya2Fyb3VuZCBpbiBrYmFzZToKCj4gCWlmIChrYmFzZV9od19oYXNfaXNzdWUoa2JkZXYs
IEJBU0VfSFdfSVNTVUVfODk4NykpIHsKPiAJCWJvb2wgdXNlX3dvcmthcm91bmQ7Cj4gCj4gCQl1
c2Vfd29ya2Fyb3VuZCA9IERFRkFVTFRfU0VDVVJFX0JVVF9MT1NTX09GX1BFUkZPUk1BTkNFOwo+
IAkJaWYgKHVzZV93b3JrYXJvdW5kKSB7Cj4gCQkJZGV2X2RiZyhrYmRldi0+ZGV2LCAiR1BVIGhh
cyBIVyBJU1NVRSA4OTg3LCBhbmQgZHJpdmVyIGNvbmZpZ3VyZWQgZm9yIHNlY3VyaXR5IHdvcmth
cm91bmQ6IDEgYWRkcmVzcyBzcGFjZSBvbmx5Iik7Cj4gCQkJa2JkZXYtPm5yX3VzZXJfYWRkcmVz
c19zcGFjZXMgPSAxOwo+IAkJfQo+IAl9CgpJIHNlcmlvdXNseSBkb3VidCBhbnlvbmUgZXZlciBz
ZXQKREVGQVVMVF9TRUNVUkVfQlVUX0xPU1NfT0ZfUEVSRk9STUFOQ0UuLi4gQnV0IHRoaXMgd2Fz
IGEgaGFyZHdhcmUgYnVnCnRoYXQgYnJva2UgdGhlIGlzb2xhdGlvbiBiZXR3ZWVuIGFkZHJlc3Mg
c3BhY2VzLgoKU3RldmUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
