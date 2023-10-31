Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0837DD2A5
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 17:48:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF0510E576;
	Tue, 31 Oct 2023 16:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45AC410E576
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 16:48:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A23B061019;
 Tue, 31 Oct 2023 16:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7B5C433C9;
 Tue, 31 Oct 2023 16:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698770923;
 bh=aTMPM6z7vPXUc2iExDPHfAzUswqaKuN6p79Bqe0hNeE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mRjvEMCYWUO7twuy/stu9xGLdBKnH0Rnq1ngPRXM4oaiF5wcdrpGZu1ifwftO5xue
 pOkD1oIrxU31TF0uAuKD4J5dmGR6PReEViw5cKRLOd+GdL1L4lFFqaxVrqO8YWLsJQ
 6fTVVGfbYz68LR5Rbtte4jX1NQJ/sQwp2U2UbINAUvMzQVn80oJgyDAQefxVdxTAbX
 a1sqtrD51LiR5CJJciXjlf0HXp4QLWfz13jJ92+XRp5jJS5rM8TW87T5qO1G4m1zLj
 j3K/9xt7dPue8o15WUQsK2OMetklDtMnjOiV7gMWAXlnwtVf1W4SlmQmxQdlgqLvZ+
 QkHYjR4sgtXgg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 31 Oct 2023 17:48:16 +0100
Subject: [PATCH RFC v3 03/37] drm/connector: hdmi: Add Broadcast RGB property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231031-kms-hdmi-connector-state-v3-3-328b0fae43a7@kernel.org>
References: <20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org>
In-Reply-To: <20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11490; i=mripard@kernel.org;
 h=from:subject:message-id; bh=aTMPM6z7vPXUc2iExDPHfAzUswqaKuN6p79Bqe0hNeE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmO+ndfOGi4fVbUnfd6Q02JTcQxo34/pvQF+U/0vzHKN
 Wb2HJ/WUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIlE+TH8D1EUmTSpahPH9b3+
 L3dfYo6Pbnv5I7B9jZBx+Nrfu0NsDBj+V1UmmXvr3FXc93RznZ6HfIDMFgaZIPb43V2MpsF9j42
 YAA==
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The i915 driver has a property to force the RGB range of an HDMI output.
The vc4 driver then implemented the same property with the same
semantics. KWin has support for it, and a PR for mutter is also there to
support it.

Both drivers implementing the same property with the same semantics,
plus the userspace having support for it, is proof enough that it's
pretty much a de-facto standard now and we can provide helpers for it.

Let's plumb it into the newly created HDMI connector.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/gpu/kms-properties.csv      |  1 -
 drivers/gpu/drm/drm_atomic.c              |  5 ++
 drivers/gpu/drm/drm_atomic_state_helper.c | 17 +++++++
 drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
 drivers/gpu/drm/drm_connector.c           | 76 +++++++++++++++++++++++++++++++
 include/drm/drm_connector.h               | 36 +++++++++++++++
 6 files changed, 138 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/kms-properties.csv b/Documentation/gpu/kms-properties.csv
index 0f9590834829..caef14c532d4 100644
--- a/Documentation/gpu/kms-properties.csv
+++ b/Documentation/gpu/kms-properties.csv
@@ -17,7 +17,6 @@ Owner Module/Drivers,Group,Property Name,Type,Property Values,Object attached,De
 ,Virtual GPU,“suggested X”,RANGE,"Min=0, Max=0xffffffff",Connector,property to suggest an X offset for a connector
 ,,“suggested Y”,RANGE,"Min=0, Max=0xffffffff",Connector,property to suggest an Y offset for a connector
 ,Optional,"""aspect ratio""",ENUM,"{ ""None"", ""4:3"", ""16:9"" }",Connector,TDB
-i915,Generic,"""Broadcast RGB""",ENUM,"{ ""Automatic"", ""Full"", ""Limited 16:235"" }",Connector,"When this property is set to Limited 16:235 and CTM is set, the hardware will be programmed with the result of the multiplication of CTM by the limited range matrix to ensure the pixels normally in the range 0..1.0 are remapped to the range 16/255..235/255."
 ,,“audio”,ENUM,"{ ""force-dvi"", ""off"", ""auto"", ""on"" }",Connector,TBD
 ,SDVO-TV,“mode”,ENUM,"{ ""NTSC_M"", ""NTSC_J"", ""NTSC_443"", ""PAL_B"" } etc.",Connector,TBD
 ,,"""left_margin""",RANGE,"Min=0, Max= SDVO dependent",Connector,TBD
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index c277b198fa3f..b1b56dcaa76b 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1142,6 +1142,11 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
 	drm_printf(p, "\tmax_requested_bpc=%d\n", state->max_requested_bpc);
 	drm_printf(p, "\tcolorspace=%s\n", drm_get_colorspace_name(state->colorspace));
 
