Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF362A37DC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 01:34:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012E26E5CF;
	Tue,  3 Nov 2020 00:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCA76E5D1
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 00:34:56 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9677C22384;
 Tue,  3 Nov 2020 00:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604363696;
 bh=6Vt8xFExxpK0+lk6Nm4K1jwsHCkhmQgV0g2KH5Xa+Fo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ijThz9BaeVS4wjiNslB7w01rXgpctlyvcE+aKSnJY1yjAAzvifbNuPFZZO1HBshd5
 Q/JKsPf+k2Zz706LfT98xefo2h6kO6+mevxkpXjhx3oQwG8zfo4tvgbhtjMhRvl8R8
 uWG+5VmXMHGvvR20d9NNXccnxbhTH30zKhETxgxs=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 07/11] drm/mediatek: Move cmdq_reg info from struct
 mtk_ddp_comp to sub driver private data
Date: Tue,  3 Nov 2020 08:34:18 +0800
Message-Id: <20201103003422.17838-8-chunkuang.hu@kernel.org>
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
could be used for multiple path. cmdq_reg info is one of sub driver data,
so move it.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_color.c   | 10 ++-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 34 ++++++-----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 30 +++++----
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 67 +++++++++++----------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  7 +--
 5 files changed, 84 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 8b61573a5f72..950b7b92e2c3 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -38,6 +38,7 @@ struct mtk_disp_color {
 	struct drm_crtc				*crtc;
 	struct clk				*clk;
 	void __iomem				*regs;
+	struct cmdq_client_reg			cmdq_reg;
 	const struct mtk_disp_color_data	*data;
 };
 
