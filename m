Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B97F9B2F6
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 17:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3E86ECBC;
	Fri, 23 Aug 2019 15:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 67EC26ECBC
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 15:05:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B94328;
 Fri, 23 Aug 2019 08:05:10 -0700 (PDT)
Received: from [10.1.31.94] (unknown [10.1.31.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB6423F718;
 Fri, 23 Aug 2019 08:05:08 -0700 (PDT)
Subject: Re: [PATCH v2 7/8] drm/panfrost: Rework page table flushing and
 runtime PM interaction
To: Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 dri-devel@lists.freedesktop.org
References: <20190823021216.5862-1-robh@kernel.org>
 <20190823021216.5862-8-robh@kernel.org>
 <0dc17539-99d0-d0ea-9b24-506f4dafef71@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <749c3430-9f35-84b4-9856-e43addf35f87@arm.com>
Date: Fri, 23 Aug 2019 16:05:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <0dc17539-99d0-d0ea-9b24-506f4dafef71@arm.com>
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
 Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjMvMDgvMjAxOSAxMjoxMSwgUm9iaW4gTXVycGh5IHdyb3RlOgo+IE9uIDIzLzA4LzIwMTkg
MDM6MTIsIFJvYiBIZXJyaW5nIHdyb3RlOgo+PiBUaGVyZSBpcyBubyBwb2ludCBpbiByZXN1bWlu
ZyB0aGUgaC93IGp1c3QgdG8gZG8gZmx1c2ggb3BlcmF0aW9ucyBhbmQKPj4gZG9pbmcgc28gdGFr
ZXMgc2V2ZXJhbCBsb2NrcyB3aGljaCBjYXVzZSBsb2NrZGVwIGlzc3VlcyB3aXRoIHRoZSAKPj4g
c2hyaW5rZXIuCj4+IFJld29yayB0aGUgZmx1c2ggb3BlcmF0aW9ucyB0byBvbmx5IGhhcHBlbiB3
aGVuIHRoZSBoL3cgaXMgYWxyZWFkeSBhd2FrZS4KPj4gVGhpcyBhdm9pZHMgdGFraW5nIGFueSBs
b2NrcyBhc3NvY2lhdGVkIHdpdGggcmVzdW1pbmcuCj4+Cj4+IENjOiBUb21ldSBWaXpvc28gPHRv
bWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgo+PiBDYzogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJp
Y2VAYXJtLmNvbT4KPj4gQ2M6IEFseXNzYSBSb3Nlbnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bj
b2xsYWJvcmEuY29tPgo+PiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+PiBD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+PiBTaWduZWQtb2ZmLWJ5OiBSb2Ig
SGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+PiAtLS0KPj4gdjI6IG5ldyBwYXRjaAo+Pgo+PiDC
oCBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgfCA0MSArKysrKysrKysr
KystLS0tLS0tLS0tLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAy
MSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9tbXUuYyAKPj4gYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rf
bW11LmMKPj4gaW5kZXggODQyYmRkN2NmNmJlLi5jY2Y2NzFhOWMzZmIgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYwo+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMKPj4gQEAgLTIyMCw2ICsyMjAsMjMgQEAg
c3RhdGljIHNpemVfdCBnZXRfcGdzaXplKHU2NCBhZGRyLCBzaXplX3Qgc2l6ZSkKPj4gwqDCoMKg
wqDCoCByZXR1cm4gU1pfMk07Cj4+IMKgIH0KPj4gK3ZvaWQgcGFuZnJvc3RfbW11X2ZsdXNoX3Jh
bmdlKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgcGFuZnJvc3RfbW11ICptbXUsCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHU2NCBpb3ZhLCBzaXplX3Qgc2l6ZSkKPj4gK3sKPj4g
K8KgwqDCoCBpZiAobW11LT5hcyA8IDApCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+ICsK
Pj4gK8KgwqDCoCAvKiBGbHVzaCB0aGUgUFRzIG9ubHkgaWYgd2UncmUgYWxyZWFkeSBhd2FrZSAq
Lwo+PiArwqDCoMKgIGlmICghcG1fcnVudGltZV9nZXRfaWZfaW5fdXNlKHBmZGV2LT5kZXYpKQo+
PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+IAo+IElzIHRoZSBNTVUgZ3VhcmFudGVlZCB0byBi
ZSByZXNldCBvbiByZXN1bWUgc3VjaCB0aGF0IHRoZSBUTEJzIHdpbGwgCj4gYWx3YXlzIGNvbWUg
dXAgY2xlYW4/IE90aGVyd2lzZSB0aGVyZSBhcmUgcG90ZW50aWFsbHkgY29ybmVycyB3aGVyZSAK
PiBzdGFsZSBlbnRyaWVzIHRoYXQgd2Ugc2tpcCBoZXJlIG1pZ2h0IGhhbmcgYXJvdW5kIGlmIHRo
ZSBoYXJkd2FyZSBsaWVzIAo+IGFib3V0IHBvd2VyaW5nIHRoaW5ncyBkb3duLgoKQXNzdW1pbmcg
cnVudGltZSBQTSBoYXMgYWN0dWFsbHkgY29tbWl0dGVkIHRvIHRoZSBwb3dlciBvZmYsIHRoZW4g
b24gCnBvd2VyIG9uIHBhbmZyb3N0X2RldmljZV9yZXN1bWUoKSB3aWxsIGJlIGNhbGxlZCB3aGlj
aCBwZXJmb3JtcyBhIHJlc2V0IApvZiB0aGUgR1BVIHdoaWNoIHdpbGwgY2xlYXIgdGhlIEwyL1RM
QnMgc28gdGhlcmUgc2hvdWxkbid0IGJlIGFueSAKcHJvYmxlbSB0aGVyZS4KCkFzIGZhciBhcyBJ
IGNhbiBzZWUgZnJvbSB0aGUgY29kZSB0aGF0IGlzIGhvdyBwbV9ydW50aW1lX2dldF9pZl9pbl91
c2UoKSAKd29ya3MgLSBpdCB3aWxsIHJldHVybiB0cnVlIHVubGVzcyB0aGUgc3VzcGVuZCgpIGNh
bGxiYWNrIGhhcyBiZWVuIGNhbGxlZC4KClN0ZXZlCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
