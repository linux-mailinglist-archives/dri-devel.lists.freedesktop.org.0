Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52522BAB7BC
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17C210E4DA;
	Tue, 30 Sep 2025 05:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="k04Ncv83";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8022210E271
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:08 +0000 (UTC)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20250930035653epoutp02439d024a5423f3ac26ea3d2ca9df89de~p80aHmoMQ2636326363epoutp02u
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:56:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20250930035653epoutp02439d024a5423f3ac26ea3d2ca9df89de~p80aHmoMQ2636326363epoutp02u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204613;
 bh=VeXF1m2BbK2hp0/O8EEgqvFvywhv7lBUuwNT4zVSRM4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k04Ncv83nI9dm91++oSX4PFEqJFKP3QRxMXBPHTwObnFfDPN5rDVi1AFl/ctcQzZf
 x//5tcYahrhMIEbDn+9uvlHNTIuYV1se0GAZ8Ed98bepfRhaZAYB2ak9jTIDNxhDBm
 Bu2sPbIaUdW2lKkfL5xBB+MBJW/82nFml2Ew/uiQ=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
 20250930035652epcas5p4cad3997a587d62d5cf95e8b3f4cdf399~p80ZUdbDH2408224082epcas5p4s;
 Tue, 30 Sep 2025 03:56:52 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.91]) by
 epsnrtp01.localdomain (Postfix) with ESMTP id 4cbPPv69h1z6B9m4; Tue, 30 Sep
 2025 03:56:51 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20250930035651epcas5p2a45576829011bbf653c725b352c65140~p80X0_bSQ0812408124epcas5p21;
 Tue, 30 Sep 2025 03:56:51 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035647epsmtip13198e4ab5dda3d2556f480fed2ee8817~p80UW_bzs2938529385epsmtip1j;
 Tue, 30 Sep 2025 03:56:47 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 22/29] media: mfc: Add H.264 encoder support with buffer and
 QoS improvements
Date: Tue, 30 Sep 2025 09:33:41 +0530
Message-Id: <20250930040348.3702923-23-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035651epcas5p2a45576829011bbf653c725b352c65140
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035651epcas5p2a45576829011bbf653c725b352c65140
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
 <CGME20250930035651epcas5p2a45576829011bbf653c725b352c65140@epcas5p2.samsung.com>
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

- Integrat H.264 encoding.
- Allocate encoder‑specific context buffers and ROI memory.
- Add detection macro and broadened codec‑type validation for
  QoS utilities.
- Introduce encoder‑aware QoS tables and refined weight calculations
  (B‑frames, reference count).
- Update source‑queue cleanup, framerate fallback, and
  timestamp‑delta handling.
- Make stride and source‑size helpers encoder‑aware; exposed B‑frame
  detection utility.
- Expand context structures with encoder buffers, private fields,
  ROI, and parameters.
- Add platform flags for encoder‑specific QoS steps and feature
  support (e.g., RGB).

Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
---
 .../samsung/exynos-mfc/base/mfc_buf.c         | 132 ++++++++++
 .../samsung/exynos-mfc/base/mfc_buf.h         |   3 +
 .../samsung/exynos-mfc/base/mfc_common.h      |  24 +-
 .../samsung/exynos-mfc/base/mfc_data_struct.h | 231 ++++++++++++++++++
 .../samsung/exynos-mfc/base/mfc_qos.c         |  34 ++-
 .../samsung/exynos-mfc/base/mfc_queue.c       |  31 +++
 .../samsung/exynos-mfc/base/mfc_queue.h       |   2 +
 .../exynos-mfc/base/mfc_rate_calculate.c      |  30 ++-
 .../exynos-mfc/base/mfc_rate_calculate.h      |   8 +-
 .../samsung/exynos-mfc/base/mfc_utils.c       | 111 +++++++++
 .../samsung/exynos-mfc/base/mfc_utils.h       |  52 ++++
 .../media/platform/samsung/exynos-mfc/mfc.c   |   3 +
 12 files changed, 654 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.c b/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.c
index 84f97ca230bb..0186fe3327f1 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.c
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.c
@@ -132,6 +132,9 @@ int mfc_alloc_instance_context(struct mfc_core_ctx *core_ctx)
 	case MFC_REG_CODEC_FIMV4_DEC:
 		core_ctx->instance_ctx_buf.size = buf_size->other_dec_ctx;
 		break;
+	case MFC_REG_CODEC_H264_ENC:
+		core_ctx->instance_ctx_buf.size = buf_size->h264_enc_ctx;
+		break;
 	case MFC_REG_CODEC_AV1_DEC:
 		core_ctx->instance_ctx_buf.size = buf_size->av1_dec_ctx;
 		break;
@@ -248,6 +251,64 @@ static void __mfc_dec_calc_codec_buffer_size(struct mfc_core_ctx *core_ctx)
 			  NUM_MPEG4_LF_BUF);
 }
 
