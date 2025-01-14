Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A912AA10886
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 15:06:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47EB10E34C;
	Tue, 14 Jan 2025 14:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Bz2iqpqC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA90910E339
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 14:06:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C155AC0005;
 Tue, 14 Jan 2025 14:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736863564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zFn/AUjca2i/hEoIKuKtcikCZTCexwHwYcjZ+DE5iiY=;
 b=Bz2iqpqCL5xcdQHqVebYGq/qeNaw1gmz/0fK39pTrVqhTb6jR3d4QGdVfWMbWluymO4aqf
 5UQ2QSjH4ZznyY6sgmxiMXpRrKHOwhbue0pVBRkA54iKggekS80btOsygBTjDIlgErr2dT
 8t7XNSBmsjt7jHMopczesMtI9LR7xx3Adpzm8zJI79aBOzav7cqLYz792c+wSgppLkvddj
 wNqmq2Ho1vs2grwYkkQ1UfL7CPxe5/meaogAhmqu1aEBc5jfa6QW+8m/Hf/vdzzNdslc+r
 KpYEti3GfOFjrVCcZGXVcEPAUQx3VewUpwePYpahFeBeg4oquBLRtkPhxRCCpg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 14 Jan 2025 15:05:47 +0100
Subject: [PATCH v8 5/8] drm: writeback: Create an helper for
 drm_writeback_connector initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-google-vkms-managed-v8-5-da4254aa3dd5@bootlin.com>
References: <20250114-google-vkms-managed-v8-0-da4254aa3dd5@bootlin.com>
In-Reply-To: <20250114-google-vkms-managed-v8-0-da4254aa3dd5@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7826;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=gsmJl13spfiswdVF2RXlYUxPQmEp1gEYwbGWt1PCqJU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnhm9F4k2ZtrjpCa2xOTuKow7XvBQPS/fY4MY40
 Wn6JzE5m/6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4ZvRQAKCRAgrS7GWxAs
 4t+3D/kBIAj4VKic4nfA7wEZJfJEZqjdCVuNFWjJ4wORwWt+UmrMTFFXNXcKGE7sG7y+6LydcSY
 uTWaUATJUZLYriVuqVMXTs2BvLCZOgDlpKHxQTdKIph7s1mpDQnxqzJDoohWGDDyKU/tn7mPJgf
 VSwhkhv8DG1090/sIIOpCeDZB7pZpmVRuEZ1zBhwY1udVJ4ANVYvyGmtYTgVplk75/VhPJDfQCJ
 fqzVhw99NFnoOhABkoFUzdUI/s9dRJANYUvNqtaY8HrLc/sst/TFyP2l6c87N6JnXYVL0Xq4j0F
 frOYAKYUv/ackg3vwKXKh3Fjyb1bMVK2F0hWLmpS+gB2YvqOuiJK1Tr5Vm0QItRHTI+xoGpSTLR
 nPlTn3WmZhV/W9Xq/owp12hsGOcaRAZC+cbMo0N1y5xbCDuqy2Vg6MjVxxZ+vBWywKdL2CzQr3G
 fcSvqpzKZzYZRrHHzpxNyjUPI+fCJ788McsleDTg7zcOBC5krN5fynfUTxyXsYZo226FARhm6p6
 1FIdzcShQVH1K3Dv1l8cqAPOZlZ7WlWkG85nxdhJKE4zAZR/S2Ox6+RemqGXppRokqr/xLrgdT9
 /4eWgcSaGMjaV2Z99ZJqJ6vBsRKtcSb1Ei7U/dXQScndfNROjKyH494XDmGITwOWW48pQS/2ar9
 XMtFZjYN/14x3vg==
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

As the old drm and the new drmm variants of drm_writeback_connector
requires almost the same initialization, create an internal helper to do
most of the initialization work.

Currently there is no cleanup function for writeback connectors. To allows
implementation of drmm variant of writeback connector, create a cleanup
function that can be used to properly remove all the writeback-specific
properties and allocations.

This also introduce an helper to cleanup only the drm_writeback_connector
properties, so it can be used during initialization to cleanup in case of
failure.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_writeback.c | 130 ++++++++++++++++++++++++++++++++--------
 1 file changed, 104 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 33a3c98a962d1ec49ac4b353902036cf74290ae6..494400b09796d37ed89145da45d5f1e029632de5 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -15,6 +15,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_property.h>
 #include <drm/drm_writeback.h>
@@ -140,6 +141,22 @@ static int create_writeback_properties(struct drm_device *dev)
 	return 0;
 }
 
+static void delete_writeback_properties(struct drm_device *dev)
+{
+	if (dev->mode_config.writeback_pixel_formats_property) {
+		drm_property_destroy(dev, dev->mode_config.writeback_pixel_formats_property);
+		dev->mode_config.writeback_pixel_formats_property = NULL;
+	}
+	if (dev->mode_config.writeback_out_fence_ptr_property) {
+		drm_property_destroy(dev, dev->mode_config.writeback_out_fence_ptr_property);
+		dev->mode_config.writeback_out_fence_ptr_property = NULL;
+	}
+	if (dev->mode_config.writeback_fb_id_property) {
+		drm_property_destroy(dev, dev->mode_config.writeback_fb_id_property);
+		dev->mode_config.writeback_fb_id_property = NULL;
+	}
+}
+
 static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
@@ -202,7 +219,6 @@ EXPORT_SYMBOL(drm_writeback_connector_init);
  * @dev: DRM device
  * @wb_connector: Writeback connector to initialize
  * @enc: handle to the already initialized drm encoder
