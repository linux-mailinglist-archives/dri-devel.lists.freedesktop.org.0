Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1372F0DC6
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 09:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E10389CE2;
	Mon, 11 Jan 2021 08:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4121B89CF5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 07:44:10 +0000 (UTC)
X-UUID: 740432f828a8474d9f6baa9964153d8b-20210111
X-UUID: 740432f828a8474d9f6baa9964153d8b-20210111
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 357142671; Mon, 11 Jan 2021 15:44:07 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 15:44:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Jan 2021 15:44:05 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3, 12/15] drm/mediatek: separate ccorr module
Date: Mon, 11 Jan 2021 15:43:48 +0800
Message-ID: <1610351031-21133-13-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Mon, 11 Jan 2021 08:20:05 +0000
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ccorr ctm matrix bits will be different in mt8192

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile           |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c   | 222 ++++++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  92 +-----------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   8 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 5 files changed, 231 insertions(+), 95 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index ce5ad59..a02f534 100644
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
index 0000000..63b3ef6
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
+	struct mtk_ddp_comp			ddp_comp;
+	const struct mtk_disp_ccorr_data	*data;
+};
+
+static inline struct mtk_disp_ccorr *comp_to_ccorr(struct mtk_ddp_comp *comp)
+{
+	return container_of(comp, struct mtk_disp_ccorr, ddp_comp);
+}
+
+static void mtk_ccorr_config(struct mtk_ddp_comp *comp, unsigned int w,
+			     unsigned int h, unsigned int vrefresh,
+			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, comp, DISP_CCORR_SIZE);
+	mtk_ddp_write(cmdq_pkt, CCORR_ENGINE_EN, comp, DISP_CCORR_CFG);
+}
+
+static void mtk_ccorr_start(struct mtk_ddp_comp *comp)
+{
+	writel(CCORR_EN, comp->regs + DISP_CCORR_EN);
+}
+
+static void mtk_ccorr_stop(struct mtk_ddp_comp *comp)
+{
+	writel_relaxed(0x0, comp->regs + DISP_CCORR_EN);
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
+static void mtk_ccorr_ctm_set(struct mtk_ddp_comp *comp,
+			      struct drm_crtc_state *state)
+{
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
+		      comp, DISP_CCORR_COEF_0);
+	mtk_ddp_write(cmdq_pkt, coeffs[2] << 16 | coeffs[3],
+		      comp, DISP_CCORR_COEF_1);
+	mtk_ddp_write(cmdq_pkt, coeffs[4] << 16 | coeffs[5],
+		      comp, DISP_CCORR_COEF_2);
+	mtk_ddp_write(cmdq_pkt, coeffs[6] << 16 | coeffs[7],
+		      comp, DISP_CCORR_COEF_3);
+	mtk_ddp_write(cmdq_pkt, coeffs[8] << 16,
+		      comp, DISP_CCORR_COEF_4);
+}
+
+static const struct mtk_ddp_comp_funcs mtk_disp_ccorr_funcs = {
+	.config = mtk_ccorr_config,
+	.start = mtk_ccorr_start,
+	.stop = mtk_ccorr_stop,
+	.ctm_set = mtk_ccorr_ctm_set,
+};
+
+static int mtk_disp_ccorr_bind(struct device *dev, struct device *master,
+			       void *data)
+{
+	struct mtk_disp_ccorr *priv = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = data;
+	int ret;
+
+	ret = mtk_ddp_comp_register(drm_dev, &priv->ddp_comp);
+	if (ret < 0) {
+		dev_err(dev, "Failed to register component %pOF: %d\n",
+			dev->of_node, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void mtk_disp_ccorr_unbind(struct device *dev, struct device *master,
+				  void *data)
+{
+	struct mtk_disp_ccorr *priv = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = data;
+
+	mtk_ddp_comp_unregister(drm_dev, &priv->ddp_comp);
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
+	int comp_id;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DISP_CCORR);
+	if (comp_id < 0) {
+		dev_err(dev, "Failed to identify by alias: %d\n", comp_id);
+		return comp_id;
+	}
+
+	ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
+				&mtk_disp_ccorr_funcs);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to initialize component: %d\n",
+				ret);
+
+		return ret;
+	}
+
+	priv->data = of_device_get_match_data(dev);
+
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
+	pm_runtime_disable(&pdev->dev);
+
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
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 6081800..bb7893d 100644
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
@@ -187,75 +173,6 @@ static void mtk_aal_stop(struct mtk_ddp_comp *comp)
 	writel_relaxed(0x0, comp->regs + DISP_AAL_EN);
 }
 
