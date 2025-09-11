Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 031E1B5332D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 15:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76A210EB25;
	Thu, 11 Sep 2025 13:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PjIoxg6L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2320410EB21
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757596063;
 bh=hcfVaLlgdcuMpWG5FA59121pYcvGfCixFO3k29v18Gc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PjIoxg6L4yfbDGFoVSzi1jpLRk8BZbTtRELP98qKl/B10TQmUm3HlJBJdZqGuS6Iv
 8A+c84Sfr0ImqmVh+rBlXChnDqzFjDojKKAO7R0hecDwwNL/OY+9PiXMYcEUqXYZFK
 WjRie4P3xYBWnbTSZ0IkW9QigUbYv2u3hk9XPuDzS0IExJCUGHOIavEzAv/QSoS+U7
 KCbJDZhgNQs17gf/6anSlbGOrW7pFZx2jIZ4qGbtegFbBxa7ySFpV4ads0vZfmTtS3
 dxF2WQ/kd0N/PYzJcRRdW6S9Fd5hHqAe6sJdxVOs4oR3RShuXzi2vL2ABG0EGUfR04
 8hxDt9SeMuPEA==
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f05:840b:7800:3261:5c97:2de4:16d3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 79A3317E1287;
 Thu, 11 Sep 2025 15:07:43 +0200 (CEST)
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: wse@tuxedocomputers.com, andri@yngvason.is, sebastian.wick@redhat.com,
 mripard@kernel.org, daniel.stone@collabora.com,
 jani.nikula@linux.intel.com, tzimmermann@suse.de, simona.vetter@ffwll.ch,
 harry.wentland@amd.com, christian.koenig@amd.com,
 derek.foreman@collabora.com
Subject: [PATCH 7/8] drm/amdgpu: Implement "color format" DRM property
Date: Thu, 11 Sep 2025 16:07:38 +0300
Message-ID: <20250911130739.4936-8-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250911130739.4936-1-marius.vlad@collabora.com>
References: <20250911130739.4936-1-marius.vlad@collabora.com>
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

From: Andri Yngvason <andri@yngvason.is>

