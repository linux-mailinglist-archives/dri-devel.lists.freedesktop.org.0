Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81D5489415
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 09:47:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D5A12AD92;
	Mon, 10 Jan 2022 08:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACCE12AD93
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 08:46:54 +0000 (UTC)
X-UUID: 5f0949c0d8d9487c950a0bfec83bac80-20220110
X-UUID: 5f0949c0d8d9487c950a0bfec83bac80-20220110
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1523450364; Mon, 10 Jan 2022 16:46:50 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 10 Jan 2022 16:46:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 10 Jan 2022 16:46:48 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v11 20/22] drm/mediatek: add drm ovl_adaptor sub driver for
 MT8195
Date: Mon, 10 Jan 2022 16:46:43 +0800
Message-ID: <20220110084645.31191-21-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220110084645.31191-1-nancy.lin@mediatek.com>
References: <20220110084645.31191-1-nancy.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add drm ovl_adaptor sub driver. Bring up ovl_adaptor sub driver if
the component exists in the path.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 16 ++++----
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 30 ++++++++++++---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 41 +++++++++++++++------
 4 files changed, 62 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index fe2871aca859..62529a954b62 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -877,15 +877,13 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		node = priv->comp_node[comp_id];
 		comp = &priv->ddp_comp[comp_id];
 
-		if (!node) {
-			dev_info(dev,
-				 "Not creating crtc %d because component %d is disabled or missing\n",
-				 crtc_i, comp_id);
-			return 0;
-		}
-
-		if (!comp->dev) {
-			dev_err(dev, "Component %pOF not initialized\n", node);
+		/* Not all drm components have a DTS device node, such as ovl_adaptor,
+		 * which is the drm bring up sub driver
+		 */
+		if (!node && !comp->dev) {
+			dev_err(dev,
+				"Not creating crtc %d because component %d is disabled, missing or not initialized\n",
+				crtc_i, comp_id);
 			return -ENODEV;
 		}
 	}
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 26d197da41c0..ce40bab9c56b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -385,6 +385,18 @@ static const struct mtk_ddp_comp_funcs ddp_ufoe = {
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
+	.enable_vblank = mtk_ovl_adaptor_enable_vblank,
+	.disable_vblank = mtk_ovl_adaptor_disable_vblank,
+};
+
 static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_AAL] = "aal",
 	[MTK_DISP_BLS] = "bls",
@@ -398,6 +410,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_OD] = "od",
 	[MTK_DISP_OVL] = "ovl",
 	[MTK_DISP_OVL_2L] = "ovl-2l",
+	[MTK_DISP_OVL_ADAPTOR] = "ovl_adaptor",
 	[MTK_DISP_POSTMASK] = "postmask",
 	[MTK_DISP_PWM] = "pwm",
 	[MTK_DISP_RDMA] = "rdma",
@@ -443,6 +456,7 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_OVL_2L0]		= { MTK_DISP_OVL_2L,	0, &ddp_ovl },
 	[DDP_COMPONENT_OVL_2L1]		= { MTK_DISP_OVL_2L,	1, &ddp_ovl },
 	[DDP_COMPONENT_OVL_2L2]		= { MTK_DISP_OVL_2L,    2, &ddp_ovl },
+	[DDP_COMPONENT_OVL_ADAPTOR]	= { MTK_DISP_OVL_ADAPTOR,	0, &ddp_ovl_adaptor },
 	[DDP_COMPONENT_POSTMASK0]	= { MTK_DISP_POSTMASK,	0, &ddp_postmask },
 	[DDP_COMPONENT_PWM0]		= { MTK_DISP_PWM,	0, NULL },
 	[DDP_COMPONENT_PWM1]		= { MTK_DISP_PWM,	1, NULL },
