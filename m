Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBDC9FE9F5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 19:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6E110E569;
	Mon, 30 Dec 2024 18:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QbPcv9/u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E5410E564
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 18:37:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 12275E0008;
 Mon, 30 Dec 2024 18:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1735583869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ayysUxCI3QxbG2xXJ6NotNlHl+ICIEwWLbwBEq1VG2g=;
 b=QbPcv9/urZ5ScriFM8C3EEzexT9xBzjCdh3V0QD8hkLeL3uEeCioOvsb9f1J8ADfMG6Rfy
 peWg5XNH0RWyrXQWGJPqfeJ94bFilAWnbGBqQFTaTjaVogBtdd6nPpdaeTxNFwh21b7goN
 RPT0GuOXvF+0mhLPFPHlT2Ed7P+hI/bKuhLP36+kNiklOPM25aSs2oXRBRjpXKgxeW6Idx
 WudoE3M1wy7qXjNSiWgaSfJYzbIghokilJgIDvUgqyW4I8143A06K9xySNzjwPgh7ZFkt3
 +8yx2Sa/DtB+wjCeJG939Qh5D7+3K+AT5dq+yslktDwEHmjQo1jFqj2seZ2wHA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 30 Dec 2024 19:37:35 +0100
Subject: [PATCH v6 5/8] drm: writeback: Create an helper for
 drm_writeback_connector initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-google-vkms-managed-v6-5-15c7d65cd63b@bootlin.com>
References: <20241230-google-vkms-managed-v6-0-15c7d65cd63b@bootlin.com>
In-Reply-To: <20241230-google-vkms-managed-v6-0-15c7d65cd63b@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5066;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=igHBM8Lvu1AEho0hmFwk0UIKjXQ0jlSxXQhJo6f5/KU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBncuhxszGYl3ngwNKeXJMyxp76jc+JNh/zMwU10
 uYNho+viYCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ3LocQAKCRAgrS7GWxAs
 4t45D/9Pfs6KVaM0DbfIAXWzHU/o5I1LRODc7jct/izUCVLIc+l5J7+zO2mgW5+3/L2huZn515i
 zhiNeXTtPN+0IySicHArC8aLSyYFOYyt5GM6evs1d04nXPr8F8fSFkb3viWG9g0ajbzJZKHg0rL
 o3jdot1GMqA7murh4JwvBkyYPX77pn9di0X2Q3Kd9RiMqY9BZWTCIa30bMWCFhRKTou9MdWyX7R
 4fzF/gwJuNUw9B7R3Pjc7LuvSXy1wa2292lCikD+LsObdbyp2I6yngUgyNVIQN/CkAlaadzC3D1
 RfJRJTgX79YaWuah3FnGIC6l/QEdmiGYFBjVDWDYnO2NwlfWg8X4Rnme1oUOwwyR4NQd2yGcMAu
 uJaiXp7ivXtlqti318jV9rW++9XBSucvMq1gpsa3iH9XQJNaKlLrZ41NuBXtTmaU6rVKzAXZ/3v
 my/Ih2Mj3DbTvOfLUBuGSowSuedj5kGJGv7/OPTXaYzEr+ICUfPDJylMJWJNA+r3FNbiUumH16X
 Jz3DwfDyywUlb1waqJr5Cj6qp7mvT+4V3UUng0rFL0zl8B72qwt+ZMn98R937aQOR+2fkZr3Tv2
 62xwjKdnGxiglBSzrwLgA50Xq1XZFop4tFFr26qbz+YwMEt0IV3IoPA6dQnOSG/8gQNAm3sFLVn
 MfCpCdlbvBj30ZQ==
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

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_writeback.c | 87 +++++++++++++++++++++++++++++------------
 1 file changed, 61 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index c274cba257cde5f4b446df3854974e690c60bf7b..494400b09796d37ed89145da45d5f1e029632de5 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -219,7 +219,6 @@ EXPORT_SYMBOL(drm_writeback_connector_init);
  * @dev: DRM device
  * @wb_connector: Writeback connector to initialize
  * @enc: handle to the already initialized drm encoder
- * @con_funcs: Connector funcs vtable
  * @formats: Array of supported pixel formats for the writeback engine
  * @n_formats: Length of the formats array
  *
@@ -235,41 +234,31 @@ EXPORT_SYMBOL(drm_writeback_connector_init);
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
@@ -292,11 +281,57 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
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

-- 
2.47.1

