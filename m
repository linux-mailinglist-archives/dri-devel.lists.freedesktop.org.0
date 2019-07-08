Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B98E161D35
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 12:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD6A89C6B;
	Mon,  8 Jul 2019 10:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7392893A7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 10:45:30 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x68AjSkD122507;
 Mon, 8 Jul 2019 05:45:28 -0500
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x68AjSu1031625
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Jul 2019 05:45:28 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 8 Jul
 2019 05:45:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 8 Jul 2019 05:45:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x68AjRf4100268;
 Mon, 8 Jul 2019 05:45:28 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 1/8] drm/omap: use refcount API to track the number of
 users of dma_addr
Date: Mon, 8 Jul 2019 12:45:13 +0200
Message-ID: <20190708104520.24217-2-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190708104520.24217-1-jjhiblot@ti.com>
References: <20190708104520.24217-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562582728;
 bh=2kIayeH/31i4SslmMoy51kLL5QtVZxZvAwTSOe7IYPc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Of2Seazg1dIIVhWjxT1oSWRy5oCKlOp72wK8ud7mVmfQvMWHk57CZOCAyyF2FMC1D
 kdtiF+1NXuz/EtpzoMxYMyckZDiWIlETxbZH7oy2fzaoGURdlvzYhB0Qk6I/PjU+lk
 nKT4ABSKjFgxHmK0qmJO5PGD9vYXzp1KN5WCAcS0=
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
IHVuYmFsYW5jZWQuCgpQcm9wb3NlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5j
aGFydEBpZGVhc29uYm9hcmQuY29tPgpTaWduZWQtb2ZmLWJ5OiBKZWFuLUphY3F1ZXMgSGlibG90
IDxqamhpYmxvdEB0aS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0u
YyB8IDQ1ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIz
IGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dl
bS5jCmluZGV4IDM3Mzc4ZGJjNTBkMC4uMGI2ZWVmMTIwY2M5IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJt
L29tYXBfZ2VtLmMKQEAgLTY1LDcgKzY1LDcgQEAgc3RydWN0IG9tYXBfZ2VtX29iamVjdCB7CiAJ
LyoqCiAJICogIyBvZiB1c2VycyBvZiBkbWFfYWRkcgogCSAqLwotCXUzMiBkbWFfYWRkcl9jbnQ7
CisJcmVmY291bnRfdCBkbWFfYWRkcl9jbnQ7CiAKIAkvKioKIAkgKiBJZiB0aGUgYnVmZmVyIGhh
cyBiZWVuIGltcG9ydGVkIGZyb20gYSBkbWFidWYgdGhlIE9NQVBfREJfRE1BQlVGIGZsYWcKQEAg
LTc3MSwxMyArNzcxLDE1IEBAIGludCBvbWFwX2dlbV9waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0
ICpvYmosIGRtYV9hZGRyX3QgKmRtYV9hZGRyKQogCW11dGV4X2xvY2soJm9tYXBfb2JqLT5sb2Nr
KTsKIAogCWlmICghb21hcF9nZW1faXNfY29udGlndW91cyhvbWFwX29iaikgJiYgcHJpdi0+aGFz
X2RtbSkgewotCQlpZiAob21hcF9vYmotPmRtYV9hZGRyX2NudCA9PSAwKSB7CisJCWlmIChyZWZj
b3VudF9yZWFkKCZvbWFwX29iai0+ZG1hX2FkZHJfY250KSA9PSAwKSB7CiAJCQl1MzIgbnBhZ2Vz
ID0gb2JqLT5zaXplID4+IFBBR0VfU0hJRlQ7CiAJCQllbnVtIHRpbGVyX2ZtdCBmbXQgPSBnZW0y
Zm10KG9tYXBfb2JqLT5mbGFncyk7CiAJCQlzdHJ1Y3QgdGlsZXJfYmxvY2sgKmJsb2NrOwogCiAJ
CQlCVUdfT04ob21hcF9vYmotPmJsb2NrKTsKIAorCQkJcmVmY291bnRfc2V0KCZvbWFwX29iai0+
ZG1hX2FkZHJfY250LCAxKTsKKwogCQkJcmV0ID0gb21hcF9nZW1fYXR0YWNoX3BhZ2VzKG9iaik7
CiAJCQlpZiAocmV0KQogCQkJCWdvdG8gZmFpbDsKQEAgLTgxMSwxMCArODEzLDEwIEBAIGludCBv
bWFwX2dlbV9waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIGRtYV9hZGRyX3QgKmRtYV9h
ZGRyKQogCQkJb21hcF9vYmotPmJsb2NrID0gYmxvY2s7CiAKIAkJCURCRygiZ290IGRtYSBhZGRy
ZXNzOiAlcGFkIiwgJm9tYXBfb2JqLT5kbWFfYWRkcik7CisJCX0gZWxzZSB7CisJCQlyZWZjb3Vu
dF9pbmMoJm9tYXBfb2JqLT5kbWFfYWRkcl9jbnQpOwogCQl9CiAKLQkJb21hcF9vYmotPmRtYV9h
ZGRyX2NudCsrOwotCiAJCSpkbWFfYWRkciA9IG9tYXBfb2JqLT5kbWFfYWRkcjsKIAl9IGVsc2Ug
aWYgKG9tYXBfZ2VtX2lzX2NvbnRpZ3VvdXMob21hcF9vYmopKSB7CiAJCSpkbWFfYWRkciA9IG9t
YXBfb2JqLT5kbWFfYWRkcjsKQEAgLTg0NCwyMyArODQ2LDIxIEBAIHZvaWQgb21hcF9nZW1fdW5w
aW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCiAKIAltdXRleF9sb2NrKCZvbWFwX29iai0+
bG9jayk7CiAKLQlpZiAob21hcF9vYmotPmRtYV9hZGRyX2NudCA+IDApIHsKLQkJb21hcF9vYmot
PmRtYV9hZGRyX2NudC0tOwotCQlpZiAob21hcF9vYmotPmRtYV9hZGRyX2NudCA9PSAwKSB7Ci0J
CQlyZXQgPSB0aWxlcl91bnBpbihvbWFwX29iai0+YmxvY2spOwotCQkJaWYgKHJldCkgewotCQkJ
CWRldl9lcnIob2JqLT5kZXYtPmRldiwKLQkJCQkJImNvdWxkIG5vdCB1bnBpbiBwYWdlczogJWRc
biIsIHJldCk7Ci0JCQl9Ci0JCQlyZXQgPSB0aWxlcl9yZWxlYXNlKG9tYXBfb2JqLT5ibG9jayk7
Ci0JCQlpZiAocmV0KSB7Ci0JCQkJZGV2X2VycihvYmotPmRldi0+ZGV2LAotCQkJCQkiY291bGQg
bm90IHJlbGVhc2UgdW5tYXA6ICVkXG4iLCByZXQpOwotCQkJfQotCQkJb21hcF9vYmotPmRtYV9h
ZGRyID0gMDsKLQkJCW9tYXBfb2JqLT5ibG9jayA9IE5VTEw7CisJaWYgKHJlZmNvdW50X2RlY19h
bmRfdGVzdCgmb21hcF9vYmotPmRtYV9hZGRyX2NudCkpIHsKKwkJcmV0ID0gdGlsZXJfdW5waW4o
b21hcF9vYmotPmJsb2NrKTsKKwkJaWYgKHJldCkgeworCQkJZGV2X2VycihvYmotPmRldi0+ZGV2
LAorCQkJCSJjb3VsZCBub3QgdW5waW4gcGFnZXM6ICVkXG4iLCByZXQpOwogCQl9CisJCXJldCA9
IHRpbGVyX3JlbGVhc2Uob21hcF9vYmotPmJsb2NrKTsKKwkJaWYgKHJldCkgeworCQkJZGV2X2Vy
cihvYmotPmRldi0+ZGV2LAorCQkJCSJjb3VsZCBub3QgcmVsZWFzZSB1bm1hcDogJWRcbiIsIHJl
dCk7CisJCX0KKwkJb21hcF9vYmotPmRtYV9hZGRyID0gMDsKKwkJb21hcF9vYmotPmJsb2NrID0g
TlVMTDsKIAl9Cit9CiAKIAltdXRleF91bmxvY2soJm9tYXBfb2JqLT5sb2NrKTsKIH0KQEAgLTg3
Nyw3ICs4NzcsNyBAQCBpbnQgb21hcF9nZW1fcm90YXRlZF9kbWFfYWRkcihzdHJ1Y3QgZHJtX2dl
bV9vYmplY3QgKm9iaiwgdTMyIG9yaWVudCwKIAogCW11dGV4X2xvY2soJm9tYXBfb2JqLT5sb2Nr
KTsKIAotCWlmICgob21hcF9vYmotPmRtYV9hZGRyX2NudCA+IDApICYmIG9tYXBfb2JqLT5ibG9j
ayAmJgorCWlmICgocmVmY291bnRfcmVhZCgmb21hcF9vYmotPmRtYV9hZGRyX2NudCkgPiAwKSAm
JiBvbWFwX29iai0+YmxvY2sgJiYKIAkJCShvbWFwX29iai0+ZmxhZ3MgJiBPTUFQX0JPX1RJTEVE
KSkgewogCQkqZG1hX2FkZHIgPSB0aWxlcl90c3B0cihvbWFwX29iai0+YmxvY2ssIG9yaWVudCwg
eCwgeSk7CiAJCXJldCA9IDA7CkBAIC0xMDI4LDcgKzEwMjgsOCBAQCB2b2lkIG9tYXBfZ2VtX2Rl
c2NyaWJlKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3Qgc2VxX2ZpbGUgKm0pCiAK
IAlzZXFfcHJpbnRmKG0sICIlMDh4OiAlMmQgKCUyZCkgJTA4bGx4ICVwYWQgKCUyZCkgJXAgJTRk
IiwKIAkJCW9tYXBfb2JqLT5mbGFncywgb2JqLT5uYW1lLCBrcmVmX3JlYWQoJm9iai0+cmVmY291
bnQpLAotCQkJb2ZmLCAmb21hcF9vYmotPmRtYV9hZGRyLCBvbWFwX29iai0+ZG1hX2FkZHJfY250
LAorCQkJb2ZmLCAmb21hcF9vYmotPmRtYV9hZGRyLAorCQkJcmVmY291bnRfcmVhZCgmb21hcF9v
YmotPmRtYV9hZGRyX2NudCksCiAJCQlvbWFwX29iai0+dmFkZHIsIG9tYXBfb2JqLT5yb2xsKTsK
IAogCWlmIChvbWFwX29iai0+ZmxhZ3MgJiBPTUFQX0JPX1RJTEVEKSB7CkBAIC0xMDkxLDcgKzEw
OTIsNyBAQCB2b2lkIG9tYXBfZ2VtX2ZyZWVfb2JqZWN0KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAq
b2JqKQogCW11dGV4X2xvY2soJm9tYXBfb2JqLT5sb2NrKTsKIAogCS8qIFRoZSBvYmplY3Qgc2hv
dWxkIG5vdCBiZSBwaW5uZWQuICovCi0JV0FSTl9PTihvbWFwX29iai0+ZG1hX2FkZHJfY250ID4g
MCk7CisJV0FSTl9PTihyZWZjb3VudF9yZWFkKCZvbWFwX29iai0+ZG1hX2FkZHJfY250KSA+IDAp
OwogCiAJaWYgKG9tYXBfb2JqLT5wYWdlcykgewogCQlpZiAob21hcF9vYmotPmZsYWdzICYgT01B
UF9CT19NRU1fRE1BQlVGKQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
