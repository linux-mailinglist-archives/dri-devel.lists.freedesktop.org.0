Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D522A37D9
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 01:34:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079D26E5C8;
	Tue,  3 Nov 2020 00:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146CA6E5CA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 00:34:50 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 55245223AC;
 Tue,  3 Nov 2020 00:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604363689;
 bh=AUumJHqVnkK/TxQ1mM/CO6qmQxX2luV4xUgpfiIJ78I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QGygOIOnzc7VXT0gfCVvxsI6gbEzg1gXkma+EsYXnPeBbKTG7+WbaXpQeZTP/w37r
 Bdzo58DynQj0eONay1gx0brX/lf9ERtTYMKM+0kgmrgm8n88+jKogbmZz4uTVtpEfn
 CW8Yo4cyAGk0YFpkWwCIcC+OzfhmB2k4Bg+YkM5Q=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 04/11] drm/mediatek: Move regs info from struct mtk_ddp_comp
 to sub driver private data
Date: Tue,  3 Nov 2020 08:34:15 +0800
Message-Id: <20201103003422.17838-5-chunkuang.hu@kernel.org>
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

Some ddp component exist in both display path and other path, so data
belonged to sub driver should be moved into sub driver private data so it
could be used for multiple path. regs info is one of sub driver data, so
move it.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_color.c   |  17 ++-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  67 +++++++----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |  42 ++++---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 121 +++++++++++++-------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  11 +-
 5 files changed, 165 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 52af5e0ee7e3..8b61573a5f72 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -37,6 +37,7 @@ struct mtk_disp_color {
 	struct mtk_ddp_comp			ddp_comp;
 	struct drm_crtc				*crtc;
 	struct clk				*clk;
+	void __iomem				*regs;
 	const struct mtk_disp_color_data	*data;
 };
 
@@ -65,8 +66,8 @@ static void mtk_color_config(struct mtk_ddp_comp *comp, unsigned int w,
 {
 	struct mtk_disp_color *color = comp_to_color(comp);
 
-	mtk_ddp_write(cmdq_pkt, w, comp, DISP_COLOR_WIDTH(color));
-	mtk_ddp_write(cmdq_pkt, h, comp, DISP_COLOR_HEIGHT(color));
+	mtk_ddp_write(cmdq_pkt, w, comp, color->regs, DISP_COLOR_WIDTH(color));
+	mtk_ddp_write(cmdq_pkt, h, comp, color->regs, DISP_COLOR_HEIGHT(color));
 }
 
 static void mtk_color_start(struct mtk_ddp_comp *comp)
@@ -74,8 +75,8 @@ static void mtk_color_start(struct mtk_ddp_comp *comp)
 	struct mtk_disp_color *color = comp_to_color(comp);
 
 	writel(COLOR_BYPASS_ALL | COLOR_SEQ_SEL,
-	       comp->regs + DISP_COLOR_CFG_MAIN);
-	writel(0x1, comp->regs + DISP_COLOR_START(color));
+	       color->regs + DISP_COLOR_CFG_MAIN);
+	writel(0x1, color->regs + DISP_COLOR_START(color));
 }
 
 static const struct mtk_ddp_comp_funcs mtk_disp_color_funcs = {
@@ -120,6 +121,7 @@ static int mtk_disp_color_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_disp_color *priv;
+	struct resource *res;
 	int comp_id;
 	int ret;
 
@@ -133,6 +135,13 @@ static int mtk_disp_color_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 	}
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->regs)) {
+		dev_err(dev, "failed to ioremap color\n");
+		return PTR_ERR(priv->regs);
+	}
+
 	comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DISP_COLOR);
 	if (comp_id < 0) {
 		dev_err(dev, "Failed to identify by alias: %d\n", comp_id);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 8104824c5db6..63164679f04d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -72,6 +72,7 @@ struct mtk_disp_ovl {
 	struct mtk_ddp_comp		ddp_comp;
 	struct drm_crtc			*crtc;
 	struct clk			*clk;
+	void __iomem			*regs;
 	const struct mtk_disp_ovl_data	*data;
 };
 
@@ -86,7 +87,7 @@ static irqreturn_t mtk_disp_ovl_irq_handler(int irq, void *dev_id)
 	struct mtk_ddp_comp *ovl = &priv->ddp_comp;
 
 	/* Clear frame completion interrupt */
-	writel(0x0, ovl->regs + DISP_REG_OVL_INTSTA);
+	writel(0x0, priv->regs + DISP_REG_OVL_INTSTA);
 
 	if (!priv->crtc)
 		return IRQ_NONE;
@@ -102,8 +103,8 @@ static void mtk_ovl_enable_vblank(struct mtk_ddp_comp *comp,
 	struct mtk_disp_ovl *ovl = comp_to_ovl(comp);
 
 	ovl->crtc = crtc;
-	writel(0x0, comp->regs + DISP_REG_OVL_INTSTA);
-	writel_relaxed(OVL_FME_CPL_INT, comp->regs + DISP_REG_OVL_INTEN);
+	writel(0x0, ovl->regs + DISP_REG_OVL_INTSTA);
+	writel_relaxed(OVL_FME_CPL_INT, ovl->regs + DISP_REG_OVL_INTEN);
 }
 
 static void mtk_ovl_disable_vblank(struct mtk_ddp_comp *comp)
@@ -111,7 +112,7 @@ static void mtk_ovl_disable_vblank(struct mtk_ddp_comp *comp)
 	struct mtk_disp_ovl *ovl = comp_to_ovl(comp);
 
 	ovl->crtc = NULL;
-	writel_relaxed(0x0, comp->regs + DISP_REG_OVL_INTEN);
+	writel_relaxed(0x0, ovl->regs + DISP_REG_OVL_INTEN);
 }
 
 static int mtk_ovl_clk_enable(struct device *dev)
