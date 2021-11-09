Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5440944ADEB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 13:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324F66E85D;
	Tue,  9 Nov 2021 12:50:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAC16E856
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 12:50:56 +0000 (UTC)
X-UUID: 4a9af4bc53514bd4bc23e4f7beee3243-20211109
X-UUID: 4a9af4bc53514bd4bc23e4f7beee3243-20211109
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1759908520; Tue, 09 Nov 2021 20:50:51 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 9 Nov 2021 20:50:50 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkexhb02.mediatek.inc (172.21.101.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Nov 2021 20:50:49 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 9 Nov 2021 20:50:48 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v9,
 13/19] media: mtk-vcodec: Add work queue for core hardware decode
Date: Tue, 9 Nov 2021 20:50:24 +0800
Message-ID: <20211109125030.26299-14-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211109125030.26299-1-yunfei.dong@mediatek.com>
References: <20211109125030.26299-1-yunfei.dong@mediatek.com>
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

Add work queue to process core hardware information.
First, get lat_buf from message queue, then call core
hardware of each codec(H264/VP9/AV1) to decode, finally
puts lat_buf back to the message.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 16 +++++++-
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 ++
 .../platform/mtk-vcodec/vdec_msg_queue.c      | 41 ++++++++++++++++---
 .../platform/mtk-vcodec/vdec_msg_queue.h      |  8 ++--
 4 files changed, 57 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 197490c22db1..50e71e9b5082 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -352,6 +352,17 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_dec_pm;
 	}
 
+	if (IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch)) {
+		vdec_msg_queue_init_ctx(&dev->msg_queue_core_ctx, MTK_VDEC_CORE);
+		dev->core_workqueue = alloc_ordered_workqueue("core-decoder",
+			WQ_MEM_RECLAIM | WQ_FREEZABLE);
+		if (!dev->core_workqueue) {
+			mtk_v4l2_err("Failed to create core workqueue");
+			ret = -EINVAL;
+			goto err_res;
+		}
+	}
+
 	for (i = 0; i < MTK_VDEC_HW_MAX; i++)
 		mutex_init(&dev->dec_mutex[i]);
 	spin_lock_init(&dev->irqlock);
@@ -362,7 +373,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
 	if (ret) {
 		mtk_v4l2_err("v4l2_device_register err=%d", ret);
-		goto err_res;
+		goto err_core_workq;
 	}
 
 	init_waitqueue_head(&dev->queue);
@@ -459,6 +470,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	video_unregister_device(vfd_dec);
 err_dec_alloc:
 	v4l2_device_unregister(&dev->v4l2_dev);
+err_core_workq:
+	if (IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch))
+		destroy_workqueue(dev->core_workqueue);
 err_res:
 	mtk_vcodec_release_dec_pm(&dev->pm);
 err_dec_pm:
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 9de2f00adbf2..efef476e906d 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -27,6 +27,7 @@
 #define MTK_VCODEC_MAX_PLANES	3
 #define MTK_V4L2_BENCHMARK	0
 #define WAIT_INTR_TIMEOUT_MS	1000
