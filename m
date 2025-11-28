Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE99C9323B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 22:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D3510E928;
	Fri, 28 Nov 2025 21:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="K9Bnk5L8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C17710E928;
 Fri, 28 Nov 2025 21:06:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764363975; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=S2K58xTcFXmWoEhgqy0qKPWrDl498HwgQtoDbpTPH8JlTgCM3nF0Na/cIToZt77CAUwbU8PdBBnsHzo0klVWV6owvs0PkO74d00T5+FqdgBGGs6HNMEQgUZf2CD7K2WjQqGQ4OOkkyrLINbAJW3vGiD9jFELia/Ev4jtaKPrMHY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764363975;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Vfcj6LoYRnSC3IIOqTJz3X8JC9SiWsOx17fDIMOWY6Y=; 
 b=idHME+LugpSZoZY86e0wfzyaKxONWqngolsHsuZgCuw52z0/GnJ+5nfANHOvpLQwRe3/t/+bMTVBgR6OXzFbT+q80K5X34X0SmRMnuSqWKxWygyAvWJ9dAZdwDXnlvu10c6zNx5WRXfW4I28V9awoH2DnN/d8cpizLZpEl6VdjI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764363975; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=Vfcj6LoYRnSC3IIOqTJz3X8JC9SiWsOx17fDIMOWY6Y=;
 b=K9Bnk5L8TbmN7j9HTSO/ePp0gcxAKPEzGI4Ipi9uaNRvnZOXDkwdy/m/foDVObOK
 Z0+TFCP7Ivd6Y3bpubtqWEUyZcKC2N6aB/rWcYNDYvZ74tbRyK1cVPi/tAVnzzcgNDA
 qtjOGKsl5iAACC4/uVTfLY4w5wuQUlx0FQVZhtm0=
Received: by mx.zohomail.com with SMTPS id 176436397252764.085506405773;
 Fri, 28 Nov 2025 13:06:12 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 28 Nov 2025 22:05:38 +0100
Subject: [PATCH v5 02/17] drm: Add new general DRM property "color format"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-color-format-v5-2-63e82f1db1e1@collabora.com>
References: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
In-Reply-To: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
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
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>
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

Add a new general DRM property named "color format" which can be used by
userspace to request the display driver to output a particular color
format.

Possible options are:
    - auto (setup by default, driver internally picks the color format)
    - rgb
    - ycbcr444
    - ycbcr422
    - ycbcr420

