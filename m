Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A18E848C16F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 10:50:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6020D10F5FF;
	Wed, 12 Jan 2022 09:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A940B11355C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 09:49:49 +0000 (UTC)
X-UUID: 935fec8243be45fd95d5db24aa656f41-20220112
X-UUID: 935fec8243be45fd95d5db24aa656f41-20220112
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 116733177; Wed, 12 Jan 2022 17:49:45 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 12 Jan 2022 17:49:44 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 12 Jan 2022 17:49:43 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 12 Jan 2022 17:49:41 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v18,
 11/19] media: mtk-vcodec: Generalize power and clock on/off interfaces
Date: Wed, 12 Jan 2022 17:49:15 +0800
Message-ID: <20220112094923.16839-12-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220112094923.16839-1-yunfei.dong@mediatek.com>
References: <20220112094923.16839-1-yunfei.dong@mediatek.com>
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

Generalizes power and clock on/off interfaces to support different
hardware.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  6 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   |  2 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.h   |  4 +
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 76 +++++++++++++++++--
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  8 +-
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  2 +
 .../platform/mtk-vcodec/mtk_vcodec_util.c     | 59 +++++++++++---
 .../platform/mtk-vcodec/mtk_vcodec_util.h     |  8 +-
 .../media/platform/mtk-vcodec/vdec_drv_if.c   | 21 ++---
 9 files changed, 146 insertions(+), 40 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 9802e5cc535f..64359cf692f5 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -46,7 +46,7 @@ static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
 	void __iomem *vdec_misc_addr = dev->reg_base[VDEC_MISC] +
 					VDEC_IRQ_CFG_REG;
 
-	ctx = mtk_vcodec_get_curr_ctx(dev);
+	ctx = mtk_vcodec_get_curr_ctx(dev, MTK_VDEC_CORE);
 
 	/* check if HW active or not */
 	cg_status = readl(dev->reg_base[0]);
