Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEC144D0BE
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 05:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A28A6E9EA;
	Thu, 11 Nov 2021 04:15:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B376EA12
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 04:15:16 +0000 (UTC)
X-UUID: 17f28345d8244b69a22cb0daaa61d957-20211111
X-UUID: 17f28345d8244b69a22cb0daaa61d957-20211111
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1576914690; Thu, 11 Nov 2021 12:15:11 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 11 Nov 2021 12:15:10 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 11 Nov 2021 12:15:09 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v10,
 06/19] media: mtk-vcodec: Manage multi hardware information
Date: Thu, 11 Nov 2021 12:14:47 +0800
Message-ID: <20211111041500.17363-7-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111041500.17363-1-yunfei.dong@mediatek.com>
References: <20211111041500.17363-1-yunfei.dong@mediatek.com>
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
Cc: Irui Wang <irui.wang@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Register each hardware(subdev) as platform device used to manage each
hardware information which includes irq/power/clk. The hardware includes
LAT0, LAT1 and CORE. And call of_platform_populate in main device.

Using subdev_bitmap to record whether each device is register done. Then check
whether all subdev are register done before open main device.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
Fix comments for tzung-bi suggestion.
---
 drivers/media/platform/mtk-vcodec/Makefile    |   5 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 122 +++++++++----
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   | 169 ++++++++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.h   |  51 ++++++
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |   1 +
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     |   2 +
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  23 +++
 7 files changed, 341 insertions(+), 32 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h

diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
index ca8e9e7a9c4e..d4f7a14796cf 100644
--- a/drivers/media/platform/mtk-vcodec/Makefile
+++ b/drivers/media/platform/mtk-vcodec/Makefile
@@ -2,7 +2,8 @@
 
 obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) += mtk-vcodec-dec.o \
 				       mtk-vcodec-enc.o \
-				       mtk-vcodec-common.o
+				       mtk-vcodec-common.o \
+					   mtk-vcodec-dec-hw.o
 
 mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
 		vdec/vdec_vp8_if.o \
@@ -16,6 +17,8 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
 		mtk_vcodec_dec_stateless.o \
 		mtk_vcodec_dec_pm.o \
 
+mtk-vcodec-dec-hw-y := mtk_vcodec_dec_hw.o
+
 mtk-vcodec-enc-y := venc/venc_vp8_if.o \
 		venc/venc_h264_if.o \
 		mtk_vcodec_enc.o \
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index b7a51e96d4ba..c56411768234 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -18,19 +18,51 @@
 
 #include "mtk_vcodec_drv.h"
 #include "mtk_vcodec_dec.h"
+#include "mtk_vcodec_dec_hw.h"
 #include "mtk_vcodec_dec_pm.h"
 #include "mtk_vcodec_intr.h"
 #include "mtk_vcodec_util.h"
 #include "mtk_vcodec_fw.h"
 
-#define VDEC_HW_ACTIVE	0x10
-#define VDEC_IRQ_CFG	0x11
-#define VDEC_IRQ_CLR	0x10
-#define VDEC_IRQ_CFG_REG	0xa4
-
 module_param(mtk_v4l2_dbg_level, int, 0644);
 module_param(mtk_vcodec_dbg, bool, 0644);
 
