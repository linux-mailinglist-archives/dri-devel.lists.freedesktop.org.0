Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 184052A37DF
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 01:35:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9176E5D3;
	Tue,  3 Nov 2020 00:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303796E5D3
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 00:35:02 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 87B0A22268;
 Tue,  3 Nov 2020 00:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604363702;
 bh=weKbpvawc+1AbmFeTxLD3vbsXK6jocAsUHB5I1/Bj1o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S2LsrDMEdX47DPII6/54kGo5EaCS1XRoNh963rpIlb/VQ5gnMlVg1+hTM4ua8SzpC
 YdmDIUJJMKB7M1mSl86IqpU6ReGR2LLZjv+jAum65LYR5c/ZZqlD2oov1c8nLZHhiw
 ETrVwoA0cIHhz6aZkjpo8HlZoSRJ9RHuyfuBiCGs=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 10/11] drm/mediatek: DRM driver directly refer to sub driver's
 function
Date: Tue,  3 Nov 2020 08:34:21 +0800
Message-Id: <20201103003422.17838-11-chunkuang.hu@kernel.org>
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
sub driver should not directly call DRM driver's function. Let
DRM driver directly refer to sub driver's function so that sub
driver need not register these function to DRM driver.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_color.c   | 23 +++---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     | 69 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 68 +++++++-----------
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 46 +++++-------
 drivers/gpu/drm/mediatek/mtk_dpi.c          | 13 ++--
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 80 ++++++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  3 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c          | 13 ++--
 9 files changed, 193 insertions(+), 124 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_drv.h

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index cc11d857ba60..99a680164226 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
+#include "mtk_disp_drv.h"
 #include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 
@@ -42,23 +43,23 @@ struct mtk_disp_color {
 	const struct mtk_disp_color_data	*data;
 };
 
-static int mtk_color_clk_enable(struct device *dev)
+int mtk_color_clk_enable(struct device *dev)
 {
 	struct mtk_disp_color *color = dev_get_drvdata(dev);
 
 	return clk_prepare_enable(color->clk);
 }
 
-static void mtk_color_clk_disable(struct device *dev)
+void mtk_color_clk_disable(struct device *dev)
 {
 	struct mtk_disp_color *color = dev_get_drvdata(dev);
 
 	clk_disable_unprepare(color->clk);
 }
 