@@ -193,7 +193,7 @@ static int fops_vcodec_open(struct file *file)
 	mtk_vcodec_dec_set_default_params(ctx);
 
 	if (v4l2_fh_is_singular(&ctx->fh)) {
-		ret = mtk_vcodec_dec_pw_on(&dev->pm);
+		ret = mtk_vcodec_dec_pw_on(dev, MTK_VDEC_LAT0);
 		if (ret < 0)
 			goto err_load_fw;
 		/*
@@ -253,7 +253,7 @@ static int fops_vcodec_release(struct file *file)
 	mtk_vcodec_dec_release(ctx);
 
 	if (v4l2_fh_is_singular(&ctx->fh))
-		mtk_vcodec_dec_pw_off(&dev->pm);
+		mtk_vcodec_dec_pw_off(dev, MTK_VDEC_LAT0);
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
index 2cd65a083994..4f946e21b5d7 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
@@ -65,7 +65,7 @@ static irqreturn_t mtk_vdec_hw_irq_handler(int irq, void *priv)
 	void __iomem *vdec_misc_addr = dev->reg_base[VDEC_HW_MISC] +
 					VDEC_IRQ_CFG_REG;
 
-	ctx = mtk_vcodec_get_curr_ctx(dev->main_dev);
+	ctx = mtk_vcodec_get_curr_ctx(dev->main_dev, dev->hw_idx);
 
 	/* check if HW active or not */
 	cg_status = readl(dev->reg_base[VDEC_HW_SYS]);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
index 5c2cfeaa9d9f..a63e4b1b81c3 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
@@ -35,6 +35,8 @@ enum mtk_vdec_hw_reg_idx {
  * @main_dev: main device
  * @reg_base: mapped address of MTK Vcodec registers.
  *
+ * @curr_ctx: the context that is waiting for codec hardware
+ *
  * @dec_irq : decoder irq resource
  * @pm      : power management control
  * @hw_idx  : each hardware index
@@ -44,6 +46,8 @@ struct mtk_vdec_hw_dev {
 	struct mtk_vcodec_dev *main_dev;
 	void __iomem *reg_base[VDEC_HW_MAX];
 
+	struct mtk_vcodec_ctx *curr_ctx;
+
 	int dec_irq;
 	struct mtk_vcodec_pm pm;
 	int hw_idx;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index 1fc2a4b2a137..b91c29afdfde 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -5,11 +5,13 @@
  */
 
 #include <linux/clk.h>
+#include <linux/interrupt.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <soc/mediatek/smi.h>
 
+#include "mtk_vcodec_dec_hw.h"
 #include "mtk_vcodec_dec_pm.h"
 #include "mtk_vcodec_util.h"
 
@@ -86,10 +88,23 @@ void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm)
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_release_dec_pm);
 
-int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
+int mtk_vcodec_dec_pw_on(struct mtk_vcodec_dev *vdec_dev, int hw_idx)
 {
+	struct mtk_vdec_hw_dev *subdev_dev;
+	struct mtk_vcodec_pm *pm;
 	int ret;
 
+	if (vdec_dev->vdec_pdata->is_subdev_supported) {
+		subdev_dev = mtk_vcodec_get_hw_dev(vdec_dev, hw_idx);
+		if (!subdev_dev) {
+			mtk_v4l2_err("Failed to get hw dev\n");
+			return -EINVAL;
+		}
+		pm = &subdev_dev->pm;
+	} else {
+		pm = &vdec_dev->pm;
+	}
+
 	ret = pm_runtime_resume_and_get(pm->dev);
 	if (ret)
 		mtk_v4l2_err("pm_runtime_resume_and_get fail %d", ret);
@@ -98,21 +113,50 @@ int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_dec_pw_on);
 
-void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
+void mtk_vcodec_dec_pw_off(struct mtk_vcodec_dev *vdec_dev, int hw_idx)
 {
+	struct mtk_vdec_hw_dev *subdev_dev;
+	struct mtk_vcodec_pm *pm;
 	int ret;
 
+	if (vdec_dev->vdec_pdata->is_subdev_supported) {
+		subdev_dev = mtk_vcodec_get_hw_dev(vdec_dev, hw_idx);
+		if (!subdev_dev) {
+			mtk_v4l2_err("Failed to get hw dev\n");
+			return;
+		}
+		pm = &subdev_dev->pm;
+	} else {
+		pm = &vdec_dev->pm;
+	}
+
 	ret = pm_runtime_put_sync(pm->dev);
 	if (ret)
 		mtk_v4l2_err("pm_runtime_put_sync fail %d", ret);
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_dec_pw_off);
 
-void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
+void mtk_vcodec_dec_clock_on(struct mtk_vcodec_dev *vdec_dev, int hw_idx)
 {
-	struct mtk_vcodec_clk *dec_clk = &pm->vdec_clk;
-	int ret, i = 0;
+	struct mtk_vdec_hw_dev *subdev_dev;
+	struct mtk_vcodec_pm *pm;
+	struct mtk_vcodec_clk *dec_clk;
+	int ret, i;
+
+	if (vdec_dev->vdec_pdata->is_subdev_supported) {
+		subdev_dev = mtk_vcodec_get_hw_dev(vdec_dev, hw_idx);
+		if (!subdev_dev) {
+			mtk_v4l2_err("Failed to get hw dev\n");
+			return;
+		}
+		pm = &subdev_dev->pm;
+		enable_irq(subdev_dev->dec_irq);
+	} else {
+		pm = &vdec_dev->pm;
+		enable_irq(vdec_dev->dec_irq);
+	}
 
+	dec_clk = &pm->vdec_clk;
 	for (i = 0; i < dec_clk->clk_num; i++) {
 		ret = clk_prepare_enable(dec_clk->clk_info[i].vcodec_clk);
 		if (ret) {
@@ -135,11 +179,27 @@ void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_dec_clock_on);
 
-void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm)
+void mtk_vcodec_dec_clock_off(struct mtk_vcodec_dev *vdec_dev, int hw_idx)
 {
-	struct mtk_vcodec_clk *dec_clk = &pm->vdec_clk;
-	int i = 0;
+	struct mtk_vdec_hw_dev *subdev_dev;
+	struct mtk_vcodec_pm *pm;
+	struct mtk_vcodec_clk *dec_clk;
+	int i;
 
+	if (vdec_dev->vdec_pdata->is_subdev_supported) {
+		subdev_dev = mtk_vcodec_get_hw_dev(vdec_dev, hw_idx);
+		if (!subdev_dev) {
+			mtk_v4l2_err("Failed to get hw dev\n");
+			return;
+		}
+		pm = &subdev_dev->pm;
+		disable_irq(subdev_dev->dec_irq);
+	} else {
+		pm = &vdec_dev->pm;
+		disable_irq(vdec_dev->dec_irq);
+	}
+
+	dec_clk = &pm->vdec_clk;
 	mtk_smi_larb_put(pm->larbvdec);
 	for (i = dec_clk->clk_num - 1; i >= 0; i--)
 		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
index a3df6aef6cb9..6ae29fea4e7f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
@@ -13,9 +13,9 @@ int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
 	struct mtk_vcodec_pm *pm);
 void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm);
 
-int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm);
-void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm);
-void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm);
-void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm);
+int mtk_vcodec_dec_pw_on(struct mtk_vcodec_dev *vdec_dev, int hw_idx);
+void mtk_vcodec_dec_pw_off(struct mtk_vcodec_dev *vdec_dev, int hw_idx);
+void mtk_vcodec_dec_clock_on(struct mtk_vcodec_dev *vdec_dev, int hw_idx);
+void mtk_vcodec_dec_clock_off(struct mtk_vcodec_dev *vdec_dev, int hw_idx);
 
 #endif /* _MTK_VCODEC_DEC_PM_H_ */
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 29a0950badf0..d74ca88de827 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -284,6 +284,7 @@ struct vdec_pic_info {
  * @decoded_frame_cnt: number of decoded frames
  * @lock: protect variables accessed by V4L2 threads and worker thread such as
  *	  mtk_video_dec_buf.
+ * @hw_id: hardware index used to identify different hardware.
  *
  * @msg_queue: msg queue used to store lat buffer information.
  */
@@ -328,6 +329,7 @@ struct mtk_vcodec_ctx {
 
 	int decoded_frame_cnt;
 	struct mutex lock;
+	int hw_id;
 
 	struct vdec_msg_queue msg_queue;
 };
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
index 5bac820a47fc..5f42748714a5 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
@@ -6,7 +6,10 @@
 */
 
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 
+#include "mtk_vcodec_dec_hw.h"
 #include "mtk_vcodec_drv.h"
 #include "mtk_vcodec_util.h"
 
@@ -71,25 +74,59 @@ void mtk_vcodec_mem_free(struct mtk_vcodec_ctx *data,
 }
 EXPORT_SYMBOL(mtk_vcodec_mem_free);
 
-void mtk_vcodec_set_curr_ctx(struct mtk_vcodec_dev *dev,
-	struct mtk_vcodec_ctx *ctx)
+void *mtk_vcodec_get_hw_dev(struct mtk_vcodec_dev *dev, int hw_idx)
 {
-	unsigned long flags;
+	if (hw_idx >= MTK_VDEC_HW_MAX || hw_idx < 0 || !dev->subdev_dev[hw_idx]) {
+		mtk_v4l2_err("hw idx is out of range:%d", hw_idx);
+		return NULL;
+	}
+
+	return dev->subdev_dev[hw_idx];
+}
+EXPORT_SYMBOL(mtk_vcodec_get_hw_dev);
 
-	spin_lock_irqsave(&dev->irqlock, flags);
-	dev->curr_ctx = ctx;
-	spin_unlock_irqrestore(&dev->irqlock, flags);
+void mtk_vcodec_set_curr_ctx(struct mtk_vcodec_dev *vdec_dev,
+	struct mtk_vcodec_ctx *ctx, int hw_idx)
+{
+	unsigned long flags;
+	struct mtk_vdec_hw_dev *subdev_dev;
+
+	spin_lock_irqsave(&vdec_dev->irqlock, flags);
+	if (vdec_dev->vdec_pdata->is_subdev_supported) {
+		subdev_dev = mtk_vcodec_get_hw_dev(vdec_dev, hw_idx);
+		if (!subdev_dev) {
+			mtk_v4l2_err("Failed to get hw dev");
+			spin_unlock_irqrestore(&vdec_dev->irqlock, flags);
+			return;
+		}
+		subdev_dev->curr_ctx = ctx;
+	} else {
+		vdec_dev->curr_ctx = ctx;
+	}
+	spin_unlock_irqrestore(&vdec_dev->irqlock, flags);
 }
 EXPORT_SYMBOL(mtk_vcodec_set_curr_ctx);
 
-struct mtk_vcodec_ctx *mtk_vcodec_get_curr_ctx(struct mtk_vcodec_dev *dev)
+struct mtk_vcodec_ctx *mtk_vcodec_get_curr_ctx(struct mtk_vcodec_dev *vdec_dev,
+	unsigned int hw_idx)
 {
 	unsigned long flags;
 	struct mtk_vcodec_ctx *ctx;
-
-	spin_lock_irqsave(&dev->irqlock, flags);
-	ctx = dev->curr_ctx;
-	spin_unlock_irqrestore(&dev->irqlock, flags);
+	struct mtk_vdec_hw_dev *subdev_dev;
+
+	spin_lock_irqsave(&vdec_dev->irqlock, flags);
+	if (vdec_dev->vdec_pdata->is_subdev_supported) {
+		subdev_dev = mtk_vcodec_get_hw_dev(vdec_dev, hw_idx);
+		if (!subdev_dev) {
+			mtk_v4l2_err("Failed to get hw dev");
+			spin_unlock_irqrestore(&vdec_dev->irqlock, flags);
+			return NULL;
+		}
+		ctx = subdev_dev->curr_ctx;
+	} else {
+		ctx = vdec_dev->curr_ctx;
+	}
+	spin_unlock_irqrestore(&vdec_dev->irqlock, flags);
 	return ctx;
 }
 EXPORT_SYMBOL(mtk_vcodec_get_curr_ctx);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
index 87c3d6d4bfa7..c245321f8dcb 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
@@ -54,8 +54,10 @@ int mtk_vcodec_mem_alloc(struct mtk_vcodec_ctx *data,
 				struct mtk_vcodec_mem *mem);
 void mtk_vcodec_mem_free(struct mtk_vcodec_ctx *data,
 				struct mtk_vcodec_mem *mem);
-void mtk_vcodec_set_curr_ctx(struct mtk_vcodec_dev *dev,
-	struct mtk_vcodec_ctx *ctx);
-struct mtk_vcodec_ctx *mtk_vcodec_get_curr_ctx(struct mtk_vcodec_dev *dev);
+void mtk_vcodec_set_curr_ctx(struct mtk_vcodec_dev *vdec_dev,
+				struct mtk_vcodec_ctx *ctx, int hw_idx);
+struct mtk_vcodec_ctx *mtk_vcodec_get_curr_ctx(struct mtk_vcodec_dev *vdec_dev,
+				unsigned int hw_idx);
+void *mtk_vcodec_get_hw_dev(struct mtk_vcodec_dev *dev, int hw_idx);
 
 #endif /* _MTK_VCODEC_UTIL_H_ */
diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
index 42008243ceac..05a5b240e906 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
@@ -24,21 +24,24 @@ int vdec_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 		break;
 	case V4L2_PIX_FMT_H264:
 		ctx->dec_if = &vdec_h264_if;
+		ctx->hw_id = MTK_VDEC_CORE;
 		break;
 	case V4L2_PIX_FMT_VP8:
 		ctx->dec_if = &vdec_vp8_if;
+		ctx->hw_id = MTK_VDEC_CORE;
 		break;
 	case V4L2_PIX_FMT_VP9:
 		ctx->dec_if = &vdec_vp9_if;
+		ctx->hw_id = MTK_VDEC_CORE;
 		break;
 	default:
 		return -EINVAL;
 	}
 
 	mtk_vdec_lock(ctx);
