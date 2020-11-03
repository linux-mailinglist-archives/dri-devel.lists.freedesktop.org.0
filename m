Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F93D2A37DD
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 01:35:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5E96E5D1;
	Tue,  3 Nov 2020 00:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E0F6E5D1
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 00:34:58 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8E0D0223EA;
 Tue,  3 Nov 2020 00:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604363698;
 bh=4I6ra5umpq91gUp+eWAROVqOYfHn0Wz9qHFkT7r8YSs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YNM9akpTwAECdpwkDWDVZZBgqHDDwt1lIfAwt+G32LbwR5Wvk2UlIINdp/QBU7s9Z
 t5lTECma4GcbeWQVo4YMCVJ4MeSqVauNnJKqYsgbkt3MQpmCZDGEMH6AzFbwiLBhhq
 JIiPTSLhIlkuxWtruuwtN7cJ/t8LhoVUy0iCaNOc=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 08/11] drm/mediatek: Change sub driver interface from
 mtk_ddp_comp to device
Date: Tue,  3 Nov 2020 08:34:19 +0800
Message-Id: <20201103003422.17838-9-chunkuang.hu@kernel.org>
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
sub driver interface should get rid of display info. Using device
instead of mtk_ddp_comp make interface general.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_color.c   |  13 +--
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  57 +++++------
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |  39 ++++----
 drivers/gpu/drm/mediatek/mtk_dpi.c          |   8 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 100 ++++++++++----------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  54 +++++------
 drivers/gpu/drm/mediatek/mtk_dsi.c          |   8 +-
 7 files changed, 129 insertions(+), 150 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 950b7b92e2c3..cc11d857ba60 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -42,11 +42,6 @@ struct mtk_disp_color {
 	const struct mtk_disp_color_data	*data;
 };
 
-static inline struct mtk_disp_color *comp_to_color(struct mtk_ddp_comp *comp)
-{
-	return container_of(comp, struct mtk_disp_color, ddp_comp);
-}
-
 static int mtk_color_clk_enable(struct device *dev)
 {
 	struct mtk_disp_color *color = dev_get_drvdata(dev);
@@ -61,19 +56,19 @@ static void mtk_color_clk_disable(struct device *dev)
 	clk_disable_unprepare(color->clk);
 }
 
