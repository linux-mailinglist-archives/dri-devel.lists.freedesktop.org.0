Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD822C13E
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 10:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5886789CC9;
	Tue, 28 May 2019 08:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2F389C99
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 08:28:27 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4S8SP8S125202;
 Tue, 28 May 2019 03:28:25 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4S8SPod114839
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 03:28:25 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 03:28:24 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 03:28:24 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4S8Rxud125039;
 Tue, 28 May 2019 03:28:22 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri
 Sarha <jsarha@ti.com>, Benoit Parrot <bparrot@ti.com>
Subject: [PATCHv4 09/24] drm/bridge: tc358767: move PXL PLL enable/disable to
 stream enable/disable
Date: Tue, 28 May 2019 11:27:32 +0300
Message-ID: <20190528082747.3631-10-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528082747.3631-1-tomi.valkeinen@ti.com>
References: <20190528082747.3631-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559032105;
 bh=WAmCS1k13oHgP0LQKJWkZ2w9WvxO5BOLr26olZEsKNI=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=jpy21kwi6iT1Q4b3+8yzbNsWSE3DiOKn96AGgjFTUSZjM9G1Jn2IpooZCXhqYcFa0
 g1jOspZqp5Fgqu41KlTog2yyDoEjVxuNc1gkYOLhfTvGopqk7JcjbjB28EV6bHn6cv
 Nuoj5WNpxh1kPK6UbVsj2cXI7JQZE6Dq5g/pSelQ=
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

V2Ugc2V0IHVwIHRoZSBQWEwgUExMIGluc2lkZSB0Y19tYWluX2xpbmtfc2V0dXAuIFRoaXMgaXMg
dW5uZWNlc3NhcnksCmFuZCBtYWtlcyB0Y19tYWluX2xpbmtfc2V0dXAgZGVwZW5kIG9uIHRoZSB2
aWRlby1tb2RlLCB3aGljaCBzaG91bGQgbm90CmJlIHRoZSBjYXNlLiBBcyBQWEwgUExMIGlzIHVz
ZWQgb25seSBmb3IgdGhlIHZpZGVvIHN0cmVhbSAoYW5kIG9ubHkgd2hlbgp1c2luZyB0aGUgSFcg
dGVzdCBwYXR0ZXJuKSwgbGV0J3MgbW92ZSB0aGUgUFhMIFBMTCBzZXR1cCBpbnRvCnRjX3N0cmVh
bV9lbmFibGUuCgpBbHNvLCBjdXJyZW50bHkgdGhlIFBYTCBQTEwgaXMgb25seSBkaXNhYmxlZCBp
ZiB0aGUgZHJpdmVyIGlmIHJlbW92ZWQuCkxldCdzIGRpc2FibGUgdGhlIFBYTCBQTEwgd2hlbiB0
aGUgc3RyZWFtIGlzIGRpc2FibGVkLgoKU2lnbmVkLW9mZi1ieTogVG9taSBWYWxrZWluZW4gPHRv
bWkudmFsa2VpbmVuQHRpLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFA
c2Ftc3VuZy5jb20+ClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNo
YXJ0QGlkZWFzb25ib2FyZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2
Ny5jIHwgMjAgKysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRp
b25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKaW5kZXgg
YTM3OWI2MzY4MTU3Li40Njk3NTY3NmM4OGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvdGMzNTg3NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMK
QEAgLTg3NywxNCArODc3LDYgQEAgc3RhdGljIGludCB0Y19tYWluX2xpbmtfc2V0dXAoc3RydWN0
IHRjX2RhdGEgKnRjKQogCXRjX3dyaXRlKERQMV9QTExDVFJMLCBQTExVUERBVEUgfCBQTExFTik7
CiAJdGNfd2FpdF9wbGxfbG9jayh0Yyk7CiAKLQkvKiBQWEwgUExMIHNldHVwICovCi0JaWYgKHRj
X3Rlc3RfcGF0dGVybikgewotCQlyZXQgPSB0Y19weGxfcGxsX2VuKHRjLCBjbGtfZ2V0X3JhdGUo
dGMtPnJlZmNsayksCi0JCQkJICAgIDEwMDAgKiB0Yy0+bW9kZS0+Y2xvY2spOwotCQlpZiAocmV0
KQotCQkJZ290byBlcnI7Ci0JfQotCiAJLyogUmVzZXQvRW5hYmxlIE1haW4gTGlua3MgKi8KIAlk
cF9waHlfY3RybCB8PSBEUF9QSFlfUlNUIHwgUEhZX00xX1JTVCB8IFBIWV9NMF9SU1Q7CiAJdGNf
d3JpdGUoRFBfUEhZX0NUUkwsIGRwX3BoeV9jdHJsKTsKQEAgLTEwMjEsNiArMTAxMywxNCBAQCBz
dGF0aWMgaW50IHRjX3N0cmVhbV9lbmFibGUoc3RydWN0IHRjX2RhdGEgKnRjKQogCiAJZGV2X2Ri
Zyh0Yy0+ZGV2LCAiZW5hYmxlIHZpZGVvIHN0cmVhbVxuIik7CiAKKwkvKiBQWEwgUExMIHNldHVw
ICovCisJaWYgKHRjX3Rlc3RfcGF0dGVybikgeworCQlyZXQgPSB0Y19weGxfcGxsX2VuKHRjLCBj
bGtfZ2V0X3JhdGUodGMtPnJlZmNsayksCisJCQkJICAgIDEwMDAgKiB0Yy0+bW9kZS0+Y2xvY2sp
OworCQlpZiAocmV0KQorCQkJZ290byBlcnI7CisJfQorCiAJcmV0ID0gdGNfc2V0X3ZpZGVvX21v
ZGUodGMsIHRjLT5tb2RlKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwpAQCAtMTA2NSw2ICsx
MDY1LDggQEAgc3RhdGljIGludCB0Y19zdHJlYW1fZGlzYWJsZShzdHJ1Y3QgdGNfZGF0YSAqdGMp
CiAKIAl0Y193cml0ZShEUDBDVEwsIDApOwogCisJdGNfcHhsX3BsbF9kaXModGMpOworCiAJcmV0
dXJuIDA7CiBlcnI6CiAJcmV0dXJuIHJldDsKQEAgLTEzOTEsOCArMTM5Myw2IEBAIHN0YXRpYyBp
bnQgdGNfcmVtb3ZlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCiAJZHJtX2JyaWRnZV9yZW1v
dmUoJnRjLT5icmlkZ2UpOwogCWRybV9kcF9hdXhfdW5yZWdpc3RlcigmdGMtPmF1eCk7CiAKLQl0
Y19weGxfcGxsX2Rpcyh0Yyk7Ci0KIAlyZXR1cm4gMDsKIH0KIAotLSAKVGV4YXMgSW5zdHJ1bWVu
dHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVz
L0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
