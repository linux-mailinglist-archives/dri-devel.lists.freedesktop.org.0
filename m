Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DEFA17C5B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:55:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C91510E562;
	Tue, 21 Jan 2025 10:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GxZwv7SR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC2810E560
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:55:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7CD54000B;
 Tue, 21 Jan 2025 10:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737456938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EZ4+dULwJeZLEDWGar2fFPRnYCtGxTs/GQ44jM9HSvo=;
 b=GxZwv7SRqMSlSIBidrGEocrNihB8C4kI706FuM/CdIM5z3611VCKNpxo823q3JPE+26jCP
 qD4pbQTJxL9fY2IZzjyTp2wU16IBMbeUaROHSJ84HFqPGBrEmV9+x/zUOvBAMQxIzgDUA5
 SDJQvL4TfAeZtszNG8Y5zhsJ+vMxcluibp4a5nypkytSJtgjPG/g2NCfjp1RTfWDr2UExL
 BsTs7HSnL6XbYxQywV36S2Pyqvyrp4QYZNEMlXTutDWbRnGMcUQ8GKu+O0GK04ciuwhrtV
 VEeuG/rjhVIV5JevoETrPUROarkE7zaQ6pmXeuaP3HhtPlkLE8fqp0kEwP9kzQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 11:55:28 +0100
Subject: [PATCH v3 04/16] drm/vkms: Introduce config for plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-google-remove-crtc-index-from-parameter-v3-4-cac00a3c3544@bootlin.com>
References: <20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com>
In-Reply-To: <20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: arthurgrillo@riseup.net, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=11421;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=EkmyO2LSexOkTJzOOyicuZnPgcN7tBbD7ESxmkXrUAk=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj30hAYAZBrKZVxfxqvE8/lqtyPJZy0eqpQ0Pa
 r2pggxNh/iJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ499IQAKCRAgrS7GWxAs
 4kQ6D/9LuRl2K7ZAxkclQV2nJOhZC3bg7/SVcHEXPMUceIerO9ksRyrYOHgZMc4AQavNMPZoxvr
 +nVDeorKPnvaPWzBOSLxB5v9RGcY/JAqqYJJGS1S9+tpa83yxhE7bZSkAGNBvoOBxBO/UM10V3O
 DpCAxnvFxxITPBdLXpA6fAQ6GGMdjRaFItIC/vnc/oRsIkybnggx2h3hUELVfORO0L/ywraZogS
 XnFVhwqqf1ZY0midG8nsdeYvADVozyiHhFZe4WB3tXfHR/RAHTxvxwWiDbRTOAF+XkPtyQb01MY
 EDxRWLFf5H/KqXSsna8itVQ+54wk+aMYWFeDwyRkR81e4gzvRJNkfKuDPlDJ62qwrM5C8rE0YXq
 c8d9l7+ymxLi9VRX8N38AYeAOYE4nZRCnFX0kvbwvsEchqNyc0ZH/hkAafVROI0BEcAVFXLBZpR
 9Szh1ldEzdC0tKbKqUOAUdp1n0zRTEYO3GC6gvbZaPXxq7MIyCk26HeLIBcILjGLItc9dYRipM3
 ggsLsPa00eBEzLJSe3mdrxTBppHp8a/YumwXgn79lNYHIrbM49jVz5G9wo9B21ghaqB4qpMNbl6
 60a8WZdKGXKp0/rgH/g7tel7UV11rFJoWJKwnE7+mNC0FDTQ0m8PWdbqSujosLzKssgCqxi5fBf
 vil4LzCe6X2YP+A==
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
 drivers/gpu/drm/vkms/vkms_config.c | 92 ++++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/vkms/vkms_config.h | 43 +++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_drv.h    |  3 +-
 drivers/gpu/drm/vkms/vkms_output.c | 37 +++++----------
 drivers/gpu/drm/vkms/vkms_plane.c  |  5 ++-
 5 files changed, 145 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index e7c7f46303e8ce4c9de68878668b855ac0fc5d2e..495056ce988ab32738701f00c94c709457aefbd3 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -14,6 +14,8 @@ struct vkms_config *vkms_config_create(void)
 	if (!config)
 		return ERR_PTR(-ENOMEM);
 
