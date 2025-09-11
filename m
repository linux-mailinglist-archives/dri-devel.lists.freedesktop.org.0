Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4181FB53335
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 15:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0411310EB2C;
	Thu, 11 Sep 2025 13:07:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MGp2wxic";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E06A10EB21
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757596061;
 bh=QN5Kr/oFnqSlyC20mv+dDTpqJYF2u+MgY1LXkFDL+rM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MGp2wxic5bPc1Vy/UiIUNwss92TTP+LZziS6uv/NfwpyTN4fQ6+h4I88HWhqWmcpa
 MhBE7z2A7g8+jIiEHhuz3xUG97jsti/0ByNHHMRiQJKk1WFvTW2exZF2dx4JzMeMRz
 9GT4I/gbzdfp7LLl8Mh2uPxXefYw8mJX489PmhbgmCojodkelAzvXOHpzv1e5naK4G
 iAaFtOtD6O4Vn2P/ocAZiK4YStNR4uYq1rnV1gV4QiP3QxI86L1SRn+SKeBGHD/nbb
 9O5e7UnUlpKmuvY8hp2eS1xzDLFzLPCzmvMJVOSgvoUgMK9dBhX2ackBqnoxEwdwHb
 0uLTGybAJjpzw==
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f05:840b:7800:3261:5c97:2de4:16d3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7B23017E107A;
 Thu, 11 Sep 2025 15:07:41 +0200 (CEST)
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: wse@tuxedocomputers.com, andri@yngvason.is, sebastian.wick@redhat.com,
 mripard@kernel.org, daniel.stone@collabora.com,
 jani.nikula@linux.intel.com, tzimmermann@suse.de, simona.vetter@ffwll.ch,
 harry.wentland@amd.com, christian.koenig@amd.com,
 derek.foreman@collabora.com
Subject: [PATCH 3/8] drm: Add new general DRM property "color format"
Date: Thu, 11 Sep 2025 16:07:34 +0300
Message-ID: <20250911130739.4936-4-marius.vlad@collabora.com>
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

Adds a new general DRM property named "color format" which can be used by
userspace to force the display driver output a particular color format.

Possible options are:
    - auto (setup by default, driver internally picks the color format)
    - rgb
    - ycbcr444
    - ycbcr422
    - ycbcr420

Drivers should advertise from this list the formats which they support.
Together with this list and EDID data from the sink we should be able
to relay a list of usable color formats to users to pick from.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Andri Yngvason <andri@yngvason.is>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
---
 drivers/gpu/drm/drm_atomic_helper.c |   5 +
 drivers/gpu/drm/drm_atomic_uapi.c   |   4 +
 drivers/gpu/drm/drm_connector.c     | 177 ++++++++++++++++++++++++++++
 include/drm/drm_connector.h         |  54 ++++++++-
 4 files changed, 235 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index d5ebe6ea0acb..03aae1adf540 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -736,6 +736,11 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 			if (old_connector_state->max_requested_bpc !=
 			    new_connector_state->max_requested_bpc)
 				new_crtc_state->connectors_changed = true;