-static void mtk_color_config(struct device *dev, unsigned int w,
-			     unsigned int h, unsigned int vrefresh,
-			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+void mtk_color_config(struct device *dev, unsigned int w,
+		      unsigned int h, unsigned int vrefresh,
+		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_disp_color *color = dev_get_drvdata(dev);
 
@@ -66,7 +67,7 @@ static void mtk_color_config(struct device *dev, unsigned int w,
 	mtk_ddp_write(cmdq_pkt, h, &color->cmdq_reg, color->regs, DISP_COLOR_HEIGHT(color));
 }
 
-static void mtk_color_start(struct device *dev)
+void mtk_color_start(struct device *dev)
 {
 	struct mtk_disp_color *color = dev_get_drvdata(dev);
 
@@ -75,13 +76,6 @@ static void mtk_color_start(struct device *dev)
 	writel(0x1, color->regs + DISP_COLOR_START(color));
 }
 
-static const struct mtk_ddp_comp_funcs mtk_disp_color_funcs = {
-	.clk_enable = mtk_color_clk_enable,
-	.clk_disable = mtk_color_clk_disable,
-	.config = mtk_color_config,
-	.start = mtk_color_start,
-};
-
 static int mtk_disp_color_bind(struct device *dev, struct device *master,
 			       void *data)
 {
@@ -149,8 +143,7 @@ static int mtk_disp_color_probe(struct platform_device *pdev)
 		return comp_id;
 	}
 
-	ret = mtk_ddp_comp_init(dev->of_node, &priv->ddp_comp, comp_id,
-				&mtk_disp_color_funcs);
+	ret = mtk_ddp_comp_init(dev->of_node, &priv->ddp_comp, comp_id);
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
 			dev_err(dev, "Failed to initialize component: %d\n",
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
new file mode 100644
index 000000000000..46d199b7b4a2
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ */
+
+#ifndef _MTK_DISP_DRV_H_
+#define _MTK_DISP_DRV_H_
+
+#include <linux/soc/mediatek/mtk-cmdq.h>
+#include "mtk_drm_plane.h"
+
+void mtk_color_bypass_shadow(struct device *dev);
+int mtk_color_clk_enable(struct device *dev);
+void mtk_color_clk_disable(struct device *dev);
+void mtk_color_config(struct device *dev, unsigned int w,
+		      unsigned int h, unsigned int vrefresh,
+		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+void mtk_color_start(struct device *dev);
+
+void mtk_dpi_start(struct device *dev);
+void mtk_dpi_stop(struct device *dev);
+
+void mtk_dsi_ddp_start(struct device *dev);
+void mtk_dsi_ddp_stop(struct device *dev);
+
+void mtk_ovl_bgclr_in_on(struct device *dev);
+void mtk_ovl_bgclr_in_off(struct device *dev);
+void mtk_ovl_bypass_shadow(struct device *dev);
+int mtk_ovl_clk_enable(struct device *dev);
+void mtk_ovl_clk_disable(struct device *dev);
+void mtk_ovl_config(struct device *dev, unsigned int w,
+		    unsigned int h, unsigned int vrefresh,
+		    unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
+			struct mtk_plane_state *mtk_state);
+void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
+			  struct mtk_plane_state *state,
+			  struct cmdq_pkt *cmdq_pkt);
+unsigned int mtk_ovl_layer_nr(struct device *dev);
+void mtk_ovl_layer_on(struct device *dev, unsigned int idx,
+		      struct cmdq_pkt *cmdq_pkt);
+void mtk_ovl_layer_off(struct device *dev, unsigned int idx,
+		       struct cmdq_pkt *cmdq_pkt);
+void mtk_ovl_start(struct device *dev);
+void mtk_ovl_stop(struct device *dev);
+unsigned int mtk_ovl_supported_rotations(struct device *dev);
+void mtk_ovl_enable_vblank(struct device *dev,
+			   void (*vblank_cb)(void *),
+			   void *vblank_cb_data);
+void mtk_ovl_disable_vblank(struct device *dev);
+
+void mtk_rdma_bypass_shadow(struct device *dev);
+int mtk_rdma_clk_enable(struct device *dev);
+void mtk_rdma_clk_disable(struct device *dev);
+void mtk_rdma_config(struct device *dev, unsigned int width,
+		     unsigned int height, unsigned int vrefresh,
+		     unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+unsigned int mtk_rdma_layer_nr(struct device *dev);
+void mtk_rdma_layer_config(struct device *dev, unsigned int idx,
+			   struct mtk_plane_state *state,
+			   struct cmdq_pkt *cmdq_pkt);
+void mtk_rdma_start(struct device *dev);
+void mtk_rdma_stop(struct device *dev);
+void mtk_rdma_enable_vblank(struct device *dev,
+			    void (*vblank_cb)(void *),
+			    void *vblank_cb_data);
+void mtk_rdma_disable_vblank(struct device *dev);
+
+#endif
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index e07611edf5f0..d1ec5e19d1ff 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
+#include "mtk_disp_drv.h"
 #include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 
@@ -94,9 +95,9 @@ static irqreturn_t mtk_disp_ovl_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void mtk_ovl_enable_vblank(struct device *dev,
-				  void (*vblank_cb)(void *),
-				  void *vblank_cb_data)
+void mtk_ovl_enable_vblank(struct device *dev,
+			   void (*vblank_cb)(void *),
+			   void *vblank_cb_data)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
@@ -106,7 +107,7 @@ static void mtk_ovl_enable_vblank(struct device *dev,
 	writel_relaxed(OVL_FME_CPL_INT, ovl->regs + DISP_REG_OVL_INTEN);
 }
 
-static void mtk_ovl_disable_vblank(struct device *dev)
+void mtk_ovl_disable_vblank(struct device *dev)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
@@ -115,37 +116,37 @@ static void mtk_ovl_disable_vblank(struct device *dev)
 	writel_relaxed(0x0, ovl->regs + DISP_REG_OVL_INTEN);
 }
 
-static int mtk_ovl_clk_enable(struct device *dev)
+int mtk_ovl_clk_enable(struct device *dev)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
 	return clk_prepare_enable(ovl->clk);
 }
 
-static void mtk_ovl_clk_disable(struct device *dev)
+void mtk_ovl_clk_disable(struct device *dev)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
 	clk_disable_unprepare(ovl->clk);
 }
 
-static void mtk_ovl_start(struct device *dev)
+void mtk_ovl_start(struct device *dev)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
 	writel_relaxed(0x1, ovl->regs + DISP_REG_OVL_EN);
 }
 
