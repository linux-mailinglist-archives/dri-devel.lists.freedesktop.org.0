Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CACB44F952E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 14:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8464A10F0A8;
	Fri,  8 Apr 2022 12:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF5B8996F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 12:03:17 +0000 (UTC)
X-UUID: 0946a9423be143c79bb3f9e150dcd4f8-20220408
X-UUID: 0946a9423be143c79bb3f9e150dcd4f8-20220408
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1329586472; Fri, 08 Apr 2022 20:03:14 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 8 Apr 2022 20:03:11 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Apr 2022 20:03:10 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v9,
 15/17] media: mediatek: vcodec: support stateless VP8 decoding
Date: Fri, 8 Apr 2022 20:02:38 +0800
Message-ID: <20220408120240.29571-16-yunfei.dong@mediatek.com>
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

Add support for VP8 decoding using the stateless API,
as supported by MT8192.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../media/platform/mediatek/vcodec/Makefile   |   1 +
 .../vcodec/mtk_vcodec_dec_stateless.c         |  24 +-
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h |   1 +
 .../mediatek/vcodec/vdec/vdec_vp8_req_if.c    | 437 ++++++++++++++++++
 .../platform/mediatek/vcodec/vdec_drv_if.c    |   4 +
 .../platform/mediatek/vcodec/vdec_drv_if.h    |   1 +
 6 files changed, 466 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c

diff --git a/drivers/media/platform/mediatek/vcodec/Makefile b/drivers/media/platform/mediatek/vcodec/Makefile
index 22edb1c86598..b457daf2d196 100644
--- a/drivers/media/platform/mediatek/vcodec/Makefile
+++ b/drivers/media/platform/mediatek/vcodec/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) += mtk-vcodec-dec.o \
 
 mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
 		vdec/vdec_vp8_if.o \
+		vdec/vdec_vp8_req_if.o \
 		vdec/vdec_vp9_if.o \
 		vdec/vdec_h264_req_if.o \
 		vdec/vdec_h264_req_common.o \
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
index d5c69f94d28e..8517ed4efeb5 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
@@ -76,13 +76,28 @@ static const struct mtk_stateless_control mtk_stateless_controls[] = {
 			.max = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
 		},
 		.codec_type = V4L2_PIX_FMT_H264_SLICE,
+	},
+	{
+		.cfg = {
+			.id = V4L2_CID_STATELESS_VP8_FRAME,
+		},
+		.codec_type = V4L2_PIX_FMT_VP8_FRAME,
+	},
+	{
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_VP8_PROFILE,
+			.min = V4L2_MPEG_VIDEO_VP8_PROFILE_0,
+			.def = V4L2_MPEG_VIDEO_VP8_PROFILE_0,
+			.max = V4L2_MPEG_VIDEO_VP8_PROFILE_3,
+		},
+		.codec_type = V4L2_PIX_FMT_VP8_FRAME,
 	}
 };
 
 #define NUM_CTRLS ARRAY_SIZE(mtk_stateless_controls)
 
-static struct mtk_video_fmt mtk_video_formats[3];
-static struct mtk_codec_framesizes mtk_vdec_framesizes[1];
+static struct mtk_video_fmt mtk_video_formats[4];
+static struct mtk_codec_framesizes mtk_vdec_framesizes[2];
 
 static struct mtk_video_fmt default_out_format;
 static struct mtk_video_fmt default_cap_format;
