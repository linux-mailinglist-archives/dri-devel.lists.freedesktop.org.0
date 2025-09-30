Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A18BAB7E3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87E410E4F8;
	Tue, 30 Sep 2025 05:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="GZn+rXXb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1967B10E276
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:04 +0000 (UTC)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250930035659epoutp0101dd287219e6a09d14c37aa0d76c1fc0~p80ftE3ij3124431244epoutp01B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:56:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250930035659epoutp0101dd287219e6a09d14c37aa0d76c1fc0~p80ftE3ij3124431244epoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204619;
 bh=Opmcn1eBkxs4yvNdgaabKkETHQwug3qB+xi5yQ+tmfo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GZn+rXXbXo3Xqw0kLH4uZDwh9IeHlDm4ZlTocjQbwNkC7oK4WOAdmDxXti0/Vae6j
 kKCwtsBMAWKoLpw0turFqbOeY20dZEsyxqFHFEhtRAkzNEw71ZtlzJbv94Gsh9OowW
 ySkHl/WC2AKj9NNfVEjmfIcGsW/QAzzNJKqtLn9E=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
 20250930035658epcas5p14da69819905bbbb3d9eea3c25b88f97a~p80fB-F5M1532615326epcas5p1p;
 Tue, 30 Sep 2025 03:56:58 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.87]) by
 epsnrtp04.localdomain (Postfix) with ESMTP id 4cbPQ203tZz6B9mF; Tue, 30 Sep
 2025 03:56:58 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035657epcas5p17d3e94c7c1ba5eeace97b0ff81053653~p80daA7Jw2306123061epcas5p1-;
 Tue, 30 Sep 2025 03:56:57 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035654epsmtip159f5d79a4cd8ce016a4981d692a91c06~p80a56pxn2938429384epsmtip1P;
 Tue, 30 Sep 2025 03:56:54 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 24/29] media: mfc: Add encoder VB2 support to driver
Date: Tue, 30 Sep 2025 09:33:43 +0530
Message-Id: <20250930040348.3702923-25-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035657epcas5p17d3e94c7c1ba5eeace97b0ff81053653
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035657epcas5p17d3e94c7c1ba5eeace97b0ff81053653
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
 <CGME20250930035657epcas5p17d3e94c7c1ba5eeace97b0ff81053653@epcas5p1.samsung.com>
X-Mailman-Approved-At: Tue, 30 Sep 2025 05:28:53 +0000
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

From: Nagaraju Siddineni <nagaraju.s@samsung.com>

Introduce encoder VB2 support. This enables proper V4L2
output for the Exynos MFC encoder, handling queue setup,
buffers, and streaming control.

Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
---
 .../platform/samsung/exynos-mfc/Makefile      |   2 +-
 .../platform/samsung/exynos-mfc/mfc_enc_vb2.c | 443 ++++++++++++++++++
 .../platform/samsung/exynos-mfc/mfc_enc_vb2.h |  19 +
 3 files changed, 463 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_enc_vb2.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_enc_vb2.h

diff --git a/drivers/media/platform/samsung/exynos-mfc/Makefile b/drivers/media/platform/samsung/exynos-mfc/Makefile
index a257d5b0a576..dad94a7c468c 100644
--- a/drivers/media/platform/samsung/exynos-mfc/Makefile
+++ b/drivers/media/platform/samsung/exynos-mfc/Makefile
@@ -3,7 +3,7 @@ obj-$(CONFIG_VIDEO_EXYNOS_MFC) := exynos_mfc.o
 ccflags-y += -I$(srctree)/$(src)
 
 #Dev interface layer