@@ -130,25 +131,31 @@ static void mtk_ovl_clk_disable(struct device *dev)
 
 static void mtk_ovl_start(struct mtk_ddp_comp *comp)
 {
-	writel_relaxed(0x1, comp->regs + DISP_REG_OVL_EN);
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(comp->dev);
+
+	writel_relaxed(0x1, ovl->regs + DISP_REG_OVL_EN);
 }
 
 static void mtk_ovl_stop(struct mtk_ddp_comp *comp)
 {
-	writel_relaxed(0x0, comp->regs + DISP_REG_OVL_EN);
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(comp->dev);
+
+	writel_relaxed(0x0, ovl->regs + DISP_REG_OVL_EN);
 }
 
 static void mtk_ovl_config(struct mtk_ddp_comp *comp, unsigned int w,
 			   unsigned int h, unsigned int vrefresh,
 			   unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(comp->dev);
+
 	if (w != 0 && h != 0)
-		mtk_ddp_write_relaxed(cmdq_pkt, h << 16 | w, comp,
+		mtk_ddp_write_relaxed(cmdq_pkt, h << 16 | w, comp, ovl->regs,
 				      DISP_REG_OVL_ROI_SIZE);
-	mtk_ddp_write_relaxed(cmdq_pkt, 0x0, comp, DISP_REG_OVL_ROI_BGCLR);
+	mtk_ddp_write_relaxed(cmdq_pkt, 0x0, comp, ovl->regs, DISP_REG_OVL_ROI_BGCLR);
 
-	mtk_ddp_write(cmdq_pkt, 0x1, comp, DISP_REG_OVL_RST);
-	mtk_ddp_write(cmdq_pkt, 0x0, comp, DISP_REG_OVL_RST);
+	mtk_ddp_write(cmdq_pkt, 0x1, comp, ovl->regs, DISP_REG_OVL_RST);
+	mtk_ddp_write(cmdq_pkt, 0x0, comp, ovl->regs, DISP_REG_OVL_RST);
 }
 
 static unsigned int mtk_ovl_layer_nr(struct mtk_ddp_comp *comp)
@@ -200,7 +207,7 @@ static void mtk_ovl_layer_on(struct mtk_ddp_comp *comp, unsigned int idx,
 	unsigned int gmc_value;
 	struct mtk_disp_ovl *ovl = comp_to_ovl(comp);
 
-	mtk_ddp_write(cmdq_pkt, 0x1, comp,
+	mtk_ddp_write(cmdq_pkt, 0x1, comp, ovl->regs,
 		      DISP_REG_OVL_RDMA_CTRL(idx));
 	gmc_thrshd_l = GMC_THRESHOLD_LOW >>
 		      (GMC_THRESHOLD_BITS - ovl->data->gmc_bits);
@@ -212,17 +219,19 @@ static void mtk_ovl_layer_on(struct mtk_ddp_comp *comp, unsigned int idx,
 		gmc_value = gmc_thrshd_l | gmc_thrshd_l << 8 |
 			    gmc_thrshd_h << 16 | gmc_thrshd_h << 24;
 	mtk_ddp_write(cmdq_pkt, gmc_value,
-		      comp, DISP_REG_OVL_RDMA_GMC(idx));
-	mtk_ddp_write_mask(cmdq_pkt, BIT(idx), comp,
+		      comp, ovl->regs, DISP_REG_OVL_RDMA_GMC(idx));
+	mtk_ddp_write_mask(cmdq_pkt, BIT(idx), comp, ovl->regs,
 			   DISP_REG_OVL_SRC_CON, BIT(idx));
 }
 
 static void mtk_ovl_layer_off(struct mtk_ddp_comp *comp, unsigned int idx,
 			      struct cmdq_pkt *cmdq_pkt)
 {
-	mtk_ddp_write_mask(cmdq_pkt, 0, comp,
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(comp->dev);
+
+	mtk_ddp_write_mask(cmdq_pkt, 0, comp, ovl->regs,
 			   DISP_REG_OVL_SRC_CON, BIT(idx));
-	mtk_ddp_write(cmdq_pkt, 0, comp,
+	mtk_ddp_write(cmdq_pkt, 0, comp, ovl->regs,
 		      DISP_REG_OVL_RDMA_CTRL(idx));
 }
 
@@ -294,15 +303,15 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
 		addr += pending->pitch - 1;
 	}
 
-	mtk_ddp_write_relaxed(cmdq_pkt, con, comp,
+	mtk_ddp_write_relaxed(cmdq_pkt, con, comp, ovl->regs,
 			      DISP_REG_OVL_CON(idx));
-	mtk_ddp_write_relaxed(cmdq_pkt, pitch, comp,
+	mtk_ddp_write_relaxed(cmdq_pkt, pitch, comp, ovl->regs,
 			      DISP_REG_OVL_PITCH(idx));
-	mtk_ddp_write_relaxed(cmdq_pkt, src_size, comp,
+	mtk_ddp_write_relaxed(cmdq_pkt, src_size, comp, ovl->regs,
 			      DISP_REG_OVL_SRC_SIZE(idx));
-	mtk_ddp_write_relaxed(cmdq_pkt, offset, comp,
+	mtk_ddp_write_relaxed(cmdq_pkt, offset, comp, ovl->regs,
 			      DISP_REG_OVL_OFFSET(idx));
-	mtk_ddp_write_relaxed(cmdq_pkt, addr, comp,
+	mtk_ddp_write_relaxed(cmdq_pkt, addr, comp, ovl->regs,
 			      DISP_REG_OVL_ADDR(ovl, idx));
 
 	mtk_ovl_layer_on(comp, idx, cmdq_pkt);
@@ -310,20 +319,22 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
 
 static void mtk_ovl_bgclr_in_on(struct mtk_ddp_comp *comp)
 {
+	struct mtk_disp_ovl *ovl = comp_to_ovl(comp);
 	unsigned int reg;
 
-	reg = readl(comp->regs + DISP_REG_OVL_DATAPATH_CON);
+	reg = readl(ovl->regs + DISP_REG_OVL_DATAPATH_CON);
 	reg = reg | OVL_BGCLR_SEL_IN;
-	writel(reg, comp->regs + DISP_REG_OVL_DATAPATH_CON);
+	writel(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON);
 }
 
 static void mtk_ovl_bgclr_in_off(struct mtk_ddp_comp *comp)
 {
+	struct mtk_disp_ovl *ovl = comp_to_ovl(comp);
 	unsigned int reg;
 
-	reg = readl(comp->regs + DISP_REG_OVL_DATAPATH_CON);
+	reg = readl(ovl->regs + DISP_REG_OVL_DATAPATH_CON);
 	reg = reg & ~OVL_BGCLR_SEL_IN;
-	writel(reg, comp->regs + DISP_REG_OVL_DATAPATH_CON);
+	writel(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON);
 }
 
 static const struct mtk_ddp_comp_funcs mtk_disp_ovl_funcs = {
@@ -377,6 +388,7 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_disp_ovl *priv;
+	struct resource *res;
 	int comp_id;
 	int irq;
 	int ret;
@@ -395,6 +407,13 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 	}
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->regs)) {
+		dev_err(dev, "failed to ioremap ovl\n");
+		return PTR_ERR(priv->regs);
+	}
+
 	priv->data = of_device_get_match_data(dev);
 
 	comp_id = mtk_ddp_comp_get_id(dev->of_node,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 86c3f96f3ed8..2a0836a14f12 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -63,6 +63,7 @@ struct mtk_disp_rdma {
 	struct mtk_ddp_comp		ddp_comp;
 	struct drm_crtc			*crtc;
 	struct clk			*clk;
+	void __iomem			*regs;
 	const struct mtk_disp_rdma_data	*data;
 };
 
@@ -77,7 +78,7 @@ static irqreturn_t mtk_disp_rdma_irq_handler(int irq, void *dev_id)
 	struct mtk_ddp_comp *rdma = &priv->ddp_comp;
 
 	/* Clear frame completion interrupt */
-	writel(0x0, rdma->regs + DISP_REG_RDMA_INT_STATUS);
+	writel(0x0, priv->regs + DISP_REG_RDMA_INT_STATUS);
 
 	if (!priv->crtc)
 		return IRQ_NONE;
@@ -90,10 +91,11 @@ static irqreturn_t mtk_disp_rdma_irq_handler(int irq, void *dev_id)
 static void rdma_update_bits(struct mtk_ddp_comp *comp, unsigned int reg,
 			     unsigned int mask, unsigned int val)
 {
-	unsigned int tmp = readl(comp->regs + reg);
+	struct mtk_disp_rdma *rdma = dev_get_drvdata(comp->dev);
+	unsigned int tmp = readl(rdma->regs + reg);
 
 	tmp = (tmp & ~mask) | (val & mask);
-	writel(tmp, comp->regs + reg);
+	writel(tmp, rdma->regs + reg);
 }
 
 static void mtk_rdma_enable_vblank(struct mtk_ddp_comp *comp,
@@ -147,9 +149,9 @@ static void mtk_rdma_config(struct mtk_ddp_comp *comp, unsigned int width,
 	unsigned int reg;
 	struct mtk_disp_rdma *rdma = comp_to_rdma(comp);
 
-	mtk_ddp_write_mask(cmdq_pkt, width, comp,
+	mtk_ddp_write_mask(cmdq_pkt, width, comp, rdma->regs,
 			   DISP_REG_RDMA_SIZE_CON_0, 0xfff);
-	mtk_ddp_write_mask(cmdq_pkt, height, comp,
+	mtk_ddp_write_mask(cmdq_pkt, height, comp, rdma->regs,
 			   DISP_REG_RDMA_SIZE_CON_1, 0xfffff);
 
 	/*
@@ -162,7 +164,7 @@ static void mtk_rdma_config(struct mtk_ddp_comp *comp, unsigned int width,
 	reg = RDMA_FIFO_UNDERFLOW_EN |
 	      RDMA_FIFO_PSEUDO_SIZE(RDMA_FIFO_SIZE(rdma)) |
 	      RDMA_OUTPUT_VALID_FIFO_THRESHOLD(threshold);
-	mtk_ddp_write(cmdq_pkt, reg, comp, DISP_REG_RDMA_FIFO_CON);
+	mtk_ddp_write(cmdq_pkt, reg, comp, rdma->regs, DISP_REG_RDMA_FIFO_CON);
 }
 
 static unsigned int rdma_fmt_convert(struct mtk_disp_rdma *rdma,
@@ -219,25 +221,25 @@ static void mtk_rdma_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
 	unsigned int con;
 
 	con = rdma_fmt_convert(rdma, fmt);
-	mtk_ddp_write_relaxed(cmdq_pkt, con, comp, DISP_RDMA_MEM_CON);
+	mtk_ddp_write_relaxed(cmdq_pkt, con, comp, rdma->regs, DISP_RDMA_MEM_CON);
 
 	if (fmt == DRM_FORMAT_UYVY || fmt == DRM_FORMAT_YUYV) {
-		mtk_ddp_write_mask(cmdq_pkt, RDMA_MATRIX_ENABLE, comp,
+		mtk_ddp_write_mask(cmdq_pkt, RDMA_MATRIX_ENABLE, comp, rdma->regs,
 				   DISP_REG_RDMA_SIZE_CON_0,
 				   RDMA_MATRIX_ENABLE);
 		mtk_ddp_write_mask(cmdq_pkt, RDMA_MATRIX_INT_MTX_BT601_to_RGB,
-				   comp, DISP_REG_RDMA_SIZE_CON_0,
+				   comp, rdma->regs, DISP_REG_RDMA_SIZE_CON_0,
 				   RDMA_MATRIX_INT_MTX_SEL);
 	} else {
-		mtk_ddp_write_mask(cmdq_pkt, 0, comp,
+		mtk_ddp_write_mask(cmdq_pkt, 0, comp, rdma->regs,
 				   DISP_REG_RDMA_SIZE_CON_0,
 				   RDMA_MATRIX_ENABLE);
 	}
-	mtk_ddp_write_relaxed(cmdq_pkt, addr, comp, DISP_RDMA_MEM_START_ADDR);
-	mtk_ddp_write_relaxed(cmdq_pkt, pitch, comp, DISP_RDMA_MEM_SRC_PITCH);
-	mtk_ddp_write(cmdq_pkt, RDMA_MEM_GMC, comp,
+	mtk_ddp_write_relaxed(cmdq_pkt, addr, comp, rdma->regs, DISP_RDMA_MEM_START_ADDR);
+	mtk_ddp_write_relaxed(cmdq_pkt, pitch, comp, rdma->regs, DISP_RDMA_MEM_SRC_PITCH);
+	mtk_ddp_write(cmdq_pkt, RDMA_MEM_GMC, comp, rdma->regs,
 		      DISP_RDMA_MEM_GMC_SETTING_0);
-	mtk_ddp_write_mask(cmdq_pkt, RDMA_MODE_MEMORY, comp,
+	mtk_ddp_write_mask(cmdq_pkt, RDMA_MODE_MEMORY, comp, rdma->regs,
 			   DISP_REG_RDMA_GLOBAL_CON, RDMA_MODE_MEMORY);
 
 }
@@ -290,6 +292,7 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_disp_rdma *priv;
+	struct resource *res;
 	int comp_id;
 	int irq;
 	int ret;
@@ -308,6 +311,13 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 	}
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->regs)) {
+		dev_err(dev, "failed to ioremap rdma\n");
+		return PTR_ERR(priv->regs);
+	}
+
 	comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DISP_RDMA);
 	if (comp_id < 0) {
 		dev_err(dev, "Failed to identify by alias: %d\n", comp_id);
@@ -325,8 +335,8 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 	}
 
 	/* Disable and clear pending interrupts */
-	writel(0x0, priv->ddp_comp.regs + DISP_REG_RDMA_INT_ENABLE);
-	writel(0x0, priv->ddp_comp.regs + DISP_REG_RDMA_INT_STATUS);
+	writel(0x0, priv->regs + DISP_REG_RDMA_INT_ENABLE);
+	writel(0x0, priv->regs + DISP_REG_RDMA_INT_STATUS);
 
 	ret = devm_request_irq(dev, irq, mtk_disp_rdma_irq_handler,
 			       IRQF_TRIGGER_NONE, dev_name(dev), priv);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 06d79b82d9a1..2a3ba50d5397 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -88,10 +88,12 @@
 
 struct mtk_ddp_comp_dev {
 	struct clk *clk;
+	void __iomem *regs;
 };
 
 void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
-		   struct mtk_ddp_comp *comp, unsigned int offset)
+		   struct mtk_ddp_comp *comp, void __iomem *regs,
+		   unsigned int offset)
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (cmdq_pkt)
@@ -99,11 +101,11 @@ void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 			       comp->regs_pa + offset, value);
 	else
 #endif
-		writel(value, comp->regs + offset);
+		writel(value, regs + offset);
 }
 
 void mtk_ddp_write_relaxed(struct cmdq_pkt *cmdq_pkt, unsigned int value,
-			   struct mtk_ddp_comp *comp,
+			   struct mtk_ddp_comp *comp, void __iomem *regs,
 			   unsigned int offset)
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
@@ -112,14 +114,12 @@ void mtk_ddp_write_relaxed(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 			       comp->regs_pa + offset, value);
 	else
 #endif
-		writel_relaxed(value, comp->regs + offset);
+		writel_relaxed(value, regs + offset);
 }
 
-void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt,
-			unsigned int value,
-			struct mtk_ddp_comp *comp,
-			unsigned int offset,
-			unsigned int mask)
+void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
+			struct mtk_ddp_comp *comp, void __iomem *regs,
+			unsigned int offset, unsigned int mask)
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (cmdq_pkt) {
@@ -127,10 +127,10 @@ void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt,
 				    comp->regs_pa + offset, value, mask);
 	} else {
 #endif
-		u32 tmp = readl(comp->regs + offset);
+		u32 tmp = readl(regs + offset);
 
 		tmp = (tmp & ~mask) | (value & mask);
-		writel(tmp, comp->regs + offset);
+		writel(tmp, regs + offset);
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	}
 #endif
@@ -153,25 +153,27 @@ static void mtk_ddp_clk_disable(struct device *dev)
 void mtk_dither_set(struct mtk_ddp_comp *comp, unsigned int bpc,
 		    unsigned int CFG, struct cmdq_pkt *cmdq_pkt)
 {
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+
 	/* If bpc equal to 0, the dithering function didn't be enabled */
 	if (bpc == 0)
 		return;
 
 	if (bpc >= MTK_MIN_BPC) {
-		mtk_ddp_write(cmdq_pkt, 0, comp, DISP_DITHER_5);
-		mtk_ddp_write(cmdq_pkt, 0, comp, DISP_DITHER_7);
+		mtk_ddp_write(cmdq_pkt, 0, comp, priv->regs, DISP_DITHER_5);
+		mtk_ddp_write(cmdq_pkt, 0, comp, priv->regs, DISP_DITHER_7);
 		mtk_ddp_write(cmdq_pkt,
 			      DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
 			      DITHER_ADD_LSHIFT_R(MTK_MAX_BPC - bpc) |
 			      DITHER_NEW_BIT_MODE,
-			      comp, DISP_DITHER_15);
+			      comp, priv->regs, DISP_DITHER_15);
 		mtk_ddp_write(cmdq_pkt,
 			      DITHER_LSB_ERR_SHIFT_B(MTK_MAX_BPC - bpc) |
 			      DITHER_ADD_LSHIFT_B(MTK_MAX_BPC - bpc) |
 			      DITHER_LSB_ERR_SHIFT_G(MTK_MAX_BPC - bpc) |
 			      DITHER_ADD_LSHIFT_G(MTK_MAX_BPC - bpc),
-			      comp, DISP_DITHER_16);
-		mtk_ddp_write(cmdq_pkt, DISP_DITHERING, comp, CFG);
+			      comp, priv->regs, DISP_DITHER_16);
+		mtk_ddp_write(cmdq_pkt, DISP_DITHERING, comp, priv->regs, CFG);
 	}
 }
 
@@ -179,54 +181,72 @@ static void mtk_od_config(struct mtk_ddp_comp *comp, unsigned int w,
 			  unsigned int h, unsigned int vrefresh,
 			  unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
-	mtk_ddp_write(cmdq_pkt, w << 16 | h, comp, DISP_OD_SIZE);
-	mtk_ddp_write(cmdq_pkt, OD_RELAYMODE, comp, DISP_OD_CFG);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, comp, priv->regs, DISP_OD_SIZE);
+	mtk_ddp_write(cmdq_pkt, OD_RELAYMODE, comp, priv->regs, DISP_OD_CFG);
 	mtk_dither_set(comp, bpc, DISP_OD_CFG, cmdq_pkt);
 }
 
 static void mtk_od_start(struct mtk_ddp_comp *comp)
 {
-	writel(1, comp->regs + DISP_OD_EN);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+
+	writel(1, priv->regs + DISP_OD_EN);
 }
 
 static void mtk_ufoe_start(struct mtk_ddp_comp *comp)
 {
-	writel(UFO_BYPASS, comp->regs + DISP_REG_UFO_START);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+
+	writel(UFO_BYPASS, priv->regs + DISP_REG_UFO_START);
 }
 
 static void mtk_aal_config(struct mtk_ddp_comp *comp, unsigned int w,
 			   unsigned int h, unsigned int vrefresh,
 			   unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, comp, DISP_AAL_SIZE);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, comp, priv->regs, DISP_AAL_SIZE);
 }
 
 static void mtk_aal_start(struct mtk_ddp_comp *comp)
 {
-	writel(AAL_EN, comp->regs + DISP_AAL_EN);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+
+	writel(AAL_EN, priv->regs + DISP_AAL_EN);
 }
 
 static void mtk_aal_stop(struct mtk_ddp_comp *comp)
 {
-	writel_relaxed(0x0, comp->regs + DISP_AAL_EN);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+
+	writel_relaxed(0x0, priv->regs + DISP_AAL_EN);
 }
 
 static void mtk_ccorr_config(struct mtk_ddp_comp *comp, unsigned int w,
 			     unsigned int h, unsigned int vrefresh,
 			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, comp, DISP_CCORR_SIZE);
