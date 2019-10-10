Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 942A1D2678
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 11:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23856EACB;
	Thu, 10 Oct 2019 09:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012676EADC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 09:35:09 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9A9Z8DO120175;
 Thu, 10 Oct 2019 04:35:08 -0500
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9A9Z8Xx078244;
 Thu, 10 Oct 2019 04:35:08 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 04:35:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 04:35:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9A9Z7mE129732;
 Thu, 10 Oct 2019 04:35:07 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v4 1/8] drm/omap: use refcount API to track the number of
 users of dma_addr
Date: Thu, 10 Oct 2019 11:34:38 +0200
Message-ID: <20191010093445.11069-2-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191010093445.11069-1-jjhiblot@ti.com>
References: <20191010093445.11069-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570700108;
 bh=KR5pkS+KoVxYTwDWijwKq2wHnwQrS1xEv8tW6bZXxxU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=m+DavBrbC+ynElQN7rBJIPoNeMbsv2zNT9/lA49d+Tot5mh/V9LCQESD3+4WXuBJq
 EGj7FniirJCYugRR5nVAXg0e0kzeBKkuw1UT2zxZHkIL3YSzUm+UtWiesoMh86sOFK
 v5ICegdcMX2Nni+azIvXm2uRgmn5qGBsOs/ufpsI=
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
Cc: Jean-Jacques Hiblot <jjhiblot@ti.com>, jsarha@ti.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyB3b3VsZCBnaXZlIHVzIGEgV0FSTl9PTigpIGlmIHRoZSBwaW4vdW5waW4gY2FsbHMgYXJl
IHVuYmFsYW5jZWQuCgpQcm9wb3NlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5j
aGFydEBpZGVhc29uYm9hcmQuY29tPgpTaWduZWQtb2ZmLWJ5OiBKZWFuLUphY3F1ZXMgSGlibG90
IDxqamhpYmxvdEB0aS5jb20+ClJldmlld2VkLWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxr
ZWluZW5AdGkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMgfCA0
NCArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNl
cnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
b21hcGRybS9vbWFwX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYwpp
bmRleCAzNzM3OGRiYzUwZDAuLjVjOTdmZjgxMGI1ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL29tYXBkcm0vb21hcF9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFw
X2dlbS5jCkBAIC02NSw3ICs2NSw3IEBAIHN0cnVjdCBvbWFwX2dlbV9vYmplY3QgewogCS8qKgog
CSAqICMgb2YgdXNlcnMgb2YgZG1hX2FkZHIKIAkgKi8KLQl1MzIgZG1hX2FkZHJfY250OworCXJl
ZmNvdW50X3QgZG1hX2FkZHJfY250OwogCiAJLyoqCiAJICogSWYgdGhlIGJ1ZmZlciBoYXMgYmVl
biBpbXBvcnRlZCBmcm9tIGEgZG1hYnVmIHRoZSBPTUFQX0RCX0RNQUJVRiBmbGFnCkBAIC03NzEs
MTMgKzc3MSwxNSBAQCBpbnQgb21hcF9nZW1fcGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2Jq
LCBkbWFfYWRkcl90ICpkbWFfYWRkcikKIAltdXRleF9sb2NrKCZvbWFwX29iai0+bG9jayk7CiAK
IAlpZiAoIW9tYXBfZ2VtX2lzX2NvbnRpZ3VvdXMob21hcF9vYmopICYmIHByaXYtPmhhc19kbW0p
IHsKLQkJaWYgKG9tYXBfb2JqLT5kbWFfYWRkcl9jbnQgPT0gMCkgeworCQlpZiAocmVmY291bnRf
cmVhZCgmb21hcF9vYmotPmRtYV9hZGRyX2NudCkgPT0gMCkgewogCQkJdTMyIG5wYWdlcyA9IG9i
ai0+c2l6ZSA+PiBQQUdFX1NISUZUOwogCQkJZW51bSB0aWxlcl9mbXQgZm10ID0gZ2VtMmZtdChv
bWFwX29iai0+ZmxhZ3MpOwogCQkJc3RydWN0IHRpbGVyX2Jsb2NrICpibG9jazsKIAogCQkJQlVH
X09OKG9tYXBfb2JqLT5ibG9jayk7CiAKKwkJCXJlZmNvdW50X3NldCgmb21hcF9vYmotPmRtYV9h
ZGRyX2NudCwgMSk7CisKIAkJCXJldCA9IG9tYXBfZ2VtX2F0dGFjaF9wYWdlcyhvYmopOwogCQkJ
aWYgKHJldCkKIAkJCQlnb3RvIGZhaWw7CkBAIC04MTEsMTAgKzgxMywxMCBAQCBpbnQgb21hcF9n
ZW1fcGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBkbWFfYWRkcl90ICpkbWFfYWRkcikK
IAkJCW9tYXBfb2JqLT5ibG9jayA9IGJsb2NrOwogCiAJCQlEQkcoImdvdCBkbWEgYWRkcmVzczog
JXBhZCIsICZvbWFwX29iai0+ZG1hX2FkZHIpOworCQl9IGVsc2UgeworCQkJcmVmY291bnRfaW5j
KCZvbWFwX29iai0+ZG1hX2FkZHJfY250KTsKIAkJfQogCi0JCW9tYXBfb2JqLT5kbWFfYWRkcl9j
bnQrKzsKLQogCQkqZG1hX2FkZHIgPSBvbWFwX29iai0+ZG1hX2FkZHI7CiAJfSBlbHNlIGlmIChv
bWFwX2dlbV9pc19jb250aWd1b3VzKG9tYXBfb2JqKSkgewogCQkqZG1hX2FkZHIgPSBvbWFwX29i
ai0+ZG1hX2FkZHI7CkBAIC04NDQsMjIgKzg0NiwxOSBAQCB2b2lkIG9tYXBfZ2VtX3VucGluKHN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQogCiAJbXV0ZXhfbG9jaygmb21hcF9vYmotPmxvY2sp
OwogCi0JaWYgKG9tYXBfb2JqLT5kbWFfYWRkcl9jbnQgPiAwKSB7Ci0JCW9tYXBfb2JqLT5kbWFf
YWRkcl9jbnQtLTsKLQkJaWYgKG9tYXBfb2JqLT5kbWFfYWRkcl9jbnQgPT0gMCkgewotCQkJcmV0
ID0gdGlsZXJfdW5waW4ob21hcF9vYmotPmJsb2NrKTsKLQkJCWlmIChyZXQpIHsKLQkJCQlkZXZf
ZXJyKG9iai0+ZGV2LT5kZXYsCi0JCQkJCSJjb3VsZCBub3QgdW5waW4gcGFnZXM6ICVkXG4iLCBy
ZXQpOwotCQkJfQotCQkJcmV0ID0gdGlsZXJfcmVsZWFzZShvbWFwX29iai0+YmxvY2spOwotCQkJ
aWYgKHJldCkgewotCQkJCWRldl9lcnIob2JqLT5kZXYtPmRldiwKLQkJCQkJImNvdWxkIG5vdCBy
ZWxlYXNlIHVubWFwOiAlZFxuIiwgcmV0KTsKLQkJCX0KLQkJCW9tYXBfb2JqLT5kbWFfYWRkciA9
IDA7Ci0JCQlvbWFwX29iai0+YmxvY2sgPSBOVUxMOworCWlmIChyZWZjb3VudF9kZWNfYW5kX3Rl
c3QoJm9tYXBfb2JqLT5kbWFfYWRkcl9jbnQpKSB7CisJCXJldCA9IHRpbGVyX3VucGluKG9tYXBf
b2JqLT5ibG9jayk7CisJCWlmIChyZXQpIHsKKwkJCWRldl9lcnIob2JqLT5kZXYtPmRldiwKKwkJ
CQkiY291bGQgbm90IHVucGluIHBhZ2VzOiAlZFxuIiwgcmV0KTsKKwkJfQorCQlyZXQgPSB0aWxl
cl9yZWxlYXNlKG9tYXBfb2JqLT5ibG9jayk7CisJCWlmIChyZXQpIHsKKwkJCWRldl9lcnIob2Jq
LT5kZXYtPmRldiwKKwkJCQkiY291bGQgbm90IHJlbGVhc2UgdW5tYXA6ICVkXG4iLCByZXQpOwog
CQl9CisJCW9tYXBfb2JqLT5kbWFfYWRkciA9IDA7CisJCW9tYXBfb2JqLT5ibG9jayA9IE5VTEw7
CiAJfQogCiAJbXV0ZXhfdW5sb2NrKCZvbWFwX29iai0+bG9jayk7CkBAIC04NzcsNyArODc2LDcg
QEAgaW50IG9tYXBfZ2VtX3JvdGF0ZWRfZG1hX2FkZHIoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpv
YmosIHUzMiBvcmllbnQsCiAKIAltdXRleF9sb2NrKCZvbWFwX29iai0+bG9jayk7CiAKLQlpZiAo
KG9tYXBfb2JqLT5kbWFfYWRkcl9jbnQgPiAwKSAmJiBvbWFwX29iai0+YmxvY2sgJiYKKwlpZiAo
KHJlZmNvdW50X3JlYWQoJm9tYXBfb2JqLT5kbWFfYWRkcl9jbnQpID4gMCkgJiYgb21hcF9vYmot
PmJsb2NrICYmCiAJCQkob21hcF9vYmotPmZsYWdzICYgT01BUF9CT19USUxFRCkpIHsKIAkJKmRt
YV9hZGRyID0gdGlsZXJfdHNwdHIob21hcF9vYmotPmJsb2NrLCBvcmllbnQsIHgsIHkpOwogCQly
ZXQgPSAwOwpAQCAtMTAyOCw3ICsxMDI3LDggQEAgdm9pZCBvbWFwX2dlbV9kZXNjcmliZShzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IHNlcV9maWxlICptKQogCiAJc2VxX3ByaW50
ZihtLCAiJTA4eDogJTJkICglMmQpICUwOGxseCAlcGFkICglMmQpICVwICU0ZCIsCiAJCQlvbWFw
X29iai0+ZmxhZ3MsIG9iai0+bmFtZSwga3JlZl9yZWFkKCZvYmotPnJlZmNvdW50KSwKLQkJCW9m
ZiwgJm9tYXBfb2JqLT5kbWFfYWRkciwgb21hcF9vYmotPmRtYV9hZGRyX2NudCwKKwkJCW9mZiwg
Jm9tYXBfb2JqLT5kbWFfYWRkciwKKwkJCXJlZmNvdW50X3JlYWQoJm9tYXBfb2JqLT5kbWFfYWRk
cl9jbnQpLAogCQkJb21hcF9vYmotPnZhZGRyLCBvbWFwX29iai0+cm9sbCk7CiAKIAlpZiAob21h
cF9vYmotPmZsYWdzICYgT01BUF9CT19USUxFRCkgewpAQCAtMTA5MSw3ICsxMDkxLDcgQEAgdm9p
ZCBvbWFwX2dlbV9mcmVlX29iamVjdChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKIAltdXRl
eF9sb2NrKCZvbWFwX29iai0+bG9jayk7CiAKIAkvKiBUaGUgb2JqZWN0IHNob3VsZCBub3QgYmUg
cGlubmVkLiAqLwotCVdBUk5fT04ob21hcF9vYmotPmRtYV9hZGRyX2NudCA+IDApOworCVdBUk5f
T04ocmVmY291bnRfcmVhZCgmb21hcF9vYmotPmRtYV9hZGRyX2NudCkgPiAwKTsKIAogCWlmIChv
bWFwX29iai0+cGFnZXMpIHsKIAkJaWYgKG9tYXBfb2JqLT5mbGFncyAmIE9NQVBfQk9fTUVNX0RN
QUJVRikKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
