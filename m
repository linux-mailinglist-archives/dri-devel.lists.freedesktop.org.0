Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2B23B692
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 15:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686B2890BA;
	Mon, 10 Jun 2019 13:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF99890BC
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 13:58:12 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5ADw7tt009370;
 Mon, 10 Jun 2019 08:58:07 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5ADw7jW109920
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 10 Jun 2019 08:58:07 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 10
 Jun 2019 08:58:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 10 Jun 2019 08:58:07 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5ADw5A4031652;
 Mon, 10 Jun 2019 08:58:06 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 1/2] drm/bridge: tfp410: fix memleak in get_modes()
Date: Mon, 10 Jun 2019 16:57:38 +0300
Message-ID: <20190610135739.6077-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1560175087;
 bh=4ayWUuZoKTT/b0/9sHrkudRNq5ozR8xs+hB5DL6czMA=;
 h=From:To:CC:Subject:Date;
 b=bx3dL1AkqHBUcb+qcjEAHuBk4k/4ENDj4ZjWL1ULH2oUW/jYQew7dL9wlhDHzECyU
 BL9QNzGCgS6dWGKmAELJSuhTiYMAZ1/VOKbjufpuq9M2wfUUW06WUwDr53mWs+rCqy
 WaZB6QW37rs394nyJAHJY+HaCK15mEg344faFzpw=
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
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgZG9uJ3QgZnJlZSB0aGUgZWRpZCBibG9iIGFsbG9jYXRlZCBieSB0aGUgY2FsbCB0byBkcm1f
Z2V0X2VkaWQoKSwKY2F1c2luZyBhIG1lbWxlYWsuIEZpeCB0aGlzIGJ5IGNhbGxpbmcga2ZyZWUo
ZWRpZCkgYXQgdGhlIGVuZCBvZiB0aGUKZ2V0X21vZGVzKCkuCgpTaWduZWQtb2ZmLWJ5OiBUb21p
IFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvdGktdGZwNDEwLmMgfCA3ICsrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3RpLXRmcDQxMC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYwppbmRleCA4
YjBlNzFiZDNjYTcuLjlmMDgzNmNjNzEyYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS90aS10ZnA0MTAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5j
CkBAIC03MCw3ICs3MCwxMiBAQCBzdGF0aWMgaW50IHRmcDQxMF9nZXRfbW9kZXMoc3RydWN0IGRy
bV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIAogCWRybV9jb25uZWN0b3JfdXBkYXRlX2VkaWRfcHJv
cGVydHkoY29ubmVjdG9yLCBlZGlkKTsKIAotCXJldHVybiBkcm1fYWRkX2VkaWRfbW9kZXMoY29u
bmVjdG9yLCBlZGlkKTsKKwlyZXQgPSBkcm1fYWRkX2VkaWRfbW9kZXMoY29ubmVjdG9yLCBlZGlk
KTsKKworCWtmcmVlKGVkaWQpOworCisJcmV0dXJuIHJldDsKKwogZmFsbGJhY2s6CiAJLyogTm8g
RURJRCwgZmFsbGJhY2sgb24gdGhlIFhHQSBzdGFuZGFyZCBtb2RlcyAqLwogCXJldCA9IGRybV9h
ZGRfbW9kZXNfbm9lZGlkKGNvbm5lY3RvciwgMTkyMCwgMTIwMCk7Ci0tIApUZXhhcyBJbnN0cnVt
ZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5u
dXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