-static void mtk_ovl_stop(struct device *dev)
+void mtk_ovl_stop(struct device *dev)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
 	writel_relaxed(0x0, ovl->regs + DISP_REG_OVL_EN);
 }
 
-static void mtk_ovl_config(struct device *dev, unsigned int w,
-			   unsigned int h, unsigned int vrefresh,
-			   unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+void mtk_ovl_config(struct device *dev, unsigned int w,
+		    unsigned int h, unsigned int vrefresh,
+		    unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
@@ -158,21 +159,21 @@ static void mtk_ovl_config(struct device *dev, unsigned int w,
 	mtk_ddp_write(cmdq_pkt, 0x0, &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_RST);
 }
 
-static unsigned int mtk_ovl_layer_nr(struct device *dev)
+unsigned int mtk_ovl_layer_nr(struct device *dev)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
 	return ovl->data->layer_nr;
 }
 
-static unsigned int mtk_ovl_supported_rotations(struct device *dev)
+unsigned int mtk_ovl_supported_rotations(struct device *dev)
 {
 	return DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180 |
 	       DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y;
 }
 
-static int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
-			       struct mtk_plane_state *mtk_state)
+int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
+			struct mtk_plane_state *mtk_state)
 {
 	struct drm_plane_state *state = &mtk_state->base;
 	unsigned int rotation = 0;
@@ -199,8 +200,8 @@ static int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
 	return 0;
 }
 
-static void mtk_ovl_layer_on(struct device *dev, unsigned int idx,
-			     struct cmdq_pkt *cmdq_pkt)
+void mtk_ovl_layer_on(struct device *dev, unsigned int idx,
+		      struct cmdq_pkt *cmdq_pkt)
 {
 	unsigned int gmc_thrshd_l;
 	unsigned int gmc_thrshd_h;
@@ -224,8 +225,8 @@ static void mtk_ovl_layer_on(struct device *dev, unsigned int idx,
 			   DISP_REG_OVL_SRC_CON, BIT(idx));
 }
 
-static void mtk_ovl_layer_off(struct device *dev, unsigned int idx,
-			      struct cmdq_pkt *cmdq_pkt)
+void mtk_ovl_layer_off(struct device *dev, unsigned int idx,
+		       struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
@@ -271,9 +272,9 @@ static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt)
 	}
 }
 
-static void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
-				 struct mtk_plane_state *state,
-				 struct cmdq_pkt *cmdq_pkt)
+void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
+			  struct mtk_plane_state *state,
+			  struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 	struct mtk_plane_pending_state *pending = &state->pending;
@@ -317,7 +318,7 @@ static void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 	mtk_ovl_layer_on(dev, idx, cmdq_pkt);
 }
 
-static void mtk_ovl_bgclr_in_on(struct device *dev)
+void mtk_ovl_bgclr_in_on(struct device *dev)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 	unsigned int reg;
@@ -327,7 +328,7 @@ static void mtk_ovl_bgclr_in_on(struct device *dev)
 	writel(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON);
 }
 
