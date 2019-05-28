Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 125172C144
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 10:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635E389D43;
	Tue, 28 May 2019 08:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53FF89C3B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 08:28:55 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4S8SraM125394;
 Tue, 28 May 2019 03:28:53 -0500
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4S8Srke115204
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 03:28:53 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 03:28:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 03:28:52 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4S8Rxuo125039;
 Tue, 28 May 2019 03:28:50 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri
 Sarha <jsarha@ti.com>, Benoit Parrot <bparrot@ti.com>
Subject: [PATCHv4 20/24] drm/bridge: tc358767: copy the mode data,
 instead of storing the pointer
Date: Tue, 28 May 2019 11:27:43 +0300
Message-ID: <20190528082747.3631-21-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528082747.3631-1-tomi.valkeinen@ti.com>
References: <20190528082747.3631-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559032133;
 bh=+lAsyVO4v/OgZEzF3vopHPTns+I7De0g6CNbzAnhPgg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=tYPYAZiF56kwhZxDZXRqOgFtIXL6jb127BRDosCuAj9Pu8XR8pvIz4V6xKp1gA4KA
 LTtt4oKwHaB6ctB+RhoqrChaBQI9FKoX8yNhE3Nj2jSlCHL1jp5fpx1PR0mp/HnyyF
 cDCvjwVFnbPdIybBGb4Y5Bg1Hf6MuWnEz84MeoZw=
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

SW4gdGNfYnJpZGdlX21vZGVfc2V0IGNhbGxiYWNrLCB3ZSBzdG9yZSB0aGUgcG9pbnRlciB0byB0
aGUgZ2l2ZW4KZHJtX2Rpc3BsYXlfbW9kZSwgYW5kIHVzZSB0aGUgbW9kZSBsYXRlci4gU3Rvcmlu
ZyBhIHBvaW50ZXIgaW4gc3VjaCBhCndheSBsb29rcyB2ZXJ5IHN1c3BpY2lvdXMgdG8gbWUsIGFu
ZCBJIGhhdmUgb2JzZXJ2ZWQgb2RkIGlzc3VlcyB3aGVyZQp0aGUgdGltaW5ncyB3ZXJlIGFwcGFy
ZW50bHkgKGF0IGxlYXN0IG1vc3RseSkgemVyby4KCkRvIGEgY29weSBvZiB0aGUgZHJtX2Rpc3Bs
YXlfbW9kZSBpbnN0ZWFkIHRvIGVuc3VyZSB3ZSBkb24ndCByZWZlciB0bwpmcmVlZC9tb2RpZmll
ZCBkYXRhLgoKU2lnbmVkLW9mZi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRp
LmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIHwgOCArKysrLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3RjMzU4NzY3LmMKaW5kZXggODNjYjQzYWY2MGU1Li5mZmNiZWNmNjlkNDAgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3RjMzU4NzY3LmMKQEAgLTIwNSw3ICsyMDUsNyBAQCBzdHJ1Y3QgdGNfZGF0YSB7CiAJ
LyogZGlzcGxheSBlZGlkICovCiAJc3RydWN0IGVkaWQJCSplZGlkOwogCS8qIGN1cnJlbnQgbW9k
ZSAqLwotCWNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlCSptb2RlOworCXN0cnVjdCBkcm1f
ZGlzcGxheV9tb2RlCW1vZGU7CiAKIAl1MzIJCQlyZXY7CiAJdTgJCQlhc3NyOwpAQCAtMTAzMiwx
MiArMTAzMiwxMiBAQCBzdGF0aWMgaW50IHRjX3N0cmVhbV9lbmFibGUoc3RydWN0IHRjX2RhdGEg
KnRjKQogCS8qIFBYTCBQTEwgc2V0dXAgKi8KIAlpZiAodGNfdGVzdF9wYXR0ZXJuKSB7CiAJCXJl
dCA9IHRjX3B4bF9wbGxfZW4odGMsIGNsa19nZXRfcmF0ZSh0Yy0+cmVmY2xrKSwKLQkJCQkgICAg
MTAwMCAqIHRjLT5tb2RlLT5jbG9jayk7CisJCQkJICAgIDEwMDAgKiB0Yy0+bW9kZS5jbG9jayk7
CiAJCWlmIChyZXQpCiAJCQlnb3RvIGVycjsKIAl9CiAKLQlyZXQgPSB0Y19zZXRfdmlkZW9fbW9k
ZSh0YywgdGMtPm1vZGUpOworCXJldCA9IHRjX3NldF92aWRlb19tb2RlKHRjLCAmdGMtPm1vZGUp
OwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKQEAgLTExODAsNyArMTE4MCw3IEBAIHN0YXRp
YyB2b2lkIHRjX2JyaWRnZV9tb2RlX3NldChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAogewog
CXN0cnVjdCB0Y19kYXRhICp0YyA9IGJyaWRnZV90b190YyhicmlkZ2UpOwogCi0JdGMtPm1vZGUg
PSBtb2RlOworCXRjLT5tb2RlID0gKm1vZGU7CiB9CiAKIHN0YXRpYyBpbnQgdGNfY29ubmVjdG9y
X2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQotLSAKVGV4YXMgSW5z
dHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClkt
dHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNp
bmtpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
