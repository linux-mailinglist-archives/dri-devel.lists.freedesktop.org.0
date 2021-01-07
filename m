Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B01E2ECE65
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 12:05:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C496D6E10C;
	Thu,  7 Jan 2021 11:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E626E10C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 11:05:03 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kxT6D-0003kl-RX; Thu, 07 Jan 2021 12:05:01 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/imx: ipuv3-plane: add color encoding and range
 properties
Date: Thu,  7 Jan 2021 12:04:40 +0100
Message-Id: <20210107110440.13048-2-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210107110440.13048-1-p.zabel@pengutronix.de>
References: <20210107110440.13048-1-p.zabel@pengutronix.de>
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

Add COLOR_ENCODING and COLOR_RANGE plane properties and use them to
control the DP CSC matrix.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/imx/ipuv3-plane.c | 44 +++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index d77210043fe2..7909156d3a78 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -284,6 +284,8 @@ static void ipu_plane_state_reset(struct drm_plane *plane)
 		__drm_atomic_helper_plane_reset(plane, &ipu_state->base);
 		ipu_state->base.zpos = zpos;
 		ipu_state->base.normalized_zpos = zpos;
+		ipu_state->base.color_encoding = DRM_COLOR_YCBCR_BT601;
+		ipu_state->base.color_range = DRM_COLOR_YCBCR_LIMITED_RANGE;
 	}
 }
 
@@ -589,6 +591,25 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 					  fb->modifier, &eba);
 	}
 
+	if (!old_state->fb ||
+	    old_state->fb->format->format != fb->format->format ||
+	    old_state->color_encoding != state->color_encoding ||
+	    old_state->color_range != state->color_range) {
+		ics = ipu_drm_fourcc_to_colorspace(fb->format->format);
+		switch (ipu_plane->dp_flow) {
+		case IPU_DP_FLOW_SYNC_BG:
+			ipu_dp_setup_channel(ipu_plane->dp, state->color_encoding,
+					     state->color_range, ics,
+					     IPUV3_COLORSPACE_RGB);
+			break;
+		case IPU_DP_FLOW_SYNC_FG:
+			ipu_dp_setup_channel(ipu_plane->dp, state->color_encoding,
+					     state->color_range, ics,
+					     IPUV3_COLORSPACE_UNKNOWN);
+			break;
+		}
+	}
+
 	if (old_state->fb && !drm_atomic_crtc_needs_modeset(crtc_state)) {
 		/* nothing to do if PRE is used */
 		if (ipu_state->use_pre)
@@ -605,20 +626,6 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 		return;
 	}
 
-	ics = ipu_drm_fourcc_to_colorspace(fb->format->format);
-	switch (ipu_plane->dp_flow) {
-	case IPU_DP_FLOW_SYNC_BG:
-		ipu_dp_setup_channel(ipu_plane->dp, DRM_COLOR_YCBCR_BT601,
-				     DRM_COLOR_YCBCR_LIMITED_RANGE, ics,
-				     IPUV3_COLORSPACE_RGB);
-		break;
-	case IPU_DP_FLOW_SYNC_FG:
-		ipu_dp_setup_channel(ipu_plane->dp, DRM_COLOR_YCBCR_BT601,
-				     DRM_COLOR_YCBCR_LIMITED_RANGE, ics,
-				     IPUV3_COLORSPACE_UNKNOWN);
-		break;
-	}
-
 	ipu_dmfc_config_wait4eot(ipu_plane->dmfc, drm_rect_width(dst));
 
 	width = drm_rect_width(&state->src) >> 16;
@@ -859,6 +866,15 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = drm_plane_create_color_properties(&ipu_plane->base,
+			BIT(DRM_COLOR_YCBCR_BT601) |
+			BIT(DRM_COLOR_YCBCR_BT709),
+			BIT(DRM_COLOR_YCBCR_LIMITED_RANGE),
+			DRM_COLOR_YCBCR_BT601,
+			DRM_COLOR_YCBCR_LIMITED_RANGE);
+	if (ret)
+		return ERR_PTR(ret);
+
 	ret = ipu_plane_get_resources(dev, ipu_plane);
 	if (ret) {
 		DRM_ERROR("failed to get %s plane resources: %pe\n",
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
