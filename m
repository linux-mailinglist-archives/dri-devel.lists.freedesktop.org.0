Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFB676276
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B1A6ECCA;
	Fri, 26 Jul 2019 09:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4BF5D6ECCA
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 09:32:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DECE8344;
 Fri, 26 Jul 2019 02:32:09 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCB0F3F71A;
 Fri, 26 Jul 2019 02:32:08 -0700 (PDT)
Subject: Re: [PATCH v2 6/7] drm/panfrost: Add support for GPU heap allocations
To: Steven Price <steven.price@arm.com>, Rob Herring <robh@kernel.org>
References: <20190725011003.30837-1-robh@kernel.org>
 <20190725011003.30837-7-robh@kernel.org>
 <552e3ef7-7a2f-b4c1-69f2-3c1b9fea827d@arm.com>
 <CAL_JsqJZ-dBgAq45F_Q_BrKo4XhHXjUeALn0oqBr6yWd_kTK9A@mail.gmail.com>
 <15bdc38a-5f15-e333-7d91-724a283ef12a@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <4fd64b8b-00b4-4eb6-dc44-57d2211a303a@arm.com>
Date: Fri, 26 Jul 2019 10:32:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <15bdc38a-5f15-e333-7d91-724a283ef12a@arm.com>
Content-Language: en-GB
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
 Maxime Ripard <maxime.ripard@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjYvMDcvMjAxOSAxMDoxNSwgU3RldmVuIFByaWNlIHdyb3RlOgo+IE9uIDI1LzA3LzIwMTkg
