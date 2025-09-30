Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0C7BAB7CE
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF77F10E4E2;
	Tue, 30 Sep 2025 05:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="D7JNlpT1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBCB10E4BE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:07 +0000 (UTC)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250930035650epoutp013c44b7dbdda2fc3e03f02c6c77e71121~p80XKeWaE2952829528epoutp01b
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:56:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250930035650epoutp013c44b7dbdda2fc3e03f02c6c77e71121~p80XKeWaE2952829528epoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204610;
 bh=FRlzfMbQXPkh6PtdyInbjSItki1kicdByfqh3BQZpvQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D7JNlpT1Vo/uKExsPIAQ0vj8rOv/7gy1FyJvXGIoNXM0VAqQsU7//+oJF6cxpYH8c
 Nhokfz3B3nDXki1dW5KaDrvtfLaJg5a26nR6xpJLl5nKW36fznOk80jKoPSVDcT/RF
 qn2DekTRWYcOxCFWRAL0nJUaXpzr+C2qXKBCw9vk=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
 20250930035648epcas5p1bcfc137b71de0107d684089a0db0af02~p80VrfTLi2306123061epcas5p1p;
 Tue, 30 Sep 2025 03:56:48 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.94]) by
 epsnrtp01.localdomain (Postfix) with ESMTP id 4cbPPq64Zqz6B9mB; Tue, 30 Sep
 2025 03:56:47 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20250930035646epcas5p2f4a9694c7f89ffe27384f8b7b8227802~p80Tw1LC70812408124epcas5p2i;
 Tue, 30 Sep 2025 03:56:46 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035644epsmtip1ba8c3ef96b0eca6504d23b66b64064d6~p80RVraPo2931929319epsmtip10;
 Tue, 30 Sep 2025 03:56:44 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 21/29] =?UTF-8?q?media:=20mfc:=20Add=20multi=E2=80=91codec?=
 =?UTF-8?q?=20support=20&=20QoS=20improvements?=
Date: Tue, 30 Sep 2025 09:33:40 +0530
Message-Id: <20250930040348.3702923-22-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035646epcas5p2f4a9694c7f89ffe27384f8b7b8227802
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035646epcas5p2f4a9694c7f89ffe27384f8b7b8227802
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
 <CGME20250930035646epcas5p2f4a9694c7f89ffe27384f8b7b8227802@epcas5p2.samsung.com>
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

- Enable HEVC, AV1, VP8/9, MPEG‑4 (incl. MVC, VC‑1 RCV) .
- Extend DPB/buffer structures for AV1 and high‑resolution/multiframe
  streams.
- Add codec‑specific QoS weight parameters (10‑bit, 4:2:2, B‑frames)
  and update DT bandwidth entries.
- Enhance format tables with colour‑range/space and HDR parsing for VP9.
- Detect display‑resolution changes and multiframe flags for VP9/AV1.
- Introduce utility helpers (CRC, aspect‑ratio, colour primaries)
  and minor safety fixes.

Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
---
 .../samsung/exynos-mfc/base/mfc_buf.c         |  70 +++++++++
 .../samsung/exynos-mfc/base/mfc_common.h      |  42 ++++-
 .../samsung/exynos-mfc/base/mfc_data_struct.h |  20 +++
 .../samsung/exynos-mfc/base/mfc_format.h      | 136 ++++++++++++++++
 .../samsung/exynos-mfc/base/mfc_qos.c         |  58 +++++++
 .../samsung/exynos-mfc/base/mfc_queue.c       |   5 +
 .../samsung/exynos-mfc/base/mfc_utils.c       |   8 +-
 .../media/platform/samsung/exynos-mfc/mfc.c   |  53 +++++++
 .../platform/samsung/exynos-mfc/mfc_core.c    |   2 +
 .../samsung/exynos-mfc/mfc_core_buf_ctrl.c    |   9 ++
 .../samsung/exynos-mfc/mfc_core_cmd.c         |  11 ++
 .../samsung/exynos-mfc/mfc_core_isr.c         | 147 ++++++++++++++++--
 .../samsung/exynos-mfc/mfc_core_reg_api.c     |  46 +++++-
 .../samsung/exynos-mfc/mfc_core_reg_api.h     |  75 ++++++++-
 .../samsung/exynos-mfc/mfc_core_run.c         |   4 +
 .../platform/samsung/exynos-mfc/mfc_dec_vb2.c |   1 +
 16 files changed, 665 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.c b/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.c
