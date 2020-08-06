Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8E123D56D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 04:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3ED6E86D;
	Thu,  6 Aug 2020 02:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E106E86D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 02:27:15 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B07E050E;
 Thu,  6 Aug 2020 04:27:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1596680832;
 bh=3KNpcr/VAYokA85eIPs3KnP5XeCnzeYeaRru+cPCVBw=;
 h=From:To:Cc:Subject:Date:From;
 b=p6BNDsKc6q3DL5Cgp8Ke/fcEWm1zGSj36bigAZeNHhsrKv1/1Q/owc96jDFH44yct
 21tdAdxiZTwGZlwp5j0WAefXylbwESGgGFadJnql8aBcLNvQ4fEbzts69qkeEqk0X9
 psvdQ1bFjaOwsWYCS3oJBEMMEmRYkkRch33he+/E=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: rcar-du: Fix pitch handling for fully planar YUV formats
Date: Thu,  6 Aug 2020 05:26:49 +0300
Message-Id: <20200806022649.22506-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When creating a frame buffer, the driver verifies that the pitches for
the chroma planes match the luma plane. This is done incorrectly for
fully planar YUV formats, without taking horizontal subsampling into
account. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 52 ++++++++++++++++++++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_kms.h |  1 +
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 482329102f19..2fda3734a57e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -40,6 +40,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
 		.v4l2 = V4L2_PIX_FMT_RGB565,
 		.bpp = 16,
 		.planes = 1,
+		.hsub = 1,
 		.pnmr = PnMR_SPIM_TP | PnMR_DDDF_16BPP,
 		.edf = PnDDCR4_EDF_NONE,
 	}, {
@@ -47,6 +48,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
 		.v4l2 = V4L2_PIX_FMT_ARGB555,
 		.bpp = 16,
 		.planes = 1,
+		.hsub = 1,
 		.pnmr = PnMR_SPIM_ALP | PnMR_DDDF_ARGB,
 		.edf = PnDDCR4_EDF_NONE,
 	}, {
@@ -61,6 +63,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
 		.v4l2 = V4L2_PIX_FMT_XBGR32,
 		.bpp = 32,
 		.planes = 1,
+		.hsub = 1,
 		.pnmr = PnMR_SPIM_TP | PnMR_DDDF_16BPP,
 		.edf = PnDDCR4_EDF_RGB888,
 	}, {
@@ -68,6 +71,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
 		.v4l2 = V4L2_PIX_FMT_ABGR32,
 		.bpp = 32,
 		.planes = 1,
+		.hsub = 1,
 		.pnmr = PnMR_SPIM_ALP | PnMR_DDDF_16BPP,
 		.edf = PnDDCR4_EDF_ARGB8888,
 	}, {
@@ -75,6 +79,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
 		.v4l2 = V4L2_PIX_FMT_UYVY,
 		.bpp = 16,
 		.planes = 1,
+		.hsub = 2,
 		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
 		.edf = PnDDCR4_EDF_NONE,
 	}, {
@@ -82,6 +87,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
 		.v4l2 = V4L2_PIX_FMT_YUYV,
 		.bpp = 16,
 		.planes = 1,
+		.hsub = 2,
 		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
 		.edf = PnDDCR4_EDF_NONE,
 	}, {
@@ -89,6 +95,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
 		.v4l2 = V4L2_PIX_FMT_NV12M,
 		.bpp = 12,
 		.planes = 2,
+		.hsub = 2,
 		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
 		.edf = PnDDCR4_EDF_NONE,
 	}, {
@@ -96,6 +103,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
 		.v4l2 = V4L2_PIX_FMT_NV21M,
 		.bpp = 12,
 		.planes = 2,
+		.hsub = 2,
 		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
 		.edf = PnDDCR4_EDF_NONE,
 	}, {
@@ -103,6 +111,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
 		.v4l2 = V4L2_PIX_FMT_NV16M,
 		.bpp = 16,
 		.planes = 2,
+		.hsub = 2,
 		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
 		.edf = PnDDCR4_EDF_NONE,
 	},
@@ -115,156 +124,187 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
 		.v4l2 = V4L2_PIX_FMT_RGB332,
 		.bpp = 8,
 		.planes = 1,
+		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_ARGB4444,
 		.v4l2 = V4L2_PIX_FMT_ARGB444,
 		.bpp = 16,
 		.planes = 1,
+		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_XRGB4444,
 		.v4l2 = V4L2_PIX_FMT_XRGB444,
 		.bpp = 16,
 		.planes = 1,
+		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_RGBA4444,
 		.v4l2 = V4L2_PIX_FMT_RGBA444,
 		.bpp = 16,
 		.planes = 1,
+		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_RGBX4444,
 		.v4l2 = V4L2_PIX_FMT_RGBX444,
 		.bpp = 16,
 		.planes = 1,
+		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_ABGR4444,
 		.v4l2 = V4L2_PIX_FMT_ABGR444,
 		.bpp = 16,
 		.planes = 1,
+		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_XBGR4444,
 		.v4l2 = V4L2_PIX_FMT_XBGR444,
 		.bpp = 16,
 		.planes = 1,
+		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_BGRA4444,
 		.v4l2 = V4L2_PIX_FMT_BGRA444,
 		.bpp = 16,
 		.planes = 1,
+		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_BGRX4444,
 		.v4l2 = V4L2_PIX_FMT_BGRX444,
 		.bpp = 16,
 		.planes = 1,
