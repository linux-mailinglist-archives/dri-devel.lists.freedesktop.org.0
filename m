Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BFA2A37E0
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 01:35:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EFA6E5D5;
	Tue,  3 Nov 2020 00:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E576E5D5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 00:35:04 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E9E32225E;
 Tue,  3 Nov 2020 00:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604363704;
 bh=rlECMz/HVV03UqRCXChb3B4CjAtlG4CMztDxXRrLKP8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cpGoUJC0n77VK5Jjo0hTv6WGUqX8GSCr80MbjonLo9+FI4+MTE0VP0hnKGTsnNT8o
 nq/k7iTgxBwX5QUg/lsVAkT9KrmZqpEgX5ECMYafDeEK0xI/a9i9bcEK2sVNn83K85
 Xr4xAF14Dw5aCtq8mmej3K8UDayFtKlug5OtjW4M=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 11/11] drm/mediatek: Move mtk_ddp_comp_init() from sub driver
 to DRM driver
Date: Tue,  3 Nov 2020 08:34:22 +0800
Message-Id: <20201103003422.17838-12-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201103003422.17838-1-chunkuang.hu@kernel.org>
References: <20201103003422.17838-1-chunkuang.hu@kernel.org>
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

From: CK Hu <ck.hu@mediatek.com>

Some ddp component exist in both display path and other path, so
sub driver should not directly call DRM driver's function. Moving
mtk_ddp_comp_init() from sub driver to DRM driver to achieve this.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_color.c   | 32 -----------------
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 36 -------------------
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 32 -----------------
 drivers/gpu/drm/mediatek/mtk_dpi.c          | 29 ++--------------
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 38 ++++++---------------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  4 +--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 29 +++++-----------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |  2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c          | 32 +----------------
 10 files changed, 25 insertions(+), 211 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 99a680164226..2217965041d8 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -35,7 +35,6 @@ struct mtk_disp_color_data {
  * @crtc - associated crtc to report irq events to
  */
 struct mtk_disp_color {
-	struct mtk_ddp_comp			ddp_comp;
 	struct drm_crtc				*crtc;
 	struct clk				*clk;
 	void __iomem				*regs;
@@ -79,27 +78,12 @@ void mtk_color_start(struct device *dev)
 static int mtk_disp_color_bind(struct device *dev, struct device *master,
 			       void *data)
 {
-	struct mtk_disp_color *priv = dev_get_drvdata(dev);
-	struct drm_device *drm_dev = data;
-	int ret;
-
-	ret = mtk_ddp_comp_register(drm_dev, &priv->ddp_comp);
-	if (ret < 0) {
-		dev_err(dev, "Failed to register component %pOF: %d\n",
-			dev->of_node, ret);
-		return ret;
-	}
-
 	return 0;
 }
 
 static void mtk_disp_color_unbind(struct device *dev, struct device *master,
 				  void *data)
 {
-	struct mtk_disp_color *priv = dev_get_drvdata(dev);
-	struct drm_device *drm_dev = data;
-
-	mtk_ddp_comp_unregister(drm_dev, &priv->ddp_comp);
 }
 
 static const struct component_ops mtk_disp_color_component_ops = {
@@ -112,7 +96,6 @@ static int mtk_disp_color_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mtk_disp_color *priv;
 	struct resource *res;
-	int comp_id;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -137,21 +120,6 @@ static int mtk_disp_color_probe(struct platform_device *pdev)
 		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
 #endif
 
-	comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DISP_COLOR);
-	if (comp_id < 0) {
-		dev_err(dev, "Failed to identify by alias: %d\n", comp_id);
-		return comp_id;
-	}
-
-	ret = mtk_ddp_comp_init(dev->of_node, &priv->ddp_comp, comp_id);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to initialize component: %d\n",
-				ret);
-
-		return ret;
-	}
-
 	priv->data = of_device_get_match_data(dev);
 
 	platform_set_drvdata(pdev, priv);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index d1ec5e19d1ff..fd5262ae7c0f 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -70,7 +70,6 @@ struct mtk_disp_ovl_data {
  * @crtc - associated crtc to report vblank events to
  */
 struct mtk_disp_ovl {
-	struct mtk_ddp_comp		ddp_comp;
 	struct drm_crtc			*crtc;
 	struct clk			*clk;
 	void __iomem			*regs;
@@ -341,27 +340,12 @@ void mtk_ovl_bgclr_in_off(struct device *dev)
 static int mtk_disp_ovl_bind(struct device *dev, struct device *master,
 			     void *data)
 {
-	struct mtk_disp_ovl *priv = dev_get_drvdata(dev);
-	struct drm_device *drm_dev = data;
-	int ret;
-
-	ret = mtk_ddp_comp_register(drm_dev, &priv->ddp_comp);
-	if (ret < 0) {
-		dev_err(dev, "Failed to register component %pOF: %d\n",
-			dev->of_node, ret);
-		return ret;
-	}
-
 	return 0;
 }
 
 static void mtk_disp_ovl_unbind(struct device *dev, struct device *master,
 				void *data)
 {
-	struct mtk_disp_ovl *priv = dev_get_drvdata(dev);
-	struct drm_device *drm_dev = data;
-
-	mtk_ddp_comp_unregister(drm_dev, &priv->ddp_comp);
 }
 
 static const struct component_ops mtk_disp_ovl_component_ops = {
@@ -374,7 +358,6 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mtk_disp_ovl *priv;
 	struct resource *res;
-	int comp_id;
 	int irq;
 	int ret;
 
@@ -405,25 +388,6 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 #endif
 
 	priv->data = of_device_get_match_data(dev);
-
-	comp_id = mtk_ddp_comp_get_id(dev->of_node,
-				      priv->data->layer_nr == 4 ?
-				      MTK_DISP_OVL :
-				      MTK_DISP_OVL_2L);
-	if (comp_id < 0) {
-		dev_err(dev, "Failed to identify by alias: %d\n", comp_id);
-		return comp_id;
-	}
-
-	ret = mtk_ddp_comp_init(dev->of_node, &priv->ddp_comp, comp_id);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to initialize component: %d\n",
-				ret);
-
-		return ret;
-	}
-
 	platform_set_drvdata(pdev, priv);
 
 	ret = devm_request_irq(dev, irq, mtk_disp_ovl_irq_handler,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 5c5f04c2cc21..eb44e5a184ea 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -61,7 +61,6 @@ struct mtk_disp_rdma_data {
  * @crtc - associated crtc to report irq events to
  */
 struct mtk_disp_rdma {
-	struct mtk_ddp_comp		ddp_comp;
 	struct clk			*clk;
 	void __iomem			*regs;
 	struct cmdq_client_reg		cmdq_reg;
@@ -249,17 +248,6 @@ void mtk_rdma_layer_config(struct device *dev, unsigned int idx,
 static int mtk_disp_rdma_bind(struct device *dev, struct device *master,
 			      void *data)
 {
-	struct mtk_disp_rdma *priv = dev_get_drvdata(dev);
-	struct drm_device *drm_dev = data;
-	int ret;
-
-	ret = mtk_ddp_comp_register(drm_dev, &priv->ddp_comp);
-	if (ret < 0) {
-		dev_err(dev, "Failed to register component %pOF: %d\n",
-			dev->of_node, ret);
-		return ret;
-	}
-
 	return 0;
 
 }
@@ -267,10 +255,6 @@ static int mtk_disp_rdma_bind(struct device *dev, struct device *master,
 static void mtk_disp_rdma_unbind(struct device *dev, struct device *master,
 				 void *data)
 {
-	struct mtk_disp_rdma *priv = dev_get_drvdata(dev);
-	struct drm_device *drm_dev = data;
-
-	mtk_ddp_comp_unregister(drm_dev, &priv->ddp_comp);
 }
 
 static const struct component_ops mtk_disp_rdma_component_ops = {
@@ -283,7 +267,6 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mtk_disp_rdma *priv;
 	struct resource *res;
-	int comp_id;
 	int irq;
 	int ret;
 
@@ -313,21 +296,6 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
 #endif
 
-	comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DISP_RDMA);
-	if (comp_id < 0) {
-		dev_err(dev, "Failed to identify by alias: %d\n", comp_id);
-		return comp_id;
-	}
-
-	ret = mtk_ddp_comp_init(dev->of_node, &priv->ddp_comp, comp_id);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to initialize component: %d\n",
-				ret);
-
-		return ret;
-	}
-
 	/* Disable and clear pending interrupts */
 	writel(0x0, priv->regs + DISP_REG_RDMA_INT_ENABLE);
 	writel(0x0, priv->regs + DISP_REG_RDMA_INT_STATUS);
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 4d0d84d34fb1..7d279f0ff55a 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -63,7 +63,6 @@ enum mtk_dpi_out_color_format {
 };
 
 struct mtk_dpi {
-	struct mtk_ddp_comp ddp_comp;
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
@@ -592,21 +591,14 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm_dev = data;
 	int ret;
 
-	ret = mtk_ddp_comp_register(drm_dev, &dpi->ddp_comp);
-	if (ret < 0) {
-		dev_err(dev, "Failed to register component %pOF: %d\n",
-			dev->of_node, ret);
-		return ret;
-	}
-
 	ret = drm_simple_encoder_init(drm_dev, &dpi->encoder,
 				      DRM_MODE_ENCODER_TMDS);
 	if (ret) {
 		dev_err(dev, "Failed to initialize decoder: %d\n", ret);
-		goto err_unregister;
+		return ret;
 	}
 
-	dpi->encoder.possible_crtcs = mtk_drm_find_possible_crtc_by_comp(drm_dev, dpi->ddp_comp);
+	dpi->encoder.possible_crtcs = mtk_drm_find_possible_crtc_by_comp(drm_dev, dpi->dev);
 
 	ret = drm_bridge_attach(&dpi->encoder, &dpi->bridge, NULL, 0);
 	if (ret) {
@@ -623,8 +615,6 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 
 err_cleanup:
 	drm_encoder_cleanup(&dpi->encoder);
-err_unregister:
-	mtk_ddp_comp_unregister(drm_dev, &dpi->ddp_comp);
 	return ret;
 }
 
@@ -632,10 +622,8 @@ static void mtk_dpi_unbind(struct device *dev, struct device *master,
 			   void *data)
 {
 	struct mtk_dpi *dpi = dev_get_drvdata(dev);
-	struct drm_device *drm_dev = data;
 
 	drm_encoder_cleanup(&dpi->encoder);
-	mtk_ddp_comp_unregister(drm_dev, &dpi->ddp_comp);
 }
 
 static const struct component_ops mtk_dpi_component_ops = {
@@ -696,7 +684,6 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mtk_dpi *dpi;
 	struct resource *mem;
-	int comp_id;
 	int ret;
 
 	dpi = devm_kzalloc(dev, sizeof(*dpi), GFP_KERNEL);
@@ -774,18 +761,6 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 
 	dev_info(dev, "Found bridge node: %pOF\n", dpi->next_bridge->of_node);
 
-	comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DPI);
-	if (comp_id < 0) {
-		dev_err(dev, "Failed to identify by alias: %d\n", comp_id);
-		return comp_id;
-	}
-
-	ret = mtk_ddp_comp_init(dev->of_node, &dpi->ddp_comp, comp_id);
-	if (ret) {
-		dev_err(dev, "Failed to initialize component: %d\n", ret);
-		return ret;
-	}
-
 	platform_set_drvdata(pdev, dpi);
 
 	dpi->bridge.funcs = &mtk_dpi_bridge_funcs;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 01c35786be49..7ec833d800eb 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -781,7 +781,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		struct device_node *node;
 
 		node = priv->comp_node[comp_id];
-		comp = priv->ddp_comp[comp_id];
+		comp = &priv->ddp_comp[comp_id];
 		if (!comp) {
 			dev_err(dev, "Component %pOF not initialized\n", node);
 			ret = -ENODEV;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 45ccb2ed9b4d..c25d38d9cfe6 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -524,9 +524,10 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA1]	= { MTK_DISP_WDMA,	1, NULL },
 };
 
-static bool mtk_drm_find_comp_in_ddp(struct mtk_ddp_comp ddp_comp,
+static bool mtk_drm_find_comp_in_ddp(struct device *dev,
 				     const enum mtk_ddp_comp_id *path,
-				     unsigned int path_len)
+				     unsigned int path_len,
+				     struct mtk_ddp_comp *ddp_comp)
 {
 	unsigned int i;
 
@@ -534,7 +535,7 @@ static bool mtk_drm_find_comp_in_ddp(struct mtk_ddp_comp ddp_comp,
 		return false;
 
 	for (i = 0U; i < path_len; i++)
-		if (ddp_comp.id == path[i])
+		if (dev == ddp_comp[path[i]].dev)
 			return true;
 
 	return false;
@@ -556,18 +557,19 @@ int mtk_ddp_comp_get_id(struct device_node *node,
 }
 
 unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
-						struct mtk_ddp_comp ddp_comp)
+						struct device *dev)
 {
 	struct mtk_drm_private *private = drm->dev_private;
 	unsigned int ret = 0;
 
-	if (mtk_drm_find_comp_in_ddp(ddp_comp, private->data->main_path, private->data->main_len))
+	if (mtk_drm_find_comp_in_ddp(dev, private->data->main_path, private->data->main_len,
+				     private->ddp_comp))
 		ret = BIT(0);
-	else if (mtk_drm_find_comp_in_ddp(ddp_comp, private->data->ext_path,
-					  private->data->ext_len))
+	else if (mtk_drm_find_comp_in_ddp(dev, private->data->ext_path,
+					  private->data->ext_len, private->ddp_comp))
 		ret = BIT(1);
-	else if (mtk_drm_find_comp_in_ddp(ddp_comp, private->data->third_path,
-					  private->data->third_len))
+	else if (mtk_drm_find_comp_in_ddp(dev, private->data->third_path,
+					  private->data->third_len, private->ddp_comp))
 		ret = BIT(2);
 	else
 		DRM_INFO("Failed to find comp in ddp table\n");
@@ -664,21 +666,3 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 
 	return 0;
 }
-
-int mtk_ddp_comp_register(struct drm_device *drm, struct mtk_ddp_comp *comp)
-{
-	struct mtk_drm_private *private = drm->dev_private;
-
-	if (private->ddp_comp[comp->id])
-		return -EBUSY;
-
-	private->ddp_comp[comp->id] = comp;
-	return 0;
-}
-
-void mtk_ddp_comp_unregister(struct drm_device *drm, struct mtk_ddp_comp *comp)
-{
-	struct mtk_drm_private *private = drm->dev_private;
-
-	private->ddp_comp[comp->id] = NULL;
-}
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 03db5fb4fc56..e2588e64426e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -220,11 +220,9 @@ static inline void mtk_ddp_ctm_set(struct mtk_ddp_comp *comp,
 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type);
 unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
-						struct mtk_ddp_comp ddp_comp);
+						struct device *dev);
 int mtk_ddp_comp_init(struct device_node *comp_node, struct mtk_ddp_comp *comp,
 		      enum mtk_ddp_comp_id comp_id);
-int mtk_ddp_comp_register(struct drm_device *drm, struct mtk_ddp_comp *comp);
-void mtk_ddp_comp_unregister(struct drm_device *drm, struct mtk_ddp_comp *comp);
 enum mtk_ddp_comp_type mtk_ddp_comp_get_type(enum mtk_ddp_comp_id comp_id);
 void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 		   struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index d0a4bac846c2..a5aae18dac07 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -528,23 +528,12 @@ static int mtk_drm_probe(struct platform_device *pdev)
 				 node);
 			drm_of_component_match_add(dev, &match, compare_of,
 						   node);
-		} else {
-			struct mtk_ddp_comp *comp;
-
-			comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
-			if (!comp) {
-				ret = -ENOMEM;
-				of_node_put(node);
-				goto err_node;
-			}
-
-			ret = mtk_ddp_comp_init(node, comp, comp_id);
-			if (ret) {
-				of_node_put(node);
-				goto err_node;
-			}
-
-			private->ddp_comp[comp_id] = comp;
+		}
+
+		ret = mtk_ddp_comp_init(node, &private->ddp_comp[comp_id], comp_id);
+		if (ret) {
+			of_node_put(node);
+			goto err_node;
 		}
 	}
 
