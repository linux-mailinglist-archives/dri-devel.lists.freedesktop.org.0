Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C89C66C3169
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 13:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EAAC10E76A;
	Tue, 21 Mar 2023 12:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30D910E76A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 12:19:08 +0000 (UTC)
X-UUID: 91236772c7e211edb6b9f13eb10bd0fe-20230321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=IrQVxt2JtOx2qfZbAJAceutC6kzmgXQKXvItO7YJTos=; 
 b=SMo3GR7EwhNjntYRS6QyQAvqsMIRQakygwvvly4LE2Y9m494IrkGjlhUN5inkGj5E9lDxcwPEnK4Zq+Sxvrahyxwlz3XBob2TcANVgI3sZdtF6dXhFidZJW5CsD7GClP3X2YZNifq1xdPSw181MPFwNrSgeIyWKvHXgu5SIaPio=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:d0c56739-874c-4e90-8a5e-76ed1fe85ecf, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:120426c, CLOUDID:304877f6-ddba-41c3-91d9-10eeade8eac7,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 91236772c7e211edb6b9f13eb10bd0fe-20230321
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2106539763; Tue, 21 Mar 2023 20:19:02 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 21 Mar 2023 20:19:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 21 Mar 2023 20:19:02 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v30 6/7] drm/mediatek: add drm ovl_adaptor sub driver for
 MT8195
Date: Tue, 21 Mar 2023 20:18:58 +0800
Message-ID: <20230321121859.2355-7-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230321121859.2355-1-nancy.lin@mediatek.com>
References: <20230321121859.2355-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, singo.chang@mediatek.com,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux@googlegroups.com, "Nancy.Lin" <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add drm ovl_adaptor sub driver. Bring up ovl_adaptor sub driver if
the component exists in the path.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  50 +++++---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   2 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 129 ++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  50 +++++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  78 ++++++------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |  12 +-
 6 files changed, 207 insertions(+), 114 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 8e97a34ebd47..ac93f2b4a300 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -379,13 +379,17 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 	}
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
-		mtk_mmsys_ddp_connect(mtk_crtc->mmsys_dev,
-				      mtk_crtc->ddp_comp[i]->id,
-				      mtk_crtc->ddp_comp[i + 1]->id);
-		mtk_mutex_add_comp(mtk_crtc->mutex,
-					mtk_crtc->ddp_comp[i]->id);
+		if (!mtk_ddp_comp_connect(mtk_crtc->ddp_comp[i], mtk_crtc->mmsys_dev,
+					  mtk_crtc->ddp_comp[i + 1]->id))
+			mtk_mmsys_ddp_connect(mtk_crtc->mmsys_dev,
+					      mtk_crtc->ddp_comp[i]->id,
+					      mtk_crtc->ddp_comp[i + 1]->id);
+		if (!mtk_ddp_comp_add(mtk_crtc->ddp_comp[i], mtk_crtc->mutex))
+			mtk_mutex_add_comp(mtk_crtc->mutex,
+					   mtk_crtc->ddp_comp[i]->id);
 	}
-	mtk_mutex_add_comp(mtk_crtc->mutex, mtk_crtc->ddp_comp[i]->id);
+	if (!mtk_ddp_comp_add(mtk_crtc->ddp_comp[i], mtk_crtc->mutex))
+		mtk_mutex_add_comp(mtk_crtc->mutex, mtk_crtc->ddp_comp[i]->id);
 	mtk_mutex_enable(mtk_crtc->mutex);
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
@@ -434,17 +438,22 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
 	}
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
-		mtk_mutex_remove_comp(mtk_crtc->mutex,
-					   mtk_crtc->ddp_comp[i]->id);
+		if (!mtk_ddp_comp_remove(mtk_crtc->ddp_comp[i], mtk_crtc->mutex))
+			mtk_mutex_remove_comp(mtk_crtc->mutex,
+					      mtk_crtc->ddp_comp[i]->id);
 	mtk_mutex_disable(mtk_crtc->mutex);
 	for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
-		mtk_mmsys_ddp_disconnect(mtk_crtc->mmsys_dev,
-					 mtk_crtc->ddp_comp[i]->id,
-					 mtk_crtc->ddp_comp[i + 1]->id);
-		mtk_mutex_remove_comp(mtk_crtc->mutex,
-					   mtk_crtc->ddp_comp[i]->id);
+		if (!mtk_ddp_comp_disconnect(mtk_crtc->ddp_comp[i], mtk_crtc->mmsys_dev,
+					     mtk_crtc->ddp_comp[i + 1]->id))
+			mtk_mmsys_ddp_disconnect(mtk_crtc->mmsys_dev,
+						 mtk_crtc->ddp_comp[i]->id,
+						 mtk_crtc->ddp_comp[i + 1]->id);
+		if (!mtk_ddp_comp_remove(mtk_crtc->ddp_comp[i], mtk_crtc->mutex))
+			mtk_mutex_remove_comp(mtk_crtc->mutex,
+					      mtk_crtc->ddp_comp[i]->id);
 	}
