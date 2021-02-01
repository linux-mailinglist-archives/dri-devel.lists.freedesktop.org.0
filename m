Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB1730B9A7
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:27:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8E66E8FC;
	Tue,  2 Feb 2021 08:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8236E1D3
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 10:37:43 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id e9so9735990plh.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 02:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XkXfEBR8pgMTV+uoeBfEaXuVG/pev5xNnT5pVijZJYQ=;
 b=hvuYJM6JrqxNxhfomZ1X/E89BCkfoiNosqxfNBExD+XmSDVbJn6xxquBTv22MQtNYH
 pa4U3JRGci3fL/I3am162kZ2xKJ5IHCKtI9eoUMf5D+q1KkgTVfQdASPZQHcZvJBUxFG
 en929NmkD8jUCYUiOjia/idhoMKbA+f36lKLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XkXfEBR8pgMTV+uoeBfEaXuVG/pev5xNnT5pVijZJYQ=;
 b=Sjv1bB2R4KJNHD2QSdcwfgWNoapjJtsFA7pgkiBBO/kJOlS669NALEJTM6RQqT7VfP
 1Yqo67k9i7fk0LIvODAzsdhz6sL8e+FkIyabYDUWxBCtoButdciwIQrtNrhOoMaC0AdM
 LiPCffKVY02/5GC6xXIsmksmaAY36dZOEz+dBueXoYtPK/rvNFOXWvqNlchQ0V4zN9zS
 fc6+utHFXHTgLHzQRPm8fTrVBZmCIck3OTuWVuo58+HpyPPyUekQNwGK7n5Nsm4H6VfR
 5ZNIJFh3mRP6a4IpTbnRPk8XMgrkZWmWcJHlhIQIJbg02mLaRd4Ff5fxLUqNpX7mFf9v
 MJDQ==
X-Gm-Message-State: AOAM531LLtPzhjFehsDmj6CRF5ER0lByP+3LoxG357IUj56LHtbG4vjW
 nwMFor6RI7KhstkbMVRkmg+D9H5UjtOrqg==
X-Google-Smtp-Source: ABdhPJwZTA5Oa2/Pp2gXfb5a8aIkubZxL1X+nTvCOPC/tk4u6hvVRz8zLj6PcL6mSVeaDsLsIKckOg==
X-Received: by 2002:a17:902:201:b029:e1:20bc:74ca with SMTP id
 1-20020a1709020201b02900e120bc74camr11266086plc.31.1612175862801; 
 Mon, 01 Feb 2021 02:37:42 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:a0cd:1b84:6d56:68e1])
 by smtp.gmail.com with ESMTPSA id 76sm17610356pfz.174.2021.02.01.02.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 02:37:42 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5 4/8] drm/mediatek: separate ccorr module
Date: Mon,  1 Feb 2021 18:37:23 +0800
Message-Id: <20210201103727.376721-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210201103727.376721-1-hsinyi@chromium.org>
References: <20210201103727.376721-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 02 Feb 2021 08:27:00 +0000
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
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c   | 216 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   9 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  95 +--------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   8 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 6 files changed, 236 insertions(+), 96 deletions(-)
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
index 0000000000000..6ee2431e6b843
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 MediaTek Inc.
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
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &ccorr->cmdq_reg, ccorr->regs,
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
index 06d4d4e1c0d05..469d4e12b2003 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -9,6 +9,15 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include "mtk_drm_plane.h"
 
+void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state);
+int mtk_ccorr_clk_enable(struct device *dev);
+void mtk_ccorr_clk_disable(struct device *dev);
+void mtk_ccorr_config(struct device *dev, unsigned int w,
+		      unsigned int h, unsigned int vrefresh,
+		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+void mtk_ccorr_start(struct device *dev);
+void mtk_ccorr_stop(struct device *dev);
+
 void mtk_color_bypass_shadow(struct device *dev);
 int mtk_color_clk_enable(struct device *dev);
 void mtk_color_clk_disable(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index d884807809635..4a8015d247ec7 100644
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
@@ -234,82 +220,6 @@ static void mtk_aal_stop(struct device *dev)
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
@@ -348,8 +258,8 @@ static const struct mtk_ddp_comp_funcs ddp_aal = {
 };
 
 static const struct mtk_ddp_comp_funcs ddp_ccorr = {
-	.clk_enable = mtk_ddp_clk_enable,
-	.clk_disable = mtk_ddp_clk_disable,
+	.clk_enable = mtk_ccorr_clk_enable,
+	.clk_disable = mtk_ccorr_clk_disable,
 	.config = mtk_ccorr_config,
 	.start = mtk_ccorr_start,
 	.stop = mtk_ccorr_stop,
@@ -610,6 +520,7 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
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