+#define IS_VDEC_LAT_ARCH(hw_arch) ((hw_arch) >= MTK_VDEC_LAT_SINGLE_CORE)
 
 /*
  * enum mtk_hw_reg_idx - MTK hw register base index
@@ -467,6 +468,7 @@ struct mtk_vcodec_enc_pdata {
  * @subdev_dev: subdev hardware device
  * @subdev_node: subdev node
  *
+ * @core_workqueue: queue used for core hardware decode
  * @msg_queue_core_ctx: msg queue context used for core workqueue
  *
  * @hardware_bitmap: used to record hardware is ready or not
@@ -511,6 +513,7 @@ struct mtk_vcodec_dev {
 	void *subdev_dev[MTK_VDEC_HW_MAX];
 	struct device_node *subdev_node[MTK_VDEC_HW_MAX];
 
+	struct workqueue_struct *core_workqueue;
 	struct vdec_msg_queue_ctx msg_queue_core_ctx;
 
 	DECLARE_BITMAP(hardware_bitmap, MTK_VDEC_HW_MAX);
diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
index da4d114f7ad0..79411b73c45b 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
@@ -69,6 +69,9 @@ void vdec_msg_queue_qbuf(struct vdec_msg_queue_ctx *msg_ctx,
 
 	if (msg_ctx->hardware_index != MTK_VDEC_CORE)
 		wake_up_all(&msg_ctx->ready_to_use);
+	else
+		queue_work(buf->ctx->dev->core_workqueue,
+			&buf->ctx->msg_queue.core_work);
 
 	mtk_v4l2_debug(3, "enqueue buf type: %d addr: 0x%p num: %d",
 		msg_ctx->hardware_index, buf, msg_ctx->ready_num);
@@ -170,8 +173,7 @@ bool vdec_msg_queue_wait_lat_buf_full(struct vdec_msg_queue *msg_queue)
 	return false;
 }
 
-void vdec_msg_queue_deinit(
-	struct vdec_msg_queue *msg_queue,
+void vdec_msg_queue_deinit(struct vdec_msg_queue *msg_queue,
 	struct mtk_vcodec_ctx *ctx)
 {
 	struct vdec_lat_buf *lat_buf;
@@ -197,10 +199,36 @@ void vdec_msg_queue_deinit(
 	}
 }
 
-int vdec_msg_queue_init(
-	struct vdec_msg_queue *msg_queue,
-	struct mtk_vcodec_ctx *ctx,
-	core_decode_cb_t core_decode,
+static void vdec_msg_queue_core_work(struct work_struct *work)
+{
+	struct vdec_msg_queue *msg_queue =
+		container_of(work, struct vdec_msg_queue, core_work);
+	struct mtk_vcodec_ctx *ctx =
+		container_of(msg_queue, struct mtk_vcodec_ctx, msg_queue);
+	struct mtk_vcodec_dev *dev = ctx->dev;
+	struct vdec_lat_buf *lat_buf;
+
+	lat_buf = vdec_msg_queue_dqbuf(&dev->msg_queue_core_ctx);
+	if (!lat_buf)
+		return;
+
+	ctx = lat_buf->ctx;
+	mtk_vcodec_set_curr_ctx(dev, ctx, MTK_VDEC_CORE);
+
+	lat_buf->core_decode(lat_buf);
+
+	mtk_vcodec_set_curr_ctx(dev, NULL, MTK_VDEC_CORE);
+	vdec_msg_queue_qbuf(&ctx->msg_queue.lat_ctx, lat_buf);
+
+	if (!list_empty(&ctx->msg_queue.lat_ctx.ready_queue)) {
+		mtk_v4l2_debug(3, "re-schedule to decode for core",
+			dev->msg_queue_core_ctx.ready_num);
+		queue_work(dev->core_workqueue, &msg_queue->core_work);
+	}
+}
+
+int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
+	struct mtk_vcodec_ctx *ctx,	core_decode_cb_t core_decode,
 	int private_size)
 {
 	struct vdec_lat_buf *lat_buf;
@@ -211,6 +239,7 @@ int vdec_msg_queue_init(
 		return 0;
 
 	vdec_msg_queue_init_ctx(&msg_queue->lat_ctx, MTK_VDEC_LAT0);
+	INIT_WORK(&msg_queue->core_work, vdec_msg_queue_core_work);
 	msg_queue->wdma_addr.size = vde_msg_queue_get_trans_size(
 		ctx->picinfo.buf_w, ctx->picinfo.buf_h);
 
diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
index 91a315ba0cba..44668f0245d4 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
@@ -67,6 +67,7 @@ struct vdec_lat_buf {
  * @wdma_addr: wdma address used for ube
  * @wdma_rptr_addr: ube read point
  * @wdma_wptr_addr: ube write point
+ * @core_work: core hardware work
  * @lat_ctx: used to store lat buffer list
  */
 struct vdec_msg_queue {
@@ -76,6 +77,7 @@ struct vdec_msg_queue {
 	uint64_t wdma_rptr_addr;
 	uint64_t wdma_wptr_addr;
 
+	struct work_struct core_work;
 	struct vdec_msg_queue_ctx lat_ctx;
 };
 
@@ -86,10 +88,8 @@ struct vdec_msg_queue {
  * @core_decode: core decode callback for each codec
  * @private_size: the private data size used to share with core
  */
-int vdec_msg_queue_init(
-	struct vdec_msg_queue *msg_queue,
-	struct mtk_vcodec_ctx *ctx,
-	core_decode_cb_t core_decode,
+int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
+	struct mtk_vcodec_ctx *ctx,	core_decode_cb_t core_decode,
 	int private_size);
 
 /**
-- 
2.25.1

