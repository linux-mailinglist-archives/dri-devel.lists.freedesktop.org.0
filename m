Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 714DF4F9512
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 14:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3645410F092;
	Fri,  8 Apr 2022 12:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5847610F035
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 12:03:03 +0000 (UTC)
X-UUID: bdf51f5e099d4da0a397abad5a39034f-20220408
X-UUID: bdf51f5e099d4da0a397abad5a39034f-20220408
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 938053378; Fri, 08 Apr 2022 20:02:56 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Apr 2022 20:02:55 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Apr 2022 20:02:53 +0800
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
 08/17] media: mediatek: vcodec: Getting supported decoder format types
Date: Fri, 8 Apr 2022 20:02:31 +0800
Message-ID: <20220408120240.29571-9-yunfei.dong@mediatek.com>
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

Getting supported output and capture queue format types according
to decoder capability.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../vcodec/mtk_vcodec_dec_stateless.c         | 118 +++++++++++++-----
 1 file changed, 84 insertions(+), 34 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
index 0034b2ee9259..5101322f4fe9 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
@@ -81,34 +81,23 @@ static const struct mtk_stateless_control mtk_stateless_controls[] = {
 
 #define NUM_CTRLS ARRAY_SIZE(mtk_stateless_controls)
 
-static const struct mtk_video_fmt mtk_video_formats[] = {
-	{
-		.fourcc = V4L2_PIX_FMT_H264_SLICE,
-		.type = MTK_FMT_DEC,
-		.num_planes = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_MM21,
-		.type = MTK_FMT_FRAME,
-		.num_planes = 2,
-	},
-};
-
-static const unsigned int num_supported_formats = ARRAY_SIZE(mtk_video_formats);
-
-#define DEFAULT_OUT_FMT_IDX    0
-#define DEFAULT_CAP_FMT_IDX    1
-
-static const struct mtk_codec_framesizes mtk_vdec_framesizes[] = {
-	{
-		.fourcc	= V4L2_PIX_FMT_H264_SLICE,
-		.stepwise = {  MTK_VDEC_MIN_W, MTK_VDEC_MAX_W, 16,
-				MTK_VDEC_MIN_H, MTK_VDEC_MAX_H, 16 },
-	},
+static struct mtk_video_fmt mtk_video_formats[2];
+static struct mtk_codec_framesizes mtk_vdec_framesizes[1];
+
+static struct mtk_video_fmt default_out_format;
+static struct mtk_video_fmt default_cap_format;
+static unsigned int num_formats;
+static unsigned int num_framesizes;
+
+static struct v4l2_frmsize_stepwise stepwise_fhd = {
+	.min_width = MTK_VDEC_MIN_W,
+	.max_width = MTK_VDEC_MAX_W,
+	.step_width = 16,
+	.min_height = MTK_VDEC_MIN_H,
+	.max_height = MTK_VDEC_MAX_H,
+	.step_height = 16
 };
 
-static const unsigned int num_supported_framesize = ARRAY_SIZE(mtk_vdec_framesizes);
-
 static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_ctx *ctx, int error,
 					   struct media_request *src_buf_req)
 {
@@ -323,6 +312,62 @@ const struct media_device_ops mtk_vcodec_media_ops = {
 	.req_queue	= v4l2_m2m_request_queue,
 };
 
+static void mtk_vcodec_add_formats(unsigned int fourcc,
+				   struct mtk_vcodec_ctx *ctx)
+{
+	struct mtk_vcodec_dev *dev = ctx->dev;
+	const struct mtk_vcodec_dec_pdata *pdata = dev->vdec_pdata;
+	int count_formats = *pdata->num_formats;
+	int count_framesizes = *pdata->num_framesizes;
+
+	switch (fourcc) {
+	case V4L2_PIX_FMT_H264_SLICE:
+		mtk_video_formats[count_formats].fourcc = fourcc;
+		mtk_video_formats[count_formats].type = MTK_FMT_DEC;
+		mtk_video_formats[count_formats].num_planes = 1;
+
+		mtk_vdec_framesizes[count_framesizes].fourcc = fourcc;
+		mtk_vdec_framesizes[count_framesizes].stepwise = stepwise_fhd;
+		num_framesizes++;
+		break;
+	case V4L2_PIX_FMT_MM21:
+		mtk_video_formats[count_formats].fourcc = fourcc;
+		mtk_video_formats[count_formats].type = MTK_FMT_FRAME;
+		mtk_video_formats[count_formats].num_planes = 2;
+		break;
+	default:
+		mtk_v4l2_err("Can not add unsupported format type");
+		return;
+	}
+
+	num_formats++;
+	mtk_v4l2_debug(3, "num_formats: %d num_frames:%d dec_capability: 0x%x",
+		       count_formats, count_framesizes, ctx->dev->dec_capability);
+}
+
+static void mtk_vcodec_get_supported_formats(struct mtk_vcodec_ctx *ctx)
+{
+	int cap_format_count = 0, out_format_count = 0;
+
+	if (num_formats && num_framesizes)
+		return;
+
+	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_MM21) {
+		mtk_vcodec_add_formats(V4L2_PIX_FMT_MM21, ctx);
+		cap_format_count++;
+	}
+	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_H264_SLICE) {
+		mtk_vcodec_add_formats(V4L2_PIX_FMT_H264_SLICE, ctx);
+		out_format_count++;
+	}
+
+	if (cap_format_count)
+		default_cap_format = mtk_video_formats[cap_format_count - 1];
+	if (out_format_count)
+		default_out_format =
+			mtk_video_formats[cap_format_count + out_format_count - 1];
+}
+
 static void mtk_init_vdec_params(struct mtk_vcodec_ctx *ctx)
 {
 	struct vb2_queue *src_vq;
@@ -330,6 +375,11 @@ static void mtk_init_vdec_params(struct mtk_vcodec_ctx *ctx)
 	src_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
 				 V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 
+	if (!ctx->dev->vdec_pdata->is_subdev_supported)
+		ctx->dev->dec_capability |=
+			MTK_VDEC_FORMAT_H264_SLICE | MTK_VDEC_FORMAT_MM21;
+	mtk_vcodec_get_supported_formats(ctx);
+
 	/* Support request api for output plane */
 	src_vq->supports_requests = true;
 	src_vq->requires_requests = true;
@@ -363,11 +413,11 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
 	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
 	.vdec_formats = mtk_video_formats,
-	.num_formats = &num_supported_formats,
-	.default_out_fmt = &mtk_video_formats[DEFAULT_OUT_FMT_IDX],
-	.default_cap_fmt = &mtk_video_formats[DEFAULT_CAP_FMT_IDX],
+	.num_formats = &num_formats,
+	.default_out_fmt = &default_out_format,
+	.default_cap_fmt = &default_cap_format,
 	.vdec_framesizes = mtk_vdec_framesizes,
-	.num_framesizes = &num_supported_framesize,
+	.num_framesizes = &num_framesizes,
 	.uses_stateless_api = true,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
@@ -383,11 +433,11 @@ const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata = {
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
 	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
 	.vdec_formats = mtk_video_formats,
-	.num_formats = &num_supported_formats,
-	.default_out_fmt = &mtk_video_formats[DEFAULT_OUT_FMT_IDX],
-	.default_cap_fmt = &mtk_video_formats[DEFAULT_CAP_FMT_IDX],
+	.num_formats = &num_formats,
+	.default_out_fmt = &default_out_format,
+	.default_cap_fmt = &default_cap_format,
 	.vdec_framesizes = mtk_vdec_framesizes,
-	.num_framesizes = &num_supported_framesize,
+	.num_framesizes = &num_framesizes,
 	.uses_stateless_api = true,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
-- 
2.18.0