-static void mtk_color_config(struct mtk_ddp_comp *comp, unsigned int w,
+static void mtk_color_config(struct device *dev, unsigned int w,
 			     unsigned int h, unsigned int vrefresh,
 			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
-	struct mtk_disp_color *color = comp_to_color(comp);
+	struct mtk_disp_color *color = dev_get_drvdata(dev);
 
 	mtk_ddp_write(cmdq_pkt, w, &color->cmdq_reg, color->regs, DISP_COLOR_WIDTH(color));
 	mtk_ddp_write(cmdq_pkt, h, &color->cmdq_reg, color->regs, DISP_COLOR_HEIGHT(color));
 }
 
-static void mtk_color_start(struct mtk_ddp_comp *comp)
+static void mtk_color_start(struct device *dev)
 {
-	struct mtk_disp_color *color = comp_to_color(comp);
+	struct mtk_disp_color *color = dev_get_drvdata(dev);
 
 	writel(COLOR_BYPASS_ALL | COLOR_SEQ_SEL,
 	       color->regs + DISP_COLOR_CFG_MAIN);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index d484d08e91e7..ab56054b0934 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -77,11 +77,6 @@ struct mtk_disp_ovl {
 	const struct mtk_disp_ovl_data	*data;
 };
 
-static inline struct mtk_disp_ovl *comp_to_ovl(struct mtk_ddp_comp *comp)
-{
-	return container_of(comp, struct mtk_disp_ovl, ddp_comp);
-}
-
 static irqreturn_t mtk_disp_ovl_irq_handler(int irq, void *dev_id)
 {
 	struct mtk_disp_ovl *priv = dev_id;
@@ -98,19 +93,19 @@ static irqreturn_t mtk_disp_ovl_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void mtk_ovl_enable_vblank(struct mtk_ddp_comp *comp,
+static void mtk_ovl_enable_vblank(struct device *dev,
 				  struct drm_crtc *crtc)
 {
-	struct mtk_disp_ovl *ovl = comp_to_ovl(comp);
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
 	ovl->crtc = crtc;
 	writel(0x0, ovl->regs + DISP_REG_OVL_INTSTA);
 	writel_relaxed(OVL_FME_CPL_INT, ovl->regs + DISP_REG_OVL_INTEN);
 }
 
-static void mtk_ovl_disable_vblank(struct mtk_ddp_comp *comp)
+static void mtk_ovl_disable_vblank(struct device *dev)
 {
-	struct mtk_disp_ovl *ovl = comp_to_ovl(comp);
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
 	ovl->crtc = NULL;
 	writel_relaxed(0x0, ovl->regs + DISP_REG_OVL_INTEN);
@@ -130,25 +125,25 @@ static void mtk_ovl_clk_disable(struct device *dev)
 	clk_disable_unprepare(ovl->clk);
 }
 
-static void mtk_ovl_start(struct mtk_ddp_comp *comp)
+static void mtk_ovl_start(struct device *dev)
 {
-	struct mtk_disp_ovl *ovl = dev_get_drvdata(comp->dev);
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
 	writel_relaxed(0x1, ovl->regs + DISP_REG_OVL_EN);
 }
 
-static void mtk_ovl_stop(struct mtk_ddp_comp *comp)
+static void mtk_ovl_stop(struct device *dev)
 {
-	struct mtk_disp_ovl *ovl = dev_get_drvdata(comp->dev);
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
 	writel_relaxed(0x0, ovl->regs + DISP_REG_OVL_EN);
 }
 
-static void mtk_ovl_config(struct mtk_ddp_comp *comp, unsigned int w,
+static void mtk_ovl_config(struct device *dev, unsigned int w,
 			   unsigned int h, unsigned int vrefresh,
 			   unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
-	struct mtk_disp_ovl *ovl = dev_get_drvdata(comp->dev);
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
 	if (w != 0 && h != 0)
 		mtk_ddp_write_relaxed(cmdq_pkt, h << 16 | w, &ovl->cmdq_reg, ovl->regs,
@@ -159,20 +154,20 @@ static void mtk_ovl_config(struct mtk_ddp_comp *comp, unsigned int w,
 	mtk_ddp_write(cmdq_pkt, 0x0, &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_RST);
 }
 
-static unsigned int mtk_ovl_layer_nr(struct mtk_ddp_comp *comp)
+static unsigned int mtk_ovl_layer_nr(struct device *dev)
 {
-	struct mtk_disp_ovl *ovl = comp_to_ovl(comp);
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
 	return ovl->data->layer_nr;
 }
 
-static unsigned int mtk_ovl_supported_rotations(struct mtk_ddp_comp *comp)
+static unsigned int mtk_ovl_supported_rotations(struct device *dev)
 {
 	return DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180 |
 	       DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y;
 }
 
-static int mtk_ovl_layer_check(struct mtk_ddp_comp *comp, unsigned int idx,
+static int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
 			       struct mtk_plane_state *mtk_state)
 {
 	struct drm_plane_state *state = &mtk_state->base;
@@ -200,13 +195,13 @@ static int mtk_ovl_layer_check(struct mtk_ddp_comp *comp, unsigned int idx,
 	return 0;
 }
 
-static void mtk_ovl_layer_on(struct mtk_ddp_comp *comp, unsigned int idx,
+static void mtk_ovl_layer_on(struct device *dev, unsigned int idx,
 			     struct cmdq_pkt *cmdq_pkt)
 {
 	unsigned int gmc_thrshd_l;
 	unsigned int gmc_thrshd_h;
 	unsigned int gmc_value;
-	struct mtk_disp_ovl *ovl = comp_to_ovl(comp);
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
 	mtk_ddp_write(cmdq_pkt, 0x1, &ovl->cmdq_reg, ovl->regs,
 		      DISP_REG_OVL_RDMA_CTRL(idx));
@@ -225,10 +220,10 @@ static void mtk_ovl_layer_on(struct mtk_ddp_comp *comp, unsigned int idx,
 			   DISP_REG_OVL_SRC_CON, BIT(idx));
 }
 
-static void mtk_ovl_layer_off(struct mtk_ddp_comp *comp, unsigned int idx,
+static void mtk_ovl_layer_off(struct device *dev, unsigned int idx,
 			      struct cmdq_pkt *cmdq_pkt)
 {
-	struct mtk_disp_ovl *ovl = dev_get_drvdata(comp->dev);
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
 	mtk_ddp_write_mask(cmdq_pkt, 0, &ovl->cmdq_reg, ovl->regs,
 			   DISP_REG_OVL_SRC_CON, BIT(idx));
@@ -272,11 +267,11 @@ static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt)
 	}
 }
 
-static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
+static void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 				 struct mtk_plane_state *state,
 				 struct cmdq_pkt *cmdq_pkt)
 {
-	struct mtk_disp_ovl *ovl = comp_to_ovl(comp);
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 	struct mtk_plane_pending_state *pending = &state->pending;
 	unsigned int addr = pending->addr;
 	unsigned int pitch = pending->pitch & 0xffff;
@@ -286,7 +281,7 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
 	unsigned int con;
 
 	if (!pending->enable) {
-		mtk_ovl_layer_off(comp, idx, cmdq_pkt);
+		mtk_ovl_layer_off(dev, idx, cmdq_pkt);
 		return;
 	}
 
@@ -315,12 +310,12 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
 	mtk_ddp_write_relaxed(cmdq_pkt, addr, &ovl->cmdq_reg, ovl->regs,
 			      DISP_REG_OVL_ADDR(ovl, idx));
 
-	mtk_ovl_layer_on(comp, idx, cmdq_pkt);
+	mtk_ovl_layer_on(dev, idx, cmdq_pkt);
 }
 
-static void mtk_ovl_bgclr_in_on(struct mtk_ddp_comp *comp)
+static void mtk_ovl_bgclr_in_on(struct device *dev)
 {
-	struct mtk_disp_ovl *ovl = comp_to_ovl(comp);
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 	unsigned int reg;
 
 	reg = readl(ovl->regs + DISP_REG_OVL_DATAPATH_CON);
@@ -328,9 +323,9 @@ static void mtk_ovl_bgclr_in_on(struct mtk_ddp_comp *comp)
 	writel(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON);
 }
 
-static void mtk_ovl_bgclr_in_off(struct mtk_ddp_comp *comp)
+static void mtk_ovl_bgclr_in_off(struct device *dev)
 {
-	struct mtk_disp_ovl *ovl = comp_to_ovl(comp);
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 	unsigned int reg;
 
 	reg = readl(ovl->regs + DISP_REG_OVL_DATAPATH_CON);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 310c57fe35e2..1976769ae4e3 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -68,11 +68,6 @@ struct mtk_disp_rdma {
 	const struct mtk_disp_rdma_data	*data;
 };
 
-static inline struct mtk_disp_rdma *comp_to_rdma(struct mtk_ddp_comp *comp)
-{
-	return container_of(comp, struct mtk_disp_rdma, ddp_comp);
-}
-
 static irqreturn_t mtk_disp_rdma_irq_handler(int irq, void *dev_id)
 {
 	struct mtk_disp_rdma *priv = dev_id;
@@ -89,32 +84,32 @@ static irqreturn_t mtk_disp_rdma_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void rdma_update_bits(struct mtk_ddp_comp *comp, unsigned int reg,
+static void rdma_update_bits(struct device *dev, unsigned int reg,
 			     unsigned int mask, unsigned int val)
 {
-	struct mtk_disp_rdma *rdma = dev_get_drvdata(comp->dev);
+	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
 	unsigned int tmp = readl(rdma->regs + reg);
 
 	tmp = (tmp & ~mask) | (val & mask);
 	writel(tmp, rdma->regs + reg);
 }
 
-static void mtk_rdma_enable_vblank(struct mtk_ddp_comp *comp,
+static void mtk_rdma_enable_vblank(struct device *dev,
 				   struct drm_crtc *crtc)
 {
-	struct mtk_disp_rdma *rdma = comp_to_rdma(comp);
+	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
 
 	rdma->crtc = crtc;
-	rdma_update_bits(comp, DISP_REG_RDMA_INT_ENABLE, RDMA_FRAME_END_INT,
+	rdma_update_bits(dev, DISP_REG_RDMA_INT_ENABLE, RDMA_FRAME_END_INT,
 			 RDMA_FRAME_END_INT);
 }
 
-static void mtk_rdma_disable_vblank(struct mtk_ddp_comp *comp)
+static void mtk_rdma_disable_vblank(struct device *dev)
 {
-	struct mtk_disp_rdma *rdma = comp_to_rdma(comp);
+	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
 
 	rdma->crtc = NULL;
-	rdma_update_bits(comp, DISP_REG_RDMA_INT_ENABLE, RDMA_FRAME_END_INT, 0);
+	rdma_update_bits(dev, DISP_REG_RDMA_INT_ENABLE, RDMA_FRAME_END_INT, 0);
 }
 
 static int mtk_rdma_clk_enable(struct device *dev)
@@ -131,24 +126,24 @@ static void mtk_rdma_clk_disable(struct device *dev)
 	clk_disable_unprepare(rdma->clk);
 }
 
-static void mtk_rdma_start(struct mtk_ddp_comp *comp)
+static void mtk_rdma_start(struct device *dev)
 {
-	rdma_update_bits(comp, DISP_REG_RDMA_GLOBAL_CON, RDMA_ENGINE_EN,
+	rdma_update_bits(dev, DISP_REG_RDMA_GLOBAL_CON, RDMA_ENGINE_EN,
 			 RDMA_ENGINE_EN);
 }
 
-static void mtk_rdma_stop(struct mtk_ddp_comp *comp)
+static void mtk_rdma_stop(struct device *dev)
 {
-	rdma_update_bits(comp, DISP_REG_RDMA_GLOBAL_CON, RDMA_ENGINE_EN, 0);
+	rdma_update_bits(dev, DISP_REG_RDMA_GLOBAL_CON, RDMA_ENGINE_EN, 0);
 }
 
-static void mtk_rdma_config(struct mtk_ddp_comp *comp, unsigned int width,
+static void mtk_rdma_config(struct device *dev, unsigned int width,
 			    unsigned int height, unsigned int vrefresh,
 			    unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
 	unsigned int threshold;
 	unsigned int reg;
-	struct mtk_disp_rdma *rdma = comp_to_rdma(comp);
+	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
 
 	mtk_ddp_write_mask(cmdq_pkt, width, &rdma->cmdq_reg, rdma->regs,
 			   DISP_REG_RDMA_SIZE_CON_0, 0xfff);
@@ -205,16 +200,16 @@ static unsigned int rdma_fmt_convert(struct mtk_disp_rdma *rdma,
 	}
 }
 
-static unsigned int mtk_rdma_layer_nr(struct mtk_ddp_comp *comp)
+static unsigned int mtk_rdma_layer_nr(struct device *dev)
 {
 	return 1;
 }
 
-static void mtk_rdma_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
+static void mtk_rdma_layer_config(struct device *dev, unsigned int idx,
 				  struct mtk_plane_state *state,
 				  struct cmdq_pkt *cmdq_pkt)
 {
-	struct mtk_disp_rdma *rdma = comp_to_rdma(comp);
+	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
 	struct mtk_plane_pending_state *pending = &state->pending;
 	unsigned int addr = pending->addr;
 	unsigned int pitch = pending->pitch & 0xffff;
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 6852b76fa583..d8d83e8ef3f3 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -571,16 +571,16 @@ static const struct drm_bridge_funcs mtk_dpi_bridge_funcs = {
 	.enable = mtk_dpi_bridge_enable,
 };
 
-static void mtk_dpi_start(struct mtk_ddp_comp *comp)
+static void mtk_dpi_start(struct device *dev)
 {
-	struct mtk_dpi *dpi = container_of(comp, struct mtk_dpi, ddp_comp);
+	struct mtk_dpi *dpi = dev_get_drvdata(dev);
 
 	mtk_dpi_power_on(dpi);
 }
 
-static void mtk_dpi_stop(struct mtk_ddp_comp *comp)
+static void mtk_dpi_stop(struct device *dev)
 {
-	struct mtk_dpi *dpi = container_of(comp, struct mtk_dpi, ddp_comp);
+	struct mtk_dpi *dpi = dev_get_drvdata(dev);
 
 	mtk_dpi_power_off(dpi);
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index aab9b8fa2b7b..7a7702730258 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -150,10 +150,10 @@ static void mtk_ddp_clk_disable(struct device *dev)
 	clk_disable_unprepare(priv->clk);
 }
 
-void mtk_dither_set(struct mtk_ddp_comp *comp, unsigned int bpc,
-		    unsigned int CFG, struct cmdq_pkt *cmdq_pkt)
+static void mtk_dither_set(struct device *dev, unsigned int bpc,
+			   unsigned int CFG, struct cmdq_pkt *cmdq_pkt)
 {
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
 	/* If bpc equal to 0, the dithering function didn't be enabled */
 	if (bpc == 0)
@@ -177,74 +177,74 @@ void mtk_dither_set(struct mtk_ddp_comp *comp, unsigned int bpc,
 	}
 }
 
-static void mtk_od_config(struct mtk_ddp_comp *comp, unsigned int w,
+static void mtk_od_config(struct device *dev, unsigned int w,
 			  unsigned int h, unsigned int vrefresh,
 			  unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
 	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_OD_SIZE);
 	mtk_ddp_write(cmdq_pkt, OD_RELAYMODE, &priv->cmdq_reg, priv->regs, DISP_OD_CFG);
-	mtk_dither_set(comp, bpc, DISP_OD_CFG, cmdq_pkt);
+	mtk_dither_set(dev, bpc, DISP_OD_CFG, cmdq_pkt);
 }
 
-static void mtk_od_start(struct mtk_ddp_comp *comp)
+static void mtk_od_start(struct device *dev)
 {
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
 	writel(1, priv->regs + DISP_OD_EN);
 }
 
-static void mtk_ufoe_start(struct mtk_ddp_comp *comp)
+static void mtk_ufoe_start(struct device *dev)
 {
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
 	writel(UFO_BYPASS, priv->regs + DISP_REG_UFO_START);
 }
 
-static void mtk_aal_config(struct mtk_ddp_comp *comp, unsigned int w,
+static void mtk_aal_config(struct device *dev, unsigned int w,
 			   unsigned int h, unsigned int vrefresh,
 			   unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
 	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_AAL_SIZE);
 }
 
-static void mtk_aal_start(struct mtk_ddp_comp *comp)
+static void mtk_aal_start(struct device *dev)
 {
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
 	writel(AAL_EN, priv->regs + DISP_AAL_EN);
 }
 
-static void mtk_aal_stop(struct mtk_ddp_comp *comp)
+static void mtk_aal_stop(struct device *dev)
 {
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
 	writel_relaxed(0x0, priv->regs + DISP_AAL_EN);
 }
 
-static void mtk_ccorr_config(struct mtk_ddp_comp *comp, unsigned int w,
+static void mtk_ccorr_config(struct device *dev, unsigned int w,
 			     unsigned int h, unsigned int vrefresh,
 			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
 	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_CCORR_SIZE);
 	mtk_ddp_write(cmdq_pkt, CCORR_ENGINE_EN, &priv->cmdq_reg, priv->regs, DISP_CCORR_CFG);
 }
 
-static void mtk_ccorr_start(struct mtk_ddp_comp *comp)
+static void mtk_ccorr_start(struct device *dev)
 {
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
 	writel(CCORR_EN, priv->regs + DISP_CCORR_EN);
 }
 
-static void mtk_ccorr_stop(struct mtk_ddp_comp *comp)
+static void mtk_ccorr_stop(struct device *dev)
 {
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
 	writel_relaxed(0x0, priv->regs + DISP_CCORR_EN);
 }
@@ -269,10 +269,10 @@ static u16 mtk_ctm_s31_32_to_s1_10(u64 in)
 	return r;
 }
 
-static void mtk_ccorr_ctm_set(struct mtk_ddp_comp *comp,
+static void mtk_ccorr_ctm_set(struct device *dev,
 			      struct drm_crtc_state *state)
 {
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 	struct drm_property_blob *blob = state->ctm;
 	struct drm_color_ctm *ctm;
 	const u64 *input;
@@ -301,58 +301,58 @@ static void mtk_ccorr_ctm_set(struct mtk_ddp_comp *comp,
 		      &priv->cmdq_reg, priv->regs, DISP_CCORR_COEF_4);
 }
 
-static void mtk_dither_config(struct mtk_ddp_comp *comp, unsigned int w,
+static void mtk_dither_config(struct device *dev, unsigned int w,
 			      unsigned int h, unsigned int vrefresh,
 			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
 	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
 	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
 }
 
-static void mtk_dither_start(struct mtk_ddp_comp *comp)
+static void mtk_dither_start(struct device *dev)
 {
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
 	writel(DITHER_EN, priv->regs + DISP_DITHER_EN);
 }
 
-static void mtk_dither_stop(struct mtk_ddp_comp *comp)
+static void mtk_dither_stop(struct device *dev)
 {
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
 	writel_relaxed(0x0, priv->regs + DISP_DITHER_EN);
 }
 
-static void mtk_gamma_config(struct mtk_ddp_comp *comp, unsigned int w,
+static void mtk_gamma_config(struct device *dev, unsigned int w,
 			     unsigned int h, unsigned int vrefresh,
 			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
 	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_GAMMA_SIZE);
-	mtk_dither_set(comp, bpc, DISP_GAMMA_CFG, cmdq_pkt);
+	mtk_dither_set(dev, bpc, DISP_GAMMA_CFG, cmdq_pkt);
 }
 
-static void mtk_gamma_start(struct mtk_ddp_comp *comp)
+static void mtk_gamma_start(struct device *dev)
 {
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
 	writel(GAMMA_EN, priv->regs  + DISP_GAMMA_EN);
 }
 
-static void mtk_gamma_stop(struct mtk_ddp_comp *comp)
+static void mtk_gamma_stop(struct device *dev)
 {
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
 	writel_relaxed(0x0, priv->regs  + DISP_GAMMA_EN);
 }
 
-static void mtk_gamma_set(struct mtk_ddp_comp *comp,
+static void mtk_gamma_set(struct device *dev,
 			  struct drm_crtc_state *state)
 {
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 	unsigned int i, reg;
 	struct drm_color_lut *lut;
 	void __iomem *lut_base;
@@ -548,18 +548,6 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 
 	comp->id = comp_id;
 	comp->funcs = funcs ?: mtk_ddp_matches[comp_id].funcs;
-
-	if (comp_id == DDP_COMPONENT_BLS ||
-	    comp_id == DDP_COMPONENT_DPI0 ||
-	    comp_id == DDP_COMPONENT_DPI1 ||
-	    comp_id == DDP_COMPONENT_DSI0 ||
-	    comp_id == DDP_COMPONENT_DSI1 ||
-	    comp_id == DDP_COMPONENT_DSI2 ||
-	    comp_id == DDP_COMPONENT_DSI3 ||
-	    comp_id == DDP_COMPONENT_PWM0) {
-		return 0;
-	}
-
 	comp_pdev = of_find_device_by_node(node);
 	if (!comp_pdev) {
 		DRM_INFO("Waiting for device %s\n", node->full_name);
@@ -567,12 +555,20 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	}
 	comp->dev = &comp_pdev->dev;
 
-	if (comp_id == DDP_COMPONENT_COLOR0 ||
+	if (comp_id == DDP_COMPONENT_BLS ||
+	    comp_id == DDP_COMPONENT_COLOR0 ||
 	    comp_id == DDP_COMPONENT_COLOR1 ||
+	    comp_id == DDP_COMPONENT_DPI0 ||
+	    comp_id == DDP_COMPONENT_DPI1 ||
+	    comp_id == DDP_COMPONENT_DSI0 ||
+	    comp_id == DDP_COMPONENT_DSI1 ||
+	    comp_id == DDP_COMPONENT_DSI2 ||
+	    comp_id == DDP_COMPONENT_DSI3 ||
 	    comp_id == DDP_COMPONENT_OVL0 ||
 	    comp_id == DDP_COMPONENT_OVL1 ||
 	    comp_id == DDP_COMPONENT_OVL_2L0 ||
 	    comp_id == DDP_COMPONENT_OVL_2L1 ||
+	    comp_id == DDP_COMPONENT_PWM0 ||
 	    comp_id == DDP_COMPONENT_RDMA0 ||
 	    comp_id == DDP_COMPONENT_RDMA1 ||
 	    comp_id == DDP_COMPONENT_RDMA2)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index d73f5cf2181f..ce598122bb78 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -74,26 +74,26 @@ struct cmdq_pkt;
 struct mtk_ddp_comp_funcs {
 	int (*clk_enable)(struct device *dev);
 	void (*clk_disable)(struct device *dev);
-	void (*config)(struct mtk_ddp_comp *comp, unsigned int w,
+	void (*config)(struct device *dev, unsigned int w,
 		       unsigned int h, unsigned int vrefresh,
 		       unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
-	void (*start)(struct mtk_ddp_comp *comp);
-	void (*stop)(struct mtk_ddp_comp *comp);
-	void (*enable_vblank)(struct mtk_ddp_comp *comp, struct drm_crtc *crtc);
-	void (*disable_vblank)(struct mtk_ddp_comp *comp);
-	unsigned int (*supported_rotations)(struct mtk_ddp_comp *comp);
-	unsigned int (*layer_nr)(struct mtk_ddp_comp *comp);
-	int (*layer_check)(struct mtk_ddp_comp *comp,
+	void (*start)(struct device *dev);
+	void (*stop)(struct device *dev);
+	void (*enable_vblank)(struct device *dev, struct drm_crtc *crtc);
+	void (*disable_vblank)(struct device *dev);
+	unsigned int (*supported_rotations)(struct device *dev);
+	unsigned int (*layer_nr)(struct device *dev);
+	int (*layer_check)(struct device *dev,
 			   unsigned int idx,
 			   struct mtk_plane_state *state);
-	void (*layer_config)(struct mtk_ddp_comp *comp, unsigned int idx,
+	void (*layer_config)(struct device *dev, unsigned int idx,
 			     struct mtk_plane_state *state,
 			     struct cmdq_pkt *cmdq_pkt);
-	void (*gamma_set)(struct mtk_ddp_comp *comp,
+	void (*gamma_set)(struct device *dev,
 			  struct drm_crtc_state *state);
-	void (*bgclr_in_on)(struct mtk_ddp_comp *comp);
-	void (*bgclr_in_off)(struct mtk_ddp_comp *comp);
-	void (*ctm_set)(struct mtk_ddp_comp *comp,
+	void (*bgclr_in_on)(struct device *dev);
+	void (*bgclr_in_off)(struct device *dev);
+	void (*ctm_set)(struct device *dev,
 			struct drm_crtc_state *state);
 };
 
@@ -125,39 +125,39 @@ static inline void mtk_ddp_comp_config(struct mtk_ddp_comp *comp,
 				       struct cmdq_pkt *cmdq_pkt)
 {
 	if (comp->funcs && comp->funcs->config)
-		comp->funcs->config(comp, w, h, vrefresh, bpc, cmdq_pkt);
+		comp->funcs->config(comp->dev, w, h, vrefresh, bpc, cmdq_pkt);
 }
 
 static inline void mtk_ddp_comp_start(struct mtk_ddp_comp *comp)
 {
 	if (comp->funcs && comp->funcs->start)
-		comp->funcs->start(comp);
+		comp->funcs->start(comp->dev);
 }
 
 static inline void mtk_ddp_comp_stop(struct mtk_ddp_comp *comp)
 {
 	if (comp->funcs && comp->funcs->stop)
-		comp->funcs->stop(comp);
+		comp->funcs->stop(comp->dev);
 }
 
 static inline void mtk_ddp_comp_enable_vblank(struct mtk_ddp_comp *comp,
 					      struct drm_crtc *crtc)
 {
 	if (comp->funcs && comp->funcs->enable_vblank)
-		comp->funcs->enable_vblank(comp, crtc);
+		comp->funcs->enable_vblank(comp->dev, crtc);
 }
 
 static inline void mtk_ddp_comp_disable_vblank(struct mtk_ddp_comp *comp)
 {
 	if (comp->funcs && comp->funcs->disable_vblank)
-		comp->funcs->disable_vblank(comp);
+		comp->funcs->disable_vblank(comp->dev);
 }
 
 static inline
 unsigned int mtk_ddp_comp_supported_rotations(struct mtk_ddp_comp *comp)
 {
 	if (comp->funcs && comp->funcs->supported_rotations)
-		return comp->funcs->supported_rotations(comp);
+		return comp->funcs->supported_rotations(comp->dev);
 
 	return 0;
 }
@@ -165,7 +165,7 @@ unsigned int mtk_ddp_comp_supported_rotations(struct mtk_ddp_comp *comp)
 static inline unsigned int mtk_ddp_comp_layer_nr(struct mtk_ddp_comp *comp)
 {
 	if (comp->funcs && comp->funcs->layer_nr)
-		return comp->funcs->layer_nr(comp);
+		return comp->funcs->layer_nr(comp->dev);
 
 	return 0;
 }
@@ -175,7 +175,7 @@ static inline int mtk_ddp_comp_layer_check(struct mtk_ddp_comp *comp,
 					   struct mtk_plane_state *state)
 {
 	if (comp->funcs && comp->funcs->layer_check)
-		return comp->funcs->layer_check(comp, idx, state);
+		return comp->funcs->layer_check(comp->dev, idx, state);
 	return 0;
 }
 
@@ -185,33 +185,33 @@ static inline void mtk_ddp_comp_layer_config(struct mtk_ddp_comp *comp,
 					     struct cmdq_pkt *cmdq_pkt)
 {
 	if (comp->funcs && comp->funcs->layer_config)
-		comp->funcs->layer_config(comp, idx, state, cmdq_pkt);
+		comp->funcs->layer_config(comp->dev, idx, state, cmdq_pkt);
 }
 
 static inline void mtk_ddp_gamma_set(struct mtk_ddp_comp *comp,
 				     struct drm_crtc_state *state)
 {
 	if (comp->funcs && comp->funcs->gamma_set)
-		comp->funcs->gamma_set(comp, state);
+		comp->funcs->gamma_set(comp->dev, state);
 }
 
 static inline void mtk_ddp_comp_bgclr_in_on(struct mtk_ddp_comp *comp)
 {
 	if (comp->funcs && comp->funcs->bgclr_in_on)
-		comp->funcs->bgclr_in_on(comp);
+		comp->funcs->bgclr_in_on(comp->dev);
 }
 
 static inline void mtk_ddp_comp_bgclr_in_off(struct mtk_ddp_comp *comp)
 {
 	if (comp->funcs && comp->funcs->bgclr_in_off)
-		comp->funcs->bgclr_in_off(comp);
+		comp->funcs->bgclr_in_off(comp->dev);
 }
 
 static inline void mtk_ddp_ctm_set(struct mtk_ddp_comp *comp,
 				   struct drm_crtc_state *state)
 {
 	if (comp->funcs && comp->funcs->ctm_set)
-		comp->funcs->ctm_set(comp, state);
+		comp->funcs->ctm_set(comp->dev, state);
 }
 
 int mtk_ddp_comp_get_id(struct device_node *node,
@@ -222,8 +222,6 @@ int mtk_ddp_comp_init(struct device_node *comp_node, struct mtk_ddp_comp *comp,
 		      enum mtk_ddp_comp_id comp_id, const struct mtk_ddp_comp_funcs *funcs);
 int mtk_ddp_comp_register(struct drm_device *drm, struct mtk_ddp_comp *comp);
 void mtk_ddp_comp_unregister(struct drm_device *drm, struct mtk_ddp_comp *comp);
-void mtk_dither_set(struct mtk_ddp_comp *comp, unsigned int bpc,
-		    unsigned int CFG, struct cmdq_pkt *cmdq_pkt);
 enum mtk_ddp_comp_type mtk_ddp_comp_get_type(enum mtk_ddp_comp_id comp_id);
 void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 		   struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 86109698f19c..5f36a4ad31d2 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -784,16 +784,16 @@ static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
 	.mode_set = mtk_dsi_bridge_mode_set,
 };
 
-static void mtk_dsi_ddp_start(struct mtk_ddp_comp *comp)
+static void mtk_dsi_ddp_start(struct device *dev)
 {
-	struct mtk_dsi *dsi = container_of(comp, struct mtk_dsi, ddp_comp);
+	struct mtk_dsi *dsi = dev_get_drvdata(dev);
 
 	mtk_dsi_poweron(dsi);
 }
 
-static void mtk_dsi_ddp_stop(struct mtk_ddp_comp *comp)
+static void mtk_dsi_ddp_stop(struct device *dev)
 {
-	struct mtk_dsi *dsi = container_of(comp, struct mtk_dsi, ddp_comp);
+	struct mtk_dsi *dsi = dev_get_drvdata(dev);
 
 	mtk_dsi_poweroff(dsi);
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
