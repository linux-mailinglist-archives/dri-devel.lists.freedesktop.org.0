Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E52BDC1F41
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 12:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580896E258;
	Mon, 30 Sep 2019 10:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9A26E258
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 10:38:57 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UAcplh088955;
 Mon, 30 Sep 2019 05:38:51 -0500
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8UAcpGe038344
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Sep 2019 05:38:51 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 05:38:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 05:38:42 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UAck1w011864;
 Mon, 30 Sep 2019 05:38:50 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: [PATCHv2 2/7] drm/omap: avoid copy in mgr_fld_read/write
Date: Mon, 30 Sep 2019 13:38:35 +0300
Message-ID: <20190930103840.18970-3-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190930103840.18970-1-tomi.valkeinen@ti.com>
References: <20190930103840.18970-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569839932;
 bh=dyPTj9BT+kCyt9tcnbZFyEDzpxzADhv68Ba83qN+B5A=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=YU6ceY0R74G8KwFMg7m71nUpASVW1mpviezWYH3/LJwGhspM0kBzr2k6WQOwa7GFj
 tSb2kILdJm3qBKJGdfBTzDq7Vbi8FSFCs5t+pbEDAZ5xwaSMaPM15NPuvXob2QBRyB
 T3lKBrAoDXfhBGqWduxdT57wFrzLDwuL0N+2Vo9k=
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXZvaWQgdW5uZWNlc3NhcnkgY29weSBpbiBtZ3JfZmxkX3JlYWQvd3JpdGUgYnkgdGFraW5nIGEg
cG9pbnRlciB0byB0aGUKcmVnX3Jlc2MgYW5kIHVzaW5nIHRoYXQuCgpTaWduZWQtb2ZmLWJ5OiBU
b21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9vbWFwZHJtL2Rzcy9kaXNwYy5jIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
b21hcGRybS9kc3MvZGlzcGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kaXNwYy5j
CmluZGV4IDBkYzAyNzI1NjlmNi4uM2M5MzE1YjE3ZWYyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vb21hcGRybS9kc3MvZGlzcGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9k
c3MvZGlzcGMuYwpAQCAtMzY1LDE3ICszNjUsMTcgQEAgc3RhdGljIGlubGluZSB1MzIgZGlzcGNf
cmVhZF9yZWcoc3RydWN0IGRpc3BjX2RldmljZSAqZGlzcGMsIHUxNiBpZHgpCiBzdGF0aWMgdTMy
IG1ncl9mbGRfcmVhZChzdHJ1Y3QgZGlzcGNfZGV2aWNlICpkaXNwYywgZW51bSBvbWFwX2NoYW5u
ZWwgY2hhbm5lbCwKIAkJCWVudW0gbWdyX3JlZ19maWVsZHMgcmVnZmxkKQogewotCWNvbnN0IHN0
cnVjdCBkaXNwY19yZWdfZmllbGQgcmZsZCA9IG1ncl9kZXNjW2NoYW5uZWxdLnJlZ19kZXNjW3Jl
Z2ZsZF07CisJY29uc3Qgc3RydWN0IGRpc3BjX3JlZ19maWVsZCAqcmZsZCA9ICZtZ3JfZGVzY1tj
aGFubmVsXS5yZWdfZGVzY1tyZWdmbGRdOwogCi0JcmV0dXJuIFJFR19HRVQoZGlzcGMsIHJmbGQu
cmVnLCByZmxkLmhpZ2gsIHJmbGQubG93KTsKKwlyZXR1cm4gUkVHX0dFVChkaXNwYywgcmZsZC0+
cmVnLCByZmxkLT5oaWdoLCByZmxkLT5sb3cpOwogfQogCiBzdGF0aWMgdm9pZCBtZ3JfZmxkX3dy
aXRlKHN0cnVjdCBkaXNwY19kZXZpY2UgKmRpc3BjLCBlbnVtIG9tYXBfY2hhbm5lbCBjaGFubmVs
LAogCQkJICBlbnVtIG1ncl9yZWdfZmllbGRzIHJlZ2ZsZCwgaW50IHZhbCkKIHsKLQljb25zdCBz
dHJ1Y3QgZGlzcGNfcmVnX2ZpZWxkIHJmbGQgPSBtZ3JfZGVzY1tjaGFubmVsXS5yZWdfZGVzY1ty
ZWdmbGRdOworCWNvbnN0IHN0cnVjdCBkaXNwY19yZWdfZmllbGQgKnJmbGQgPSAmbWdyX2Rlc2Nb
Y2hhbm5lbF0ucmVnX2Rlc2NbcmVnZmxkXTsKIAotCVJFR19GTERfTU9EKGRpc3BjLCByZmxkLnJl
ZywgdmFsLCByZmxkLmhpZ2gsIHJmbGQubG93KTsKKwlSRUdfRkxEX01PRChkaXNwYywgcmZsZC0+
cmVnLCB2YWwsIHJmbGQtPmhpZ2gsIHJmbGQtPmxvdyk7CiB9CiAKIHN0YXRpYyBpbnQgZGlzcGNf
Z2V0X251bV9vdmxzKHN0cnVjdCBkaXNwY19kZXZpY2UgKmRpc3BjKQotLSAKVGV4YXMgSW5zdHJ1
bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVu
bnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtp
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
