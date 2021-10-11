Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D85A7428743
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 09:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106396E42C;
	Mon, 11 Oct 2021 07:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7B06E425
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 07:03:07 +0000 (UTC)
X-UUID: 92ab0c4c9a5e442da4a4914dc05dd559-20211011
X-UUID: 92ab0c4c9a5e442da4a4914dc05dd559-20211011
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 138057492; Mon, 11 Oct 2021 15:03:04 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Oct 2021 15:03:02 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Oct 2021 15:03:01 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi
 Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7, 11/15] media: mtk-vcodec: Add core thread
Date: Mon, 11 Oct 2021 15:02:43 +0800
Message-ID: <20211011070247.792-12-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011070247.792-1-yunfei.dong@mediatek.com>
References: <20211011070247.792-1-yunfei.dong@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Core thread:
1. Gets lat_buf from core msg queue.
2. Proceeds core decode.
3. Puts the lat_buf back to lat msg queue.

Both H264 and VP9 rely on the core thread.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 12 +++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  7 ++++
 .../platform/mtk-vcodec/vdec_msg_queue.c      | 32 +++++++++++++++++++
 .../platform/mtk-vcodec/vdec_msg_queue.h      |  6 ++++
 4 files changed, 57 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index e21e0c4bcd86..de83e3b821b4 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -364,6 +364,18 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_dec_pm;
 	}
 
+	if (VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch)) {
+		vdec_msg_queue_init_ctx(&dev->msg_queue_core_ctx,
+			MTK_VDEC_CORE);
+		dev->kthread_core = kthread_run(vdec_msg_queue_core_thead, dev,
+			"mtk-%s", "core");
+		if (IS_ERR(dev->kthread_core)) {
+			dev_err(&pdev->dev, "Failed to create core thread");
+			ret = PTR_ERR(dev->kthread_core);
+			goto err_res;
+		}
+	}
+
 	for (i = 0; i < MTK_VDEC_HW_MAX; i++)
 		mutex_init(&dev->dec_mutex[i]);
 	spin_lock_init(&dev->irqlock);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 9d072c082f73..68a9b1a2d3b3 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -27,6 +27,7 @@
 #define MTK_VCODEC_MAX_PLANES	3
 #define MTK_V4L2_BENCHMARK	0
 #define WAIT_INTR_TIMEOUT_MS	1000
+#define VDEC_LAT_ARCH(hw_arch) ((hw_arch) >= MTK_VDEC_LAT_SINGLE_CORE)
 
 /*
  * enum mtk_hw_reg_idx - MTK hw register base index
@@ -466,6 +467,9 @@ struct mtk_vcodec_enc_pdata {
  * @comp_dev: component hardware device
  * @component_node: component node
  *
+ * @kthread_core: thread used for core hardware decode
+ * @msg_queue_core_ctx: msg queue context used for core thread
+ *
  * @hardware_bitmap: used to record hardware is ready or not
  */
 struct mtk_vcodec_dev {
@@ -508,6 +512,9 @@ struct mtk_vcodec_dev {
 	void *comp_dev[MTK_VDEC_HW_MAX];
 	struct device_node *component_node[MTK_VDEC_HW_MAX];
 
+	struct task_struct *kthread_core;
+	struct vdec_msg_queue_ctx msg_queue_core_ctx;
+
 	DECLARE_BITMAP(hardware_bitmap, MTK_VDEC_HW_MAX);
 };
 
diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
index d66ed98c79a9..665f571eab4b 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
@@ -256,3 +256,35 @@ void vdec_msg_queue_deinit(
 			kfree(lat_buf->private_data);
 	}
 }
+
+int vdec_msg_queue_core_thead(void *data)
+{
+	struct mtk_vcodec_dev *dev = data;
+	struct vdec_lat_buf *lat_buf;
+	struct mtk_vcodec_ctx *ctx;
+
+	set_freezable();
+	for (;;) {
+		try_to_freeze();
+		if (kthread_should_stop())
+			break;
+
+		lat_buf = vdec_msg_queue_dqbuf(&dev->msg_queue_core_ctx);
+		if (!lat_buf)
+			continue;
+
+		ctx = lat_buf->ctx;
+		mtk_vcodec_set_curr_ctx(dev, ctx, MTK_VDEC_CORE);
+
+		if (!lat_buf->core_decode)
+			mtk_v4l2_err("Core decode callback func is NULL");
+		else
+			lat_buf->core_decode(lat_buf);
+
+		mtk_vcodec_set_curr_ctx(dev, NULL, MTK_VDEC_CORE);
+		vdec_msg_queue_qbuf(&ctx->msg_queue.lat_ctx, lat_buf);
+	}
+
+	mtk_v4l2_debug(3, "Video Capture Thread End");
+	return 0;
+}
diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
index 1905ce713592..b5745b144140 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
@@ -148,4 +148,10 @@ void vdec_msg_queue_deinit(
 	struct vdec_msg_queue *msg_queue,
 	struct mtk_vcodec_ctx *ctx);
 
+/**
+ * vdec_msg_queue_core_thead - used for core decoder.
+ * @data: private data used for each codec
+ */
+int vdec_msg_queue_core_thead(void *data);
+
 #endif
-- 
2.25.1

