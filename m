Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8475771815
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 03:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E6110E18A;
	Mon,  7 Aug 2023 01:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5901310E14F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 01:51:18 +0000 (UTC)
X-UUID: e3a59e6c34c411ee9cb5633481061a41-20230807
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=nHO89eo5XP/cI7/d8jRRCM1JAR8auP/ze6uYvPHNS+8=; 
 b=b5MwJ3D3y+Nflx5juUzWEKKsXaABm8H6LSfECMQO3ceg9HjGJbR9V5++646s3hM4VL/WfeMFLPKGTIIZZWGHN9tSg5lgNfuOHZowIyfLTbs2idgEu2pbBjgXoONuxS/7i0Sjam3Eh5HxpdvOut0KaCtZhhQpD1cFIu7lHlXG88w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30, REQID:4b044cf4-8c20-4bf9-952b-8cbfd10d7839, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.30, REQID:4b044cf4-8c20-4bf9-952b-8cbfd10d7839, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:1fcc6f8, CLOUDID:1035f4a0-0933-4333-8d4f-6c3c53ebd55b,
 B
 ulkID:230807095113QPLXP3VP,BulkQuantity:0,Recheck:0,SF:48|38|29|28|17|19,T
 C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
 ,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR, TF_CID_SPAM_SDM, TF_CID_SPAM_ASC,
 TF_CID_SPAM_FAS, TF_CID_SPAM_FSD
X-UUID: e3a59e6c34c411ee9cb5633481061a41-20230807
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 963366144; Mon, 07 Aug 2023 09:51:13 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 7 Aug 2023 09:51:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 7 Aug 2023 09:51:11 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Alexandre Mergnat
 <amergnat@baylibre.com>
Subject: [PATCH RESEND v4 2/2] drm/mediatek: Fix iommu fault during crtc
 enabling
Date: Mon, 7 Aug 2023 09:51:10 +0800
Message-ID: <20230807015110.30579-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230807015110.30579-1-jason-jh.lin@mediatek.com>
References: <20230807015110.30579-1-jason-jh.lin@mediatek.com>
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
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The plane_state of drm_atomic_state is not sync to the mtk_plane_state
stored in mtk_crtc during crtc enabling.

So we need to update the mtk_plane_state stored in mtk_crtc by the
drm_atomic_state carried from mtk_drm_crtc_atomic_enable().

While updating mtk_plane_state, OVL layer should be disabled when the fb
in plane_state of drm_atomic_state is NULL.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
Change in RESEND v4:
Remove redundant plane_state assigning.
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 14 ++++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 11 ++++++++---
 drivers/gpu/drm/mediatek/mtk_drm_plane.h |  2 ++
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index d40142842f85..7db4d6551da7 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -328,7 +328,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 }
 #endif
 
-static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
+static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc, struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc = &mtk_crtc->base;
 	struct drm_connector *connector;
@@ -405,11 +405,17 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 	/* Initially configure all planes */
 	for (i = 0; i < mtk_crtc->layer_nr; i++) {
 		struct drm_plane *plane = &mtk_crtc->planes[i];
-		struct mtk_plane_state *plane_state;
+		struct drm_plane_state *new_state;
+		struct mtk_plane_state *plane_state = to_mtk_plane_state(plane->state);
 		struct mtk_ddp_comp *comp;
 		unsigned int local_layer;
 
-		plane_state = to_mtk_plane_state(plane->state);
+		/* sync the new plane state from drm_atomic_state */
+		if (state->planes[i].ptr) {
+			new_state = drm_atomic_get_new_plane_state(state, state->planes[i].ptr);
+			mtk_plane_update_new_state(new_state, plane_state);
+		}
+
 		comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
 		if (comp)
 			mtk_ddp_comp_layer_config(comp, local_layer,
@@ -687,7 +693,7 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 		return;
 	}
 
-	ret = mtk_crtc_ddp_hw_init(mtk_crtc);
+	ret = mtk_crtc_ddp_hw_init(mtk_crtc, state);
 	if (ret) {
 		pm_runtime_put(comp->dev);
 		return;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index b1a918ffe457..ef4460f98c07 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -134,8 +134,8 @@ static int mtk_plane_atomic_async_check(struct drm_plane *plane,
 						   true, true);
 }
 
-static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
-				       struct mtk_plane_state *mtk_plane_state)
+void mtk_plane_update_new_state(struct drm_plane_state *new_state,
+				struct mtk_plane_state *mtk_plane_state)
 {
 	struct drm_framebuffer *fb = new_state->fb;
 	struct drm_gem_object *gem;
@@ -146,6 +146,11 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 	dma_addr_t hdr_addr = 0;
 	unsigned int hdr_pitch = 0;
 
+	if (!fb) {
+		mtk_plane_state->pending.enable = false;
+		return;
+	}
+
 	gem = fb->obj[0];
 	mtk_gem = to_mtk_gem_obj(gem);
 	addr = mtk_gem->dma_addr;
@@ -180,7 +185,7 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 		       fb->format->cpp[0] * (x_offset_in_blocks + 1);
 	}
 
-	mtk_plane_state->pending.enable = true;
+	mtk_plane_state->pending.enable = new_state->visible;
 	mtk_plane_state->pending.pitch = pitch;
 	mtk_plane_state->pending.hdr_pitch = hdr_pitch;
 	mtk_plane_state->pending.format = format;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
index 99aff7da0831..0a7d70d13e43 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
@@ -46,6 +46,8 @@ to_mtk_plane_state(struct drm_plane_state *state)
 	return container_of(state, struct mtk_plane_state, base);
 }
 
+void mtk_plane_update_new_state(struct drm_plane_state *new_state,
+				struct mtk_plane_state *mtk_plane_state);
 int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		   unsigned long possible_crtcs, enum drm_plane_type type,
 		   unsigned int supported_rotations, const u32 *formats,
-- 
2.18.0

