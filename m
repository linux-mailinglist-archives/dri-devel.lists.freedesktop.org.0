Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4DC48C171
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 10:50:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E6B10F5A0;
	Wed, 12 Jan 2022 09:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42BAB10F5A0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 09:49:53 +0000 (UTC)
X-UUID: adf1ae7ded354f79865a17a2189196ae-20220112
X-UUID: adf1ae7ded354f79865a17a2189196ae-20220112
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 125177249; Wed, 12 Jan 2022 17:49:48 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Jan 2022 17:49:47 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 12 Jan 2022 17:49:46 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 12 Jan 2022 17:49:45 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v18,
 13/19] media: mtk-vcodec: Add work queue for core hardware decode
Date: Wed, 12 Jan 2022 17:49:17 +0800
Message-ID: <20220112094923.16839-14-yunfei.dong@mediatek.com>
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

Add work queue to process core hardware information.
First, get lat_buf from message queue, then call core
hardware of each codec(H264/VP9/AV1) to decode, finally
puts lat_buf back to the message.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Steve Cho <stevecho@chromium.org>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 16 +++++++++-
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 ++
 .../platform/mtk-vcodec/vdec_msg_queue.c      | 32 +++++++++++++++++++
 .../platform/mtk-vcodec/vdec_msg_queue.h      |  2 ++
 4 files changed, 52 insertions(+), 1 deletion(-)

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
index ae8e9adb389a..55e4ce2c2135 100644
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
index 59dbb5c369bd..d6b919a61e04 100644
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
@@ -194,6 +197,34 @@ void vdec_msg_queue_deinit(struct vdec_msg_queue *msg_queue,
 	}
 }
 
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
 int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
 	struct mtk_vcodec_ctx *ctx, core_decode_cb_t core_decode,
 	int private_size)
@@ -206,6 +237,7 @@ int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
 		return 0;
 
 	vdec_msg_queue_init_ctx(&msg_queue->lat_ctx, MTK_VDEC_LAT0);
+	INIT_WORK(&msg_queue->core_work, vdec_msg_queue_core_work);
 	msg_queue->wdma_addr.size = vde_msg_queue_get_trans_size(
 		ctx->picinfo.buf_w, ctx->picinfo.buf_h);
 
diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
index b793e23e628d..f62922753c64 100644
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
 
-- 
2.25.1