-	mtk_mutex_remove_comp(mtk_crtc->mutex, mtk_crtc->ddp_comp[i]->id);
+	if (!mtk_ddp_comp_remove(mtk_crtc->ddp_comp[i], mtk_crtc->mutex))
+		mtk_mutex_remove_comp(mtk_crtc->mutex, mtk_crtc->ddp_comp[i]->id);
 	mtk_crtc_ddp_clk_disable(mtk_crtc);
 	mtk_mutex_unprepare(mtk_crtc->mutex);
 
@@ -874,7 +883,7 @@ struct device *mtk_drm_crtc_dma_dev_get(struct drm_crtc *crtc)
 }
 
 int mtk_drm_crtc_create(struct drm_device *drm_dev,
-			const enum mtk_ddp_comp_id *path, unsigned int path_len,
+			const unsigned int *path, unsigned int path_len,
 			int priv_data_index)
 {
 	struct mtk_drm_private *priv = drm_dev->dev_private;
@@ -904,10 +913,13 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		node = priv->comp_node[comp_id];
 		comp = &priv->ddp_comp[comp_id];
 
-		if (!node) {
+		/* Not all drm components have a DTS device node, such as ovl_adaptor,
+		 * which is the drm bring up sub driver
+		 */
+		if (!node && comp_id != DDP_COMPONENT_DRM_OVL_ADAPTOR) {
 			dev_info(dev,
-				 "Not creating crtc %d because component %d is disabled or missing\n",
-				 crtc_i, comp_id);
+				"Not creating crtc %d because component %d is disabled or missing\n",
+				crtc_i, comp_id);
 			return 0;
 		}
 
@@ -937,7 +949,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	}
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
-		enum mtk_ddp_comp_id comp_id = path[i];
+		unsigned int comp_id = path[i];
 		struct mtk_ddp_comp *comp;
 
 		comp = &priv->ddp_comp[comp_id];
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
index 606f72f35924..3e9046993d09 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
@@ -16,7 +16,7 @@
 
 void mtk_drm_crtc_commit(struct drm_crtc *crtc);
 int mtk_drm_crtc_create(struct drm_device *drm_dev,
-			const enum mtk_ddp_comp_id *path,
+			const unsigned int *path,
 			unsigned int path_len,
 			int priv_data_index);
 int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 6b6d5335c834..8cb76f2a40e7 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -389,6 +389,25 @@ static const struct mtk_ddp_comp_funcs ddp_ufoe = {
 	.start = mtk_ufoe_start,
 };
 
+static const struct mtk_ddp_comp_funcs ddp_ovl_adaptor = {
+	.clk_enable = mtk_ovl_adaptor_clk_enable,
+	.clk_disable = mtk_ovl_adaptor_clk_disable,
+	.config = mtk_ovl_adaptor_config,
+	.start = mtk_ovl_adaptor_start,
+	.stop = mtk_ovl_adaptor_stop,
+	.layer_nr = mtk_ovl_adaptor_layer_nr,
+	.layer_config = mtk_ovl_adaptor_layer_config,
+	.register_vblank_cb = mtk_ovl_adaptor_register_vblank_cb,
+	.unregister_vblank_cb = mtk_ovl_adaptor_unregister_vblank_cb,
+	.enable_vblank = mtk_ovl_adaptor_enable_vblank,
+	.disable_vblank = mtk_ovl_adaptor_disable_vblank,
+	.dma_dev_get = mtk_ovl_adaptor_dma_dev_get,
+	.connect = mtk_ovl_adaptor_connect,
+	.disconnect = mtk_ovl_adaptor_disconnect,
+	.add = mtk_ovl_adaptor_add_comp,
+	.remove = mtk_ovl_adaptor_remove_comp,
+};
+
 static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_AAL] = "aal",
 	[MTK_DISP_BLS] = "bls",
@@ -402,6 +421,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_OD] = "od",
 	[MTK_DISP_OVL] = "ovl",
 	[MTK_DISP_OVL_2L] = "ovl-2l",
+	[MTK_DISP_OVL_ADAPTOR] = "ovl_adaptor",
 	[MTK_DISP_POSTMASK] = "postmask",
 	[MTK_DISP_PWM] = "pwm",
 	[MTK_DISP_RDMA] = "rdma",
@@ -418,53 +438,54 @@ struct mtk_ddp_comp_match {
 	const struct mtk_ddp_comp_funcs *funcs;
 };
 
