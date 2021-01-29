Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BF93094D3
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 12:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485426ECB4;
	Sat, 30 Jan 2021 11:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FEB6EAAD
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 09:22:25 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id o63so6236224pgo.6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 01:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tsykwTB+PJK4+jNthJ9clS38CKUwWMWt8DUQDiXUEnE=;
 b=DeriE/gJOJ8oopjTYUrQAi9X+IrZ+ZN1eLE75RYLrIXJ1FLYdAyvGVpwFqME9M8M0z
 jSZHAQeslVXEm7O8qctEm0UdVIHgV8/KZ/85WuD4WlQW295x8YCKjPLX71gevOnxpnBb
 pPdcX4YCjqv4XuI+0u7d3YAAeyEPAKGYirZQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tsykwTB+PJK4+jNthJ9clS38CKUwWMWt8DUQDiXUEnE=;
 b=O4+Fb7s550oByhLYzfAZ8W8enc8BNH5P88UA77aaNvwe4s2sJ+KHLQUpHcAckxdPoK
 1i0X90u58r3+8D9qG2Of1RZn+hZsr69akHq2EHAOax9PwiMGalsjqp6ORpUvJLtwnYLw
 3wa+0s4EX0j2DG2pwfpoCLOwx+ahjYhUZmxg4wg5Zt9xFgaPxzDrBlrt2PBSaKbjBF4+
 6F8e5L1oZkMk/Pvns0WxjPAL2mneROFpz4nJmXreIjsEzVHk39rJTewHZtoban4WVJit
 a99mMadzaKM8iPi76CaNIcaSJrImhLnfN8xSyTsMuO7famA3Qx3wtDRtam66d1jS1BcN
 vdNA==
X-Gm-Message-State: AOAM531ykwrFv7KPMJzgPxrZrFVrb2SxrhKlpXGTh955AqR0PBzevQda
 S9oqZVPJqVP7t8Le9as2WmQY+Q==
X-Google-Smtp-Source: ABdhPJwg5ovjcR2HleUebnXAByorJYoubkvTgaBBfDeuQ85B/ovbXEnU4UgJOG1Pm4URBTUrQ/TyrA==
X-Received: by 2002:a63:ef14:: with SMTP id u20mr3802037pgh.93.1611912145177; 
 Fri, 29 Jan 2021 01:22:25 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id p7sm8032776pfn.52.2021.01.29.01.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 01:22:24 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v13 4/8] drm/mediatek: separate gamma module
Date: Fri, 29 Jan 2021 17:22:05 +0800
Message-Id: <20210129092209.2584718-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210129092209.2584718-1-hsinyi@chromium.org>
References: <20210129092209.2584718-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 30 Jan 2021 11:28:31 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

mt8183 gamma module will different with mt8173
separate gamma for add private data

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile           |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  10 +
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 191 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  71 ++------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 6 files changed, 217 insertions(+), 61 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_gamma.c

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 01d06332f7679..b64674b944860 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 mediatek-drm-y := mtk_disp_color.o \
+		  mtk_disp_gamma.o \
 		  mtk_disp_ovl.o \
 		  mtk_disp_rdma.o \
 		  mtk_drm_crtc.o \
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 9e5537f76b22a..02191010699f8 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -27,6 +27,16 @@ void mtk_dpi_stop(struct device *dev);
 void mtk_dsi_ddp_start(struct device *dev);
 void mtk_dsi_ddp_stop(struct device *dev);
 
