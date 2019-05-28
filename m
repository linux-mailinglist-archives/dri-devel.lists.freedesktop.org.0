Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E55552C13D
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 10:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69B389CB8;
	Tue, 28 May 2019 08:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2907589CAF
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 08:28:33 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4S8SR8K031905;
 Tue, 28 May 2019 03:28:27 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4S8SR7Y082845
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 03:28:27 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 03:28:27 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 03:28:27 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4S8Rxue125039;
 Tue, 28 May 2019 03:28:25 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri
 Sarha <jsarha@ti.com>, Benoit Parrot <bparrot@ti.com>
Subject: [PATCHv4 10/24] drm/bridge: tc358767: add link disable function
Date: Tue, 28 May 2019 11:27:33 +0300
Message-ID: <20190528082747.3631-11-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528082747.3631-1-tomi.valkeinen@ti.com>
References: <20190528082747.3631-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559032107;
 bh=E9OK9geYrWh2r44XMJ6sVAh6zf+T0He0OZJ9NtE9SI0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=tVmBqlHQLwnO5fnXpKKqZfrn7lKOatqGD8L755TtzmRLTdpm0MJFkWKfYM4orVkKN
 vmJ32mm3u+PHQR3rn06y0hyBDuaMn2kXhVRPWywbhfv/pvbt//9HgPKTpcKXDcQL39
 XecYxGsU+MH2jjbBPzEM7hZ2+HW5lLh/K6MIq7hk=
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

