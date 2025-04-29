Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C45F5AA3C24
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 01:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB0A10E46D;
	Tue, 29 Apr 2025 23:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Rr/a03nl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F2710E46D
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 23:29:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C35BE725;
 Wed, 30 Apr 2025 01:29:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1745969347;
 bh=cIp/o7zOLRKOnvuCc3bIgInB4teOlFigNACPhTxR5AQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rr/a03nlIny5V43+hNSh1ImF/XhE6y5DyCe5D5yz48Ydau1sWBcXbixgbrg0Krgno
 clwve3gUzqA3fsWCDxyu9gYuLLCezQvgdKkiy9mF5/Rgo0YpyrjZkQMO5K9VvmXV4m
 hHJCu22P6d7iRXyySVrid5I0ITHOEUhG0onzrqAE=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 1/9] media: renesas: vsp1: Implement pixel format
 enumeration
Date: Wed, 30 Apr 2025 02:28:56 +0300
Message-ID: <20250429232904.26413-2-laurent.pinchart+renesas@ideasonboard.com>
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

The VSP1 driver is missing the ability to enumerate pixel formats on its
video nodes, which is supposed to be supported according to the V4L2
API. Implement the enumeration to fix this issue.

As the device is media controller-centric, also implement the ability to
filter pixel formats by media bus code, and report the missing
V4L2_CAP_IO_MC capability.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_pipe.c   | 103 ++++++++++++++----
 .../media/platform/renesas/vsp1/vsp1_pipe.h   |   3 +
 .../media/platform/renesas/vsp1/vsp1_video.c  |  24 +++-
 3 files changed, 105 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index bb0739f684f3..16a78a00c6c9 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
@@ -138,14 +138,6 @@ static const struct vsp1_format_info vsp1_video_formats[] = {
 	  VI6_FMT_ARGB_8888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
 	  1, { 32, 0, 0 }, false, false, 1, 1, false },
