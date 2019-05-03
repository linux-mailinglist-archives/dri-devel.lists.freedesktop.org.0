Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F0512DA6
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 14:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9404F89F47;
	Fri,  3 May 2019 12:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D7D89F45
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 12:31:34 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x43CVV83098078;
 Fri, 3 May 2019 07:31:31 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x43CVVkl122427
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2019 07:31:31 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 3 May
 2019 07:31:31 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 3 May 2019 07:31:31 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x43CUYu5002029;
 Fri, 3 May 2019 07:31:28 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCHv3 21/23] drm/bridge: tc358767: add GPIO & interrupt registers
Date: Fri, 3 May 2019 15:29:47 +0300
Message-ID: <20190503122949.12266-22-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190503122949.12266-1-tomi.valkeinen@ti.com>
References: <20190503122949.12266-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556886691;
 bh=fQMbc12JCrxHBXa0NeXGHRWscpNmu/fNbPmtRjwNigE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=V02Sdp2fDkBFTpUxCiuZip2a2wwYpKBZLYs77ps67zLkRukM9sxWc//nGQ1EFmc7C
 kzM6DB18T3zyUlKJNNZwy1vXr5w+X0PFQbonPhYT5g5+I4bMUzfA7JwflcAAjNZhWx
 6f1m1WLwd+XPiae80DW8NvGPILifKEnmXf+QSw00=
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

QWRkIEdQSU8gYW5kIGludGVycnVwdCByZWxhdGVkIHJlZ2lzdGVycyBmb3IgSFBEIHdvcmsuIE1h
cmsgSU5UU1RTX0cgYW5kCkdQSU9JIGFzIHZvbGF0aWxlLgoKU2lnbmVkLW9mZi1ieTogVG9taSBW
YWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFq
ZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1
ODc2Ny5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGMzNTg3NjcuYwppbmRleCA4ZjZkNjAxZGVmM2YuLjdjMjc1YjhiYmFiYyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwpAQCAtNzgsNiArNzgsMTIgQEAKICNkZWZpbmUg
RFAwX1ZJRFNSQ19EU0lfUlgJCSgxIDw8IDApCiAjZGVmaW5lIERQMF9WSURTUkNfRFBJX1JYCQko
MiA8PCAwKQogI2RlZmluZSBEUDBfVklEU1JDX0NPTE9SX0JBUgkJKDMgPDwgMCkKKyNkZWZpbmUg
R1BJT00JCQkweDA1NDAKKyNkZWZpbmUgR1BJT0kJCQkweDA1NGMKKyNkZWZpbmUgSU5UQ1RMX0cJ
CTB4MDU2MAorI2RlZmluZSBJTlRTVFNfRwkJMHgwNTY0CisjZGVmaW5lIElOVF9HUDBfTENOVAkJ
MHgwNTg0CisjZGVmaW5lIElOVF9HUDFfTENOVAkJMHgwNTg4CiAKIC8qIENvbnRyb2wgKi8KICNk
ZWZpbmUgRFAwQ1RMCQkJMHgwNjAwCkBAIC0xMjc5LDYgKzEyODUsOCBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IHJlZ21hcF9yYW5nZSB0Y192b2xhdGlsZV9yYW5nZXNbXSA9IHsKIAlyZWdtYXBfcmVn
X3JhbmdlKERQX1BIWV9DVFJMLCBEUF9QSFlfQ1RSTCksCiAJcmVnbWFwX3JlZ19yYW5nZShEUDBf
UExMQ1RSTCwgUFhMX1BMTENUUkwpLAogCXJlZ21hcF9yZWdfcmFuZ2UoVkZVRU4wLCBWRlVFTjAp
LAorCXJlZ21hcF9yZWdfcmFuZ2UoSU5UU1RTX0csIElOVFNUU19HKSwKKwlyZWdtYXBfcmVnX3Jh
bmdlKEdQSU9JLCBHUElPSSksCiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9hY2Nl
c3NfdGFibGUgdGNfdm9sYXRpbGVfdGFibGUgPSB7Ci0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5s
YW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5l
c3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
