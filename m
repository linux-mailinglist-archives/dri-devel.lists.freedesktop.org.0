Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 096B03B860A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 17:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFE96EA3F;
	Wed, 30 Jun 2021 15:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99AA6EA27;
 Wed, 30 Jun 2021 15:10:31 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id AC319C80068;
 Wed, 30 Jun 2021 17:10:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id vOPs3foGENBD; Wed, 30 Jun 2021 17:10:30 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (p200300e37F394900095779a208783f8e.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f39:4900:957:79a2:878:3f8e])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id 4E967C8009B;
 Wed, 30 Jun 2021 17:10:27 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, emil.l.velikov@gmail.com
Subject: [PATCH v5 16/17] drm/i915/display: Use the general "Broadcast RGB"
 implementation
Date: Wed, 30 Jun 2021 17:10:17 +0200
Message-Id: <20210630151018.330354-17-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630151018.330354-1-wse@tuxedocomputers.com>
References: <20210630151018.330354-1-wse@tuxedocomputers.com>
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
Cc: Werner Sembach <wse@tuxedocomputers.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change from the i915 specific "Broadcast RGB" drm property implementation
to the general one.

This commit delete all traces of the former "Broadcast RGB" implementation
and add a new one using the new driver agnoistic functions an variables.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/gpu/drm/i915/display/intel_atomic.c   |  8 ------
 .../gpu/drm/i915/display/intel_connector.c    | 28 -------------------
 .../gpu/drm/i915/display/intel_connector.h    |  1 -
 .../drm/i915/display/intel_display_types.h    |  8 ------
 drivers/gpu/drm/i915/display/intel_dp.c       |  9 ++----
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  6 +++-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  8 ++----
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  2 +-
 drivers/gpu/drm/i915/i915_drv.h               |  1 -
 9 files changed, 12 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index b4e7ac51aa31..f8d5a0e287b0 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -63,8 +63,6 @@ int intel_digital_connector_atomic_get_property(struct drm_connector *connector,
 
 	if (property == dev_priv->force_audio_property)
 		*val = intel_conn_state->force_audio;
-	else if (property == dev_priv->broadcast_rgb_property)
-		*val = intel_conn_state->broadcast_rgb;
 	else {
 		drm_dbg_atomic(&dev_priv->drm,
 			       "Unknown property [PROP:%d:%s]\n",
@@ -99,11 +97,6 @@ int intel_digital_connector_atomic_set_property(struct drm_connector *connector,
 		return 0;
 	}
 
-	if (property == dev_priv->broadcast_rgb_property) {
-		intel_conn_state->broadcast_rgb = val;
-		return 0;
-	}
-
 	drm_dbg_atomic(&dev_priv->drm, "Unknown property [PROP:%d:%s]\n",
 		       property->base.id, property->name);
 	return -EINVAL;
@@ -134,7 +127,6 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
 	 * up in a modeset.
 	 */
 	if (new_conn_state->force_audio != old_conn_state->force_audio ||
-	    new_conn_state->broadcast_rgb != old_conn_state->broadcast_rgb ||
 	    new_conn_state->base.colorspace != old_conn_state->base.colorspace ||
 	    new_conn_state->base.picture_aspect_ratio != old_conn_state->base.picture_aspect_ratio ||
 	    new_conn_state->base.content_type != old_conn_state->base.content_type ||
diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
index 9bed1ccecea0..89f0edf19182 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.c
+++ b/drivers/gpu/drm/i915/display/intel_connector.c
@@ -241,34 +241,6 @@ intel_attach_force_audio_property(struct drm_connector *connector)
 	drm_object_attach_property(&connector->base, prop, 0);
 }
 
-static const struct drm_prop_enum_list broadcast_rgb_names[] = {
-	{ INTEL_BROADCAST_RGB_AUTO, "Automatic" },
-	{ INTEL_BROADCAST_RGB_FULL, "Full" },
-	{ INTEL_BROADCAST_RGB_LIMITED, "Limited 16:235" },
-};
-
-void
-intel_attach_broadcast_rgb_property(struct drm_connector *connector)
-{
-	struct drm_device *dev = connector->dev;
-	struct drm_i915_private *dev_priv = to_i915(dev);
-	struct drm_property *prop;
-
-	prop = dev_priv->broadcast_rgb_property;
-	if (prop == NULL) {
-		prop = drm_property_create_enum(dev, DRM_MODE_PROP_ENUM,
-					   "Broadcast RGB",
-					   broadcast_rgb_names,
-					   ARRAY_SIZE(broadcast_rgb_names));
-		if (prop == NULL)
-			return;
-
-		dev_priv->broadcast_rgb_property = prop;
-	}
-
-	drm_object_attach_property(&connector->base, prop, 0);
-}
-
 void
 intel_attach_aspect_ratio_property(struct drm_connector *connector)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_connector.h b/drivers/gpu/drm/i915/display/intel_connector.h
index 661a37a3c6d8..f3058a035476 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.h
+++ b/drivers/gpu/drm/i915/display/intel_connector.h
@@ -28,7 +28,6 @@ int intel_connector_update_modes(struct drm_connector *connector,
 				 struct edid *edid);
 int intel_ddc_get_modes(struct drm_connector *c, struct i2c_adapter *adapter);
 void intel_attach_force_audio_property(struct drm_connector *connector);
-void intel_attach_broadcast_rgb_property(struct drm_connector *connector);
 void intel_attach_aspect_ratio_property(struct drm_connector *connector);
 void intel_attach_hdmi_colorspace_property(struct drm_connector *connector);
 void intel_attach_dp_colorspace_property(struct drm_connector *connector);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 15e91a99c8b9..fb091216df78 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -77,13 +77,6 @@ enum hdmi_force_audio {
 	HDMI_AUDIO_ON,			/* force turn on HDMI audio */
 };
 
-/* "Broadcast RGB" property */
-enum intel_broadcast_rgb {
-	INTEL_BROADCAST_RGB_AUTO,
-	INTEL_BROADCAST_RGB_FULL,
-	INTEL_BROADCAST_RGB_LIMITED,
-};
-
 struct intel_fb_view {
 	/*
 	 * The remap information used in the remapped and rotated views to
@@ -552,7 +545,6 @@ struct intel_digital_connector_state {
 	struct drm_connector_state base;
 
 	enum hdmi_force_audio force_audio;
-	int broadcast_rgb;
 };
 
 #define to_intel_digital_connector_state(x) container_of(x, struct intel_digital_connector_state, base)
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 29bb181ec4be..e007f9ac0f40 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1417,8 +1417,6 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 bool intel_dp_limited_color_range(const struct intel_crtc_state *crtc_state,
 				  const struct drm_connector_state *conn_state)
 {
-	const struct intel_digital_connector_state *intel_conn_state =
-		to_intel_digital_connector_state(conn_state);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 
@@ -1432,7 +1430,7 @@ bool intel_dp_limited_color_range(const struct intel_crtc_state *crtc_state,
 	if (crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB)
 		return false;
 
-	if (intel_conn_state->broadcast_rgb == INTEL_BROADCAST_RGB_AUTO) {
+	if (conn_state->preferred_color_range == DRM_MODE_COLOR_RANGE_UNSET) {
 		/*
 		 * See:
 		 * CEA-861-E - 5.1 Default Encoding Parameters
@@ -1442,8 +1440,7 @@ bool intel_dp_limited_color_range(const struct intel_crtc_state *crtc_state,
 			drm_default_rgb_quant_range(adjusted_mode) ==
 			HDMI_QUANTIZATION_RANGE_LIMITED;
 	} else {
-		return intel_conn_state->broadcast_rgb ==
-			INTEL_BROADCAST_RGB_LIMITED;
+		return conn_state->preferred_color_range == DRM_MODE_COLOR_RANGE_LIMITED_16_235;
 	}
 }
 
@@ -4690,7 +4687,7 @@ intel_dp_add_properties(struct intel_dp *intel_dp, struct drm_connector *connect
 	if (!IS_G4X(dev_priv) && port != PORT_A)
 		intel_attach_force_audio_property(connector);
 
-	intel_attach_broadcast_rgb_property(connector);
+	drm_connector_attach_preferred_color_range_property(connector);
 	drm_connector_attach_active_color_range_property(connector);
 	if (HAS_GMCH(dev_priv)) {
 		drm_connector_attach_max_bpc_property(connector, 6, 10);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 67f0fb649876..1a0684c0cb5d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -833,7 +833,6 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 		goto err;
 
 	intel_attach_force_audio_property(connector);
-	intel_attach_broadcast_rgb_property(connector);
 
 	if (DISPLAY_VER(dev_priv) <= 12) {
 		ret = intel_dp_hdcp_init(dig_port, intel_connector);
@@ -866,6 +865,11 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 	if (connector->active_color_format_property)
 		drm_connector_attach_active_color_format_property(connector);
 
+	connector->preferred_color_range_property =
+		intel_dp->attached_connector->base.preferred_color_range_property;
+	if (connector->preferred_color_range_property)
+		drm_connector_attach_preferred_color_range_property(connector);
+
 	connector->active_color_range_property =
 		intel_dp->attached_connector->base.active_color_range_property;
 	if (connector->active_color_range_property)
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index a7b85cd13227..c05d164b9ca0 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2091,8 +2091,6 @@ static int intel_hdmi_compute_clock(struct intel_encoder *encoder,
 bool intel_hdmi_limited_color_range(const struct intel_crtc_state *crtc_state,
 				    const struct drm_connector_state *conn_state)
 {
-	const struct intel_digital_connector_state *intel_conn_state =
-		to_intel_digital_connector_state(conn_state);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 
@@ -2106,13 +2104,13 @@ bool intel_hdmi_limited_color_range(const struct intel_crtc_state *crtc_state,
 	if (crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB)
 		return false;
 
-	if (intel_conn_state->broadcast_rgb == INTEL_BROADCAST_RGB_AUTO) {
+	if (conn_state->preferred_color_range == DRM_MODE_COLOR_RANGE_UNSET) {
 		/* See CEA-861-E - 5.1 Default Encoding Parameters */
 		return crtc_state->has_hdmi_sink &&
 			drm_default_rgb_quant_range(adjusted_mode) ==
 			HDMI_QUANTIZATION_RANGE_LIMITED;
 	} else {
-		return intel_conn_state->broadcast_rgb == INTEL_BROADCAST_RGB_LIMITED;
+		return conn_state->preferred_color_range == DRM_MODE_COLOR_RANGE_LIMITED_16_235;
 	}
 }
 
@@ -2509,7 +2507,7 @@ intel_hdmi_add_properties(struct intel_hdmi *intel_hdmi, struct drm_connector *c
 	struct drm_i915_private *dev_priv = to_i915(connector->dev);
 
 	intel_attach_force_audio_property(connector);
-	intel_attach_broadcast_rgb_property(connector);
+	drm_connector_attach_preferred_color_range_property(connector);
 	drm_connector_attach_active_color_range_property(connector);
 	intel_attach_aspect_ratio_property(connector);
 
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index e4f91d7a5c60..bf4ecd029533 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -2722,7 +2722,7 @@ intel_sdvo_add_hdmi_properties(struct intel_sdvo *intel_sdvo,
 {
 	intel_attach_force_audio_property(&connector->base.base);
 	if (intel_sdvo->colorimetry_cap & SDVO_COLORIMETRY_RGB220)
-		intel_attach_broadcast_rgb_property(&connector->base.base);
+		drm_connector_attach_preferred_color_range_property(&connector->base.base);
 	intel_attach_aspect_ratio_property(&connector->base.base);
 }
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 01e11fe38642..f5987e809b78 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -999,7 +999,6 @@ struct drm_i915_private {
 	struct intel_fbdev *fbdev;
 	struct work_struct fbdev_suspend_work;
 
-	struct drm_property *broadcast_rgb_property;
 	struct drm_property *force_audio_property;
 
 	/* hda/i915 audio component */
-- 
2.25.1