index bd1baf34e0b0..84f97ca230bb 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.c
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.c
@@ -116,8 +116,25 @@ int mfc_alloc_instance_context(struct mfc_core_ctx *core_ctx)
 	switch (ctx->codec_mode) {
 	case MFC_REG_CODEC_H264_DEC:
 	case MFC_REG_CODEC_H264_MVC_DEC:
+	case MFC_REG_CODEC_HEVC_DEC:
 		core_ctx->instance_ctx_buf.size = buf_size->h264_dec_ctx;
 		break;
+	case MFC_REG_CODEC_MPEG4_DEC:
+	case MFC_REG_CODEC_H263_DEC:
+	case MFC_REG_CODEC_VC1_RCV_DEC:
+	case MFC_REG_CODEC_VC1_DEC:
+	case MFC_REG_CODEC_MPEG2_DEC:
+	case MFC_REG_CODEC_VP8_DEC:
+	case MFC_REG_CODEC_VP9_DEC:
+	case MFC_REG_CODEC_FIMV1_DEC:
+	case MFC_REG_CODEC_FIMV2_DEC:
+	case MFC_REG_CODEC_FIMV3_DEC:
+	case MFC_REG_CODEC_FIMV4_DEC:
+		core_ctx->instance_ctx_buf.size = buf_size->other_dec_ctx;
+		break;
+	case MFC_REG_CODEC_AV1_DEC:
+		core_ctx->instance_ctx_buf.size = buf_size->av1_dec_ctx;
+		break;
 	default:
 		core_ctx->instance_ctx_buf.size = 0;
 		mfc_err("Codec type(%d) should be checked!\n", ctx->codec_mode);
@@ -155,6 +172,59 @@ static void __mfc_dec_calc_codec_buffer_size(struct mfc_core_ctx *core_ctx)
 	/* Codecs have different memory requirements */
 	switch (ctx->codec_mode) {
 	case MFC_REG_CODEC_H264_DEC:
+	case MFC_REG_CODEC_H264_MVC_DEC:
+		ctx->scratch_buf_size = ALIGN(ctx->scratch_buf_size, SZ_256);
+		core_ctx->codec_buf.size = ctx->scratch_buf_size;
+		ctx->mv_buf.size = dec->mv_count * ctx->mv_size;
+		break;
+	case MFC_REG_CODEC_MPEG4_DEC:
+	case MFC_REG_CODEC_FIMV1_DEC:
+	case MFC_REG_CODEC_FIMV2_DEC:
+	case MFC_REG_CODEC_FIMV3_DEC:
+	case MFC_REG_CODEC_FIMV4_DEC:
+		ctx->scratch_buf_size = ALIGN(ctx->scratch_buf_size, SZ_256);
+		if (dec->loop_filter_mpeg4) {
+			ctx->loopfilter_luma_size = ALIGN(ctx->raw_buf.plane_size[0], SZ_256);
+			ctx->loopfilter_chroma_size = ALIGN(ctx->raw_buf.plane_size[1] +
+							ctx->raw_buf.plane_size[2], SZ_256);
+			core_ctx->codec_buf.size = ctx->scratch_buf_size +
+				(NUM_MPEG4_LF_BUF * (ctx->loopfilter_luma_size +
+						     ctx->loopfilter_chroma_size));
+		} else {
+			core_ctx->codec_buf.size = ctx->scratch_buf_size;
+		}
+		break;
+	case MFC_REG_CODEC_VC1_RCV_DEC:
+	case MFC_REG_CODEC_VC1_DEC:
+		ctx->scratch_buf_size = ALIGN(ctx->scratch_buf_size, SZ_256);
+		core_ctx->codec_buf.size = ctx->scratch_buf_size;
+		break;
+	case MFC_REG_CODEC_MPEG2_DEC:
+		ctx->scratch_buf_size = ALIGN(ctx->scratch_buf_size, SZ_256);
+		core_ctx->codec_buf.size = ctx->scratch_buf_size;
+		break;
+	case MFC_REG_CODEC_H263_DEC:
+		ctx->scratch_buf_size = ALIGN(ctx->scratch_buf_size, SZ_256);
+		core_ctx->codec_buf.size = ctx->scratch_buf_size;
+		break;
+	case MFC_REG_CODEC_VP8_DEC:
+		ctx->scratch_buf_size = ALIGN(ctx->scratch_buf_size, SZ_256);
+		core_ctx->codec_buf.size = ctx->scratch_buf_size;
+		break;
+	case MFC_REG_CODEC_VP9_DEC:
+		ctx->scratch_buf_size = ALIGN(ctx->scratch_buf_size, SZ_256);
+		core_ctx->codec_buf.size =
+			ctx->scratch_buf_size +
+			DEC_STATIC_BUFFER_SIZE;
+		break;
+	case MFC_REG_CODEC_AV1_DEC:
+		ctx->scratch_buf_size = ALIGN(ctx->scratch_buf_size, SZ_256);
+		core_ctx->codec_buf.size =
+			ctx->scratch_buf_size +
+			DEC_AV1_STATIC_BUFFER_SIZE(ctx->img_width, ctx->img_height);
+		ctx->mv_buf.size = dec->mv_count * ctx->mv_size;
+		break;
+	case MFC_REG_CODEC_HEVC_DEC:
 		ctx->scratch_buf_size = ALIGN(ctx->scratch_buf_size, SZ_256);
 		core_ctx->codec_buf.size = ctx->scratch_buf_size;
 		ctx->mv_buf.size = dec->mv_count * ctx->mv_size;
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_common.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_common.h
index de22c28d1625..5392c8566e42 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_common.h
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_common.h
@@ -153,7 +153,47 @@
 
 /* Decoder codec mode check */
 #define IS_H264_DEC(ctx)	((ctx)->codec_mode == MFC_REG_CODEC_H264_DEC)
+#define IS_H264_MVC_DEC(ctx)	((ctx)->codec_mode == MFC_REG_CODEC_H264_MVC_DEC)
+#define IS_MPEG4_DEC(ctx)	((ctx)->codec_mode == MFC_REG_CODEC_MPEG4_DEC)
+#define IS_FIMV1_DEC(ctx)	((ctx)->codec_mode == MFC_REG_CODEC_FIMV1_DEC)
+#define IS_FIMV2_DEC(ctx)	((ctx)->codec_mode == MFC_REG_CODEC_FIMV2_DEC)
+#define IS_FIMV3_DEC(ctx)	((ctx)->codec_mode == MFC_REG_CODEC_FIMV3_DEC)
+#define IS_FIMV4_DEC(ctx)	((ctx)->codec_mode == MFC_REG_CODEC_FIMV4_DEC)
+#define IS_VC1_DEC(ctx)		((ctx)->codec_mode == MFC_REG_CODEC_VC1_DEC)
+#define IS_VC1_RCV_DEC(ctx)	((ctx)->codec_mode == MFC_REG_CODEC_VC1_RCV_DEC)
+#define IS_MPEG2_DEC(ctx)	((ctx)->codec_mode == MFC_REG_CODEC_MPEG2_DEC)
+#define IS_HEVC_DEC(ctx)	((ctx)->codec_mode == MFC_REG_CODEC_HEVC_DEC)
+#define IS_VP8_DEC(ctx)		((ctx)->codec_mode == MFC_REG_CODEC_VP8_DEC)
+#define IS_VP9_DEC(ctx)		((ctx)->codec_mode == MFC_REG_CODEC_VP9_DEC)
+#define IS_AV1_DEC(ctx)		((ctx)->codec_mode == MFC_REG_CODEC_AV1_DEC)
+#define IS_MV_HEVC_DEC(ctx, profile)							\
+	((ctx)->codec_mode == MFC_REG_CODEC_HEVC_DEC &&					\
+	 (profile) == MFC_REG_D_PROFILE_MULTIVIEW_HEVC_MAIN)
+
+#define CODEC_NOT_CODED(ctx)	({							\
+	typeof(ctx) _ctx = (ctx);							\
+	(IS_MPEG4_DEC(_ctx) || IS_VC1_DEC(_ctx) || IS_VC1_RCV_DEC(_ctx) ||		\
+	 IS_VP9_DEC(_ctx));								\
+})
+#define CODEC_INTERLACED(ctx)	({							\
+	typeof(ctx) _ctx = (ctx);							\
+	(IS_H264_DEC(_ctx) || IS_H264_MVC_DEC(_ctx) || IS_MPEG2_DEC(_ctx) ||		\
+	 IS_MPEG4_DEC(_ctx) || IS_VC1_DEC(_ctx) || IS_VC1_RCV_DEC(_ctx));		\
+})
+#define CODEC_MBAFF(ctx)	({							\
+	typeof(ctx) _ctx = (ctx);							\
+	(IS_H264_DEC(_ctx) || IS_H264_MVC_DEC(_ctx));					\
+})
+#define CODEC_MULTIFRAME(ctx)	({							\
+	typeof(ctx) _ctx = (ctx);							\
+	(IS_MPEG4_DEC(_ctx) ||	IS_VP9_DEC(_ctx) || IS_FIMV2_DEC(_ctx) ||		\
+	 IS_FIMV3_DEC(_ctx) ||	IS_FIMV4_DEC(_ctx) || IS_AV1_DEC(_ctx));		\
+})
 
+#define CODEC_422FORMAT(ctx)	({							\
+	typeof(ctx) _ctx = (ctx);							\
+	(IS_HEVC_DEC(_ctx) || IS_VP9_DEC(_ctx));			\
+})
 #define ON_RES_CHANGE(ctx)	({							\
 	typeof(ctx) _ctx = (ctx);							\
 	((_ctx->state >= MFCINST_RES_CHANGE_INIT) &&					\
@@ -177,7 +217,7 @@
 })
 #define CODEC_HAS_IDR(ctx)	({							\
 	typeof(ctx) _ctx = (ctx);							\