+	INIT_LIST_HEAD(&config->planes);
+
 	return config;
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_create);
@@ -21,26 +23,105 @@ EXPORT_SYMBOL_IF_KUNIT(vkms_config_create);
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
+
+err_alloc:
+	vkms_config_destroy(vkms_config);
+	return ERR_PTR(-ENOMEM);
+}
+
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
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_create_plane);
+
+void vkms_config_delete_plane(struct vkms_config_plane *vkms_config_overlay)
+{
+	if (!vkms_config_overlay)
+		return;
+	list_del(&vkms_config_overlay->link);
+	kfree(vkms_config_overlay);
 }
 
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
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy);
 
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
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_is_valid);
@@ -50,10 +131,13 @@ static int vkms_config_show(struct seq_file *m, void *data)
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
index 2afb795586c6924a46dd4ba777bf22a4f51cddda..ac99f1df6d9a17bd7040a1e7a6acce14cd8fd9d0 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -10,8 +10,8 @@
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
@@ -19,6 +19,27 @@ struct vkms_config {
 	bool cursor;
 	bool overlay;
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
@@ -42,6 +63,24 @@ void vkms_config_destroy(struct vkms_config *config);
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
+
 /**
  * vkms_config_alloc_default() - Allocate the configuration for the default device
  * @enable_writeback: Enable the writeback connector for this configuration
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index af7081c940d6c074dc01cf8180556a3d902e386d..1b5add9536f503fe224425b924c14a5217bb09b1 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -190,6 +190,7 @@ struct vkms_output {
 };
 
 struct vkms_config;
+struct vkms_config_plane;
 
 /**
  * struct vkms_device - Description of a VKMS device
@@ -246,7 +247,7 @@ int vkms_output_init(struct vkms_device *vkmsdev);
  * @type: type of plane to initialize
  */
 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-				   enum drm_plane_type type);
+				   struct vkms_config_plane *config);
 
 /* CRC Support */
 const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 78e389d832c16e4dbaccda34fbf3215f34adeadf..cf385f676ef7f45633b4ed69a8047c87fad95dbd 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -31,30 +31,14 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
 
 int vkms_output_init(struct vkms_device *vkmsdev)
 {
+	struct vkms_config_plane *config_plane;
 	struct drm_device *dev = &vkmsdev->drm;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct vkms_output *output;
-	struct vkms_plane *primary, *overlay, *cursor = NULL;
+	struct vkms_plane *primary, *cursor = NULL;
 	int ret;
 	int writeback;
-	unsigned int n;
-
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
-	if (vkmsdev->config->cursor) {
-		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
-		if (IS_ERR(cursor))
-			return PTR_ERR(cursor);
-	}
 
 	output = vkms_crtc_init(dev, &primary->base,
 				cursor ? &cursor->base : NULL);
@@ -63,15 +47,16 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		return PTR_ERR(output);
 	}
 
-	if (vkmsdev->config->overlay) {
-		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
-			overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY);
-			if (IS_ERR(overlay)) {
-				DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
-				return PTR_ERR(overlay);
-			}
-			overlay->base.possible_crtcs = drm_crtc_mask(&output->crtc);
+	list_for_each_entry(config_plane, &vkmsdev->config->planes, link) {
+		config_plane->plane = vkms_plane_init(vkmsdev, config_plane);
+		if (IS_ERR(config_plane->plane)) {
+			ret = PTR_ERR(config_plane->plane);
+			return ret;
 		}
+		if (config_plane->type == DRM_PLANE_TYPE_PRIMARY)
+			primary = config_plane->plane;
+		else if (config_plane->type == DRM_PLANE_TYPE_CURSOR)
+			cursor = config_plane->plane;
 	}
 
 	connector = drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index e2fce471870f1899f2ccb66b339ce8c4332cc287..4663002c9c54030ff6243631a2a1cff26415e7a3 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -11,6 +11,7 @@
 
 #include "vkms_drv.h"
 #include "vkms_formats.h"
+#include "vkms_config.h"
 
 static const u32 vkms_formats[] = {
 	DRM_FORMAT_ARGB8888,
@@ -187,7 +188,7 @@ static const struct drm_plane_helper_funcs vkms_plane_helper_funcs = {
 };
 
 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-				   enum drm_plane_type type)
+				   struct vkms_config_plane *config)
 {
 	struct drm_device *dev = &vkmsdev->drm;
 	struct vkms_plane *plane;
@@ -195,7 +196,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 0,
 					   &vkms_plane_funcs,
 					   vkms_formats, ARRAY_SIZE(vkms_formats),
-					   NULL, type, NULL);
+					   NULL, config->type, NULL);
 	if (IS_ERR(plane))
 		return plane;
 

-- 
2.47.1