+static void __mfc_enc_calc_codec_buffer_size(struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	struct mfc_enc *enc;
+	unsigned int mb_width, mb_height;
+
+	enc = ctx->enc_priv;
+	enc->tmv_buffer_size = 0;
+
+	mb_width = WIDTH_MB(ctx->crop_width);
+	mb_height = HEIGHT_MB(ctx->crop_height);
+
+	/* default recon buffer size, it can be changed in case of 422, 10bit */
+	enc->luma_dpb_size =
+		ALIGN(ENC_LUMA_DPB_SIZE(ctx->crop_width, ctx->crop_height), SZ_64);
+	enc->chroma_dpb_size =
+		ALIGN(ENC_CHROMA_DPB_SIZE(ctx->crop_width, ctx->crop_height), SZ_64);
+
+	if (ctx->min_dpb_size[0] > enc->luma_dpb_size ||
+	    ctx->min_dpb_size[1] > enc->chroma_dpb_size) {
+		mfc_debug(2,
+			  "[MEMINFO] recon DPB size changed (Luma: %zu -> %d, Chroma %zu -> %d)\n",
+			  enc->luma_dpb_size,
+			  ctx->min_dpb_size[0],
+			  enc->chroma_dpb_size,
+			  ctx->min_dpb_size[1]);
+		enc->luma_dpb_size = ctx->min_dpb_size[0];
+		enc->chroma_dpb_size = ctx->min_dpb_size[1];
+	}
+
+	/* Codecs have different memory requirements */
+	switch (ctx->codec_mode) {
+	case MFC_REG_CODEC_H264_ENC:
+		enc->me_buffer_size =
+			ALIGN(ENC_V100_H264_ME_SIZE(mb_width, mb_height), SZ_256);
+
+		ctx->scratch_buf_size = ALIGN(ctx->scratch_buf_size, SZ_256);
+		core_ctx->codec_buf.size =
+			ctx->scratch_buf_size + enc->tmv_buffer_size +
+			(ctx->dpb_count * (enc->luma_dpb_size +
+			enc->chroma_dpb_size + enc->me_buffer_size));
+		break;
+	default:
+		core_ctx->codec_buf.size = 0;
+		mfc_err("invalid codec type: %d\n", ctx->codec_mode);
+		break;
+	}
+
+	mfc_debug(2,
+		  "[MEMINFO] scratch: %zu, TMV: %zu, (recon luma: %zu, chroma: %zu, me: %zu) x count %d\n",
+		  ctx->scratch_buf_size,
+		  enc->tmv_buffer_size,
+		  enc->luma_dpb_size,
+		  enc->chroma_dpb_size,
+		  enc->me_buffer_size,
+		  ctx->dpb_count);
+}
+
 /* Allocate codec buffers */
 int mfc_alloc_codec_buffers(struct mfc_core_ctx *core_ctx)
 {
@@ -259,6 +320,8 @@ int mfc_alloc_codec_buffers(struct mfc_core_ctx *core_ctx)
 
 	if (ctx->type == MFCINST_DECODER) {
 		__mfc_dec_calc_codec_buffer_size(core_ctx);
+	} else if (ctx->type == MFCINST_ENCODER) {
+		__mfc_enc_calc_codec_buffer_size(core_ctx);
 	} else {
 		mfc_err("invalid type: %d\n", ctx->type);
 		return -EINVAL;
@@ -401,6 +464,75 @@ void mfc_release_dbg_info_buffer(struct mfc_core *core)
 	mfc_mem_special_buf_free(core->dev, &core->dbg_info_buf);
 }
 
+/* Allocation buffer of ROI macroblock information */
+static int __mfc_alloc_enc_roi_buffer(struct mfc_core_ctx *core_ctx,
+				      size_t size,
+				      struct mfc_special_buf *roi_buf)
+{
+	struct mfc_core *core = core_ctx->core;
+	struct mfc_dev *dev = core->dev;
+
+	roi_buf->size = size;
+	roi_buf->buftype = MFCBUF_NORMAL;
+
+	if (!roi_buf->dma_buf) {
+		snprintf(roi_buf->name, MFC_NUM_SPECIAL_BUF_NAME, "ctx%d ROI", core_ctx->num);
+		if (mfc_mem_special_buf_alloc(dev, roi_buf)) {
+			mfc_err("[ROI] Allocating ROI buffer failed\n");
+			return -ENOMEM;
+		}
+	}
+	memset(roi_buf->vaddr, 0, roi_buf->size);
+
+	return 0;
+}
+
+/* Wrapper : allocation ROI buffers */
+int mfc_alloc_enc_roi_buffer(struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	struct mfc_enc *enc = ctx->enc_priv;
+	unsigned int mb_width, mb_height;
+	size_t size;
+	int i;
+
+	mb_width = WIDTH_MB(ctx->crop_width);
+	mb_height = HEIGHT_MB(ctx->crop_height);
+
+	switch (ctx->codec_mode) {
+	case MFC_REG_CODEC_H264_ENC:
+		size = ((((mb_width * (mb_height + 1) / 2) + 15) / 16) * 16) * 2;
+		break;
+	default:
+		mfc_debug(2,
+			  "ROI not supported codec type(%d). Allocate with default size\n",
+			  ctx->codec_mode);
+		size = mb_width * mb_height;
+		break;
+	}
+
+	for (i = 0; i < MFC_MAX_EXTRA_BUF; i++) {
+		if (__mfc_alloc_enc_roi_buffer(core_ctx, size, &enc->roi_buf[i]) < 0) {
+			mfc_err("[ROI] Allocating remapping buffer[%d] failed\n", i);
+			return -ENOMEM;
+		}
+	}
+
+	return 0;
+}
+
+/* Release buffer of ROI macroblock information */
+void mfc_release_enc_roi_buffer(struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	struct mfc_enc *enc = ctx->enc_priv;
+	int i;
+
+	for (i = 0; i < MFC_MAX_EXTRA_BUF; i++)
+		if (enc->roi_buf[i].dma_buf)
+			mfc_mem_special_buf_free(ctx->dev, &enc->roi_buf[i]);
+}
+
 /* Allocate firmware */
 int mfc_alloc_firmware(struct mfc_core *core)
 {
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.h
index 6907cf6ac775..67bdfaed5dd6 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.h
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.h
@@ -26,6 +26,9 @@ void mfc_release_codec_buffers(struct mfc_core_ctx *core_ctx);
 int mfc_alloc_scratch_buffer(struct mfc_core_ctx *core_ctx);
 void mfc_release_scratch_buffer(struct mfc_core_ctx *core_ctx);
 
+int mfc_alloc_enc_roi_buffer(struct mfc_core_ctx *core_ctx);
+void mfc_release_enc_roi_buffer(struct mfc_core_ctx *core_ctx);
+
 int mfc_alloc_firmware(struct mfc_core *core);
 int mfc_load_firmware(struct mfc_core *core,
 		      struct mfc_special_buf *fw_buf,
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_common.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_common.h
index 5392c8566e42..bec6f88d5e44 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_common.h
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_common.h
@@ -170,6 +170,9 @@
 	((ctx)->codec_mode == MFC_REG_CODEC_HEVC_DEC &&					\
 	 (profile) == MFC_REG_D_PROFILE_MULTIVIEW_HEVC_MAIN)
 
+/* Encoder codec mode check */
+#define IS_H264_ENC(ctx)	((ctx)->codec_mode == MFC_REG_CODEC_H264_ENC)
+
 #define CODEC_NOT_CODED(ctx)	({							\
 	typeof(ctx) _ctx = (ctx);							\
 	(IS_MPEG4_DEC(_ctx) || IS_VC1_DEC(_ctx) || IS_VC1_RCV_DEC(_ctx) ||		\
@@ -217,7 +220,16 @@
 })
 #define CODEC_HAS_IDR(ctx)	({							\
 	typeof(ctx) _ctx = (ctx);							\
-	(IS_H264_DEC(_ctx) || IS_H264_MVC_DEC(_ctx) || IS_HEVC_DEC(_ctx));		\
+	(IS_H264_DEC(_ctx) || IS_H264_MVC_DEC(_ctx) || IS_HEVC_DEC(_ctx) ||		\
+	 IS_H264_ENC(_ctx));					\
+})
+
+// Buffer container
+#define IS_BUFFER_BATCH_MODE(ctx)	((ctx)->batch_mode == 1)
+#define IS_NO_HEADER_GENERATE(ctx, p)	({						\
+	typeof(ctx) _ctx = (ctx);							\
+	typeof(p) _p = (p);								\
+	(_p->seq_hdr_mode == V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME);	\
 })
 
 /*
@@ -313,6 +325,13 @@
 	 (_fps >= 240));							\
 })
 
+#define IS_MULTI_MODE_ENC_RES(ctx)	({					\
+	typeof(ctx) _ctx = (ctx);						\
+	(IS_MULTI_MODE_RES(_ctx) ||						\
+	 (OVER_UHD_RES(_ctx) && _ctx->operating_framerate >= 60000)	||	\
+	 (OVER_UHD_RES(_ctx) && mfc_is_enc_bframe(_ctx)));			\
+})
+
 #define IS_BLACKBAR_OFF(ctx)	((ctx)->crop_height > 2160)
 
 #define IS_SINGLE_FD(ctx, fmt)	((!(ctx)->rgb_bpp) && ((fmt)->mem_planes == 1))
@@ -404,6 +423,9 @@ static inline int mfc_core_get_pwr_ref_cnt(struct mfc_core *core)
 
 static inline int mfc_core_get_clk_ref_cnt(struct mfc_core *core)
 {
+	if (core->dev->pdata->support_hwacg == MFC_HWACG_HWFW_CTRL)
+		return 1;
+
 	return atomic_read(&core->clk_ref);
 }
 
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_data_struct.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_data_struct.h
index 6b93fe3ab138..6d34905a1cba 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_data_struct.h
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_data_struct.h
@@ -505,6 +505,9 @@ struct mfc_ctx_buf_size {
 	size_t h264_dec_ctx;
 	size_t av1_dec_ctx;
 	size_t other_dec_ctx;
+	size_t h264_enc_ctx;
+	size_t hevc_enc_ctx;
+	size_t other_enc_ctx;
 	size_t dbg_info_buf;
 };
 
@@ -711,6 +714,13 @@ struct mfc_bw_data {
 };
 
 struct mfc_bw_info {
+	struct mfc_bw_data bw_enc_h264;
+	struct mfc_bw_data bw_enc_hevc;
+	struct mfc_bw_data bw_enc_hevc_10bit;
+	struct mfc_bw_data bw_enc_vp8;
+	struct mfc_bw_data bw_enc_vp9;
+	struct mfc_bw_data bw_enc_vp9_10bit;
+	struct mfc_bw_data bw_enc_mpeg4;
 	struct mfc_bw_data bw_dec_h264;
 	struct mfc_bw_data bw_dec_hevc;
 	struct mfc_bw_data bw_dec_hevc_10bit;
@@ -734,6 +744,7 @@ struct mfc_qos {
 	unsigned int freq_mif;
 	unsigned int mo_value;
 	unsigned int mo_10bit_value;
+	unsigned int mo_uhd_enc60_value;
 	unsigned int time_fw;
 	unsigned int bts_scen_idx;
 	const char *name;
@@ -792,6 +803,7 @@ struct mfc_platdata {
 	/* Formats */
 	unsigned int support_10bit;
 	unsigned int support_422;
