Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5CC3B85FA
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 17:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C916EA0D;
	Wed, 30 Jun 2021 15:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5263B6EA09;
 Wed, 30 Jun 2021 15:10:26 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 062E0C8008A;
 Wed, 30 Jun 2021 17:10:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id eSXm553aiS_l; Wed, 30 Jun 2021 17:10:24 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (p200300e37F394900095779a208783f8e.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f39:4900:957:79a2:878:3f8e])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id 92BFDC8007C;
 Wed, 30 Jun 2021 17:10:24 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, emil.l.velikov@gmail.com
Subject: [PATCH v5 03/17] drm/uAPI: Add "active bpc" as feedback channel for
 "max bpc" drm property
Date: Wed, 30 Jun 2021 17:10:04 +0200
Message-Id: <20210630151018.330354-4-wse@tuxedocomputers.com>
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

Add a new general drm property "active bpc" which can be used by graphic
drivers to report the applied bit depth per pixel color back to userspace.

While "max bpc" can be used to change the color depth, there was no way to
check which one actually got used. While in theory the driver chooses the
best/highest color depth within the max bpc setting a user might not be
fully aware what his hardware is or isn't capable off. This is meant as a
quick way to double check the setup.

In the future, automatic color calibration for screens might also depend on
this information being available.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/gpu/drm/drm_connector.c | 53 +++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h     |  8 +++++
 2 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index da39e7ff6965..6461d00e8e49 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1197,6 +1197,15 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
  *	drm_connector_attach_max_bpc_property() to create and attach the
  *	property to the connector during initialization.
  *
+ * active bpc:
+ *	This read-only range property tells userspace the pixel color bit depth
+ *	actually used by the hardware display engine "on the cable" on a
+ *	connector. This means after display stream compression and dithering
+ *	done by the GPU. The chosen value depends on hardware capabilities, both
+ *	display engine and connected monitor, and the "max bpc" property.
+ *	Drivers shall use drm_connector_attach_active_bpc_property() to install
+ *	this property. A value of 0 means "not applicable".
+ *
  * Connectors also have one standardized atomic property:
  *
  * CRTC_ID:
@@ -2152,6 +2161,50 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
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
+int drm_connector_attach_active_bpc_property(struct drm_connector *connector, int min, int max)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_property *prop;
+
+	if (!connector->active_bpc_property) {
+		prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE, "active bpc",
+						 min, max);
+		if (!prop)
+			return -ENOMEM;
+
+		connector->active_bpc_property = prop;
+	}
+
+	drm_object_attach_property(&connector->base, prop, 0);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_attach_active_bpc_property);
+
+/**
+ * drm_connector_set_active_bpc_property - sets the active bits per color property for a connector
+ * @connector: drm connector
+ * @active_bpc: bits per color for the connector currently active "on the cable"
+ *
+ * Should be used by atomic drivers to update the active bits per color over a connector.
+ */
+void drm_connector_set_active_bpc_property(struct drm_connector *connector, int active_bpc)
+{
+	drm_object_property_set_value(&connector->base, connector->active_bpc_property, active_bpc);
+}
+EXPORT_SYMBOL(drm_connector_set_active_bpc_property);
+
 /**
  * drm_connector_attach_hdr_output_metadata_property - attach "HDR_OUTPUT_METADA" property
  * @connector: connector to attach the property on.
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 714d1a01c065..eee86de62a5f 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1380,6 +1380,12 @@ struct drm_connector {
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
@@ -1702,6 +1708,8 @@ int drm_connector_set_panel_orientation_with_quirk(
 	int width, int height);
 int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 					  int min, int max);
+int drm_connector_attach_active_bpc_property(struct drm_connector *connector, int min, int max);
+void drm_connector_set_active_bpc_property(struct drm_connector *connector, int active_bpc);
 
 /**
  * struct drm_tile_group - Tile group metadata
-- 
2.25.1

