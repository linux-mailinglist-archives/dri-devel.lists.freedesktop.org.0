Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FE32D6146
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 17:11:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78A16EAAC;
	Thu, 10 Dec 2020 16:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E346EAAC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 16:11:06 +0000 (UTC)
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 04/12] drm/mediatek: Move clk info from struct mtk_ddp_comp
 to sub driver private data
Date: Fri, 11 Dec 2020 00:10:42 +0800
Message-Id: <20201210161050.8460-5-chunkuang.hu@kernel.org>
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

From: CK Hu <ck.hu@mediatek.com>

Some ddp component exist in both display path and other path, so data
belonged to sub driver should be moved into sub driver private data so it
could be used for multiple path. clk info is one of sub driver data, so
move it.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_color.c   | 23 ++++++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 23 ++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 23 ++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  6 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 63 +++++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 18 +++++-
 6 files changed, 141 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 6ee4515dc272..7556976cd461 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -38,6 +38,7 @@ struct mtk_disp_color_data {
 struct mtk_disp_color {
 	struct mtk_ddp_comp			ddp_comp;
 	struct drm_crtc				*crtc;
+	struct clk				*clk;
 	const struct mtk_disp_color_data	*data;
 };
 
@@ -46,6 +47,20 @@ static inline struct mtk_disp_color *comp_to_color(struct mtk_ddp_comp *comp)
 	return container_of(comp, struct mtk_disp_color, ddp_comp);
 }
 
+static int mtk_color_clk_enable(struct device *dev)
+{
+	struct mtk_disp_color *color = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(color->clk);
+}
+
+static void mtk_color_clk_disable(struct device *dev)
+{
+	struct mtk_disp_color *color = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(color->clk);
+}
+
 static void mtk_color_config(struct mtk_ddp_comp *comp, unsigned int w,
 			     unsigned int h, unsigned int vrefresh,
 			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -66,6 +81,8 @@ static void mtk_color_start(struct mtk_ddp_comp *comp)
 }
 
 static const struct mtk_ddp_comp_funcs mtk_disp_color_funcs = {
+	.clk_enable = mtk_color_clk_enable,
+	.clk_disable = mtk_color_clk_disable,
 	.config = mtk_color_config,
 	.start = mtk_color_start,
 };
