Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D02C65E5C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 20:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304F810E3FC;
	Mon, 17 Nov 2025 19:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="ioq3WPZ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582FF10E400;
 Mon, 17 Nov 2025 19:13:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763406792; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=l2Z9YU2Qx4LXBcqmfXAXidYR8D8Ehz9qJ5XAC9ZtGmFYqPMOrHlb20HyLM8gJjrbjKfxILty15G+a+cd3nSUfnoprbY2T+DFfLNEj8B9B1ws1my7TT4jSLBvPx0hvRO8wcvg14eu14sEe+t+iRKSkj7gih2mLvs18pD/gKYz3ds=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763406792;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=+iE/ManLhmGTSkH12I8CLxBzRA3bTFGdYv4A4ZOK+f4=; 
 b=BShcmcWFKxABlIXW9nRviIb/jl5OjITVLb1SL8tPJ7LZIgnM3czddUa+Dyx8Pr/FJix+ijnNEFSduA1zSMAcGSdzD1fviKtPrgvWUsnLlt8TqR9A820+ncO29BDcnW1HrdI6b653yoooedyx7I8CQNVdZEZx3pQXWf5xZv/GbxE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763406792; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=+iE/ManLhmGTSkH12I8CLxBzRA3bTFGdYv4A4ZOK+f4=;
 b=ioq3WPZ3sVaRZmrxYHIBNI+KxYSbmqGopIbhkBIXK6cNeO6hziw5OQd8UDA/nVl+
 bD3wkf3reuIa6udiZGDGPetKMfssQeaZf5cUmbh8rxrJgTHNAYd6zcd3uPabnGTXNkp
 jmsBZAn/5/GvMll+bGWJzLICondLEAmxNbKViTn4=
Received: by mx.zohomail.com with SMTPS id 176340679132120.01663921488671;
 Mon, 17 Nov 2025 11:13:11 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 17 Nov 2025 20:11:52 +0100
Subject: [PATCH v4 08/10] drm/i915: Implement the "color format" DRM property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-color-format-v4-8-0ded72bd1b00@collabora.com>
References: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
In-Reply-To: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Werner Sembach <wse@tuxedocomputers.com>, 
 Andri Yngvason <andri@yngvason.is>, Marius Vlad <marius.vlad@collabora.com>
X-Mailer: b4 0.14.3
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

This includes RGB, YUV420, YUV444 and Auto. Auto will pick RGB, unless
the mode being asked for is YUV420-only, in which case it picks YUV420,
with a fallback for RGB in place just as a last-ditch attempt.

Should the explicitly requested color format not be supported by the
sink, then an error is returned to userspace, so that it can make a
better choice.

Co-developed-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Co-developed-by: Andri Yngvason <andri@yngvason.is>
Signed-off-by: Andri Yngvason <andri@yngvason.is>
Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/i915/display/intel_connector.c     | 19 ++++++++++
 drivers/gpu/drm/i915/display/intel_connector.h     |  2 ++
 drivers/gpu/drm/i915/display/intel_display_types.h | 15 ++++++++
 drivers/gpu/drm/i915/display/intel_dp.c            | 42 +++++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_dp.h            |  4 +++
 drivers/gpu/drm/i915/display/intel_dp_mst.c        | 37 +++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_hdmi.c          | 40 ++++++++++++++++-----
 7 files changed, 140 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
index 913d90a7a508..3d563e12d3aa 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.c
+++ b/drivers/gpu/drm/i915/display/intel_connector.c
@@ -40,6 +40,11 @@
 #include "intel_hdcp.h"
 #include "intel_panel.h"
 
