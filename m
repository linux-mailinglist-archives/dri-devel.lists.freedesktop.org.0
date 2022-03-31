Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCCE4ED1E6
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 04:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D2B10F3C0;
	Thu, 31 Mar 2022 02:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E539310F3B0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 02:48:57 +0000 (UTC)
X-UUID: 6ae74eb15d7a40c8b95a2efc75530f6e-20220331
X-UUID: 6ae74eb15d7a40c8b95a2efc75530f6e-20220331
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1478201893; Thu, 31 Mar 2022 10:48:51 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 31 Mar 2022 10:48:48 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 31 Mar 2022 10:48:47 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v8, 13/17] media: mediatek: vcodec: Extract H264 common code
Date: Thu, 31 Mar 2022 10:47:57 +0800
Message-ID: <20220331024801.29229-14-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331024801.29229-1-yunfei.dong@mediatek.com>
References: <20220331024801.29229-1-yunfei.dong@mediatek.com>
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
 Steve Cho <stevecho@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mt8192 can use some of common code with mt8183. Moves them to
a new file in order to reuse.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../media/platform/mediatek/vcodec/Makefile   |   1 +
 .../vcodec/vdec/vdec_h264_req_common.c        | 310 +++++++++++++
 .../vcodec/vdec/vdec_h264_req_common.h        | 272 +++++++++++
 .../mediatek/vcodec/vdec/vdec_h264_req_if.c   | 427 ++----------------
 4 files changed, 627 insertions(+), 383 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.h

diff --git a/drivers/media/platform/mediatek/vcodec/Makefile b/drivers/media/platform/mediatek/vcodec/Makefile
index 359619653a0e..3f41d748eee5 100644
--- a/drivers/media/platform/mediatek/vcodec/Makefile
+++ b/drivers/media/platform/mediatek/vcodec/Makefile
@@ -9,6 +9,7 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
 		vdec/vdec_vp8_if.o \
 		vdec/vdec_vp9_if.o \
 		vdec/vdec_h264_req_if.o \
