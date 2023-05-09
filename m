Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF776FC81D
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 15:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBF410E1E7;
	Tue,  9 May 2023 13:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FFC10E1E7
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 13:40:10 +0000 (UTC)
X-UUID: 02730916ee6f11ed9cb5633481061a41-20230509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=EcxoySZeNyWmYqLzuPlfOjc/Bwa9KgEg2PBRX96w2mY=; 
 b=kkJcnkZy+hAnNglmd1tzJVcyMBEKbuR+VXL8WnI9S65Ej9oIarxVFip1wTpsR4FuXDenXZvrj3r2d+XLsoPxL2i29z+8uQt6LoAsbJ+7YCsXF+0RzKz/yzXg/C23NIz9kcJY5dumbJiAh7wusJPaXiWMxOV+dMEU6aC+OuoSQRA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24, REQID:5b41c411-2426-4763-b9bf-3f498bdf644d, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:178d4d4, CLOUDID:b9d99b3a-de1e-4348-bc35-c96f92f1dcbb,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 02730916ee6f11ed9cb5633481061a41-20230509
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1783509362; Tue, 09 May 2023 21:40:06 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 9 May 2023 21:40:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 9 May 2023 21:40:06 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] drm/mediatek: Fix OVL iommu fault in cursor plane
Date: Tue, 9 May 2023 21:40:05 +0800
Message-ID: <20230509134005.6300-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
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
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

1. Accordin to the comment in drm_atomic_helper_async_commit(),
   we should make sure FBs have been swapped, so that cleanups in the
   new_state performs a cleanup in the old FB.
   So we should move swap_fb() to mtk_plane_update_new_state() done,
   to avoid using the old FB which could be freed.

2. OVL layer should not be enabled before crtc is enabled.
   The plane_state of drm_atomic_state is not sync to
   the plane_state stored in mtk_crtc during crtc enabling,
   so just set all planes to disabled.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Fixes: 1a64a7aff8da ("drm/mediatek: Fix cursor plane no update")
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 5 +++--
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index d40142842f85..b3c631303a35 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -405,11 +405,12 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 	/* Initially configure all planes */
 	for (i = 0; i < mtk_crtc->layer_nr; i++) {
 		struct drm_plane *plane = &mtk_crtc->planes[i];
-		struct mtk_plane_state *plane_state;
+		struct mtk_plane_state *plane_state = to_mtk_plane_state(plane->state);
 		struct mtk_ddp_comp *comp;
 		unsigned int local_layer;
 
-		plane_state = to_mtk_plane_state(plane->state);
+		/* should not enable layer before crtc enabled */
+		plane_state->pending.enable = false;
 		comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
 		if (comp)
 			mtk_ddp_comp_layer_config(comp, local_layer,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 31f9420aff6f..b1a918ffe457 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -210,9 +210,9 @@ static void mtk_plane_atomic_async_update(struct drm_plane *plane,
 	plane->state->src_y = new_state->src_y;
 	plane->state->src_h = new_state->src_h;
 	plane->state->src_w = new_state->src_w;
-	swap(plane->state->fb, new_state->fb);
 
 	mtk_plane_update_new_state(new_state, new_plane_state);
+	swap(plane->state->fb, new_state->fb);
 	wmb(); /* Make sure the above parameters are set before update */
 	new_plane_state->pending.async_dirty = true;
 	mtk_drm_crtc_async_update(new_state->crtc, plane, state);
-- 
2.18.0