MjI6MTEsIFJvYiBIZXJyaW5nIHdyb3RlOgo+PiBPbiBUaHUsIEp1bCAyNSwgMjAxOSBhdCA3OjA4
IEFNIFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+IAo+PiB3cm90ZToKPj4+Cj4+
PiBIaSBSb2IsCj4+Pgo+Pj4gT24gMjUvMDcvMjAxOSAwMjoxMCwgUm9iIEhlcnJpbmcgd3JvdGU6
Cj4+PiBbLi4uXQo+Pj4+IEBAIC0zMjgsNiArNDI3LDE4IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBw
YW5mcm9zdF9tbXVfaXJxX2hhbmRsZXIoaW50IAo+Pj4+IGlycSwgdm9pZCAqZGF0YSkKPj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFjY2Vzc190eXBlID0gKGZhdWx0X3N0YXR1cyA+
PiA4KSAmIDB4MzsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNvdXJjZV9pZCA9
IChmYXVsdF9zdGF0dXMgPj4gMTYpOwo+Pj4+Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAvKiBQYWdlIGZhdWx0IG9ubHkgKi8KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlm
ICgoc3RhdHVzICYgbWFzaykgPT0gQklUKGkpKSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgV0FSTl9PTihleGNlcHRpb25fdHlwZSA8IDB4QzEgfHwgCj4+
Pj4gZXhjZXB0aW9uX3R5cGUgPiAweEM0KTsKPj4+PiArCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gcGFuZnJvc3RfbW11X21hcF9mYXVsdF9hZGRy
KHBmZGV2LCBpLCAKPj4+PiBhZGRyKTsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBpZiAoIXJldCkgewo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtbXVfd3JpdGUocGZkZXYsIE1NVV9JTlRf
Q0xFQVIsIEJJVChpKSk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXR1cyAmPSB+bWFzazsKPj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4+ICsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC8qIHRlcm1pbmFsIGZhdWx0LCBwcmludCBpbmZvIGFib3V0IHRoZSBmYXVsdCAqLwo+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2VycihwZmRldi0+ZGV2LAo+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJVbmhhbmRsZWQg
UGFnZSBmYXVsdCBpbiBBUyVkIGF0IFZBIDB4JTAxNmxsWFxuIgo+Pj4+IEBAIC0zNjgsOCArNDc5
LDkgQEAgaW50IHBhbmZyb3N0X21tdV9pbml0KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgCj4+Pj4g
KnBmZGV2KQo+Pj4+IMKgwqDCoMKgwqDCoCBpZiAoaXJxIDw9IDApCj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT0RFVjsKPj4+Pgo+Pj4+IC3CoMKgwqDCoCBlcnIg
PSBkZXZtX3JlcXVlc3RfaXJxKHBmZGV2LT5kZXYsIGlycSwgcGFuZnJvc3RfbW11X2lycV9oYW5k
bGVyLAo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgSVJRRl9TSEFSRUQsICJtbXUiLCBwZmRldik7Cj4+Pj4gK8KgwqDCoMKgIGVyciA9
IGRldm1fcmVxdWVzdF90aHJlYWRlZF9pcnEocGZkZXYtPmRldiwgaXJxLCBOVUxMLAo+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcGFuZnJvc3RfbW11X2lycV9oYW5kbGVyLAo+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgSVJRRl9PTkVTSE9ULCAibW11IiwgcGZkZXYpOwo+Pj4KPj4+IFRoZSBjaGFuZ2Ugb2Yg
ZmxhZ3MgaGVyZSBicmVha3MgcGxhdGZvcm1zIHVzaW5nIGEgc2luZ2xlIHNoYXJlZAo+Pj4gaW50
ZXJydXB0IGxpbmUuCj4+Cj4+IERvIHRoZXkgZXhpc3Q/IEkgdGhpbmsgdGhpcyB3YXMgbGFyZ2Vs
eSBjb3B5LW4tcGFzdGUgbGVmdG92ZXIgZnJvbSB0aGUKPiAKPiBHb29kIHF1ZXN0aW9uIC0gb2Yg
dGhlIHBsYXRmb3JtcyBJIGtub3cgYWJvdXQgdGhleSBhbGwgaGF2ZSBzZXBhcmF0ZSAKPiBJUlFz
LCBidXQga2Jhc2UgZG9lcyBleHBsaWNpdGx5IGFsbG93IHNoYXJlZCBpbnRlcnJ1cHRzIHNvIGl0
J3MgcXVpdGUgCj4gcG9zc2libGUgdGhlcmUgaXMgYSBwbGF0Zm9ybSBvdXQgdGhlcmUgd2hpY2gg
ZG9lcy4KPiAKPj4gbGltYSBkcml2ZXIgd2hlcmUgdXRnYXJkIGhhcyBhIGJ1bmNoIG9mIGlycXMg
YW5kIHNvIHRoZXkgZ2V0IGNvbWJpbmVkLgo+PiBXaGlsZSBpdCdzIHBvc3NpYmxlIGNlcnRhaW5s
eSwgSSdkIGxpa2UgdG8gYXZvaWQgaGF2aW5nIHRvIGRvIGZ1cnRoZXIKPj4gcmV3b3JrIGVpdGhl
ciB0byB1c2UgYSB3b3JrcXVldWUgb3Igd2UgbmVlZCBhIHNpbmdsZSBkcml2ZXIgaGFuZGxlcgo+
PiB3aGljaCB0aGVuIGRpc3BhdGNoZXMgdGhlIHN1YiBoYW5kbGVycy4gVGhlIHByb2JsZW0gaXMg
dGhyZWFkZWQgaXJxCj4+IGhhbmRsZXJzIGRvbid0IHdvcmsgd2l0aCBzaGFyZWQgaXJxcy4KPiAK
PiBJdCBzZWVtcyByZWFzb25hYmxlIHRvIG1lIHRvIGF0IGxlYXN0IHdhaXQgdW50aWwgc29tZW9u
ZSBpZGVudGlmaWVzIGEgCj4gcGxhdGZvcm0gd2hpY2ggbmVlZHMgc2hhcmVkIGludGVycnVwdHMg
YmVmb3JlIGVtYmFya2luZyBvbiB0aGUgcmVmYWN0b3JpbmcuCgpJIGRvbid0IGtub3cgYWJvdXQg
cmVhbCBzaWxpY29uLCBidXQgaXQncyBjZXJ0YWlubHkgdHJ1ZSBvZiBvdXIgaW50ZXJuYWwgCkZQ
R0EgaW1hZ2VzIHRoYXQgSSd2ZSBiZWVuIHBsYXlpbmcgd2l0aCAodGhlIEp1bm8gYm9hcmQgb25s
eSBoYXMgYSAKc2luZ2xlIElSUSBsaW5lIGZvciB0aGUgZW50aXJlIEZQR0Egc2l0ZSkuIFRoYXQn
cyBvYnZpb3VzbHkgbm90IGEgbWFqb3IgCnByaW9yaXR5IGZvciB1cHN0cmVhbSwgdGhvdWdoLCBz
byBJIGNhbiBoYWNrIGFyb3VuZCBpdCBpZiBpdCdzIG5vdCAKb3RoZXJ3aXNlIGp1c3RpZmllZC4K
ClJvYmluLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