Drivers should advertise from this list which formats they support.
Together with this list and EDID data from the sink we should be able
to relay a list of usable color formats to users to pick from.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Andri Yngvason <andri@yngvason.is>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_atomic_helper.c |   5 ++
 drivers/gpu/drm/drm_atomic_uapi.c   |  11 +++
 drivers/gpu/drm/drm_connector.c     | 143 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h         |  35 +++++++--
 4 files changed, 189 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 10adac9397cf..ca2daa4c84de 100644
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
index 7320db4b8489..ecf30e23a736 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -915,6 +915,15 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		state->privacy_screen_sw_state = val;
 	} else if (property == connector->broadcast_rgb_property) {
 		state->hdmi.broadcast_rgb = val;
+	} else if (property == connector->color_format_property) {
+		if (val >= DRM_COLOR_FORMAT_COUNT) {
+			drm_dbg_atomic(connector->dev,
+				       "[CONNECTOR:%d:%s] unknown color format %llu\n",
+				       connector->base.id, connector->name, val);
+			return -EINVAL;
+		}
+
+		state->color_format = val ? BIT(val - 1) : DRM_COLOR_FORMAT_AUTO;
 	} else if (connector->funcs->atomic_set_property) {
 		return connector->funcs->atomic_set_property(connector,
 				state, property, val);
@@ -1000,6 +1009,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		*val = state->privacy_screen_sw_state;
 	} else if (property == connector->broadcast_rgb_property) {
 		*val = state->hdmi.broadcast_rgb;
+	} else if (property == connector->color_format_property) {
+		*val = ffs(state->color_format);
 	} else if (connector->funcs->atomic_get_property) {
 		return connector->funcs->atomic_get_property(connector,
 				state, property, val);
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 4d6dc9ebfdb5..13151d9bfb82 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1348,6 +1348,32 @@ static const char * const colorspace_names[] = {
 	[DRM_MODE_COLORIMETRY_BT601_YCC] = "BT601_YCC",
 };
 
+/**
+ * drm_get_color_format_name - return a string for color format
+ * @color_fmt: color format to return the name of
+ *
+ * Returns a string constant matching the format's name, or NULL if no match
+ * is found.
+ */
+const char *drm_get_color_format_name(enum drm_color_format color_fmt)
+{
+	switch (color_fmt) {
+	case DRM_COLOR_FORMAT_AUTO:
+		return "AUTO";
+	case DRM_COLOR_FORMAT_RGB444:
+		return "RGB";
+	case DRM_COLOR_FORMAT_YCBCR444:
+		return "YUV 4:4:4";
+	case DRM_COLOR_FORMAT_YCBCR422:
+		return "YUV 4:2:2";
+	case DRM_COLOR_FORMAT_YCBCR420:
+		return "YUV 4:2:0";
+	default:
+		return NULL;
+	}
+}
+EXPORT_SYMBOL(drm_get_color_format_name);
+
 /**
  * drm_get_colorspace_name - return a string for color encoding
  * @colorspace: color space to compute name of
@@ -1377,6 +1403,20 @@ static const u32 hdmi_colorspaces =
 	BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65) |
 	BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER);
 
+/* already bit-shifted */
+static const u32 hdmi_colorformats =
+	DRM_COLOR_FORMAT_RGB444 |
+	DRM_COLOR_FORMAT_YCBCR444 |
+	DRM_COLOR_FORMAT_YCBCR422 |
+	DRM_COLOR_FORMAT_YCBCR420;
+
+/* already bit-shifted */
+static const u32 dp_colorformats =
+	DRM_COLOR_FORMAT_RGB444 |
+	DRM_COLOR_FORMAT_YCBCR444 |
+	DRM_COLOR_FORMAT_YCBCR422 |
+	DRM_COLOR_FORMAT_YCBCR420;
+
 /*
  * As per DP 1.4a spec, 2.2.5.7.5 VSC SDP Payload for Pixel Encoding/Colorimetry
  * Format Table 2-120
@@ -2628,6 +2668,89 @@ int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
 
+/**
+ * drm_mode_create_color_format_property - create color format property
+ * @connector: connector to create the color format property on
+ * @supported_color_formats: bitmask of &enum drm_color_format values the
+ *                           connector supports
+ *
+ * Called by a driver to create a color format property. Must be attached to
+ * the desired connector afterwards.
+ *
+ * @supported_color_formats should only include color formats the connector
+ * type can actually support.
+ *
+ * Returns:
+ * 0 on success, negative errno on error
+ */
+int drm_mode_create_color_format_property(struct drm_connector *connector,
+					  u32 supported_color_formats)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_prop_enum_list enum_list[DRM_COLOR_FORMAT_COUNT];
+	unsigned int len = 1;
+	unsigned int i = 1;
+	u32 fmt;
+
+	if (connector->color_format_property)
+		return 0;
+
+	if (!supported_color_formats) {
+		drm_err(dev, "No supported color formats provided on [CONNECTOR:%d:%s]\n",
+			connector->base.id, connector->name);
+		return -EINVAL;
+	}
+
+	if (supported_color_formats & ~GENMASK_U32(DRM_COLOR_FORMAT_COUNT - 1, 0)) {
+		drm_err(dev, "Unknown color formats provided on [CONNECTOR:%d:%s]\n",
+			connector->base.id, connector->name);
+		return -EINVAL;
+	}
+
+	switch (connector->connector_type) {
+	case DRM_MODE_CONNECTOR_HDMIA:
+	case DRM_MODE_CONNECTOR_HDMIB:
+		if (supported_color_formats & ~hdmi_colorformats) {
+			drm_err(dev, "Color formats not allowed for HDMI on [CONNECTOR:%d:%s]\n",
+				connector->base.id, connector->name);
+			return -EINVAL;
+		}
+		break;
+	case DRM_MODE_CONNECTOR_DisplayPort:
+	case DRM_MODE_CONNECTOR_eDP:
+		if (supported_color_formats & ~dp_colorformats) {
+			drm_err(dev, "Color formats not allowed for DP on [CONNECTOR:%d:%s]\n",
+				connector->base.id, connector->name);
+			return -EINVAL;
+		}
+		break;
+	}
+
+	enum_list[0].name = drm_get_color_format_name(DRM_COLOR_FORMAT_AUTO);
+	enum_list[0].type = 0;
+
+	while (supported_color_formats) {
+		fmt = BIT(i - 1);
+		if (supported_color_formats & fmt) {
+			supported_color_formats ^= fmt;
+			enum_list[len].name = drm_get_color_format_name(fmt);
+			enum_list[len].type = i;
+			len++;
+		}
+		i++;
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
+EXPORT_SYMBOL(drm_mode_create_color_format_property);
+
 /**
  * drm_mode_create_dp_colorspace_property - create dp colorspace property
  * @connector: connector to create the Colorspace property on.
@@ -2845,6 +2968,26 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
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
index 8f34f4b8183d..38968a557b82 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -556,6 +556,16 @@ enum drm_colorspace {
 	DRM_MODE_COLORIMETRY_COUNT
 };
 
+enum drm_color_format {
+	DRM_COLOR_FORMAT_AUTO			= 0,
+	DRM_COLOR_FORMAT_RGB444			= BIT(0),
+	DRM_COLOR_FORMAT_YCBCR444		= BIT(1),
+	DRM_COLOR_FORMAT_YCBCR422		= BIT(2),
+	DRM_COLOR_FORMAT_YCBCR420		= BIT(3),
+};
+
+#define DRM_COLOR_FORMAT_COUNT 5
+
 /**
  * enum drm_bus_flags - bus_flags info for &drm_display_info
  *
@@ -699,11 +709,6 @@ struct drm_display_info {
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
@@ -1107,6 +1112,13 @@ struct drm_connector_state {
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
@@ -2060,6 +2072,12 @@ struct drm_connector {
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
@@ -2461,6 +2479,9 @@ int drm_mode_create_dp_colorspace_property(struct drm_connector *connector,
 int drm_mode_create_content_type_property(struct drm_device *dev);
 int drm_mode_create_suggested_offset_properties(struct drm_device *dev);
 
+int drm_mode_create_color_format_property(struct drm_connector *connector,
+					  u32 supported_color_formats);
+
 int drm_connector_set_path_property(struct drm_connector *connector,
 				    const char *path);
 int drm_connector_set_tile_property(struct drm_connector *connector);
@@ -2542,6 +2563,10 @@ bool drm_connector_has_possible_encoder(struct drm_connector *connector,
 					struct drm_encoder *encoder);
 const char *drm_get_colorspace_name(enum drm_colorspace colorspace);
 
+int drm_connector_attach_color_format_property(struct drm_connector *connector);
+
+const char *drm_get_color_format_name(enum drm_color_format color_fmt);
+
 /**
  * drm_for_each_connector_iter - connector_list iterator macro
  * @connector: &struct drm_connector pointer used as cursor

-- 
2.52.0

