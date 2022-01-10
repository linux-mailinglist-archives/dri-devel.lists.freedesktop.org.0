Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10429489371
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 09:34:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18637112F6A;
	Mon, 10 Jan 2022 08:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE12E113A3B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 08:34:51 +0000 (UTC)
X-UUID: c7b7e9cf2a9c45708ace9b1060dd4acd-20220110
X-UUID: c7b7e9cf2a9c45708ace9b1060dd4acd-20220110
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 353680647; Mon, 10 Jan 2022 16:34:48 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 10 Jan 2022 16:34:47 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 10 Jan 2022 16:34:46 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 10 Jan 2022 16:34:45 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v4,
 01/15] media: mtk-vcodec: Add vdec enable/disable hardware helpers
Date: Mon, 10 Jan 2022 16:34:28 +0800
Message-ID: <20220110083442.32604-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220110083442.32604-1-yunfei.dong@mediatek.com>
References: <20220110083442.32604-1-yunfei.dong@mediatek.com>
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

Lock, power and clock are highly coupled operations. Adds vdec
enable/disable hardware helpers and uses them.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Tzung-Bi Shih<tzungbi@google.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |   5 -
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 168 +++++++++++-------
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |   6 +-
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |  20 +--
 .../platform/mtk-vcodec/vdec_msg_queue.c      |   2 +
 5 files changed, 117 insertions(+), 84 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index d44894fa2f6e..fc3e272d2059 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -195,9 +195,6 @@ static int fops_vcodec_open(struct file *file)
 	mtk_vcodec_dec_set_default_params(ctx);
 
 	if (v4l2_fh_is_singular(&ctx->fh)) {
-		ret = mtk_vcodec_dec_pw_on(dev, MTK_VDEC_LAT0);
-		if (ret < 0)
-			goto err_load_fw;
 		/*
 		 * Does nothing if firmware was already loaded.
 		 */
@@ -254,8 +251,6 @@ static int fops_vcodec_release(struct file *file)
 	v4l2_m2m_ctx_release(ctx->m2m_ctx);
 	mtk_vcodec_dec_release(ctx);
 
-	if (v4l2_fh_is_singular(&ctx->fh))
-		mtk_vcodec_dec_pw_off(dev, MTK_VDEC_LAT0);
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index b9f5ef979c69..c2ed79bce686 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -80,74 +80,31 @@ int mtk_vcodec_init_dec_clk(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_init_dec_clk);
 
-int mtk_vcodec_dec_pw_on(struct mtk_vcodec_dev *vdec_dev, int hw_idx)
+static int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
 {
-	struct mtk_vdec_hw_dev *subdev_dev;
-	struct mtk_vcodec_pm *pm;
 	int ret;
 
-	if (vdec_dev->vdec_pdata->is_subdev_supported) {
-		subdev_dev = mtk_vcodec_get_hw_dev(vdec_dev, hw_idx);
-		if (!subdev_dev) {
-			mtk_v4l2_err("Failed to get hw dev\n");
-			return -EINVAL;
-		}
-		pm = &subdev_dev->pm;
-	} else {
-		pm = &vdec_dev->pm;
-	}
-
 	ret = pm_runtime_resume_and_get(pm->dev);
 	if (ret)
 		mtk_v4l2_err("pm_runtime_resume_and_get fail %d", ret);
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(mtk_vcodec_dec_pw_on);
 
-void mtk_vcodec_dec_pw_off(struct mtk_vcodec_dev *vdec_dev, int hw_idx)
+static void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
 {
-	struct mtk_vdec_hw_dev *subdev_dev;
-	struct mtk_vcodec_pm *pm;
 	int ret;
 
-	if (vdec_dev->vdec_pdata->is_subdev_supported) {
-		subdev_dev = mtk_vcodec_get_hw_dev(vdec_dev, hw_idx);
-		if (!subdev_dev) {
-			mtk_v4l2_err("Failed to get hw dev\n");
-			return;
-		}
-		pm = &subdev_dev->pm;
-	} else {
-		pm = &vdec_dev->pm;
-	}
-
 	ret = pm_runtime_put_sync(pm->dev);
 	if (ret)
 		mtk_v4l2_err("pm_runtime_put_sync fail %d", ret);
 }
-EXPORT_SYMBOL_GPL(mtk_vcodec_dec_pw_off);
 
-void mtk_vcodec_dec_clock_on(struct mtk_vcodec_dev *vdec_dev, int hw_idx)
+static void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
 {
-	struct mtk_vdec_hw_dev *subdev_dev;
-	struct mtk_vcodec_pm *pm;
 	struct mtk_vcodec_clk *dec_clk;
 	int ret, i;
 
-	if (vdec_dev->vdec_pdata->is_subdev_supported) {
-		subdev_dev = mtk_vcodec_get_hw_dev(vdec_dev, hw_idx);
-		if (!subdev_dev) {
-			mtk_v4l2_err("Failed to get hw dev\n");
-			return;
-		}
-		pm = &subdev_dev->pm;
-		enable_irq(subdev_dev->dec_irq);
-	} else {
-		pm = &vdec_dev->pm;
-		enable_irq(vdec_dev->dec_irq);
-	}
-
 	dec_clk = &pm->vdec_clk;
 	for (i = 0; i < dec_clk->clk_num; i++) {
 		ret = clk_prepare_enable(dec_clk->clk_info[i].vcodec_clk);
@@ -169,31 +126,120 @@ void mtk_vcodec_dec_clock_on(struct mtk_vcodec_dev *vdec_dev, int hw_idx)
 	for (i -= 1; i >= 0; i--)
 		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
 }
-EXPORT_SYMBOL_GPL(mtk_vcodec_dec_clock_on);
 
-void mtk_vcodec_dec_clock_off(struct mtk_vcodec_dev *vdec_dev, int hw_idx)
+static void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm)
 {
-	struct mtk_vdec_hw_dev *subdev_dev;
-	struct mtk_vcodec_pm *pm;
 	struct mtk_vcodec_clk *dec_clk;
 	int i;
 
+	dec_clk = &pm->vdec_clk;
+	mtk_smi_larb_put(pm->larbvdec);
+	for (i = dec_clk->clk_num - 1; i >= 0; i--)
+		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
+}
+
+static void mtk_vcodec_dec_enable_irq(struct mtk_vcodec_dev *vdec_dev, int hw_idx)
+ {
+	struct mtk_vdec_hw_dev *subdev_dev;
+
+	if (!test_bit(hw_idx, vdec_dev->subdev_bitmap))
+		return;
+
 	if (vdec_dev->vdec_pdata->is_subdev_supported) {
 		subdev_dev = mtk_vcodec_get_hw_dev(vdec_dev, hw_idx);
-		if (!subdev_dev) {
+		if (subdev_dev)
+			enable_irq(subdev_dev->dec_irq);
+		else
+			mtk_v4l2_err("Failed to get hw dev\n");
+	} else {
+		enable_irq(vdec_dev->dec_irq);
+	}
+}
+
+static void mtk_vcodec_dec_disable_irq(struct mtk_vcodec_dev *vdec_dev, int hw_idx)
+{
+	struct mtk_vdec_hw_dev *subdev_dev;
+
+	if (!test_bit(hw_idx, vdec_dev->subdev_bitmap))
+		return;
+
+	if (vdec_dev->vdec_pdata->is_subdev_supported) {
+		subdev_dev = mtk_vcodec_get_hw_dev(vdec_dev, hw_idx);
+		if (subdev_dev)
+			disable_irq(subdev_dev->dec_irq);
+		else
 			mtk_v4l2_err("Failed to get hw dev\n");
-			return;
-		}
-		pm = &subdev_dev->pm;
-		disable_irq(subdev_dev->dec_irq);
 	} else {
-		pm = &vdec_dev->pm;
 		disable_irq(vdec_dev->dec_irq);
 	}
+}
 
-	dec_clk = &pm->vdec_clk;
-	mtk_smi_larb_put(pm->larbvdec);
-	for (i = dec_clk->clk_num - 1; i >= 0; i--)
-		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
+static struct mtk_vcodec_pm *mtk_vcodec_dec_get_pm(struct mtk_vcodec_dev *vdec_dev,
+	int hw_idx)
+{
+	struct mtk_vdec_hw_dev *subdev_dev;
+
+	if (!test_bit(hw_idx, vdec_dev->subdev_bitmap))
+		return NULL;
+
+	if (vdec_dev->vdec_pdata->is_subdev_supported) {
+		subdev_dev = mtk_vcodec_get_hw_dev(vdec_dev, hw_idx);
+		if (subdev_dev)
+			return &subdev_dev->pm;
+
+		mtk_v4l2_err("Failed to get hw dev\n");
+		return NULL;
+	}
+
+	return &vdec_dev->pm;
+}
+
+static void mtk_vcodec_dec_child_dev_on(struct mtk_vcodec_dev *vdec_dev,
+	int hw_idx)
+{
+	struct mtk_vcodec_pm *pm;
+
+	pm = mtk_vcodec_dec_get_pm(vdec_dev, hw_idx);
+	if (pm) {
+		mtk_vcodec_dec_pw_on(pm);
+		mtk_vcodec_dec_clock_on(pm);
+	}
+}
+
+static void mtk_vcodec_dec_child_dev_off(struct mtk_vcodec_dev *vdec_dev,
+	int hw_idx)
+{
+	struct mtk_vcodec_pm *pm;
+
+	pm = mtk_vcodec_dec_get_pm(vdec_dev, hw_idx);
+	if (pm) {
+		mtk_vcodec_dec_clock_off(pm);
+		mtk_vcodec_dec_pw_off(pm);
+	}
+}
+
+void mtk_vcodec_dec_enable_hardware(struct mtk_vcodec_ctx *ctx, int hw_idx)
+{
+	mutex_lock(&ctx->dev->dec_mutex[hw_idx]);
+
+	if (IS_VDEC_LAT_ARCH(ctx->dev->vdec_pdata->hw_arch) &&
+		hw_idx == MTK_VDEC_CORE)
+		mtk_vcodec_dec_child_dev_on(ctx->dev, MTK_VDEC_LAT0);
+	mtk_vcodec_dec_child_dev_on(ctx->dev, hw_idx);
+
+	mtk_vcodec_dec_enable_irq(ctx->dev, hw_idx);
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_enable_hardware);
+
+void mtk_vcodec_dec_disable_hardware(struct mtk_vcodec_ctx *ctx, int hw_idx)
+{
+	mtk_vcodec_dec_disable_irq(ctx->dev, hw_idx);
+
+	mtk_vcodec_dec_child_dev_off(ctx->dev, hw_idx);
+	if (IS_VDEC_LAT_ARCH(ctx->dev->vdec_pdata->hw_arch) &&
+		hw_idx == MTK_VDEC_CORE)
+		mtk_vcodec_dec_child_dev_off(ctx->dev, MTK_VDEC_LAT0);
+
+	mutex_unlock(&ctx->dev->dec_mutex[hw_idx]);
 }
-EXPORT_SYMBOL_GPL(mtk_vcodec_dec_clock_off);
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_disable_hardware);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
index c4121df9764f..b420739b373d 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
@@ -12,9 +12,7 @@
 int mtk_vcodec_init_dec_clk(struct platform_device *pdev,
 	struct mtk_vcodec_pm *pm);
 
-int mtk_vcodec_dec_pw_on(struct mtk_vcodec_dev *vdec_dev, int hw_idx);
-void mtk_vcodec_dec_pw_off(struct mtk_vcodec_dev *vdec_dev, int hw_idx);
-void mtk_vcodec_dec_clock_on(struct mtk_vcodec_dev *vdec_dev, int hw_idx);
-void mtk_vcodec_dec_clock_off(struct mtk_vcodec_dev *vdec_dev, int hw_idx);
+void mtk_vcodec_dec_enable_hardware(struct mtk_vcodec_ctx *ctx, int hw_idx);
+void mtk_vcodec_dec_disable_hardware(struct mtk_vcodec_ctx *ctx, int hw_idx);
 
 #endif /* _MTK_VCODEC_DEC_PM_H_ */
diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
index 05a5b240e906..c93dd0ea3537 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
@@ -38,11 +38,9 @@ int vdec_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 		return -EINVAL;
 	}
 
