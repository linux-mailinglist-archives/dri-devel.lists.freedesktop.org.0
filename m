Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7054F9511
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 14:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B2510F041;
	Fri,  8 Apr 2022 12:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D7B10F009
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 12:02:59 +0000 (UTC)
X-UUID: 51782733924548638bfbc0e04f38412b-20220408
X-UUID: 51782733924548638bfbc0e04f38412b-20220408
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1456330302; Fri, 08 Apr 2022 20:02:54 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Apr 2022 20:02:52 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Apr 2022 20:02:50 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v9,
 06/17] media: mediatek: vcodec: Refactor get and put capture buffer
 flow
Date: Fri, 8 Apr 2022 20:02:29 +0800
Message-ID: <20220408120240.29571-7-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408120240.29571-1-yunfei.dong@mediatek.com>
References: <20220408120240.29571-1-yunfei.dong@mediatek.com>
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
 Steve Cho <stevecho@chromium.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For lat and core decode in parallel, need to get capture buffer
when core start to decode and put capture buffer to display
list when core decode done.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/mtk_vcodec_dec_stateless.c         | 88 +++++++++++++------
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h |  6 +-
 .../mediatek/vcodec/vdec/vdec_h264_req_if.c   | 11 ++-
 .../platform/mediatek/vcodec/vdec_msg_queue.h |  2 +
 4 files changed, 80 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
index 4df7b158ec5e..c61df1f51185 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
@@ -108,20 +108,50 @@ static const struct mtk_codec_framesizes mtk_vdec_framesizes[] = {
 
 #define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_vdec_framesizes)
 
-static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_ctx *ctx,
-					   struct vb2_v4l2_buffer *vb2_v4l2)
+static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_ctx *ctx, int error,
+					   struct media_request *src_buf_req)
 {
-	struct mtk_video_dec_buf *framebuf =
-		container_of(vb2_v4l2, struct mtk_video_dec_buf, m2m_buf.vb);
-	struct vdec_fb *pfb = &framebuf->frame_buffer;
-	struct vb2_buffer *dst_buf = &vb2_v4l2->vb2_buf;
+	struct vb2_v4l2_buffer *vb2_dst;
+	enum vb2_buffer_state state;
 
-	pfb->base_y.va = NULL;
+	if (error)
+		state = VB2_BUF_STATE_ERROR;
+	else
+		state = VB2_BUF_STATE_DONE;
+
+	vb2_dst = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
+	v4l2_m2m_buf_done(vb2_dst, state);
+
+	mtk_v4l2_debug(2, "free frame buffer id:%d to done list",
+		       vb2_dst->vb2_buf.index);
+
+	if (src_buf_req)
+		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+}
+
+static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_ctx *ctx)
+{
+	struct mtk_video_dec_buf *framebuf;
+	struct vb2_v4l2_buffer *vb2_v4l2;
+	struct vb2_buffer *dst_buf;
+	struct vdec_fb *pfb;
+
+	vb2_v4l2 = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
+	if (!vb2_v4l2) {
+		mtk_v4l2_debug(1, "[%d] dst_buf empty!!", ctx->id);
+		return NULL;
+	}
+
+	dst_buf = &vb2_v4l2->vb2_buf;
+	framebuf = container_of(vb2_v4l2, struct mtk_video_dec_buf, m2m_buf.vb);
+
+	pfb = &framebuf->frame_buffer;
+	pfb->base_y.va = vb2_plane_vaddr(dst_buf, 0);
 	pfb->base_y.dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
 	pfb->base_y.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
 
 	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2) {
-		pfb->base_c.va = NULL;
+		pfb->base_c.va = vb2_plane_vaddr(dst_buf, 1);
 		pfb->base_c.dma_addr =
 			vb2_dma_contig_plane_dma_addr(dst_buf, 1);
 		pfb->base_c.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[1];
@@ -145,12 +175,12 @@ static void mtk_vdec_worker(struct work_struct *work)
 	struct mtk_vcodec_ctx *ctx =
 		container_of(work, struct mtk_vcodec_ctx, decode_work);
 	struct mtk_vcodec_dev *dev = ctx->dev;
-	struct vb2_v4l2_buffer *vb2_v4l2_src, *vb2_v4l2_dst;
+	struct vb2_v4l2_buffer *vb2_v4l2_src;
 	struct vb2_buffer *vb2_src;
 	struct mtk_vcodec_mem *bs_src;
 	struct mtk_video_dec_buf *dec_buf_src;
 	struct media_request *src_buf_req;
-	struct vdec_fb *dst_buf;
+	enum vb2_buffer_state state;
 	bool res_chg = false;
 	int ret;
 
@@ -161,13 +191,6 @@ static void mtk_vdec_worker(struct work_struct *work)
 		return;
 	}
 
