Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD63B998E6D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 19:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3314810E982;
	Thu, 10 Oct 2024 17:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="opO4nTxc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC72610E9A1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 17:39:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B57866000B;
 Thu, 10 Oct 2024 17:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728581953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uulKexxJGHrNqQbD6J55BuE9kpqXCUt7e8QIhWgR1zw=;
 b=opO4nTxcrFg6mFxsEL+h0RjBS2YP0+BUeY9lIBOTJX/MbJQ3SM0MwfPLmM8EXXCZvPKjka
 aijsYFB5Yj1KyMNz8w6WOMVlLntlrjuqazOfrnmMV5IM+ijMmGqbfnNB7qRd9905w3BwWN
 ontzzDnLfeEIYYg8gm4dOXNVYkiTcco+qmyd75qghSRDj0tMMnVc6w+Zlcz2ZEefuc3VkU
 J0b/EVjaylwgARmMoUxZUw1EaLf57paYUZCuCmrSpoun+ioh4AVHKUgfX7si2qy3SeFGGS
 6vTx8tCYqQfyvskSTZXkMnZpjCbtxLYYayAUig3gsMl44J+yRMb+BawdOBr51Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 10 Oct 2024 19:39:06 +0200
Subject: [PATCH v4 4/5] drm: writeback: Introduce drm managed helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-google-vkms-managed-v4-4-ed04a62ad2e3@bootlin.com>
References: <20241010-google-vkms-managed-v4-0-ed04a62ad2e3@bootlin.com>
In-Reply-To: <20241010-google-vkms-managed-v4-0-ed04a62ad2e3@bootlin.com>
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
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 20241010-vkms-remove-index-v2-1-6b8d6cfd5a15@bootlin.com
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=12723;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=DW23xxSf+0mXMZrgd4Jt7AGKmvSdNKpue3JAG78VBvo=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnCBE7evbkwvBhEnasoy+yA2lOc5xQieTCNML9q
 gfpPmYGO1yJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZwgROwAKCRAgrS7GWxAs
 4lOREADWVcgpm5NvhVkLT8m3vKeOmHLKLZ92AWk7g2qPlnbP98F8D9f1zkouYaAPRRwS1Wmlpi/
 5svdprR7Ydia/wK/PjxN5YNl31i9V2ibwHyLs7GAfKDVFFhydPQw7Coa+kycCxZkdiHrfQ5h6JX
 4VwgnOKg3gQ9hu6qpxQSu2CSGXUyfsLaeRjOPCHsLI++bKnOQFW52oNcNuiktPkITBDSniGikoH
 K2gBQND2HeIpZsjmBVrYOrKimuKHWIHumxvev5m3qMaxfeogE+xJVxN8GCTwwV5hKROIE3yv6KG
 5dXGYjq3Sfm4TgWl7n/HSSVYTwduWwdshJLI5qDN+FlaUlwYXwVR5L4SQgxnDJd6cnsLk5/MxcZ
 LLfpvJe11v0fI3Uf/tTxK2DGR66xRq95yK4FKLHcY22TQG3luqW+w2trew2xKIpo2EhZrjrajOe
 eoA7SC5EDnr4Km9TsycHdvEt9etz/qDtCtvl42tgxKMcaa/DuyIAdJLsIjid45PXpCDfP11W92R
 m9mfx6308m5NKNXTS2+jHTBbyUKTuzZZyiX9Y4FKt4+Ru4cspO08siEj3//82Qb9omwl5kb9sj8
 8s4n8AZC/nigI4Ca8uKHqy+GKei/CtWZd/Jf72chntTpOEN6jT6KqOXCKQA0h27m6kBAVODrZy9
 f3Lc61VLC9uAgQw==
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

Currently drm_writeback_connector are created by
drm_writeback_connector_init or drm_writeback_connector_init_with_encoder.
Both of the function uses drm_connector_init and drm_encoder_init, but
there is no way to properly clean those structure from outside. By using
drm managed variants, we can ensure that the writeback connector is
properly cleaned.

