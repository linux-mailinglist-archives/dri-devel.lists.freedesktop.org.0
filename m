Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09509B3F888
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AEF210E5ED;
	Tue,  2 Sep 2025 08:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bw7+V5AJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1EE210E5ED
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:33:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 19F1D6020D;
 Tue,  2 Sep 2025 08:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73CE5C4CEF7;
 Tue,  2 Sep 2025 08:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756802029;
 bh=Eno80nTvgQVQRKC3IR1UZl5LwB2MXbm230kW2xqPWK0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=bw7+V5AJ+zao+9b0eYnpgWGF0NgRrCFO6xe8I0oN9IaMERckWM1IUMxZEIGwSSnKJ
 5eG8zbwU8EmvP4ZDzaC8eMflHqG1m/QBMABqbnEa+OgS6ZhegfUmofOFiCb3jDYlGU
 S013bp7kq43iZeq0sHo21wfPuXNPHeWPbYC+c3QpmgIMAMrMWz3VkJNml1MwRFYVR1
 91jn6eN/Twz10PwZscxpUml/DUazt3+GvfTiMSdZ7nbsXlNuJpRZMkUlD2olHUArET
 3cmMwyBQcfOBgHMgPMnPPNOpiSIfB7jb2nNehOjySlQlsYBBqCUetSs4X4r2dvYAB7
 teDjCqQxGyTuw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 10:32:43 +0200
Subject: [PATCH 15/29] drm/atomic_state_helper: Provide
 atomic_compare_state helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-state-readout-v1-15-14ad5315da3f@kernel.org>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
In-Reply-To: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=17914; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Eno80nTvgQVQRKC3IR1UZl5LwB2MXbm230kW2xqPWK0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbVu8+/eoTc7TCnzN3Heeu97sySeHVj1ktfIEB8y7f/
 xUW8PbA/I6pLAzCnAyyYoosT2TCTi9vX1zlYL/yB8wcViaQIQxcnAIwkRlbGRt26q/hv77eTJZj
 /orj/J+VQ1POanH8lIps+867eqqN0IkDho8WnvZdMalhaXDlr8K2O1WM9YEsUnor+w1n30v9VXD
 9/9HrTRdldTpeit4/8j2qS1l4jfoslo1BH99svT35xKpJFmt2xgIA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Now that we have introduced some new infrastructure to compare state
