Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 664711A6E94
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 23:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D589B89AE6;
	Mon, 13 Apr 2020 21:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 551 seconds by postgrey-1.36 at gabe;
 Mon, 13 Apr 2020 21:51:42 UTC
Received: from saul.pp3345.net (saul.pp3345.net [163.172.111.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8B889AC9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 21:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 dev@pp3345.net)
 by saul.pp3345.net (Postcow) with ESMTPSA id ECF899A45EF;
 Mon, 13 Apr 2020 23:43:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pp3345.net; s=saul;
 t=1586814219; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:autocrypt;
 bh=vE0VGBAzmPgl0XdkueTIlCUh5JQ5Q2McLcQr7MPs7gE=;
 b=hIqDVqvw6VJhSWWvAOuLExlbp3pWpaT5JtwopdsOihbTbZIRPqCysB3jDzk7ibNr3KHDBV
 q5nmQUow3iDdAlHpc55QnOsY+ys91IzkXO7UOK6K7WsqXWpoT+HSAqMIAUuBGT8ih3qXmD
 SMHhzzPzzvmy/uM+kfcVeuw+YNXA5nRF7aNZb6x2OECts9ZkTY9qrAA1HDFZcofBDmhjxf
 7CbAGI5k+tsbaySoi4nvsoH8VMvYoKjSr98YNHtUGIAe2WvkzlX7l8M1+8UzmlqDMdFRqG
 blu+evgvYlnoB+9WEF9M9KhYXUbFrl1Rk7TmCC7c/S6U7dukUvY5PqZfjAvKoA==
From: Yussuf Khalil <dev@pp3345.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] drm/i915: Replace "Broadcast RGB" with "RGB quantization
 range" property
Date: Mon, 13 Apr 2020 23:40:26 +0200
Message-Id: <20200413214024.46500-6-dev@pp3345.net>
In-Reply-To: <20200413214024.46500-1-dev@pp3345.net>
References: <20200413214024.46500-1-dev@pp3345.net>
MIME-Version: 1.0
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
Cc: Yussuf Khalil <dev@pp3345.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM now has a globally available "RGB quantization range" connector
property. i915's "Broadcast RGB" that fulfils the same purpose is now
considered deprecated, so drop it in favor of the DRM property.

Signed-off-by: Yussuf Khalil <dev@pp3345.net>
---
 drivers/gpu/drm/i915/display/intel_atomic.c   |  8 ----
 .../gpu/drm/i915/display/intel_connector.c    | 39 ++++++-------------
 .../gpu/drm/i915/display/intel_connector.h    |  2 +-
 .../drm/i915/display/intel_display_types.h    |  8 ----
 drivers/gpu/drm/i915/display/intel_dp.c       | 24 ++++--------
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 19 ++++-----
 drivers/gpu/drm/i915/display/intel_sdvo.c     | 18 ++++-----
 drivers/gpu/drm/i915/i915_drv.h               |  1 -
 9 files changed, 34 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index d043057d2fa0..5dbbd8e8aa5d 100644
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
@@ -145,7 +138,6 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
 	 * up in a modeset.
 	 */
 	if (new_conn_state->force_audio != old_conn_state->force_audio ||
-	    new_conn_state->broadcast_rgb != old_conn_state->broadcast_rgb ||
 	    new_conn_state->base.colorspace != old_conn_state->base.colorspace ||
 	    new_conn_state->base.picture_aspect_ratio != old_conn_state->base.picture_aspect_ratio ||
 	    new_conn_state->base.content_type != old_conn_state->base.content_type ||
diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
index 903e49659f56..1b6439e3ccaf 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.c
+++ b/drivers/gpu/drm/i915/display/intel_connector.c
@@ -238,34 +238,6 @@ intel_attach_force_audio_property(struct drm_connector *connector)
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
@@ -297,3 +269,14 @@ intel_attach_colorspace_property(struct drm_connector *connector)
 	drm_object_attach_property(&connector->base,
 				   connector->colorspace_property, 0);
 }
+
+void
+intel_attach_rgb_quantization_range_property(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+
+	if (!drm_mode_create_rgb_quantization_range_property(dev))
+		drm_object_attach_property(&connector->base,
+			dev->mode_config.rgb_quantization_range_property,
+			DRM_MODE_RGB_QUANTIZATION_RANGE_AUTOMATIC);
+}
\ No newline at end of file
diff --git a/drivers/gpu/drm/i915/display/intel_connector.h b/drivers/gpu/drm/i915/display/intel_connector.h
index 93a7375c8196..ece946915407 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.h
+++ b/drivers/gpu/drm/i915/display/intel_connector.h
@@ -28,8 +28,8 @@ int intel_connector_update_modes(struct drm_connector *connector,
 				 struct edid *edid);
 int intel_ddc_get_modes(struct drm_connector *c, struct i2c_adapter *adapter);
 void intel_attach_force_audio_property(struct drm_connector *connector);
