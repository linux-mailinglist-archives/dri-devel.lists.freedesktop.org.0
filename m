Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A56B84782A7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 02:56:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA6A10E293;
	Fri, 17 Dec 2021 01:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C028D10E28A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 01:55:55 +0000 (UTC)
X-UUID: b9fc9b1469be46f197de7567e2cc0224-20211217
X-UUID: b9fc9b1469be46f197de7567e2cc0224-20211217
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 891579374; Fri, 17 Dec 2021 09:55:52 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Dec 2021 09:55:51 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 17 Dec 2021 09:55:50 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi
 Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v17,
 13/19] media: mtk-vcodec: Add work queue for core hardware decode
Date: Fri, 17 Dec 2021 09:55:24 +0800
Message-ID: <20211217015530.23720-14-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211217015530.23720-1-yunfei.dong@mediatek.com>
References: <20211217015530.23720-1-yunfei.dong@mediatek.com>
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
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add work queue to process core hardware information.
First, get lat_buf from message queue, then call core
hardware of each codec(H264/VP9/AV1) to decode, finally
puts lat_buf back to the message.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Steve Cho <stevecho@chromium.org>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 16 +++++++-
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 ++
 .../platform/mtk-vcodec/vdec_msg_queue.c      | 41 ++++++++++++++++---
 .../platform/mtk-vcodec/vdec_msg_queue.h      |  8 ++--
 4 files changed, 57 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 471b8c6ba7f2..10215ccc85f7 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -311,6 +311,17 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
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
 	mutex_init(&dev->dev_mutex);
@@ -322,7 +333,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
 	if (ret) {
 		mtk_v4l2_err("v4l2_device_register err=%d", ret);
-		goto err_res;
+		goto err_core_workq;
 	}
 
 	init_waitqueue_head(&dev->queue);
@@ -423,6 +434,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
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
index 517515ee9ac4..3fc747cea5c9 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -27,6 +27,7 @@
 #define MTK_VCODEC_MAX_PLANES	3
 #define MTK_V4L2_BENCHMARK	0
 #define WAIT_INTR_TIMEOUT_MS	1000
+#define IS_VDEC_LAT_ARCH(hw_arch) ((hw_arch) >= MTK_VDEC_LAT_SINGLE_CORE)
 
 /*
  * enum mtk_hw_reg_idx - MTK hw register base index
@@ -464,6 +465,7 @@ struct mtk_vcodec_enc_pdata {
  * @dec_capability: used to identify decode capability, ex: 4k
  * @enc_capability: used to identify encode capability
  *
+ * @core_workqueue: queue used for core hardware decode
  * @msg_queue_core_ctx: msg queue context used for core workqueue
  *
  * @subdev_dev: subdev hardware device
@@ -507,6 +509,7 @@ struct mtk_vcodec_dev {
 	unsigned int dec_capability;
 	unsigned int enc_capability;
 
+	struct workqueue_struct *core_workqueue;
 	struct vdec_msg_queue_ctx msg_queue_core_ctx;
 
 	void *subdev_dev[MTK_VDEC_HW_MAX];
diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
index 913aefa67618..576e08200a10 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
@@ -68,6 +68,9 @@ int vdec_msg_queue_qbuf(struct vdec_msg_queue_ctx *msg_ctx, struct vdec_lat_buf
 
 	if (msg_ctx->hardware_index != MTK_VDEC_CORE)
 		wake_up_all(&msg_ctx->ready_to_use);
+	else
+		queue_work(buf->ctx->dev->core_workqueue,
+			&buf->ctx->msg_queue.core_work);
 
 	mtk_v4l2_debug(3, "enqueue buf type: %d addr: 0x%p num: %d",
 		msg_ctx->hardware_index, buf, msg_ctx->ready_num);
@@ -169,8 +172,7 @@ bool vdec_msg_queue_wait_lat_buf_full(struct vdec_msg_queue *msg_queue)
 	return false;
 }
 
-void vdec_msg_queue_deinit(
-	struct vdec_msg_queue *msg_queue,
+void vdec_msg_queue_deinit(struct vdec_msg_queue *msg_queue,
 	struct mtk_vcodec_ctx *ctx)
 {
 	struct vdec_lat_buf *lat_buf;
@@ -196,10 +198,36 @@ void vdec_msg_queue_deinit(
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
+		mtk_v4l2_debug(3, "re-schedule to decode for core: %d",
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
@@ -210,6 +238,7 @@ int vdec_msg_queue_init(
 		return 0;
 
 	vdec_msg_queue_init_ctx(&msg_queue->lat_ctx, MTK_VDEC_LAT0);
+	INIT_WORK(&msg_queue->core_work, vdec_msg_queue_core_work);
 	msg_queue->wdma_addr.size = vde_msg_queue_get_trans_size(
 		ctx->picinfo.buf_w, ctx->picinfo.buf_h);
 
diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
index 21a9c0aeb1b4..43eae638a2a8 100644
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

