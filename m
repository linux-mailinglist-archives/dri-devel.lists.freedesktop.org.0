Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5363C40BF
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 03:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E728489B5F;
	Mon, 12 Jul 2021 01:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CCC89B55
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 01:03:07 +0000 (UTC)
X-UUID: e17851dc3ac841b0b63f79e870018015-20210712
X-UUID: e17851dc3ac841b0b63f79e870018015-20210712
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1457174394; Mon, 12 Jul 2021 09:03:03 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Jul 2021 09:03:02 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Jul 2021 09:03:01 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v2, 1/3] drm/mediatek: Separate aal module
Date: Mon, 12 Jul 2021 09:02:56 +0800
Message-ID: <1626051778-13577-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1626051778-13577-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1626051778-13577-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 David Airlie <airlied@linux.ie>, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mt8183 aal has no gamma function

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile           |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c     | 166 ++++++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   9 ++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  39 +------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   6 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 6 files changed, 184 insertions(+), 40 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_aal.c

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index dc54a7a..29098d7 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
-mediatek-drm-y := mtk_disp_ccorr.o \
+mediatek-drm-y := mtk_disp_aal.o \
+		  mtk_disp_ccorr.o \
 		  mtk_disp_color.o \
 		  mtk_disp_gamma.o \
 		  mtk_disp_ovl.o \
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
new file mode 100644
index 0000000..fb212e96
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -0,0 +1,166 @@
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
+#define DISP_AAL_EN				0x0000
+#define AAL_EN						BIT(0)
+#define DISP_AAL_SIZE				0x0030
+
+
+struct mtk_disp_aal_data {
+	bool has_gamma;
+};
+
+/**
+ * struct mtk_disp_aal - DISP_AAL driver structure
+ * @ddp_comp - structure containing type enum and hardware resources
+ * @crtc - associated crtc to report irq events to
+ */
+struct mtk_disp_aal {
+	struct clk *clk;
+	void __iomem *regs;
+	struct cmdq_client_reg cmdq_reg;
+	const struct mtk_disp_aal_data *data;
+};
+
+int mtk_aal_clk_enable(struct device *dev)
+{
+	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(aal->clk);
+}
+
+void mtk_aal_clk_disable(struct device *dev)
+{
+	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(aal->clk);
+}
+
+void mtk_aal_config(struct device *dev, unsigned int w,
+			   unsigned int h, unsigned int vrefresh,
+			   unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
+
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, &aal->cmdq_reg, aal->regs, DISP_AAL_SIZE);
+}
+
+void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)
+{
+	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
+
+	if (aal->data && aal->data->has_gamma)
+		mtk_gamma_set_common(aal->regs, state);
+}
+
+void mtk_aal_start(struct device *dev)
+{
+	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
+
+	writel(AAL_EN, aal->regs + DISP_AAL_EN);
+}
+
+void mtk_aal_stop(struct device *dev)
+{
+	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
+
+	writel_relaxed(0x0, aal->regs + DISP_AAL_EN);
+}
+
+static int mtk_disp_aal_bind(struct device *dev, struct device *master,
+			       void *data)
+{
+	return 0;
+}
+
+static void mtk_disp_aal_unbind(struct device *dev, struct device *master,
+				  void *data)
+{
+}
+
+static const struct component_ops mtk_disp_aal_component_ops = {
+	.bind	= mtk_disp_aal_bind,
+	.unbind = mtk_disp_aal_unbind,
+};
+
+static int mtk_disp_aal_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_disp_aal *priv;
+	struct resource *res;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(dev, "failed to get aal clk\n");
+		return PTR_ERR(priv->clk);
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->regs)) {
+		dev_err(dev, "failed to ioremap aal\n");
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
+	ret = component_add(dev, &mtk_disp_aal_component_ops);
+	if (ret)
+		dev_err(dev, "Failed to add component: %d\n", ret);
+
+	return ret;
+}
+
+static int mtk_disp_aal_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &mtk_disp_aal_component_ops);
+
+	return 0;
+}
+
+static const struct mtk_disp_aal_data mt8173_aal_driver_data = {
+	.has_gamma = true,
+};
+
+static const struct of_device_id mtk_disp_aal_driver_dt_match[] = {
+	{ .compatible = "mediatek,mt8173-disp-aal",
+	  .data = &mt8173_aal_driver_data},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_disp_aal_driver_dt_match);
+
+struct platform_driver mtk_disp_aal_driver = {
+	.probe		= mtk_disp_aal_probe,
+	.remove		= mtk_disp_aal_remove,
+	.driver		= {
+		.name	= "mediatek-disp-aal",
+		.owner	= THIS_MODULE,
+		.of_match_table = mtk_disp_aal_driver_dt_match,
+	},
+};
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index cafd9df..86c3068 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -9,6 +9,15 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include "mtk_drm_plane.h"
 
