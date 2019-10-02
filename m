Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAF0C885F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 14:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25ED26E966;
	Wed,  2 Oct 2019 12:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6EA6E966
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 12:26:11 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92CPxJx073005;
 Wed, 2 Oct 2019 07:25:59 -0500
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x92CPxgN120509
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 2 Oct 2019 07:25:59 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 07:25:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 07:25:47 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92CPu7F109850;
 Wed, 2 Oct 2019 07:25:56 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/omap: fix max fclk divider for omap36xx
Date: Wed, 2 Oct 2019 15:25:42 +0300
Message-ID: <20191002122542.8449-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570019159;
 bh=EDYFrWfYHk5McenIprwnW2MZAkgJrfgPI50SZBwt2Ak=;
 h=From:To:CC:Subject:Date;
 b=B0sleF8CLZS8WkFm0/QCECxFDGUTuy+0CYJ6QkvIiCQI+y/WMvo/RQLKn6JSGc2Bu
 W2KhAmDmai4/1lbVQkO38S3Ige5V4doXMW1HzyUZTUmSN7hbgArWkOSMij49khBchf
 OvAzJeBOV4fLagmSw+dzlnGnvLxERnX5XeGg4B+w=
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
Cc: "H . Nikolaus Schaller" <hns@goldelico.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-omap@vger.kernel.org,
 Adam Ford <aford173@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIE9NQVAzNnh4IGFuZCBBTS9ETTM3eCBUUk1zIHNheSB0aGF0IHRoZSBtYXhpbXVtIGRpdmlk
ZXIgZm9yIERTUyBmY2xrCihpbiBDTV9DTEtTRUxfRFNTKSBpcyAzMi4gRXhwZXJpbWVudGF0aW9u
IHNob3dzIHRoYXQgdGhpcyBpcyBub3QKY29ycmVjdCwgYW5kIHVzaW5nIGRpdmlkZXIgb2YgMzIg
YnJlYWtzIERTUyB3aXRoIGEgZmxvb2Qgb3IgdW5kZXJmbG93cwphbmQgc3luYyBsb3N0cy4gRGl2
aWRlcnMgdXAgdG8gMzEgc2VlbSB0byB3b3JrIGZpbmUuCgpUaGVyZSBpcyBhbm90aGVyIHBhdGNo
IHRvIHRoZSBEVCBmaWxlcyB0byBsaW1pdCB0aGUgZGl2aWRlciBjb3JyZWN0bHksCmJ1dCBhcyB0
aGUgRFNTIGRyaXZlciBhbHNvIG5lZWRzIHRvIGtub3cgdGhlIG1heGltdW0gZGl2aWRlciB0byBi
ZSBhYmxlCnRvIGl0ZXJhdGl2ZWx5IGZpbmQgZ29vZCByYXRlcywgd2UgYWxzbyBuZWVkIHRvIGRv
IHRoZSBmaXggaW4gdGhlIERTUwpkcml2ZXIuCgpTaWduZWQtb2ZmLWJ5OiBUb21pIFZhbGtlaW5l
biA8dG9taS52YWxrZWluZW5AdGkuY29tPgpDYzogQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5j
b20+CkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL29tYXBk
cm0vZHNzL2Rzcy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rzcy5j
IGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rzcy5jCmluZGV4IGUyMjYzMjRhZGI2OS4u
NGJkZDYzYjU3MTAwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNz
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rzcy5jCkBAIC0xMDgzLDcgKzEw
ODMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRzc19mZWF0dXJlcyBvbWFwMzR4eF9kc3NfZmVh
dHMgPSB7CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHNzX2ZlYXR1cmVzIG9tYXAzNjMwX2Rzc19m
ZWF0cyA9IHsKIAkubW9kZWwJCQk9CURTU19NT0RFTF9PTUFQMywKLQkuZmNrX2Rpdl9tYXgJCT0J
MzIsCisJLmZja19kaXZfbWF4CQk9CTMxLAogCS5mY2tfZnJlcV9tYXgJCT0JMTczMDAwMDAwLAog
CS5kc3NfZmNrX211bHRpcGxpZXIJPQkxLAogCS5wYXJlbnRfY2xrX25hbWUJPQkiZHBsbDRfY2si
LAotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAx
ODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2Ev
RG9taWNpbGU6IEhlbHNpbmtpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
