Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4D93FD578
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 10:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705FD6E152;
	Wed,  1 Sep 2021 08:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D386E154
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 08:32:36 +0000 (UTC)
X-UUID: fd8a5d0d514141d3b8f760861d104421-20210901
X-UUID: fd8a5d0d514141d3b8f760861d104421-20210901
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 188293874; Wed, 01 Sep 2021 16:32:33 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 1 Sep 2021 16:32:31 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Sep 2021 16:32:30 +0800
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
Subject: [PATCH v6, 09/15] media: mtk-vcodec: Generalize power and clock on/off
 interfaces
Date: Wed, 1 Sep 2021 16:32:09 +0800
Message-ID: <20210901083215.25984-10-yunfei.dong@mediatek.com>
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

Generalizes power and clock on/off interfaces to support different hardware.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  6 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   |  2 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.h   |  4 +
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 76 ++++++++++++++--
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  8 +-
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  2 +
 .../platform/mtk-vcodec/mtk_vcodec_util.c     | 87 ++++++++++++++++---
 .../platform/mtk-vcodec/mtk_vcodec_util.h     |  8 +-
 .../media/platform/mtk-vcodec/vdec_drv_if.c   | 21 ++---
 9 files changed, 174 insertions(+), 40 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index f096ad1c01ac..109f7de126a1 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -126,7 +126,7 @@ static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
 	void __iomem *vdec_misc_addr = dev->reg_base[VDEC_MISC] +
 					VDEC_IRQ_CFG_REG;
 
-	ctx = mtk_vcodec_get_curr_ctx(dev);
+	ctx = mtk_vcodec_get_curr_ctx(dev, MTK_VDEC_CORE);
 
 	/* check if HW active or not */
 	cg_status = readl(dev->reg_base[0]);
