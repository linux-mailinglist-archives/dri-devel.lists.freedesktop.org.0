Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAB648D141
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 05:11:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A304B10F74E;
	Thu, 13 Jan 2022 04:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5824010F6F2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 04:11:15 +0000 (UTC)
X-UUID: 90c482f174a1459c92a7dc96df668c0a-20220113
X-UUID: 90c482f174a1459c92a7dc96df668c0a-20220113
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1852576115; Thu, 13 Jan 2022 12:11:11 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Jan 2022 12:11:10 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 13 Jan 2022 12:11:09 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Jan 2022 12:11:08 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v19,
 08/19] media: mtk-vcodec: Add to support multi hardware decode
Date: Thu, 13 Jan 2022 12:10:44 +0800
Message-ID: <20220113041055.25213-9-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220113041055.25213-1-yunfei.dong@mediatek.com>
References: <20220113041055.25213-1-yunfei.dong@mediatek.com>
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are more than two hardwares for decoder: LAT0, LAT1 and CORE. In
order to manage these hardwares, register each hardware as independent
platform device for the larbs are different.

Each hardware module controls its own information which includes
interrupt/power/clocks/registers.

Calling of_platform_populate in parent device, and use subdev_bitmap to
record whether the hardwares are registered.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Steve Cho <stevecho@chromium.org>
---
 drivers/media/platform/mtk-vcodec/Makefile    |   5 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  85 +++++---
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   | 198 ++++++++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.h   |  52 +++++
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |   1 +
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     |   3 +
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  21 ++
 7 files changed, 333 insertions(+), 32 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h

diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
index ca8e9e7a9c4e..c61bfb179bcc 100644
--- a/drivers/media/platform/mtk-vcodec/Makefile
+++ b/drivers/media/platform/mtk-vcodec/Makefile
@@ -2,7 +2,8 @@
 
 obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) += mtk-vcodec-dec.o \
 				       mtk-vcodec-enc.o \
-				       mtk-vcodec-common.o
+				       mtk-vcodec-common.o \
+				       mtk-vcodec-dec-hw.o
 
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
index 201ae71d0899..7e2c9c381dd2 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -18,16 +18,12 @@
 
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
 static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
 {
 	struct mtk_vcodec_dev *dev = priv;
@@ -92,6 +88,42 @@ static int mtk_vcodec_get_reg_bases(struct mtk_vcodec_dev *dev)
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
+			       mtk_vcodec_dec_irq_handler, 0, pdev->name, dev);
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
@@ -113,6 +145,11 @@ static int fops_vcodec_open(struct file *file)
 	init_waitqueue_head(&ctx->queue);
 	mutex_init(&ctx->lock);
 
+	if (dev->vdec_pdata->is_subdev_supported && dev->subdev_prob_done) {
+		ret = dev->subdev_prob_done(dev);
+		if (ret)
+			goto err_ctrls_setup;
+	}
 	ctx->type = MTK_INST_DECODER;
 	ret = dev->vdec_pdata->ctrls_setup(ctx);
 	if (ret) {
@@ -217,7 +254,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 {
 	struct mtk_vcodec_dev *dev;
 	struct video_device *vfd_dec;
-	struct resource *res;
 	phandle rproc_phandle;
 	enum mtk_vcodec_fw_type fw_type;
 	int ret;
@@ -246,32 +282,10 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
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
+		dev_err(&pdev->dev, "Failed to init dec resources");
+		goto err_dec_pm;
 	}
 
 	mutex_init(&dev->dec_mutex);
@@ -326,6 +340,15 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_event_workq;
 	}
 