@@ -322,6 +337,7 @@ static void mtk_vcodec_add_formats(unsigned int fourcc,
 
 	switch (fourcc) {
 	case V4L2_PIX_FMT_H264_SLICE:
+	case V4L2_PIX_FMT_VP8_FRAME:
 		mtk_video_formats[count_formats].fourcc = fourcc;
 		mtk_video_formats[count_formats].type = MTK_FMT_DEC;
 		mtk_video_formats[count_formats].num_planes = 1;
@@ -365,6 +381,10 @@ static void mtk_vcodec_get_supported_formats(struct mtk_vcodec_ctx *ctx)
 		mtk_vcodec_add_formats(V4L2_PIX_FMT_H264_SLICE, ctx);
 		out_format_count++;
 	}
+	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_VP8_FRAME) {
+		mtk_vcodec_add_formats(V4L2_PIX_FMT_VP8_FRAME, ctx);
+		out_format_count++;
+	}
 
 	if (cap_format_count)
 		default_cap_format = mtk_video_formats[cap_format_count - 1];
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
index c047f421843b..2ba1c19f07b6 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
@@ -354,6 +354,7 @@ enum mtk_vdec_format_types {
 	MTK_VDEC_FORMAT_MM21 = 0x20,
 	MTK_VDEC_FORMAT_MT21C = 0x40,
 	MTK_VDEC_FORMAT_H264_SLICE = 0x100,
+	MTK_VDEC_FORMAT_VP8_FRAME = 0x200,
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c
new file mode 100644
index 000000000000..eef102f3f4f3
--- /dev/null
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c
@@ -0,0 +1,437 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Yunfei Dong <yunfei.dong@mediatek.com>
+ */
+
+#include <linux/slab.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-dma-contig.h>
+#include <uapi/linux/v4l2-controls.h>
+
+#include "../mtk_vcodec_util.h"
+#include "../mtk_vcodec_dec.h"
+#include "../mtk_vcodec_intr.h"
+#include "../vdec_drv_base.h"
+#include "../vdec_drv_if.h"
+#include "../vdec_vpu_if.h"
+
+/* Decoding picture buffer size (3 reference frames plus current frame) */
+#define VP8_DPB_SIZE 4
+
+/* HW working buffer size (bytes) */
+#define VP8_SEG_ID_SZ   SZ_256K
+#define VP8_PP_WRAPY_SZ SZ_64K
+#define VP8_PP_WRAPC_SZ SZ_64K
+#define VP8_VLD_PRED_SZ SZ_64K
+
+/**
+ * struct vdec_vp8_slice_info - decode misc information
+ *
+ * @vld_wrapper_dma:	vld wrapper dma address
+ * @seg_id_buf_dma:	seg id dma address
+ * @wrap_y_dma:	wrap y dma address
+ * @wrap_c_dma:	wrap y dma address
+ * @cur_y_fb_dma:	current plane Y frame buffer dma address
+ * @cur_c_fb_dma:	current plane C frame buffer dma address
+ * @bs_dma:		bitstream dma address
+ * @bs_sz:		bitstream size
+ * @resolution_changed:resolution change flag 1 - changed,  0 - not change
+ * @frame_header_type:	current frame header type
+ * @wait_key_frame:	wait key frame coming
+ * @crc:		used to check whether hardware's status is right
+ * @reserved:		reserved, currently unused
+ */
+struct vdec_vp8_slice_info {
+	u64 vld_wrapper_dma;
+	u64 seg_id_buf_dma;
+	u64 wrap_y_dma;
+	u64 wrap_c_dma;
+	u64 cur_y_fb_dma;
+	u64 cur_c_fb_dma;
+	u64 bs_dma;
+	u32 bs_sz;
+	u32 resolution_changed;
+	u32 frame_header_type;
+	u32 crc[8];
+	u32 reserved;
+};
+
+/**
+ * struct vdec_vp8_slice_dpb_info  - vp8 reference information
+ *
+ * @y_dma_addr:	Y bitstream physical address
+ * @c_dma_addr:	CbCr bitstream physical address
+ * @reference_flag:	reference picture flag
+ * @reserved:		64bit align
+ */
+struct vdec_vp8_slice_dpb_info {
+	dma_addr_t y_dma_addr;
+	dma_addr_t c_dma_addr;
+	int reference_flag;
+	int reserved;
+};
+
+/**
+ * struct vdec_vp8_slice_vsi - VPU shared information
+ *
+ * @dec:		decoding information
+ * @pic:		picture information
+ * @vp8_dpb_info:	reference buffer information
+ */
+struct vdec_vp8_slice_vsi {
+	struct vdec_vp8_slice_info dec;
+	struct vdec_pic_info pic;
+	struct vdec_vp8_slice_dpb_info vp8_dpb_info[3];
+};
+
+/**
+ * struct vdec_vp8_slice_inst - VP8 decoder instance
+ *
+ * @seg_id_buf:	seg buffer
+ * @wrap_y_buf:	wrapper y buffer
+ * @wrap_c_buf:	wrapper c buffer
+ * @vld_wrapper_buf:	vld wrapper buffer
+ * @ctx:		V4L2 context
+ * @vpu:		VPU instance for decoder
+ * @vsi:		VPU share information
+ */
+struct vdec_vp8_slice_inst {
+	struct mtk_vcodec_mem seg_id_buf;
+	struct mtk_vcodec_mem wrap_y_buf;
+	struct mtk_vcodec_mem wrap_c_buf;
+	struct mtk_vcodec_mem vld_wrapper_buf;
+	struct mtk_vcodec_ctx *ctx;
+	struct vdec_vpu_inst vpu;
+	struct vdec_vp8_slice_vsi *vsi;
+};
+
+static void *vdec_vp8_slice_get_ctrl_ptr(struct mtk_vcodec_ctx *ctx, int id)
+{
+	struct v4l2_ctrl *ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl, id);
+
+	if (!ctrl)
+		return ERR_PTR(-EINVAL);
+
+	return ctrl->p_cur.p;
+}
+
+static void vdec_vp8_slice_get_pic_info(struct vdec_vp8_slice_inst *inst)
+{
+	struct mtk_vcodec_ctx *ctx = inst->ctx;
+	unsigned int data[3];
+
+	data[0] = ctx->picinfo.pic_w;
+	data[1] = ctx->picinfo.pic_h;
+	data[2] = ctx->capture_fourcc;
+	vpu_dec_get_param(&inst->vpu, data, 3, GET_PARAM_PIC_INFO);
+
+	ctx->picinfo.buf_w = ALIGN(ctx->picinfo.pic_w, 64);
+	ctx->picinfo.buf_h = ALIGN(ctx->picinfo.pic_h, 64);
+	ctx->picinfo.fb_sz[0] = inst->vpu.fb_sz[0];
+	ctx->picinfo.fb_sz[1] = inst->vpu.fb_sz[1];
+
+	inst->vsi->pic.pic_w = ctx->picinfo.pic_w;
+	inst->vsi->pic.pic_h = ctx->picinfo.pic_h;
+	inst->vsi->pic.buf_w = ctx->picinfo.buf_w;
+	inst->vsi->pic.buf_h = ctx->picinfo.buf_h;
+	inst->vsi->pic.fb_sz[0] = ctx->picinfo.fb_sz[0];
+	inst->vsi->pic.fb_sz[1] = ctx->picinfo.fb_sz[1];
+	mtk_vcodec_debug(inst, "pic(%d, %d), buf(%d, %d)",
+			 ctx->picinfo.pic_w, ctx->picinfo.pic_h,
+			 ctx->picinfo.buf_w, ctx->picinfo.buf_h);
+	mtk_vcodec_debug(inst, "fb size: Y(%d), C(%d)",
+			 ctx->picinfo.fb_sz[0], ctx->picinfo.fb_sz[1]);
+}
+
+static int vdec_vp8_slice_alloc_working_buf(struct vdec_vp8_slice_inst *inst)
+{
+	int err;
+	struct mtk_vcodec_mem *mem;
+
+	mem = &inst->seg_id_buf;
+	mem->size = VP8_SEG_ID_SZ;
+	err = mtk_vcodec_mem_alloc(inst->ctx, mem);
+	if (err) {
+		mtk_vcodec_err(inst, "Cannot allocate working buffer");
+		return err;
+	}
+	inst->vsi->dec.seg_id_buf_dma = (u64)mem->dma_addr;
+
+	mem = &inst->wrap_y_buf;
+	mem->size = VP8_PP_WRAPY_SZ;
+	err = mtk_vcodec_mem_alloc(inst->ctx, mem);
+	if (err) {
+		mtk_vcodec_err(inst, "cannot allocate WRAP Y buffer");
+		return err;
+	}
+	inst->vsi->dec.wrap_y_dma = (u64)mem->dma_addr;
+
+	mem = &inst->wrap_c_buf;
+	mem->size = VP8_PP_WRAPC_SZ;
+	err = mtk_vcodec_mem_alloc(inst->ctx, mem);
+	if (err) {
+		mtk_vcodec_err(inst, "cannot allocate WRAP C buffer");
+		return err;
+	}
+	inst->vsi->dec.wrap_c_dma = (u64)mem->dma_addr;
+
+	mem = &inst->vld_wrapper_buf;
+	mem->size = VP8_VLD_PRED_SZ;
+	err = mtk_vcodec_mem_alloc(inst->ctx, mem);
+	if (err) {
+		mtk_vcodec_err(inst, "cannot allocate vld wrapper buffer");
+		return err;
+	}
+	inst->vsi->dec.vld_wrapper_dma = (u64)mem->dma_addr;
+
+	return 0;
+}
+
+static void vdec_vp8_slice_free_working_buf(struct vdec_vp8_slice_inst *inst)
+{
+	struct mtk_vcodec_mem *mem;
+
+	mem = &inst->seg_id_buf;
+	if (mem->va)
+		mtk_vcodec_mem_free(inst->ctx, mem);
+	inst->vsi->dec.seg_id_buf_dma = 0;
+
+	mem = &inst->wrap_y_buf;
+	if (mem->va)
+		mtk_vcodec_mem_free(inst->ctx, mem);
+	inst->vsi->dec.wrap_y_dma = 0;
+
+	mem = &inst->wrap_c_buf;
+	if (mem->va)
+		mtk_vcodec_mem_free(inst->ctx, mem);
+	inst->vsi->dec.wrap_c_dma = 0;
+
+	mem = &inst->vld_wrapper_buf;
+	if (mem->va)
+		mtk_vcodec_mem_free(inst->ctx, mem);
+	inst->vsi->dec.vld_wrapper_dma = 0;
+}
+
+static u64 vdec_vp8_slice_get_ref_by_ts(const struct v4l2_ctrl_vp8_frame *frame_header,
+					int index)
+{
+	switch (index) {
+	case 0:
+		return frame_header->last_frame_ts;
+	case 1:
+		return frame_header->golden_frame_ts;
+	case 2:
+		return frame_header->alt_frame_ts;
+	default:
+		break;
+	}
+
+	return -1;
+}
+
+static int vdec_vp8_slice_get_decode_parameters(struct vdec_vp8_slice_inst *inst)
+{
+	const struct v4l2_ctrl_vp8_frame *frame_header;
+	struct mtk_vcodec_ctx *ctx = inst->ctx;
+	struct vb2_queue *vq;
+	struct vb2_buffer *vb;
+	u64 referenct_ts;
+	int index, vb2_index;
+
+	frame_header = vdec_vp8_slice_get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_VP8_FRAME);
+	if (IS_ERR(frame_header))
+		return PTR_ERR(frame_header);
+
+	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	for (index = 0; index < 3; index++) {
+		referenct_ts = vdec_vp8_slice_get_ref_by_ts(frame_header, index);
+		vb2_index = vb2_find_timestamp(vq, referenct_ts, 0);
+		if (vb2_index < 0) {
+			if (!V4L2_VP8_FRAME_IS_KEY_FRAME(frame_header))
+				mtk_vcodec_err(inst, "reference invalid: index(%d) ts(%lld)",
+					       index, referenct_ts);
+			inst->vsi->vp8_dpb_info[index].reference_flag = 0;
+			continue;
+		}
+		inst->vsi->vp8_dpb_info[index].reference_flag = 1;
+
+		vb = vq->bufs[vb2_index];
+		inst->vsi->vp8_dpb_info[index].y_dma_addr =
+			vb2_dma_contig_plane_dma_addr(vb, 0);
+		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
+			inst->vsi->vp8_dpb_info[index].c_dma_addr =
+				vb2_dma_contig_plane_dma_addr(vb, 1);
+		else
+			inst->vsi->vp8_dpb_info[index].c_dma_addr =
+				inst->vsi->vp8_dpb_info[index].y_dma_addr +
+				ctx->picinfo.fb_sz[0];
+	}
+
+	inst->vsi->dec.frame_header_type = frame_header->flags >> 1;
+
+	return 0;
+}
+
+static int vdec_vp8_slice_init(struct mtk_vcodec_ctx *ctx)
+{
+	struct vdec_vp8_slice_inst *inst;
+	int err;
+
+	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
+	if (!inst)
+		return -ENOMEM;
+
+	inst->ctx = ctx;
+
+	inst->vpu.id = SCP_IPI_VDEC_LAT;
+	inst->vpu.core_id = SCP_IPI_VDEC_CORE;
+	inst->vpu.ctx = ctx;
+	inst->vpu.codec_type = ctx->current_codec;
+	inst->vpu.capture_type = ctx->capture_fourcc;
+
+	err = vpu_dec_init(&inst->vpu);
+	if (err) {
+		mtk_vcodec_err(inst, "vdec_vp8 init err=%d", err);
+		goto error_free_inst;
+	}
+
+	inst->vsi = inst->vpu.vsi;
+	err = vdec_vp8_slice_alloc_working_buf(inst);
+	if (err)
+		goto error_deinit;
+
+	mtk_vcodec_debug(inst, "vp8 struct size = %d vsi: %d\n",
+			 (int)sizeof(struct v4l2_ctrl_vp8_frame),
+			 (int)sizeof(struct vdec_vp8_slice_vsi));
+	mtk_vcodec_debug(inst, "vp8:%p, codec_type = 0x%x vsi: 0x%p",
+			 inst, inst->vpu.codec_type, inst->vpu.vsi);
+
+	ctx->drv_handle = inst;
+	return 0;
+
+error_deinit:
+	vpu_dec_deinit(&inst->vpu);
+error_free_inst:
+	kfree(inst);
+	return err;
+}
+
+static int vdec_vp8_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
+				 struct vdec_fb *fb, bool *res_chg)
+{
+	struct vdec_vp8_slice_inst *inst = h_vdec;
+	struct vdec_vpu_inst *vpu = &inst->vpu;
+	struct mtk_video_dec_buf *src_buf_info, *dst_buf_info;
+	unsigned int data;
+	u64 y_fb_dma, c_fb_dma;
+	int err, timeout;
+
+	/* Resolution changes are never initiated by us */
+	*res_chg = false;
+
+	/* bs NULL means flush decoder */
+	if (!bs)
+		return vpu_dec_reset(vpu);
+
+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
+
+	fb = inst->ctx->dev->vdec_pdata->get_cap_buffer(inst->ctx);
+	dst_buf_info = container_of(fb, struct mtk_video_dec_buf, frame_buffer);
+
+	y_fb_dma = fb ? (u64)fb->base_y.dma_addr : 0;
+	if (inst->ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1)
+		c_fb_dma = y_fb_dma +
+			inst->ctx->picinfo.buf_w * inst->ctx->picinfo.buf_h;
+	else
+		c_fb_dma = fb ? (u64)fb->base_c.dma_addr : 0;
+
+	inst->vsi->dec.bs_dma = (u64)bs->dma_addr;
+	inst->vsi->dec.bs_sz = bs->size;
+	inst->vsi->dec.cur_y_fb_dma = y_fb_dma;
+	inst->vsi->dec.cur_c_fb_dma = c_fb_dma;
+
+	mtk_vcodec_debug(inst, "frame[%d] bs(%zu 0x%llx) y/c(0x%llx 0x%llx)",
+			 inst->ctx->decoded_frame_cnt,
+			 bs->size, (u64)bs->dma_addr,
+			 y_fb_dma, c_fb_dma);
+
+	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
+				   &dst_buf_info->m2m_buf.vb, true);
+
+	err = vdec_vp8_slice_get_decode_parameters(inst);
+	if (err)
+		goto error;
+
+	err = vpu_dec_start(vpu, &data, 1);
+	if (err) {
+		mtk_vcodec_debug(inst, "vp8 dec start err!");
+		goto error;
+	}
+
+	if (inst->vsi->dec.resolution_changed) {
+		mtk_vcodec_debug(inst, "- resolution_changed -");
+		*res_chg = true;
+		return 0;
+	}
+
+	/* wait decode done interrupt */
+	timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
+					       50, MTK_VDEC_CORE);
+
+	err = vpu_dec_end(vpu);
+	if (err || timeout)
+		mtk_vcodec_debug(inst, "vp8 dec error timeout:%d err: %d pic_%d",
+				 timeout, err, inst->ctx->decoded_frame_cnt);
+
+	mtk_vcodec_debug(inst, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
+			 inst->ctx->decoded_frame_cnt,
+			 inst->vsi->dec.crc[0], inst->vsi->dec.crc[1],
+			 inst->vsi->dec.crc[2], inst->vsi->dec.crc[3],
+			 inst->vsi->dec.crc[4], inst->vsi->dec.crc[5],
+			 inst->vsi->dec.crc[6], inst->vsi->dec.crc[7]);
+
+	inst->ctx->decoded_frame_cnt++;
+error:
+	return err;
+}
+
+static int vdec_vp8_slice_get_param(void *h_vdec, enum vdec_get_param_type type, void *out)
+{
+	struct vdec_vp8_slice_inst *inst = h_vdec;
+
+	switch (type) {
+	case GET_PARAM_PIC_INFO:
+		vdec_vp8_slice_get_pic_info(inst);
+		break;
+	case GET_PARAM_CROP_INFO:
+		mtk_vcodec_debug(inst, "No need to get vp8 crop information.");
+		break;
+	case GET_PARAM_DPB_SIZE:
+		*((unsigned int *)out) = VP8_DPB_SIZE;
+		break;
+	default:
+		mtk_vcodec_err(inst, "invalid get parameter type=%d", type);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void vdec_vp8_slice_deinit(void *h_vdec)
+{
+	struct vdec_vp8_slice_inst *inst = h_vdec;
+
+	mtk_vcodec_debug_enter(inst);
+
+	vpu_dec_deinit(&inst->vpu);
+	vdec_vp8_slice_free_working_buf(inst);
+	kfree(inst);
+}
+
+const struct vdec_common_if vdec_vp8_slice_if = {
+	.init		= vdec_vp8_slice_init,
+	.decode		= vdec_vp8_slice_decode,
+	.get_param	= vdec_vp8_slice_get_param,
+	.deinit		= vdec_vp8_slice_deinit,
+};
diff --git a/drivers/media/platform/mediatek/vcodec/vdec_drv_if.c b/drivers/media/platform/mediatek/vcodec/vdec_drv_if.c
index 75497c2e476f..b709c7bae197 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_drv_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec_drv_if.c
@@ -33,6 +33,10 @@ int vdec_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 		ctx->dec_if = &vdec_h264_if;
 		ctx->hw_id = MTK_VDEC_CORE;
 		break;
+	case V4L2_PIX_FMT_VP8_FRAME:
+		ctx->dec_if = &vdec_vp8_slice_if;
+		ctx->hw_id = MTK_VDEC_CORE;
+		break;
 	case V4L2_PIX_FMT_VP8:
 		ctx->dec_if = &vdec_vp8_if;
 		ctx->hw_id = MTK_VDEC_CORE;
diff --git a/drivers/media/platform/mediatek/vcodec/vdec_drv_if.h b/drivers/media/platform/mediatek/vcodec/vdec_drv_if.h
index f00980ee5abf..97f6e324e623 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_drv_if.h
+++ b/drivers/media/platform/mediatek/vcodec/vdec_drv_if.h
@@ -58,6 +58,7 @@ extern const struct vdec_common_if vdec_h264_if;
 extern const struct vdec_common_if vdec_h264_slice_if;
 extern const struct vdec_common_if vdec_h264_slice_multi_if;
 extern const struct vdec_common_if vdec_vp8_if;
+extern const struct vdec_common_if vdec_vp8_slice_if;
 extern const struct vdec_common_if vdec_vp9_if;
 
 /**
-- 
2.18.0

