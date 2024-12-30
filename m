Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A0C9FE9F2
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 19:37:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A65D10E563;
	Mon, 30 Dec 2024 18:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="BzBe8Ooy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7084E10E28F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 18:37:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB3EEE0007;
 Mon, 30 Dec 2024 18:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1735583867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YvSPUlvikRNTMxKUe5s2PjUplzN1tUly2y/DXFFhOEE=;
 b=BzBe8Ooy/r9oBPAMuVxXhGIGeOlnCDY+66Oca1Sw1ADR1Re8HIGz+qe3JOVY/QSvkiEI7Z
 LpMWRbmsSZPfvcgFapVnHKv5zUKh9uDVDc+69iORNYAf3ek5RoiXWVZtc6UOc/G06fcLc1
 slNV+Ay65tRybTbrPXLsE23Hf6koaG6MMrIYcgaZfEJifgVdsXLgOgMzpp7SVmxXArwLrO
 nFcvnSD0QaeXqCBHBUcJydEIsf+mV9u72nZGhgkY5lbdYc5H4pJ8EQhyD4kx+pbugaMJ8i
 G+RMAMppbCYppQjnksN/f88DI2swXWL3RkBobPMomuKBUkvM1I8Tta6864trBg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 30 Dec 2024 19:37:34 +0100
Subject: [PATCH v6 4/8] drm: writeback: Introduce cleanup function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-google-vkms-managed-v6-4-15c7d65cd63b@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3266;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=RYpxra6SBSlWD2amtxMywRC1WPZn+3zaKBkO/JPwnmc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBncuhxC6MMgqSFomI+ZO8jGiPRc19QWWvowbite
 s9+bmuuDzeJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ3LocQAKCRAgrS7GWxAs
 4tiFEACtNu9Nr3ublR++CZfncAAg++Li29yoy7rYJJGBn05nTtFxeYdsjlr3oN0j23hr06d3CXm
 jyS+LZk0hUn+eWYAhBQZLJQxUAbDQn8jKHDw6m/qjT5FdHtznnArYABGculxpkyV7pw47k0Zd9h
 2+FXQNXUZS9SstsJAUSvmkemT7Wy7/lD8obaGveEWYIBGsP36+hdWZyj1xh6/xyOKbQUvWOOpO8
 y8+D7vA4L2WiplJOkbHIseTmbQX65Gqku3lsleSm4a9PmLAjf76Gbz0vUQ6xv8t6X5MoaQFKaV1
 ouMxRX51CJ29YQ0uulExi90iPvVbdSq02AUWsKB5bW6sRkRtLqBwfztyAn0lAPrDDE6zZakhHyJ
 SnkmDCsdCC5pwVcwBuDIFjO+QRthlhhSm3i60MMMGECD834BAy8QSz2o8PjzaWJms9DjJEWSQza
 n0e78VSlvUgHJqfFsUWWFwaXi+7FaIJr8hGFXdVhtHsd1KNjNsgGfM+L3owM/rXLb/XJpNVJ5IA
 qiCn1dRAOA4Ox7WP0yjjR23Br6ITtiEtpDMsQVaLEm5XEZGktQVSDj8WTleuTuwaNhx2HqgwpHC
 xw5T9bNZhJB9ZvXhKgLORtV8wtaVNE5ApmcrCJL7tZAzpgr2UWZQpc06iejrYA0mz83dDxGDBJL
 mF29MWh2gSLTQRw==
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

Currently there is no cleanup function for writeback connectors. To allows
implementation of drmm variant of writeback connector, create a cleanup
function that can be used to properly remove all the writeback-specific
properties and allocations.

This also introduce an helper to cleanup only the drm_writeback_connector
properties, so it can be used during initialization to cleanup in case of
failure.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_writeback.c | 43 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 33a3c98a962d1ec49ac4b353902036cf74290ae6..c274cba257cde5f4b446df3854974e690c60bf7b 100644
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
@@ -284,6 +301,32 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
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