+int mtk_gamma_clk_enable(struct device *dev);
+void mtk_gamma_clk_disable(struct device *dev);
+void mtk_gamma_config(struct device *dev, unsigned int w,
+                      unsigned int h, unsigned int vrefresh,
+                      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state);
+void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state);
+void mtk_gamma_start(struct device *dev);
+void mtk_gamma_stop(struct device *dev);
+
 void mtk_ovl_bgclr_in_on(struct device *dev);
 void mtk_ovl_bgclr_in_off(struct device *dev);
 void mtk_ovl_bypass_shadow(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
new file mode 100644
index 0000000000000..6b520807921e3
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -0,0 +1,191 @@
+/*
+ * SPDX-License-Identifier:
+ *
+ * Copyright (c) 2020 MediaTek Inc.
+ */
+
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+
+#include "mtk_disp_drv.h"
+#include "mtk_drm_crtc.h"
+#include "mtk_drm_ddp_comp.h"
+
+#define DISP_GAMMA_EN				0x0000
+#define GAMMA_EN					BIT(0)
+#define DISP_GAMMA_CFG				0x0020
+#define GAMMA_LUT_EN					BIT(1)
+#define GAMMA_DITHERING					BIT(2)
+#define DISP_GAMMA_SIZE				0x0030
+#define DISP_GAMMA_LUT				0x0700
+
+#define LUT_10BIT_MASK				0x03ff
+
+struct mtk_disp_gamma_data {
+	u32 reserved;
+};
+
+/**
+ * struct mtk_disp_gamma - DISP_GAMMA driver structure
+ * @ddp_comp - structure containing type enum and hardware resources
+ * @crtc - associated crtc to report irq events to
+ */
+struct mtk_disp_gamma {
+	struct clk *clk;
+	void __iomem *regs;
+	struct cmdq_client_reg cmdq_reg;
+	const struct mtk_disp_gamma_data *data;
+};
+
+int mtk_gamma_clk_enable(struct device *dev)
+{
+	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(gamma->clk);
+}
+
+void mtk_gamma_clk_disable(struct device *dev)
+{
+	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(gamma->clk);
+}
+
+void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state)
+{
+	unsigned int i, reg;
+	struct drm_color_lut *lut;
+	void __iomem *lut_base;
+	u32 word;
+
+	if (state->gamma_lut) {
+		reg = readl(regs + DISP_GAMMA_CFG);
+		reg = reg | GAMMA_LUT_EN;
+		writel(reg, regs + DISP_GAMMA_CFG);
+		lut_base = regs + DISP_GAMMA_LUT;
+		lut = (struct drm_color_lut *)state->gamma_lut->data;
+		for (i = 0; i < MTK_LUT_SIZE; i++) {
+			word = (((lut[i].red >> 6) & LUT_10BIT_MASK) << 20) +
+				(((lut[i].green >> 6) & LUT_10BIT_MASK) << 10) +
+				((lut[i].blue >> 6) & LUT_10BIT_MASK);
+			writel(word, (lut_base + i * 4));
+		}
+	}
+}
+
+void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
+{
+	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
+
+	mtk_gamma_set_common(gamma->regs, state);
+}
+
+void mtk_gamma_config(struct device *dev, unsigned int w,
+		      unsigned int h, unsigned int vrefresh,
+		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
+
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &gamma->cmdq_reg, gamma->regs,
+		      DISP_GAMMA_SIZE);
+	mtk_dither_set_common(gamma->regs, &gamma->cmdq_reg, bpc, DISP_GAMMA_CFG,
+			      GAMMA_DITHERING, cmdq_pkt);
+}
+
+void mtk_gamma_start(struct device *dev)
+{
+	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
+
+	writel(GAMMA_EN, gamma->regs + DISP_GAMMA_EN);
+}
+
+void mtk_gamma_stop(struct device *dev)
+{
+	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
+
+	writel_relaxed(0x0, gamma->regs + DISP_GAMMA_EN);
+}
+
+static int mtk_disp_gamma_bind(struct device *dev, struct device *master,
+			       void *data)
+{
+	return 0;
+}
+
+static void mtk_disp_gamma_unbind(struct device *dev, struct device *master,
+				  void *data)
+{
+}
+
+static const struct component_ops mtk_disp_gamma_component_ops = {
+	.bind	= mtk_disp_gamma_bind,
+	.unbind = mtk_disp_gamma_unbind,
+};
+
+static int mtk_disp_gamma_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_disp_gamma *priv;
+	struct resource *res;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(dev, "failed to get gamma clk\n");
+		return PTR_ERR(priv->clk);
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->regs)) {
+		dev_err(dev, "failed to ioremap gamma\n");
+		return PTR_ERR(priv->regs);
+	}
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
+	if (ret)
+		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
+#endif
+
+	priv->data = of_device_get_match_data(dev);
+	platform_set_drvdata(pdev, priv);
+
+	ret = component_add(dev, &mtk_disp_gamma_component_ops);
+	if (ret)
+		dev_err(dev, "Failed to add component: %d\n", ret);
+
+	return ret;
+}
+
+static int mtk_disp_gamma_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &mtk_disp_gamma_component_ops);
+
+	return 0;
+}
+
+static const struct of_device_id mtk_disp_gamma_driver_dt_match[] = {
+	{ .compatible = "mediatek,mt8173-disp-gamma"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_disp_gamma_driver_dt_match);
+
+struct platform_driver mtk_disp_gamma_driver = {
+	.probe		= mtk_disp_gamma_probe,
+	.remove		= mtk_disp_gamma_remove,
+	.driver		= {
+		.name	= "mediatek-disp-gamma",
+		.owner	= THIS_MODULE,
+		.of_match_table = mtk_disp_gamma_driver_dt_match,
+	},
+};
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 07804ab16f44d..ac2cb25620357 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -55,11 +55,6 @@
 #define DITHER_RELAY_MODE			BIT(0)
 #define DISP_DITHER_SIZE			0x0030
 
-#define DISP_GAMMA_EN				0x0000
-#define DISP_GAMMA_CFG				0x0020
-#define DISP_GAMMA_SIZE				0x0030
-#define DISP_GAMMA_LUT				0x0700
-
 #define LUT_10BIT_MASK				0x03ff
 
 #define OD_RELAYMODE				BIT(0)
@@ -68,9 +63,6 @@
 
 #define AAL_EN					BIT(0)
 
-#define GAMMA_EN				BIT(0)
-#define GAMMA_LUT_EN				BIT(1)
-
 #define DISP_DITHERING				BIT(2)
 #define DITHER_LSB_ERR_SHIFT_R(x)		(((x) & 0x7) << 28)
 #define DITHER_OVFLW_BIT_R(x)			(((x) & 0x7) << 24)
@@ -151,7 +143,6 @@ static void mtk_ddp_clk_disable(struct device *dev)
 	clk_disable_unprepare(priv->clk);
 }
 
