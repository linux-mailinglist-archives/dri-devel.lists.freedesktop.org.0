Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C34AA3C30
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 01:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9651D10E477;
	Tue, 29 Apr 2025 23:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XIs0zpd+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBB210E46F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 23:29:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78A3011D9;
 Wed, 30 Apr 2025 01:29:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1745969354;
 bh=uKBnxPo8iPzATzVB7EC/pGfBhWyXij1r6e0a/svD8GY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XIs0zpd+wHbwc0CWCWpBnSHUGBP3ZCRk+xwjjWrauqbKhJe+4LPUqORuoGqBL+IJ8
 Ax4LeNy13dAlyV0xfiTcKnID65c2AC329Jq1FsqMxgzl3SlZZWM1czVmbbNdOkFoiI
 7DZBa72w57qqj4IvtI4eorCIE4RNO1zo1x1QUnII=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 6/9] media: renesas: vsp1: Allow setting encoding and
 quantization
Date: Wed, 30 Apr 2025 02:29:01 +0300
Message-ID: <20250429232904.26413-7-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429232904.26413-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250429232904.26413-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The RPF and WPF support different encodings and quantizations when
converting between RGB and YUV formats. Allow setting the corresponding
format parameters from userspace, and configure the hardware
accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_pipe.c   | 29 +++++++++++------
 .../media/platform/renesas/vsp1/vsp1_rpf.c    | 29 +++++++++++++++--
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   | 31 +++++++++++++++++--
 .../media/platform/renesas/vsp1/vsp1_video.c  | 19 ++++++++++++
 .../media/platform/renesas/vsp1/vsp1_wpf.c    | 29 +++++++++++++++--
 5 files changed, 121 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index b9ab6c9c96df..59e26284a90f 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
