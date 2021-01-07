Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD132ECE64
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 12:05:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFC289C82;
	Thu,  7 Jan 2021 11:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F11489C82
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 11:05:00 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kxT69-0003kl-R5; Thu, 07 Jan 2021 12:04:57 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] gpu: ipu-v3: Add Rec.709 limited range support to DP
Date: Thu,  7 Jan 2021 12:04:39 +0100
Message-Id: <20210107110440.13048-1-p.zabel@pengutronix.de>
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

Add YCbCr encoding and quantization range parameters to
ipu_dp_setup_channel() and configure the CSC DP matrix
accordingly.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/imx/ipuv3-plane.c |  9 ++++++---
 drivers/gpu/ipu-v3/ipu-dp.c       | 25 ++++++++++++++++++++++---
 include/video/imx-ipu-v3.h        |  2 ++
 3 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index 075508051b5f..d77210043fe2 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -608,11 +608,14 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 	ics = ipu_drm_fourcc_to_colorspace(fb->format->format);
 	switch (ipu_plane->dp_flow) {
 	case IPU_DP_FLOW_SYNC_BG:
-		ipu_dp_setup_channel(ipu_plane->dp, ics, IPUV3_COLORSPACE_RGB);
+		ipu_dp_setup_channel(ipu_plane->dp, DRM_COLOR_YCBCR_BT601,
+				     DRM_COLOR_YCBCR_LIMITED_RANGE, ics,
+				     IPUV3_COLORSPACE_RGB);
 		break;
 	case IPU_DP_FLOW_SYNC_FG:
-		ipu_dp_setup_channel(ipu_plane->dp, ics,
-					IPUV3_COLORSPACE_UNKNOWN);
+		ipu_dp_setup_channel(ipu_plane->dp, DRM_COLOR_YCBCR_BT601,
+				     DRM_COLOR_YCBCR_LIMITED_RANGE, ics,
+				     IPUV3_COLORSPACE_UNKNOWN);
 		break;
 	}
 
diff --git a/drivers/gpu/ipu-v3/ipu-dp.c b/drivers/gpu/ipu-v3/ipu-dp.c
index 8f67e985f26a..6a558205db96 100644
--- a/drivers/gpu/ipu-v3/ipu-dp.c
+++ b/drivers/gpu/ipu-v3/ipu-dp.c
@@ -10,6 +10,7 @@
 #include <linux/io.h>
 #include <linux/err.h>
 
+#include <drm/drm_color_mgmt.h>
 #include <video/imx-ipu-v3.h>
 #include "ipu-prv.h"
 
@@ -125,6 +126,8 @@ int ipu_dp_set_window_pos(struct ipu_dp *dp, u16 x_pos, u16 y_pos)
 EXPORT_SYMBOL_GPL(ipu_dp_set_window_pos);
 
 static void ipu_dp_csc_init(struct ipu_flow *flow,
+		enum drm_color_encoding ycbcr_enc,
+		enum drm_color_range range,
 		enum ipu_color_space in,
 		enum ipu_color_space out,
 		u32 place)
@@ -148,7 +151,18 @@ static void ipu_dp_csc_init(struct ipu_flow *flow,
 				flow->base + DP_CSC_0);
 		writel(0x200 | (2 << 14) | (0x200 << 16) | (2 << 30),
 				flow->base + DP_CSC_1);
+	} else if (ycbcr_enc == DRM_COLOR_YCBCR_BT709) {
+		/* Rec.709 limited range */
+		writel(0x095 | (0x000 << 16), flow->base + DP_CSC_A_0);
+		writel(0x0e5 | (0x095 << 16), flow->base + DP_CSC_A_1);
+		writel(0x3e5 | (0x3bc << 16), flow->base + DP_CSC_A_2);
+		writel(0x095 | (0x10e << 16), flow->base + DP_CSC_A_3);
+		writel(0x000 | (0x3e10 << 16) | (1 << 30),
+				flow->base + DP_CSC_0);
+		writel(0x09a | (1 << 14) | (0x3dbe << 16) | (1 << 30),
+				flow->base + DP_CSC_1);
 	} else {
+		/* BT.601 limited range */
 		writel(0x095 | (0x000 << 16), flow->base + DP_CSC_A_0);
 		writel(0x0cc | (0x095 << 16), flow->base + DP_CSC_A_1);
 		writel(0x3ce | (0x398 << 16), flow->base + DP_CSC_A_2);
@@ -165,6 +179,8 @@ static void ipu_dp_csc_init(struct ipu_flow *flow,
 }
 
 int ipu_dp_setup_channel(struct ipu_dp *dp,
+		enum drm_color_encoding ycbcr_enc,
+		enum drm_color_range range,
 		enum ipu_color_space in,
 		enum ipu_color_space out)
 {
@@ -183,7 +199,8 @@ int ipu_dp_setup_channel(struct ipu_dp *dp,
 		 * foreground and background are of same colorspace, put
 		 * colorspace converter after combining unit.
 		 */
-		ipu_dp_csc_init(flow, flow->foreground.in_cs, flow->out_cs,
+		ipu_dp_csc_init(flow, ycbcr_enc, range,
+				flow->foreground.in_cs, flow->out_cs,
 				DP_COM_CONF_CSC_DEF_BOTH);
 	} else {
 		if (flow->foreground.in_cs == IPUV3_COLORSPACE_UNKNOWN ||
@@ -192,10 +209,12 @@ int ipu_dp_setup_channel(struct ipu_dp *dp,
 			 * foreground identical to output, apply color
 			 * conversion on background
 			 */
-			ipu_dp_csc_init(flow, flow->background.in_cs,
+			ipu_dp_csc_init(flow, ycbcr_enc, range,
+					flow->background.in_cs,
 					flow->out_cs, DP_COM_CONF_CSC_DEF_BG);
 		else
-			ipu_dp_csc_init(flow, flow->foreground.in_cs,
+			ipu_dp_csc_init(flow, ycbcr_enc, range,
+					flow->foreground.in_cs,
 					flow->out_cs, DP_COM_CONF_CSC_DEF_FG);
 	}
 
diff --git a/include/video/imx-ipu-v3.h b/include/video/imx-ipu-v3.h
index d1b3889f74d8..c422a403c099 100644
--- a/include/video/imx-ipu-v3.h
+++ b/include/video/imx-ipu-v3.h
@@ -17,6 +17,7 @@
 #include <linux/bitmap.h>
 #include <linux/fb.h>
 #include <linux/of.h>
+#include <drm/drm_color_mgmt.h>
 #include <media/v4l2-mediabus.h>
 #include <video/videomode.h>
 
@@ -330,6 +331,7 @@ int ipu_dp_enable_channel(struct ipu_dp *dp);
 void ipu_dp_disable_channel(struct ipu_dp *dp, bool sync);
 void ipu_dp_disable(struct ipu_soc *ipu);
 int ipu_dp_setup_channel(struct ipu_dp *dp,
+		enum drm_color_encoding ycbcr_enc, enum drm_color_range range,
 		enum ipu_color_space in, enum ipu_color_space out);
 int ipu_dp_set_window_pos(struct ipu_dp *, u16 x_pos, u16 y_pos);
 int ipu_dp_set_global_alpha(struct ipu_dp *dp, bool enable, u8 alpha,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
