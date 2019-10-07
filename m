Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA6DCE206
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 14:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 339A76E5CE;
	Mon,  7 Oct 2019 12:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3BB6E5CF
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 12:45:05 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97Ciwml096452;
 Mon, 7 Oct 2019 07:44:58 -0500
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97CiwkU002058;
 Mon, 7 Oct 2019 07:44:58 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 07:44:56 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 07:44:58 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97CivwL115934;
 Mon, 7 Oct 2019 07:44:57 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <sre@kernel.org>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>
Subject: [PATCH v9 3/5] leds: Add managed API to get a LED from a device driver
Date: Mon, 7 Oct 2019 14:44:35 +0200
Message-ID: <20191007124437.20367-4-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007124437.20367-1-jjhiblot@ti.com>
References: <20191007124437.20367-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570452298;
 bh=MNtYkdAzVgE8Ou25bkrDZ4gd8PxFOPcx4cXOPWheoh0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=qrdQqQIDbKYSxx8+z/OZGDaTW7ZRU02RHCdIRVO1MZjk1AywU8MgPvlDBDk2QAZXr
 Pbb1Iu3GjSDRITwyuR+b09MINI7g607MrV4kt8NCldm0AYRNfVRIsahrfTt5iUWtVj
 voJ/i+I4SYPTgBYPsyzgTCnlxn03Ira68UKggSxw=
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
X2dldCgpLCBpdCBpcwphdXRvbWF0aWNhbGx5IHJlbGVhc2VkIHdoZW4gdGhlIGRldmljZSBpcyBk
ZXRhY2hlZC4KClNpZ25lZC1vZmYtYnk6IEplYW4tSmFjcXVlcyBIaWJsb3QgPGpqaGlibG90QHRp
LmNvbT4KQWNrZWQtYnk6IFBhdmVsIE1hY2hlayA8cGF2ZWxAdWN3LmN6PgotLS0KIGRyaXZlcnMv
bGVkcy9sZWQtY2xhc3MuYyB8IDQ5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIGluY2x1ZGUvbGludXgvbGVkcy5oICAgICB8ICAyICsrCiAyIGZpbGVzIGNoYW5nZWQs
IDUxIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2xlZHMvbGVkLWNsYXNzLmMg
Yi9kcml2ZXJzL2xlZHMvbGVkLWNsYXNzLmMKaW5kZXggMWQxZjFkNTQ2ZGM3Li42MzkyMjQzOTJm
ZmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYworKysgYi9kcml2ZXJzL2xl
ZHMvbGVkLWNsYXNzLmMKQEAgLTI2NCw2ICsyNjQsNTUgQEAgdm9pZCBsZWRfcHV0KHN0cnVjdCBs
ZWRfY2xhc3NkZXYgKmxlZF9jZGV2KQogfQogRVhQT1JUX1NZTUJPTF9HUEwobGVkX3B1dCk7CiAK
K3N0YXRpYyB2b2lkIGRldm1fbGVkX3JlbGVhc2Uoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpy
ZXMpCit7CisJc3RydWN0IGxlZF9jbGFzc2RldiAqKnAgPSByZXM7CisKKwlsZWRfcHV0KCpwKTsK
K30KKworLyoqCisgKiBkZXZtX29mX2xlZF9nZXQgLSBSZXNvdXJjZS1tYW5hZ2VkIHJlcXVlc3Qg
b2YgYSBMRUQgZGV2aWNlCisgKiBAZGV2OglMRUQgY29uc3VtZXIKKyAqIEBpbmRleDoJaW5kZXgg
b2YgdGhlIExFRCB0byBvYnRhaW4gaW4gdGhlIGNvbnN1bWVyCisgKgorICogVGhlIGRldmljZSBu
b2RlIG9mIHRoZSBkZXZpY2UgaXMgcGFyc2UgdG8gZmluZCB0aGUgcmVxdWVzdCBMRUQgZGV2aWNl
LgorICogVGhlIExFRCBkZXZpY2UgcmV0dXJuZWQgZnJvbSB0aGlzIGZ1bmN0aW9uIGlzIGF1dG9t
YXRpY2FsbHkgcmVsZWFzZWQKKyAqIG9uIGRyaXZlciBkZXRhY2guCisgKgorICogQHJldHVybiBh
IHBvaW50ZXIgdG8gYSBMRUQgZGV2aWNlIG9yIEVSUl9QVFIoZXJybm8pIG9uIGZhaWx1cmUuCisg
Ki8KK3N0cnVjdCBsZWRfY2xhc3NkZXYgKl9fbXVzdF9jaGVjayBkZXZtX29mX2xlZF9nZXQoc3Ry
dWN0IGRldmljZSAqZGV2LAorCQkJCQkJICBpbnQgaW5kZXgpCit7CisJc3RydWN0IGxlZF9jbGFz
c2RldiAqbGVkOworCXN0cnVjdCBsZWRfY2xhc3NkZXYgKipkcjsKKworCWlmICghZGV2KQorCQly
ZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsKKworCS8qIENvbnN1bW1lciBub3QgdXNpbmcgZGV2aWNl
IHRyZWU/ICovCisJaWYgKCFkZXZfb2Zfbm9kZShkZXYpKQorCQlyZXR1cm4gRVJSX1BUUigtRU5P
VFNVUFApOworCisJbGVkID0gb2ZfbGVkX2dldChkZXZfb2Zfbm9kZShkZXYpLCBpbmRleCk7CisJ
aWYgKElTX0VSUihsZWQpKQorCQlyZXR1cm4gbGVkOworCisJZHIgPSBkZXZyZXNfYWxsb2MoZGV2
bV9sZWRfcmVsZWFzZSwgc2l6ZW9mKHN0cnVjdCBsZWRfY2xhc3NkZXYgKiksCisJCQkgIEdGUF9L
RVJORUwpOworCWlmICghZHIpIHsKKwkJbGVkX3B1dChsZWQpOworCQlyZXR1cm4gRVJSX1BUUigt
RU5PTUVNKTsKKwl9CisKKwkqZHIgPSBsZWQ7CisJZGV2cmVzX2FkZChkZXYsIGRyKTsKKworCXJl
dHVybiBsZWQ7Cit9CitFWFBPUlRfU1lNQk9MX0dQTChkZXZtX29mX2xlZF9nZXQpOworCiBzdGF0
aWMgaW50IGxlZF9jbGFzc2Rldl9uZXh0X25hbWUoY29uc3QgY2hhciAqaW5pdF9uYW1lLCBjaGFy
ICpuYW1lLAogCQkJCSAgc2l6ZV90IGxlbikKIHsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
bGVkcy5oIGIvaW5jbHVkZS9saW51eC9sZWRzLmgKaW5kZXggNmY3MzcxYmM3NzU3Li45Yjk0Y2Y3
NTIwMTIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbGVkcy5oCisrKyBiL2luY2x1ZGUvbGlu
dXgvbGVkcy5oCkBAIC0xOTksNiArMTk5LDggQEAgZXh0ZXJuIHZvaWQgbGVkX2NsYXNzZGV2X3Jl
c3VtZShzdHJ1Y3QgbGVkX2NsYXNzZGV2ICpsZWRfY2Rldik7CiAKIGV4dGVybiBzdHJ1Y3QgbGVk
X2NsYXNzZGV2ICpvZl9sZWRfZ2V0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsIGludCBpbmRleCk7
CiBleHRlcm4gdm9pZCBsZWRfcHV0KHN0cnVjdCBsZWRfY2xhc3NkZXYgKmxlZF9jZGV2KTsKK3N0
cnVjdCBsZWRfY2xhc3NkZXYgKl9fbXVzdF9jaGVjayBkZXZtX29mX2xlZF9nZXQoc3RydWN0IGRl
dmljZSAqZGV2LAorCQkJCQkJICBpbnQgaW5kZXgpOwogCiAvKioKICAqIGxlZF9ibGlua19zZXQg
LSBzZXQgYmxpbmtpbmcgd2l0aCBzb2Z0d2FyZSBmYWxsYmFjawotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