-	(IS_H264_DEC(_ctx));		\
+	(IS_H264_DEC(_ctx) || IS_H264_MVC_DEC(_ctx) || IS_HEVC_DEC(_ctx));		\
 })
 
 /*
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_data_struct.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_data_struct.h
index 34b4b13b4f01..6b93fe3ab138 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_data_struct.h
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_data_struct.h
@@ -503,6 +503,8 @@ struct mfc_fw {
 struct mfc_ctx_buf_size {
 	size_t dev_ctx;
 	size_t h264_dec_ctx;
+	size_t av1_dec_ctx;
+	size_t other_dec_ctx;
 	size_t dbg_info_buf;
 };
 
@@ -710,6 +712,14 @@ struct mfc_bw_data {
 
 struct mfc_bw_info {
 	struct mfc_bw_data bw_dec_h264;
+	struct mfc_bw_data bw_dec_hevc;
+	struct mfc_bw_data bw_dec_hevc_10bit;
+	struct mfc_bw_data bw_dec_vp8;
+	struct mfc_bw_data bw_dec_vp9;
+	struct mfc_bw_data bw_dec_vp9_10bit;
+	struct mfc_bw_data bw_dec_av1;
+	struct mfc_bw_data bw_dec_av1_10bit;
+	struct mfc_bw_data bw_dec_mpeg4;
 };
 
 /*
@@ -723,6 +733,7 @@ struct mfc_qos {
 	unsigned int freq_int;
 	unsigned int freq_mif;
 	unsigned int mo_value;
+	unsigned int mo_10bit_value;
 	unsigned int time_fw;
 	unsigned int bts_scen_idx;
 	const char *name;
@@ -747,8 +758,17 @@ struct mfc_qos_ctrl {
 
 struct mfc_qos_weight {
 	unsigned int weight_h264_hevc;
+	unsigned int weight_vp8_vp9;
+	unsigned int weight_av1;
+	unsigned int weight_other_codec;
 	unsigned int weight_3plane;
+	unsigned int weight_10bit;
+	unsigned int weight_422;
+	unsigned int weight_bframe;
+	unsigned int weight_num_of_ref;
+	unsigned int weight_gpb;
 	unsigned int weight_num_of_tile;
+	unsigned int weight_super64_bframe;
 	unsigned int weight_mbaff;
 };
 
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_format.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_format.h
index 3307c2eeaebb..0d48f2373e8d 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_format.h
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_format.h
@@ -127,6 +127,142 @@ static struct mfc_fmt mfc_formats[] = {
 		.num_planes = 1,
 		.mem_planes = 1,
 	},
+	{
+		.name = "DEC H264/MVC",
+		.fourcc = V4L2_PIX_FMT_H264_MVC,
+		.codec_mode = MFC_REG_CODEC_H264_MVC_DEC,
+		.type = MFC_FMT_STREAM | MFC_FMT_DEC,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+	{
+		.name = "DEC H263",
+		.fourcc = V4L2_PIX_FMT_H263,
+		.codec_mode = MFC_REG_CODEC_H263_DEC,
+		.type = MFC_FMT_STREAM | MFC_FMT_DEC,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+	{
+		.name = "DEC MPEG1",
+		.fourcc = V4L2_PIX_FMT_MPEG1,
+		.codec_mode = MFC_REG_CODEC_MPEG2_DEC,
+		.type = MFC_FMT_STREAM | MFC_FMT_DEC,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+	{
+		.name = "DEC MPEG2",
+		.fourcc = V4L2_PIX_FMT_MPEG2,
+		.codec_mode = MFC_REG_CODEC_MPEG2_DEC,
+		.type = MFC_FMT_STREAM | MFC_FMT_DEC,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+	{
+		.name = "DEC MPEG4",
+		.fourcc = V4L2_PIX_FMT_MPEG4,
+		.codec_mode = MFC_REG_CODEC_MPEG4_DEC,
+		.type = MFC_FMT_STREAM | MFC_FMT_DEC,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+	{
+		.name = "DEC FIMV",
+		.fourcc = V4L2_PIX_FMT_FIMV,
+		.codec_mode = MFC_REG_CODEC_MPEG4_DEC,
+		.type = MFC_FMT_STREAM | MFC_FMT_DEC,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+	{
+		.name = "DEC FIMV1",
+		.fourcc = V4L2_PIX_FMT_FIMV1,
+		.codec_mode = MFC_REG_CODEC_FIMV1_DEC,
+		.type = MFC_FMT_STREAM | MFC_FMT_DEC,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+	{
+		.name = "DEC FIMV2",
+		.fourcc = V4L2_PIX_FMT_FIMV2,
+		.codec_mode = MFC_REG_CODEC_FIMV2_DEC,
+		.type = MFC_FMT_STREAM | MFC_FMT_DEC,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+	{
+		.name = "DEC FIMV3",
+		.fourcc = V4L2_PIX_FMT_FIMV3,
+		.codec_mode = MFC_REG_CODEC_FIMV3_DEC,
+		.type = MFC_FMT_STREAM | MFC_FMT_DEC,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+	{
+		.name = "DEC FIMV4",
+		.fourcc = V4L2_PIX_FMT_FIMV4,
+		.codec_mode = MFC_REG_CODEC_FIMV4_DEC,
+		.type = MFC_FMT_STREAM | MFC_FMT_DEC,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+	{
+		.name = "DEC XviD",
+		.fourcc = V4L2_PIX_FMT_XVID,
+		.codec_mode = MFC_REG_CODEC_MPEG4_DEC,
+		.type = MFC_FMT_STREAM | MFC_FMT_DEC,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+	{
+		.name = "DEC VC1",
+		.fourcc = V4L2_PIX_FMT_VC1_ANNEX_G,
+		.codec_mode = MFC_REG_CODEC_VC1_DEC,
+		.type = MFC_FMT_STREAM | MFC_FMT_DEC,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+	{
+		.name = "DEC VC1 RCV",
+		.fourcc = V4L2_PIX_FMT_VC1_ANNEX_L,
+		.codec_mode = MFC_REG_CODEC_VC1_RCV_DEC,
+		.type = MFC_FMT_STREAM | MFC_FMT_DEC,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+	{
+		.name = "DEC VP8",
+		.fourcc = V4L2_PIX_FMT_VP8,
+		.codec_mode = MFC_REG_CODEC_VP8_DEC,
+		.type = MFC_FMT_STREAM | MFC_FMT_DEC,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+	{
+		.name = "DEC VP9",
+		.fourcc = V4L2_PIX_FMT_VP9,
+		.codec_mode = MFC_REG_CODEC_VP9_DEC,
+		.type = MFC_FMT_STREAM | MFC_FMT_DEC,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+	{
+		.name = "DEC AV1",
+		.fourcc = V4L2_PIX_FMT_AV1,
+		.codec_mode = MFC_REG_CODEC_AV1_DEC,
+		.type = MFC_FMT_STREAM | MFC_FMT_DEC,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+	{
+		.name = "DEC HEVC",
+		.fourcc = V4L2_PIX_FMT_HEVC,
+		.codec_mode = MFC_REG_CODEC_HEVC_DEC,
+		.type = MFC_FMT_STREAM | MFC_FMT_DEC,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
 };
 
 #endif /* __MFC_FORMAT_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_qos.c b/drivers/media/platform/samsung/exynos-mfc/base/mfc_qos.c
index f6548543f07c..9922c2396b94 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_qos.c
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_qos.c
@@ -38,6 +38,7 @@ static inline unsigned long __mfc_qos_add_weight(struct mfc_ctx *ctx, unsigned l
 
 	switch (ctx->codec_mode) {
 	case MFC_REG_CODEC_H264_DEC:
+	case MFC_REG_CODEC_H264_MVC_DEC:
 		weight = (weight * 100) / qos_weight->weight_h264_hevc;
 		mfc_ctx_debug(3, "[QoS] h264, hevc codec, weight: %d\n", weight / 10);
 		if (num_planes == 3) {
@@ -45,6 +46,63 @@ static inline unsigned long __mfc_qos_add_weight(struct mfc_ctx *ctx, unsigned l
 			mfc_ctx_debug(3, "[QoS] 3 plane, weight: %d\n", weight / 10);
 		}
 		break;
+
+	case MFC_REG_CODEC_VP8_DEC:
+		weight = (weight * 100) / qos_weight->weight_vp8_vp9;
+		mfc_ctx_debug(3, "[QoS] vp8, vp9 codec, weight: %d\n", weight / 10);
+		if (num_planes == 3) {
+			weight = (weight * 100) / qos_weight->weight_3plane;
+			mfc_ctx_debug(3, "[QoS] 3 plane, weight: %d\n", weight / 10);
+		}
+		break;
+
+	case MFC_REG_CODEC_HEVC_DEC:
+		weight = (weight * 100) / qos_weight->weight_h264_hevc;
+		mfc_ctx_debug(3, "[QoS] h264, hevc codec, weight: %d\n", weight / 10);
+		if (num_planes == 3) {
+			weight = (weight * 100) / qos_weight->weight_3plane;
+			mfc_ctx_debug(3, "[QoS] 3 plane, weight: %d\n", weight / 10);
+		} else {
+			if (ctx->is_422) {
+				weight = (weight * 100) / qos_weight->weight_422;
+				mfc_ctx_debug(3, "[QoS] 422foramt, weight: %d\n", weight / 10);
+			}
+		}
+		break;
+
+	case MFC_REG_CODEC_AV1_DEC:
+		weight = (weight * 100) / qos_weight->weight_av1;
+		mfc_ctx_debug(3, "[QoS] av1 codec, weight: %d\n", weight / 10);
+		break;
+
+	case MFC_REG_CODEC_VP9_DEC:
+		weight = (weight * 100) / qos_weight->weight_vp8_vp9;
+		mfc_ctx_debug(3, "[QoS] vp8, vp9 codec, weight: %d\n", weight / 10);
+
+		if (num_planes == 3) {
+			weight = (weight * 100) / qos_weight->weight_3plane;
+			mfc_ctx_debug(3, "[QoS] 3 plane, weight: %d\n", weight / 10);
+		} else {
+			if (ctx->is_422) {
+				weight = (weight * 100) / qos_weight->weight_422;
+				mfc_ctx_debug(3, "[QoS] 422foramt, weight: %d\n", weight / 10);
+			}
+		}
+		break;
+
+	case MFC_REG_CODEC_MPEG4_DEC:
+	case MFC_REG_CODEC_FIMV1_DEC:
+	case MFC_REG_CODEC_FIMV2_DEC:
+	case MFC_REG_CODEC_FIMV3_DEC:
+	case MFC_REG_CODEC_FIMV4_DEC:
+	case MFC_REG_CODEC_H263_DEC:
+	case MFC_REG_CODEC_VC1_RCV_DEC:
+	case MFC_REG_CODEC_VC1_DEC:
+	case MFC_REG_CODEC_MPEG2_DEC:
+		weight = (weight * 100) / qos_weight->weight_other_codec;
+		mfc_ctx_debug(3, "[QoS] other codec, weight: %d\n", weight / 10);
+		break;
+
 	default:
 		mfc_ctx_err("[QoS] wrong codec_mode (%d), no weight\n", ctx->codec_mode);
 	}
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_queue.c b/drivers/media/platform/samsung/exynos-mfc/base/mfc_queue.c
index f56e800c55f0..6dc9bc7a1873 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_queue.c
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_queue.c
@@ -154,6 +154,11 @@ struct mfc_buf *mfc_get_del_if_consumed(struct mfc_ctx *ctx,
 			    consumed, strm_size);
 	}
 
+	if (remained && IS_MULTI_MODE(ctx) && !CODEC_MULTIFRAME(ctx)) {
+		mfc_ctx_info("[2CORE][MULTIFRAME] multicore mode couldn't handle multiframe\n");
+		remained = 0;
+	}
+
 	if (consumed > 0 && remained > min_bytes &&
 	    IS_NO_ERROR(error) && !exceed) {
 		/* do not delete from queue */
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.c b/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.c
index b0698b2bb0c0..83cdae3dee57 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.c
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.c
@@ -187,9 +187,15 @@ void mfc_dec_calc_dpb_size(struct mfc_ctx *ctx, struct mfc_raw_info *raw, struct
 	}
 	mfc_ctx_debug(2, "[FRAME] total plane size: %d\n", raw->total_plane_size);
 