instances, let's provide helpers for the default states.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 213 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_bridge.c              |  16 +++
 include/drm/drm_atomic_state_helper.h     |  19 +++
 3 files changed, 248 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 78556e0c08d2fa84b16d70243ddd21617a322014..289a8434db5e973825f8ba4616d6d8f00c8f8b0e 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -233,10 +233,48 @@ void drm_atomic_helper_crtc_destroy_state(struct drm_crtc *crtc,
 	__drm_atomic_helper_crtc_destroy_state(state);
 	kfree(state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_crtc_destroy_state);
 
+/**
+ * drm_atomic_helper_crtc_compare_state - default &drm_crtc_funcs.atomic_compare_state hook for crtcs
+ * @crtc: the &struct drm_crtc instance
+ * @p: the &struct drm_printer to use
+ * @expected: Expected &struct drm_crtc_state value
+ * @actual: Actual &struct drm_crtc_state value
+ *
+ * Compares @actual to @expected and returns true if they are equal.
+ */
+bool drm_atomic_helper_crtc_compare_state(struct drm_crtc *crtc,
+					  struct drm_printer *p,
+					  struct drm_crtc_state *expected,
+					  struct drm_crtc_state *actual)
+{
+	bool ret = true;
+
+	STATE_CHECK_PTR(ret, p, crtc->name, expected, actual, crtc);
+	STATE_CHECK_BOOL(ret, p, crtc->name, expected, actual, enable);
+	STATE_CHECK_BOOL(ret, p, crtc->name, expected, actual, active);
+	STATE_CHECK_BOOL(ret, p, crtc->name, expected, actual, no_vblank);
+	STATE_CHECK_U32(ret, p, crtc->name, expected, actual, plane_mask);
+	STATE_CHECK_U32(ret, p, crtc->name, expected, actual, connector_mask);
+	STATE_CHECK_U32(ret, p, crtc->name, expected, actual, encoder_mask);
+
+	STATE_CHECK_DISPLAY_MODE(ret, p, crtc->name, expected, actual, mode);
+	STATE_CHECK_DISPLAY_MODE(ret, p, crtc->name, expected, actual, adjusted_mode);
+	STATE_CHECK_PROPERTY_BLOB(ret, p, crtc->name, expected, actual, mode_blob);
+	STATE_CHECK_PROPERTY_BLOB(ret, p, crtc->name, expected, actual, degamma_lut);
+	STATE_CHECK_PROPERTY_BLOB(ret, p, crtc->name, expected, actual, ctm);
+	STATE_CHECK_PROPERTY_BLOB(ret, p, crtc->name, expected, actual, gamma_lut);
+	STATE_CHECK_BOOL(ret, p, crtc->name, expected, actual, vrr_enabled);
+	STATE_CHECK_BOOL(ret, p, crtc->name, expected, actual, self_refresh_active);
+	STATE_CHECK_U32(ret, p, crtc->name, expected, actual, scaling_filter);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_atomic_helper_crtc_compare_state);
+
 /**
  * __drm_atomic_helper_plane_state_reset - resets plane state to default values
  * @plane_state: atomic plane state, must not be NULL
  * @plane: plane object, must not be NULL
  *
@@ -417,10 +455,100 @@ void drm_atomic_helper_plane_destroy_state(struct drm_plane *plane,
 	__drm_atomic_helper_plane_destroy_state(state);
 	kfree(state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_plane_destroy_state);
 
+static bool drm_atomic_helper_fb_compare(struct drm_printer *p,
+					 struct drm_framebuffer *expected,
+					 struct drm_framebuffer *actual)
+{
+	unsigned int i;
+	bool ret = true;
+
+	STATE_CHECK_FORMAT_INFO(ret, p, "framebuffer", expected, actual, format);
+
+	for (i = 0; i < expected->format->num_planes; i++) {
+		STATE_CHECK_U32(ret, p, "framebuffer", expected, actual, pitches[i]);
+		STATE_CHECK_U32(ret, p, "framebuffer", expected, actual, offsets[i]);
+	}
+
+	STATE_CHECK_U64(ret, p, "framebuffer", expected, actual, modifier);
+	STATE_CHECK_U32(ret, p, "framebuffer", expected, actual, width);
+	STATE_CHECK_U32(ret, p, "framebuffer", expected, actual, height);
+	STATE_CHECK_S32_X(ret, p, "framebuffer", expected, actual, flags);
+
+	return ret;
+}
+
+/**
+ * drm_atomic_helper_plane_compare_state - default &drm_plane_funcs.atomic_compare_state hook for planes
+ * @plane: drm plane
+ * @p: the &drm_printer to use
+ * @expected: Expected &struct drm_plane_state value
+ * @actual: Actual &struct drm_plane_state value
+ *
+ * Compares @actual to @expected and returns true if they are equal.
+ */
+bool drm_atomic_helper_plane_compare_state(struct drm_plane *plane,
+					   struct drm_printer *p,
+					   struct drm_plane_state *expected,
+					   struct drm_plane_state *actual)
+{
+	bool ret = true;
+
+	STATE_CHECK_PTR(ret, p, plane->name, expected, actual, plane);
+	STATE_CHECK_PTR(ret, p, plane->name, expected, actual, crtc);
+
+	if (expected->fb && actual->fb) {
+		if (!drm_atomic_helper_fb_compare(p, expected->fb, actual->fb))
+			ret = false;
+	} else if (!(!expected->fb && !actual->fb)) {
+		drm_atomic_helper_print_state_mismatch(p,
+						       plane->name,
+						       "fb",
+						       "expected framebuffer is %s, got %s",
+						       expected->fb ? "non-NULL" : "NULL",
+						       actual->fb ? "non-NULL" : "NULL");
+		ret = false;
+	}
+
+	STATE_CHECK_S32(ret, p, plane->name, expected, actual, crtc_x);
+	STATE_CHECK_S32(ret, p, plane->name, expected, actual, crtc_y);
+	STATE_CHECK_U32(ret, p, plane->name, expected, actual, crtc_w);
+	STATE_CHECK_U32(ret, p, plane->name, expected, actual, crtc_h);
+	STATE_CHECK_U32_16_16(ret, p, plane->name, expected, actual, src_x);
+	STATE_CHECK_U32_16_16(ret, p, plane->name, expected, actual, src_y);
+	STATE_CHECK_U32_16_16(ret, p, plane->name, expected, actual, src_w);
+	STATE_CHECK_U32_16_16(ret, p, plane->name, expected, actual, src_h);
+	STATE_CHECK_S32(ret, p, plane->name, expected, actual, hotspot_x);
+	STATE_CHECK_S32(ret, p, plane->name, expected, actual, hotspot_y);
+	STATE_CHECK_U16(ret, p, plane->name, expected, actual, alpha);
+	STATE_CHECK_U16(ret, p, plane->name, expected, actual, pixel_blend_mode);
+	STATE_CHECK_U32(ret, p, plane->name, expected, actual, rotation);
+	STATE_CHECK_U32(ret, p, plane->name, expected, actual, zpos);
+	STATE_CHECK_U32(ret, p, plane->name, expected, actual, normalized_zpos);
+	STATE_CHECK_U32(ret, p, plane->name, expected, actual, color_encoding);
+	STATE_CHECK_U32(ret, p, plane->name, expected, actual, color_range);
+
+	// TODO: damage clips
+
+	STATE_CHECK_BOOL(ret, p, plane->name, expected, actual, ignore_damage_clips);
+	STATE_CHECK_S32(ret, p, plane->name, expected, actual, src.x1);
+	STATE_CHECK_S32(ret, p, plane->name, expected, actual, src.x2);
+	STATE_CHECK_S32(ret, p, plane->name, expected, actual, src.y1);
+	STATE_CHECK_S32(ret, p, plane->name, expected, actual, src.y2);
+	STATE_CHECK_S32(ret, p, plane->name, expected, actual, dst.x1);
+	STATE_CHECK_S32(ret, p, plane->name, expected, actual, dst.x2);
+	STATE_CHECK_S32(ret, p, plane->name, expected, actual, dst.y1);
+	STATE_CHECK_S32(ret, p, plane->name, expected, actual, dst.y2);
+	STATE_CHECK_BOOL(ret, p, plane->name, expected, actual, visible);
+	STATE_CHECK_U32(ret, p, plane->name, expected, actual, scaling_filter);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_atomic_helper_plane_compare_state);
+
 /**
  * __drm_atomic_helper_connector_state_reset - reset the connector state
  * @conn_state: atomic connector state, must not be NULL
  * @connector: connectotr object, must not be NULL
  *
@@ -707,10 +835,69 @@ void drm_atomic_helper_connector_destroy_state(struct drm_connector *connector,
 	__drm_atomic_helper_connector_destroy_state(state);
 	kfree(state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_destroy_state);
 
+/**
+ * drm_atomic_helper_connector_compare_state - default &drm_connector_funcs.atomic_compare_state hook for connectors
+ * @connector: the &struct drm_connector instance
+ * @p: the &struct drm_printer to use
+ * @expected: Expected &struct drm_connector_state value
+ * @actual: Actual &struct drm_connector_state value
+ *
+ * Compares @actual to @expected and returns true if they are equal.
+ */
+bool drm_atomic_helper_connector_compare_state(struct drm_connector *conn,
+					       struct drm_printer *p,
+					       struct drm_connector_state *expected,
+					       struct drm_connector_state *actual)
+{
+	bool ret = true;
+
+	STATE_CHECK_PTR(ret, p, conn->name, expected, actual, connector);
+	STATE_CHECK_PTR(ret, p, conn->name, expected, actual, crtc);
+	STATE_CHECK_PTR(ret, p, conn->name, expected, actual, best_encoder);
+	STATE_CHECK_U32(ret, p, conn->name, expected, actual, link_status);
+
+	STATE_CHECK_U32(ret, p, conn->name, expected, actual, tv.select_subconnector);
+	STATE_CHECK_U32(ret, p, conn->name, expected, actual, tv.subconnector);
+
+	STATE_CHECK_BOOL(ret, p, conn->name, expected, actual, self_refresh_aware);
+	STATE_CHECK_U32(ret, p, conn->name, expected, actual, picture_aspect_ratio);
+	STATE_CHECK_U32(ret, p, conn->name, expected, actual, content_type);
+	STATE_CHECK_U32(ret, p, conn->name, expected, actual, hdcp_content_type);
+	STATE_CHECK_U32(ret, p, conn->name, expected, actual, scaling_mode);
+	STATE_CHECK_U32(ret, p, conn->name, expected, actual, content_protection);
+	STATE_CHECK_U32(ret, p, conn->name, expected, actual, colorspace);
+
+	/*
+	 * NOTE: We can't check max_bpc and max_requested_bpc because it
+	 * will typically come from userspace and we can't read it out
+	 * from the hardware.
+	 */
+
+	STATE_CHECK_U32(ret, p, conn->name, expected, actual, privacy_screen_sw_state);
+	STATE_CHECK_PROPERTY_BLOB(ret, p, conn->name, expected, actual, hdr_output_metadata);
+
+	STATE_CHECK_U32(ret, p, conn->name, expected, actual, hdmi.broadcast_rgb);
+	STATE_CHECK_BOOL(ret, p, conn->name, expected, actual, hdmi.infoframes.avi.set);
+	STATE_CHECK_INFOFRAME(ret, p, conn->name, expected, actual, hdmi.infoframes.avi.data);
+	STATE_CHECK_BOOL(ret, p, conn->name, expected, actual, hdmi.infoframes.hdr_drm.set);
+	STATE_CHECK_INFOFRAME(ret, p, conn->name, expected, actual, hdmi.infoframes.hdr_drm.data);
+	STATE_CHECK_BOOL(ret, p, conn->name, expected, actual, hdmi.infoframes.spd.set);
+	STATE_CHECK_INFOFRAME(ret, p, conn->name, expected, actual, hdmi.infoframes.spd.data);
+	STATE_CHECK_BOOL(ret, p, conn->name, expected, actual, hdmi.infoframes.hdmi.set);
+	STATE_CHECK_INFOFRAME(ret, p, conn->name, expected, actual, hdmi.infoframes.hdmi.data);
+	STATE_CHECK_BOOL(ret, p, conn->name, expected, actual, hdmi.is_limited_range);
+	STATE_CHECK_U32(ret, p, conn->name, expected, actual, hdmi.output_bpc);
+	STATE_CHECK_U32(ret, p, conn->name, expected, actual, hdmi.output_format);
+	STATE_CHECK_U64(ret, p, conn->name, expected, actual, hdmi.tmds_char_rate);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_compare_state);
+
 static void __drm_atomic_helper_private_obj_reset(struct drm_private_obj *obj,
 						  struct drm_private_state *state)
 {
 	memset(state, 0, sizeof(*state));
 	state->obj = obj;
@@ -831,10 +1018,36 @@ drm_atomic_helper_bridge_reset(struct drm_bridge *bridge)
 	__drm_atomic_helper_bridge_reset(bridge, bridge_state);
 	return bridge_state;
 }
 EXPORT_SYMBOL(drm_atomic_helper_bridge_reset);
 
+/**
+ * drm_atomic_helper_bridge_compare_state - default &drm_bridge_funcs.atomic_compare_state hook for bridges
+ * @bridge: the &struct drm_bridge instance
+ * @p: the &struct drm_printer to use
+ * @expected: Expected &struct drm_bridge_state value
+ * @actual: Actual &struct drm_bridge_state value
+ *
+ * Compares @actual to @expected and returns true if they are equal.
+ */
+bool drm_atomic_helper_bridge_compare_state(struct drm_bridge *bridge,
+					    struct drm_printer *p,
+					    struct drm_bridge_state *expected,
+					    struct drm_bridge_state *actual)
+{
+	bool ret = true;
+
+	STATE_CHECK_PTR(ret, p, "bridge", expected, actual, bridge);
+	STATE_CHECK_U32_X(ret, p, "bridge", expected, actual, input_bus_cfg.format);
+	STATE_CHECK_U32_X(ret, p, "bridge", expected, actual, input_bus_cfg.flags);
+	STATE_CHECK_U32_X(ret, p, "bridge", expected, actual, output_bus_cfg.format);
+	STATE_CHECK_U32_X(ret, p, "bridge", expected, actual, output_bus_cfg.flags);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_atomic_helper_bridge_compare_state);
+
 void __printf(4, 5)
 drm_atomic_helper_print_state_mismatch(struct drm_printer *p,
 				       const char *name,
 				       const char *field,
 				       const char *format, ...)
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index e803dfd8fd5aae9c16931445213df04d8715b9f6..5fe5b75773449aeeda2d723c039126106c8d5001 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -350,10 +350,25 @@ void drm_bridge_remove(struct drm_bridge *bridge)
 
 	drm_bridge_put(bridge);
 }
 EXPORT_SYMBOL(drm_bridge_remove);
 
