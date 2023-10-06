Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 291927BB260
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 09:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B37D10E2FD;
	Fri,  6 Oct 2023 07:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FF710E244
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 07:38:48 +0000 (UTC)
X-UUID: 5eb60724641b11ee8051498923ad61e6-20231006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=NptGXb+7Q1ayQyAcMBKF8qg4DJ4ZueACowVKUIUjqbs=; 
 b=gqzu8XKZ84JKT7czixsidcB5UdaJ37lgWkuzeGataJXdiT0Jx2trAQRchtAHnIZ09WrNM/pcYOCwsAQJGOWigErVz9G8VDX7XZTYl2yRZud+DVkq4TLnsCRubcFvnwSUqJj2WHjUg0kbYntUCJFTSuIXtA03p4p6PrKXX2T6Rcg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:57c9f478-0ff7-4c97-be49-98ab6ba81c83, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:5f78ec9, CLOUDID:9edb82f0-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5eb60724641b11ee8051498923ad61e6-20231006
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1441014897; Fri, 06 Oct 2023 15:38:41 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 6 Oct 2023 15:38:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 6 Oct 2023 15:38:39 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v7 17/23] drm/mediatek: Support MT8188 Padding in display
 driver
Date: Fri, 6 Oct 2023 15:38:25 +0800
Message-ID: <20231006073831.10402-18-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231006073831.10402-1-shawn.sung@mediatek.com>
References: <20231006073831.10402-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.289800-8.000000
X-TMASE-MatchedRID: SWUBxxlZlUfyZ92BnYqk5lz+axQLnAVB2+EpBnZEzfWNTnqOMBIJ4WlW
 Rvn/M8gY+C56g4Ua7emMWZk+4DO9WD/m5c2H3qB+Q4srjeRbxTYraL2mh8ZVK+9Jtzyqge7R2ft
 v/5jXki8gAgObm9la7oiJWsrft4Ycw/xweqO/5diHZXNSWjgdU3nUZqRb3abmCqIJhrrDy294eZ
 bgec4RVl4sA62S07e35JZWpbmrOY5wwyMFFFhiHEDC9lgTLwgFU2fjZiNvIynvGpig654QL372u
 NnedUzG5CLnvMrv3joNBaBCS6tQ1IPN2a+Tga3S1FnWYpN8q2H28//UqwV6OY1OuwjPrj0ERzBg
 yFiNMBj90YA2KpU/LVRG4opBGZUIjf1TjH3joFcZXJLztZviXDFcf92WG8u/eTmKiim/CB6jxYy
 RBa/qJcFwgTvxipFajoczmuoPCq1aomME9Awr7gvaSXVrgAMz9XDOJqNBtUGiiuZR7utJjD2Dp+
 nOYfCy
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.289800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 255A83BA7133CD7CD79B39F9AE6090F17DED00FA7B845C8C97F478E8305EAFEC2000:8
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Hsiao Chien Sung <shawn.sung@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Nancy . Lin" <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, Mauro Carvalho
 Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Padding is a new display module on MT8188, it provides ability
to add pixels to width and height of a layer with specified colors.

Due to hardware design, Mixer in VDOSYS1 requires width of a layer
to be 2-pixel-align, or 4-pixel-align when ETHDR is enabled,
we need Padding to deal with odd width.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile       |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h |   3 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.h  |   2 +-
 drivers/gpu/drm/mediatek/mtk_padding.c  | 206 ++++++++++++++++++++++++
 5 files changed, 213 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_padding.c

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index d4d193f60271..5e4436403b8d 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -16,7 +16,8 @@ mediatek-drm-y := mtk_disp_aal.o \
 		  mtk_dsi.o \
 		  mtk_dpi.o \
 		  mtk_ethdr.o \