-static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
-	[DDP_COMPONENT_AAL0]		= { MTK_DISP_AAL,	0, &ddp_aal },
-	[DDP_COMPONENT_AAL1]		= { MTK_DISP_AAL,	1, &ddp_aal },
-	[DDP_COMPONENT_BLS]		= { MTK_DISP_BLS,	0, NULL },
-	[DDP_COMPONENT_CCORR]		= { MTK_DISP_CCORR,	0, &ddp_ccorr },
-	[DDP_COMPONENT_COLOR0]		= { MTK_DISP_COLOR,	0, &ddp_color },
-	[DDP_COMPONENT_COLOR1]		= { MTK_DISP_COLOR,	1, &ddp_color },
-	[DDP_COMPONENT_DITHER0]		= { MTK_DISP_DITHER,	0, &ddp_dither },
-	[DDP_COMPONENT_DP_INTF0]	= { MTK_DP_INTF,	0, &ddp_dpi },
-	[DDP_COMPONENT_DP_INTF1]	= { MTK_DP_INTF,	1, &ddp_dpi },
-	[DDP_COMPONENT_DPI0]		= { MTK_DPI,		0, &ddp_dpi },
-	[DDP_COMPONENT_DPI1]		= { MTK_DPI,		1, &ddp_dpi },
-	[DDP_COMPONENT_DSC0]		= { MTK_DISP_DSC,	0, &ddp_dsc },
-	[DDP_COMPONENT_DSC1]		= { MTK_DISP_DSC,	1, &ddp_dsc },
-	[DDP_COMPONENT_DSI0]		= { MTK_DSI,		0, &ddp_dsi },
-	[DDP_COMPONENT_DSI1]		= { MTK_DSI,		1, &ddp_dsi },
-	[DDP_COMPONENT_DSI2]		= { MTK_DSI,		2, &ddp_dsi },
-	[DDP_COMPONENT_DSI3]		= { MTK_DSI,		3, &ddp_dsi },
-	[DDP_COMPONENT_GAMMA]		= { MTK_DISP_GAMMA,	0, &ddp_gamma },
-	[DDP_COMPONENT_MERGE0]		= { MTK_DISP_MERGE,	0, &ddp_merge },
-	[DDP_COMPONENT_MERGE1]		= { MTK_DISP_MERGE,	1, &ddp_merge },
-	[DDP_COMPONENT_MERGE2]		= { MTK_DISP_MERGE,	2, &ddp_merge },
-	[DDP_COMPONENT_MERGE3]		= { MTK_DISP_MERGE,	3, &ddp_merge },
-	[DDP_COMPONENT_MERGE4]		= { MTK_DISP_MERGE,	4, &ddp_merge },
-	[DDP_COMPONENT_MERGE5]		= { MTK_DISP_MERGE,	5, &ddp_merge },
-	[DDP_COMPONENT_OD0]		= { MTK_DISP_OD,	0, &ddp_od },
-	[DDP_COMPONENT_OD1]		= { MTK_DISP_OD,	1, &ddp_od },
-	[DDP_COMPONENT_OVL0]		= { MTK_DISP_OVL,	0, &ddp_ovl },
-	[DDP_COMPONENT_OVL1]		= { MTK_DISP_OVL,	1, &ddp_ovl },
-	[DDP_COMPONENT_OVL_2L0]		= { MTK_DISP_OVL_2L,	0, &ddp_ovl },
-	[DDP_COMPONENT_OVL_2L1]		= { MTK_DISP_OVL_2L,	1, &ddp_ovl },
-	[DDP_COMPONENT_OVL_2L2]		= { MTK_DISP_OVL_2L,    2, &ddp_ovl },
-	[DDP_COMPONENT_POSTMASK0]	= { MTK_DISP_POSTMASK,	0, &ddp_postmask },
-	[DDP_COMPONENT_PWM0]		= { MTK_DISP_PWM,	0, NULL },
-	[DDP_COMPONENT_PWM1]		= { MTK_DISP_PWM,	1, NULL },
-	[DDP_COMPONENT_PWM2]		= { MTK_DISP_PWM,	2, NULL },
-	[DDP_COMPONENT_RDMA0]		= { MTK_DISP_RDMA,	0, &ddp_rdma },
-	[DDP_COMPONENT_RDMA1]		= { MTK_DISP_RDMA,	1, &ddp_rdma },
-	[DDP_COMPONENT_RDMA2]		= { MTK_DISP_RDMA,	2, &ddp_rdma },
-	[DDP_COMPONENT_RDMA4]		= { MTK_DISP_RDMA,      4, &ddp_rdma },
-	[DDP_COMPONENT_UFOE]		= { MTK_DISP_UFOE,	0, &ddp_ufoe },
-	[DDP_COMPONENT_WDMA0]		= { MTK_DISP_WDMA,	0, NULL },
-	[DDP_COMPONENT_WDMA1]		= { MTK_DISP_WDMA,	1, NULL },
+static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_DRM_ID_MAX] = {
+	[DDP_COMPONENT_AAL0]		= { MTK_DISP_AAL,		0, &ddp_aal },
+	[DDP_COMPONENT_AAL1]		= { MTK_DISP_AAL,		1, &ddp_aal },
+	[DDP_COMPONENT_BLS]		= { MTK_DISP_BLS,		0, NULL },
+	[DDP_COMPONENT_CCORR]		= { MTK_DISP_CCORR,		0, &ddp_ccorr },
+	[DDP_COMPONENT_COLOR0]		= { MTK_DISP_COLOR,		0, &ddp_color },
+	[DDP_COMPONENT_COLOR1]		= { MTK_DISP_COLOR,		1, &ddp_color },
+	[DDP_COMPONENT_DITHER0]		= { MTK_DISP_DITHER,		0, &ddp_dither },
+	[DDP_COMPONENT_DP_INTF0]	= { MTK_DP_INTF,		0, &ddp_dpi },
+	[DDP_COMPONENT_DP_INTF1]	= { MTK_DP_INTF,		1, &ddp_dpi },
+	[DDP_COMPONENT_DPI0]		= { MTK_DPI,			0, &ddp_dpi },
+	[DDP_COMPONENT_DPI1]		= { MTK_DPI,			1, &ddp_dpi },
+	[DDP_COMPONENT_DRM_OVL_ADAPTOR]	= { MTK_DISP_OVL_ADAPTOR,	0, &ddp_ovl_adaptor },
+	[DDP_COMPONENT_DSC0]		= { MTK_DISP_DSC,		0, &ddp_dsc },
+	[DDP_COMPONENT_DSC1]		= { MTK_DISP_DSC,		1, &ddp_dsc },
+	[DDP_COMPONENT_DSI0]		= { MTK_DSI,			0, &ddp_dsi },
+	[DDP_COMPONENT_DSI1]		= { MTK_DSI,			1, &ddp_dsi },
+	[DDP_COMPONENT_DSI2]		= { MTK_DSI,			2, &ddp_dsi },
+	[DDP_COMPONENT_DSI3]		= { MTK_DSI,			3, &ddp_dsi },
+	[DDP_COMPONENT_GAMMA]		= { MTK_DISP_GAMMA,		0, &ddp_gamma },
+	[DDP_COMPONENT_MERGE0]		= { MTK_DISP_MERGE,		0, &ddp_merge },
+	[DDP_COMPONENT_MERGE1]		= { MTK_DISP_MERGE,		1, &ddp_merge },
+	[DDP_COMPONENT_MERGE2]		= { MTK_DISP_MERGE,		2, &ddp_merge },
+	[DDP_COMPONENT_MERGE3]		= { MTK_DISP_MERGE,		3, &ddp_merge },
+	[DDP_COMPONENT_MERGE4]		= { MTK_DISP_MERGE,		4, &ddp_merge },
+	[DDP_COMPONENT_MERGE5]		= { MTK_DISP_MERGE,		5, &ddp_merge },
+	[DDP_COMPONENT_OD0]		= { MTK_DISP_OD,		0, &ddp_od },
+	[DDP_COMPONENT_OD1]		= { MTK_DISP_OD,		1, &ddp_od },
+	[DDP_COMPONENT_OVL0]		= { MTK_DISP_OVL,		0, &ddp_ovl },
+	[DDP_COMPONENT_OVL1]		= { MTK_DISP_OVL,		1, &ddp_ovl },
+	[DDP_COMPONENT_OVL_2L0]		= { MTK_DISP_OVL_2L,		0, &ddp_ovl },
+	[DDP_COMPONENT_OVL_2L1]		= { MTK_DISP_OVL_2L,		1, &ddp_ovl },
+	[DDP_COMPONENT_OVL_2L2]		= { MTK_DISP_OVL_2L,		2, &ddp_ovl },
+	[DDP_COMPONENT_POSTMASK0]	= { MTK_DISP_POSTMASK,		0, &ddp_postmask },
+	[DDP_COMPONENT_PWM0]		= { MTK_DISP_PWM,		0, NULL },
+	[DDP_COMPONENT_PWM1]		= { MTK_DISP_PWM,		1, NULL },
+	[DDP_COMPONENT_PWM2]		= { MTK_DISP_PWM,		2, NULL },
+	[DDP_COMPONENT_RDMA0]		= { MTK_DISP_RDMA,		0, &ddp_rdma },
+	[DDP_COMPONENT_RDMA1]		= { MTK_DISP_RDMA,		1, &ddp_rdma },
+	[DDP_COMPONENT_RDMA2]		= { MTK_DISP_RDMA,		2, &ddp_rdma },
+	[DDP_COMPONENT_RDMA4]		= { MTK_DISP_RDMA,		4, &ddp_rdma },
+	[DDP_COMPONENT_UFOE]		= { MTK_DISP_UFOE,		0, &ddp_ufoe },
+	[DDP_COMPONENT_WDMA0]		= { MTK_DISP_WDMA,		0, NULL },
+	[DDP_COMPONENT_WDMA1]		= { MTK_DISP_WDMA,		1, NULL },
 };
 
 static bool mtk_drm_find_comp_in_ddp(struct device *dev,
-				     const enum mtk_ddp_comp_id *path,
+				     const unsigned int *path,
 				     unsigned int path_len,
 				     struct mtk_ddp_comp *ddp_comp)
 {
@@ -517,7 +538,7 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
 }
 
 int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