+static const u32 supported_colorformats = DRM_COLOR_FORMAT_AUTO |
+					  DRM_COLOR_FORMAT_RGB444 |
+					  DRM_COLOR_FORMAT_YCBCR444 |
+					  DRM_COLOR_FORMAT_YCBCR420;
+
 static void intel_connector_modeset_retry_work_fn(struct work_struct *work)
 {
 	struct intel_connector *connector = container_of(work, typeof(*connector),
@@ -326,6 +331,13 @@ intel_attach_hdmi_colorspace_property(struct drm_connector *connector)
 		drm_connector_attach_colorspace_property(connector);
 }
 
+void
+intel_attach_hdmi_colorformat_property(struct drm_connector *connector)
+{
+	if (!drm_mode_create_hdmi_color_format_property(connector, supported_colorformats))
+		drm_connector_attach_color_format_property(connector);
+}
+
 void
 intel_attach_dp_colorspace_property(struct drm_connector *connector)
 {
@@ -333,6 +345,13 @@ intel_attach_dp_colorspace_property(struct drm_connector *connector)
 		drm_connector_attach_colorspace_property(connector);
 }
 
+void
+intel_attach_dp_colorformat_property(struct drm_connector *connector)
+{
+	if (!drm_mode_create_dp_color_format_property(connector, supported_colorformats))
+		drm_connector_attach_color_format_property(connector);
+}
+
 void
 intel_attach_scaling_mode_property(struct drm_connector *connector)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_connector.h b/drivers/gpu/drm/i915/display/intel_connector.h
index 0aa86626e646..38401bc705e3 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.h
+++ b/drivers/gpu/drm/i915/display/intel_connector.h
@@ -30,7 +30,9 @@ void intel_attach_force_audio_property(struct drm_connector *connector);
 void intel_attach_broadcast_rgb_property(struct drm_connector *connector);
 void intel_attach_aspect_ratio_property(struct drm_connector *connector);
 void intel_attach_hdmi_colorspace_property(struct drm_connector *connector);
+void intel_attach_hdmi_colorformat_property(struct drm_connector *connector);
 void intel_attach_dp_colorspace_property(struct drm_connector *connector);
+void intel_attach_dp_colorformat_property(struct drm_connector *connector);
 void intel_attach_scaling_mode_property(struct drm_connector *connector);
 void intel_connector_queue_modeset_retry_work(struct intel_connector *connector);
 void intel_connector_cancel_modeset_retry_work(struct intel_connector *connector);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 38702a9e0f50..b06fbe56cbbe 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -2206,6 +2206,21 @@ to_intel_frontbuffer(struct drm_framebuffer *fb)
 	return fb ? to_intel_framebuffer(fb)->frontbuffer : NULL;
 }
 