-exynos_mfc-y += mfc.o mfc_dec_v4l2.o mfc_dec_vb2.o
+exynos_mfc-y += mfc.o mfc_dec_v4l2.o mfc_dec_vb2.o mfc_enc_vb2.o
 #Dev control layer
 exynos_mfc-y += mfc_rm.o mfc_ctx_ctrl.o mfc_debugfs.o
 #Core interface layer
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_enc_vb2.c b/drivers/media/platform/samsung/exynos-mfc/mfc_enc_vb2.c
new file mode 100644
index 000000000000..7164c334585b
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_enc_vb2.c
@@ -0,0 +1,443 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * mfc_enc_vb2.c file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#include "mfc_rm.h"
+
+#include "base/mfc_queue.h"
+#include "base/mfc_utils.h"
+#include "base/mfc_buf.h"
+#include "base/mfc_mem.h"
+#include "mfc_enc_vb2.h"
+
+static int mfc_enc_queue_setup(struct vb2_queue *vq,
+			       unsigned int *buf_count, unsigned int *plane_count,
+			       unsigned int psize[], struct device *alloc_devs[])
+{
+	struct mfc_ctx *ctx = vq->drv_priv;
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_core *core;
+	struct mfc_core_ctx *core_ctx;
+	int i;
+
+	mfc_ctx_debug_enter();
+
+	/* Encoder works only single core */
+	core = mfc_get_main_core_lock(dev, ctx);
+	core_ctx = core->core_ctx[ctx->num];
+
+	if (core_ctx->state != MFCINST_GOT_INST &&
+	    vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		mfc_err("invalid state: %d\n", core_ctx->state);
+		return -EINVAL;
+	}
+	if (core_ctx->state >= MFCINST_FINISHING &&
+	    vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		mfc_err("invalid state: %d\n", core_ctx->state);
+		return -EINVAL;
+	}
+
+	if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		mfc_debug(4, "enc dst\n");
+		if (ctx->dst_fmt)
+			*plane_count = ctx->dst_fmt->mem_planes;
+		else
+			*plane_count = MFC_ENC_CAP_PLANE_COUNT;
+
+		if (*buf_count < 1)
+			*buf_count = 1;
+		if (*buf_count > MFC_MAX_BUFFERS)
+			*buf_count = MFC_MAX_BUFFERS;
+
+		psize[0] = enc->dst_buf_size;
+		alloc_devs[0] = dev->device;
+		/* In case of VP8/VP9 encoder, part of stream buffer should be read */
+		vq->dma_dir = DMA_BIDIRECTIONAL;
+	} else if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		mfc_ctx_debug(4, "enc src\n");
+
+		if (ctx->src_fmt)
+			*plane_count = ctx->num_fd_frame;
+		else
+			*plane_count = MFC_ENC_OUT_PLANE_COUNT;
+
+		if (*buf_count < 1)
+			*buf_count = 1;
+		if (*buf_count > MFC_MAX_BUFFERS)
+			*buf_count = MFC_MAX_BUFFERS;
+
+		/* need to use minimum size to prevent qbuf fail */
+		if (*plane_count == 1) {
+			psize[0] = 1;
+			alloc_devs[0] = dev->device;
+		} else {
+			for (i = 0; i < *plane_count; i++) {
+				psize[i] = 1;
+				alloc_devs[i] = dev->device;
+			}
+		}
+	} else {
+		mfc_err("invalid queue type: %d\n", vq->type);
+		return -EINVAL;
+	}
+
+	mfc_debug(2, "buf_count: %d, plane_count: %d, type: %#x\n",
+		  *buf_count, *plane_count, vq->type);
+	for (i = 0; i < *plane_count; i++)
+		mfc_debug(2, "plane[%d] size: %d\n", i, psize[i]);
+
+	mfc_ctx_debug_leave();
+
+	return 0;
+}
+
+static void mfc_enc_unlock(struct vb2_queue *q)
+{
+	struct mfc_ctx *ctx = q->drv_priv;
+	struct mfc_dev *dev = ctx->dev;
+
+	mutex_unlock(&dev->mfc_mutex);
+}
+
+static void mfc_enc_lock(struct vb2_queue *q)
+{
+	struct mfc_ctx *ctx = q->drv_priv;
+	struct mfc_dev *dev = ctx->dev;
+
+	mutex_lock(&dev->mfc_mutex);
+}
+
+static int mfc_enc_buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct mfc_ctx *ctx = vq->drv_priv;
+	int ret;
+
+	mfc_ctx_debug_enter();
+
+	if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		ret = mfc_check_vb_with_fmt(ctx->dst_fmt, vb);
+		if (ret < 0)
+			return ret;
+
+		if (call_cop(ctx, init_buf_ctrls, ctx, MFC_CTRL_TYPE_DST,
+			     vb->index) < 0)
+			mfc_ctx_err("failed in init_buf_ctrls\n");
+
+	} else if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		ret = mfc_check_vb_with_fmt(ctx->src_fmt, vb);
+		if (ret < 0)
+			return ret;
+
+		if (call_cop(ctx, init_buf_ctrls, ctx, MFC_CTRL_TYPE_SRC,
+			     vb->index) < 0)
+			mfc_ctx_err("failed in init_buf_ctrls\n");
+	} else {
+		mfc_ctx_err("invalid queue type: %d\n", vq->type);
+		return -EINVAL;
+	}
+
+	mfc_ctx_debug_leave();
+
+	return 0;
+}
+
+static int mfc_enc_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct mfc_ctx *ctx = vq->drv_priv;
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_raw_info *raw;
+	unsigned int index = vb->index;
+	struct mfc_buf *buf = vb_to_mfc_buf(vb);
+	struct dma_buf *bufcon_dmabuf[MFC_MAX_PLANES];
+	int i, mem_get_count = 0;
+	size_t buf_size;
+
+	mfc_ctx_debug_enter();
+
+	if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		buf_size = vb2_plane_size(vb, 0);
+		mfc_ctx_debug(2, "[STREAM] vb size: %lu, calc size: %u\n",
+			      buf_size, enc->dst_buf_size);
+
+		if (buf_size < enc->dst_buf_size) {
+			mfc_ctx_err("[STREAM] size(%lu) is smaller than (%d)\n",
+				    buf_size, enc->dst_buf_size);
+			return -EINVAL;
+		}
+
+		buf->addr[0][0] = mfc_mem_get_daddr_vb(vb, 0);
+
+		/* Copy dst buffer flag to buf_ctrl */
+		buf->flag = call_cop(ctx, get_buf_ctrl_val, ctx,
+				     &ctx->dst_ctrls[index],
+				     V4L2_CID_MPEG_VIDEO_DST_BUF_FLAG);
+	} else if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		raw = &ctx->raw_buf;
+		if (ctx->src_fmt->mem_planes == 1) {
+			buf_size = vb2_plane_size(vb, 0);
+			mfc_ctx_debug(2, "[FRAME] single plane vb size: %lu, calc size: %d\n",
+				      buf_size, raw->total_plane_size);
+			if (buf_size < raw->total_plane_size) {
+				mfc_ctx_err("[FRAME] single plane size(%lu) is smaller than (%d)\n",
+					    buf_size, raw->total_plane_size);
+				return -EINVAL;
+			}
+		} else {
+			for (i = 0; i < ctx->src_fmt->mem_planes; i++) {
+				buf_size = vb2_plane_size(vb, i);
+				mfc_ctx_debug(2, "[FRAME] plane[%d] vb size: %lu, calc size: %d\n",
+					      i, buf_size, raw->plane_size[i]);
+				if (buf_size < raw->plane_size[i]) {
+					mfc_ctx_err("[FRAME] plane[%d] size(%lu) is smaller than (%d)\n",
+						    i, buf_size, raw->plane_size[i]);
+					return -EINVAL;
+				}
+			}
+		}
+
+		for (i = 0; i < ctx->src_fmt->mem_planes; i++) {
+			bufcon_dmabuf[i] = dma_buf_get(vb->planes[i].m.fd);
+			if (IS_ERR(bufcon_dmabuf[i])) {
+				mfc_ctx_err("failed to get bufcon dmabuf\n");
+				goto err_mem_put;
+			}
+			mem_get_count++;
+
+			dma_buf_put(bufcon_dmabuf[i]);
+			mfc_calc_base_addr(ctx, vb, ctx->src_fmt);
+		}
+
+		call_cop(ctx, to_buf_ctrls, ctx, &ctx->src_ctrls[index]);
+
+		/* Copy src buffer flag to buf_ctrl */
+		buf->flag = call_cop(ctx, get_buf_ctrl_val, ctx,
+				     &ctx->src_ctrls[index],
+				     V4L2_CID_MPEG_VIDEO_SRC_BUF_FLAG);
+	} else {
+		mfc_ctx_err("invalid queue type: %d\n", vq->type);
+		return -EINVAL;
+	}
+
+	mfc_mem_buf_prepare(vb, 0);
+
+	mfc_ctx_debug_leave();
+	return 0;
+
+err_mem_put:
+	for (i = 0; i < mem_get_count; i++)
+		dma_buf_put(bufcon_dmabuf[i]);
+
+	return -ENOMEM;
+}
+
+static void mfc_enc_buf_finish(struct vb2_buffer *vb)
+{
+	struct mfc_buf *buf = vb_to_mfc_buf(vb);
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct mfc_ctx *ctx = vq->drv_priv;
+	unsigned int index = vb->index;
+
+	if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		/* Copy to dst buffer flag */
+		call_cop(ctx, update_buf_val, ctx, &ctx->dst_ctrls[index],
+			 V4L2_CID_MPEG_VIDEO_DST_BUF_FLAG, buf->flag);
+		mfc_ctx_debug(4, "[FLAG] dst update buf[%d] flag = %#x\n",
+			      index, buf->flag);
+
+		call_cop(ctx, to_ctx_ctrls, ctx, &ctx->dst_ctrls[index]);
+
+		mfc_mem_buf_finish(vb, 1);
+	} else if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		/* Copy to src buffer flag */
+		call_cop(ctx, update_buf_val, ctx, &ctx->src_ctrls[index],
+			 V4L2_CID_MPEG_VIDEO_SRC_BUF_FLAG, buf->flag);
+		mfc_ctx_debug(4, "[FLAG] src update buf[%d] flag = %#x\n",
+			      index, buf->flag);
+
+		call_cop(ctx, to_ctx_ctrls, ctx, &ctx->src_ctrls[index]);
+	}
+}
+
+static void mfc_enc_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct mfc_ctx *ctx = vq->drv_priv;
+	unsigned int index = vb->index;
+
+	mfc_ctx_debug_enter();
+
+	if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		if (call_cop(ctx, cleanup_buf_ctrls, ctx,
+			     MFC_CTRL_TYPE_DST, index) < 0)
+			mfc_ctx_err("failed in cleanup_buf_ctrls\n");
+	} else if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		if (call_cop(ctx, cleanup_buf_ctrls, ctx,
+			     MFC_CTRL_TYPE_SRC, index) < 0)
+			mfc_ctx_err("failed in cleanup_buf_ctrls\n");
+	} else {
+		mfc_ctx_err("unknown queue type\n");
+	}
+
+	mfc_ctx_debug_leave();
+}
+
+static int mfc_enc_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct mfc_ctx *ctx = q->drv_priv;
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_core *core;
+	struct mfc_core_ctx *core_ctx;
+
+	/* Encoder works only single core */
+	core = mfc_get_main_core_lock(dev, ctx);
+	core_ctx = core->core_ctx[ctx->num];
+
+	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
+	    core_ctx->state == MFCINST_FINISHED) {
+		mfc_change_state(core_ctx, MFCINST_GOT_INST);
+		mfc_info("enc start_streaming changes state %d\n",
+			 core_ctx->state);
+		MFC_TRACE_CTX("** ENC streamon, state: %d\n",
+			      core_ctx->state);
+	}
+
+	mfc_rm_update_real_time(ctx);
+	mfc_rm_request_work(dev, MFC_WORK_TRY, ctx);
+
+	return 0;
+}
+
+static void mfc_enc_stop_streaming(struct vb2_queue *q)
+{
+	struct mfc_ctx *ctx = q->drv_priv;
+	struct mfc_dev *dev = ctx->dev;
+
+	mfc_ctx_info("enc stop_streaming is called, type : %d\n", q->type);
+	MFC_TRACE_CTX("** ENC streamoff(type:%d)\n", q->type);
+
+	mfc_rm_instance_enc_stop(dev, ctx, q->type);
+}
+
+static void mfc_enc_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct mfc_core *core;
+	struct mfc_core_ctx *core_ctx;
+	struct mfc_ctx *ctx = vq->drv_priv;
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_buf *buf = vb_to_mfc_buf(vb);
+	int i;
+	int is_dst_buf_ready;
+
+	mfc_ctx_debug_enter();
+
+	buf->next_index = 0;
+	buf->done_index = 0;
+
+	if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		mfc_ctx_debug(2, "[BUFINFO] ctx[%d] add dst index: %d, addr: 0x%08llx\n",
+			      ctx->num, vb->index, buf->addr[0][0]);
+
+		/* Mark destination as available for use by MFC */
+		mfc_add_tail_buf(ctx, &ctx->dst_buf_queue, buf);
+		mfc_rm_qos_control(ctx, MFC_QOS_TRIGGER);
+	} else if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		buf->src_index = ctx->serial_src_index++;
+		if (ctx->multi_view_enable) {
+			for (i = 0; i < ctx->raw_buf.num_planes; i++)
+				mfc_ctx_debug(2, "%s[%d] %s: %d(%d), addr[0][%d]: 0x%08llx\n",
+					      "[BUFINFO-view0] ctx", ctx->num,
+					      "add src index", vb->index,
+					      buf->src_index, i,
+					      buf->addr[0][i]);
+			for (i = 0; i < ctx->raw_buf.num_planes; i++)
+				mfc_ctx_debug(2, "%s[%d] %s: %d(%d), addr[2][%d]: 0x%08llx\n",
+					      "[BUFINFO-view1] ctx", ctx->num,
+					      "add src index", vb->index,
+					      buf->src_index, i,
+					      buf->addr[2][i]);
+		} else {
+			if (ctx->num_fd_frame > 3) {
+				mfc_ctx_err("if not multi_view_enable, num_fd_frame must be <= 3\n");
+			} else {
+				for (i = 0; i < ctx->num_fd_frame; i++) {
+					mfc_ctx_debug(2, "%s[%d] %s: %d(%d), addr[%d]: 0x%08llx\n",
+						      "[BUFINFO] ctx", ctx->num,
+						      "add src index", vb->index,
+						      buf->src_index, i, buf->addr[0][i]);
+				}
+			}
+		}
+		mfc_add_tail_buf(ctx, &ctx->src_buf_ready_queue, buf);
+
+		if (dev->debugfs.debug_ts == 1)
+			mfc_ctx_info("[TS] framerate: %ld, timestamp: %lld\n",
+				     ctx->framerate, buf->vb.vb2_buf.timestamp);
+
+		mfc_rate_update_last_framerate(ctx, buf->vb.vb2_buf.timestamp);
+		mfc_rm_qos_control(ctx, MFC_QOS_TRIGGER);
+	} else {
+		mfc_ctx_err("unsupported buffer type (%d)\n", vq->type);
+	}
+
+	if (ctx->stream_op_mode == MFC_OP_TWO_MODE1)
+		is_dst_buf_ready =
+			mfc_is_queue_count_greater(&ctx->buf_queue_lock,
+						   &ctx->dst_buf_queue, 0);
+
+	mfc_rm_request_work(dev, MFC_WORK_TRY, ctx);
+
+	if (!mfc_rm_query_state(ctx, EQUAL_BIGGER, MFCINST_HEAD_PARSED) &&
+	    ctx->stream_op_mode == MFC_OP_TWO_MODE1 && is_dst_buf_ready) {
+		core = mfc_get_main_core(dev, ctx);
+		if (!core) {
+			mfc_ctx_err("[RM] main core is NULL\n");
+			return;
+		}
+		core_ctx = core->core_ctx[ctx->num];
+
+		if (mfc_wait_for_done_core_ctx(core_ctx, MFC_REG_R2H_CMD_SEQ_DONE_RET)) {
+			mfc_ctx_err("[RM] sub core header parsing failed\n");
+			return;
+		}
+
+		mfc_ctx_info("[2CORE] start the sub core\n");
+		if (ctx->op_core_num[MFC_CORE_SUB] == MFC_CORE_INVALID) {
+			if (mfc_rm_instance_setup(dev, ctx))
+				mfc_ctx_err("[2CORE] failed to setup sub core\n");
+		} else {
+			if (mfc_rm_subcore_seq_start(dev, ctx))
+				mfc_ctx_err("[2CORE] failed to seq_start sub core\n");
+		}
+	}
+
+	mfc_ctx_debug_leave();
+}
+
+static const struct vb2_ops mfc_enc_qops = {
+	.queue_setup		= mfc_enc_queue_setup,
+	.wait_prepare		= mfc_enc_unlock,
+	.wait_finish		= mfc_enc_lock,
+	.buf_init		= mfc_enc_buf_init,
+	.buf_prepare		= mfc_enc_buf_prepare,
+	.buf_finish		= mfc_enc_buf_finish,
+	.buf_cleanup		= mfc_enc_buf_cleanup,
+	.start_streaming	= mfc_enc_start_streaming,
+	.stop_streaming		= mfc_enc_stop_streaming,
+	.buf_queue		= mfc_enc_buf_queue,
+};
+
+const struct vb2_ops *mfc_get_enc_vb2_ops(void)
+{
+	return &mfc_enc_qops;
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_enc_vb2.h b/drivers/media/platform/samsung/exynos-mfc/mfc_enc_vb2.h
new file mode 100644
index 000000000000..d3cb99f0bf84
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_enc_vb2.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * mfc_enc_vb2.h file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_ENC_VB2_H
+#define __MFC_ENC_VB2_H __FILE__
+
+#include "base/mfc_common.h"
+
+const struct vb2_ops *mfc_get_enc_vb2_ops(void);
+
+#endif /* __MFC_ENC_VB2_H */
-- 
2.34.1

