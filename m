Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E310CB2510B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 19:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D396010E79A;
	Wed, 13 Aug 2025 17:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=robert.mader@collabora.com header.b="U3r2dEzF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE59F10E79A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 17:06:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755104784; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OCeJ2g9WgiDQ7MYetDboOT52XEzaiZoknHLTlcrnbfqCy3pm2bd6UVaCLthMNqwUYhme5Ry2cSNeVPqGoxkm/z7kbmfmdhnGo4jGOS/biGxFI/RnphGCgVoqDAzMBFs1hXxMn0vzIRuI+bQSqS8QcSpvm4++JsNr1Nc8eK9vtFI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755104784;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=EpKTGfRbNUu2WZc7alMYAL7UJeZj60SMPad2ISkI5pc=; 
 b=MtoJ4jW52nqRPIR2GROi6l8Noh8YGZo6Nw8b218ClXfwvSbCDwGtgH9ngBSdg87Zmt14Bg4IySKUmXW5FA/vsgMs1YZ+h/LdJ7beyob7Xl2ALg2AmBjhLr89YMDClLb/C1SGUuOsWAv391G+y3pVFYMF/Xm2xK/Qqm93mR3vbU8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=robert.mader@collabora.com;
 dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755104784; 
 s=zohomail; d=collabora.com; i=robert.mader@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=EpKTGfRbNUu2WZc7alMYAL7UJeZj60SMPad2ISkI5pc=;
 b=U3r2dEzF2ZmbnPd43nzoY0WXH7BUcW2im5QQpJAkilWxfPZ6wiDrz0V9+75rfWgm
 P3H3LBdvdV8ovCW5FIcoD8DnYnLinRBbUkN7hVktD7M0mkmt37oYDWR4oKzxXUa7vjV
 nZ7d9jcS/zB+C43D4S75SzMs8WSUNuDeZb2LxPic=
Received: by mx.zohomail.com with SMTPS id 1755104782073247.23368479508406;
 Wed, 13 Aug 2025 10:06:22 -0700 (PDT)
From: Robert Mader <robert.mader@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Daniel Stone <daniels@collabora.com>, Melissa Wen <melissa.srw@gmail.com>,
 Maira Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rodrigo Siqueira <siqueira@igalia.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Robert Mader <robert.mader@collabora.com>
Subject: [PATCH v1 1/5] drm: Add WRITEBACK_COLOR_ENCODING and
 WRITEBACK_COLOR_RANGE properties
Date: Wed, 13 Aug 2025 19:05:38 +0200
Message-ID: <20250813170542.331206-2-robert.mader@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813170542.331206-1-robert.mader@collabora.com>
References: <20250813170542.331206-1-robert.mader@collabora.com>
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

Essentially copying the COLOR_ENCODING and COLOR_RANGE plane properties,
reusing the drm_color_encoding and drm_color_range enums. This
allows us to advertise and configure the matrix coefficients and ranges
used to convert between RGB and YCbCr formats and thus helps writeback
connector implementations that want to advertise YCbCr formats.

Signed-off-by: Robert Mader <robert.mader@collabora.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  8 +++
 drivers/gpu/drm/drm_color_mgmt.c  | 90 +++++++++++++++++++++++++++++++
 include/drm/drm_color_mgmt.h      |  7 +++
 include/drm/drm_connector.h       | 17 ++++++
 include/drm/drm_mode_config.h     | 14 +++++
 5 files changed, 136 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index ecc73d52bfae..12379673dea1 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -774,6 +774,10 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 
 		return set_out_fence_for_connector(state->state, connector,
 						   fence_ptr);
+	} else if (property == config->writeback_color_encoding) {
+		state->writeback_color_encoding = val;
+	} else if (property == config->writeback_color_range) {
+		state->writeback_color_range = val;
 	} else if (property == connector->max_bpc_property) {
 		state->max_requested_bpc = val;
 	} else if (property == connector->privacy_screen_sw_state_property) {
@@ -859,6 +863,10 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		*val = 0;
 	} else if (property == config->writeback_out_fence_ptr_property) {
 		*val = 0;
+	} else if (property == config->writeback_color_encoding) {
+		*val = state->writeback_color_encoding;
+	} else if (property == config->writeback_color_range) {
+		*val = state->writeback_color_range;
 	} else if (property == connector->max_bpc_property) {
 		*val = state->max_requested_bpc;
 	} else if (property == connector->privacy_screen_sw_state_property) {
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 37a3270bc3c2..04444c215bf4 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -29,6 +29,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_print.h>
+#include <drm/drm_writeback.h>
 #include <kunit/visibility.h>
 
 #include "drm_crtc_internal.h"
@@ -592,6 +593,95 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
 }
 EXPORT_SYMBOL(drm_plane_create_color_properties);
 
