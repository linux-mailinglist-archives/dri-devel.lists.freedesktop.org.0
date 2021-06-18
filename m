Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 473043AC6FF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 11:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6DE6E9CE;
	Fri, 18 Jun 2021 09:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F8D6E9CB;
 Fri, 18 Jun 2021 09:11:41 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id C41DDC800B9;
 Fri, 18 Jun 2021 11:11:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id AkTUCx9Ep20a; Fri, 18 Jun 2021 11:11:39 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (p200300e37f3949001760E5710682cA7E.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f39:4900:1760:e571:682:ca7e])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id 5A169C800B3;
 Fri, 18 Jun 2021 11:11:39 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 09/17] drm/uAPI: Add "active color range" drm property as
 feedback for userspace
Date: Fri, 18 Jun 2021 11:11:08 +0200
Message-Id: <20210618091116.14428-10-wse@tuxedocomputers.com>
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

Add a new general drm property "active color range" which can be used by
graphic drivers to report the used color range back to userspace.

There was no way to check which color range got actually used on a given
monitor. To surely predict this, one must know the exact capabilities of
the monitor and what the default behaviour of the used driver is. This
property helps eliminating the guessing at this point.

In the future, automatic color calibration for screens might also depend on
this information being available.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/gpu/drm/drm_connector.c | 59 +++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h     | 27 +++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 684d7abdf0eb..818de58d972f 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -897,6 +897,12 @@ static const struct drm_prop_enum_list drm_active_color_format_enum_list[] = {
 	{ DRM_COLOR_FORMAT_YCRCB420, "ycbcr420" },
 };
 
+static const struct drm_prop_enum_list drm_active_color_range_enum_list[] = {
+	{ DRM_MODE_COLOR_RANGE_UNSET, "Unknown" },
+	{ DRM_MODE_COLOR_RANGE_FULL, "Full" },
+	{ DRM_MODE_COLOR_RANGE_LIMITED_16_235, "Limited 16:235" },
+};
+
 DRM_ENUM_NAME_FN(drm_get_dp_subconnector_name,
 		 drm_dp_subconnector_enum_list)
 
@@ -1221,6 +1227,14 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
  *	drm_connector_attach_active_color_format_property() to install this
  *	property.
  *
+ * active color range:
+ *	This read-only property tells userspace the color range actually used by
+ *	the hardware display engine on "the cable" on a connector. The chosen
+ *	value depends on hardware capabilities of the monitor and the used color
+ *	format. Drivers shall use
+ *	drm_connector_attach_active_color_range_property() to install this
+ *	property.
+ *
  * Connectors also have one standardized atomic property:
  *
  * CRTC_ID:
@@ -2264,6 +2278,51 @@ void drm_connector_set_active_color_format_property(struct drm_connector *connec
 }
 EXPORT_SYMBOL(drm_connector_set_active_color_format_property);
 
+/**
+ * drm_connector_attach_active_color_range_property - attach "active color range" property
+ * @connector: connector to attach active color range property on.
+ *
+ * This is used to check the applied color range on a connector.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_connector_attach_active_color_range_property(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_property *prop;
+
+	if (!connector->active_color_range_property) {
+		prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE, "active color range",
+						drm_active_color_range_enum_list,
+						ARRAY_SIZE(drm_active_color_range_enum_list));
+		if (!prop)
+			return -ENOMEM;
+
+		connector->active_color_range_property = prop;
+		drm_object_attach_property(&connector->base, prop, DRM_MODE_COLOR_RANGE_UNSET);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_attach_active_color_range_property);
+
+/**
+ * drm_connector_set_active_color_range_property - sets the active color range property for a
+ * connector
+ * @connector: drm connector
+ * @active_color_range: color range for the connector currently active on "the cable"
+ *
+ * Should be used by atomic drivers to update the active color range over a connector.
+ */
+void drm_connector_set_active_color_range_property(struct drm_connector *connector,
+						   enum drm_mode_color_range active_color_range)
+{
+	drm_object_property_set_value(&connector->base, connector->active_color_range_property,
+				      active_color_range);
+}
+EXPORT_SYMBOL(drm_connector_set_active_color_range_property);
+
 /**
  * drm_connector_attach_hdr_output_metadata_property - attach "HDR_OUTPUT_METADA" property
  * @connector: connector to attach the property on.
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8a5197f14e87..9fb7119b7a02 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -648,6 +648,24 @@ struct drm_tv_connector_state {
 	unsigned int hue;
 };
 
+/**
+ * enum drm_mode_color_range - color_range info for &drm_connector
+ *
+ * This enum is used to represent full or limited color range on the display
+ * connector signal.
+ *
+ * @DRM_MODE_COLOR_RANGE_UNSET:		Color range is unspecified/default.
+ * @DRM_MODE_COLOR_RANGE_FULL:		Color range is full range, 0-255 for
+ *					8-Bit color depth.
+ * DRM_MODE_COLOR_RANGE_LIMITED_16_235:	Color range is limited range, 16-235 for
+ *					8-Bit color depth.
+ */
+enum drm_mode_color_range {
+	DRM_MODE_COLOR_RANGE_UNSET,
+	DRM_MODE_COLOR_RANGE_FULL,
+	DRM_MODE_COLOR_RANGE_LIMITED_16_235,
+};
+
 /**
  * struct drm_connector_state - mutable connector state
  */
@@ -1392,6 +1410,12 @@ struct drm_connector {
 	 */
 	struct drm_property *active_color_format_property;
 
+	/**
+	 * @active_color_range_property: Default connector property for the
+	 * active color range to be driven out of the connector.
+	 */
+	struct drm_property *active_color_range_property;
+
 #define DRM_CONNECTOR_POLL_HPD (1 << 0)
 #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
 #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
@@ -1719,6 +1743,9 @@ void drm_connector_set_active_bpc_property(struct drm_connector *connector, int
 int drm_connector_attach_active_color_format_property(struct drm_connector *connector);
 void drm_connector_set_active_color_format_property(struct drm_connector *connector,
 						    u32 active_color_format);
+int drm_connector_attach_active_color_range_property(struct drm_connector *connector);
+void drm_connector_set_active_color_range_property(struct drm_connector *connector,
+						   enum drm_mode_color_range active_color_range);
 
 /**
  * struct drm_tile_group - Tile group metadata
-- 
2.25.1

