Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2E4CF9815
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 18:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FEB10E526;
	Tue,  6 Jan 2026 17:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JgdkgiG2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C9910E523;
 Tue,  6 Jan 2026 17:00:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1590E44108;
 Tue,  6 Jan 2026 17:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65535C116C6;
 Tue,  6 Jan 2026 17:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767718827;
 bh=JYq6TpTIphRVa5r6UzRdSQs3+p55ehzuEvjAzfj2kzU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JgdkgiG2QY9R7AxGcykVl9/0iyr0bnY4KT5eyOeIgCU2a531DQgGV3ThQ+nAokgWb
 5geZmyAZUnP9ALJAqTU8gMsKXtJIpWZrSRab9QU0OSp9hs3GWN0cTormDGLB+Chg86
 aisuaf0NLBb+B5MjhGMuY2goiXYIlL2NMrUaKHinWYWtwHofniRCXqIGXIAmsuK2BI
 kqSvG9oTdbZYu2ChWRj/RRXhN5qzNQB7FaNy43MWpcZdGZe2KVefYPnJhx8CuW4aRk
 1UG01eVWje91jRVNJ+J/T55NpHxjzpAR5ojSZRoueYAsp4mdxC2a2VlBqOmSGBIeoG
 hw4y+kMN8cwyw==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, harry.wentland@amd.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [PATCH 1/2] drm/connector: Add a new 'panel_type' property
Date: Tue,  6 Jan 2026 11:00:16 -0600
Message-ID: <20260106170017.68158-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106170017.68158-1-superm1@kernel.org>
References: <20260106170017.68158-1-superm1@kernel.org>
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

If the driver can make an assertion whether a connected panel is an OLED
panel or not then it can attach a property to the connector that userspace
can use as a hint for color schemes.

Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/gpu/drm/drm_connector.c | 33 +++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h     |  1 +
 include/drm/drm_mode_config.h   |  4 ++++
 include/uapi/drm/drm_mode.h     |  4 ++++
 4 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 4d6dc9ebfdb5b..7d5279c366583 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1167,6 +1167,11 @@ static const struct drm_prop_enum_list drm_link_status_enum_list[] = {
 	{ DRM_MODE_LINK_STATUS_BAD, "Bad" },
 };
 
+static const struct drm_prop_enum_list drm_panel_type_enum_list[] = {
+	{ DRM_MODE_PANEL_TYPE_UNKNOWN, "unknown" },
+	{ DRM_MODE_PANEL_TYPE_OLED, "OLED" },
+};
+
 /**
  * drm_display_info_set_bus_formats - set the supported bus formats
  * @info: display info to store bus formats in
@@ -1495,6 +1500,9 @@ EXPORT_SYMBOL(drm_hdmi_connector_get_output_format_name);
  * 	Summarizing: Only set "DPMS" when the connector is known to be enabled,
  * 	assume that a successful SETCONFIG call also sets "DPMS" to on, and
  * 	never read back the value of "DPMS" because it can be incorrect.
+ * panel_type:
+ * 	Immutable enum property to indicate the type of connected panel.
+ * 	Possible values are "unknown" (default) and "OLED".
  * PATH:
  * 	Connector path property to identify how this sink is physically
  * 	connected. Used by DP MST. This should be set by calling
@@ -1845,6 +1853,13 @@ int drm_connector_create_standard_properties(struct drm_device *dev)
 		return -ENOMEM;
 	dev->mode_config.link_status_property = prop;
 
+	prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE, "panel_type",
+					drm_panel_type_enum_list,
+					ARRAY_SIZE(drm_panel_type_enum_list));
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.panel_type_property = prop;
+
 	prop = drm_property_create_bool(dev, DRM_MODE_PROP_IMMUTABLE, "non-desktop");
 	if (!prop)
 		return -ENOMEM;
@@ -3620,3 +3635,21 @@ struct drm_tile_group *drm_mode_create_tile_group(struct drm_device *dev,
 	return tg;
 }
 EXPORT_SYMBOL(drm_mode_create_tile_group);
+
+/**
+ * drm_connector_attach_panel_type_property - attaches panel type property
+ * @connector: connector to attach the property on.
+ *
+ * This is used to add support for panel type detection.
+ */
+void drm_connector_attach_panel_type_property(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_property *prop = dev->mode_config.panel_type_property;
+
+	if (!prop)
+		return;
+
+	drm_object_attach_property(&connector->base, prop, DRM_MODE_PANEL_TYPE_UNKNOWN);
+}
+EXPORT_SYMBOL(drm_connector_attach_panel_type_property);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8f34f4b8183d8..bd460a6d0d052 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2448,6 +2448,7 @@ int drm_connector_attach_scaling_mode_property(struct drm_connector *connector,
 					       u32 scaling_mode_mask);
 int drm_connector_attach_vrr_capable_property(
 		struct drm_connector *connector);
+void drm_connector_attach_panel_type_property(struct drm_connector *connector);
 int drm_connector_attach_broadcast_rgb_property(struct drm_connector *connector);
 int drm_connector_attach_colorspace_property(struct drm_connector *connector);
 int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *connector);
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 895fb820dba07..5e1dd0cfccde2 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -600,6 +600,10 @@ struct drm_mode_config {
 	 * multiple CRTCs.
 	 */
 	struct drm_property *tile_property;
+	/**
+	 * @panel_type_property: Default connector property for panel type
+	 */
+	struct drm_property *panel_type_property;
 	/**
 	 * @link_status_property: Default connector property for link status
 	 * of a connector
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index cbbbfc1dfe2b8..3693d82b5279f 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -166,6 +166,10 @@ extern "C" {
 #define DRM_MODE_LINK_STATUS_GOOD	0
 #define DRM_MODE_LINK_STATUS_BAD	1
 
+/* Panel type property */
+#define DRM_MODE_PANEL_TYPE_UNKNOWN	0
+#define DRM_MODE_PANEL_TYPE_OLED	1
+
 /*
  * DRM_MODE_ROTATE_<degrees>
  *
-- 
2.43.0

