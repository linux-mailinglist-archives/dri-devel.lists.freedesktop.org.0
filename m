Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8B75C4A7
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 22:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B4389BAC;
	Mon,  1 Jul 2019 20:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADF289498
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 15:14:34 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x61FESVg002124;
 Mon, 1 Jul 2019 10:14:28 -0500
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x61FESD6055557
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 1 Jul 2019 10:14:28 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 1 Jul
 2019 10:14:28 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 1 Jul 2019 10:14:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x61FERDB063745;
 Mon, 1 Jul 2019 10:14:27 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>
Subject: [PATCH 1/4] leds: of: create a child device if the LED node contains
 a "compatible" string
Date: Mon, 1 Jul 2019 17:14:20 +0200
Message-ID: <20190701151423.30768-2-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190701151423.30768-1-jjhiblot@ti.com>
References: <20190701151423.30768-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Mon, 01 Jul 2019 20:58:29 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1561994068;
 bh=O0D/V4WZu3t93vPM9Q9NrNn7oxGBb0WBPibwmXJHyIw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=L8MsFSUTnrHnqjVkDw+kJeTC5NpZ9maijwhPCZrjWWjk9JilKE08XQ61KtYHRS0rO
 92bouxd4Bxee+fmJC++GrIDxB9Oj9TdYm40mgBzDBY+2GhRSPRtthV5kMvYRyKkj6o
 CI864+kZc5V/48lhrYkT/7yfIVli3bfinq8Q6+Yo=
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

