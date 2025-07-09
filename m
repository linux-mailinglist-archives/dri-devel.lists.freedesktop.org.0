Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B47AFE0DC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 09:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68EA10E746;
	Wed,  9 Jul 2025 07:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="MeOANRjK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49201.qiye.163.com (mail-m49201.qiye.163.com
 [45.254.49.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409A010E745
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 07:07:27 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 1b69b79b4;
 Wed, 9 Jul 2025 15:02:21 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 l.stach@pengutronix.de, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v2 02/12] drm/bridge: analogix_dp: Move
 &drm_bridge_funcs.mode_set to &drm_bridge_funcs.atomic_enable
Date: Wed,  9 Jul 2025 15:01:29 +0800
Message-Id: <20250709070139.3130635-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709070139.3130635-1-damon.ding@rock-chips.com>
References: <20250709070139.3130635-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkgfQlZOTBhDSEgdTU1DGR1WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a97edfe154e03a3kunm3a7bcd50c83911
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MhQ6OQw4EzE6AS8NFRc5IjEI
 HEkaChxVSlVKTE5JS09PTk9IT05LVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFCSkhJNwY+
DKIM-Signature: a=rsa-sha256;
 b=MeOANRjKEP5jGUgatIAk73cyeA7NfrzSCiXT9AXWeUrVd6Nmu/v2SWk7SmbXFdknlpwl/dYfP6HiVPcdEPqeV9sBv0rFL6SkDtQw/3nuWFRTmVrz6VaeibgOoUoyfuZsYq0uT4dyKNu17vNjBK+Ma+SY3iD3DRMOPT/JzT/Kx5E=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=j0pZMuttmXig7Njkem2AkAr/nuJ+nuKvkSWWoNLSA9Y=;
 h=date:mime-version:subject:message-id:from;
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

According to the include/drm/drm_bridge.h, the callback
&drm_bridge_funcs.mode_set is deprecated and it should be better to
include the mode setting in the &drm_bridge_funcs.atomic_enable instead.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 161 +++++++++---------
 1 file changed, 82 insertions(+), 79 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 505eec6b819b..a9bc935b6220 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1176,12 +1176,88 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 	return ret;
 }
 
