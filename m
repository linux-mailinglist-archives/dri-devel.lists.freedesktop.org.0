Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CBEA14135
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 18:50:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A270710E9E9;
	Thu, 16 Jan 2025 17:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="M4+60L9P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9A310E9F2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 17:50:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C996A60006;
 Thu, 16 Jan 2025 17:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737049827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xGMThEXJyZ+d+iwtuQquS99V1avAz1XNEQGo/PruKpM=;
 b=M4+60L9PwYJmXj4ml4lAIGZ+MdLvn1dfa1FFnW9/rvmbO3gHOn6cegcg/fv0gnyHDg019J
 7XCPcnkev8Z0RjWQn2X7hhApWS8xO1KTFAnkPS7s9VHBc93tkhOORhyLwlM5B+O0EuRVwd
 GyXqtGI3ONQ8RxRUKig+2HrJFt5n9q+Xvgm6BbTd5W4pAauvhbOogL89L7l3DeZrBs5DQs
 bTx/F/aTMdcsLlX6/TMvGYt9oBeOGSak+gL20iPwsj68OTAJMOiKH0RxlQ9CoBgVtceG9x
 dEFGPPt2Zr44fELnf7kNeUKlWA328V7wrdY4uS/sZGDqPRDQccylucaVOJiZgQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 16 Jan 2025 18:47:17 +0100
Subject: [PATCH v9 5/8] drm: writeback: Create an helper for
 drm_writeback_connector initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-google-vkms-managed-v9-5-3e4ae1bd05a0@bootlin.com>
References: <20250116-google-vkms-managed-v9-0-3e4ae1bd05a0@bootlin.com>
In-Reply-To: <20250116-google-vkms-managed-v9-0-3e4ae1bd05a0@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5799;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=cXIU764ot4bU0T4DzE8iziA3oXxZ5ElbpDMdOw7WjSA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBniUbbjCOQapYzucx3hL3NAx+ANT2ck1U/x1f9H
 Sh8zFa688qJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4lG2wAKCRAgrS7GWxAs
 4oyJEACt+TggbkhNtHOtJGjJ5gzIw8jZLL4GBPU/QymiuPVUHGw5PbnIdqwNzBjikn5eyluZZb6
 o53LhPJJ9jxD111o68zDl2Jyq1upMKObhGPIDgK5L8LccX3NKvg4yEe5hbQYhTpBnoxd0aklWFy
 DFi3o09JxlFo1fotxXJINNLyKl47/pGusKTIJuxDE/j8VsebvD0LxAl1C4FyqN5DXW/uAJKrZ81
 27ttx84Hy2udF5wiVMUBgVy3biaPxggb8r8WPaTxR/Ba7Lj37hCwHuTjP/OPjJV8SPB4eSC76jw
 Iy+g/NVwtYXPgwGAPWMoFxsAaU0DJ7MEkbwT7sqS7bdVbmAjODdxJEFvYEx4UqFf0FOgF+9KmjG
 ExNyt0pyKvUq3mDNtFwbi5jpYelsAabE0QRtDameFz0Ekyb7pojt98QZdeHB2O6JBuLq/h1Mqw1
 MK0+YzJBWL5vdtMLooOAwN4Bhj6BDKj6OQgUlfJbAQV/3s1bgA66t4M1oYffQhMO0wmGeHhOI4l
 oOjxG5EDt3VnK2Yq+FUt4ZKkfKi1jyKx6GS8exIncMuSw6iE5OK59TJ0Km++d36Uy1neodQquRl
 cvy2QLkwLyZdapIsB+/47YHzf4mWwSL4skEDl34HsMd+sRmSJKE+Wo2LsU3r1yP7AIuKIqKSoFD
 IvYiOzJi4Tg7a9A==
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
 drivers/gpu/drm/drm_writeback.c | 87 +++++++++++++++++++++++++++++------------
 1 file changed, 61 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 33a3c98a962d1ec49ac4b353902036cf74290ae6..057af96dafeb879534a695167ad16e8a4e9a1bce 100644
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
@@ -202,7 +203,6 @@ EXPORT_SYMBOL(drm_writeback_connector_init);
  * @dev: DRM device
  * @wb_connector: Writeback connector to initialize
  * @enc: handle to the already initialized drm encoder
- * @con_funcs: Connector funcs vtable
  * @formats: Array of supported pixel formats for the writeback engine
  * @n_formats: Length of the formats array
  *
@@ -218,41 +218,31 @@ EXPORT_SYMBOL(drm_writeback_connector_init);
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
@@ -275,11 +265,56 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
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

-- 
2.47.1

