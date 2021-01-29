Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 829E03086D3
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 09:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AAD06EA85;
	Fri, 29 Jan 2021 08:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9F76EA81
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 07:34:54 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id r38so6073491pgk.13
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 23:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hsc3NHOEG7XFB4U+FbPtkmnYEmMsSvKWKQLaQsNBveQ=;
 b=HdmxW7D2HTaHpc7S8H8zqjqrbIQ8L7wbFquNtQJvg4XauaH6cn1AGhyp7H9YCO9Fr/
 QM34cyluDYBAIneD31b74YaL5dKBFFTRcM7ykayGYv5DiMrhhzNoGRdVr8v0DgdmIvpi
 heZGJ6x1lvnDf2XZMyN8kTFahtk6fFq6dXe5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hsc3NHOEG7XFB4U+FbPtkmnYEmMsSvKWKQLaQsNBveQ=;
 b=j6GT5OoWrVEf4gMjdAeuuW+NPnYa7wX7AZm3zvCEpNtGenOcs/l/rsKSFtXLpbFj2E
 9p3JsBF1rQHe/uJm+LhG2Mz8cR/7vSICJDQJ2njz1vnMybBFnR1e19scBTyTZ1I2JsvN
 wAhWkMjKiUQNSgI2pSVwDS0wu9ImK5AInMonzXtBo/0TGzViL5Q6Y7cNRuLhJfBcWCdJ
 jwhGdLAs/+b3y7JWm+KsPaztNVxnFf0CA0dYYoQPA2fTOMa+Bfgwp9rYP3HujGsnnMde
 CBPGb0G1D4RWc0i1Bnq5bMYdqvQufzdB64ItJ2GOLrcvqOCjyrOn+2dbOg905qIAGY0U
 urhw==
X-Gm-Message-State: AOAM531Fi1agkSUf+DtD//55oTDofu4w2tbajzQIqmMszlTGW0A2DWs7
 Lq9/Z1XuBznpQTFd27ztwOUU8A==
X-Google-Smtp-Source: ABdhPJwnIKdS/SMOASIFdeI1KyO3yXHWYI/hbArDhX/zPw9eXmCar/NxXbjdxHjciLF4KaCUOGyheQ==
X-Received: by 2002:aa7:9d9d:0:b029:1bc:99ed:3ca2 with SMTP id
 f29-20020aa79d9d0000b02901bc99ed3ca2mr3139255pfq.21.1611905694237; 
 Thu, 28 Jan 2021 23:34:54 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id p1sm7689980pfn.21.2021.01.28.23.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 23:34:53 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 5/8] drm/mediatek: separate ccorr module
Date: Fri, 29 Jan 2021 15:34:33 +0800
Message-Id: <20210129073436.2429834-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210129073436.2429834-1-hsinyi@chromium.org>
References: <20210129073436.2429834-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 29 Jan 2021 08:11:32 +0000
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

