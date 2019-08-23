Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6461F9B3B4
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 17:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F8E6ECD0;
	Fri, 23 Aug 2019 15:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3B7C06ECD0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 15:44:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E362B28;
 Fri, 23 Aug 2019 08:44:56 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F136A3F246;
 Fri, 23 Aug 2019 08:44:54 -0700 (PDT)
Subject: Re: [PATCH v2 7/8] drm/panfrost: Rework page table flushing and
 runtime PM interaction
To: Steven Price <steven.price@arm.com>, Rob Herring <robh@kernel.org>,
 dri-devel@lists.freedesktop.org
References: <20190823021216.5862-1-robh@kernel.org>
 <20190823021216.5862-8-robh@kernel.org>
 <0dc17539-99d0-d0ea-9b24-506f4dafef71@arm.com>
 <749c3430-9f35-84b4-9856-e43addf35f87@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <04c12d81-fb51-4123-02bc-28bbb97bfcd7@arm.com>
Date: Fri, 23 Aug 2019 16:44:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <749c3430-9f35-84b4-9856-e43addf35f87@arm.com>
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

T24gMjMvMDgvMjAxOSAxNjowNSwgU3RldmVuIFByaWNlIHdyb3RlOgo+IE9uIDIzLzA4LzIwMTkg
MTI6MTEsIFJvYmluIE11cnBoeSB3cm90ZToKPj4gT24gMjMvMDgvMjAxOSAwMzoxMiwgUm9iIEhl
cnJpbmcgd3JvdGU6Cj4+PiBUaGVyZSBpcyBubyBwb2ludCBpbiByZXN1bWluZyB0aGUgaC93IGp1
c3QgdG8gZG8gZmx1c2ggb3BlcmF0aW9ucyBhbmQKPj4+IGRvaW5nIHNvIHRha2VzIHNldmVyYWwg
bG9ja3Mgd2hpY2ggY2F1c2UgbG9ja2RlcCBpc3N1ZXMgd2l0aCB0aGUgCj4+PiBzaHJpbmtlci4K
Pj4+IFJld29yayB0aGUgZmx1c2ggb3BlcmF0aW9ucyB0byBvbmx5IGhhcHBlbiB3aGVuIHRoZSBo
L3cgaXMgYWxyZWFkeSAKPj4+IGF3YWtlLgo+Pj4gVGhpcyBhdm9pZHMgdGFraW5nIGFueSBsb2Nr
cyBhc3NvY2lhdGVkIHdpdGggcmVzdW1pbmcuCj4+Pgo+Pj4gQ2M6IFRvbWV1IFZpem9zbyA8dG9t
ZXUudml6b3NvQGNvbGxhYm9yYS5jb20+Cj4+PiBDYzogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJp
Y2VAYXJtLmNvbT4KPj4+IENjOiBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3NhLnJvc2VuendlaWdA
Y29sbGFib3JhLmNvbT4KPj4+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4+
PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+Pj4gU2lnbmVkLW9mZi1ieTog
Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPj4+IC0tLQo+Pj4gdjI6IG5ldyBwYXRjaAo+
Pj4KPj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYyB8IDQxICsr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRp
b25zKCspLCAyMSBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jIAo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvcGFuZnJvc3RfbW11LmMKPj4+IGluZGV4IDg0MmJkZDdjZjZiZS4uY2NmNjcxYTljM2ZiIDEw
MDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jCj4+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMKPj4+IEBAIC0y
MjAsNiArMjIwLDIzIEBAIHN0YXRpYyBzaXplX3QgZ2V0X3Bnc2l6ZSh1NjQgYWRkciwgc2l6ZV90
IHNpemUpCj4+PiDCoMKgwqDCoMKgIHJldHVybiBTWl8yTTsKPj4+IMKgIH0KPj4+ICt2b2lkIHBh
bmZyb3N0X21tdV9mbHVzaF9yYW5nZShzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiwKPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBwYW5mcm9zdF9tbXUg
Km1tdSwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHU2NCBpb3ZhLCBz
aXplX3Qgc2l6ZSkKPj4+ICt7Cj4+PiArwqDCoMKgIGlmIChtbXUtPmFzIDwgMCkKPj4+ICvCoMKg
wqDCoMKgwqDCoCByZXR1cm47Cj4+PiArCj4+PiArwqDCoMKgIC8qIEZsdXNoIHRoZSBQVHMgb25s
eSBpZiB3ZSdyZSBhbHJlYWR5IGF3YWtlICovCj4+PiArwqDCoMKgIGlmICghcG1fcnVudGltZV9n
ZXRfaWZfaW5fdXNlKHBmZGV2LT5kZXYpKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4K
Pj4gSXMgdGhlIE1NVSBndWFyYW50ZWVkIHRvIGJlIHJlc2V0IG9uIHJlc3VtZSBzdWNoIHRoYXQg
dGhlIFRMQnMgd2lsbCAKPj4gYWx3YXlzIGNvbWUgdXAgY2xlYW4/IE90aGVyd2lzZSB0aGVyZSBh
cmUgcG90ZW50aWFsbHkgY29ybmVycyB3aGVyZSAKPj4gc3RhbGUgZW50cmllcyB0aGF0IHdlIHNr
aXAgaGVyZSBtaWdodCBoYW5nIGFyb3VuZCBpZiB0aGUgaGFyZHdhcmUgbGllcyAKPj4gYWJvdXQg
cG93ZXJpbmcgdGhpbmdzIGRvd24uCj4gCj4gQXNzdW1pbmcgcnVudGltZSBQTSBoYXMgYWN0dWFs
bHkgY29tbWl0dGVkIHRvIHRoZSBwb3dlciBvZmYsIHRoZW4gb24gCj4gcG93ZXIgb24gcGFuZnJv
c3RfZGV2aWNlX3Jlc3VtZSgpIHdpbGwgYmUgY2FsbGVkIHdoaWNoIHBlcmZvcm1zIGEgcmVzZXQg
Cj4gb2YgdGhlIEdQVSB3aGljaCB3aWxsIGNsZWFyIHRoZSBMMi9UTEJzIHNvIHRoZXJlIHNob3Vs
ZG4ndCBiZSBhbnkgCj4gcHJvYmxlbSB0aGVyZS4KCk9LLCBpZiBwYW5mcm9zdF9ncHVfc29mdF9y
ZXNldCgpIGlzIHN1ZmZpY2llbnQgdG8gZ3VhcmFudGVlIGNsZWFuIFRMQnMgCnRoZW4gdGhpcyBs
b29rcyBlcXVpdmFsZW50IHRvIHdoYXQgd2UgZGlkIGZvciBhcm0tc21tdSwgc28gSSd2ZSBubyAK
Y29tcGxhaW50cyBpbiB0aGF0IHJlZ2FyZC4KCkhvd2V2ZXIgb24gc2Vjb25kIGxvb2sgSSd2ZSBu
b3cgbm90aWNlZCB0aGUgcGFuZnJvc3RfbW11X2ZsdXNoX3JhbmdlKCkgCmNhbGxzIGJlaW5nIG1v
dmVkIG91dHNpZGUgb2YgbW11LT5sb2NrIHByb3RlY3Rpb24uIEZvcmdpdmUgbWUgaWYgdGhlcmUn
cyAKYmFzaWMgRFJNIGtub3dsZWRnZSBJJ20gbWlzc2luZyBoZXJlLCBidXQgaXMgdGhlcmUgYW55
IHBvc3NpYmlsaXR5IGZvciAKbXVsdGlwbGUgdGhyZWFkcyB0byBjcmVhdGUvaW1wb3J0L2ZyZWUg
b2JqZWN0cyBzaW11bHRhbmVvdXNseSBvbiB0aGUgCnNhbWUgRkQgc3VjaCB0aGF0IHR3byBtbXVf
aHdfZG9fb3BlcmF0aW9uKCkgY2FsbHMgY291bGQgcmFjZSBhbmQgCmludGVyZmVyZSB3aXRoIGVh
Y2ggb3RoZXIgaW4gdGVybXMgb2YgdGhlIApBU19MT0NLQUREUi9BU19DT01NQU5EL0FTX1NUQVRV
UyBkYW5jZT8KClJvYmluLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
