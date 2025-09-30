Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A914BAB7DA
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C9310E4EA;
	Tue, 30 Sep 2025 05:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="mJ2glgHc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0D810E26C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:08 +0000 (UTC)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20250930035709epoutp02255a0a037325765afd1b041de78d9c47~p80ottgLd2547825478epoutp02E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:57:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20250930035709epoutp02255a0a037325765afd1b041de78d9c47~p80ottgLd2547825478epoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204629;
 bh=90Z5+idyqdBJGcoVaccmTCOSKICmqPHbK/q5Tgxv4h0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mJ2glgHchKeFnrkOOpry5ZgjgKgQydQPa2mXcUsjA4rkuJtwJ9DrRxQHN2LVNJU6X
 t7LfTNu6LYMMGqo63EnbnZJVxQrgf2W/1FdTlsEtE0/NoPoLPNBDdrCEnREjw2mFpy
 /ReZcWvrDohWjPZqY5Ojl8oymVRIt9WGNFypZFTc=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
 20250930035708epcas5p346f73bcc6109e0ace86871b787727ae1~p80oIEuDq0175701757epcas5p3Q;
 Tue, 30 Sep 2025 03:57:08 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.94]) by
 epsnrtp02.localdomain (Postfix) with ESMTP id 4cbPQC57m1z2SSKX; Tue, 30 Sep
 2025 03:57:07 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20250930035706epcas5p4530de9edacfc86c0ae1ab9de2d2b0695~p80mWWoVc3091130911epcas5p4N;
 Tue, 30 Sep 2025 03:57:06 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035704epsmtip178a5bdc23e431f79e2cf331e3fe6d553~p80jz6Y7p2938529385epsmtip1u;
 Tue, 30 Sep 2025 03:57:03 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 27/29] media: mfc: Add H.264 encoder support
Date: Tue, 30 Sep 2025 09:33:46 +0530
Message-Id: <20250930040348.3702923-28-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035706epcas5p4530de9edacfc86c0ae1ab9de2d2b0695
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035706epcas5p4530de9edacfc86c0ae1ab9de2d2b0695
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
 <CGME20250930035706epcas5p4530de9edacfc86c0ae1ab9de2d2b0695@epcas5p4.samsung.com>
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

- Register H.264 format and V4L2/VB2 headers.
- Initialize encoder context, queues, and defaults.
- Add buffer‑control handling (layers, ROI, frame‑rate, drop,
  profile/level) and parse DT properties.
- Register encoder ioctl ops, set up QoS table, and extend debugfs.

Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
---
 .../samsung/exynos-mfc/base/mfc_format.h      |   8 +
 .../media/platform/samsung/exynos-mfc/mfc.c   | 193 ++++++-
 .../platform/samsung/exynos-mfc/mfc_core.c    |  26 +
 .../samsung/exynos-mfc/mfc_core_buf_ctrl.c    | 321 +++++++++++
 .../samsung/exynos-mfc/mfc_core_isr.c         | 518 +++++++++++++++++-
 .../samsung/exynos-mfc/mfc_core_sync.c        |  58 +-
 .../platform/samsung/exynos-mfc/mfc_debugfs.c |  17 +-
 7 files changed, 1116 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_format.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_format.h
index 0d48f2373e8d..e8573d6b6005 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_format.h
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_format.h
@@ -263,6 +263,14 @@ static struct mfc_fmt mfc_formats[] = {
 		.num_planes = 1,
 		.mem_planes = 1,
 	},
+	{
+		.name = "ENC H264",
+		.fourcc = V4L2_PIX_FMT_H264,
+		.codec_mode = MFC_REG_CODEC_H264_ENC,
+		.type = MFC_FMT_STREAM | MFC_FMT_ENC,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
 };
 
 #endif /* __MFC_FORMAT_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc.c b/drivers/media/platform/samsung/exynos-mfc/mfc.c
index db17448eae13..68cba41b45da 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc.c
@@ -23,6 +23,8 @@
 
 #include "mfc_dec_v4l2.h"
 #include "mfc_dec_vb2.h"
+#include "mfc_enc_v4l2.h"
+#include "mfc_enc_vb2.h"
 #include "mfc_rm.h"
 #include "mfc_debugfs.h"
 
@@ -228,6 +230,107 @@ static int __mfc_init_dec_ctx(struct mfc_ctx *ctx)
 	return ret;
 }
 
+static void __mfc_deinit_enc_ctx(struct mfc_ctx *ctx)
+{
+	struct mfc_enc *enc = ctx->enc_priv;
+
+	mfc_delete_queue(&ctx->src_buf_ready_queue);
+	mfc_delete_queue(&ctx->dst_buf_queue);
+	mfc_delete_queue(&ctx->ref_buf_queue);
+	mfc_delete_queue(&ctx->err_buf_queue);
+	mfc_delete_queue(&ctx->meminfo_inbuf_q);
+	mfc_delete_queue(&ctx->meminfo_outbuf_q);
+
+	mfc_mem_cleanup_user_shared_handle(ctx, &enc->sh_handle_svc);
+	mfc_mem_cleanup_user_shared_handle(ctx, &enc->sh_handle_roi);
+
+	kfree(enc);
+}
+
+static int __mfc_init_enc_ctx(struct mfc_ctx *ctx)
+{
+	struct mfc_enc *enc;
+	struct mfc_enc_params *p;
+	int ret = 0;
+	int i;
+
+	enc = kzalloc(sizeof(*enc), GFP_KERNEL);
+	if (!enc)
+		return -ENOMEM;
+
+	ctx->enc_priv = enc;
+	ctx->user_prio = -1;
+
+	mfc_create_queue(&ctx->src_buf_ready_queue);
+	mfc_create_queue(&ctx->dst_buf_queue);
+	mfc_create_queue(&ctx->ref_buf_queue);
+	mfc_create_queue(&ctx->err_buf_queue);
+	mfc_create_queue(&ctx->meminfo_inbuf_q);
+	mfc_create_queue(&ctx->meminfo_outbuf_q);
+
+	for (i = 0; i < MFC_MAX_BUFFERS; i++) {
+		INIT_LIST_HEAD(&ctx->src_ctrls[i]);
+		INIT_LIST_HEAD(&ctx->dst_ctrls[i]);
+	}
+	bitmap_zero(ctx->src_ctrls_avail, MFC_MAX_BUFFERS);
+	bitmap_zero(ctx->dst_ctrls_avail, MFC_MAX_BUFFERS);
+
+	ctx->type = MFCINST_ENCODER;
+	ctx->c_ops = &mfc_ctrls_ops;
+	ctx->b_ops = &mfc_bufs_ops;
+
+	mfc_enc_set_default_format(ctx);
+	mfc_rate_reset_framerate(ctx);
+
+	ctx->qos_ratio = 100;
+
+	/* disable IVF header by default (VP8, VP9) */
+	p = &enc->params;
+	p->ivf_header_disable = 1;
+
+	INIT_LIST_HEAD(&ctx->bitrate_list);
+	INIT_LIST_HEAD(&ctx->src_ts.ts_list);
+
+	enc->sh_handle_svc.fd = -1;
+	enc->sh_handle_roi.fd = -1;
+	enc->sh_handle_svc.data_size = sizeof(struct temporal_layer_info);
+	enc->sh_handle_roi.data_size = sizeof(struct mfc_enc_roi_info);
+
+	/* Init videobuf2 queue for OUTPUT */
+	ctx->vq_src.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	ctx->vq_src.drv_priv = ctx;
+	ctx->vq_src.buf_struct_size = (unsigned int)sizeof(struct mfc_buf);
+	ctx->vq_src.io_modes = VB2_USERPTR | VB2_DMABUF;
+	ctx->vq_src.ops = mfc_get_enc_vb2_ops();
+	ctx->vq_src.mem_ops = mfc_mem_ops();
+	ctx->vq_src.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	ret = vb2_queue_init(&ctx->vq_src);
+	if (ret) {
+		mfc_ctx_err("Failed to initialize videobuf2 queue(output)\n");
+		goto fail_enc_init;
+	}
+
+	/* Init videobuf2 queue for CAPTURE */
+	ctx->vq_dst.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	ctx->vq_dst.drv_priv = ctx;
+	ctx->vq_dst.buf_struct_size = (unsigned int)sizeof(struct mfc_buf);
+	ctx->vq_dst.io_modes = VB2_USERPTR | VB2_DMABUF;
+	ctx->vq_dst.ops = mfc_get_enc_vb2_ops();
+	ctx->vq_dst.mem_ops = mfc_mem_ops();
+	ctx->vq_dst.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	ret = vb2_queue_init(&ctx->vq_dst);
+	if (ret) {
+		mfc_ctx_err("Failed to initialize videobuf2 queue(capture)\n");
+		goto fail_enc_init;
+	}
+
+	return 0;
+
+fail_enc_init:
+	__mfc_deinit_enc_ctx(ctx);
+	return 0;
+}
+
 /* Open an MFC node */
 static int mfc_open(struct file *file)
 {
@@ -339,6 +442,7 @@ static int mfc_open(struct file *file)
 		ret = __mfc_init_dec_ctx(ctx);
 		dev->num_dec_inst++;
 	} else {
+		ret = __mfc_init_enc_ctx(ctx);
 		dev->num_enc_inst++;
 	}
 	if (ret)