-	mtk_ddp_write(cmdq_pkt, CCORR_ENGINE_EN, comp, DISP_CCORR_CFG);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, comp, priv->regs, DISP_CCORR_SIZE);
+	mtk_ddp_write(cmdq_pkt, CCORR_ENGINE_EN, comp, priv->regs, DISP_CCORR_CFG);
 }
 
 static void mtk_ccorr_start(struct mtk_ddp_comp *comp)
 {
-	writel(CCORR_EN, comp->regs + DISP_CCORR_EN);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+
+	writel(CCORR_EN, priv->regs + DISP_CCORR_EN);
 }
 
 static void mtk_ccorr_stop(struct mtk_ddp_comp *comp)
 {
-	writel_relaxed(0x0, comp->regs + DISP_CCORR_EN);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+
+	writel_relaxed(0x0, priv->regs + DISP_CCORR_EN);
 }
 
 /* Converts a DRM S31.32 value to the HW S1.10 format. */
@@ -252,6 +272,7 @@ static u16 mtk_ctm_s31_32_to_s1_10(u64 in)
 static void mtk_ccorr_ctm_set(struct mtk_ddp_comp *comp,
 			      struct drm_crtc_state *state)
 {
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
 	struct drm_property_blob *blob = state->ctm;
 	struct drm_color_ctm *ctm;
 	const u64 *input;
@@ -269,66 +290,79 @@ static void mtk_ccorr_ctm_set(struct mtk_ddp_comp *comp,
 		coeffs[i] = mtk_ctm_s31_32_to_s1_10(input[i]);
 
 	mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
-		      comp, DISP_CCORR_COEF_0);
+		      comp, priv->regs, DISP_CCORR_COEF_0);
 	mtk_ddp_write(cmdq_pkt, coeffs[2] << 16 | coeffs[3],
-		      comp, DISP_CCORR_COEF_1);
+		      comp, priv->regs, DISP_CCORR_COEF_1);
 	mtk_ddp_write(cmdq_pkt, coeffs[4] << 16 | coeffs[5],
-		      comp, DISP_CCORR_COEF_2);
+		      comp, priv->regs, DISP_CCORR_COEF_2);
 	mtk_ddp_write(cmdq_pkt, coeffs[6] << 16 | coeffs[7],
-		      comp, DISP_CCORR_COEF_3);
+		      comp, priv->regs, DISP_CCORR_COEF_3);
 	mtk_ddp_write(cmdq_pkt, coeffs[8] << 16,
-		      comp, DISP_CCORR_COEF_4);
+		      comp, priv->regs, DISP_CCORR_COEF_4);
 }
 
 static void mtk_dither_config(struct mtk_ddp_comp *comp, unsigned int w,
 			      unsigned int h, unsigned int vrefresh,
 			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, comp, DISP_DITHER_SIZE);