@@ -359,33 +359,42 @@ vsp1_get_format_info_by_index(struct vsp1_device *vsp1, unsigned int index,
  * space and limitations of the VSP1. It should be used in the video device and
  * subdev set format handlers.
  *
- * For now, simply hardcode the color space fields to the VSP1 defaults based
- * on the media bus code.
+ * The colorspace and xfer_func fields are freely configurable, as they are out
+ * of scope for VSP processing. The encoding and quantization is hardcoded for
+ * non-YUV formats, and can be configured for YUV formats.
  */
 void vsp1_adjust_color_space(u32 code, u32 *colorspace, u8 *xfer_func,
 			     u8 *encoding, u8 *quantization)
 {
+	if (*colorspace == V4L2_COLORSPACE_DEFAULT ||
+	    *colorspace >= V4L2_COLORSPACE_LAST)
+		*colorspace = code == MEDIA_BUS_FMT_AYUV8_1X32
+			    ? V4L2_COLORSPACE_SMPTE170M
+			    : V4L2_COLORSPACE_SRGB;
+
+	if (*xfer_func == V4L2_XFER_FUNC_DEFAULT ||
+	    *xfer_func >= V4L2_XFER_FUNC_LAST)
+		*xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(*colorspace);
+
 	switch (code) {
 	case MEDIA_BUS_FMT_ARGB8888_1X32:
 	default:
-		*colorspace = V4L2_COLORSPACE_SRGB;
-		*xfer_func = V4L2_XFER_FUNC_SRGB;
 		*encoding = V4L2_YCBCR_ENC_601;
 		*quantization = V4L2_QUANTIZATION_FULL_RANGE;
 		break;
 
 	case MEDIA_BUS_FMT_AHSV8888_1X32:
-		*colorspace = V4L2_COLORSPACE_SRGB;
-		*xfer_func = V4L2_XFER_FUNC_SRGB;
 		*encoding = V4L2_HSV_ENC_256;
 		*quantization = V4L2_QUANTIZATION_FULL_RANGE;
 		break;
 
 	case MEDIA_BUS_FMT_AYUV8_1X32:
-		*colorspace = V4L2_COLORSPACE_SMPTE170M;
-		*xfer_func = V4L2_XFER_FUNC_709;
-		*encoding = V4L2_YCBCR_ENC_601;
-		*quantization = V4L2_QUANTIZATION_LIM_RANGE;
+		if (*encoding != V4L2_YCBCR_ENC_601 &&
+		    *encoding != V4L2_YCBCR_ENC_709)
+			*encoding = V4L2_YCBCR_ENC_601;
+		if (*quantization != V4L2_QUANTIZATION_FULL_RANGE &&
+		    *quantization != V4L2_QUANTIZATION_LIM_RANGE)
+			*quantization = V4L2_QUANTIZATION_LIM_RANGE;
 		break;
 	}
 }
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
index 5c8b3ba1bd3c..9f2744af54bc 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
@@ -92,8 +92,33 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
 	if (fmtinfo->swap_uv)
 		infmt |= VI6_RPF_INFMT_SPUVS;
 
-	if (sink_format->code != source_format->code)
-		infmt |= VI6_RPF_INFMT_CSC;
+	if (sink_format->code != source_format->code) {
+		u16 ycbcr_enc;
+		u16 quantization;
+		u32 rdtm;
+
+		if (sink_format->code == MEDIA_BUS_FMT_AYUV8_1X32) {
+			ycbcr_enc = sink_format->ycbcr_enc;
+			quantization = sink_format->quantization;
+		} else {
+			ycbcr_enc = source_format->ycbcr_enc;
+			quantization = source_format->quantization;
+		}
+
+		if (ycbcr_enc == V4L2_YCBCR_ENC_601 &&
+		    quantization == V4L2_QUANTIZATION_LIM_RANGE)
+			rdtm = VI6_RPF_INFMT_RDTM_BT601;
+		else if (ycbcr_enc == V4L2_YCBCR_ENC_601 &&
+			 quantization == V4L2_QUANTIZATION_FULL_RANGE)
+			rdtm = VI6_RPF_INFMT_RDTM_BT601_EXT;
+		else if (ycbcr_enc == V4L2_YCBCR_ENC_709 &&
+			 quantization == V4L2_QUANTIZATION_LIM_RANGE)
+			rdtm = VI6_RPF_INFMT_RDTM_BT709;
+		else
+			rdtm = VI6_RPF_INFMT_RDTM_BT709_EXT;
+
+		infmt |= VI6_RPF_INFMT_CSC | rdtm;
+	}
 
 	vsp1_rpf_write(rpf, dlb, VI6_RPF_INFMT, infmt);
 	vsp1_rpf_write(rpf, dlb, VI6_RPF_DSWAP, fmtinfo->swap);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index 4e8bcf6a59ad..9c8085d5d306 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -36,6 +36,11 @@ static int vsp1_rwpf_enum_mbus_code(struct v4l2_subdev *subdev,
 
 	code->code = codes[code->index];
 
+	if (code->pad == RWPF_PAD_SOURCE &&
+	    code->code == MEDIA_BUS_FMT_AYUV8_1X32)
+		code->flags = V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC
+			    | V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION;
+
 	return 0;
 }
 
@@ -79,11 +84,13 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
 	if (fmt->pad == RWPF_PAD_SOURCE) {
 		const struct v4l2_mbus_framefmt *sink_format =
 			v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
+		u16 flags = fmt->format.flags & V4L2_MBUS_FRAMEFMT_SET_CSC;
+		bool csc;
 
 		/*
 		 * The RWPF performs format conversion but can't scale, only the
-		 * format code can be changed on the source pad when converting
-		 * between RGB and YUV.
+		 * format code, encoding and quantization can be changed on the
+		 * source pad when converting between RGB and YUV.
 		 */
 		if (sink_format->code != MEDIA_BUS_FMT_AHSV8888_1X32 &&
 		    fmt->format.code != MEDIA_BUS_FMT_AHSV8888_1X32)
@@ -91,9 +98,29 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
 		else
 			format->code = sink_format->code;
 
+		/*
+		 * Encoding and quantization can only be configured when YCbCr
+		 * <-> RGB is enabled. The V4L2 API requires userspace to set
+		 * the V4L2_MBUS_FRAMEFMT_SET_CSC flag. If either of these
+		 * conditions is not met, use the encoding and quantization
+		 * values from the sink pad.
+		 */
+		csc = (format->code == MEDIA_BUS_FMT_AYUV8_1X32) !=
+		      (sink_format->code == MEDIA_BUS_FMT_AYUV8_1X32);
+
+		if (csc && (flags & V4L2_MBUS_FRAMEFMT_SET_CSC)) {
+			format->ycbcr_enc = fmt->format.ycbcr_enc;
+			format->quantization = fmt->format.quantization;
+		} else {
+			format->ycbcr_enc = sink_format->ycbcr_enc;
+			format->quantization = sink_format->quantization;
+		}
+
 		vsp1_entity_adjust_color_space(format);
 
 		fmt->format = *format;
+		fmt->format.flags = flags;
+
 		goto done;
 	}
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index 68d495c20a84..bc66fbdde3cc 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -129,6 +129,20 @@ static int __vsp1_video_try_format(struct vsp1_video *video,
 	pix->pixelformat = info->fourcc;
 	pix->field = V4L2_FIELD_NONE;
 
+	/*
+	 * Adjust the colour space fields. On capture devices, userspace needs
+	 * to set the V4L2_PIX_FMT_FLAG_SET_CSC to override the defaults. Reset
+	 * all fields to *_DEFAULT if the flag isn't set, to then handle
+	 * capture and output devices in the same way.
+	 */
+	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
+	    !(pix->flags & V4L2_PIX_FMT_FLAG_SET_CSC)) {
+		pix->colorspace = V4L2_COLORSPACE_DEFAULT;
+		pix->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+		pix->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+		pix->quantization = V4L2_QUANTIZATION_DEFAULT;
+	}
+
 	vsp1_adjust_color_space(info->mbus, &pix->colorspace, &pix->xfer_func,
 				&pix->ycbcr_enc, &pix->quantization);
 
@@ -908,6 +922,11 @@ static int vsp1_video_enum_format(struct file *file, void *fh,
 
 	f->pixelformat = info->fourcc;
 
+	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
+	    info->mbus == MEDIA_BUS_FMT_AYUV8_1X32)
+		f->flags = V4L2_FMT_FLAG_CSC_YCBCR_ENC
+			 | V4L2_FMT_FLAG_CSC_QUANTIZATION;
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
index f176750ccd98..49af637c8186 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
@@ -279,8 +279,33 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
 				       (256 << VI6_WPF_ROT_CTRL_LMEM_WD_SHIFT));
 	}
 