@@ -570,10 +559,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
 	of_node_put(private->mutex_node);
 	for (i = 0; i < DDP_COMPONENT_ID_MAX; i++) {
 		of_node_put(private->comp_node[i]);
-		if (private->ddp_comp[i]) {
-			put_device(private->ddp_comp[i]->larb_dev);
-			private->ddp_comp[i] = NULL;
-		}
+		if (private->ddp_comp[i].larb_dev)
+			put_device(private->ddp_comp[i].larb_dev);
 	}
 	return ret;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index b5be63e53176..51b42e3ecdc4 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -41,7 +41,7 @@ struct mtk_drm_private {
 	struct device *mutex_dev;
 	struct device *mmsys_dev;
 	struct device_node *comp_node[DDP_COMPONENT_ID_MAX];
-	struct mtk_ddp_comp *ddp_comp[DDP_COMPONENT_ID_MAX];
+	struct mtk_ddp_comp ddp_comp[DDP_COMPONENT_ID_MAX];
 	const struct mtk_mmsys_driver_data *data;
 	struct drm_atomic_state *suspend_state;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 50f8d803f8dd..6e15f8437bc8 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -179,7 +179,6 @@ struct mtk_dsi_driver_data {
 };
 
 struct mtk_dsi {
-	struct mtk_ddp_comp ddp_comp;
 	struct device *dev;
 	struct mipi_dsi_host host;
 	struct drm_encoder encoder;
@@ -965,7 +964,7 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		return ret;
 	}
 
-	dsi->encoder.possible_crtcs = mtk_drm_find_possible_crtc_by_comp(drm, dsi->ddp_comp);
+	dsi->encoder.possible_crtcs = mtk_drm_find_possible_crtc_by_comp(drm, dsi->dev);
 
 	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
@@ -993,32 +992,17 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm = data;
 	struct mtk_dsi *dsi = dev_get_drvdata(dev);
 
-	ret = mtk_ddp_comp_register(drm, &dsi->ddp_comp);
-	if (ret < 0) {
-		dev_err(dev, "Failed to register component %pOF: %d\n",
-			dev->of_node, ret);
-		return ret;
-	}
-
 	ret = mtk_dsi_encoder_init(drm, dsi);
-	if (ret)
-		goto err_unregister;
-
-	return 0;
 
-err_unregister:
-	mtk_ddp_comp_unregister(drm, &dsi->ddp_comp);
 	return ret;
 }
 
 static void mtk_dsi_unbind(struct device *dev, struct device *master,
 			   void *data)
 {
-	struct drm_device *drm = data;
 	struct mtk_dsi *dsi = dev_get_drvdata(dev);
 
 	drm_encoder_cleanup(&dsi->encoder);
-	mtk_ddp_comp_unregister(drm, &dsi->ddp_comp);
 }
 
 static const struct component_ops mtk_dsi_component_ops = {
@@ -1033,7 +1017,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	struct drm_panel *panel;
 	struct resource *regs;
 	int irq_num;
-	int comp_id;
 	int ret;
 
 	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
@@ -1103,19 +1086,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 		goto err_unregister_host;
 	}
 
-	comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DSI);
-	if (comp_id < 0) {
-		dev_err(dev, "Failed to identify by alias: %d\n", comp_id);
-		ret = comp_id;
-		goto err_unregister_host;
-	}
-
-	ret = mtk_ddp_comp_init(dev->of_node, &dsi->ddp_comp, comp_id);
-	if (ret) {
-		dev_err(dev, "Failed to initialize component: %d\n", ret);
-		goto err_unregister_host;
-	}
-
 	irq_num = platform_get_irq(pdev, 0);
 	if (irq_num < 0) {
 		dev_err(&pdev->dev, "failed to get dsi irq_num: %d\n", irq_num);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