This includes YUV420 as well YUV444 and Auto. Auto will fallback to RGB
to keep things sane and still working, similar to i915.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Andri Yngvason <andri@yngvason.is>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
Co-Developed-by: Andri Yngvason <andri@yngvason.is>
Co-Developed-by: Marius Vlad <marius.vlad@collabora.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 74 +++++++++++++++++--
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 13 ++++
 2 files changed, 81 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index cc19c4bfd623..beb127471a61 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6426,15 +6426,32 @@ static void fill_stream_properties_from_drm_display_mode(
 	timing_out->h_border_right = 0;
 	timing_out->v_border_top = 0;
 	timing_out->v_border_bottom = 0;
-	/* TODO: un-hardcode */
-	if (drm_mode_is_420_only(info, mode_in) || (drm_mode_is_420_also(info, mode_in) &&
-	    aconnector && aconnector->force_yuv420_output))
+
+	if (drm_mode_is_420_also(info, mode_in) && aconnector &&
+	    (connector_state->color_format == DRM_COLOR_FORMAT_YCBCR420 &&
+	     aconnector->force_yuv420_output)) {
 		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
-	else if ((connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR444)
-			&& stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
+	} else if ((connector_state && connector_state->color_format == DRM_COLOR_FORMAT_YCBCR444 &&
+		  connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR444)
+			&& stream->signal == SIGNAL_TYPE_HDMI_TYPE_A) {
 		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR444;
-	else
+	} else if (connector_state && connector_state->color_format == DRM_COLOR_FORMAT_RGB444 &&
+		 !drm_mode_is_420_only(info, mode_in)) {
 		timing_out->pixel_encoding = PIXEL_ENCODING_RGB;
+	} else {
+		/*
+		 * connector_state->force_color_format not possible
+		 * || connector_state->force_color_format == 0 (auto)
+		 * || connector_state->force_color_format == DRM_COLOR_FORMAT_YCBCR422
+		 */
+		if (drm_mode_is_420_only(info, mode_in))
+			timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
+		else if ((connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR444)
+			 && stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
+			timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR444;
+		else
+			timing_out->pixel_encoding = PIXEL_ENCODING_RGB;
+	}
 
 	timing_out->timing_3d_format = TIMING_3D_FORMAT_NONE;
 	timing_out->display_color_depth = convert_color_depth_from_display_info(
@@ -7664,6 +7681,37 @@ static enum dc_status dm_validate_stream_and_context(struct dc *dc,
 	return dc_result;
 }
 
+static enum dc_status
+dm_validate_stream_color_format(const struct drm_connector_state *drm_state,
+				const struct dc_stream_state *stream)
+{
+	if (!drm_state->color_format ||
+	    drm_state->color_format == DRM_COLOR_FORMAT_NONE)
+		return DC_OK;
+
+	enum dc_pixel_encoding encoding = PIXEL_ENCODING_UNDEFINED;
+	switch (drm_state->color_format) {
+	case DRM_COLOR_FORMAT_AUTO:
+	case DRM_COLOR_FORMAT_RGB444:
+		encoding = PIXEL_ENCODING_RGB;
+		break;
+	case DRM_COLOR_FORMAT_YCBCR444:
+		encoding = PIXEL_ENCODING_YCBCR444;
+		break;
+	case DRM_COLOR_FORMAT_YCBCR422:
+		encoding = PIXEL_ENCODING_YCBCR422;
+		break;
+	case DRM_COLOR_FORMAT_YCBCR420:
+		encoding = PIXEL_ENCODING_YCBCR420;
+		break;
+	default:
+		break;
+	}
+
+	return encoding == stream->timing.pixel_encoding ?
+		DC_OK : DC_UNSUPPORTED_VALUE;
+}
+
 struct dc_stream_state *
 create_validate_stream_for_sink(struct drm_connector *connector,
 				const struct drm_display_mode *drm_mode,
@@ -7709,6 +7757,9 @@ create_validate_stream_for_sink(struct drm_connector *connector,
 		if (dc_result == DC_OK)
 			dc_result = dm_validate_stream_and_context(adev->dm.dc, stream);
 
+		if (dc_result == DC_OK)
+			dc_result = dm_validate_stream_color_format(drm_state, stream);
+
 		if (dc_result != DC_OK) {
 			DRM_DEBUG_KMS("Pruned mode %d x %d (clk %d) %s %s -- %s\n",
 				      drm_mode->hdisplay,
@@ -8477,6 +8528,13 @@ static const u32 supported_colorspaces =
 	BIT(DRM_MODE_COLORIMETRY_BT2020_RGB) |
 	BIT(DRM_MODE_COLORIMETRY_BT2020_YCC);
 
+static const u32 supported_colorformats =
+       DRM_COLOR_FORMAT_AUTO |
+       DRM_COLOR_FORMAT_RGB444 |
+       DRM_COLOR_FORMAT_YCBCR444 |
+       DRM_COLOR_FORMAT_YCBCR422 |
+       DRM_COLOR_FORMAT_YCBCR420;
+
 void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 				     struct amdgpu_dm_connector *aconnector,
 				     int connector_type,
@@ -8564,10 +8622,14 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 	if (connector_type == DRM_MODE_CONNECTOR_HDMIA) {
 		if (!drm_mode_create_hdmi_colorspace_property(&aconnector->base, supported_colorspaces))
 			drm_connector_attach_colorspace_property(&aconnector->base);
+		if (!drm_mode_create_hdmi_color_format_property(&aconnector->base, supported_colorformats))
+			drm_connector_attach_color_format_property(&aconnector->base);
 	} else if ((connector_type == DRM_MODE_CONNECTOR_DisplayPort && !aconnector->mst_root) ||
 		   connector_type == DRM_MODE_CONNECTOR_eDP) {
 		if (!drm_mode_create_dp_colorspace_property(&aconnector->base, supported_colorspaces))
 			drm_connector_attach_colorspace_property(&aconnector->base);
+		if (!drm_mode_create_dp_color_format_property(&aconnector->base, supported_colorformats))
+			drm_connector_attach_color_format_property(&aconnector->base);
 	}
 
 	if (connector_type == DRM_MODE_CONNECTOR_HDMIA ||
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 6a817508c826..01f8f26fde0a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -52,6 +52,13 @@
 
 #define PEAK_FACTOR_X1000 1006
 
+static const u32 supported_colorformats =
+       DRM_COLOR_FORMAT_AUTO |
+       DRM_COLOR_FORMAT_RGB444 |
+       DRM_COLOR_FORMAT_YCBCR444 |
+       DRM_COLOR_FORMAT_YCBCR422 |
+       DRM_COLOR_FORMAT_YCBCR420;
+
 /*
  * This function handles both native AUX and I2C-Over-AUX transactions.
  */
@@ -679,6 +686,12 @@ dm_dp_add_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
 	if (connector->max_bpc_property)
 		drm_connector_attach_max_bpc_property(connector, 8, 16);
 
+	connector->color_format_property = master->base.color_format_property;
+	if (connector->color_format_property) {
+		if (!drm_mode_create_dp_color_format_property(&aconnector->base, supported_colorformats))
+			drm_connector_attach_color_format_property(&aconnector->base);
+	}
+
 	connector->vrr_capable_property = master->base.vrr_capable_property;
 	if (connector->vrr_capable_property)
 		drm_connector_attach_vrr_capable_property(connector);
-- 
2.47.2

