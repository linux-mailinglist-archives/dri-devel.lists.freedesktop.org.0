Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B82AE29D8
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 17:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5618510E2D8;
	Sat, 21 Jun 2025 15:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GL8oPsWB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638F410E2CA;
 Sat, 21 Jun 2025 15:27:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2ADE65C4A20;
 Sat, 21 Jun 2025 15:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E91C4CEEE;
 Sat, 21 Jun 2025 15:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750519626;
 bh=sG5TZxhngPW0nDmYklqGJvycNYW8aLEf5HnneosCj/0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GL8oPsWBNttIPx4wE28ZYfXgP26nXTW6AHAiJQT2J/e5T/UUWb3/CujVNxBxRUp+V
 m9xi3oiVXonuGU+c4gKBx9kNOGm2UlzmBSAIam+nYj2KxfGONZJbB7Mq5TFFl+r1TP
 dudtn1k85maHfo5T6Ni14DlKWGB10FMpReFJXgnNNeorpX72mVY4ASrdvfjbc+vDFY
 AgJFDpkMQ665SzNFK1oK3BpYcu6iC5GeX8qmSA+bk5D12qvh5rctSokBKxfGV0tqN7
 jNn9AW7WLiMAcpXFHk2e+LgXHiEgOVyCgZAgAwr9s/NO6KP1mWYqfH6jcZFFloxSDr
 VwYA4wlNt/PTQ==
From: Mario Limonciello <superm1@kernel.org>
To: amd-gfx@lists.freedesktop.org,
	Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 Sean Paul <seanpaul@google.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v5 1/2] drm: Introduce 'power saving policy' drm property
Date: Sat, 21 Jun 2025 10:26:56 -0500
Message-ID: <20250621152657.1048807-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250621152657.1048807-1-superm1@kernel.org>
References: <20250621152657.1048807-1-superm1@kernel.org>
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

From: Mario Limonciello <mario.limonciello@amd.com>

The `power saving policy` DRM property is an optional property that
can be added to a connector by a driver.

This property is for compositors to indicate intent of policy of
whether a driver can use power saving features that may compromise
the experience intended by the compositor.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5:
 * Add None to the bitmask
---
 drivers/gpu/drm/drm_connector.c | 49 +++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h     |  2 ++
 include/drm/drm_mode_config.h   |  5 ++++
 include/uapi/drm/drm_mode.h     |  9 ++++++
 4 files changed, 65 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 48b08c9611a7b..0ebe5cc14f074 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1170,6 +1170,12 @@ static const struct drm_prop_enum_list drm_scaling_mode_enum_list[] = {
 	{ DRM_MODE_SCALE_ASPECT, "Full aspect" },
 };
 
+static const struct drm_prop_enum_list drm_power_saving_policy_enum_list[] = {
+	{ __builtin_ffs(DRM_MODE_REQUIRE_NONE) - 1, "None" },
+	{ __builtin_ffs(DRM_MODE_REQUIRE_COLOR_ACCURACY) - 1, "Require color accuracy" },
+	{ __builtin_ffs(DRM_MODE_REQUIRE_LOW_LATENCY) - 1, "Require low latency" },
+};
+
 static const struct drm_prop_enum_list drm_aspect_ratio_enum_list[] = {
 	{ DRM_MODE_PICTURE_ASPECT_NONE, "Automatic" },
 	{ DRM_MODE_PICTURE_ASPECT_4_3, "4:3" },
@@ -1760,6 +1766,16 @@ EXPORT_SYMBOL(drm_hdmi_connector_get_output_format_name);
  *
  *	Drivers can set up these properties by calling
  *	drm_mode_create_tv_margin_properties().
+ * power saving policy:
+ *	This property is used to set the power saving policy for the connector.
+ *	This property is populated with a bitmask of optional requirements set
+ *	by the drm master for the drm driver to respect:
+ *	- "Require color accuracy": Disable power saving features that will
+ *	  affect color fidelity.
+ *	  For example: Hardware assisted backlight modulation.
+ *	- "Require low latency": Disable power saving features that will
+ *	  affect latency.
+ *	  For example: Panel self refresh (PSR)
  */
 
 int drm_connector_create_standard_properties(struct drm_device *dev)
@@ -2262,6 +2278,39 @@ int drm_mode_create_scaling_mode_property(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_mode_create_scaling_mode_property);
 
+/**
+ * drm_mode_create_power_saving_policy_property - create power saving policy property
+ * @dev: DRM device
+ * @supported_policies: bitmask of supported power saving policies
+ *
+ * Called by a driver the first time it's needed, must be attached to desired
+ * connectors.
+ *
+ * Returns: %0
+ */
+int drm_mode_create_power_saving_policy_property(struct drm_device *dev,
+						 uint64_t supported_policies)
+{
+	struct drm_property *power_saving;
+
+	if (dev->mode_config.power_saving_policy)
+		return 0;
+	WARN_ON((supported_policies & DRM_MODE_POWER_SAVING_POLICY_ALL) == 0);
+
+	power_saving =
+		drm_property_create_bitmask(dev, 0, "power saving policy",
+					    drm_power_saving_policy_enum_list,
+					    ARRAY_SIZE(drm_power_saving_policy_enum_list),
+					    supported_policies);
+	if (!power_saving)
+		return -ENOMEM;
+
+	dev->mode_config.power_saving_policy = power_saving;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_mode_create_power_saving_policy_property);
+
 /**
  * DOC: Variable refresh properties
  *
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index f13d597370a30..3a990e46237d9 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2408,6 +2408,8 @@ int drm_mode_create_dp_colorspace_property(struct drm_connector *connector,
 					   u32 supported_colorspaces);
 int drm_mode_create_content_type_property(struct drm_device *dev);
 int drm_mode_create_suggested_offset_properties(struct drm_device *dev);
+int drm_mode_create_power_saving_policy_property(struct drm_device *dev,
+						 uint64_t supported_policies);
 
 int drm_connector_set_path_property(struct drm_connector *connector,
 				    const char *path);
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 9e524b51a0018..1a32cc999ffda 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -959,6 +959,11 @@ struct drm_mode_config {
 	 */
 	struct drm_atomic_state *suspend_state;
 
+	/**
+	 * @power_saving_policy: bitmask for power saving policy requests.
+	 */
+	struct drm_property *power_saving_policy;
+
 	const struct drm_mode_config_helper_funcs *helper_private;
 };
 
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index c082810c08a8b..d3d602491343e 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -152,6 +152,15 @@ extern "C" {
 #define DRM_MODE_SCALE_CENTER		2 /* Centered, no scaling */
 #define DRM_MODE_SCALE_ASPECT		3 /* Full screen, preserve aspect */
 
+/* power saving policy options */
+#define DRM_MODE_REQUIRE_NONE		BIT(0)	/* Compositor doesn't require power saving */
+#define DRM_MODE_REQUIRE_COLOR_ACCURACY	BIT(1)	/* Compositor requires color accuracy */
+#define DRM_MODE_REQUIRE_LOW_LATENCY	BIT(2)	/* Compositor requires low latency */
+
+#define DRM_MODE_POWER_SAVING_POLICY_ALL	(DRM_MODE_REQUIRE_NONE |\
+						 DRM_MODE_REQUIRE_COLOR_ACCURACY |\
+						 DRM_MODE_REQUIRE_LOW_LATENCY)
+
 /* Dithering mode options */
 #define DRM_MODE_DITHERING_OFF	0
 #define DRM_MODE_DITHERING_ON	1
-- 
2.43.0

