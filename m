Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5693F6DA910
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 08:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A147A10E819;
	Fri,  7 Apr 2023 06:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B97F10E7E7
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Apr 2023 06:47:04 +0000 (UTC)
X-UUID: ff8dd348d50f11eda9a90f0bb45854f4-20230407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=9L84OZjF4WOz0zPEZnr9/avuUjm8MDXhSEkt/M3EmU8=; 
 b=nwOD1ONV34AlpNl6+IX9UUjHpRDMXUVK4s/wAQJ1B5aOpAOwTjBNogCe+F7XKjWa6HnqMspNDR3v8tHrT8S3IZ4Zc7mOIdV+NnggMJILu3kUNO7l92wkECKBxr0q960Wz4imkY5Q1hyLHz63ue5Z/VIu6pVe+NjMqzl9k8n7pbU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:72ffb03f-35d5-4fd8-852e-3d7ff7e2bd89, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:120426c, CLOUDID:f1a77db5-beed-4dfc-bd9c-e1b22fa6ccc4,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: ff8dd348d50f11eda9a90f0bb45854f4-20230407
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 413791441; Fri, 07 Apr 2023 14:47:00 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 7 Apr 2023 14:46:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 7 Apr 2023 14:46:59 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 3/5] drm/mediatek: Add initialization for mtk_gem_obj
Date: Fri, 7 Apr 2023 14:46:55 +0800
Message-ID: <20230407064657.12350-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230407064657.12350-1-jason-jh.lin@mediatek.com>
References: <20230407064657.12350-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calling mtk_gem_obj = kzalloc() which returns uninitialized memory,
because mtk_gem_obj is uninitialized.

It may cause using uninitialized value mtk_gem_obj->base.resv
when calling drm_gem_object_init().

So add initialization for mtk_gem_obj.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index a25b28d3ee90..9b8f72ed12e4 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -33,7 +33,7 @@ static const struct drm_gem_object_funcs mtk_drm_gem_object_funcs = {
 static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
 						unsigned long size)
 {
-	struct mtk_drm_gem_obj *mtk_gem_obj;
+	struct mtk_drm_gem_obj *mtk_gem_obj = NULL;
 	int ret;
 
 	size = round_up(size, PAGE_SIZE);
-- 
2.18.0

