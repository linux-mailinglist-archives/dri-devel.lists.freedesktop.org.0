Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB123FD575
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 10:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6B06E14B;
	Wed,  1 Sep 2021 08:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D316E134
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 08:32:30 +0000 (UTC)
X-UUID: e9066087be604d2b919b12cfe3268093-20210901
X-UUID: e9066087be604d2b919b12cfe3268093-20210901
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1334056965; Wed, 01 Sep 2021 16:32:26 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 16:32:24 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Sep 2021 16:32:23 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi
 Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
CC: Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz
 Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6,
 04/15] media: mtk-vcodec: Use component framework to manage each
 hardware information
Date: Wed, 1 Sep 2021 16:32:04 +0800
Message-ID: <20210901083215.25984-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210901083215.25984-1-yunfei.dong@mediatek.com>
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Uses component framework to manage each hardware information which
includes irq/power/clk. The hardware includes LAT0, LAT1 and CORE.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 drivers/media/platform/mtk-vcodec/Makefile    |   1 +
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |   1 +
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 194 +++++++++++++++---
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   | 184 +++++++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.h   |  49 +++++
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |   1 +
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     |   1 +
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  19 ++
 8 files changed, 416 insertions(+), 34 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h

diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
index ca8e9e7a9c4e..edeb3b66e9e9 100644
--- a/drivers/media/platform/mtk-vcodec/Makefile
+++ b/drivers/media/platform/mtk-vcodec/Makefile
@@ -15,6 +15,7 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
 		mtk_vcodec_dec_stateful.o \
 		mtk_vcodec_dec_stateless.o \
 		mtk_vcodec_dec_pm.o \
+		mtk_vcodec_dec_hw.o \
 
 mtk-vcodec-enc-y := venc/venc_vp8_if.o \
 		venc/venc_h264_if.o \
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
index 9fbd24186c1a..c509224cbff4 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
@@ -66,6 +66,7 @@ extern const struct v4l2_ioctl_ops mtk_vdec_ioctl_ops;
 extern const struct v4l2_m2m_ops mtk_vdec_m2m_ops;
 extern const struct media_device_ops mtk_vcodec_media_ops;
 
+extern struct platform_driver mtk_vdec_comp_driver;
 
 /*
  * mtk_vdec_lock/mtk_vdec_unlock are for ctx instance to
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index dd749d41c75a..4c6f4d7612fa 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -5,6 +5,7 @@
  *         Tiffany Lin <tiffany.lin@mediatek.com>
  */
 
+#include <linux/component.h>
 #include <linux/slab.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -18,19 +19,90 @@
 
 #include "mtk_vcodec_drv.h"
 #include "mtk_vcodec_dec.h"
+#include "mtk_vcodec_dec_hw.h"
 #include "mtk_vcodec_dec_pm.h"
 #include "mtk_vcodec_intr.h"
-#include "mtk_vcodec_util.h"
 #include "mtk_vcodec_fw.h"
 
-#define VDEC_HW_ACTIVE	0x10
-#define VDEC_IRQ_CFG	0x11
-#define VDEC_IRQ_CLR	0x10
-#define VDEC_IRQ_CFG_REG	0xa4
-
 module_param(mtk_v4l2_dbg_level, int, 0644);
 module_param(mtk_vcodec_dbg, bool, 0644);
 