+		vdec/vdec_h264_req_common.o \
 		mtk_vcodec_dec_drv.o \
 		vdec_drv_if.o \
 		vdec_vpu_if.o \
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.c
new file mode 100644
index 000000000000..46b258e3ea64
--- /dev/null
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.c
@@ -0,0 +1,310 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Yunfei Dong <yunfei.dong@mediatek.com>
+ */
+
+#include "vdec_h264_req_common.h"
+
+/* get used parameters for sps/pps */
+#define GET_MTK_VDEC_FLAG(cond, flag) \
+	{ dst_param->cond = ((src_param->flags & flag) ? (1) : (0)); }
+#define GET_MTK_VDEC_PARAM(param) \
+	{ dst_param->param = src_param->param; }
+
+/*
+ * The firmware expects unused reflist entries to have the value 0x20.
+ */
+void mtk_vdec_h264_fixup_ref_list(u8 *ref_list, size_t num_valid)
+{
+	memset_io(&ref_list[num_valid], 0x20, 32 - num_valid);
+}
+
+void *mtk_vdec_h264_get_ctrl_ptr(struct mtk_vcodec_ctx *ctx, int id)
+{
+	struct v4l2_ctrl *ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl, id);
+
+	if (!ctrl)
+		return ERR_PTR(-EINVAL);
+
+	return ctrl->p_cur.p;
+}
+
+void mtk_vdec_h264_fill_dpb_info(struct mtk_vcodec_ctx *ctx,
+				 struct slice_api_h264_decode_param *decode_params,
+				 struct mtk_h264_dpb_info *h264_dpb_info)
+{
+	const struct slice_h264_dpb_entry *dpb;
+	struct vb2_queue *vq;
+	struct vb2_buffer *vb;
+	struct vb2_v4l2_buffer *vb2_v4l2;
+	int index, vb2_index;
+
+	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+
+	for (index = 0; index < V4L2_H264_NUM_DPB_ENTRIES; index++) {
+		dpb = &decode_params->dpb[index];
+		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)) {
+			h264_dpb_info[index].reference_flag = 0;
+			continue;
+		}
+
+		vb2_index = vb2_find_timestamp(vq, dpb->reference_ts, 0);
+		if (vb2_index < 0) {
+			dev_err(&ctx->dev->plat_dev->dev,
+				"Reference invalid: dpb_index(%d) reference_ts(%lld)",
+				index, dpb->reference_ts);
+			continue;
+		}
+
+		/* 1 for short term reference, 2 for long term reference */
+		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM))
+			h264_dpb_info[index].reference_flag = 1;
+		else
+			h264_dpb_info[index].reference_flag = 2;
+
+		vb = vq->bufs[vb2_index];
+		vb2_v4l2 = container_of(vb, struct vb2_v4l2_buffer, vb2_buf);
+		h264_dpb_info[index].field = vb2_v4l2->field;
+
+		h264_dpb_info[index].y_dma_addr =
+			vb2_dma_contig_plane_dma_addr(vb, 0);
+		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
+			h264_dpb_info[index].c_dma_addr =
+				vb2_dma_contig_plane_dma_addr(vb, 1);
+		else
+			h264_dpb_info[index].c_dma_addr =
+				h264_dpb_info[index].y_dma_addr +
+				ctx->picinfo.fb_sz[0];
+	}
+}
+
+void mtk_vdec_h264_copy_sps_params(struct mtk_h264_sps_param *dst_param,
+				   const struct v4l2_ctrl_h264_sps *src_param)
+{
+	GET_MTK_VDEC_PARAM(chroma_format_idc);
+	GET_MTK_VDEC_PARAM(bit_depth_luma_minus8);
+	GET_MTK_VDEC_PARAM(bit_depth_chroma_minus8);
+	GET_MTK_VDEC_PARAM(log2_max_frame_num_minus4);
+	GET_MTK_VDEC_PARAM(pic_order_cnt_type);
+	GET_MTK_VDEC_PARAM(log2_max_pic_order_cnt_lsb_minus4);
+	GET_MTK_VDEC_PARAM(max_num_ref_frames);
+	GET_MTK_VDEC_PARAM(pic_width_in_mbs_minus1);
+	GET_MTK_VDEC_PARAM(pic_height_in_map_units_minus1);
+
+	GET_MTK_VDEC_FLAG(separate_colour_plane_flag,
+			  V4L2_H264_SPS_FLAG_SEPARATE_COLOUR_PLANE);
+	GET_MTK_VDEC_FLAG(qpprime_y_zero_transform_bypass_flag,
+			  V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS);
+	GET_MTK_VDEC_FLAG(delta_pic_order_always_zero_flag,
+			  V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO);
+	GET_MTK_VDEC_FLAG(frame_mbs_only_flag,
+			  V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY);
+	GET_MTK_VDEC_FLAG(mb_adaptive_frame_field_flag,
+			  V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD);
+	GET_MTK_VDEC_FLAG(direct_8x8_inference_flag,
+			  V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE);
+}
+
+void mtk_vdec_h264_copy_pps_params(struct mtk_h264_pps_param *dst_param,
+				   const struct v4l2_ctrl_h264_pps *src_param)
+{
+	GET_MTK_VDEC_PARAM(num_ref_idx_l0_default_active_minus1);
+	GET_MTK_VDEC_PARAM(num_ref_idx_l1_default_active_minus1);
+	GET_MTK_VDEC_PARAM(weighted_bipred_idc);
+	GET_MTK_VDEC_PARAM(pic_init_qp_minus26);
+	GET_MTK_VDEC_PARAM(chroma_qp_index_offset);
+	GET_MTK_VDEC_PARAM(second_chroma_qp_index_offset);
+
+	GET_MTK_VDEC_FLAG(entropy_coding_mode_flag,
+			  V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE);
+	GET_MTK_VDEC_FLAG(pic_order_present_flag,
+			  V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT);
+	GET_MTK_VDEC_FLAG(weighted_pred_flag,
+			  V4L2_H264_PPS_FLAG_WEIGHTED_PRED);
+	GET_MTK_VDEC_FLAG(deblocking_filter_control_present_flag,
+			  V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT);
+	GET_MTK_VDEC_FLAG(constrained_intra_pred_flag,
+			  V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED);
+	GET_MTK_VDEC_FLAG(redundant_pic_cnt_present_flag,
+			  V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT);
+	GET_MTK_VDEC_FLAG(transform_8x8_mode_flag,
+			  V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE);
+	GET_MTK_VDEC_FLAG(scaling_matrix_present_flag,
+			  V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT);
+}
+
+void mtk_vdec_h264_copy_slice_hd_params(struct mtk_h264_slice_hd_param *dst_param,
+					const struct v4l2_ctrl_h264_slice_params *src_param,
+					const struct v4l2_ctrl_h264_decode_params *dec_param)
+{
+	int temp;
+
+	GET_MTK_VDEC_PARAM(first_mb_in_slice);
+	GET_MTK_VDEC_PARAM(slice_type);
+	GET_MTK_VDEC_PARAM(cabac_init_idc);
+	GET_MTK_VDEC_PARAM(slice_qp_delta);
+	GET_MTK_VDEC_PARAM(disable_deblocking_filter_idc);
+	GET_MTK_VDEC_PARAM(slice_alpha_c0_offset_div2);
+	GET_MTK_VDEC_PARAM(slice_beta_offset_div2);
+	GET_MTK_VDEC_PARAM(num_ref_idx_l0_active_minus1);
+	GET_MTK_VDEC_PARAM(num_ref_idx_l1_active_minus1);
+
+	dst_param->frame_num = dec_param->frame_num;
+	dst_param->pic_order_cnt_lsb = dec_param->pic_order_cnt_lsb;
+
+	dst_param->delta_pic_order_cnt_bottom =
+		dec_param->delta_pic_order_cnt_bottom;
+	dst_param->delta_pic_order_cnt0 =
+		dec_param->delta_pic_order_cnt0;
+	dst_param->delta_pic_order_cnt1 =
+		dec_param->delta_pic_order_cnt1;
+
+	temp = dec_param->flags & V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC;
+	dst_param->field_pic_flag = temp ? 1 : 0;
+
+	temp = dec_param->flags & V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD;
+	dst_param->bottom_field_flag = temp ? 1 : 0;
+
+	GET_MTK_VDEC_FLAG(direct_spatial_mv_pred_flag,
+			  V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED);
+}
+
+void mtk_vdec_h264_copy_scaling_matrix(struct slice_api_h264_scaling_matrix *dst_matrix,
+				       const struct v4l2_ctrl_h264_scaling_matrix *src_matrix)
+{
+	memcpy_toio(dst_matrix->scaling_list_4x4, src_matrix->scaling_list_4x4,
+		    sizeof(dst_matrix->scaling_list_4x4));
+
+	memcpy_toio(dst_matrix->scaling_list_8x8, src_matrix->scaling_list_8x8,
+		    sizeof(dst_matrix->scaling_list_8x8));
+}
+
+void
+mtk_vdec_h264_copy_decode_params(struct slice_api_h264_decode_param *dst_params,
+				 const struct v4l2_ctrl_h264_decode_params *src_params,
+				 const struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES])
+{
+	struct slice_h264_dpb_entry *dst_entry;
+	const struct v4l2_h264_dpb_entry *src_entry;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dst_params->dpb); i++) {
+		dst_entry = &dst_params->dpb[i];
+		src_entry = &dpb[i];
+
+		dst_entry->reference_ts = src_entry->reference_ts;
+		dst_entry->frame_num = src_entry->frame_num;
+		dst_entry->pic_num = src_entry->pic_num;
+		dst_entry->top_field_order_cnt = src_entry->top_field_order_cnt;
+		dst_entry->bottom_field_order_cnt =
+			src_entry->bottom_field_order_cnt;
+		dst_entry->flags = src_entry->flags;
+	}
+
+	/* num_slices is a leftover from the old H.264 support and is ignored
+	 * by the firmware.
+	 */
+	dst_params->num_slices = 0;
+	dst_params->nal_ref_idc = src_params->nal_ref_idc;
+	dst_params->top_field_order_cnt = src_params->top_field_order_cnt;
+	dst_params->bottom_field_order_cnt = src_params->bottom_field_order_cnt;
+	dst_params->flags = src_params->flags;
+}
+
+static bool mtk_vdec_h264_dpb_entry_match(const struct v4l2_h264_dpb_entry *a,
+					  const struct v4l2_h264_dpb_entry *b)
+{
+	return a->top_field_order_cnt == b->top_field_order_cnt &&
+	       a->bottom_field_order_cnt == b->bottom_field_order_cnt;
+}
+
+/*
+ * Move DPB entries of dec_param that refer to a frame already existing in dpb
+ * into the already existing slot in dpb, and move other entries into new slots.
+ *
+ * This function is an adaptation of the similarly-named function in
+ * hantro_h264.c.
+ */
+void mtk_vdec_h264_update_dpb(const struct v4l2_ctrl_h264_decode_params *dec_param,
+			      struct v4l2_h264_dpb_entry *dpb)
+{
+	DECLARE_BITMAP(new, ARRAY_SIZE(dec_param->dpb)) = { 0, };
+	DECLARE_BITMAP(in_use, ARRAY_SIZE(dec_param->dpb)) = { 0, };
+	DECLARE_BITMAP(used, ARRAY_SIZE(dec_param->dpb)) = { 0, };
+	unsigned int i, j;
+
+	/* Disable all entries by default, and mark the ones in use. */
+	for (i = 0; i < ARRAY_SIZE(dec_param->dpb); i++) {
+		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)
+			set_bit(i, in_use);
+		dpb[i].flags &= ~V4L2_H264_DPB_ENTRY_FLAG_ACTIVE;
+	}
+
+	/* Try to match new DPB entries with existing ones by their POCs. */
+	for (i = 0; i < ARRAY_SIZE(dec_param->dpb); i++) {
+		const struct v4l2_h264_dpb_entry *ndpb = &dec_param->dpb[i];
+
+		if (!(ndpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
+			continue;
+
+		/*
+		 * To cut off some comparisons, iterate only on target DPB
+		 * entries were already used.
+		 */
+		for_each_set_bit(j, in_use, ARRAY_SIZE(dec_param->dpb)) {
+			struct v4l2_h264_dpb_entry *cdpb;
+
+			cdpb = &dpb[j];
+			if (!mtk_vdec_h264_dpb_entry_match(cdpb, ndpb))
+				continue;
+
+			*cdpb = *ndpb;
+			set_bit(j, used);
+			/* Don't reiterate on this one. */
+			clear_bit(j, in_use);
+			break;
+		}
+
+		if (j == ARRAY_SIZE(dec_param->dpb))
+			set_bit(i, new);
+	}
+
+	/* For entries that could not be matched, use remaining free slots. */
+	for_each_set_bit(i, new, ARRAY_SIZE(dec_param->dpb)) {
+		const struct v4l2_h264_dpb_entry *ndpb = &dec_param->dpb[i];
+		struct v4l2_h264_dpb_entry *cdpb;
+
+		/*
+		 * Both arrays are of the same sizes, so there is no way
+		 * we can end up with no space in target array, unless
+		 * something is buggy.
+		 */
+		j = find_first_zero_bit(used, ARRAY_SIZE(dec_param->dpb));
+		if (WARN_ON(j >= ARRAY_SIZE(dec_param->dpb)))
+			return;
+
+		cdpb = &dpb[j];
+		*cdpb = *ndpb;
+		set_bit(j, used);
+	}
+}
+
+unsigned int mtk_vdec_h264_get_mv_buf_size(unsigned int width, unsigned int height)
+{
+	int unit_size = (width / MB_UNIT_LEN) * (height / MB_UNIT_LEN) + 8;
+
+	return HW_MB_STORE_SZ * unit_size;
+}
+
+int mtk_vdec_h264_find_start_code(unsigned char *data, unsigned int data_sz)
+{
+	if (data_sz > 3 && data[0] == 0 && data[1] == 0 && data[2] == 1)
+		return 3;
+
+	if (data_sz > 4 && data[0] == 0 && data[1] == 0 && data[2] == 0 &&
+	    data[3] == 1)
+		return 4;
+
+	return -1;
+}
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.h b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.h
new file mode 100644
index 000000000000..fefeb4fe583f
--- /dev/null
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.h
@@ -0,0 +1,272 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Yunfei Dong <yunfei.dong@mediatek.com>
+ */
+
+#ifndef _VDEC_H264_REQ_COMMON_H_
+#define _VDEC_H264_REQ_COMMON_H_
+
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <media/v4l2-h264.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "../mtk_vcodec_drv.h"
+
+#define NAL_NON_IDR_SLICE			0x01
+#define NAL_IDR_SLICE				0x05
+#define NAL_TYPE(value)				((value) & 0x1F)
+
+#define BUF_PREDICTION_SZ			(64 * 4096)
+#define MB_UNIT_LEN				16
+
+/* motion vector size (bytes) for every macro block */
+#define HW_MB_STORE_SZ				64
+
+#define H264_MAX_MV_NUM				32
+
+/**
+ * struct mtk_h264_dpb_info  - h264 dpb information
+ *
+ * @y_dma_addr:	Y bitstream physical address
+ * @c_dma_addr:	CbCr bitstream physical address
+ * @reference_flag:	reference picture flag (short/long term reference picture)
+ * @field:		field picture flag
+ */
+struct mtk_h264_dpb_info {
+	dma_addr_t y_dma_addr;
+	dma_addr_t c_dma_addr;
+	int reference_flag;
+	int field;
+};
+
+/*
+ * struct mtk_h264_sps_param  - parameters for sps
+ */
+struct mtk_h264_sps_param {
+	unsigned char chroma_format_idc;
+	unsigned char bit_depth_luma_minus8;
+	unsigned char bit_depth_chroma_minus8;
+	unsigned char log2_max_frame_num_minus4;
+	unsigned char pic_order_cnt_type;
+	unsigned char log2_max_pic_order_cnt_lsb_minus4;
+	unsigned char max_num_ref_frames;
+	unsigned char separate_colour_plane_flag;
+	unsigned short pic_width_in_mbs_minus1;
+	unsigned short pic_height_in_map_units_minus1;
+	unsigned int max_frame_nums;
+	unsigned char qpprime_y_zero_transform_bypass_flag;
+	unsigned char delta_pic_order_always_zero_flag;
+	unsigned char frame_mbs_only_flag;
+	unsigned char mb_adaptive_frame_field_flag;
+	unsigned char direct_8x8_inference_flag;
+	unsigned char reserved[3];
+};
+
+/*
+ * struct mtk_h264_pps_param  - parameters for pps
+ */
+struct mtk_h264_pps_param {
+	unsigned char num_ref_idx_l0_default_active_minus1;
+	unsigned char num_ref_idx_l1_default_active_minus1;
+	unsigned char weighted_bipred_idc;
+	char pic_init_qp_minus26;
+	char chroma_qp_index_offset;
+	char second_chroma_qp_index_offset;
+	unsigned char entropy_coding_mode_flag;
+	unsigned char pic_order_present_flag;
+	unsigned char deblocking_filter_control_present_flag;
+	unsigned char constrained_intra_pred_flag;
+	unsigned char weighted_pred_flag;
+	unsigned char redundant_pic_cnt_present_flag;
+	unsigned char transform_8x8_mode_flag;
+	unsigned char scaling_matrix_present_flag;
+	unsigned char reserved[2];
+};
+
+/*
+ * struct mtk_h264_slice_hd_param  - parameters for slice header
+ */
+struct mtk_h264_slice_hd_param {
+	unsigned int first_mb_in_slice;
+	unsigned int field_pic_flag;
+	unsigned int slice_type;
+	unsigned int frame_num;
+	int pic_order_cnt_lsb;
+	int delta_pic_order_cnt_bottom;
+	unsigned int bottom_field_flag;
+	unsigned int direct_spatial_mv_pred_flag;
+	int delta_pic_order_cnt0;
+	int delta_pic_order_cnt1;
+	unsigned int cabac_init_idc;
+	int slice_qp_delta;
+	unsigned int disable_deblocking_filter_idc;
+	int slice_alpha_c0_offset_div2;
+	int slice_beta_offset_div2;
+	unsigned int num_ref_idx_l0_active_minus1;
+	unsigned int num_ref_idx_l1_active_minus1;
+	unsigned int reserved;
+};
+
+/*
+ * struct slice_api_h264_scaling_matrix  - parameters for scaling list
+ */
+struct slice_api_h264_scaling_matrix {
+	unsigned char scaling_list_4x4[6][16];
+	unsigned char scaling_list_8x8[6][64];
+};
+
+/*
+ * struct slice_h264_dpb_entry  - each dpb information
+ */
+struct slice_h264_dpb_entry {
+	unsigned long long reference_ts;
+	unsigned short frame_num;
+	unsigned short pic_num;
+	/* Note that field is indicated by v4l2_buffer.field */
+	int top_field_order_cnt;
+	int bottom_field_order_cnt;
+	unsigned int flags;
+};
+
+/*
+ * struct slice_api_h264_decode_param - parameters for decode.
+ */
+struct slice_api_h264_decode_param {
+	struct slice_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES];
+	unsigned short num_slices;
+	unsigned short nal_ref_idc;
+	unsigned char ref_pic_list_p0[32];
+	unsigned char ref_pic_list_b0[32];
+	unsigned char ref_pic_list_b1[32];
+	int top_field_order_cnt;
+	int bottom_field_order_cnt;
+	unsigned int flags;
+};
+
+/**
+ * struct h264_fb - h264 decode frame buffer information
+ *
+ * @vdec_fb_va:	virtual address of struct vdec_fb
+ * @y_fb_dma:		dma address of Y frame buffer (luma)
+ * @c_fb_dma:		dma address of C frame buffer (chroma)
+ * @poc:		picture order count of frame buffer
+ * @reserved:		for 8 bytes alignment
+ */
+struct h264_fb {
+	u64 vdec_fb_va;
+	u64 y_fb_dma;
+	u64 c_fb_dma;
+	s32 poc;
+	u32 reserved;
+};
+
+/**
+ * mtk_vdec_h264_fixup_ref_list - fixup unused reference to 0x20.
+ *
+ * @ref_list:	reference picture list
+ * @num_valid:	used reference number
+ */
+void mtk_vdec_h264_fixup_ref_list(u8 *ref_list, size_t num_valid);
+
+/**
+ * mtk_vdec_h264_get_ctrl_ptr - get each CID contrl address.
+ *
+ * @ctx:	v4l2 ctx
+ * @id:	CID control ID
+ */
+void *mtk_vdec_h264_get_ctrl_ptr(struct mtk_vcodec_ctx *ctx, int id);
+
+/**
+ * mtk_vdec_h264_fill_dpb_info - get each CID contrl address.
+ *
+ * @ctx:		v4l2 ctx
+ * @decode_params:	slice decode params
+ * @h264_dpb_info:	dpb buffer information
+ */
+void mtk_vdec_h264_fill_dpb_info(struct mtk_vcodec_ctx *ctx,
+				 struct slice_api_h264_decode_param *decode_params,
+				 struct mtk_h264_dpb_info *h264_dpb_info);
+
+/**
+ * mtk_vdec_h264_copy_sps_params - get sps params.
+ *
+ * @dst_params:	sps params for hw decoder
+ * @src_params:	sps params from user driver
+ */
+void mtk_vdec_h264_copy_sps_params(struct mtk_h264_sps_param *dst_param,
+				   const struct v4l2_ctrl_h264_sps *src_param);
+
+/**
+ * mtk_vdec_h264_copy_pps_params - get pps params.
+ *
+ * @dst_params:	pps params for hw decoder
+ * @src_params:	pps params from user driver
+ */
+void mtk_vdec_h264_copy_pps_params(struct mtk_h264_pps_param *dst_param,
+				   const struct v4l2_ctrl_h264_pps *src_param);
+
+/**
+ * mtk_vdec_h264_copy_slice_hd_params - get slice header params.
+ *
+ * @dst_params:	slice params for hw decoder
+ * @src_params:	slice params from user driver
+ * @dec_param:		decode params from user driver
+ */
+void mtk_vdec_h264_copy_slice_hd_params(struct mtk_h264_slice_hd_param *dst_param,
+					const struct v4l2_ctrl_h264_slice_params *src_param,
+					const struct v4l2_ctrl_h264_decode_params *dec_param);
+
+/**
+ * mtk_vdec_h264_copy_scaling_matrix - get each CID contrl address.
+ *
+ * @dst_matrix:	scaling list params for hw decoder
+ * @src_matrix:	scaling list params from user driver
+ */
+void mtk_vdec_h264_copy_scaling_matrix(struct slice_api_h264_scaling_matrix *dst_matrix,
+				       const struct v4l2_ctrl_h264_scaling_matrix *src_matrix);
+
+/**
+ * mtk_vdec_h264_copy_decode_params - get decode params.
+ *
+ * @dst_params:	dst params for hw decoder
+ * @src_params:	decode params from user driver
+ * @dpb:		dpb information
+ */
+void
+mtk_vdec_h264_copy_decode_params(struct slice_api_h264_decode_param *dst_params,
+				 const struct v4l2_ctrl_h264_decode_params *src_params,
+				 const struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES]);
+
+/**
+ * mtk_vdec_h264_update_dpb - updata dpb list.
+ *
+ * @dec_param:	v4l2 control decode params
+ * @dpb:	dpb entry informaton
+ */
+void mtk_vdec_h264_update_dpb(const struct v4l2_ctrl_h264_decode_params *dec_param,
+			      struct v4l2_h264_dpb_entry *dpb);
+
+/**
+ * mtk_vdec_h264_find_start_code - find h264 start code using sofeware.
+ *
+ * @data:	input buffer address
+ * @data_sz:	input buffer size
+ *
+ * Return: returns start code position.
+ */
+int mtk_vdec_h264_find_start_code(unsigned char *data, unsigned int data_sz);
+
+/**
+ * mtk_vdec_h264_get_mv_buf_size - get mv buffer size.
+ *
+ * @width:	picture width
+ * @height:	picture height
+ *
+ * Return: returns mv buffer size.
+ */
+unsigned int mtk_vdec_h264_get_mv_buf_size(unsigned int width, unsigned int height);
+
+#endif
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c
index 27119aa31dd9..b055ceea481d 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c
@@ -12,109 +12,7 @@
 #include "../vdec_drv_base.h"
 #include "../vdec_drv_if.h"
 #include "../vdec_vpu_if.h"
