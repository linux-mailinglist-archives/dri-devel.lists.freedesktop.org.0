Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F69B2C6455
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:08:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0AB36EC15;
	Fri, 27 Nov 2020 12:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BB06EC00;
 Fri, 27 Nov 2020 12:07:54 +0000 (UTC)
IronPort-SDR: ZOz5Qjy+uzWHhy0tmrYVtuZ1X77AbNtmD6Yg2ICMhvs/Sl3SajDhSdlmcyJCQd6UNj6Wq2Ai5g
 AmmTVsweUTJw==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883385"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883385"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:07:54 -0800
IronPort-SDR: fX1eMDxyStF0JqnVYOq02rJZNkq6mULfWJpuXb/wl40HEDfY3GKqSztE61Jchk6/wJ/+85Zwgh
 duobQkokmo2g==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028590"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:07:52 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 015/162] drm/i915: Add gem object locking to madvise.
Date: Fri, 27 Nov 2020 12:04:51 +0000
Message-Id: <20201127120718.454037-16-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bT4KCkRvZXNuJ3QgbmVlZCB0aGUgZnVsbCB3dyBsb2NrLCBvbmx5IGNoZWNraW5nIGlmIHBhZ2Vz
IGFyZSBib3VuZC4KClNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxh
bmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhl
bGxzdHJvbUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9n
ZW0uYyB8IDggKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dlbS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW0uYwppbmRleCA1ODI3NjY5NGM4NDguLmIwM2Uy
NDU2NDBjMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW0uYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dlbS5jCkBAIC0xMDUxLDEwICsxMDUxLDE0IEBA
IGk5MTVfZ2VtX21hZHZpc2VfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0
YSwKIAlpZiAoIW9iaikKIAkJcmV0dXJuIC1FTk9FTlQ7CiAKLQllcnIgPSBtdXRleF9sb2NrX2lu
dGVycnVwdGlibGUoJm9iai0+bW0ubG9jayk7CisJZXJyID0gaTkxNV9nZW1fb2JqZWN0X2xvY2tf
aW50ZXJydXB0aWJsZShvYmosIE5VTEwpOwogCWlmIChlcnIpCiAJCWdvdG8gb3V0OwogCisJZXJy
ID0gbXV0ZXhfbG9ja19pbnRlcnJ1cHRpYmxlKCZvYmotPm1tLmxvY2spOworCWlmIChlcnIpCisJ
CWdvdG8gb3V0X3d3OworCiAJaWYgKGk5MTVfZ2VtX29iamVjdF9oYXNfcGFnZXMob2JqKSAmJgog
CSAgICBpOTE1X2dlbV9vYmplY3RfaXNfdGlsZWQob2JqKSAmJgogCSAgICBpOTE1LT5xdWlya3Mg
JiBRVUlSS19QSU5fU1dJWlpMRURfUEFHRVMpIHsKQEAgLTEwOTksNiArMTEwMyw4IEBAIGk5MTVf
Z2VtX21hZHZpc2VfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAlh
cmdzLT5yZXRhaW5lZCA9IG9iai0+bW0ubWFkdiAhPSBfX0k5MTVfTUFEVl9QVVJHRUQ7CiAJbXV0
ZXhfdW5sb2NrKCZvYmotPm1tLmxvY2spOwogCitvdXRfd3c6CisJaTkxNV9nZW1fb2JqZWN0X3Vu
bG9jayhvYmopOwogb3V0OgogCWk5MTVfZ2VtX29iamVjdF9wdXQob2JqKTsKIAlyZXR1cm4gZXJy
OwotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
