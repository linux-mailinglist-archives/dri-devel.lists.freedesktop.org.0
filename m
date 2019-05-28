Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1BC2C13C
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 10:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685EB89CB5;
	Tue, 28 May 2019 08:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62EA089CA4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 08:28:33 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4S8SUtV036730;
 Tue, 28 May 2019 03:28:30 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4S8SUQP008684
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 03:28:30 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 03:28:29 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 03:28:29 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4S8Rxuf125039;
 Tue, 28 May 2019 03:28:27 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri
 Sarha <jsarha@ti.com>, Benoit Parrot <bparrot@ti.com>
Subject: [PATCHv4 11/24] drm/bridge: tc358767: disable only video stream in
 tc_stream_disable
Date: Tue, 28 May 2019 11:27:34 +0300
Message-ID: <20190528082747.3631-12-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528082747.3631-1-tomi.valkeinen@ti.com>
References: <20190528082747.3631-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559032110;
 bh=SedRjre2xTL1u2YwW9+kMyaMm6yrXa2oF99ONnZ7j+8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=y6VEsHclFKHxDX0qQrZwvFEXK12ECUBxTV0P9AQX2QRvD3mYi5LpU2MOlesbOapzx
 dfb1F9Q9SSW3TLa+EC/fs7inkJGTeW4qPd5dCoUHkSLI1qSoIPx0yDOOsAiLdK+cFg
 ermbHJrDbXux9WM9p4Q4O0Z3VYBxhaohFz2c8fyE=
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

Q3VycmVudGx5IHRoZSBjb2RlIHdyaXRlcyAwIHRvIERQMENUTCBpbiB0Y19zdHJlYW1fZGlzYWJs
ZSgpLCB3aGljaApkaXNhYmxlcyB0aGUgd2hvbGUgRFAgbGluayBpbnN0ZWFkIG9mIGp1c3QgdGhl
IHZpZGVvIHN0cmVhbS4gV2UgYWx3YXlzCmRpc2FibGUgdGhlIGxpbmsgYW5kIHRoZSBzdHJlYW0g
dG9nZXRoZXIgZnJvbSB0Y19icmlkZ2VfZGlzYWJsZSgpLCBzbwp0aGlzIGRvZXNuJ3QgY2F1c2Ug
YW55IGlzc3Vlcy4KCk5ldmVydGhlbGVzcywgZml4IHRoaXMgYnkgb25seSBjbGVhcmluZyBWSURf
RU4gaW4gdGNfc3RyZWFtX2Rpc2FibGUgdG8Kc3RvcCB0aGUgdmlkZW8gc3RyZWFtIHdoaWxlIGtl
ZXBpbmcgdGhlIGxpbmsgZW5hYmxlZC4KClNpZ25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0
b21pLnZhbGtlaW5lbkB0aS5jb20+ClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRh
QHNhbXN1bmcuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDUg
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKaW5kZXggMjMyM2EyMjY1NmU4Li5mMDA0ZGIwNmRlZTkg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKQEAgLTEwNzYsMTAgKzEwNzYsMTMgQEAgc3Rh
dGljIGludCB0Y19zdHJlYW1fZW5hYmxlKHN0cnVjdCB0Y19kYXRhICp0YykKIHN0YXRpYyBpbnQg
dGNfc3RyZWFtX2Rpc2FibGUoc3RydWN0IHRjX2RhdGEgKnRjKQogewogCWludCByZXQ7CisJdTMy
IHZhbDsKIAogCWRldl9kYmcodGMtPmRldiwgImRpc2FibGUgdmlkZW8gc3RyZWFtXG4iKTsKIAot
CXRjX3dyaXRlKERQMENUTCwgMCk7CisJdGNfcmVhZChEUDBDVEwsICZ2YWwpOworCXZhbCAmPSB+
VklEX0VOOworCXRjX3dyaXRlKERQMENUTCwgdmFsKTsKIAogCXRjX3B4bF9wbGxfZGlzKHRjKTsK
IAotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAx
ODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2Ev
RG9taWNpbGU6IEhlbHNpbmtpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