@@ -351,8 +455,8 @@ static int mfc_open(struct file *file)
 		/* idle mode */
 		spin_lock_init(&dev->idle_bits_lock);
 	}
-	if (mfc_is_decoder_node(node))
-		ret = call_cop(ctx, init_ctx_ctrls, ctx);
+
+	ret = call_cop(ctx, init_ctx_ctrls, ctx);
 	if (ret) {
 		mfc_ctx_err("failed in init_ctx_ctrls\n");
 		goto err_ctx_init;
@@ -449,12 +553,10 @@ static int mfc_release(struct file *file)
 	 * So, we need to performed stop_streaming
 	 * before instance de-init(CLOSE_INSTANCE).
 	 */
-	if (ctx->type == MFCINST_DECODER) {
-		vb2_queue_release(&ctx->vq_src);
-		vb2_queue_release(&ctx->vq_dst);
+	vb2_queue_release(&ctx->vq_src);
+	vb2_queue_release(&ctx->vq_dst);
 
-		call_cop(ctx, cleanup_ctx_ctrls, ctx);
-	}
+	call_cop(ctx, cleanup_ctx_ctrls, ctx);
 
 	ret = mfc_rm_instance_deinit(dev, ctx);
 	if (ret) {
@@ -471,6 +573,7 @@ static int mfc_release(struct file *file)
 		__mfc_deinit_dec_ctx(ctx);
 		dev->num_dec_inst--;
 	} else if (ctx->type == MFCINST_ENCODER) {
+		__mfc_deinit_enc_ctx(ctx);
 		dev->num_enc_inst--;
 	}
 
@@ -609,6 +712,12 @@ static int __mfc_parse_dt(struct device_node *np, struct mfc_dev *mfc)
 	of_property_read_u32_array
 		(np, "static_info_dec",
 		&pdata->static_info_dec.support, 2);
+	of_property_read_u32_array
+		(np, "color_aspect_enc",
+		&pdata->color_aspect_enc.support, 2);
+	of_property_read_u32_array
+		(np, "static_info_enc",
+		&pdata->static_info_enc.support, 2);
 	of_property_read_u32_array
 		(np, "vp9_stride_align",
 		&pdata->vp9_stride_align.support, 2);
@@ -618,6 +727,30 @@ static int __mfc_parse_dt(struct device_node *np, struct mfc_dev *mfc)
 	of_property_read_u32_array
 		(np, "wait_fw_status",
 		&pdata->wait_fw_status.support, 2);
+	of_property_read_u32_array
+		(np, "average_qp",
+		&pdata->average_qp.support, 2);
+	of_property_read_u32_array
+		(np, "mv_search_mode",
+		&pdata->mv_search_mode.support, 2);
+	of_property_read_u32_array
+		(np, "enc_idr_flag",
+		&pdata->enc_idr_flag.support, 2);
+	of_property_read_u32_array
+		(np, "min_quality_mode",
+		&pdata->min_quality_mode.support, 2);
+	of_property_read_u32_array
+		(np, "enc_capability",
+		&pdata->enc_capability.support, 2);
+	of_property_read_u32_array
+		(np, "enc_ts_delta",
+		&pdata->enc_ts_delta.support, 2);
+	of_property_read_u32_array
+		(np, "wfd_rc_mode",
+		&pdata->wfd_rc_mode.support, 2);
+	of_property_read_u32_array
+		(np, "max_i_frame_size",
+		&pdata->max_i_frame_size.support, 2);
 	of_property_read_u32_array
 		(np, "hevc_pic_output_flag",
 		&pdata->hevc_pic_output_flag.support, 2);
@@ -630,10 +763,14 @@ static int __mfc_parse_dt(struct device_node *np, struct mfc_dev *mfc)
 
 	/* Formats */
 	of_property_read_u32(np, "support_422", &pdata->support_422);
+	of_property_read_u32(np, "support_rgb", &pdata->support_rgb);
 
 	/* Resolution */
 	of_property_read_u32(np, "support_check_res", &pdata->support_check_res);
 
+	/* HWAPG */
+	of_property_read_u32(np, "support_hwapg", &pdata->support_hwapg);
+
 	/* HWACG */
 	of_property_read_u32(np, "support_hwacg", &pdata->support_hwacg);
 
@@ -643,6 +780,39 @@ static int __mfc_parse_dt(struct device_node *np, struct mfc_dev *mfc)
 	/* output buffer Q framerate */
 	of_property_read_u32(np, "display_framerate", &pdata->display_framerate);
 
+	/* Encoder default parameter */
+	of_property_read_u32(np, "enc_param_num", &pdata->enc_param_num);
+	if (pdata->enc_param_num) {
+		of_property_read_u32_array
+			(np, "enc_param_addr",
+			pdata->enc_param_addr, pdata->enc_param_num);
+		of_property_read_u32_array
+			(np, "enc_param_val",
+			pdata->enc_param_val, pdata->enc_param_num);
+	}
+
+	/* MFC bandwidth information */
+	of_property_read_u32_array
+		(np, "bw_enc_h264",
+		&pdata->mfc_bw_info.bw_enc_h264.peak, 3);
+	of_property_read_u32_array
+		(np, "bw_enc_hevc",
+		&pdata->mfc_bw_info.bw_enc_hevc.peak, 3);
+	of_property_read_u32_array
+		(np, "bw_enc_hevc_10bit",
+		&pdata->mfc_bw_info.bw_enc_hevc_10bit.peak, 3);
+	of_property_read_u32_array
+		(np, "bw_enc_vp8",
+		&pdata->mfc_bw_info.bw_enc_vp8.peak, 3);
+	of_property_read_u32_array
+		(np, "bw_enc_vp9",
+		&pdata->mfc_bw_info.bw_enc_vp9.peak, 3);
+	of_property_read_u32_array
+		(np, "bw_enc_vp9_10bit",
+		&pdata->mfc_bw_info.bw_enc_vp9_10bit.peak, 3);
+	of_property_read_u32_array
+		(np, "bw_enc_mpeg4",
+		&pdata->mfc_bw_info.bw_enc_mpeg4.peak, 3);
 	of_property_read_u32_array
 		(np, "bw_dec_h264",
 		&pdata->mfc_bw_info.bw_dec_h264.peak, 3);
@@ -745,6 +915,11 @@ static int __mfc_parse_dt(struct device_node *np, struct mfc_dev *mfc)
 	of_property_read_u32(np, "scheduler", &pdata->scheduler);
 	of_property_read_u32(np, "pbs_num_prio", &pdata->pbs_num_prio);
 
+	/* Encoder RGB CSC formula by VUI from F/W */
+	of_property_read_u32(np, "enc_rgb_csc_by_fw", &pdata->enc_rgb_csc_by_fw);
+
+	of_property_read_u32(np, "support_enc_mode1", &pdata->support_enc_mode1);
+
 	of_property_read_u32(np, "support_mv_hevc", &pdata->support_mv_hevc);
 
 	return 0;
@@ -771,7 +946,7 @@ static struct video_device *__mfc_video_device_register
 	if (IS_DEC_NODE(node_num))
 		vfd->ioctl_ops = mfc_get_dec_v4l2_ioctl_ops();
 	else if (IS_ENC_NODE(node_num))
-		vfd->ioctl_ops = NULL;
+		vfd->ioctl_ops = mfc_get_enc_v4l2_ioctl_ops();
 
 	vfd->lock = &dev->mfc_mutex;
 	vfd->v4l2_dev = &dev->v4l2_dev;
@@ -1126,7 +1301,7 @@ static const struct dev_pm_ops mfc_pm_ops = {
 struct mfc_ctx_buf_size mfc_ctx_buf_size = {
 	.dev_ctx	= PAGE_ALIGN(0x7800),	/*  30KB */
 	.h264_dec_ctx	= PAGE_ALIGN(0x200000),	/* 1.6MB */
-	.av1_dec_ctx	= PAGE_ALIGN(0x19000),	/* 100KB */
+	.av1_dec_ctx    = PAGE_ALIGN(0x19000),  /* 100KB */
 	.other_dec_ctx	= PAGE_ALIGN(0xF000),	/*  60KB */
 	.h264_enc_ctx	= PAGE_ALIGN(0x19000),	/* 100KB */
 	.hevc_enc_ctx	= PAGE_ALIGN(0xC800),	/*  50KB */
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core.c
index aad3273ce2ba..2d9c2ffef0d4 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core.c
@@ -29,6 +29,7 @@
 #include "mfc_core_ops.h"
 #include "mfc_core_isr.h"
 #include "mfc_dec_v4l2.h"
+#include "mfc_enc_v4l2.h"
 #include "mfc_debugfs.h"
 
 #include "mfc_core_hwlock.h"
@@ -79,6 +80,8 @@ static int __mfc_core_parse_mfc_qos_platdata(struct device_node *np,
 	of_property_read_u32(np_qos, "mo_value", &qosdata->mo_value);
 	of_property_read_u32(np_qos, "mo_10bit_value",
 			     &qosdata->mo_10bit_value);
+	of_property_read_u32(np_qos, "mo_uhd_enc60_value",
+			     &qosdata->mo_uhd_enc60_value);
 	of_property_read_u32(np_qos, "time_fw", &qosdata->time_fw);
 
 	of_property_read_string(np_qos, "bts_scen", &qosdata->name);
@@ -214,6 +217,8 @@ static int __mfc_core_parse_dt(struct device_node *np, struct mfc_core *core)
 	/* QoS */
 	of_property_read_u32(np, "num_default_qos_steps",
 			     &pdata->num_default_qos_steps);
+	of_property_read_u32(np, "num_encoder_qos_steps",
+			     &pdata->num_encoder_qos_steps);
 	of_property_read_u32(np, "max_mb", &pdata->max_mb);
 	of_property_read_u32(np, "max_hw_mb", &pdata->max_hw_mb);
 	of_property_read_u32(np, "mfc_freq_control", &pdata->mfc_freq_control);
@@ -233,6 +238,18 @@ static int __mfc_core_parse_dt(struct device_node *np, struct mfc_core *core)
 						  core);
 	}
 
+	pdata->encoder_qos_table = devm_kzalloc(core->device,
+						sizeof(struct mfc_qos) *
+						pdata->num_encoder_qos_steps,
+						GFP_KERNEL);
+	for (i = 0; i < pdata->num_encoder_qos_steps; i++) {
+		snprintf(node_name, sizeof(node_name), "mfc_e_qos_variant_%d",
+			 i);
+		__mfc_core_parse_mfc_qos_platdata(np, node_name,
+						  &pdata->encoder_qos_table[i],
+						  core);
+	}
+
 	/* performance boost mode */
 	pdata->qos_boost_table = devm_kzalloc(core->device,
 					      sizeof(struct mfc_qos_boost),
@@ -466,6 +483,15 @@ static int mfc_core_probe(struct platform_device *pdev)
 		     core->core_pdata->default_qos_table[i].freq_mif,
 		     core->core_pdata->default_qos_table[i].name,
 		     core->core_pdata->default_qos_table[i].bts_scen_idx);
+	mfc_core_info("[QoS]-------------------Encoder only table\n");
+	for (i = 0; i < core->core_pdata->num_encoder_qos_steps; i++)
+		mfc_core_info
+		    ("[QoS] table[%d] mfc: %d, int: %d, mif: %d, bts_scen: %s(%d)\n",
+		     i, core->core_pdata->encoder_qos_table[i].freq_mfc,
+		     core->core_pdata->encoder_qos_table[i].freq_int,
+		     core->core_pdata->encoder_qos_table[i].freq_mif,
+		     core->core_pdata->encoder_qos_table[i].name,
+		     core->core_pdata->encoder_qos_table[i].bts_scen_idx);
 #if IS_ENABLED(CONFIG_SAMSUNG_IOMMU)
 	ret = samsung_iommu_register_fault_handler(core->device,
 						   mfc_core_sysmmu_fault_handler,
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_buf_ctrl.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_buf_ctrl.c
index 38f09d6ef2dd..cc0a20bea33a 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_buf_ctrl.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_buf_ctrl.c
@@ -11,6 +11,250 @@
 
 #include "mfc_core_reg_api.h"
 
+static void __mfc_enc_store_buf_ctrls_temporal_svc(int id,
+						   struct mfc_enc_params *p,
+						   struct temporal_layer_info
+						   *temporal_LC)
+{
+	unsigned int num_layer = temporal_LC->temporal_layer_count;
+	int i;
+
+	switch (id) {
+	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_CH:
+		p->codec.h264.num_hier_layer = num_layer & 0x7;
+		for (i = 0; i < (num_layer & 0x7); i++)
+			p->codec.h264.hier_bit_layer[i] =
+			    temporal_LC->temporal_layer_bitrate[i];
+		break;
+	default:
+		break;
+	}
+}
+
+static void __mfc_core_enc_set_buf_ctrls_temporal_svc(struct mfc_core *core,
+						      struct mfc_ctx *ctx,
+						      struct mfc_buf_ctrl
+						      *buf_ctrl)
+{
+	struct mfc_enc *enc = ctx->enc_priv;
+	unsigned int value = 0, value2 = 0;
+	struct temporal_layer_info temporal_LC;
+	unsigned int i;
+	struct mfc_enc_params *p = &enc->params;
+
+	if (buf_ctrl->id
+	    == V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_CH) {
+		memcpy(&temporal_LC,
+		       enc->sh_handle_svc.vaddr,
+		       sizeof(struct temporal_layer_info));
+
+		if ((temporal_LC.temporal_layer_count & 0x7) < 1) {
+			/* clear NUM_T_LAYER_CHANGE */
+			value = MFC_CORE_READL(buf_ctrl->flag_addr);
+			value &= ~BIT(10);
+			MFC_CORE_WRITEL(value, buf_ctrl->flag_addr);
+			mfc_ctx_err
+			    ("[HIERARCHICAL] layer count is invalid : %d\n",
+			     temporal_LC.temporal_layer_count);
+			return;
+		}
+
+		value = MFC_CORE_READL(buf_ctrl->flag_addr);
+		value &= ~(0x3 << 21);
+
+		MFC_CORE_WRITEL(value, buf_ctrl->flag_addr);
+
+		/* Store temporal layer information */
+		__mfc_enc_store_buf_ctrls_temporal_svc(buf_ctrl->id, p,
+						       &temporal_LC);
+
+		/* enable RC_BIT_RATE_CHANGE */
+		value = MFC_CORE_READL(buf_ctrl->flag_addr);
+		if (temporal_LC.temporal_layer_bitrate[0] > 0 ||
+		    p->hier_bitrate_ctrl)
+			/* set RC_BIT_RATE_CHANGE */
+			value |= BIT(2);
+		else
+			/* clear RC_BIT_RATE_CHANGE */
+			value &= ~BIT(2);
+		MFC_CORE_WRITEL(value, buf_ctrl->flag_addr);
+
+		mfc_ctx_debug(3,
+			      "[HIERARCHICAL] layer count %d, E_PARAM_CHANGE %#x\n",
+			      temporal_LC.temporal_layer_count & 0x7, value);
+
+		value = MFC_CORE_READL(MFC_REG_E_NUM_T_LAYER);
+		buf_ctrl->old_val2 = value;
+		value &= ~(0x7);
+		value |= (temporal_LC.temporal_layer_count & 0x7);
+		value &= ~BIT(8);
+		value |= (p->hier_bitrate_ctrl & 0x1) << 8;
+		MFC_CORE_WRITEL(value, MFC_REG_E_NUM_T_LAYER);
+		mfc_ctx_debug(3, "[HIERARCHICAL] E_NUM_T_LAYER %#x\n", value);
+		for (i = 0; i < (temporal_LC.temporal_layer_count & 0x7); i++) {
+			mfc_ctx_debug(3,
+				      "[HIERARCHICAL] layer bitrate[%d] %d (FW ctrl: %d)\n",
+				      i, temporal_LC.temporal_layer_bitrate[i],
+				      p->hier_bitrate_ctrl);
+			MFC_CORE_WRITEL(temporal_LC.temporal_layer_bitrate[i],
+					buf_ctrl->addr + i * 4);
+		}
+		/* priority change */
+		if (IS_H264_ENC(ctx)) {
+			value = 0;
+			value2 = 0;
+			for (i = 0; i < (p->codec.h264.num_hier_layer & 0x07);
+			     i++) {
+				if (i <= 4)
+					value |=
+					    ((p->codec.h264.base_priority & 0x3F) + i)
+					    << (6 * i);
+				else
+					value2 |=
+					    ((p->codec.h264.base_priority & 0x3F) + i)
+					    << (6 * (i - 5));
+			}
+			MFC_CORE_WRITEL(value,
+					MFC_REG_E_H264_HD_SVC_EXTENSION_0);
+			MFC_CORE_WRITEL(value2,
+					MFC_REG_E_H264_HD_SVC_EXTENSION_1);
+			mfc_ctx_debug(3,
+				      "[HIERARCHICAL] EXTENSION0 %#x, EXTENSION1 %#x\n",
+				      value, value2);
+
+			value = MFC_CORE_READL(buf_ctrl->flag_addr);
+			value |= BIT(12);
+			MFC_CORE_WRITEL(value, buf_ctrl->flag_addr);
+			mfc_ctx_debug(3, "[HIERARCHICAL] E_PARAM_CHANGE %#x\n",
+				      value);
+		}
+	}
+
+	/* temproral layer priority */
+	if (buf_ctrl->id == V4L2_CID_MPEG_MFC_H264_BASE_PRIORITY) {
+		value = MFC_CORE_READL(MFC_REG_E_H264_HD_SVC_EXTENSION_0);
+		buf_ctrl->old_val |= value & 0x3FFFFFC0;
+		value &= ~(0x3FFFFFC0);
+		value2 = MFC_CORE_READL(MFC_REG_E_H264_HD_SVC_EXTENSION_1);
+		buf_ctrl->old_val2 = value2 & 0x0FFF;
+		value2 &= ~(0x0FFF);
+		for (i = 0; i < (p->codec.h264.num_hier_layer & 0x07); i++) {
+			if (i <= 4)
+				value |=
+				    ((buf_ctrl->val & 0x3F) + i) << (6 * i);
+			else
+				value2 |=
+				    ((buf_ctrl->val & 0x3F) +
+				     i) << (6 * (i - 5));
+		}
+		MFC_CORE_WRITEL(value, MFC_REG_E_H264_HD_SVC_EXTENSION_0);
+		MFC_CORE_WRITEL(value2, MFC_REG_E_H264_HD_SVC_EXTENSION_1);
+		mfc_ctx_debug(3,
+			      "[HIERARCHICAL] EXTENSION0 %#x, EXTENSION1 %#x\n",
+			      value, value2);
+	}
+}
+
+static void __mfc_core_enc_set_buf_ctrls_exception(struct mfc_core *core,
+						   struct mfc_ctx *ctx,
+						   struct mfc_buf_ctrl
+						   *buf_ctrl)
+{
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_enc_params *p = &enc->params;
+	unsigned int value = 0;
+
+	/* temporal layer setting */
+	__mfc_core_enc_set_buf_ctrls_temporal_svc(core, ctx, buf_ctrl);
+
+	if (buf_ctrl->id == V4L2_CID_MPEG_MFC_H264_MARK_LTR) {
+		value = MFC_CORE_READL(MFC_REG_E_H264_NAL_CONTROL);
+		buf_ctrl->old_val2 = (value >> 8) & 0x7;
+		value &= ~(0x7 << 8);
+		value |= (buf_ctrl->val & 0x7) << 8;
+		MFC_CORE_WRITEL(value, MFC_REG_E_H264_NAL_CONTROL);
+	}
+	if (buf_ctrl->id == V4L2_CID_MPEG_MFC_H264_USE_LTR) {
+		value = MFC_CORE_READL(MFC_REG_E_H264_NAL_CONTROL);
+		buf_ctrl->old_val2 = (value >> 11) & 0xF;
+		value &= ~GENMASK(14, 11);
+		value |= (buf_ctrl->val & 0xF) << 11;
+		MFC_CORE_WRITEL(value, MFC_REG_E_H264_NAL_CONTROL);
+	}
+
+	if (buf_ctrl->id == V4L2_CID_MPEG_MFC51_VIDEO_I_PERIOD_CH) {
+		value = MFC_CORE_READL(MFC_REG_E_GOP_CONFIG2);
+		buf_ctrl->old_val |= (value << 16) & 0x3FFF0000;
+		value &= ~(0x3FFF);
+		value |= (buf_ctrl->val >> 16) & 0x3FFF;
+		MFC_CORE_WRITEL(value, MFC_REG_E_GOP_CONFIG2);
+	}
+
+	/* PROFILE & LEVEL have to be set up together */
+	if (buf_ctrl->id == V4L2_CID_MPEG_VIDEO_H264_LEVEL) {
+		value = MFC_CORE_READL(MFC_REG_E_PICTURE_PROFILE);
+		buf_ctrl->old_val |= (value & 0x000F) << 8;
+		value &= ~(0x000F);
+		value |= p->codec.h264.profile & 0x000F;
+		MFC_CORE_WRITEL(value, MFC_REG_E_PICTURE_PROFILE);
+		p->codec.h264.level = buf_ctrl->val;
+	}
+
+	if (buf_ctrl->id == V4L2_CID_MPEG_VIDEO_H264_PROFILE) {
+		value = MFC_CORE_READL(MFC_REG_E_PICTURE_PROFILE);
+		buf_ctrl->old_val |= value & 0xFF00;
+		value &= ~(0x00FF << 8);
+		value |= (p->codec.h264.level << 8) & 0xFF00;
+		MFC_CORE_WRITEL(value, MFC_REG_E_PICTURE_PROFILE);
+		p->codec.h264.profile = buf_ctrl->val;
+	}
+
+	/* set the ROI buffer DVA */
+	if (buf_ctrl->id == V4L2_CID_MPEG_VIDEO_ROI_CONTROL) {
+		MFC_CORE_DMA_WRITEL(enc->roi_buf[buf_ctrl->old_val2].daddr,
+				    MFC_REG_E_ROI_BUFFER_ADDR);
+		mfc_ctx_debug(3, "[ROI] buffer[%d] addr %#llx, QP val: %#x\n",
+			      buf_ctrl->old_val2,
+			      enc->roi_buf[buf_ctrl->old_val2].daddr,
+			      buf_ctrl->val);
+	}
+
+	/* set frame rate change with delta */
+	if (buf_ctrl->id == V4L2_CID_MPEG_MFC51_VIDEO_FRAME_RATE_CH) {
+		p->rc_frame_delta = p->rc_framerate_res / buf_ctrl->val;
+		value = MFC_CORE_READL(buf_ctrl->addr);
+		value &= ~(buf_ctrl->mask << buf_ctrl->shft);
+		value |=
+		    ((p->rc_frame_delta & buf_ctrl->mask) << buf_ctrl->shft);
+		MFC_CORE_WRITEL(value, buf_ctrl->addr);
+	}
+
+	/* set drop control */
+	if (buf_ctrl->id == V4L2_CID_MPEG_VIDEO_DROP_CONTROL) {
+		p->rc_frame_delta = mfc_enc_get_ts_delta(ctx);
+		value = MFC_CORE_READL(MFC_REG_E_RC_FRAME_RATE);
+		value &= ~(0xFFFF);
+		value |= (p->rc_frame_delta & 0xFFFF);
+		MFC_CORE_WRITEL(value, MFC_REG_E_RC_FRAME_RATE);
+		if (ctx->src_ts.ts_last_interval)
+			mfc_ctx_debug(3,
+				      "[DROPCTRL] fps %d -> %ld, delta: %d, reg: %#x\n",
+				      p->rc_framerate,
+				      USEC_PER_SEC /
+				      ctx->src_ts.ts_last_interval,
+				      p->rc_frame_delta, value);
+		else
+			mfc_ctx_debug(3,
+				      "[DROPCTRL] fps %d -> 0, delta: %d, reg: %#x\n",
+				      p->rc_framerate, p->rc_frame_delta,
+				      value);
+	}
+
+	/* store last config qp value in F/W */
+	if (buf_ctrl->id == V4L2_CID_MPEG_MFC_CONFIG_QP)
+		enc->config_qp = p->config_qp;
+}
+
 static int mfc_core_set_buf_ctrls(struct mfc_core *core,
 				  struct mfc_ctx *ctx, struct list_head *head)
 {
@@ -51,6 +295,10 @@ static int mfc_core_set_buf_ctrls(struct mfc_core *core,
 		if (buf_ctrl->id == V4L2_CID_MPEG_MFC51_VIDEO_FRAME_TAG)
 			ctx->stored_tag = buf_ctrl->val;
 
+		if (ctx->type == MFCINST_ENCODER)
+			__mfc_core_enc_set_buf_ctrls_exception(core, ctx,
+							       buf_ctrl);
+
 		mfc_ctx_debug(6,
 			      "[CTRLS] Set buffer control id: 0x%08x, val: %d (%#x)\n",
 			      buf_ctrl->id, buf_ctrl->val, buf_ctrl->val);
@@ -64,6 +312,7 @@ static int mfc_core_get_buf_ctrls(struct mfc_core *core,
 {
 	struct mfc_buf_ctrl *buf_ctrl;
 	struct mfc_dec *dec = ctx->dec_priv;
+	struct mfc_enc *enc = ctx->enc_priv;
 	unsigned int value = 0;
 
 	list_for_each_entry(buf_ctrl, head, list) {
@@ -89,6 +338,10 @@ static int mfc_core_get_buf_ctrls(struct mfc_core *core,
 		if (buf_ctrl->id == V4L2_CID_MPEG_VIDEO_FRAME_ERROR_TYPE)
 			buf_ctrl->val = mfc_get_frame_error_type(ctx, value);
 
+		if (buf_ctrl->id == V4L2_CID_MPEG_MFC51_VIDEO_FRAME_STATUS)
+			if (enc)
+				buf_ctrl->val = !enc->in_slice;
+
 		mfc_ctx_debug(6,
 			      "[CTRLS] Get buffer control id: 0x%08x, val: %d (%#x)\n",
 			      buf_ctrl->id, buf_ctrl->val, buf_ctrl->val);
@@ -97,6 +350,69 @@ static int mfc_core_get_buf_ctrls(struct mfc_core *core,
 	return 0;
 }
 
+static void __mfc_core_enc_recover_buf_ctrls_exception(struct mfc_core *core,
+						       struct mfc_ctx *ctx,
+						       struct mfc_buf_ctrl
+						       *buf_ctrl)
+{
+	unsigned int value = 0;
+
+	if (buf_ctrl->id == V4L2_CID_MPEG_MFC51_VIDEO_I_PERIOD_CH) {
+		value = MFC_CORE_READL(MFC_REG_E_GOP_CONFIG2);
+		value &= ~(0x3FFF);
+		value |= (buf_ctrl->old_val >> 16) & 0x3FFF;
+		MFC_CORE_WRITEL(value, MFC_REG_E_GOP_CONFIG2);
+	}
+
+	if (buf_ctrl->id == V4L2_CID_MPEG_VIDEO_H264_LEVEL) {
+		value = MFC_CORE_READL(MFC_REG_E_PICTURE_PROFILE);
+		value &= ~(0x000F);
+		value |= (buf_ctrl->old_val >> 8) & 0x000F;
+		MFC_CORE_WRITEL(value, MFC_REG_E_PICTURE_PROFILE);
+	}
+
+	if (buf_ctrl->id == V4L2_CID_MPEG_VIDEO_H264_PROFILE) {
+		value = MFC_CORE_READL(MFC_REG_E_PICTURE_PROFILE);
+		value &= ~(0xFF00);
+		value |= buf_ctrl->old_val & 0xFF00;
+		MFC_CORE_WRITEL(value, MFC_REG_E_PICTURE_PROFILE);
+	}
+
+	if (buf_ctrl->id == V4L2_CID_MPEG_MFC_H264_BASE_PRIORITY) {
+		MFC_CORE_WRITEL(buf_ctrl->old_val,
+				MFC_REG_E_H264_HD_SVC_EXTENSION_0);
+		MFC_CORE_WRITEL(buf_ctrl->old_val2,
+				MFC_REG_E_H264_HD_SVC_EXTENSION_1);
+	}
+
+	if (buf_ctrl->id ==
+	    V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_CH ||
+	    buf_ctrl->id ==
+	    V4L2_CID_MPEG_VIDEO_VP8_HIERARCHICAL_CODING_LAYER_CH ||
+	    buf_ctrl->id ==
+	    V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_CH) {
+		MFC_CORE_WRITEL(buf_ctrl->old_val2, MFC_REG_E_NUM_T_LAYER);
+		/* clear RC_BIT_RATE_CHANGE */
+		value = MFC_CORE_READL(buf_ctrl->flag_addr);
+		value &= ~BIT(2);
+		MFC_CORE_WRITEL(value, buf_ctrl->flag_addr);
+	}
+
+	if (buf_ctrl->id == V4L2_CID_MPEG_MFC_H264_MARK_LTR) {
+		value = MFC_CORE_READL(MFC_REG_E_H264_NAL_CONTROL);
+		value &= ~(0x7 << 8);
+		value |= (buf_ctrl->old_val2 & 0x7) << 8;
+		MFC_CORE_WRITEL(value, MFC_REG_E_H264_NAL_CONTROL);
+	}
+
+	if (buf_ctrl->id == V4L2_CID_MPEG_MFC_H264_USE_LTR) {
+		value = MFC_CORE_READL(MFC_REG_E_H264_NAL_CONTROL);
+		value &= ~GENMASK(14, 11);
+		value |= (buf_ctrl->old_val2 & 0xF) << 11;
+		MFC_CORE_WRITEL(value, MFC_REG_E_H264_NAL_CONTROL);
+	}
+}
+
 static int mfc_core_recover_buf_ctrls(struct mfc_core *core,
 				      struct mfc_ctx *ctx,
 				      struct list_head *head)
@@ -125,6 +441,11 @@ static int mfc_core_recover_buf_ctrls(struct mfc_core *core,
 			MFC_CORE_WRITEL(value, buf_ctrl->flag_addr);
 		}
 
+		/* Exception */
+		if (ctx->type == MFCINST_ENCODER)
+			__mfc_core_enc_recover_buf_ctrls_exception(core, ctx,
+								   buf_ctrl);
+
 		buf_ctrl->updated = 0;
 		mfc_ctx_debug(6,
 			      "[CTRLS] Recover buffer control id: 0x%08x, old val: %d\n",
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.c
index aa2c0b618c19..1a3cf7e76e29 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.c
@@ -777,6 +777,9 @@ static void __mfc_handle_error_state(struct mfc_ctx *ctx, struct mfc_core_ctx *c
 	/* Mark all src buffers as having an error */
 	mfc_cleanup_queue(&ctx->buf_queue_lock, &ctx->src_buf_ready_queue);
 	mfc_cleanup_queue(&ctx->buf_queue_lock, &core_ctx->src_buf_queue);
+	if (ctx->type == MFCINST_ENCODER)
+		mfc_cleanup_queue(&ctx->buf_queue_lock, &ctx->ref_buf_queue);
+	/* Mark all NAL_Q buffers as having an error */
 }
 
 void mfc_core_handle_error(struct mfc_core *core)
@@ -885,6 +888,11 @@ static void __mfc_handle_frame_error(struct mfc_core *core,
 	unsigned int index;
 	enum vb2_buffer_state vb2_state;
 
+	if (ctx->type == MFCINST_ENCODER) {
+		mfc_info("Encoder Interrupt Error (err: %d)\n", mfc_get_err(err));
+		return;
+	}
+
 	dec = ctx->dec_priv;
 	if (!dec) {
 		mfc_err("no mfc decoder to run\n");
@@ -1267,12 +1275,428 @@ static void __mfc_handle_frame(struct mfc_core *core,
 	mfc_debug(2, "Assesing whether this context should be run again\n");
 }
 
-static inline void __mfc_handle_done_frame(struct mfc_core *core,
-					   struct mfc_ctx *ctx,
-					   unsigned int reason,
-					   unsigned int err)
+static void __mfc_handle_error_input(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_buf *mfc_buf = NULL;
+	int index;
+
+	while (1) {
+		mfc_buf = mfc_get_del_buf(ctx, &ctx->err_buf_queue, MFC_BUF_NO_TOUCH_USED);
+		if (!mfc_buf)
+			break;
+
+		index = mfc_buf->vb.vb2_buf.index;
+
+		if (call_bop(ctx, core_recover_buf_ctrls, core, ctx,
+			     &ctx->src_ctrls[index]) < 0)
+			mfc_ctx_err("failed in core_recover_buf_ctrls\n");
+
+		if (call_bop(ctx, core_get_buf_ctrls, core, ctx,
+			     &ctx->src_ctrls[index]) < 0)
+			mfc_ctx_err("failed in core_get_buf_ctrls\n");
+
+		mfc_ctx_info("find src buf(fd: %d) in err_queue\n",
+			     mfc_buf->vb.vb2_buf.planes[0].m.fd);
+		mfc_clear_mb_flag(mfc_buf);
+		mfc_set_mb_flag(mfc_buf, MFC_FLAG_CONSUMED_ONLY);
+		vb2_buffer_done(&mfc_buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+	}
+}
+
+static void __mfc_handle_stream_copy_timestamp(struct mfc_ctx *ctx, struct mfc_buf *src_mb)
+{
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_enc_params *p = &enc->params;
+	struct mfc_buf *dst_mb;
+	u64 interval;
+	u64 start_timestamp;
+	u64 new_timestamp;
+
+	start_timestamp = src_mb->vb.vb2_buf.timestamp;
+	interval = NSEC_PER_SEC / p->rc_framerate;
+	if (ctx->dev->debugfs.debug_ts == 1)
+		mfc_ctx_info("[BUFCON][TS] %dfps, start timestamp: %lld, base interval: %lld\n",
+			     p->rc_framerate, start_timestamp, interval);
+
+	new_timestamp = start_timestamp + (interval * src_mb->done_index);
+	if (ctx->dev->debugfs.debug_ts == 1)
+		mfc_ctx_info("[BUFCON][TS] new timestamp: %lld, interval: %lld\n",
+			     new_timestamp, interval * src_mb->done_index);
+
+	/* Get the destination buffer */
+	dst_mb = mfc_get_buf(ctx, &ctx->dst_buf_queue, MFC_BUF_NO_TOUCH_USED);
+	if (dst_mb)
+		dst_mb->vb.vb2_buf.timestamp = new_timestamp;
+}
+
+static void __mfc_handle_stream_input(struct mfc_core *core, struct mfc_ctx *ctx,
+				      int consumed_only)
 {
-	__mfc_handle_frame(core, ctx, reason, err);
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	struct mfc_raw_info *raw;
+	struct mfc_buf *ref_mb, *src_mb;
+	dma_addr_t enc_addr[3] = { 0, 0, 0 };
+	struct mfc_enc *enc = ctx->enc_priv;
+	int i, found_in_src_queue = 0;
+	unsigned int index;
+
+	raw = &ctx->raw_buf;
+
+	mfc_core_get_enc_frame_buffer(core, ctx, &enc_addr[0], raw->num_planes);
+	if (enc_addr[0] == 0) {
+		mfc_debug(3, "no encoded src\n");
+
+		if (enc->fake_src && enc->params.num_b_frame) {
+			mfc_change_state(core_ctx, MFCINST_FINISHING);
+			enc->fake_src = 0;
+			mfc_debug(2, "clear fake_src and change to FINISHING\n");
+		}
+
+		goto move_buf;
+	}
+	for (i = 0; i < raw->num_planes; i++)
+		mfc_debug(2, "[BUFINFO] ctx[%d] get src addr[%d]: 0x%08llx\n",
+			  ctx->num, i, enc_addr[i]);
+
+	if (ctx->multi_view_enable &&
+	    ctx->select_view == MFC_VIEW_ID_MAIN) {
+		mfc_debug(2, "not handling src_mb to reuse for VIEW_1\n");
+		return;
+	}
+
+	if (IS_BUFFER_BATCH_MODE(ctx)) {
+		src_mb = mfc_find_first_buf(ctx, &core_ctx->src_buf_queue, enc_addr[0]);
+		if (src_mb) {
+			found_in_src_queue = 1;
+
+			__mfc_handle_stream_copy_timestamp(ctx, src_mb);
+			src_mb->done_index++;
+			mfc_debug(4, "[BUFCON] batch buf done_index: %d\n", src_mb->done_index);
+
+			index = src_mb->vb.vb2_buf.index;
+			/* single buffer || last image in a buffer container */
+			if (!src_mb->num_valid_bufs ||
+			    src_mb->done_index == src_mb->num_valid_bufs) {
+				if (consumed_only) {
+					mfc_clear_mb_flag(src_mb);
+					mfc_set_mb_flag(src_mb, MFC_FLAG_CONSUMED_ONLY);
+				}
+
+				if (call_bop(ctx, core_recover_buf_ctrls, core, ctx,
+					     &ctx->src_ctrls[index]) < 0)
+					mfc_err("failed in core_recover_buf_ctrls\n");
+
+				if (call_bop(ctx, core_get_buf_ctrls, core, ctx,
+					     &ctx->src_ctrls[index]) < 0)
+					mfc_err("failed in core_get_buf_ctrls\n");
+
+				src_mb = mfc_find_del_buf(ctx,
+							  &core_ctx->src_buf_queue,
+							  enc_addr[0]);
+				if (src_mb) {
+					for (i = 0; i < raw->num_planes; i++)
+						mfc_bufcon_put_daddr(ctx, src_mb, i);
+					vb2_buffer_done(&src_mb->vb.vb2_buf, VB2_BUF_STATE_DONE);
+				}
+			}
+		}
+	} else {
+		/* normal single buffer */
+		src_mb = mfc_find_del_buf(ctx, &core_ctx->src_buf_queue, enc_addr[0]);
+		if (src_mb) {
+			found_in_src_queue = 1;
+			index = src_mb->vb.vb2_buf.index;
+			if (consumed_only) {
+				mfc_clear_mb_flag(src_mb);
+				mfc_set_mb_flag(src_mb, MFC_FLAG_CONSUMED_ONLY);
+			}
+
+			if (call_bop(ctx, core_recover_buf_ctrls, core, ctx,
+				     &ctx->src_ctrls[index]) < 0)
+				mfc_err("failed in core_recover_buf_ctrls\n");
+
+			if (call_bop(ctx, core_get_buf_ctrls, core, ctx,
+				     &ctx->src_ctrls[index]) < 0)
+				mfc_err("failed in core_get_buf_ctrls\n");
+
+			mfc_debug(3, "find src buf in src_queue\n");
+			vb2_buffer_done(&src_mb->vb.vb2_buf, VB2_BUF_STATE_DONE);
+		} else {
+			mfc_debug(3, "no src buf in src_queue\n");
+			ref_mb = mfc_find_del_buf(ctx, &ctx->ref_buf_queue, enc_addr[0]);
+			if (ref_mb) {
+				index = ref_mb->vb.vb2_buf.index;
+				if (consumed_only) {
+					mfc_clear_mb_flag(ref_mb);
+					mfc_set_mb_flag(ref_mb, MFC_FLAG_CONSUMED_ONLY);
+				}
+
+				if (call_bop(ctx, core_recover_buf_ctrls, core, ctx,
+					     &ctx->src_ctrls[index]) < 0)
+					mfc_err("failed in core_recover_buf_ctrls\n");
+
+				if (call_bop(ctx, core_get_buf_ctrls, core, ctx,
+					     &ctx->src_ctrls[index]) < 0)
+					mfc_err("failed in core_get_buf_ctrls\n");
+
+				mfc_debug(3, "find src buf in ref_queue\n");
+				vb2_buffer_done(&ref_mb->vb.vb2_buf, VB2_BUF_STATE_DONE);
+			} else {
+				mfc_err("couldn't find src buffer\n");
+			}
+		}
+	}
+
+move_buf:
+	/* move enqueued src buffer: src queue -> ref queue */
+	if (!found_in_src_queue && core_ctx->state != MFCINST_FINISHING) {
+		mfc_get_move_buf_used(ctx, &ctx->ref_buf_queue, &core_ctx->src_buf_queue);
+
+		mfc_debug(2, "enc src_buf_queue(%d) -> ref_buf_queue(%d)\n",
+			  mfc_get_queue_count(&ctx->buf_queue_lock, &core_ctx->src_buf_queue),
+			  mfc_get_queue_count(&ctx->buf_queue_lock, &ctx->ref_buf_queue));
+	}
+}
+
+static void __mfc_handle_stream_output(struct mfc_core *core,
+				       struct mfc_ctx *ctx,
+				       int slice_type,
+				       unsigned int strm_size)
+{
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_buf *dst_mb;
+	unsigned int index, idr_flag = 1;
+
+	if (strm_size == 0) {
+		mfc_ctx_debug(3, "no encoded dst (reuse)\n");
+		return;
+	}
+
+	if (ctx->select_view == MFC_VIEW_ID_MAIN &&
+	    MFC_FEATURE_SUPPORT(dev, dev->pdata->enc_idr_flag))
+		enc->idr_flag = mfc_core_get_enc_idr_flag();
+	idr_flag = enc->idr_flag;
+
+	/* at least one more dest. buffers exist always  */
+	if (ctx->multi_view_enable &&
+	    ctx->select_view == MFC_VIEW_ID_MAIN) {
+		mfc_ctx_debug(2, "not handling dst_mb to reuse for VIEW_1\n");
+		return;
+	}
+
+	dst_mb = mfc_get_del_buf(ctx, &ctx->dst_buf_queue, MFC_BUF_NO_TOUCH_USED);
+	if (!dst_mb) {
+		mfc_ctx_err("no dst buffers\n");
+		return;
+	}
+
+	mfc_ctx_debug(2, "[BUFINFO] ctx[%d] get dst addr: 0x%08llx\n",
+		      ctx->num, dst_mb->addr[0][0]);
+
+	mfc_clear_mb_flag(dst_mb);
+	dst_mb->vb.flags &= ~(V4L2_BUF_FLAG_KEYFRAME |
+				V4L2_BUF_FLAG_PFRAME |
+				V4L2_BUF_FLAG_BFRAME);
+	switch (slice_type) {
+	case MFC_REG_E_SLICE_TYPE_I:
+		dst_mb->vb.flags |= V4L2_BUF_FLAG_KEYFRAME;
+		if (!(CODEC_HAS_IDR(ctx) && !idr_flag)) {
+			mfc_set_mb_flag(dst_mb, MFC_FLAG_SYNC_FRAME);
+			mfc_ctx_debug(2, "[STREAM] syncframe IDR\n");
+		}
+		break;
+	case MFC_REG_E_SLICE_TYPE_P:
+		dst_mb->vb.flags |= V4L2_BUF_FLAG_PFRAME;
+		break;
+	case MFC_REG_E_SLICE_TYPE_B:
+		dst_mb->vb.flags |= V4L2_BUF_FLAG_BFRAME;
+		break;
+	default:
+		dst_mb->vb.flags |= V4L2_BUF_FLAG_KEYFRAME;
+		break;
+	}
+	mfc_ctx_debug(2, "[STREAM] Slice type flag: %d\n", dst_mb->vb.flags);
+
+	if (IS_MULTI_MODE(ctx) &&
+	    !(dev->debugfs.feature_option & MFC_OPTION_STREAM_COPY_DISABLE)) {
+		unsigned int tile0_size, tile1_size;
+		unsigned int size;
+		unsigned char *vaddr;
+		struct sg_table *sgt;
+
+		tile0_size = MFC_CORE_READL(MFC_REG_E_TILE0_STREAM_SIZE);
+		tile1_size = MFC_CORE_READL(MFC_REG_E_TILE1_STREAM_SIZE);
+
+		size = (unsigned int)vb2_plane_size(&dst_mb->vb.vb2_buf, 0);
+		size = ALIGN(size, STREAM_BUF_ALIGN);
+
+		sgt = vb2_dma_sg_plane_desc(&dst_mb->vb.vb2_buf, 0);
+		dma_sync_sgtable_for_cpu(dev->device, sgt, DMA_BIDIRECTIONAL);
+
+		vaddr = vb2_plane_vaddr(&dst_mb->vb.vb2_buf, 0);
+		if (!vaddr)
+			mfc_ctx_err("failed to get vaddr for copying stream\n");
+		else
+			memmove(vaddr + tile0_size, vaddr + ALIGN(size / 2, 16), tile1_size);
+
+		mfc_ctx_debug(3, "memmove done: %d + %d\n", tile0_size, tile1_size);
+	}
+
+	vb2_set_plane_payload(&dst_mb->vb.vb2_buf, 0, strm_size);
+	mfc_rate_update_framerate(ctx);
+
+	index = dst_mb->vb.vb2_buf.index;
+	if (call_bop(ctx, core_get_buf_ctrls, core, ctx, &ctx->dst_ctrls[index]) < 0)
+		mfc_ctx_err("failed in core_get_buf_ctrls\n");
+
+	vb2_buffer_done(&dst_mb->vb.vb2_buf, VB2_BUF_STATE_DONE);
+}
+
+static void __mfc_handle_stream_last_output(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_buf *dst_mb;
+	unsigned int index;
+
+	/* at least one more dest. buffers exist always  */
+	dst_mb = mfc_get_del_buf(ctx, &ctx->dst_buf_queue, MFC_BUF_NO_TOUCH_USED);
+	if (!dst_mb) {
+		mfc_ctx_err("no dst buffers\n");
+		return;
+	}
+
+	mfc_ctx_debug(2, "[BUFINFO] ctx[%d] get dst addr: 0x%08llx\n",
+		      ctx->num, dst_mb->addr[0][0]);
+
+	dst_mb->vb.flags &= ~(V4L2_BUF_FLAG_KEYFRAME |
+			      V4L2_BUF_FLAG_PFRAME |
+			      V4L2_BUF_FLAG_BFRAME);
+
+	vb2_set_plane_payload(&dst_mb->vb.vb2_buf, 0, 0);
+
+	index = dst_mb->vb.vb2_buf.index;
+	if (call_bop(ctx, core_get_buf_ctrls, core, ctx, &ctx->dst_ctrls[index]) < 0)
+		mfc_ctx_err("failed in core_get_buf_ctrls\n");
+
+	mfc_ctx_debug(2, "[STREAM] update tag for last stream\n");
+	call_cop(ctx, update_buf_val, ctx, &ctx->dst_ctrls[index],
+		 V4L2_CID_MPEG_MFC51_VIDEO_FRAME_TAG, ctx->stored_tag);
+
+	vb2_buffer_done(&dst_mb->vb.vb2_buf, VB2_BUF_STATE_DONE);
+}
+
+/* Handle frame encoding interrupt */
+static int __mfc_handle_stream(struct mfc_core *core, struct mfc_ctx *ctx, unsigned int reason)
+{
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_core *subcore;
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	int slice_type, consumed_only = 0;
+	unsigned int strm_size;
+	unsigned int pic_count;
+
+	slice_type = mfc_core_get_enc_slice_type();
+	strm_size = mfc_core_get_enc_strm_size();
+	pic_count = mfc_core_get_enc_pic_count();
+
+	mfc_debug(2, "[STREAM] encoded slice type: %d, size: %d, display order: %d\n",
+		  slice_type, strm_size, pic_count);
+
+	/* clear vOTF enable */
+	mfc_core_clear_enc_src_votf(core);
+
+	/* buffer full handling */
+	if (enc->buf_full) {
+		core_ctx->prev_state = core_ctx->state;
+		mfc_change_state(core_ctx, MFCINST_ABORT_INST);
+		return 0;
+	}
+	if (core_ctx->state == MFCINST_RUNNING_BUF_FULL)
+		mfc_change_state(core_ctx, core_ctx->prev_state);
+
+	/* set encoded frame type */
+	if (ctx->select_view == MFC_VIEW_ID_MAIN)
+		enc->frame_type = slice_type;
+	ctx->sequence++;
+
+	if (enc->in_slice) {
+		if (mfc_is_queue_count_same(&ctx->buf_queue_lock, &ctx->dst_buf_queue, 0))
+			core->sched->clear_work(core, core_ctx);
+		return 0;
+	}
+
+	if (mfc_qos_mb_calculate(core, core_ctx, mfc_core_get_processing_cycle(), slice_type)) {
+		mfc_qos_on(core, ctx);
+		if (IS_TWO_MODE1(ctx)) {
+			subcore = mfc_get_sub_core(dev, ctx);
+			if (subcore) {
+				subcore->core_ctx[ctx->num]->dynamic_weight_level =
+					core_ctx->dynamic_weight_level;
+				mfc_qos_on(subcore, ctx);
+			}
+		}
+	}
+
+	if (strm_size == 0 && !(enc->empty_data && reason == MFC_REG_R2H_CMD_COMPLETE_SEQ_RET)) {
+		mfc_debug(2, "[FRAME] dst buffer is not returned\n");
+		consumed_only = 1;
+	}
+
+	/* handle source buffer */
+	__mfc_handle_stream_input(core, ctx, consumed_only);
+
+	/* handle destination buffer */
+	if (enc->empty_data && reason == MFC_REG_R2H_CMD_COMPLETE_SEQ_RET) {
+		enc->empty_data = 0;
+		mfc_debug(2, "[FRAME] handle EOS for empty data\n");
+		__mfc_handle_stream_last_output(core, ctx);
+	} else {
+		__mfc_handle_stream_output(core, ctx, enc->frame_type, strm_size);
+	}
+	mfc_rate_update_bufq_framerate(ctx, MFC_TS_DST_DQ);
+
+	/* handle error buffer */
+	__mfc_handle_error_input(core, ctx);
+
+	if (ctx->multi_view_enable)
+		ctx->select_view = (ctx->select_view + 1) % MFC_NUM_MULTI_VIEW;
+
+	return 0;
+}
+
+static inline int __mfc_handle_done_frame(struct mfc_core *core,
+					  struct mfc_ctx *ctx,
+					  unsigned int reason,
+					  unsigned int err)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	struct mfc_enc *enc = NULL;
+
+	if (ctx->type == MFCINST_DECODER) {
+		__mfc_handle_frame(core, ctx, reason, err);
+	} else if (ctx->type == MFCINST_ENCODER) {
+		enc = ctx->enc_priv;
+		if (reason == MFC_REG_R2H_CMD_SLICE_DONE_RET) {
+			core->preempt_core_ctx = ctx->num;
+			enc->buf_full = 0;
+			enc->in_slice = 1;
+		} else if (reason == MFC_REG_R2H_CMD_ENC_BUFFER_FULL_RET) {
+			mfc_err("stream buffer size(%d) isn't enough, (Bitrate: %d)\n",
+				mfc_core_get_enc_strm_size(),
+				MFC_CORE_RAW_READL(MFC_REG_E_RC_BIT_RATE));
+
+			core->preempt_core_ctx = ctx->num;
+			enc->buf_full = 1;
+			enc->in_slice = 0;
+		} else {
+			enc->buf_full = 0;
+			enc->in_slice = 0;
+		}
+		__mfc_handle_stream(core, ctx, reason);
+	}
+
+	return 1;
 }
 
 /* Handle header decoder interrupt */
@@ -1387,13 +1811,82 @@ static int __mfc_handle_seq_dec(struct mfc_core *core, struct mfc_ctx *ctx)
 	return 0;
 }
 
+/* Handle header encoder interrupt */
+static int __mfc_handle_seq_enc(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_enc_params *p = &enc->params;
+	struct mfc_buf *dst_mb;
+	int ret, index;
+
+	enc->header_size = mfc_core_get_enc_strm_size();
+	mfc_debug(2, "[STREAM] encoded slice type: %d, header size: %d, display order: %d\n",
+		  mfc_core_get_enc_slice_type(), enc->header_size,
+		  mfc_core_get_enc_pic_count());
+
+	/* Initialize select_view */
+	ctx->select_view = MFC_VIEW_ID_MAIN;
+
+	if (!IS_NO_HEADER_GENERATE(ctx, p) &&
+	    !(ctx->stream_op_mode == MFC_OP_TWO_MODE1 && core->id == MFC_CORE_SUB)) {
+		dst_mb = mfc_get_del_buf
+			(ctx, &ctx->dst_buf_queue, MFC_BUF_NO_TOUCH_USED);
+		if (!dst_mb) {
+			mfc_err("no dst buffers\n");
+			return -EAGAIN;
+		}
+
+		vb2_set_plane_payload
+			(&dst_mb->vb.vb2_buf, 0, mfc_core_get_enc_strm_size());
+
+		index = dst_mb->vb.vb2_buf.index;
+		if (call_bop(ctx, core_get_buf_ctrls, core, ctx,
+			     &ctx->dst_ctrls[index]) < 0)
+			mfc_err("failed in core_get_buf_ctrls\n");
+		call_cop(ctx, update_buf_val, ctx, &ctx->dst_ctrls[index],
+			 V4L2_CID_MPEG_MFC51_VIDEO_FRAME_TAG, HEADER_TAG);
+
+		vb2_buffer_done(&dst_mb->vb.vb2_buf, VB2_BUF_STATE_DONE);
+	}
+
+	ctx->dpb_count = mfc_core_get_enc_dpb_count();
+	ctx->scratch_buf_size = mfc_core_get_enc_scratch_size();
+	ctx->min_dpb_size[0] = mfc_core_get_enc_luma_size();
+	ctx->min_dpb_size[1] = mfc_core_get_enc_chroma_size();
+
+	/* If the ROI is enabled at SEQ_START, clear ROI_ENABLE bit */
+	mfc_core_clear_roi_enable(core);
+
+	if (core_ctx->codec_buffer_allocated) {
+		mfc_debug(2, "[DRC] previous codec buffer is exist\n");
+
+		mfc_release_codec_buffers(core_ctx);
+	}
+
+	ret = mfc_alloc_codec_buffers(core_ctx);
+	if (ret)
+		mfc_err("Failed to allocate encoding buffers\n");
+
+	mfc_change_state(core_ctx, MFCINST_HEAD_PARSED);
+
+	return 0;
+}
+
 static inline void __mfc_handle_nal_abort(struct mfc_core *core,
 					  struct mfc_ctx *ctx,
 					  unsigned int reason)
 {
 	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	struct mfc_enc *enc = ctx->enc_priv;
 
-	mfc_change_state(core_ctx, MFCINST_ABORT);
+	if (ctx->type == MFCINST_ENCODER) {
+		mfc_change_state(core_ctx, MFCINST_RUNNING_BUF_FULL);
+		enc->buf_full = 0;
+		__mfc_handle_stream(core, ctx, reason);
+	} else {
+		mfc_change_state(core_ctx, MFCINST_ABORT);
+	}
 }
 
 irqreturn_t mfc_core_top_half_irq(int irq, void *priv)
@@ -1479,11 +1972,20 @@ static int __mfc_irq_ctx(struct mfc_core *core,
 	case MFC_REG_R2H_CMD_SLICE_DONE_RET:
 	case MFC_REG_R2H_CMD_FIELD_DONE_RET:
 	case MFC_REG_R2H_CMD_FRAME_DONE_RET:
+	case MFC_REG_R2H_CMD_ENC_BUFFER_FULL_RET:
+		return __mfc_handle_done_frame(core, ctx, reason, err);
 	case MFC_REG_R2H_CMD_COMPLETE_SEQ_RET:
-			__mfc_handle_done_frame(core, ctx, reason, err);
+		if (ctx->type == MFCINST_ENCODER) {
+			__mfc_handle_stream(core, ctx, reason);
+			mfc_change_state(core_ctx, MFCINST_FINISHED);
+		} else if (ctx->type == MFCINST_DECODER) {
+			return __mfc_handle_done_frame(core, ctx, reason, err);
+		}
 		break;
 	case MFC_REG_R2H_CMD_SEQ_DONE_RET:
-		if (ctx->type == MFCINST_DECODER)
+		if (ctx->type == MFCINST_ENCODER)
+			__mfc_handle_seq_enc(core, ctx);
+		else if (ctx->type == MFCINST_DECODER)
 			__mfc_handle_seq_dec(core, ctx);
 		break;
 	case MFC_REG_R2H_CMD_OPEN_INSTANCE_RET:
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_sync.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_sync.c
index e4b839eda2da..aedb3f56035e 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_sync.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_sync.c
@@ -30,7 +30,8 @@ static inline unsigned int __mfc_r2h_bit_mask(int cmd)
 			 R2H_BIT(MFC_REG_R2H_CMD_COMPLETE_SEQ_RET) |
 			 R2H_BIT(MFC_REG_R2H_CMD_SLICE_DONE_RET) |
 			 R2H_BIT(MFC_REG_R2H_CMD_INIT_BUFFERS_RET) |
-			 R2H_BIT(MFC_REG_R2H_CMD_NAL_ABORT_RET));
+			 R2H_BIT(MFC_REG_R2H_CMD_NAL_ABORT_RET) |
+			 R2H_BIT(MFC_REG_R2H_CMD_ENC_BUFFER_FULL_RET));
 	/* FIXME: Temporal mask for S3D SEI processing */
 	else if (cmd == MFC_REG_R2H_CMD_INIT_BUFFERS_RET)
 		mask |= (R2H_BIT(MFC_REG_R2H_CMD_FIELD_DONE_RET) |
@@ -311,6 +312,56 @@ static int __mfc_dec_ctx_ready_set_bit(struct mfc_core_ctx *core_ctx)
 	return is_ready;
 }
 
+static int __mfc_enc_ctx_ready_set_bit(struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_enc_params *p = &enc->params;
+	int is_ready = 0;
+	int src_buf_cnt, dst_buf_cnt;
+
+	src_buf_cnt = mfc_get_queue_count(&ctx->buf_queue_lock, &core_ctx->src_buf_queue);
+	dst_buf_cnt = mfc_get_queue_count(&ctx->buf_queue_lock, &ctx->dst_buf_queue);
+
+	/* context is ready to make header */
+	if (core_ctx->state == MFCINST_GOT_INST && dst_buf_cnt) {
+		if (p->seq_hdr_mode == V4L2_MPEG_VIDEO_HEADER_MODE_AT_THE_READY) {
+			if (src_buf_cnt)
+				is_ready = 1;
+		} else {
+			is_ready = 1;
+		}
+	}
+
+	/* In mode1 encoding, MFC1 will run seq_start of dummy. */
+	if (core_ctx->state == MFCINST_GOT_INST &&
+	    (ctx->stream_op_mode == MFC_OP_TWO_MODE1 &&
+	    core_ctx->core->id == MFC_CORE_SUB))
+		is_ready = 1;
+
+	/* context is ready to allocate DPB */
+	else if (core_ctx->state == MFCINST_HEAD_PARSED && dst_buf_cnt &&
+		 !(ctx->stream_op_mode == MFC_OP_TWO_MODE1 &&
+		 core_ctx->core->id == MFC_CORE_SUB))
+		is_ready = 1;
+
+	/* context is ready to encode a frame */
+	else if (core_ctx->state == MFCINST_RUNNING &&
+		 src_buf_cnt && dst_buf_cnt)
+		is_ready = 1;
+
+	/* context is ready to encode a frame for NAL_ABORT command */
+	else if (core_ctx->state == MFCINST_ABORT_INST &&
+		 src_buf_cnt && dst_buf_cnt)
+		is_ready = 1;
+
+	/* context is ready to encode remain frames */
+	else if (core_ctx->state == MFCINST_FINISHING && dst_buf_cnt)
+		is_ready = 1;
+
+	return is_ready;
+}
+
 int mfc_ctx_ready_set_bit_raw(struct mfc_core_ctx *core_ctx, unsigned long *bits, bool set)
 {
 	struct mfc_core *core = core_ctx->core;
@@ -331,7 +382,10 @@ int mfc_ctx_ready_set_bit_raw(struct mfc_core_ctx *core_ctx, unsigned long *bits
 				      &ctx->dst_buf_queue),
 		  core_ctx->state, ctx->capture_state, ctx->wait_state);
 
-	is_ready = __mfc_dec_ctx_ready_set_bit(core_ctx);
+	if (ctx->type == MFCINST_DECODER)
+		is_ready = __mfc_dec_ctx_ready_set_bit(core_ctx);
+	else if (ctx->type == MFCINST_ENCODER)
+		is_ready = __mfc_enc_ctx_ready_set_bit(core_ctx);
 
 	if (is_ready && set) {
 		/* if the ctx is ready and request set_bit, set the work_bit */
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_debugfs.c b/drivers/media/platform/samsung/exynos-mfc/mfc_debugfs.c
index 59cd6f3945ff..8967744b986b 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_debugfs.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_debugfs.c
@@ -33,15 +33,20 @@ static int __mfc_info_show(struct seq_file *s, void *unused)
 		   dev->pdata->skype.support, dev->pdata->skype.version,
 		   dev->pdata->black_bar.support,
 		   dev->pdata->black_bar.version);
-	seq_printf(s, "           color_aspect_dec: %d(0x%x)\n",
+	seq_printf(s, "           color_aspect_dec: %d(0x%x), enc: %d(0x%x)\n",
 		   dev->pdata->color_aspect_dec.support,
-		   dev->pdata->color_aspect_dec.version);
-	seq_printf(s, "           static_info_dec: %d(0x%x)\n",
+		   dev->pdata->color_aspect_dec.version,
+		   dev->pdata->color_aspect_enc.support,
+		   dev->pdata->color_aspect_enc.version);
+	seq_printf(s, "           static_info_dec: %d(0x%x), enc: %d(0x%x)\n",
 		   dev->pdata->static_info_dec.support,
-		   dev->pdata->static_info_dec.version);
-	seq_printf(s, " [FORMATS] 10bit: %s, 422: %s\n",
+		   dev->pdata->static_info_dec.version,
+		   dev->pdata->static_info_enc.support,
+		   dev->pdata->static_info_enc.version);
+	seq_printf(s, " [FORMATS] 10bit: %s, 422: %s, RGB: %s\n",
 		   dev->pdata->support_10bit ? "supported" : "not supported",
-		   dev->pdata->support_422 ? "supported" : "not supported");
+		   dev->pdata->support_422 ? "supported" : "not supported",
+		   dev->pdata->support_rgb ? "supported" : "not supported");
 	seq_printf(s, " [LOWMEM] is_low_mem: %d\n", IS_LOW_MEM);
 
 	for (j = 0; j < dev->num_core; j++) {
-- 
2.34.1

