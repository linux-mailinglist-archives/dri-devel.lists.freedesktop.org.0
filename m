Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 296933B860C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 17:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8246EA3E;
	Wed, 30 Jun 2021 15:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92E56EA1E;
 Wed, 30 Jun 2021 15:10:29 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 7EC73C80095;
 Wed, 30 Jun 2021 17:10:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id ghyRY5GYPOhw; Wed, 30 Jun 2021 17:10:28 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (p200300e37F394900095779a208783f8e.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f39:4900:957:79a2:878:3f8e])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id 7A6CCC80097;
 Wed, 30 Jun 2021 17:10:26 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, emil.l.velikov@gmail.com
Subject: [PATCH v5 12/17] drm/uAPI: Add "preferred color format" drm property
 as setting for userspace
Date: Wed, 30 Jun 2021 17:10:13 +0200
Message-Id: <20210630151018.330354-13-wse@tuxedocomputers.com>
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

Add a new general drm property "preferred color format" which can be used
by userspace to tell the graphic drivers to which color format to use.

Possible options are:
    - auto (default/current behaviour)
    - rgb
    - ycbcr444
    - ycbcr422 (not supported by both amdgpu and i915)
    - ycbcr420

In theory the auto option should choose the best available option for the
current setup, but because of bad internal conversion some monitors look
better with rgb and some with ycbcr444.

Also, because of bad shielded connectors and/or cables, it might be
preferable to use the less bandwidth heavy ycbcr422 and ycbcr420 formats
for a signal that is less deceptible to interference.

In the future, automatic color calibration for screens might also depend on
this option being available.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/gpu/drm/drm_atomic_helper.c |  4 +++
 drivers/gpu/drm/drm_atomic_uapi.c   |  4 +++
 drivers/gpu/drm/drm_connector.c     | 50 ++++++++++++++++++++++++++++-
 include/drm/drm_connector.h         | 17 ++++++++++
 4 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index bc3487964fb5..90d62f305257 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -687,6 +687,10 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 			if (old_connector_state->max_requested_bpc !=
 			    new_connector_state->max_requested_bpc)
 				new_crtc_state->connectors_changed = true;