-	if (IS_H264_DEC(ctx)) {
+	if (IS_H264_DEC(ctx) || IS_H264_MVC_DEC(ctx)) {
 		ctx->mv_size = DEC_MV_SIZE_MB(ctx->img_width, ctx->img_height);
 		ctx->mv_size = ALIGN(ctx->mv_size, 32);
+	} else if (IS_HEVC_DEC(ctx)) {
+		ctx->mv_size = DEC_HEVC_MV_SIZE(ctx->img_width, ctx->img_height);
+		ctx->mv_size = ALIGN(ctx->mv_size, 32);
+	} else if (IS_AV1_DEC(ctx)) {
+		ctx->mv_size = DEC_AV1_MV_SIZE(ctx->img_width, ctx->img_height);
+		ctx->mv_size = ALIGN(ctx->mv_size, 32);
 	} else {
 		ctx->mv_size = 0;
 	}
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc.c b/drivers/media/platform/samsung/exynos-mfc/mfc.c
index fb9a7317e812..293a353c49fa 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc.c
@@ -646,18 +646,69 @@ static int __mfc_parse_dt(struct device_node *np, struct mfc_dev *mfc)
 	of_property_read_u32_array
 		(np, "bw_dec_h264",
 		&pdata->mfc_bw_info.bw_dec_h264.peak, 3);
+	of_property_read_u32_array
+		(np, "bw_dec_hevc",
+		&pdata->mfc_bw_info.bw_dec_hevc.peak, 3);
+	of_property_read_u32_array
+		(np, "bw_dec_hevc_10bit",
+		&pdata->mfc_bw_info.bw_dec_hevc_10bit.peak, 3);
+	of_property_read_u32_array
+		(np, "bw_dec_vp8",
+		&pdata->mfc_bw_info.bw_dec_vp8.peak, 3);
+	of_property_read_u32_array
+		(np, "bw_dec_vp9",
+		&pdata->mfc_bw_info.bw_dec_vp9.peak, 3);
+	of_property_read_u32_array
+		(np, "bw_dec_vp9_10bit",
+		&pdata->mfc_bw_info.bw_dec_vp9_10bit.peak, 3);
+	of_property_read_u32_array
+		(np, "bw_dec_av1",
+		&pdata->mfc_bw_info.bw_dec_av1.peak, 3);
+	of_property_read_u32_array
+		(np, "bw_dec_av1_10bit",
+		&pdata->mfc_bw_info.bw_dec_av1_10bit.peak, 3);
+	of_property_read_u32_array
+		(np, "bw_dec_mpeg4",
+		&pdata->mfc_bw_info.bw_dec_mpeg4.peak, 3);
 
 	/* QoS weight */
 	of_property_read_u32(np, "dynamic_weight", &pdata->dynamic_weight);
 	of_property_read_u32
 			(np, "qos_weight_h264_hevc",
 			&pdata->qos_weight.weight_h264_hevc);
+	of_property_read_u32
+			(np, "qos_weight_vp8_vp9",
+			&pdata->qos_weight.weight_vp8_vp9);
+	of_property_read_u32
+			(np, "qos_weight_av1",
+			&pdata->qos_weight.weight_av1);
+	of_property_read_u32
+			(np, "qos_weight_other_codec",
+			&pdata->qos_weight.weight_other_codec);
 	of_property_read_u32
 			(np, "qos_weight_3plane",
 			&pdata->qos_weight.weight_3plane);
+	of_property_read_u32
+			(np, "qos_weight_10bit",
+			&pdata->qos_weight.weight_10bit);
+	of_property_read_u32
+			(np, "qos_weight_422",
+			&pdata->qos_weight.weight_422);
+	of_property_read_u32
+			(np, "qos_weight_bframe",
+			&pdata->qos_weight.weight_bframe);
+	of_property_read_u32
+			(np, "qos_weight_num_of_ref",
+			&pdata->qos_weight.weight_num_of_ref);
+	of_property_read_u32
+			(np, "qos_weight_gpb",
+			&pdata->qos_weight.weight_gpb);
 	of_property_read_u32
 			(np, "qos_weight_num_of_tile",
 			&pdata->qos_weight.weight_num_of_tile);
+	of_property_read_u32
+			(np, "qos_weight_super64_bframe",
+			&pdata->qos_weight.weight_super64_bframe);
 	of_property_read_u32
 			(np, "qos_weight_mbaff",
 			&pdata->qos_weight.weight_mbaff);
@@ -1075,6 +1126,8 @@ static const struct dev_pm_ops mfc_pm_ops = {
 struct mfc_ctx_buf_size mfc_ctx_buf_size = {
 	.dev_ctx	= PAGE_ALIGN(0x7800),	/*  30KB */
 	.h264_dec_ctx	= PAGE_ALIGN(0x200000),	/* 1.6MB */
+	.av1_dec_ctx	= PAGE_ALIGN(0x19000),	/* 100KB */
+	.other_dec_ctx	= PAGE_ALIGN(0xF000),	/*  60KB */
 	.dbg_info_buf	= PAGE_ALIGN(0x1000),	/* 4KB for DEBUG INFO */
 };
 
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core.c
index af6fd088fad3..aad3273ce2ba 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core.c
@@ -77,6 +77,8 @@ static int __mfc_core_parse_mfc_qos_platdata(struct device_node *np,
 	of_property_read_u32(np_qos, "freq_int", &qosdata->freq_int);
 	of_property_read_u32(np_qos, "freq_mif", &qosdata->freq_mif);
 	of_property_read_u32(np_qos, "mo_value", &qosdata->mo_value);
+	of_property_read_u32(np_qos, "mo_10bit_value",
+			     &qosdata->mo_10bit_value);
 	of_property_read_u32(np_qos, "time_fw", &qosdata->time_fw);
 
 	of_property_read_string(np_qos, "bts_scen", &qosdata->name);
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_buf_ctrl.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_buf_ctrl.c
index 56dc3e734d02..38f09d6ef2dd 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_buf_ctrl.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_buf_ctrl.c
@@ -63,6 +63,7 @@ static int mfc_core_get_buf_ctrls(struct mfc_core *core,
 				  struct mfc_ctx *ctx, struct list_head *head)
 {
 	struct mfc_buf_ctrl *buf_ctrl;
+	struct mfc_dec *dec = ctx->dec_priv;
 	unsigned int value = 0;
 
 	list_for_each_entry(buf_ctrl, head, list) {
@@ -77,6 +78,14 @@ static int mfc_core_get_buf_ctrls(struct mfc_core *core,
 		buf_ctrl->val = value;
 		buf_ctrl->has_new = 1;
 
+		if (IS_VP9_DEC(ctx) && dec) {
+			if (buf_ctrl->id == V4L2_CID_MPEG_VIDEO_FULL_RANGE_FLAG)
+				buf_ctrl->val = dec->color_range;
+			else if (buf_ctrl->id ==
+				 V4L2_CID_MPEG_VIDEO_COLOUR_PRIMARIES)
+				buf_ctrl->val = dec->color_space;
+		}
+
 		if (buf_ctrl->id == V4L2_CID_MPEG_VIDEO_FRAME_ERROR_TYPE)
 			buf_ctrl->val = mfc_get_frame_error_type(ctx, value);
 
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.c
index fe7946bb49e7..aaf216741575 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.c
@@ -230,6 +230,10 @@ void mfc_core_cmd_dec_seq_header(struct mfc_core *core, struct mfc_ctx *ctx)
 	reg |= ((dec->idr_decoding & MFC_REG_D_DEC_OPT_IDR_DECODING_MASK)
 		<< MFC_REG_D_DEC_OPT_IDR_DECODING_SHIFT);
 
+	/* VC1 RCV: Discard to parse additional header as default */
+	if (IS_VC1_RCV_DEC(ctx))
+		reg |= BIT(MFC_REG_D_DEC_OPT_DISCARD_RCV_HEADER_SHIFT);
+
 	/* conceal control to specific color */
 	reg |= (0x4 << MFC_REG_D_DEC_OPT_CONCEAL_CONTROL_SHIFT);
 
@@ -248,6 +252,13 @@ void mfc_core_cmd_dec_seq_header(struct mfc_core *core, struct mfc_ctx *ctx)
 
 	MFC_CORE_WRITEL(MFC_CONCEAL_COLOR, MFC_REG_D_FORCE_PIXEL_VAL);
 
+	if (IS_FIMV1_DEC(ctx)) {
+		mfc_debug(2, "Setting FIMV1 resolution to %dx%d\n",
+			  ctx->img_width, ctx->img_height);
+		MFC_CORE_WRITEL(ctx->img_width, MFC_REG_D_SET_FRAME_WIDTH);
+		MFC_CORE_WRITEL(ctx->img_height, MFC_REG_D_SET_FRAME_HEIGHT);
+	}
+
 	mfc_core_set_pixel_format(core, ctx, ctx->dst_fmt->fourcc);
 
 	reg = 0;
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.c
index 94cc3c4dfdc5..aa2c0b618c19 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.c
@@ -126,10 +126,11 @@ static unsigned int __mfc_handle_frame_field(struct mfc_core *core,
 	unsigned int interlace_type = 0, is_interlace = 0;
 	unsigned int field;
 
-	if (IS_H264_DEC(ctx)) {
-		dec->is_mbaff = mfc_core_is_mbaff_picture();
+	if (CODEC_INTERLACED(ctx))
 		is_interlace = mfc_core_is_interlace_picture();
-	}
+
+	if (CODEC_MBAFF(ctx))
+		dec->is_mbaff = mfc_core_is_mbaff_picture();
 
 	if (is_interlace) {
 		interlace_type = mfc_core_get_interlace_type();
@@ -482,6 +483,27 @@ static struct mfc_buf *__mfc_handle_frame_output_del(struct mfc_core *core,
 			}
 		}
 
+		if (IS_VP9_DEC(ctx) &&
+		    MFC_FEATURE_SUPPORT(dev, dev->pdata->color_aspect_dec)) {
+			if (dec->color_space != MFC_REG_D_COLOR_UNKNOWN) {
+				mfc_set_mb_flag(dst_mb,
+						MFC_FLAG_HDR_COLOUR_DESC);
+				mfc_ctx_debug(2, "[HDR] color space parsed\n");
+			}
+			mfc_set_mb_flag(dst_mb, MFC_FLAG_HDR_VIDEO_SIGNAL_TYPE);
+			mfc_ctx_debug(2, "[HDR] color range parsed\n");
+		}
+
+		if ((IS_VP9_DEC(ctx) && mfc_core_get_disp_res_change()) ||
+		    (IS_AV1_DEC(ctx) && mfc_core_get_disp_res_change_av1())) {
+			mfc_ctx_info("[FRAME][DRC] display resolution changed\n");
+			mutex_lock(&ctx->drc_wait_mutex);
+			ctx->wait_state = WAIT_G_FMT;
+			mfc_core_get_img_size(core, ctx, MFC_GET_RESOL_SIZE);
+			mfc_set_mb_flag(dst_mb, MFC_FLAG_DISP_RES_CHANGE);
+			mutex_unlock(&ctx->drc_wait_mutex);
+		}
+
 		if (dec->black_bar_updated) {
 			mfc_set_mb_flag(dst_mb, MFC_FLAG_BLACKBAR_DETECT);
 			mfc_ctx_debug(3, "[BLACKBAR] black bar detected\n");
@@ -498,6 +520,11 @@ static struct mfc_buf *__mfc_handle_frame_output_del(struct mfc_core *core,
 			mfc_ctx_debug(2, "[FRAME] Last display frame\n");
 		}
 
+		if ((IS_VP9_DEC(ctx) || IS_AV1_DEC(ctx)) && dec->has_multiframe) {
+			mfc_set_mb_flag(dst_mb, MFC_FLAG_MULTIFRAME);
+			mfc_ctx_debug(2, "[MULTIFRAME] multiframe detected\n");
+		}
+
 		if (ctx->dst_fmt->mem_planes == 1) {
 			vb2_set_plane_payload(&dst_mb->vb.vb2_buf, 0,
 					      raw->total_plane_size);
@@ -542,6 +569,8 @@ static struct mfc_buf *__mfc_handle_frame_output_del(struct mfc_core *core,
 
 		mutex_unlock(&dec->dpb_mutex);
 	} else {
+		if (IS_AV1_DEC(ctx) && mfc_core_get_multiple_show_frame())
+			dec->is_multiple_show = 1;
 		mfc_print_dpb_queue_with_lock(core->core_ctx[ctx->num], dec);
 	}
 
@@ -708,11 +737,18 @@ static struct mfc_buf *__mfc_handle_frame_output(struct mfc_core *core,
 {
 	struct mfc_dec *dec = ctx->dec_priv;
 	unsigned int frame_type;
+	int mvc_view_id;
 
 	frame_type = mfc_core_get_disp_frame_type();
+	mvc_view_id = mfc_core_get_mvc_disp_view_id();
 
-	if (!ctx->multi_view_enable || ctx->select_view_irq == MFC_VIEW_ID_SUB)
-		ctx->sequence++;
+	if (IS_H264_MVC_DEC(ctx)) {
+		if (mvc_view_id == 0)
+			ctx->sequence++;
+	} else {
+		if (!ctx->multi_view_enable || ctx->select_view_irq == MFC_VIEW_ID_SUB)
+			ctx->sequence++;
+	}
 
 	if (dec->immediate_display == 1)
 		frame_type = mfc_core_get_dec_frame_type();
@@ -721,7 +757,8 @@ static struct mfc_buf *__mfc_handle_frame_output(struct mfc_core *core,
 
 	/* If frame is same as previous then skip and do not dequeue */
 	if (frame_type == MFC_REG_DISPLAY_FRAME_NOT_CODED)
-		return NULL;
+		if (!CODEC_NOT_CODED(ctx))
+			return NULL;
 
 	/* Dequeued display buffer for user */
 	return __mfc_handle_frame_output_del(core, ctx, err);
@@ -894,6 +931,7 @@ static void __mfc_handle_frame_input(struct mfc_core *core,
 				     struct mfc_ctx *ctx,
 				     unsigned int err)
 {
+	struct mfc_dev *dev = ctx->dev;
 	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
 	struct mfc_dec *dec = ctx->dec_priv;
 	struct mfc_buf *src_mb;
@@ -945,6 +983,54 @@ static void __mfc_handle_frame_input(struct mfc_core *core,
 
 	mfc_clear_mb_flag(src_mb);
 
+	if ((IS_VP9_DEC(ctx) || IS_AV1_DEC(ctx)) && dec->has_multiframe &&
+	    mfc_core_get_disp_status() == MFC_REG_DEC_STATUS_DECODING_ONLY) {
+		mfc_set_mb_flag(src_mb, MFC_FLAG_CONSUMED_ONLY);
+		mfc_debug(2, "[STREAM][MULTIFRAME] last frame is decoding only\n");
+	}
+
+	/*
+	 * VP8 decoder has decoding only frame,
+	 * it will be used for reference frame only not displayed.
+	 * So, driver inform to user this input has no destination.
+	 */
+	if (((IS_VP8_DEC(ctx) || IS_VP9_DEC(ctx)) &&
+	     mfc_core_get_disp_status() == MFC_REG_DEC_STATUS_DECODING_ONLY) ||
+	    mfc_core_get_int_reason() == MFC_REG_R2H_CMD_FIELD_DONE_RET) {
+		mfc_set_mb_flag(src_mb, MFC_FLAG_CONSUMED_ONLY);
+		mfc_debug(2, "[STREAM] %s decoding only stream has no buffer to DQ\n",
+			  ctx->src_fmt->name);
+	}
+
+	/*
+	 * Because AV1 has a no show frame, there are two cases that
+	 * driver should inform to user this input has no destination buffer.
+	 * 1) If it's decoding only and it's not showable frame,
+	 *   it will be used for reference frame only not displayed.
+	 * 2) If the buffer that has already DQ to display comes to new display,
+	 *   it is multiple show frame.
+	 */
+	if (IS_AV1_DEC(ctx)) {
+		if ((mfc_core_get_disp_status() == MFC_REG_DEC_STATUS_DECODING_ONLY) &&
+		    !mfc_core_get_showable_frame()) {
+			mfc_set_mb_flag(src_mb, MFC_FLAG_CONSUMED_ONLY);
+			mfc_debug(2, "[STREAM] AV1 no showable frame has no buffer to DQ\n");
+		}
+		if (dec->is_multiple_show) {
+			mfc_set_mb_flag(src_mb, MFC_FLAG_CONSUMED_ONLY);
+			dec->is_multiple_show = 0;
+			mfc_info("[STREAM] AV1 multiple show frame has no buffer to DQ\n");
+		}
+	}
+
+	/* If pic_output_flag is 0 in HEVC, it is no destination buffer */
+	if (IS_HEVC_DEC(ctx) &&
+	    MFC_FEATURE_SUPPORT(dev, dev->pdata->hevc_pic_output_flag) &&
+	    !mfc_core_get_hevc_pic_output_flag()) {
+		mfc_set_mb_flag(src_mb, MFC_FLAG_CONSUMED_ONLY);
+		mfc_debug(2, "[STREAM] HEVC pic_output_flag off has no buffer to DQ\n");
+	}
+
 	if (mfc_core_get_disp_status() == MFC_REG_DEC_STATUS_DECODING_ONLY &&
 	    mfc_core_get_dec_y_addr() == 0) {
 		mfc_set_mb_flag(src_mb, MFC_FLAG_CONSUMED_ONLY);
@@ -955,6 +1041,8 @@ static void __mfc_handle_frame_input(struct mfc_core *core,
 		mfc_err("failed in core_get_buf_ctrls\n");
 
 	dec->consumed = 0;
+	if (IS_VP9_DEC(ctx) || IS_AV1_DEC(ctx))
+		dec->has_multiframe = 0;
 
 	if (ctx->multi_view_enable && ctx->select_view == 0)
 		mfc_set_mb_flag(src_mb, MFC_FLAG_CONSUMED_ONLY);
@@ -978,7 +1066,7 @@ static void __mfc_handle_frame(struct mfc_core *core,
 	unsigned int res_change, need_dpb_change, need_scratch_change;
 	struct mfc_buf *mfc_buf = NULL;
 	bool qos_update = false;
-	int index;
+	int index, profile;
 
 	dst_frame_status = mfc_core_get_disp_status();
 	res_change = mfc_core_get_res_change();
@@ -1048,6 +1136,15 @@ static void __mfc_handle_frame(struct mfc_core *core,
 			index = mfc_buf->vb.vb2_buf.index;
 			call_bop(ctx, core_restore_buf_ctrls, ctx, &ctx->src_ctrls[index]);
 		}
+
+		/* It could because of sub-view header (MV-HEVC) */
+		if (!ctx->multi_view_enable) {
+			profile = mfc_core_get_profile();
+			if (IS_MV_HEVC_DEC(ctx, profile)) {
+				mfc_debug(2, "Ready to enable, possibly a sub-view header.\n");
+				ctx->ready_to_be_multi_view_enable = 1;
+			}
+		}
 		return;
 	}
 
@@ -1110,7 +1207,7 @@ static void __mfc_handle_frame(struct mfc_core *core,
 	}
 
 	/* Detection for QoS weight */
-	if (!dec->num_of_tile_over_4 &&
+	if (!dec->num_of_tile_over_4 && !IS_HEVC_DEC(ctx) &&
 	    mfc_core_get_num_of_tile() >= 4) {
 		dec->num_of_tile_over_4 = 1;
 		qos_update = true;
@@ -1185,7 +1282,7 @@ static int __mfc_handle_seq_dec(struct mfc_core *core, struct mfc_ctx *ctx)
 	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
 	struct mfc_dec *dec = ctx->dec_priv;
 	struct mfc_buf *src_mb;
-	int i, is_interlace;
+	int i, is_interlace, profile;
 	unsigned int strm_size, consumed;
 
 	if (ctx->src_fmt->fourcc != V4L2_PIX_FMT_FIMV1) {
@@ -1196,13 +1293,34 @@ static int __mfc_handle_seq_dec(struct mfc_core *core, struct mfc_ctx *ctx)
 		mfc_info("[STREAM] resolution w: %d, h: %d\n", ctx->img_width, ctx->img_height);
 	}
 
-	ctx->dpb_count = mfc_core_get_dpb_count();
+	if (IS_AV1_DEC(ctx) || (IS_VP9_DEC(ctx) && UNDER_4K_RES(ctx)))
+		ctx->dpb_count = mfc_core_get_dpb_count() + 7 - MFC_EXTRA_DPB;
+	else
+		ctx->dpb_count = mfc_core_get_dpb_count();
 	mfc_ctx_debug(2, "dpb_count: %d\n", ctx->dpb_count);
 
 	ctx->scratch_buf_size = mfc_core_get_scratch_size();
 
 	mfc_core_dec_get_crop_info(core, ctx);
 	dec->mv_count = mfc_core_get_mv_count();
+	profile = mfc_core_get_profile();
+
+	if (CODEC_422FORMAT(ctx) && dev->pdata->support_422) {
+		if (mfc_core_get_chroma_format() == MFC_REG_D_CHROMA_422) {
+			ctx->is_422 = 1;
+			mfc_info("[STREAM] 422 chroma format\n");
+		}
+	}
+
+	if (IS_MV_HEVC_DEC(ctx, profile)) {
+		if (ctx->ready_to_be_multi_view_enable) {
+			mfc_debug(2, "It will be enabled later, pending DPB_FLUSH.\n");
+		} else {
+			mfc_debug(2, "[MV-HEVC] enabled\n");
+			ctx->multi_view_enable = 1;
+			ctx->select_view = MFC_VIEW_ID_MAIN;
+		}
+	}
 
 	if (ctx->img_width == 0 || ctx->img_height == 0) {
 		mfc_err("[STREAM] wrong resolution w: %d, h: %d\n",
@@ -1243,7 +1361,7 @@ static int __mfc_handle_seq_dec(struct mfc_core *core, struct mfc_ctx *ctx)
 		strm_size = mfc_dec_get_strm_size(ctx, src_mb);
 		mfc_debug(2, "[STREAM] header size, %d, %#x, consumed, %d, %#x\n",
 			  strm_size, strm_size, consumed, consumed);
-		if ((IS_H264_DEC(ctx)) &&
+		if ((IS_H264_DEC(ctx) || IS_H264_MVC_DEC(ctx) || IS_HEVC_DEC(ctx)) &&
 		    (consumed > 0 && strm_size > consumed)) {
 			dec->consumed += consumed;
 			mfc_debug(2, "[STREAM] there is remained bytes(%d) after header parsing\n",
@@ -1257,6 +1375,13 @@ static int __mfc_handle_seq_dec(struct mfc_core *core, struct mfc_ctx *ctx)
 	mfc_debug(2, "[FRAME] display delay for first frame %d\n",
 		  dec->frame_display_delay);
 
+	if (IS_VP9_DEC(ctx)) {
+		dec->color_range = mfc_core_get_color_range();
+		dec->color_space = mfc_core_get_color_space();
+		mfc_debug(2, "color range: %d, color space: %d, It's valid for VP9\n",
+			  dec->color_range, dec->color_space);
+	}
+
 	mfc_change_state(core_ctx, MFCINST_HEAD_PARSED);
 
 	return 0;
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.c
index 6950b8451c3d..0cc5d1d9433e 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.c
@@ -52,7 +52,8 @@ unsigned int mfc_get_frame_error_type(struct mfc_ctx *ctx, unsigned int err)
 		return MFC_ERR_FRAME_NO_ERR;
 	}
 
-	if (mfc_get_warn(err) == MFC_REG_ERR_BROKEN_LINK) {
+	if ((IS_VC1_RCV_DEC(ctx) && (mfc_get_warn(err) == MFC_REG_ERR_SYNC_POINT_NOT_RECEIVED)) ||
+	    (mfc_get_warn(err) == MFC_REG_ERR_BROKEN_LINK)) {
 		mfc_ctx_debug(2, "[FRAME] Broken frame error (%d)\n", mfc_get_warn(err));
 		return MFC_ERR_FRAME_BROKEN;
 	} else if (mfc_get_warn(err) == MFC_REG_ERR_SYNC_POINT_NOT_RECEIVED) {
@@ -104,6 +105,7 @@ int mfc_core_set_dec_codec_buffers(struct mfc_core_ctx *core_ctx)
 	int buf_size;
 	int align_gap;
 	unsigned int reg = 0;
+	unsigned int av1_static_buf_size = 0;
 
 	buf_addr = core_ctx->codec_buf.daddr;
 	buf_size = core_ctx->codec_buf.size;
@@ -124,14 +126,50 @@ int mfc_core_set_dec_codec_buffers(struct mfc_core_ctx *core_ctx)
 	buf_addr += ctx->scratch_buf_size;
 	buf_size -= ctx->scratch_buf_size;
 
-	if (IS_H264_DEC(ctx))
+	if (IS_H264_DEC(ctx) || IS_H264_MVC_DEC(ctx) || IS_HEVC_DEC(ctx) || IS_AV1_DEC(ctx))
 		MFC_CORE_WRITEL(ctx->mv_size, MFC_REG_D_MV_BUFFER_SIZE);
 
+	if (IS_VP9_DEC(ctx)) {
+		MFC_CORE_DMA_WRITEL(buf_addr, MFC_REG_D_STATIC_BUFFER_ADDR);
+		MFC_CORE_WRITEL(DEC_STATIC_BUFFER_SIZE, MFC_REG_D_STATIC_BUFFER_SIZE);
+		buf_addr += DEC_STATIC_BUFFER_SIZE;
+		buf_size -= DEC_STATIC_BUFFER_SIZE;
+	} else if (IS_AV1_DEC(ctx)) {
+		av1_static_buf_size = DEC_AV1_STATIC_BUFFER_SIZE(ctx->img_width, ctx->img_height);
+		MFC_CORE_DMA_WRITEL(buf_addr, MFC_REG_D_STATIC_BUFFER_ADDR);
+		MFC_CORE_WRITEL(av1_static_buf_size, MFC_REG_D_STATIC_BUFFER_SIZE);
+		buf_addr += av1_static_buf_size;
+		buf_size -= av1_static_buf_size;
+	}
+
+	if (IS_MPEG4_DEC(ctx) && dec->loop_filter_mpeg4) {
+		mfc_debug(2, "Add DPB for loop filter of MPEG4\n");
+		for (i = 0; i < NUM_MPEG4_LF_BUF; i++) {
+			MFC_CORE_DMA_WRITEL(buf_addr, MFC_REG_D_POST_FILTER_LUMA_DPB0 + (4 * i));
+			buf_addr += ctx->loopfilter_luma_size;
+			buf_size -= ctx->loopfilter_luma_size;
+
+			MFC_CORE_DMA_WRITEL(buf_addr, MFC_REG_D_POST_FILTER_CHROMA_DPB0 + (4 * i));
+			buf_addr += ctx->loopfilter_chroma_size;
+			buf_size -= ctx->loopfilter_chroma_size;
+		}
+		reg |= ((dec->loop_filter_mpeg4 & MFC_REG_D_INIT_BUF_OPT_LF_CTRL_MASK)
+				<< MFC_REG_D_INIT_BUF_OPT_LF_CTRL_SHIFT);
+	}
+
 	reg |= (dec->is_dynamic_dpb << MFC_REG_D_INIT_BUF_OPT_DYNAMIC_DPB_SET_SHIFT);
 
+	if (CODEC_NOT_CODED(ctx)) {
+		reg |= BIT(MFC_REG_D_INIT_BUF_OPT_COPY_NOT_CODED_SHIFT);
+		mfc_debug(2, "Notcoded frame copy mode start\n");
+	}
+
 	/* 16byte align, It is valid only for VP9 */
 	reg &= ~BIT(MFC_REG_D_INIT_BUF_OPT_STRIDE_SIZE_ALIGN);
-
+	if (IS_VP9_DEC(ctx) && MFC_FEATURE_SUPPORT(dev, dev->pdata->vp9_stride_align)) {
+		reg &= ~(0x3 << MFC_REG_D_INIT_BUF_OPT_STRIDE_SIZE_ALIGN);
+		reg |= (0x2 << MFC_REG_D_INIT_BUF_OPT_STRIDE_SIZE_ALIGN);
+	}
 	reg &= ~BIT(MFC_REG_D_INIT_BUF_OPT_TWO_MODE_ENABLE_SHIFT);
 	if (IS_MULTI_MODE(ctx)) {
 		reg |= BIT(MFC_REG_D_INIT_BUF_OPT_TWO_MODE_ENABLE_SHIFT);
@@ -158,7 +196,7 @@ int mfc_core_set_dec_codec_buffers(struct mfc_core_ctx *core_ctx)
 
 	frame_size_mv = ctx->mv_size;
 	MFC_CORE_WRITEL(dec->mv_count, MFC_REG_D_NUM_MV);
-	if (IS_H264_DEC(ctx)) {
+	if (IS_H264_DEC(ctx) || IS_H264_MVC_DEC(ctx) || IS_HEVC_DEC(ctx) || IS_AV1_DEC(ctx)) {
 		if (ctx->mv_buffer_allocated && buf_size &&
 		    buf_size > ctx->mv_buf.dma_buf->size) {
 			mfc_info("[MEMINFO] Not enough MV buf size %d alloc size %zu\n",
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.h b/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.h
index e7c28b2f2b5d..08f74bd56f3f 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.h
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.h
@@ -89,12 +89,15 @@
 						>> MFC_REG_D_H264_INFO_MBAFF_FRAME_FLAG_SHIFT)\
 						& MFC_REG_D_H264_INFO_MBAFF_FRAME_FLAG_MASK)
 
+#define mfc_core_get_aspect_ratio()	MFC_CORE_READL(MFC_REG_D_DISPLAY_ASPECT_RATIO)
 #define mfc_core_get_img_width()		MFC_CORE_READL(MFC_REG_D_DISPLAY_FRAME_WIDTH)
 #define mfc_core_get_img_height()	MFC_CORE_READL(MFC_REG_D_DISPLAY_FRAME_HEIGHT)
 #define mfc_core_get_disp_y_addr()	MFC_CORE_DMA_READL(MFC_REG_D_DISPLAY_LUMA_ADDR)
 #define mfc_core_get_dec_y_addr()	MFC_CORE_DMA_READL(MFC_REG_D_DECODED_LUMA_ADDR)
 #define mfc_core_get_crc_luma()		MFC_CORE_READL(MFC_REG_D_DISPLAY_FIRST_PLANE_CRC)
 #define mfc_core_get_crc_chroma()	MFC_CORE_READL(MFC_REG_D_DISPLAY_SECOND_PLANE_CRC)
+#define mfc_core_get_crc_luma_2bit()	MFC_CORE_READL(MFC_REG_D_DISPLAY_FIRST_PLANE_2BIT_CRC)
+#define mfc_core_get_crc_chroma_2bit()	MFC_CORE_READL(MFC_REG_D_DISPLAY_SECOND_PLANE_2BIT_CRC)
 
 /* kind of interrupt */
 #define mfc_core_get_int_err()		MFC_CORE_READL(MFC_REG_ERROR_CODE)
@@ -104,10 +107,13 @@
 #define mfc_core_get_dpb_count()		MFC_CORE_READL(MFC_REG_D_MIN_NUM_DPB)
 #define mfc_core_get_min_dpb_size(x)		\
 	MFC_CORE_READL(MFC_REG_D_MIN_FIRST_PLANE_DPB_SIZE + ((x) * 4))
+#define mfc_core_get_min_dpb_size_2bit(x)	\
+	MFC_CORE_READL(MFC_REG_D_MIN_FIRST_PLANE_2BIT_DPB_SIZE + ((x) * 4))
 #define mfc_core_get_scratch_size()		MFC_CORE_READL(MFC_REG_D_MIN_SCRATCH_BUFFER_SIZE)
 #define mfc_core_get_stride_size(x)		\
 	MFC_CORE_READL(MFC_REG_D_FIRST_PLANE_DPB_STRIDE_SIZE + ((x) * 4))
-
+#define mfc_core_get_stride_size_2bit(x)	\
+	MFC_CORE_READL(MFC_REG_D_FIRST_PLANE_2BIT_DPB_STRIDE_SIZE + ((x) * 4))
 #define mfc_core_get_mv_count()			MFC_CORE_READL(MFC_REG_D_MIN_NUM_MV)
 #define mfc_core_get_inst_no()			MFC_CORE_READL(MFC_REG_RET_INSTANCE_ID)
 #define mfc_core_get_sei_avail()		MFC_CORE_READL(MFC_REG_D_SEI_AVAIL)
@@ -133,14 +139,27 @@
 #define mfc_core_get_sei_avail_mastering_display()	((MFC_CORE_READL(MFC_REG_D_SEI_AVAIL)	\
 						>> MFC_REG_D_SEI_AVAIL_MASTERING_DISPLAY_SHIFT)	\
 						& MFC_REG_D_SEI_AVAIL_MASTERING_DISPLAY_MASK)
-
+#define mfc_core_get_sei_avail_st_2094_40()		((MFC_CORE_READL(MFC_REG_D_SEI_AVAIL)	\
+						>> MFC_REG_D_SEI_AVAIL_ST_2094_40_SHIFT)	\
+						& MFC_REG_D_SEI_AVAIL_ST_2094_40_MASK)
+#define mfc_core_get_sei_nal_meta_status()	((MFC_CORE_READL(MFC_REG_METADATA_STATUS)	\
+						>> MFC_REG_SEI_NAL_STATUS_SHIFT)		\
+						& MFC_REG_SEI_NAL_STATUS_MASK)
 #define mfc_core_get_video_signal_type()	((MFC_CORE_READL(MFC_REG_D_VIDEO_SIGNAL_TYPE)	\
 						>> MFC_REG_D_VIDEO_SIGNAL_TYPE_FLAG_SHIFT)	\
 						& MFC_REG_D_VIDEO_SIGNAL_TYPE_FLAG_MASK)
 #define mfc_core_get_colour_description()	((MFC_CORE_READL(MFC_REG_D_VIDEO_SIGNAL_TYPE)	\
 						>> MFC_REG_D_COLOUR_DESCRIPTION_FLAG_SHIFT)	\
 						& MFC_REG_D_COLOUR_DESCRIPTION_FLAG_MASK)
-
+#define mfc_core_get_primaries()		((MFC_CORE_READL(MFC_REG_D_VIDEO_SIGNAL_TYPE)	\
+						>> MFC_REG_D_COLOUR_PRIMARIES_SHIFT)		\
+						& MFC_REG_D_COLOUR_PRIMARIES_MASK)
+#define mfc_core_get_transfer()			((MFC_CORE_READL(MFC_REG_D_VIDEO_SIGNAL_TYPE)	\
+						>> MFC_REG_D_TRANSFER_CHARACTERISTICS_SHIFT)	\
+						& MFC_REG_D_TRANSFER_CHARACTERISTICS_MASK)
+#define mfc_core_get_matrix_coeff()		((MFC_CORE_READL(MFC_REG_D_VIDEO_SIGNAL_TYPE)	\
+						>> MFC_REG_D_MATRIX_COEFFICIENTS_SHIFT)		\
+						& MFC_REG_D_MATRIX_COEFFICIENTS_MASK)
 #define mfc_core_get_black_bar_pos_x()		((MFC_CORE_READL(MFC_REG_D_BLACK_BAR_START_POS)	\
 						>> MFC_REG_D_BLACK_BAR_START_X_SHIFT)		\
 						& MFC_REG_D_BLACK_BAR_START_X_MASK)
@@ -160,12 +179,25 @@
 						& MFC_REG_D_MVC_VIEW_ID_DEC_MASK)
 #define mfc_core_get_mvc_view_id_disp_order()	(MFC_CORE_READL(MFC_REG_D_MVC_VIEW_ID)		\
 						& MFC_REG_D_MVC_VIEW_ID_DISP_MASK)
+#define mfc_core_get_mvc_left_view_id()		((MFC_CORE_READL(MFC_REG_D_MVC_VIEW_ID)		\
+						>> MFC_REG_D_MVC_LEFT_VIEW_ID_SHIFT)	\
+						& MFC_REG_D_MVC_LEFT_VIEW_ID_MASK)
 #define mfc_core_get_mvc_right_view_id()	((MFC_CORE_READL(MFC_REG_D_MVC_VIEW_ID)		\
 						>> MFC_REG_D_MVC_RIGHT_VIEW_ID_SHIFT)	\
 						& MFC_REG_D_MVC_RIGHT_VIEW_ID_MASK)
 #define mfc_core_get_profile()		(MFC_CORE_READL(MFC_REG_D_DECODED_PICTURE_PROFILE)	\
 					& MFC_REG_D_DECODED_PIC_PROFILE_MASK)
-
+#define mfc_core_get_level()		((MFC_CORE_READL(MFC_REG_D_DECODED_PICTURE_PROFILE)	\
+						>> MFC_REG_D_PIC_LEVEL_SHIFT)	\
+						& MFC_REG_D_PIC_LEVEL_MASK)
+#define mfc_core_get_luma_bit_depth_minus8()	((MFC_CORE_READL	\
+						(MFC_REG_D_DECODED_PICTURE_PROFILE)	\
+						>> MFC_REG_D_BIT_DEPTH_LUMA_MINUS8_SHIFT)	\
+						& MFC_REG_D_BIT_DEPTH_LUMA_MINUS8_MASK)
+#define mfc_core_get_chroma_bit_depth_minus8()	((MFC_CORE_READL	\
+						(MFC_REG_D_DECODED_PICTURE_PROFILE)	\
+						>> MFC_REG_D_BIT_DEPTH_CHROMA_MINUS8_SHIFT)	\
+						& MFC_REG_D_BIT_DEPTH_CHROMA_MINUS8_MASK)
 #define mfc_core_get_display_delay()				\
 	((MFC_CORE_READL(MFC_REG_D_DECODED_PICTURE_PROFILE)	\
 	>> MFC_REG_D_DISPLAY_DELAY_SHIFT)		\
@@ -177,10 +209,34 @@
 #define mfc_core_get_dec_used_flag()		(((unsigned long)(MFC_CORE_READL		\
 						(MFC_REG_D_USED_DPB_FLAG_UPPER)) << 32) |	\
 						MFC_CORE_READL(MFC_REG_D_USED_DPB_FLAG_LOWER))
