Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A5FA0BE60
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 18:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B944B10E752;
	Mon, 13 Jan 2025 17:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="n2dwnNcX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5594E10E752
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 17:09:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 401B81C0007;
 Mon, 13 Jan 2025 17:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736788156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3fFAivPAfEhXDkpm+SeR8HPURSFxhX7MAYqPXcmPnws=;
 b=n2dwnNcXcfqdhcHBa6Z09GqO8iLDacdP2LtCUsCOEvAnLPiwUn4B4SfF7iw2HreZefyvOh
 E5FKVgXm+hmW2Tv950P9BMzzMLHJH+x5QWqOz8QQ69XMRQ2W6fyiYiY5AB5gDe8C7aaG9m
 1lVMwVqy54AXh4cE7TX0Gml/45XkgueKPm5JykZES+dJMYSx515tIU/8atetDIH5Hq1Mc/
 YPl3QlxFT4bo0BJFnnN/F5o9OY8fXxkrIh6umaG9cHhFpoxPdRTm77TBuJ7OBFjUpazkgJ
 Wr0IkL2/OZpSJD7QNDNFk5AxSw/QzMRxLVbKBvkH88JjGJe7SlKfCxYiRC9FZw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 13 Jan 2025 18:09:05 +0100
Subject: [PATCH v7 4/7] drm: writeback: Create an helper for
 drm_writeback_connector initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-google-vkms-managed-v7-4-4f81d1893e0b@bootlin.com>
References: <20250113-google-vkms-managed-v7-0-4f81d1893e0b@bootlin.com>
In-Reply-To: <20250113-google-vkms-managed-v7-0-4f81d1893e0b@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7775;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=S+aaEPE7quqJ1SgsFAmHeuhq0LZ6o3EObHIoqdnoBeM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnhUi0wlCfCpRSnFqHY1GHrXaQQJtnRsd3jXQWJ
 xtHecU2nneJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4VItAAKCRAgrS7GWxAs
 4q1qEACYJdUHxfdhvXbE3KYz13X7H0LzzXGlfCk9MBsEiykcqrV6+huXvRXXHDsX3XanVKDil2I
 1Pa1a0dHmPYtUbYsUIUPrTGZA8ZzBO6IV4uRZSjL4TPrqqGbxirmYY38GVnQBpbMzxtSNJHuaTZ
 8KdK2jd/8N5d/ua3P9YfVPT2rVmCPe0r88ieqKyacZIyzC6Z0RwrcfWvQgVhGrKX+hF0bew/Tgf
 KlET4Wgz0wDXXuYBlEvGWIwDhJxB6a0yYoyTdT9lM2b2XRVjc0d4XetvvWFyBIs7EfZvrpy2JNl
 MLe38Ryl3yP6Rt97KObrIZhmqYN5poFrikksiFTFVbXHkh027F2aq71R2yiDH1cwUPB2H13e6bf
 lbCELzpv/yxwG9HNF3jdRj9rOYxkBp7/jJDTAz58BGoAXW1eSZXkHdIggxG+Xli/yEkGHrkPgOv
 RqC7Qp3S/xpw1HMTDurmDzR28DUR4uNCLFEobO1P2io/UBYXCYTTehqdICgbr69xIn5ZYzhWn2B
 sY2eLsqHT8YbLdgrw0jRVOLOmoXttcOatzz4jL7seJ+BWS7d/Mb7/77s7UgPLESCxJ/KzGeTdhU
 qIhMMbWemYEbab2USk8qJTxy+EF+vO5G3JMGB3c3Su7ktqy5yYkcFNAT978BiZz0yeEy77JqtA8
 up8fgDSBpm6hOqg==
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