-	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, comp, DISP_DITHER_CFG);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, comp, priv->regs, DISP_DITHER_SIZE);
+	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, comp, priv->regs, DISP_DITHER_CFG);
 }
 
 static void mtk_dither_start(struct mtk_ddp_comp *comp)
 {
-	writel(DITHER_EN, comp->regs + DISP_DITHER_EN);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+
+	writel(DITHER_EN, priv->regs + DISP_DITHER_EN);
 }
 
 static void mtk_dither_stop(struct mtk_ddp_comp *comp)
 {
-	writel_relaxed(0x0, comp->regs + DISP_DITHER_EN);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+
+	writel_relaxed(0x0, priv->regs + DISP_DITHER_EN);
 }
 
 static void mtk_gamma_config(struct mtk_ddp_comp *comp, unsigned int w,
 			     unsigned int h, unsigned int vrefresh,
 			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, comp, DISP_GAMMA_SIZE);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, comp, priv->regs, DISP_GAMMA_SIZE);
 	mtk_dither_set(comp, bpc, DISP_GAMMA_CFG, cmdq_pkt);
 }
 
 static void mtk_gamma_start(struct mtk_ddp_comp *comp)
 {
-	writel(GAMMA_EN, comp->regs  + DISP_GAMMA_EN);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+
+	writel(GAMMA_EN, priv->regs  + DISP_GAMMA_EN);
 }
 
 static void mtk_gamma_stop(struct mtk_ddp_comp *comp)
 {
-	writel_relaxed(0x0, comp->regs  + DISP_GAMMA_EN);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+
+	writel_relaxed(0x0, priv->regs  + DISP_GAMMA_EN);
 }
 
 static void mtk_gamma_set(struct mtk_ddp_comp *comp,
 			  struct drm_crtc_state *state)
 {
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
 	unsigned int i, reg;
 	struct drm_color_lut *lut;
 	void __iomem *lut_base;
 	u32 word;
 
 	if (state->gamma_lut) {
-		reg = readl(comp->regs + DISP_GAMMA_CFG);
+		reg = readl(priv->regs + DISP_GAMMA_CFG);
 		reg = reg | GAMMA_LUT_EN;
-		writel(reg, comp->regs + DISP_GAMMA_CFG);
-		lut_base = comp->regs + DISP_GAMMA_LUT;
+		writel(reg, priv->regs + DISP_GAMMA_CFG);
+		lut_base = priv->regs + DISP_GAMMA_LUT;
 		lut = (struct drm_color_lut *)state->gamma_lut->data;
 		for (i = 0; i < MTK_LUT_SIZE; i++) {
 			word = (((lut[i].red >> 6) & LUT_10BIT_MASK) << 20) +
@@ -525,12 +559,10 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	    comp_id == DDP_COMPONENT_DSI2 ||
 	    comp_id == DDP_COMPONENT_DSI3 ||
 	    comp_id == DDP_COMPONENT_PWM0) {
-		comp->regs = NULL;
 		comp->irq = 0;
 		return 0;
 	}
 
-	comp->regs = of_iomap(node, 0);
 	comp->irq = of_irq_get(node, 0);
 	comp_pdev = of_find_device_by_node(node);
 	if (!comp_pdev) {
@@ -568,6 +600,7 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	if (!priv)
 		return -ENOMEM;
 
+	priv->regs = of_iomap(node, 0);
 	priv->clk = of_clk_get(node, 0);
 	if (IS_ERR(priv->clk))
 		return PTR_ERR(priv->clk);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 65fd613d2c70..e18299573d2b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -98,7 +98,6 @@ struct mtk_ddp_comp_funcs {
 
 struct mtk_ddp_comp {
 	struct device *dev;
-	void __iomem *regs;
 	int irq;
 	struct device *larb_dev;
 	enum mtk_ddp_comp_id id;
@@ -228,10 +227,12 @@ void mtk_dither_set(struct mtk_ddp_comp *comp, unsigned int bpc,
 		    unsigned int CFG, struct cmdq_pkt *cmdq_pkt);
 enum mtk_ddp_comp_type mtk_ddp_comp_get_type(enum mtk_ddp_comp_id comp_id);
 void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
-		   struct mtk_ddp_comp *comp, unsigned int offset);
+		   struct mtk_ddp_comp *comp, void __iomem *regs,
+		   unsigned int offset);
 void mtk_ddp_write_relaxed(struct cmdq_pkt *cmdq_pkt, unsigned int value,
-			   struct mtk_ddp_comp *comp, unsigned int offset);
+			   struct mtk_ddp_comp *comp, void __iomem *regs,
+			   unsigned int offset);
 void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
-			struct mtk_ddp_comp *comp, unsigned int offset,
-			unsigned int mask);
+			struct mtk_ddp_comp *comp, void __iomem *regs,
+			unsigned int offset, unsigned int mask);
 #endif /* MTK_DRM_DDP_COMP_H */
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