+static int mtk_vcodec_subdev_device_check(struct mtk_vcodec_ctx *ctx)
+{
+	struct mtk_vcodec_dev *vdec_dev = ctx->dev;
+	struct platform_device *pdev = vdec_dev->plat_dev;
+	struct device_node *subdev_node;
+	enum mtk_vdec_hw_id hw_idx;
+	const struct of_device_id *of_id;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mtk_vdec_hw_match); i++) {
+		of_id = &mtk_vdec_hw_match[i];
+		subdev_node = of_find_compatible_node(NULL, NULL,
+			of_id->compatible);
+		if (!subdev_node)
+			continue;
+
+		if (!of_device_is_available(subdev_node)) {
+			of_node_put(subdev_node);
+			dev_err(&pdev->dev, "Fail to get subdev node\n");
+			continue;
+		}
+
+		hw_idx = (enum mtk_vdec_hw_id)(uintptr_t)of_id->data;
+		vdec_dev->subdev_node[hw_idx] = subdev_node;
+
+		if (!test_bit(hw_idx, vdec_dev->subdev_bitmap)) {
+			of_node_put(subdev_node);
+			dev_err(&pdev->dev, "Vdec %d is not ready", hw_idx);
+			return -EAGAIN;
+		}
+		of_node_put(subdev_node);
+	}
+
+	return 0;
+}
+
 static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
 {
 	struct mtk_vcodec_dev *dev = priv;
@@ -95,6 +127,42 @@ static int mtk_vcodec_get_reg_bases(struct mtk_vcodec_dev *dev)
 	return 0;
 }
 
+static int mtk_vcodec_init_dec_resources(struct mtk_vcodec_dev *dev)
+{
+	struct platform_device *pdev = dev->plat_dev;
+	int ret;
+
+	ret = mtk_vcodec_get_reg_bases(dev);
+	if (ret)
+		return ret;
+
+	if (dev->vdec_pdata->is_subdev_supported)
+		return 0;
+
+	dev->dec_irq = platform_get_irq(pdev, 0);
+	if (dev->dec_irq < 0) {
+		dev_err(&pdev->dev, "failed to get irq number");
+		return dev->dec_irq;
+	}
+
+	irq_set_status_flags(dev->dec_irq, IRQ_NOAUTOEN);
+	ret = devm_request_irq(&pdev->dev, dev->dec_irq,
+		mtk_vcodec_dec_irq_handler, 0, pdev->name, dev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to install dev->dec_irq %d (%d)",
+			dev->dec_irq, ret);
+		return ret;
+	}
+
+	ret = mtk_vcodec_init_dec_pm(pdev, &dev->pm);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to get mt vcodec clock source");
+		return ret;
+	}
+
+	return 0;
+}
+
 static int fops_vcodec_open(struct file *file)
 {
 	struct mtk_vcodec_dev *dev = video_drvdata(file);
@@ -116,6 +184,12 @@ static int fops_vcodec_open(struct file *file)
 	init_waitqueue_head(&ctx->queue);
 	mutex_init(&ctx->lock);
 
+	ret = mtk_vcodec_subdev_device_check(ctx);
+	if (ret) {
+		mtk_v4l2_err("Failed to check vdec comp device.");
+		goto err_ctrls_setup;
+	}
+
 	ctx->type = MTK_INST_DECODER;
 	ret = dev->vdec_pdata->ctrls_setup(ctx);
 	if (ret) {
@@ -220,7 +294,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 {
 	struct mtk_vcodec_dev *dev;
 	struct video_device *vfd_dec;
-	struct resource *res;
 	phandle rproc_phandle;
 	enum mtk_vcodec_fw_type fw_type;
 	int ret;
@@ -249,32 +322,10 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
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
+	ret = mtk_vcodec_init_dec_resources(dev);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to install dev->dec_irq %d (%d)",
-			dev->dec_irq,
-			ret);
-		goto err_res;
+		dev_err(&pdev->dev, "Failed to init pm and registers");
+		goto err_dec_pm;
 	}
 
 	mutex_init(&dev->dec_mutex);
@@ -329,6 +380,15 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_event_workq;
 	}
 