@@ -66,8 +67,8 @@ static void mtk_color_config(struct mtk_ddp_comp *comp, unsigned int w,
 {
 	struct mtk_disp_color *color = comp_to_color(comp);
 
-	mtk_ddp_write(cmdq_pkt, w, comp, color->regs, DISP_COLOR_WIDTH(color));
-	mtk_ddp_write(cmdq_pkt, h, comp, color->regs, DISP_COLOR_HEIGHT(color));
+	mtk_ddp_write(cmdq_pkt, w, &color->cmdq_reg, color->regs, DISP_COLOR_WIDTH(color));
+	mtk_ddp_write(cmdq_pkt, h, &color->cmdq_reg, color->regs, DISP_COLOR_HEIGHT(color));
 }
 
 static void mtk_color_start(struct mtk_ddp_comp *comp)
@@ -141,6 +142,11 @@ static int mtk_disp_color_probe(struct platform_device *pdev)
 		dev_err(dev, "failed to ioremap color\n");
 		return PTR_ERR(priv->regs);
 	}
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
+	if (ret)
+		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
+#endif
 
 	comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DISP_COLOR);
 	if (comp_id < 0) {
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 63164679f04d..d484d08e91e7 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -73,6 +73,7 @@ struct mtk_disp_ovl {
 	struct drm_crtc			*crtc;
 	struct clk			*clk;
 	void __iomem			*regs;
+	struct cmdq_client_reg		cmdq_reg;
 	const struct mtk_disp_ovl_data	*data;
 };
 
@@ -150,12 +151,12 @@ static void mtk_ovl_config(struct mtk_ddp_comp *comp, unsigned int w,
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(comp->dev);
 
 	if (w != 0 && h != 0)
-		mtk_ddp_write_relaxed(cmdq_pkt, h << 16 | w, comp, ovl->regs,
+		mtk_ddp_write_relaxed(cmdq_pkt, h << 16 | w, &ovl->cmdq_reg, ovl->regs,
 				      DISP_REG_OVL_ROI_SIZE);
-	mtk_ddp_write_relaxed(cmdq_pkt, 0x0, comp, ovl->regs, DISP_REG_OVL_ROI_BGCLR);
+	mtk_ddp_write_relaxed(cmdq_pkt, 0x0, &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_ROI_BGCLR);
 
-	mtk_ddp_write(cmdq_pkt, 0x1, comp, ovl->regs, DISP_REG_OVL_RST);
-	mtk_ddp_write(cmdq_pkt, 0x0, comp, ovl->regs, DISP_REG_OVL_RST);
+	mtk_ddp_write(cmdq_pkt, 0x1, &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_RST);
+	mtk_ddp_write(cmdq_pkt, 0x0, &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_RST);
 }
 
 static unsigned int mtk_ovl_layer_nr(struct mtk_ddp_comp *comp)
@@ -207,7 +208,7 @@ static void mtk_ovl_layer_on(struct mtk_ddp_comp *comp, unsigned int idx,
 	unsigned int gmc_value;
 	struct mtk_disp_ovl *ovl = comp_to_ovl(comp);
 
-	mtk_ddp_write(cmdq_pkt, 0x1, comp, ovl->regs,
+	mtk_ddp_write(cmdq_pkt, 0x1, &ovl->cmdq_reg, ovl->regs,
 		      DISP_REG_OVL_RDMA_CTRL(idx));
 	gmc_thrshd_l = GMC_THRESHOLD_LOW >>
 		      (GMC_THRESHOLD_BITS - ovl->data->gmc_bits);
@@ -219,8 +220,8 @@ static void mtk_ovl_layer_on(struct mtk_ddp_comp *comp, unsigned int idx,
 		gmc_value = gmc_thrshd_l | gmc_thrshd_l << 8 |
 			    gmc_thrshd_h << 16 | gmc_thrshd_h << 24;
 	mtk_ddp_write(cmdq_pkt, gmc_value,
-		      comp, ovl->regs, DISP_REG_OVL_RDMA_GMC(idx));
-	mtk_ddp_write_mask(cmdq_pkt, BIT(idx), comp, ovl->regs,
+		      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_RDMA_GMC(idx));
+	mtk_ddp_write_mask(cmdq_pkt, BIT(idx), &ovl->cmdq_reg, ovl->regs,
 			   DISP_REG_OVL_SRC_CON, BIT(idx));
 }
 
@@ -229,9 +230,9 @@ static void mtk_ovl_layer_off(struct mtk_ddp_comp *comp, unsigned int idx,
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(comp->dev);
 
-	mtk_ddp_write_mask(cmdq_pkt, 0, comp, ovl->regs,
+	mtk_ddp_write_mask(cmdq_pkt, 0, &ovl->cmdq_reg, ovl->regs,
 			   DISP_REG_OVL_SRC_CON, BIT(idx));
-	mtk_ddp_write(cmdq_pkt, 0, comp, ovl->regs,
+	mtk_ddp_write(cmdq_pkt, 0, &ovl->cmdq_reg, ovl->regs,
 		      DISP_REG_OVL_RDMA_CTRL(idx));
 }
 
@@ -303,15 +304,15 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
 		addr += pending->pitch - 1;
 	}
 
-	mtk_ddp_write_relaxed(cmdq_pkt, con, comp, ovl->regs,
+	mtk_ddp_write_relaxed(cmdq_pkt, con, &ovl->cmdq_reg, ovl->regs,
 			      DISP_REG_OVL_CON(idx));
-	mtk_ddp_write_relaxed(cmdq_pkt, pitch, comp, ovl->regs,
+	mtk_ddp_write_relaxed(cmdq_pkt, pitch, &ovl->cmdq_reg, ovl->regs,
 			      DISP_REG_OVL_PITCH(idx));
-	mtk_ddp_write_relaxed(cmdq_pkt, src_size, comp, ovl->regs,
+	mtk_ddp_write_relaxed(cmdq_pkt, src_size, &ovl->cmdq_reg, ovl->regs,
 			      DISP_REG_OVL_SRC_SIZE(idx));
-	mtk_ddp_write_relaxed(cmdq_pkt, offset, comp, ovl->regs,
+	mtk_ddp_write_relaxed(cmdq_pkt, offset, &ovl->cmdq_reg, ovl->regs,
 			      DISP_REG_OVL_OFFSET(idx));
-	mtk_ddp_write_relaxed(cmdq_pkt, addr, comp, ovl->regs,
+	mtk_ddp_write_relaxed(cmdq_pkt, addr, &ovl->cmdq_reg, ovl->regs,
 			      DISP_REG_OVL_ADDR(ovl, idx));
 
 	mtk_ovl_layer_on(comp, idx, cmdq_pkt);
@@ -413,6 +414,11 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 		dev_err(dev, "failed to ioremap ovl\n");
 		return PTR_ERR(priv->regs);
 	}
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
+	if (ret)
+		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
+#endif
 
 	priv->data = of_device_get_match_data(dev);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 2a0836a14f12..310c57fe35e2 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -64,6 +64,7 @@ struct mtk_disp_rdma {
 	struct drm_crtc			*crtc;
 	struct clk			*clk;
 	void __iomem			*regs;
+	struct cmdq_client_reg		cmdq_reg;
 	const struct mtk_disp_rdma_data	*data;
 };
 
@@ -149,9 +150,9 @@ static void mtk_rdma_config(struct mtk_ddp_comp *comp, unsigned int width,
 	unsigned int reg;
 	struct mtk_disp_rdma *rdma = comp_to_rdma(comp);
 
-	mtk_ddp_write_mask(cmdq_pkt, width, comp, rdma->regs,
+	mtk_ddp_write_mask(cmdq_pkt, width, &rdma->cmdq_reg, rdma->regs,
 			   DISP_REG_RDMA_SIZE_CON_0, 0xfff);
-	mtk_ddp_write_mask(cmdq_pkt, height, comp, rdma->regs,
+	mtk_ddp_write_mask(cmdq_pkt, height, &rdma->cmdq_reg, rdma->regs,
 			   DISP_REG_RDMA_SIZE_CON_1, 0xfffff);
 
 	/*
@@ -164,7 +165,7 @@ static void mtk_rdma_config(struct mtk_ddp_comp *comp, unsigned int width,
 	reg = RDMA_FIFO_UNDERFLOW_EN |
 	      RDMA_FIFO_PSEUDO_SIZE(RDMA_FIFO_SIZE(rdma)) |
 	      RDMA_OUTPUT_VALID_FIFO_THRESHOLD(threshold);
-	mtk_ddp_write(cmdq_pkt, reg, comp, rdma->regs, DISP_REG_RDMA_FIFO_CON);
+	mtk_ddp_write(cmdq_pkt, reg, &rdma->cmdq_reg, rdma->regs, DISP_REG_RDMA_FIFO_CON);
 }
 
 static unsigned int rdma_fmt_convert(struct mtk_disp_rdma *rdma,
@@ -221,25 +222,27 @@ static void mtk_rdma_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
 	unsigned int con;
 
 	con = rdma_fmt_convert(rdma, fmt);
-	mtk_ddp_write_relaxed(cmdq_pkt, con, comp, rdma->regs, DISP_RDMA_MEM_CON);
+	mtk_ddp_write_relaxed(cmdq_pkt, con, &rdma->cmdq_reg, rdma->regs, DISP_RDMA_MEM_CON);
 
 	if (fmt == DRM_FORMAT_UYVY || fmt == DRM_FORMAT_YUYV) {
-		mtk_ddp_write_mask(cmdq_pkt, RDMA_MATRIX_ENABLE, comp, rdma->regs,
+		mtk_ddp_write_mask(cmdq_pkt, RDMA_MATRIX_ENABLE, &rdma->cmdq_reg, rdma->regs,
 				   DISP_REG_RDMA_SIZE_CON_0,
 				   RDMA_MATRIX_ENABLE);
 		mtk_ddp_write_mask(cmdq_pkt, RDMA_MATRIX_INT_MTX_BT601_to_RGB,
-				   comp, rdma->regs, DISP_REG_RDMA_SIZE_CON_0,
+				   &rdma->cmdq_reg, rdma->regs, DISP_REG_RDMA_SIZE_CON_0,
 				   RDMA_MATRIX_INT_MTX_SEL);
 	} else {
-		mtk_ddp_write_mask(cmdq_pkt, 0, comp, rdma->regs,
+		mtk_ddp_write_mask(cmdq_pkt, 0, &rdma->cmdq_reg, rdma->regs,
 				   DISP_REG_RDMA_SIZE_CON_0,
 				   RDMA_MATRIX_ENABLE);
 	}
-	mtk_ddp_write_relaxed(cmdq_pkt, addr, comp, rdma->regs, DISP_RDMA_MEM_START_ADDR);
-	mtk_ddp_write_relaxed(cmdq_pkt, pitch, comp, rdma->regs, DISP_RDMA_MEM_SRC_PITCH);
-	mtk_ddp_write(cmdq_pkt, RDMA_MEM_GMC, comp, rdma->regs,
+	mtk_ddp_write_relaxed(cmdq_pkt, addr, &rdma->cmdq_reg, rdma->regs,
+			      DISP_RDMA_MEM_START_ADDR);
+	mtk_ddp_write_relaxed(cmdq_pkt, pitch, &rdma->cmdq_reg, rdma->regs,
+			      DISP_RDMA_MEM_SRC_PITCH);
+	mtk_ddp_write(cmdq_pkt, RDMA_MEM_GMC, &rdma->cmdq_reg, rdma->regs,
 		      DISP_RDMA_MEM_GMC_SETTING_0);
-	mtk_ddp_write_mask(cmdq_pkt, RDMA_MODE_MEMORY, comp, rdma->regs,
+	mtk_ddp_write_mask(cmdq_pkt, RDMA_MODE_MEMORY, &rdma->cmdq_reg, rdma->regs,
 			   DISP_REG_RDMA_GLOBAL_CON, RDMA_MODE_MEMORY);
 
 }
@@ -317,6 +320,11 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 		dev_err(dev, "failed to ioremap rdma\n");
 		return PTR_ERR(priv->regs);
 	}
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
+	if (ret)
+		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
+#endif
 
 	comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DISP_RDMA);
 	if (comp_id < 0) {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index bf166b032fca..aab9b8fa2b7b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -88,42 +88,43 @@
 struct mtk_ddp_comp_dev {
 	struct clk *clk;
 	void __iomem *regs;
+	struct cmdq_client_reg cmdq_reg;
 };
 
 void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
-		   struct mtk_ddp_comp *comp, void __iomem *regs,
+		   struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
 		   unsigned int offset)
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (cmdq_pkt)
-		cmdq_pkt_write(cmdq_pkt, comp->cmdq_reg.subsys,
-			       comp->cmdq_reg.offset + offset, value);
+		cmdq_pkt_write(cmdq_pkt, cmdq_reg->subsys,
+			       cmdq_reg->offset + offset, value);
 	else
 #endif
 		writel(value, regs + offset);
 }
 
 void mtk_ddp_write_relaxed(struct cmdq_pkt *cmdq_pkt, unsigned int value,
-			   struct mtk_ddp_comp *comp, void __iomem *regs,
+			   struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
 			   unsigned int offset)
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (cmdq_pkt)
-		cmdq_pkt_write(cmdq_pkt, comp->cmdq_reg.subsys,
-			       comp->cmdq_reg.offset + offset, value);
+		cmdq_pkt_write(cmdq_pkt, cmdq_reg->subsys,
+			       cmdq_reg->offset + offset, value);
 	else
 #endif
 		writel_relaxed(value, regs + offset);
 }
 
 void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
-			struct mtk_ddp_comp *comp, void __iomem *regs,
+			struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
 			unsigned int offset, unsigned int mask)
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (cmdq_pkt) {
-		cmdq_pkt_write_mask(cmdq_pkt, comp->cmdq_reg.subsys,
-				    comp->cmdq_reg.offset + offset, value, mask);
+		cmdq_pkt_write_mask(cmdq_pkt, cmdq_reg->subsys,
+				    cmdq_reg->offset + offset, value, mask);
 	} else {
 #endif
 		u32 tmp = readl(regs + offset);
@@ -159,20 +160,20 @@ void mtk_dither_set(struct mtk_ddp_comp *comp, unsigned int bpc,
 		return;
 
 	if (bpc >= MTK_MIN_BPC) {
-		mtk_ddp_write(cmdq_pkt, 0, comp, priv->regs, DISP_DITHER_5);
-		mtk_ddp_write(cmdq_pkt, 0, comp, priv->regs, DISP_DITHER_7);
+		mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs, DISP_DITHER_5);
+		mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs, DISP_DITHER_7);
 		mtk_ddp_write(cmdq_pkt,
 			      DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
 			      DITHER_ADD_LSHIFT_R(MTK_MAX_BPC - bpc) |
 			      DITHER_NEW_BIT_MODE,
-			      comp, priv->regs, DISP_DITHER_15);
+			      &priv->cmdq_reg, priv->regs, DISP_DITHER_15);
 		mtk_ddp_write(cmdq_pkt,
 			      DITHER_LSB_ERR_SHIFT_B(MTK_MAX_BPC - bpc) |
 			      DITHER_ADD_LSHIFT_B(MTK_MAX_BPC - bpc) |
 			      DITHER_LSB_ERR_SHIFT_G(MTK_MAX_BPC - bpc) |
 			      DITHER_ADD_LSHIFT_G(MTK_MAX_BPC - bpc),
-			      comp, priv->regs, DISP_DITHER_16);
-		mtk_ddp_write(cmdq_pkt, DISP_DITHERING, comp, priv->regs, CFG);
+			      &priv->cmdq_reg, priv->regs, DISP_DITHER_16);
+		mtk_ddp_write(cmdq_pkt, DISP_DITHERING, &priv->cmdq_reg, priv->regs, CFG);
 	}
 }
 
@@ -182,8 +183,8 @@ static void mtk_od_config(struct mtk_ddp_comp *comp, unsigned int w,
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
 
-	mtk_ddp_write(cmdq_pkt, w << 16 | h, comp, priv->regs, DISP_OD_SIZE);
-	mtk_ddp_write(cmdq_pkt, OD_RELAYMODE, comp, priv->regs, DISP_OD_CFG);
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_OD_SIZE);
+	mtk_ddp_write(cmdq_pkt, OD_RELAYMODE, &priv->cmdq_reg, priv->regs, DISP_OD_CFG);
 	mtk_dither_set(comp, bpc, DISP_OD_CFG, cmdq_pkt);
 }
 
@@ -207,7 +208,7 @@ static void mtk_aal_config(struct mtk_ddp_comp *comp, unsigned int w,
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
 
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, comp, priv->regs, DISP_AAL_SIZE);
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_AAL_SIZE);
 }
 
 static void mtk_aal_start(struct mtk_ddp_comp *comp)
@@ -230,8 +231,8 @@ static void mtk_ccorr_config(struct mtk_ddp_comp *comp, unsigned int w,
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
 
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, comp, priv->regs, DISP_CCORR_SIZE);
-	mtk_ddp_write(cmdq_pkt, CCORR_ENGINE_EN, comp, priv->regs, DISP_CCORR_CFG);
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_CCORR_SIZE);
+	mtk_ddp_write(cmdq_pkt, CCORR_ENGINE_EN, &priv->cmdq_reg, priv->regs, DISP_CCORR_CFG);
 }
 
 static void mtk_ccorr_start(struct mtk_ddp_comp *comp)
@@ -289,15 +290,15 @@ static void mtk_ccorr_ctm_set(struct mtk_ddp_comp *comp,
 		coeffs[i] = mtk_ctm_s31_32_to_s1_10(input[i]);
 
 	mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
-		      comp, priv->regs, DISP_CCORR_COEF_0);
+		      &priv->cmdq_reg, priv->regs, DISP_CCORR_COEF_0);
 	mtk_ddp_write(cmdq_pkt, coeffs[2] << 16 | coeffs[3],
-		      comp, priv->regs, DISP_CCORR_COEF_1);
+		      &priv->cmdq_reg, priv->regs, DISP_CCORR_COEF_1);
 	mtk_ddp_write(cmdq_pkt, coeffs[4] << 16 | coeffs[5],
-		      comp, priv->regs, DISP_CCORR_COEF_2);
+		      &priv->cmdq_reg, priv->regs, DISP_CCORR_COEF_2);
 	mtk_ddp_write(cmdq_pkt, coeffs[6] << 16 | coeffs[7],
-		      comp, priv->regs, DISP_CCORR_COEF_3);
+		      &priv->cmdq_reg, priv->regs, DISP_CCORR_COEF_3);
 	mtk_ddp_write(cmdq_pkt, coeffs[8] << 16,
-		      comp, priv->regs, DISP_CCORR_COEF_4);
+		      &priv->cmdq_reg, priv->regs, DISP_CCORR_COEF_4);
 }
 
 static void mtk_dither_config(struct mtk_ddp_comp *comp, unsigned int w,
@@ -306,8 +307,8 @@ static void mtk_dither_config(struct mtk_ddp_comp *comp, unsigned int w,
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
 
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, comp, priv->regs, DISP_DITHER_SIZE);
-	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, comp, priv->regs, DISP_DITHER_CFG);
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
+	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
 }
 
 static void mtk_dither_start(struct mtk_ddp_comp *comp)
@@ -330,7 +331,7 @@ static void mtk_gamma_config(struct mtk_ddp_comp *comp, unsigned int w,
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
 
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, comp, priv->regs, DISP_GAMMA_SIZE);
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_GAMMA_SIZE);
 	mtk_dither_set(comp, bpc, DISP_GAMMA_CFG, cmdq_pkt);
 }
 
@@ -566,12 +567,6 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	}
 	comp->dev = &comp_pdev->dev;
 
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	ret = cmdq_dev_get_client_reg(comp->dev, &comp->cmdq_reg, 0);
-	if (ret)
-		dev_dbg(comp->dev, "get mediatek,gce-client-reg fail!\n");
-#endif
-
 	if (comp_id == DDP_COMPONENT_COLOR0 ||
 	    comp_id == DDP_COMPONENT_COLOR1 ||
 	    comp_id == DDP_COMPONENT_OVL0 ||
@@ -592,6 +587,12 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	if (IS_ERR(priv->clk))
 		return PTR_ERR(priv->clk);
 
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(comp->dev, &priv->cmdq_reg, 0);
+	if (ret)
+		dev_dbg(comp->dev, "get mediatek,gce-client-reg fail!\n");
+#endif
+
 	platform_set_drvdata(comp_pdev, priv);
 
 	/* Only DMA capable components need the LARB property */
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 621b07ef807e..d73f5cf2181f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -103,7 +103,6 @@ struct mtk_ddp_comp {
 	struct device *larb_dev;
 	enum mtk_ddp_comp_id id;
 	const struct mtk_ddp_comp_funcs *funcs;
-	struct cmdq_client_reg cmdq_reg;
 };
 
 static inline int mtk_ddp_comp_clk_enable(struct mtk_ddp_comp *comp)
@@ -227,12 +226,12 @@ void mtk_dither_set(struct mtk_ddp_comp *comp, unsigned int bpc,
 		    unsigned int CFG, struct cmdq_pkt *cmdq_pkt);
 enum mtk_ddp_comp_type mtk_ddp_comp_get_type(enum mtk_ddp_comp_id comp_id);
 void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
-		   struct mtk_ddp_comp *comp, void __iomem *regs,
+		   struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
 		   unsigned int offset);
 void mtk_ddp_write_relaxed(struct cmdq_pkt *cmdq_pkt, unsigned int value,
-			   struct mtk_ddp_comp *comp, void __iomem *regs,
+			   struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
 			   unsigned int offset);
 void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
-			struct mtk_ddp_comp *comp, void __iomem *regs,
+			struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
 			unsigned int offset, unsigned int mask);
 #endif /* MTK_DRM_DDP_COMP_H */
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