+
+			if (old_connector_state->color_format !=
+			    new_connector_state->color_format)
+				new_crtc_state->connectors_changed = true;
+
 		}
 
 		if (funcs->atomic_check)
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 85dbdaa4a2e2..23092868407e 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -780,6 +780,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		state->privacy_screen_sw_state = val;
 	} else if (property == connector->broadcast_rgb_property) {
 		state->hdmi.broadcast_rgb = val;
+	} else if (property == connector->color_format_property) {
+		state->color_format = drm_color_format_enum_to_color_format(val);
 	} else if (connector->funcs->atomic_set_property) {
 		return connector->funcs->atomic_set_property(connector,
 				state, property, val);
@@ -865,6 +867,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		*val = state->privacy_screen_sw_state;
 	} else if (property == connector->broadcast_rgb_property) {
 		*val = state->hdmi.broadcast_rgb;
+	} else if (property == connector->color_format_property) {
+		*val = drm_color_format_to_color_format_enum(state->color_format);
 	} else if (connector->funcs->atomic_get_property) {
 		return connector->funcs->atomic_get_property(connector,
 				state, property, val);
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 24edba01f2f0..96e95047248e 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1348,6 +1348,55 @@ static const char * const colorspace_names[] = {
 	[DRM_MODE_COLORIMETRY_BT601_YCC] = "BT601_YCC",
 };
 
+u32
+drm_color_format_to_color_format_enum(enum drm_color_format fmt)
+{
+	switch (fmt) {
+	default:
+	case DRM_COLOR_FORMAT_AUTO:
+		return DRM_MODE_COLOR_FORMAT_AUTO;
+	case DRM_COLOR_FORMAT_RGB444:
+		return DRM_MODE_COLOR_FORMAT_RGB444;
+	case DRM_COLOR_FORMAT_YCBCR444:
+		return DRM_MODE_COLOR_FORMAT_YCBCR444;
+	case DRM_COLOR_FORMAT_YCBCR422:
+		return DRM_MODE_COLOR_FORMAT_YCBCR422;
+	case DRM_COLOR_FORMAT_YCBCR420:
+		return DRM_MODE_COLOR_FORMAT_YCBCR420;
+	}
+}
+
+u32
+drm_color_format_enum_to_color_format(enum drm_color_format_enum fmt_enum)
+{
+	switch (fmt_enum) {
+	default:
+	case DRM_MODE_COLOR_FORMAT_RGB444:
+		return DRM_COLOR_FORMAT_RGB444;
+	case DRM_MODE_COLOR_FORMAT_AUTO:
+		return DRM_COLOR_FORMAT_AUTO;
+	case DRM_MODE_COLOR_FORMAT_YCBCR444:
+		return DRM_COLOR_FORMAT_YCBCR444;
+	case DRM_MODE_COLOR_FORMAT_YCBCR422:
+		return DRM_COLOR_FORMAT_YCBCR422;
+	case DRM_MODE_COLOR_FORMAT_YCBCR420:
+		return DRM_COLOR_FORMAT_YCBCR420;
+	}
+}
+
+/**
+ * drm_get_color_format_name - return a string for color format
+ * @colorspace: color format to compute name of
+ *
+ */
+const char *drm_get_color_format_name(enum drm_color_format color_fmt)
+{
+	u32 conv_color_fmt = drm_color_format_to_color_format_enum(color_fmt);
+
+	return drm_hdmi_connector_get_output_format_name(conv_color_fmt);
+}
+EXPORT_SYMBOL(drm_get_color_format_name);
+
 /**
  * drm_get_colorspace_name - return a string for color encoding
  * @colorspace: color space to compute name of
@@ -1377,6 +1426,22 @@ static const u32 hdmi_colorspaces =
 	BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65) |
 	BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER);
 
+/* already bit-shifted */
+static const u32 hdmi_colorformats =
+	DRM_COLOR_FORMAT_AUTO |
+	DRM_COLOR_FORMAT_RGB444 |
+	DRM_COLOR_FORMAT_YCBCR444 |
+	DRM_COLOR_FORMAT_YCBCR422 |
+	DRM_COLOR_FORMAT_YCBCR420;
+
+/* already bit-shifted */
+static const u32 dp_colorformats =
+	DRM_COLOR_FORMAT_AUTO |
+	DRM_COLOR_FORMAT_RGB444 |
+	DRM_COLOR_FORMAT_YCBCR444 |
+	DRM_COLOR_FORMAT_YCBCR422 |
+	DRM_COLOR_FORMAT_YCBCR420;
+
 /*
  * As per DP 1.4a spec, 2.2.5.7.5 VSC SDP Payload for Pixel Encoding/Colorimetry
  * Format Table 2-120
@@ -2629,6 +2694,98 @@ int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
 
+static int drm_mode_create_color_format_property(struct drm_connector *connector,
+						 u32 supported_color_formats)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_prop_enum_list enum_list[DRM_MODE_COLOR_FORMAT_COUNT];
+	int i, len;
+
+	if (connector->color_format_property)
+		return 0;
+
+	if (!supported_color_formats) {
+		drm_err(dev, "No supported color formats provded on [CONNECTOR:%d:%s]\n",
+			    connector->base.id, connector->name);
+		return -EINVAL;
+	}
+
+	if ((supported_color_formats & -BIT(DRM_MODE_COLOR_FORMAT_COUNT)) != 0) {
+		drm_err(dev, "Unknown colorspace provded on [CONNECTOR:%d:%s]\n",
+			    connector->base.id, connector->name);
+		return -EINVAL;
+	}
+
+	len = 0;
+	for (i = 0; i < DRM_MODE_COLOR_FORMAT_COUNT; i++) {
+		if (!(supported_color_formats & BIT(i)))
+			continue;
+
+		enum_list[len].type = i;
+		enum_list[len].name = output_format_str[i];
+		len++;
+	}
+
+	connector->color_format_property =
+		drm_property_create_enum(dev, DRM_MODE_PROP_ENUM, "color format",
+					enum_list, len);
+
+	if (!connector->color_format_property)
+		return -ENOMEM;
+
+	return 0;
+}
+
+/**
+ * drm_mode_create_hdmi_color_format_property - create hdmi color format property
+ * @connector: connector to create the color format property on.
+ * @supported_color_formats: bitmap of supported color formats
+ *
+ * Called by a driver the first time it's needed, must be attached to desired
+ * HDMI connectors.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_mode_create_hdmi_color_format_property(struct drm_connector *connector,
+					       u32 supported_color_formats)
+{
+	u32 color_formats;
+
+	if (supported_color_formats)
+		color_formats = supported_color_formats & hdmi_colorformats;
+	else
+		color_formats = hdmi_colorformats;
+
+	return drm_mode_create_color_format_property(connector, color_formats);
+}
+EXPORT_SYMBOL(drm_mode_create_hdmi_color_format_property);
+
+/**
+ * drm_mode_create_dp_color_format_property - create dp color format property
+ * @connector: connector to create the Colorspace property on.
+ * @supported_color_formats: bitmap of supported color formats
+ *
+ * Called by a driver the first time it's needed, must be attached to desired
+ * DP connectors.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_mode_create_dp_color_format_property(struct drm_connector *connector,
+					     u32 supported_color_formats)
+{
+	u32 color_formats;
+
+	if (supported_color_formats)
+		color_formats = supported_color_formats & dp_colorformats;
+	else
+		color_formats = dp_colorformats;
+
+	return drm_mode_create_color_format_property(connector, color_formats);
+}
+EXPORT_SYMBOL(drm_mode_create_dp_color_format_property);
+
 /**
  * drm_mode_create_dp_colorspace_property - create dp colorspace property
  * @connector: connector to create the Colorspace property on.
@@ -2846,6 +3003,26 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
 
+/**
+ * drm_connector_attach_color_format_property - attach "force color format" property
+ * @connector: connector to attach force color format property on.
+ *
+ * This is used to add support for selecting a color format on a connector.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_connector_attach_color_format_property(struct drm_connector *connector)
+{
+	struct drm_property *prop = connector->color_format_property;
+
+	drm_object_attach_property(&connector->base, prop, DRM_COLOR_FORMAT_AUTO);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_attach_color_format_property);
+
+
 /**
  * drm_connector_attach_hdr_output_metadata_property - attach "HDR_OUTPUT_METADA" property
  * @connector: connector to attach the property on.
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8f34f4b8183d..24d760e2fa8f 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -556,6 +556,26 @@ enum drm_colorspace {
 	DRM_MODE_COLORIMETRY_COUNT
 };
 
+enum drm_color_format_enum {
+	DRM_MODE_COLOR_FORMAT_RGB444		= HDMI_COLORSPACE_RGB,
+	DRM_MODE_COLOR_FORMAT_YCBCR422		= HDMI_COLORSPACE_YUV422,
+	DRM_MODE_COLOR_FORMAT_YCBCR444		= HDMI_COLORSPACE_YUV444,
+	DRM_MODE_COLOR_FORMAT_YCBCR420		= HDMI_COLORSPACE_YUV420,
+	/* auto case, driver will set the color_format */
+	DRM_MODE_COLOR_FORMAT_AUTO		= HDMI_COLORSPACE_AUTO,
+	DRM_MODE_COLOR_FORMAT_COUNT
+};
+
+enum drm_color_format {
+	DRM_COLOR_FORMAT_NONE			= 0,
+	DRM_COLOR_FORMAT_RGB444			= (1 << 0),
+	DRM_COLOR_FORMAT_YCBCR422		= (1 << 1),
+	DRM_COLOR_FORMAT_YCBCR444		= (1 << 2),
+	DRM_COLOR_FORMAT_YCBCR420		= (1 << 3),
+	/* auto case, driver will set the color_format */
+	DRM_COLOR_FORMAT_AUTO			= (1 << 4),
+};
+
 /**
  * enum drm_bus_flags - bus_flags info for &drm_display_info
  *
@@ -699,11 +719,6 @@ struct drm_display_info {
 	 */
 	enum subpixel_order subpixel_order;
 
