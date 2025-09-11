Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AD2B53333
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 15:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D883C10EB2A;
	Thu, 11 Sep 2025 13:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="NbQ4Z6Ex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F8410EB21
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757596063;
 bh=Am0wJR30bxBI9d75jNdn65laQYyDtWCKdt1bA39a02U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NbQ4Z6Exty7pB/laEhgmlyA45hXFxt1oaTX4RxoMXVa6/BRhE0JrDeQf+W87tm998
 pP+0gt77GrTSk1AkAu8VNoaFaTYYtHemf9FKTmUVXCp2HbFBdAX8AIbBL1t8Fr1L7L
 clLMpGfIfn+kfPr3kk5zBLm77CzYM9eq/i5Hao2Xi2uEIVo4lyMRUXEOLVSVmGpkyG
 zTxS+qjvHlS+M4hU1BnwOSZddPKqfmyu2bvij+Ir1Yk+k2c/xIOtXUuN9kUduCRdzM
 Lbw5LBSqmYi36JlQE6/2QHYfSQV4rNTCrIbBNxn8d0on9mLJE0eaOEyUD4N/FRktTs
 PhWbj3ljrarJw==
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f05:840b:7800:3261:5c97:2de4:16d3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id F2B8D17E127C;
 Thu, 11 Sep 2025 15:07:42 +0200 (CEST)
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: wse@tuxedocomputers.com, andri@yngvason.is, sebastian.wick@redhat.com,
 mripard@kernel.org, daniel.stone@collabora.com,
 jani.nikula@linux.intel.com, tzimmermann@suse.de, simona.vetter@ffwll.ch,
 harry.wentland@amd.com, christian.koenig@amd.com,
 derek.foreman@collabora.com
Subject: [PATCH 6/8] drm/i915: Implement the "color format" DRM property
Date: Thu, 11 Sep 2025 16:07:37 +0300
Message-ID: <20250911130739.4936-7-marius.vlad@collabora.com>
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
to keep things sane and still working.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Andri Yngvason <andri@yngvason.is>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
Co-Developed-by: Andri Yngvason <andri@yngvason.is>
Co-Developed-by: Marius Vlad <marius.vlad@collabora.com>
---
 .../gpu/drm/i915/display/intel_connector.c    | 21 +++++++
 .../gpu/drm/i915/display/intel_connector.h    |  2 +
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 60 +++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_dp.h       |  5 ++
 drivers/gpu/drm/i915/display/intel_dp_mst.c   | 58 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 58 ++++++++++++++++--
 7 files changed, 192 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
index 42c923f416b3..4f76c91ed614 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.c
+++ b/drivers/gpu/drm/i915/display/intel_connector.c
@@ -39,6 +39,13 @@
 #include "intel_hdcp.h"
 #include "intel_panel.h"
 
