Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A07E26881F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 13:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D973B8999E;
	Mon, 15 Jul 2019 11:24:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA9A8921A;
 Mon, 15 Jul 2019 11:24:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jul 2019 04:24:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,493,1557212400"; d="scan'208";a="161054930"
Received: from ovasilev-desk1.fi.intel.com ([10.237.72.57])
 by orsmga008.jf.intel.com with ESMTP; 15 Jul 2019 04:24:18 -0700
From: Oleg Vasilev <oleg.vasilev@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/6] drm/i915: utilize subconnector property for DP
Date: Mon, 15 Jul 2019 14:23:32 +0300
Message-Id: <20190715112408.20114-5-oleg.vasilev@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715112408.20114-1-oleg.vasilev@intel.com>
References: <20190701080022.9415-1-oleg.vasilev@intel.com>
 <20190715112408.20114-1-oleg.vasilev@intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2UgRFAtc3BlY2lmaWMgaW5mb3JtYXRpb24gaXMgc3RvcmVkIGluIGRyaXZlcidzIHN0cnVj
dHVyZXMsIGV2ZXJ5CmRyaXZlciBuZWVkcyB0byBpbXBsZW1lbnQgc3ViY29ubmVjdG9yIHByb3Bl
cnR5IGJ5IGl0c2VsZi4KClNpZ25lZC1vZmYtYnk6IE9sZWcgVmFzaWxldiA8b2xlZy52YXNpbGV2
QGludGVsLmNvbT4KQ2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKCnYyOiB1cGRh
dGVzIHRvIG1hdGNoIHByZXZpb3VzIGNvbW1pdCBjaGFuZ2VzClNpZ25lZC1vZmYtYnk6IE9sZWcg
VmFzaWxldiA8b2xlZy52YXNpbGV2QGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2RwLmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwppbmRleCBiOGY4
ZjQwYjRmM2QuLmM1YjRlMzNiZTM1NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHAuYwpAQCAtNTQyMSw2ICs1NDIxLDEwIEBAIGludGVsX2RwX2RldGVjdChzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yLAogCWlmIChzdGF0dXMgIT0gY29ubmVjdG9yX3N0YXR1c19j
b25uZWN0ZWQgJiYgIWludGVsX2RwLT5pc19tc3QpCiAJCWludGVsX2RwX3Vuc2V0X2VkaWQoaW50
ZWxfZHApOwogCisJZHJtX2RwX3NldF9zdWJjb25uZWN0b3JfcHJvcGVydHkoY29ubmVjdG9yLAor
CQkJCQkgc3RhdHVzLAorCQkJCQkgaW50ZWxfZHAtPmRwY2QsCisJCQkJCSBpbnRlbF9kcC0+ZG93
bnN0cmVhbV9wb3J0cyk7CiAJcmV0dXJuIHN0YXR1czsKIH0KIApAQCAtNjMxNyw2ICs2MzIxLDgg
QEAgaW50ZWxfZHBfYWRkX3Byb3BlcnRpZXMoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCwgc3Ry
dWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3QKIAlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2
X3ByaXYgPSB0b19pOTE1KGNvbm5lY3Rvci0+ZGV2KTsKIAllbnVtIHBvcnQgcG9ydCA9IGRwX3Rv
X2RpZ19wb3J0KGludGVsX2RwKS0+YmFzZS5wb3J0OwogCisJZHJtX21vZGVfYWRkX2RwX3N1YmNv
bm5lY3Rvcl9wcm9wZXJ0eShjb25uZWN0b3IpOworCiAJaWYgKCFJU19HNFgoZGV2X3ByaXYpICYm
IHBvcnQgIT0gUE9SVF9BKQogCQlpbnRlbF9hdHRhY2hfZm9yY2VfYXVkaW9fcHJvcGVydHkoY29u
bmVjdG9yKTsKIAotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