-
-#define BUF_PREDICTION_SZ			(64 * 4096)
-#define MB_UNIT_LEN				16
-
-/* get used parameters for sps/pps */
-#define GET_MTK_VDEC_FLAG(cond, flag) \
-	{ dst_param->cond = ((src_param->flags & (flag)) ? (1) : (0)); }
-#define GET_MTK_VDEC_PARAM(param) \
-	{ dst_param->param = src_param->param; }
-/* motion vector size (bytes) for every macro block */
-#define HW_MB_STORE_SZ				64
-
-#define H264_MAX_FB_NUM				17
-#define H264_MAX_MV_NUM				32
-#define HDR_PARSING_BUF_SZ			1024
-
-/**
- * struct mtk_h264_dpb_info  - h264 dpb information
- * @y_dma_addr: Y bitstream physical address
- * @c_dma_addr: CbCr bitstream physical address
- * @reference_flag: reference picture flag (short/long term reference picture)
- * @field: field picture flag
- */
-struct mtk_h264_dpb_info {
-	dma_addr_t y_dma_addr;
-	dma_addr_t c_dma_addr;
-	int reference_flag;
-	int field;
-};
-
-/*
- * struct mtk_h264_sps_param  - parameters for sps
- */
-struct mtk_h264_sps_param {
-	unsigned char chroma_format_idc;
-	unsigned char bit_depth_luma_minus8;
-	unsigned char bit_depth_chroma_minus8;
-	unsigned char log2_max_frame_num_minus4;
-	unsigned char pic_order_cnt_type;
-	unsigned char log2_max_pic_order_cnt_lsb_minus4;
-	unsigned char max_num_ref_frames;
-	unsigned char separate_colour_plane_flag;
-	unsigned short pic_width_in_mbs_minus1;
-	unsigned short pic_height_in_map_units_minus1;
-	unsigned int max_frame_nums;
-	unsigned char qpprime_y_zero_transform_bypass_flag;
-	unsigned char delta_pic_order_always_zero_flag;
-	unsigned char frame_mbs_only_flag;
-	unsigned char mb_adaptive_frame_field_flag;
-	unsigned char direct_8x8_inference_flag;
-	unsigned char reserved[3];
-};
-
-/*
- * struct mtk_h264_pps_param  - parameters for pps
- */
-struct mtk_h264_pps_param {
-	unsigned char num_ref_idx_l0_default_active_minus1;
-	unsigned char num_ref_idx_l1_default_active_minus1;
-	unsigned char weighted_bipred_idc;
-	char pic_init_qp_minus26;
-	char chroma_qp_index_offset;
-	char second_chroma_qp_index_offset;
-	unsigned char entropy_coding_mode_flag;
-	unsigned char pic_order_present_flag;
-	unsigned char deblocking_filter_control_present_flag;
-	unsigned char constrained_intra_pred_flag;
-	unsigned char weighted_pred_flag;
-	unsigned char redundant_pic_cnt_present_flag;
-	unsigned char transform_8x8_mode_flag;
-	unsigned char scaling_matrix_present_flag;
-	unsigned char reserved[2];
-};
-
-struct slice_api_h264_scaling_matrix {
-	unsigned char scaling_list_4x4[6][16];
-	unsigned char scaling_list_8x8[6][64];
-};
-
-struct slice_h264_dpb_entry {
-	unsigned long long reference_ts;
-	unsigned short frame_num;
-	unsigned short pic_num;
-	/* Note that field is indicated by v4l2_buffer.field */
-	int top_field_order_cnt;
-	int bottom_field_order_cnt;
-	unsigned int flags; /* V4L2_H264_DPB_ENTRY_FLAG_* */
-};
-
-/*
- * struct slice_api_h264_decode_param - parameters for decode.
- */
-struct slice_api_h264_decode_param {
-	struct slice_h264_dpb_entry dpb[16];
-	unsigned short num_slices;
-	unsigned short nal_ref_idc;
-	unsigned char ref_pic_list_p0[32];
-	unsigned char ref_pic_list_b0[32];
-	unsigned char ref_pic_list_b1[32];
-	int top_field_order_cnt;
-	int bottom_field_order_cnt;
-	unsigned int flags; /* V4L2_H264_DECODE_PARAM_FLAG_* */
-};
+#include "vdec_h264_req_common.h"
 
 /*
  * struct mtk_h264_dec_slice_param  - parameters for decode current frame
@@ -127,22 +25,6 @@ struct mtk_h264_dec_slice_param {
 	struct mtk_h264_dpb_info h264_dpb_info[16];
 };
 
-/**
- * struct h264_fb - h264 decode frame buffer information
- * @vdec_fb_va  : virtual address of struct vdec_fb
- * @y_fb_dma    : dma address of Y frame buffer (luma)
- * @c_fb_dma    : dma address of C frame buffer (chroma)
- * @poc         : picture order count of frame buffer
- * @reserved    : for 8 bytes alignment
- */
-struct h264_fb {
-	u64 vdec_fb_va;
-	u64 y_fb_dma;
-	u64 c_fb_dma;
-	s32 poc;
-	u32 reserved;
-};
-
 /**
  * struct vdec_h264_dec_info - decode information
  * @dpb_sz		: decoding picture buffer size
@@ -212,265 +94,45 @@ struct vdec_h264_slice_inst {
 	struct v4l2_h264_dpb_entry dpb[16];
 };
 
-static void *get_ctrl_ptr(struct mtk_vcodec_ctx *ctx, int id)
-{
-	struct v4l2_ctrl *ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl, id);
-
-	return ctrl->p_cur.p;
-}
-
-static void get_h264_dpb_list(struct vdec_h264_slice_inst *inst,
-			      struct mtk_h264_dec_slice_param *slice_param)
-{
-	struct vb2_queue *vq;
-	struct vb2_buffer *vb;
-	struct vb2_v4l2_buffer *vb2_v4l2;
-	u64 index;
-
-	vq = v4l2_m2m_get_vq(inst->ctx->m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
-
-	for (index = 0; index < ARRAY_SIZE(slice_param->decode_params.dpb); index++) {
-		const struct slice_h264_dpb_entry *dpb;
-		int vb2_index;
-
-		dpb = &slice_param->decode_params.dpb[index];
-		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)) {
-			slice_param->h264_dpb_info[index].reference_flag = 0;
-			continue;
-		}
-
-		vb2_index = vb2_find_timestamp(vq, dpb->reference_ts, 0);
-		if (vb2_index < 0) {
-			mtk_vcodec_err(inst, "Reference invalid: dpb_index(%lld) reference_ts(%lld)",
-				       index, dpb->reference_ts);
-			continue;
-		}
-		/* 1 for short term reference, 2 for long term reference */
-		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM))
-			slice_param->h264_dpb_info[index].reference_flag = 1;
-		else
-			slice_param->h264_dpb_info[index].reference_flag = 2;
-
-		vb = vq->bufs[vb2_index];
-		vb2_v4l2 = container_of(vb, struct vb2_v4l2_buffer, vb2_buf);
-		slice_param->h264_dpb_info[index].field = vb2_v4l2->field;
-
-		slice_param->h264_dpb_info[index].y_dma_addr =
-			vb2_dma_contig_plane_dma_addr(vb, 0);
-		if (inst->ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2) {
-			slice_param->h264_dpb_info[index].c_dma_addr =
-				vb2_dma_contig_plane_dma_addr(vb, 1);
-		}
-	}
-}
-
-static void get_h264_sps_parameters(struct mtk_h264_sps_param *dst_param,
-				    const struct v4l2_ctrl_h264_sps *src_param)
-{
-	GET_MTK_VDEC_PARAM(chroma_format_idc);
-	GET_MTK_VDEC_PARAM(bit_depth_luma_minus8);
-	GET_MTK_VDEC_PARAM(bit_depth_chroma_minus8);
-	GET_MTK_VDEC_PARAM(log2_max_frame_num_minus4);
-	GET_MTK_VDEC_PARAM(pic_order_cnt_type);
-	GET_MTK_VDEC_PARAM(log2_max_pic_order_cnt_lsb_minus4);
-	GET_MTK_VDEC_PARAM(max_num_ref_frames);
-	GET_MTK_VDEC_PARAM(pic_width_in_mbs_minus1);
-	GET_MTK_VDEC_PARAM(pic_height_in_map_units_minus1);
-
-	GET_MTK_VDEC_FLAG(separate_colour_plane_flag,
-			  V4L2_H264_SPS_FLAG_SEPARATE_COLOUR_PLANE);
-	GET_MTK_VDEC_FLAG(qpprime_y_zero_transform_bypass_flag,
-			  V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS);
-	GET_MTK_VDEC_FLAG(delta_pic_order_always_zero_flag,
-			  V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO);
-	GET_MTK_VDEC_FLAG(frame_mbs_only_flag,
-			  V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY);
-	GET_MTK_VDEC_FLAG(mb_adaptive_frame_field_flag,
-			  V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD);
-	GET_MTK_VDEC_FLAG(direct_8x8_inference_flag,
-			  V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE);
-}
-
-static void get_h264_pps_parameters(struct mtk_h264_pps_param *dst_param,
-				    const struct v4l2_ctrl_h264_pps *src_param)
+static int get_vdec_decode_parameters(struct vdec_h264_slice_inst *inst)
 {
-	GET_MTK_VDEC_PARAM(num_ref_idx_l0_default_active_minus1);
-	GET_MTK_VDEC_PARAM(num_ref_idx_l1_default_active_minus1);
-	GET_MTK_VDEC_PARAM(weighted_bipred_idc);
-	GET_MTK_VDEC_PARAM(pic_init_qp_minus26);
-	GET_MTK_VDEC_PARAM(chroma_qp_index_offset);
-	GET_MTK_VDEC_PARAM(second_chroma_qp_index_offset);
-
-	GET_MTK_VDEC_FLAG(entropy_coding_mode_flag,
-			  V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE);
-	GET_MTK_VDEC_FLAG(pic_order_present_flag,
-			  V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT);
-	GET_MTK_VDEC_FLAG(weighted_pred_flag,
-			  V4L2_H264_PPS_FLAG_WEIGHTED_PRED);
-	GET_MTK_VDEC_FLAG(deblocking_filter_control_present_flag,
-			  V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT);
-	GET_MTK_VDEC_FLAG(constrained_intra_pred_flag,
-			  V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED);
-	GET_MTK_VDEC_FLAG(redundant_pic_cnt_present_flag,
-			  V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT);
-	GET_MTK_VDEC_FLAG(transform_8x8_mode_flag,
-			  V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE);
-	GET_MTK_VDEC_FLAG(scaling_matrix_present_flag,
-			  V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT);
-}
-
-static void
-get_h264_scaling_matrix(struct slice_api_h264_scaling_matrix *dst_matrix,
-			const struct v4l2_ctrl_h264_scaling_matrix *src_matrix)
-{
-	memcpy(dst_matrix->scaling_list_4x4, src_matrix->scaling_list_4x4,
-	       sizeof(dst_matrix->scaling_list_4x4));
-
-	memcpy(dst_matrix->scaling_list_8x8, src_matrix->scaling_list_8x8,
-	       sizeof(dst_matrix->scaling_list_8x8));
-}
-
-static void
-get_h264_decode_parameters(struct slice_api_h264_decode_param *dst_params,
-			   const struct v4l2_ctrl_h264_decode_params *src_params,
-			   const struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES])
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(dst_params->dpb); i++) {
-		struct slice_h264_dpb_entry *dst_entry = &dst_params->dpb[i];
-		const struct v4l2_h264_dpb_entry *src_entry = &dpb[i];
-
-		dst_entry->reference_ts = src_entry->reference_ts;
-		dst_entry->frame_num = src_entry->frame_num;
-		dst_entry->pic_num = src_entry->pic_num;
-		dst_entry->top_field_order_cnt = src_entry->top_field_order_cnt;
-		dst_entry->bottom_field_order_cnt =
-			src_entry->bottom_field_order_cnt;
-		dst_entry->flags = src_entry->flags;
-	}
-
-	/*
-	 * num_slices is a leftover from the old H.264 support and is ignored
-	 * by the firmware.
-	 */
-	dst_params->num_slices = 0;
-	dst_params->nal_ref_idc = src_params->nal_ref_idc;
-	dst_params->top_field_order_cnt = src_params->top_field_order_cnt;
-	dst_params->bottom_field_order_cnt = src_params->bottom_field_order_cnt;
-	dst_params->flags = src_params->flags;
-}
-
-static bool dpb_entry_match(const struct v4l2_h264_dpb_entry *a,
-			    const struct v4l2_h264_dpb_entry *b)
-{
-	return a->top_field_order_cnt == b->top_field_order_cnt &&
-	       a->bottom_field_order_cnt == b->bottom_field_order_cnt;
-}
-
-/*
- * Move DPB entries of dec_param that refer to a frame already existing in dpb
- * into the already existing slot in dpb, and move other entries into new slots.
- *
- * This function is an adaptation of the similarly-named function in
- * hantro_h264.c.
- */
-static void update_dpb(const struct v4l2_ctrl_h264_decode_params *dec_param,
-		       struct v4l2_h264_dpb_entry *dpb)
-{
-	DECLARE_BITMAP(new, ARRAY_SIZE(dec_param->dpb)) = { 0, };
-	DECLARE_BITMAP(in_use, ARRAY_SIZE(dec_param->dpb)) = { 0, };
-	DECLARE_BITMAP(used, ARRAY_SIZE(dec_param->dpb)) = { 0, };
-	unsigned int i, j;
-
-	/* Disable all entries by default, and mark the ones in use. */
-	for (i = 0; i < ARRAY_SIZE(dec_param->dpb); i++) {
-		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)
-			set_bit(i, in_use);
-		dpb[i].flags &= ~V4L2_H264_DPB_ENTRY_FLAG_ACTIVE;
-	}
-
-	/* Try to match new DPB entries with existing ones by their POCs. */
-	for (i = 0; i < ARRAY_SIZE(dec_param->dpb); i++) {
-		const struct v4l2_h264_dpb_entry *ndpb = &dec_param->dpb[i];
-
-		if (!(ndpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
-			continue;
-
-		/*
-		 * To cut off some comparisons, iterate only on target DPB
-		 * entries were already used.
-		 */
-		for_each_set_bit(j, in_use, ARRAY_SIZE(dec_param->dpb)) {
-			struct v4l2_h264_dpb_entry *cdpb;
-
-			cdpb = &dpb[j];
-			if (!dpb_entry_match(cdpb, ndpb))
-				continue;
-
-			*cdpb = *ndpb;
-			set_bit(j, used);
-			/* Don't reiterate on this one. */
-			clear_bit(j, in_use);
-			break;
-		}
-
-		if (j == ARRAY_SIZE(dec_param->dpb))
-			set_bit(i, new);
-	}
-
-	/* For entries that could not be matched, use remaining free slots. */
-	for_each_set_bit(i, new, ARRAY_SIZE(dec_param->dpb)) {
-		const struct v4l2_h264_dpb_entry *ndpb = &dec_param->dpb[i];
-		struct v4l2_h264_dpb_entry *cdpb;
-
-		/*
-		 * Both arrays are of the same sizes, so there is no way
-		 * we can end up with no space in target array, unless
-		 * something is buggy.
-		 */
-		j = find_first_zero_bit(used, ARRAY_SIZE(dec_param->dpb));
-		if (WARN_ON(j >= ARRAY_SIZE(dec_param->dpb)))
-			return;
-
-		cdpb = &dpb[j];
-		*cdpb = *ndpb;
-		set_bit(j, used);
-	}
-}
-
-/*
- * The firmware expects unused reflist entries to have the value 0x20.
- */
-static void fixup_ref_list(u8 *ref_list, size_t num_valid)
-{
-	memset(&ref_list[num_valid], 0x20, 32 - num_valid);
-}
-
-static void get_vdec_decode_parameters(struct vdec_h264_slice_inst *inst)
-{
-	const struct v4l2_ctrl_h264_decode_params *dec_params =
-		get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_DECODE_PARAMS);
-	const struct v4l2_ctrl_h264_sps *sps =
-		get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_SPS);
-	const struct v4l2_ctrl_h264_pps *pps =
-		get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_PPS);
-	const struct v4l2_ctrl_h264_scaling_matrix *scaling_matrix =
-		get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_SCALING_MATRIX);
+	const struct v4l2_ctrl_h264_decode_params *dec_params;
+	const struct v4l2_ctrl_h264_sps *sps;
+	const struct v4l2_ctrl_h264_pps *pps;
+	const struct v4l2_ctrl_h264_scaling_matrix *scaling_matrix;
 	struct mtk_h264_dec_slice_param *slice_param = &inst->h264_slice_param;
 	struct v4l2_h264_reflist_builder reflist_builder;
 	u8 *p0_reflist = slice_param->decode_params.ref_pic_list_p0;
 	u8 *b0_reflist = slice_param->decode_params.ref_pic_list_b0;
 	u8 *b1_reflist = slice_param->decode_params.ref_pic_list_b1;
 