-
 void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
 			   unsigned int bpc, unsigned int cfg,
 			   unsigned int dither_en, struct cmdq_pkt *cmdq_pkt)
@@ -221,6 +212,13 @@ static void mtk_aal_config(struct device *dev, unsigned int w,
 	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_AAL_SIZE);
 }
 
+static void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+        mtk_gamma_set_common(priv->regs, state);
+}
+
 static void mtk_aal_start(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
@@ -335,58 +333,10 @@ static void mtk_dither_stop(struct device *dev)
 	writel_relaxed(0x0, priv->regs + DISP_DITHER_EN);
 }
 
-static void mtk_gamma_config(struct device *dev, unsigned int w,
-			     unsigned int h, unsigned int vrefresh,
-			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_GAMMA_SIZE);
-	mtk_dither_set(dev, bpc, DISP_GAMMA_CFG, cmdq_pkt);
-}
-
-static void mtk_gamma_start(struct device *dev)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	writel(GAMMA_EN, priv->regs  + DISP_GAMMA_EN);
-}
-
-static void mtk_gamma_stop(struct device *dev)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	writel_relaxed(0x0, priv->regs  + DISP_GAMMA_EN);
-}
-
-static void mtk_gamma_set(struct device *dev,
-			  struct drm_crtc_state *state)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-	unsigned int i, reg;
-	struct drm_color_lut *lut;
-	void __iomem *lut_base;
-	u32 word;
-
-	if (state->gamma_lut) {
-		reg = readl(priv->regs + DISP_GAMMA_CFG);
-		reg = reg | GAMMA_LUT_EN;
-		writel(reg, priv->regs + DISP_GAMMA_CFG);
-		lut_base = priv->regs + DISP_GAMMA_LUT;
-		lut = (struct drm_color_lut *)state->gamma_lut->data;
-		for (i = 0; i < MTK_LUT_SIZE; i++) {
-			word = (((lut[i].red >> 6) & LUT_10BIT_MASK) << 20) +
-				(((lut[i].green >> 6) & LUT_10BIT_MASK) << 10) +
-				((lut[i].blue >> 6) & LUT_10BIT_MASK);
-			writel(word, (lut_base + i * 4));
-		}
-	}
-}
-
 static const struct mtk_ddp_comp_funcs ddp_aal = {
 	.clk_enable = mtk_ddp_clk_enable,
 	.clk_disable = mtk_ddp_clk_disable,
-	.gamma_set = mtk_gamma_set,
+	.gamma_set = mtk_aal_gamma_set,
 	.config = mtk_aal_config,
 	.start = mtk_aal_start,
 	.stop = mtk_aal_stop,
@@ -427,8 +377,8 @@ static const struct mtk_ddp_comp_funcs ddp_dsi = {
 };
 
 static const struct mtk_ddp_comp_funcs ddp_gamma = {
-	.clk_enable = mtk_ddp_clk_enable,
-	.clk_disable = mtk_ddp_clk_disable,
+	.clk_enable = mtk_gamma_clk_enable,
+	.clk_disable = mtk_gamma_clk_disable,
 	.gamma_set = mtk_gamma_set,
 	.config = mtk_gamma_config,
 	.start = mtk_gamma_start,
@@ -644,6 +594,7 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 
 	if (type == MTK_DISP_BLS ||
 	    type == MTK_DISP_COLOR ||
+	    type == MTK_DISP_GAMMA ||
 	    type == MTK_DPI ||
 	    type == MTK_DSI ||
 	    type == MTK_DISP_OVL ||
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 5d39dd54255d1..279d3e6f11563 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -486,11 +486,12 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		private->comp_node[comp_id] = of_node_get(node);
 
 		/*
-		 * Currently only the COLOR, OVL, RDMA, DSI, and DPI blocks have
+		 * Currently only the COLOR, GAMMA, OVL, RDMA, DSI, and DPI blocks have
 		 * separate component platform drivers and initialize their own
 		 * DDP component structure. The others are initialized here.
 		 */
 		if (comp_type == MTK_DISP_COLOR ||
+		    comp_type == MTK_DISP_GAMMA ||
 		    comp_type == MTK_DISP_OVL ||
 		    comp_type == MTK_DISP_OVL_2L ||
 		    comp_type == MTK_DISP_RDMA ||
@@ -589,6 +590,7 @@ static struct platform_driver mtk_drm_platform_driver = {
 
 static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_disp_color_driver,
+	&mtk_disp_gamma_driver,
 	&mtk_disp_ovl_driver,
 	&mtk_disp_rdma_driver,
 	&mtk_dpi_driver,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index e8238fa4aa2ac..0e54e3d51014a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -47,6 +47,7 @@ struct mtk_drm_private {
 };
 
 extern struct platform_driver mtk_disp_color_driver;
+extern struct platform_driver mtk_disp_gamma_driver;
 extern struct platform_driver mtk_disp_ovl_driver;
 extern struct platform_driver mtk_disp_rdma_driver;
 extern struct platform_driver mtk_dpi_driver;
-- 
2.30.0.365.g02bc693789-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