-#define DRM_COLOR_FORMAT_RGB444		(1<<0)
-#define DRM_COLOR_FORMAT_YCBCR444	(1<<1)
-#define DRM_COLOR_FORMAT_YCBCR422	(1<<2)
-#define DRM_COLOR_FORMAT_YCBCR420	(1<<3)
-
 	/**
 	 * @panel_orientation: Read only connector property for built-in panels,
 	 * indicating the orientation of the panel vs the device's casing.
@@ -1107,6 +1122,13 @@ struct drm_connector_state {
 	 */
 	enum drm_colorspace colorspace;
 
+	/**
+	 * @color_format: State variable for Connector property to request
+	 * color format change on Sink. This is most commonly used to switch
+	 * between RGB to YUV and vice-versa.
+	 */
+	enum drm_color_format color_format;
+
 	/**
 	 * @writeback_job: Writeback job for writeback connectors
 	 *
@@ -2060,6 +2082,12 @@ struct drm_connector {
 	 */
 	struct drm_property *colorspace_property;
 
+	/**
+	 * @color_format_property: Connector property to set the suitable
+	 * color format supported by the sink.
+	 */
+	struct drm_property *color_format_property;
+
 	/**
 	 * @path_blob_ptr:
 	 *
@@ -2461,6 +2489,12 @@ int drm_mode_create_dp_colorspace_property(struct drm_connector *connector,
 int drm_mode_create_content_type_property(struct drm_device *dev);
 int drm_mode_create_suggested_offset_properties(struct drm_device *dev);
 
+int drm_mode_create_hdmi_color_format_property(struct drm_connector *connector,
+					       u32 supported_color_formats);
+
+int drm_mode_create_dp_color_format_property(struct drm_connector *connector,
+					     u32 supported_color_formats);
+
 int drm_connector_set_path_property(struct drm_connector *connector,
 				    const char *path);
 int drm_connector_set_tile_property(struct drm_connector *connector);
@@ -2542,6 +2576,16 @@ bool drm_connector_has_possible_encoder(struct drm_connector *connector,
 					struct drm_encoder *encoder);
 const char *drm_get_colorspace_name(enum drm_colorspace colorspace);
 
+int drm_connector_attach_color_format_property(struct drm_connector *connector);
+
+const char *drm_get_color_format_name(enum drm_color_format color_fmt);
+
+u32
+drm_color_format_to_color_format_enum(enum drm_color_format fmt);
+
+u32
+drm_color_format_enum_to_color_format(enum drm_color_format_enum fmt_enum);
+
 /**
  * drm_for_each_connector_iter - connector_list iterator macro
  * @connector: &struct drm_connector pointer used as cursor
-- 
2.47.2