-static void mtk_ovl_bgclr_in_off(struct device *dev)
+void mtk_ovl_bgclr_in_off(struct device *dev)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 	unsigned int reg;
@@ -337,22 +338,6 @@ static void mtk_ovl_bgclr_in_off(struct device *dev)
 	writel(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON);
 }
 
-static const struct mtk_ddp_comp_funcs mtk_disp_ovl_funcs = {
-	.clk_enable = mtk_ovl_clk_enable,
-	.clk_disable = mtk_ovl_clk_disable,
-	.config = mtk_ovl_config,
-	.start = mtk_ovl_start,
-	.stop = mtk_ovl_stop,
-	.enable_vblank = mtk_ovl_enable_vblank,
-	.disable_vblank = mtk_ovl_disable_vblank,
-	.supported_rotations = mtk_ovl_supported_rotations,
-	.layer_nr = mtk_ovl_layer_nr,
-	.layer_check = mtk_ovl_layer_check,
-	.layer_config = mtk_ovl_layer_config,
-	.bgclr_in_on = mtk_ovl_bgclr_in_on,
-	.bgclr_in_off = mtk_ovl_bgclr_in_off,
-};
-
 static int mtk_disp_ovl_bind(struct device *dev, struct device *master,
 			     void *data)
 {
@@ -430,8 +415,7 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 		return comp_id;
 	}
 