-	mtk_vdec_lock(ctx);
-	mtk_vcodec_dec_clock_on(ctx->dev, ctx->hw_id);
+	mtk_vcodec_dec_enable_hardware(ctx, ctx->hw_id);
 	ret = ctx->dec_if->init(ctx);
-	mtk_vcodec_dec_clock_off(ctx->dev, ctx->hw_id);
-	mtk_vdec_unlock(ctx);
+	mtk_vcodec_dec_disable_hardware(ctx, ctx->hw_id);
 
 	return ret;
 }
@@ -70,15 +68,11 @@ int vdec_if_decode(struct mtk_vcodec_ctx *ctx, struct mtk_vcodec_mem *bs,
 	if (!ctx->drv_handle)
 		return -EIO;
 
-	mtk_vdec_lock(ctx);
-
+	mtk_vcodec_dec_enable_hardware(ctx, ctx->hw_id);
 	mtk_vcodec_set_curr_ctx(ctx->dev, ctx, ctx->hw_id);
-	mtk_vcodec_dec_clock_on(ctx->dev, ctx->hw_id);
 	ret = ctx->dec_if->decode(ctx->drv_handle, bs, fb, res_chg);
-	mtk_vcodec_dec_clock_off(ctx->dev, ctx->hw_id);
 	mtk_vcodec_set_curr_ctx(ctx->dev, NULL, ctx->hw_id);
-
-	mtk_vdec_unlock(ctx);
+	mtk_vcodec_dec_disable_hardware(ctx, ctx->hw_id);
 
 	return ret;
 }