-	vb2_v4l2_dst = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
-	if (!vb2_v4l2_dst) {
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
-		mtk_v4l2_debug(1, "[%d] no available destination buffer", ctx->id);
-		return;
-	}
-
 	vb2_src = &vb2_v4l2_src->vb2_buf;
 	dec_buf_src = container_of(vb2_v4l2_src, struct mtk_video_dec_buf,
 				   m2m_buf.vb);
@@ -176,9 +199,15 @@ static void mtk_vdec_worker(struct work_struct *work)
 	mtk_v4l2_debug(3, "[%d] (%d) id=%d, vb=%p", ctx->id,
 		       vb2_src->vb2_queue->type, vb2_src->index, vb2_src);
 
-	bs_src->va = NULL;
+	bs_src->va = vb2_plane_vaddr(vb2_src, 0);
 	bs_src->dma_addr = vb2_dma_contig_plane_dma_addr(vb2_src, 0);
 	bs_src->size = (size_t)vb2_src->planes[0].bytesused;
+	if (!bs_src->va) {
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		mtk_v4l2_err("[%d] id=%d source buffer is NULL", ctx->id,
+			     vb2_src->index);
+		return;
+	}
 
 	mtk_v4l2_debug(3, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
 		       ctx->id, bs_src->va, &bs_src->dma_addr, bs_src->size, vb2_src);
@@ -189,9 +218,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 	else
 		mtk_v4l2_err("vb2 buffer media request is NULL");
 
-	dst_buf = vdec_get_cap_buffer(ctx, vb2_v4l2_dst);
-	v4l2_m2m_buf_copy_metadata(vb2_v4l2_src, vb2_v4l2_dst, true);
-	ret = vdec_if_decode(ctx, bs_src, dst_buf, &res_chg);
+	ret = vdec_if_decode(ctx, bs_src, NULL, &res_chg);
 	if (ret) {
 		mtk_v4l2_err(" <===[%d], src_buf[%d] sz=0x%zx pts=%llu vdec_if_decode() ret=%d res_chg=%d===>",
 			     ctx->id, vb2_src->index, bs_src->size,
@@ -203,10 +230,17 @@ static void mtk_vdec_worker(struct work_struct *work)
 		}
 	}
 
-	v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx,
-					 ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
-
-	v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+	state = ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
+	if (!IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch) ||
+	    ctx->current_codec == V4L2_PIX_FMT_VP8_FRAME || ret) {
+		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, state);
+		if (src_buf_req)
+			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+	} else {
+		v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+		v4l2_m2m_buf_done(vb2_v4l2_src, state);
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+	}
 }
 
 static void vb2ops_vdec_stateless_buf_queue(struct vb2_buffer *vb)
@@ -336,6 +370,8 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.uses_stateless_api = true,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
+	.cap_to_disp = mtk_vdec_stateless_cap_to_disp,
+	.get_cap_buffer = vdec_get_cap_buffer,
 	.is_subdev_supported = false,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
 };
