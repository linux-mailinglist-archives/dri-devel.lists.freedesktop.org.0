Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GilCK7YcGmraQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 14:46:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DD957C2F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 14:46:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1474410E78F;
	Wed, 21 Jan 2026 13:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="kFyM14I3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F220010E789;
 Wed, 21 Jan 2026 13:46:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769003170; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Gg4F5S9xqYe6zZl9yT/FBVgbrorhTeZ87QcU9CkWpko8Nz5QHcVza6S2IPAKhHsWakeQ1UAxn5YCzCENF9K8c6/S3KyFIvN8/6t5vxEZ8tPMNt9xfB37ipOeZ0siuSxN6hYqaFnYvNu+GuEakhyh0Mga1X37XelYvUsm2D/bn3Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769003170;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ToAQT35QMqT+bzsP6EXoRzU+W9WbVsDwcC+zkpVnv5U=; 
 b=QLw53hnU6nHXCFUqw/YKmlF+1zjC1SzAFz5lIEAXQ42lDXY1S3uc0IyD/8W/TjqJr03Zzf/ogpN3iQbQvFcyU4Sm/Fyxl5HDiBPaY/2EstnKuYv14EOSbopATIyznzhJC1fv9PnGOhXahRVVo1aOW8AGQAg3RxaAo8llvWXU+ro=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769003170; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=ToAQT35QMqT+bzsP6EXoRzU+W9WbVsDwcC+zkpVnv5U=;
 b=kFyM14I37CJZxMiDfK3zKIifnHzLpGZ0LbnrXf0rUhbrcJucXUvzF19hsKXaL1In
 Hx6ghsx5XrotB+S8zoF277DxDcG2u7nqMyHK3yoIG+8wllV5e2SvbDbh6LlFAI0Vzuo
 gjwFrCmwymYtvkAD9VWeevad8+HEWjIX57lh4ikY=
Received: by mx.zohomail.com with SMTPS id 1769003168250604.98582973947;
 Wed, 21 Jan 2026 05:46:08 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 21 Jan 2026 14:45:28 +0100
Subject: [PATCH v6 02/21] drm: Add new general DRM property "color format"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-color-format-v6-2-7b81a771cd0b@collabora.com>
References: <20260121-color-format-v6-0-7b81a771cd0b@collabora.com>
In-Reply-To: <20260121-color-format-v6-0-7b81a771cd0b@collabora.com>
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
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: C0DD957C2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 drivers/gpu/drm/drm_connector.c     | 142 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h         |  35 +++++++--
 4 files changed, 188 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index cc1f0c102414..1c2fa2e5f9b6 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -737,6 +737,11 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
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
index dc013a22bf26..6f87b7bf567d 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -931,6 +931,15 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
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
@@ -1016,6 +1025,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		*val = state->privacy_screen_sw_state;
 	} else if (property == connector->broadcast_rgb_property) {
 		*val = state->hdmi.broadcast_rgb;
+	} else if (property == connector->color_format_property) {
+		*val = ffs(state->color_format);
 	} else if (connector->funcs->atomic_get_property) {
 		return connector->funcs->atomic_get_property(connector,
 				state, property, val);
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 4f5b27fab475..507787619b80 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1354,6 +1354,32 @@ static const char * const colorspace_names[] = {
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
@@ -1383,6 +1409,20 @@ static const u32 hdmi_colorspaces =
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
@@ -2634,6 +2674,89 @@ int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector,
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
+					 enum_list, len);
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
@@ -2851,6 +2974,25 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
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
 /**
  * drm_connector_attach_hdr_output_metadata_property - attach "HDR_OUTPUT_METADA" property
  * @connector: connector to attach the property on.
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 7eaec37ae1c7..b5604dca728a 100644
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
@@ -2105,6 +2117,12 @@ struct drm_connector {
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
@@ -2506,6 +2524,9 @@ int drm_mode_create_dp_colorspace_property(struct drm_connector *connector,
 int drm_mode_create_content_type_property(struct drm_device *dev);
 int drm_mode_create_suggested_offset_properties(struct drm_device *dev);
 
+int drm_mode_create_color_format_property(struct drm_connector *connector,
+					  u32 supported_color_formats);
+
 int drm_connector_set_path_property(struct drm_connector *connector,
 				    const char *path);
 int drm_connector_set_tile_property(struct drm_connector *connector);
@@ -2587,6 +2608,10 @@ bool drm_connector_has_possible_encoder(struct drm_connector *connector,
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