ccorr ctm matrix bits will be different in mt8192

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/Makefile           |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c   | 222 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   9 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  95 +--------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   8 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 6 files changed, 242 insertions(+), 96 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 13a0eafabf9c0..f119bef6d6e66 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
-mediatek-drm-y := mtk_disp_color.o \
+mediatek-drm-y := mtk_disp_ccorr.o \
+		  mtk_disp_color.o \
 		  mtk_disp_gamma.o \
 		  mtk_disp_ovl.o \
 		  mtk_disp_postmask.o \
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
new file mode 100644
index 0000000000000..0c68090eb1e92
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -0,0 +1,222 @@
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
+#include <linux/pm_runtime.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+
+#include "mtk_disp_drv.h"
+#include "mtk_drm_crtc.h"
+#include "mtk_drm_ddp_comp.h"
+
+#define DISP_CCORR_EN				0x0000
+#define CCORR_EN					BIT(0)
+#define DISP_CCORR_CFG				0x0020
+#define CCORR_RELAY_MODE				BIT(0)
+#define CCORR_ENGINE_EN					BIT(1)
+#define CCORR_GAMMA_OFF					BIT(2)
+#define CCORR_WGAMUT_SRC_CLIP				BIT(3)
+#define DISP_CCORR_SIZE				0x0030
+#define DISP_CCORR_COEF_0			0x0080
+#define DISP_CCORR_COEF_1			0x0084
+#define DISP_CCORR_COEF_2			0x0088
+#define DISP_CCORR_COEF_3			0x008C
+#define DISP_CCORR_COEF_4			0x0090
+
+struct mtk_disp_ccorr_data {
+	u32 reserved;
+};
+
+/**
+ * struct mtk_disp_ccorr - DISP_CCORR driver structure
+ * @ddp_comp - structure containing type enum and hardware resources
+ * @crtc - associated crtc to report irq events to
+ */
+struct mtk_disp_ccorr {
+	struct clk *clk;
+	void __iomem *regs;
+	struct cmdq_client_reg cmdq_reg;
+	const struct mtk_disp_ccorr_data	*data;
+};
+
+int mtk_ccorr_clk_enable(struct device *dev)
+{
+	struct mtk_disp_ccorr *ccorr = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(ccorr->clk);
+}
+
+void mtk_ccorr_clk_disable(struct device *dev)
+{
+	struct mtk_disp_ccorr *ccorr = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(ccorr->clk);
+}
+
+void mtk_ccorr_config(struct device *dev, unsigned int w,
+			     unsigned int h, unsigned int vrefresh,
+			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_ccorr *ccorr = dev_get_drvdata(dev);
+
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, &ccorr->cmdq_reg, ccorr->regs,
+		      DISP_CCORR_SIZE);
+	mtk_ddp_write(cmdq_pkt, CCORR_ENGINE_EN, &ccorr->cmdq_reg, ccorr->regs,
+		      DISP_CCORR_CFG);
+}
+
+void mtk_ccorr_start(struct device *dev)
+{
+	struct mtk_disp_ccorr *ccorr = dev_get_drvdata(dev);
+
+	writel(CCORR_EN, ccorr->regs + DISP_CCORR_EN);
+}
+
+void mtk_ccorr_stop(struct device *dev)
+{
+	struct mtk_disp_ccorr *ccorr = dev_get_drvdata(dev);
+
+	writel_relaxed(0x0, ccorr->regs + DISP_CCORR_EN);
+}
+
+/* Converts a DRM S31.32 value to the HW S1.10 format. */
+static u16 mtk_ctm_s31_32_to_s1_10(u64 in)
+{
+	u16 r;
+
+	/* Sign bit. */
+	r = in & BIT_ULL(63) ? BIT(11) : 0;
+
+	if ((in & GENMASK_ULL(62, 33)) > 0) {
+		/* identity value 0x100000000 -> 0x400, */
+		/* if bigger this, set it to max 0x7ff. */
+		r |= GENMASK(10, 0);
+	} else {
+		/* take the 11 most important bits. */
+		r |= (in >> 22) & GENMASK(10, 0);
+	}
+
+	return r;
+}
+
+void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
+{
+	struct mtk_disp_ccorr *ccorr = dev_get_drvdata(dev);
+	struct drm_property_blob *blob = state->ctm;
+	struct drm_color_ctm *ctm;
+	const u64 *input;
+	uint16_t coeffs[9] = { 0 };
+	int i;
+	struct cmdq_pkt *cmdq_pkt = NULL;
+
+	if (!blob)
+		return;
+
+	ctm = (struct drm_color_ctm *)blob->data;
+	input = ctm->matrix;
+
+	for (i = 0; i < ARRAY_SIZE(coeffs); i++)
+		coeffs[i] = mtk_ctm_s31_32_to_s1_10(input[i]);
+
+	mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
+		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_0);
+	mtk_ddp_write(cmdq_pkt, coeffs[2] << 16 | coeffs[3],
+		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_1);
+	mtk_ddp_write(cmdq_pkt, coeffs[4] << 16 | coeffs[5],
+		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_2);
+	mtk_ddp_write(cmdq_pkt, coeffs[6] << 16 | coeffs[7],
+		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_3);
+	mtk_ddp_write(cmdq_pkt, coeffs[8] << 16,
+		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_4);
+}
+
+static int mtk_disp_ccorr_bind(struct device *dev, struct device *master,
+			       void *data)
+{
+	return 0;
+}
+
+static void mtk_disp_ccorr_unbind(struct device *dev, struct device *master,
+				  void *data)
+{
+}
+
+static const struct component_ops mtk_disp_ccorr_component_ops = {
+	.bind	= mtk_disp_ccorr_bind,
+	.unbind	= mtk_disp_ccorr_unbind,
+};
+
+static int mtk_disp_ccorr_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_disp_ccorr *priv;
+	struct resource *res;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(dev, "failed to get ccorr clk\n");
+		return PTR_ERR(priv->clk);
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->regs)) {
+		dev_err(dev, "failed to ioremap ccorr\n");
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
+	pm_runtime_enable(dev);
+
+	ret = component_add(dev, &mtk_disp_ccorr_component_ops);
+	if (ret)
+		dev_err(dev, "Failed to add component: %d\n", ret);
+
+	return ret;
+}
+
+static int mtk_disp_ccorr_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &mtk_disp_ccorr_component_ops);
+
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static const struct of_device_id mtk_disp_ccorr_driver_dt_match[] = {
+	{ .compatible = "mediatek,mt8183-disp-ccorr"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_disp_ccorr_driver_dt_match);
+
+struct platform_driver mtk_disp_ccorr_driver = {
+	.probe		= mtk_disp_ccorr_probe,
+	.remove		= mtk_disp_ccorr_remove,
+	.driver		= {
+		.name	= "mediatek-disp-ccorr",
+		.owner	= THIS_MODULE,
+		.of_match_table = mtk_disp_ccorr_driver_dt_match,
+	},
+};
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index d74e85db3fcdf..8282497ed1391 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -9,6 +9,15 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include "mtk_drm_plane.h"
 
+void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state);
+int mtk_ccorr_clk_enable(struct device *dev);
+void mtk_ccorr_clk_disable(struct device *dev);
+void mtk_ccorr_config(struct device *dev, unsigned int w,
+                      unsigned int h, unsigned int vrefresh,
+                      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+void mtk_ccorr_start(struct device *dev);
+void mtk_ccorr_stop(struct device *dev);
+
 void mtk_color_bypass_shadow(struct device *dev);
 int mtk_color_clk_enable(struct device *dev);
 void mtk_color_clk_disable(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 543cbfc9c5d85..6192c3ef926da 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -35,20 +35,6 @@
 #define DISP_AAL_EN				0x0000
 #define DISP_AAL_SIZE				0x0030
 
-#define DISP_CCORR_EN				0x0000
-#define CCORR_EN				BIT(0)
-#define DISP_CCORR_CFG				0x0020
-#define CCORR_RELAY_MODE			BIT(0)
-#define CCORR_ENGINE_EN				BIT(1)
-#define CCORR_GAMMA_OFF				BIT(2)
-#define CCORR_WGAMUT_SRC_CLIP			BIT(3)
-#define DISP_CCORR_SIZE				0x0030
-#define DISP_CCORR_COEF_0			0x0080
-#define DISP_CCORR_COEF_1			0x0084
-#define DISP_CCORR_COEF_2			0x0088
-#define DISP_CCORR_COEF_3			0x008C
-#define DISP_CCORR_COEF_4			0x0090
-
 #define DISP_DITHER_EN				0x0000
 #define DITHER_EN				BIT(0)
 #define DISP_DITHER_CFG				0x0020
@@ -236,82 +222,6 @@ static void mtk_aal_stop(struct device *dev)
 	writel_relaxed(0x0, priv->regs + DISP_AAL_EN);
 }
 
-static void mtk_ccorr_config(struct device *dev, unsigned int w,
-			     unsigned int h, unsigned int vrefresh,
-			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_CCORR_SIZE);
-	mtk_ddp_write(cmdq_pkt, CCORR_ENGINE_EN, &priv->cmdq_reg, priv->regs, DISP_CCORR_CFG);
-}
-
-static void mtk_ccorr_start(struct device *dev)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	writel(CCORR_EN, priv->regs + DISP_CCORR_EN);
-}
-
-static void mtk_ccorr_stop(struct device *dev)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	writel_relaxed(0x0, priv->regs + DISP_CCORR_EN);
-}
-
-/* Converts a DRM S31.32 value to the HW S1.10 format. */
-static u16 mtk_ctm_s31_32_to_s1_10(u64 in)
-{
-	u16 r;
-
-	/* Sign bit. */
-	r = in & BIT_ULL(63) ? BIT(11) : 0;
-
-	if ((in & GENMASK_ULL(62, 33)) > 0) {
-		/* identity value 0x100000000 -> 0x400, */
-		/* if bigger this, set it to max 0x7ff. */
-		r |= GENMASK(10, 0);
-	} else {
-		/* take the 11 most important bits. */
-		r |= (in >> 22) & GENMASK(10, 0);
-	}
-
-	return r;
-}
-
-static void mtk_ccorr_ctm_set(struct device *dev,
-			      struct drm_crtc_state *state)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-	struct drm_property_blob *blob = state->ctm;
-	struct drm_color_ctm *ctm;
-	const u64 *input;
-	uint16_t coeffs[9] = { 0 };
-	int i;
-	struct cmdq_pkt *cmdq_pkt = NULL;
-
-	if (!blob)
-		return;
-
-	ctm = (struct drm_color_ctm *)blob->data;
-	input = ctm->matrix;
-
-	for (i = 0; i < ARRAY_SIZE(coeffs); i++)
-		coeffs[i] = mtk_ctm_s31_32_to_s1_10(input[i]);
-
-	mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
-		      &priv->cmdq_reg, priv->regs, DISP_CCORR_COEF_0);
-	mtk_ddp_write(cmdq_pkt, coeffs[2] << 16 | coeffs[3],
-		      &priv->cmdq_reg, priv->regs, DISP_CCORR_COEF_1);
-	mtk_ddp_write(cmdq_pkt, coeffs[4] << 16 | coeffs[5],
-		      &priv->cmdq_reg, priv->regs, DISP_CCORR_COEF_2);
-	mtk_ddp_write(cmdq_pkt, coeffs[6] << 16 | coeffs[7],
-		      &priv->cmdq_reg, priv->regs, DISP_CCORR_COEF_3);
-	mtk_ddp_write(cmdq_pkt, coeffs[8] << 16,
-		      &priv->cmdq_reg, priv->regs, DISP_CCORR_COEF_4);
-}
-
 static void mtk_dither_config(struct device *dev, unsigned int w,
 			      unsigned int h, unsigned int vrefresh,
 			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -350,8 +260,8 @@ static const struct mtk_ddp_comp_funcs ddp_aal = {
 };
 
 static const struct mtk_ddp_comp_funcs ddp_ccorr = {
-	.clk_enable = mtk_ddp_clk_enable,
-	.clk_disable = mtk_ddp_clk_disable,
+	.clk_enable = mtk_ccorr_clk_enable,
+	.clk_disable = mtk_ccorr_clk_disable,
 	.config = mtk_ccorr_config,
 	.start = mtk_ccorr_start,
 	.stop = mtk_ccorr_stop,
@@ -612,6 +522,7 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	}
 
 	if (type == MTK_DISP_BLS ||
+	    type == MTK_DISP_CCORR ||
 	    type == MTK_DISP_COLOR ||
 	    type == MTK_DISP_GAMMA ||
 	    type == MTK_DISP_POSTMASK ||
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index d99afc8528684..3da8996438dbc 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -531,11 +531,12 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		private->comp_node[comp_id] = of_node_get(node);
 
 		/*
-		 * Currently only the COLOR, GAMMA, OVL, POSTMASK, RDMA, DSI, and DPI blocks have
-		 * separate component platform drivers and initialize their own
+		 * Currently only the CCORR, COLOR, GAMMA, OVL, POSTMASK, RDMA, DSI, and DPI
+		 * blocks have separate component platform drivers and initialize their own
 		 * DDP component structure. The others are initialized here.
 		 */
-		if (comp_type == MTK_DISP_COLOR ||
+		if (comp_type == MTK_DISP_CCORR ||
+		    comp_type == MTK_DISP_COLOR ||
 		    comp_type == MTK_DISP_GAMMA ||
 		    comp_type == MTK_DISP_OVL ||
 		    comp_type == MTK_DISP_OVL_2L ||
@@ -635,6 +636,7 @@ static struct platform_driver mtk_drm_platform_driver = {
 };
 
 static struct platform_driver * const mtk_drm_drivers[] = {
+	&mtk_disp_ccorr_driver,
 	&mtk_disp_color_driver,
 	&mtk_disp_gamma_driver,
 	&mtk_disp_ovl_driver,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 7e7b28e32aa2f..b49062364c3d2 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -46,6 +46,7 @@ struct mtk_drm_private {
 	struct drm_atomic_state *suspend_state;
 };
 
+extern struct platform_driver mtk_disp_ccorr_driver;
 extern struct platform_driver mtk_disp_color_driver;
 extern struct platform_driver mtk_disp_gamma_driver;
 extern struct platform_driver mtk_disp_ovl_driver;
-- 
2.30.0.365.g02bc693789-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