-	if (sink_format->code != source_format->code)
-		outfmt |= VI6_WPF_OUTFMT_CSC;
+	if (sink_format->code != source_format->code) {
+		u16 ycbcr_enc;
+		u16 quantization;
+		u32 wrtm;
+
+		if (sink_format->code == MEDIA_BUS_FMT_AYUV8_1X32) {
+			ycbcr_enc = sink_format->ycbcr_enc;
+			quantization = sink_format->quantization;
+		} else {
+			ycbcr_enc = source_format->ycbcr_enc;
+			quantization = source_format->quantization;
+		}
+
+		if (ycbcr_enc == V4L2_YCBCR_ENC_601 &&
+		    quantization == V4L2_QUANTIZATION_LIM_RANGE)
+			wrtm = VI6_WPF_OUTFMT_WRTM_BT601;
+		else if (ycbcr_enc == V4L2_YCBCR_ENC_601 &&
+			 quantization == V4L2_QUANTIZATION_FULL_RANGE)
+			wrtm = VI6_WPF_OUTFMT_WRTM_BT601_EXT;
+		else if (ycbcr_enc == V4L2_YCBCR_ENC_709 &&
+			 quantization == V4L2_QUANTIZATION_LIM_RANGE)
+			wrtm = VI6_WPF_OUTFMT_WRTM_BT709;
+		else
+			wrtm = VI6_WPF_OUTFMT_WRTM_BT709_EXT;
+
+		outfmt |= VI6_WPF_OUTFMT_CSC | wrtm;
+	}
 
 	wpf->outfmt = outfmt;
 
-- 
Regards,

Laurent Pinchart

