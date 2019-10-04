Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10693CB7E6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 12:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED046EB08;
	Fri,  4 Oct 2019 10:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8D56EB07;
 Fri,  4 Oct 2019 10:08:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Oct 2019 03:08:11 -0700
X-IronPort-AV: E=Sophos;i="5.67,256,1566889200"; d="scan'208";a="191538199"
Received: from paaron-mobl.ger.corp.intel.com (HELO [10.251.93.134])
 ([10.251.93.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/AES256-SHA;
 04 Oct 2019 03:08:10 -0700
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915/execlists: Skip redundant
 resubmission
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20191003210100.22250-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <37b77313-4e99-7c1c-be29-acc48d0aefc9@linux.intel.com>
Date: Fri, 4 Oct 2019 11:08:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003210100.22250-1-chris@chris-wilson.co.uk>
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDAzLzEwLzIwMTkgMjI6MDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiBJZiB3ZSB1bndpbmQg
dGhlIGFjdGl2ZSByZXF1ZXN0cywgYW5kIG9uIHJlc3VibWlzc2lvbiBkaXNjb3ZlciB0aGF0IHdl
Cj4gaW50ZW5kIHRvIHByZWVtcHQgdGhlIGFjdGl2ZSBjb250ZXh0IHdpdGggaXRzZWxmLCBzaW1w
bHkgc2tpcCB0aGUgRUxTUAo+IHN1Ym1pc3Npb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMg
V2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndC9pbnRlbF9scmMuYyB8IDE3ICsrKysrKysrKysrKysrKystCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9scmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d0L2ludGVsX2xyYy5jCj4gaW5kZXggNDMxZDNiOGMzMzcxLi4zY2ZlYTE3NThmZDIgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfbHJjLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9scmMuYwo+IEBAIC0xNzM5LDExICsxNzM5LDI2
IEBAIHN0YXRpYyB2b2lkIGV4ZWNsaXN0c19kZXF1ZXVlKHN0cnVjdCBpbnRlbF9lbmdpbmVfY3Mg
KmVuZ2luZSkKPiAgIAo+ICAgCWlmIChzdWJtaXQpIHsKPiAgIAkJKnBvcnQgPSBleGVjbGlzdHNf
c2NoZWR1bGVfaW4obGFzdCwgcG9ydCAtIGV4ZWNsaXN0cy0+cGVuZGluZyk7Cj4gLQkJbWVtc2V0
KHBvcnQgKyAxLCAwLCAobGFzdF9wb3J0IC0gcG9ydCkgKiBzaXplb2YoKnBvcnQpKTsKPiAgIAkJ
ZXhlY2xpc3RzLT5zd2l0Y2hfcHJpb3JpdHlfaGludCA9Cj4gICAJCQlzd2l0Y2hfcHJpbyhlbmdp
bmUsICpleGVjbGlzdHMtPnBlbmRpbmcpOwo+ICsKPiArCQkvKgo+ICsJCSAqIFNraXAgaWYgd2Ug
ZW5kZWQgdXAgd2l0aCBleGFjdGx5IHRoZSBzYW1lIHNldCBvZiByZXF1ZXN0cywKPiArCQkgKiBl
LmcuIHRyeWluZyB0byB0aW1lc2xpY2UgYSBwYWlyIG9mIG9yZGVyZWQgY29udGV4dHMKPiArCQkg
Ki8KPiArCQlpZiAoIW1lbWNtcChleGVjbGlzdHMtPmFjdGl2ZSwgZXhlY2xpc3RzLT5wZW5kaW5n
LAo+ICsJCQkgICAgKHBvcnQgLSBleGVjbGlzdHMtPnBlbmRpbmcgKyAxKSAqIHNpemVvZigqcG9y
dCkpKSB7Cj4gKwkJCWRvCj4gKwkJCQlleGVjbGlzdHNfc2NoZWR1bGVfb3V0KGZldGNoX2FuZF96
ZXJvKHBvcnQpKTsKPiArCQkJd2hpbGUgKHBvcnQtLSAhPSBleGVjbGlzdHMtPnBlbmRpbmcpOwo+
ICsKPiArCQkJZ290byBza2lwX3N1Ym1pdDsKPiArCQl9Cj4gKwo+ICsJCW1lbXNldChwb3J0ICsg
MSwgMCwgKGxhc3RfcG9ydCAtIHBvcnQpICogc2l6ZW9mKCpwb3J0KSk7Cj4gICAJCWV4ZWNsaXN0
c19zdWJtaXRfcG9ydHMoZW5naW5lKTsKPiAgIAl9IGVsc2Ugewo+ICtza2lwX3N1Ym1pdDoKPiAg
IAkJcmluZ19zZXRfcGF1c2VkKGVuZ2luZSwgMCk7Cj4gICAJfQo+ICAgfQo+IAoKQSBsaXR0bGUg
Yml0IG9mIHRyYWNlcG9pbnQgbm9pc2Ugd2l0aCBpbi9vdXQgYnV0IGxvb2tzIGNvcnJlY3QgYWZ0
ZXIgSSAKcmVhZCB0aGUgbmV3IGNvZGUuIEFuZCBJIHdvbmRlciBpZiB0cmFjZS5wbCBzdGlsbCB3
b3JrcyBhZnRlciBsYXN0IApjb3VwbGUgbW9udGhzIG9mIHJlZmFjdG9ycy4uIDopCgpSZXZpZXdl
ZC1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KClJlZ2FyZHMs
CgpUdnJ0a28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
