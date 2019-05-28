Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAC32C13F
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 10:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DCF89CBA;
	Tue, 28 May 2019 08:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287E289CBA
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 08:28:37 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4S8SYi4032114;
 Tue, 28 May 2019 03:28:34 -0500
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4S8SYSa114988
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 03:28:34 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 03:28:32 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 03:28:32 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4S8Rxug125039;
 Tue, 28 May 2019 03:28:30 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri
 Sarha <jsarha@ti.com>, Benoit Parrot <bparrot@ti.com>
Subject: [PATCHv4 12/24] drm/bridge: tc358767: ensure DP is disabled before LT
Date: Tue, 28 May 2019 11:27:35 +0300
Message-ID: <20190528082747.3631-13-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528082747.3631-1-tomi.valkeinen@ti.com>
References: <20190528082747.3631-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559032114;
 bh=3Cioh3lAnvpUlufOPRXi+91OrkzKbd2Fs9t8SDe6AwI=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=vp0XHAboobLFGLGUXS7oScFNHVHp512DjhgC+hxjQxDG/plhIih5GYqIAnUxKjzId
 s8E1H0TWnSwzGqZwc/BtIFqDLSVXzAqPnRnciimS0JzqLUdnR1pm7p6RrYFpVIInHl
 FrNrr9NdfZZf6HZmSnK1MIqDVn7Dg18J4ro02QJ8=
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

TGluayB0cmFpbmluZyB3aWxsIHNvbWV0aW1lcyBmYWlsIGlmIHRoZSBEUCBsaW5rIGlzIGVuYWJs
ZWQgd2hlbgp0Y19tYWluX2xpbmtfZW5hYmxlKCkgaXMgY2FsbGVkLiBUaGUgZHJpdmVyIG1ha2Vz
IHN1cmUgdGhlIERQIGxpbmsgaXMKZGlzYWJsZWQgd2hlbiB0aGUgRFAgb3V0cHV0IGlzIGRpc2Fi
bGVkLCBhbmQgd2UgbmV2ZXIgZW5hYmxlIHRoZSBEUAp3aXRob3V0IGZpcnN0IGRpc2FibGluZyBp
dCwgc28gdGhpcyBzaG91bGQgbmV2ZXIgaGFwcGVuLgoKSG93ZXZlciwgYXMgdGhlIEhXIGJlaGF2
aW9yIHNlZW1zIHRvIGJlIHNvbWV3aGF0IHJhbmRvbSBpZiBEUCBsaW5rIGhhcwplcnJvbmVvdXNs
eSBiZWVuIGxlZnQgZW5hYmxlZCwgbGV0J3MgYWRkIGEgV0FSTl9PTigpIGZvciB0aGUgY2FzZSBh
bmQKc2V0IERQMENUTCB0byAwLgoKU2lnbmVkLW9mZi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWku
dmFsa2VpbmVuQHRpLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ft
c3VuZy5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIHwgNCArKysr
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2
Ny5jCmluZGV4IGYwMDRkYjA2ZGVlOS4uY2NmNGM4Y2ZiYjUyIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90
YzM1ODc2Ny5jCkBAIC04MzksNiArODM5LDEwIEBAIHN0YXRpYyBpbnQgdGNfbWFpbl9saW5rX2Vu
YWJsZShzdHJ1Y3QgdGNfZGF0YSAqdGMpCiAKIAlkZXZfZGJnKHRjLT5kZXYsICJsaW5rIGVuYWJs
ZVxuIik7CiAKKwl0Y19yZWFkKERQMENUTCwgJnZhbHVlKTsKKwlpZiAoV0FSTl9PTih2YWx1ZSAm
IERQX0VOKSkKKwkJdGNfd3JpdGUoRFAwQ1RMLCAwKTsKKwogCXRjX3dyaXRlKERQMF9TUkNDVFJM
LCB0Y19zcmNjdHJsKHRjKSk7CiAJLyogU1NDRyBhbmQgQlcyNyBvbiBEUDEgbXVzdCBiZSBzZXQg
dG8gdGhlIHNhbWUgYXMgb24gRFAwICovCiAJdGNfd3JpdGUoRFAxX1NSQ0NUUkwsCi0tIApUZXhh
cyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5r
aS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTog
SGVsc2lua2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