-		      enum mtk_ddp_comp_id comp_id)
+		      unsigned int comp_id)
 {
 	struct platform_device *comp_pdev;
 	enum mtk_ddp_comp_type type;
@@ -526,19 +547,24 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	int ret;
 #endif
 
-	if (comp_id < 0 || comp_id >= DDP_COMPONENT_ID_MAX)
+	if (comp_id < 0 || comp_id >= DDP_COMPONENT_DRM_ID_MAX)
 		return -EINVAL;
 
 	type = mtk_ddp_matches[comp_id].type;
 
 	comp->id = comp_id;
 	comp->funcs = mtk_ddp_matches[comp_id].funcs;
-	comp_pdev = of_find_device_by_node(node);
-	if (!comp_pdev) {
-		DRM_INFO("Waiting for device %s\n", node->full_name);
-		return -EPROBE_DEFER;
+	/* Not all drm components have a DTS device node, such as ovl_adaptor,
+	 * which is the drm bring up sub driver
+	 */
+	if (node) {
+		comp_pdev = of_find_device_by_node(node);
+		if (!comp_pdev) {
+			DRM_INFO("Waiting for device %s\n", node->full_name);
+			return -EPROBE_DEFER;
+		}
+		comp->dev = &comp_pdev->dev;
 	}
-	comp->dev = &comp_pdev->dev;
 
 	if (type == MTK_DISP_AAL ||
 	    type == MTK_DISP_BLS ||
@@ -548,6 +574,7 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	    type == MTK_DISP_MERGE ||
 	    type == MTK_DISP_OVL ||
 	    type == MTK_DISP_OVL_2L ||
+	    type == MTK_DISP_OVL_ADAPTOR ||
 	    type == MTK_DISP_PWM ||
 	    type == MTK_DISP_RDMA ||
 	    type == MTK_DPI ||
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 364f3f7f59fa..3084cc4e2830 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -9,6 +9,7 @@
 #include <linux/io.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
+#include <linux/soc/mediatek/mtk-mutex.h>
 
 struct device;
 struct device_node;
@@ -30,6 +31,7 @@ enum mtk_ddp_comp_type {
 	MTK_DISP_OD,
 	MTK_DISP_OVL,
 	MTK_DISP_OVL_2L,
+	MTK_DISP_OVL_ADAPTOR,
 	MTK_DISP_POSTMASK,
 	MTK_DISP_PWM,
 	MTK_DISP_RDMA,
@@ -72,12 +74,16 @@ struct mtk_ddp_comp_funcs {
 	void (*ctm_set)(struct device *dev,
 			struct drm_crtc_state *state);
 	struct device * (*dma_dev_get)(struct device *dev);
+	void (*connect)(struct device *dev, struct device *mmsys_dev, unsigned int next);
+	void (*disconnect)(struct device *dev, struct device *mmsys_dev, unsigned int next);
+	void (*add)(struct device *dev, struct mtk_mutex *mutex);
+	void (*remove)(struct device *dev, struct mtk_mutex *mutex);
 };
 
 struct mtk_ddp_comp {
 	struct device *dev;
 	int irq;
-	enum mtk_ddp_comp_id id;
+	unsigned int id;
 	const struct mtk_ddp_comp_funcs *funcs;
 };
 
@@ -211,13 +217,51 @@ static inline struct device *mtk_ddp_comp_dma_dev_get(struct mtk_ddp_comp *comp)
 	return comp->dev;
 }
 
+static inline bool mtk_ddp_comp_add(struct mtk_ddp_comp *comp, struct mtk_mutex *mutex)
+{
+	if (comp->funcs && comp->funcs->add) {
+		comp->funcs->add(comp->dev, mutex);
+		return true;
+	}
+	return false;
+}
+
+static inline bool mtk_ddp_comp_remove(struct mtk_ddp_comp *comp, struct mtk_mutex *mutex)
+{
+	if (comp->funcs && comp->funcs->remove) {
+		comp->funcs->remove(comp->dev, mutex);
+		return true;
+	}
+	return false;
+}
+
+static inline bool mtk_ddp_comp_connect(struct mtk_ddp_comp *comp, struct device *mmsys_dev,
+					unsigned int next)
+{
+	if (comp->funcs && comp->funcs->connect) {
+		comp->funcs->connect(comp->dev, mmsys_dev, next);
+		return true;
+	}
+	return false;
+}
+
+static inline bool mtk_ddp_comp_disconnect(struct mtk_ddp_comp *comp, struct device *mmsys_dev,
+					   unsigned int next)
+{
+	if (comp->funcs && comp->funcs->disconnect) {
+		comp->funcs->disconnect(comp->dev, mmsys_dev, next);
+		return true;
+	}
+	return false;
+}
+
 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type);
 unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
 						struct device *dev);
 int mtk_ddp_comp_init(struct device_node *comp_node, struct mtk_ddp_comp *comp,
-		      enum mtk_ddp_comp_id comp_id);
-enum mtk_ddp_comp_type mtk_ddp_comp_get_type(enum mtk_ddp_comp_id comp_id);
+		      unsigned int comp_id);
+enum mtk_ddp_comp_type mtk_ddp_comp_get_type(unsigned int comp_id);
 void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 		   struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
 		   unsigned int offset);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index bd3dd2706825..f689e6750974 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -58,7 +58,7 @@ static const struct drm_mode_config_funcs mtk_drm_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