+static struct of_device_id mtk_vdec_drv_ids[] = {
+	{
+		.compatible = "mediatek,mtk-vcodec-lat",
+		.data = (void *)MTK_VDEC_LAT0,
+	},
+	{
+		.compatible = "mediatek,mtk-vcodec-core",
+		.data = (void *)MTK_VDEC_CORE,
+	},
+	{},
+};
+
+static inline int mtk_vdec_compare_of(struct device *dev, void *data)
+{
+	return dev->of_node == data;
+}
+
+static inline void mtk_vdec_release_of(struct device *dev, void *data)
+{
+	of_node_put(data);
+}
+
+static inline int mtk_vdec_bind(struct device *dev)
+{
+	struct mtk_vcodec_dev *data = dev_get_drvdata(dev);
+
+	return component_bind_all(dev, data);
+}
+
+static inline void mtk_vdec_unbind(struct device *dev)
+{
+	struct mtk_vcodec_dev *data = dev_get_drvdata(dev);
+
+	component_unbind_all(dev, data);
+}
+
+static const struct component_master_ops mtk_vdec_ops = {
+   .bind = mtk_vdec_bind,
+   .unbind = mtk_vdec_unbind,
+};
+
+static struct component_match *mtk_vcodec_match_add(
+	struct mtk_vcodec_dev *vdec_dev)
+ {
+	struct platform_device *pdev = vdec_dev->plat_dev;
+	struct component_match *match = NULL;
+	struct device_node *comp_node;
+	enum mtk_vdec_hw_id comp_idx;
+	const struct of_device_id *of_id;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mtk_vdec_drv_ids); i++) {
+		of_id = &mtk_vdec_drv_ids[i];
+		comp_node = of_find_compatible_node(NULL, NULL,
+			of_id->compatible);
+		if (!comp_node)
+			continue;
+
+		if (!of_device_is_available(comp_node)) {
+			of_node_put(comp_node);
+			dev_err(&pdev->dev, "Fail to get MMSYS node\n");
+			continue;
+		}
+
+		comp_idx = (enum mtk_vdec_hw_id)of_id->data;
+		mtk_v4l2_debug(4, "Get component:hw_id(%d),vdec_dev(0x%p),comp_node(0x%p)\n",
+			comp_idx, vdec_dev, comp_node);
+		vdec_dev->component_node[comp_idx] = comp_node;
+
+		component_match_add_release(&pdev->dev, &match, mtk_vdec_release_of,
+			mtk_vdec_compare_of, comp_node);
+	}
+
+	return match;
+}
+
 static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
 {
 	struct mtk_vcodec_dev *dev = priv;
@@ -95,6 +167,58 @@ static int mtk_vcodec_get_reg_bases(struct mtk_vcodec_dev *dev)
 	return 0;
 }
 
+static int mtk_vcodec_init_master(struct mtk_vcodec_dev *dev)
+{
+	struct platform_device *pdev = dev->plat_dev;
+	struct component_match *match;
+	int ret;
+
+	match = mtk_vcodec_match_add(dev);
+	if (IS_ERR_OR_NULL(match))
+		return -EINVAL;
+
+	ret = component_master_add_with_match(&pdev->dev, &mtk_vdec_ops, match);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int mtk_vcodec_init_dec_params(struct mtk_vcodec_dev *dev)
+{
+	struct platform_device *pdev = dev->plat_dev;
+	int ret;
+
+	ret = mtk_vcodec_get_reg_bases(dev);
+	if (ret)
+		return ret;
+
+	if (!dev->vdec_pdata->is_comp_supported) {
+		dev->dec_irq = platform_get_irq(pdev, 0);
+		if (dev->dec_irq < 0) {
+			dev_err(&pdev->dev, "failed to get irq number");
+			return dev->dec_irq;
+		}
+
+		irq_set_status_flags(dev->dec_irq, IRQ_NOAUTOEN);
+		ret = devm_request_irq(&pdev->dev, dev->dec_irq,
+			mtk_vcodec_dec_irq_handler, 0, pdev->name, dev);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to install dev->dec_irq %d (%d)",
+				dev->dec_irq, ret);
+			return ret;
+		}
+
+		ret = mtk_vcodec_init_dec_pm(pdev, &dev->pm);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "failed to get mt vcodec clock source");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int fops_vcodec_open(struct file *file)
 {
 	struct mtk_vcodec_dev *dev = video_drvdata(file);
@@ -220,7 +344,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 {
 	struct mtk_vcodec_dev *dev;
 	struct video_device *vfd_dec;
-	struct resource *res;
 	phandle rproc_phandle;
 	enum mtk_vcodec_fw_type fw_type;
 	int ret;
@@ -249,32 +372,10 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	if (IS_ERR(dev->fw_handler))
 		return PTR_ERR(dev->fw_handler);
 
-	ret = mtk_vcodec_init_dec_pm(dev->plat_dev, &dev->pm);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to get mt vcodec clock source");
-		goto err_dec_pm;
-	}
-
-	ret = mtk_vcodec_get_reg_bases(dev);
-	if (ret)
-		goto err_res;
-
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (res == NULL) {
-		dev_err(&pdev->dev, "failed to get irq resource");
-		ret = -ENOENT;
-		goto err_res;
-	}
-
-	dev->dec_irq = platform_get_irq(pdev, 0);
-	irq_set_status_flags(dev->dec_irq, IRQ_NOAUTOEN);
-	ret = devm_request_irq(&pdev->dev, dev->dec_irq,
-			mtk_vcodec_dec_irq_handler, 0, pdev->name, dev);
+	ret = mtk_vcodec_init_dec_params(dev);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to install dev->dec_irq %d (%d)",
-			dev->dec_irq,
-			ret);
-		goto err_res;
+		dev_err(&pdev->dev, "Failed to init pm and registers");
+		goto err_dec_pm;
 	}
 
 	mutex_init(&dev->dec_mutex);