+static bool drm_bridge_atomic_compare_priv_state(struct drm_private_obj *obj,
+						 struct drm_printer *p,
+						 struct drm_private_state *a,
+						 struct drm_private_state *b)
+{
+	struct drm_bridge *bridge = drm_priv_to_bridge(obj);
+	struct drm_bridge_state *state_a = drm_priv_to_bridge_state(a);
+	struct drm_bridge_state *state_b = drm_priv_to_bridge_state(b);
+
+	if (bridge->funcs->atomic_compare_state)
+		return bridge->funcs->atomic_compare_state(bridge, p, state_a, state_b);
+	else
+		return false;
+}
+
 static struct drm_private_state *
 drm_bridge_atomic_duplicate_priv_state(struct drm_private_obj *obj)
 {
 	struct drm_bridge *bridge = drm_priv_to_bridge(obj);
 	struct drm_bridge_state *state;
@@ -388,10 +403,11 @@ drm_bridge_atomic_print_priv_state(struct drm_printer *p,
 	drm_printf(p, "\t\tcode: %04x", state->output_bus_cfg.format);
 	drm_printf(p, "\t\tflags: %08x", state->output_bus_cfg.flags);
 }
 
 static const struct drm_private_state_funcs drm_bridge_priv_state_funcs = {
+	.atomic_compare_state = drm_bridge_atomic_compare_priv_state,
 	.atomic_duplicate_state = drm_bridge_atomic_duplicate_priv_state,
 	.atomic_destroy_state = drm_bridge_atomic_destroy_priv_state,
 	.atomic_print_state = drm_bridge_atomic_print_priv_state,
 };
 
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index 3c6ffa7122cf895f1eda09ec74c6537594d4aee3..7542b1679a623ddd8bb5ed12e770832f3ccf16ee 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -35,10 +35,11 @@ struct drm_crtc_state;
 struct drm_plane;
 struct drm_plane_state;
 struct drm_printer;
 struct drm_connector;
 struct drm_connector_state;
+struct drm_printer;
 struct drm_private_obj;
 struct drm_private_state;
 struct drm_modeset_acquire_ctx;
 struct drm_device;
 
@@ -52,10 +53,14 @@ void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
 struct drm_crtc_state *
 drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc);
 void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc_state *state);
 void drm_atomic_helper_crtc_destroy_state(struct drm_crtc *crtc,
 					  struct drm_crtc_state *state);