+	unsigned int support_rgb;
 	/* Resolution */
 	unsigned int support_check_res;
 
@@ -807,11 +819,26 @@ struct mfc_platdata {
 	struct mfc_feature black_bar;
 	struct mfc_feature color_aspect_dec;
 	struct mfc_feature static_info_dec;
+	struct mfc_feature color_aspect_enc;
+	struct mfc_feature static_info_enc;
 	struct mfc_feature vp9_stride_align;
 	struct mfc_feature mem_clear;
 	struct mfc_feature wait_fw_status;
+	struct mfc_feature average_qp;
+	struct mfc_feature mv_search_mode;
+	struct mfc_feature enc_idr_flag;
+	struct mfc_feature min_quality_mode;
+	struct mfc_feature enc_capability;
+	struct mfc_feature enc_ts_delta;
+	struct mfc_feature wfd_rc_mode;
+	struct mfc_feature max_i_frame_size;
 	struct mfc_feature hevc_pic_output_flag;
 
+	/* Encoder default parameter */
+	unsigned int enc_param_num;
+	unsigned int enc_param_addr[MFC_MAX_DEFAULT_PARAM];
+	unsigned int enc_param_val[MFC_MAX_DEFAULT_PARAM];
+
 	struct mfc_bw_info mfc_bw_info;
 	unsigned int dynamic_weight;
 	struct mfc_qos_weight qos_weight;
@@ -835,7 +862,14 @@ struct mfc_platdata {
 
 	unsigned int scheduler;
 	unsigned int pbs_num_prio;
+
+	unsigned int enc_rgb_csc_by_fw;
+	/* HWAPG */
+	unsigned int support_hwapg;
+	/* HWACG */
 	enum mfc_hwacg_type support_hwacg;
+
+	unsigned int support_enc_mode1;
 	unsigned int support_mv_hevc;
 };
 
@@ -858,6 +892,7 @@ struct mfc_core_platdata {
 	unsigned int tsmux_masterid;
 	/* QoS */
 	unsigned int num_default_qos_steps;
+	unsigned int num_encoder_qos_steps;
 	unsigned int max_mb;
 	unsigned int max_hw_mb;
 	unsigned int mfc_freq_control;
@@ -994,6 +1029,9 @@ struct mfc_core_ops {
 	/* for DEC */
 	void (*instance_dpb_flush)(struct mfc_core *core, struct mfc_ctx *ctx);
 	int (*instance_init_buf)(struct mfc_core *core, struct mfc_ctx *ctx);
+	/* for ENC */
+	void (*instance_q_flush)(struct mfc_core *core, struct mfc_ctx *ctx);
+	void (*instance_finishing)(struct mfc_core *core, struct mfc_ctx *ctx);
 };
 
 struct dump_info {
@@ -1148,6 +1186,150 @@ struct mfc_core {
 	struct mfc_core_memlog memlog;
 };
 
+/**
+ *
+ */
+struct mfc_h264_enc_params {
+	enum v4l2_mpeg_video_h264_profile profile;
+	u8 level;
+	u8 interlace;
+	u16 open_gop_size;
+	u8 open_gop;
+	u8 _8x8_transform;
+	s8 loop_filter_alpha;
+	s8 loop_filter_beta;
+	enum v4l2_mpeg_video_h264_loop_filter_mode loop_filter_mode;
+	enum v4l2_mpeg_video_h264_entropy_mode entropy_mode;
+	u8 rc_frame_qp;
+	u8 rc_min_qp;
+	u8 rc_max_qp;
+	u8 rc_min_qp_p;
+	u8 rc_max_qp_p;
+	u8 rc_min_qp_b;
+	u8 rc_max_qp_b;
+	u8 rc_mb_dark;
+	u8 rc_mb_smooth;
+	u8 rc_mb_static;
+	u8 rc_mb_activity;
+	u8 rc_p_frame_qp;
+	u8 rc_b_frame_qp;
+	u8 ar_vui;
+	u8 sei_gen_enable;
+	u8 sei_fp_curr_frame_0;
+
+	enum v4l2_mpeg_video_h264_vui_sar_idc ar_vui_idc;
+	u16 ext_sar_width;
+	u16 ext_sar_height;
+
+	enum v4l2_mpeg_video_h264_hierarchical_coding_type hier_qp_type;
+	u32 hier_bit_layer[7];
+	u8 hier_qp_layer[7];
+	u8 hier_qp_enable;
+	u8 num_hier_layer;
+	u8 hier_ref_type;
+	u8 enable_ltr;
+	u8 num_of_ltr;
+	u32 set_priority;
+	u32 base_priority;
+
+	enum v4l2_mpeg_video_h264_sei_fp_arrangement_type sei_fp_arrangement_type;
+	u32 fmo_enable;
+	u32 fmo_slice_map_type;
+	u32 fmo_slice_num_grp;
+	u32 fmo_run_length[4];
+	u32 fmo_sg_dir;
+	u32 fmo_sg_rate;
+	u32 aso_enable;
+	u32 aso_slice_order[8];
+
+	u32 prepend_sps_pps_to_idr;
+	u32 vui_enable;
+};
+
+/**
+ *
+ */
+struct mfc_enc_params {
+	enum v4l2_mpeg_video_multi_slice_mode slice_mode;
+	u32 slice_mb;
+	u32 slice_bit;
+	u32 slice_mb_row;
+
+	u32 gop_ctrl;
+	u32 gop_size;
+	u32 intra_refresh_mb;
+	u32 i_frm_ctrl_mode;
+	u32 i_frm_ctrl;
+
+	u8 pad;
+	u8 pad_luma;
+	u8 pad_cb;
+	u8 pad_cr;
+
+	u8 rc_mb;		/* H.264: MFCv5, MPEG4/H.263: MFCv6 */
+	u8 rc_pvc;
+	u8 rc_frame;
+	u8 drop_control;
+	u32 rc_bitrate;
+	u32 rc_framerate;
+	u16 rc_reaction_coeff;
+	u16 rc_frame_delta;	/* MFC6.1 Only */
+	u32 rc_framerate_res;
+	u32 max_i_frame_size;	/* when RC_MODE is 5(CBR_I_LIMIT_WFD = CBR_BS) */
+
+	u32 config_qp;
+	u32 dynamic_qp;
+
+	u8 frame_tag;
+	u8 ratio_intra;
+	u8 num_b_frame;		/* H.264, HEVC, MPEG4 */
+	u8 num_refs_for_p;	/* H.264, HEVC, VP8, VP9 */
+	enum v4l2_mpeg_video_header_mode seq_hdr_mode;
+	enum v4l2_mpeg_mfc51_video_frame_skip_mode frame_skip_mode;
+	u16 vbv_buf_size;
+	u8 num_hier_max_layer;
+	u8 hier_bitrate_ctrl;
+	u8 weighted_enable;
+	u8 roi_enable;
+	u8 ivf_header_disable;	/* VP8, VP9 */
+	u8 fixed_target_bit;
+	u8 min_quality_mode;	/* H.264, HEVC when RC_MODE is 2(VBR) */
+	u8 wp_two_pass_enable;
+	u8 adaptive_gop_enable;
+
+	u32 check_color_range;
+	u32 color_range;
+	u32 colour_primaries;
+	u32 transfer_characteristics;
+	u32 matrix_coefficients;
+
+	u32 static_info_enable;
+	u32 max_pic_average_light;
+	u32 max_content_light;
+	u32 max_display_luminance;
+	u32 min_display_luminance;
+	u32 white_point;
+	u32 display_primaries_0;
+	u32 display_primaries_1;
+	u32 display_primaries_2;
+	u32 chroma_qp_offset_cb; /* H.264, HEVC */
+	u32 chroma_qp_offset_cr; /* H.264, HEVC */
+
+	u32 mv_search_mode;
+	u32 mv_hor_pos_l0;
+	u32 mv_hor_pos_l1;
+	u32 mv_ver_pos_l0;
+	u32 mv_ver_pos_l1;
+	u32 mv_hor_range;
+	u32 mv_ver_range;
+
+	u8 timing_info_enable; /* H.264, HEVC */
+
+	union {
+		struct mfc_h264_enc_params h264;
+	} codec;
+};
+
 struct mfc_ctx_ctrl_val {
 	int has_new;
 	int val;
@@ -1234,6 +1416,14 @@ struct temporal_layer_info {
 	unsigned int temporal_layer_bitrate[VIDEO_MAX_TEMPORAL_LAYERS];
 };
 
+struct mfc_enc_roi_info {
+	char *addr;
+	int size;
+	int upper_qp;
+	int lower_qp;
+	bool enable;
+};
+
 struct mfc_user_shared_handle {
 	int fd;
 	struct dma_buf *dma_buf;
@@ -1379,6 +1569,43 @@ struct mfc_dec {
 	unsigned char frame_cnt;
 };
 
+struct mfc_enc {
+	unsigned int dst_buf_size;
+	unsigned int header_size;
+
+	enum v4l2_mpeg_mfc51_video_frame_type frame_type;
+	enum v4l2_mpeg_mfc51_video_force_frame_type force_frame_type;
+
+	unsigned int idr_flag;
+
+	size_t luma_dpb_size;
+	size_t chroma_dpb_size;
+	size_t me_buffer_size;
+	size_t tmv_buffer_size;
+
+	unsigned int slice_mode;
+	unsigned int slice_size_mb;
+	unsigned int slice_size_bits;
+	unsigned int in_slice;
+	unsigned int buf_full;
+
+	int config_qp;
+
+	struct mfc_fmt *uncomp_fmt;
+
+	int fake_src;
+	int empty_data;
+
+	int roi_index;
+	struct mfc_special_buf roi_buf[MFC_MAX_EXTRA_BUF];
+	struct mfc_enc_roi_info roi_info[MFC_MAX_EXTRA_BUF];
+
+	struct mfc_enc_params params;
+
+	struct mfc_user_shared_handle sh_handle_svc;
+	struct mfc_user_shared_handle sh_handle_roi;
+};
+
 struct mfc_resolution {
 	int width;
 	int height;
@@ -1414,6 +1641,7 @@ struct mfc_multi_view_buf_info {
 struct mfc_ctx {
 	struct mfc_dev *dev;
 	struct mfc_dec *dec_priv;
+	struct mfc_enc *enc_priv;
 
 	int num;
 	int prio;
@@ -1542,6 +1770,9 @@ struct mfc_ctx {
 	dma_addr_t last_src_addr;
 	dma_addr_t last_dst_addr[MFC_MAX_PLANES];
 
+	/* buffer container */
+	int batch_mode;
+
 	bool mem_type_10bit;
 
 	unsigned long gdc_ready_buf_ino;
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_qos.c b/drivers/media/platform/samsung/exynos-mfc/base/mfc_qos.c
index 9922c2396b94..40541e2d626f 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_qos.c
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_qos.c
@@ -20,17 +20,25 @@
 
 static inline int __mfc_core_get_qos_steps(struct mfc_core *core, int table_type)
 {
-	return core->core_pdata->num_default_qos_steps;
+	if (table_type == MFC_QOS_TABLE_TYPE_ENCODER)
+		return core->core_pdata->num_encoder_qos_steps;
+	else
+		return core->core_pdata->num_default_qos_steps;
 }
 
 static inline struct mfc_qos *__mfc_core_get_qos_table(struct mfc_core *core, int table_type)
 {
-	return core->core_pdata->default_qos_table;
+	if (table_type == MFC_QOS_TABLE_TYPE_ENCODER)
+		return core->core_pdata->encoder_qos_table;
+	else
+		return core->core_pdata->default_qos_table;
 }
 
 static inline unsigned long __mfc_qos_add_weight(struct mfc_ctx *ctx, unsigned long mb)
 {
+	struct mfc_enc *enc = ctx->enc_priv;
 	struct mfc_dec *dec = ctx->dec_priv;
+	struct mfc_enc_params *p;
 	struct mfc_qos_weight *qos_weight = &ctx->dev->pdata->qos_weight;
 	u32 num_planes = ctx->dst_fmt->num_planes;
 	int weight = 1000;
@@ -39,6 +47,8 @@ static inline unsigned long __mfc_qos_add_weight(struct mfc_ctx *ctx, unsigned l
 	switch (ctx->codec_mode) {
 	case MFC_REG_CODEC_H264_DEC:
 	case MFC_REG_CODEC_H264_MVC_DEC:
+	case MFC_REG_CODEC_H264_ENC:
+	case MFC_REG_CODEC_H264_MVC_ENC:
 		weight = (weight * 100) / qos_weight->weight_h264_hevc;
 		mfc_ctx_debug(3, "[QoS] h264, hevc codec, weight: %d\n", weight / 10);
 		if (num_planes == 3) {
@@ -107,6 +117,16 @@ static inline unsigned long __mfc_qos_add_weight(struct mfc_ctx *ctx, unsigned l
 		mfc_ctx_err("[QoS] wrong codec_mode (%d), no weight\n", ctx->codec_mode);
 	}
 
+	if (enc) {
+		p = &enc->params;
+		if (mfc_is_enc_bframe(ctx)) {
+			weight = (weight * 100) / qos_weight->weight_bframe;
+			mfc_ctx_debug(3, "[QoS] B frame encoding, weight: %d\n", weight / 10);
+		} else if (IS_H264_ENC(ctx) && (p->num_refs_for_p >= 2)) {
+			weight = (weight * 100) / qos_weight->weight_num_of_ref;
+			mfc_ctx_debug(3, "[QoS] num of ref >= 2, weight: %d\n", weight / 10);
+		}
+	}
 	if (dec) {
 		if (dec->num_of_tile_over_4) {
 			weight = (weight * 100) / qos_weight->weight_num_of_tile;
@@ -223,7 +243,10 @@ void mfc_qos_get_portion(struct mfc_core *core, struct mfc_ctx *ctx)
 	if (!ctx->mfc_qos_portion)
 		return;
 
-	table_type = MFC_QOS_TABLE_TYPE_DEFAULT;
+	if (ctx->type == MFCINST_ENCODER)
+		table_type = MFC_QOS_TABLE_TYPE_ENCODER;
+	else
+		table_type = MFC_QOS_TABLE_TYPE_DEFAULT;
 
 	num_qos_steps = __mfc_core_get_qos_steps(core, table_type);
 	qos_table = __mfc_core_get_qos_table(core, table_type);
@@ -390,7 +413,8 @@ bool mfc_qos_mb_calculate(struct mfc_core *core, struct mfc_core_ctx *core_ctx,
 
 	if (ctx->type == MFCINST_DECODER)
 		table_type = MFC_QOS_TABLE_TYPE_DEFAULT;
-
+	else
+		table_type = MFC_QOS_TABLE_TYPE_ENCODER;
 	num_qos_steps = __mfc_core_get_qos_steps(core, table_type);
 
 	if (atomic_read(&core->qos_req_cur)) {
@@ -652,6 +676,8 @@ void __mfc_qos_calculate(struct mfc_core *core, struct mfc_ctx *ctx, int delete)
 
 	if (dec_found)
 		table_type = MFC_QOS_TABLE_TYPE_DEFAULT;
+	else
+		table_type = MFC_QOS_TABLE_TYPE_ENCODER;
 
 	num_qos_steps = __mfc_core_get_qos_steps(core, table_type);
 	qos_table = __mfc_core_get_qos_table(core, table_type);
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_queue.c b/drivers/media/platform/samsung/exynos-mfc/base/mfc_queue.c
index 6dc9bc7a1873..81e649bb4e1e 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_queue.c
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_queue.c
@@ -539,6 +539,37 @@ void mfc_cleanup_queue(spinlock_t *plock, struct mfc_buf_queue *queue)
 	spin_unlock_irqrestore(plock, flags);
 }
 
+void mfc_cleanup_enc_src_queue(struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	unsigned long flags;
+	struct mfc_buf *mfc_buf = NULL;
+	struct mfc_buf_queue *queue = &core_ctx->src_buf_queue;
+	int i;
+
+	spin_lock_irqsave(&ctx->buf_queue_lock, flags);
+
+	while (!list_empty(&queue->head)) {
+		mfc_buf = list_entry(queue->head.next, struct mfc_buf, list);
+
+		for (i = 0; i < mfc_buf->vb.vb2_buf.num_planes; i++) {
+			if (IS_BUFFER_BATCH_MODE(ctx))
+				mfc_bufcon_put_daddr(ctx, mfc_buf, i);
+			vb2_set_plane_payload(&mfc_buf->vb.vb2_buf, i, 0);
+		}
+
+		vb2_buffer_done(&mfc_buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		list_del(&mfc_buf->list);
+		queue->count--;
+	}
+
+	INIT_LIST_HEAD(&queue->head);
+	queue->count = 0;
+	ctx->batch_mode = 0;
+
+	spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+}
+
 void mfc_print_dpb_queue(struct mfc_core_ctx *core_ctx, struct mfc_dec *dec)
 {
 	struct mfc_ctx *ctx = core_ctx->ctx;
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_queue.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_queue.h
index 055e7a23a527..cfe889e0dcc9 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_queue.h
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_queue.h
@@ -145,6 +145,8 @@ void mfc_return_buf_to_ready_queue(struct mfc_ctx *ctx,
 
 void mfc_cleanup_queue(spinlock_t *plock, struct mfc_buf_queue *queue);
 
+void mfc_cleanup_enc_src_queue(struct mfc_core_ctx *core_ctx);
+
 void mfc_print_dpb_queue(struct mfc_core_ctx *core_ctx, struct mfc_dec *dec);
 void mfc_print_dpb_queue_with_lock(struct mfc_core_ctx *core_ctx, struct mfc_dec *dec);
 int mfc_get_available_dpb_count(struct mfc_core_ctx *core_ctx);
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_rate_calculate.c b/drivers/media/platform/samsung/exynos-mfc/base/mfc_rate_calculate.c
index 94a555c900d7..c88101d1d1c1 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_rate_calculate.c
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_rate_calculate.c
@@ -293,6 +293,7 @@ static unsigned long __mfc_rate_get_fps_by_timestamp(struct mfc_ctx *ctx,
 						     struct mfc_ts_control *ts,
 						     struct timespec64 *time, int type)
 {
+	struct list_head *head = &ts->ts_list;
 	struct mfc_timestamp *temp_ts;
 	int found;
 	int index = 0;
@@ -304,6 +305,13 @@ static unsigned long __mfc_rate_get_fps_by_timestamp(struct mfc_ctx *ctx,
 	unsigned long flags;
 	u64 current_time;
 
+	if (IS_BUFFER_BATCH_MODE(ctx)) {
+		if (ctx->dev->debugfs.debug_ts == 1)
+			mfc_ctx_info("[BUFCON][TS] Keep framerate if buffer batch mode is used, %ldfps\n",
+				     ctx->framerate);
+		return ctx->framerate;
+	}
+
 	spin_lock_irqsave(&ts->ts_lock, flags);
 	if (list_empty(&ts->ts_list)) {
 		__mfc_rate_add_timestamp(ctx, ts, time, &ts->ts_list);
@@ -362,6 +370,19 @@ static unsigned long __mfc_rate_get_fps_by_timestamp(struct mfc_ctx *ctx,
 		spin_unlock_irqrestore(&ts->ts_lock, flags);
 	}
 
+	/* Calculation the last frame fps for drop control */
+	if (ctx->type == MFCINST_ENCODER) {
+		temp_ts = list_entry(head->prev, struct mfc_timestamp, list);
+		if (temp_ts->interval > USEC_PER_SEC) {
+			if (ts->ts_is_full)
+				mfc_ctx_info("[TS] ts interval(%d) couldn't over 1sec(1fps)\n",
+					     temp_ts->interval);
+			ts->ts_last_interval = 0;
+		} else {
+			ts->ts_last_interval = temp_ts->interval;
+		}
+	}
+
 	if (!ts->ts_is_full) {
 		if (ctx->dev->debugfs.debug_ts == 1)
 			mfc_ctx_info("[TS] ts doesn't full, keep %ld fps\n", ctx->framerate);
@@ -581,7 +602,14 @@ int mfc_rate_check_perf_ctx(struct mfc_ctx *ctx, int max_runtime)
 
 	op_fps = ctx->operating_framerate;
 	if (op_fps == 0) {
-		op_fps = ctx->src_q_framerate;
+		if (ctx->type == MFCINST_ENCODER && ctx->enc_priv->params.rc_framerate)
+			op_fps = ctx->enc_priv->params.rc_framerate;
+		else
+			/*
+			 * In case of non-real-time, check the buffer queueing rate
+			 * because the non-real-time is best effort scenario. (ex. video editing)
+			 */
+			op_fps = ctx->src_q_framerate;
 		mfc_ctx_debug(2, "[PRIO][rt %d] use fps: %d\n", ctx->rt, op_fps);
 	}
 
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_rate_calculate.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_rate_calculate.h
index 2452e6ee56dd..530ad6fed489 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_rate_calculate.h
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_rate_calculate.h
@@ -45,6 +45,8 @@ static inline void mfc_rate_reset_framerate(struct mfc_ctx *ctx)
 {
 	if (ctx->type == MFCINST_DECODER)
 		ctx->framerate = DEC_DEFAULT_FPS;
+	else if (ctx->type == MFCINST_ENCODER)
+		ctx->framerate = ENC_DEFAULT_FPS;
 
 	mfc_ctx_debug(3, "[QoS] reset ctx->framrate: %lu\n", ctx->framerate);
 }
@@ -80,7 +82,11 @@ static inline unsigned long mfc_rate_get_rt_framerate(struct mfc_ctx *ctx, enum
 
 	framerate = ctx->operating_framerate;
 
-	if (rt == MFC_RT_UNDEFINED || rt == MFC_NON_RT) {
+	if (rt == MFC_RT) {
+		if (framerate == 0 && ctx->type == MFCINST_ENCODER &&
+		    ctx->enc_priv->params.rc_framerate)
+			framerate = ctx->enc_priv->params.rc_framerate;
+	} else if (rt == MFC_RT_UNDEFINED || rt == MFC_NON_RT) {
 		framerate = ctx->framerate;
 	} else {
 		if (ctx->src_ts.ts_is_full)
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.c b/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.c
index 83cdae3dee57..6dba87fb951b 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.c
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.c
@@ -108,6 +108,59 @@ static void __mfc_set_dec_stride(struct mfc_ctx *ctx,
 	}
 }
 
+static void __mfc_set_enc_stride(struct mfc_ctx *ctx,
+				 struct mfc_raw_info *raw,
+				 struct mfc_fmt *fmt)
+{
+	int i, y_stride, stride_align = 16;
+
+	y_stride = ctx->bytesperline[0];
+	if (!y_stride)
+		y_stride = ALIGN(ctx->img_width, stride_align);
+
+	for (i = 0; i < MFC_MAX_PLANES; i++) {
+		raw->stride[i] = 0;
+		raw->stride_2bits[i] = 0;
+	}
+
+	switch (fmt->fourcc) {
+	case V4L2_PIX_FMT_YUV420M:
+	case V4L2_PIX_FMT_YVU420M:
+	case V4L2_PIX_FMT_NV12MT_16X16:
+	case V4L2_PIX_FMT_NV12MT:
+	case V4L2_PIX_FMT_NV12M:
+	case V4L2_PIX_FMT_NV21M:
+	case V4L2_PIX_FMT_NV16M:
+	case V4L2_PIX_FMT_NV61M:
+		/* use user stride */
+		for (i = 0; i < ctx->src_fmt->num_planes; i++) {
+			raw->stride[i] = ctx->bytesperline[i];
+			if (!raw->stride[i])
+				raw->stride[i] = ALIGN(ctx->img_width, stride_align);
+		}
+		break;
+	case V4L2_PIX_FMT_RGB24:
+	case V4L2_PIX_FMT_RGB565:
+	case V4L2_PIX_FMT_RGB32X:
+	case V4L2_PIX_FMT_BGR32:
+	case V4L2_PIX_FMT_ARGB32:
+	case V4L2_PIX_FMT_RGB32:
+		raw->stride[0] = y_stride * (ctx->rgb_bpp / 8);
+		break;
+	default:
+		mfc_ctx_err("Invalid pixelformat : %s\n", fmt->name);
+		break;
+	}
+
+	for (i = 0; i < ctx->src_fmt->num_planes; i++) {
+		if ((raw->stride[i] % stride_align) != 0) {
+			mfc_ctx_err("[FRAME] Forced to change stride[%d] %d for %dbyte alignment\n",
+				    i, raw->stride[i], stride_align);
+			raw->stride[i] = ALIGN(raw->stride[i], stride_align);
+		}
+	}
+}
+
 void mfc_set_linear_stride_size(struct mfc_ctx *ctx, struct mfc_raw_info *raw, struct mfc_fmt *fmt)
 {
 	/*
@@ -117,6 +170,8 @@ void mfc_set_linear_stride_size(struct mfc_ctx *ctx, struct mfc_raw_info *raw, s
 	 */
 	if (ctx->type == MFCINST_DECODER)
 		__mfc_set_dec_stride(ctx, raw, fmt);
+	else
+		__mfc_set_enc_stride(ctx, raw, fmt);
 }
 
 void mfc_dec_calc_dpb_size(struct mfc_ctx *ctx, struct mfc_raw_info *raw, struct mfc_fmt *fmt)
@@ -201,6 +256,62 @@ void mfc_dec_calc_dpb_size(struct mfc_ctx *ctx, struct mfc_raw_info *raw, struct
 	}
 }
 
+void mfc_enc_calc_src_size(struct mfc_ctx *ctx)
+{
+	struct mfc_raw_info *raw;
+	int i, extra;
+
+	raw = &ctx->raw_buf;
+	raw->total_plane_size = 0;
+	extra = MFC_LINEAR_BUF_SIZE;
+
+	mfc_set_linear_stride_size(ctx, raw, ctx->src_fmt);
+
+	for (i = 0; i < raw->num_planes; i++) {
+		raw->plane_size[i] = 0;
+		raw->plane_size_2bits[i] = 0;
+	}
+
+	switch (ctx->src_fmt->fourcc) {
+	case V4L2_PIX_FMT_YUV420M:
+	case V4L2_PIX_FMT_YVU420M:
+		raw->plane_size[0] = raw->stride[0] * ALIGN(ctx->img_height, 16) + extra;
+		raw->plane_size[1] = raw->stride[1] * ALIGN(ctx->img_height, 16) / 2 + extra;
+		raw->plane_size[2] = raw->stride[2] * ALIGN(ctx->img_height, 16) / 2 + extra;
+		break;
+	case V4L2_PIX_FMT_NV12MT_16X16:
+	case V4L2_PIX_FMT_NV12M:
+	case V4L2_PIX_FMT_NV21M:
+		raw->plane_size[0] = raw->stride[0] * ALIGN(ctx->img_height, 16) + extra;
+		raw->plane_size[1] = raw->stride[1] * ALIGN(ctx->img_height, 16) / 2 + extra;
+		break;
+	case V4L2_PIX_FMT_NV16M:
+	case V4L2_PIX_FMT_NV61M:
+		raw->plane_size[0] = raw->stride[0] * ALIGN(ctx->img_height, 16) + extra;
+		raw->plane_size[1] = raw->stride[1] * ALIGN(ctx->img_height, 16) + extra;
+		break;
+	case V4L2_PIX_FMT_RGB24:
+	case V4L2_PIX_FMT_RGB565:
+	case V4L2_PIX_FMT_RGB32X:
+	case V4L2_PIX_FMT_BGR32:
+	case V4L2_PIX_FMT_ARGB32:
+	case V4L2_PIX_FMT_RGB32:
+		raw->plane_size[0] = raw->stride[0] * ctx->img_height;
+		break;
+	default:
+		mfc_ctx_err("Invalid pixel format(%d)\n", ctx->src_fmt->fourcc);
+		break;
+	}
+
+	for (i = 0; i < raw->num_planes; i++) {
+		raw->total_plane_size += raw->plane_size[i];
+		mfc_ctx_debug(2, "[FRAME] Plane[%d] size = %d, stride = %d\n",
+			      i, raw->plane_size[i], raw->stride[i]);
+	}
+
+	mfc_ctx_debug(2, "[FRAME] total plane size: %d\n", raw->total_plane_size);
+}
+
 void mfc_calc_base_addr(struct mfc_ctx *ctx, struct vb2_buffer *vb,
 			struct mfc_fmt *fmt)
 {
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.h
index dedfb049e6fc..a127f330fe16 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.h
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.h
@@ -212,10 +212,37 @@ static inline int mfc_check_mb_flag(struct mfc_buf *mfc_buf, enum mfc_mb_flag f)
 	return 0;
 }
 
+static inline int mfc_is_enc_bframe(struct mfc_ctx *ctx)
+{
+	struct mfc_enc *enc;
+	struct mfc_enc_params *p;
+	int hier_qp_type = -EINVAL;
+	u8 num_hier_layer = 0;
+
+	if (ctx->type != MFCINST_ENCODER)
+		return 0;
+	enc = ctx->enc_priv;
+	if (!enc)
+		return 0;
+
+	p = &enc->params;
+	if (IS_H264_ENC(ctx)) {
+		num_hier_layer = p->codec.h264.num_hier_layer;
+		hier_qp_type = (int)p->codec.h264.hier_qp_type;
+	}
+	if (enc->params.num_b_frame ||
+	    (num_hier_layer >= 2 &&
+	     hier_qp_type == V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B))
+		return 1;
+
+	return 0;
+}
+
 int mfc_check_vb_with_fmt(struct mfc_fmt *fmt, struct vb2_buffer *vb);
 int mfc_check_resolution(struct mfc_ctx *ctx);
 void mfc_set_linear_stride_size(struct mfc_ctx *ctx, struct mfc_raw_info *raw, struct mfc_fmt *fmt);
 void mfc_dec_calc_dpb_size(struct mfc_ctx *ctx, struct mfc_raw_info *raw, struct mfc_fmt *fmt);
+void mfc_enc_calc_src_size(struct mfc_ctx *ctx);
 void mfc_calc_base_addr(struct mfc_ctx *ctx, struct vb2_buffer *vb, struct mfc_fmt *fmt);
 void mfc_set_view_buf_info(struct mfc_ctx *ctx, int mem_planes,
 			   int num_fd_depth_map, int num_fd_sub_view_meta);
@@ -355,6 +382,31 @@ static inline void mfc_ctx_change_idle_mode(struct mfc_ctx *ctx,
 	ctx->idle_mode = idle_mode;
 }
 
+static inline int mfc_enc_get_ts_delta(struct mfc_ctx *ctx)
+{
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_enc_params *p = &enc->params;
+	int ts_delta = 0;
+
+	if (!ctx->src_ts.ts_last_interval) {
+		ts_delta = p->rc_framerate_res / p->rc_framerate;
+		mfc_ctx_debug(3, "[DFR] default delta: %d\n", ts_delta);
+	} else {
+		/*
+		 * FRAME_DELTA specifies the amount of
+		 * increment of frame modulo base time.
+		 * - delta unit = framerate resolution / fps
+		 * - fps = 1000000(usec per sec) / timestamp interval
+		 * For the sophistication of calculation, we will divide later.
+		 * Excluding H.263, resolution is fixed to 10000,
+		 * so thie is also divided into pre-calculated 100.
+		 * (Preventing both overflow and calculation duplication)
+		 */
+		ts_delta = ctx->src_ts.ts_last_interval / 100;
+	}
+	return ts_delta;
+}
+
 static inline void mfc_print_ctx_info(struct mfc_ctx *ctx)
 {
 	struct mfc_fmt *codec = NULL;
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc.c b/drivers/media/platform/samsung/exynos-mfc/mfc.c
index 293a353c49fa..db17448eae13 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc.c
@@ -1128,6 +1128,9 @@ struct mfc_ctx_buf_size mfc_ctx_buf_size = {
 	.h264_dec_ctx	= PAGE_ALIGN(0x200000),	/* 1.6MB */
 	.av1_dec_ctx	= PAGE_ALIGN(0x19000),	/* 100KB */
 	.other_dec_ctx	= PAGE_ALIGN(0xF000),	/*  60KB */
+	.h264_enc_ctx	= PAGE_ALIGN(0x19000),	/* 100KB */
+	.hevc_enc_ctx	= PAGE_ALIGN(0xC800),	/*  50KB */
+	.other_enc_ctx	= PAGE_ALIGN(0xC800),	/*  50KB */
 	.dbg_info_buf	= PAGE_ALIGN(0x1000),	/* 4KB for DEBUG INFO */
 };
 
-- 
2.34.1