@@ -362,8 +463,14 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	mtk_v4l2_debug(0, "decoder registered as /dev/video%d",
 		vfd_dec->num);
 
-	return 0;
+	if (dev->vdec_pdata->is_comp_supported) {
+		ret = mtk_vcodec_init_master(dev);
+		if (ret < 0)
+			goto err_component_match;
+	}
 
+	return 0;
+err_component_match:
 err_dec_reg:
 	if (dev->vdec_pdata->uses_stateless_api)
 		media_device_unregister(&dev->mdev_dec);
@@ -382,6 +489,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	mtk_vcodec_release_dec_pm(&dev->pm);
 err_dec_pm:
 	mtk_vcodec_fw_release(dev->fw_handler);
+
 	return ret;
 }
 
@@ -436,7 +544,25 @@ static struct platform_driver mtk_vcodec_dec_driver = {
 	},
 };
 
-module_platform_driver(mtk_vcodec_dec_driver);
+static struct platform_driver * const mtk_vdec_drivers[] = {
+	&mtk_vdec_comp_driver,
+	&mtk_vcodec_dec_driver,
+};
+
+static int __init mtk_vdec_init(void)
+{
+	return platform_register_drivers(mtk_vdec_drivers,
+					 ARRAY_SIZE(mtk_vdec_drivers));
+}
+
+static void __exit mtk_vdec_exit(void)
+{
+	platform_unregister_drivers(mtk_vdec_drivers,
+				    ARRAY_SIZE(mtk_vdec_drivers));
+}
+
+module_init(mtk_vdec_init);
+module_exit(mtk_vdec_exit);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Mediatek video codec V4L2 decoder driver");
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
new file mode 100644
index 000000000000..5e1b7670ba5b
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Yunfei Dong <yunfei.dong@mediatek.com>
+ */
+
+#include <linux/component.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
+
+#include "mtk_vcodec_drv.h"
+#include "mtk_vcodec_dec.h"
+#include "mtk_vcodec_dec_hw.h"
+#include "mtk_vcodec_dec_pm.h"
+#include "mtk_vcodec_intr.h"
+#include "mtk_vcodec_util.h"
+
+static int mtk_vdec_comp_bind(struct device *dev, struct device *master,
+	void *data)
+{
+	struct mtk_vdec_comp_dev *comp_dev = dev_get_drvdata(dev);
+	struct mtk_vcodec_dev *master_dev = data;
+	int i;
+
+	for (i = 0; i < MTK_VDEC_HW_MAX; i++) {
+		if (dev->of_node != master_dev->component_node[i])
+			continue;
+
+		master_dev->comp_dev[i] = comp_dev;
+		comp_dev->comp_idx = i;
+		comp_dev->master_dev = master_dev;
+		break;
+	}
+
+	if (i == MTK_VDEC_HW_MAX) {
+		dev_err(dev, "Failed to get component node\n");
+		return -EINVAL;
+	}
+
+	comp_dev->reg_base[VDEC_COMP_SYS] =
+		master_dev->reg_base[VDEC_COMP_SYS];
+	return 0;
+}
+
+static void mtk_vdec_comp_unbind(struct device *dev, struct device *master,
+	void *data)
+{
+	struct mtk_vdec_comp_dev *comp_dev = dev_get_drvdata(dev);
+
+	comp_dev->reg_base[VDEC_COMP_SYS] = NULL;
+}
+
+static const struct component_ops mtk_vdec_hw_component_ops = {
+	.bind = mtk_vdec_comp_bind,
+	.unbind = mtk_vdec_comp_unbind,
+};
+
+static irqreturn_t mtk_vdec_comp_irq_handler(int irq, void *priv)
+{
+	struct mtk_vdec_comp_dev *dev = priv;
+	struct mtk_vcodec_ctx *ctx;
+	u32 cg_status;
+	unsigned int dec_done_status;
+	void __iomem *vdec_misc_addr = dev->reg_base[VDEC_COMP_MISC] +
+					VDEC_IRQ_CFG_REG;
+
+	ctx = mtk_vcodec_get_curr_ctx(dev->master_dev);
+
+	/* check if HW active or not */
+	cg_status = readl(dev->reg_base[VDEC_COMP_SYS]);
+	if ((cg_status & VDEC_HW_ACTIVE) != 0) {
+		mtk_v4l2_err("vdec active is not 0x0 (0x%08x)",
+			cg_status);
+		return IRQ_HANDLED;
+	}
+
+	dec_done_status = readl(vdec_misc_addr);
+	if ((dec_done_status & MTK_VDEC_IRQ_STATUS_DEC_SUCCESS) !=
+		MTK_VDEC_IRQ_STATUS_DEC_SUCCESS)
+		return IRQ_HANDLED;
+
+	/* clear interrupt */
+	writel(dec_done_status | VDEC_IRQ_CFG, vdec_misc_addr);
+	writel(dec_done_status & ~VDEC_IRQ_CLR, vdec_misc_addr);
+
+	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED);
+
+	mtk_v4l2_debug(3, "wake up ctx %d, dec_done_status=%x",
+		ctx->id, dec_done_status);
+
+	return IRQ_HANDLED;
+}
+
+static int mtk_vdec_comp_init_irq(struct mtk_vdec_comp_dev *dev)
+{
+	struct platform_device *pdev = dev->plat_dev;
+	int ret;
+
+	dev->dec_irq = platform_get_irq(pdev, 0);
+	if (dev->dec_irq < 0) {
+		dev_err(&pdev->dev, "Failed to get irq resource");
+		return dev->dec_irq;
+	}
+
+	irq_set_status_flags(dev->dec_irq, IRQ_NOAUTOEN);
+	ret = devm_request_irq(&pdev->dev, dev->dec_irq,
+				mtk_vdec_comp_irq_handler, 0, pdev->name, dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to install dev->dec_irq %d (%d)",
+			dev->dec_irq, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mtk_vdec_comp_probe(struct platform_device *pdev)
+{
+	struct mtk_vdec_comp_dev *dev;
+	int ret;
+
+	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	dev->plat_dev = pdev;
+	ret = mtk_vcodec_init_dec_pm(pdev, &dev->pm);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to get mt vcodec clock source");
+		return ret;
+	}
+
+	dev->reg_base[VDEC_COMP_MISC] =
+		devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR((__force void *)dev->reg_base[VDEC_COMP_MISC])) {
+		ret = PTR_ERR((__force void *)dev->reg_base[VDEC_COMP_MISC]);
+		goto err;
+	}
+
+	if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL))
+		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
+
+	ret = mtk_vdec_comp_init_irq(dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register irq handler.\n");
+		goto err;
+	}
+
+	platform_set_drvdata(pdev, dev);
+
+	ret = component_add(&pdev->dev, &mtk_vdec_hw_component_ops);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to add component: %d\n", ret);
+		goto err;
+	}
+
+	return 0;
+err:
+	mtk_vcodec_release_dec_pm(&dev->pm);
+	return ret;
+}
+
+static const struct of_device_id mtk_vdec_comp_ids[] = {
+	{
+		.compatible = "mediatek,mtk-vcodec-lat",
+	},
+	{
+		.compatible = "mediatek,mtk-vcodec-core",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_vdec_comp_ids);
+
+struct platform_driver mtk_vdec_comp_driver = {
+	.probe	= mtk_vdec_comp_probe,
+	.driver	= {
+		.name	= "mtk-vdec-comp",
+		.of_match_table = mtk_vdec_comp_ids,
+	},
+};
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
new file mode 100644
index 000000000000..8d6e818a3474
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Yunfei Dong <yunfei.dong@mediatek.com>
+ */
+
+#ifndef _MTK_VCODEC_DEC_HW_H_
+#define _MTK_VCODEC_DEC_HW_H_
+
+#include <linux/io.h>
+#include <linux/platform_device.h>
+
+#include "mtk_vcodec_drv.h"
+
+#define VDEC_HW_ACTIVE	0x10
+#define VDEC_IRQ_CFG	0x11
+#define VDEC_IRQ_CLR	0x10
+#define VDEC_IRQ_CFG_REG	0xa4
+
+/**
+ * enum mtk_comp_hw_reg_idx - component register base index
+ */
+enum mtk_comp_hw_reg_idx {
+	VDEC_COMP_SYS,
+	VDEC_COMP_MISC,
+	VDEC_COMP_MAX
+};
+
+/**
+ * struct mtk_vdec_comp_dev - component framwork driver data
+ * @plat_dev: platform device
+ * @master_dev: master device
+ * @reg_base: Mapped address of MTK Vcodec registers.
+ *
+ * @dec_irq: decoder irq resource
+ * @pm: power management control
+ * @comp_idx: component index
+ */
+struct mtk_vdec_comp_dev {
+	struct platform_device *plat_dev;
+	struct mtk_vcodec_dev *master_dev;
+	void __iomem *reg_base[VDEC_COMP_MAX];
+
+	int dec_irq;
+	struct mtk_vcodec_pm pm;
+	int comp_idx;
+};
+
+#endif /* _MTK_VCODEC_DEC_HW_H_ */
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
index 59c24b22ab6d..4f9a80ce15d8 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
@@ -623,4 +623,5 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
 	.num_framesizes = NUM_SUPPORTED_FRAMESIZE,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
+	.is_comp_supported = false,
 };
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
index 8f4a1f0a0769..762633572b49 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
@@ -357,4 +357,5 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.uses_stateless_api = true,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
+	.is_comp_supported = false,
 };
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 973b0b3649c6..e530757a9b5a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -93,6 +93,17 @@ enum mtk_fmt_type {
 	MTK_FMT_FRAME = 2,
 };
 
