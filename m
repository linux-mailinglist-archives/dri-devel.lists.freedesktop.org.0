Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F5839FE07
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 19:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736E26EC27;
	Tue,  8 Jun 2021 17:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899C46E5C0;
 Tue,  8 Jun 2021 17:43:29 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 15159C800C8;
 Tue,  8 Jun 2021 19:43:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id CP0TZQlnO6WU; Tue,  8 Jun 2021 19:43:26 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (p200300E37f4F60006a44b0068bFE089d.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f4f:6000:6a44:b006:8bfe:89d])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id 9E30FC800C1;
 Tue,  8 Jun 2021 19:43:26 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/7] drm/uAPI: Add "active bpc" as feedback channel for
 "max bpc" drm property
Date: Tue,  8 Jun 2021 19:43:15 +0200
Message-Id: <20210608174320.37429-3-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210608174320.37429-1-wse@tuxedocomputers.com>
References: <20210608174320.37429-1-wse@tuxedocomputers.com>
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

Add a new general drm property "active bpc" which can be used by graphic drivers
to report the applied bit depth per pixel back to userspace.

While "max bpc" can be used to change the color depth, there was no way to check
which one actually got used. While in theory the driver chooses the best/highest
color depth within the max bpc setting a user might not be fully aware what his
hardware is or isn't capable off. This is meant as a quick way to double check
the setup.

In the future, automatic color calibration for screens might also depend on this
information being available.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  2 ++
 drivers/gpu/drm/drm_connector.c   | 41 +++++++++++++++++++++++++++++++
 include/drm/drm_connector.h       | 15 +++++++++++
 3 files changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 268bb69c2e2f..7ae4e40936b5 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -873,6 +873,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		*val = 0;
 	} else if (property == connector->max_bpc_property) {
 		*val = state->max_requested_bpc;
+	} else if (property == connector->active_bpc_property) {
+		*val = state->active_bpc;
 	} else if (connector->funcs->atomic_get_property) {
 		return connector->funcs->atomic_get_property(connector,
 				state, property, val);
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 7631f76e7f34..c0c3c09bfed0 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1195,6 +1195,14 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
  *	drm_connector_attach_max_bpc_property() to create and attach the
  *	property to the connector during initialization.
  *
+ * active bpc:
+ *	This read-only range property tells userspace the pixel color bit depth
+ *	actually used by the hardware display engine on "the cable" on a
+ *	connector. The chosen value depends on hardware capabilities, both
+ *	display engine and connected monitor, and the "max bpc" property.
+ *	Drivers shall use drm_connector_attach_active_bpc_property() to install
+ *	this property.
+ *
  * Connectors also have one standardized atomic property:
  *
  * CRTC_ID:
@@ -2150,6 +2158,39 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
 
+/**
+ * drm_connector_attach_active_bpc_property - attach "active bpc" property
+ * @connector: connector to attach active bpc property on.
+ * @min: The minimum bit depth supported by the connector.
+ * @max: The maximum bit depth supported by the connector.
+ *
+ * This is used to check the applied bit depth on a connector.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_connector_attach_active_bpc_property(struct drm_connector *connector,
+					  int min, int max)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_property *prop;
+
+	prop = connector->active_bpc_property;
+	if (!prop) {
+		prop = drm_property_create_range(dev, 0, "active bpc", min, max);
+		if (!prop)
+			return -ENOMEM;
+
+		connector->active_bpc_property = prop;
+	}
+
+	drm_object_attach_property(&connector->base, prop, 0);
+	connector->state->active_bpc = 0;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_attach_active_bpc_property);
+
 /**
  * drm_connector_set_vrr_capable_property - sets the variable refresh rate
  * capable property for a connector
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 1922b278ffad..c58cba2b6afe 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -781,6 +781,13 @@ struct drm_connector_state {
 	 */
 	u8 max_bpc;
 
+	/**
+	 * @active_bpc: Read only property set by the GPU driver to the actually
+	 * applied bit depth of the pixels after evaluating all hardware
+	 * limitations.
+	 */
+	u8 active_bpc;
+
 	/**
 	 * @hdr_output_metadata:
 	 * DRM blob property for HDR output metadata
@@ -1380,6 +1387,12 @@ struct drm_connector {
 	 */
 	struct drm_property *max_bpc_property;
 
+	/**
+	 * @active_bpc_property: Default connector property for the active bpc
+	 * to be driven out of the connector.
+	 */
+	struct drm_property *active_bpc_property;
+
 #define DRM_CONNECTOR_POLL_HPD (1 << 0)
 #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
 #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
@@ -1698,6 +1711,8 @@ int drm_connector_set_panel_orientation_with_quirk(
 	int width, int height);
 int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 					  int min, int max);
+int drm_connector_attach_active_bpc_property(struct drm_connector *connector,
+					  int min, int max);
 
 /**
  * struct drm_tile_group - Tile group metadata
-- 
2.25.1

