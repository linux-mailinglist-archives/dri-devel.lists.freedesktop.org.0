Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B197BD7D
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 11:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA30F89BA3;
	Wed, 31 Jul 2019 09:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4671489AA7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 09:42:35 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6V9gWcb095474;
 Wed, 31 Jul 2019 04:42:32 -0500
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6V9gW5U094311
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 31 Jul 2019 04:42:32 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 31
 Jul 2019 04:42:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 31 Jul 2019 04:42:32 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6V9gR85014471;
 Wed, 31 Jul 2019 04:42:30 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <tomi.valkeinen@ti.com>, <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 1/2] drm/omap: dmm_tiler: Use dmaengine_prep_dma_memcpy() for
 i878 workaround
Date: Wed, 31 Jul 2019 12:42:32 +0300
Message-ID: <20190731094233.13890-2-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731094233.13890-1-peter.ujfalusi@ti.com>
References: <20190731094233.13890-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1564566152;
 bh=l57jXBOuQlw9PJVIk9mMb3aoBlhmifaDdSC9zAB+WfU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=u92ELiZ45AsxMVbUDxPnU2xgJhGiAgmyqgmYMOSapZDo1zkrViRx/GH4Ob33sTYw1
 snNCvpI9bd14l9R/ErcrZmk8T0TBmVLZYzwnDQ9ZLB9fybCLucywvPu50+dEFTD/rd
 sdPrc81ynoJ+awJvhAbHfDhrddcBpVwQNPYXxvUU=
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
Cc: airlied@linux.ie, jsarha@ti.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiBkbWFfZGV2LT5kZXZpY2VfcHJlcF9kbWFfbWVtY3B5KCkgdXNlIHRoZSBleGlz
dGluZyBtYWNybyB0bwpwcmVwYXJlIHRoZSBtZW1jcHkuCgpTaWduZWQtb2ZmLWJ5OiBQZXRlciBV
amZhbHVzaSA8cGV0ZXIudWpmYWx1c2lAdGkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFw
ZHJtL29tYXBfZG1tX3RpbGVyLmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJt
L29tYXBfZG1tX3RpbGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2RtbV90aWxl
ci5jCmluZGV4IDI1MmY1ZWJiMWFjYy4uNzc3MjhlYWExYTZmIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vb21hcGRybS9vbWFwX2RtbV90aWxlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9v
bWFwZHJtL29tYXBfZG1tX3RpbGVyLmMKQEAgLTgyLDEyICs4MiwxMSBAQCBzdGF0aWMgY29uc3Qg
dTMyIHJlZ1tdWzRdID0gewogCiBzdGF0aWMgaW50IGRtbV9kbWFfY29weShzdHJ1Y3QgZG1tICpk
bW0sIGRtYV9hZGRyX3Qgc3JjLCBkbWFfYWRkcl90IGRzdCkKIHsKLQlzdHJ1Y3QgZG1hX2Rldmlj
ZSAqZG1hX2RldiA9IGRtbS0+d2FfZG1hX2NoYW4tPmRldmljZTsKIAlzdHJ1Y3QgZG1hX2FzeW5j
X3R4X2Rlc2NyaXB0b3IgKnR4OwogCWVudW0gZG1hX3N0YXR1cyBzdGF0dXM7CiAJZG1hX2Nvb2tp
ZV90IGNvb2tpZTsKIAotCXR4ID0gZG1hX2Rldi0+ZGV2aWNlX3ByZXBfZG1hX21lbWNweShkbW0t
PndhX2RtYV9jaGFuLCBkc3QsIHNyYywgNCwgMCk7CisJdHggPSBkbWFlbmdpbmVfcHJlcF9kbWFf
bWVtY3B5KGRtbS0+d2FfZG1hX2NoYW4sIGRzdCwgc3JjLCA0LCAwKTsKIAlpZiAoIXR4KSB7CiAJ
CWRldl9lcnIoZG1tLT5kZXYsICJGYWlsZWQgdG8gcHJlcGFyZSBETUEgbWVtY3B5XG4iKTsKIAkJ
cmV0dXJuIC1FSU87Ci0tIApQZXRlcgoKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9y
a2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1
NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