This patch introduce drmm_writeback_connector_init, an helper to initialize
a writeback connector using drm managed helpers. This function allows the
caller to use its own encoder.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_connector.c |   4 +
 drivers/gpu/drm/drm_writeback.c | 224 ++++++++++++++++++++++++++++++++++------
 include/drm/drm_writeback.h     |  10 ++
 3 files changed, 208 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index fc35f47e2849..fe4c1967860a 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -613,6 +613,7 @@ static void drm_mode_remove(struct drm_connector *connector,
 	drm_mode_destroy(connector->dev, mode);
 }
 
+void drm_writeback_connector_cleanup(struct drm_device *dev, void *data);
 /**
  * drm_connector_cleanup - cleans up an initialised connector
  * @connector: connector to cleanup
@@ -631,6 +632,9 @@ void drm_connector_cleanup(struct drm_connector *connector)
 		    DRM_CONNECTOR_REGISTERED))
 		drm_connector_unregister(connector);
 
+	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
+		drm_writeback_connector_cleanup(dev, connector);
+
 	if (connector->privacy_screen) {
 		drm_privacy_screen_put(connector->privacy_screen);
 		connector->privacy_screen = NULL;
diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 33a3c98a962d..28f299ce8e10 100644
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
@@ -196,13 +197,12 @@ int drm_writeback_connector_init(struct drm_device *dev,
 EXPORT_SYMBOL(drm_writeback_connector_init);
 
 /**
- * drm_writeback_connector_init_with_encoder - Initialize a writeback connector with
- * a custom encoder
+ * __drm_writeback_connector_init - Common initialization code for writeback
+ * connector
  *
  * @dev: DRM device
  * @wb_connector: Writeback connector to initialize
  * @enc: handle to the already initialized drm encoder
- * @con_funcs: Connector funcs vtable
  * @formats: Array of supported pixel formats for the writeback engine
  * @n_formats: Length of the formats array
  *
@@ -218,41 +218,32 @@ EXPORT_SYMBOL(drm_writeback_connector_init);
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
+					  struct drm_encoder *enc,
+					  const u32 *formats, int n_formats)
 {
-	struct drm_property_blob *blob;
 	struct drm_connector *connector = &wb_connector->base;
 	struct drm_mode_config *config = &dev->mode_config;
-	int ret = create_writeback_properties(dev);
-
-	if (ret != 0)
-		return ret;
-
-	blob = drm_property_create_blob(dev, n_formats * sizeof(*formats),
-					formats);
-	if (IS_ERR(blob))
-		return PTR_ERR(blob);
-
+	struct drm_property_blob *blob;
+	int ret;
 
 	connector->interlace_allowed = 0;
 
-	ret = drm_connector_init(dev, connector, con_funcs,
-				 DRM_MODE_CONNECTOR_WRITEBACK);
+	ret = create_writeback_properties(dev);
 	if (ret)
-		goto connector_fail;
+		return ret;
 
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
@@ -275,15 +266,188 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
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
+ * @data: Opaque pointer to the connector
+ *
+ * This will decrement the reference counter of blobs and it will clean the
+ * remaining jobs in this writeback connector.
+ */
+void drm_writeback_connector_cleanup(struct drm_device *dev, void *data)
+{
+	struct drm_connector *connector = data;
+	struct drm_writeback_connector *wb_connector = container_of(connector,
+								    struct drm_writeback_connector,
+								    base);
+	unsigned long flags;
+	struct drm_writeback_job *pos, *n;
+
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
+/**
+ * __drmm_writeback_connector_init - Initialize a writeback connector with
+ * a custom encoder
+ *
+ * @dev: DRM device
+ * @wb_connector: Writeback connector to initialize
+ * @con_funcs: Connector funcs vtable
+ * @enc: handle to the already initialized drm encoder
+ * @formats: Array of supported pixel formats for the writeback engine
+ * @n_formats: Length of the formats array
+ *
+ * This function initialize a writeback connector and register its cleanup.
+ * It uses the common helper @__drm_writeback_connector_init to do the
+ * general initialization.
+ *
+ * This function assumes that @enc has already been created and initialized
+ * before invoking this function.
+ *
+ * In addition, this function also assumes that callers of this API will manage
+ * assigning the encoder helper functions, possible_crtcs and any other encoder
+ * specific operation.
+ *
+ * Returns: 0 on success, or a negative error code
+ */
+static int __drmm_writeback_connector_init(struct drm_device *dev,
+					   struct drm_writeback_connector *wb_connector,
+					   const struct drm_connector_funcs *con_funcs,
+					   struct drm_encoder *enc,
+					   const u32 *formats, int n_formats)
+{
+	struct drm_connector *connector = &wb_connector->base;
+	int ret;
+
+	ret = drmm_connector_init(dev, connector, con_funcs,
+				  DRM_MODE_CONNECTOR_WRITEBACK, NULL);
+	if (ret)
+		return ret;
+
+	ret = __drm_writeback_connector_init(dev, wb_connector, enc, formats,
+					     n_formats);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * drmm_writeback_connector_init - Initialize a writeback connector with
+ * a custom encoder
+ *
+ * @dev: DRM device
+ * @wb_connector: Writeback connector to initialize
+ * @con_funcs: Connector funcs vtable
+ * @enc: handle to the already initialized drm encoder, optional
+ * @enc_funcs: Encoder funcs vtable, optional, only used when @enc is NULL
+ * @formats: Array of supported pixel formats for the writeback engine
+ * @n_formats: Length of the formats array
+ * @possible_crtcs: if @enc is NULL, this will set the possible_crtc for the
+ *		    newly created encoder
+ *
+ * This function initialize a writeback connector and register its cleanup.
+ *
+ * This function creates the writeback-connector-specific properties if they
+ * have not been already created, initializes the connector as
+ * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
+ * values.
+ *
+ * If @enc is NULL, this function will create a drm-managed encoder and will
+ * attach @enc_funcs on it. It will also attach the CRTC passed in
+ * @possible_crtcs
+ *
+ * Returns: 0 on success, or a negative error code
+ */
+int drmm_writeback_connector_init(struct drm_device *dev,
+				  struct drm_writeback_connector *wb_connector,
+				  const struct drm_connector_funcs *con_funcs,
+				  struct drm_encoder *enc,
+				  const struct drm_encoder_helper_funcs *enc_funcs,
+				  const u32 *formats, int n_formats,
+				  u32 possible_crtcs)
+{
+	int ret;
+
+	if (!enc) {
+		ret = drmm_encoder_init(dev, &wb_connector->encoder,
+					NULL, DRM_MODE_ENCODER_VIRTUAL, NULL);
+		if (ret)
+			return ret;
+
+		enc = &wb_connector->encoder;
+		enc->possible_crtcs |= possible_crtcs;
+		if (enc_funcs)
+			drm_encoder_helper_add(enc, enc_funcs);
+	}
+
+	return __drmm_writeback_connector_init(dev, wb_connector, con_funcs,
+					       &wb_connector->encoder, formats,
+					       n_formats);
+}
+EXPORT_SYMBOL(drmm_writeback_connector_init);
+
 int drm_writeback_set_fb(struct drm_connector_state *conn_state,
 			 struct drm_framebuffer *fb)
 {
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 17e576c80169..5e5ff8dd9d9d 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -161,6 +161,14 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
 				const struct drm_connector_funcs *con_funcs, const u32 *formats,
 				int n_formats);
 
+int drmm_writeback_connector_init(struct drm_device *dev,
+				  struct drm_writeback_connector *wb_connector,
+				  const struct drm_connector_funcs *con_funcs,
+				  struct drm_encoder *enc,
+				  const struct drm_encoder_helper_funcs *enc_funcs,
+				  const u32 *formats, int n_formats,
+				  u32 possible_crtcs);
+
 int drm_writeback_set_fb(struct drm_connector_state *conn_state,
 			 struct drm_framebuffer *fb);
 
@@ -175,6 +183,8 @@ void
 drm_writeback_signal_completion(struct drm_writeback_connector *wb_connector,
 				int status);
 
+void drm_writeback_connector_cleanup(struct drm_device *dev, void *data);
+
 struct dma_fence *
 drm_writeback_get_out_fence(struct drm_writeback_connector *wb_connector);
 #endif

-- 
2.46.2