+		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_RGBA5551,
 		.v4l2 = V4L2_PIX_FMT_RGBA555,
 		.bpp = 16,
 		.planes = 1,
+		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_RGBX5551,
 		.v4l2 = V4L2_PIX_FMT_RGBX555,
 		.bpp = 16,
 		.planes = 1,
+		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_ABGR1555,
 		.v4l2 = V4L2_PIX_FMT_ABGR555,
 		.bpp = 16,
 		.planes = 1,
+		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_XBGR1555,
 		.v4l2 = V4L2_PIX_FMT_XBGR555,
 		.bpp = 16,
 		.planes = 1,
+		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_BGRA5551,
 		.v4l2 = V4L2_PIX_FMT_BGRA555,
 		.bpp = 16,
 		.planes = 1,
+		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_BGRX5551,
 		.v4l2 = V4L2_PIX_FMT_BGRX555,
 		.bpp = 16,
 		.planes = 1,
+		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_BGR888,
 		.v4l2 = V4L2_PIX_FMT_RGB24,
 		.bpp = 24,
 		.planes = 1,
+		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_RGB888,
 		.v4l2 = V4L2_PIX_FMT_BGR24,
 		.bpp = 24,
 		.planes = 1,
+		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_RGBA8888,
 		.v4l2 = V4L2_PIX_FMT_BGRA32,
 		.bpp = 32,
 		.planes = 1,
+		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_RGBX8888,
 		.v4l2 = V4L2_PIX_FMT_BGRX32,
 		.bpp = 32,
 		.planes = 1,
+		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_ABGR8888,
 		.v4l2 = V4L2_PIX_FMT_RGBA32,
 		.bpp = 32,
 		.planes = 1,
+		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_XBGR8888,
 		.v4l2 = V4L2_PIX_FMT_RGBX32,
 		.bpp = 32,
 		.planes = 1,
+		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_BGRA8888,
 		.v4l2 = V4L2_PIX_FMT_ARGB32,
 		.bpp = 32,
 		.planes = 1,
+		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_BGRX8888,
 		.v4l2 = V4L2_PIX_FMT_XRGB32,
 		.bpp = 32,
 		.planes = 1,
+		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_YVYU,
 		.v4l2 = V4L2_PIX_FMT_YVYU,
 		.bpp = 16,
 		.planes = 1,
+		.hsub = 2,
 	}, {
 		.fourcc = DRM_FORMAT_NV61,
 		.v4l2 = V4L2_PIX_FMT_NV61M,
 		.bpp = 16,
 		.planes = 2,
+		.hsub = 2,
 	}, {
 		.fourcc = DRM_FORMAT_YUV420,
 		.v4l2 = V4L2_PIX_FMT_YUV420M,
 		.bpp = 12,
 		.planes = 3,
+		.hsub = 2,
 	}, {
 		.fourcc = DRM_FORMAT_YVU420,
 		.v4l2 = V4L2_PIX_FMT_YVU420M,
 		.bpp = 12,
 		.planes = 3,
+		.hsub = 2,
 	}, {
 		.fourcc = DRM_FORMAT_YUV422,
 		.v4l2 = V4L2_PIX_FMT_YUV422M,
 		.bpp = 16,
 		.planes = 3,
+		.hsub = 2,
 	}, {
 		.fourcc = DRM_FORMAT_YVU422,
 		.v4l2 = V4L2_PIX_FMT_YVU422M,
 		.bpp = 16,
 		.planes = 3,
+		.hsub = 2,
 	}, {
 		.fourcc = DRM_FORMAT_YUV444,
 		.v4l2 = V4L2_PIX_FMT_YUV444M,
 		.bpp = 24,
 		.planes = 3,
+		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_YVU444,
 		.v4l2 = V4L2_PIX_FMT_YVU444M,
 		.bpp = 24,
 		.planes = 3,
+		.hsub = 1,
 	},
 };
 
@@ -311,6 +351,7 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 {
 	struct rcar_du_device *rcdu = dev->dev_private;
 	const struct rcar_du_format_info *format;
+	unsigned int chroma_pitch;
 	unsigned int max_pitch;
 	unsigned int align;
 	unsigned int i;
@@ -353,8 +394,17 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		return ERR_PTR(-EINVAL);
 	}
 
+	/*
+	 * Calculate the chroma plane(s) pitch using the horizontal subsampling
+	 * factor. For semi-planar formats, the U and V planes are combined, the
+	 * pitch must thus be doubled.
+	 */
+	chroma_pitch = mode_cmd->pitches[0] / format->hsub;
+	if (format->planes == 2)
+		chroma_pitch *= 2;
+
 	for (i = 1; i < format->planes; ++i) {
-		if (mode_cmd->pitches[i] != mode_cmd->pitches[0]) {
+		if (mode_cmd->pitches[i] != chroma_pitch) {
 			dev_dbg(dev->dev,
 				"luma and chroma pitches do not match\n");
 			return ERR_PTR(-EINVAL);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.h b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
index 0346504d8c59..8f5fff176754 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
@@ -22,6 +22,7 @@ struct rcar_du_format_info {
 	u32 v4l2;
 	unsigned int bpp;
 	unsigned int planes;
+	unsigned int hsub;
 	unsigned int pnmr;
 	unsigned int edf;
 };
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
