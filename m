Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE83A09EFA
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2025 01:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4F410E540;
	Sat, 11 Jan 2025 00:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="gfgAF403";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB4710F0AC
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 12:38:52 +0000 (UTC)
X-UUID: d6bfa37ecf4f11ef99858b75a2457dd9-20250110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RO+Eyhf0X4rq4vP0XypPALeSJQmAvIeX54lfaoFkF8k=; 
 b=gfgAF4035TQT8JmXpobljPnYp4LxT0Pplp96R0HXow5rVNbei08Cui45ob7Zu6FqmOVfcUMGeFWOPw3konBMw+9zk0byS+s7MOAMYIrWE0uoxVqiFF8wGXsFnREkj/7nvpLnajQXly7+70OtKXxf9SaDGnjZms7f+kwE5IM0NXo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:a5b8c9a1-f0b1-4bc7-966d-5b662e21eabf, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:3d33b037-e11c-4c1a-89f7-e7a032832c40,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
 ,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
 :0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d6bfa37ecf4f11ef99858b75a2457dd9-20250110
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1554945177; Fri, 10 Jan 2025 20:38:48 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 Jan 2025 20:38:47 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 Jan 2025 20:38:46 +0800
From: paul-pl.chen <paul-pl.chen@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <chunkuang.hu@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <xiandong.wang@mediatek.com>,
 <sirius.wang@mediatek.com>, <paul-pl.chen@mediatek.com>,
 <sunny.shen@mediatek.com>, <fshao@chromium.org>, <treapking@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 10/12] drm/mediatek: add OUTPROC support for MT8196
Date: Fri, 10 Jan 2025 20:34:06 +0800
Message-ID: <20250110123835.2719824-12-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Sat, 11 Jan 2025 00:10:20 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Nancy.Lin" <nancy.lin@mediatek.com>

OUTPROC handles the post-stage of pixel processing in
the overlapping procedure.OUTPROC manages pixels for
gamma correction and ensures that pixel values are
within the correct range.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl.Chen <paul-pl.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile           |   1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c     |   1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h     |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  14 ++
 drivers/gpu/drm/mediatek/mtk_disp_outproc.c | 244 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_outproc.h |  22 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 8 files changed, 285 insertions(+)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_outproc.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_outproc.h

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index a7b9ebe27f68..9546bc6b7b2e 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -10,6 +10,7 @@ mediatek-drm-y := mtk_crtc.o \
 		  mtk_disp_gamma.o \
 		  mtk_disp_merge.o \
 		  mtk_disp_ovl.o \
+		  mtk_disp_outproc.o \
 		  mtk_disp_ovl_adaptor.o \
 		  mtk_disp_rdma.o \
 		  mtk_drm_drv.o \
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index e65c6df987f2..cc780744f060 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -447,6 +447,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DSI] = "dsi",
 	[MTK_OVL_BLENDER] = "blender",
 	[MTK_OVL_EXDMA] = "exdma",