-
+#define mfc_core_get_chroma_format()		(MFC_CORE_READL(MFC_REG_D_CHROMA_FORMAT)	\
+						& MFC_REG_D_CHROMA_FORMAT_MASK)
+#define mfc_core_get_color_range()		((MFC_CORE_READL(MFC_REG_D_CHROMA_FORMAT)	\
+						>> MFC_REG_D_COLOR_RANGE_SHIFT)	\
+						& MFC_REG_D_COLOR_RANGE_MASK)
+#define mfc_core_get_color_space()		((MFC_CORE_READL(MFC_REG_D_CHROMA_FORMAT)	\
+						>> MFC_REG_D_COLOR_SPACE_SHIFT)	\
+						& MFC_REG_D_COLOR_SPACE_MASK)
 #define mfc_core_get_num_of_tile()		((MFC_CORE_READL(MFC_REG_D_DECODED_STATUS)	\
 						>> MFC_REG_DEC_STATUS_NUM_OF_TILE_SHIFT)	\
 						& MFC_REG_DEC_STATUS_NUM_OF_TILE_MASK)
+#define mfc_core_get_lcu_size()			(MFC_CORE_READL(MFC_REG_D_HEVC_INFO)		\
+						& MFC_REG_D_HEVC_INFO_LCU_SIZE_MASK)
+#define mfc_core_get_disp_res_change()		((MFC_CORE_READL(MFC_REG_D_VP9_INFO)	\
+						>> MFC_REG_D_VP9_INFO_DISP_RES_SHIFT)	\
+						& MFC_REG_D_VP9_INFO_DISP_RES_MASK)
+#define mfc_core_get_disp_res_change_av1()	((MFC_CORE_READL(MFC_REG_D_AV1_INFO)	\
+						>> MFC_REG_D_AV1_INFO_DISP_RES_SHIFT)	\
+						& MFC_REG_D_AV1_INFO_DISP_RES_MASK)
+#define mfc_core_get_showable_frame()		((MFC_CORE_READL(MFC_REG_D_AV1_INFO)		\
+						>> MFC_REG_D_AV1_INFO_SHOWABLE_FRAME_SHIFT)	\
+						& MFC_REG_D_AV1_INFO_SHOWABLE_FRAME_MASK)
+#define mfc_core_get_multiple_show_frame()	((MFC_CORE_READL(MFC_REG_D_AV1_INFO)		\
+						>> MFC_REG_D_AV1_INFO_MULTIPLE_SHOW_SHIFT)	\
+						& MFC_REG_D_AV1_INFO_MULTIPLE_SHOW_MASK)
+#define mfc_core_get_hevc_pic_output_flag()	((MFC_CORE_READL(MFC_REG_D_HEVC_INFO)		\
+						>> MFC_REG_D_HEVC_INFO_PIC_OUTPUT_FLAG_SHIFT)	\
+						& MFC_REG_D_HEVC_INFO_PIC_OUTPUT_FLAG_MASK)
 
 static inline void mfc_core_dec_get_crop_info(struct mfc_core *core,
 					      struct mfc_ctx *ctx)