@@ -286,7 +286,7 @@ static int fops_vcodec_open(struct file *file)
 	mtk_vcodec_dec_set_default_params(ctx);
 
 	if (v4l2_fh_is_singular(&ctx->fh)) {
-		ret = mtk_vcodec_dec_pw_on(&dev->pm);
+		ret = mtk_vcodec_dec_pw_on(dev, MTK_VDEC_LAT0);
 		if (ret < 0)
 			goto err_load_fw;
 		/*
@@ -347,7 +347,7 @@ static int fops_vcodec_release(struct file *file)
 	mtk_vcodec_dec_release(ctx);
 
 	if (v4l2_fh_is_singular(&ctx->fh))
-		mtk_vcodec_dec_pw_off(&dev->pm);
+		mtk_vcodec_dec_pw_off(dev, MTK_VDEC_LAT0);
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
index 7a31afd294ba..714df68ffb19 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
@@ -68,7 +68,7 @@ static irqreturn_t mtk_vdec_comp_irq_handler(int irq, void *priv)
 	void __iomem *vdec_misc_addr = dev->reg_base[VDEC_COMP_MISC] +
 					VDEC_IRQ_CFG_REG;
 
-	ctx = mtk_vcodec_get_curr_ctx(dev->master_dev);
+	ctx = mtk_vcodec_get_curr_ctx(dev->master_dev, dev->comp_idx);
 
 	/* check if HW active or not */
 	cg_status = readl(dev->reg_base[VDEC_COMP_SYS]);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
index 8d6e818a3474..0a4c2e6f5df2 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
@@ -32,6 +32,8 @@ enum mtk_comp_hw_reg_idx {
  * @master_dev: master device
  * @reg_base: Mapped address of MTK Vcodec registers.
  *
+ * @curr_ctx: The context that is waiting for codec hardware
+ *
  * @dec_irq: decoder irq resource
  * @pm: power management control
  * @comp_idx: component index
@@ -41,6 +43,8 @@ struct mtk_vdec_comp_dev {
 	struct mtk_vcodec_dev *master_dev;
 	void __iomem *reg_base[VDEC_COMP_MAX];
 
+	struct mtk_vcodec_ctx *curr_ctx;
+
 	int dec_irq;
 	struct mtk_vcodec_pm pm;
 	int comp_idx;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index 20bd157a855c..183d4c4e36f0 100644
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
 
@@ -84,10 +86,23 @@ void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm)
 	put_device(pm->larbvdec);
 }
 
-int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
+int mtk_vcodec_dec_pw_on(struct mtk_vcodec_dev *vdec_dev, int comp_idx)
 {
+	struct mtk_vdec_comp_dev *comp_dev;
+	struct mtk_vcodec_pm *pm;
 	int ret;
 
+	if (vdec_dev->vdec_pdata->is_comp_supported) {
+		comp_dev = mtk_vcodec_get_hw_dev(vdec_dev, comp_idx);
+		if (!comp_dev) {
+			mtk_v4l2_err("Failed to get hw dev\n");
+			return -EINVAL;
+		}
+		pm = &comp_dev->pm;
+	} else {
+		pm = &vdec_dev->pm;
+	}
+
 	ret = pm_runtime_resume_and_get(pm->dev);
 	if (ret)
 		mtk_v4l2_err("pm_runtime_resume_and_get fail %d", ret);
@@ -95,20 +110,49 @@ int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
 	return ret;
 }
 
-void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
+void mtk_vcodec_dec_pw_off(struct mtk_vcodec_dev *vdec_dev, int comp_idx)
 {
+	struct mtk_vdec_comp_dev *comp_dev;
+	struct mtk_vcodec_pm *pm;
 	int ret;
 
+	if (vdec_dev->vdec_pdata->is_comp_supported) {
+		comp_dev = mtk_vcodec_get_hw_dev(vdec_dev, comp_idx);
+		if (!comp_dev) {
+			mtk_v4l2_err("Failed to get hw dev\n");
+			return;
+		}
+		pm = &comp_dev->pm;
+	} else {
+		pm = &vdec_dev->pm;
+	}
+
 	ret = pm_runtime_put_sync(pm->dev);
 	if (ret)
 		mtk_v4l2_err("pm_runtime_put_sync fail %d", ret);
 }
 
-void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
+void mtk_vcodec_dec_clock_on(struct mtk_vcodec_dev *vdec_dev, int comp_idx)
 {
-	struct mtk_vcodec_clk *dec_clk = &pm->vdec_clk;
-	int ret, i = 0;
+	struct mtk_vdec_comp_dev *comp_dev;
+	struct mtk_vcodec_pm *pm;
+	struct mtk_vcodec_clk *dec_clk;
+	int ret, i;
+
+	if (vdec_dev->vdec_pdata->is_comp_supported) {
+		comp_dev = mtk_vcodec_get_hw_dev(vdec_dev, comp_idx);
+		if (!comp_dev) {
+			mtk_v4l2_err("Failed to get hw dev\n");
+			return;
+		}
+		pm = &comp_dev->pm;
+		enable_irq(comp_dev->dec_irq);
+	} else {
+		pm = &vdec_dev->pm;
+		enable_irq(vdec_dev->dec_irq);
+	}
 
+	dec_clk = &pm->vdec_clk;
 	for (i = 0; i < dec_clk->clk_num; i++) {
 		ret = clk_prepare_enable(dec_clk->clk_info[i].vcodec_clk);
 		if (ret) {
@@ -130,11 +174,27 @@ void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
 		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
 }
 
-void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm)
+void mtk_vcodec_dec_clock_off(struct mtk_vcodec_dev *vdec_dev, int comp_idx)
 {
-	struct mtk_vcodec_clk *dec_clk = &pm->vdec_clk;
-	int i = 0;
+	struct mtk_vdec_comp_dev *comp_dev;
+	struct mtk_vcodec_pm *pm;
+	struct mtk_vcodec_clk *dec_clk;
+	int i;
 
+	if (vdec_dev->vdec_pdata->is_comp_supported) {
+		comp_dev = mtk_vcodec_get_hw_dev(vdec_dev, comp_idx);
+		if (!comp_dev) {
+			mtk_v4l2_err("Failed to get hw dev\n");
+			return;
+		}
+		pm = &comp_dev->pm;
+		disable_irq(comp_dev->dec_irq);
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
index a3df6aef6cb9..698750572b57 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
@@ -13,9 +13,9 @@ int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
 	struct mtk_vcodec_pm *pm);
 void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm);
 
-int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm);
-void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm);
-void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm);
-void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm);
+int mtk_vcodec_dec_pw_on(struct mtk_vcodec_dev *vdec_dev, int comp_idx);
+void mtk_vcodec_dec_pw_off(struct mtk_vcodec_dev *vdec_dev, int comp_idx);
+void mtk_vcodec_dec_clock_on(struct mtk_vcodec_dev *vdec_dev, int comp_idx);
+void mtk_vcodec_dec_clock_off(struct mtk_vcodec_dev *vdec_dev, int comp_idx);
 
 #endif /* _MTK_VCODEC_DEC_PM_H_ */
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 4ad0566e715d..a8242389ad24 100644
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
index ac5973b6735f..511b75e49fe7 100644
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
 
@@ -81,25 +84,87 @@ void mtk_vcodec_mem_free(struct mtk_vcodec_ctx *data,
 }
 EXPORT_SYMBOL(mtk_vcodec_mem_free);
 
