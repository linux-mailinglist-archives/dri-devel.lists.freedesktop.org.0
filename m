Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6553612DA5
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 14:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058E68919C;
	Fri,  3 May 2019 12:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3C389F45
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 12:31:31 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x43CVTAH098068;
 Fri, 3 May 2019 07:31:29 -0500
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x43CVTC4129210
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2019 07:31:29 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 3 May
 2019 07:31:28 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 3 May 2019 07:31:28 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x43CUYu4002029;
 Fri, 3 May 2019 07:31:26 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCHv3 20/23] drm/bridge: tc358767: copy the mode data,
 instead of storing the pointer
Date: Fri, 3 May 2019 15:29:46 +0300
Message-ID: <20190503122949.12266-21-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190503122949.12266-1-tomi.valkeinen@ti.com>
References: <20190503122949.12266-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556886689;
 bh=RxXowr+DKJ0osrSn6l6k6daMO+MYKrMbgEShpG+uCDY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Vz+XJxANC8RkrWGu2eKbpML2Hx38LSRnyNCWBFoWo045+FncXjcnrSFodHbO2BTtO
 fwCabebVYtC/pWQtUjdMhGbMJ05DY4mm6OxaCL1Z6hDq3PiWhcDkoS1fw3Jl/T6rDt
 qmIezKb26BFl7maThF8hAqSa1Ehwgv9fo3UNp9Wc=
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gdGNfYnJpZGdlX21vZGVfc2V0IGNhbGxiYWNrLCB3ZSBzdG9yZSB0aGUgcG9pbnRlciB0byB0
aGUgZ2l2ZW4KZHJtX2Rpc3BsYXlfbW9kZSwgYW5kIHVzZSB0aGUgbW9kZSBsYXRlci4gU3Rvcmlu
ZyBhIHBvaW50ZXIgaW4gc3VjaCBhCndheSBsb29rcyB2ZXJ5IHN1c3BpY2lvdXMgdG8gbWUsIGFu
ZCBJIGhhdmUgb2JzZXJ2ZWQgb2RkIGlzc3VlcyB3aGVyZQp0aGUgdGltaW5ncyB3ZXJlIGFwcGFy
ZW50bHkgKGF0IGxlYXN0IG1vc3RseSkgemVyby4KCkRvIGEgY29weSBvZiB0aGUgZHJtX2Rpc3Bs
YXlfbW9kZSBpbnN0ZWFkIHRvIGVuc3VyZSB3ZSBkb24ndCByZWZlciB0bwpmcmVlZC9tb2RpZmll
ZCBkYXRhLgoKU2lnbmVkLW9mZi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRp
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgfCA4ICsrKystLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvdGMzNTg3NjcuYwppbmRleCA1OTFiZjY0YWM5MTYuLjhmNmQ2MDFkZWYzZiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwpAQCAtMjA1LDcgKzIwNSw3IEBAIHN0cnVjdCB0Y19k
YXRhIHsKIAkvKiBkaXNwbGF5IGVkaWQgKi8KIAlzdHJ1Y3QgZWRpZAkJKmVkaWQ7CiAJLyogY3Vy
cmVudCBtb2RlICovCi0JY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUJKm1vZGU7CisJc3Ry
dWN0IGRybV9kaXNwbGF5X21vZGUJbW9kZTsKIAogCXUzMgkJCXJldjsKIAl1OAkJCWFzc3I7CkBA
IC0xMDMyLDEyICsxMDMyLDEyIEBAIHN0YXRpYyBpbnQgdGNfc3RyZWFtX2VuYWJsZShzdHJ1Y3Qg
dGNfZGF0YSAqdGMpCiAJLyogUFhMIFBMTCBzZXR1cCAqLwogCWlmICh0Y190ZXN0X3BhdHRlcm4p
IHsKIAkJcmV0ID0gdGNfcHhsX3BsbF9lbih0YywgY2xrX2dldF9yYXRlKHRjLT5yZWZjbGspLAot
CQkJCSAgICAxMDAwICogdGMtPm1vZGUtPmNsb2NrKTsKKwkJCQkgICAgMTAwMCAqIHRjLT5tb2Rl
LmNsb2NrKTsKIAkJaWYgKHJldCkKIAkJCWdvdG8gZXJyOwogCX0KIAotCXJldCA9IHRjX3NldF92
aWRlb19tb2RlKHRjLCB0Yy0+bW9kZSk7CisJcmV0ID0gdGNfc2V0X3ZpZGVvX21vZGUodGMsICZ0
Yy0+bW9kZSk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIApAQCAtMTE4MCw3ICsxMTgwLDcg
QEAgc3RhdGljIHZvaWQgdGNfYnJpZGdlX21vZGVfc2V0KHN0cnVjdCBkcm1fYnJpZGdlICpicmlk
Z2UsCiB7CiAJc3RydWN0IHRjX2RhdGEgKnRjID0gYnJpZGdlX3RvX3RjKGJyaWRnZSk7CiAKLQl0
Yy0+bW9kZSA9IG1vZGU7CisJdGMtPm1vZGUgPSAqbW9kZTsKIH0KIAogc3RhdGljIGludCB0Y19j
b25uZWN0b3JfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCi0tIApU
ZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxz
aW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2ls
ZTogSGVsc2lua2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