@@ -548,12 +562,17 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 
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
 
 	/* Only DMA capable components need the LARB property */
 	if (type == MTK_DISP_OVL ||
@@ -573,6 +592,7 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	    type == MTK_DISP_MERGE ||
 	    type == MTK_DISP_OVL ||
 	    type == MTK_DISP_OVL_2L ||
+	    type == MTK_DISP_OVL_ADAPTOR ||
 	    type == MTK_DISP_PWM ||
 	    type == MTK_DISP_RDMA ||
 	    type == MTK_DPI ||
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 221e2e3a3c8d..5e1404dc20c4 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -30,6 +30,7 @@ enum mtk_ddp_comp_type {
 	MTK_DISP_OD,
 	MTK_DISP_OVL,
 	MTK_DISP_OVL_2L,
+	MTK_DISP_OVL_ADAPTOR,
 	MTK_DISP_POSTMASK,
 	MTK_DISP_PWM,
 	MTK_DISP_RDMA,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a05703843af2..36430f956b4f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -351,9 +351,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 {
 	struct mtk_drm_private *private = drm->dev_private;
 	struct mtk_drm_private *priv_n;
-	struct platform_device *pdev;
-	struct device_node *np = NULL;
-	struct device *dma_dev;
+	struct device *dma_dev = NULL;
 	int ret, i, j;
 
 	ret = drmm_mode_config_init(drm);
@@ -400,8 +398,8 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 				if (ret)
 					goto err_component_unbind;
 
-				if (!np)
-					np = priv_n->comp_node[priv_n->data->main_path[0]];
+				if (!dma_dev)
+					dma_dev = priv_n->ddp_comp[priv_n->data->main_path[0]].dev;
 
 				continue;
 			} else if (i == 1 && priv_n->data->ext_len) {
@@ -410,8 +408,8 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 				if (ret)
 					goto err_component_unbind;
 
-				if (!np)
-					np = priv_n->comp_node[priv_n->data->ext_path[0]];
+				if (!dma_dev)
+					dma_dev = priv_n->ddp_comp[priv_n->data->ext_path[0]].dev;
 
 				continue;
 			} else if (i == 2 && priv_n->data->third_len) {
@@ -420,22 +418,20 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 				if (ret)
 					goto err_component_unbind;
 
-				if (!np)
-					np = priv_n->comp_node[priv_n->data->third_path[0]];
+				if (!dma_dev)
+					dma_dev = priv_n->ddp_comp[priv_n->data->third_path[0]].dev;
 
 				continue;
 			}
 		}
 	}
 
-	pdev = of_find_device_by_node(np);
-	if (!pdev) {
+	if (!dma_dev) {
 		ret = -ENODEV;
 		dev_err(drm->dev, "Need at least one OVL device\n");
 		goto err_component_unbind;
 	}
 
-	dma_dev = &pdev->dev;
 	for (i = 0; i < private->data->mmsys_dev_num; i++)
 		private->all_drm_private[i]->dma_dev = dma_dev;
 
@@ -514,6 +510,11 @@ static int compare_of(struct device *dev, void *data)
 	return dev->of_node == data;
 }
 
+static int compare_dev(struct device *dev, void *data)
+{
+	return dev == (struct device *)data;
+}
+
 static int mtk_drm_bind(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
@@ -702,6 +703,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 	struct mtk_drm_private *private;
 	struct device_node *node;
 	struct component_match *match = NULL;
+	struct platform_device *ovl_adaptor;
 	int ret;
 	int i;
 
@@ -727,6 +729,19 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	/* Bringup ovl_adaptor */
+	if (mtk_drm_find_mmsys_comp(private, DDP_COMPONENT_OVL_ADAPTOR)) {
+		ovl_adaptor = platform_device_register_data(dev, "mediatek-disp-ovl-adaptor",
+							    PLATFORM_DEVID_AUTO,
+							    (void *)private->mmsys_dev,
+							    sizeof(*private->mmsys_dev));
+		private->ddp_comp[DDP_COMPONENT_OVL_ADAPTOR].dev = &ovl_adaptor->dev;
+		private->comp_node[DDP_COMPONENT_OVL_ADAPTOR] = ovl_adaptor->dev.of_node;
+		mtk_ddp_comp_init(NULL, &private->ddp_comp[DDP_COMPONENT_OVL_ADAPTOR],
+				  DDP_COMPONENT_OVL_ADAPTOR);
+		component_match_add(dev, &match, compare_dev, &ovl_adaptor->dev);
+	}
+
 	/* Iterate over sibling DISP function blocks */
 	for_each_child_of_node(phandle->parent, node) {
 		const struct of_device_id *of_id;
@@ -780,6 +795,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		    comp_type == MTK_DISP_MERGE ||
 		    comp_type == MTK_DISP_OVL ||
 		    comp_type == MTK_DISP_OVL_2L ||
+		    comp_type == MTK_DISP_OVL_ADAPTOR ||
 		    comp_type == MTK_DISP_RDMA ||
 		    comp_type == MTK_DPI ||
 		    comp_type == MTK_DSI) {
@@ -882,6 +898,7 @@ static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_disp_color_driver,
 	&mtk_disp_gamma_driver,
 	&mtk_disp_merge_driver,
+	&mtk_disp_ovl_adaptor_driver,
 	&mtk_disp_ovl_driver,
 	&mtk_disp_rdma_driver,
 	&mtk_dpi_driver,
-- 
2.18.0

