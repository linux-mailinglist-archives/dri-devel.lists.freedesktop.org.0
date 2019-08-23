Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F05A69B458
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 18:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BCBB6ECE6;
	Fri, 23 Aug 2019 16:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 39B226ECE6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 16:16:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6CA228;
 Fri, 23 Aug 2019 09:16:11 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE2CE3F246;
 Fri, 23 Aug 2019 09:16:09 -0700 (PDT)
Subject: Re: [PATCH v2 7/8] drm/panfrost: Rework page table flushing and
 runtime PM interaction
To: Rob Herring <robh@kernel.org>
References: <20190823021216.5862-1-robh@kernel.org>
 <20190823021216.5862-8-robh@kernel.org>
 <0dc17539-99d0-d0ea-9b24-506f4dafef71@arm.com>
 <749c3430-9f35-84b4-9856-e43addf35f87@arm.com>
 <04c12d81-fb51-4123-02bc-28bbb97bfcd7@arm.com>
 <CAL_JsqLHDcq0RXrhU0SCL24kV-r_wmiY8=xd42STO0Ha6hq8iA@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <6dfd4619-9779-80a5-6868-315dec73b4f4@arm.com>
Date: Fri, 23 Aug 2019 17:16:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLHDcq0RXrhU0SCL24kV-r_wmiY8=xd42STO0Ha6hq8iA@mail.gmail.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjMvMDgvMjAxOSAxNjo1NywgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gRnJpLCBBdWcgMjMs
IDIwMTkgYXQgMTA6NDQgQU0gUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4gd3Jv
dGU6Cj4+Cj4+IE9uIDIzLzA4LzIwMTkgMTY6MDUsIFN0ZXZlbiBQcmljZSB3cm90ZToKPj4+IE9u
IDIzLzA4LzIwMTkgMTI6MTEsIFJvYmluIE11cnBoeSB3cm90ZToKPj4+PiBPbiAyMy8wOC8yMDE5
IDAzOjEyLCBSb2IgSGVycmluZyB3cm90ZToKPj4+Pj4gVGhlcmUgaXMgbm8gcG9pbnQgaW4gcmVz
dW1pbmcgdGhlIGgvdyBqdXN0IHRvIGRvIGZsdXNoIG9wZXJhdGlvbnMgYW5kCj4+Pj4+IGRvaW5n
IHNvIHRha2VzIHNldmVyYWwgbG9ja3Mgd2hpY2ggY2F1c2UgbG9ja2RlcCBpc3N1ZXMgd2l0aCB0
aGUKPj4+Pj4gc2hyaW5rZXIuCj4+Pj4+IFJld29yayB0aGUgZmx1c2ggb3BlcmF0aW9ucyB0byBv
bmx5IGhhcHBlbiB3aGVuIHRoZSBoL3cgaXMgYWxyZWFkeQo+Pj4+PiBhd2FrZS4KPj4+Pj4gVGhp
cyBhdm9pZHMgdGFraW5nIGFueSBsb2NrcyBhc3NvY2lhdGVkIHdpdGggcmVzdW1pbmcuCj4+Pj4+
Cj4+Pj4+IENjOiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgo+Pj4+
PiBDYzogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KPj4+Pj4gQ2M6IEFseXNz
YSBSb3Nlbnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tPgo+Pj4+PiBDYzog
RGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+Pj4+PiBDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPgo+Pj4+PiAtLS0KPj4+Pj4gdjI6IG5ldyBwYXRjaAo+Pj4+Pgo+Pj4+PiAgICBk
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgfCA0MSArKysrKysrKysrKyst
LS0tLS0tLS0tLS0tCj4+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAy
MSBkZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9tbXUuYwo+Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9tbXUuYwo+Pj4+PiBpbmRleCA4NDJiZGQ3Y2Y2YmUuLmNjZjY3MWE5YzNmYiAxMDA2
NDQKPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jCj4+
Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYwo+Pj4+PiBA
QCAtMjIwLDYgKzIyMCwyMyBAQCBzdGF0aWMgc2l6ZV90IGdldF9wZ3NpemUodTY0IGFkZHIsIHNp
emVfdCBzaXplKQo+Pj4+PiAgICAgICAgcmV0dXJuIFNaXzJNOwo+Pj4+PiAgICB9Cj4+Pj4+ICt2
b2lkIHBhbmZyb3N0X21tdV9mbHVzaF9yYW5nZShzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRl
diwKPj4+Pj4gKyAgICAgICAgICAgICAgICAgIHN0cnVjdCBwYW5mcm9zdF9tbXUgKm1tdSwKPj4+
Pj4gKyAgICAgICAgICAgICAgICAgIHU2NCBpb3ZhLCBzaXplX3Qgc2l6ZSkKPj4+Pj4gK3sKPj4+
Pj4gKyAgICBpZiAobW11LT5hcyA8IDApCj4+Pj4+ICsgICAgICAgIHJldHVybjsKPj4+Pj4gKwo+
Pj4+PiArICAgIC8qIEZsdXNoIHRoZSBQVHMgb25seSBpZiB3ZSdyZSBhbHJlYWR5IGF3YWtlICov
Cj4+Pj4+ICsgICAgaWYgKCFwbV9ydW50aW1lX2dldF9pZl9pbl91c2UocGZkZXYtPmRldikpCj4+
Pj4+ICsgICAgICAgIHJldHVybjsKPj4+Pgo+Pj4+IElzIHRoZSBNTVUgZ3VhcmFudGVlZCB0byBi
ZSByZXNldCBvbiByZXN1bWUgc3VjaCB0aGF0IHRoZSBUTEJzIHdpbGwKPj4+PiBhbHdheXMgY29t
ZSB1cCBjbGVhbj8gT3RoZXJ3aXNlIHRoZXJlIGFyZSBwb3RlbnRpYWxseSBjb3JuZXJzIHdoZXJl
Cj4+Pj4gc3RhbGUgZW50cmllcyB0aGF0IHdlIHNraXAgaGVyZSBtaWdodCBoYW5nIGFyb3VuZCBp
ZiB0aGUgaGFyZHdhcmUgbGllcwo+Pj4+IGFib3V0IHBvd2VyaW5nIHRoaW5ncyBkb3duLgo+Pj4K
Pj4+IEFzc3VtaW5nIHJ1bnRpbWUgUE0gaGFzIGFjdHVhbGx5IGNvbW1pdHRlZCB0byB0aGUgcG93
ZXIgb2ZmLCB0aGVuIG9uCj4+PiBwb3dlciBvbiBwYW5mcm9zdF9kZXZpY2VfcmVzdW1lKCkgd2ls
bCBiZSBjYWxsZWQgd2hpY2ggcGVyZm9ybXMgYSByZXNldAo+Pj4gb2YgdGhlIEdQVSB3aGljaCB3
aWxsIGNsZWFyIHRoZSBMMi9UTEJzIHNvIHRoZXJlIHNob3VsZG4ndCBiZSBhbnkKPj4+IHByb2Js
ZW0gdGhlcmUuCj4+Cj4+IE9LLCBpZiBwYW5mcm9zdF9ncHVfc29mdF9yZXNldCgpIGlzIHN1ZmZp
Y2llbnQgdG8gZ3VhcmFudGVlIGNsZWFuIFRMQnMKPj4gdGhlbiB0aGlzIGxvb2tzIGVxdWl2YWxl
bnQgdG8gd2hhdCB3ZSBkaWQgZm9yIGFybS1zbW11LCBzbyBJJ3ZlIG5vCj4+IGNvbXBsYWludHMg
aW4gdGhhdCByZWdhcmQuCj4+Cj4+IEhvd2V2ZXIgb24gc2Vjb25kIGxvb2sgSSd2ZSBub3cgbm90
aWNlZCB0aGUgcGFuZnJvc3RfbW11X2ZsdXNoX3JhbmdlKCkKPj4gY2FsbHMgYmVpbmcgbW92ZWQg
b3V0c2lkZSBvZiBtbXUtPmxvY2sgcHJvdGVjdGlvbi4gRm9yZ2l2ZSBtZSBpZiB0aGVyZSdzCj4+
IGJhc2ljIERSTSBrbm93bGVkZ2UgSSdtIG1pc3NpbmcgaGVyZSwgYnV0IGlzIHRoZXJlIGFueSBw
b3NzaWJpbGl0eSBmb3IKPj4gbXVsdGlwbGUgdGhyZWFkcyB0byBjcmVhdGUvaW1wb3J0L2ZyZWUg
b2JqZWN0cyBzaW11bHRhbmVvdXNseSBvbiB0aGUKPj4gc2FtZSBGRCBzdWNoIHRoYXQgdHdvIG1t
dV9od19kb19vcGVyYXRpb24oKSBjYWxscyBjb3VsZCByYWNlIGFuZAo+PiBpbnRlcmZlcmUgd2l0
aCBlYWNoIG90aGVyIGluIHRlcm1zIG9mIHRoZQo+PiBBU19MT0NLQUREUi9BU19DT01NQU5EL0FT
X1NUQVRVUyBkYW5jZT8KPiAKPiBZZXMsIHdlIGNvdWxkIGhhdmUgbXVsdGlwbGUgdGhyZWFkcy4g
Tm90IHJlYWxseSBhbnkgZ29vZCByZWFzb24gaXQncwo+IG1vdmVkIG91dCBvZiB0aGUgbW11LT5s
b2NrIG90aGVyIHRoYW4ganVzdCB0byBhdm9pZCBhbnkgbmVzdGluZwo+ICh0aG91Z2ggdGhhdCBz
ZWVtZWQgZmluZSBpbiB0ZXN0aW5nKS4gVGhlIG5ld2x5IGFkZGVkIGFzX2xvY2sgd2lsbAo+IHNl
cmlhbGl6ZSBtbXVfaHdfZG9fb3BlcmF0aW9uKCkuIFNvIHRoZSBtbXUtPmxvY2sgaXMganVzdCBz
ZXJpYWxpemluZwo+IHBhZ2UgdGFibGUgd3JpdGVzLgoKVXJnaCwgc29ycnksIG9uY2UgYWdhaW4g
SSdkIHN0b3BwZWQgbG9va2luZyBhdCAtbmV4dCBhbmQgd2FzIApjcm9zcy1yZWZlcmVuY2luZyBt
eSBjdXJyZW50IHJjMy1iYXNlZCB3b3JraW5nIHRyZWUgOigKCkluIHRoYXQgY2FzZSwgeW91IG1h
eSBldmVuIGJlIGFibGUgdG8gcmVtb3ZlIG1tdS0+bG9jayBlbnRpcmVseSwgc2luY2UgCmlvLXBn
dGFibGUtYXJtIGRvZXNuJ3QgbmVlZCBleHRlcm5hbCBsb2NraW5nIGl0c2VsZi4gQW5kIGZvciB0
aGlzIHBhdGNoLAoKUmV2aWV3ZWQtYnk6IFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5j
b20+CgpDaGVlcnMsClJvYmluLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
