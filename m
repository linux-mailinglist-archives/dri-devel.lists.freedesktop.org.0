Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D78F2C6C3F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:59:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC696F3CE;
	Fri, 27 Nov 2020 19:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860576F3C9;
 Fri, 27 Nov 2020 19:58:50 +0000 (UTC)
IronPort-SDR: aPhx4mz18v8zl+FFC0el6SZaY0fXn/TekHuI7QLt0g8q+pfop+5uUMerfO3KhWVefkcqgbSx2I
 cCasZNiZ+iww==
X-IronPort-AV: E=McAfee;i="6000,8403,9818"; a="190592444"
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; d="scan'208";a="190592444"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 11:58:36 -0800
IronPort-SDR: j1272cOrMeE3BROM7zNV3cQ6ZISLXKfktjXRZc7uPbGyKVsa1jY1vbYNgETJD5/0BCj1W8I8Cm
 wRvt1C/lsEFg==
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; d="scan'208";a="548148865"
Received: from cwilso3-mobl.fi.intel.com (HELO localhost) ([10.214.217.175])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 11:58:33 -0800
MIME-Version: 1.0
In-Reply-To: <20201127120718.454037-7-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-7-matthew.auld@intel.com>
Subject: Re: [RFC PATCH 006/162] drm/i915: split gen8+ flush and bb_start
 emission functions to their own file
From: Chris Wilson <chris.p.wilson@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Fri, 27 Nov 2020 19:58:30 +0000
Message-ID: <160650711000.2925.11709076046712842264@build.alporthouse.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBNYXR0aGV3IEF1bGQgKDIwMjAtMTEtMjcgMTI6MDQ6NDIpCj4gRnJvbTogRGFuaWVs
ZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT4KPiAKPiBU
aGVzZSBmdW5jdGlvbnMgYXJlIGluZGVwZW5kZW50IGZyb20gdGhlIGJhY2tlbmQgdXNlZCBhbmQg
Y2FuIHRoZXJlZm9yZQo+IGJlIHNwbGl0IG91dCBvZiB0aGUgZXhlbGlzdHMgc3VibWlzc2lvbiBm
aWxlLCBzbyB0aGV5IGNhbiBiZSByZS11c2VkIGJ5Cj4gdGhlIHVwY29taW5nIEd1QyBzdWJtaXNz
aW9uIGJhY2tlbmQuCj4gCj4gQmFzZWQgb24gYSBwYXRjaCBieSBDaHJpcyBXaWxzb24uCj4gCj4g
U2lnbmVkLW9mZi1ieTogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xvc3B1
cmlvQGludGVsLmNvbT4KPiBDYzogQ2hyaXMgUCBXaWxzb24gPGNocmlzLnAud2lsc29uQGludGVs
LmNvbT4KPiBDYzogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGxpbnV4LmludGVsLmNv
bT4KPiBSZXZpZXdlZC1ieTogSm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVsLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvTWFrZWZpbGUgICAgICAgICAgICAgICAg
IHwgICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvZ2VuOF9lbmdpbmVfY3MuYyAgICAg
IHwgMzkzICsrKysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9nZW44
X2VuZ2luZV9jcy5oICAgICAgfCAgMjYgKysKPiAgLi4uL2RybS9pOTE1L2d0L2ludGVsX2V4ZWNs
aXN0c19zdWJtaXNzaW9uLmMgIHwgMzg1ICstLS0tLS0tLS0tLS0tLS0tCj4gIDQgZmlsZXMgY2hh
bmdlZCwgNDIxIGluc2VydGlvbnMoKyksIDM4NCBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2dlbjhfZW5naW5lX2NzLmMKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2dlbjhfZW5naW5lX2NzLmgKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvTWFrZWZpbGUgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9NYWtlZmlsZQo+IGluZGV4IGFlZGJkOGY1MmJlOC4uZjllZjUxOTliMTI0IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L01ha2VmaWxlCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvTWFrZWZpbGUKPiBAQCAtODIsNiArODIsNyBAQCBndC15ICs9IFwKPiAg
ICAgICAgIGd0L2dlbjZfZW5naW5lX2NzLm8gXAo+ICAgICAgICAgZ3QvZ2VuNl9wcGd0dC5vIFwK
PiAgICAgICAgIGd0L2dlbjdfcmVuZGVyY2xlYXIubyBcCj4gKyAgICAgICBndC9nZW44X2VuZ2lu
ZV9jcy5vIFwKPiAgICAgICAgIGd0L2dlbjhfcHBndHQubyBcCj4gICAgICAgICBndC9pbnRlbF9i
cmVhZGNydW1icy5vIFwKPiAgICAgICAgIGd0L2ludGVsX2NvbnRleHQubyBcCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2dlbjhfZW5naW5lX2NzLmMgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndC9nZW44X2VuZ2luZV9jcy5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAwMDAuLmE5NmZlMTA4Njg1ZQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9nZW44X2VuZ2luZV9jcy5jCj4gQEAgLTAsMCArMSwzOTMg
QEAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVAo+ICsvKgo+ICsgKiBDb3B5cmln
aHQgwqkgMjAxNCBJbnRlbCBDb3Jwb3JhdGlvbgo+ICsgKi8KPiArCj4gKyNpbmNsdWRlICJpOTE1
X2Rydi5oIgo+ICsjaW5jbHVkZSAiaW50ZWxfZXhlY2xpc3RzX3N1Ym1pc3Npb24uaCIgLyogWFhY
ICovCj4gKyNpbmNsdWRlICJpbnRlbF9ncHVfY29tbWFuZHMuaCIKPiArI2luY2x1ZGUgImludGVs
X3JpbmcuaCIKPiArCj4gK2ludCBnZW44X2VtaXRfZmx1c2hfcmVuZGVyKHN0cnVjdCBpOTE1X3Jl
cXVlc3QgKnJlcXVlc3QsIHUzMiBtb2RlKQoKUmVmcmVzaCB0aGUgbmFtZXMgdG8gbWFrZSB0aGUg
cmVjZW50IHNjaGVtZXMuCihyY3Mgd2hlbiBzcGVjaWZpYywgeGNzIHdoZW4gbm90KQotQ2hyaXMK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCkludGVsIENvcnBvcmF0aW9uIChVSykgTGltaXRlZApSZWdpc3RlcmVkIE5v
LiAxMTM0OTQ1IChFbmdsYW5kKQpSZWdpc3RlcmVkIE9mZmljZTogUGlwZXJzIFdheSwgU3dpbmRv
biBTTjMgMVJKClZBVCBObzogODYwIDIxNzMgNDcKClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNo
bWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG1hdGVyaWFsIGZvcgp0aGUgc29sZSB1c2Ug
b2YgdGhlIGludGVuZGVkIHJlY2lwaWVudChzKS4gQW55IHJldmlldyBvciBkaXN0cmlidXRpb24K
Ynkgb3RoZXJzIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRl
bmRlZApyZWNpcGllbnQsIHBsZWFzZSBjb250YWN0IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwg
Y29waWVzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
