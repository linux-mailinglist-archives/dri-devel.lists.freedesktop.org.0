Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FDF2C649D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:10:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668C36EC69;
	Fri, 27 Nov 2020 12:09:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750C76EC4E;
 Fri, 27 Nov 2020 12:08:50 +0000 (UTC)
IronPort-SDR: Y13asHRVOiVHIAMgSQOcpBOPi1f6UiAhzlSsfFQGxOWh8m6PHIiLV0lDDE0z/Mu0YmPd6wf5v+
 EKL/UJYWbZ3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540595"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540595"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:50 -0800
IronPort-SDR: PSqThH20HN4tAK1lizaIpVxbdTC7SJd6++s6NnYQz/+4z1wg4JYMTqskJgEbvz3Xh6V1W4zyiR
 v0o/pEpJsd5w==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028803"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:48 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 046/162] drm/i915: Add ww locking to dma-buf ops.
Date: Fri, 27 Nov 2020 12:05:22 +0000
Message-Id: <20201127120718.454037-47-matthew.auld@intel.com>
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
bT4KCnZtYXAgaXMgdXNpbmcgcGluX3BhZ2VzLCBidXQgbmVlZHMgdG8gdXNlIHd3IGxvY2tpbmcs
CmFkZCBwaW5fcGFnZXNfdW5sb2NrZWQgdG8gY29ycmVjdGx5IGxvY2sgdGhlIG1hcHBpbmcuCgpB
bHNvIGFkZCB3dyBsb2NraW5nIHRvIGJlZ2luL2VuZCBjcHUgYWNjZXNzLgoKU2lnbmVkLW9mZi1i
eTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4K
Q2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZG1hYnVmLmMgfCA2MCArKysr
KysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMjcg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVf
Z2VtX2RtYWJ1Zi5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2RtYWJ1Zi5j
CmluZGV4IDM2ZTNjMjc2NWY0Yy4uYzRiMDFlODE5Nzg2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZG1hYnVmLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ2VtL2k5MTVfZ2VtX2RtYWJ1Zi5jCkBAIC04Miw3ICs4Miw3IEBAIHN0YXRpYyBpbnQgaTkx
NV9nZW1fZG1hYnVmX3ZtYXAoc3RydWN0IGRtYV9idWYgKmRtYV9idWYsIHN0cnVjdCBkbWFfYnVm
X21hcCAqbWFwCiAJc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iaiA9IGRtYV9idWZfdG9f
b2JqKGRtYV9idWYpOwogCXZvaWQgKnZhZGRyOwogCi0JdmFkZHIgPSBpOTE1X2dlbV9vYmplY3Rf
cGluX21hcChvYmosIEk5MTVfTUFQX1dCKTsKKwl2YWRkciA9IGk5MTVfZ2VtX29iamVjdF9waW5f
bWFwX3VubG9ja2VkKG9iaiwgSTkxNV9NQVBfV0IpOwogCWlmIChJU19FUlIodmFkZHIpKQogCQly
ZXR1cm4gUFRSX0VSUih2YWRkcik7CiAKQEAgLTEyMyw0MiArMTIzLDQ4IEBAIHN0YXRpYyBpbnQg
aTkxNV9nZW1fYmVnaW5fY3B1X2FjY2VzcyhzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZiwgZW51bSBk
bWFfZGF0YV9kaXJlCiB7CiAJc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iaiA9IGRtYV9i
dWZfdG9fb2JqKGRtYV9idWYpOwogCWJvb2wgd3JpdGUgPSAoZGlyZWN0aW9uID09IERNQV9CSURJ
UkVDVElPTkFMIHx8IGRpcmVjdGlvbiA9PSBETUFfVE9fREVWSUNFKTsKKwlzdHJ1Y3QgaTkxNV9n
ZW1fd3dfY3R4IHd3OwogCWludCBlcnI7CiAKLQllcnIgPSBpOTE1X2dlbV9vYmplY3RfcGluX3Bh
Z2VzKG9iaik7Ci0JaWYgKGVycikKLQkJcmV0dXJuIGVycjsKLQotCWVyciA9IGk5MTVfZ2VtX29i
amVjdF9sb2NrX2ludGVycnVwdGlibGUob2JqLCBOVUxMKTsKLQlpZiAoZXJyKQotCQlnb3RvIG91
dDsKLQotCWVyciA9IGk5MTVfZ2VtX29iamVjdF9zZXRfdG9fY3B1X2RvbWFpbihvYmosIHdyaXRl
KTsKLQlpOTE1X2dlbV9vYmplY3RfdW5sb2NrKG9iaik7Ci0KLW91dDoKLQlpOTE1X2dlbV9vYmpl
Y3RfdW5waW5fcGFnZXMob2JqKTsKKwlpOTE1X2dlbV93d19jdHhfaW5pdCgmd3csIHRydWUpOwor
cmV0cnk6CisJZXJyID0gaTkxNV9nZW1fb2JqZWN0X2xvY2sob2JqLCAmd3cpOworCWlmICghZXJy
KQorCQllcnIgPSBpOTE1X2dlbV9vYmplY3RfcGluX3BhZ2VzKG9iaik7CisJaWYgKCFlcnIpIHsK
KwkJZXJyID0gaTkxNV9nZW1fb2JqZWN0X3NldF90b19jcHVfZG9tYWluKG9iaiwgd3JpdGUpOwor
CQlpOTE1X2dlbV9vYmplY3RfdW5waW5fcGFnZXMob2JqKTsKKwl9CisJaWYgKGVyciA9PSAtRURF
QURMSykgeworCQllcnIgPSBpOTE1X2dlbV93d19jdHhfYmFja29mZigmd3cpOworCQlpZiAoIWVy
cikKKwkJCWdvdG8gcmV0cnk7CisJfQorCWk5MTVfZ2VtX3d3X2N0eF9maW5pKCZ3dyk7CiAJcmV0
dXJuIGVycjsKIH0KIAogc3RhdGljIGludCBpOTE1X2dlbV9lbmRfY3B1X2FjY2VzcyhzdHJ1Y3Qg
ZG1hX2J1ZiAqZG1hX2J1ZiwgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyZWN0aW9uKQogewog
CXN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmogPSBkbWFfYnVmX3RvX29iaihkbWFfYnVm
KTsKKwlzdHJ1Y3QgaTkxNV9nZW1fd3dfY3R4IHd3OwogCWludCBlcnI7CiAKLQllcnIgPSBpOTE1
X2dlbV9vYmplY3RfcGluX3BhZ2VzKG9iaik7Ci0JaWYgKGVycikKLQkJcmV0dXJuIGVycjsKLQot
CWVyciA9IGk5MTVfZ2VtX29iamVjdF9sb2NrX2ludGVycnVwdGlibGUob2JqLCBOVUxMKTsKLQlp
ZiAoZXJyKQotCQlnb3RvIG91dDsKLQotCWVyciA9IGk5MTVfZ2VtX29iamVjdF9zZXRfdG9fZ3R0
X2RvbWFpbihvYmosIGZhbHNlKTsKLQlpOTE1X2dlbV9vYmplY3RfdW5sb2NrKG9iaik7Ci0KLW91
dDoKLQlpOTE1X2dlbV9vYmplY3RfdW5waW5fcGFnZXMob2JqKTsKKwlpOTE1X2dlbV93d19jdHhf
aW5pdCgmd3csIHRydWUpOworcmV0cnk6CisJZXJyID0gaTkxNV9nZW1fb2JqZWN0X2xvY2sob2Jq
LCAmd3cpOworCWlmICghZXJyKQorCQllcnIgPSBpOTE1X2dlbV9vYmplY3RfcGluX3BhZ2VzKG9i
aik7CisJaWYgKCFlcnIpIHsKKwkJZXJyID0gaTkxNV9nZW1fb2JqZWN0X3NldF90b19ndHRfZG9t
YWluKG9iaiwgZmFsc2UpOworCQlpOTE1X2dlbV9vYmplY3RfdW5waW5fcGFnZXMob2JqKTsKKwl9
CisJaWYgKGVyciA9PSAtRURFQURMSykgeworCQllcnIgPSBpOTE1X2dlbV93d19jdHhfYmFja29m
Zigmd3cpOworCQlpZiAoIWVycikKKwkJCWdvdG8gcmV0cnk7CisJfQorCWk5MTVfZ2VtX3d3X2N0
eF9maW5pKCZ3dyk7CiAJcmV0dXJuIGVycjsKIH0KIAotLSAKMi4yNi4yCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
