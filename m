Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 416D3B668C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 16:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B709E6F52A;
	Wed, 18 Sep 2019 14:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3666F3D3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 14:57:50 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8IEvjjI088040;
 Wed, 18 Sep 2019 09:57:45 -0500
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8IEvjnh034529;
 Wed, 18 Sep 2019 09:57:45 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 18
 Sep 2019 09:57:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 18 Sep 2019 09:57:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8IEvhgx012863;
 Wed, 18 Sep 2019 09:57:44 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>
Subject: [PATCH v7 3/5] leds: Add managed API to get a LED from a device driver
Date: Wed, 18 Sep 2019 16:57:28 +0200
Message-ID: <20190918145730.22805-4-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190918145730.22805-1-jjhiblot@ti.com>
References: <20190918145730.22805-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1568818665;
 bh=OOSxNH9AZ+QI3vXWQ4RnOIoZnDMzpob6pBb1GLj0bJY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=w6dnvztFBRCjPz5MnDVBxkMR7XTHoGogXQOfW9WGrqfQS61twEOePfj0Fvwieds/j
 1fx/XagszT3IkgQYTz6MgoGkCYOA+y6SV41y4//p/LKtEAR/MrpIOvG6O0V8+WWT26
 XL+YzLPM+smfqQ9Il5/DWK6qbmoOIulfgMM60f9E=
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
 tomi.valkeinen@ti.com, dmurphy@ti.com, jjhiblot@ti.com,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgdGhlIExFRCBpcyBhY3F1aXJlZCBieSBhIGNvbnN1bWVyIGRldmljZSB3aXRoIGRldm1fbGVk
