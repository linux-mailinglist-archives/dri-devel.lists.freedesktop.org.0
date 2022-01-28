Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F5549F8EE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 13:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6400410E422;
	Fri, 28 Jan 2022 12:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38B610E3DA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 12:07:28 +0000 (UTC)
X-UUID: 5731fe7993d64645a4ea40bd694e8f49-20220128
X-UUID: 5731fe7993d64645a4ea40bd694e8f49-20220128
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1616524591; Fri, 28 Jan 2022 20:07:24 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 Jan 2022 20:07:23 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 Jan 2022 20:07:22 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v1, 3/4] drm/mediatek: split postmask component
Date: Fri, 28 Jan 2022 20:07:17 +0800
Message-ID: <20220128120718.30545-4-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128120718.30545-1-yongqiang.niu@mediatek.com>
References: <20220128120718.30545-1-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

add postmask private data for differnt soc support

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile            |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h      |   8 +
 drivers/gpu/drm/mediatek/mtk_disp_postmask.c | 155 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c  |  30 +---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c       |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.h       |   1 +
 6 files changed, 170 insertions(+), 27 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_postmask.c

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 29098d7c8307..f26fe646ee2a 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -5,6 +5,7 @@ mediatek-drm-y := mtk_disp_aal.o \
 		  mtk_disp_color.o \
 		  mtk_disp_gamma.o \
 		  mtk_disp_ovl.o \
+		  mtk_disp_postmask.o \
 		  mtk_disp_rdma.o \
 		  mtk_drm_crtc.o \
 		  mtk_drm_ddp_comp.o \
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 86c3068894b1..f4c21195c3ea 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -81,6 +81,14 @@ void mtk_ovl_enable_vblank(struct device *dev,
 			   void *vblank_cb_data);
 void mtk_ovl_disable_vblank(struct device *dev);
 
+int mtk_postmask_clk_enable(struct device *dev);
+void mtk_postmask_clk_disable(struct device *dev);
+void mtk_postmask_config(struct device *dev, unsigned int w,
+				unsigned int h, unsigned int vrefresh,
+				unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+void mtk_postmask_start(struct device *dev);
+void mtk_postmask_stop(struct device *dev);
+
 void mtk_rdma_bypass_shadow(struct device *dev);
 int mtk_rdma_clk_enable(struct device *dev);
 void mtk_rdma_clk_disable(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_postmask.c b/drivers/gpu/drm/mediatek/mtk_disp_postmask.c
new file mode 100644
index 000000000000..fc04b445c2ed
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_postmask.c
@@ -0,0 +1,155 @@
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
+#define DISP_POSTMASK_EN			0x0000
+#define POSTMASK_EN					BIT(0)
+#define DISP_POSTMASK_CFG			0x0020
+#define POSTMASK_RELAY_MODE				BIT(0)
+#define DISP_POSTMASK_SIZE			0x0030
+
+struct mtk_disp_postmask_data {
+	u32 reserved;
+};
+
+/*
+ * struct mtk_disp_postmask - DISP_POSTMASK driver structure
+ */
+struct mtk_disp_postmask {
+	struct clk *clk;
+	void __iomem *regs;
+	struct cmdq_client_reg cmdq_reg;
+	const struct mtk_disp_postmask_data *data;
+};
+
+int mtk_postmask_clk_enable(struct device *dev)
+{
+	struct mtk_disp_postmask *postmask = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(postmask->clk);
+}
+
+void mtk_postmask_clk_disable(struct device *dev)
+{
+	struct mtk_disp_postmask *postmask = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(postmask->clk);
+}
+
+void mtk_postmask_config(struct device *dev, unsigned int w,
+				unsigned int h, unsigned int vrefresh,
+				unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_postmask *postmask = dev_get_drvdata(dev);
+
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, &postmask->cmdq_reg, postmask->regs,
+		      DISP_POSTMASK_SIZE);
+	mtk_ddp_write(cmdq_pkt, POSTMASK_RELAY_MODE, &postmask->cmdq_reg,
+		      postmask->regs, DISP_POSTMASK_CFG);
+}
+
+void mtk_postmask_start(struct device *dev)
+{
+	struct mtk_disp_postmask *postmask = dev_get_drvdata(dev);
+
+	writel(POSTMASK_EN, postmask->regs + DISP_POSTMASK_EN);
+}
+
+void mtk_postmask_stop(struct device *dev)
+{
+	struct mtk_disp_postmask *postmask = dev_get_drvdata(dev);
+
+	writel_relaxed(0x0, postmask->regs + DISP_POSTMASK_EN);
+}
+
+static int mtk_disp_postmask_bind(struct device *dev, struct device *master,
+				  void *data)
+{
+	return 0;
+}
+
+static void mtk_disp_postmask_unbind(struct device *dev, struct device *master,
+				     void *data)
+{
+}
+
+static const struct component_ops mtk_disp_postmask_component_ops = {
+	.bind	= mtk_disp_postmask_bind,
+	.unbind = mtk_disp_postmask_unbind,
+};
+
+static int mtk_disp_postmask_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_disp_postmask *priv;
+	struct resource *res;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(dev, "failed to get postmask clk\n");
+		return PTR_ERR(priv->clk);
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->regs)) {
+		dev_err(dev, "failed to ioremap postmask\n");
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
+	ret = component_add(dev, &mtk_disp_postmask_component_ops);
+	if (ret)
+		dev_err(dev, "Failed to add component: %d\n", ret);
+
+	return ret;
+}
+
+static int mtk_disp_postmask_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &mtk_disp_postmask_component_ops);
+
+	return 0;
+}
+
+static const struct of_device_id mtk_disp_postmask_driver_dt_match[] = {
+	{ .compatible = "mediatek,mt8192-disp-postmask"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_disp_postmask_driver_dt_match);
+
+struct platform_driver mtk_disp_postmask_driver = {
+	.probe		= mtk_disp_postmask_probe,
+	.remove		= mtk_disp_postmask_remove,
+	.driver		= {
+		.name	= "mediatek-disp-postmask",
+		.owner	= THIS_MODULE,
+		.of_match_table = mtk_disp_postmask_driver_dt_match,
+	},
+};
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index b4b682bc1991..e02fc8dcad91 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -199,31 +199,6 @@ static void mtk_od_start(struct device *dev)
 	writel(1, priv->regs + DISP_REG_OD_EN);
 }
 
