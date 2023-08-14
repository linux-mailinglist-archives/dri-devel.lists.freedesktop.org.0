Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBED77BAAD
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 15:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B91D10E206;
	Mon, 14 Aug 2023 13:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F0E10E201
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 13:56:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4976061202;
 Mon, 14 Aug 2023 13:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB09C433C7;
 Mon, 14 Aug 2023 13:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692021394;
 bh=KCNRKYbOYvcCK2lDhLtKnqx5BWVVyZgtzNzIZsf31hw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=oLanxg81h8wzxSFfjiMBt1yoiSu8YSvc9srjoFWe0LfBiHGqoHmhc5pKZ3SopmXuF
 r91joWrWfmZmsdkZjrPNFOi6MA0MsgGMHDruwZlS3PZ6ZvsfsjY7VsHx6XM2U+WY0e
 iHx+csgQTr51bFy8mbt056mEhbfU1qRPjwAwm15cOIz7N8iSu5dLO/y5tOUwJbTZg8
 o/980R/wAJ5kZ0OV2JxU4nyaRFhZ6ippQc7nVfPYz0vCMyrJgbL9NcW8C6Hykq5KWW
 hh/IPz1YUUNUvxpoulM8FhO81PTt2qDHdCC3ppdngbyA7uMpNTICbNM0oaAqUqlCGt
 wTl545/ZmlGkQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 14 Aug 2023 15:56:15 +0200
Subject: [PATCH RFC 03/13] drm/connector: hdmi: Add Broadcast RGB property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230814-kms-hdmi-connector-state-v1-3-048054df3654@kernel.org>
References: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
In-Reply-To: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11678; i=mripard@kernel.org;
 h=from:subject:message-id; bh=KCNRKYbOYvcCK2lDhLtKnqx5BWVVyZgtzNzIZsf31hw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCm3jNreOuz1d1po68Ete/mWSVJyx+dD610/LE+x7rj4J
 tfk03H9jlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEykzpaR4ckiEdmovKn7Vj36
 1HFh7eXNzJOf9cSUPtWadyCb/6DRrAWMDC/FeDOW/1Q/YrDmW5/1HXNhm4i1GSa7ll3Z82fmzb7
 3v/kA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The i915 driver has a property to force the RGB range of an HDMI output.
The vc4 driver then implemented the same property with the same
semantics. KWin has support for it, and a PR for mutter is also there to
support it.

Both drivers implementing the same property with the same semantics,
plus the userspace having support for it, is proof enough that it's
pretty much a de-facto standard now and we can provide helpers for it.

Let's plumb it into the newly created HDMI connector.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_hdmi_connector.c | 167 +++++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h          |  49 ++++++++++
 2 files changed, 216 insertions(+)

diff --git a/drivers/gpu/drm/drm_hdmi_connector.c b/drivers/gpu/drm/drm_hdmi_connector.c
index ff825c053b27..2b6b9d444774 100644
--- a/drivers/gpu/drm/drm_hdmi_connector.c
+++ b/drivers/gpu/drm/drm_hdmi_connector.c
@@ -1,8 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0+
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
 #include <drm/drm_mode.h>
+#include <drm/drm_print.h>
 
 #include <linux/export.h>
 
@@ -21,6 +24,8 @@ void __drm_atomic_helper_hdmi_connector_reset(struct drm_hdmi_connector *hdmi_co
 	struct drm_connector *connector = &hdmi_connector->base;
 
 	__drm_atomic_helper_connector_reset(connector, &new_hdmi_state->base);
+
+	new_hdmi_state->broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_hdmi_connector_reset);
 
@@ -68,7 +73,11 @@ __drm_atomic_helper_hdmi_connector_duplicate_state(struct drm_hdmi_connector *hd
 						   struct drm_hdmi_connector_state *new_hdmi_state)
 {
 	struct drm_connector *connector = &hdmi_connector->base;
+	struct drm_connector_state *old_state = connector->state;
+	struct drm_hdmi_connector_state *old_hdmi_state =
+		connector_state_to_hdmi_connector_state(old_state);
 
+	new_hdmi_state->broadcast_rgb = old_hdmi_state->broadcast_rgb;
 	__drm_atomic_helper_connector_duplicate_state(connector, &new_hdmi_state->base);
 }
 EXPORT_SYMBOL(__drm_atomic_helper_hdmi_connector_duplicate_state);
@@ -136,6 +145,143 @@ void drm_atomic_helper_hdmi_connector_destroy_state(struct drm_connector *connec
 }
 EXPORT_SYMBOL(drm_atomic_helper_hdmi_connector_destroy_state);
 