-void mtk_vcodec_set_curr_ctx(struct mtk_vcodec_dev *dev,
-	struct mtk_vcodec_ctx *ctx)
+void *mtk_vcodec_get_hw_dev(struct mtk_vcodec_dev *dev, int comp_idx)
 {
-	unsigned long flags;
+	struct platform_device *hw_pdev;
+	struct device_node *node;
+	struct mtk_vdec_comp_dev *master_dev;
+
+	if (comp_idx >= MTK_VDEC_HW_MAX || comp_idx < 0) {
+		mtk_v4l2_err("Comp idx is out of range:%d", comp_idx);
+		return NULL;
+	}
+
+	if (dev->comp_dev[comp_idx])
+		return dev->comp_dev[comp_idx];
+
+	node = dev->component_node[comp_idx];
+	if (!node) {
+		mtk_v4l2_err("Get lat node fail:%d", comp_idx);
+		return NULL;
+	}
+
+	hw_pdev = of_find_device_by_node(node);
+	of_node_put(node);
+
+	if (WARN_ON(!hw_pdev)) {
+		mtk_v4l2_err("Get hw id(%d) node fail", comp_idx);
+		return NULL;
+	}
+
+	master_dev = platform_get_drvdata(hw_pdev);
+	if (!master_dev) {
+		mtk_v4l2_err("Get hw id(%d) pdev fail", comp_idx);
+		return NULL;
+	}
 
-	spin_lock_irqsave(&dev->irqlock, flags);
-	dev->curr_ctx = ctx;
-	spin_unlock_irqrestore(&dev->irqlock, flags);
+	dev->comp_dev[master_dev->comp_idx] = master_dev;
+	return master_dev;
+}
+EXPORT_SYMBOL(mtk_vcodec_get_hw_dev);
+
+void mtk_vcodec_set_curr_ctx(struct mtk_vcodec_dev *vdec_dev,
+	struct mtk_vcodec_ctx *ctx, int comp_idx)
+{
+	unsigned long flags;
+	struct mtk_vdec_comp_dev *comp_dev;
+
+	spin_lock_irqsave(&vdec_dev->irqlock, flags);
+	if (vdec_dev->vdec_pdata->is_comp_supported) {
+		comp_dev = mtk_vcodec_get_hw_dev(vdec_dev, comp_idx);
+		if (!comp_dev) {
+			mtk_v4l2_err("Failed to get hw dev");
+			spin_unlock_irqrestore(&vdec_dev->irqlock, flags);
+			return;
+		}
+		comp_dev->curr_ctx = ctx;
+	} else {
+		vdec_dev->curr_ctx = ctx;
+	}
+	spin_unlock_irqrestore(&vdec_dev->irqlock, flags);
 }
 EXPORT_SYMBOL(mtk_vcodec_set_curr_ctx);
 
-struct mtk_vcodec_ctx *mtk_vcodec_get_curr_ctx(struct mtk_vcodec_dev *dev)
+struct mtk_vcodec_ctx *mtk_vcodec_get_curr_ctx(struct mtk_vcodec_dev *vdec_dev,
+	unsigned int comp_idx)
 {
 	unsigned long flags;
 	struct mtk_vcodec_ctx *ctx;
-
-	spin_lock_irqsave(&dev->irqlock, flags);
-	ctx = dev->curr_ctx;
-	spin_unlock_irqrestore(&dev->irqlock, flags);
+	struct mtk_vdec_comp_dev *comp_dev;
+
+	spin_lock_irqsave(&vdec_dev->irqlock, flags);
+	if (vdec_dev->vdec_pdata->is_comp_supported) {
+		comp_dev = mtk_vcodec_get_hw_dev(vdec_dev, comp_idx);
+		if (!comp_dev) {
+			mtk_v4l2_err("Failed to get hw dev");
+			spin_unlock_irqrestore(&vdec_dev->irqlock, flags);
+			return NULL;
+		}
+		ctx = comp_dev->curr_ctx;
+	} else {
+		ctx = vdec_dev->curr_ctx;
+	}
+	spin_unlock_irqrestore(&vdec_dev->irqlock, flags);
 	return ctx;
 }
 EXPORT_SYMBOL(mtk_vcodec_get_curr_ctx);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
index b999d7b84ed1..4cb0fc60c94f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
@@ -79,8 +79,10 @@ int mtk_vcodec_mem_alloc(struct mtk_vcodec_ctx *data,
 				struct mtk_vcodec_mem *mem);
 void mtk_vcodec_mem_free(struct mtk_vcodec_ctx *data,
 				struct mtk_vcodec_mem *mem);
-void mtk_vcodec_set_curr_ctx(struct mtk_vcodec_dev *dev,
-	struct mtk_vcodec_ctx *ctx);
-struct mtk_vcodec_ctx *mtk_vcodec_get_curr_ctx(struct mtk_vcodec_dev *dev);
+void mtk_vcodec_set_curr_ctx(struct mtk_vcodec_dev *vdec_dev,
+				struct mtk_vcodec_ctx *ctx, int comp_idx);
+struct mtk_vcodec_ctx *mtk_vcodec_get_curr_ctx(struct mtk_vcodec_dev *vdec_dev,
+	unsigned int comp_idx);
+void *mtk_vcodec_get_hw_dev(struct mtk_vcodec_dev *dev, int comp_idx);
 
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