-	update_dpb(dec_params, inst->dpb);
+	dec_params =
+		mtk_vdec_h264_get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_DECODE_PARAMS);
+	if (IS_ERR(dec_params))
+		return PTR_ERR(dec_params);
+
+	sps = mtk_vdec_h264_get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_SPS);
+	if (IS_ERR(sps))
+		return PTR_ERR(sps);
+
+	pps = mtk_vdec_h264_get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_PPS);
+	if (IS_ERR(pps))
+		return PTR_ERR(pps);
 
-	get_h264_sps_parameters(&slice_param->sps, sps);
-	get_h264_pps_parameters(&slice_param->pps, pps);
-	get_h264_scaling_matrix(&slice_param->scaling_matrix, scaling_matrix);
-	get_h264_decode_parameters(&slice_param->decode_params, dec_params,
-				   inst->dpb);
-	get_h264_dpb_list(inst, slice_param);
+	scaling_matrix =
+		mtk_vdec_h264_get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_SCALING_MATRIX);
+	if (IS_ERR(scaling_matrix))
+		return PTR_ERR(scaling_matrix);
+
+	mtk_vdec_h264_update_dpb(dec_params, inst->dpb);
+
+	mtk_vdec_h264_copy_sps_params(&slice_param->sps, sps);
+	mtk_vdec_h264_copy_pps_params(&slice_param->pps, pps);
+	mtk_vdec_h264_copy_scaling_matrix(&slice_param->scaling_matrix, scaling_matrix);
+	mtk_vdec_h264_copy_decode_params(&slice_param->decode_params,
+					 dec_params, inst->dpb);
+	mtk_vdec_h264_fill_dpb_info(inst->ctx, &slice_param->decode_params,
+				    slice_param->h264_dpb_info);
 
 	/* Build the reference lists */
 	v4l2_h264_init_reflist_builder(&reflist_builder, dec_params, sps,
@@ -478,19 +140,14 @@ static void get_vdec_decode_parameters(struct vdec_h264_slice_inst *inst)
 	v4l2_h264_build_p_ref_list(&reflist_builder, p0_reflist);
 	v4l2_h264_build_b_ref_lists(&reflist_builder, b0_reflist, b1_reflist);
 	/* Adapt the built lists to the firmware's expectations */
-	fixup_ref_list(p0_reflist, reflist_builder.num_valid);
-	fixup_ref_list(b0_reflist, reflist_builder.num_valid);
-	fixup_ref_list(b1_reflist, reflist_builder.num_valid);
+	mtk_vdec_h264_fixup_ref_list(p0_reflist, reflist_builder.num_valid);
+	mtk_vdec_h264_fixup_ref_list(b0_reflist, reflist_builder.num_valid);
+	mtk_vdec_h264_fixup_ref_list(b1_reflist, reflist_builder.num_valid);
 
 	memcpy(&inst->vsi_ctx.h264_slice_params, slice_param,
 	       sizeof(inst->vsi_ctx.h264_slice_params));
-}
 