-		  mtk_mdp_rdma.o
+		  mtk_mdp_rdma.o \
+		  mtk_padding.o
 
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 2254038519e1..f9fdb1268aa5 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -157,4 +157,7 @@ void mtk_mdp_rdma_config(struct device *dev, struct mtk_mdp_rdma_cfg *cfg,
 const u32 *mtk_mdp_rdma_get_formats(struct device *dev);
 size_t mtk_mdp_rdma_get_num_formats(struct device *dev);
 
+int mtk_padding_clk_enable(struct device *dev);
+void mtk_padding_clk_disable(struct device *dev);
+void mtk_padding_config(struct device *dev, struct cmdq_pkt *cmdq_pkt);
 #endif
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 93552d76b6e7..cde69f39a066 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -973,6 +973,7 @@ static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_dsi_driver,
 	&mtk_ethdr_driver,
 	&mtk_mdp_rdma_driver,
+	&mtk_padding_driver,
 };
 
 static int __init mtk_drm_init(void)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index eb2fd45941f0..562f2db47add 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -64,5 +64,5 @@ extern struct platform_driver mtk_dpi_driver;
 extern struct platform_driver mtk_dsi_driver;
 extern struct platform_driver mtk_ethdr_driver;
 extern struct platform_driver mtk_mdp_rdma_driver;
-
+extern struct platform_driver mtk_padding_driver;
 #endif /* MTK_DRM_DRV_H */
