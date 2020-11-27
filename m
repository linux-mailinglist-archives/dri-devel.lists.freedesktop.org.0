Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C1A2C64B6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:10:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8946EC7E;
	Fri, 27 Nov 2020 12:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E306EC79;
 Fri, 27 Nov 2020 12:09:15 +0000 (UTC)
IronPort-SDR: lfLkQlPaAEmJVPanR7aiJLbC9fxwCNvooSj6EaPcqSUihUBHDmqFCCju4YSYlBrFRnJLRiJ02M
 dv9EcMTfn1qA==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540637"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540637"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:12 -0800
IronPort-SDR: JqgxBT9kkG2shgOdjnGMqzVFfbI/i97a9uUov1ADnZzP3r6QDH8xjNALhchNWSag+eJ5DhGHbY
 pXL2NdryfYhw==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028900"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:10 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 057/162] drm/i915/selftests: Prepare object tests for
 obj->mm.lock removal.
Date: Fri, 27 Nov 2020 12:05:33 +0000
Message-Id: <20201127120718.454037-58-matthew.auld@intel.com>
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
bT4KCkNvbnZlcnQgYSBzaW5nbGUgcGluX3BhZ2VzIGNhbGwgdG8gdXNlIHRoZSB1bmxvY2tlZCB2
ZXJzaW9uLgoKU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hv
cnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0
cm9tQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vc2VsZnRl
c3RzL2k5MTVfZ2VtX29iamVjdC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2Vt
L3NlbGZ0ZXN0cy9pOTE1X2dlbV9vYmplY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9z
ZWxmdGVzdHMvaTkxNV9nZW1fb2JqZWN0LmMKaW5kZXggYmY4NTNjNDBlYzY1Li43NDBlZTgwODZh
MjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMvaTkxNV9n
ZW1fb2JqZWN0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL3NlbGZ0ZXN0cy9pOTE1
X2dlbV9vYmplY3QuYwpAQCAtNDcsNyArNDcsNyBAQCBzdGF0aWMgaW50IGlndF9nZW1faHVnZSh2
b2lkICphcmcpCiAJaWYgKElTX0VSUihvYmopKQogCQlyZXR1cm4gUFRSX0VSUihvYmopOwogCi0J
ZXJyID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9wYWdlcyhvYmopOworCWVyciA9IGk5MTVfZ2VtX29i
amVjdF9waW5fcGFnZXNfdW5sb2NrZWQob2JqKTsKIAlpZiAoZXJyKSB7CiAJCXByX2VycigiRmFp
bGVkIHRvIGFsbG9jYXRlICV1IHBhZ2VzICglbHUgdG90YWwpLCBlcnI9JWRcbiIsCiAJCSAgICAg
ICBucmVhbCwgb2JqLT5iYXNlLnNpemUgLyBQQUdFX1NJWkUsIGVycik7Ci0tIAoyLjI2LjIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
