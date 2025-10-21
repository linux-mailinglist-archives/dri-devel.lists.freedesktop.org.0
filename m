Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 475CCBF466C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 04:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE9D10E557;
	Tue, 21 Oct 2025 02:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="eCtvNgbA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973179.qiye.163.com (mail-m1973179.qiye.163.com
 [220.197.31.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B2510E557
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 02:53:18 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 26977b973;
 Tue, 21 Oct 2025 10:53:12 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 m.szyprowski@samsung.com, luca.ceresoli@bootlin.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7 03/18] drm/bridge: analogix_dp: Move
 &drm_bridge_funcs.mode_set to &drm_bridge_funcs.atomic_enable
Date: Tue, 21 Oct 2025 10:52:36 +0800
Message-Id: <20251021025240.1524169-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251021023130.1523707-1-damon.ding@rock-chips.com>
References: <20251021023130.1523707-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a04af5cd803a3kunmb53d69df5a2760
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0MeSlZKTElJQhhDGk4YTE1WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=eCtvNgbAMDXDHUxTnHkDJs+hTIX+j066DiIFIkmq+ZxoO6Y3PQo5Oad627VEUaOnNLW/iPh/+9PlT0ggxmBntrRprphSEnL2BrlsC+fP7Ul9J6ZOBbE+AuyJ2FFvR37IJ3mfIv9cCxAefLSsRHBdpZPcjgISRGyaG7bTX/nEsAM=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=LlUShgn0mdqY8jITI4+MoPclw1sVWOT2oJyVPP3wd5g=;
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
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 161 +++++++++---------
 1 file changed, 82 insertions(+), 79 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 1e834d3656c1..3caa47d31649 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1086,12 +1086,88 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 	return ret;
 }
 
+static void analogix_dp_bridge_mode_set(struct drm_bridge *bridge,
+					const struct drm_display_mode *mode)
+{
+	struct analogix_dp_device *dp = to_dp(bridge);
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
 	struct analogix_dp_device *dp = to_dp(bridge);
 	struct drm_crtc *crtc;
-	struct drm_crtc_state *old_crtc_state;
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	int timeout_loop = 0;
 	int ret;
 
@@ -1099,6 +1175,11 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
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
@@ -1205,83 +1286,6 @@ static void analogix_dp_bridge_atomic_post_disable(struct drm_bridge *bridge,
 		DRM_ERROR("Failed to enable psr (%d)\n", ret);
 }
 
-static void analogix_dp_bridge_mode_set(struct drm_bridge *bridge,
-				const struct drm_display_mode *orig_mode,
-				const struct drm_display_mode *mode)
-{
-	struct analogix_dp_device *dp = to_dp(bridge);
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
@@ -1290,7 +1294,6 @@ static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
 	.atomic_enable = analogix_dp_bridge_atomic_enable,
 	.atomic_disable = analogix_dp_bridge_atomic_disable,
 	.atomic_post_disable = analogix_dp_bridge_atomic_post_disable,
-	.mode_set = analogix_dp_bridge_mode_set,
 	.attach = analogix_dp_bridge_attach,
 };
 
-- 
2.34.1