diff --git a/drivers/gpu/drm/mediatek/mtk_padding.c b/drivers/gpu/drm/mediatek/mtk_padding.c
new file mode 100644
index 000000000000..2a29a5fa0a68
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_padding.c
@@ -0,0 +1,206 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023 MediaTek Inc.
+ */
+
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+
+#include "mtk_disp_drv.h"
+#include "mtk_drm_crtc.h"
+#include "mtk_drm_ddp_comp.h"
+
+#define PADDING_CONTROL_REG	0x00
+#define PADDING_BYPASS			BIT(0)
+#define PADDING_ENABLE			BIT(1)
+#define PADDING_PIC_SIZE_REG	0x04
+#define PADDING_H_REG		0x08 /* horizontal */
+#define PADDING_V_REG		0x0c /* vertical */
+#define PADDING_COLOR_REG	0x10
+
+#define PADDING_PIC_SIZE(w, h) (	\
+	((w) & GENMASK(15, 0)) |	\
+	(((h) & GENMASK(15, 0)) >> 16)	\
+)
+
+#define PADDING_H(right) (((right) & GENMASK(12, 0)) >> 16)
+
+#define PADDING_V(bottom) (((bottom) & GENMASK(12, 0)) >> 16)
+
+/* 10-bit RGB without alpha */
+#define PADDING_COLOR(r, g, b) (	\
+	((r) & GENMASK(9, 0)) << 22 |	\
+	((g) & GENMASK(9, 0)) << 12 |	\
+	((b) & GENMASK(9, 0)) << 2	\
+)
+
+/**
+ * struct mtk_padding - basic information of Padding
+ * @clk: Clock of the module
+ * @reg: Virtual address of the Padding for CPU to access
+ * @cmdq_reg: CMDQ setting of the Padding
+ *
+ * Every Padding should have different clock source, register base, and
+ * CMDQ settings, we stored these differences all together.
+ */
+struct mtk_padding {
+	struct clk		*clk;
+	void __iomem		*reg;
+	struct cmdq_client_reg	cmdq_reg;
+};
+
+int mtk_padding_clk_enable(struct device *dev)
+{
+	struct mtk_padding *padding = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(padding->clk);
+}
+
+void mtk_padding_clk_disable(struct device *dev)
+{
+	struct mtk_padding *padding = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(padding->clk);
+}
+
+void mtk_padding_start(struct device *dev)
+{
+	struct mtk_padding *padding = dev_get_drvdata(dev);
+
+	writel(PADDING_ENABLE | PADDING_BYPASS,
+	       padding->reg + PADDING_CONTROL_REG);
+
+	/*
+	 * notice that even the padding is in bypass mode,
+	 * all the settings must be cleared to 0 or
+	 * undefined behaviors could happen
+	 */
+	writel(0, padding->reg + PADDING_PIC_SIZE_REG);
+	writel(0, padding->reg + PADDING_H_REG);
+	writel(0, padding->reg + PADDING_V_REG);
+	writel(0, padding->reg + PADDING_COLOR_REG);
+}
+
+void mtk_padding_stop(struct device *dev)
+{
+	struct mtk_padding *padding = dev_get_drvdata(dev);
+
+	writel_relaxed(0, padding->reg + PADDING_CONTROL_REG);
+}
+
+void mtk_padding_config(struct device *dev, struct cmdq_pkt *cmdq_pkt,
+			u32 width, u32 height, u32 right, u32 bottom, u32 color)
+{
+	bool bypass = true;
+	struct mtk_padding *padding = dev_get_drvdata(dev);
+
+	if (width | height | right | bottom | color)
+		bypass = false;
+
+	mtk_ddp_write_mask(cmdq_pkt, bypass,
+			   &padding->cmdq_reg, padding->reg,
+			   PADDING_CONTROL_REG, PADDING_BYPASS);
+
+	mtk_ddp_write_mask(cmdq_pkt, PADDING_PIC_SIZE(width, height),
+			   &padding->cmdq_reg, padding->reg,
+			   PADDING_PIC_SIZE_REG, GENMASK(31, 0));
+
+	mtk_ddp_write_mask(cmdq_pkt, PADDING_H(right),
+			   &padding->cmdq_reg, padding->reg,
+			   PADDING_H_REG, GENMASK(31, 0));
+
+	mtk_ddp_write_mask(cmdq_pkt, PADDING_V(bottom),
+			   &padding->cmdq_reg, padding->reg,
+			   PADDING_V_REG, GENMASK(31, 0));
+
+	mtk_ddp_write_mask(cmdq_pkt, PADDING_V(bottom),
+			   &padding->cmdq_reg, padding->reg,
+			   PADDING_V_REG, GENMASK(31, 0));
+}
+
+static int mtk_padding_bind(struct device *dev, struct device *master, void *data)
+{
+	return 0;
+}
+
+static void mtk_padding_unbind(struct device *dev, struct device *master, void *data)
+{
+}
+
+static const struct component_ops mtk_padding_component_ops = {
+	.bind	= mtk_padding_bind,
+	.unbind = mtk_padding_unbind,
+};
+
+static int mtk_padding_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_padding *priv;
+	struct resource *res;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(dev, "failed to get clk\n");
+		return PTR_ERR(priv->clk);
+	}
+
+	priv->reg = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(priv->reg)) {
+		dev_err(dev, "failed to do ioremap\n");
+		return PTR_ERR(priv->reg);
+	}
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
+	if (ret) {
+		dev_err(dev, "failed to get gce client reg\n");
+		return ret;
+	}
+#endif
+
+	platform_set_drvdata(pdev, priv);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	ret = component_add(dev, &mtk_padding_component_ops);
+	if (ret) {
+		pm_runtime_disable(dev);
+		return dev_err_probe(dev, ret, "failed to add component\n");
+	}
+
+	return 0;
+}
+
+static int mtk_padding_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &mtk_padding_component_ops);
+	return 0;
+}
+
+static const struct of_device_id mtk_padding_driver_dt_match[] = {
+	{ .compatible = "mediatek,mt8188-padding" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mtk_padding_driver_dt_match);
+
+struct platform_driver mtk_padding_driver = {
+	.probe		= mtk_padding_probe,
+	.remove		= mtk_padding_remove,
+	.driver		= {
+		.name	= "mediatek-padding",
+		.owner	= THIS_MODULE,
+		.of_match_table = mtk_padding_driver_dt_match,
+	},
+};
-- 
2.18.0

