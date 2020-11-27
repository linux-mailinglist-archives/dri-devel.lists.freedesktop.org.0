Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8DC2C6492
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:09:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1686EC5F;
	Fri, 27 Nov 2020 12:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F9A6EC5D;
 Fri, 27 Nov 2020 12:08:52 +0000 (UTC)
IronPort-SDR: ET4b/KvVvL1fEYb92QJrPDamDU14Ic3TS06BSRflM8Hl5T+gC8fZfX+SXvnnTcW8bYuUgW94Qb
 3KtY5Tr3DF5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540598"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540598"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:52 -0800
IronPort-SDR: sl7kiKWKkx+kggchG60db0x5wIBBJNnrA7J2tqCWDHpTNJ93g9i4MgZmwfehn78qlKAUNcWoDu
 2j1hOHAIEu0A==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028812"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:50 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 047/162] drm/i915: Add missing ww lock in
 intel_dsb_prepare.
Date: Fri, 27 Nov 2020 12:05:23 +0000
Message-Id: <20201127120718.454037-48-matthew.auld@intel.com>
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
bT4KCkJlY2F1c2Ugb2YgdGhlIGxvbmcgbGlmZXRpbWUgb2YgdGhlIG1hcHBpbmcsIHdlIGNhbm5v
dCB3cmFwIHRoaXMgaW4gYQpzaW1wbGUgbGltaXRlZCB3dyBsb2NrLiBKdXN0IHVzZSB0aGUgdW5s
b2NrZWQgdmVyc2lvbiBvZiBwaW5fbWFwLApiZWNhdXNlIHdlJ2xsIGxpa2VseSByZWxlYXNlIHRo
ZSBtYXBwaW5nIGEgbG90IGxhdGVyLCBpbiBhIGRpZmZlcmVudAp0aHJlYWQuCgpTaWduZWQtb2Zm
LWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29t
PgpDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHNiLmMgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RzYi5jIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kc2IuYwppbmRleCA1NjZmYTcyNDI3YjMuLjg1NzEyNjgy
MmE4OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kc2Iu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RzYi5jCkBAIC0yOTMs
NyArMjkzLDcgQEAgdm9pZCBpbnRlbF9kc2JfcHJlcGFyZShzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0
ZSAqY3J0Y19zdGF0ZSkKIAkJZ290byBvdXQ7CiAJfQogCi0JYnVmID0gaTkxNV9nZW1fb2JqZWN0
X3Bpbl9tYXAodm1hLT5vYmosIEk5MTVfTUFQX1dDKTsKKwlidWYgPSBpOTE1X2dlbV9vYmplY3Rf
cGluX21hcF91bmxvY2tlZCh2bWEtPm9iaiwgSTkxNV9NQVBfV0MpOwogCWlmIChJU19FUlIoYnVm
KSkgewogCQlkcm1fZXJyKCZpOTE1LT5kcm0sICJDb21tYW5kIGJ1ZmZlciBjcmVhdGlvbiBmYWls
ZWRcbiIpOwogCQlpOTE1X3ZtYV91bnBpbl9hbmRfcmVsZWFzZSgmdm1hLCBJOTE1X1ZNQV9SRUxF
QVNFX01BUCk7Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