+
+			if (old_connector_state->preferred_color_format !=
+			    new_connector_state->preferred_color_format)
+				new_crtc_state->connectors_changed = true;
 		}
 
 		if (funcs->atomic_check)
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 438e9585b225..c536f5e22016 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -796,6 +796,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 						   fence_ptr);
 	} else if (property == connector->max_bpc_property) {
 		state->max_requested_bpc = val;
+	} else if (property == connector->preferred_color_format_property) {
+		state->preferred_color_format = val;
 	} else if (connector->funcs->atomic_set_property) {
 		return connector->funcs->atomic_set_property(connector,
 				state, property, val);
@@ -873,6 +875,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		*val = 0;
 	} else if (property == connector->max_bpc_property) {
 		*val = state->max_requested_bpc;
+	} else if (property == connector->preferred_color_format_property) {
+		*val = state->preferred_color_format;
 	} else if (connector->funcs->atomic_get_property) {
 		return connector->funcs->atomic_get_property(connector,
 				state, property, val);
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index ebfdd17a7f59..67dd59b12258 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -889,6 +889,14 @@ static const struct drm_prop_enum_list drm_dp_subconnector_enum_list[] = {
 	{ DRM_MODE_SUBCONNECTOR_Native,	     "Native"    }, /* DP */
 };
 
+static const struct drm_prop_enum_list drm_preferred_color_format_enum_list[] = {
+	{ 0, "auto" },
+	{ DRM_COLOR_FORMAT_RGB444, "rgb" },
+	{ DRM_COLOR_FORMAT_YCRCB444, "ycbcr444" },
+	{ DRM_COLOR_FORMAT_YCRCB422, "ycbcr422" },
+	{ DRM_COLOR_FORMAT_YCRCB420, "ycbcr420" },
+};
+
 static const struct drm_prop_enum_list drm_active_color_format_enum_list[] = {
 	{ 0, "not applicable" },
 	{ DRM_COLOR_FORMAT_RGB444, "rgb" },
@@ -1220,11 +1228,20 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
  *	Drivers shall use drm_connector_attach_active_bpc_property() to install
  *	this property. A value of 0 means "not applicable".
  *
+ * preferred color format:
+ *	This property is used by userspace to change the used color format. When
+ *	used the driver will use the selected format if valid for the hardware,
+ *	sink, and current resolution and refresh rate combination. Drivers to
+ *	use the function drm_connector_attach_preferred_color_format_property()
+ *	to create and attach the property to the connector during
+ *	initialization. Possible values are "auto", "rgb", "ycbcr444",
+ *	"ycbcr422", and "ycbcr420".
+ *
  * active color format:
  *	This read-only property tells userspace the color format actually used
  *	by the hardware display engine "on the cable" on a connector. The chosen
  *	value depends on hardware capabilities, both display engine and
- *	connected monitor. Drivers shall use
+ *	connected monitor, and the "preferred color format". Drivers shall use
  *	drm_connector_attach_active_color_format_property() to install this
  *	property. Possible values are "not applicable", "rgb", "ycbcr444",
  *	"ycbcr422", and "ycbcr420".
@@ -2237,6 +2254,37 @@ void drm_connector_set_active_bpc_property(struct drm_connector *connector, int
 }
 EXPORT_SYMBOL(drm_connector_set_active_bpc_property);
 
+/**
+ * drm_connector_attach_preferred_color_format_property - attach "preferred color format" property
+ * @connector: connector to attach preferred color format property on.
+ *
+ * This is used to add support for selecting a color format on a connector.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_connector_attach_preferred_color_format_property(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_property *prop;
+
+	if (!connector->preferred_color_format_property) {
+		prop = drm_property_create_enum(dev, 0, "preferred color format",
+						drm_preferred_color_format_enum_list,
+						ARRAY_SIZE(drm_preferred_color_format_enum_list));
+		if (!prop)
+			return -ENOMEM;
+
+		connector->preferred_color_format_property = prop;
+	}
+
+	drm_object_attach_property(&connector->base, prop, 0);
+	connector->state->preferred_color_format = 0;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_attach_preferred_color_format_property);
+
 /**
  * drm_connector_attach_active_color_format_property - attach "active color format" property
  * @connector: connector to attach active color format property on.
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 5ef4bb270f71..0dd7ece375c5 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -799,6 +799,16 @@ struct drm_connector_state {
 	 */
 	u8 max_bpc;
 
+	/**
+	 * preferred_color_format: Property set by userspace to tell the GPU
+	 * driver which color format to use. It only gets applied if hardware,
+	 * meaning both the computer and the monitor, and the driver support the
+	 * given format at the current resolution and refresh rate. Userspace
+	 * can check for (un-)successful application via the "active color
+	 * format" property.
+	 */
+	u32 preferred_color_format;
+
 	/**
 	 * @hdr_output_metadata:
 	 * DRM blob property for HDR output metadata
@@ -1404,6 +1414,12 @@ struct drm_connector {
 	 */
 	struct drm_property *active_bpc_property;
 
+	/**
+	 * @preferred_color_format_property: Default connector property for the
+	 * preferred color format to be driven out of the connector.
+	 */
+	struct drm_property *preferred_color_format_property;
+
 	/**
 	 * @active_color_format_property: Default connector property for the
 	 * active color format to be driven out of the connector.
@@ -1740,6 +1756,7 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 					  int min, int max);
 int drm_connector_attach_active_bpc_property(struct drm_connector *connector, int min, int max);
 void drm_connector_set_active_bpc_property(struct drm_connector *connector, int active_bpc);
+int drm_connector_attach_preferred_color_format_property(struct drm_connector *connector);
 int drm_connector_attach_active_color_format_property(struct drm_connector *connector);
 void drm_connector_set_active_color_format_property(struct drm_connector *connector,
 						    u32 active_color_format);
-- 
2.25.1