-	mtk_vcodec_dec_clock_on(&ctx->dev->pm);
+	mtk_vcodec_dec_clock_on(ctx->dev, ctx->hw_id);
 	ret = ctx->dec_if->init(ctx);
-	mtk_vcodec_dec_clock_off(&ctx->dev->pm);
+	mtk_vcodec_dec_clock_off(ctx->dev, ctx->hw_id);
 	mtk_vdec_unlock(ctx);
 
 	return ret;
@@ -69,13 +72,11 @@ int vdec_if_decode(struct mtk_vcodec_ctx *ctx, struct mtk_vcodec_mem *bs,
 
 	mtk_vdec_lock(ctx);
 
-	mtk_vcodec_set_curr_ctx(ctx->dev, ctx);
-	mtk_vcodec_dec_clock_on(&ctx->dev->pm);
-	enable_irq(ctx->dev->dec_irq);
+	mtk_vcodec_set_curr_ctx(ctx->dev, ctx, ctx->hw_id);
+	mtk_vcodec_dec_clock_on(ctx->dev, ctx->hw_id);
 	ret = ctx->dec_if->decode(ctx->drv_handle, bs, fb, res_chg);
-	disable_irq(ctx->dev->dec_irq);
-	mtk_vcodec_dec_clock_off(&ctx->dev->pm);
-	mtk_vcodec_set_curr_ctx(ctx->dev, NULL);
+	mtk_vcodec_dec_clock_off(ctx->dev, ctx->hw_id);
+	mtk_vcodec_set_curr_ctx(ctx->dev, NULL, ctx->hw_id);
 
 	mtk_vdec_unlock(ctx);
 
@@ -103,9 +104,9 @@ void vdec_if_deinit(struct mtk_vcodec_ctx *ctx)
 		return;
 
 	mtk_vdec_lock(ctx);
-	mtk_vcodec_dec_clock_on(&ctx->dev->pm);
+	mtk_vcodec_dec_clock_on(ctx->dev, ctx->hw_id);
 	ctx->dec_if->deinit(ctx->drv_handle);
-	mtk_vcodec_dec_clock_off(&ctx->dev->pm);
+	mtk_vcodec_dec_clock_off(ctx->dev, ctx->hw_id);
 	mtk_vdec_unlock(ctx);
 
 	ctx->drv_handle = NULL;
-- 
2.25.1

