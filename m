Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A362D6144
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 17:11:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203ED6EAAF;
	Thu, 10 Dec 2020 16:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360656EA9B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 16:11:02 +0000 (UTC)
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 02/12] drm/mediatek: Use correct device pointer to get CMDQ
 client register
Date: Fri, 11 Dec 2020 00:10:40 +0800
Message-Id: <20201210161050.8460-3-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201210161050.8460-1-chunkuang.hu@kernel.org>
References: <20201210161050.8460-1-chunkuang.hu@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some ddp component use mmsys device pointer to get CMDQ client
register, this would get mmsys' CMDQ client register, so use
each ddp component's device pointer to get.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_color.c   |  2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  2 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |  2 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c          |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 15 +++++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  5 ++---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c          |  2 +-
 8 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 6048cbc9f0ec..6ee4515dc272 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -118,7 +118,7 @@ static int mtk_disp_color_probe(struct platform_device *pdev)
 		return comp_id;
 	}
 
-	ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
+	ret = mtk_ddp_comp_init(dev->of_node, &priv->ddp_comp, comp_id,
 				&mtk_disp_color_funcs);
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 74ef6fc0528b..f8e99d67132d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -384,7 +384,7 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 		return comp_id;
 	}
 
-	ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
+	ret = mtk_ddp_comp_init(dev->of_node, &priv->ddp_comp, comp_id,
 				&mtk_disp_ovl_funcs);
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index d46b8ae1d080..a3c487ea8344 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -292,7 +292,7 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 		return comp_id;
 	}
 
-	ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
+	ret = mtk_ddp_comp_init(dev->of_node, &priv->ddp_comp, comp_id,
 				&mtk_disp_rdma_funcs);
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index cf11c4850b40..6852b76fa583 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -784,7 +784,7 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return comp_id;
 	}
 
-	ret = mtk_ddp_comp_init(dev, dev->of_node, &dpi->ddp_comp, comp_id,
+	ret = mtk_ddp_comp_init(dev->of_node, &dpi->ddp_comp, comp_id,
 				&mtk_dpi_funcs);
 	if (ret) {
 		dev_err(dev, "Failed to initialize component: %d\n", ret);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index cab53431ceec..1730b3ddef70 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -465,10 +465,11 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
 	return ret;
 }
 
-int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
-		      struct mtk_ddp_comp *comp, enum mtk_ddp_comp_id comp_id,
-		      const struct mtk_ddp_comp_funcs *funcs)
+int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
+		      enum mtk_ddp_comp_id comp_id, const struct mtk_ddp_comp_funcs *funcs)
 {
+	struct platform_device *comp_pdev;
+	struct device *dev;
 	enum mtk_ddp_comp_type type;
 	struct device_node *larb_node;
 	struct platform_device *larb_pdev;
@@ -506,10 +507,16 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
 	if (IS_ERR(comp->clk))
 		return PTR_ERR(comp->clk);
 
+	comp_pdev = of_find_device_by_node(node);
+	if (!comp_pdev) {
+		DRM_INFO("Waiting for device %s\n", node->full_name);
+		return -EPROBE_DEFER;
+	}
+	dev = &comp_pdev->dev;
+
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (of_address_to_resource(node, 0, &res) != 0) {
 		dev_err(dev, "Missing reg in %s node\n", node->full_name);
-		put_device(&larb_pdev->dev);
 		return -EINVAL;
 	}
 	comp->regs_pa = res.start;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 1d9e00b69462..3bd6012d0746 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -204,9 +204,8 @@ int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type);
 unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
 						struct mtk_ddp_comp ddp_comp);
-int mtk_ddp_comp_init(struct device *dev, struct device_node *comp_node,
-		      struct mtk_ddp_comp *comp, enum mtk_ddp_comp_id comp_id,
-		      const struct mtk_ddp_comp_funcs *funcs);
+int mtk_ddp_comp_init(struct device_node *comp_node, struct mtk_ddp_comp *comp,
+		      enum mtk_ddp_comp_id comp_id, const struct mtk_ddp_comp_funcs *funcs);
 int mtk_ddp_comp_register(struct drm_device *drm, struct mtk_ddp_comp *comp);
 void mtk_ddp_comp_unregister(struct drm_device *drm, struct mtk_ddp_comp *comp);
 void mtk_dither_set(struct mtk_ddp_comp *comp, unsigned int bpc,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index b59c5df3b5b4..51ca3eb55214 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -512,7 +512,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 				goto err_node;
 			}
 
-			ret = mtk_ddp_comp_init(dev->parent, node, comp,
+			ret = mtk_ddp_comp_init(node, comp,
 						comp_id, NULL);
 			if (ret) {
 				of_node_put(node);
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 4a188a942c38..86109698f19c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1114,7 +1114,7 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 		goto err_unregister_host;
 	}
 
-	ret = mtk_ddp_comp_init(dev, dev->of_node, &dsi->ddp_comp, comp_id,
+	ret = mtk_ddp_comp_init(dev->of_node, &dsi->ddp_comp, comp_id,
 				&mtk_dsi_funcs);
 	if (ret) {
 		dev_err(dev, "Failed to initialize component: %d\n", ret);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