+	if (dev->vdec_pdata->is_subdev_supported) {
+		ret = of_platform_populate(pdev->dev.of_node, NULL, NULL,
+					   &pdev->dev);
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
index 000000000000..cde9442e7ce6
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
@@ -0,0 +1,198 @@
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
+static const struct of_device_id mtk_vdec_hw_match[] = {
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
+MODULE_DEVICE_TABLE(of, mtk_vdec_hw_match);
+
+static int mtk_vdec_hw_prob_done(struct mtk_vcodec_dev *vdec_dev)
+{
+	struct platform_device *pdev = vdec_dev->plat_dev;
+	struct device_node *subdev_node;
+	enum mtk_vdec_hw_id hw_idx;
+	const struct of_device_id *of_id;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mtk_vdec_hw_match); i++) {
+		of_id = &mtk_vdec_hw_match[i];
+		subdev_node = of_find_compatible_node(NULL, NULL,
+						      of_id->compatible);
+		if (!subdev_node)
+			continue;
+
+		hw_idx = (enum mtk_vdec_hw_id)(uintptr_t)of_id->data;
+		if (!test_bit(hw_idx, vdec_dev->subdev_bitmap)) {
+			dev_err(&pdev->dev, "vdec %d is not ready", hw_idx);
+			return -EAGAIN;
+		}
+	}
+
+	return 0;
+}
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
+			     cg_status);
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
+		       ctx->id, dec_done_status);
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
+			       mtk_vdec_hw_irq_handler, 0, pdev->name, dev);
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
+	if (!dev->parent) {
+		dev_err(dev, "no parent for hardware devices.\n");
+		return -ENODEV;
+	}
+
+	main_dev = dev_get_drvdata(dev->parent);
+	if (!main_dev) {
+		dev_err(dev, "failed to get parent driver data");
+		return -EINVAL;
+	}
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
+	ret = mtk_vdec_hw_init_irq(subdev_dev);
+	if (ret)
+		goto err;
+
+	subdev_dev->reg_base[VDEC_HW_MISC] =
+		devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR((__force void *)subdev_dev->reg_base[VDEC_HW_MISC])) {
+		ret = PTR_ERR((__force void *)subdev_dev->reg_base[VDEC_HW_MISC]);
+		goto err;
+	}
+
+	if (!main_dev->subdev_prob_done)
+		main_dev->subdev_prob_done = mtk_vdec_hw_prob_done;
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
+module_platform_driver(mtk_vdec_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Mediatek video decoder hardware driver");
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
new file mode 100644
index 000000000000..5c2cfeaa9d9f
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
+/**
+ * enum mtk_vdec_hw_reg_idx - subdev hardware register base index
+ * @VDEC_HW_SYS : vdec soc register index
+ * @VDEC_HW_MISC: vdec misc register index
+ * @VDEC_HW_MAX : vdec supported max register index
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
+ * @reg_base: mapped address of MTK Vcodec registers.
+ *
+ * @dec_irq : decoder irq resource
+ * @pm      : power management control
+ * @hw_idx  : each hardware index
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
index 183cd67a334a..3294c8957ae5 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
@@ -356,8 +356,10 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.uses_stateless_api = true,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
+	.is_subdev_supported = false,
 };
 
+/* This platform data is used for one lat and one core architecture. */
 const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata = {
 	.chip = MTK_MT8192,
 	.init_vdec_params = mtk_init_vdec_params,
@@ -372,4 +374,5 @@ const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata = {
 	.uses_stateless_api = true,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
+	.is_subdev_supported = true,
 };
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 0fa9d85114b9..ab2004242c43 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -93,6 +93,17 @@ enum mtk_fmt_type {
 	MTK_FMT_FRAME = 2,
 };
 
+/*
+ * enum mtk_vdec_hw_id - Hardware index used to separate
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
 
@@ -423,6 +436,10 @@ struct mtk_vcodec_enc_pdata {
  * @pm: power management control
  * @dec_capability: used to identify decode capability, ex: 4k
  * @enc_capability: used to identify encode capability
+ *
+ * @subdev_dev: subdev hardware device
+ * @subdev_prob_done: check whether all used hw device is prob done
+ * @subdev_bitmap: used to record hardware is ready or not
  */
 struct mtk_vcodec_dev {
 	struct v4l2_device v4l2_dev;
@@ -460,6 +477,10 @@ struct mtk_vcodec_dev {
 	struct mtk_vcodec_pm pm;
 	unsigned int dec_capability;
 	unsigned int enc_capability;
+
+	void *subdev_dev[MTK_VDEC_HW_MAX];
+	int (*subdev_prob_done)(struct mtk_vcodec_dev *vdec_dev);
+	DECLARE_BITMAP(subdev_bitmap, MTK_VDEC_HW_MAX);
 };
 
 static inline struct mtk_vcodec_ctx *fh_to_ctx(struct v4l2_fh *fh)
-- 
2.25.1