@@ -354,6 +390,8 @@ const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata = {
 	.uses_stateless_api = true,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
+	.cap_to_disp = mtk_vdec_stateless_cap_to_disp,
+	.get_cap_buffer = vdec_get_cap_buffer,
 	.is_subdev_supported = true,
 	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
 };
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
index 6d27e4d41ede..c06463142182 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
@@ -350,7 +350,8 @@ enum mtk_vdec_hw_arch {
  * @ctrls_setup: init vcodec dec ctrls
  * @worker: worker to start a decode job
  * @flush_decoder: function that flushes the decoder
- *
+ * @get_cap_buffer: get capture buffer from capture queue
+ * @cap_to_disp: put capture buffer to disp list for lat and core arch
  * @vdec_vb2_ops: struct vb2_ops
  *
  * @vdec_formats: supported video decoder formats
@@ -372,6 +373,9 @@ struct mtk_vcodec_dec_pdata {
 	int (*ctrls_setup)(struct mtk_vcodec_ctx *ctx);
 	void (*worker)(struct work_struct *work);
 	int (*flush_decoder)(struct mtk_vcodec_ctx *ctx);
+	struct vdec_fb *(*get_cap_buffer)(struct mtk_vcodec_ctx *ctx);
+	void (*cap_to_disp)(struct mtk_vcodec_ctx *ctx, int error,
+			    struct media_request *src_buf_req);
 
 	struct vb2_ops *vdec_vb2_ops;
 
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c
index 43542de11e9c..27119aa31dd9 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c
@@ -670,12 +670,15 @@ static void vdec_h264_slice_deinit(void *h_vdec)
 }
 
 static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
-				  struct vdec_fb *fb, bool *res_chg)
+				  struct vdec_fb *unused, bool *res_chg)
 {
 	struct vdec_h264_slice_inst *inst = h_vdec;
 	const struct v4l2_ctrl_h264_decode_params *dec_params =
 		get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_DECODE_PARAMS);
 	struct vdec_vpu_inst *vpu = &inst->vpu;
+	struct mtk_video_dec_buf *src_buf_info;
+	struct mtk_video_dec_buf *dst_buf_info;
+	struct vdec_fb *fb;
 	u32 data[2];
 	u64 y_fb_dma;
 	u64 c_fb_dma;
@@ -685,6 +688,10 @@ static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	if (!bs)
 		return vpu_dec_reset(vpu);
 
+	fb = inst->ctx->dev->vdec_pdata->get_cap_buffer(inst->ctx);
+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
+	dst_buf_info = container_of(fb, struct mtk_video_dec_buf, frame_buffer);
+
 	y_fb_dma = fb ? (u64)fb->base_y.dma_addr : 0;
 	c_fb_dma = fb ? (u64)fb->base_c.dma_addr : 0;
 
@@ -696,6 +703,8 @@ static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	inst->vsi_ctx.dec.c_fb_dma = c_fb_dma;
 	inst->vsi_ctx.dec.vdec_fb_va = (u64)(uintptr_t)fb;
 
+	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
+				   &dst_buf_info->m2m_buf.vb, true);
 	get_vdec_decode_parameters(inst);
 	data[0] = bs->size;
 	/*
diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
index b6ba66d3e026..c43d427f5f54 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
+++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
@@ -43,6 +43,7 @@ struct vdec_msg_queue_ctx {
  * @wdma_err_addr: wdma error address used for lat hardware
  * @slice_bc_addr: slice bc address used for lat hardware
  * @ts_info: need to set timestamp from output to capture
+ * @src_buf_req: output buffer media request object
  *
  * @private_data: shared information used to lat and core hardware
  * @ctx: mtk vcodec context information
@@ -54,6 +55,7 @@ struct vdec_lat_buf {
 	struct mtk_vcodec_mem wdma_err_addr;
 	struct mtk_vcodec_mem slice_bc_addr;
 	struct vb2_v4l2_buffer ts_info;
+	struct media_request *src_buf_req;
 
 	void *private_data;
 	struct mtk_vcodec_ctx *ctx;
-- 
2.18.0