+/**
+ * drm_writeback_create_color_properties - color encoding related writeback connector properties
+ * @wb_connector: writeback connector object
+ * @supported_encodings: bitfield indicating supported color encodings
+ * @supported_ranges: bitfileld indicating supported color ranges
+ * @default_encoding: default color encoding
+ * @default_range: default color range
+ *
+ * Create and attach writeback connector specific WRITEBACK_COLOR_ENCODING and
+ * WRITEBACK_COLOR_RANGE properties to @wb_connector. The supported encodings
+ * and ranges should be provided in supported_encodings and supported_ranges
+ * bitmasks. Each bit set in the bitmask indicates that its number as enum
+ * value is supported.
+ */
+int drm_writeback_create_color_properties(struct drm_writeback_connector *wb_connector,
+					  u32 supported_encodings,
+					  u32 supported_ranges,
+					  enum drm_color_encoding default_encoding,
+					  enum drm_color_range default_range)
+{
+	struct drm_connector *connector = &wb_connector->base;
+	struct drm_device *dev = connector->dev;
+	struct drm_property *prop;
+	struct drm_prop_enum_list enum_list[MAX_T(int, DRM_COLOR_ENCODING_MAX,
+						       DRM_COLOR_RANGE_MAX)];
+	int i, len;
+
+	if (WARN_ON(supported_encodings == 0 ||
+		    (supported_encodings & -BIT(DRM_COLOR_ENCODING_MAX)) != 0 ||
+		    (supported_encodings & BIT(default_encoding)) == 0))
+		return -EINVAL;
+
+	if (WARN_ON(supported_ranges == 0 ||
+		    (supported_ranges & -BIT(DRM_COLOR_RANGE_MAX)) != 0 ||
+		    (supported_ranges & BIT(default_range)) == 0))
+		return -EINVAL;
+
+	if (!dev->mode_config.writeback_color_encoding) {
+		len = 0;
+		for (i = 0; i < DRM_COLOR_ENCODING_MAX; i++) {
+			if ((supported_encodings & BIT(i)) == 0)
+				continue;
+
+			enum_list[len].type = i;
+			enum_list[len].name = color_encoding_name[i];
+			len++;
+		}
+
+		prop = drm_property_create_enum(dev, 0,
+						"WRITEBACK_COLOR_ENCODING",
+						enum_list, len);
+		if (!prop)
+			return -ENOMEM;
+		dev->mode_config.writeback_color_encoding = prop;
+	}
+
+	drm_object_attach_property(&connector->base,
+				   dev->mode_config.writeback_color_encoding,
+				   default_encoding);
+	if (connector->state)
+		connector->state->writeback_color_encoding = default_encoding;
+
+	if (!dev->mode_config.writeback_color_range) {
+		len = 0;
+		for (i = 0; i < DRM_COLOR_RANGE_MAX; i++) {
+			if ((supported_ranges & BIT(i)) == 0)
+				continue;
+
+			enum_list[len].type = i;
+			enum_list[len].name = color_range_name[i];
+			len++;
+		}
+
+		prop = drm_property_create_enum(dev, 0, "WRITEBACK_COLOR_RANGE",
+						enum_list, len);
+		if (!prop)
+			return -ENOMEM;
+		dev->mode_config.writeback_color_range = prop;
+	}
+	drm_object_attach_property(&connector->base,
+				   dev->mode_config.writeback_color_range,
+				   default_range);
+	if (connector->state)
+		connector->state->writeback_color_range = default_range;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_writeback_create_color_properties);
+
 /**
  * drm_color_lut_check - check validity of lookup table
  * @lut: property blob containing LUT to check
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index 6cb577f6dba6..60146e3063fd 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -29,6 +29,7 @@
 
 struct drm_crtc;
 struct drm_plane;
+struct drm_writeback_connector;
 
 /**
  * drm_color_lut_extract - clamp and round LUT entries
@@ -91,6 +92,12 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
 				      enum drm_color_encoding default_encoding,
 				      enum drm_color_range default_range);
 
+int drm_writeback_create_color_properties(struct drm_writeback_connector *wb_connector,
+					  u32 supported_encodings,
+					  u32 supported_ranges,
+					  enum drm_color_encoding default_encoding,
+					  enum drm_color_range default_range);
+
 /**
  * enum drm_color_lut_tests - hw-specific LUT tests to perform
  *
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8f34f4b8183d..178bfbcb13e3 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -28,6 +28,7 @@
 #include <linux/ctype.h>
 #include <linux/hdmi.h>
 #include <linux/notifier.h>
+#include <drm/drm_color_mgmt.h>
 #include <drm/drm_mode_object.h>
 #include <drm/drm_util.h>
 #include <drm/drm_property.h>
@@ -1120,6 +1121,22 @@ struct drm_connector_state {
 	 */
 	struct drm_writeback_job *writeback_job;
 
+	/**
+	 * @writeback_color_encoding:
+	 *
+	 * Color encoding for non RGB formats used by writeback connectors.
+	 * See also: drm_writeback_create_color_properties()
+	 */
+	enum drm_color_encoding writeback_color_encoding;
+
+	/**
+	 * @writeback_color_range:
+	 *
+	 * Color encoding for non RGB formats used by writeback connectors.
+	 * See also: drm_writeback_create_color_properties()
+	 */
+	enum drm_color_range writeback_color_range;
+
 	/**
 	 * @max_requested_bpc: Connector property to limit the maximum bit
 	 * depth of the pixels.
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 2e848b816218..1d2a7cb6d410 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -863,6 +863,20 @@ struct drm_mode_config {
 	 */
 	struct drm_property *writeback_out_fence_ptr_property;
 
+	/**
+	 * @writeback_color_encoding: Optional property for writeback
+	 * connectors, color encoding for non RGB formats.
+	 * See also: drm_writeback_create_color_properties()
+	 */
+	struct drm_property *writeback_color_encoding;
+
+	/**
+	 * @writeback_color_range: Optional property for writeback connectors,
+	 * color range for non RGB formats.
+	 * See also: drm_writeback_create_color_properties()
+	 */
+	struct drm_property *writeback_color_range;
+
 	/**
 	 * @hdr_output_metadata_property: Connector property containing hdr
 	 * metatada. This will be provided by userspace compositors based
-- 
2.50.1