-void intel_attach_broadcast_rgb_property(struct drm_connector *connector);
 void intel_attach_aspect_ratio_property(struct drm_connector *connector);
 void intel_attach_colorspace_property(struct drm_connector *connector);
+void intel_attach_rgb_quantization_range_property(struct drm_connector *connector);
 
 #endif /* __INTEL_CONNECTOR_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 5e00e611f077..acd547ee292f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -76,13 +76,6 @@ enum hdmi_force_audio {
 	HDMI_AUDIO_ON,			/* force turn on HDMI audio */
 };
 
-/* "Broadcast RGB" property */
-enum intel_broadcast_rgb {
-	INTEL_BROADCAST_RGB_AUTO,
-	INTEL_BROADCAST_RGB_FULL,
-	INTEL_BROADCAST_RGB_LIMITED,
-};
-
 struct intel_framebuffer {
 	struct drm_framebuffer base;
 	struct intel_frontbuffer *frontbuffer;
@@ -443,7 +436,6 @@ struct intel_digital_connector_state {
 	struct drm_connector_state base;
 
 	enum hdmi_force_audio force_audio;
-	int broadcast_rgb;
 };
 
 #define to_intel_digital_connector_state(x) container_of(x, struct intel_digital_connector_state, base)
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 804b1d966f66..eb975eed6c72 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2343,10 +2343,9 @@ intel_dp_ycbcr420_config(struct intel_dp *intel_dp,
 bool intel_dp_limited_color_range(const struct intel_crtc_state *crtc_state,
 				  const struct drm_connector_state *conn_state)
 {
-	const struct intel_digital_connector_state *intel_conn_state =
-		to_intel_digital_connector_state(conn_state);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
+	enum hdmi_quantization_range range;
 
 	/*
 	 * Our YCbCr output is always limited range.
@@ -2355,22 +2354,13 @@ bool intel_dp_limited_color_range(const struct intel_crtc_state *crtc_state,
 	 * some conflicting bits in PIPECONF which will mess up
 	 * the colors on the monitor.
 	 */
-	if (crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB)
+	if (crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB ||
+	    crtc_state->pipe_bpp == 18)
 		return false;
 
-	if (intel_conn_state->broadcast_rgb == INTEL_BROADCAST_RGB_AUTO) {
-		/*
-		 * See:
-		 * CEA-861-E - 5.1 Default Encoding Parameters
-		 * VESA DisplayPort Ver.1.2a - 5.1.1.1 Video Colorimetry
-		 */
-		return crtc_state->pipe_bpp != 18 &&
-			drm_default_rgb_quant_range(adjusted_mode) ==
-			HDMI_QUANTIZATION_RANGE_LIMITED;
-	} else {
-		return intel_conn_state->broadcast_rgb ==
-			INTEL_BROADCAST_RGB_LIMITED;
-	}
+	range = drm_connector_state_select_rgb_quantization_range(conn_state,
+								  adjusted_mode);
+	return range == HDMI_QUANTIZATION_RANGE_LIMITED;
 }
 
 static bool intel_dp_port_has_audio(struct drm_i915_private *dev_priv,
@@ -6844,7 +6834,7 @@ intel_dp_add_properties(struct intel_dp *intel_dp, struct drm_connector *connect
 	if (!IS_G4X(dev_priv) && port != PORT_A)
 		intel_attach_force_audio_property(connector);
 
-	intel_attach_broadcast_rgb_property(connector);
+	intel_attach_rgb_quantization_range_property(connector);
 	if (HAS_GMCH(dev_priv))
 		drm_connector_attach_max_bpc_property(connector, 6, 10);
 	else if (INTEL_GEN(dev_priv) >= 5)
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 44f3fd251ca1..41f54f2bb7ec 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -730,7 +730,7 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 		goto err;
 
 	intel_attach_force_audio_property(connector);
-	intel_attach_broadcast_rgb_property(connector);
+	intel_attach_rgb_quantization_range_property(connector);
 
 	/*
 	 * Reuse the prop from the SST connector because we're
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 39930232b253..028b959a8192 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2381,10 +2381,9 @@ static int intel_hdmi_compute_clock(struct intel_encoder *encoder,
 static bool intel_hdmi_limited_color_range(const struct intel_crtc_state *crtc_state,
 					   const struct drm_connector_state *conn_state)
 {
-	const struct intel_digital_connector_state *intel_conn_state =
-		to_intel_digital_connector_state(conn_state);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
+	enum hdmi_quantization_range range;
 
 	/*
 	 * Our YCbCr output is always limited range.
@@ -2393,17 +2392,13 @@ static bool intel_hdmi_limited_color_range(const struct intel_crtc_state *crtc_s
 	 * some conflicting bits in PIPECONF which will mess up
 	 * the colors on the monitor.
 	 */
-	if (crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB)
+	if (crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB ||
+	    !crtc_state->has_hdmi_sink)
 		return false;
 
-	if (intel_conn_state->broadcast_rgb == INTEL_BROADCAST_RGB_AUTO) {
-		/* See CEA-861-E - 5.1 Default Encoding Parameters */
-		return crtc_state->has_hdmi_sink &&
-			drm_default_rgb_quant_range(adjusted_mode) ==
-			HDMI_QUANTIZATION_RANGE_LIMITED;
-	} else {
-		return intel_conn_state->broadcast_rgb == INTEL_BROADCAST_RGB_LIMITED;
-	}
+	range = drm_connector_state_select_rgb_quantization_range(conn_state,
+								  adjusted_mode);
+	return range == HDMI_QUANTIZATION_RANGE_LIMITED;
 }
 
 int intel_hdmi_compute_config(struct intel_encoder *encoder,
@@ -2867,7 +2862,7 @@ intel_hdmi_add_properties(struct intel_hdmi *intel_hdmi, struct drm_connector *c
 				hdmi_to_dig_port(intel_hdmi);
 
 	intel_attach_force_audio_property(connector);
-	intel_attach_broadcast_rgb_property(connector);
+	intel_attach_rgb_quantization_range_property(connector);
 	intel_attach_aspect_ratio_property(connector);
 
 	/*
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 637d8fe2f8c2..fda6daae4f97 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -1328,26 +1328,22 @@ static int intel_sdvo_compute_config(struct intel_encoder *encoder,
 	pipe_config->has_hdmi_sink = intel_has_hdmi_sink(intel_sdvo, conn_state);
 
 	if (pipe_config->has_hdmi_sink) {
+		enum hdmi_quantization_range range;
+
 		if (intel_sdvo_state->base.force_audio == HDMI_AUDIO_AUTO)
 			pipe_config->has_audio = intel_sdvo->has_hdmi_audio;
 		else
 			pipe_config->has_audio =
 				intel_sdvo_state->base.force_audio == HDMI_AUDIO_ON;
-	}
 
-	if (intel_sdvo_state->base.broadcast_rgb == INTEL_BROADCAST_RGB_AUTO) {
+		range = drm_connector_state_select_rgb_quantization_range(
+				conn_state, adjusted_mode);
+
 		/*
-		 * See CEA-861-E - 5.1 Default Encoding Parameters
-		 *
 		 * FIXME: This bit is only valid when using TMDS encoding and 8
 		 * bit per color mode.
 		 */
-		if (pipe_config->has_hdmi_sink &&
-		    drm_match_cea_mode(adjusted_mode) > 1)
-			pipe_config->limited_color_range = true;
-	} else {
-		if (pipe_config->has_hdmi_sink &&
-		    intel_sdvo_state->base.broadcast_rgb == INTEL_BROADCAST_RGB_LIMITED)
+		if (range == HDMI_QUANTIZATION_RANGE_LIMITED)
 			pipe_config->limited_color_range = true;
 	}
 
@@ -2662,7 +2658,7 @@ intel_sdvo_add_hdmi_properties(struct intel_sdvo *intel_sdvo,
 
 	intel_attach_force_audio_property(&connector->base.base);
 	if (INTEL_GEN(dev_priv) >= 4 && IS_MOBILE(dev_priv)) {
-		intel_attach_broadcast_rgb_property(&connector->base.base);
+		intel_attach_rgb_quantization_range_property(&connector->base.base);
 	}
 	intel_attach_aspect_ratio_property(&connector->base.base);
 }
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 1f5b9a584f71..3105f582019c 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1042,7 +1042,6 @@ struct drm_i915_private {
 	struct intel_fbdev *fbdev;
 	struct work_struct fbdev_suspend_work;
 
-	struct drm_property *broadcast_rgb_property;
 	struct drm_property *force_audio_property;
 
 	/* hda/i915 audio component */
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