-static unsigned int get_mv_buf_size(unsigned int width, unsigned int height)
-{
-	int unit_size = (width / MB_UNIT_LEN) * (height / MB_UNIT_LEN) + 8;
-
-	return HW_MB_STORE_SZ * unit_size;
+	return 0;
 }
 
 static int allocate_predication_buf(struct vdec_h264_slice_inst *inst)
@@ -525,7 +182,7 @@ static int alloc_mv_buf(struct vdec_h264_slice_inst *inst,
 	int i;
 	int err;
 	struct mtk_vcodec_mem *mem = NULL;
-	unsigned int buf_sz = get_mv_buf_size(pic->buf_w, pic->buf_h);
+	unsigned int buf_sz = mtk_vdec_h264_get_mv_buf_size(pic->buf_w, pic->buf_h);
 
 	mtk_v4l2_debug(3, "size = 0x%x", buf_sz);
 	for (i = 0; i < H264_MAX_MV_NUM; i++) {
@@ -674,7 +331,7 @@ static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 {
 	struct vdec_h264_slice_inst *inst = h_vdec;
 	const struct v4l2_ctrl_h264_decode_params *dec_params =
-		get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_DECODE_PARAMS);
+		mtk_vdec_h264_get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_DECODE_PARAMS);
 	struct vdec_vpu_inst *vpu = &inst->vpu;
 	struct mtk_video_dec_buf *src_buf_info;
 	struct mtk_video_dec_buf *dst_buf_info;
@@ -684,6 +341,7 @@ static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	u64 c_fb_dma;
 	int err;
 
+	inst->num_nalu++;
 	/* bs NULL means flush decoder */
 	if (!bs)
 		return vpu_dec_reset(vpu);
@@ -696,7 +354,7 @@ static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	c_fb_dma = fb ? (u64)fb->base_c.dma_addr : 0;
 
 	mtk_vcodec_debug(inst, "+ [%d] FB y_dma=%llx c_dma=%llx va=%p",
-			 ++inst->num_nalu, y_fb_dma, c_fb_dma, fb);
+			 inst->num_nalu, y_fb_dma, c_fb_dma, fb);
 
 	inst->vsi_ctx.dec.bs_dma = (uint64_t)bs->dma_addr;
 	inst->vsi_ctx.dec.y_fb_dma = y_fb_dma;
@@ -705,7 +363,10 @@ static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
 				   &dst_buf_info->m2m_buf.vb, true);
-	get_vdec_decode_parameters(inst);
+	err = get_vdec_decode_parameters(inst);
+	if (err)
+		goto err_free_fb_out;
+
 	data[0] = bs->size;
 	/*
 	 * Reconstruct the first byte of the NAL unit, as the firmware requests
-- 
2.18.0

