Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94099228086
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 15:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D886E26C;
	Tue, 21 Jul 2020 13:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454206E20D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 13:05:17 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jxrxL-0000B9-Q9; Tue, 21 Jul 2020 15:05:15 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] gpu: ipu-v3: remove unused functions
Date: Tue, 21 Jul 2020 15:05:04 +0200
Message-Id: <20200721130504.22081-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ipu_mbus_code_to_colorspace, ipu_stride_to_bytes, and
ipu_pixelformat_is_planar are unused. Remove them.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/ipu-v3/ipu-common.c | 67 ---------------------------------
 include/video/imx-ipu-v3.h      |  3 --
 2 files changed, 70 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-common.c b/drivers/gpu/ipu-v3/ipu-common.c
index b3dae9ec1a38..d166ee262ce4 100644
--- a/drivers/gpu/ipu-v3/ipu-common.c
+++ b/drivers/gpu/ipu-v3/ipu-common.c
@@ -133,73 +133,6 @@ enum ipu_color_space ipu_pixelformat_to_colorspace(u32 pixelformat)
 }
 EXPORT_SYMBOL_GPL(ipu_pixelformat_to_colorspace);
 
-bool ipu_pixelformat_is_planar(u32 pixelformat)
-{
-	switch (pixelformat) {
-	case V4L2_PIX_FMT_YUV420:
-	case V4L2_PIX_FMT_YVU420:
-	case V4L2_PIX_FMT_YUV422P:
-	case V4L2_PIX_FMT_NV12:
-	case V4L2_PIX_FMT_NV21:
-	case V4L2_PIX_FMT_NV16:
-	case V4L2_PIX_FMT_NV61:
-		return true;
-	}
-
-	return false;
-}
-EXPORT_SYMBOL_GPL(ipu_pixelformat_is_planar);
-
-enum ipu_color_space ipu_mbus_code_to_colorspace(u32 mbus_code)
-{
-	switch (mbus_code & 0xf000) {
-	case 0x1000:
-		return IPUV3_COLORSPACE_RGB;
-	case 0x2000:
-		return IPUV3_COLORSPACE_YUV;
-	default:
-		return IPUV3_COLORSPACE_UNKNOWN;
-	}
-}
-EXPORT_SYMBOL_GPL(ipu_mbus_code_to_colorspace);
-
-int ipu_stride_to_bytes(u32 pixel_stride, u32 pixelformat)
-{
-	switch (pixelformat) {
-	case V4L2_PIX_FMT_YUV420:
-	case V4L2_PIX_FMT_YVU420:
-	case V4L2_PIX_FMT_YUV422P:
-	case V4L2_PIX_FMT_NV12:
-	case V4L2_PIX_FMT_NV21:
-	case V4L2_PIX_FMT_NV16:
-	case V4L2_PIX_FMT_NV61:
-		/*
-		 * for the planar YUV formats, the stride passed to
-		 * cpmem must be the stride in bytes of the Y plane.
-		 * And all the planar YUV formats have an 8-bit
-		 * Y component.
-		 */
-		return (8 * pixel_stride) >> 3;
-	case V4L2_PIX_FMT_RGB565:
-	case V4L2_PIX_FMT_YUYV:
-	case V4L2_PIX_FMT_UYVY:
-		return (16 * pixel_stride) >> 3;
-	case V4L2_PIX_FMT_BGR24:
-	case V4L2_PIX_FMT_RGB24:
-		return (24 * pixel_stride) >> 3;
-	case V4L2_PIX_FMT_BGR32:
-	case V4L2_PIX_FMT_RGB32:
-	case V4L2_PIX_FMT_XBGR32:
-	case V4L2_PIX_FMT_XRGB32:
-		return (32 * pixel_stride) >> 3;
-	default:
-		break;
-	}
-
-	return -EINVAL;
-}
-EXPORT_SYMBOL_GPL(ipu_stride_to_bytes);
-
 int ipu_degrees_to_rot_mode(enum ipu_rotate_mode *mode, int degrees,
 			    bool hflip, bool vflip)
 {
diff --git a/include/video/imx-ipu-v3.h b/include/video/imx-ipu-v3.h
index 06b0b57e996c..d1b3889f74d8 100644
--- a/include/video/imx-ipu-v3.h
+++ b/include/video/imx-ipu-v3.h
@@ -484,9 +484,6 @@ int ipu_smfc_set_watermark(struct ipu_smfc *smfc, u32 set_level, u32 clr_level);
 
 enum ipu_color_space ipu_drm_fourcc_to_colorspace(u32 drm_fourcc);
 enum ipu_color_space ipu_pixelformat_to_colorspace(u32 pixelformat);
-enum ipu_color_space ipu_mbus_code_to_colorspace(u32 mbus_code);
-int ipu_stride_to_bytes(u32 pixel_stride, u32 pixelformat);
-bool ipu_pixelformat_is_planar(u32 pixelformat);
 int ipu_degrees_to_rot_mode(enum ipu_rotate_mode *mode, int degrees,
 			    bool hflip, bool vflip);
 int ipu_rot_mode_to_degrees(int *degrees, enum ipu_rotate_mode mode,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