@@ -201,6 +257,15 @@ static inline void mfc_core_dec_get_crop_info(struct mfc_core *core,
 	dec->cr_bot = bottom;
 }
 
+static inline void mfc_core_clear_roi_enable(struct mfc_core *core)
+{
+	unsigned int reg = 0;
+
+	reg = MFC_CORE_READL(MFC_REG_E_RC_ROI_CTRL);
+	reg &= ~(0x1);
+	MFC_CORE_WRITEL(reg, MFC_REG_E_RC_ROI_CTRL);
+}
+
 static inline void mfc_core_update_tag(struct mfc_core *core, struct mfc_ctx *ctx,
 				       int tag)
 {
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_run.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_run.c
index 118108f910e2..127d19c4d1cb 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_run.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_run.c
@@ -369,6 +369,10 @@ int mfc_core_run_dec_frame(struct mfc_core *core, struct mfc_ctx *ctx)
 	last_frame = __mfc_check_last_frame(core_ctx, src_mb);
 	ret = mfc_core_cmd_dec_one_frame(core, ctx, last_frame, src_index);
 
+	if (dec->consumed && IS_MULTI_MODE(ctx) && !CODEC_MULTIFRAME(ctx)) {
+		mfc_debug(2, "[STREAM][2CORE] clear consumed for next core\n");
+		dec->consumed = 0;
+	}
 	return ret;
 }
 
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_dec_vb2.c b/drivers/media/platform/samsung/exynos-mfc/mfc_dec_vb2.c
index 3097a6c0bf14..626c8db5f93b 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_dec_vb2.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_dec_vb2.c
@@ -9,6 +9,7 @@
  * Himanshu Dewangan, <h.dewangan@samsung.com>
  */
 
+#include "mfc_dec_v4l2.h"
 #include "mfc_dec_vb2.h"
 
 #include "mfc_rm.h"
-- 
2.34.1