Q3VycmVudGx5IHdlIGhhdmUgdGNfbWFpbl9saW5rX3NldHVwKCksIHdoaWNoIGNvbmZpZ3VyZXMg
YW5kIGVuYWJsZWQgdGhlCmxpbmssIGJ1dCB3ZSBoYXZlIG5vIGNvdW50ZXItcGFydCBmb3IgZGlz
YWJsaW5nIHRoZSBsaW5rLgoKQWRkIHRjX21haW5fbGlua19kaXNhYmxlLCBhbmQgcmVuYW1lIHRj
X21haW5fbGlua19zZXR1cCB0bwp0Y19tYWluX2xpbmtfZW5hYmxlLgoKU2lnbmVkLW9mZi1ieTog
VG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJ6
ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS90YzM1ODc2Ny5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Rj
MzU4NzY3LmMKaW5kZXggNDY5NzU2NzZjODhjLi4yMzIzYTIyNjU2ZTggMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3RjMzU4NzY3LmMKQEAgLTgyMiw3ICs4MjIsNyBAQCBzdGF0aWMgaW50IHRjX2xpbmtfdHJh
aW5pbmcoc3RydWN0IHRjX2RhdGEgKnRjLCBpbnQgcGF0dGVybikKIAlyZXR1cm4gcmV0OwogfQog
Ci1zdGF0aWMgaW50IHRjX21haW5fbGlua19zZXR1cChzdHJ1Y3QgdGNfZGF0YSAqdGMpCitzdGF0
aWMgaW50IHRjX21haW5fbGlua19lbmFibGUoc3RydWN0IHRjX2RhdGEgKnRjKQogewogCXN0cnVj
dCBkcm1fZHBfYXV4ICphdXggPSAmdGMtPmF1eDsKIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSB0Yy0+
ZGV2OwpAQCAtODM3LDYgKzgzNyw4IEBAIHN0YXRpYyBpbnQgdGNfbWFpbl9saW5rX3NldHVwKHN0
cnVjdCB0Y19kYXRhICp0YykKIAlpZiAoIXRjLT5tb2RlKQogCQlyZXR1cm4gLUVJTlZBTDsKIAor
CWRldl9kYmcodGMtPmRldiwgImxpbmsgZW5hYmxlXG4iKTsKKwogCXRjX3dyaXRlKERQMF9TUkND
VFJMLCB0Y19zcmNjdHJsKHRjKSk7CiAJLyogU1NDRyBhbmQgQlcyNyBvbiBEUDEgbXVzdCBiZSBz
ZXQgdG8gdGhlIHNhbWUgYXMgb24gRFAwICovCiAJdGNfd3JpdGUoRFAxX1NSQ0NUUkwsCkBAIC0x
MDA2LDYgKzEwMDgsMjAgQEAgc3RhdGljIGludCB0Y19tYWluX2xpbmtfc2V0dXAoc3RydWN0IHRj
X2RhdGEgKnRjKQogCXJldHVybiByZXQ7CiB9CiAKK3N0YXRpYyBpbnQgdGNfbWFpbl9saW5rX2Rp
c2FibGUoc3RydWN0IHRjX2RhdGEgKnRjKQoreworCWludCByZXQ7CisKKwlkZXZfZGJnKHRjLT5k
ZXYsICJsaW5rIGRpc2FibGVcbiIpOworCisJdGNfd3JpdGUoRFAwX1NSQ0NUUkwsIDApOworCXRj
X3dyaXRlKERQMENUTCwgMCk7CisKKwlyZXR1cm4gMDsKK2VycjoKKwlyZXR1cm4gcmV0OworfQor
CiBzdGF0aWMgaW50IHRjX3N0cmVhbV9lbmFibGUoc3RydWN0IHRjX2RhdGEgKnRjKQogewogCWlu
dCByZXQ7CkBAIC0xMDg0LDE1ICsxMTAwLDE2IEBAIHN0YXRpYyB2b2lkIHRjX2JyaWRnZV9lbmFi
bGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKIAlzdHJ1Y3QgdGNfZGF0YSAqdGMgPSBicmlk
Z2VfdG9fdGMoYnJpZGdlKTsKIAlpbnQgcmV0OwogCi0JcmV0ID0gdGNfbWFpbl9saW5rX3NldHVw
KHRjKTsKKwlyZXQgPSB0Y19tYWluX2xpbmtfZW5hYmxlKHRjKTsKIAlpZiAocmV0IDwgMCkgewot
CQlkZXZfZXJyKHRjLT5kZXYsICJtYWluIGxpbmsgc2V0dXAgZXJyb3I6ICVkXG4iLCByZXQpOwor
CQlkZXZfZXJyKHRjLT5kZXYsICJtYWluIGxpbmsgZW5hYmxlIGVycm9yOiAlZFxuIiwgcmV0KTsK
IAkJcmV0dXJuOwogCX0KIAogCXJldCA9IHRjX3N0cmVhbV9lbmFibGUodGMpOwogCWlmIChyZXQg
PCAwKSB7CiAJCWRldl9lcnIodGMtPmRldiwgIm1haW4gbGluayBzdHJlYW0gc3RhcnQgZXJyb3I6
ICVkXG4iLCByZXQpOworCQl0Y19tYWluX2xpbmtfZGlzYWJsZSh0Yyk7CiAJCXJldHVybjsKIAl9
CiAKQEAgLTExMDksNiArMTEyNiwxMCBAQCBzdGF0aWMgdm9pZCB0Y19icmlkZ2VfZGlzYWJsZShz
dHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQogCXJldCA9IHRjX3N0cmVhbV9kaXNhYmxlKHRjKTsK
IAlpZiAocmV0IDwgMCkKIAkJZGV2X2Vycih0Yy0+ZGV2LCAibWFpbiBsaW5rIHN0cmVhbSBzdG9w
IGVycm9yOiAlZFxuIiwgcmV0KTsKKworCXJldCA9IHRjX21haW5fbGlua19kaXNhYmxlKHRjKTsK
KwlpZiAocmV0IDwgMCkKKwkJZGV2X2Vycih0Yy0+ZGV2LCAibWFpbiBsaW5rIGRpc2FibGUgZXJy
b3I6ICVkXG4iLCByZXQpOwogfQogCiBzdGF0aWMgdm9pZCB0Y19icmlkZ2VfcG9zdF9kaXNhYmxl
KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5k
IE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3Mg
SUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
