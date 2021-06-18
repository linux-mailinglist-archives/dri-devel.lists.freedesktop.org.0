Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FBD3AC70A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 11:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132B06E9D9;
	Fri, 18 Jun 2021 09:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C406E9E8;
 Fri, 18 Jun 2021 09:11:46 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 8D27DC800BB;
 Fri, 18 Jun 2021 11:11:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id s0QEUOrW6jp4; Fri, 18 Jun 2021 11:11:45 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (p200300e37f3949001760E5710682cA7E.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f39:4900:1760:e571:682:ca7e])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id 1D62EC800BA;
 Fri, 18 Jun 2021 11:11:45 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 15/17] drm/uAPI: Move "Broadcast RGB" property from driver
 specific to general context
Date: Fri, 18 Jun 2021 11:11:14 +0200
Message-Id: <20210618091116.14428-16-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618091116.14428-1-wse@tuxedocomputers.com>
References: <20210618091116.14428-1-wse@tuxedocomputers.com>
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

Add "Broadcast RGB" to general drm context so that more drivers besides
i915 and gma500 can implement it without duplicating code.

Userspace can use this property to tell the graphic driver to use full or
limited color range for a given connector, overwriting the default
behaviour/automatic detection.

Possible options are:
    - Automatic (default/current behaviour)
    - Full
    - Limited 16:235

In theory the driver should be able to automatically detect the monitors
capabilities, but because of flawed standard implementations in Monitors,
this might fail. In this case a manual overwrite is required to not have
washed out colors or lose details in very dark or bright scenes.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/gpu/drm/drm_atomic_helper.c |  4 +++
 drivers/gpu/drm/drm_atomic_uapi.c   |  4 +++
 drivers/gpu/drm/drm_connector.c     | 43 +++++++++++++++++++++++++++++
 include/drm/drm_connector.h         | 16 +++++++++++
 4 files changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 90d62f305257..0c89d32efbd0 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -691,6 +691,10 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 			if (old_connector_state->preferred_color_format !=
 			    new_connector_state->preferred_color_format)
 				new_crtc_state->connectors_changed = true;
+
+			if (old_connector_state->preferred_color_range !=
+			    new_connector_state->preferred_color_range)
+				new_crtc_state->connectors_changed = true;
 		}
 
 		if (funcs->atomic_check)
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index c536f5e22016..c589bb1a8163 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -798,6 +798,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		state->max_requested_bpc = val;
 	} else if (property == connector->preferred_color_format_property) {
 		state->preferred_color_format = val;
+	} else if (property == connector->preferred_color_range_property) {
+		state->preferred_color_range = val;
 	} else if (connector->funcs->atomic_set_property) {
 		return connector->funcs->atomic_set_property(connector,
 				state, property, val);
@@ -877,6 +879,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		*val = state->max_requested_bpc;
 	} else if (property == connector->preferred_color_format_property) {
 		*val = state->preferred_color_format;
+	} else if (property == connector->preferred_color_range_property) {
+		*val = state->preferred_color_range;
 	} else if (connector->funcs->atomic_get_property) {
 		return connector->funcs->atomic_get_property(connector,
 				state, property, val);
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index aea03dd02e33..9bc596638613 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -905,6 +905,12 @@ static const struct drm_prop_enum_list drm_active_color_format_enum_list[] = {
 	{ DRM_COLOR_FORMAT_YCRCB420, "ycbcr420" },
 };
 
+static const struct drm_prop_enum_list drm_preferred_color_range_enum_list[] = {
+	{ DRM_MODE_COLOR_RANGE_UNSET, "Automatic" },
+	{ DRM_MODE_COLOR_RANGE_FULL, "Full" },
+	{ DRM_MODE_COLOR_RANGE_LIMITED_16_235, "Limited 16:235" },
+};
+
 static const struct drm_prop_enum_list drm_active_color_range_enum_list[] = {
 	{ DRM_MODE_COLOR_RANGE_UNSET, "Unknown" },
 	{ DRM_MODE_COLOR_RANGE_FULL, "Full" },
@@ -1243,6 +1249,13 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
  *	drm_connector_attach_active_color_format_property() to install this
  *	property.
  *
+ * Broadcast RGB:
+ *	This property is used by userspace to change the used color range. When
+ *	used the driver will use the selected range if valid for the current
+ *	color format. Drivers to use the function
+ *	drm_connector_attach_preferred_color_format_property() to create and
+ *	attach the property to the connector during initialization.
+ *
  * active color range:
  *	This read-only property tells userspace the color range actually used by
  *	the hardware display engine on "the cable" on a connector. The chosen
@@ -2324,6 +2337,36 @@ void drm_connector_set_active_color_format_property(struct drm_connector *connec
 }
 EXPORT_SYMBOL(drm_connector_set_active_color_format_property);
 
+/**
+ * drm_connector_attach_preferred_color_range_property - attach "Broadcast RGB" property
+ * @connector: connector to attach preferred color range property on.
+ *
+ * This is used to add support for selecting a color range on a connector.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_connector_attach_preferred_color_range_property(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_property *prop;
+
+	if (!connector->preferred_color_range_property) {
+		prop = drm_property_create_enum(dev, 0, "Broadcast RGB",
+						drm_preferred_color_range_enum_list,
+						ARRAY_SIZE(drm_preferred_color_range_enum_list));
+		if (!prop)
+			return -ENOMEM;
+
+		connector->preferred_color_range_property = prop;
+		drm_object_attach_property(&connector->base, prop, DRM_MODE_COLOR_RANGE_UNSET);
+		connector->state->preferred_color_range = DRM_MODE_COLOR_RANGE_UNSET;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_attach_preferred_color_range_property);
+
 /**
  * drm_connector_attach_active_color_range_property - attach "active color range" property
  * @connector: connector to attach active color range property on.
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 7b85407ba45c..b319760d4a8c 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -809,6 +809,15 @@ struct drm_connector_state {
 	 */
 	u32 preferred_color_format;
 
+	/**
+	 * preferred_color_range: Property set by userspace via "Broadcast RGB"
+	 * property to tell the GPU driver which color range to use. It
+	 * overwrites existing automatic detection mechanisms, if set and valid
+	 * for the current color format. Userspace can check for (un-)successful
+	 * application via the "active color range" property.
+	 */
+	enum drm_mode_color_range preferred_color_range;
+
 	/**
 	 * @hdr_output_metadata:
 	 * DRM blob property for HDR output metadata
@@ -1426,6 +1435,12 @@ struct drm_connector {
 	 */
 	struct drm_property *active_color_format_property;
 
+	/**
+	 * @preferred_color_range_property: Default connector property for the
+	 * preferred color range to be driven out of the connector.
+	 */
+	struct drm_property *preferred_color_range_property;
+
 	/**
 	 * @active_color_range_property: Default connector property for the
 	 * active color range to be driven out of the connector.
@@ -1760,6 +1775,7 @@ int drm_connector_attach_preferred_color_format_property(struct drm_connector *c
 int drm_connector_attach_active_color_format_property(struct drm_connector *connector);
 void drm_connector_set_active_color_format_property(struct drm_connector *connector,
 						    u32 active_color_format);
+int drm_connector_attach_preferred_color_range_property(struct drm_connector *connector);
 int drm_connector_attach_active_color_range_property(struct drm_connector *connector);
 void drm_connector_set_active_color_range_property(struct drm_connector *connector,
 						   enum drm_mode_color_range active_color_range);
-- 
2.25.1

