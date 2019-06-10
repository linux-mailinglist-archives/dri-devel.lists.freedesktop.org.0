Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1AA3B694
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 15:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D54890BC;
	Mon, 10 Jun 2019 13:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B39890BA
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 13:58:12 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5ADw97q074708;
 Mon, 10 Jun 2019 08:58:09 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5ADw9Ws038798
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 10 Jun 2019 08:58:09 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 10
 Jun 2019 08:58:08 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 10 Jun 2019 08:58:08 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5ADw5A5031652;
 Mon, 10 Jun 2019 08:58:07 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/2] drm/bridge: tfp410: fix use of cancel_delayed_work_sync
Date: Mon, 10 Jun 2019 16:57:39 +0300
Message-ID: <20190610135739.6077-2-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190610135739.6077-1-tomi.valkeinen@ti.com>
References: <20190610135739.6077-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1560175089;
 bh=6Qnx1ZS6yDoLhsy9Pw/hbJgJ21lXELEXI5PTGbIoMVY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=sdNgQPOn2nSeN1Yx+CpjHCSDOUGWVcJCPoVBH/cX2RqosM1+E59UtE7D8lSKW5JYl
 ObD5DQmxfFjhO0EBPTDai3g/5DDpRaOx2826vKOIBD63DXp4avJpgpMioP+k9RiYqC
 c3GcPFnCbuqU0ucdQ17I/FEwEK5BI+Ws06foo/l8=
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

V2UgdXNlIGRlbGF5ZWRfd29yayBpbiBIUEQgaGFuZGxpbmcsIGFuZCBjYW5jZWwgYW55IHNjaGVk
dWxlZCB3b3JrIGluCnRmcDQxMF9maW5pIHVzaW5nIGNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygp
LiBIb3dldmVyLCB3ZSBoYXZlIG9ubHkKaW5pdGlhbGl6ZWQgdGhlIGRlbGF5ZWQgd29yayBpZiB3
ZSBhY3R1YWxseSBoYXZlIGEgSFBEIGludGVycnVwdApjb25maWd1cmVkIGluIHRoZSBEVCwgYnV0
IGluIHRoZSB0ZnA0MTBfZmluaSwgd2UgYWx3YXlzIGNhbmNlbCB0aGUgd29yaywKcG9zc2libHkg
Y2F1c2luZyBhIFdBUk4oKS4KCkZpeCB0aGlzIGJ5IGRvaW5nIHRoZSBjYW5jZWwgb25seSBpZiB3
ZSBhY3R1YWxseSBoYWQgdGhlIGRlbGF5ZWQgd29yawpzZXQgdXAuCgpTaWduZWQtb2ZmLWJ5OiBU
b21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvdGktdGZwNDEwLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
dGktdGZwNDEwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jCmluZGV4IDlm
MDgzNmNjNzEyYi4uMDdiNjk1MTcyZGIyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3RpLXRmcDQxMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMK
QEAgLTM4MSw3ICszODEsOCBAQCBzdGF0aWMgaW50IHRmcDQxMF9maW5pKHN0cnVjdCBkZXZpY2Ug
KmRldikKIHsKIAlzdHJ1Y3QgdGZwNDEwICpkdmkgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKIAot
CWNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygmZHZpLT5ocGRfd29yayk7CisJaWYgKGR2aS0+aHBk
X2lycSA+PSAwKQorCQljYW5jZWxfZGVsYXllZF93b3JrX3N5bmMoJmR2aS0+aHBkX3dvcmspOwog
CiAJZHJtX2JyaWRnZV9yZW1vdmUoJmR2aS0+YnJpZGdlKTsKIAotLSAKVGV4YXMgSW5zdHJ1bWVu
dHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVz
L0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
