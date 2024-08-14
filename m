Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02058951D40
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 16:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D290A10E4B1;
	Wed, 14 Aug 2024 14:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GFTHlHcd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C0C10E4AF
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 14:36:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3E191C000F;
 Wed, 14 Aug 2024 14:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723646195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wftNDmHqRzwOoleVY8/nmCBsAAj3VFWoTG4QPHJxvfs=;
 b=GFTHlHcd7RcvU9ksS5f/cbKthq3wc7ML+WTlXSRiqpRQQL8UHiv08qXBG2iG4iXeDerZgo
 askisTm4YR2If0w4SP7OIhs1h28MfVZCXhVJNCReqwArNVuXEKgVXpPLbVULQ4G6xy5RmD
 LX5L1h+hHzb+2cErBU47ZpS+Ivi9UBvJZB5TdZE+OgwF9LcowWRasX1aiB+//Bq+KvIzS/
 SmqnGc7wV4LHhCc5lTcDkdiEgOOxq+HjKrlPyQN3aHZ2KgOiaGhJUmoa5+gpsFtCvjjokc
 FT1j7OAMIoyIM7PCPduZoKeXV6tB41SIYw7IXnaloUOYpRbsnDycthYHUj+Rhg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 16:36:28 +0200
Subject: [PATCH RFC 06/15] drm/vkms: Introduce plane configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-google-remove-crtc-index-from-parameter-v1-6-6e179abf9fd4@bootlin.com>
References: <20240814-google-remove-crtc-index-from-parameter-v1-0-6e179abf9fd4@bootlin.com>
In-Reply-To: <20240814-google-remove-crtc-index-from-parameter-v1-0-6e179abf9fd4@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=10299;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=aB8xMB4+876GsvcKZ9oy6yejZUx8h23D4RX0/e+YEU4=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvMDqBeUn7g4JH1LZAaBa9pbWQpWMEqNUuSdIP
 F8M/ifRFpGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrzA6gAKCRAgrS7GWxAs
 4hujD/9SzbmsaMisWiyw5nmoNFyzb//632QUNDKuf9Kajyo/3WKF8bChPT5PWO1UrCMGjaqaCbt
 dYemH12P3hXYKcP6FlMCbBZBe3Q+UU+nTHOtxsWz8MVgmwiM73oai8ULXtIWFZ74zc4pL2DFoHU
 5L5tjp4D8GfBfJDA3CoJpr/HshXWO79Tc/IoJQgKOXvsM/41OkNZ4T+Yvn2wlZVCfGdL/61Nfag
 65pvbBBjBZWkq2XrLOzqVIUY36hiPSC2ke/dhQciCmpGhH+NPygvz73G33eIOd/feZBGC56PK2F
 vskrs5usz0npM4BMeW9HUagZpwqyFVxoEmeHKOFzVWMygXG32WyTynWvf5je1W2VwPfqmuJFq30
 c92KxQNUKkjRJdQ5PAL/YkfMsM6qKhX3HjXVSJlhM50GbejKj/WjT8IUYuoJDHSEUERnFGz59La
 xFLk02rsgAcfkfAGC6Lq69KnuZxMR1Z3hCd7A7DSg0dR5F0m0XDmL9AANsvzpVpZIrWnFDKm9zo
 w7PO9KalZzH2RDykBBGxknJC/5TUS7s+JSUV7VDuhsxDfy3JRpwDQi/OQoxrGzqoQmNfnavRUE2
 n+86rsiyanKFS6ActgnmY6R63fpNfHACZB+QN5zeqwbo2tpeEsOBisJc8XnaQCPJd3G7Dq8AaYS
 jaCUfNtWr0VxECg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

The current vkms driver only allows the usage of one primary, eight
overlays and one cursor plane. This new configuration structure aims to
make the configuration more flexible.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 90 ++++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/vkms/vkms_config.h | 44 +++++++++++++++++--
 drivers/gpu/drm/vkms/vkms_drv.c    | 33 +++++---------
 drivers/gpu/drm/vkms/vkms_plane.c  |  4 +-
 drivers/gpu/drm/vkms/vkms_plane.h  |  3 +-
 5 files changed, 141 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 27b49a2ad9c8..b1c6160d350f 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -13,32 +13,111 @@ struct vkms_config *vkms_config_create(void)
 	if (!config)
 		return ERR_PTR(-ENOMEM);
 
