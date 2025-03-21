Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BAEA6C13B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 18:22:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC0010E7F3;
	Fri, 21 Mar 2025 17:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZPVq7b25";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60B910E7F3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 17:22:31 +0000 (UTC)
Received: from Monstersaurus.lan
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1A362C5;
 Fri, 21 Mar 2025 18:20:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1742577645;
 bh=9yJe3cG2BOMYrflBr3vW78WFW6QZDL9eRuM8AXZ6BHA=;
 h=From:To:Cc:Subject:Date:From;
 b=ZPVq7b25iHFHI1bJLl64Df/ufCNyMX+TxYhSjvG+SuxGn8P0p8R7fFKjR404ePuCv
 9zf+Rdi1JwerF2cLxjqQJ9xwhJFSE21Ut+BIefwTZHnKWiY4+x3CLkRQTrSrApQHgW
 TM77fWs4iCWVGfzXTt4aKzpL0slNZje3rFeSOCVM=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH] drm: renesas: Extend RZ/G2L supported KMS formats
Date: Fri, 21 Mar 2025 17:22:19 +0000
Message-ID: <20250321172220.867165-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.48.1
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

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The RZ/G2L driver utilises the VSPD to read data from input sources.

The rzg2l_du_kms component lists a restricted subset of the capabilities
of the VSPd which prevents additional formats from being used for
display planes.

The supported display plane formats are mapped in rzg2l_du_vsp_formats[].

Extend the rzg2l_du_format_infos[] table with the corresponding mappings
between the supported DRM formats and the formats exposed by the VSP in
rzg2l_du_vsp_formats, maintaining the same ordering in both tables.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 141 ++++++++++++++++++-
 1 file changed, 136 insertions(+), 5 deletions(-)

Prior to this patch, kmstest reports all of these formats as supported
by the Planes, but using them fails during rzg2l_du_fb_create() as the
corresponding format isn't found in rzg2l_du_format_info.

This patch now lets me capture and render pixelformats from the Mali-C55
direct to an attached DSI panel on the Kakip board.

Patch tested with kms-tests:

PYTHONPATH=/usr/lib/aarch64-linux-gnu/python3.11/site-packages ./tests/kms-test-formats.py 
Testing plane formats: SUCCESS

admin@kakip:~/kms-tests$ cat FormatsTest.log 
U [66.967523] Testing plane formats
U [66.975763] Testing connector DSI-1, CRTC 36, mode 720x1280
U [66.978480] Testing format PixelFormat.RGB332
U [70.143998] Testing format PixelFormat.ARGB4444
U [73.357056] Testing format PixelFormat.XRGB4444
U [76.574944] Testing format PixelFormat.ARGB1555
U [79.805636] Testing format PixelFormat.XRGB1555
U [83.016599] Testing format PixelFormat.RGB565
U [86.230362] Testing format PixelFormat.BGR888
U [89.444673] Testing format PixelFormat.RGB888
U [92.677093] Testing format PixelFormat.BGRA8888
U [95.904745] Testing format PixelFormat.BGRX8888
U [99.119926] Testing format PixelFormat.ARGB8888
U [102.350298] Testing format PixelFormat.XRGB8888
U [105.579499] Testing format PixelFormat.UYVY
U [108.878654] Testing format PixelFormat.YUYV
U [112.176515] Testing format PixelFormat.YVYU
U [115.470090] Testing format PixelFormat.NV12
U [118.767513] Testing format PixelFormat.NV21
U [122.065851] Testing format PixelFormat.NV16
U [125.364001] Testing format PixelFormat.NV61
U [128.662145] Testing format PixelFormat.YUV420
U [131.978102] Testing format PixelFormat.YVU420
U [135.292284] Testing format PixelFormat.YUV422
U [138.623485] Testing format PixelFormat.YVU422
U [141.955083] Testing format PixelFormat.YUV444
U [145.336759] Testing format PixelFormat.YVU444
U [148.761832] Test completed successfully


diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
index b1266fbd9598..a5e96f863172 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
@@ -36,8 +36,61 @@
 
 static const struct rzg2l_du_format_info rzg2l_du_format_infos[] = {
 	{
-		.fourcc = DRM_FORMAT_XRGB8888,
-		.v4l2 = V4L2_PIX_FMT_XBGR32,
+		.fourcc = DRM_FORMAT_RGB332,
+		.v4l2 = V4L2_PIX_FMT_RGB332,
+		.bpp = 8,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_ARGB4444,
+		.v4l2 = V4L2_PIX_FMT_ARGB444,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_XRGB4444,
+		.v4l2 = V4L2_PIX_FMT_XRGB444,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_ARGB1555,
+		.v4l2 = V4L2_PIX_FMT_ARGB555,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_XRGB1555,
+		.v4l2 = V4L2_PIX_FMT_XRGB555,
+		.bpp = 16,
+		.planes = 1,
+	}, {
+		.fourcc = DRM_FORMAT_RGB565,
+		.v4l2 = V4L2_PIX_FMT_RGB565,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_BGR888,
+		.v4l2 = V4L2_PIX_FMT_RGB24,
+		.bpp = 24,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_RGB888,
+		.v4l2 = V4L2_PIX_FMT_BGR24,
+		.bpp = 24,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_BGRA8888,
+		.v4l2 = V4L2_PIX_FMT_ARGB32,
+		.bpp = 32,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_BGRX8888,
+		.v4l2 = V4L2_PIX_FMT_XRGB32,
 		.bpp = 32,
 		.planes = 1,
 		.hsub = 1,
@@ -48,11 +101,89 @@ static const struct rzg2l_du_format_info rzg2l_du_format_infos[] = {
 		.planes = 1,
 		.hsub = 1,
 	}, {
-		.fourcc = DRM_FORMAT_RGB888,
-		.v4l2 = V4L2_PIX_FMT_BGR24,
-		.bpp = 24,
+		.fourcc = DRM_FORMAT_XRGB8888,
+		.v4l2 = V4L2_PIX_FMT_XBGR32,
+		.bpp = 32,
 		.planes = 1,
 		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_UYVY,
+		.v4l2 = V4L2_PIX_FMT_UYVY,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_YUYV,
+		.v4l2 = V4L2_PIX_FMT_YUYV,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_YVYU,
+		.v4l2 = V4L2_PIX_FMT_YVYU,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_NV12,
+		.v4l2 = V4L2_PIX_FMT_NV12M,
+		.bpp = 12,
+		.planes = 2,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_NV21,
+		.v4l2 = V4L2_PIX_FMT_NV21M,
+		.bpp = 12,
+		.planes = 2,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_NV16,
+		.v4l2 = V4L2_PIX_FMT_NV16M,
+		.bpp = 16,
+		.planes = 2,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_NV61,
+		.v4l2 = V4L2_PIX_FMT_NV61M,
+		.bpp = 16,
+		.planes = 2,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_YUV420,
+		.v4l2 = V4L2_PIX_FMT_YUV420M,
+		.bpp = 12,
+		.planes = 3,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_YVU420,
+		.v4l2 = V4L2_PIX_FMT_YVU420M,
+		.bpp = 12,
+		.planes = 3,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_YUV422,
+		.v4l2 = V4L2_PIX_FMT_YUV422M,
+		.bpp = 16,
+		.planes = 3,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_YVU422,
+		.v4l2 = V4L2_PIX_FMT_YVU422M,
+		.bpp = 16,
+		.planes = 3,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_YUV444,
+		.v4l2 = V4L2_PIX_FMT_YUV444M,
+		.bpp = 24,
+		.planes = 3,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_YVU444,
+		.v4l2 = V4L2_PIX_FMT_YVU444M,
+		.bpp = 24,
+		.planes = 3,
+		.hsub = 1,
 	}
 };
 
-- 
2.48.1