-static void mtk_ccorr_config(struct mtk_ddp_comp *comp, unsigned int w,
-			     unsigned int h, unsigned int vrefresh,
-			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
-{
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, comp, DISP_CCORR_SIZE);
-	mtk_ddp_write(cmdq_pkt, CCORR_ENGINE_EN, comp, DISP_CCORR_CFG);
-}
-
-static void mtk_ccorr_start(struct mtk_ddp_comp *comp)
-{
-	writel(CCORR_EN, comp->regs + DISP_CCORR_EN);
-}
-
-static void mtk_ccorr_stop(struct mtk_ddp_comp *comp)
-{
-	writel_relaxed(0x0, comp->regs + DISP_CCORR_EN);
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
-static void mtk_ccorr_ctm_set(struct mtk_ddp_comp *comp,
-			      struct drm_crtc_state *state)
-{
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
-		      comp, DISP_CCORR_COEF_0);
-	mtk_ddp_write(cmdq_pkt, coeffs[2] << 16 | coeffs[3],
-		      comp, DISP_CCORR_COEF_1);
-	mtk_ddp_write(cmdq_pkt, coeffs[4] << 16 | coeffs[5],
-		      comp, DISP_CCORR_COEF_2);
-	mtk_ddp_write(cmdq_pkt, coeffs[6] << 16 | coeffs[7],
-		      comp, DISP_CCORR_COEF_3);
-	mtk_ddp_write(cmdq_pkt, coeffs[8] << 16,
-		      comp, DISP_CCORR_COEF_4);
-}
-
 static void mtk_dither_config(struct mtk_ddp_comp *comp, unsigned int w,
 			      unsigned int h, unsigned int vrefresh,
 			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -315,13 +232,6 @@ static void mtk_dither_stop(struct mtk_ddp_comp *comp)
 	.stop = mtk_aal_stop,
 };
 
-static const struct mtk_ddp_comp_funcs ddp_ccorr = {
-	.config = mtk_ccorr_config,
-	.start = mtk_ccorr_start,
-	.stop = mtk_ccorr_stop,
-	.ctm_set = mtk_ccorr_ctm_set,
-};
-
 static const struct mtk_ddp_comp_funcs ddp_dither = {
 	.config = mtk_dither_config,
 	.start = mtk_dither_start,
@@ -367,7 +277,7 @@ struct mtk_ddp_comp_match {
 	[DDP_COMPONENT_AAL0]	= { MTK_DISP_AAL,	0, &ddp_aal },
 	[DDP_COMPONENT_AAL1]	= { MTK_DISP_AAL,	1, &ddp_aal },
 	[DDP_COMPONENT_BLS]	= { MTK_DISP_BLS,	0, NULL },
-	[DDP_COMPONENT_CCORR]	= { MTK_DISP_CCORR,	0, &ddp_ccorr },
+	[DDP_COMPONENT_CCORR]	= { MTK_DISP_CCORR,	0, NULL },
 	[DDP_COMPONENT_COLOR0]	= { MTK_DISP_COLOR,	0, NULL },
 	[DDP_COMPONENT_COLOR1]	= { MTK_DISP_COLOR,	1, NULL },
 	[DDP_COMPONENT_DITHER]	= { MTK_DISP_DITHER,	0, &ddp_dither },
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index bc205e9..79e86f7 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -533,11 +533,12 @@ static int mtk_drm_probe(struct platform_device *pdev)
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
@@ -652,6 +653,7 @@ static SIMPLE_DEV_PM_OPS(mtk_drm_pm_ops, mtk_drm_sys_suspend,
 
 static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_ddp_driver,
+	&mtk_disp_ccorr_driver,
 	&mtk_disp_color_driver,
 	&mtk_disp_gamma_driver,
 	&mtk_disp_ovl_driver,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 8a9544b..e20a0e8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -47,6 +47,7 @@ struct mtk_drm_private {
 };
 
 extern struct platform_driver mtk_ddp_driver;
+extern struct platform_driver mtk_disp_ccorr_driver;
 extern struct platform_driver mtk_disp_color_driver;
 extern struct platform_driver mtk_disp_gamma_driver;
 extern struct platform_driver mtk_disp_ovl_driver;
-- 
1.8.1.1.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