+	INIT_LIST_HEAD(&config->planes);
+
 	return config;
 }
 
 struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable_overlay,
 					      bool enable_cursor)
 {
+	struct vkms_config_plane *plane;
 	struct vkms_config *vkms_config = vkms_config_create();
 
 	if (IS_ERR(vkms_config))
 		return vkms_config;
 
 	vkms_config->writeback = enable_writeback;
-	vkms_config->overlay = enable_overlay;
-	vkms_config->cursor = enable_cursor;
+
+	plane = vkms_config_create_plane(vkms_config);
+	if (!plane)
+		goto err_alloc;
+
+	plane->type = DRM_PLANE_TYPE_PRIMARY;
+
+	if (enable_overlay) {
+		for (int i = 0; i < NUM_OVERLAY_PLANES; i++) {
+			plane = vkms_config_create_plane(vkms_config);
+			if (!plane)
+				goto err_alloc;
+			plane->type = DRM_PLANE_TYPE_OVERLAY;
+		}
+	}
+	if (enable_cursor) {
+		plane = vkms_config_create_plane(vkms_config);
+		if (!plane)
+			goto err_alloc;
+		plane->type = DRM_PLANE_TYPE_CURSOR;
+	}
 
 	return vkms_config;
+err_alloc:
+	vkms_config_destroy(vkms_config);
+	return ERR_PTR(-ENOMEM);
 }
 
+struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *vkms_config)
+{
+	if (!vkms_config)
+		return NULL;
+
+	struct vkms_config_plane *vkms_config_overlay = kzalloc(sizeof(*vkms_config_overlay),
+								GFP_KERNEL);
+
+	if (!vkms_config_overlay)
+		return NULL;
+
+	vkms_config_overlay->type = DRM_PLANE_TYPE_OVERLAY;
+
+	list_add(&vkms_config_overlay->link, &vkms_config->planes);
+
+	return vkms_config_overlay;
+}
+
+void vkms_config_delete_plane(struct vkms_config_plane *vkms_config_overlay)
+{
+	if (!vkms_config_overlay)
+		return;
+	list_del(&vkms_config_overlay->link);
+	kfree(vkms_config_overlay);
+}
 
 void vkms_config_destroy(struct vkms_config *config)
 {
+	struct vkms_config_plane *vkms_config_plane, *tmp_plane;
+
+	list_for_each_entry_safe(vkms_config_plane, tmp_plane, &config->planes, link) {
+		vkms_config_delete_plane(vkms_config_plane);
+	}
+
 	kfree(config);
 }
 
 bool vkms_config_is_valid(struct vkms_config *config)
 {
+	struct vkms_config_plane *config_plane;
+
+	bool has_cursor = false;
+	bool has_primary = false;
+
+	list_for_each_entry(config_plane, &config->planes, link) {
+		if (config_plane->type == DRM_PLANE_TYPE_PRIMARY) {
+			// Multiple primary planes for only one CRTC
+			if (has_primary)
+				return false;
+			has_primary = true;
+		}
+		if (config_plane->type == DRM_PLANE_TYPE_CURSOR) {
+			// Multiple cursor planes for only one CRTC
+			if (has_cursor)
+				return false;
+			has_cursor = true;
+		}
+	}
+
+	if (!has_primary)
+		return false;
+
 	return true;
 }
 
@@ -47,10 +126,13 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	struct drm_debugfs_entry *entry = m->private;
 	struct drm_device *dev = entry->dev;
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
+	struct vkms_config_plane *config_plane;
 
 	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
