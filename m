Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7A1AFBD71
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 23:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C025010E575;
	Mon,  7 Jul 2025 21:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="TcitTxAs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C0F10E300
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 01:33:02 +0000 (UTC)
X-UUID: 4fa7c5d85ad211f0b33aeb1e7f16c2b6-20250707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=m76SRXyKR4irhovXoIYoQ8db0gdy3CnPzHH41NX06CE=; 
 b=TcitTxAs+pYdzXD5rUoPj9NILMM/6pGJtg/qAl1ZNjHzBXZSJyxz7XVkwtQ+NhGyKoFWUAOq9jaOKfkqFauhd0qnr14zUs6CYjDI2e2YP2Es9+bdJVg/oesnMWNzSQskiXwaGi+pPwSlecJ6AjZ85tIw++CcuF4oyGzzA5XidfM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2, REQID:05ac0b58-045f-47a4-8798-3533b4851456, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:9eb4ff7, CLOUDID:bb00c89c-b8a9-480a-b7e5-687022facff7,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
 ,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:1,OSI:0,OSA:0,AV
 :0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,OSH
X-CID-BAS: 2,OSH,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4fa7c5d85ad211f0b33aeb1e7f16c2b6-20250707
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <shangyao.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1715028567; Mon, 07 Jul 2025 09:32:57 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Jul 2025 09:32:55 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Jul 2025 09:32:55 +0800
From: shangyao lin <shangyao.lin@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Shangyao Lin <shangyao.lin@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 10/13] media: platform: mediatek: add isp_7x video ops
Date: Mon, 7 Jul 2025 09:31:51 +0800
Message-ID: <20250707013154.4055874-11-shangyao.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Mon, 07 Jul 2025 21:23:55 +0000
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

From: "shangyao.lin" <shangyao.lin@mediatek.com>

Introduce the V4L2 video interface and feature management for the MediaTek
ISP7.x CAMSYS. These interfaces provide functionalities such as video operation
initialization and registration. They also manage MediaTek-specific formats and
handle buffers for MediaTek camera video devices. This enables CAMSYS
functionalities to be compatible with the V4L2 framework.

Changes in v2:
- Removed mtk_cam-feature.c and mtk_cam-feature.h, along with related code
- Various fixes per review comments

Signed-off-by: shangyao.lin <shangyao.lin@mediatek.com>
---
 .../isp/isp_7x/camsys/mtk_cam-video.c         | 1594 +++++++++++++++++
 .../isp/isp_7x/camsys/mtk_cam-video.h         |  223 +++
 2 files changed, 1817 insertions(+)
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-video.c
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-video.h

diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-video.c b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-video.c
new file mode 100755
index 000000000000..8f071c259851
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-video.c
@@ -0,0 +1,1594 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2022 MediaTek Inc.
+
+#include <media/v4l2-device.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-dma-contig.h>
+#include <linux/videodev2.h>
+#include <linux/iommu.h>
+
+#include "mtk_cam.h"
+#include "mtk_cam-video.h"
+#include "mtk_camera-v4l2-controls.h"
+
+/*
+ * differt dma (fmt) would have different bus_size
+ * align xsize(bytes per line) with [bus_size * pixel_mode]
+ */
+static inline int mtk_cam_is_fullg(unsigned int ipi_fmt)
+{
+	return (ipi_fmt == MTKCAM_IPI_IMG_FMT_FG_BAYER8) ||
+	       (ipi_fmt == MTKCAM_IPI_IMG_FMT_FG_BAYER10) ||
+	       (ipi_fmt == MTKCAM_IPI_IMG_FMT_FG_BAYER12);
+}
+
+static inline
+unsigned int mtk_cam_dma_bus_size(int bpp, int pixel_mode_shift, int is_fg)
+{
+	unsigned int bus_size = ALIGN(bpp, 16) << pixel_mode_shift;
+
+	if (is_fg)
+		bus_size <<= 1;
+	return bus_size / 8; /* in bytes */
+}
+
+static inline
+unsigned int mtk_cam_yuv_dma_bus_size(int bpp, int pixel_mode_shift)
+{
+	unsigned int bus_size = ALIGN(bpp, 32) << pixel_mode_shift;
+
+	return bus_size / 8; /* in bytes */
+}
+
+static inline
+unsigned int mtk_cam_dmao_xsize(int w, unsigned int ipi_fmt, int pixel_mode_shift)
+{
+	const unsigned int is_fg = mtk_cam_is_fullg(ipi_fmt);
+	const unsigned int bpp = mtk_cam_get_pixel_bits(ipi_fmt);
+	const unsigned int bytes = is_fg ?
+		DIV_ROUND_UP(w * bpp * 3 / 2, 8) : DIV_ROUND_UP(w * bpp, 8);
+	const unsigned int bus_size =
+		mtk_cam_dma_bus_size(bpp, pixel_mode_shift, is_fg);
+
+	return ALIGN(bytes, bus_size);
+}
+
+static void mtk_cam_release_all_buffer(struct mtk_cam_device *cam)
+{
+	struct mtk_cam_buffer *buf, *tmp;
+
+	spin_lock(&cam->dma_pending_lock);
+	list_for_each_entry_safe(buf, tmp, &cam->dma_pending, list) {
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->vbb.vb2_buf, VB2_BUF_STATE_ERROR);
+	}
+	spin_unlock(&cam->dma_pending_lock);
+
+	spin_lock(&cam->dma_processing_lock);
+	list_for_each_entry_safe(buf, tmp, &cam->dma_processing, list) {
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->vbb.vb2_buf, VB2_BUF_STATE_ERROR);
+	}
+	spin_unlock(&cam->dma_processing_lock);
+}
+
+static int mtk_cam_vb2_queue_setup(struct vb2_queue *vq,
+				   unsigned int *num_buffers,
+				   unsigned int *num_planes,
+				   unsigned int sizes[],
+				   struct device *alloc_devs[])
+{
+	struct mtk_cam_device *cam = vb2_get_drv_priv(vq);
+	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vq);
+	struct mtk_raw_pipeline *raw_pipeline;
+	unsigned int max_buffer_count = node->desc.max_buf_count;
+	const struct v4l2_format *fmt = &node->active_fmt;
+	unsigned int size;
+	int i;
+
+	/* Check the limitation of buffer size */
+	if (max_buffer_count)
+		*num_buffers = clamp_val(*num_buffers, 1, max_buffer_count);
+
+	if (node->desc.smem_alloc)
+		vq->dma_attrs |= DMA_ATTR_NO_KERNEL_MAPPING;
+
+	if (vq->type == V4L2_BUF_TYPE_META_OUTPUT ||
+	    vq->type == V4L2_BUF_TYPE_META_CAPTURE)
+		size = fmt->fmt.meta.buffersize;
+	else
+		size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
+
+	/* Add for q.create_bufs with fmt.g_sizeimage(p) / 2 test */
+	if (*num_planes) {
+		if (sizes[0] < size || *num_planes != 1)
+			return -EINVAL;
+	} else {
+		/* Set default as one plane */
+		*num_planes = 1;
+		sizes[0] = size;
+
+		if (is_raw_subdev(node->uid.pipe_id)) {
+			raw_pipeline =
+				mtk_cam_dev_get_raw_pipeline(cam, node->uid.pipe_id);
+
+			if (raw_pipeline &&
+			    raw_pipeline->user_res.raw_res.feature &&
+			    fmt->fmt.pix_mp.num_planes > 1) {
+				*num_planes = fmt->fmt.pix_mp.num_planes;
+				for (i = 0; i < *num_planes; i++)
+					sizes[i] = size;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int mtk_cam_vb2_buf_init(struct vb2_buffer *vb)
+{
+	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vb->vb2_queue);
+	struct mtk_cam_buffer *buf;
+	struct mtk_cam_device *cam = vb2_get_drv_priv(vb->vb2_queue);
+	struct device *dev = cam->raw.devs[0];
+	dma_addr_t addr;
+
+	buf = mtk_cam_vb2_buf_to_dev_buf(vb);
+	buf->daddr = vb2_dma_contig_plane_dma_addr(vb, 0);
+	buf->scp_addr = 0;
+
+	/* SCP address is only valid for meta input buffer */
+	if (!node->desc.smem_alloc)
+		return 0;
+
+	/* Use coherent address to get iova address */
+	addr = dma_map_resource(dev, buf->daddr, vb->planes[0].length,
+				DMA_BIDIRECTIONAL, DMA_ATTR_SKIP_CPU_SYNC);
+	if (dma_mapping_error(dev, addr)) {
+		dev_err(dev, "failed to map addr:%pad\n", &buf->daddr);
+		return -EFAULT;
+	}
+	buf->scp_addr = buf->daddr;
+	buf->daddr = addr;
+
+	return 0;
+}
+
+static int mtk_cam_vb2_buf_prepare(struct vb2_buffer *vb)
+{
+	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vb->vb2_queue);
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
+	const struct v4l2_format *fmt = &node->active_fmt;
+	unsigned int size;
+
+	dev_dbg(vb->vb2_queue->dev, "%s: %s\n", __func__, node->desc.name);
+
+	if (vb->vb2_queue->type == V4L2_BUF_TYPE_META_OUTPUT ||
+	    vb->vb2_queue->type == V4L2_BUF_TYPE_META_CAPTURE)
+		size = fmt->fmt.meta.buffersize;
+	else
+		size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
+
+	if (vb2_plane_size(vb, 0) < size) {
+		dev_info(vb->vb2_queue->dev,
+			 "plane size is too small:%lu<%u\n",
+			 vb2_plane_size(vb, 0), size);
+	}
+
+	if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
+		if ((vb2_get_plane_payload(vb, 0) != size) &&
+		    vb->vb2_queue->streaming) {
+			dev_dbg(vb->vb2_queue->dev,
+				"plane payload is mismatch:%lu:%u\n",
+				vb2_get_plane_payload(vb, 0), size);
+		}
+		return 0;
+	}
+
+	v4l2_buf->field = V4L2_FIELD_NONE;
+	vb2_set_plane_payload(vb, 0, size);
+
+	return 0;
+}
+
+static int mtk_cam_vb2_start_streaming(struct vb2_queue *vq,
+				       unsigned int count)
+{
+	struct mtk_cam_device *cam = vb2_get_drv_priv(vq);
+	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vq);
+	struct media_entity *entity = &node->vdev.entity;
+	struct mtk_cam_ctx *ctx = NULL;
+	struct device *dev = cam->dev;
+	int ret;
+
+	/* check entity is linked */
+	if (!node->enabled) {
+		dev_info(cam->dev,
+			 "%s: stream on failed, node is not enabled\n",
+			 node->desc.name);
+		ret = -ENOLINK;
+		goto fail_return_buffer;
+	}
+
+	if (!media_entity_is_streaming(entity)) {
+		ctx = mtk_cam_start_ctx(cam, node);
+		if (!ctx) {
+			ret = -ENOLINK;
+			goto fail_return_buffer;
+		}
+	} else {
+		ctx = mtk_cam_find_ctx(cam, entity);
+		if (WARN_ON(!ctx)) {
+			ret = -ENOLINK;
+			goto fail_return_buffer;
+		}
+	}
+
+	cam->streaming_pipe |= (1 << node->uid.pipe_id);
+	ctx->streaming_pipe |= (1 << node->uid.pipe_id);
+	ctx->streaming_node_cnt++;
+
+	if (ctx->streaming_node_cnt == 1)
+		if (is_raw_subdev(node->uid.pipe_id)) {
+			if (!isp_composer_create_session(ctx)) {
+				ctx->session_created = 1;
+			} else {
+				complete(&ctx->session_complete);
+				ret = -EBUSY;
+				goto fail_stop_ctx;
+			}
+		}
+
+	dev_dbg(dev, "%s:%s:ctx(%d): node:%d count info:%d\n", __func__,
+		node->desc.name, ctx->stream_id, node->desc.id,
+		ctx->streaming_node_cnt);
+
+	ret = mtk_cam_ctx_stream_on(ctx, node);
+	if (ret)
+		goto fail_destroy_session;
+
+	mtk_cam_buf_try_queue(ctx);
+
+	return 0;
+
+fail_destroy_session:
+	if (ctx->session_created)
+		isp_composer_destroy_session(ctx);
+fail_stop_ctx:
+	ctx->streaming_node_cnt--;
+	ctx->streaming_pipe &= ~(1 << node->uid.pipe_id);
+	cam->streaming_pipe &= ~(1 << node->uid.pipe_id);
+	mtk_cam_dev_req_cleanup(ctx, node->uid.pipe_id, VB2_BUF_STATE_QUEUED);
+	mtk_cam_stop_ctx(ctx, node);
+fail_return_buffer:
+	mtk_cam_release_all_buffer(cam);
+	/* relese bufs by request */
+	return ret;
+}
+
+static void mtk_cam_vb2_stop_streaming(struct vb2_queue *vq)
+{
+	struct mtk_cam_device *cam = vb2_get_drv_priv(vq);
+	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vq);
+	struct device *dev = cam->dev;
+	struct mtk_cam_ctx *ctx;
+
+	ctx = mtk_cam_find_ctx(cam, &node->vdev.entity);
+	if (WARN_ON(!ctx)) {
+		/* the ctx is stop, media_pipeline_stop is called */
+		mtk_cam_dev_req_clean_pending(cam, node->uid.pipe_id,
+					      VB2_BUF_STATE_ERROR);
+		return;
+	}
+
+	dev_dbg(dev, "%s:%s:ctx(%d): node:%d count info:%d\n", __func__,
+		node->desc.name, ctx->stream_id, node->desc.id,
+		ctx->streaming_node_cnt);
+
+	mtk_cam_ctx_stream_off(ctx, node);
+
+	if (cam->streaming_pipe & (1 << node->uid.pipe_id)) {
+		/* NOTE: take multi-pipelines case into consideration     */
+		/* Moreover, must clean bit mask before req cleanup       */
+		/* Otherwise, would cause req not removed in pending list */
+		cam->streaming_pipe &= ~(1 << node->uid.pipe_id);
+		mtk_cam_dev_req_cleanup(ctx, node->uid.pipe_id, VB2_BUF_STATE_ERROR);
+	}
+
+	/* all bufs of node should be return by per requests */
+	mtk_cam_release_all_buffer(ctx->cam);
+
+	/* NOTE: take multi-pipelines case into consideration */
+	cam->streaming_pipe &= ~(1 << node->uid.pipe_id);
+	ctx->streaming_node_cnt--;
+	if (ctx->streaming_node_cnt)
+		return;
+
+	mtk_cam_stop_ctx(ctx, node);
+}
+
+int is_mtk_format(u32 pixelformat)
+{
+	switch (pixelformat) {
+	case V4L2_PIX_FMT_YUYV10:
+	case V4L2_PIX_FMT_YVYU10:
+	case V4L2_PIX_FMT_UYVY10:
+	case V4L2_PIX_FMT_VYUY10:
+	case V4L2_PIX_FMT_YUYV12:
+	case V4L2_PIX_FMT_YVYU12:
+	case V4L2_PIX_FMT_UYVY12:
+	case V4L2_PIX_FMT_VYUY12:
+	case V4L2_PIX_FMT_MTISP_YUYV10P:
+	case V4L2_PIX_FMT_MTISP_YVYU10P:
+	case V4L2_PIX_FMT_MTISP_UYVY10P:
+	case V4L2_PIX_FMT_MTISP_VYUY10P:
+	case V4L2_PIX_FMT_MTISP_YUYV12P:
+	case V4L2_PIX_FMT_MTISP_YVYU12P:
+	case V4L2_PIX_FMT_MTISP_UYVY12P:
+	case V4L2_PIX_FMT_MTISP_VYUY12P:
+	case V4L2_PIX_FMT_NV12_10:
+	case V4L2_PIX_FMT_NV21_10:
+	case V4L2_PIX_FMT_NV16_10:
+	case V4L2_PIX_FMT_NV61_10:
+	case V4L2_PIX_FMT_NV12_12:
+	case V4L2_PIX_FMT_NV21_12:
+	case V4L2_PIX_FMT_NV16_12:
+	case V4L2_PIX_FMT_NV61_12:
+	case V4L2_PIX_FMT_MTISP_NV12_10P:
+	case V4L2_PIX_FMT_MTISP_NV21_10P:
+	case V4L2_PIX_FMT_MTISP_NV16_10P:
+	case V4L2_PIX_FMT_MTISP_NV61_10P:
+	case V4L2_PIX_FMT_MTISP_NV12_12P:
+	case V4L2_PIX_FMT_MTISP_NV21_12P:
+	case V4L2_PIX_FMT_MTISP_NV16_12P:
+	case V4L2_PIX_FMT_MTISP_NV61_12P:
+	case V4L2_PIX_FMT_MTISP_NV12_UFBC:
+	case V4L2_PIX_FMT_MTISP_NV21_UFBC:
+	case V4L2_PIX_FMT_MTISP_NV12_10_UFBC:
+	case V4L2_PIX_FMT_MTISP_NV21_10_UFBC:
+	case V4L2_PIX_FMT_MTISP_NV12_12_UFBC:
+	case V4L2_PIX_FMT_MTISP_NV21_12_UFBC:
+	case V4L2_PIX_FMT_MTISP_BAYER8_UFBC:
+	case V4L2_PIX_FMT_MTISP_BAYER10_UFBC:
+	case V4L2_PIX_FMT_MTISP_BAYER12_UFBC:
+	case V4L2_PIX_FMT_MTISP_BAYER14_UFBC:
+	case V4L2_PIX_FMT_MTISP_SGRB8F:
+	case V4L2_PIX_FMT_MTISP_SGRB10F:
+	case V4L2_PIX_FMT_MTISP_SGRB12F:
+		return 1;
+	default:
+		return 0;
+	}
+}
+
+int is_yuv_ufo(u32 pixelformat)
+{
+	switch (pixelformat) {
+	case V4L2_PIX_FMT_MTISP_NV12_UFBC:
+	case V4L2_PIX_FMT_MTISP_NV21_UFBC:
+	case V4L2_PIX_FMT_MTISP_NV12_10_UFBC:
+	case V4L2_PIX_FMT_MTISP_NV21_10_UFBC:
+	case V4L2_PIX_FMT_MTISP_NV12_12_UFBC:
+	case V4L2_PIX_FMT_MTISP_NV21_12_UFBC:
+		return 1;
+	default:
+		return 0;
+	}
+}
+
+int is_raw_ufo(u32 pixelformat)
+{
+	switch (pixelformat) {
+	case V4L2_PIX_FMT_MTISP_BAYER8_UFBC:
+	case V4L2_PIX_FMT_MTISP_BAYER10_UFBC:
+	case V4L2_PIX_FMT_MTISP_BAYER12_UFBC:
+	case V4L2_PIX_FMT_MTISP_BAYER14_UFBC:
+		return 1;
+	default:
+		return 0;
+	}
+}
+
+int is_fullg_rb(u32 pixelformat)
+{
+	switch (pixelformat) {
+	case V4L2_PIX_FMT_MTISP_SGRB8F:
+	case V4L2_PIX_FMT_MTISP_SGRB10F:
+	case V4L2_PIX_FMT_MTISP_SGRB12F:
+		return 1;
+	default:
+		return 0;
+	}
+}
+
+const struct mtk_format_info *mtk_format_info(u32 format)
+{
+	static const struct mtk_format_info formats[] = {
+		/* YUV planar formats */
+		{ .format = V4L2_PIX_FMT_NV12_10,
+			.mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 },
+			.hdiv = 2, .vdiv = 2, .bit_r_num = 2, .bit_r_den = 1 },
+		{ .format = V4L2_PIX_FMT_NV21_10,
+			.mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 },
+			.hdiv = 2, .vdiv = 2, .bit_r_num = 2, .bit_r_den = 1 },
+		{ .format = V4L2_PIX_FMT_NV16_10,
+			.mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 },
+			.hdiv = 2, .vdiv = 1, .bit_r_num = 2, .bit_r_den = 1 },
+		{ .format = V4L2_PIX_FMT_NV61_10,
+			.mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 },
+			.hdiv = 2, .vdiv = 1, .bit_r_num = 2, .bit_r_den = 1 },
+		{ .format = V4L2_PIX_FMT_YUYV10,
+			.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 },
+			.hdiv = 2, .vdiv = 1, .bit_r_num = 2, .bit_r_den = 1 },
+		{ .format = V4L2_PIX_FMT_YVYU10,
+			.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 },
+			.hdiv = 2, .vdiv = 1, .bit_r_num = 2, .bit_r_den = 1 },
+		{ .format = V4L2_PIX_FMT_UYVY10,
+			.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 },
+			.hdiv = 2, .vdiv = 1, .bit_r_num = 2, .bit_r_den = 1 },
+		{ .format = V4L2_PIX_FMT_VYUY10,
+			.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 },
+			.hdiv = 2, .vdiv = 1, .bit_r_num = 2, .bit_r_den = 1 },
+		{ .format = V4L2_PIX_FMT_NV12_12,
+			.mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 },
+			.hdiv = 2, .vdiv = 2, .bit_r_num = 2, .bit_r_den = 1 },
+		{ .format = V4L2_PIX_FMT_NV21_12,
+			.mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 },
+			.hdiv = 2, .vdiv = 2, .bit_r_num = 2, .bit_r_den = 1 },
+		{ .format = V4L2_PIX_FMT_NV16_12,
+			.mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 },
+			.hdiv = 2, .vdiv = 1, .bit_r_num = 2, .bit_r_den = 1 },
+		{ .format = V4L2_PIX_FMT_NV61_12,
+			.mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 },
+			.hdiv = 2, .vdiv = 1, .bit_r_num = 2, .bit_r_den = 1 },
+		{ .format = V4L2_PIX_FMT_YUYV12,
+			.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 },
+			.hdiv = 2, .vdiv = 1, .bit_r_num = 2, .bit_r_den = 1 },
+		{ .format = V4L2_PIX_FMT_YVYU12,
+			.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 },
+			.hdiv = 2, .vdiv = 1, .bit_r_num = 2, .bit_r_den = 1 },
+		{ .format = V4L2_PIX_FMT_UYVY12,
+			.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 },
+			.hdiv = 2, .vdiv = 1, .bit_r_num = 2, .bit_r_den = 1 },
+		{ .format = V4L2_PIX_FMT_VYUY12,
+			.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 },
+			.hdiv = 2, .vdiv = 1, .bit_r_num = 2, .bit_r_den = 1 },
+		/* YUV packed formats */
+		{ .format = V4L2_PIX_FMT_MTISP_YUYV10P,
+			.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 },
+			.hdiv = 2, .vdiv = 1, .bit_r_num = 5, .bit_r_den = 4 },
+		{ .format = V4L2_PIX_FMT_MTISP_YVYU10P,
+			.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 },
+			.hdiv = 2, .vdiv = 1, .bit_r_num = 5, .bit_r_den = 4 },
+		{ .format = V4L2_PIX_FMT_MTISP_UYVY10P,
+			.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 },
+			.hdiv = 2, .vdiv = 1, .bit_r_num = 5, .bit_r_den = 4 },
+		{ .format = V4L2_PIX_FMT_MTISP_VYUY10P,
+			.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 },
+			.hdiv = 2, .vdiv = 1, .bit_r_num = 5, .bit_r_den = 4 },
+		{ .format = V4L2_PIX_FMT_MTISP_NV12_10P,
+			.mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 },
+			.hdiv = 2, .vdiv = 2, .bit_r_num = 5, .bit_r_den = 4 },
+		{ .format = V4L2_PIX_FMT_MTISP_NV21_10P,
+			.mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 },
+			.hdiv = 2, .vdiv = 2, .bit_r_num = 5, .bit_r_den = 4 },
+		{ .format = V4L2_PIX_FMT_MTISP_NV16_10P,
+			.mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 },
+			.hdiv = 2, .vdiv = 1, .bit_r_num = 5, .bit_r_den = 4 },
+		{ .format = V4L2_PIX_FMT_MTISP_NV61_10P,
+			.mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 },
+			.hdiv = 2, .vdiv = 1, .bit_r_num = 5, .bit_r_den = 4 },
+		{ .format = V4L2_PIX_FMT_MTISP_YUYV12P,
+			.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 },
+			.hdiv = 2, .vdiv = 1, .bit_r_num = 3, .bit_r_den = 2 },
+		{ .format = V4L2_PIX_FMT_MTISP_YVYU12P,
+			.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 },
+			.hdiv = 2, .vdiv = 1, .bit_r_num = 3, .bit_r_den = 2 },
+		{ .format = V4L2_PIX_FMT_MTISP_UYVY12P,
+			.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 },
+			.hdiv = 2, .vdiv = 1, .bit_r_num = 3, .bit_r_den = 2 },
+		{ .format = V4L2_PIX_FMT_MTISP_VYUY12P,
+			.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 },
+			.hdiv = 2, .vdiv = 1, .bit_r_num = 3, .bit_r_den = 2 },
+		{ .format = V4L2_PIX_FMT_MTISP_NV12_12P,
+			.mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 },
+			.hdiv = 2, .vdiv = 2, .bit_r_num = 3, .bit_r_den = 2 },
+		{ .format = V4L2_PIX_FMT_MTISP_NV21_12P,
+			.mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 },
+			.hdiv = 2, .vdiv = 2, .bit_r_num = 3, .bit_r_den = 2 },
+		{ .format = V4L2_PIX_FMT_MTISP_NV16_12P,
+			.mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 },
+			.hdiv = 2, .vdiv = 1, .bit_r_num = 3, .bit_r_den = 2 },
+		{ .format = V4L2_PIX_FMT_MTISP_NV61_12P,
+			.mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 },
+			.hdiv = 2, .vdiv = 1, .bit_r_num = 3, .bit_r_den = 2 },
+		/* YUV UFBC formats */
+		{ .format = V4L2_PIX_FMT_MTISP_NV12_UFBC,
+			.mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 },
+			.hdiv = 2, .vdiv = 2, .bit_r_num = 2, .bit_r_den = 1 },
+		{ .format = V4L2_PIX_FMT_MTISP_NV21_UFBC,
+			.mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 },
+			.hdiv = 2, .vdiv = 2, .bit_r_num = 2, .bit_r_den = 1 },
+		{ .format = V4L2_PIX_FMT_MTISP_NV12_10_UFBC,
+			.mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 },
+			.hdiv = 2, .vdiv = 2, .bit_r_num = 5, .bit_r_den = 4 },
+		{ .format = V4L2_PIX_FMT_MTISP_NV21_10_UFBC,
+			.mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 },
+			.hdiv = 2, .vdiv = 2, .bit_r_num = 5, .bit_r_den = 4 },
+		{ .format = V4L2_PIX_FMT_MTISP_NV12_12_UFBC,
+			.mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 },
+			.hdiv = 2, .vdiv = 2, .bit_r_num = 3, .bit_r_den = 2 },
+		{ .format = V4L2_PIX_FMT_MTISP_NV21_12_UFBC,
+			.mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 },
+			.hdiv = 2, .vdiv = 2, .bit_r_num = 3, .bit_r_den = 2 },
+		{ .format = V4L2_PIX_FMT_MTISP_BAYER8_UFBC,
+			.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 },
+			.hdiv = 1, .vdiv = 1, .bit_r_num = 1, .bit_r_den = 1 },
+		{ .format = V4L2_PIX_FMT_MTISP_BAYER10_UFBC,
+			.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 },
+			.hdiv = 1, .vdiv = 1, .bit_r_num = 5, .bit_r_den = 4 },
+		{ .format = V4L2_PIX_FMT_MTISP_BAYER12_UFBC,
+			.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 },
+			.hdiv = 1, .vdiv = 1, .bit_r_num = 3, .bit_r_den = 2 },
+		{ .format = V4L2_PIX_FMT_MTISP_BAYER14_UFBC,
+			.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 },
+			.hdiv = 1, .vdiv = 1, .bit_r_num = 7, .bit_r_den = 4 },
+		/* Full-G RGB formats */
+		{ .format = V4L2_PIX_FMT_MTISP_SGRB8F,
+			.mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 },
+			.hdiv = 2, .vdiv = 2, .bit_r_num = 1, .bit_r_den = 1 },
+		{ .format = V4L2_PIX_FMT_MTISP_SGRB10F,
+			.mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 },
+			.hdiv = 2, .vdiv = 2, .bit_r_num = 5, .bit_r_den = 4 },
+		{ .format = V4L2_PIX_FMT_MTISP_SGRB12F,
+			.mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 },
+			.hdiv = 2, .vdiv = 2, .bit_r_num = 3, .bit_r_den = 2 },
+	};
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(formats); ++i)
+		if (formats[i].format == format)
+			return &formats[i];
+	return NULL;
+}
+
+static void mtk_cam_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct mtk_cam_device *cam = vb2_get_drv_priv(vb->vb2_queue);
+	struct mtk_cam_buffer *buf = mtk_cam_vb2_buf_to_dev_buf(vb);
+	struct mtk_cam_request *req = to_mtk_cam_req(vb->request);
+	struct mtk_cam_request_stream_data *req_stream_data;
+	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vb->vb2_queue);
+	struct mtk_raw_pde_config *pde_cfg;
+	struct device *dev = cam->dev;
+	struct mtkcam_ipi_frame_param *frame_param;
+	struct mtkcam_ipi_meta_input *meta_in;
+	struct mtkcam_ipi_meta_output *meta_out;
+	struct mtk_cam_ctx *ctx;
+	unsigned int pipe_id;
+	unsigned int desc_id;
+	unsigned int dma_port = node->desc.dma_port;
+
+	if (!vb->vb2_queue->uses_requests) {
+		spin_lock(&cam->dma_pending_lock);
+		list_add_tail(&buf->list, &cam->dma_pending);
+		spin_unlock(&cam->dma_pending_lock);
+		buf->state.estate = E_BUF_STATE_QUEUED;
+		if (media_entity_is_streaming(&node->vdev.entity)) {
+			ctx = mtk_cam_find_ctx(cam, &node->vdev.entity);
+			mtk_cam_buf_try_queue(ctx);
+		}
+		return;
+	}
+
+	dma_port = node->desc.dma_port;
+	pipe_id = node->uid.pipe_id;
+	req_stream_data = mtk_cam_req_get_s_data(req, pipe_id, 0);
+	frame_param = &req_stream_data->frame_params;
+	mtk_cam_s_data_set_vbuf(req_stream_data, buf, node->desc.id);
+
+	/* update buffer internal address */
+	switch (dma_port) {
+	case MTKCAM_ISP_META_STATS_CFG:
+		desc_id = node->desc.id - MTK_RAW_SINK_NUM;
+		meta_in = &frame_param->meta_inputs[desc_id];
+		meta_in->buf.size = node->active_fmt.fmt.meta.buffersize;
+		meta_in->buf.iova = buf->daddr;
+		meta_in->buf.scp_addr = buf->scp_addr;
+		meta_in->uid.id = dma_port;
+		break;
+	case MTKCAM_ISP_META_STATS_0:
+	case MTKCAM_ISP_META_STATS_1:
+	case MTKCAM_ISP_META_STATS_2:
+		pde_cfg = &cam->raw.pipelines[node->uid.pipe_id].pde_config;
+		desc_id = node->desc.id - MTK_RAW_META_OUT_BEGIN;
+		meta_out = &frame_param->meta_outputs[desc_id];
+		meta_out->buf.size = node->active_fmt.fmt.meta.buffersize;
+		meta_out->buf.iova = buf->daddr;
+		meta_out->buf.scp_addr = buf->scp_addr;
+		meta_out->uid.id = dma_port;
+		camsys_set_meta_stats_info(dma_port, vb, pde_cfg);
+		break;
+	default:
+		dev_dbg(dev, "%s:pipe(%d):buffer with invalid port(%d)\n",
+			__func__, pipe_id, dma_port);
+		break;
+	}
+}
+
+static void mtk_cam_vb2_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vb->vb2_queue);
+	struct mtk_cam_buffer *buf;
+	struct mtk_cam_device *cam = vb2_get_drv_priv(vb->vb2_queue);
+	struct device *dev = cam->raw.devs[0];
+
+	/* SCP address is only valid for meta input buffer */
+	if (!node->desc.smem_alloc)
+		return;
+
+	buf = mtk_cam_vb2_buf_to_dev_buf(vb);
+	dma_unmap_page_attrs(dev, buf->daddr, vb->planes[0].length,
+			     DMA_BIDIRECTIONAL, DMA_ATTR_SKIP_CPU_SYNC);
+}
+
+static void mtk_cam_vb2_request_complete(struct vb2_buffer *vb)
+{
+	struct mtk_cam_device *cam = vb2_get_drv_priv(vb->vb2_queue);
+
+	dev_dbg(vb->vb2_queue->dev, "camsys | request %s\n", __func__);
+
+	v4l2_ctrl_request_complete(vb->req_obj.req, cam->v4l2_dev.ctrl_handler);
+}
+
+static int mtk_cam_vb2_buf_out_validate(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
+
+	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		if (v4l2_buf->field == V4L2_FIELD_ANY)
+			v4l2_buf->field = V4L2_FIELD_NONE;
+
+		if (v4l2_buf->field != V4L2_FIELD_NONE)
+			return -EINVAL;
+	}
+	return 0;
+}
+
+static const struct vb2_ops mtk_cam_vb2_ops = {
+	.queue_setup = mtk_cam_vb2_queue_setup,
+
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+
+	.buf_out_validate = mtk_cam_vb2_buf_out_validate,
+	.buf_init = mtk_cam_vb2_buf_init,
+	.buf_prepare = mtk_cam_vb2_buf_prepare,
+
+	.start_streaming = mtk_cam_vb2_start_streaming,
+	.stop_streaming = mtk_cam_vb2_stop_streaming,
+
+	.buf_queue = mtk_cam_vb2_buf_queue,
+	.buf_cleanup = mtk_cam_vb2_buf_cleanup,
+	.buf_request_complete = mtk_cam_vb2_request_complete,
+};
+
+static const struct v4l2_file_operations mtk_cam_v4l2_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = video_ioctl2,
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.poll = vb2_fop_poll,
+	.mmap = vb2_fop_mmap,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl32 = v4l2_compat_ioctl32,
+#endif
+};
+
+unsigned int mtk_cam_get_sensor_pixel_id(unsigned int fmt)
+{
+	switch (fmt & SENSOR_FMT_MASK) {
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SBGGR14_1X14:
+		return MTKCAM_IPI_BAYER_PXL_ID_B;
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGBRG14_1X14:
+		return MTKCAM_IPI_BAYER_PXL_ID_GB;
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG14_1X14:
+		return MTKCAM_IPI_BAYER_PXL_ID_GR;
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+	case MEDIA_BUS_FMT_SRGGB14_1X14:
+		return MTKCAM_IPI_BAYER_PXL_ID_R;
+	default:
+		return MTKCAM_IPI_BAYER_PXL_ID_UNKNOWN;
+	}
+}
+
+unsigned int mtk_cam_get_sensor_fmt(unsigned int fmt)
+{
+	switch (fmt & SENSOR_FMT_MASK) {
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		return MTKCAM_IPI_IMG_FMT_BAYER8;
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		return MTKCAM_IPI_IMG_FMT_BAYER10;
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		return MTKCAM_IPI_IMG_FMT_BAYER12;
+	case MEDIA_BUS_FMT_SBGGR14_1X14:
+	case MEDIA_BUS_FMT_SGBRG14_1X14:
+	case MEDIA_BUS_FMT_SGRBG14_1X14:
+	case MEDIA_BUS_FMT_SRGGB14_1X14:
+		return MTKCAM_IPI_IMG_FMT_BAYER14;
+	default:
+		return MTKCAM_IPI_IMG_FMT_UNKNOWN;
+	}
+}
+
+unsigned int mtk_cam_get_pixel_bits(unsigned int ipi_fmt)
+{
+	switch (ipi_fmt) {
+	case MTKCAM_IPI_IMG_FMT_BAYER8:
+	case MTKCAM_IPI_IMG_FMT_FG_BAYER8:
+		return 8;
+	case MTKCAM_IPI_IMG_FMT_BAYER10:
+	case MTKCAM_IPI_IMG_FMT_FG_BAYER10:
+	case MTKCAM_IPI_IMG_FMT_BAYER10_MIPI:
+		return 10;
+	case MTKCAM_IPI_IMG_FMT_BAYER12:
+	case MTKCAM_IPI_IMG_FMT_FG_BAYER12:
+		return 12;
+	case MTKCAM_IPI_IMG_FMT_BAYER14:
+	case MTKCAM_IPI_IMG_FMT_UFBC_BAYER14:
+		return 14;
+	case MTKCAM_IPI_IMG_FMT_BAYER10_UNPACKED:
+	case MTKCAM_IPI_IMG_FMT_BAYER12_UNPACKED:
+	case MTKCAM_IPI_IMG_FMT_BAYER14_UNPACKED:
+	case MTKCAM_IPI_IMG_FMT_BAYER16:
+	case MTKCAM_IPI_IMG_FMT_YUYV:
+	case MTKCAM_IPI_IMG_FMT_YVYU:
+	case MTKCAM_IPI_IMG_FMT_UYVY:
+	case MTKCAM_IPI_IMG_FMT_VYUY:
+		return 16;
+	case MTKCAM_IPI_IMG_FMT_Y8:
+	case MTKCAM_IPI_IMG_FMT_YUV_422_2P:
+	case MTKCAM_IPI_IMG_FMT_YVU_422_2P:
+	case MTKCAM_IPI_IMG_FMT_YUV_422_3P:
+	case MTKCAM_IPI_IMG_FMT_YVU_422_3P:
+	case MTKCAM_IPI_IMG_FMT_YUV_420_2P:
+	case MTKCAM_IPI_IMG_FMT_YVU_420_2P:
+	case MTKCAM_IPI_IMG_FMT_YUV_420_3P:
+	case MTKCAM_IPI_IMG_FMT_YVU_420_3P:
+		return 8;
+	case MTKCAM_IPI_IMG_FMT_YUYV_Y210:
+	case MTKCAM_IPI_IMG_FMT_YVYU_Y210:
+	case MTKCAM_IPI_IMG_FMT_UYVY_Y210:
+	case MTKCAM_IPI_IMG_FMT_VYUY_Y210:
+		return 32;
+	case MTKCAM_IPI_IMG_FMT_YUV_P210:
+	case MTKCAM_IPI_IMG_FMT_YVU_P210:
+	case MTKCAM_IPI_IMG_FMT_YUV_P010:
+	case MTKCAM_IPI_IMG_FMT_YVU_P010:
+	case MTKCAM_IPI_IMG_FMT_YUV_P212:
+	case MTKCAM_IPI_IMG_FMT_YVU_P212:
+	case MTKCAM_IPI_IMG_FMT_YUV_P012:
+	case MTKCAM_IPI_IMG_FMT_YVU_P012:
+		return 16;
+	case MTKCAM_IPI_IMG_FMT_YUYV_Y210_PACKED:
+	case MTKCAM_IPI_IMG_FMT_YVYU_Y210_PACKED:
+	case MTKCAM_IPI_IMG_FMT_UYVY_Y210_PACKED:
+	case MTKCAM_IPI_IMG_FMT_VYUY_Y210_PACKED:
+		return 20;
+	case MTKCAM_IPI_IMG_FMT_YUV_P210_PACKED:
+	case MTKCAM_IPI_IMG_FMT_YVU_P210_PACKED:
+	case MTKCAM_IPI_IMG_FMT_YUV_P010_PACKED:
+	case MTKCAM_IPI_IMG_FMT_YVU_P010_PACKED:
+		return 10;
+	case MTKCAM_IPI_IMG_FMT_YUV_P212_PACKED:
+	case MTKCAM_IPI_IMG_FMT_YVU_P212_PACKED:
+	case MTKCAM_IPI_IMG_FMT_YUV_P012_PACKED:
+	case MTKCAM_IPI_IMG_FMT_YVU_P012_PACKED:
+		return 12;
+	case MTKCAM_IPI_IMG_FMT_RGB_8B_3P:
+	case MTKCAM_IPI_IMG_FMT_FG_BAYER8_3P:
+	case MTKCAM_IPI_IMG_FMT_UFBC_NV12:
+	case MTKCAM_IPI_IMG_FMT_UFBC_NV21:
+	case MTKCAM_IPI_IMG_FMT_UFBC_BAYER8:
+		return 8;
+	case MTKCAM_IPI_IMG_FMT_RGB_10B_3P_PACKED:
+	case MTKCAM_IPI_IMG_FMT_FG_BAYER10_3P_PACKED:
+	case MTKCAM_IPI_IMG_FMT_UFBC_YUV_P010:
+	case MTKCAM_IPI_IMG_FMT_UFBC_YVU_P010:
+	case MTKCAM_IPI_IMG_FMT_UFBC_BAYER10:
+		return 10;
+	case MTKCAM_IPI_IMG_FMT_RGB_12B_3P_PACKED:
+	case MTKCAM_IPI_IMG_FMT_FG_BAYER12_3P_PACKED:
+	case MTKCAM_IPI_IMG_FMT_UFBC_YUV_P012:
+	case MTKCAM_IPI_IMG_FMT_UFBC_YVU_P012:
+	case MTKCAM_IPI_IMG_FMT_UFBC_BAYER12:
+		return 12;
+	case MTKCAM_IPI_IMG_FMT_RGB_10B_3P:
+	case MTKCAM_IPI_IMG_FMT_FG_BAYER10_3P:
+	case MTKCAM_IPI_IMG_FMT_RGB_12B_3P:
+	case MTKCAM_IPI_IMG_FMT_FG_BAYER12_3P:
+		return 16;
+
+	default:
+		break;
+	}
+	pr_debug("not supported ipi-fmt 0x%08x", ipi_fmt);
+
+	return -1;
+}
+
+unsigned int mtk_cam_get_img_fmt(unsigned int fourcc)
+{
+	switch (fourcc) {
+	case V4L2_PIX_FMT_GREY:
+		return MTKCAM_IPI_IMG_FMT_Y8;
+	case V4L2_PIX_FMT_YUYV:
+		return MTKCAM_IPI_IMG_FMT_YUYV;
+	case V4L2_PIX_FMT_YVYU:
+		return MTKCAM_IPI_IMG_FMT_YVYU;
+	case V4L2_PIX_FMT_NV16:
+		return MTKCAM_IPI_IMG_FMT_YUV_422_2P;
+	case V4L2_PIX_FMT_NV61:
+		return MTKCAM_IPI_IMG_FMT_YVU_422_2P;
+	case V4L2_PIX_FMT_NV12:
+		return MTKCAM_IPI_IMG_FMT_YUV_420_2P;
+	case V4L2_PIX_FMT_NV21:
+		return MTKCAM_IPI_IMG_FMT_YVU_420_2P;
+	case V4L2_PIX_FMT_YUV422P:
+		return MTKCAM_IPI_IMG_FMT_YUV_422_3P;
+	case V4L2_PIX_FMT_YUV420:
+		return MTKCAM_IPI_IMG_FMT_YUV_420_3P;
+	case V4L2_PIX_FMT_YVU420:
+		return MTKCAM_IPI_IMG_FMT_YVU_420_3P;
+	case V4L2_PIX_FMT_NV12_10:
+		return MTKCAM_IPI_IMG_FMT_YUV_P010;
+	case V4L2_PIX_FMT_NV21_10:
+		return MTKCAM_IPI_IMG_FMT_YVU_P010;
+	case V4L2_PIX_FMT_NV16_10:
+		return MTKCAM_IPI_IMG_FMT_YUV_P210;
+	case V4L2_PIX_FMT_NV61_10:
+		return MTKCAM_IPI_IMG_FMT_YVU_P210;
+	case V4L2_PIX_FMT_MTISP_NV12_10P:
+		return MTKCAM_IPI_IMG_FMT_YUV_P010_PACKED;
+	case V4L2_PIX_FMT_MTISP_NV21_10P:
+		return MTKCAM_IPI_IMG_FMT_YVU_P010_PACKED;
+	case V4L2_PIX_FMT_MTISP_NV16_10P:
+		return MTKCAM_IPI_IMG_FMT_YUV_P210_PACKED;
+	case V4L2_PIX_FMT_MTISP_NV61_10P:
+		return MTKCAM_IPI_IMG_FMT_YVU_P210_PACKED;
+	case V4L2_PIX_FMT_YUYV10:
+		return MTKCAM_IPI_IMG_FMT_YUYV_Y210;
+	case V4L2_PIX_FMT_YVYU10:
+		return MTKCAM_IPI_IMG_FMT_YVYU_Y210;
+	case V4L2_PIX_FMT_UYVY10:
+		return MTKCAM_IPI_IMG_FMT_UYVY_Y210;
+	case V4L2_PIX_FMT_VYUY10:
+		return MTKCAM_IPI_IMG_FMT_VYUY_Y210;
+	case V4L2_PIX_FMT_MTISP_YUYV10P:
+		return MTKCAM_IPI_IMG_FMT_YUYV_Y210_PACKED;
+	case V4L2_PIX_FMT_MTISP_YVYU10P:
+		return MTKCAM_IPI_IMG_FMT_YVYU_Y210_PACKED;
+	case V4L2_PIX_FMT_MTISP_UYVY10P:
+		return MTKCAM_IPI_IMG_FMT_UYVY_Y210_PACKED;
+	case V4L2_PIX_FMT_MTISP_VYUY10P:
+		return MTKCAM_IPI_IMG_FMT_VYUY_Y210_PACKED;
+	case V4L2_PIX_FMT_NV12_12:
+		return MTKCAM_IPI_IMG_FMT_YUV_P012;
+	case V4L2_PIX_FMT_NV21_12:
+		return MTKCAM_IPI_IMG_FMT_YVU_P012;
+	case V4L2_PIX_FMT_NV16_12:
+		return MTKCAM_IPI_IMG_FMT_YUV_P212;
+	case V4L2_PIX_FMT_NV61_12:
+		return MTKCAM_IPI_IMG_FMT_YVU_P212;
+	case V4L2_PIX_FMT_MTISP_NV12_12P:
+		return MTKCAM_IPI_IMG_FMT_YUV_P012_PACKED;
+	case V4L2_PIX_FMT_MTISP_NV21_12P:
+		return MTKCAM_IPI_IMG_FMT_YVU_P012_PACKED;
+	case V4L2_PIX_FMT_MTISP_NV16_12P:
+		return MTKCAM_IPI_IMG_FMT_YUV_P212_PACKED;
+	case V4L2_PIX_FMT_MTISP_NV61_12P:
+		return MTKCAM_IPI_IMG_FMT_YVU_P212_PACKED;
+	case V4L2_PIX_FMT_SBGGR8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SGRBG8:
+	case V4L2_PIX_FMT_SRGGB8:
+		return MTKCAM_IPI_IMG_FMT_BAYER8;
+	case V4L2_PIX_FMT_MTISP_SBGGR8F:
+	case V4L2_PIX_FMT_MTISP_SGBRG8F:
+	case V4L2_PIX_FMT_MTISP_SGRBG8F:
+	case V4L2_PIX_FMT_MTISP_SRGGB8F:
+		return MTKCAM_IPI_IMG_FMT_FG_BAYER8;
+	case V4L2_PIX_FMT_SBGGR10:
+	case V4L2_PIX_FMT_SGBRG10:
+	case V4L2_PIX_FMT_SGRBG10:
+	case V4L2_PIX_FMT_SRGGB10:
+		return MTKCAM_IPI_IMG_FMT_BAYER10_UNPACKED;
+	case V4L2_PIX_FMT_SBGGR10P:
+	case V4L2_PIX_FMT_SGBRG10P:
+	case V4L2_PIX_FMT_SGRBG10P:
+	case V4L2_PIX_FMT_SRGGB10P:
+		return MTKCAM_IPI_IMG_FMT_BAYER10_MIPI;
+	case V4L2_PIX_FMT_MTISP_SBGGR10:
+	case V4L2_PIX_FMT_MTISP_SGBRG10:
+	case V4L2_PIX_FMT_MTISP_SGRBG10:
+	case V4L2_PIX_FMT_MTISP_SRGGB10:
+		return MTKCAM_IPI_IMG_FMT_BAYER10;
+	case V4L2_PIX_FMT_MTISP_SBGGR10F:
+	case V4L2_PIX_FMT_MTISP_SGBRG10F:
+	case V4L2_PIX_FMT_MTISP_SGRBG10F:
+	case V4L2_PIX_FMT_MTISP_SRGGB10F:
+		return MTKCAM_IPI_IMG_FMT_FG_BAYER10;
+	case V4L2_PIX_FMT_SBGGR12:
+	case V4L2_PIX_FMT_SGBRG12:
+	case V4L2_PIX_FMT_SGRBG12:
+	case V4L2_PIX_FMT_SRGGB12:
+		return MTKCAM_IPI_IMG_FMT_BAYER12_UNPACKED;
+	case V4L2_PIX_FMT_MTISP_SBGGR12:
+	case V4L2_PIX_FMT_MTISP_SGBRG12:
+	case V4L2_PIX_FMT_MTISP_SGRBG12:
+	case V4L2_PIX_FMT_MTISP_SRGGB12:
+		return MTKCAM_IPI_IMG_FMT_BAYER12;
+	case V4L2_PIX_FMT_MTISP_SBGGR12F:
+	case V4L2_PIX_FMT_MTISP_SGBRG12F:
+	case V4L2_PIX_FMT_MTISP_SGRBG12F:
+	case V4L2_PIX_FMT_MTISP_SRGGB12F:
+		return MTKCAM_IPI_IMG_FMT_FG_BAYER12;
+	case V4L2_PIX_FMT_SBGGR14:
+	case V4L2_PIX_FMT_SGBRG14:
+	case V4L2_PIX_FMT_SGRBG14:
+	case V4L2_PIX_FMT_SRGGB14:
+		return MTKCAM_IPI_IMG_FMT_BAYER14_UNPACKED;
+	case V4L2_PIX_FMT_MTISP_SBGGR14:
+	case V4L2_PIX_FMT_MTISP_SGBRG14:
+	case V4L2_PIX_FMT_MTISP_SGRBG14:
+	case V4L2_PIX_FMT_MTISP_SRGGB14:
+		return MTKCAM_IPI_IMG_FMT_BAYER14;
+	case V4L2_PIX_FMT_MTISP_SBGGR14F:
+	case V4L2_PIX_FMT_MTISP_SGBRG14F:
+	case V4L2_PIX_FMT_MTISP_SGRBG14F:
+	case V4L2_PIX_FMT_MTISP_SRGGB14F:
+		return MTKCAM_IPI_IMG_FMT_FG_BAYER14;
+	case V4L2_PIX_FMT_SBGGR16:
+	case V4L2_PIX_FMT_SGBRG16:
+	case V4L2_PIX_FMT_SGRBG16:
+	case V4L2_PIX_FMT_SRGGB16:
+		return MTKCAM_IPI_IMG_FMT_BAYER16;
+	case V4L2_PIX_FMT_MTISP_NV12_UFBC:
+		return MTKCAM_IPI_IMG_FMT_UFBC_NV12;
+	case V4L2_PIX_FMT_MTISP_NV21_UFBC:
+		return MTKCAM_IPI_IMG_FMT_UFBC_NV21;
+	case V4L2_PIX_FMT_MTISP_NV12_10_UFBC:
+		return MTKCAM_IPI_IMG_FMT_UFBC_YUV_P010;
+	case V4L2_PIX_FMT_MTISP_NV21_10_UFBC:
+		return MTKCAM_IPI_IMG_FMT_UFBC_YVU_P010;
+	case V4L2_PIX_FMT_MTISP_NV12_12_UFBC:
+		return MTKCAM_IPI_IMG_FMT_UFBC_YUV_P012;
+	case V4L2_PIX_FMT_MTISP_NV21_12_UFBC:
+		return MTKCAM_IPI_IMG_FMT_UFBC_YVU_P012;
+	case V4L2_PIX_FMT_MTISP_BAYER8_UFBC:
+		return MTKCAM_IPI_IMG_FMT_UFBC_BAYER8;
+	case V4L2_PIX_FMT_MTISP_BAYER10_UFBC:
+		return MTKCAM_IPI_IMG_FMT_UFBC_BAYER10;
+	case V4L2_PIX_FMT_MTISP_BAYER12_UFBC:
+		return MTKCAM_IPI_IMG_FMT_UFBC_BAYER12;
+	case V4L2_PIX_FMT_MTISP_BAYER14_UFBC:
+		return MTKCAM_IPI_IMG_FMT_UFBC_BAYER14;
+	case V4L2_PIX_FMT_MTISP_SGRB8F:
+		return MTKCAM_IPI_IMG_FMT_FG_BAYER8_3P;
+	case V4L2_PIX_FMT_MTISP_SGRB10F:
+		return MTKCAM_IPI_IMG_FMT_FG_BAYER10_3P_PACKED;
+	case V4L2_PIX_FMT_MTISP_SGRB12F:
+		return MTKCAM_IPI_IMG_FMT_FG_BAYER12_3P_PACKED;
+	default:
+		return MTKCAM_IPI_IMG_FMT_UNKNOWN;
+	}
+}
+
+static void mtk_cam_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
+				   u32 pixelformat, u32 width, u32 height)
+{
+	struct v4l2_plane_pix_format *plane;
+	unsigned int ipi_fmt = mtk_cam_get_img_fmt(pixelformat);
+	u8 pixel_bits = mtk_cam_get_pixel_bits(ipi_fmt);
+	u32 stride;
+	u32 aligned_width;
+	u8 bus_size;
+	u8 i;
+
+	pixfmt->width = width;
+	pixfmt->height = height;
+	pixfmt->pixelformat = pixelformat;
+	plane = &pixfmt->plane_fmt[0];
+	bus_size = mtk_cam_yuv_dma_bus_size(pixel_bits, 0);
+	plane->sizeimage = 0;
+
+	if (is_mtk_format(pixelformat)) {
+		const struct mtk_format_info *info;
+
+		info = mtk_format_info(pixelformat);
+		if (!info)
+			return;
+
+		pixfmt->num_planes = info->mem_planes;
+		if (info->mem_planes == 1) {
+			if (is_yuv_ufo(pixelformat)) {
+				/* UFO format width should align 64 pixel */
+				aligned_width = ALIGN(width, 64);
+				stride = aligned_width * info->bit_r_num / info->bit_r_den;
+
+				if (stride > plane->bytesperline)
+					plane->bytesperline = stride;
+				plane->sizeimage = stride * height;
+				plane->sizeimage += stride * height / 2;
+				plane->sizeimage += ALIGN((aligned_width / 64), 8) * height;
+				plane->sizeimage += ALIGN((aligned_width / 64), 8) * height / 2;
+			} else if (is_raw_ufo(pixelformat)) {
+				/* UFO format width should align 64 pixel */
+				aligned_width = ALIGN(width, 64);
+				stride = aligned_width * info->bit_r_num / info->bit_r_den;
+
+				if (stride > plane->bytesperline)
+					plane->bytesperline = stride;
+				plane->sizeimage = stride * height;
+				plane->sizeimage += ALIGN((aligned_width / 64), 8) * height;
+			} else {
+				/* width should be bus_size align */
+				aligned_width = ALIGN(DIV_ROUND_UP(width
+					* info->bit_r_num, info->bit_r_den), bus_size);
+				stride = aligned_width * info->bpp[0];
+
+				if (stride > plane->bytesperline)
+					plane->bytesperline = stride;
+
+				for (i = 0; i < info->comp_planes; i++) {
+					unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
+					unsigned int vdiv = (i == 0) ? 1 : info->vdiv;
+
+					if (plane->bytesperline > stride &&
+					    is_fullg_rb(pixelformat)) {
+						plane->sizeimage +=
+							DIV_ROUND_UP(plane->bytesperline, hdiv)
+							* DIV_ROUND_UP(height, vdiv);
+					} else if (plane->bytesperline > stride &&
+						   !is_fullg_rb(pixelformat)) {
+						plane->sizeimage +=
+							plane->bytesperline
+							* DIV_ROUND_UP(height, vdiv);
+					} else {
+						plane->sizeimage += info->bpp[i]
+							* DIV_ROUND_UP(aligned_width, hdiv)
+							* DIV_ROUND_UP(height, vdiv);
+					}
+				}
+			}
+			pr_debug("%s stride %d sizeimage %d\n", __func__,
+				 plane->bytesperline, plane->sizeimage);
+		} else {
+			pr_debug("do not support non contiguous mplane\n");
+		}
+	} else {
+		const struct v4l2_format_info *info;
+
+		pr_debug("pixelformat:0x%x sizeimage:%d\n",
+			 pixelformat, plane->sizeimage);
+		info = v4l2_format_info(pixelformat);
+		if (!info)
+			return;
+
+		pixfmt->num_planes = info->mem_planes;
+		if (info->mem_planes == 1) {
+			aligned_width = ALIGN(width, bus_size);
+			stride = aligned_width * info->bpp[0];
+			if (stride > plane->bytesperline)
+				plane->bytesperline = stride;
+
+			for (i = 0; i < info->comp_planes; i++) {
+				unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
+				unsigned int vdiv = (i == 0) ? 1 : info->vdiv;
+
+				plane->sizeimage += info->bpp[i]
+					* DIV_ROUND_UP(aligned_width, hdiv)
+					* DIV_ROUND_UP(height, vdiv);
+			}
+			pr_debug("%s stride %d sizeimage %d\n", __func__,
+				 plane->bytesperline, plane->sizeimage);
+		} else {
+			pr_warn("do not support non contiguous mplane\n");
+		}
+	}
+}
+
+static void cal_image_pix_mp(unsigned int node_id,
+			     struct v4l2_pix_format_mplane *mp,
+			     unsigned int pixel_mode)
+{
+	unsigned int ipi_fmt = mtk_cam_get_img_fmt(mp->pixelformat);
+	unsigned int width = mp->width;
+	unsigned int height = mp->height;
+	unsigned int stride, i;
+
+	pr_debug("fmt:0x%x ipi_fmt:%d\n", mp->pixelformat, ipi_fmt);
+	switch (ipi_fmt) {
+	case MTKCAM_IPI_IMG_FMT_BAYER8:
+	case MTKCAM_IPI_IMG_FMT_BAYER10:
+	case MTKCAM_IPI_IMG_FMT_BAYER12:
+	case MTKCAM_IPI_IMG_FMT_BAYER14:
+	case MTKCAM_IPI_IMG_FMT_BAYER16:
+	case MTKCAM_IPI_IMG_FMT_BAYER10_MIPI:
+	case MTKCAM_IPI_IMG_FMT_BAYER10_UNPACKED:
+	case MTKCAM_IPI_IMG_FMT_BAYER12_UNPACKED:
+	case MTKCAM_IPI_IMG_FMT_BAYER14_UNPACKED:
+	case MTKCAM_IPI_IMG_FMT_FG_BAYER8:
+	case MTKCAM_IPI_IMG_FMT_FG_BAYER10:
+	case MTKCAM_IPI_IMG_FMT_FG_BAYER12:
+	case MTKCAM_IPI_IMG_FMT_FG_BAYER14:
+		stride = mtk_cam_dmao_xsize(width, ipi_fmt, pixel_mode);
+		for (i = 0; i < mp->num_planes; i++) {
+			if (stride > mp->plane_fmt[i].bytesperline)
+				mp->plane_fmt[i].bytesperline = stride;
+			mp->plane_fmt[i].sizeimage =
+				mp->plane_fmt[i].bytesperline * height;
+		}
+	break;
+	case MTKCAM_IPI_IMG_FMT_YUYV:
+	case MTKCAM_IPI_IMG_FMT_YVYU:
+	case MTKCAM_IPI_IMG_FMT_UYVY:
+	case MTKCAM_IPI_IMG_FMT_VYUY:
+	case MTKCAM_IPI_IMG_FMT_YUV_422_2P:
+	case MTKCAM_IPI_IMG_FMT_YVU_422_2P:
+	case MTKCAM_IPI_IMG_FMT_YUV_422_3P:
+	case MTKCAM_IPI_IMG_FMT_YVU_422_3P:
+	case MTKCAM_IPI_IMG_FMT_YUV_420_2P:
+	case MTKCAM_IPI_IMG_FMT_YVU_420_2P:
+	case MTKCAM_IPI_IMG_FMT_YUV_420_3P:
+	case MTKCAM_IPI_IMG_FMT_YVU_420_3P:
+	case MTKCAM_IPI_IMG_FMT_Y8:
+	case MTKCAM_IPI_IMG_FMT_YUYV_Y210:
+	case MTKCAM_IPI_IMG_FMT_YVYU_Y210:
+	case MTKCAM_IPI_IMG_FMT_UYVY_Y210:
+	case MTKCAM_IPI_IMG_FMT_VYUY_Y210:
+	case MTKCAM_IPI_IMG_FMT_YUYV_Y210_PACKED:
+	case MTKCAM_IPI_IMG_FMT_YVYU_Y210_PACKED:
+	case MTKCAM_IPI_IMG_FMT_UYVY_Y210_PACKED:
+	case MTKCAM_IPI_IMG_FMT_VYUY_Y210_PACKED:
+	case MTKCAM_IPI_IMG_FMT_YUV_P210:
+	case MTKCAM_IPI_IMG_FMT_YVU_P210:
+	case MTKCAM_IPI_IMG_FMT_YUV_P010:
+	case MTKCAM_IPI_IMG_FMT_YVU_P010:
+	case MTKCAM_IPI_IMG_FMT_YUV_P210_PACKED:
+	case MTKCAM_IPI_IMG_FMT_YVU_P210_PACKED:
+	case MTKCAM_IPI_IMG_FMT_YUV_P010_PACKED:
+	case MTKCAM_IPI_IMG_FMT_YVU_P010_PACKED:
+	case MTKCAM_IPI_IMG_FMT_YUV_P212:
+	case MTKCAM_IPI_IMG_FMT_YVU_P212:
+	case MTKCAM_IPI_IMG_FMT_YUV_P012:
+	case MTKCAM_IPI_IMG_FMT_YVU_P012:
+	case MTKCAM_IPI_IMG_FMT_YUV_P212_PACKED:
+	case MTKCAM_IPI_IMG_FMT_YVU_P212_PACKED:
+	case MTKCAM_IPI_IMG_FMT_YUV_P012_PACKED:
+	case MTKCAM_IPI_IMG_FMT_YVU_P012_PACKED:
+	case MTKCAM_IPI_IMG_FMT_UFBC_NV12:
+	case MTKCAM_IPI_IMG_FMT_UFBC_NV21:
+	case MTKCAM_IPI_IMG_FMT_UFBC_YUV_P010:
+	case MTKCAM_IPI_IMG_FMT_UFBC_YVU_P010:
+	case MTKCAM_IPI_IMG_FMT_UFBC_YUV_P012:
+	case MTKCAM_IPI_IMG_FMT_UFBC_YVU_P012:
+	case MTKCAM_IPI_IMG_FMT_UFBC_BAYER8:
+	case MTKCAM_IPI_IMG_FMT_UFBC_BAYER10:
+	case MTKCAM_IPI_IMG_FMT_UFBC_BAYER12:
+	case MTKCAM_IPI_IMG_FMT_UFBC_BAYER14:
+	case MTKCAM_IPI_IMG_FMT_FG_BAYER8_3P:
+	case MTKCAM_IPI_IMG_FMT_FG_BAYER10_3P_PACKED:
+	case MTKCAM_IPI_IMG_FMT_FG_BAYER12_3P_PACKED:
+		mtk_cam_fill_pixfmt_mp(mp, mp->pixelformat, width, height);
+	break;
+	default:
+		break;
+	}
+}
+
+static int mtk_video_init_format(struct mtk_cam_video_device *video)
+{
+	struct mtk_cam_dev_node_desc *desc = &video->desc;
+	struct v4l2_format *active = &video->active_fmt;
+	const struct v4l2_format *default_fmt =
+		&desc->fmts[desc->default_fmt_idx].vfmt;
+
+	active->type = desc->buf_type;
+
+	if (!desc->image) {
+		active->fmt.meta.dataformat = default_fmt->fmt.meta.dataformat;
+		active->fmt.meta.buffersize = default_fmt->fmt.meta.buffersize;
+		return 0;
+	}
+
+	active->fmt.pix_mp.pixelformat = default_fmt->fmt.pix_mp.pixelformat;
+	active->fmt.pix_mp.width = default_fmt->fmt.pix_mp.width;
+	active->fmt.pix_mp.height = default_fmt->fmt.pix_mp.height;
+	active->fmt.pix_mp.num_planes = default_fmt->fmt.pix_mp.num_planes;
+
+	cal_image_pix_mp(desc->id, &active->fmt.pix_mp, 0);
+
+	/* set init one-plane */
+	active->fmt.pix_mp.num_planes = 1;
+	active->fmt.pix_mp.colorspace = V4L2_COLORSPACE_SRGB;
+	active->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	active->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	active->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
+	active->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_SRGB;
+
+	return 0;
+}
+
+int mtk_cam_video_register(struct mtk_cam_video_device *video,
+			   struct v4l2_device *v4l2_dev)
+{
+	struct mtk_cam_device *cam =
+		container_of(v4l2_dev, struct mtk_cam_device, v4l2_dev);
+	struct media_pad *pad = &video->pad;
+	struct video_device *vdev = &video->vdev;
+	struct vb2_queue *q = &video->vb2_q;
+	unsigned int output = V4L2_TYPE_IS_OUTPUT(video->desc.buf_type);
+	int ret;
+
+	if (video->desc.link_flags & MEDIA_LNK_FL_ENABLED)
+		video->enabled = true;
+	else
+		video->enabled = false;
+
+	mutex_init(&video->q_lock);
+
+	/* initialize vb2_queue */
+	q->type = video->desc.buf_type;
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
+
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+
+	if (video->desc.smem_alloc) {
+		q->bidirectional = 1;
+		/* reserved memory */
+		q->dev = cam->smem_dev;
+	} else if (is_yuv_node(video->desc.id)) {
+		q->dev = cam->raw.yuvs[0];
+	} else {
+		q->dev = cam->raw.devs[0];
+	}
+
+	q->supports_requests = true;
+	q->lock = &video->q_lock;
+	q->ops = &mtk_cam_vb2_ops;
+	q->mem_ops = &vb2_dma_contig_memops;
+	q->drv_priv = cam;
+	q->buf_struct_size = sizeof(struct mtk_cam_buffer);
+
+	if (output)
+		q->timestamp_flags |= V4L2_BUF_FLAG_TSTAMP_SRC_EOF;
+	else
+		q->timestamp_flags |= V4L2_BUF_FLAG_TSTAMP_SRC_SOE;
+
+	/* No minimum buffers limitation */
+	q->min_queued_buffers = 0;
+
+	ret = vb2_queue_init(q);
+	if (ret < 0) {
+		dev_info(v4l2_dev->dev, "Failed to init vb2 queue: %d\n", ret);
+		goto error_vb2_init;
+	}
+
+	pad->flags = output ? MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&vdev->entity, 1, pad);
+	if (ret < 0) {
+		dev_info(v4l2_dev->dev, "Failed to init video entity: %d\n", ret);
+		goto error_media_init;
+	}
+
+	ret = mtk_video_init_format(video);
+	if (ret < 0) {
+		dev_info(v4l2_dev->dev, "Failed to init format: %d\n", ret);
+		goto error_video_register;
+	}
+
+	vdev->entity.function = MEDIA_ENT_F_IO_V4L;
+	vdev->entity.ops = NULL;
+	vdev->fops = &mtk_cam_v4l2_fops;
+	vdev->device_caps = video->desc.cap | V4L2_CAP_STREAMING;
+	vdev->v4l2_dev = v4l2_dev;
+
+	vdev->vfl_dir = output ? VFL_DIR_TX : VFL_DIR_RX;
+	vdev->queue = &video->vb2_q;
+	vdev->ioctl_ops = video->desc.ioctl_ops;
+	vdev->release = video_device_release_empty;
+	/* share q_lock */
+	vdev->lock = &video->q_lock;
+	strscpy(vdev->name, video->desc.name, sizeof(vdev->name));
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret < 0) {
+		dev_info(v4l2_dev->dev, "Failed to register video device: %d\n",
+			 ret);
+		goto error_video_register;
+	}
+	video_set_drvdata(vdev, cam);
+
+	dev_dbg(v4l2_dev->dev, "registered vdev:%d:%s\n",
+		video->desc.id, vdev->name);
+
+	return 0;
+
+error_video_register:
+	media_entity_cleanup(&vdev->entity);
+error_media_init:
+	vb2_queue_release(&video->vb2_q);
+error_vb2_init:
+	mutex_destroy(&video->q_lock);
+
+	return ret;
+}
+
+void mtk_cam_video_unregister(struct mtk_cam_video_device *video)
+{
+	video_unregister_device(&video->vdev);
+	vb2_queue_release(&video->vb2_q);
+	media_entity_cleanup(&video->vdev.entity);
+	mutex_destroy(&video->q_lock);
+}
+
+const struct v4l2_format *
+mtk_cam_dev_find_fmt(struct mtk_cam_dev_node_desc *desc, u32 format)
+{
+	unsigned int i;
+	const struct v4l2_format *fmt;
+
+	for (i = 0; i < desc->num_fmts; i++) {
+		fmt = &desc->fmts[i].vfmt;
+		if (fmt->fmt.pix_mp.pixelformat == format)
+			return fmt;
+	}
+
+	return NULL;
+}
+
+int mtk_cam_vidioc_querycap(struct file *file, void *fh,
+			    struct v4l2_capability *cap)
+{
+	struct mtk_cam_device *cam = video_drvdata(file);
+
+	strscpy(cap->driver, dev_driver_string(cam->dev), sizeof(cap->driver));
+	strscpy(cap->card, dev_driver_string(cam->dev), sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
+		 dev_name(cam->dev));
+
+	return 0;
+}
+
+int mtk_cam_vidioc_enum_framesizes(struct file *filp, void *priv,
+				   struct v4l2_frmsizeenum *sizes)
+{
+	struct mtk_cam_video_device *node = file_to_mtk_cam_node(filp);
+	const struct v4l2_format *dev_fmt;
+
+	dev_fmt = mtk_cam_dev_find_fmt(&node->desc, sizes->pixel_format);
+	if (!dev_fmt || sizes->index)
+		return -EINVAL;
+
+	sizes->type = node->desc.frmsizes->type;
+	memcpy(&sizes->stepwise, &node->desc.frmsizes->stepwise,
+	       sizeof(sizes->stepwise));
+	return 0;
+}
+
+int mtk_cam_vidioc_enum_fmt(struct file *file, void *fh,
+			    struct v4l2_fmtdesc *f)
+{
+	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
+
+	if (f->index >= node->desc.num_fmts)
+		return -EINVAL;
+
+	f->pixelformat = node->desc.fmts[f->index].vfmt.fmt.pix_mp.pixelformat;
+	f->flags = 0;
+	/* fmt description is filled in v4l_fill_fmtdesc */
+
+	return 0;
+}
+
+int mtk_cam_vidioc_g_fmt(struct file *file, void *fh,
+			 struct v4l2_format *f)
+{
+	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
+
+	f->fmt = node->active_fmt.fmt;
+
+	return 0;
+}
+
+int mtk_cam_vidioc_s_fmt(struct file *file, void *fh,
+			 struct v4l2_format *f)
+{
+	struct mtk_cam_device *cam = video_drvdata(file);
+	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
+	struct mtk_raw_pipeline *raw_pipeline;
+	int raw_feature = 0;
+
+	raw_pipeline = mtk_cam_dev_get_raw_pipeline(cam, node->uid.pipe_id);
+
+	if (!vb2_is_busy(node->vdev.queue)) {
+		/* Get the valid format */
+		if (raw_pipeline)
+			raw_feature = raw_pipeline->user_res.raw_res.feature;
+
+		mtk_cam_video_set_fmt(node, f, raw_feature);
+
+		/* Configure to video device */
+		node->active_fmt = *f;
+		return 0;
+	}
+
+	dev_info(cam->dev,
+		 "%s:pipe(%d):%s:Cannot change format while streaming\n",
+		 __func__, node->uid.pipe_id, node->desc.name);
+
+	return -EBUSY;
+}
+
+int mtk_cam_video_set_fmt(struct mtk_cam_video_device *node,
+			  struct v4l2_format *f, int raw_feature)
+{
+	struct mtk_cam_device *cam = video_get_drvdata(&node->vdev);
+	const struct v4l2_format *dev_fmt;
+	struct v4l2_format try_fmt;
+	s32 i;
+
+	dev_dbg(cam->dev,
+		"%s:pipe(%d):%s:feature(0x%x)\n",
+		__func__, node->uid.pipe_id, node->desc.name, raw_feature);
+
+	memset(&try_fmt, 0, sizeof(try_fmt));
+	try_fmt.type = f->type;
+
+	/* Validate pixelformat */
+	dev_fmt = mtk_cam_dev_find_fmt(&node->desc, f->fmt.pix_mp.pixelformat);
+	if (!dev_fmt) {
+		dev_dbg(cam->dev, "unknown fmt:%d\n",
+			f->fmt.pix_mp.pixelformat);
+		dev_fmt = &node->desc.fmts[node->desc.default_fmt_idx].vfmt;
+	}
+	try_fmt.fmt.pix_mp.pixelformat = dev_fmt->fmt.pix_mp.pixelformat;
+
+	/* Validate image width & height range */
+	try_fmt.fmt.pix_mp.width = clamp_val(f->fmt.pix_mp.width,
+					     IMG_MIN_WIDTH, IMG_MAX_WIDTH);
+	try_fmt.fmt.pix_mp.height = clamp_val(f->fmt.pix_mp.height,
+					      IMG_MIN_HEIGHT, IMG_MAX_HEIGHT);
+	/* 4 bytes alignment for width */
+	/* width and stride should align bus_size */
+	try_fmt.fmt.pix_mp.width = ALIGN(try_fmt.fmt.pix_mp.width, IMG_PIX_ALIGN);
+	try_fmt.fmt.pix_mp.num_planes = 1;
+
+	for (i = 0 ; i < try_fmt.fmt.pix_mp.num_planes ; i++)
+		try_fmt.fmt.pix_mp.plane_fmt[i].bytesperline =
+				f->fmt.pix_mp.plane_fmt[i].bytesperline;
+
+	/* bytesperline & sizeimage calculation */
+	cal_image_pix_mp(node->desc.id, &try_fmt.fmt.pix_mp, 0);
+
+	/* Constant format fields */
+	try_fmt.fmt.pix_mp.colorspace = V4L2_COLORSPACE_SRGB;
+	try_fmt.fmt.pix_mp.field = V4L2_FIELD_NONE;
+	try_fmt.fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	try_fmt.fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
+	try_fmt.fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_SRGB;
+
+	*f = try_fmt;
+
+	return 0;
+}
+
+int mtk_cam_vidioc_try_fmt(struct file *file, void *fh,
+			   struct v4l2_format *f)
+{
+	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
+
+	mtk_cam_video_set_fmt(node, f, 0);
+
+	return 0;
+}
+
+int mtk_cam_vidioc_meta_enum_fmt(struct file *file, void *fh,
+				 struct v4l2_fmtdesc *f)
+{
+	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
+
+	if (f->index)
+		return -EINVAL;
+
+	f->pixelformat = node->active_fmt.fmt.meta.dataformat;
+	f->flags = 0;
+	/*fmt description is filled in v4l_fill_fmtdesc */
+
+	return 0;
+}
+
+int mtk_cam_vidioc_g_meta_fmt(struct file *file, void *fh,
+			      struct v4l2_format *f)
+{
+	struct mtk_cam_device *cam = video_drvdata(file);
+	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
+	struct mtk_cam_dev_node_desc *desc = &node->desc;
+	const struct v4l2_format *default_fmt =
+		&desc->fmts[desc->default_fmt_idx].vfmt;
+	struct mtk_raw_pde_config *pde_cfg;
+	struct mtk_cam_pde_info *pde_info;
+
+	if (node->desc.dma_port == MTKCAM_ISP_META_STATS_CFG) {
+		pde_cfg = &cam->raw.pipelines[node->uid.pipe_id].pde_config;
+		pde_info = &pde_cfg->pde_info;
+		if (pde_info->pd_table_offset) {
+			node->active_fmt.fmt.meta.buffersize =
+				default_fmt->fmt.meta.buffersize +
+				pde_info->pdi_max_size;
+
+			dev_dbg(cam->dev, "PDE: node(%d), enlarge meta size(%u)",
+				node->desc.dma_port,
+				node->active_fmt.fmt.meta.buffersize);
+		}
+	}
+	if (node->desc.dma_port == MTKCAM_ISP_META_STATS_0) {
+		pde_cfg = &cam->raw.pipelines[node->uid.pipe_id].pde_config;
+		pde_info = &pde_cfg->pde_info;
+		if (pde_info->pd_table_offset) {
+			node->active_fmt.fmt.meta.buffersize =
+				default_fmt->fmt.meta.buffersize +
+				pde_info->pdo_max_size;
+
+			dev_dbg(cam->dev, "PDE: node(%d), enlarge meta size(%u)",
+				node->desc.dma_port,
+				node->active_fmt.fmt.meta.buffersize);
+		}
+	}
+	f->fmt.meta.dataformat = node->active_fmt.fmt.meta.dataformat;
+	f->fmt.meta.buffersize = node->active_fmt.fmt.meta.buffersize;
+
+	return 0;
+}
+
+int mtk_cam_vidioc_s_selection(struct file *file, void *fh,
+			       struct v4l2_selection *s)
+{
+	struct mtk_cam_device *cam = video_drvdata(file);
+	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
+	struct mtk_raw_pipeline *raw_pipeline;
+
+	raw_pipeline = mtk_cam_dev_get_raw_pipeline(cam, node->uid.pipe_id);
+	if (raw_pipeline) {
+		node->active_crop = *s;
+
+		dev_dbg(raw_pipeline->subdev.v4l2_dev->dev,
+			"%s:%s:%s:Set selection (%d,%d,%d,%d)\n",
+			__func__, raw_pipeline->subdev.name, node->desc.name,
+			s->r.left, s->r.top, s->r.width, s->r.height);
+	}
+
+	return 0;
+}
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-video.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-video.h
new file mode 100755
index 000000000000..38b89cc2b81e
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-video.h
@@ -0,0 +1,223 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __MTK_CAM_VIDEO_H
+#define __MTK_CAM_VIDEO_H
+
+#include <linux/types.h>
+#include <linux/videodev2.h>
+#include <media/media-entity.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-dev.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "mtk_cam-ipi.h"
+
+#define MAX_PLANE_NUM 3
+
+struct mtk_cam_resource;
+struct mtk_raw_pde_config;
+
+typedef int (*set_pad_fmt_func_t)(struct v4l2_subdev *sd,
+			struct v4l2_subdev_state *sd_state,
+			struct v4l2_mbus_framefmt *sink_fmt,
+			struct mtk_cam_resource *res,
+			int pad, int which);
+
+typedef int (*set_pad_selection_func_t)(struct v4l2_subdev *sd,
+			struct v4l2_subdev_state *sd_state,
+			struct v4l2_mbus_framefmt *sink_fmt,
+			struct mtk_cam_resource *res,
+			int pad, int which);
+
+/*For state analysis and controlling for request*/
+enum MTK_BUF_STATE {
+	E_BUF_STATE_QUEUED = 0x0,
+	E_BUF_STATE_COMPOSED,
+	E_BUF_STATE_CQ,
+	E_BUF_STATE_OUTER,
+};
+
+struct mtk_buf_state {
+	enum MTK_BUF_STATE estate;
+	struct list_head list;
+};
+
+/**
+ * struct mtk_cam_buffer - MTK camera device buffer.
+ *
+ * @vbb: Embedded struct vb2_v4l2_buffer.
+ * @list: List entry for the buffer queue
+ * @daddr: The DMA address of this buffer.
+ * @scp_addr: The SCP address of this buffer which
+ *            is only supported for meta input node.
+ * @state: The camera buffer status.
+ */
+struct mtk_cam_buffer {
+	struct vb2_v4l2_buffer vbb;
+	struct list_head list;
+
+	dma_addr_t daddr;
+	dma_addr_t scp_addr;
+	struct mtk_buf_state state;
+};
+
+struct mtk_cam_format_desc {
+	struct v4l2_format vfmt;
+	struct v4l2_mbus_framefmt pfmt;
+};
+
+struct mtk_cam_pad_ops {
+	set_pad_fmt_func_t set_pad_fmt;
+	set_pad_selection_func_t set_pad_selection;
+};
+
+/**
+ * struct mtk_cam_dev_node_desc - MTK camera device node descriptor
+ *
+ * @id: id of the node
+ * @name: name of the node
+ * @cap: supported V4L2 capabilities
+ * @buf_type: supported V4L2 buffer type
+ * @dma_port: the dma ports associated to the node
+ * @link_flags: default media link flags
+ * @smem_alloc: using the smem_dev as alloc device or not
+ * @need_cache_sync_on_prepare: do cache sync at buf_prepare (userspace sync)
+ * @need_cache_sync_on_finish: do cache sync at buf_finish (userspace sync)
+ * @image: true for image node, false for meta node
+ * @num_fmts: the number of supported node formats
+ * @default_fmt_idx: default format of this node
+ * @max_buf_count: maximum VB2 buffer count
+ * @ioctl_ops:  mapped to v4l2_ioctl_ops
+ * @fmts: supported format
+ * @frmsizes: supported V4L2 frame size number
+ * @pad_ops: set and select pad configurations and formats
+ */
+struct mtk_cam_dev_node_desc {
+	u8 id;
+	const char *name;
+	u32 cap;
+	u32 buf_type;
+	u32 dma_port;
+	u32 link_flags;
+	u8 smem_alloc:1;
+	u8 image:1;
+	u8 num_fmts;
+	u8 default_fmt_idx;
+	u8 max_buf_count;
+	const struct v4l2_ioctl_ops *ioctl_ops;
+	const struct mtk_cam_format_desc *fmts;
+	const struct v4l2_frmsizeenum *frmsizes;
+	struct mtk_cam_pad_ops *pad_ops;
+};
+
+/**
+ * struct mtk_cam_video_device - MediaTek video device structure.
+ */
+struct mtk_cam_video_device {
+	struct mtkcam_ipi_uid uid;
+	struct mtk_cam_dev_node_desc desc;
+	unsigned int enabled;
+
+	struct vb2_queue vb2_q;
+	struct video_device vdev;
+	struct media_pad pad;
+	struct v4l2_format active_fmt;
+	/* use first 4 elements of reserved field of v4l2_pix_format_mplane as request fd */
+	struct v4l2_format pending_fmt;
+	/* use first elements of reserved field of v4l2_selection as request fd*/
+	struct v4l2_selection active_crop;
+	/* Serializes vb2 queue and video device operations */
+	struct mutex q_lock;
+	int streaming_id;
+
+	/* cached ctx info */
+	struct mtk_cam_ctx *ctx;
+};
+
+struct mtk_format_info {
+	u32 format;
+	u8 mem_planes;
+	u8 comp_planes;
+	u8 bpp[4];
+	u8 hdiv;
+	u8 vdiv;
+	u8 bit_r_num; /* numerator of bit ratio */
+	u8 bit_r_den; /* denominator of bit ratio */
+};
+
+int mtk_cam_video_register(struct mtk_cam_video_device *video,
+			   struct v4l2_device *v4l2_dev);
+void mtk_cam_video_unregister(struct mtk_cam_video_device *video);
+
+static inline struct mtk_cam_video_device *
+file_to_mtk_cam_node(struct file *__file)
+{
+	return container_of(video_devdata(__file), struct mtk_cam_video_device, vdev);
+}
+
+static inline struct mtk_cam_buffer *
+mtk_cam_vb2_buf_to_dev_buf(struct vb2_buffer *__vb)
+{
+	return container_of(__vb, struct mtk_cam_buffer, vbb.vb2_buf);
+}
+
+static inline struct mtk_cam_video_device *
+mtk_cam_vbq_to_vdev(struct vb2_queue *__vq)
+{
+	return container_of(__vq, struct mtk_cam_video_device, vb2_q);
+}
+
+const struct v4l2_format *
+mtk_cam_dev_find_fmt(struct mtk_cam_dev_node_desc *desc, u32 format);
+
+int mtk_cam_vidioc_querycap(struct file *file, void *fh,
+			    struct v4l2_capability *cap);
+
+int mtk_cam_vidioc_enum_framesizes(struct file *filp, void *priv,
+				   struct v4l2_frmsizeenum *sizes);
+
+int mtk_cam_vidioc_enum_fmt(struct file *file, void *fh,
+			    struct v4l2_fmtdesc *f);
+
+int mtk_cam_vidioc_g_fmt(struct file *file, void *fh, struct v4l2_format *f);
+
+int mtk_cam_vidioc_s_fmt(struct file *file, void *fh, struct v4l2_format *f);
+
+int mtk_cam_vidioc_try_fmt(struct file *file, void *fh, struct v4l2_format *f);
+
+int mtk_cam_vidioc_meta_enum_fmt(struct file *file, void *fh,
+				 struct v4l2_fmtdesc *f);
+
+int mtk_cam_vidioc_s_selection(struct file *file, void *fh,
+			       struct v4l2_selection *s);
+
+int mtk_cam_vidioc_g_meta_fmt(struct file *file, void *fh,
+			      struct v4l2_format *f);
+
+/* Utility functions to convert format enum */
+unsigned int mtk_cam_get_sensor_pixel_id(unsigned int fmt);
+
+unsigned int mtk_cam_get_sensor_fmt(unsigned int fmt);
+
+unsigned int mtk_cam_get_pixel_bits(unsigned int pix_fmt);
+
+unsigned int mtk_cam_get_img_fmt(unsigned int fourcc);
+
+int mtk_cam_video_set_fmt(struct mtk_cam_video_device *node,
+			  struct v4l2_format *f, int feature);
+
+int is_mtk_format(u32 pixelformat);
+
+int is_yuv_ufo(u32 pixelformat);
+
+int is_raw_ufo(u32 pixelformat);
+
+int is_fullg_rb(u32 pixelformat);
+
+const struct mtk_format_info *mtk_format_info(u32 format);
+
+#endif /*__MTK_CAM_VIDEO_H */
-- 
2.18.0

