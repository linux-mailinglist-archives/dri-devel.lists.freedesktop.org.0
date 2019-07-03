Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9000E5F374
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54276E215;
	Thu,  4 Jul 2019 07:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9726E15A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 15:55:45 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x63FthgM059864;
 Wed, 3 Jul 2019 10:55:43 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x63Fth5X001464
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 3 Jul 2019 10:55:43 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 3 Jul
 2019 10:55:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 3 Jul 2019 10:55:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x63FtgCD070098;
 Wed, 3 Jul 2019 10:55:42 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/8] drm/omap: use refcount API to track the number of users
 of dma_addr
Date: Wed, 3 Jul 2019 17:55:29 +0200
Message-ID: <20190703155536.28339-2-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190703155536.28339-1-jjhiblot@ti.com>
References: <20190703155536.28339-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562169343;
 bh=FDXhQB+IX+yaRuWT8oYBXYeiEGtOVWVlhq8apRNSxWM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Nmgz+tERtYe51ZWccWN0dWGgEkzvks1lwo7Vzg59JkXff5Bf9fjrx0oa0nk56xUxl
 uds9jbESH7T2mSNeVoPd0yospfDChWYOE1eVaBQZvr2rIwc+oHYm5C2Iiq/HEXbu8z
 je/MmDrMKooSc2a6pYci/GW0QNhMnJznLQGwH3WQ=
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
Cc: Jean-Jacques Hiblot <jjhiblot@ti.com>, jsarha@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyB3b3VsZCBnaXZlIHVzIGEgV0FSTl9PTigpIGlmIHRoZSBwaW4vdW5waW4gY2FsbHMgYXJl
IHVuYmFsYW5jZWQuCgpTaWduZWQtb2ZmLWJ5OiBKZWFuLUphY3F1ZXMgSGlibG90IDxqamhpYmxv
dEB0aS5jb20+Ci0tLQpkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jIHwgNDEgKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9u
cygrKSwgMjEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBk
cm0vb21hcF9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMKaW5kZXgg
MzczNzhkYmM1MGQwLi5lOGFhZmNmMGYyMDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9v
bWFwZHJtL29tYXBfZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0u
YwpAQCAtNjUsNyArNjUsNyBAQCBzdHJ1Y3Qgb21hcF9nZW1fb2JqZWN0IHsKIAkvKioKIAkgKiAj
IG9mIHVzZXJzIG9mIGRtYV9hZGRyCiAJICovCi0JdTMyIGRtYV9hZGRyX2NudDsKKwlyZWZjb3Vu
dF90IGRtYV9hZGRyX2NudDsKIAogCS8qKgogCSAqIElmIHRoZSBidWZmZXIgaGFzIGJlZW4gaW1w
b3J0ZWQgZnJvbSBhIGRtYWJ1ZiB0aGUgT01BUF9EQl9ETUFCVUYgZmxhZwpAQCAtNzcxLDcgKzc3
MSw3IEBAIGludCBvbWFwX2dlbV9waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIGRtYV9h
ZGRyX3QgKmRtYV9hZGRyKQogCW11dGV4X2xvY2soJm9tYXBfb2JqLT5sb2NrKTsKIAogCWlmICgh
b21hcF9nZW1faXNfY29udGlndW91cyhvbWFwX29iaikgJiYgcHJpdi0+aGFzX2RtbSkgewotCQlp
ZiAob21hcF9vYmotPmRtYV9hZGRyX2NudCA9PSAwKSB7CisJCWlmIChyZWZjb3VudF9yZWFkKCZv
bWFwX29iai0+ZG1hX2FkZHJfY250KSA9PSAwKSB7CiAJCQl1MzIgbnBhZ2VzID0gb2JqLT5zaXpl
ID4+IFBBR0VfU0hJRlQ7CiAJCQllbnVtIHRpbGVyX2ZtdCBmbXQgPSBnZW0yZm10KG9tYXBfb2Jq
LT5mbGFncyk7CiAJCQlzdHJ1Y3QgdGlsZXJfYmxvY2sgKmJsb2NrOwpAQCAtODEzLDcgKzgxMyw3
IEBAIGludCBvbWFwX2dlbV9waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIGRtYV9hZGRy
X3QgKmRtYV9hZGRyKQogCQkJREJHKCJnb3QgZG1hIGFkZHJlc3M6ICVwYWQiLCAmb21hcF9vYmot
PmRtYV9hZGRyKTsKIAkJfQogCi0JCW9tYXBfb2JqLT5kbWFfYWRkcl9jbnQrKzsKKwkJcmVmY291
bnRfaW5jKCZvbWFwX29iai0+ZG1hX2FkZHJfY250KTsKIAogCQkqZG1hX2FkZHIgPSBvbWFwX29i
ai0+ZG1hX2FkZHI7CiAJfSBlbHNlIGlmIChvbWFwX2dlbV9pc19jb250aWd1b3VzKG9tYXBfb2Jq
KSkgewpAQCAtODQ0LDIzICs4NDQsMjEgQEAgdm9pZCBvbWFwX2dlbV91bnBpbihzdHJ1Y3QgZHJt
X2dlbV9vYmplY3QgKm9iaikKIAogCW11dGV4X2xvY2soJm9tYXBfb2JqLT5sb2NrKTsKIAotCWlm
IChvbWFwX29iai0+ZG1hX2FkZHJfY250ID4gMCkgewotCQlvbWFwX29iai0+ZG1hX2FkZHJfY250
LS07Ci0JCWlmIChvbWFwX29iai0+ZG1hX2FkZHJfY250ID09IDApIHsKLQkJCXJldCA9IHRpbGVy
X3VucGluKG9tYXBfb2JqLT5ibG9jayk7Ci0JCQlpZiAocmV0KSB7Ci0JCQkJZGV2X2VycihvYmot
PmRldi0+ZGV2LAotCQkJCQkiY291bGQgbm90IHVucGluIHBhZ2VzOiAlZFxuIiwgcmV0KTsKLQkJ
CX0KLQkJCXJldCA9IHRpbGVyX3JlbGVhc2Uob21hcF9vYmotPmJsb2NrKTsKLQkJCWlmIChyZXQp
IHsKLQkJCQlkZXZfZXJyKG9iai0+ZGV2LT5kZXYsCi0JCQkJCSJjb3VsZCBub3QgcmVsZWFzZSB1
bm1hcDogJWRcbiIsIHJldCk7Ci0JCQl9Ci0JCQlvbWFwX29iai0+ZG1hX2FkZHIgPSAwOwotCQkJ
b21hcF9vYmotPmJsb2NrID0gTlVMTDsKKwlpZiAocmVmY291bnRfZGVjX2FuZF90ZXN0KCZvbWFw
X29iai0+ZG1hX2FkZHJfY250KSkgeworCQlyZXQgPSB0aWxlcl91bnBpbihvbWFwX29iai0+Ymxv
Y2spOworCQlpZiAocmV0KSB7CisJCQlkZXZfZXJyKG9iai0+ZGV2LT5kZXYsCisJCQkJImNvdWxk
IG5vdCB1bnBpbiBwYWdlczogJWRcbiIsIHJldCk7CiAJCX0KKwkJcmV0ID0gdGlsZXJfcmVsZWFz
ZShvbWFwX29iai0+YmxvY2spOworCQlpZiAocmV0KSB7CisJCQlkZXZfZXJyKG9iai0+ZGV2LT5k
ZXYsCisJCQkJImNvdWxkIG5vdCByZWxlYXNlIHVubWFwOiAlZFxuIiwgcmV0KTsKKwkJfQorCQlv
bWFwX29iai0+ZG1hX2FkZHIgPSAwOworCQlvbWFwX29iai0+YmxvY2sgPSBOVUxMOwogCX0KK30K
IAogCW11dGV4X3VubG9jaygmb21hcF9vYmotPmxvY2spOwogfQpAQCAtODc3LDcgKzg3NSw3IEBA
IGludCBvbWFwX2dlbV9yb3RhdGVkX2RtYV9hZGRyKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2Jq
LCB1MzIgb3JpZW50LAogCiAJbXV0ZXhfbG9jaygmb21hcF9vYmotPmxvY2spOwogCi0JaWYgKChv
bWFwX29iai0+ZG1hX2FkZHJfY250ID4gMCkgJiYgb21hcF9vYmotPmJsb2NrICYmCisJaWYgKChy
ZWZjb3VudF9yZWFkKCZvbWFwX29iai0+ZG1hX2FkZHJfY250KSA+IDApICYmIG9tYXBfb2JqLT5i
bG9jayAmJgogCQkJKG9tYXBfb2JqLT5mbGFncyAmIE9NQVBfQk9fVElMRUQpKSB7CiAJCSpkbWFf
YWRkciA9IHRpbGVyX3RzcHRyKG9tYXBfb2JqLT5ibG9jaywgb3JpZW50LCB4LCB5KTsKIAkJcmV0
ID0gMDsKQEAgLTEwMjgsNyArMTAyNiw4IEBAIHZvaWQgb21hcF9nZW1fZGVzY3JpYmUoc3RydWN0
IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVjdCBzZXFfZmlsZSAqbSkKIAogCXNlcV9wcmludGYo
bSwgIiUwOHg6ICUyZCAoJTJkKSAlMDhsbHggJXBhZCAoJTJkKSAlcCAlNGQiLAogCQkJb21hcF9v
YmotPmZsYWdzLCBvYmotPm5hbWUsIGtyZWZfcmVhZCgmb2JqLT5yZWZjb3VudCksCi0JCQlvZmYs
ICZvbWFwX29iai0+ZG1hX2FkZHIsIG9tYXBfb2JqLT5kbWFfYWRkcl9jbnQsCisJCQlvZmYsICZv
bWFwX29iai0+ZG1hX2FkZHIsCisJCQlyZWZjb3VudF9yZWFkKCZvbWFwX29iai0+ZG1hX2FkZHJf
Y250KSwKIAkJCW9tYXBfb2JqLT52YWRkciwgb21hcF9vYmotPnJvbGwpOwogCiAJaWYgKG9tYXBf
b2JqLT5mbGFncyAmIE9NQVBfQk9fVElMRUQpIHsKQEAgLTEwOTEsNyArMTA5MCw3IEBAIHZvaWQg
b21hcF9nZW1fZnJlZV9vYmplY3Qoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCiAJbXV0ZXhf
bG9jaygmb21hcF9vYmotPmxvY2spOwogCiAJLyogVGhlIG9iamVjdCBzaG91bGQgbm90IGJlIHBp
bm5lZC4gKi8KLQlXQVJOX09OKG9tYXBfb2JqLT5kbWFfYWRkcl9jbnQgPiAwKTsKKwlXQVJOX09O
KHJlZmNvdW50X3JlYWQoJm9tYXBfb2JqLT5kbWFfYWRkcl9jbnQpID4gMCk7CiAKIAlpZiAob21h
cF9vYmotPnBhZ2VzKSB7CiAJCWlmIChvbWFwX29iai0+ZmxhZ3MgJiBPTUFQX0JPX01FTV9ETUFC
VUYpCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