+	[MTK_OVL_OUTPROC] = "outproc",
 };
 
 struct mtk_ddp_comp_match {
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index 075ba5683f93..b33d3289b8b6 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -45,6 +45,7 @@ enum mtk_ddp_comp_type {
 	MTK_DSI,
 	MTK_OVL_BLENDER,
 	MTK_OVL_EXDMA,
+	MTK_OVL_OUTPROC,
 	MTK_DDP_COMP_TYPE_MAX,
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 719191f05b27..44d2cbe919dc 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -64,6 +64,20 @@ void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
 			   unsigned int bpc, unsigned int cfg,
 			   unsigned int dither_en, struct cmdq_pkt *cmdq_pkt);
 
+void mtk_disp_outproc_start(struct device *dev);
+void mtk_disp_outproc_stop(struct device *dev);
+int mtk_disp_outproc_clk_enable(struct device *dev);
+void mtk_disp_outproc_clk_disable(struct device *dev);
+void mtk_disp_outproc_config(struct device *dev, unsigned int w,
+			     unsigned int h, unsigned int vrefresh,
+			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+void mtk_disp_outproc_register_vblank_cb(struct device *dev,
+					 void (*vblank_cb)(void *),
+					 void *vblank_cb_data);
+void mtk_disp_outproc_unregister_vblank_cb(struct device *dev);
+void mtk_disp_outproc_enable_vblank(struct device *dev);
+void mtk_disp_outproc_disable_vblank(struct device *dev);
+
 void mtk_dpi_start(struct device *dev);
 void mtk_dpi_stop(struct device *dev);
 unsigned int mtk_dpi_encoder_index(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_outproc.c b/drivers/gpu/drm/mediatek/mtk_disp_outproc.c
new file mode 100644
index 000000000000..af473eb2fb77
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_outproc.c
@@ -0,0 +1,244 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+#include <linux/soc/mediatek/mtk-mmsys.h>
+
+#include "mtk_crtc.h"
+#include "mtk_ddp_comp.h"
+#include <linux/of.h>
+#include "mtk_drm_drv.h"
+#include "mtk_disp_outproc.h"
+
+#define DISP_REG_OVL_OUTPROC_INTEN				0x004
+#define OVL_OUTPROC_FME_CPL_INTEN					BIT(1)
+#define DISP_REG_OVL_OUTPROC_INTSTA				0x008
+#define DISP_REG_OVL_OUTPROC_DATAPATH_CON			0x010
+#define DATAPATH_CON_OUTPUT_CLAMP					BIT(26)
+
+#define DISP_REG_OVL_OUTPROC_EN					0x020
+#define OVL_OUTPROC_OVL_EN						BIT(0)
+#define DISP_REG_OVL_OUTPROC_RST				0x024
+#define OVL_OUTPROC_RST							BIT(0)
+#define DISP_REG_OVL_OUTPROC_SHADOW_CTRL			0x028
+#define OVL_OUTPROC_BYPASS_SHADOW					BIT(2)
+#define DISP_REG_OVL_OUTPROC_ROI_SIZE				0x030
+
+struct mtk_disp_outproc {
+	void __iomem		*regs;
+	struct clk		*clk;
+	void			(*vblank_cb)(void *data);
+	void			*vblank_cb_data;
+	int			irq;
+	struct cmdq_client_reg	cmdq_reg;
+};
+
+void mtk_disp_outproc_register_vblank_cb(struct device *dev,
+					 void (*vblank_cb)(void *),
+					 void *vblank_cb_data)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+
+	priv->vblank_cb = vblank_cb;
+	priv->vblank_cb_data = vblank_cb_data;
+}
+
+void mtk_disp_outproc_unregister_vblank_cb(struct device *dev)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+
+	priv->vblank_cb = NULL;
+	priv->vblank_cb_data = NULL;
+}
+
+void mtk_disp_outproc_enable_vblank(struct device *dev)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+
+	writel(OVL_OUTPROC_FME_CPL_INTEN, priv->regs + DISP_REG_OVL_OUTPROC_INTEN);
+}
+
+void mtk_disp_outproc_disable_vblank(struct device *dev)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+
+	writel(0x0, priv->regs + DISP_REG_OVL_OUTPROC_INTEN);
+}
+
+static irqreturn_t mtk_disp_outproc_irq_handler(int irq, void *dev_id)
+{
+	struct mtk_disp_outproc *priv = dev_id;
+
+	writel(0x0, priv->regs + DISP_REG_OVL_OUTPROC_INTSTA);
+
+	if (!priv->vblank_cb)
+		return IRQ_NONE;
+
+	priv->vblank_cb(priv->vblank_cb_data);
+
+	return IRQ_HANDLED;
+}
+
+void mtk_disp_outproc_config(struct device *dev, unsigned int w,
+			     unsigned int h, unsigned int vrefresh,
+			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+	unsigned int tmp;
+
+	dev_dbg(dev, "%s-w:%d, h:%d\n", __func__, w, h);
+
+	tmp = readl(priv->regs + DISP_REG_OVL_OUTPROC_SHADOW_CTRL);
+	tmp = tmp | OVL_OUTPROC_BYPASS_SHADOW;
+	writel(tmp, priv->regs + DISP_REG_OVL_OUTPROC_SHADOW_CTRL);
+
+	mtk_ddp_write_mask(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_OUTPROC_ROI_SIZE, ~0);
+	mtk_ddp_write_mask(cmdq_pkt, DATAPATH_CON_OUTPUT_CLAMP, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_OUTPROC_DATAPATH_CON, DATAPATH_CON_OUTPUT_CLAMP);
+}
+
+void mtk_disp_outproc_start(struct device *dev)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+
+	mtk_ddp_write_mask(NULL, OVL_OUTPROC_RST, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_OUTPROC_RST, OVL_OUTPROC_RST);
+	mtk_ddp_write_mask(NULL, 0, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_OUTPROC_RST, OVL_OUTPROC_RST);
+	mtk_ddp_write(NULL, 0, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_OVL_OUTPROC_INTSTA);
+	mtk_ddp_write_mask(NULL, OVL_OUTPROC_OVL_EN, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_OUTPROC_EN, OVL_OUTPROC_OVL_EN);
+}
+
+void mtk_disp_outproc_stop(struct device *dev)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+
+	mtk_ddp_write(NULL, 0, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_OVL_OUTPROC_INTEN);
+	mtk_ddp_write_mask(NULL, 0, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_OUTPROC_EN, OVL_OUTPROC_OVL_EN);
+}
+
+int mtk_disp_outproc_clk_enable(struct device *dev)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(priv->clk);
+}
+
+void mtk_disp_outproc_clk_disable(struct device *dev)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(priv->clk);
+}
+
+static int mtk_disp_outproc_bind(struct device *dev, struct device *master,
+				 void *data)
+{
+	return 0;
+}
+
+static void mtk_disp_outproc_unbind(struct device *dev, struct device *master, void *data)
+{
+}
+
+static const struct component_ops mtk_disp_outproc_component_ops = {
+	.bind	= mtk_disp_outproc_bind,
+	.unbind = mtk_disp_outproc_unbind,
+};
+
+static int mtk_disp_outproc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	struct mtk_disp_outproc *priv;
+	int ret = 0;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->regs)) {
+		dev_err(dev, "failed to ioremap outproc\n");
+		return PTR_ERR(priv->regs);
+	}
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(dev, "failed to get outproc clk\n");
+		return PTR_ERR(priv->clk);
+	}
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
+	if (ret)
+		dev_dbg(dev, "No mediatek,gce-client-reg\n");
+#endif
+
+	if (of_property_read_u32_index(dev->of_node, "interrupts", 0, &ret)) {
+		dev_dbg(dev, "interrupts not defined\n");
+	} else {
+		priv->irq = platform_get_irq(pdev, 0);
+		if (priv->irq < 0)
+			priv->irq = 0;
+
+		if (priv->irq) {
+			ret = devm_request_irq(dev, priv->irq, mtk_disp_outproc_irq_handler,
+					       IRQF_TRIGGER_NONE, dev_name(dev), priv);
+			if (ret < 0) {
+				dev_err(dev, "Failed to request irq %d: %d\n", priv->irq, ret);
+				return ret;
+			}
+		}
+	}
+
+	platform_set_drvdata(pdev, priv);
+
+	ret = component_add(dev, &mtk_disp_outproc_component_ops);
+	if (ret)
+		dev_notice(dev, "Failed to add component: %d\n", ret);
+
+	return ret;
+}
+
+static void mtk_disp_outproc_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &mtk_disp_outproc_component_ops);
+}
+
+static const struct of_device_id mtk_disp_outproc_driver_dt_match[] = {
+	{ .compatible = "mediatek,mt8196-outproc"},
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, mtk_disp_outproc_driver_dt_match);
+
+struct platform_driver mtk_disp_outproc_driver = {
+	.probe		= mtk_disp_outproc_probe,
+	.remove		= mtk_disp_outproc_remove,
+	.driver		= {
+		.name	= "mediatek-disp-outproc",
+		.owner	= THIS_MODULE,
+		.of_match_table = mtk_disp_outproc_driver_dt_match,
+	},
+};
+
+MODULE_AUTHOR("Nancy Lin <nancy.lin@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek Output processing Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_outproc.h b/drivers/gpu/drm/mediatek/mtk_disp_outproc.h
new file mode 100644
index 000000000000..22ee5d845eae
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_outproc.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef __MTK_DISP_OUTPROC_H__
+#define __MTK_DISP_OUTPROC_H__
+
+void mtk_disp_outproc_start(struct device *dev);
+void mtk_disp_outproc_stop(struct device *dev);
+int mtk_disp_outproc_clk_enable(struct device *dev);
+void mtk_disp_outproc_clk_disable(struct device *dev);
+void mtk_disp_outproc_config(struct device *dev, unsigned int w,
+			     unsigned int h, unsigned int vrefresh,
+			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+void mtk_disp_outproc_register_vblank_cb(struct device *dev,
+					 void (*vblank_cb)(void *),
+					 void *vblank_cb_data);
+void mtk_disp_outproc_unregister_vblank_cb(struct device *dev);
+void mtk_disp_outproc_enable_vblank(struct device *dev);
+void mtk_disp_outproc_disable_vblank(struct device *dev);
+#endif
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index e4a0d9fe4e2d..27190057bd8e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -1265,6 +1265,7 @@ static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_disp_exdma_driver,
 	&mtk_disp_gamma_driver,
 	&mtk_disp_merge_driver,
+	&mtk_disp_outproc_driver,
 	&mtk_disp_ovl_adaptor_driver,
 	&mtk_disp_ovl_driver,
 	&mtk_disp_rdma_driver,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 89178de1478f..c4717c37b0f1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -76,6 +76,7 @@ extern struct platform_driver mtk_disp_color_driver;
 extern struct platform_driver mtk_disp_exdma_driver;
 extern struct platform_driver mtk_disp_gamma_driver;
 extern struct platform_driver mtk_disp_merge_driver;
+extern struct platform_driver mtk_disp_outproc_driver;
 extern struct platform_driver mtk_disp_ovl_adaptor_driver;
 extern struct platform_driver mtk_disp_ovl_driver;
 extern struct platform_driver mtk_disp_rdma_driver;
-- 
2.34.1