+	if (dev->vdec_pdata->is_subdev_supported) {
+		ret = of_platform_populate(pdev->dev.of_node, NULL, NULL,
+			&pdev->dev);
+		if (ret) {
+			mtk_v4l2_err("Main device of_platform_populate failed.");
+			goto err_event_workq;
+		}
+	}
+
 	if (dev->vdec_pdata->uses_stateless_api) {
 		dev->mdev_dec.dev = &pdev->dev;
 		strscpy(dev->mdev_dec.model, MTK_VCODEC_DEC_NAME,
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
new file mode 100644
index 000000000000..8280c575bd99
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Yunfei Dong <yunfei.dong@mediatek.com>
+ */
+
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
+const struct of_device_id mtk_vdec_hw_match[] = {
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
+EXPORT_SYMBOL_GPL(mtk_vdec_hw_match);
+
+MODULE_DEVICE_TABLE(of, mtk_vdec_hw_match);
+
+static irqreturn_t mtk_vdec_hw_irq_handler(int irq, void *priv)
+{
+	struct mtk_vdec_hw_dev *dev = priv;
+	struct mtk_vcodec_ctx *ctx;
+	u32 cg_status;
+	unsigned int dec_done_status;
+	void __iomem *vdec_misc_addr = dev->reg_base[VDEC_HW_MISC] +
+					VDEC_IRQ_CFG_REG;
+
+	ctx = mtk_vcodec_get_curr_ctx(dev->main_dev);
+
+	/* check if HW active or not */
+	cg_status = readl(dev->reg_base[VDEC_HW_SYS]);
+	if (cg_status & VDEC_HW_ACTIVE) {
+		mtk_v4l2_err("vdec active is not 0x0 (0x%08x)",
+			cg_status);
+		return IRQ_HANDLED;
+	}
+
+	dec_done_status = readl(vdec_misc_addr);
+	if ((dec_done_status & MTK_VDEC_IRQ_STATUS_DEC_SUCCESS) !=
+	    MTK_VDEC_IRQ_STATUS_DEC_SUCCESS)
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
+static int mtk_vdec_hw_init_irq(struct mtk_vdec_hw_dev *dev)
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
+				mtk_vdec_hw_irq_handler, 0, pdev->name, dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to install dev->dec_irq %d (%d)",
+			dev->dec_irq, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mtk_vdec_hw_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_vdec_hw_dev *subdev_dev;
+	struct mtk_vcodec_dev *main_dev;
+	const struct of_device_id *of_id;
+	int hw_idx;
+	int ret;
+
+	if (!dev->parent)
+		return -EPROBE_DEFER;
+
+	main_dev = dev_get_drvdata(dev->parent);
+	if (!main_dev)
+		return -EPROBE_DEFER;
+
+	subdev_dev = devm_kzalloc(dev, sizeof(*subdev_dev), GFP_KERNEL);
+	if (!subdev_dev)
+		return -ENOMEM;
+
+	subdev_dev->plat_dev = pdev;
+	ret = mtk_vcodec_init_dec_pm(pdev, &subdev_dev->pm);
+	if (ret)
+		return ret;
+
+	subdev_dev->reg_base[VDEC_HW_MISC] =
+		devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR((__force void *)subdev_dev->reg_base[VDEC_HW_MISC])) {
+		ret = PTR_ERR((__force void *)subdev_dev->reg_base[VDEC_HW_MISC]);
+		goto err;
+	}
+
+	ret = mtk_vdec_hw_init_irq(subdev_dev);
+	if (ret)
+		goto err;
+
+	of_id = of_match_device(mtk_vdec_hw_match, dev);
+	if (!of_id) {
+		dev_err(dev, "Can't get vdec subdev id.\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	hw_idx = (enum mtk_vdec_hw_id)(uintptr_t)of_id->data;
+	if (hw_idx >= MTK_VDEC_HW_MAX) {
+		dev_err(dev, "Hardware index %d not correct.\n", hw_idx);
+		ret = -EINVAL;
+		goto err;
+	}
+
+	main_dev->subdev_dev[hw_idx] = subdev_dev;
+	subdev_dev->hw_idx = hw_idx;
+	subdev_dev->main_dev = main_dev;
+	subdev_dev->reg_base[VDEC_HW_SYS] = main_dev->reg_base[VDEC_HW_SYS];
+	set_bit(subdev_dev->hw_idx, main_dev->subdev_bitmap);
+
+	platform_set_drvdata(pdev, subdev_dev);
+	return 0;
+err:
+	mtk_vcodec_release_dec_pm(&subdev_dev->pm);
+	return ret;
+}
+
+static struct platform_driver mtk_vdec_driver = {
+	.probe	= mtk_vdec_hw_probe,
+	.driver	= {
+		.name	= "mtk-vdec-comp",
+		.of_match_table = mtk_vdec_hw_match,
+	},
+};
+
+module_platform_driver(mtk_vdec_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Mediatek video decoder hardware driver");
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
new file mode 100644
index 000000000000..f7f36790629d
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
@@ -0,0 +1,51 @@
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
+#define VDEC_HW_ACTIVE 0x10
+#define VDEC_IRQ_CFG 0x11
+#define VDEC_IRQ_CLR 0x10
+#define VDEC_IRQ_CFG_REG 0xa4
+
+extern const struct of_device_id mtk_vdec_hw_match[MTK_VDEC_HW_MAX];
+
+/**
+ * enum mtk_vdec_hw_reg_idx - subdev hardware register base index
+ */
+enum mtk_vdec_hw_reg_idx {
+	VDEC_HW_SYS,
+	VDEC_HW_MISC,
+	VDEC_HW_MAX
+};
+
+/**
+ * struct mtk_vdec_hw_dev - vdec hardware driver data
+ * @plat_dev: platform device
+ * @main_dev: main device
+ * @reg_base: Mapped address of MTK Vcodec registers.
+ *
+ * @dec_irq: decoder irq resource
+ * @pm: power management control
+ * @hw_idx: each hardware index
+ */
+struct mtk_vdec_hw_dev {
+	struct platform_device *plat_dev;
+	struct mtk_vcodec_dev *main_dev;
+	void __iomem *reg_base[VDEC_HW_MAX];
+
+	int dec_irq;
+	struct mtk_vcodec_pm pm;
+	int hw_idx;
+};
+
+#endif /* _MTK_VCODEC_DEC_HW_H_ */
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
index bef49244e61b..c7f9259ad094 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
@@ -625,4 +625,5 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
 	.num_framesizes = NUM_SUPPORTED_FRAMESIZE,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
+	.is_subdev_supported = false,
 };
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
index 26e4d6f4ec04..2d285515b625 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
@@ -357,6 +357,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.uses_stateless_api = true,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
+	.is_subdev_supported = false,
 };
 
 const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata = {
@@ -373,4 +374,5 @@ const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata = {
 	.uses_stateless_api = true,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
+	.is_subdev_supported = true,
 };
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 0fa9d85114b9..7eda66086459 100644
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
@@ -332,6 +343,7 @@ enum mtk_chip {
  *
  * @chip: chip this decoder is compatible with
  *
+ * @is_subdev_supported: whether support parent-node architecture(subdev)
  * @uses_stateless_api: whether the decoder uses the stateless API with requests
  */
 
@@ -353,6 +365,7 @@ struct mtk_vcodec_dec_pdata {
 
 	enum mtk_chip chip;
 
+	bool is_subdev_supported;
 	bool uses_stateless_api;
 };
 
@@ -423,6 +436,11 @@ struct mtk_vcodec_enc_pdata {
  * @pm: power management control
  * @dec_capability: used to identify decode capability, ex: 4k
  * @enc_capability: used to identify encode capability
+ *
+ * @subdev_dev: subdev hardware device
+ * @subdev_node: subdev node
+ *
+ * @subdev_bitmap: used to record hardware is ready or not
  */
 struct mtk_vcodec_dev {
 	struct v4l2_device v4l2_dev;
@@ -460,6 +478,11 @@ struct mtk_vcodec_dev {
 	struct mtk_vcodec_pm pm;
 	unsigned int dec_capability;
 	unsigned int enc_capability;
+
+	void *subdev_dev[MTK_VDEC_HW_MAX];
+	struct device_node *subdev_node[MTK_VDEC_HW_MAX];
+
+	DECLARE_BITMAP(subdev_bitmap, MTK_VDEC_HW_MAX);
 };
 
 static inline struct mtk_vcodec_ctx *fh_to_ctx(struct v4l2_fh *fh)
-- 
2.25.1