@@ -112,6 +129,12 @@ static int mtk_disp_color_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(dev, "failed to get color clk\n");
+		return PTR_ERR(priv->clk);
+	}
+
 	comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DISP_COLOR);
 	if (comp_id < 0) {
 		dev_err(dev, "Failed to identify by alias: %d\n", comp_id);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index f8e99d67132d..589c33937793 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -72,6 +72,7 @@ struct mtk_disp_ovl_data {
 struct mtk_disp_ovl {
 	struct mtk_ddp_comp		ddp_comp;
 	struct drm_crtc			*crtc;
+	struct clk			*clk;
 	const struct mtk_disp_ovl_data	*data;
 };
 
@@ -114,6 +115,20 @@ static void mtk_ovl_disable_vblank(struct mtk_ddp_comp *comp)
 	writel_relaxed(0x0, comp->regs + DISP_REG_OVL_INTEN);
 }
 
+static int mtk_ovl_clk_enable(struct device *dev)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(ovl->clk);
+}
+
+static void mtk_ovl_clk_disable(struct device *dev)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(ovl->clk);
+}
+
 static void mtk_ovl_start(struct mtk_ddp_comp *comp)
 {
 	writel_relaxed(0x1, comp->regs + DISP_REG_OVL_EN);
@@ -313,6 +328,8 @@ static void mtk_ovl_bgclr_in_off(struct mtk_ddp_comp *comp)
 }
 
 static const struct mtk_ddp_comp_funcs mtk_disp_ovl_funcs = {
+	.clk_enable = mtk_ovl_clk_enable,
+	.clk_disable = mtk_ovl_clk_disable,
 	.config = mtk_ovl_config,
 	.start = mtk_ovl_start,
 	.stop = mtk_ovl_stop,
@@ -373,6 +390,12 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(dev, "failed to get ovl clk\n");
+		return PTR_ERR(priv->clk);
+	}
+
 	priv->data = of_device_get_match_data(dev);
 
 	comp_id = mtk_ddp_comp_get_id(dev->of_node,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index a3c487ea8344..95feacda49b1 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -63,6 +63,7 @@ struct mtk_disp_rdma_data {
 struct mtk_disp_rdma {
 	struct mtk_ddp_comp		ddp_comp;
 	struct drm_crtc			*crtc;
+	struct clk			*clk;
 	const struct mtk_disp_rdma_data	*data;
 };
 
@@ -114,6 +115,20 @@ static void mtk_rdma_disable_vblank(struct mtk_ddp_comp *comp)
 	rdma_update_bits(comp, DISP_REG_RDMA_INT_ENABLE, RDMA_FRAME_END_INT, 0);
 }
 
+static int mtk_rdma_clk_enable(struct device *dev)
+{
+	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(rdma->clk);
+}
+
+static void mtk_rdma_clk_disable(struct device *dev)
+{
+	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(rdma->clk);
+}
+
 static void mtk_rdma_start(struct mtk_ddp_comp *comp)
 {
 	rdma_update_bits(comp, DISP_REG_RDMA_GLOBAL_CON, RDMA_ENGINE_EN,
@@ -229,6 +244,8 @@ static void mtk_rdma_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
 }
 
 static const struct mtk_ddp_comp_funcs mtk_disp_rdma_funcs = {
+	.clk_enable = mtk_rdma_clk_enable,
+	.clk_disable = mtk_rdma_clk_disable,
 	.config = mtk_rdma_config,
 	.start = mtk_rdma_start,
 	.stop = mtk_rdma_stop,
@@ -286,6 +303,12 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(dev, "failed to get rdma clk\n");
+		return PTR_ERR(priv->clk);
+	}
+
 	comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DISP_RDMA);
 	if (comp_id < 0) {
 		dev_err(dev, "Failed to identify by alias: %d\n", comp_id);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index ac038572164d..f1dd5943ba0c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -190,7 +190,7 @@ static int mtk_crtc_ddp_clk_enable(struct mtk_drm_crtc *mtk_crtc)
 	int i;
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
-		ret = clk_prepare_enable(mtk_crtc->ddp_comp[i]->clk);
+		ret = mtk_ddp_comp_clk_enable(mtk_crtc->ddp_comp[i]);
 		if (ret) {
 			DRM_ERROR("Failed to enable clock %d: %d\n", i, ret);
 			goto err;
@@ -200,7 +200,7 @@ static int mtk_crtc_ddp_clk_enable(struct mtk_drm_crtc *mtk_crtc)
 	return 0;
 err:
 	while (--i >= 0)
-		clk_disable_unprepare(mtk_crtc->ddp_comp[i]->clk);
+		mtk_ddp_comp_clk_disable(mtk_crtc->ddp_comp[i]);
 	return ret;
 }
 
@@ -209,7 +209,7 @@ static void mtk_crtc_ddp_clk_disable(struct mtk_drm_crtc *mtk_crtc)
 	int i;
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
-		clk_disable_unprepare(mtk_crtc->ddp_comp[i]->clk);
+		mtk_ddp_comp_clk_disable(mtk_crtc->ddp_comp[i]);
 }
 
 static
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index a11b4f8bf959..9ed0d38830df 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -86,6 +86,10 @@
 #define DITHER_ADD_LSHIFT_G(x)			(((x) & 0x7) << 4)
 #define DITHER_ADD_RSHIFT_G(x)			(((x) & 0x7) << 0)
 
+struct mtk_ddp_comp_dev {
+	struct clk *clk;
+};
+
 void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 		   struct mtk_ddp_comp *comp, unsigned int offset)
 {
@@ -132,6 +136,20 @@ void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt,
 #endif
 }
 
