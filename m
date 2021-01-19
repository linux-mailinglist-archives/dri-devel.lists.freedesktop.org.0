Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDA42FB6BE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 15:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E9589C29;
	Tue, 19 Jan 2021 14:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE7B89C29
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 14:08:54 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1l1rgj-0003nY-DE; Tue, 19 Jan 2021 15:08:53 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/imx: ipuv3-plane: do not advertise YUV formats on planes
 without CSC
Date: Tue, 19 Jan 2021 15:08:30 +0100
Message-Id: <20210119140830.6654-1-p.zabel@pengutronix.de>
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

Only planes that are displayed via the Display Processor (DP) path
support color space conversion. Limit formats on planes that are
shown via the direct Display Controller (DC) path to RGB.

Reported-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/imx/ipuv3-plane.c | 41 ++++++++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index 075508051b5f..c5ff966e2ceb 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -35,7 +35,7 @@ static inline struct ipu_plane *to_ipu_plane(struct drm_plane *p)
 	return container_of(p, struct ipu_plane, base);
 }
 
-static const uint32_t ipu_plane_formats[] = {
+static const uint32_t ipu_plane_all_formats[] = {
 	DRM_FORMAT_ARGB1555,
 	DRM_FORMAT_XRGB1555,
 	DRM_FORMAT_ABGR1555,
@@ -72,6 +72,31 @@ static const uint32_t ipu_plane_formats[] = {
 	DRM_FORMAT_BGRX8888_A8,
 };
 
+static const uint32_t ipu_plane_rgb_formats[] = {
+	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_ABGR1555,
+	DRM_FORMAT_XBGR1555,
+	DRM_FORMAT_RGBA5551,
+	DRM_FORMAT_BGRA5551,
+	DRM_FORMAT_ARGB4444,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_RGB565_A8,
+	DRM_FORMAT_BGR565_A8,
+	DRM_FORMAT_RGB888_A8,
+	DRM_FORMAT_BGR888_A8,
+	DRM_FORMAT_RGBX8888_A8,
+	DRM_FORMAT_BGRX8888_A8,
+};
+
 static const uint64_t ipu_format_modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_INVALID
@@ -822,16 +847,24 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 	struct ipu_plane *ipu_plane;
 	const uint64_t *modifiers = ipu_format_modifiers;
 	unsigned int zpos = (type == DRM_PLANE_TYPE_PRIMARY) ? 0 : 1;
+	unsigned int format_count;
+	const uint32_t *formats;
 	int ret;
 
 	DRM_DEBUG_KMS("channel %d, dp flow %d, possible_crtcs=0x%x\n",
 		      dma, dp, possible_crtcs);
 
+	if (dp == IPU_DP_FLOW_SYNC_BG || dp == IPU_DP_FLOW_SYNC_FG) {
+		formats = ipu_plane_all_formats;
+		format_count = ARRAY_SIZE(ipu_plane_all_formats);
+	} else {
+		formats = ipu_plane_rgb_formats;
+		format_count = ARRAY_SIZE(ipu_plane_rgb_formats);
+	}
 	ipu_plane = drmm_universal_plane_alloc(dev, struct ipu_plane, base,
 					       possible_crtcs, &ipu_plane_funcs,
-					       ipu_plane_formats,
-					       ARRAY_SIZE(ipu_plane_formats),
-					       modifiers, type, NULL);
+					       formats, format_count, modifiers,
+					       type, NULL);
 	if (IS_ERR(ipu_plane)) {
 		DRM_ERROR("failed to allocate and initialize %s plane\n",
 			  zpos ? "overlay" : "primary");
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