X2dldCgpLCBpdCBpcwphdXRvbWF0aWNhbGx5IHJlbGVhc2VkIHdoZW4gdGhlIGRldmljZSBpcyBk
ZXRhY2hlZC4KClNpZ25lZC1vZmYtYnk6IEplYW4tSmFjcXVlcyBIaWJsb3QgPGpqaGlibG90QHRp
LmNvbT4KQWNrZWQtYnk6IFBhdmVsIE1hY2hlayA8cGF2ZWxAdWN3LmN6PgotLS0KIGRyaXZlcnMv
bGVkcy9sZWQtY2xhc3MuYyB8IDUxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIGluY2x1ZGUvbGludXgvbGVkcy5oICAgICB8ICAyICsrCiAyIGZpbGVzIGNoYW5nZWQs
IDUzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2xlZHMvbGVkLWNsYXNzLmMg
Yi9kcml2ZXJzL2xlZHMvbGVkLWNsYXNzLmMKaW5kZXggMmI4ZjIwZjk0MTI4Li5lMTExNzdkNzdi
NGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYworKysgYi9kcml2ZXJzL2xl
ZHMvbGVkLWNsYXNzLmMKQEAgLTI2NCw2ICsyNjQsNTcgQEAgdm9pZCBsZWRfcHV0KHN0cnVjdCBs
ZWRfY2xhc3NkZXYgKmxlZF9jZGV2KQogfQogRVhQT1JUX1NZTUJPTF9HUEwobGVkX3B1dCk7CiAK
K3N0YXRpYyB2b2lkIGRldm1fbGVkX3JlbGVhc2Uoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpy
ZXMpCit7CisJc3RydWN0IGxlZF9jbGFzc2RldiAqKnAgPSByZXM7CisKKwlsZWRfcHV0KCpwKTsK
K30KKworLyoqCisgKiBkZXZtX2xlZF9nZXQgLSBSZXNvdXJjZS1tYW5hZ2VkIHJlcXVlc3Qgb2Yg
YSBMRUQgZGV2aWNlCisgKiBAZGV2OglMRUQgY29uc3VtZXIKKyAqIEBpZHg6CWluZGV4IG9mIHRo
ZSBMRUQgdG8gb2J0YWluIGluIHRoZSBjb25zdW1lcgorICoKKyAqIFRoZSBkZXZpY2Ugbm9kZSBv
ZiB0aGUgZGV2aWNlIGlzIHBhcnNlIHRvIGZpbmQgdGhlIHJlcXVlc3QgTEVEIGRldmljZS4KKyAq
IFRoZSBMRUQgZGV2aWNlIHJldHVybmVkIGZyb20gdGhpcyBmdW5jdGlvbiBpcyBhdXRvbWF0aWNh
bGx5IHJlbGVhc2VkCisgKiBvbiBkcml2ZXIgZGV0YWNoLgorICoKKyAqIE5PVEU6IEF0IHRoZSBt
b21lbnQsIGl0IHN1cHBvcnRzIG9ubHkgZGV2aWNlLXRyZWUgYmFzZWQgTEVEIGxvb2t1cAorICoK
KyAqIEByZXR1cm4gYSBwb2ludGVyIHRvIGEgTEVEIGRldmljZSBvciBFUlJfUFRSKGVycm5vKSBv
biBmYWlsdXJlLgorICovCitzdHJ1Y3QgbGVkX2NsYXNzZGV2ICpfX211c3RfY2hlY2sgZGV2bV9s
ZWRfZ2V0KHN0cnVjdCBkZXZpY2UgKmRldiwKKwkJCQkJICAgICAgIGludCBpbmRleCkKK3sKKwlz
dHJ1Y3QgbGVkX2NsYXNzZGV2ICpsZWQ7CisJc3RydWN0IGxlZF9jbGFzc2RldiAqKmRyOworCisJ
aWYgKCFkZXYpCisJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOworCisJLyogTm90IHVzaW5nIGRl
dmljZSB0cmVlPyAqLworCWlmICghSVNfRU5BQkxFRChDT05GSUdfT0YpIHx8ICFkZXYtPm9mX25v
ZGUpCisJCXJldHVybiBFUlJfUFRSKC1FTk9UU1VQUCk7CisKKwlsZWQgPSBvZl9sZWRfZ2V0KGRl
di0+b2Zfbm9kZSwgaW5kZXgpOworCWlmIChJU19FUlIobGVkKSkKKwkJcmV0dXJuIGxlZDsKKwor
CWRyID0gZGV2cmVzX2FsbG9jKGRldm1fbGVkX3JlbGVhc2UsIHNpemVvZihzdHJ1Y3QgbGVkX2Ns
YXNzZGV2ICopLAorCQkJICBHRlBfS0VSTkVMKTsKKwlpZiAoIWRyKSB7CisJCWxlZF9wdXQobGVk
KTsKKwkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7CisJfQorCisJKmRyID0gbGVkOworCWRldnJl
c19hZGQoZGV2LCBkcik7CisKKwlyZXR1cm4gbGVkOworfQorRVhQT1JUX1NZTUJPTF9HUEwoZGV2
bV9sZWRfZ2V0KTsKKwogc3RhdGljIGludCBsZWRfY2xhc3NkZXZfbmV4dF9uYW1lKGNvbnN0IGNo
YXIgKmluaXRfbmFtZSwgY2hhciAqbmFtZSwKIAkJCQkgIHNpemVfdCBsZW4pCiB7CmRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L2xlZHMuaCBiL2luY2x1ZGUvbGludXgvbGVkcy5oCmluZGV4IDZm
NzM3MWJjNzc1Ny4uODhiZjJjZWFhYmU2IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2xlZHMu
aAorKysgYi9pbmNsdWRlL2xpbnV4L2xlZHMuaApAQCAtMTk5LDYgKzE5OSw4IEBAIGV4dGVybiB2
b2lkIGxlZF9jbGFzc2Rldl9yZXN1bWUoc3RydWN0IGxlZF9jbGFzc2RldiAqbGVkX2NkZXYpOwog
CiBleHRlcm4gc3RydWN0IGxlZF9jbGFzc2RldiAqb2ZfbGVkX2dldChzdHJ1Y3QgZGV2aWNlX25v
ZGUgKm5wLCBpbnQgaW5kZXgpOwogZXh0ZXJuIHZvaWQgbGVkX3B1dChzdHJ1Y3QgbGVkX2NsYXNz
ZGV2ICpsZWRfY2Rldik7CitzdHJ1Y3QgbGVkX2NsYXNzZGV2ICpfX211c3RfY2hlY2sgZGV2bV9s
ZWRfZ2V0KHN0cnVjdCBkZXZpY2UgKmRldiwKKwkJCQkJICAgICAgIGludCBpbmRleCk7CiAKIC8q
KgogICogbGVkX2JsaW5rX3NldCAtIHNldCBibGlua2luZyB3aXRoIHNvZnR3YXJlIGZhbGxiYWNr
Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