VGhpcyBhbGxvd3MgdGhlIExFRCBjb3JlIHRvIHByb2JlIGEgY29uc3VtZXIgZGV2aWNlIHdoZW4g
dGhlIExFRCBpcwpyZWdpc3RlcmVkLiBJbiB0aGF0IHdheSB0aGUgTEVEIGNhbiBiZSBzZWVuIGxp
a2UgYSBtaW5pbWFsaXN0IGJ1cyB0aGF0CmNhbiBoYW5kbGUgYXQgbW9zdCBvbmUgZGV2aWNlLgpU
aGlzIGlzIHVzZWZ1bCB0byBtYW5hZ2Ugc2ltcGxlIGRldmljZXMsIHRoZSBwdXJwb3NlIG9mIHdo
aWNoIGlzCm1vc3RseSB0byBkcml2ZSBhIExFRC4KCk9uZSBleGFtcGxlIHdvdWxkIGJlIGEgTEVE
LWNvbnRyb2xsZWQgYmFja2xpZ2h0LiBUaGUgZGV2aWNlLXRyZWUgd291bGQgbG9vawpsaWtlIHRo
ZSBmb2xsb3dpbmc6Cgp0bGM1OTExNkA0MCB7Cgljb21wYXRpYmxlID0gInRpLHRsYzU5MTA4IjsK
CXJlZyA9IDwweDQwPjsKCglibEAyIHsKCQlsYWJlbCA9ICJiYWNrbGlnaHQiOwoJCXJlZyA9IDww
eDI+OwoKCQljb21wYXRpYmxlID0gImxlZC1iYWNrbGlnaHQiOwoJCWJyaWdodG5lc3MtbGV2ZWxz
ID0gPDAgMjQzIDI0NSAyNDcgMjQ4IDI0OSAyNTEgMjUyIDI1NT47CgkJZGVmYXVsdC1icmlnaHRu
ZXNzLWxldmVsID0gPDg+OwoJfTsKfTsKClNpZ25lZC1vZmYtYnk6IEplYW4tSmFjcXVlcyBIaWJs
b3QgPGpqaGlibG90QHRpLmNvbT4KLS0tCiBkcml2ZXJzL2xlZHMvbGVkLWNsYXNzLmMgfCAxNiAr
KysrKysrKysrKysrKysrCiBpbmNsdWRlL2xpbnV4L2xlZHMuaCAgICAgfCAxMSArKysrKysrKysr
KwogMiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9sZWRzL2xlZC1jbGFzcy5jIGIvZHJpdmVycy9sZWRzL2xlZC1jbGFzcy5jCmluZGV4IDQ3OTNl
Nzc4MDhlMi4uYWJmMGU2MzI4NWI5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2xlZHMvbGVkLWNsYXNz
LmMKKysrIGIvZHJpdmVycy9sZWRzL2xlZC1jbGFzcy5jCkBAIC0xNCw2ICsxNCw3IEBACiAjaW5j
bHVkZSA8bGludXgvbGVkcy5oPgogI2luY2x1ZGUgPGxpbnV4L2xpc3QuaD4KICNpbmNsdWRlIDxs
aW51eC9tb2R1bGUuaD4KKyNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPgogI2luY2x1ZGUg
PGxpbnV4L3NsYWIuaD4KICNpbmNsdWRlIDxsaW51eC9zcGlubG9jay5oPgogI2luY2x1ZGUgPGxp
bnV4L3RpbWVyLmg+CkBAIC0zMDYsNiArMzA3LDE3IEBAIGludCBvZl9sZWRfY2xhc3NkZXZfcmVn
aXN0ZXIoc3RydWN0IGRldmljZSAqcGFyZW50LCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAogCiAJ
bXV0ZXhfdW5sb2NrKCZsZWRfY2Rldi0+bGVkX2FjY2Vzcyk7CiAKKwkvKiBQYXJzZSB0aGUgTEVE
J3Mgbm9kZSBpbiB0aGUgZGV2aWNlLXRyZWUgYW5kIGNyZWF0ZSB0aGUgY29uc3VtZXIKKwkgKiBk
ZXZpY2UgaWYgbmVlZGVkLgorCSAqLworCWlmIChucCkgeworCQlzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZDsKKworCQlwZCA9IG9mX3BsYXRmb3JtX2RldmljZV9jcmVhdGUobnAsIE5VTEwsIGxl
ZF9jZGV2LT5kZXYpOworCQlpZiAocGQpCisJCQlsZWRfY2Rldi0+Y29uc3VtZXIgPSAmcGQtPmRl
djsKKwl9CisKIAlkZXZfZGJnKHBhcmVudCwgIlJlZ2lzdGVyZWQgbGVkIGRldmljZTogJXNcbiIs
CiAJCQlsZWRfY2Rldi0+bmFtZSk7CiAKQEAgLTMyMSw2ICszMzMsMTAgQEAgRVhQT1JUX1NZTUJP
TF9HUEwob2ZfbGVkX2NsYXNzZGV2X3JlZ2lzdGVyKTsKICAqLwogdm9pZCBsZWRfY2xhc3NkZXZf
dW5yZWdpc3RlcihzdHJ1Y3QgbGVkX2NsYXNzZGV2ICpsZWRfY2RldikKIHsKKwkvKiBkZXN0cm95
IHRoZSBjb25zdW1tZXIgZGV2aWNlIGJlZm9yZSByZW1vdmluZyBhbnl0aGluZyBlbHNlICovCisJ
aWYgKGxlZF9jZGV2LT5jb25zdW1lcikKKwkJb2ZfcGxhdGZvcm1fZGV2aWNlX2Rlc3Ryb3kobGVk
X2NkZXYtPmNvbnN1bWVyLCBOVUxMKTsKKwogI2lmZGVmIENPTkZJR19MRURTX1RSSUdHRVJTCiAJ
ZG93bl93cml0ZSgmbGVkX2NkZXYtPnRyaWdnZXJfbG9jayk7CiAJaWYgKGxlZF9jZGV2LT50cmln
Z2VyKQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9sZWRzLmggYi9pbmNsdWRlL2xpbnV4L2xl
ZHMuaAppbmRleCA5YjJiZjU3NGExN2EuLjYzZmViODQ5NWYzZSAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS9saW51eC9sZWRzLmgKKysrIGIvaW5jbHVkZS9saW51eC9sZWRzLmgKQEAgLTkxLDYgKzkxLDEy
IEBAIHN0cnVjdCBsZWRfY2xhc3NkZXYgewogCWludCAoKnBhdHRlcm5fY2xlYXIpKHN0cnVjdCBs
ZWRfY2xhc3NkZXYgKmxlZF9jZGV2KTsKIAogCXN0cnVjdCBkZXZpY2UJCSpkZXY7CisJLyoKKwkg
KiBUaGUgY29uc3VtZXIgZGV2aWNlIGlzIGEgY2hpbGQgZGV2aWNlIGNyZWF0ZWQgYnkgdGhlIExF
RCBjb3JlIGlmIHRoZQorCSAqIGFwcHJvcHJpYXRlIGluZm9ybWF0aW9uIChpZSAiY29tcGF0aWJs
ZSIgc3RyaW5nKSBpcyBhdmFpbGFibGUgaW4gdGhlCisJICogZGV2aWNlIHRyZWUuIEl0cyBsaWZl
IGN5Y2xlIGZvbGxvd3MgdGhlIGxpZmUgY3ljbGUgb2YgdGhlIExFRCBkZXZpY2UuCisJICovCisJ
c3RydWN0IGRldmljZQkJKmNvbnN1bWVyOwogCWNvbnN0IHN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXAJ
Kipncm91cHM7CiAKIAlzdHJ1Y3QgbGlzdF9oZWFkCSBub2RlOwkJCS8qIExFRCBEZXZpY2UgbGlz
dCAqLwpAQCAtMTQxLDYgKzE0NywxMSBAQCBleHRlcm4gdm9pZCBkZXZtX2xlZF9jbGFzc2Rldl91
bnJlZ2lzdGVyKHN0cnVjdCBkZXZpY2UgKnBhcmVudCwKIGV4dGVybiB2b2lkIGxlZF9jbGFzc2Rl
dl9zdXNwZW5kKHN0cnVjdCBsZWRfY2xhc3NkZXYgKmxlZF9jZGV2KTsKIGV4dGVybiB2b2lkIGxl
ZF9jbGFzc2Rldl9yZXN1bWUoc3RydWN0IGxlZF9jbGFzc2RldiAqbGVkX2NkZXYpOwogCitzdGF0
aWMgaW5saW5lIHN0cnVjdCBsZWRfY2xhc3NkZXYgKnRvX2xlZF9jbGFzc2RldihzdHJ1Y3QgZGV2
aWNlICpkZXYpCit7CisJcmV0dXJuIChzdHJ1Y3QgbGVkX2NsYXNzZGV2ICopIGRldl9nZXRfZHJ2
ZGF0YShkZXYpOworfQorCiAvKioKICAqIGxlZF9ibGlua19zZXQgLSBzZXQgYmxpbmtpbmcgd2l0
aCBzb2Z0d2FyZSBmYWxsYmFjawogICogQGxlZF9jZGV2OiB0aGUgTEVEIHRvIHN0YXJ0IGJsaW5r
aW5nCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
