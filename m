Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9890036EEFD
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 19:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765966F413;
	Thu, 29 Apr 2021 17:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F69E6F412;
 Thu, 29 Apr 2021 17:34:56 +0000 (UTC)
IronPort-SDR: bFjT4h27WxyReIxVAiqrKB+wr0WLmgk/mEfMb40yDqUVoPUPL4QB2B0yo1klbfINlMhMgd3o3a
 lVHgeR5t/Lxg==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="196627270"
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; d="scan'208";a="196627270"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 10:34:55 -0700
IronPort-SDR: aRSyn7TPbfG4Jy+vLxgJaP8Vb7IyNk3OzKLwV1KmlKwqvQ+wDkbWGhHpR5ynbYE1KqAlsABhDL
 0yv7vNGzEPEw==
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; d="scan'208";a="458871814"
Received: from gwaise-mobl1.ger.corp.intel.com (HELO [10.213.208.64])
 ([10.213.208.64])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 10:34:54 -0700
Subject: Re: [PATCH 1/2] drm/i915/overlay: Fix active retire callback alignment
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20210429083530.849546-1-tvrtko.ursulin@linux.intel.com>
 <YIrfb9jvAn/FTt09@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <76f1488b-f0c3-f110-44ed-b7633256f132@linux.intel.com>
Date: Thu, 29 Apr 2021 18:34:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIrfb9jvAn/FTt09@intel.com>
Content-Language: en-US
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDI5LzA0LzIwMjEgMTc6MzEsIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPiBPbiBUaHUsIEFw
ciAyOSwgMjAyMSBhdCAwOTozNToyOUFNICswMTAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToKPj4g
RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KPj4KPj4gX19p
OTE1X2FjdGl2ZV9jYWxsIGFubm90YXRpb24gaXMgcmVxdWlyZWQgb24gdGhlIHJldGlyZSBjYWxs
YmFjayB0byBlbnN1cmUKPj4gY29ycmVjdCBmdW5jdGlvbiBhbGlnbm1lbnQuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Cj4+IEZp
eGVzOiBhMjFjZThhZDEyZDIgKCJkcm0vaTkxNS9vdmVybGF5OiBTd2l0Y2ggdG8gdXNpbmcgaTkx
NV9hY3RpdmUgdHJhY2tpbmciKQo+PiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxz
b24uY28udWs+Cj4+IENjOiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+Cj4+
IC0tLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfb3ZlcmxheS5jIHwg
MiArLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9vdmVy
bGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX292ZXJsYXkuYwo+PiBp
bmRleCBmZmZiZGU0MjU2ZGIuLjQyODgxOWJhMThkZCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9vdmVybGF5LmMKPj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9vdmVybGF5LmMKPj4gQEAgLTM4Myw3ICszODMsNyBAQCBz
dGF0aWMgdm9pZCBpbnRlbF9vdmVybGF5X29mZl90YWlsKHN0cnVjdCBpbnRlbF9vdmVybGF5ICpv
dmVybGF5KQo+PiAgIAkJaTgzMF9vdmVybGF5X2Nsb2NrX2dhdGluZyhkZXZfcHJpdiwgdHJ1ZSk7
Cj4+ICAgfQo+PiAgIAo+PiAtc3RhdGljIHZvaWQKPj4gK19faTkxNV9hY3RpdmVfY2FsbCBzdGF0
aWMgdm9pZAo+IAo+IEFtIEkgYmxpbmQgb3IgYXJlIHdlIGp1c3QgcGFja2luZyBmbGFnIGJpdHMg
aW50byBhIHBvaW50ZXIsIHBhc3NpbmcKPiB0aGF0IHRvIGEgZnVuY3Rpb24sIGFuZCB0aGVuIGlt
bWVkaWF0ZWx5IHVucGFjayB0aGUgYml0cyBhZ2FpbiBpbgo+IHNhaWQgZnVuY3Rpb24/IFdoeSBu
b3QganVzdCBwYXNzIHRoZSBmbGFncyBleHBsaWNpdGx5Pwo+IAo+IExvb2tzIGxpa2UgeW91IG1p
c3NlZCBhdXRvX3JldGlyZSgpPwoKWWVhaCwgYm90aCBwb2ludHMgYWxyZWFkeSBlaXRoZXIgZml4
ZWQgb3IgdW5kZXIgY29uc2lkZXJhdGlvbjogCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9w
Lm9yZy9wYXRjaC80MzE0NzMvP3Nlcmllcz04OTYyMyZyZXY9MQoKSSBsZWZ0IHRoZSBzcGxpdHRp
bmcgdXAgdmZ1bmMgdnMgZmxhZ3MgZm9yIGxhdGVyLgoKUmVnYXJkcywKClR2cnRrbwoKPj4gICBp
bnRlbF9vdmVybGF5X2xhc3RfZmxpcF9yZXRpcmUoc3RydWN0IGk5MTVfYWN0aXZlICphY3RpdmUp
Cj4+ICAgewo+PiAgIAlzdHJ1Y3QgaW50ZWxfb3ZlcmxheSAqb3ZlcmxheSA9Cj4+IC0tIAo+PiAy
LjMwLjIKPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
