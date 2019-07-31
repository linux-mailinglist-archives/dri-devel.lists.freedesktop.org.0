Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 969EB7BD7E
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 11:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7335689AAE;
	Wed, 31 Jul 2019 09:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2387689AA7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 09:42:37 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6V9gYev095497;
 Wed, 31 Jul 2019 04:42:34 -0500
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6V9gYA1119588
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 31 Jul 2019 04:42:34 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 31
 Jul 2019 04:42:34 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 31 Jul 2019 04:42:34 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6V9gR86014471;
 Wed, 31 Jul 2019 04:42:32 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <tomi.valkeinen@ti.com>, <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 2/2] drm/omap: dmm_tiler: Remove the dma_async_issue_pending()
 call
Date: Wed, 31 Jul 2019 12:42:33 +0300
Message-ID: <20190731094233.13890-3-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731094233.13890-1-peter.ujfalusi@ti.com>
References: <20190731094233.13890-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1564566154;
 bh=lztGbFaWQTIotQMMK27Ocmiq+wnM5hYvc+bfpzwKrJk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=fdHHeOE78PHzPWDf+X/JDq2SmwdT9wMmnHOHMQDelxdkdcJqKlFwuOODO9foNtDvq
 iItI8PeALM35xuKgn1w+qz3Sc6wAdFOaChVThLq2HJd+foa4r0eb/FosZURlugP1L9
 DjRI5Y+autWnRewYpx6IYfLXMtB83gWFZ1k6tRRE=
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

ZG1hX3N5bmNfd2FpdCgpIGlzIGNhbGxpbmcgaXQgc28gbm8gbmVlZCB0byBjYWxsIGl0IGluIHRo
ZSBkcml2ZXIuCgpTaWduZWQtb2ZmLWJ5OiBQZXRlciBVamZhbHVzaSA8cGV0ZXIudWpmYWx1c2lA
dGkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZG1tX3RpbGVyLmMgfCAx
IC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL29tYXBkcm0vb21hcF9kbW1fdGlsZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJt
L29tYXBfZG1tX3RpbGVyLmMKaW5kZXggNzc3MjhlYWExYTZmLi40MmVjNTFiYjdiMWIgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZG1tX3RpbGVyLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9kbW1fdGlsZXIuYwpAQCAtOTgsNyArOTgsNiBAQCBz
dGF0aWMgaW50IGRtbV9kbWFfY29weShzdHJ1Y3QgZG1tICpkbW0sIGRtYV9hZGRyX3Qgc3JjLCBk
bWFfYWRkcl90IGRzdCkKIAkJcmV0dXJuIC1FSU87CiAJfQogCi0JZG1hX2FzeW5jX2lzc3VlX3Bl
bmRpbmcoZG1tLT53YV9kbWFfY2hhbik7CiAJc3RhdHVzID0gZG1hX3N5bmNfd2FpdChkbW0tPndh
X2RtYV9jaGFuLCBjb29raWUpOwogCWlmIChzdGF0dXMgIT0gRE1BX0NPTVBMRVRFKQogCQlkZXZf
ZXJyKGRtbS0+ZGV2LCAiaTg3OCB3YSBETUEgY29weSBmYWlsdXJlXG4iKTsKLS0gClBldGVyCgpU
ZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxz
aW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2ls
ZTogSGVsc2lua2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