+/**
+ * drm_atomic_helper_hdmi_connector_get_property() - Reads out HDMI connector properties
+ * @connector: the parent connector this state refers to
+ * @state: the parent connector state to destroy
+ * @property: Property instance being queried
+ * @val: Raw value of the property to read into
+ *
+ * Read out a @drm_connector_state property value.
+ *
+ * This helper is meant to be the default
+ * &drm_connector_funcs.atomic_get_property implementation for
+ * @drm_hdmi_connector.
+ */
+int drm_atomic_helper_hdmi_connector_get_property(struct drm_connector *connector,
+						  const struct drm_connector_state *state,
+						  struct drm_property *property,
+						  uint64_t *val)
+{
+	const struct drm_hdmi_connector *hdmi_connector =
+		connector_to_hdmi_connector(connector);
+	const struct drm_hdmi_connector_state *hdmi_state =
+		connector_state_to_hdmi_connector_state(state);
+	struct drm_device *drm = connector->dev;
+
+	if (property == hdmi_connector->broadcast_rgb_property) {
+		*val = hdmi_state->broadcast_rgb;
+	} else {
+		drm_dbg(drm, "Unknown property [PROP:%d:%s]\n",
+			property->base.id, property->name);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_helper_hdmi_connector_get_property);
+
+/**
+ * drm_atomic_helper_hdmi_connector_set_property() - Decodes HDMI connector properties
+ * @connector: the parent connector this state refers to
+ * @state: the parent connector state to destroy
+ * @property: Property instance being queried
+ * @val: Raw value of the property to decode
+ *
+ * Decodes a property into an @drm_connector_state.
+ *
+ * This helper is meant to be the default
+ * &drm_connector_funcs.atomic_set_property implementation for
+ * @drm_hdmi_connector.
+ */
+int drm_atomic_helper_hdmi_connector_set_property(struct drm_connector *connector,
+						  struct drm_connector_state *state,
+						  struct drm_property *property,
+						  uint64_t val)
+{
+	const struct drm_hdmi_connector *hdmi_connector =
+		connector_to_hdmi_connector(connector);
+	struct drm_hdmi_connector_state *hdmi_state =
+		connector_state_to_hdmi_connector_state(state);
+	struct drm_device *drm = connector->dev;
+
+	if (property == hdmi_connector->broadcast_rgb_property) {
+		hdmi_state->broadcast_rgb = val;
+	} else {
+		drm_dbg(drm, "Unknown property [PROP:%d:%s]\n",
+			property->base.id, property->name);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_helper_hdmi_connector_set_property);
+
+/**
+ * drm_atomic_helper_hdmi_connector_atomic_check() - Helper to check HDMI connector atomic state
+ * @connector: the parent connector this state refers to
+ * @state: the parent connector state to check
+ *
+ * Provides a default connector state check handler for HDMI connectors.
+ * Checks that a desired connector update is valid, and updates various
+ * fields of derived state.
+ *
+ * Drivers that subclass @drm_hdmi_connector_state may still wish to
+ * call this function to avoid duplication of error checking code.
+ *
+ * RETURNS:
+ * Zero on success, or an errno code otherwise.
+ */
+int drm_atomic_helper_hdmi_connector_atomic_check(struct drm_connector *connector,
+						  struct drm_atomic_state *state)
+{
+	struct drm_connector_state *old_state =
+		drm_atomic_get_old_connector_state(state, connector);
+	struct drm_hdmi_connector_state *old_hdmi_state =
+		connector_state_to_hdmi_connector_state(old_state);
+	struct drm_connector_state *new_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	struct drm_hdmi_connector_state *new_hdmi_state =
+		connector_state_to_hdmi_connector_state(new_state);
+
+	if (old_hdmi_state->broadcast_rgb != new_hdmi_state->broadcast_rgb) {
+		struct drm_crtc *crtc = new_state->crtc;
+		struct drm_crtc_state *crtc_state;
+
+		crtc_state = drm_atomic_get_crtc_state(state, crtc);
+		if (IS_ERR(crtc_state))
+			return PTR_ERR(crtc_state);
+
+		crtc_state->mode_changed = true;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_helper_hdmi_connector_atomic_check);
+
+static const struct drm_prop_enum_list broadcast_rgb_names[] = {
+	{ DRM_HDMI_BROADCAST_RGB_AUTO, "Automatic" },
+	{ DRM_HDMI_BROADCAST_RGB_FULL, "Full" },
+	{ DRM_HDMI_BROADCAST_RGB_LIMITED, "Limited 16:235" },
+};
+
+/*
+ * drm_hdmi_connector_get_broadcast_rgb_name - Return a string for HDMI connector RGB broadcast selection
+ * @broadcast_rgb: Broadcast RGB selection to compute name of
+ *
+ * Returns: the name of the Broadcast RGB selection, or NULL if the type
+ * is not valid.
+ */
+const char *
+drm_hdmi_connector_get_broadcast_rgb_name(enum drm_hdmi_broadcast_rgb broadcast_rgb)
+{
+	if (broadcast_rgb > DRM_HDMI_BROADCAST_RGB_LIMITED)
+		return NULL;
+
+	return broadcast_rgb_names[broadcast_rgb].name;
+}
+EXPORT_SYMBOL(drm_hdmi_connector_get_broadcast_rgb_name);
+
 /**
  * drm_atomic_helper_hdmi_connector_print_state - Prints a @drm_hdmi_connector_state
  * @p: output printer
@@ -147,6 +293,11 @@ EXPORT_SYMBOL(drm_atomic_helper_hdmi_connector_destroy_state);
 void drm_atomic_helper_hdmi_connector_print_state(struct drm_printer *p,
 						  const struct drm_connector_state *state)
 {
+	const struct drm_hdmi_connector_state *hdmi_state =
+		connector_state_to_hdmi_connector_state(state);
+
+	drm_printf(p, "\tbroadcast_rgb=%s\n",
+		   drm_hdmi_connector_get_broadcast_rgb_name(hdmi_state->broadcast_rgb));
 }
 EXPORT_SYMBOL(drm_atomic_helper_hdmi_connector_print_state);
 
@@ -175,6 +326,7 @@ int drmm_hdmi_connector_init(struct drm_device *dev,
 			     struct i2c_adapter *ddc)
 {
 	struct drm_connector *connector = &hdmi_connector->base;
+	struct drm_property *prop;
 	int ret;
 
 	if (connector_type != DRM_MODE_CONNECTOR_HDMIA ||
@@ -185,6 +337,21 @@ int drmm_hdmi_connector_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	prop = hdmi_connector->broadcast_rgb_property;
+	if (!prop) {
+		prop = drm_property_create_enum(dev, DRM_MODE_PROP_ENUM,
+						"Broadcast RGB",
+						broadcast_rgb_names,
+						ARRAY_SIZE(broadcast_rgb_names));
+		if (!prop)
+			return -EINVAL;
+
+		hdmi_connector->broadcast_rgb_property = prop;
+	}
+
+	drm_object_attach_property(&connector->base, prop,
+				   DRM_HDMI_BROADCAST_RGB_AUTO);
+
 	return 0;
 }
 EXPORT_SYMBOL(drmm_hdmi_connector_init);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 0aa662e0a6ea..24a0d33e5148 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2042,11 +2042,44 @@ void drm_connector_attach_privacy_screen_provider(
 	struct drm_connector *connector, struct drm_privacy_screen *priv);
 void drm_connector_update_privacy_screen(const struct drm_connector_state *connector_state);
 
+/**
+ * enum drm_hdmi_broadcast_rgb - Broadcast RGB Selection for a @drm_hdmi_connector
+ *
+ * This enum is used to track broadcast RGB selection. There are no
+ * separate #defines for the uapi!
+ */
+enum drm_hdmi_broadcast_rgb {
+	/**
+	 * @DRM_HDMI_BROADCAST_RGB_AUTO: The RGB range is selected
+	 * automatically based on the mode.
+	 */
+	DRM_HDMI_BROADCAST_RGB_AUTO,
+
+	/**
+	 * @DRM_HDMI_BROADCAST_RGB_FULL: Full range RGB is forced.
+	 */
+	DRM_HDMI_BROADCAST_RGB_FULL,
+
+	/**
+	 * @DRM_HDMI_BROADCAST_RGB_FULL: Limited range RGB is forced.
+	 */
+	DRM_HDMI_BROADCAST_RGB_LIMITED,
+};
+
+const char *
+drm_hdmi_connector_get_broadcast_rgb_name(enum drm_hdmi_broadcast_rgb broadcast_rgb);
+
 struct drm_hdmi_connector_state {
 	/**
 	 * @base: Base Connector State
 	 */
 	struct drm_connector_state base;
+
+	/**
+	 * @broadcast_rgb: Connector property to pass the Broadcast RGB
+	 * selection value.
+	 */
+	enum drm_hdmi_broadcast_rgb broadcast_rgb;
 };
 
 #define connector_state_to_hdmi_connector_state(state) \
@@ -2065,6 +2098,16 @@ drm_atomic_helper_hdmi_connector_duplicate_state(struct drm_connector *connector
 void __drm_atomic_helper_hdmi_connector_destroy_state(struct drm_hdmi_connector_state *hdmi_state);
 void drm_atomic_helper_hdmi_connector_destroy_state(struct drm_connector *connector,
 						    struct drm_connector_state *state);
+int drm_atomic_helper_hdmi_connector_get_property(struct drm_connector *connector,
+						  const struct drm_connector_state *state,
+						  struct drm_property *property,
+						  uint64_t *val);
+int drm_atomic_helper_hdmi_connector_set_property(struct drm_connector *connector,
+						  struct drm_connector_state *state,
+						  struct drm_property *property,
+						  uint64_t val);
+int drm_atomic_helper_hdmi_connector_atomic_check(struct drm_connector *connector,
+						  struct drm_atomic_state *state);
 void drm_atomic_helper_hdmi_connector_print_state(struct drm_printer *p,
 						  const struct drm_connector_state *state);
 
@@ -2073,6 +2116,12 @@ struct drm_hdmi_connector {
 	 * @base: Base Connector
 	 */
 	struct drm_connector base;
+
+	/**
+	 * @broadcast_rgb_property: Connector property to set the
+	 * Broadcast RGB selection to output with.
+	 */
+	struct drm_property *broadcast_rgb_property;
 };
 
 #define connector_to_hdmi_connector(connector) \

-- 
2.41.0

