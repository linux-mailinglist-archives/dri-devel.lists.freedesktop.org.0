Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A59EC4F4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 15:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801A16F81B;
	Fri,  1 Nov 2019 14:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A551E6F81B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 14:46:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Nov 2019 07:46:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,255,1569308400"; d="scan'208";a="351970577"
Received: from cepartan-mobl3.ger.corp.intel.com (HELO [10.249.40.248])
 ([10.249.40.248])
 by orsmga004.jf.intel.com with ESMTP; 01 Nov 2019 07:46:55 -0700
Subject: Re: [PATCH] drm/atomic: swap_state should stall on cleanup_done
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20191031223641.19208-1-robdclark@gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <7b97af56-be9b-ed2e-f692-36433a889d6e@linux.intel.com>
Date: Fri, 1 Nov 2019 15:46:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191031223641.19208-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3AgMzEtMTAtMjAxOSBvbSAyMzozNiBzY2hyZWVmIFJvYiBDbGFyazoKPiBGcm9tOiBSb2IgQ2xh
cmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4KPiBTdGFsbGluZyBvbiBjbGVhbnVwX2RvbmUg
ZW5zdXJlcyB0aGF0IGFueSBhdG9taWMgc3RhdGUgcmVsYXRlZCB0byBhCj4gbm9uYmxvY2sgY29t
bWl0IG5vIGxvbmdlciBoYXMgZGFuZ2xpbmcgcmVmZXJlbmNlcyB0byBwZXItb2JqZWN0IHN0YXRl
Cj4gdGhhdCBjYW4gYmUgZnJlZWQuCj4KPiBPdGhlcndpc2UsIGlmIGEgIW5vbmJsb2NrIGNvbW1p
dCBjb21wbGV0ZXMgYWZ0ZXIgYSBub25ibG9jayBjb21taXQgaGFzCj4gc3dhcHBlZCBzdGF0ZSAo
aWUuIHRoZSBzeW5jaHJvbm91cyBwYXJ0IG9mIHRoZSBub25ibG9jayBjb21taXQgY29tZXMKPiBi
ZWZvcmUgdGhlICFub25ibG9jayBjb21taXQpLCBidXQgYmVmb3JlIHRoZSBhc3luY2hyb25vdXMg
cGFydCBvZiB0aGUKPiBub25ibG9jayBjb21taXQgY29tcGxldGVzLCB3aGF0IHdhcyB0aGUgbmV3
IHBlci1vYmplY3Qgc3RhdGUgaW4gdGhlCj4gbm9uYmxvY2sgY29tbWl0IGNhbiBiZSBmcmVlZC4K
Pgo+IFRoaXMgc2hvd3MgdXAgd2l0aCB0aGUgbmV3IHNlbGYtcmVmcmVzaCBoZWxwZXIsIGFzIF91
cGRhdGVfYXZnX3RpbWVzKCkKPiBkZXJlZmVyZW5jZXMgdGhlIG9yaWdpbmFsIG9sZCBhbmQgbmV3
IGNydGNfc3RhdGUuCj4KPiBGaXhlczogZDRkYTRlMzMzNDFjICgiZHJtOiBNZWFzdXJlIFNlbGYg
UmVmcmVzaCBFbnRyeS9FeGl0IHRpbWVzIHRvIGF2b2lkIHRocmFzaGluZyIpCj4gQ2M6IFNlYW4g
UGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFJvYiBDbGFyayA8
cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiAtLS0KPiBPdGhlciBwb3NzaWJpbGl0aWVzOgo+IDEp
IG1heWJlIGJsb2NrIGxhdGVyIGJlZm9yZSBmcmVlaW5nIGF0b21pYyBzdGF0ZT8KPiAyKSByZWZj
b3VudCBpbmRpdmlkdWFsIHBlci1vYmplY3Qgc3RhdGUKPgo+ICBkcml2ZXJzL2dwdS9kcm0vZHJt
X2F0b21pY19oZWxwZXIuYyB8IDYgKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9hdG9taWNfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYwo+
IGluZGV4IDNlZjJhYzUyY2U5NC4uYTVkOTU0MjlmOTFiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9h
dG9taWNfaGVscGVyLmMKPiBAQCAtMjcxMSw3ICsyNzExLDcgQEAgaW50IGRybV9hdG9taWNfaGVs
cGVyX3N3YXBfc3RhdGUoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAo+ICAJCQlpZiAo
IWNvbW1pdCkKPiAgCQkJCWNvbnRpbnVlOwo+ICAKPiAtCQkJcmV0ID0gd2FpdF9mb3JfY29tcGxl
dGlvbl9pbnRlcnJ1cHRpYmxlKCZjb21taXQtPmh3X2RvbmUpOwo+ICsJCQlyZXQgPSB3YWl0X2Zv
cl9jb21wbGV0aW9uX2ludGVycnVwdGlibGUoJmNvbW1pdC0+Y2xlYW51cF9kb25lKTsKPiAgCQkJ
aWYgKHJldCkKPiAgCQkJCXJldHVybiByZXQ7Cj4gIAkJfQo+IEBAIC0yNzIyLDcgKzI3MjIsNyBA
QCBpbnQgZHJtX2F0b21pY19oZWxwZXJfc3dhcF9zdGF0ZShzdHJ1Y3QgZHJtX2F0b21pY19zdGF0
ZSAqc3RhdGUsCj4gIAkJCWlmICghY29tbWl0KQo+ICAJCQkJY29udGludWU7Cj4gIAo+IC0JCQly
ZXQgPSB3YWl0X2Zvcl9jb21wbGV0aW9uX2ludGVycnVwdGlibGUoJmNvbW1pdC0+aHdfZG9uZSk7
Cj4gKwkJCXJldCA9IHdhaXRfZm9yX2NvbXBsZXRpb25faW50ZXJydXB0aWJsZSgmY29tbWl0LT5j
bGVhbnVwX2RvbmUpOwo+ICAJCQlpZiAocmV0KQo+ICAJCQkJcmV0dXJuIHJldDsKPiAgCQl9Cj4g
QEAgLTI3MzMsNyArMjczMyw3IEBAIGludCBkcm1fYXRvbWljX2hlbHBlcl9zd2FwX3N0YXRlKHN0
cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKPiAgCQkJaWYgKCFjb21taXQpCj4gIAkJCQlj
b250aW51ZTsKPiAgCj4gLQkJCXJldCA9IHdhaXRfZm9yX2NvbXBsZXRpb25faW50ZXJydXB0aWJs
ZSgmY29tbWl0LT5od19kb25lKTsKPiArCQkJcmV0ID0gd2FpdF9mb3JfY29tcGxldGlvbl9pbnRl
cnJ1cHRpYmxlKCZjb21taXQtPmNsZWFudXBfZG9uZSk7Cj4gIAkJCWlmIChyZXQpCj4gIAkJCQly
ZXR1cm4gcmV0Owo+ICAJCX0KCk5hY2ssIGh3X2RvbmUgbWVhbnMgYWxsIG5ld19jcnRjX3N0YXRl
IChmcm9tIHRoZSBvbGQgY29tbWl0IHBvdikgZGVyZWZlcmVuY2VzIGFyZSBkb25lLgoKU2VsZiBy
ZWZyZXNoIGhlbHBlcnMgc2hvdWxkIGJlIGZpeGVkLiA6KQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