-static const enum mtk_ddp_comp_id mt2701_mtk_ddp_main[] = {
+static const unsigned int mt2701_mtk_ddp_main[] = {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_RDMA0,
 	DDP_COMPONENT_COLOR0,
@@ -66,12 +66,12 @@ static const enum mtk_ddp_comp_id mt2701_mtk_ddp_main[] = {
 	DDP_COMPONENT_DSI0,
 };
 
-static const enum mtk_ddp_comp_id mt2701_mtk_ddp_ext[] = {
+static const unsigned int mt2701_mtk_ddp_ext[] = {
 	DDP_COMPONENT_RDMA1,
 	DDP_COMPONENT_DPI0,
 };
 
-static const enum mtk_ddp_comp_id mt7623_mtk_ddp_main[] = {
+static const unsigned int mt7623_mtk_ddp_main[] = {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_RDMA0,
 	DDP_COMPONENT_COLOR0,
@@ -79,12 +79,12 @@ static const enum mtk_ddp_comp_id mt7623_mtk_ddp_main[] = {
 	DDP_COMPONENT_DPI0,
 };
 
-static const enum mtk_ddp_comp_id mt7623_mtk_ddp_ext[] = {
+static const unsigned int mt7623_mtk_ddp_ext[] = {
 	DDP_COMPONENT_RDMA1,
 	DDP_COMPONENT_DSI0,
 };
 
-static const enum mtk_ddp_comp_id mt2712_mtk_ddp_main[] = {
+static const unsigned int mt2712_mtk_ddp_main[] = {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_COLOR0,
 	DDP_COMPONENT_AAL0,
@@ -94,7 +94,7 @@ static const enum mtk_ddp_comp_id mt2712_mtk_ddp_main[] = {
 	DDP_COMPONENT_PWM0,
 };
 
-static const enum mtk_ddp_comp_id mt2712_mtk_ddp_ext[] = {
+static const unsigned int mt2712_mtk_ddp_ext[] = {
 	DDP_COMPONENT_OVL1,
 	DDP_COMPONENT_COLOR1,
 	DDP_COMPONENT_AAL1,
@@ -104,13 +104,13 @@ static const enum mtk_ddp_comp_id mt2712_mtk_ddp_ext[] = {
 	DDP_COMPONENT_PWM1,
 };
 
-static const enum mtk_ddp_comp_id mt2712_mtk_ddp_third[] = {
+static const unsigned int mt2712_mtk_ddp_third[] = {
 	DDP_COMPONENT_RDMA2,
 	DDP_COMPONENT_DSI3,
 	DDP_COMPONENT_PWM2,
 };
 
-static enum mtk_ddp_comp_id mt8167_mtk_ddp_main[] = {
+static unsigned int mt8167_mtk_ddp_main[] = {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_COLOR0,
 	DDP_COMPONENT_CCORR,
@@ -121,7 +121,7 @@ static enum mtk_ddp_comp_id mt8167_mtk_ddp_main[] = {
 	DDP_COMPONENT_DSI0,
 };
 
-static const enum mtk_ddp_comp_id mt8173_mtk_ddp_main[] = {
+static const unsigned int mt8173_mtk_ddp_main[] = {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_COLOR0,
 	DDP_COMPONENT_AAL0,
@@ -132,7 +132,7 @@ static const enum mtk_ddp_comp_id mt8173_mtk_ddp_main[] = {
 	DDP_COMPONENT_PWM0,
 };
 
-static const enum mtk_ddp_comp_id mt8173_mtk_ddp_ext[] = {
+static const unsigned int mt8173_mtk_ddp_ext[] = {
 	DDP_COMPONENT_OVL1,
 	DDP_COMPONENT_COLOR1,
 	DDP_COMPONENT_GAMMA,
@@ -140,7 +140,7 @@ static const enum mtk_ddp_comp_id mt8173_mtk_ddp_ext[] = {
 	DDP_COMPONENT_DPI0,
 };
 
-static const enum mtk_ddp_comp_id mt8183_mtk_ddp_main[] = {
+static const unsigned int mt8183_mtk_ddp_main[] = {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_OVL_2L0,
 	DDP_COMPONENT_RDMA0,
@@ -152,13 +152,13 @@ static const enum mtk_ddp_comp_id mt8183_mtk_ddp_main[] = {
 	DDP_COMPONENT_DSI0,
 };
 
-static const enum mtk_ddp_comp_id mt8183_mtk_ddp_ext[] = {
+static const unsigned int mt8183_mtk_ddp_ext[] = {
 	DDP_COMPONENT_OVL_2L1,
 	DDP_COMPONENT_RDMA1,
 	DDP_COMPONENT_DPI0,
 };
 
-static const enum mtk_ddp_comp_id mt8186_mtk_ddp_main[] = {
+static const unsigned int mt8186_mtk_ddp_main[] = {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_RDMA0,
 	DDP_COMPONENT_COLOR0,
@@ -170,13 +170,13 @@ static const enum mtk_ddp_comp_id mt8186_mtk_ddp_main[] = {
 	DDP_COMPONENT_DSI0,
 };
 
-static const enum mtk_ddp_comp_id mt8186_mtk_ddp_ext[] = {
+static const unsigned int mt8186_mtk_ddp_ext[] = {
 	DDP_COMPONENT_OVL_2L0,
 	DDP_COMPONENT_RDMA1,
 	DDP_COMPONENT_DPI0,
 };
 
-static const enum mtk_ddp_comp_id mt8192_mtk_ddp_main[] = {
+static const unsigned int mt8192_mtk_ddp_main[] = {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_OVL_2L0,
 	DDP_COMPONENT_RDMA0,
@@ -189,13 +189,13 @@ static const enum mtk_ddp_comp_id mt8192_mtk_ddp_main[] = {
 	DDP_COMPONENT_DSI0,
 };
 
-static const enum mtk_ddp_comp_id mt8192_mtk_ddp_ext[] = {
+static const unsigned int mt8192_mtk_ddp_ext[] = {
 	DDP_COMPONENT_OVL_2L2,
 	DDP_COMPONENT_RDMA4,
 	DDP_COMPONENT_DPI0,
 };
 
-static const enum mtk_ddp_comp_id mt8195_mtk_ddp_main[] = {
+static const unsigned int mt8195_mtk_ddp_main[] = {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_RDMA0,
 	DDP_COMPONENT_COLOR0,
@@ -381,9 +381,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 {
 	struct mtk_drm_private *private = drm->dev_private;
 	struct mtk_drm_private *priv_n;
-	struct platform_device *pdev;
-	struct device_node *np = NULL;
-	struct device *dma_dev;
+	struct device *dma_dev = NULL;
 	int ret, i, j;
 
 	if (drm_firmware_drivers_only())
@@ -427,7 +425,6 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	 *    different drm private data structures. Loop through crtc index to
 	 *    create crtc from the main path and then ext_path and finally the
 	 *    third path.
-	 * 3. Use OVL device for all DMA memory allocations
 	 */
 	for (i = 0; i < MAX_CRTC; i++) {
 		for (j = 0; j < private->data->mmsys_dev_num; j++) {
@@ -439,9 +436,6 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 				if (ret)
 					goto err_component_unbind;
 
-				if (!np)
-					np = priv_n->comp_node[priv_n->data->main_path[0]];
-
 				continue;
 			} else if (i == 1 && priv_n->data->ext_len) {
 				ret = mtk_drm_crtc_create(drm, priv_n->data->ext_path,
@@ -449,9 +443,6 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 				if (ret)
 					goto err_component_unbind;
 
-				if (!np)
-					np = priv_n->comp_node[priv_n->data->ext_path[0]];
-
 				continue;
 			} else if (i == 2 && priv_n->data->third_len) {
 				ret = mtk_drm_crtc_create(drm, priv_n->data->third_path,
@@ -459,22 +450,19 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 				if (ret)
 					goto err_component_unbind;
 
-				if (!np)
-					np = priv_n->comp_node[priv_n->data->third_path[0]];
-
 				continue;
 			}
 		}
 	}
 
-	pdev = of_find_device_by_node(np);
-	if (!pdev) {
+	/* Use OVL device for all DMA memory allocations */
+	dma_dev = mtk_drm_crtc_dma_dev_get(drm_crtc_from_index(drm, 0));
+	if (!dma_dev) {
 		ret = -ENODEV;
 		dev_err(drm->dev, "Need at least one OVL device\n");
 		goto err_component_unbind;
 	}
 
-	dma_dev = &pdev->dev;
 	for (i = 0; i < private->data->mmsys_dev_num; i++)
 		private->all_drm_private[i]->dma_dev = dma_dev;
 
@@ -548,6 +536,11 @@ static const struct drm_driver mtk_drm_driver = {
 	.minor = DRIVER_MINOR,
 };
 
+static int compare_dev(struct device *dev, void *data)
+{
+	return dev == (struct device *)data;
+}
+
 static int mtk_drm_bind(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
@@ -746,6 +739,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 	struct mtk_drm_private *private;
 	struct device_node *node;
 	struct component_match *match = NULL;
+	struct platform_device *ovl_adaptor;
 	int ret;
 	int i;
 
@@ -771,6 +765,18 @@ static int mtk_drm_probe(struct platform_device *pdev)
 	if (!private->all_drm_private)
 		return -ENOMEM;
 
+	/* Bringup ovl_adaptor */
+	if (mtk_drm_find_mmsys_comp(private, DDP_COMPONENT_DRM_OVL_ADAPTOR)) {
+		ovl_adaptor = platform_device_register_data(dev, "mediatek-disp-ovl-adaptor",
+							    PLATFORM_DEVID_AUTO,
+							    (void *)private->mmsys_dev,
+							    sizeof(*private->mmsys_dev));
+		private->ddp_comp[DDP_COMPONENT_DRM_OVL_ADAPTOR].dev = &ovl_adaptor->dev;
+		mtk_ddp_comp_init(NULL, &private->ddp_comp[DDP_COMPONENT_DRM_OVL_ADAPTOR],
+				  DDP_COMPONENT_DRM_OVL_ADAPTOR);
+		component_match_add(dev, &match, compare_dev, &ovl_adaptor->dev);
+	}
+
 	/* Iterate over sibling DISP function blocks */
 	for_each_child_of_node(phandle->parent, node) {
 		const struct of_device_id *of_id;
@@ -824,6 +830,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		    comp_type == MTK_DISP_MERGE ||
 		    comp_type == MTK_DISP_OVL ||
 		    comp_type == MTK_DISP_OVL_2L ||
+		    comp_type == MTK_DISP_OVL_ADAPTOR ||
 		    comp_type == MTK_DISP_RDMA ||
 		    comp_type == MTK_DP_INTF ||
 		    comp_type == MTK_DPI ||
@@ -861,7 +868,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 	pm_runtime_disable(dev);
 err_node:
 	of_node_put(private->mutex_node);
-	for (i = 0; i < DDP_COMPONENT_ID_MAX; i++)
+	for (i = 0; i < DDP_COMPONENT_DRM_ID_MAX; i++)
 		of_node_put(private->comp_node[i]);
 	return ret;
 }
@@ -874,7 +881,7 @@ static int mtk_drm_remove(struct platform_device *pdev)
 	component_master_del(&pdev->dev, &mtk_drm_ops);
 	pm_runtime_disable(&pdev->dev);
 	of_node_put(private->mutex_node);
-	for (i = 0; i < DDP_COMPONENT_ID_MAX; i++)
+	for (i = 0; i < DDP_COMPONENT_DRM_ID_MAX; i++)
 		of_node_put(private->comp_node[i]);
 
 	return 0;
@@ -923,6 +930,7 @@ static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_disp_color_driver,
 	&mtk_disp_gamma_driver,
 	&mtk_disp_merge_driver,
+	&mtk_disp_ovl_adaptor_driver,
 	&mtk_disp_ovl_driver,
 	&mtk_disp_rdma_driver,
 	&mtk_dpi_driver,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 8d3ff32b5364..eb2fd45941f0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -11,6 +11,8 @@
 
 #define MAX_CRTC	3
 #define MAX_CONNECTOR	2
+#define DDP_COMPONENT_DRM_OVL_ADAPTOR (DDP_COMPONENT_ID_MAX + 1)
+#define DDP_COMPONENT_DRM_ID_MAX (DDP_COMPONENT_DRM_OVL_ADAPTOR + 1)
 
 struct device;
 struct device_node;
@@ -21,11 +23,11 @@ struct drm_property;
 struct regmap;
 
 struct mtk_mmsys_driver_data {
-	const enum mtk_ddp_comp_id *main_path;
+	const unsigned int *main_path;
 	unsigned int main_len;
-	const enum mtk_ddp_comp_id *ext_path;
+	const unsigned int *ext_path;
 	unsigned int ext_len;
-	const enum mtk_ddp_comp_id *third_path;
+	const unsigned int *third_path;
 	unsigned int third_len;
 
 	bool shadow_register;
@@ -42,8 +44,8 @@ struct mtk_drm_private {
 	struct device_node *mutex_node;
 	struct device *mutex_dev;
 	struct device *mmsys_dev;
-	struct device_node *comp_node[DDP_COMPONENT_ID_MAX];
-	struct mtk_ddp_comp ddp_comp[DDP_COMPONENT_ID_MAX];
+	struct device_node *comp_node[DDP_COMPONENT_DRM_ID_MAX];
+	struct mtk_ddp_comp ddp_comp[DDP_COMPONENT_DRM_ID_MAX];
 	const struct mtk_mmsys_driver_data *data;
 	struct drm_atomic_state *suspend_state;
 	unsigned int mbox_index;
-- 
2.18.0