+bool drm_atomic_helper_crtc_compare_state(struct drm_crtc *crtc,
+					  struct drm_printer *p,
+					  struct drm_crtc_state *expected,
+					  struct drm_crtc_state *actual);
 
 void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *state,
 					   struct drm_plane *plane);
 void __drm_atomic_helper_plane_reset(struct drm_plane *plane,
 				     struct drm_plane_state *state);
@@ -65,10 +70,14 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
 struct drm_plane_state *
 drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane);
 void __drm_atomic_helper_plane_destroy_state(struct drm_plane_state *state);
 void drm_atomic_helper_plane_destroy_state(struct drm_plane *plane,
 					  struct drm_plane_state *state);
+bool drm_atomic_helper_plane_compare_state(struct drm_plane *plane,
+					   struct drm_printer *p,
+					   struct drm_plane_state *expected,
+					   struct drm_plane_state *actual);
 
 void __drm_atomic_helper_connector_state_reset(struct drm_connector_state *conn_state,
 					       struct drm_connector *connector);
 void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
 					 struct drm_connector_state *conn_state);
@@ -78,10 +87,15 @@ int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
 					 struct drm_atomic_state *state);
 void drm_atomic_helper_connector_tv_margins_reset(struct drm_connector *connector);
 void
 __drm_atomic_helper_connector_duplicate_state(struct drm_connector *connector,
 					   struct drm_connector_state *state);