-	{ V4L2_PIX_FMT_HSV24, MEDIA_BUS_FMT_AHSV8888_1X32,
-	  VI6_FMT_RGB_888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
-	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  1, { 24, 0, 0 }, false, false, 1, 1, false },
-	{ V4L2_PIX_FMT_HSV32, MEDIA_BUS_FMT_AHSV8888_1X32,
-	  VI6_FMT_ARGB_8888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
-	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  1, { 32, 0, 0 }, false, false, 1, 1, false },
 	{ V4L2_PIX_FMT_RGBX1010102, MEDIA_BUS_FMT_ARGB8888_1X32,
 	  VI6_FMT_RGB10_RGB10A2_A2RGB10,
 	  VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS,
@@ -162,10 +154,6 @@ static const struct vsp1_format_info vsp1_video_formats[] = {
 	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
 	  1, { 16, 0, 0 }, false, false, 2, 1, false },
-	{ V4L2_PIX_FMT_VYUY, MEDIA_BUS_FMT_AYUV8_1X32,
-	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
-	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  1, { 16, 0, 0 }, false, true, 2, 1, false },
 	{ V4L2_PIX_FMT_YUYV, MEDIA_BUS_FMT_AYUV8_1X32,
 	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
@@ -222,6 +210,21 @@ static const struct vsp1_format_info vsp1_video_formats[] = {
 	  1, { 32, 0, 0 }, false, false, 2, 1, false },
 };
 
+static const struct vsp1_format_info vsp1_video_gen2_formats[] = {
+	{ V4L2_PIX_FMT_VYUY, MEDIA_BUS_FMT_AYUV8_1X32,
+	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
+	  1, { 16, 0, 0 }, false, true, 2, 1, false },
+	{ V4L2_PIX_FMT_HSV24, MEDIA_BUS_FMT_AHSV8888_1X32,
+	  VI6_FMT_RGB_888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
+	  1, { 24, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_HSV32, MEDIA_BUS_FMT_AHSV8888_1X32,
+	  VI6_FMT_ARGB_8888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
+	  1, { 32, 0, 0 }, false, false, 1, 1, false },
+};
+
 /**
  * vsp1_get_format_info - Retrieve format information for a 4CC
  * @vsp1: the VSP1 device
@@ -235,16 +238,6 @@ const struct vsp1_format_info *vsp1_get_format_info(struct vsp1_device *vsp1,
 {
 	unsigned int i;
 
-	/* Special case, the VYUY and HSV formats are supported on Gen2 only. */
-	if (vsp1->info->gen != 2) {
-		switch (fourcc) {
-		case V4L2_PIX_FMT_VYUY:
-		case V4L2_PIX_FMT_HSV24:
-		case V4L2_PIX_FMT_HSV32:
-			return NULL;
-		}
-	}
-
 	for (i = 0; i < ARRAY_SIZE(vsp1_video_formats); ++i) {
 		const struct vsp1_format_info *info = &vsp1_video_formats[i];
 
@@ -252,6 +245,72 @@ const struct vsp1_format_info *vsp1_get_format_info(struct vsp1_device *vsp1,
 			return info;
 	}
 
+	if (vsp1->info->gen == 2) {
+		for (i = 0; i < ARRAY_SIZE(vsp1_video_gen2_formats); ++i) {
+			const struct vsp1_format_info *info =
+				&vsp1_video_gen2_formats[i];
+
+			if (info->fourcc == fourcc)
+				return info;
+		}
+	}
+
+	return NULL;
+}
+
+/**
+ * vsp1_get_format_info_by_index - Enumerate format information
+ * @vsp1: the VSP1 device
+ * @index: the format index
+ * @code: media bus code to limit enumeration
+ *
+ * Return a pointer to the format information structure corresponding to the
+ * given index, or NULL if the index exceeds the supported formats list. If the
+ * @code parameter is not zero, only formats compatible with the media bus code
+ * will be enumerated.
+ */
+const struct vsp1_format_info *
+vsp1_get_format_info_by_index(struct vsp1_device *vsp1, unsigned int index,
+			      u32 code)
+{
+	unsigned int i;
+
+	if (!code) {
+		if (index < ARRAY_SIZE(vsp1_video_formats))
+			return &vsp1_video_formats[index];
+
+		if (vsp1->info->gen == 2) {
+			index -= ARRAY_SIZE(vsp1_video_formats);
+			if (index < ARRAY_SIZE(vsp1_video_gen2_formats))
+				return &vsp1_video_gen2_formats[index];
+		}
+
+		return NULL;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(vsp1_video_formats); ++i) {
+		const struct vsp1_format_info *info = &vsp1_video_formats[i];
+
+		if (info->mbus == code) {
+			if (!index)
+				return info;
+			index--;
+		}
+	}
+
+	if (vsp1->info->gen == 2) {
+		for (i = 0; i < ARRAY_SIZE(vsp1_video_gen2_formats); ++i) {
+			const struct vsp1_format_info *info =
+				&vsp1_video_gen2_formats[i];
+
+			if (info->mbus == code) {
+				if (!index)
+					return info;
+				index--;
+			}
+		}
+	}
+
 	return NULL;
 }
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
index 1ba7bdbad5a8..1d3d033af209 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
@@ -179,5 +179,8 @@ void vsp1_pipeline_calculate_partition(struct vsp1_pipeline *pipe,
 
 const struct vsp1_format_info *vsp1_get_format_info(struct vsp1_device *vsp1,
 						    u32 fourcc);
+const struct vsp1_format_info *
+vsp1_get_format_info_by_index(struct vsp1_device *vsp1, unsigned int index,
+			      u32 code);
 
 #endif /* __VSP1_PIPE_H__ */
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index 03f4efd6b82b..da578993f472 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -888,7 +888,7 @@ vsp1_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 	struct vsp1_video *video = to_vsp1_video(vfh->vdev);
 
 	cap->capabilities = V4L2_CAP_DEVICE_CAPS | V4L2_CAP_STREAMING
-			  | V4L2_CAP_VIDEO_CAPTURE_MPLANE
+			  | V4L2_CAP_IO_MC | V4L2_CAP_VIDEO_CAPTURE_MPLANE
 			  | V4L2_CAP_VIDEO_OUTPUT_MPLANE;
 
 
@@ -898,6 +898,22 @@ vsp1_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 	return 0;
 }
 
+static int vsp1_video_enum_format(struct file *file, void *fh,
+				  struct v4l2_fmtdesc *f)
+{
+	struct v4l2_fh *vfh = file->private_data;
+	struct vsp1_video *video = to_vsp1_video(vfh->vdev);
+	const struct vsp1_format_info *info;
+
+	info = vsp1_get_format_info_by_index(video->vsp1, f->index, f->mbus_code);
+	if (!info)
+		return -EINVAL;
+
+	f->pixelformat = info->fourcc;
+
+	return 0;
+}
+
 static int
 vsp1_video_get_format(struct file *file, void *fh, struct v4l2_format *format)
 {
@@ -1013,6 +1029,8 @@ vsp1_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 
 static const struct v4l2_ioctl_ops vsp1_video_ioctl_ops = {
 	.vidioc_querycap		= vsp1_video_querycap,
+	.vidioc_enum_fmt_vid_cap	= vsp1_video_enum_format,
+	.vidioc_enum_fmt_vid_out	= vsp1_video_enum_format,
 	.vidioc_g_fmt_vid_cap_mplane	= vsp1_video_get_format,
 	.vidioc_s_fmt_vid_cap_mplane	= vsp1_video_set_format,
 	.vidioc_try_fmt_vid_cap_mplane	= vsp1_video_try_format,
@@ -1207,14 +1225,14 @@ struct vsp1_video *vsp1_video_create(struct vsp1_device *vsp1,
 		video->pad.flags = MEDIA_PAD_FL_SOURCE;
 		video->video.vfl_dir = VFL_DIR_TX;
 		video->video.device_caps = V4L2_CAP_VIDEO_OUTPUT_MPLANE |
-					   V4L2_CAP_STREAMING;
+					   V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
 	} else {
 		direction = "output";
 		video->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 		video->pad.flags = MEDIA_PAD_FL_SINK;
 		video->video.vfl_dir = VFL_DIR_RX;
 		video->video.device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
-					   V4L2_CAP_STREAMING;
+					   V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
 	}
 
 	mutex_init(&video->lock);
-- 
Regards,

Laurent Pinchart