+static inline __pure u32
+intel_output_format_to_drm_color_format(enum intel_output_format input)
+{
+	switch (input) {
+	case INTEL_OUTPUT_FORMAT_RGB:
+		return DRM_COLOR_FORMAT_RGB444;
+	case INTEL_OUTPUT_FORMAT_YCBCR444:
+		return DRM_COLOR_FORMAT_YCBCR444;
+	case INTEL_OUTPUT_FORMAT_YCBCR420:
+		return DRM_COLOR_FORMAT_YCBCR420;
+	}
+
+	return DRM_COLOR_FORMAT_NONE;
+}
+
 /*
  * Conversion functions/macros from various pointer types to struct
  * intel_display pointer.
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0ec82fcbcf48..6fcd1f2dbefd 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1183,7 +1183,7 @@ dfp_can_convert(struct intel_dp *intel_dp,
 	return false;
 }
 
-static enum intel_output_format
+enum intel_output_format
 intel_dp_output_format(struct intel_connector *connector,
 		       enum intel_output_format sink_format)
 {
@@ -3141,17 +3141,23 @@ intel_dp_compute_output_format(struct intel_encoder *encoder,
 	struct intel_connector *connector = intel_dp->attached_connector;
 	const struct drm_display_info *info = &connector->base.display_info;
 	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
-	bool ycbcr_420_only;
+	u32 sink_format_drm;
 	int ret;
 
-	ycbcr_420_only = drm_mode_is_420_only(info, adjusted_mode);
+	if ((conn_state->color_format == DRM_COLOR_FORMAT_YCBCR420 &&
+	     drm_mode_is_420_also(info, adjusted_mode)) ||
+	    drm_mode_is_420_only(info, adjusted_mode))
+		crtc_state->sink_format = INTEL_OUTPUT_FORMAT_YCBCR420;
+	else if (conn_state->color_format == DRM_COLOR_FORMAT_YCBCR444)
+		crtc_state->sink_format = INTEL_OUTPUT_FORMAT_YCBCR444;
+	else
+		crtc_state->sink_format = INTEL_OUTPUT_FORMAT_RGB;
 
-	if (ycbcr_420_only && !connector->base.ycbcr_420_allowed) {
+	if (crtc_state->sink_format == INTEL_OUTPUT_FORMAT_YCBCR420 &&
+	    !connector->base.ycbcr_420_allowed) {
 		drm_dbg_kms(display->drm,
-			    "YCbCr 4:2:0 mode but YCbCr 4:2:0 output not possible. Falling back to RGB.\n");
+			"YCbCr 4:2:0 mode requested but unsupported by connector. Trying RGB.\n");
 		crtc_state->sink_format = INTEL_OUTPUT_FORMAT_RGB;
-	} else {
-		crtc_state->sink_format = intel_dp_sink_format(connector, adjusted_mode);
 	}
 
 	crtc_state->output_format = intel_dp_output_format(connector, crtc_state->sink_format);
@@ -3159,6 +3165,11 @@ intel_dp_compute_output_format(struct intel_encoder *encoder,
 	ret = intel_dp_compute_link_config(encoder, crtc_state, conn_state,
 					   respect_downstream_limits);
 	if (ret) {
+		/*
+		 * If no valid link config can be found due to bandwidth constraints,
+		 * degrade from RGB/YCbCr 4:4:4 to YCbCr 4:2:0 if permitted by
+		 * the source and sink.
+		 */
 		if (crtc_state->sink_format == INTEL_OUTPUT_FORMAT_YCBCR420 ||
 		    !connector->base.ycbcr_420_allowed ||
 		    !drm_mode_is_420_also(info, adjusted_mode))
@@ -3169,9 +3180,22 @@ intel_dp_compute_output_format(struct intel_encoder *encoder,
 								   crtc_state->sink_format);
 		ret = intel_dp_compute_link_config(encoder, crtc_state, conn_state,
 						   respect_downstream_limits);
+		if (ret)
+			return ret;
 	}
 
