Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8F7BAB7A7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2F010E4D6;
	Tue, 30 Sep 2025 05:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="G/ayGLZg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B13310E271
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:14 +0000 (UTC)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20250930035713epoutp0471d0d87e0237a320ca2ea7f5c1433375~p80tAWZr62088220882epoutp04d
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:57:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20250930035713epoutp0471d0d87e0237a320ca2ea7f5c1433375~p80tAWZr62088220882epoutp04d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204634;
 bh=tH//wEKkPD0mN/XZ520+YyflOs5F52gB0k8S3h5mZBU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G/ayGLZgGahhf2uhehlA/hudw6NRUO7uLu/jFYNerpSAx+/wd7K35PsUwZOErbJo+
 jC9DUIwmEwqiVJKty9N5+tW6E7ni8UqVRRLd6t+tIR5iy7N+tWfQwzTTeImDUSDY5t
 PbwVUZiKSOVMCKkL6SPypr7Sh1pD1AJyLu4ky2Uw=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
 20250930035713epcas5p478f4a650374a4e43bc194fddcf2de024~p80sdri5X2850128501epcas5p4D;
 Tue, 30 Sep 2025 03:57:13 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.94]) by
 epsnrtp02.localdomain (Postfix) with ESMTP id 4cbPQJ2j9Tz2SSKX; Tue, 30 Sep
 2025 03:57:12 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20250930035711epcas5p437e54e8c277ee98149fccb2d984a0e55~p80rBiQCq2850128501epcas5p4-;
 Tue, 30 Sep 2025 03:57:11 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035707epsmtip12fab77d7330844e0539970d2f0511476~p80mvuVcm2931929319epsmtip1B;
 Tue, 30 Sep 2025 03:57:06 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 28/29] media: mfc: Add AVC, VP8, VP9, and HEVC encoding support
Date: Tue, 30 Sep 2025 09:33:47 +0530
Message-Id: <20250930040348.3702923-29-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035711epcas5p437e54e8c277ee98149fccb2d984a0e55
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035711epcas5p437e54e8c277ee98149fccb2d984a0e55
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
 <CGME20250930035711epcas5p437e54e8c277ee98149fccb2d984a0e55@epcas5p4.samsung.com>
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

- Introduce generic codec‑mode macros for MPEG‑4, VP8, VP9, HEVC
- Extend 4:2:2 format handling and IDR‑frame processing
- Suppress IVF headers for VP8/VP9 when disabled
- Enable multi‑core processing for HEVC and refine instance opening flow
- Expand mfc_enc_params with codec‑specific fields
  and raise resolution limits
- Add new V4L2 controls (profiles, levels, QP, hierarchical coding,
  golden frames, etc.)
- Implement VP9 HDR, colour‑space mapping, HEVC ROI,
  and extra debug logging

Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
---
 .../samsung/exynos-mfc/base/mfc_common.h      |  18 +-
 .../samsung/exynos-mfc/base/mfc_data_struct.h | 127 ++++
 .../samsung/exynos-mfc/mfc_core_enc_param.c   | 649 +++++++++++++++++-
 .../samsung/exynos-mfc/mfc_enc_v4l2.c         | 439 +++++++++++-
 4 files changed, 1211 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_common.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_common.h
index bec6f88d5e44..30865588b69a 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_common.h
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_common.h
@@ -172,6 +172,11 @@
 
 /* Encoder codec mode check */
 #define IS_H264_ENC(ctx)	((ctx)->codec_mode == MFC_REG_CODEC_H264_ENC)
+#define IS_MPEG4_ENC(ctx)	((ctx)->codec_mode == MFC_REG_CODEC_MPEG4_ENC)
+#define IS_H263_ENC(ctx)	((ctx)->codec_mode == MFC_REG_CODEC_H263_ENC)
+#define IS_VP8_ENC(ctx)		((ctx)->codec_mode == MFC_REG_CODEC_VP8_ENC)
+#define IS_HEVC_ENC(ctx)	((ctx)->codec_mode == MFC_REG_CODEC_HEVC_ENC)
+#define IS_VP9_ENC(ctx)		((ctx)->codec_mode == MFC_REG_CODEC_VP9_ENC)
 
 #define CODEC_NOT_CODED(ctx)	({							\
 	typeof(ctx) _ctx = (ctx);							\
@@ -195,7 +200,8 @@
 
 #define CODEC_422FORMAT(ctx)	({							\
 	typeof(ctx) _ctx = (ctx);							\
-	(IS_HEVC_DEC(_ctx) || IS_VP9_DEC(_ctx));			\
+	(IS_HEVC_DEC(_ctx) || IS_HEVC_ENC(_ctx) || IS_VP9_DEC(_ctx) ||			\
+	 IS_VP9_ENC(_ctx));								\
 })
 #define ON_RES_CHANGE(ctx)	({							\
 	typeof(ctx) _ctx = (ctx);							\
@@ -221,7 +227,7 @@
 #define CODEC_HAS_IDR(ctx)	({							\
 	typeof(ctx) _ctx = (ctx);							\
 	(IS_H264_DEC(_ctx) || IS_H264_MVC_DEC(_ctx) || IS_HEVC_DEC(_ctx) ||		\
-	 IS_H264_ENC(_ctx));					\
+	 IS_H264_ENC(_ctx) || IS_HEVC_ENC(_ctx));					\
 })
 
 // Buffer container
@@ -229,7 +235,8 @@
 #define IS_NO_HEADER_GENERATE(ctx, p)	({						\
 	typeof(ctx) _ctx = (ctx);							\
 	typeof(p) _p = (p);								\
-	(_p->seq_hdr_mode == V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME);	\
+	((_p->seq_hdr_mode == V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME) ||	\
+	 ((IS_VP8_ENC(_ctx) ||	IS_VP9_ENC(_ctx)) && _p->ivf_header_disable));		\
 })
 
 /*
@@ -332,6 +339,11 @@
 	 (OVER_UHD_RES(_ctx) && mfc_is_enc_bframe(_ctx)));			\
 })
 
+#define IS_MULTI_MODE_ENC_CONDITION(ctx)	({				\
+	typeof(ctx) _ctx = (ctx);						\
+	((IS_HEVC_ENC(_ctx) &&	IS_MULTI_MODE_ENC_RES(_ctx)));			\
+})
+
 #define IS_BLACKBAR_OFF(ctx)	((ctx)->crop_height > 2160)
 
 #define IS_SINGLE_FD(ctx, fmt)	((!(ctx)->rgb_bpp) && ((fmt)->mem_planes == 1))
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_data_struct.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_data_struct.h
index 6d34905a1cba..cb20b19b75cc 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_data_struct.h
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_data_struct.h
@@ -1246,6 +1246,129 @@ struct mfc_h264_enc_params {
 	u32 vui_enable;
 };
 
+/**
+ *
+ */
+struct mfc_mpeg4_enc_params {
+	/* MPEG4 Only */
+	enum v4l2_mpeg_video_mpeg4_profile profile;
+	u8 level;
+	u8 quarter_pixel;
+	u8 rc_b_frame_qp;
+	/* Common for MPEG4, H263 */
+	u8 rc_frame_qp;
+	u8 rc_min_qp;
+	u8 rc_max_qp;
+	u8 rc_min_qp_p;
+	u8 rc_max_qp_p;
+	u8 rc_min_qp_b;
+	u8 rc_max_qp_b;
+	u8 rc_p_frame_qp;
+	u16 vop_frm_delta;
+};
+
+/**
+ *
+ */
+struct mfc_vp9_enc_params {
+	/* VP9 Only */
+	u8 profile;
+	u8 level;
+	u8 rc_min_qp;
+	u8 rc_max_qp;
+	u8 rc_min_qp_p;
+	u8 rc_max_qp_p;
+	u8 rc_frame_qp;
+	u8 rc_p_frame_qp;
+	u16 vp9_gfrefreshperiod;
+	u8 vp9_goldenframesel;
+	u8 hier_qp_enable;
+	u8 num_hier_layer;
+	u8 hier_qp_layer[3];
+	u32 hier_bit_layer[3];
+	u8 max_partition_depth;
+	u8 intra_pu_split_disable;
+};
+
+/**
+ *
+ */
+struct mfc_vp8_enc_params {
+	/* VP8 Only */
+	u8 vp8_version;
+	u8 rc_min_qp;
+	u8 rc_max_qp;
+	u8 rc_min_qp_p;
+	u8 rc_max_qp_p;
+	u8 rc_frame_qp;
+	u8 rc_p_frame_qp;
+	u8 vp8_numberofpartitions;
+	u8 vp8_filterlevel;
+	u8 vp8_filtersharpness;
+	u16 vp8_gfrefreshperiod;
+	u8 vp8_goldenframesel;
+	u8 intra_4x4mode_disable;
+	u8 num_hier_layer;
+	u8 hier_qp_enable;
+	u8 hier_qp_layer[3];
+	u32 hier_bit_layer[3];
+};
+
+/**
+ *
+ */
+struct mfc_hevc_enc_params {
+	u8 profile;
+	u8 level;
+	u8 tier_flag;
+	/* HEVC Only */
+	u8 rc_min_qp;
+	u8 rc_max_qp;
+	u8 rc_min_qp_p;
+	u8 rc_max_qp_p;
+	u8 rc_min_qp_b;
+	u8 rc_max_qp_b;
+	u8 rc_lcu_dark;
+	u8 rc_lcu_smooth;
+	u8 rc_lcu_static;
+	u8 rc_lcu_activity;
+	u8 rc_frame_qp;
+	u8 rc_p_frame_qp;
+	u8 rc_b_frame_qp;
+	u8 max_partition_depth;
+	u8 refreshtype;
+	u16 refreshperiod;
+	s32 lf_beta_offset_div2;
+	s32 lf_tc_offset_div2;
+	u8 loopfilter_disable;
+	u8 loopfilter_across;
+	u8 nal_control_length_filed;
+	u8 nal_control_user_ref;
+	u8 nal_control_store_ref;
+	u8 const_intra_period_enable;
+	u8 lossless_cu_enable;
+	u8 wavefront_enable;
+	enum v4l2_mpeg_video_hevc_hier_coding_type hier_qp_type;
+	u8 enable_ltr;
+	u8 hier_qp_enable;
+	u8 hier_ref_type;
+	u8 num_hier_layer;
+	u32 hier_bit_layer[7];
+	u8 hier_qp_layer[7];
+	u8 general_pb_enable;
+	u8 temporal_id_enable;
+	u8 strong_intra_smooth;
+	u8 intra_pu_split_disable;
+	u8 tmv_prediction_disable;
+	u8 max_num_merge_mv;
+	u8 eco_mode_enable;
+	u8 encoding_nostartcode_enable;
+	u8 size_of_length_field;
+	u8 user_ref;
+	u8 store_ref;
+	u8 prepend_sps_pps_to_idr;
+};
+
 /**
  *
  */
