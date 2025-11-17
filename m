Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CB3C65E44
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 20:12:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F277F10E10F;
	Mon, 17 Nov 2025 19:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="R2GDDudM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FAB110E10F;
 Mon, 17 Nov 2025 19:12:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763406754; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=POVvlxYD/kw5kirO806RSeq3/x6kPHQXUz+Q0iQsAAemEyMzbPKwKmTb+N8EpH3dWIT9t6FgveFlLqhpNya6THOYJy2wX74l+xHr1uDzonm5RVisjjeeCaX+H1OBXmQjlZJctQNHfhdgqmVFDjGGHDfVuKMky3kaOy32Y2O/vUQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763406754;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=JDm4LO5yWJTcfID7mSjaqMJXnPJYGF2W6cLE9Z+G7NE=; 
 b=Z9kvcT4CmOvpgYrXY/w/Okp4fjmC+IyT4d5t+MmtdrQ7Uf1YSRohLJjJh8EBran71OXdKbKk25FtokP8epT+fFuclLwTSZVO7u6EBt7M3dRnXESQyKgBC3/bTmJQvGR7Wz32Um2eypo4Prb2Z0pGtRhutph/gvJA4CQKg6/7JVo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763406754; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=JDm4LO5yWJTcfID7mSjaqMJXnPJYGF2W6cLE9Z+G7NE=;
 b=R2GDDudM34+KOSu+DJhACiYrzHUj81vcYt/fPc2mVrVfzlbjJ49h9MvP6Kq3pSXM
 7TMc1hDSTDRV3paZcuqGIvocC25jMIO0ahlRKvSdWq26J/opy/e78UqlsG4GAgZNIft
 EpqMgrmtgr4BaHdc0aeH3woQtCrEGv2LmUplQDIw=
Received: by mx.zohomail.com with SMTPS id 1763406753246694.750073819096;
 Mon, 17 Nov 2025 11:12:33 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 17 Nov 2025 20:11:46 +0100
Subject: [PATCH v4 02/10] drm: Add new general DRM property "color format"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-color-format-v4-2-0ded72bd1b00@collabora.com>
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
 Andri Yngvason <andri@yngvason.is>, 
 Werner Sembach <wse@tuxedocomputers.com>, 
 Marius Vlad <marius.vlad@collabora.com>
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
 drivers/gpu/drm/drm_connector.c     | 180 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h         |  54 ++++++++++-
 4 files changed, 238 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index e641fcf8c568..25f354b2cc0d 100644
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
index b2cb5ae5a139..2f093b0d1628 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -784,6 +784,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		state->privacy_screen_sw_state = val;
 	} else if (property == connector->broadcast_rgb_property) {
 		state->hdmi.broadcast_rgb = val;
+	} else if (property == connector->color_format_property) {
+		state->color_format = drm_color_format_enum_to_color_format(val);
 	} else if (connector->funcs->atomic_set_property) {
 		return connector->funcs->atomic_set_property(connector,
 				state, property, val);
@@ -869,6 +871,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		*val = state->privacy_screen_sw_state;
 	} else if (property == connector->broadcast_rgb_property) {
 		*val = state->hdmi.broadcast_rgb;
+	} else if (property == connector->color_format_property) {
+		*val = drm_color_format_to_color_format_enum(state->color_format);
 	} else if (connector->funcs->atomic_get_property) {
 		return connector->funcs->atomic_get_property(connector,
 				state, property, val);
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 272d6254ea47..0ad7be0a2d09 100644
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
@@ -2628,6 +2693,101 @@ int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector,
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
+		if (i != DRM_MODE_COLOR_FORMAT_AUTO)
+			enum_list[len].name = output_format_str[i];
+		else
+			enum_list[len].name = "AUTO";
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
@@ -2845,6 +3005,26 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
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
index 8f34f4b8183d..a071079fd3ad 100644
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
+	DRM_MODE_COLOR_FORMAT_AUTO,
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
2.51.2

