Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B40C1CC215
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 16:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF72B6E086;
	Sat,  9 May 2020 14:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav22.altibox.net (asav22.altibox.net [109.247.116.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C59B6E356
 for <dri-devel@lists.freedesktop.org>; Sat,  9 May 2020 14:16:44 +0000 (UTC)
Received: from localhost.localdomain (unknown [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav22.altibox.net (Postfix) with ESMTPSA id 90EB22016D;
 Sat,  9 May 2020 16:16:42 +0200 (CEST)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
 lee.jones@linaro.org
Subject: [PATCH v2 03/10] drm/client: Add drm_client_framebuffer_flush()
Date: Sat,  9 May 2020 16:16:12 +0200
Message-Id: <20200509141619.32970-4-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200509141619.32970-1-noralf@tronnes.org>
References: <20200509141619.32970-1-noralf@tronnes.org>
MIME-Version: 1.0
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=R7It5+ZX c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=7gkXJVJtAAAA:8 a=SJz97ENfAAAA:8
 a=0jVh_8K4HvQRDTyCFMcA:9 a=QEXdDO2ut3YA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=vFet0B0WnEQeilDPIY6i:22
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
Cc: jingoohan1@gmail.com, daniel.thompson@linaro.org, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSBkcml2ZXJzIG5lZWQgZXhwbGljaXQgZmx1c2hpbmcgb2YgYnVmZmVyIGNoYW5nZXMsIGFk
ZCBhIGZ1bmN0aW9uCnRoYXQgZG9lcyB0aGF0LgoKdjI6Ci0gUHV0IGFsbCBjbGlwIHJlY3Qgc3R1
ZmYgaW5zaWRlIGlmIHN0YXRlbWVudCAoU2FtKQoKUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8
c2FtQHJhdm5ib3JnLm9yZz4KU2lnbmVkLW9mZi1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZA
dHJvbm5lcy5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnQuYyB8IDMzICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS9kcm0vZHJtX2NsaWVudC5oICAg
ICB8ICAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVu
dC5jCmluZGV4IDEyNzg3OTE1ZGIwMS4uODI3ZWU2NDIyZGQyIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2NsaWVudC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMK
QEAgLTQ4Myw2ICs0ODMsMzkgQEAgdm9pZCBkcm1fY2xpZW50X2ZyYW1lYnVmZmVyX2RlbGV0ZShz
dHJ1Y3QgZHJtX2NsaWVudF9idWZmZXIgKmJ1ZmZlcikKIH0KIEVYUE9SVF9TWU1CT0woZHJtX2Ns
aWVudF9mcmFtZWJ1ZmZlcl9kZWxldGUpOwogCisvKioKKyAqIGRybV9jbGllbnRfZnJhbWVidWZm
ZXJfZmx1c2ggLSBNYW51YWxseSBmbHVzaCBjbGllbnQgZnJhbWVidWZmZXIKKyAqIEBidWZmZXI6
IERSTSBjbGllbnQgYnVmZmVyIChjYW4gYmUgTlVMTCkKKyAqIEByZWN0OiBEYW1hZ2UgcmVjdGFu
Z2xlIChpZiBOVUxMIGZsdXNoZXMgYWxsKQorICoKKyAqIFRoaXMgY2FsbHMgJmRybV9mcmFtZWJ1
ZmZlcl9mdW5jcy0+ZGlydHkgKGlmIHByZXNlbnQpIHRvIGZsdXNoIGJ1ZmZlciBjaGFuZ2VzCisg
KiBmb3IgZHJpdmVycyB0aGF0IG5lZWQgaXQuCisgKgorICogUmV0dXJuczoKKyAqIFplcm8gb24g
c3VjY2VzcyBvciBuZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGZhaWx1cmUuCisgKi8KK2ludCBkcm1f
Y2xpZW50X2ZyYW1lYnVmZmVyX2ZsdXNoKHN0cnVjdCBkcm1fY2xpZW50X2J1ZmZlciAqYnVmZmVy
LCBzdHJ1Y3QgZHJtX3JlY3QgKnJlY3QpCit7CisJaWYgKCFidWZmZXIgfHwgIWJ1ZmZlci0+ZmIg
fHwgIWJ1ZmZlci0+ZmItPmZ1bmNzLT5kaXJ0eSkKKwkJcmV0dXJuIDA7CisKKwlpZiAocmVjdCkg
eworCQlzdHJ1Y3QgZHJtX2NsaXBfcmVjdCBjbGlwID0geworCQkJLngxID0gcmVjdC0+eDEsCisJ
CQkueTEgPSByZWN0LT55MSwKKwkJCS54MiA9IHJlY3QtPngyLAorCQkJLnkyID0gcmVjdC0+eTIs
CisJCX07CisKKwkJcmV0dXJuIGJ1ZmZlci0+ZmItPmZ1bmNzLT5kaXJ0eShidWZmZXItPmZiLCBi
dWZmZXItPmNsaWVudC0+ZmlsZSwKKwkJCQkJCTAsIDAsICZjbGlwLCAxKTsKKwl9CisKKwlyZXR1
cm4gYnVmZmVyLT5mYi0+ZnVuY3MtPmRpcnR5KGJ1ZmZlci0+ZmIsIGJ1ZmZlci0+Y2xpZW50LT5m
aWxlLAorCQkJCQkwLCAwLCBOVUxMLCAwKTsKK30KK0VYUE9SVF9TWU1CT0woZHJtX2NsaWVudF9m
cmFtZWJ1ZmZlcl9mbHVzaCk7CisKICNpZmRlZiBDT05GSUdfREVCVUdfRlMKIHN0YXRpYyBpbnQg
ZHJtX2NsaWVudF9kZWJ1Z2ZzX2ludGVybmFsX2NsaWVudHMoc3RydWN0IHNlcV9maWxlICptLCB2
b2lkICpkYXRhKQogewpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2NsaWVudC5oIGIvaW5j
bHVkZS9kcm0vZHJtX2NsaWVudC5oCmluZGV4IDk2ZWJjNzUyM2FhMC4uOTczN2RkN2IxNDdmIDEw
MDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fY2xpZW50LmgKKysrIGIvaW5jbHVkZS9kcm0vZHJt
X2NsaWVudC5oCkBAIC0xNTYsNiArMTU2LDcgQEAgc3RydWN0IGRybV9jbGllbnRfYnVmZmVyIHsK
IHN0cnVjdCBkcm1fY2xpZW50X2J1ZmZlciAqCiBkcm1fY2xpZW50X2ZyYW1lYnVmZmVyX2NyZWF0
ZShzdHJ1Y3QgZHJtX2NsaWVudF9kZXYgKmNsaWVudCwgdTMyIHdpZHRoLCB1MzIgaGVpZ2h0LCB1
MzIgZm9ybWF0KTsKIHZvaWQgZHJtX2NsaWVudF9mcmFtZWJ1ZmZlcl9kZWxldGUoc3RydWN0IGRy
bV9jbGllbnRfYnVmZmVyICpidWZmZXIpOworaW50IGRybV9jbGllbnRfZnJhbWVidWZmZXJfZmx1
c2goc3RydWN0IGRybV9jbGllbnRfYnVmZmVyICpidWZmZXIsIHN0cnVjdCBkcm1fcmVjdCAqcmVj
dCk7CiB2b2lkICpkcm1fY2xpZW50X2J1ZmZlcl92bWFwKHN0cnVjdCBkcm1fY2xpZW50X2J1ZmZl
ciAqYnVmZmVyKTsKIHZvaWQgZHJtX2NsaWVudF9idWZmZXJfdnVubWFwKHN0cnVjdCBkcm1fY2xp
ZW50X2J1ZmZlciAqYnVmZmVyKTsKIAotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
