Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C36D06465D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 14:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F96E8982E;
	Wed, 10 Jul 2019 12:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0690989745
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 12:39:45 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6ACdeeO104812;
 Wed, 10 Jul 2019 07:39:40 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6ACdeme113528
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 10 Jul 2019 07:39:40 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 10
 Jul 2019 07:39:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 10 Jul 2019 07:39:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6ACdd2g071883;
 Wed, 10 Jul 2019 07:39:39 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>
Subject: [PATCH v3 2/4] leds: Add managed API to get a LED from a device driver
Date: Wed, 10 Jul 2019 14:39:30 +0200
Message-ID: <20190710123932.28244-3-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190710123932.28244-1-jjhiblot@ti.com>
References: <20190710123932.28244-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562762380;
 bh=ItirwO8erJEYpB2ZQfeB1f9//VYKLfEYE9vUyXsRw94=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=fiAQzfgmv6EyownznjqE2NAbeOdOnBlqbOktus8k3tf27F6fETNlihMgdsdHarK0a
 gQLxG0AVtms0wfiulXwC26bUO26ilXTpISul4YJRd+dJxpaYOh/ovK1nH8X8HQx0Qx
 JC7OAD+x2E6sGrkg1x89rSRrRBMPvdsIkvOg8id0=
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tomi.valkeinen@ti.com, dmurphy@ti.com, Jean-Jacques Hiblot <jjhiblot@ti.com>,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgdGhlIExFRCBpcyBhY3F1aXJlZCBieSBhIGNvbnN1bWVyIGRldmljZSB3aXRoIGRldm1fbGVk
X2dldCgpLCBpdCBpcwphdXRvbWF0aWNhbGx5IHJlbGVhc2Ugd2hlbiB0aGUgZGV2aWNlIGlzIGRl
dGFjaC4KClNpZ25lZC1vZmYtYnk6IEplYW4tSmFjcXVlcyBIaWJsb3QgPGpqaGlibG90QHRpLmNv
bT4KLS0tCiBkcml2ZXJzL2xlZHMvbGVkLWNsYXNzLmMgfCA0MiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2xpbnV4L2xlZHMuaCAgICAgfCAgMiArKwog
MiBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9s
ZWRzL2xlZC1jbGFzcy5jIGIvZHJpdmVycy9sZWRzL2xlZC1jbGFzcy5jCmluZGV4IDBmNjdiMTNi
MGYxZi4uNTIxY2I3NmZiYWY3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2xlZHMvbGVkLWNsYXNzLmMK
KysrIGIvZHJpdmVycy9sZWRzL2xlZC1jbGFzcy5jCkBAIC0yNjQsNiArMjY0LDQ4IEBAIHZvaWQg
bGVkX3B1dChzdHJ1Y3QgbGVkX2NsYXNzZGV2ICpsZWRfY2RldikKIH0KIEVYUE9SVF9TWU1CT0xf
R1BMKGxlZF9wdXQpOwogCitzdGF0aWMgdm9pZCBkZXZtX2xlZF9yZWxlYXNlKHN0cnVjdCBkZXZp
Y2UgKmRldiwgdm9pZCAqcmVzKQoreworCXN0cnVjdCBsZWRfY2xhc3NkZXYgKipwID0gcmVzOwor
CisJbGVkX3B1dCgqcCk7Cit9CisKKy8qKgorICogZGV2bV9sZWRfZ2V0IC0gUmVzb3VyY2UtbWFu
YWdlZCByZXF1ZXN0IG9mIGEgTEVEIGRldmljZQorICogQGRldjoJTEVEIGNvbnN1bWVyCisgKiBA
aWR4OglpbmRleCBvZiB0aGUgTEVEIHRvIG9idGFpbiBpbiB0aGUgY29uc3VtZXIKKyAqCisgKiBU
aGUgZGV2aWNlIG5vZGUgb2YgdGhlIGRldmljZSBpcyBwYXJzZSB0byBmaW5kIHRoZSByZXF1ZXN0
IExFRCBkZXZpY2UuCisgKiBUaGUgTEVEIGRldmljZSByZXR1cm5lZCBmcm9tIHRoaXMgZnVuY3Rp
b24gaXMgYXV0b21hdGljYWxseSByZWxlYXNlZAorICogb24gZHJpdmVyIGRldGFjaC4KKyAqCisg
KiBAcmV0dXJuIGEgcG9pbnRlciB0byBhIExFRCBkZXZpY2Ugb3IgRVJSX1BUUihlcnJubykgb24g
ZmFpbHVyZS4KKyAqLworc3RydWN0IGxlZF9jbGFzc2RldiAqX19tdXN0X2NoZWNrIGRldm1fbGVk
X2dldChzdHJ1Y3QgZGV2aWNlICpkZXYsCisJCQkJCSAgICAgICBpbnQgaW5kZXgpCit7CisJc3Ry
dWN0IGxlZF9jbGFzc2RldiAqbGVkOworCXN0cnVjdCBsZWRfY2xhc3NkZXYgKipkcjsKKworCWxl
ZCA9IG9mX2xlZF9nZXQoZGV2LT5vZl9ub2RlLCBpbmRleCk7CisJaWYgKElTX0VSUihsZWQpKQor
CQlyZXR1cm4gbGVkOworCisJZHIgPSBkZXZyZXNfYWxsb2MoZGV2bV9sZWRfcmVsZWFzZSwgc2l6
ZW9mKHN0cnVjdCBsZWRfY2xhc3NkZXYgKiksCisJCQkgIEdGUF9LRVJORUwpOworCWlmICghZHIp
IHsKKwkJbGVkX3B1dChsZWQpOworCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsKKwl9CisKKwkq
ZHIgPSBsZWQ7CisJZGV2cmVzX2FkZChkZXYsIGRyKTsKKworCXJldHVybiBsZWQ7Cit9CitFWFBP
UlRfU1lNQk9MX0dQTChkZXZtX2xlZF9nZXQpOworCiBzdGF0aWMgaW50IG1hdGNoX25hbWUoc3Ry
dWN0IGRldmljZSAqZGV2LCBjb25zdCB2b2lkICpkYXRhKQogewogCWlmICghZGV2X25hbWUoZGV2
KSkKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbGVkcy5oIGIvaW5jbHVkZS9saW51eC9sZWRz
LmgKaW5kZXggMGE3MWM3Y2RkMTkxLi43ZmNlYzU2NmQ3NzQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUv
bGludXgvbGVkcy5oCisrKyBiL2luY2x1ZGUvbGludXgvbGVkcy5oCkBAIC0xNDgsNiArMTQ4LDgg
QEAgZXh0ZXJuIHZvaWQgbGVkX2NsYXNzZGV2X3Jlc3VtZShzdHJ1Y3QgbGVkX2NsYXNzZGV2ICps
ZWRfY2Rldik7CiAKIGV4dGVybiBzdHJ1Y3QgbGVkX2NsYXNzZGV2ICpvZl9sZWRfZ2V0KHN0cnVj
dCBkZXZpY2Vfbm9kZSAqbnAsIGludCBpbmRleCk7CiBleHRlcm4gdm9pZCBsZWRfcHV0KHN0cnVj
dCBsZWRfY2xhc3NkZXYgKmxlZF9jZGV2KTsKK3N0cnVjdCBsZWRfY2xhc3NkZXYgKl9fbXVzdF9j
aGVjayBkZXZtX2xlZF9nZXQoc3RydWN0IGRldmljZSAqZGV2LAorCQkJCQkgICAgICAgaW50IGlu
ZGV4KTsKIAogLyoqCiAgKiBsZWRfYmxpbmtfc2V0IC0gc2V0IGJsaW5raW5nIHdpdGggc29mdHdh
cmUgZmFsbGJhY2sKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