+static int mtk_ddp_clk_enable(struct device *dev)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(priv->clk);
+}
+
+static void mtk_ddp_clk_disable(struct device *dev)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(priv->clk);
+}
+
 void mtk_dither_set(struct mtk_ddp_comp *comp, unsigned int bpc,
 		    unsigned int CFG, struct cmdq_pkt *cmdq_pkt)
 {
@@ -322,6 +340,8 @@ static void mtk_gamma_set(struct mtk_ddp_comp *comp,
 }
 
 static const struct mtk_ddp_comp_funcs ddp_aal = {
+	.clk_enable = mtk_ddp_clk_enable,
+	.clk_disable = mtk_ddp_clk_disable,
 	.gamma_set = mtk_gamma_set,
 	.config = mtk_aal_config,
 	.start = mtk_aal_start,
@@ -329,6 +349,8 @@ static const struct mtk_ddp_comp_funcs ddp_aal = {
 };
 
 static const struct mtk_ddp_comp_funcs ddp_ccorr = {
+	.clk_enable = mtk_ddp_clk_enable,
+	.clk_disable = mtk_ddp_clk_disable,
 	.config = mtk_ccorr_config,
 	.start = mtk_ccorr_start,
 	.stop = mtk_ccorr_stop,
@@ -336,12 +358,16 @@ static const struct mtk_ddp_comp_funcs ddp_ccorr = {
 };
 
 static const struct mtk_ddp_comp_funcs ddp_dither = {
+	.clk_enable = mtk_ddp_clk_enable,
+	.clk_disable = mtk_ddp_clk_disable,
 	.config = mtk_dither_config,
 	.start = mtk_dither_start,
 	.stop = mtk_dither_stop,
 };
 
 static const struct mtk_ddp_comp_funcs ddp_gamma = {
+	.clk_enable = mtk_ddp_clk_enable,
+	.clk_disable = mtk_ddp_clk_disable,
 	.gamma_set = mtk_gamma_set,
 	.config = mtk_gamma_config,
 	.start = mtk_gamma_start,
@@ -349,11 +375,15 @@ static const struct mtk_ddp_comp_funcs ddp_gamma = {
 };
 
 static const struct mtk_ddp_comp_funcs ddp_od = {
+	.clk_enable = mtk_ddp_clk_enable,
+	.clk_disable = mtk_ddp_clk_disable,
 	.config = mtk_od_config,
 	.start = mtk_od_start,
 };
 
 static const struct mtk_ddp_comp_funcs ddp_ufoe = {
+	.clk_enable = mtk_ddp_clk_enable,
+	.clk_disable = mtk_ddp_clk_disable,
 	.start = mtk_ufoe_start,
 };
 
@@ -493,8 +523,8 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 		      enum mtk_ddp_comp_id comp_id, const struct mtk_ddp_comp_funcs *funcs)
 {
 	struct platform_device *comp_pdev;
-	struct device *dev;
 	enum mtk_ddp_comp_type type;
+	struct mtk_ddp_comp_dev *priv;
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	struct resource res;
 	struct cmdq_client_reg cmdq_reg;
@@ -518,34 +548,29 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	    comp_id == DDP_COMPONENT_DSI3 ||
 	    comp_id == DDP_COMPONENT_PWM0) {
 		comp->regs = NULL;
-		comp->clk = NULL;
 		comp->irq = 0;
 		return 0;
 	}
 
 	comp->regs = of_iomap(node, 0);
 	comp->irq = of_irq_get(node, 0);
-	comp->clk = of_clk_get(node, 0);
-	if (IS_ERR(comp->clk))
-		return PTR_ERR(comp->clk);
-
 	comp_pdev = of_find_device_by_node(node);
 	if (!comp_pdev) {
 		DRM_INFO("Waiting for device %s\n", node->full_name);
 		return -EPROBE_DEFER;
 	}
-	dev = &comp_pdev->dev;
+	comp->dev = &comp_pdev->dev;
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (of_address_to_resource(node, 0, &res) != 0) {
-		dev_err(dev, "Missing reg in %s node\n", node->full_name);
+		dev_err(comp->dev, "Missing reg in %s node\n", node->full_name);
 		return -EINVAL;
 	}
 	comp->regs_pa = res.start;
 
-	ret = cmdq_dev_get_client_reg(dev, &cmdq_reg, 0);
+	ret = cmdq_dev_get_client_reg(comp->dev, &cmdq_reg, 0);
 	if (ret)
-		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
+		dev_dbg(comp->dev, "get mediatek,gce-client-reg fail!\n");
 	else
 		comp->subsys = cmdq_reg.subsys;
 #endif
@@ -555,11 +580,27 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	    type == MTK_DISP_OVL_2L ||
 	    type == MTK_DISP_RDMA ||
 	    type == MTK_DISP_WDMA) {
-		ret = mtk_ddp_get_larb_dev(node, comp, dev);
+		ret = mtk_ddp_get_larb_dev(node, comp, comp->dev);
 		if (ret)
 			return ret;
 	}
 
+	if (type == MTK_DISP_COLOR ||
+	    type == MTK_DISP_OVL ||
+	    type == MTK_DISP_OVL_2L ||
+	    type == MTK_DISP_RDMA)
+		return 0;
+
+	priv = devm_kzalloc(comp->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->clk = of_clk_get(node, 0);
+	if (IS_ERR(priv->clk))
+		return PTR_ERR(priv->clk);
+
+	platform_set_drvdata(comp_pdev, priv);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 3bd6012d0746..65fd613d2c70 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -71,6 +71,8 @@ enum mtk_ddp_comp_id {
 struct mtk_ddp_comp;
 struct cmdq_pkt;
 struct mtk_ddp_comp_funcs {
+	int (*clk_enable)(struct device *dev);
+	void (*clk_disable)(struct device *dev);
 	void (*config)(struct mtk_ddp_comp *comp, unsigned int w,
 		       unsigned int h, unsigned int vrefresh,
 		       unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
@@ -95,7 +97,7 @@ struct mtk_ddp_comp_funcs {
 };
 
 struct mtk_ddp_comp {
-	struct clk *clk;
+	struct device *dev;
 	void __iomem *regs;
 	int irq;
 	struct device *larb_dev;
@@ -105,6 +107,20 @@ struct mtk_ddp_comp {
 	u8 subsys;
 };
 
+static inline int mtk_ddp_comp_clk_enable(struct mtk_ddp_comp *comp)
+{
+	if (comp->funcs && comp->funcs->clk_enable)
+		return comp->funcs->clk_enable(comp->dev);
+
+	return 0;
+}
+
+static inline void mtk_ddp_comp_clk_disable(struct mtk_ddp_comp *comp)
+{
+	if (comp->funcs && comp->funcs->clk_disable)
+		comp->funcs->clk_disable(comp->dev);
+}
+
 static inline void mtk_ddp_comp_config(struct mtk_ddp_comp *comp,
 				       unsigned int w, unsigned int h,
 				       unsigned int vrefresh, unsigned int bpc,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
