Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEB33463EC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:58:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DCF16EAAE;
	Tue, 23 Mar 2021 15:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D463E6EC01
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:57:42 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 47/70] drm/i915/selftests: Prepare mman testcases for
 obj->mm.lock removal.
Date: Tue, 23 Mar 2021 16:50:36 +0100
Message-Id: <20210323155059.628690-48-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
References: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW5zdXJlIHdlIGhvbGQgdGhlIGxvY2sgYXJvdW5kIHB1dF9wYWdlcywgYW5kIHVzZSB0aGUgdW5s
b2NrZWQgd3JhcHBlcnMKZm9yIHBpbm5pbmcgcGFnZXMgYW5kIG1hcHBpbmdzLgoKU2lnbmVkLW9m
Zi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bT4KUmV2aWV3ZWQtYnk6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4
LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vc2VsZnRlc3RzL2k5MTVf
Z2VtX21tYW4uYyB8IDEwICsrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2Vt
L3NlbGZ0ZXN0cy9pOTE1X2dlbV9tbWFuLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vc2Vs
ZnRlc3RzL2k5MTVfZ2VtX21tYW4uYwppbmRleCA0OWYxNzcwOGMxNDMuLjA5MGU3N2MyYTZkYyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL3NlbGZ0ZXN0cy9pOTE1X2dlbV9t
bWFuLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL3NlbGZ0ZXN0cy9pOTE1X2dlbV9t
bWFuLmMKQEAgLTMwNiw3ICszMDYsNyBAQCBzdGF0aWMgaW50IGlndF9wYXJ0aWFsX3RpbGluZyh2
b2lkICphcmcpCiAJaWYgKElTX0VSUihvYmopKQogCQlyZXR1cm4gUFRSX0VSUihvYmopOwogCi0J
ZXJyID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9wYWdlcyhvYmopOworCWVyciA9IGk5MTVfZ2VtX29i
amVjdF9waW5fcGFnZXNfdW5sb2NrZWQob2JqKTsKIAlpZiAoZXJyKSB7CiAJCXByX2VycigiRmFp
bGVkIHRvIGFsbG9jYXRlICV1IHBhZ2VzICglbHUgdG90YWwpLCBlcnI9JWRcbiIsCiAJCSAgICAg
ICBucmVhbCwgb2JqLT5iYXNlLnNpemUgLyBQQUdFX1NJWkUsIGVycik7CkBAIC00NDMsNyArNDQz
LDcgQEAgc3RhdGljIGludCBpZ3Rfc21va2VfdGlsaW5nKHZvaWQgKmFyZykKIAlpZiAoSVNfRVJS
KG9iaikpCiAJCXJldHVybiBQVFJfRVJSKG9iaik7CiAKLQllcnIgPSBpOTE1X2dlbV9vYmplY3Rf
cGluX3BhZ2VzKG9iaik7CisJZXJyID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9wYWdlc191bmxvY2tl
ZChvYmopOwogCWlmIChlcnIpIHsKIAkJcHJfZXJyKCJGYWlsZWQgdG8gYWxsb2NhdGUgJXUgcGFn
ZXMgKCVsdSB0b3RhbCksIGVycj0lZFxuIiwKIAkJICAgICAgIG5yZWFsLCBvYmotPmJhc2Uuc2l6
ZSAvIFBBR0VfU0laRSwgZXJyKTsKQEAgLTc4Miw3ICs3ODIsNyBAQCBzdGF0aWMgaW50IHdjX3Nl
dChzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqKQogewogCXZvaWQgKnZhZGRyOwogCi0J
dmFkZHIgPSBpOTE1X2dlbV9vYmplY3RfcGluX21hcChvYmosIEk5MTVfTUFQX1dDKTsKKwl2YWRk
ciA9IGk5MTVfZ2VtX29iamVjdF9waW5fbWFwX3VubG9ja2VkKG9iaiwgSTkxNV9NQVBfV0MpOwog
CWlmIChJU19FUlIodmFkZHIpKQogCQlyZXR1cm4gUFRSX0VSUih2YWRkcik7CiAKQEAgLTc5OCw3
ICs3OTgsNyBAQCBzdGF0aWMgaW50IHdjX2NoZWNrKHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0
ICpvYmopCiAJdm9pZCAqdmFkZHI7CiAJaW50IGVyciA9IDA7CiAKLQl2YWRkciA9IGk5MTVfZ2Vt
X29iamVjdF9waW5fbWFwKG9iaiwgSTkxNV9NQVBfV0MpOworCXZhZGRyID0gaTkxNV9nZW1fb2Jq
ZWN0X3Bpbl9tYXBfdW5sb2NrZWQob2JqLCBJOTE1X01BUF9XQyk7CiAJaWYgKElTX0VSUih2YWRk
cikpCiAJCXJldHVybiBQVFJfRVJSKHZhZGRyKTsKIApAQCAtMTMwMCw3ICsxMzAwLDkgQEAgc3Rh
dGljIGludCBfX2lndF9tbWFwX3Jldm9rZShzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSwK
IAl9CiAKIAlpZiAodHlwZSAhPSBJOTE1X01NQVBfVFlQRV9HVFQpIHsKKwkJaTkxNV9nZW1fb2Jq
ZWN0X2xvY2sob2JqLCBOVUxMKTsKIAkJX19pOTE1X2dlbV9vYmplY3RfcHV0X3BhZ2VzKG9iaik7
CisJCWk5MTVfZ2VtX29iamVjdF91bmxvY2sob2JqKTsKIAkJaWYgKGk5MTVfZ2VtX29iamVjdF9o
YXNfcGFnZXMob2JqKSkgewogCQkJcHJfZXJyKCJGYWlsZWQgdG8gcHV0LXBhZ2VzIG9iamVjdCFc
biIpOwogCQkJZXJyID0gLUVJTlZBTDsKLS0gCjIuMzEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