-	return ret;
+	sink_format_drm = intel_output_format_to_drm_color_format(crtc_state->sink_format);
+	if (conn_state->color_format &&
+	    conn_state->color_format != sink_format_drm &&
+	    conn_state->color_format != DRM_COLOR_FORMAT_AUTO) {
+		drm_dbg_kms(display->drm,
+			    "Unsupported color format %s (0x%x), sink has 0x%x\n",
+			    drm_get_color_format_name(conn_state->color_format),
+			    conn_state->color_format, sink_format_drm);
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 void
@@ -6626,8 +6650,10 @@ intel_dp_add_properties(struct intel_dp *intel_dp, struct drm_connector *_connec
 	if (intel_bios_encoder_is_lspcon(dp_to_dig_port(intel_dp)->base.devdata)) {
 		drm_connector_attach_content_type_property(&connector->base);
 		intel_attach_hdmi_colorspace_property(&connector->base);
+		intel_attach_hdmi_colorformat_property(&connector->base);
 	} else {
 		intel_attach_dp_colorspace_property(&connector->base);
+		intel_attach_dp_colorformat_property(&connector->base);
 	}
 
 	if (intel_dp_has_gamut_metadata_dip(&dp_to_dig_port(intel_dp)->base))
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 200a8b267f64..a7492c97ac97 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -205,6 +205,10 @@ bool intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 void intel_dp_get_dsc_sink_cap(u8 dpcd_rev,
 			       const struct drm_dp_desc *desc, bool is_branch,
 			       struct intel_connector *connector);
+enum intel_output_format
+intel_dp_output_format(struct intel_connector *connector,
+		       enum intel_output_format sink_format);
+
 bool intel_dp_has_gamut_metadata_dip(struct intel_encoder *encoder);
 
 bool intel_dp_link_params_valid(struct intel_dp *intel_dp, int link_rate,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 4c0b943fe86f..35f8db595e22 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -653,9 +653,11 @@ static int mst_stream_compute_config(struct intel_encoder *encoder,
 		to_intel_connector(conn_state->connector);
 	const struct drm_display_mode *adjusted_mode =
 		&pipe_config->hw.adjusted_mode;
+	const struct drm_display_info *info = &connector->base.display_info;
 	struct link_config_limits limits;
 	bool dsc_needed, joiner_needs_dsc;
 	int num_joined_pipes;
+	u32 sink_format_drm;
 	int ret = 0;
 
 	if (pipe_config->fec_enable &&
@@ -671,10 +673,36 @@ static int mst_stream_compute_config(struct intel_encoder *encoder,
 	if (num_joined_pipes > 1)
 		pipe_config->joiner_pipes = GENMASK(crtc->pipe + num_joined_pipes - 1, crtc->pipe);
 
-	pipe_config->sink_format = INTEL_OUTPUT_FORMAT_RGB;
-	pipe_config->output_format = INTEL_OUTPUT_FORMAT_RGB;
+	if ((conn_state->color_format == DRM_COLOR_FORMAT_YCBCR420 &&
+	     drm_mode_is_420_also(info, adjusted_mode)) ||
+	    drm_mode_is_420_only(info, adjusted_mode))
+		pipe_config->sink_format = INTEL_OUTPUT_FORMAT_YCBCR420;
+	else if (conn_state->color_format == DRM_COLOR_FORMAT_YCBCR444)
+		pipe_config->sink_format = INTEL_OUTPUT_FORMAT_YCBCR444;
+	else
+		pipe_config->sink_format = INTEL_OUTPUT_FORMAT_RGB;
+
+	if (pipe_config->sink_format == INTEL_OUTPUT_FORMAT_YCBCR420 &&
+	    !connector->base.ycbcr_420_allowed) {
+		drm_dbg_kms(display->drm,
+			"YCbCr 4:2:0 mode requested but it's unsupported by connector. Trying RGB.\n");
+		pipe_config->sink_format = INTEL_OUTPUT_FORMAT_RGB;
+	}
+
+	pipe_config->output_format = intel_dp_output_format(connector, pipe_config->sink_format);
 	pipe_config->has_pch_encoder = false;
 
+	sink_format_drm = intel_output_format_to_drm_color_format(pipe_config->sink_format);
+	if (conn_state->color_format &&
+	    conn_state->color_format != sink_format_drm &&
+	    conn_state->color_format != DRM_COLOR_FORMAT_AUTO) {
+		drm_dbg_kms(display->drm,
+			    "Unsupported color format %s (0x%x), sink has 0x%x\n",
+			    drm_get_color_format_name(conn_state->color_format),
+			    conn_state->color_format, sink_format_drm);
+		return -EINVAL;
+	}
+
 	joiner_needs_dsc = intel_dp_joiner_needs_dsc(display, num_joined_pipes);
 
 	dsc_needed = joiner_needs_dsc || intel_dp->force_dsc_en ||
@@ -1660,6 +1688,11 @@ static int mst_topology_add_connector_properties(struct intel_dp *intel_dp,
 	if (connector->base.max_bpc_property)
 		drm_connector_attach_max_bpc_property(&connector->base, 6, 12);
 
+	connector->base.color_format_property =
+		intel_dp->attached_connector->base.color_format_property;
+	if (connector->base.color_format_property)
+		intel_attach_dp_colorformat_property(&connector->base);
+
 	return drm_connector_set_path_property(&connector->base, pathprop);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 908faf17f93d..adecee10cb4c 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2271,21 +2271,28 @@ static int intel_hdmi_compute_output_format(struct intel_encoder *encoder,
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 	const struct drm_display_info *info = &connector->base.display_info;
-	bool ycbcr_420_only = drm_mode_is_420_only(info, adjusted_mode);
+	u32 sink_format_drm;
+	bool want_420;
 	int ret;
 
-	crtc_state->sink_format =
-		intel_hdmi_sink_format(crtc_state, connector, ycbcr_420_only);
-
-	if (ycbcr_420_only && crtc_state->sink_format != INTEL_OUTPUT_FORMAT_YCBCR420) {
-		drm_dbg_kms(display->drm,
-			    "YCbCr 4:2:0 mode but YCbCr 4:2:0 output not possible. Falling back to RGB.\n");
-		crtc_state->sink_format = INTEL_OUTPUT_FORMAT_RGB;
+	if (conn_state->color_format == DRM_COLOR_FORMAT_YCBCR444)
+		crtc_state->sink_format = INTEL_OUTPUT_FORMAT_YCBCR444;
+	else {
+		want_420 = ((conn_state->color_format == DRM_COLOR_FORMAT_YCBCR420 &&
+			     drm_mode_is_420(info, adjusted_mode)) ||
+			     drm_mode_is_420_only(info, adjusted_mode));
+		crtc_state->sink_format = intel_hdmi_sink_format(crtc_state, connector,
+								 want_420);
 	}
 
 	crtc_state->output_format = intel_hdmi_output_format(crtc_state);
 	ret = intel_hdmi_compute_clock(encoder, crtc_state, respect_downstream_limits);
 	if (ret) {
+		/*
+		 * If no valid link config can be found due to bandwidth constraints,
+		 * degrade from RGB/YCbCr 4:4:4 to YCbCr 4:2:0 if permitted by
+		 * the source and sink.
+		 */
 		if (crtc_state->sink_format == INTEL_OUTPUT_FORMAT_YCBCR420 ||
 		    !crtc_state->has_hdmi_sink ||
 		    !connector->base.ycbcr_420_allowed ||
@@ -2295,6 +2302,19 @@ static int intel_hdmi_compute_output_format(struct intel_encoder *encoder,
 		crtc_state->sink_format = INTEL_OUTPUT_FORMAT_YCBCR420;
 		crtc_state->output_format = intel_hdmi_output_format(crtc_state);
 		ret = intel_hdmi_compute_clock(encoder, crtc_state, respect_downstream_limits);
+		if (ret)
+			return ret;
+	}
+
+	sink_format_drm = intel_output_format_to_drm_color_format(crtc_state->sink_format);
+	if (conn_state->color_format &&
+	    conn_state->color_format != sink_format_drm &&
+	    conn_state->color_format != DRM_COLOR_FORMAT_AUTO) {
+		drm_dbg_kms(display->drm,
+			    "Unsupported color format %s (0x%x), current sink color format 0x%x\n",
+			    drm_get_color_format_name(conn_state->color_format),
+			    conn_state->color_format, sink_format_drm);
+		ret = -EINVAL;
 	}
 
 	return ret;
@@ -2690,8 +2710,10 @@ intel_hdmi_add_properties(struct intel_hdmi *intel_hdmi, struct drm_connector *_
 	if (DISPLAY_VER(display) >= 10)
 		drm_connector_attach_hdr_output_metadata_property(&connector->base);
 
-	if (!HAS_GMCH(display))
+	if (!HAS_GMCH(display)) {
 		drm_connector_attach_max_bpc_property(&connector->base, 8, 12);
+		intel_attach_hdmi_colorformat_property(&connector->base);
+	}
 }
 
 /*

-- 
2.51.2