+static void analogix_dp_bridge_mode_set(struct drm_bridge *bridge,
+					const struct drm_display_mode *mode)
+{
+	struct analogix_dp_device *dp = bridge->driver_private;
+	struct drm_display_info *display_info = &dp->connector.display_info;
+	struct video_info *video = &dp->video_info;
+	struct device_node *dp_node = dp->dev->of_node;
+	int vic;
+
+	/* Input video interlaces & hsync pol & vsync pol */
+	video->interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
+	video->v_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NVSYNC);
+	video->h_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NHSYNC);
+
+	/* Input video dynamic_range & colorimetry */
+	vic = drm_match_cea_mode(mode);
+	if ((vic == 6) || (vic == 7) || (vic == 21) || (vic == 22) ||
+	    (vic == 2) || (vic == 3) || (vic == 17) || (vic == 18)) {
+		video->dynamic_range = CEA;
+		video->ycbcr_coeff = COLOR_YCBCR601;
+	} else if (vic) {
+		video->dynamic_range = CEA;
+		video->ycbcr_coeff = COLOR_YCBCR709;
+	} else {
+		video->dynamic_range = VESA;
+		video->ycbcr_coeff = COLOR_YCBCR709;
+	}
+
+	/* Input vide bpc and color_formats */
+	switch (display_info->bpc) {
+	case 12:
+		video->color_depth = COLOR_12;
+		break;
+	case 10:
+		video->color_depth = COLOR_10;
+		break;
+	case 8:
+		video->color_depth = COLOR_8;
+		break;
+	case 6:
+		video->color_depth = COLOR_6;
+		break;
+	default:
+		video->color_depth = COLOR_8;
+		break;
+	}
+	if (display_info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
+		video->color_space = COLOR_YCBCR444;
+	else if (display_info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
+		video->color_space = COLOR_YCBCR422;
+	else
+		video->color_space = COLOR_RGB;
+
+	/*
+	 * NOTE: those property parsing code is used for providing backward
+	 * compatibility for samsung platform.
+	 * Due to we used the "of_property_read_u32" interfaces, when this
+	 * property isn't present, the "video_info" can keep the original
+	 * values and wouldn't be modified.
+	 */
+	of_property_read_u32(dp_node, "samsung,color-space",
+			     &video->color_space);
+	of_property_read_u32(dp_node, "samsung,dynamic-range",
+			     &video->dynamic_range);
+	of_property_read_u32(dp_node, "samsung,ycbcr-coeff",
+			     &video->ycbcr_coeff);
+	of_property_read_u32(dp_node, "samsung,color-depth",
+			     &video->color_depth);
+	if (of_property_read_bool(dp_node, "hsync-active-high"))
+		video->h_sync_polarity = true;
+	if (of_property_read_bool(dp_node, "vsync-active-high"))
+		video->v_sync_polarity = true;
+	if (of_property_read_bool(dp_node, "interlaced"))
+		video->interlaced = true;
+}
+
 static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 					     struct drm_atomic_state *old_state)
 {
 	struct analogix_dp_device *dp = bridge->driver_private;
 	struct drm_crtc *crtc;
-	struct drm_crtc_state *old_crtc_state;
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	int timeout_loop = 0;
 	int ret;
 
@@ -1189,6 +1265,11 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	if (!crtc)
 		return;
 
+	new_crtc_state = drm_atomic_get_new_crtc_state(old_state, crtc);
+	if (!new_crtc_state)
+		return;
+	analogix_dp_bridge_mode_set(bridge, &new_crtc_state->adjusted_mode);
+
 	old_crtc_state = drm_atomic_get_old_crtc_state(old_state, crtc);
 	/* Not a full enable, just disable PSR and continue */
 	if (old_crtc_state && old_crtc_state->self_refresh_active) {
@@ -1295,83 +1376,6 @@ static void analogix_dp_bridge_atomic_post_disable(struct drm_bridge *bridge,
 		DRM_ERROR("Failed to enable psr (%d)\n", ret);
 }
 
-static void analogix_dp_bridge_mode_set(struct drm_bridge *bridge,
-				const struct drm_display_mode *orig_mode,
-				const struct drm_display_mode *mode)
-{
-	struct analogix_dp_device *dp = bridge->driver_private;
-	struct drm_display_info *display_info = &dp->connector.display_info;
-	struct video_info *video = &dp->video_info;
-	struct device_node *dp_node = dp->dev->of_node;
-	int vic;
-
-	/* Input video interlaces & hsync pol & vsync pol */
-	video->interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
-	video->v_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NVSYNC);
-	video->h_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NHSYNC);
-
-	/* Input video dynamic_range & colorimetry */
-	vic = drm_match_cea_mode(mode);
-	if ((vic == 6) || (vic == 7) || (vic == 21) || (vic == 22) ||
-	    (vic == 2) || (vic == 3) || (vic == 17) || (vic == 18)) {
-		video->dynamic_range = CEA;
-		video->ycbcr_coeff = COLOR_YCBCR601;
-	} else if (vic) {
-		video->dynamic_range = CEA;
-		video->ycbcr_coeff = COLOR_YCBCR709;
-	} else {
-		video->dynamic_range = VESA;
-		video->ycbcr_coeff = COLOR_YCBCR709;
-	}
-
-	/* Input vide bpc and color_formats */
-	switch (display_info->bpc) {
-	case 12:
-		video->color_depth = COLOR_12;
-		break;
-	case 10:
-		video->color_depth = COLOR_10;
-		break;
-	case 8:
-		video->color_depth = COLOR_8;
-		break;
-	case 6:
-		video->color_depth = COLOR_6;
-		break;
-	default:
-		video->color_depth = COLOR_8;
-		break;
-	}
-	if (display_info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
-		video->color_space = COLOR_YCBCR444;
-	else if (display_info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
-		video->color_space = COLOR_YCBCR422;
-	else
-		video->color_space = COLOR_RGB;
-
-	/*
-	 * NOTE: those property parsing code is used for providing backward
-	 * compatibility for samsung platform.
-	 * Due to we used the "of_property_read_u32" interfaces, when this
-	 * property isn't present, the "video_info" can keep the original
-	 * values and wouldn't be modified.
-	 */
-	of_property_read_u32(dp_node, "samsung,color-space",
-			     &video->color_space);
-	of_property_read_u32(dp_node, "samsung,dynamic-range",
-			     &video->dynamic_range);
-	of_property_read_u32(dp_node, "samsung,ycbcr-coeff",
-			     &video->ycbcr_coeff);
-	of_property_read_u32(dp_node, "samsung,color-depth",
-			     &video->color_depth);
-	if (of_property_read_bool(dp_node, "hsync-active-high"))
-		video->h_sync_polarity = true;
-	if (of_property_read_bool(dp_node, "vsync-active-high"))
-		video->v_sync_polarity = true;
-	if (of_property_read_bool(dp_node, "interlaced"))
-		video->interlaced = true;
-}
-
 static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -1380,7 +1384,6 @@ static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
 	.atomic_enable = analogix_dp_bridge_atomic_enable,
 	.atomic_disable = analogix_dp_bridge_atomic_disable,
 	.atomic_post_disable = analogix_dp_bridge_atomic_post_disable,
-	.mode_set = analogix_dp_bridge_mode_set,
 	.attach = analogix_dp_bridge_attach,
 };
 
-- 
2.34.1