-	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
-	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
+	list_for_each_entry(config_plane, &vkmsdev->config->planes, link) {
+		seq_puts(m, "plane:\n");
+		seq_printf(m, "\ttype: %d\n", config_plane->type);
+	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 50c3b021a66b..77c1c3934189 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -10,15 +10,34 @@
  * struct vkms_config - General configuration for VKMS driver
  *
  * @writeback: If true, a writeback buffer can be attached to the CRTC
- * @cursor: If true, a cursor plane is created in the VKMS device
- * @overlay: If true, NUM_OVERLAY_PLANES will be created for the VKMS device
+ * @planes: List of planes configured for this device. They are created by the function
+ *          vkms_config_create_plane().
  * @dev: Used to store the current vkms device. Only set when the device is instancied.
  */
 struct vkms_config {
 	bool writeback;
-	bool cursor;
-	bool overlay;
 	struct vkms_device *dev;
+
+	struct list_head planes;
+};
+
+/**
+ * struct vkms_config_plane
+ *
+ * @link: Link to the others planes
+ * @type: Type of the plane. The creator of configuration needs to ensures that at least one
+ *        plane is primary.
+ * @plane: Internal usage. This pointer should never be considered as valid. It can be used to
+ *         store a temporary reference to a vkms plane during device creation. This pointer is
+ *         not managed by the configuration and must be managed by other means.
+ */
+struct vkms_config_plane {
+	struct list_head link;
+
+	enum drm_plane_type type;
+
+	/* Internal usage */
+	struct vkms_plane *plane;
 };
 
 /**
@@ -42,6 +61,23 @@ void vkms_config_destroy(struct vkms_config *config);
  */
 bool vkms_config_is_valid(struct vkms_config *vkms_config);
 
+/**
+ * vkms_config_create_plane() - Create a plane configuration
+ *
+ * This will allocate and add a new plane to @vkms_config. This plane will have by default the
+ * maximum supported values.
+ * @vkms_config: Configuration where to insert new plane
+ */
+struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *vkms_config);
+
+/**
+ * vkms_config_delete_plane() - Remove a plane configuration and frees its memory
+ *
+ * This will delete a plane configuration from the parent configuration. This will NOT
+ * cleanup and frees the vkms_plane that can be stored in @vkms_config_plane.
+ * @vkms_config_plane: Plane configuration to cleanup
+ */
+void vkms_config_delete_plane(struct vkms_config_plane *vkms_config_plane);
 
 /**
  * vkms_config_alloc_default() - Allocate the configuration for the default device
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index af237daa3c5c..403006a0bb61 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -153,38 +153,27 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
 
 static int vkms_output_init(struct vkms_device *vkmsdev)
 {
+	struct vkms_config_plane *config_plane;
 	struct drm_device *dev = &vkmsdev->drm;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct vkms_crtc *crtc;
 	struct drm_plane *plane;
-	struct vkms_plane *primary, *cursor, *overlay = NULL;
+	struct vkms_plane *primary, *cursor = NULL;
 	int ret;
 	int writeback;
-	unsigned int n;
 
-	/*
-	 * Initialize used plane. One primary plane is required to perform the composition.
-	 *
-	 * The overlay and cursor planes are not mandatory, but can be used to perform complex
-	 * composition.
-	 */
-	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY);
-	if (IS_ERR(primary))
-		return PTR_ERR(primary);
-
-	if (vkmsdev->config->overlay) {
-		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
-			overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY);
-			if (IS_ERR(overlay))
-				return PTR_ERR(overlay);
+	list_for_each_entry(config_plane, &vkmsdev->config->planes, link) {
+		config_plane->plane = vkms_plane_init(vkmsdev, config_plane);
+		if (IS_ERR(config_plane->plane)) {
+			ret = PTR_ERR(config_plane->plane);
+			return ret;
 		}
-	}
 
-	if (vkmsdev->config->cursor) {
-		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
-		if (IS_ERR(cursor))
-			return PTR_ERR(cursor);
+		if (config_plane->type == DRM_PLANE_TYPE_PRIMARY)
+			primary = config_plane->plane;
+		else if (config_plane->type == DRM_PLANE_TYPE_CURSOR)
+			cursor = config_plane->plane;
 	}
 
 	/* [1]: Initialize the crtc component */
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index b5740c27180b..dc9bccf60071 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -223,7 +223,7 @@ static const struct drm_plane_helper_funcs vkms_plane_helper_funcs = {
 };
 
 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-				   enum drm_plane_type type)
+				   struct vkms_config_plane *config)
 {
 	struct drm_device *dev = &vkmsdev->drm;
 	struct vkms_plane *plane;
@@ -231,7 +231,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 0,
 					   &vkms_plane_funcs,
 					   vkms_formats, ARRAY_SIZE(vkms_formats),
-					   NULL, type, NULL);
+					   NULL, config->type, NULL);
 	if (IS_ERR(plane))
 		return plane;
 
diff --git a/drivers/gpu/drm/vkms/vkms_plane.h b/drivers/gpu/drm/vkms/vkms_plane.h
index 95b2428331b8..82049966ee7e 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.h
+++ b/drivers/gpu/drm/vkms/vkms_plane.h
@@ -9,6 +9,7 @@
 #include <linux/iosys-map.h>
 
 #include "vkms_formats.h"
+#include "vkms_config.h"
 
 struct vkms_plane {
 	struct drm_plane base;
@@ -54,7 +55,7 @@ struct vkms_frame_info {
  * @type: type of plane to initialize
  */
 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-				   enum drm_plane_type type);
+				   struct vkms_config_plane *config);
 
 #define drm_plane_state_to_vkms_plane_state(target) \
 	container_of(target, struct vkms_plane_state, base.base)

-- 
2.44.2