+int mtk_aal_clk_enable(struct device *dev);
+void mtk_aal_clk_disable(struct device *dev);
+void mtk_aal_config(struct device *dev, unsigned int w,
+		    unsigned int h, unsigned int vrefresh,
+		    unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state);
+void mtk_aal_start(struct device *dev);
+void mtk_aal_stop(struct device *dev);
+
 void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state);
 int mtk_ccorr_clk_enable(struct device *dev);
 void mtk_ccorr_clk_disable(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 75bc00e..f367142 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -32,9 +32,6 @@
 
 #define DISP_REG_UFO_START			0x0000
 
-#define DISP_AAL_EN				0x0000
-#define DISP_AAL_SIZE				0x0030
-
 #define DISP_DITHER_EN				0x0000
 #define DITHER_EN				BIT(0)
 #define DISP_DITHER_CFG				0x0020
@@ -48,8 +45,6 @@
 
 #define UFO_BYPASS				BIT(2)
 
-#define AAL_EN					BIT(0)
-
 #define DISP_DITHERING				BIT(2)
 #define DITHER_LSB_ERR_SHIFT_R(x)		(((x) & 0x7) << 28)
 #define DITHER_OVFLW_BIT_R(x)			(((x) & 0x7) << 24)
@@ -190,36 +185,6 @@ static void mtk_ufoe_start(struct device *dev)
 	writel(UFO_BYPASS, priv->regs + DISP_REG_UFO_START);
 }
 
-static void mtk_aal_config(struct device *dev, unsigned int w,
-			   unsigned int h, unsigned int vrefresh,
-			   unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_AAL_SIZE);
-}
-
-static void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	mtk_gamma_set_common(priv->regs, state);
-}
-
-static void mtk_aal_start(struct device *dev)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	writel(AAL_EN, priv->regs + DISP_AAL_EN);
-}
-
-static void mtk_aal_stop(struct device *dev)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	writel_relaxed(0x0, priv->regs + DISP_AAL_EN);
-}
-
 static void mtk_dither_config(struct device *dev, unsigned int w,
 			      unsigned int h, unsigned int vrefresh,
 			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -247,8 +212,8 @@ static void mtk_dither_stop(struct device *dev)
 }
 
 static const struct mtk_ddp_comp_funcs ddp_aal = {
-	.clk_enable = mtk_ddp_clk_enable,
-	.clk_disable = mtk_ddp_clk_disable,
+	.clk_enable = mtk_aal_clk_enable,
+	.clk_disable = mtk_aal_clk_disable,
 	.gamma_set = mtk_aal_gamma_set,
 	.config = mtk_aal_config,
 	.start = mtk_aal_start,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index b46bdb8..67a585e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -532,11 +532,12 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		private->comp_node[comp_id] = of_node_get(node);
 
 		/*
-		 * Currently only the CCORR, COLOR, GAMMA, OVL, RDMA, DSI, and DPI
+		 * Currently only the AAL, CCORR, COLOR, GAMMA, OVL, RDMA, DSI, and DPI
 		 * blocks have separate component platform drivers and initialize their own
 		 * DDP component structure. The others are initialized here.
 		 */
-		if (comp_type == MTK_DISP_CCORR ||
+		if (comp_type == MTK_DISP_AAL ||
+		    comp_type == MTK_DISP_CCORR ||
 		    comp_type == MTK_DISP_COLOR ||
 		    comp_type == MTK_DISP_GAMMA ||
 		    comp_type == MTK_DISP_OVL ||
@@ -636,6 +637,7 @@ static SIMPLE_DEV_PM_OPS(mtk_drm_pm_ops, mtk_drm_sys_suspend,
 };
 
 static struct platform_driver * const mtk_drm_drivers[] = {
+	&mtk_disp_aal_driver,
 	&mtk_disp_ccorr_driver,
 	&mtk_disp_color_driver,
 	&mtk_disp_gamma_driver,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 637f566..3e7d1e6 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -46,6 +46,7 @@ struct mtk_drm_private {
 	struct drm_atomic_state *suspend_state;
 };
 
+extern struct platform_driver mtk_disp_aal_driver;
 extern struct platform_driver mtk_disp_ccorr_driver;
 extern struct platform_driver mtk_disp_color_driver;
 extern struct platform_driver mtk_disp_gamma_driver;
-- 
1.8.1.1.dirty