@@ -103,11 +97,9 @@ void vdec_if_deinit(struct mtk_vcodec_ctx *ctx)
 	if (!ctx->drv_handle)
 		return;
 
-	mtk_vdec_lock(ctx);
-	mtk_vcodec_dec_clock_on(ctx->dev, ctx->hw_id);
+	mtk_vcodec_dec_enable_hardware(ctx, ctx->hw_id);
 	ctx->dec_if->deinit(ctx->drv_handle);
-	mtk_vcodec_dec_clock_off(ctx->dev, ctx->hw_id);
-	mtk_vdec_unlock(ctx);
+	mtk_vcodec_dec_disable_hardware(ctx, ctx->hw_id);
 
 	ctx->drv_handle = NULL;
 }
diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
index 576e08200a10..900d04fd4e66 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
@@ -212,11 +212,13 @@ static void vdec_msg_queue_core_work(struct work_struct *work)
 		return;
 
 	ctx = lat_buf->ctx;
+	mtk_vcodec_dec_enable_hardware(ctx, MTK_VDEC_CORE);
 	mtk_vcodec_set_curr_ctx(dev, ctx, MTK_VDEC_CORE);
 
 	lat_buf->core_decode(lat_buf);
 
 	mtk_vcodec_set_curr_ctx(dev, NULL, MTK_VDEC_CORE);
+	mtk_vcodec_dec_disable_hardware(ctx, MTK_VDEC_CORE);
 	vdec_msg_queue_qbuf(&ctx->msg_queue.lat_ctx, lat_buf);
 
 	if (!list_empty(&ctx->msg_queue.lat_ctx.ready_queue)) {
-- 
2.25.1