-	ret = mtk_ddp_comp_init(dev->of_node, &priv->ddp_comp, comp_id,
-				&mtk_disp_ovl_funcs);
+	ret = mtk_ddp_comp_init(dev->of_node, &priv->ddp_comp, comp_id);
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
 			dev_err(dev, "Failed to initialize component: %d\n",
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index edffe25f14b4..5c5f04c2cc21 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
+#include "mtk_disp_drv.h"
 #include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 
@@ -94,9 +95,9 @@ static void rdma_update_bits(struct device *dev, unsigned int reg,
 	writel(tmp, rdma->regs + reg);
 }
 
-static void mtk_rdma_enable_vblank(struct device *dev,
-				   void (*vblank_cb)(void *),
-				   void *vblank_cb_data)
+void mtk_rdma_enable_vblank(struct device *dev,
+			    void (*vblank_cb)(void *),
+			    void *vblank_cb_data)
 {
 	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
 
@@ -106,7 +107,7 @@ static void mtk_rdma_enable_vblank(struct device *dev,
 			 RDMA_FRAME_END_INT);
 }
 
-static void mtk_rdma_disable_vblank(struct device *dev)
+void mtk_rdma_disable_vblank(struct device *dev)
 {
 	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
 
@@ -115,34 +116,34 @@ static void mtk_rdma_disable_vblank(struct device *dev)
 	rdma_update_bits(dev, DISP_REG_RDMA_INT_ENABLE, RDMA_FRAME_END_INT, 0);
 }
 
-static int mtk_rdma_clk_enable(struct device *dev)
+int mtk_rdma_clk_enable(struct device *dev)
 {
 	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
 
 	return clk_prepare_enable(rdma->clk);
 }
 
-static void mtk_rdma_clk_disable(struct device *dev)
+void mtk_rdma_clk_disable(struct device *dev)
 {
 	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
 
 	clk_disable_unprepare(rdma->clk);
 }
 
-static void mtk_rdma_start(struct device *dev)
+void mtk_rdma_start(struct device *dev)
 {
 	rdma_update_bits(dev, DISP_REG_RDMA_GLOBAL_CON, RDMA_ENGINE_EN,
 			 RDMA_ENGINE_EN);
 }
 
-static void mtk_rdma_stop(struct device *dev)
+void mtk_rdma_stop(struct device *dev)
 {
 	rdma_update_bits(dev, DISP_REG_RDMA_GLOBAL_CON, RDMA_ENGINE_EN, 0);
 }
 
-static void mtk_rdma_config(struct device *dev, unsigned int width,
-			    unsigned int height, unsigned int vrefresh,
-			    unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+void mtk_rdma_config(struct device *dev, unsigned int width,
+		     unsigned int height, unsigned int vrefresh,
+		     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
 	unsigned int threshold;
 	unsigned int reg;
@@ -203,14 +204,14 @@ static unsigned int rdma_fmt_convert(struct mtk_disp_rdma *rdma,
 	}
 }
 
-static unsigned int mtk_rdma_layer_nr(struct device *dev)
+unsigned int mtk_rdma_layer_nr(struct device *dev)
 {
 	return 1;
 }
 
-static void mtk_rdma_layer_config(struct device *dev, unsigned int idx,
-				  struct mtk_plane_state *state,
-				  struct cmdq_pkt *cmdq_pkt)
+void mtk_rdma_layer_config(struct device *dev, unsigned int idx,
+			   struct mtk_plane_state *state,
+			   struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
 	struct mtk_plane_pending_state *pending = &state->pending;
@@ -245,18 +246,6 @@ static void mtk_rdma_layer_config(struct device *dev, unsigned int idx,
 
 }
 
-static const struct mtk_ddp_comp_funcs mtk_disp_rdma_funcs = {
-	.clk_enable = mtk_rdma_clk_enable,
-	.clk_disable = mtk_rdma_clk_disable,
-	.config = mtk_rdma_config,
-	.start = mtk_rdma_start,
-	.stop = mtk_rdma_stop,
-	.enable_vblank = mtk_rdma_enable_vblank,
-	.disable_vblank = mtk_rdma_disable_vblank,
-	.layer_nr = mtk_rdma_layer_nr,
-	.layer_config = mtk_rdma_layer_config,
-};
-
 static int mtk_disp_rdma_bind(struct device *dev, struct device *master,
 			      void *data)
 {
@@ -330,8 +319,7 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 		return comp_id;
 	}
 
-	ret = mtk_ddp_comp_init(dev->of_node, &priv->ddp_comp, comp_id,
-				&mtk_disp_rdma_funcs);
+	ret = mtk_ddp_comp_init(dev->of_node, &priv->ddp_comp, comp_id);
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
 			dev_err(dev, "Failed to initialize component: %d\n",
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index d8d83e8ef3f3..4d0d84d34fb1 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -24,6 +24,7 @@
 #include <drm/drm_of.h>
 #include <drm/drm_simple_kms_helper.h>
 
+#include "mtk_disp_drv.h"
 #include "mtk_dpi_regs.h"
 #include "mtk_drm_ddp_comp.h"
 
@@ -571,25 +572,20 @@ static const struct drm_bridge_funcs mtk_dpi_bridge_funcs = {
 	.enable = mtk_dpi_bridge_enable,
 };
 
-static void mtk_dpi_start(struct device *dev)
+void mtk_dpi_start(struct device *dev)
 {
 	struct mtk_dpi *dpi = dev_get_drvdata(dev);
 
 	mtk_dpi_power_on(dpi);
 }
 
-static void mtk_dpi_stop(struct device *dev)
+void mtk_dpi_stop(struct device *dev)
 {
 	struct mtk_dpi *dpi = dev_get_drvdata(dev);
 
 	mtk_dpi_power_off(dpi);
 }
 
-static const struct mtk_ddp_comp_funcs mtk_dpi_funcs = {
-	.start = mtk_dpi_start,
-	.stop = mtk_dpi_stop,
-};
-
 static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct mtk_dpi *dpi = dev_get_drvdata(dev);
@@ -784,8 +780,7 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return comp_id;
 	}
 
-	ret = mtk_ddp_comp_init(dev->of_node, &dpi->ddp_comp, comp_id,
-				&mtk_dpi_funcs);
+	ret = mtk_ddp_comp_init(dev->of_node, &dpi->ddp_comp, comp_id);
 	if (ret) {
 		dev_err(dev, "Failed to initialize component: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 7a7702730258..45ccb2ed9b4d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -14,6 +14,7 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include <drm/drm_print.h>
 
+#include "mtk_disp_drv.h"
 #include "mtk_drm_drv.h"
 #include "mtk_drm_plane.h"
 #include "mtk_drm_ddp_comp.h"
@@ -391,6 +392,13 @@ static const struct mtk_ddp_comp_funcs ddp_ccorr = {
 	.ctm_set = mtk_ccorr_ctm_set,
 };
 
+static const struct mtk_ddp_comp_funcs ddp_color = {
+	.clk_enable = mtk_color_clk_enable,
+	.clk_disable = mtk_color_clk_disable,
+	.config = mtk_color_config,
+	.start = mtk_color_start,
+};
+
 static const struct mtk_ddp_comp_funcs ddp_dither = {
 	.clk_enable = mtk_ddp_clk_enable,
 	.clk_disable = mtk_ddp_clk_disable,
@@ -399,6 +407,16 @@ static const struct mtk_ddp_comp_funcs ddp_dither = {
 	.stop = mtk_dither_stop,
 };
 
+static const struct mtk_ddp_comp_funcs ddp_dpi = {
+	.start = mtk_dpi_start,
+	.stop = mtk_dpi_stop,
+};
+
+static const struct mtk_ddp_comp_funcs ddp_dsi = {
+	.start = mtk_dsi_ddp_start,
+	.stop = mtk_dsi_ddp_stop,
+};
+
 static const struct mtk_ddp_comp_funcs ddp_gamma = {
 	.clk_enable = mtk_ddp_clk_enable,
 	.clk_disable = mtk_ddp_clk_disable,
@@ -415,6 +433,34 @@ static const struct mtk_ddp_comp_funcs ddp_od = {
 	.start = mtk_od_start,
 };
 
+static const struct mtk_ddp_comp_funcs ddp_ovl = {
+	.clk_enable = mtk_ovl_clk_enable,
+	.clk_disable = mtk_ovl_clk_disable,
+	.config = mtk_ovl_config,
+	.start = mtk_ovl_start,
+	.stop = mtk_ovl_stop,
+	.enable_vblank = mtk_ovl_enable_vblank,
+	.disable_vblank = mtk_ovl_disable_vblank,
+	.supported_rotations = mtk_ovl_supported_rotations,
+	.layer_nr = mtk_ovl_layer_nr,
+	.layer_check = mtk_ovl_layer_check,
+	.layer_config = mtk_ovl_layer_config,
+	.bgclr_in_on = mtk_ovl_bgclr_in_on,
+	.bgclr_in_off = mtk_ovl_bgclr_in_off,
+};
+
+static const struct mtk_ddp_comp_funcs ddp_rdma = {
+	.clk_enable = mtk_rdma_clk_enable,
+	.clk_disable = mtk_rdma_clk_disable,
+	.config = mtk_rdma_config,
+	.start = mtk_rdma_start,
+	.stop = mtk_rdma_stop,
+	.enable_vblank = mtk_rdma_enable_vblank,
+	.disable_vblank = mtk_rdma_disable_vblank,
+	.layer_nr = mtk_rdma_layer_nr,
+	.layer_config = mtk_rdma_layer_config,
+};
+
 static const struct mtk_ddp_comp_funcs ddp_ufoe = {
 	.clk_enable = mtk_ddp_clk_enable,
 	.clk_disable = mtk_ddp_clk_disable,
@@ -451,28 +497,28 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL1]	= { MTK_DISP_AAL,	1, &ddp_aal },
 	[DDP_COMPONENT_BLS]	= { MTK_DISP_BLS,	0, NULL },
 	[DDP_COMPONENT_CCORR]	= { MTK_DISP_CCORR,	0, &ddp_ccorr },
-	[DDP_COMPONENT_COLOR0]	= { MTK_DISP_COLOR,	0, NULL },
-	[DDP_COMPONENT_COLOR1]	= { MTK_DISP_COLOR,	1, NULL },
+	[DDP_COMPONENT_COLOR0]	= { MTK_DISP_COLOR,	0, &ddp_color },
+	[DDP_COMPONENT_COLOR1]	= { MTK_DISP_COLOR,	1, &ddp_color },
 	[DDP_COMPONENT_DITHER]	= { MTK_DISP_DITHER,	0, &ddp_dither },
-	[DDP_COMPONENT_DPI0]	= { MTK_DPI,		0, NULL },
-	[DDP_COMPONENT_DPI1]	= { MTK_DPI,		1, NULL },
-	[DDP_COMPONENT_DSI0]	= { MTK_DSI,		0, NULL },
-	[DDP_COMPONENT_DSI1]	= { MTK_DSI,		1, NULL },
-	[DDP_COMPONENT_DSI2]	= { MTK_DSI,		2, NULL },
-	[DDP_COMPONENT_DSI3]	= { MTK_DSI,		3, NULL },
+	[DDP_COMPONENT_DPI0]	= { MTK_DPI,		0, &ddp_dpi },
+	[DDP_COMPONENT_DPI1]	= { MTK_DPI,		1, &ddp_dpi },
+	[DDP_COMPONENT_DSI0]	= { MTK_DSI,		0, &ddp_dsi },
+	[DDP_COMPONENT_DSI1]	= { MTK_DSI,		1, &ddp_dsi },
+	[DDP_COMPONENT_DSI2]	= { MTK_DSI,		2, &ddp_dsi },
+	[DDP_COMPONENT_DSI3]	= { MTK_DSI,		3, &ddp_dsi },
 	[DDP_COMPONENT_GAMMA]	= { MTK_DISP_GAMMA,	0, &ddp_gamma },
 	[DDP_COMPONENT_OD0]	= { MTK_DISP_OD,	0, &ddp_od },
 	[DDP_COMPONENT_OD1]	= { MTK_DISP_OD,	1, &ddp_od },
-	[DDP_COMPONENT_OVL0]	= { MTK_DISP_OVL,	0, NULL },
-	[DDP_COMPONENT_OVL1]	= { MTK_DISP_OVL,	1, NULL },
-	[DDP_COMPONENT_OVL_2L0]	= { MTK_DISP_OVL_2L,	0, NULL },
-	[DDP_COMPONENT_OVL_2L1]	= { MTK_DISP_OVL_2L,	1, NULL },
+	[DDP_COMPONENT_OVL0]	= { MTK_DISP_OVL,	0, &ddp_ovl },
+	[DDP_COMPONENT_OVL1]	= { MTK_DISP_OVL,	1, &ddp_ovl },
+	[DDP_COMPONENT_OVL_2L0]	= { MTK_DISP_OVL_2L,	0, &ddp_ovl },
+	[DDP_COMPONENT_OVL_2L1]	= { MTK_DISP_OVL_2L,	1, &ddp_ovl },
 	[DDP_COMPONENT_PWM0]	= { MTK_DISP_PWM,	0, NULL },
 	[DDP_COMPONENT_PWM1]	= { MTK_DISP_PWM,	1, NULL },
 	[DDP_COMPONENT_PWM2]	= { MTK_DISP_PWM,	2, NULL },
-	[DDP_COMPONENT_RDMA0]	= { MTK_DISP_RDMA,	0, NULL },
-	[DDP_COMPONENT_RDMA1]	= { MTK_DISP_RDMA,	1, NULL },
-	[DDP_COMPONENT_RDMA2]	= { MTK_DISP_RDMA,	2, NULL },
+	[DDP_COMPONENT_RDMA0]	= { MTK_DISP_RDMA,	0, &ddp_rdma },
+	[DDP_COMPONENT_RDMA1]	= { MTK_DISP_RDMA,	1, &ddp_rdma },
+	[DDP_COMPONENT_RDMA2]	= { MTK_DISP_RDMA,	2, &ddp_rdma },
 	[DDP_COMPONENT_UFOE]	= { MTK_DISP_UFOE,	0, &ddp_ufoe },
 	[DDP_COMPONENT_WDMA0]	= { MTK_DISP_WDMA,	0, NULL },
 	[DDP_COMPONENT_WDMA1]	= { MTK_DISP_WDMA,	1, NULL },
@@ -530,7 +576,7 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
 }
 
 int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
-		      enum mtk_ddp_comp_id comp_id, const struct mtk_ddp_comp_funcs *funcs)
+		      enum mtk_ddp_comp_id comp_id)
 {
 	struct platform_device *comp_pdev;
 	enum mtk_ddp_comp_type type;
@@ -547,7 +593,7 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	type = mtk_ddp_matches[comp_id].type;
 
 	comp->id = comp_id;
-	comp->funcs = funcs ?: mtk_ddp_matches[comp_id].funcs;
+	comp->funcs = mtk_ddp_matches[comp_id].funcs;
 	comp_pdev = of_find_device_by_node(node);
 	if (!comp_pdev) {
 		DRM_INFO("Waiting for device %s\n", node->full_name);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 56fbd5d2f650..03db5fb4fc56 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -222,7 +222,7 @@ int mtk_ddp_comp_get_id(struct device_node *node,
 unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
 						struct mtk_ddp_comp ddp_comp);
 int mtk_ddp_comp_init(struct device_node *comp_node, struct mtk_ddp_comp *comp,
-		      enum mtk_ddp_comp_id comp_id, const struct mtk_ddp_comp_funcs *funcs);
+		      enum mtk_ddp_comp_id comp_id);
 int mtk_ddp_comp_register(struct drm_device *drm, struct mtk_ddp_comp *comp);
 void mtk_ddp_comp_unregister(struct drm_device *drm, struct mtk_ddp_comp *comp);
 enum mtk_ddp_comp_type mtk_ddp_comp_get_type(enum mtk_ddp_comp_id comp_id);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index e4a8769f200f..d0a4bac846c2 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -538,8 +538,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 				goto err_node;
 			}
 
-			ret = mtk_ddp_comp_init(node, comp,
-						comp_id, NULL);
+			ret = mtk_ddp_comp_init(node, comp, comp_id);
 			if (ret) {
 				of_node_put(node);
 				goto err_node;
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 5f36a4ad31d2..50f8d803f8dd 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -25,6 +25,7 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
+#include "mtk_disp_drv.h"
 #include "mtk_drm_ddp_comp.h"
 
 #define DSI_START		0x00
@@ -784,25 +785,20 @@ static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
 	.mode_set = mtk_dsi_bridge_mode_set,
 };
 
-static void mtk_dsi_ddp_start(struct device *dev)
+void mtk_dsi_ddp_start(struct device *dev)
 {
 	struct mtk_dsi *dsi = dev_get_drvdata(dev);
 
 	mtk_dsi_poweron(dsi);
 }
 
-static void mtk_dsi_ddp_stop(struct device *dev)
+void mtk_dsi_ddp_stop(struct device *dev)
 {
 	struct mtk_dsi *dsi = dev_get_drvdata(dev);
 
 	mtk_dsi_poweroff(dsi);
 }
 
-static const struct mtk_ddp_comp_funcs mtk_dsi_funcs = {
-	.start = mtk_dsi_ddp_start,
-	.stop = mtk_dsi_ddp_stop,
-};
-
 static int mtk_dsi_host_attach(struct mipi_dsi_host *host,
 			       struct mipi_dsi_device *device)
 {
@@ -1114,8 +1110,7 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 		goto err_unregister_host;
 	}
 
-	ret = mtk_ddp_comp_init(dev->of_node, &dsi->ddp_comp, comp_id,
-				&mtk_dsi_funcs);
+	ret = mtk_ddp_comp_init(dev->of_node, &dsi->ddp_comp, comp_id);
 	if (ret) {
 		dev_err(dev, "Failed to initialize component: %d\n", ret);
 		goto err_unregister_host;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
