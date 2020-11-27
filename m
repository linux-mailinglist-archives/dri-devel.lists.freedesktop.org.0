Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ADC2C64E5
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:11:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4802F6ECA0;
	Fri, 27 Nov 2020 12:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD6F6EBFB;
 Fri, 27 Nov 2020 12:09:39 +0000 (UTC)
IronPort-SDR: 9RhXkcvnWPr4QugbeltZ8kmyQx6zy7hDGYE111CuyuuIqW+Iw72SYnElb9QqheldEvxqjHBlkv
 pNnei059xU+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540693"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540693"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:39 -0800
IronPort-SDR: r+zvFC/tNUCxwxQx6upK3GROUIOfd4bRzf/uHH76tw6005ErfkIzLfBTUa5YEBPmfVBLBp5yea
 COl9diITaoLg==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029024"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:37 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 072/162] drm/i915: Avoid some false positives in
 assert_object_held()
Date: Fri, 27 Nov 2020 12:05:48 +0000
Message-Id: <20201127120718.454037-73-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AaW50ZWwuY29tPgoKSW4g
YSB3dyB0cmFuc2FjdGlvbiB3aGVyZSB3ZSd2ZSBhbHJlYWR5IGxvY2tlZCBhIHJlc2VydmF0aW9u
Cm9iamVjdCwgYXNzZXJ0X29iamVjdF9oZWxkKCkgbWlnaHQgbm90IHRocm93IGEgc3BsYXQgZXZl
biBpZgp0aGUgb2JqZWN0IGlzIHVubG9ja2VkLiBJbXByb3ZlIG9uIHRoYXQgc2l0dWF0aW9uIGJ5
IGFzc2VydGluZwp0aGF0IHRoZSByZXNlcnZhdGlvbiBvYmplY3QncyB3dyBtdXRleCBpcyBpbmRl
ZWQgbG9ja2VkLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxs
c3Ryb21AaW50ZWwuY29tPgpDYzogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9vYmplY3QuaCB8IDkgKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX29iamVjdC5oIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX29iamVjdC5oCmluZGV4IGQwY2M2MmQx
YzY1ZS4uZDU2NjQzYjNiNTE4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0v
aTkxNV9nZW1fb2JqZWN0LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2Vt
X29iamVjdC5oCkBAIC0xMTcsNyArMTE3LDE0IEBAIGk5MTVfZ2VtX29iamVjdF9wdXQoc3RydWN0
IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iaikKIAlfX2RybV9nZW1fb2JqZWN0X3B1dCgmb2JqLT5i
YXNlKTsKIH0KIAotI2RlZmluZSBhc3NlcnRfb2JqZWN0X2hlbGQob2JqKSBkbWFfcmVzdl9hc3Nl
cnRfaGVsZCgob2JqKS0+YmFzZS5yZXN2KQorI2lmZGVmIENPTkZJR19MT0NLREVQCisjZGVmaW5l
IGFzc2VydF9vYmplY3RfaGVsZChvYmopIGRvIHsJCQkJCVwKKwkJZG1hX3Jlc3ZfYXNzZXJ0X2hl
bGQoKG9iaiktPmJhc2UucmVzdik7CQkJXAorCQlXQVJOX09OKCF3d19tdXRleF9pc19sb2NrZWQo
JihvYmopLT5iYXNlLnJlc3YtPmxvY2spKTsgXAorCX0gd2hpbGUgKDApCisjZWxzZQorI2RlZmlu
ZSBhc3NlcnRfb2JqZWN0X2hlbGQob2JqKSBkbyB7IH0gd2hpbGUgKDApCisjZW5kaWYKIAogI2Rl
ZmluZSBvYmplY3RfaXNfaXNvbGF0ZWQob2JqKQkJCQkJXAogCSghSVNfRU5BQkxFRChDT05GSUdf
TE9DS0RFUCkgfHwJCQkJXAotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