@@ -1327,6 +1450,10 @@ struct mfc_enc_params {
 
 	union {
 		struct mfc_h264_enc_params h264;
+		struct mfc_mpeg4_enc_params mpeg4;
+		struct mfc_vp8_enc_params vp8;
+		struct mfc_vp9_enc_params vp9;
+		struct mfc_hevc_enc_params hevc;
 	} codec;
 };
 
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_enc_param.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_enc_param.c
index 9ff949df04ab..aea8d9c9b7ea 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_enc_param.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_enc_param.c
@@ -19,6 +19,20 @@
 #define CBR_I_LIMIT_WFD			6
 #define CBR_I_LIMIT_MAX			5
 
+static int mfc_colorspace_to_rgb_format_ctrl[][2] = {
+	{ MFC_COLORSPACE_UNSPECIFICED,	1}, /* Unknown */
+	{ MFC_COLORSPACE_BT601,		0}, /* Rec. ITU-R BT.601-7 */
+	{ MFC_COLORSPACE_BT709,		1}, /* Rec. ITU-R BT.709-6 */
+	{ MFC_COLORSPACE_SMPTE_170,	0}, /* SMPTE-170 */
+	{ MFC_COLORSPACE_SMPTE_240,	0}, /* SMPTE-240 */
+	{ MFC_COLORSPACE_BT2020,	1}, /* Rec. ITU-R BT.2020-2 */
+	{ MFC_COLORSPACE_RESERVED,	1}, /* Reserved */
+	{ MFC_COLORSPACE_SRGB,		1}, /* sRGB (IEC 61966-2-1) */
+	{ MFC_COLORSPACE_UNSPECIFICED,	1}, /* Unknown */
+	{ MFC_COLORSPACE_UNSPECIFICED,	1}, /* Unknown */
+	{ MFC_COLORSPACE_UNSPECIFICED,	1}, /* Unknown */
+};
+
 static int mfc_transfer_to_rgb_format_ctrl[][2] = {
 	{ MFC_TRANSFER_RESERVED,	1},
 	{ MFC_TRANSFER_BT709,		1},
@@ -226,6 +240,11 @@ static int __mfc_get_rgb_format_ctrl(struct mfc_ctx *ctx, struct mfc_enc_params
 	if (ctx->dev->pdata->enc_rgb_csc_by_fw) {
 		ret = 3;
 		mfc_ctx_debug(2, "[RGB] coefficients of CSC formula using VUI by F/W\n");
+	} else if (IS_VP9_ENC(ctx)) {
+		ret = mfc_colorspace_to_rgb_format_ctrl[p->colour_primaries][1];
+		mfc_ctx_debug(2, "[RGB] VP9 color space %d converts to RGB format ctrl %s\n",
+			      p->colour_primaries, ret ? "BT.709" : "BT.601");
+
 	} else {
 		ret = mfc_transfer_to_rgb_format_ctrl[p->transfer_characteristics][1];
 		mfc_ctx_debug(2, "[RGB] transfer %d converts to RGB format ctrl %s\n",
@@ -246,7 +265,8 @@ static void __mfc_set_video_signal_type(struct mfc_core *core, struct mfc_ctx *c
 		/* VIDEO_SIGNAL_TYPE_FLAG */
 		mfc_set_bits(reg, 0x1, 31, 0x1);
 		/* COLOUR_DESCRIPTION_PRESENT_FLAG */
-		mfc_set_bits(reg, 0x1, 24, 0x1);
+		if (!IS_VP9_ENC(ctx))
+			mfc_set_bits(reg, 0x1, 24, 0x1);
 	} else if (MFC_FEATURE_SUPPORT(dev, dev->pdata->color_aspect_enc) &&
 		   p->check_color_range) {
 		/* VIDEO_SIGNAL_TYPE_FLAG */
@@ -254,23 +274,29 @@ static void __mfc_set_video_signal_type(struct mfc_core *core, struct mfc_ctx *c
 		/* COLOR_RANGE */
 		if (!(ctx->src_fmt->type & MFC_FMT_RGB))
 			mfc_set_bits(reg, 0x1, 25, p->color_range);
-
-		if (p->colour_primaries &&
-		    p->transfer_characteristics &&
-		    p->matrix_coefficients != 3) {
-			/* COLOUR_DESCRIPTION_PRESENT_FLAG */
-			mfc_set_bits(reg, 0x1, 24, 0x1);
-			/* COLOUR_PRIMARIES */
-			mfc_set_bits(reg, 0xFF, 16, p->colour_primaries);
-			/* TRANSFER_CHARACTERISTICS */
-			mfc_set_bits(reg, 0xFF, 8, p->transfer_characteristics);
-			/* MATRIX_COEFFICIENTS */
-			mfc_set_bits(reg, 0xFF, 0, p->matrix_coefficients);
+		if (IS_VP9_ENC(ctx)) {
+			/* COLOR_SPACE: VP9 uses colour_primaries interface for color space */
+			mfc_set_bits(reg, 0x1F, 26, p->colour_primaries);
+			mfc_ctx_debug(2, "[HDR] VP9 ENC Color aspect: range(%s), space(%d)\n",
+				      p->color_range ? "Full" : "Limited", p->colour_primaries);
+		} else {
+			if (p->colour_primaries &&
+			    p->transfer_characteristics &&
+			    p->matrix_coefficients != 3) {
+				/* COLOUR_DESCRIPTION_PRESENT_FLAG */
+				mfc_set_bits(reg, 0x1, 24, 0x1);
+				/* COLOUR_PRIMARIES */
+				mfc_set_bits(reg, 0xFF, 16, p->colour_primaries);
+				/* TRANSFER_CHARACTERISTICS */
+				mfc_set_bits(reg, 0xFF, 8, p->transfer_characteristics);
+				/* MATRIX_COEFFICIENTS */
+				mfc_set_bits(reg, 0xFF, 0, p->matrix_coefficients);
+			}
+			mfc_ctx_debug(2, "[HDR] %s ENC Color aspect: range(%s), pri(%d), trans(%d), mat(%d)\n",
+				      IS_HEVC_ENC(ctx) ? "HEVC" : "H264",
+				      p->color_range ? "Full" : "Limited", p->colour_primaries,
+				      p->transfer_characteristics, p->matrix_coefficients);
 		}
-		mfc_ctx_debug(2, "[HDR] %s ENC Color aspect: range(%s), pri(%d), trans(%d), mat(%d)\n",
-			      "H264",
-			      p->color_range ? "Full" : "Limited", p->colour_primaries,
-			      p->transfer_characteristics, p->matrix_coefficients);
 	}
 	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_VIDEO_SIGNAL_TYPE);
 }
@@ -510,6 +536,9 @@ static void __mfc_set_enc_params(struct mfc_core *core, struct mfc_ctx *ctx)
 			if (IS_H264_ENC(ctx))
 				p->codec.h264.hier_qp_type =
 					V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P;
+			else if (IS_HEVC_ENC(ctx))
+				p->codec.hevc.hier_qp_type =
+					V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P;
 			mfc_ctx_info("forcely can't be use B frame for 8K or 4K %d fps\n", fps);
 		}
 		if (p->num_refs_for_p > 1) {
@@ -829,10 +858,596 @@ static void __mfc_set_enc_params_h264(struct mfc_core *core,
 	mfc_ctx_debug_leave();
 }
 
+static void __mfc_set_enc_params_mpeg4(struct mfc_core *core,
+				       struct mfc_ctx *ctx)
+{
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_enc_params *p = &enc->params;
+	struct mfc_mpeg4_enc_params *p_mpeg4 = &p->codec.mpeg4;
+	unsigned int reg = 0;
+
+	mfc_ctx_debug_enter();
+
+	p->rc_framerate_res = FRAME_RATE_RESOLUTION;
+	__mfc_set_enc_params(core, ctx);
+
+	/* set gop_size with I_FRM_CTRL mode */
+	__mfc_set_gop_size(core, ctx, 1);
+
+	/* profile & level */
+	reg = 0;
+	/** level */
+	mfc_set_bits(reg, 0xFF, 8, p_mpeg4->level);
+	/** profile - 0 ~ 1 */
+	mfc_set_bits(reg, 0x3F, 0, p_mpeg4->profile);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_PICTURE_PROFILE);
+
+	/* quarter_pixel */
+	/* MFC_CORE_RAW_WRITEL(p_mpeg4->quarter_pixel, MFC_REG_ENC_MPEG4_QUART_PXL); */
+
+	/* qp */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_FIXED_PICTURE_QP);
+	mfc_clear_set_bits(reg, 0xFF, 24, p->config_qp);
+	mfc_clear_set_bits(reg, 0xFF, 16, p_mpeg4->rc_b_frame_qp);
+	mfc_clear_set_bits(reg, 0xFF, 8, p_mpeg4->rc_p_frame_qp);
+	mfc_clear_set_bits(reg, 0xFF, 0, p_mpeg4->rc_frame_qp);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_FIXED_PICTURE_QP);
+
+	/* rate control config. */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_RC_CONFIG);
+	/** frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 0, p_mpeg4->rc_frame_qp);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_RC_CONFIG);
+
+	/* max & min value of QP for I frame */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_RC_QP_BOUND);
+	/** max I frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 8, p_mpeg4->rc_max_qp);
+	/** min I frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 0, p_mpeg4->rc_min_qp);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_RC_QP_BOUND);
+
+	/* max & min value of QP for P/B frame */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_RC_QP_BOUND_PB);
+	/** max B frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 24, p_mpeg4->rc_max_qp_b);
+	/** min B frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 16, p_mpeg4->rc_min_qp_b);
+	/** max P frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 8, p_mpeg4->rc_max_qp_p);
+	/** min P frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 0, p_mpeg4->rc_min_qp_p);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_RC_QP_BOUND_PB);
+
+	/* initialize for '0' only setting*/
+	MFC_CORE_RAW_WRITEL(0x0, MFC_REG_E_MPEG4_OPTIONS); /* SEQ_start only */
+	MFC_CORE_RAW_WRITEL(0x0, MFC_REG_E_MPEG4_HEC_PERIOD); /* SEQ_start only */
+
+	mfc_ctx_debug_leave();
+}
+
+static void __mfc_set_enc_params_h263(struct mfc_core *core,
+				      struct mfc_ctx *ctx)
+{
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_enc_params *p = &enc->params;
+	struct mfc_mpeg4_enc_params *p_mpeg4 = &p->codec.mpeg4;
+	unsigned int reg = 0;
+
+	mfc_ctx_debug_enter();
+
+	/* For H.263 only 8 bit is used and maximum value can be 0xFF */
+	p->rc_framerate_res = U8_MAX;
+	__mfc_set_enc_params(core, ctx);
+
+	/* set gop_size with I_FRM_CTRL mode */
+	__mfc_set_gop_size(core, ctx, 1);
+
+	/* profile & level: supports only baseline profile Level 70 */
+
+	/* qp */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_FIXED_PICTURE_QP);
+	mfc_clear_set_bits(reg, 0xFF, 24, p->config_qp);
+	mfc_clear_set_bits(reg, 0xFF, 8, p_mpeg4->rc_p_frame_qp);
+	mfc_clear_set_bits(reg, 0xFF, 0, p_mpeg4->rc_frame_qp);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_FIXED_PICTURE_QP);
+
+	/* rate control config. */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_RC_CONFIG);
+	/** frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 0, p_mpeg4->rc_frame_qp);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_RC_CONFIG);
+
+	/* max & min value of QP for I frame */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_RC_QP_BOUND);
+	/** max I frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 8, p_mpeg4->rc_max_qp);
+	/** min I frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 0, p_mpeg4->rc_min_qp);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_RC_QP_BOUND);
+
+	/* max & min value of QP for P/B frame */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_RC_QP_BOUND_PB);
+	/** max P frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 8, p_mpeg4->rc_max_qp_p);
+	/** min P frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 0, p_mpeg4->rc_min_qp_p);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_RC_QP_BOUND_PB);
+
+	mfc_ctx_debug_leave();
+}
+
+static void __mfc_set_enc_params_vp8(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_enc_params *p = &enc->params;
+	struct mfc_vp8_enc_params *p_vp8 = &p->codec.vp8;
+	unsigned int reg = 0;
+	int i;
+
+	mfc_ctx_debug_enter();
+
+	p->rc_framerate_res = FRAME_RATE_RESOLUTION;
+	__mfc_set_enc_params(core, ctx);
+
+	if (p_vp8->num_hier_layer & 0x3) {
+		/* set gop_size without i_frm_ctrl mode */
+		__mfc_set_gop_size(core, ctx, 0);
+	} else {
+		/* set gop_size with i_frm_ctrl mode */
+		__mfc_set_gop_size(core, ctx, 1);
+	}
+
+	/* profile*/
+	reg = 0;
+	mfc_set_bits(reg, 0xF, 0, p_vp8->vp8_version);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_PICTURE_PROFILE);
+
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_VP8_OPTION);
+	/* if num_refs_for_p is 2, the performance falls by half */
+	mfc_clear_set_bits(reg, 0x1, 0, (p->num_refs_for_p - 1));
+	/* vp8 partition is possible as below value: 1/2/4/8 */
+	if (p_vp8->vp8_numberofpartitions & 0x1) {
+		if (p_vp8->vp8_numberofpartitions > 1)
+			mfc_ctx_err("partition should be even num (%d)\n",
+				    p_vp8->vp8_numberofpartitions);
+		p_vp8->vp8_numberofpartitions = (p_vp8->vp8_numberofpartitions & ~0x1);
+	}
+	mfc_clear_set_bits(reg, 0xF, 3, p_vp8->vp8_numberofpartitions);
+	mfc_clear_set_bits(reg, 0x1, 10, p_vp8->intra_4x4mode_disable);
+	/* Temporal SVC - hier qp enable */
+	mfc_clear_set_bits(reg, 0x1, 11, p_vp8->hier_qp_enable);
+	/* Disable IVF header */
+	mfc_clear_set_bits(reg, 0x1, 12, p->ivf_header_disable);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_VP8_OPTION);
+
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_VP8_GOLDEN_FRAME_OPTION);
+	mfc_clear_set_bits(reg, 0x1, 0, p_vp8->vp8_goldenframesel);
+	mfc_clear_set_bits(reg, 0xFFFF, 1, p_vp8->vp8_gfrefreshperiod);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_VP8_GOLDEN_FRAME_OPTION);
+
+	/* Temporal SVC - layer number */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_NUM_T_LAYER);
+	mfc_clear_set_bits(reg, 0x7, 0, p_vp8->num_hier_layer);
+	mfc_clear_set_bits(reg, 0x7, 4, 0x3);
+	mfc_clear_set_bits(reg, 0x1, 8, p->hier_bitrate_ctrl);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_NUM_T_LAYER);
+	mfc_ctx_debug(3, "[HIERARCHICAL] hier_qp_enable %d, num_hier_layer %d, NUM_T_LAYER 0x%x\n",
+		      p_vp8->hier_qp_enable, p_vp8->num_hier_layer, reg);
+
+	/* QP & Bitrate for each layer */
+	for (i = 0; i < 3; i++) {
+		MFC_CORE_RAW_WRITEL(p_vp8->hier_qp_layer[i],
+				    MFC_REG_E_HIERARCHICAL_QP_LAYER0 + i * 4);
+		/* If hier_bitrate_ctrl is set to 1, this is meaningless */
+		MFC_CORE_RAW_WRITEL(p_vp8->hier_bit_layer[i],
+				    MFC_REG_E_HIERARCHICAL_BIT_RATE_LAYER0 + i * 4);
+		mfc_ctx_debug(3, "[HIERARCHICAL] layer[%d] QP: %#x, bitrate: %#x(FW ctrl: %d)\n",
+			      i, p_vp8->hier_qp_layer[i],
+			      p_vp8->hier_bit_layer[i], p->hier_bitrate_ctrl);
+	}
+
+	reg = 0;
+	mfc_set_bits(reg, 0x7, 0, p_vp8->vp8_filtersharpness);
+	mfc_set_bits(reg, 0x3F, 8, p_vp8->vp8_filterlevel);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_VP8_FILTER_OPTION);
+
+	/* qp */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_FIXED_PICTURE_QP);
+	mfc_clear_set_bits(reg, 0xFF, 24, p->config_qp);
+	mfc_clear_set_bits(reg, 0xFF, 8, p_vp8->rc_p_frame_qp);
+	mfc_clear_set_bits(reg, 0xFF, 0, p_vp8->rc_frame_qp);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_FIXED_PICTURE_QP);
+
+	/* rate control config. */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_RC_CONFIG);
+	/** frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 0, p_vp8->rc_frame_qp);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_RC_CONFIG);
+
+	/* max & min value of QP for I frame */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_RC_QP_BOUND);
+	/** max I frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 8, p_vp8->rc_max_qp);
+	/** min I frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 0, p_vp8->rc_min_qp);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_RC_QP_BOUND);
+
+	/* max & min value of QP for P/B frame */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_RC_QP_BOUND_PB);
+	/** max P frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 8, p_vp8->rc_max_qp_p);
+	/** min P frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 0, p_vp8->rc_min_qp_p);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_RC_QP_BOUND_PB);
+
+	mfc_ctx_debug_leave();
+}
+
+static void __mfc_enc_check_vp9_profile(struct mfc_ctx *ctx)
+{
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_enc_params *p = &enc->params;
+	struct mfc_vp9_enc_params *p_vp9 = &p->codec.vp9;
+
+	if (!ctx->is_422) {
+		/* YUV420 8bit format */
+		if (p_vp9->profile != MFC_REG_E_PROFILE_VP9_PROFILE0) {
+			mfc_ctx_err("4:2:0 format is not matched with profile(%d)\n",
+				    p_vp9->profile);
+			p_vp9->profile = MFC_REG_E_PROFILE_VP9_PROFILE0;
+		}
+	} else if (ctx->is_422) {
+		/* YUV422 8bit format */
+		if (p_vp9->profile != MFC_REG_E_PROFILE_VP9_PROFILE1) {
+			mfc_ctx_err("4:2:2 format is not matched with profile(%d)\n",
+				    p_vp9->profile);
+			p_vp9->profile = MFC_REG_E_PROFILE_VP9_PROFILE1;
+		}
+	}
+}
+
+static void __mfc_set_enc_params_vp9(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_enc_params *p = &enc->params;
+	struct mfc_vp9_enc_params *p_vp9 = &p->codec.vp9;
+	unsigned int reg = 0;
+	int i;
+
+	mfc_ctx_debug_enter();
+
+	p->rc_framerate_res = FRAME_RATE_RESOLUTION;
+	__mfc_set_enc_params(core, ctx);
+	__mfc_enc_check_vp9_profile(ctx);
+
+	if (p_vp9->num_hier_layer & 0x3) {
+		/* set gop_size without i_frm_ctrl mode */
+		__mfc_set_gop_size(core, ctx, 0);
+	} else {
+		/* set gop_size with i_frm_ctrl mode */
+		__mfc_set_gop_size(core, ctx, 1);
+	}
+
+	/* profile*/
+	reg = 0;
+	mfc_set_bits(reg, 0xF, 0, p_vp9->profile);
+	/* level */
+	mfc_set_bits(reg, 0xFF, 8, p_vp9->level);
+
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_PICTURE_PROFILE);
+
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_VP9_OPTION);
+	/* if num_refs_for_p is 2, the performance falls by half */
+	mfc_clear_set_bits(reg, 0x1, 0, (p->num_refs_for_p - 1));
+	mfc_clear_set_bits(reg, 0x1, 1, p_vp9->intra_pu_split_disable);
+	mfc_clear_set_bits(reg, 0x1, 3, p_vp9->max_partition_depth);
+	/* Temporal SVC - hier qp enable */
+	mfc_clear_set_bits(reg, 0x1, 11, p_vp9->hier_qp_enable);
+	/* Disable IVF header */
+	mfc_clear_set_bits(reg, 0x1, 12, p->ivf_header_disable);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_VP9_OPTION);
+
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_VP9_GOLDEN_FRAME_OPTION);
+	mfc_clear_set_bits(reg, 0x1, 0, p_vp9->vp9_goldenframesel);
+	mfc_clear_set_bits(reg, 0xFFFF, 1, p_vp9->vp9_gfrefreshperiod);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_VP9_GOLDEN_FRAME_OPTION);
+
+	/* Temporal SVC - layer number */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_NUM_T_LAYER);
+	mfc_clear_set_bits(reg, 0x7, 0, p_vp9->num_hier_layer);
+	mfc_clear_set_bits(reg, 0x7, 4, 0x3);
+	mfc_clear_set_bits(reg, 0x1, 8, p->hier_bitrate_ctrl);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_NUM_T_LAYER);
+	mfc_ctx_debug(3, "[HIERARCHICAL] hier_qp_enable %d, num_hier_layer %d, NUM_T_LAYER 0x%x\n",
+		      p_vp9->hier_qp_enable, p_vp9->num_hier_layer, reg);
+
+	/* QP & Bitrate for each layer */
+	for (i = 0; i < 3; i++) {
+		MFC_CORE_RAW_WRITEL(p_vp9->hier_qp_layer[i],
+				    MFC_REG_E_HIERARCHICAL_QP_LAYER0 + i * 4);
+		/* If hier_bitrate_ctrl is set to 1, this is meaningless */
+		MFC_CORE_RAW_WRITEL(p_vp9->hier_bit_layer[i],
+				    MFC_REG_E_HIERARCHICAL_BIT_RATE_LAYER0 + i * 4);
+		mfc_ctx_debug(3, "[HIERARCHICAL] layer[%d] QP: %#x, bitrate: %#x (FW ctrl: %d)\n",
+			      i, p_vp9->hier_qp_layer[i],
+			      p_vp9->hier_bit_layer[i], p->hier_bitrate_ctrl);
+	}
+
+	/* qp */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_FIXED_PICTURE_QP);
+	mfc_clear_set_bits(reg, 0xFF, 24, p->config_qp);
+	mfc_clear_set_bits(reg, 0xFF, 8, p_vp9->rc_p_frame_qp);
+	mfc_clear_set_bits(reg, 0xFF, 0, p_vp9->rc_frame_qp);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_FIXED_PICTURE_QP);
+
+	/* rate control config. */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_RC_CONFIG);
+	/** frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 0, p_vp9->rc_frame_qp);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_RC_CONFIG);
+
+	/* max & min value of QP for I frame */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_RC_QP_BOUND);
+	/** max I frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 8, p_vp9->rc_max_qp);
+	/** min I frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 0, p_vp9->rc_min_qp);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_RC_QP_BOUND);
+
+	/* max & min value of QP for P/B frame */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_RC_QP_BOUND_PB);
+	/** max P frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 8, p_vp9->rc_max_qp_p);
+	/** min P frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 0, p_vp9->rc_min_qp_p);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_RC_QP_BOUND_PB);
+
+	mfc_ctx_debug_leave();
+}
+
+static void __mfc_enc_check_hevc_profile(struct mfc_ctx *ctx)
+{
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_enc_params *p = &enc->params;
+	struct mfc_hevc_enc_params *p_hevc = &p->codec.hevc;
+
+	if (!ctx->is_422) {
+		/* YUV420 8bit format */
+		if (p_hevc->profile != MFC_REG_E_PROFILE_HEVC_MAIN &&
+		    p_hevc->profile != MFC_REG_E_PROFILE_HEVC_MAIN_10) {
+			mfc_ctx_err("4:2:0 format is not matched with profile(%d)\n",
+				    p_hevc->profile);
+			p_hevc->profile = MFC_REG_E_PROFILE_HEVC_MAIN;
+		}
+	} else if (ctx->is_422) {
+		/* YUV422 8bit format */
+		if (p_hevc->profile != MFC_REG_E_PROFILE_HEVC_MAIN_422_10_INTRA &&
+		    p_hevc->profile != MFC_REG_E_PROFILE_HEVC_MAIN_422_10) {
+			mfc_ctx_err("4:2:2 format is not matched with profile(%d)\n",
+				    p_hevc->profile);
+			p_hevc->profile = MFC_REG_E_PROFILE_HEVC_MAIN_422_10;
+		}
+	}
+}
+
+static void __mfc_set_enc_params_hevc(struct mfc_core *core,
+				      struct mfc_ctx *ctx)
+{
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_enc_params *p = &enc->params;
+	struct mfc_hevc_enc_params *p_hevc = &p->codec.hevc;
+	unsigned int mb = 0;
+	unsigned int reg = 0;
+	bool enable_stream_copy = false;
+	int i;
+
+	mfc_ctx_debug_enter();
+
+	p->rc_framerate_res = FRAME_RATE_RESOLUTION;
+	__mfc_set_enc_params(core, ctx);
+	__mfc_enc_check_hevc_profile(ctx);
+
+	if (p_hevc->num_hier_layer & 0x7) {
+		/* set gop_size without i_frm_ctrl mode */
+		__mfc_set_gop_size(core, ctx, 0);
+	} else {
+		/* set gop_size with i_frm_ctrl mode */
+		__mfc_set_gop_size(core, ctx, 1);
+	}
+
+	mb = WIDTH_MB((ctx)->crop_width) * HEIGHT_MB((ctx)->crop_height);
+	/* Level 6.0 case */
+	if (IS_LV60_MB(mb) && p_hevc->level < 60)
+		mfc_ctx_info("This resolution(mb: %d) recommends level6.0\n", mb);
+
+	/* Level 5.1 case */
+	if (IS_LV51_MB(mb) && p_hevc->level < 51)
+		mfc_ctx_info("This resolution(mb: %d) recommends level5.1\n", mb);
+
+	/* tier_flag & level & profile */
+	reg = 0;
+
+	/* profile */
+	if (ctx->multi_view_enable)
+		mfc_set_bits(reg, 0xF, 0, 0x6);
+	else
+		mfc_set_bits(reg, 0xF, 0, p_hevc->profile);
+
+	/* level */
+	mfc_set_bits(reg, 0xFF, 8, p_hevc->level);
+	/* tier_flag - 0 ~ 1 */
+	mfc_set_bits(reg, 0x1, 16, p_hevc->tier_flag);
+
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_PICTURE_PROFILE);
+
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_HEVC_OPTIONS);
+	/* max partition depth */
+	mfc_clear_set_bits(reg, 0x3, 0, p_hevc->max_partition_depth);
+	/* if num_refs_for_p is 2, the performance falls by half */
+	mfc_clear_set_bits(reg, 0x1, 2, (p->num_refs_for_p - 1));
+	mfc_clear_set_bits(reg, 0x3, 3, p_hevc->refreshtype);
+	mfc_clear_set_bits(reg, 0x1, 5, p_hevc->const_intra_period_enable);
+	mfc_clear_set_bits(reg, 0x1, 6, p_hevc->lossless_cu_enable);
+	mfc_clear_set_bits(reg, 0x1, 7, p_hevc->wavefront_enable);
+	mfc_clear_set_bits(reg, 0x1, 8, p_hevc->loopfilter_disable);
+	mfc_clear_set_bits(reg, 0x1, 9, p_hevc->loopfilter_across);
+	mfc_clear_set_bits(reg, 0x1, 10, p_hevc->enable_ltr);
+	mfc_clear_set_bits(reg, 0x1, 11, p_hevc->hier_qp_enable);
+	mfc_clear_set_bits(reg, 0x1, 13, p_hevc->general_pb_enable);
+	mfc_clear_set_bits(reg, 0x1, 14, p_hevc->temporal_id_enable);
+	mfc_clear_set_bits(reg, 0x1, 15, p_hevc->strong_intra_smooth);
+	mfc_clear_set_bits(reg, 0x1, 16, p_hevc->intra_pu_split_disable);
+	mfc_clear_set_bits(reg, 0x1, 17, p_hevc->tmv_prediction_disable);
+	mfc_clear_set_bits(reg, 0x7, 18, p_hevc->max_num_merge_mv);
+	mfc_clear_set_bits(reg, 0x1, 23, p_hevc->encoding_nostartcode_enable);
+	mfc_clear_set_bits(reg, 0x1, 26, p_hevc->prepend_sps_pps_to_idr);
+
+	/* Weighted Prediction enable */
+	mfc_clear_set_bits(reg, 0x1, 28, p->weighted_enable);
+	/* 30bit is 32x32 transform. If it is enabled, the performance falls by half */
+	mfc_clear_bits(reg, 0x1, 30);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_HEVC_OPTIONS);
+
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_HEVC_OPTIONS_2);
+	/* Timing info */
+	mfc_set_bits(reg, 0x1, 2, p->timing_info_enable);
+
+	// TODO : replace this magic number to define
+	mfc_clear_set_bits(reg, 0x1, 9, (ctx->stream_op_mode == MFC_OP_TWO_MODE1));
+	enable_stream_copy = ((ctx->stream_op_mode == MFC_OP_TWO_MODE1) &&
+			      !(dev->debugfs.feature_option & MFC_OPTION_STREAM_COPY_DISABLE));
+	mfc_clear_set_bits(reg, 0x1, 13, enable_stream_copy);
+
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_HEVC_OPTIONS_2);
+
+	/* refresh period */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_HEVC_REFRESH_PERIOD);
+	mfc_clear_set_bits(reg, 0xFFFF, 0, p_hevc->refreshperiod);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_HEVC_REFRESH_PERIOD);
+	/* loop filter setting */
+	MFC_CORE_RAW_WRITEL(0, MFC_REG_E_HEVC_LF_BETA_OFFSET_DIV2);
+	MFC_CORE_RAW_WRITEL(0, MFC_REG_E_HEVC_LF_TC_OFFSET_DIV2);
+	if (!p_hevc->loopfilter_disable) {
+		MFC_CORE_RAW_WRITEL
+			(p_hevc->lf_beta_offset_div2, MFC_REG_E_HEVC_LF_BETA_OFFSET_DIV2);
+		MFC_CORE_RAW_WRITEL
+			(p_hevc->lf_tc_offset_div2, MFC_REG_E_HEVC_LF_TC_OFFSET_DIV2);
+	}
+	/* long term reference */
+	if (p_hevc->enable_ltr) {
+		reg = 0;
+		mfc_set_bits(reg, 0x3, 0, p_hevc->store_ref);
+		mfc_set_bits(reg, 0x3, 2, p_hevc->user_ref);
+		MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_HEVC_NAL_CONTROL);
+	}
+
+	/* Temporal SVC - qp type, layer number */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_NUM_T_LAYER);
+	mfc_clear_set_bits(reg, 0x1, 3, p_hevc->hier_qp_type);
+	mfc_clear_set_bits(reg, 0x7, 0, p_hevc->num_hier_layer);
+	mfc_clear_bits(reg, 0x7, 4);
+	if (p_hevc->hier_ref_type) {
+		mfc_set_bits(reg, 0x1, 7, 0x1);
+		mfc_set_bits(reg, 0x7, 4, p->num_hier_max_layer);
+	} else {
+		mfc_clear_bits(reg, 0x1, 7);
+		mfc_set_bits(reg, 0x7, 4, p_hevc->num_hier_layer);
+	}
+	mfc_clear_set_bits(reg, 0x1, 8, p->hier_bitrate_ctrl);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_NUM_T_LAYER);
+	mfc_ctx_debug(3, "[HIERARCHICAL] hier_qp_enable %d, enable_ltr %d, ",
+		      p_hevc->hier_qp_enable, p_hevc->enable_ltr);
+	mfc_ctx_debug(3, "num_hier_layer %d, max_layer %d, hier_ref_type %d, NUM_T_LAYER 0x%x\n",
+		      p_hevc->num_hier_layer, p->num_hier_max_layer, p_hevc->hier_ref_type, reg);
+
+	/* QP & Bitrate for each layer */
+	for (i = 0; i < 7; i++) {
+		MFC_CORE_RAW_WRITEL(p_hevc->hier_qp_layer[i],
+				    MFC_REG_E_HIERARCHICAL_QP_LAYER0 + i * 4);
+		MFC_CORE_RAW_WRITEL(p_hevc->hier_bit_layer[i],
+				    MFC_REG_E_HIERARCHICAL_BIT_RATE_LAYER0 + i * 4);
+		mfc_ctx_debug(3, "[HIERARCHICAL] layer[%d] QP: %#x, bitrate: %d(FW ctrl: %d)\n",
+			      i, p_hevc->hier_qp_layer[i],
+			      p_hevc->hier_bit_layer[i], p->hier_bitrate_ctrl);
+	}
+
+	/* rate control config. */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_RC_CONFIG);
+	/** frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 0, p_hevc->rc_frame_qp);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_RC_CONFIG);
+
+	/* max & min value of QP for I frame */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_RC_QP_BOUND);
+	/** max I frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 8, p_hevc->rc_max_qp);
+	/** min I frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 0, p_hevc->rc_min_qp);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_RC_QP_BOUND);
+
+	/* max & min value of QP for P/B frame */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_RC_QP_BOUND_PB);
+	/** max B frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 24, p_hevc->rc_max_qp_b);
+	/** min B frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 16, p_hevc->rc_min_qp_b);
+	/** max P frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 8, p_hevc->rc_max_qp_p);
+	/** min P frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 0, p_hevc->rc_min_qp_p);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_RC_QP_BOUND_PB);
+
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_FIXED_PICTURE_QP);
+	mfc_clear_set_bits(reg, 0xFF, 24, p->config_qp);
+	mfc_clear_set_bits(reg, 0xFF, 16, p_hevc->rc_b_frame_qp);
+	mfc_clear_set_bits(reg, 0xFF, 8, p_hevc->rc_p_frame_qp);
+	mfc_clear_set_bits(reg, 0xFF, 0, p_hevc->rc_frame_qp);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_FIXED_PICTURE_QP);
+
+	/* chroma QP offset */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_HEVC_CHROMA_QP_OFFSET);
+	mfc_clear_set_bits(reg, 0x1F, 5, p->chroma_qp_offset_cr);
+	mfc_clear_set_bits(reg, 0x1F, 0, p->chroma_qp_offset_cb);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_HEVC_CHROMA_QP_OFFSET);
+
+	/* ROI enable: it must set on SEQ_START only for HEVC encoder */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_RC_ROI_CTRL);
+	mfc_clear_set_bits(reg, 0x1, 0, p->roi_enable);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_RC_ROI_CTRL);
+	mfc_ctx_debug(3, "[ROI] HEVC ROI %s\n", p->roi_enable ? "enable" : "disable");
+
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_HEVC_OPTIONS_2);
+	/* HDR_STATIC_INFO_ENABLE */
+	mfc_clear_bits(reg, 0x1, 0);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_HEVC_OPTIONS_2);
+
+	reg = MFC_CORE_READL(MFC_REG_E_MVC_INTER_VIEW_PREDICTION_ON);
+	mfc_clear_set_bits(reg, 0x1, 0, ctx->multi_view_enable);
+	/* LEFT_VIEW_ID */
+	mfc_clear_set_bits(reg, 0x3, 1, ctx->left_view_id);
+	/* RIGHT_VIEW_ID. Always opposite to left. */
+	mfc_clear_set_bits(reg, 0x3, 3, ctx->left_view_id ? 0 : 1);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_MVC_INTER_VIEW_PREDICTION_ON);
+
+	mfc_ctx_debug_leave();
+}
+
 int mfc_core_set_enc_params(struct mfc_core *core, struct mfc_ctx *ctx)
 {
 	if (IS_H264_ENC(ctx)) {
 		__mfc_set_enc_params_h264(core, ctx);
+	} else if (IS_MPEG4_ENC(ctx)) {
+		__mfc_set_enc_params_mpeg4(core, ctx);
+	} else if (IS_H263_ENC(ctx)) {
+		__mfc_set_enc_params_h263(core, ctx);
+	} else if (IS_VP8_ENC(ctx)) {
+		__mfc_set_enc_params_vp8(core, ctx);
+	} else if (IS_VP9_ENC(ctx)) {
+		__mfc_set_enc_params_vp9(core, ctx);
+	} else if (IS_HEVC_ENC(ctx)) {
+		__mfc_set_enc_params_hevc(core, ctx);
 	} else {
 		mfc_ctx_err("Unknown codec for encoding (%x)\n", ctx->codec_mode);
 		return -EINVAL;
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_enc_v4l2.c b/drivers/media/platform/samsung/exynos-mfc/mfc_enc_v4l2.c
index 84edebac82b2..386262623977 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_enc_v4l2.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_enc_v4l2.c
@@ -2667,10 +2667,33 @@ static int __mfc_enc_check_resolution(struct mfc_ctx *ctx)
 
 	/* Check max resolution */
 	switch (ctx->codec_mode) {
+	case MFC_REG_CODEC_HEVC_ENC:
+		if (ctx->is_422) {
+			max_width = 65536;
+			max_height = 8192;
+			swap_check = 1;
+		} else {
+			max_width = 8192;
+			max_height = 8192;
+		}
+		break;
 	case MFC_REG_CODEC_H264_ENC:
+	case MFC_REG_CODEC_VP8_ENC:
 		max_width = 8192;
 		max_height = 8192;
 		break;
+	case MFC_REG_CODEC_VP9_ENC:
+		max_width = 4096;
+		max_height = 8192;
+		break;
+	case MFC_REG_CODEC_MPEG4_ENC:
+		max_width = 2048;
+		max_height = 2048;
+		break;
+	case MFC_REG_CODEC_H263_ENC:
+		max_width = 2048;
+		max_height = 1152;
+		break;
 	default:
 		mfc_ctx_err("Not supported codec(%d)\n", ctx->codec_mode);
 		return -EINVAL;
@@ -2694,7 +2717,15 @@ static int __mfc_enc_check_resolution(struct mfc_ctx *ctx)
 
 	/* Check min resolution */
 	switch (ctx->codec_mode) {
+	case MFC_REG_CODEC_HEVC_ENC:
+	case MFC_REG_CODEC_VP9_ENC:
+		min_width = 64;
+		min_height = 64;
+		break;
 	case MFC_REG_CODEC_H264_ENC:
+	case MFC_REG_CODEC_VP8_ENC:
+	case MFC_REG_CODEC_MPEG4_ENC:
+	case MFC_REG_CODEC_H263_ENC:
 		min_width = 32;
 		min_height = 32;
 		break;
@@ -2767,7 +2798,8 @@ static int mfc_enc_s_fmt_vid_cap_mplane(struct file *file, void *priv,
 		mfc_ctx_err("Failed to instance open\n");
 
 	if (dev->pdata->support_enc_mode1 &&
-	    (dev->debugfs.feature_option & MFC_OPTION_SET_MULTI_CORE_FORCE)) {
+	    (IS_MULTI_MODE_ENC_CONDITION(ctx) ||
+	     (dev->debugfs.feature_option & MFC_OPTION_SET_MULTI_CORE_FORCE))) {
 		if (dev->debugfs.feature_option & MFC_OPTION_MULTI_CORE_DISABLE) {
 			mfc_ctx_info("[2CORE] multi core mode disabled\n");
 		} else {
@@ -3751,12 +3783,382 @@ static int __mfc_enc_set_param(struct mfc_ctx *ctx, struct v4l2_control *ctrl)
 		p->codec.h264.base_priority = ctrl->value;
 		p->codec.h264.set_priority = 1;
 		break;
+	case V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE:
+		switch ((enum v4l2_mpeg_video_mpeg4_profile)(ctrl->value)) {
+		case V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE:
+			p->codec.mpeg4.profile =
+				MFC_REG_E_PROFILE_MPEG4_SIMPLE;
+			break;
+		case V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE:
+			p->codec.mpeg4.profile =
+			MFC_REG_E_PROFILE_MPEG4_ADVANCED_SIMPLE;
+			break;
+		default:
+			ret = -EINVAL;
+		}
+		break;
+	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
+		p->codec.mpeg4.level =
+		__mfc_enc_mpeg4_level((enum v4l2_mpeg_video_mpeg4_level)(ctrl->value));
+		break;
+	case V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP:
+		p->codec.mpeg4.rc_frame_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP:
+		p->codec.mpeg4.rc_min_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP:
+		p->codec.mpeg4.rc_max_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP_P:
+		p->codec.mpeg4.rc_min_qp_p = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP_P:
+		p->codec.mpeg4.rc_max_qp_p = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP_B:
+		p->codec.mpeg4.rc_min_qp_b = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP_B:
+		p->codec.mpeg4.rc_max_qp_b = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MPEG4_QPEL:
+		p->codec.mpeg4.quarter_pixel = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MPEG4_P_FRAME_QP:
+		p->codec.mpeg4.rc_p_frame_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MPEG4_B_FRAME_QP:
+		p->codec.mpeg4.rc_b_frame_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_MPEG4_VOP_TIME_RES:
+		p->rc_framerate = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_MPEG4_VOP_FRM_DELTA:
+		p->codec.mpeg4.vop_frm_delta = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_H263_RC_FRAME_RATE:
+		p->rc_framerate = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:
+		p->codec.mpeg4.rc_frame_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H263_MIN_QP:
+		p->codec.mpeg4.rc_min_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H263_MAX_QP:
+		p->codec.mpeg4.rc_max_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H263_MIN_QP_P:
+		p->codec.mpeg4.rc_min_qp_p = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H263_MAX_QP_P:
+		p->codec.mpeg4.rc_max_qp_p = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:
+		p->codec.mpeg4.rc_p_frame_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC70_VIDEO_VP8_VERSION:
+		p->codec.vp8.vp8_version = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC70_VIDEO_VP8_RC_FRAME_RATE:
+		p->rc_framerate = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP8_MIN_QP:
+		p->codec.vp8.rc_min_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP8_MAX_QP:
+		p->codec.vp8.rc_max_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP8_MIN_QP_P:
+		p->codec.vp8.rc_min_qp_p = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP8_MAX_QP_P:
+		p->codec.vp8.rc_max_qp_p = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP8_I_FRAME_QP:
+		p->codec.vp8.rc_frame_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP8_P_FRAME_QP:
+		p->codec.vp8.rc_p_frame_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC70_VIDEO_VP8_NUM_OF_PARTITIONS:
+		p->codec.vp8.vp8_numberofpartitions = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC70_VIDEO_VP8_FILTER_LEVEL:
+		p->codec.vp8.vp8_filterlevel = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC70_VIDEO_VP8_FILTER_SHARPNESS:
+		p->codec.vp8.vp8_filtersharpness = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC70_VIDEO_VP8_GOLDEN_FRAMESEL:
+		p->codec.vp8.vp8_goldenframesel = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC70_VIDEO_VP8_GF_REFRESH_PERIOD:
+		p->codec.vp8.vp8_gfrefreshperiod = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC70_VIDEO_VP8_HIERARCHY_QP_ENABLE:
+		p->codec.vp8.hier_qp_enable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC70_VIDEO_VP8_HIERARCHY_QP_LAYER0:
+		p->codec.vp8.hier_qp_layer[(ctrl->value >> 16) & 0x3] =
+			ctrl->value & 0xFF;
+		break;
+	case V4L2_CID_MPEG_MFC70_VIDEO_VP8_HIERARCHY_QP_LAYER1:
+		p->codec.vp8.hier_qp_layer[(ctrl->value >> 16) & 0x3] =
+			ctrl->value & 0xFF;
+		break;
+	case V4L2_CID_MPEG_MFC70_VIDEO_VP8_HIERARCHY_QP_LAYER2:
+		p->codec.vp8.hier_qp_layer[(ctrl->value >> 16) & 0x3] =
+			ctrl->value & 0xFF;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP8_HIERARCHICAL_CODING_LAYER_BIT0:
+		p->codec.vp8.hier_bit_layer[0] = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP8_HIERARCHICAL_CODING_LAYER_BIT1:
+		p->codec.vp8.hier_bit_layer[1] = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP8_HIERARCHICAL_CODING_LAYER_BIT2:
+		p->codec.vp8.hier_bit_layer[2] = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC70_VIDEO_VP8_REF_NUMBER_FOR_PFRAMES:
+		p->num_refs_for_p = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC70_VIDEO_VP8_DISABLE_INTRA_MD4X4:
+		p->codec.vp8.intra_4x4mode_disable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC70_VIDEO_VP8_NUM_TEMPORAL_LAYER:
+		p->codec.vp8.num_hier_layer = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP9_VERSION:
+		p->codec.vp9.profile = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP9_RC_FRAME_RATE:
+		p->rc_framerate = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP9_MIN_QP:
+		p->codec.vp9.rc_min_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP9_MAX_QP:
+		p->codec.vp9.rc_max_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP9_MIN_QP_P:
+		p->codec.vp9.rc_min_qp_p = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP9_MAX_QP_P:
+		p->codec.vp9.rc_max_qp_p = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP9_I_FRAME_QP:
+		p->codec.vp9.rc_frame_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP9_P_FRAME_QP:
+		p->codec.vp9.rc_p_frame_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP9_GOLDEN_FRAMESEL:
+		p->codec.vp9.vp9_goldenframesel = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP9_GF_REFRESH_PERIOD:
+		p->codec.vp9.vp9_gfrefreshperiod = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP9_HIERARCHY_QP_ENABLE:
+		p->codec.vp9.hier_qp_enable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP9_HIERARCHICAL_CODING_LAYER_QP:
+		p->codec.vp9.hier_qp_layer[(ctrl->value >> 16) & 0x3] =
+			ctrl->value & 0xFF;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP9_HIERARCHICAL_CODING_LAYER_BIT0:
+		p->codec.vp9.hier_bit_layer[0] = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP9_HIERARCHICAL_CODING_LAYER_BIT1:
+		p->codec.vp9.hier_bit_layer[1] = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP9_HIERARCHICAL_CODING_LAYER_BIT2:
+		p->codec.vp9.hier_bit_layer[2] = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP9_REF_NUMBER_FOR_PFRAMES:
+		p->num_refs_for_p = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP9_HIERARCHICAL_CODING_LAYER:
+		p->codec.vp9.num_hier_layer = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP9_MAX_PARTITION_DEPTH:
+		p->codec.vp9.max_partition_depth = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP9_DISABLE_INTRA_PU_SPLIT:
+		p->codec.vp9.intra_pu_split_disable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_DISABLE_IVF_HEADER:
+		p->ivf_header_disable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
+		p->codec.vp9.profile = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
+		p->codec.vp9.level = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP:
+		p->codec.hevc.rc_frame_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP:
+		p->codec.hevc.rc_p_frame_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:
+		p->codec.hevc.rc_b_frame_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_RC_FRAME_RATE:
+		p->rc_framerate = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP:
+		p->codec.hevc.rc_min_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP:
+		p->codec.hevc.rc_max_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP_P:
+		p->codec.hevc.rc_min_qp_p = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP_P:
+		p->codec.hevc.rc_max_qp_p = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP_B:
+		p->codec.hevc.rc_min_qp_b = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP_B:
+		p->codec.hevc.rc_max_qp_b = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
+		p->codec.hevc.level = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
+		p->codec.hevc.profile = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_ADAPTIVE_RC_DARK:
+		p->codec.hevc.rc_lcu_dark = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_ADAPTIVE_RC_SMOOTH:
+		p->codec.hevc.rc_lcu_smooth = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_ADAPTIVE_RC_STATIC:
+		p->codec.hevc.rc_lcu_static = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_ADAPTIVE_RC_ACTIVITY:
+		p->codec.hevc.rc_lcu_activity = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_TIER_FLAG:
+		p->codec.hevc.tier_flag = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_MAX_PARTITION_DEPTH:
+		p->codec.hevc.max_partition_depth = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_REF_NUMBER_FOR_PFRAMES:
+		p->num_refs_for_p = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_REFRESH_TYPE:
+		p->codec.hevc.refreshtype = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_CONST_INTRA_PRED_ENABLE:
+		p->codec.hevc.const_intra_period_enable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_LOSSLESS_CU_ENABLE:
+		p->codec.hevc.lossless_cu_enable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_WAVEFRONT_ENABLE:
+		p->codec.hevc.wavefront_enable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_LF_DISABLE:
+		p->codec.hevc.loopfilter_disable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_LF_SLICE_BOUNDARY:
+		p->codec.hevc.loopfilter_across = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_LTR_ENABLE:
+		p->codec.hevc.enable_ltr = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_QP_ENABLE:
+		p->codec.hevc.hier_qp_enable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_TYPE:
+		p->codec.hevc.hier_qp_type =
+		(enum v4l2_mpeg_video_hevc_hier_coding_type)(ctrl->value);
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER:
+		p->codec.hevc.num_hier_layer = ctrl->value & 0x7;
+		p->codec.hevc.hier_ref_type = (ctrl->value >> 16) & 0x1;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_QP:
+		p->codec.hevc.hier_qp_layer[(ctrl->value >> 16) & 0x7] =
+			ctrl->value & 0xFF;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_BIT0:
+		p->codec.hevc.hier_bit_layer[0] = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_BIT1:
+		p->codec.hevc.hier_bit_layer[1] = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_BIT2:
+		p->codec.hevc.hier_bit_layer[2] = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_BIT3:
+		p->codec.hevc.hier_bit_layer[3] = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_BIT4:
+		p->codec.hevc.hier_bit_layer[4] = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_BIT5:
+		p->codec.hevc.hier_bit_layer[5] = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_BIT6:
+		p->codec.hevc.hier_bit_layer[6] = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_GENERAL_PB_ENABLE:
+		p->codec.hevc.general_pb_enable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_TEMPORAL_ID_ENABLE:
+		p->codec.hevc.temporal_id_enable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_STRONG_SMOTHING_FLAG:
+		p->codec.hevc.strong_intra_smooth = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_DISABLE_INTRA_PU_SPLIT:
+		p->codec.hevc.intra_pu_split_disable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_DISABLE_TMV_PREDICTION:
+		p->codec.hevc.tmv_prediction_disable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_MAX_NUM_MERGE_MV_MINUS1:
+		p->codec.hevc.max_num_merge_mv = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_WITHOUT_STARTCODE_ENABLE:
+		p->codec.hevc.encoding_nostartcode_enable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_REFRESH_PERIOD:
+		p->codec.hevc.refreshperiod = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_LF_BETA_OFFSET_DIV2:
+		p->codec.hevc.lf_beta_offset_div2 = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_LF_TC_OFFSET_DIV2:
+		p->codec.hevc.lf_tc_offset_div2 = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD:
+		p->codec.hevc.size_of_length_field = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_USER_REF:
+		p->codec.hevc.user_ref = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_STORE_REF:
+		p->codec.hevc.store_ref = ctrl->value;
+		break;
 	case V4L2_CID_MPEG_VIDEO_ROI_ENABLE:
 		p->roi_enable = ctrl->value;
 		break;
 	case V4L2_CID_MPEG_MFC_H264_VUI_RESTRICTION_ENABLE:
 		p->codec.h264.vui_enable = ctrl->value;
 		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_PREPEND_SPSPPS_TO_IDR:
+		p->codec.hevc.prepend_sps_pps_to_idr = ctrl->value;
+		break;
 	case V4L2_CID_MPEG_MFC_CONFIG_QP_ENABLE:
 		p->dynamic_qp = ctrl->value;
 		break;
@@ -3924,7 +4326,13 @@ static int __mfc_enc_set_ctrl_val_list(struct mfc_ctx *ctx,
 			ctx_ctrl->set.has_new = 1;
 			ctx_ctrl->set.val = ctrl->value;
 			if (ctx_ctrl->id ==
-				V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_CH) {
+				V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_CH ||
+				ctx_ctrl->id ==
+				V4L2_CID_MPEG_VIDEO_VP8_HIERARCHICAL_CODING_LAYER_CH ||
+				ctx_ctrl->id ==
+				V4L2_CID_MPEG_VIDEO_VP9_HIERARCHICAL_CODING_LAYER_CH ||
+				ctx_ctrl->id ==
+				V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_CH) {
 				if (enc->sh_handle_svc.fd == -1) {
 					enc->sh_handle_svc.fd = ctrl->value;
 					if (mfc_mem_get_user_shared_handle
@@ -3984,17 +4392,44 @@ static int __mfc_enc_set_ctrl_val(struct mfc_ctx *ctx, struct v4l2_control *ctrl
 	case V4L2_CID_MPEG_VIDEO_QOS_RATIO:
 		break;
 	case V4L2_CID_MPEG_VIDEO_H264_MAX_QP:
+	case V4L2_CID_MPEG_VIDEO_H263_MAX_QP:
+	case V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP:
+	case V4L2_CID_MPEG_VIDEO_VP8_MAX_QP:
+	case V4L2_CID_MPEG_VIDEO_VP9_MAX_QP:
+	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP:
 	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP:
+	case V4L2_CID_MPEG_VIDEO_H263_MIN_QP:
+	case V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP:
+	case V4L2_CID_MPEG_VIDEO_VP8_MIN_QP:
+	case V4L2_CID_MPEG_VIDEO_VP9_MIN_QP:
+	case V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP:
 	case V4L2_CID_MPEG_VIDEO_H264_MAX_QP_P:
+	case V4L2_CID_MPEG_VIDEO_H263_MAX_QP_P:
+	case V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP_P:
+	case V4L2_CID_MPEG_VIDEO_VP8_MAX_QP_P:
+	case V4L2_CID_MPEG_VIDEO_VP9_MAX_QP_P:
+	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP_P:
 	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP_P:
+	case V4L2_CID_MPEG_VIDEO_H263_MIN_QP_P:
+	case V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP_P:
+	case V4L2_CID_MPEG_VIDEO_VP8_MIN_QP_P:
+	case V4L2_CID_MPEG_VIDEO_VP9_MIN_QP_P:
+	case V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP_P:
 	case V4L2_CID_MPEG_VIDEO_H264_MAX_QP_B:
+	case V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP_B:
+	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP_B:
 	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP_B:
+	case V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP_B:
+	case V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP_B:
 	case V4L2_CID_MPEG_MFC51_VIDEO_FRAME_TAG:
 	case V4L2_CID_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE:
 	case V4L2_CID_MPEG_MFC51_VIDEO_I_PERIOD_CH:
 	case V4L2_CID_MPEG_MFC51_VIDEO_FRAME_RATE_CH:
 	case V4L2_CID_MPEG_MFC51_VIDEO_BIT_RATE_CH:
 	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_CH:
+	case V4L2_CID_MPEG_VIDEO_VP8_HIERARCHICAL_CODING_LAYER_CH:
+	case V4L2_CID_MPEG_VIDEO_VP9_HIERARCHICAL_CODING_LAYER_CH:
+	case V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_CH:
 	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
 	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
 	case V4L2_CID_MPEG_MFC_H264_MARK_LTR:
-- 
2.34.1

