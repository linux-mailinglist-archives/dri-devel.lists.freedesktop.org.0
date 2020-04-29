Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9C71BDCDC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 14:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2398B6EE89;
	Wed, 29 Apr 2020 12:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A0A6EE89
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 12:57:57 +0000 (UTC)
Received: from localhost.localdomain (unknown [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id E178D800EA;
 Wed, 29 Apr 2020 14:48:50 +0200 (CEST)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 04/10] drm/client: Add drm_client_framebuffer_flush()
Date: Wed, 29 Apr 2020 14:48:24 +0200
Message-Id: <20200429124830.27475-5-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200429124830.27475-1-noralf@tronnes.org>
References: <20200429124830.27475-1-noralf@tronnes.org>
MIME-Version: 1.0
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=AvXAIt1P c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8
 a=0jVh_8K4HvQRDTyCFMcA:9 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSBkcml2ZXJzIG5lZWQgZXhwbGljaXQgZmx1c2hpbmcgb2YgYnVmZmVyIGNoYW5nZXMsIGFk
ZCBhIGZ1bmN0aW9uCnRoYXQgZG9lcyB0aGF0LgoKU2lnbmVkLW9mZi1ieTogTm9yYWxmIFRyw7hu
bmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnQu
YyB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvZHJtL2RybV9j
bGllbnQuaCAgICAgfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudC5jIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9jbGllbnQuYwppbmRleCBjYjVlZTlmMWZmYWEuLjhkYmMyZWNkY2FlYSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2NsaWVudC5jCkBAIC00ODMsNiArNDgzLDM3IEBAIHZvaWQgZHJtX2NsaWVudF9mcmFtZWJ1ZmZl
cl9kZWxldGUoc3RydWN0IGRybV9jbGllbnRfYnVmZmVyICpidWZmZXIpCiB9CiBFWFBPUlRfU1lN
Qk9MKGRybV9jbGllbnRfZnJhbWVidWZmZXJfZGVsZXRlKTsKIAorLyoqCisgKiBkcm1fY2xpZW50
X2ZyYW1lYnVmZmVyX2ZsdXNoIC0gTWFudWFsbHkgZmx1c2ggY2xpZW50IGZyYW1lYnVmZmVyCisg
KiBAYnVmZmVyOiBEUk0gY2xpZW50IGJ1ZmZlciAoY2FuIGJlIE5VTEwpCisgKiBAcmVjdDogRGFt
YWdlIHJlY3RhbmdsZSAoaWYgTlVMTCBmbHVzaGVzIGFsbCkKKyAqCisgKiBUaGlzIGNhbGxzICZk
cm1fZnJhbWVidWZmZXJfZnVuY3MtPmRpcnR5IChpZiBwcmVzZW50KSB0byBmbHVzaCBidWZmZXIg
Y2hhbmdlcworICogZm9yIGRyaXZlcnMgdGhhdCBuZWVkIGl0LgorICoKKyAqIFJldHVybnM6Cisg
KiBaZXJvIG9uIHN1Y2Nlc3Mgb3IgbmVnYXRpdmUgZXJyb3IgY29kZSBvbiBmYWlsdXJlLgorICov
CitpbnQgZHJtX2NsaWVudF9mcmFtZWJ1ZmZlcl9mbHVzaChzdHJ1Y3QgZHJtX2NsaWVudF9idWZm
ZXIgKmJ1ZmZlciwgc3RydWN0IGRybV9yZWN0ICpyZWN0KQoreworCXN0cnVjdCBkcm1fY2xpcF9y
ZWN0IGNsaXBfcmVjdCwgKmNsaXAgPSBOVUxMOworCisJaWYgKCFidWZmZXIgfHwgIWJ1ZmZlci0+
ZmIgfHwgIWJ1ZmZlci0+ZmItPmZ1bmNzLT5kaXJ0eSkKKwkJcmV0dXJuIDA7CisKKwlpZiAocmVj
dCkgeworCQljbGlwID0gJmNsaXBfcmVjdDsKKwkJY2xpcC0+eDEgPSByZWN0LT54MTsKKwkJY2xp
cC0+eTEgPSByZWN0LT55MTsKKwkJY2xpcC0+eDIgPSByZWN0LT54MjsKKwkJY2xpcC0+eTIgPSBy
ZWN0LT55MjsKKwl9CisKKwlyZXR1cm4gYnVmZmVyLT5mYi0+ZnVuY3MtPmRpcnR5KGJ1ZmZlci0+
ZmIsIGJ1ZmZlci0+Y2xpZW50LT5maWxlLAorCQkJCQkwLCAwLCBjbGlwLCBjbGlwID8gMSA6IDAp
OworfQorRVhQT1JUX1NZTUJPTChkcm1fY2xpZW50X2ZyYW1lYnVmZmVyX2ZsdXNoKTsKKwogI2lm
ZGVmIENPTkZJR19ERUJVR19GUwogc3RhdGljIGludCBkcm1fY2xpZW50X2RlYnVnZnNfaW50ZXJu
YWxfY2xpZW50cyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKmRhdGEpCiB7CmRpZmYgLS1naXQg
YS9pbmNsdWRlL2RybS9kcm1fY2xpZW50LmggYi9pbmNsdWRlL2RybS9kcm1fY2xpZW50LmgKaW5k
ZXggYmJiNTY4OWZhOWE4Li42ZWY1MzY0ZDZkZmIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2Ry
bV9jbGllbnQuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fY2xpZW50LmgKQEAgLTE1Niw2ICsxNTYs
NyBAQCBzdHJ1Y3QgZHJtX2NsaWVudF9idWZmZXIgewogc3RydWN0IGRybV9jbGllbnRfYnVmZmVy
ICoKIGRybV9jbGllbnRfZnJhbWVidWZmZXJfY3JlYXRlKHN0cnVjdCBkcm1fY2xpZW50X2RldiAq
Y2xpZW50LCB1MzIgd2lkdGgsIHUzMiBoZWlnaHQsIHUzMiBmb3JtYXQpOwogdm9pZCBkcm1fY2xp
ZW50X2ZyYW1lYnVmZmVyX2RlbGV0ZShzdHJ1Y3QgZHJtX2NsaWVudF9idWZmZXIgKmJ1ZmZlcik7
CitpbnQgZHJtX2NsaWVudF9mcmFtZWJ1ZmZlcl9mbHVzaChzdHJ1Y3QgZHJtX2NsaWVudF9idWZm
ZXIgKmJ1ZmZlciwgc3RydWN0IGRybV9yZWN0ICpyZWN0KTsKIHZvaWQgKmRybV9jbGllbnRfYnVm
ZmVyX3ZtYXAoc3RydWN0IGRybV9jbGllbnRfYnVmZmVyICpidWZmZXIpOwogdm9pZCBkcm1fY2xp
ZW50X2J1ZmZlcl92dW5tYXAoc3RydWN0IGRybV9jbGllbnRfYnVmZmVyICpidWZmZXIpOwogCi0t
IAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