+bool drm_atomic_helper_connector_compare_state(struct drm_connector *connector,
+					       struct drm_printer *p,
+					       struct drm_connector_state *expected,
+					       struct drm_connector_state *actual);
+
 struct drm_connector_state *
 drm_atomic_helper_connector_duplicate_state(struct drm_connector *connector);
 void
 __drm_atomic_helper_connector_destroy_state(struct drm_connector_state *state);
 void drm_atomic_helper_connector_destroy_state(struct drm_connector *connector,
@@ -98,10 +112,15 @@ void drm_atomic_helper_bridge_destroy_state(struct drm_bridge *bridge,
 void __drm_atomic_helper_bridge_reset(struct drm_bridge *bridge,
 				      struct drm_bridge_state *state);
 struct drm_bridge_state *
 drm_atomic_helper_bridge_reset(struct drm_bridge *bridge);
 
+bool drm_atomic_helper_bridge_compare_state(struct drm_bridge *bridge,
+					    struct drm_printer *p,
+					    struct drm_bridge_state *expected,
+					    struct drm_bridge_state *actual);
+
 void __printf(4, 5)
 drm_atomic_helper_print_state_mismatch(struct drm_printer *p,
 				       const char *name,
 				       const char *field,
 				       const char *format, ...);

-- 
2.50.1