-static void mtk_postmask_config(struct device *dev, unsigned int w,
-				unsigned int h, unsigned int vrefresh,
-				unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,
-		      DISP_REG_POSTMASK_SIZE);
-	mtk_ddp_write(cmdq_pkt, POSTMASK_RELAY_MODE, &priv->cmdq_reg,
-		      priv->regs, DISP_REG_POSTMASK_CFG);
-}
-
-static void mtk_postmask_start(struct device *dev)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	writel(POSTMASK_EN, priv->regs + DISP_REG_POSTMASK_EN);
-}
-
-static void mtk_postmask_stop(struct device *dev)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	writel_relaxed(0x0, priv->regs + DISP_REG_POSTMASK_EN);
-}
 
 static void mtk_ufoe_start(struct device *dev)
 {
@@ -308,8 +283,8 @@ static const struct mtk_ddp_comp_funcs ddp_ovl = {
 };
 
 static const struct mtk_ddp_comp_funcs ddp_postmask = {
-	.clk_enable = mtk_ddp_clk_enable,
-	.clk_disable = mtk_ddp_clk_disable,
+	.clk_enable = mtk_postmask_clk_enable,
+	.clk_disable = mtk_postmask_clk_disable,
 	.config = mtk_postmask_config,
 	.start = mtk_postmask_start,
 	.stop = mtk_postmask_stop,
@@ -510,6 +485,7 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	    type == MTK_DISP_GAMMA ||
 	    type == MTK_DISP_OVL ||
 	    type == MTK_DISP_OVL_2L ||
+	    type == MTK_DISP_POSTMASK ||
 	    type == MTK_DISP_PWM ||
 	    type == MTK_DISP_RDMA ||
 	    type == MTK_DPI ||
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 56ff8c57ef8f..6efb423ccc92 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -609,6 +609,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		    comp_type == MTK_DISP_GAMMA ||
 		    comp_type == MTK_DISP_OVL ||
 		    comp_type == MTK_DISP_OVL_2L ||
+		    comp_type == MTK_DISP_POSTMASK ||
 		    comp_type == MTK_DISP_RDMA ||
 		    comp_type == MTK_DPI ||
 		    comp_type == MTK_DSI) {
@@ -709,6 +710,7 @@ static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_disp_color_driver,
 	&mtk_disp_gamma_driver,
 	&mtk_disp_ovl_driver,
+	&mtk_disp_postmask_driver,
 	&mtk_disp_rdma_driver,
 	&mtk_dpi_driver,
 	&mtk_drm_platform_driver,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 3e7d1e6fbe01..c1e676aebe57 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -51,6 +51,7 @@ extern struct platform_driver mtk_disp_ccorr_driver;
 extern struct platform_driver mtk_disp_color_driver;
 extern struct platform_driver mtk_disp_gamma_driver;
 extern struct platform_driver mtk_disp_ovl_driver;
+extern struct platform_driver mtk_disp_postmask_driver;
 extern struct platform_driver mtk_disp_rdma_driver;
 extern struct platform_driver mtk_dpi_driver;
 extern struct platform_driver mtk_dsi_driver;
-- 
2.25.1