+/**
+ * struct mtk_vdec_hw_id - Hardware index used to separate
+ *                         different hardware
+ */
+enum mtk_vdec_hw_id {
+	MTK_VDEC_CORE,
+	MTK_VDEC_LAT0,
+	MTK_VDEC_LAT1,
+	MTK_VDEC_HW_MAX,
+};
+
 /*
  * struct mtk_video_fmt - Structure used to store information about pixelformats
  */
@@ -331,6 +342,7 @@ enum mtk_chip {
  *
  * @chip: chip this decoder is compatible with
  *
+ * @is_comp_supported: true: using compoent framework, false: not support
  * @uses_stateless_api: whether the decoder uses the stateless API with requests
  */
 
@@ -352,6 +364,7 @@ struct mtk_vcodec_dec_pdata {
 
 	enum mtk_chip chip;
 
+	bool is_comp_supported;
 	bool uses_stateless_api;
 };
 
@@ -422,6 +435,9 @@ struct mtk_vcodec_enc_pdata {
  * @pm: power management control
  * @dec_capability: used to identify decode capability, ex: 4k
  * @enc_capability: used to identify encode capability
+ *
+ * @comp_dev: component hardware device
+ * @component_node: component node
  */
 struct mtk_vcodec_dev {
 	struct v4l2_device v4l2_dev;
@@ -459,6 +475,9 @@ struct mtk_vcodec_dev {
 	struct mtk_vcodec_pm pm;
 	unsigned int dec_capability;
 	unsigned int enc_capability;
+
+	void *comp_dev[MTK_VDEC_HW_MAX];
+	struct device_node *component_node[MTK_VDEC_HW_MAX];
 };
 
 static inline struct mtk_vcodec_ctx *fh_to_ctx(struct v4l2_fh *fh)
-- 
2.25.1