+static const u32 supported_colorformats =
+       DRM_COLOR_FORMAT_AUTO |
+       DRM_COLOR_FORMAT_RGB444 |
+       DRM_COLOR_FORMAT_YCBCR444 |
+       DRM_COLOR_FORMAT_YCBCR420;
+
+
 static void intel_connector_modeset_retry_work_fn(struct work_struct *work)
 {
 	struct intel_connector *connector = container_of(work, typeof(*connector),
@@ -325,6 +332,13 @@ intel_attach_hdmi_colorspace_property(struct drm_connector *connector)
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
@@ -332,6 +346,13 @@ intel_attach_dp_colorspace_property(struct drm_connector *connector)
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
index aafb25a814fa..7191df21b48b 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.h
+++ b/drivers/gpu/drm/i915/display/intel_connector.h
@@ -31,7 +31,9 @@ void intel_attach_force_audio_property(struct drm_connector *connector);
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
index ce45261c4a8f..4128547c3396 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -924,6 +924,7 @@ enum intel_output_format {
 	INTEL_OUTPUT_FORMAT_RGB,
 	INTEL_OUTPUT_FORMAT_YCBCR420,
 	INTEL_OUTPUT_FORMAT_YCBCR444,
+	INTEL_OUTPUT_FORMAT_AUTO,
 };
 
 /* Used by dp and fdi links */
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 7976fec88606..1df0ec28dde2 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1090,6 +1090,7 @@ static bool source_can_output(struct intel_dp *intel_dp,
 	struct intel_display *display = to_intel_display(intel_dp);
 
 	switch (format) {
+	case INTEL_OUTPUT_FORMAT_AUTO:
 	case INTEL_OUTPUT_FORMAT_RGB:
 		return true;
 
@@ -1159,7 +1160,7 @@ dfp_can_convert(struct intel_dp *intel_dp,
 	return false;
 }
 
-static enum intel_output_format
+enum intel_output_format
 intel_dp_output_format(struct intel_connector *connector,
 		       enum intel_output_format sink_format)
 {
@@ -1194,6 +1195,7 @@ intel_dp_output_format(struct intel_connector *connector,
 	return output_format;
 }
 
+
 int intel_dp_min_bpp(enum intel_output_format output_format)
 {
 	if (output_format == INTEL_OUTPUT_FORMAT_RGB)
@@ -3030,6 +3032,22 @@ static bool intel_dp_has_audio(struct intel_encoder *encoder,
 		return intel_conn_state->force_audio == HDMI_AUDIO_ON;
 }
 
+static u32
+intel_output_format_to_drm_color_format(enum intel_output_format input)
+{
+	switch (input) {
+	case INTEL_OUTPUT_FORMAT_AUTO:
+		return DRM_COLOR_FORMAT_AUTO;
+	case INTEL_OUTPUT_FORMAT_RGB:
+		return DRM_COLOR_FORMAT_RGB444;
+	case INTEL_OUTPUT_FORMAT_YCBCR444:
+		return DRM_COLOR_FORMAT_YCBCR444;
+	case INTEL_OUTPUT_FORMAT_YCBCR420:
+		return DRM_COLOR_FORMAT_YCBCR420;
+	}
+	return 0;
+}
+
 static int
 intel_dp_compute_output_format(struct intel_encoder *encoder,
 			       struct intel_crtc_state *crtc_state,
@@ -3041,17 +3059,32 @@ intel_dp_compute_output_format(struct intel_encoder *encoder,
 	struct intel_connector *connector = intel_dp->attached_connector;
 	const struct drm_display_info *info = &connector->base.display_info;
 	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
-	bool ycbcr_420_only;
+	bool ycbcr_420_output = false;
+	bool ycbcr_444_output = false;
 	int ret;
+	u32 intel_convert_color_fmt = 0;
+
+	if ((conn_state->color_format == DRM_COLOR_FORMAT_YCBCR420 &&
+	    drm_mode_is_420_also(&connector->base.display_info, adjusted_mode)) ||
+	    drm_mode_is_420_only(info, adjusted_mode)) {
+		ycbcr_420_output = true;
+	} else if (conn_state->color_format == DRM_COLOR_FORMAT_YCBCR444) {
+		ycbcr_444_output = true;
+	}
+
+
+	if (ycbcr_420_output)
+		crtc_state->sink_format = INTEL_OUTPUT_FORMAT_YCBCR420;
+	else if (ycbcr_444_output)
+		crtc_state->sink_format = INTEL_OUTPUT_FORMAT_YCBCR444;
+	else
+		crtc_state->sink_format = INTEL_OUTPUT_FORMAT_RGB;
 
-	ycbcr_420_only = drm_mode_is_420_only(info, adjusted_mode);
 
-	if (ycbcr_420_only && !connector->base.ycbcr_420_allowed) {
+	if (ycbcr_420_output && !connector->base.ycbcr_420_allowed) {
 		drm_dbg_kms(display->drm,
 			    "YCbCr 4:2:0 mode but YCbCr 4:2:0 output not possible. Falling back to RGB.\n");
 		crtc_state->sink_format = INTEL_OUTPUT_FORMAT_RGB;
-	} else {
-		crtc_state->sink_format = intel_dp_sink_format(connector, adjusted_mode);
 	}
 
 	crtc_state->output_format = intel_dp_output_format(connector, crtc_state->sink_format);
@@ -3071,6 +3104,18 @@ intel_dp_compute_output_format(struct intel_encoder *encoder,
 						   respect_downstream_limits);
 	}
 
+	intel_convert_color_fmt =
+		intel_output_format_to_drm_color_format(crtc_state->sink_format);
+	if (conn_state->color_format &&
+	    conn_state->color_format != intel_convert_color_fmt &&
+	    conn_state->color_format != DRM_COLOR_FORMAT_AUTO) {
+		drm_dbg_kms(display->drm,
+			    "Unsupported color format %s (0x%x), sink has 0x%x\n",
+			    drm_get_color_format_name(conn_state->color_format),\
+			    conn_state->color_format, intel_convert_color_fmt);
+		ret = -EINVAL;
+	}
+
 	return ret;
 }
 
@@ -6442,12 +6487,15 @@ intel_dp_add_properties(struct intel_dp *intel_dp, struct drm_connector *_connec
 	else if (DISPLAY_VER(display) >= 5)
 		drm_connector_attach_max_bpc_property(&connector->base, 6, 12);
 
+
 	/* Register HDMI colorspace for case of lspcon */
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
index 0657f5681196..0d6bdcc70b41 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -199,6 +199,11 @@ bool intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 				    bool dsc,
 				    struct link_config_limits *limits);
 
+enum intel_output_format
+intel_dp_output_format(struct intel_connector *connector,
+		enum intel_output_format sink_format);
+
+
 void intel_dp_get_dsc_sink_cap(u8 dpcd_rev, struct intel_connector *connector);
 bool intel_dp_has_gamut_metadata_dip(struct intel_encoder *encoder);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 74497c9a0554..34db7ee00d63 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -92,6 +92,23 @@
  * registers.
  */
 
+static u32
+intel_output_format_to_drm_color_format(enum intel_output_format input)
+{
+	switch (input) {
+	case INTEL_OUTPUT_FORMAT_AUTO:
+		return DRM_COLOR_FORMAT_AUTO;
+	case INTEL_OUTPUT_FORMAT_RGB:
+		return DRM_COLOR_FORMAT_RGB444;
+	case INTEL_OUTPUT_FORMAT_YCBCR444:
+		return DRM_COLOR_FORMAT_YCBCR444;
+	case INTEL_OUTPUT_FORMAT_YCBCR420:
+		return DRM_COLOR_FORMAT_YCBCR420;
+	}
+
+	return 0;
+}
+
 /* From fake MST stream encoder to primary encoder */
 static struct intel_encoder *to_primary_encoder(struct intel_encoder *encoder)
 {
@@ -640,10 +657,14 @@ static int mst_stream_compute_config(struct intel_encoder *encoder,
 		to_intel_connector(conn_state->connector);
 	const struct drm_display_mode *adjusted_mode =
 		&pipe_config->hw.adjusted_mode;
+	const struct drm_display_info *info =
+		&connector->base.display_info;
 	struct link_config_limits limits;
 	bool dsc_needed, joiner_needs_dsc;
 	int num_joined_pipes;
 	int ret = 0;
+	bool ycbcr_420_output = false;
+	u32 intel_convert_color_fmt = 0;
 
 	if (pipe_config->fec_enable &&
 	    !intel_dp_supports_fec(intel_dp, connector, pipe_config))
@@ -658,10 +679,38 @@ static int mst_stream_compute_config(struct intel_encoder *encoder,
 	if (num_joined_pipes > 1)
 		pipe_config->joiner_pipes = GENMASK(crtc->pipe + num_joined_pipes - 1, crtc->pipe);
 
-	pipe_config->sink_format = INTEL_OUTPUT_FORMAT_RGB;
-	pipe_config->output_format = INTEL_OUTPUT_FORMAT_RGB;
+	if ((conn_state->color_format == DRM_COLOR_FORMAT_YCBCR420 &&
+	    drm_mode_is_420_also(&connector->base.display_info, adjusted_mode)) ||
+	    drm_mode_is_420_only(info, adjusted_mode)) {
+		ycbcr_420_output = true;
+	}
+
+	if (ycbcr_420_output && !connector->base.ycbcr_420_allowed) {
+		drm_dbg_kms(display->drm,
+			    "YCbCr 4:2:0 mode but YCbCr 4:2:0 output not possible. Falling back to RGB.\n");
+		pipe_config->sink_format = INTEL_OUTPUT_FORMAT_RGB;
+	}
+
+	if (ycbcr_420_output)
+		pipe_config->sink_format = INTEL_OUTPUT_FORMAT_YCBCR420;
+	else
+		pipe_config->sink_format = INTEL_OUTPUT_FORMAT_RGB;
+
+	pipe_config->output_format = intel_dp_output_format(connector, pipe_config->sink_format);
 	pipe_config->has_pch_encoder = false;
 
+	intel_convert_color_fmt =
+		intel_output_format_to_drm_color_format(pipe_config->sink_format);
+	if (conn_state->color_format &&
+	    conn_state->color_format != intel_convert_color_fmt &&
+	    conn_state->color_format != DRM_COLOR_FORMAT_AUTO) {
+		drm_dbg_kms(display->drm,
+			    "Unsupported color format %s (0x%x), sink has 0x%x\n",
+			    drm_get_color_format_name(conn_state->color_format),\
+			    conn_state->color_format, intel_convert_color_fmt);
+		ret = -EINVAL;
+	}
+
 	joiner_needs_dsc = intel_dp_joiner_needs_dsc(display, num_joined_pipes);
 
 	dsc_needed = joiner_needs_dsc || intel_dp->force_dsc_en ||
@@ -1647,6 +1696,11 @@ static int mst_topology_add_connector_properties(struct intel_dp *intel_dp,
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
index 9961ff259298..016edb1ab248 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2243,6 +2243,23 @@ intel_hdmi_output_format(const struct intel_crtc_state *crtc_state)
 	return crtc_state->sink_format;
 }
 
+static u32
+intel_output_format_to_drm_color_format(enum intel_output_format input)
+{
+	switch (input) {
+	case INTEL_OUTPUT_FORMAT_AUTO:
+		return DRM_COLOR_FORMAT_AUTO;
+	case INTEL_OUTPUT_FORMAT_RGB:
+		return DRM_COLOR_FORMAT_RGB444;
+	case INTEL_OUTPUT_FORMAT_YCBCR444:
+		return DRM_COLOR_FORMAT_YCBCR444;
+	case INTEL_OUTPUT_FORMAT_YCBCR420:
+		return DRM_COLOR_FORMAT_YCBCR420;
+	}
+
+	return 0;
+}
+
 static int intel_hdmi_compute_output_format(struct intel_encoder *encoder,
 					    struct intel_crtc_state *crtc_state,
 					    const struct drm_connector_state *conn_state,
@@ -2252,13 +2269,29 @@ static int intel_hdmi_compute_output_format(struct intel_encoder *encoder,
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 	const struct drm_display_info *info = &connector->base.display_info;
-	bool ycbcr_420_only = drm_mode_is_420_only(info, adjusted_mode);
+	bool ycbcr_420_output = false;
+	bool ycbcr_444_output = false;
+	u32 intel_convert_color_fmt = 0;
 	int ret;
 
-	crtc_state->sink_format =
-		intel_hdmi_sink_format(crtc_state, connector, ycbcr_420_only);
+	if ((conn_state->color_format == DRM_COLOR_FORMAT_YCBCR420 &&
+	     drm_mode_is_420_also(&connector->base.display_info, adjusted_mode)) ||
+	     drm_mode_is_420_only(info, adjusted_mode)) {
+		ycbcr_420_output = true;
+	} else if (conn_state->color_format == DRM_COLOR_FORMAT_YCBCR444) {
+		ycbcr_444_output = true;
+	}
+
+	if (ycbcr_420_output)
+		crtc_state->sink_format = INTEL_OUTPUT_FORMAT_YCBCR420;
+	else if (ycbcr_444_output)
+		crtc_state->sink_format = INTEL_OUTPUT_FORMAT_YCBCR444;
+	else
+		crtc_state->sink_format = intel_hdmi_sink_format(crtc_state,
+								 connector,
+								 ycbcr_420_output);
 
-	if (ycbcr_420_only && crtc_state->sink_format != INTEL_OUTPUT_FORMAT_YCBCR420) {
+	if (ycbcr_420_output && crtc_state->sink_format != INTEL_OUTPUT_FORMAT_YCBCR420) {
 		drm_dbg_kms(display->drm,
 			    "YCbCr 4:2:0 mode but YCbCr 4:2:0 output not possible. Falling back to RGB.\n");
 		crtc_state->sink_format = INTEL_OUTPUT_FORMAT_RGB;
@@ -2278,6 +2311,19 @@ static int intel_hdmi_compute_output_format(struct intel_encoder *encoder,
 		ret = intel_hdmi_compute_clock(encoder, crtc_state, respect_downstream_limits);
 	}
 
+	intel_convert_color_fmt =
+		intel_output_format_to_drm_color_format(crtc_state->sink_format);
+	if (conn_state->color_format &&
+	    conn_state->color_format != intel_convert_color_fmt &&
+	    conn_state->color_format != DRM_COLOR_FORMAT_AUTO) {
+		drm_dbg_kms(display->drm,
+			    "Unsupported color format %s (0x%x), current sink color format 0x%x\n",
+			    drm_get_color_format_name(conn_state->color_format),
+			    conn_state->color_format,
+			    intel_convert_color_fmt);
+		ret = -EINVAL;
+	}
+
 	return ret;
 }
 
@@ -2668,8 +2714,10 @@ intel_hdmi_add_properties(struct intel_hdmi *intel_hdmi, struct drm_connector *_
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
2.47.2