+	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
+	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB)
+		drm_printf(p, "\tbroadcast_rgb=%s\n",
+			   drm_hdmi_connector_get_broadcast_rgb_name(state->hdmi.broadcast_rgb));
+
 	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
 		if (state->writeback_job && state->writeback_job->fb)
 			drm_printf(p, "\tfb=%d\n", state->writeback_job->fb->base.id);
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 29cb64e9cf28..37193c6f9fca 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -569,6 +569,7 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
 void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
 					      struct drm_connector_state *new_state)
 {
+	new_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
 
@@ -636,6 +637,22 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_tv_check);
 int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 					   struct drm_atomic_state *state)
 {
+	struct drm_connector_state *old_state =
+		drm_atomic_get_old_connector_state(state, connector);
+	struct drm_connector_state *new_state =
+		drm_atomic_get_new_connector_state(state, connector);
+
+	if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb) {
+		struct drm_crtc *crtc = new_state->crtc;
+		struct drm_crtc_state *crtc_state;
+
+		crtc_state = drm_atomic_get_crtc_state(state, crtc);
+		if (IS_ERR(crtc_state))
+			return PTR_ERR(crtc_state);
+
+		crtc_state->mode_changed = true;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 98d3b10c08ae..96798592bd64 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -798,6 +798,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		state->max_requested_bpc = val;
 	} else if (property == connector->privacy_screen_sw_state_property) {
 		state->privacy_screen_sw_state = val;
+	} else if (property == connector->broadcast_rgb_property) {
+		state->hdmi.broadcast_rgb = val;
 	} else if (connector->funcs->atomic_set_property) {
 		return connector->funcs->atomic_set_property(connector,
 				state, property, val);
@@ -881,6 +883,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		*val = state->max_requested_bpc;
 	} else if (property == connector->privacy_screen_sw_state_property) {
 		*val = state->privacy_screen_sw_state;
+	} else if (property == connector->broadcast_rgb_property) {
+		*val = state->hdmi.broadcast_rgb;
 	} else if (connector->funcs->atomic_get_property) {
 		return connector->funcs->atomic_get_property(connector,
 				state, property, val);
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 997f8ab21d04..36d728e811ae 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1174,6 +1174,29 @@ static const u32 dp_colorspaces =
 	BIT(DRM_MODE_COLORIMETRY_BT2020_CYCC) |
 	BIT(DRM_MODE_COLORIMETRY_BT2020_YCC);
 
+static const struct drm_prop_enum_list broadcast_rgb_names[] = {
+	{ DRM_HDMI_BROADCAST_RGB_AUTO, "Automatic" },
+	{ DRM_HDMI_BROADCAST_RGB_FULL, "Full" },
+	{ DRM_HDMI_BROADCAST_RGB_LIMITED, "Limited 16:235" },
+};
+
+/*
+ * drm_hdmi_connector_get_broadcast_rgb_name - Return a string for HDMI connector RGB broadcast selection
+ * @broadcast_rgb: Broadcast RGB selection to compute name of
+ *
+ * Returns: the name of the Broadcast RGB selection, or NULL if the type
+ * is not valid.
+ */
+const char *
+drm_hdmi_connector_get_broadcast_rgb_name(enum drm_hdmi_broadcast_rgb broadcast_rgb)
+{
+	if (broadcast_rgb > DRM_HDMI_BROADCAST_RGB_LIMITED)
+		return NULL;
+
+	return broadcast_rgb_names[broadcast_rgb].name;
+}
+EXPORT_SYMBOL(drm_hdmi_connector_get_broadcast_rgb_name);
+
 /**
  * DOC: standard connector properties
  *
@@ -1640,6 +1663,26 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_property);
 /**
  * DOC: HDMI connector properties
  *
+ * Broadcast RGB
+ *      Indicates the RGB Quantization Range (Full vs Limited) used.
+ *      Infoframes will be generated according to that value.
+ *
+ *      The value of this property can be one of the following:
+ *
+ *      Automatic:
+ *              RGB Range is selected automatically based on the mode
+ *              according to the HDMI specifications.
+ *
+ *      Full:
+ *              Full RGB Range is forced.
+ *
+ *      Limited 16:235:
+ *              Limited RGB Range is forced. Unlike the name suggests,
+ *              this works for any number of bits-per-component.
+ *
+ *      Drivers can set up this property by calling
+ *      drm_connector_attach_broadcast_rgb_property().
+ *
  * content type (HDMI specific):
  *	Indicates content type setting to be used in HDMI infoframes to indicate
  *	content type for the external device, so that it adjusts its display
@@ -2502,6 +2545,39 @@ int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *conn
 }
 EXPORT_SYMBOL(drm_connector_attach_hdr_output_metadata_property);
 
+/**
+ * drm_connector_attach_broadcast_rgb_property - attach "Broadcast RGB" property
+ * @connector: connector to attach the property on.
+ *
+ * This is used to add support for forcing the RGB range on a connector
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_connector_attach_broadcast_rgb_property(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_property *prop;
+
+	prop = connector->broadcast_rgb_property;
+	if (!prop) {
+		prop = drm_property_create_enum(dev, DRM_MODE_PROP_ENUM,
+						"Broadcast RGB",
+						broadcast_rgb_names,
+						ARRAY_SIZE(broadcast_rgb_names));
+		if (!prop)
+			return -EINVAL;
+
+		connector->broadcast_rgb_property = prop;
+	}
+
+	drm_object_attach_property(&connector->base, prop,
+				   DRM_HDMI_BROADCAST_RGB_AUTO);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_attach_broadcast_rgb_property);
+
 /**
  * drm_connector_attach_colorspace_property - attach "Colorspace" property
  * @connector: connector to attach the property on.
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 5961f2ad48b1..168009f588ab 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -368,6 +368,30 @@ enum drm_panel_orientation {
 	DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
 };
 
+/**
+ * enum drm_hdmi_broadcast_rgb - Broadcast RGB Selection for an HDMI @drm_connector
+ */
+enum drm_hdmi_broadcast_rgb {
+	/**
+	 * @DRM_HDMI_BROADCAST_RGB_AUTO: The RGB range is selected
+	 * automatically based on the mode.
+	 */
+	DRM_HDMI_BROADCAST_RGB_AUTO,
+
+	/**
+	 * @DRM_HDMI_BROADCAST_RGB_FULL: Full range RGB is forced.
+	 */
+	DRM_HDMI_BROADCAST_RGB_FULL,
+
+	/**
+	 * @DRM_HDMI_BROADCAST_RGB_LIMITED: Limited range RGB is forced.
+	 */
+	DRM_HDMI_BROADCAST_RGB_LIMITED,
+};
+
+const char *
+drm_hdmi_connector_get_broadcast_rgb_name(enum drm_hdmi_broadcast_rgb broadcast_rgb);
+
 /**
  * struct drm_monitor_range_info - Panel's Monitor range in EDID for
  * &drm_display_info
@@ -1024,6 +1048,11 @@ struct drm_connector_state {
 	struct drm_property_blob *hdr_output_metadata;
 
 	struct {
+		/**
+		 * @broadcast_rgb: Connector property to pass the
+		 * Broadcast RGB selection value.
+		 */
+		enum drm_hdmi_broadcast_rgb broadcast_rgb;
 	} hdmi;
 };
 
@@ -1692,6 +1721,12 @@ struct drm_connector {
 	 */
 	struct drm_property *privacy_screen_hw_state_property;
 
+	/**
+	 * @broadcast_rgb_property: Connector property to set the
+	 * Broadcast RGB selection to output with.
+	 */
+	struct drm_property *broadcast_rgb_property;
+
 #define DRM_CONNECTOR_POLL_HPD (1 << 0)
 #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
 #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
@@ -2011,6 +2046,7 @@ int drm_connector_attach_scaling_mode_property(struct drm_connector *connector,
 					       u32 scaling_mode_mask);
 int drm_connector_attach_vrr_capable_property(
 		struct drm_connector *connector);
+int drm_connector_attach_broadcast_rgb_property(struct drm_connector *connector);
 int drm_connector_attach_colorspace_property(struct drm_connector *connector);
 int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *connector);
 bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state *old_state,

-- 
2.41.0