- * @con_funcs: Connector funcs vtable
  * @formats: Array of supported pixel formats for the writeback engine
  * @n_formats: Length of the formats array
  *
@@ -218,41 +234,31 @@ EXPORT_SYMBOL(drm_writeback_connector_init);
  * assigning the encoder helper functions, possible_crtcs and any other encoder
  * specific operation.
  *
- * Drivers should always use this function instead of drm_connector_init() to
- * set up writeback connectors if they want to manage themselves the lifetime of the
- * associated encoder.
- *
  * Returns: 0 on success, or a negative error code
  */
-int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
-		struct drm_writeback_connector *wb_connector, struct drm_encoder *enc,
-		const struct drm_connector_funcs *con_funcs, const u32 *formats,
-		int n_formats)
+static int __drm_writeback_connector_init(struct drm_device *dev,
+					  struct drm_writeback_connector *wb_connector,
+					  struct drm_encoder *enc, const u32 *formats,
+					  int n_formats)
 {
-	struct drm_property_blob *blob;
 	struct drm_connector *connector = &wb_connector->base;
 	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_property_blob *blob;
 	int ret = create_writeback_properties(dev);
 
 	if (ret != 0)
 		return ret;
 
-	blob = drm_property_create_blob(dev, n_formats * sizeof(*formats),
-					formats);
-	if (IS_ERR(blob))
-		return PTR_ERR(blob);
-
-
 	connector->interlace_allowed = 0;
 
-	ret = drm_connector_init(dev, connector, con_funcs,
-				 DRM_MODE_CONNECTOR_WRITEBACK);
-	if (ret)
-		goto connector_fail;
-
 	ret = drm_connector_attach_encoder(connector, enc);
 	if (ret)
-		goto attach_fail;
+		return ret;
+
+	blob = drm_property_create_blob(dev, n_formats * sizeof(*formats),
+					formats);
+	if (IS_ERR(blob))
+		return PTR_ERR(blob);
 
 	INIT_LIST_HEAD(&wb_connector->job_queue);
 	spin_lock_init(&wb_connector->job_lock);
@@ -275,15 +281,87 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
 	wb_connector->pixel_formats_blob_ptr = blob;
 
 	return 0;
+}
+
+/**
+ * drm_writeback_connector_init_with_encoder - Initialize a writeback connector with
+ * a custom encoder
+ *
+ * @dev: DRM device
+ * @wb_connector: Writeback connector to initialize
+ * @enc: handle to the already initialized drm encoder
+ * @con_funcs: Connector funcs vtable
+ * @formats: Array of supported pixel formats for the writeback engine
+ * @n_formats: Length of the formats array
+ *
+ * This function creates the writeback-connector-specific properties if they
+ * have not been already created, initializes the connector as
+ * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
+ * values.
+ *
+ * This function assumes that the drm_writeback_connector's encoder has already been
+ * created and initialized before invoking this function.
+ *
+ * In addition, this function also assumes that callers of this API will manage
+ * assigning the encoder helper functions, possible_crtcs and any other encoder
+ * specific operation.
+ *
+ * Drivers should always use this function instead of drm_connector_init() to
+ * set up writeback connectors if they want to manage themselves the lifetime of the
+ * associated encoder.
+ *
+ * Returns: 0 on success, or a negative error code
+ */
+int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
+					      struct drm_writeback_connector *wb_connector,
+					      struct drm_encoder *enc,
+					      const struct drm_connector_funcs *con_funcs,
+					      const u32 *formats, int n_formats)
+{
+	struct drm_property_blob *blob;
+	struct drm_connector *connector = &wb_connector->base;
+	int ret;
+
+	ret = drm_connector_init(dev, connector, con_funcs,
+				 DRM_MODE_CONNECTOR_WRITEBACK);
+	if (ret)
+		return ret;
+
+	ret = __drm_writeback_connector_init(dev, wb_connector, enc, formats,
+					     n_formats);
+	if (ret)
+		drm_connector_cleanup(connector);
 
-attach_fail:
-	drm_connector_cleanup(connector);
-connector_fail:
-	drm_property_blob_put(blob);
 	return ret;
 }
 EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
 
+/**
+ * drm_writeback_connector_cleanup - Cleanup the writeback connector
+ * @dev: DRM device
+ * @wb_connector: Pointer to the writeback connector to clean up
+ *
+ * This will decrement the reference counter of blobs and destroy properties. It
+ * will also clean the remaining jobs in this writeback connector. Caution: This helper will not
+ * clean up the attached encoder and the drm_connector.
+ */
+static void drm_writeback_connector_cleanup(struct drm_device *dev,
+					    struct drm_writeback_connector *wb_connector)
+{
+	unsigned long flags;
+	struct drm_writeback_job *pos, *n;
+
+	delete_writeback_properties(dev);
+	drm_property_blob_put(wb_connector->pixel_formats_blob_ptr);
+
+	spin_lock_irqsave(&wb_connector->job_lock, flags);
+	list_for_each_entry_safe(pos, n, &wb_connector->job_queue, list_entry) {
+		drm_writeback_cleanup_job(pos);
+		list_del(&pos->list_entry);
+	}
+	spin_unlock_irqrestore(&wb_connector->job_lock, flags);
+}
+
 int drm_writeback_set_fb(struct drm_connector_state *conn_state,
 			 struct drm_framebuffer *fb)
 {

-- 
2.47.1

