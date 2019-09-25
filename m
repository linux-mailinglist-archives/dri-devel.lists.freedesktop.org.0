Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C46FBD983
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 10:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5116EA84;
	Wed, 25 Sep 2019 08:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302566EA84
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 08:07:13 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.42])
 by regular1.263xmail.com (Postfix) with ESMTP id 00F882D5;
 Wed, 25 Sep 2019 16:07:11 +0800 (CST)
X-263anti-spam: KSV:0;BIG:0;
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-KSVirus-check: 0
X-ADDR-CHECKED4: 1
X-ABS-CHECKED: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P2645T139744972404480S1569398812082049_; 
 Wed, 25 Sep 2019 16:07:10 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <4eb4121ae0eabc237eee6c7347c4a621>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/3] drm/rockchip: Add vop_format_get_bpp to get format bpp
Date: Wed, 25 Sep 2019 16:06:39 +0800
Message-Id: <1569398801-92201-3-git-send-email-hjc@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569398801-92201-1-git-send-email-hjc@rock-chips.com>
References: <1569398801-92201-1-git-send-email-hjc@rock-chips.com>
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
Cc: linux-rockchip@lists.infradead.org, Ayan.Halder@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIDEwYml0IHl1diBmb3JtYXQsIHdlIG5lZWQgdG8gZ2V0IGZvcm1hdCBicHAgZWFjaCBwbGFu
ZSwgc28gd2UKQWRkIHZvcF9mb3JtYXRfZ2V0X2JwcCgpIHRvIGluc3RlYWQgb2YgZm9ybWF0LT5j
cHBbXTsKClNpZ25lZC1vZmYtYnk6IFNhbmR5IEh1YW5nIDxoamNAcm9jay1jaGlwcy5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYyB8IDI2ICsrKysr
KysrKysrKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9j
a2NoaXBfZHJtX3ZvcC5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92
b3AuYwppbmRleCAyZjgyMWM1Li5jZTViNDVkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hp
cC9yb2NrY2hpcF9kcm1fdm9wLmMKQEAgLTI0OSw2ICsyNDksMjUgQEAgc3RhdGljIGJvb2wgaGFz
X3JiX3N3YXBwZWQodWludDMyX3QgZm9ybWF0KQogCX0KIH0KIAorc3RhdGljIGludCB2b3BfZm9y
bWF0X2dldF9icHAodTMyIGZvcm1hdCwgdTggcGxhbmUpCit7CisJY29uc3Qgc3RydWN0IGRybV9m
b3JtYXRfaW5mbyAqaW5mbzsKKworCWluZm8gPSBkcm1fZm9ybWF0X2luZm8oZm9ybWF0KTsKKwlp
ZiAoIWluZm8gfHwgcGxhbmUgPj0gaW5mby0+bnVtX3BsYW5lcykKKwkJcmV0dXJuIDA7CisKKwlp
ZiAoaW5mby0+Y3BwWzBdID09IDApIHsKKwkJLyogb25seSBzdXBwb3J0IERSTV9GT1JNQVRfTlZ4
eF8xMCBub3cgKi8KKwkJaWYgKHBsYW5lID09IDApCisJCQlyZXR1cm4gMTA7CisJCWVsc2UKKwkJ
CXJldHVybiAyMDsKKwl9CisKKwlyZXR1cm4gaW5mby0+Y3BwW3BsYW5lXSAqIDg7Cit9CisKIHN0
YXRpYyBlbnVtIHZvcF9kYXRhX2Zvcm1hdCB2b3BfY29udmVydF9mb3JtYXQodWludDMyX3QgZm9y
bWF0KQogewogCXN3aXRjaCAoZm9ybWF0KSB7CkBAIC04MzIsNyArODUxLDggQEAgc3RhdGljIHZv
aWQgdm9wX3BsYW5lX2F0b21pY191cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJZHNw
X3N0eSA9IGRlc3QtPnkxICsgY3J0Yy0+bW9kZS52dG90YWwgLSBjcnRjLT5tb2RlLnZzeW5jX3N0
YXJ0OwogCWRzcF9zdCA9IGRzcF9zdHkgPDwgMTYgfCAoZHNwX3N0eCAmIDB4ZmZmZik7CiAKLQlv
ZmZzZXQgPSAoc3JjLT54MSA+PiAxNikgKiBmYi0+Zm9ybWF0LT5jcHBbMF07CisJb2Zmc2V0ID0g
KHNyYy0+eDEgPj4gMTYpICoKKwkJCXZvcF9mb3JtYXRfZ2V0X2JwcChmYi0+Zm9ybWF0LT5mb3Jt
YXQsIDApIC8gODsKIAlvZmZzZXQgKz0gKHNyYy0+eTEgPj4gMTYpICogZmItPnBpdGNoZXNbMF07
CiAJZG1hX2FkZHIgPSBya19vYmotPmRtYV9hZGRyICsgb2Zmc2V0ICsgZmItPm9mZnNldHNbMF07
CiAKQEAgLTg1OSwxMiArODc5LDEyIEBAIHN0YXRpYyB2b2lkIHZvcF9wbGFuZV9hdG9taWNfdXBk
YXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAogCWlmIChpc195dXYpIHsKIAkJaW50IGhzdWIg
PSBmYi0+Zm9ybWF0LT5oc3ViOwogCQlpbnQgdnN1YiA9IGZiLT5mb3JtYXQtPnZzdWI7Ci0JCWlu
dCBicHAgPSBmYi0+Zm9ybWF0LT5jcHBbMV07CisJCWludCBicHAgPSB2b3BfZm9ybWF0X2dldF9i
cHAoZmItPmZvcm1hdC0+Zm9ybWF0LCAxKTsKIAogCQl1dl9vYmogPSBmYi0+b2JqWzFdOwogCQly
a191dl9vYmogPSB0b19yb2NrY2hpcF9vYmoodXZfb2JqKTsKIAotCQlvZmZzZXQgPSAoc3JjLT54
MSA+PiAxNikgKiBicHAgLyBoc3ViOworCQlvZmZzZXQgPSAoc3JjLT54MSA+PiAxNikgKiBicHAg
LyA4IC8gaHN1YjsKIAkJb2Zmc2V0ICs9IChzcmMtPnkxID4+IDE2KSAqIGZiLT5waXRjaGVzWzFd
IC8gdnN1YjsKIAogCQlkbWFfYWRkciA9IHJrX3V2X29iai0+ZG1hX2FkZHIgKyBvZmZzZXQgKyBm
Yi0+b2Zmc2V0c1sxXTsKLS0gCjIuNy40CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
