Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6922E16C1CC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 14:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8AE6EAB7;
	Tue, 25 Feb 2020 13:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4E96E8F0;
 Tue, 25 Feb 2020 13:11:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2F9DEB19D;
 Tue, 25 Feb 2020 13:11:03 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, alexander.deucher@amd.com, emil.velikov@collabora.com
Subject: [PATCH v3 1/4] drm/simple-kms: Add drm_simple_encoder_{init, create}()
Date: Tue, 25 Feb 2020 14:10:52 +0100
Message-Id: <20200225131055.27550-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200225131055.27550-1-tzimmermann@suse.de>
References: <20200225131055.27550-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: spice-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch makes the internal encoder implementation of the simple
KMS helpers available to drivers.

These simple-encoder helpers initialize an encoder with an empty
implementation. This covers the requirements of most of the existing
DRM drivers. A call to drm_simple_encoder_create() allocates and
initializes an encoder instance, a call to drm_simple_encoder_init()
initializes a pre-allocated instance.

v3:
	* remove drm_simple_encoder_create(); not required yet
	* provide more precise documentation
v2:
	* move simple encoder to KMS helpers
	* remove name argument; simplifies implementation
	* don't allocate with devm_ interfaces; unsafe with DRM

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_simple_kms_helper.c | 34 ++++++++++++++++++++++---
 include/drm/drm_simple_kms_helper.h     |  4 +++
 2 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 15fb516ae2d8..04309e4660de 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -26,12 +26,41 @@
  * entity. Some flexibility for code reuse is provided through a separately
  * allocated &drm_connector object and supporting optional &drm_bridge
  * encoder drivers.
+ *
+ * Many drivers require only a very simple encoder that fulfills the minimum
+ * requirements of the display pipeline and does not add additional
+ * functionality. The function drm_simple_encoder_init() provides an
+ * implementation of such an encoder.
  */
 
-static const struct drm_encoder_funcs drm_simple_kms_encoder_funcs = {
+static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanup = {
 	.destroy = drm_encoder_cleanup,
 };
 
+/**
+ * drm_simple_encoder_init - Initialize a preallocated encoder
+ * @dev: drm device
+ * @funcs: callbacks for this encoder
+ * @encoder_type: user visible type of the encoder
+ *
+ * Initialises a preallocated encoder that has no further functionality.
+ * Settings for possible CRTC and clones are left to their initial values.
+ * The encoder will be cleaned up automatically as part of the mode-setting
+ * cleanup.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_simple_encoder_init(struct drm_device *dev,
+			    struct drm_encoder *encoder,
+			    int encoder_type)
+{
+	return drm_encoder_init(dev, encoder,
+				&drm_simple_encoder_funcs_cleanup,
+				encoder_type, NULL);
+}
+EXPORT_SYMBOL(drm_simple_encoder_init);
+
 static enum drm_mode_status
 drm_simple_kms_crtc_mode_valid(struct drm_crtc *crtc,
 			       const struct drm_display_mode *mode)
@@ -288,8 +317,7 @@ int drm_simple_display_pipe_init(struct drm_device *dev,
 		return ret;
 
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
-	ret = drm_encoder_init(dev, encoder, &drm_simple_kms_encoder_funcs,
-			       DRM_MODE_ENCODER_NONE, NULL);
+	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_NONE);
 	if (ret || !connector)
 		return ret;
 
diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
index e253ba7bea9d..a026375464ff 100644
--- a/include/drm/drm_simple_kms_helper.h
+++ b/include/drm/drm_simple_kms_helper.h
@@ -181,4 +181,8 @@ int drm_simple_display_pipe_init(struct drm_device *dev,
 			const uint64_t *format_modifiers,
 			struct drm_connector *connector);
 
+int drm_simple_encoder_init(struct drm_device *dev,
+			    struct drm_encoder *encoder,
+			    int encoder_type);
+
 #endif /* __LINUX_DRM_SIMPLE_KMS_HELPER_H */
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
