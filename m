Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C928A2D5FE7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 16:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4813E6EA95;
	Thu, 10 Dec 2020 15:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED9996E3F5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 15:39:05 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1knO24-00020b-Fu; Thu, 10 Dec 2020 16:39:04 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 03/19] drm/simple_kms_helper: add
 drmm_simple_encoder_alloc()
Date: Thu, 10 Dec 2020 16:38:29 +0100
Message-Id: <20201210153845.12176-4-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210153845.12176-1-p.zabel@pengutronix.de>
References: <20201210153845.12176-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an alternative to drm_simple_encoder_init() that allocates and
initializes a simple encoder and registers drm_encoder_cleanup() with
drmm_add_action_or_reset().

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
Changes since v4:
 - address FIXME in drm_simple_encoder_init() documentation by pointing
   out drmm_simple_encoder_alloc()
---
 drivers/gpu/drm/drm_simple_kms_helper.c | 14 ++++++++++++--
 include/drm/drm_simple_kms_helper.h     | 24 ++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 743e57c1b44f..6ce8f5cd1eb5 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -9,6 +9,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -55,8 +56,9 @@ static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanup = {
  * stored in the device structure. Free the encoder's memory as part of
  * the device release function.
  *
- * FIXME: Later improvements to DRM's resource management may allow for
- *        an automated kfree() of the encoder's memory.
+ * Note: consider using drmm_simple_encoder_alloc() instead of
+ * drm_simple_encoder_init() to let the DRM managed resource infrastructure
+ * take care of cleanup and deallocation.
  *
  * Returns:
  * Zero on success, error code on failure.
@@ -71,6 +73,14 @@ int drm_simple_encoder_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_simple_encoder_init);
 
+void *__drmm_simple_encoder_alloc(struct drm_device *dev, size_t size,
+				  size_t offset, int encoder_type)
+{
+	return __drmm_encoder_alloc(dev, size, offset, NULL, encoder_type,
+				    NULL);
+}
+EXPORT_SYMBOL(__drmm_simple_encoder_alloc);
+
 static enum drm_mode_status
 drm_simple_kms_crtc_mode_valid(struct drm_crtc *crtc,
 			       const struct drm_display_mode *mode)
diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
index a026375464ff..e6dbf3161c2f 100644
--- a/include/drm/drm_simple_kms_helper.h
+++ b/include/drm/drm_simple_kms_helper.h
@@ -185,4 +185,28 @@ int drm_simple_encoder_init(struct drm_device *dev,
 			    struct drm_encoder *encoder,
 			    int encoder_type);
 
+void *__drmm_simple_encoder_alloc(struct drm_device *dev, size_t size,
+				  size_t offset, int encoder_type);
+
+/**
+ * drmm_simple_encoder_alloc - Allocate and initialize an encoder with basic
+ *                             functionality.
+ * @dev: drm device
+ * @type: the type of the struct which contains struct &drm_encoder
+ * @member: the name of the &drm_encoder within @type.
+ * @encoder_type: user visible type of the encoder
+ *
+ * Allocates and initializes an encoder that has no further functionality.
+ * Settings for possible CRTC and clones are left to their initial values.
+ * Cleanup is automatically handled through registering drm_encoder_cleanup()
+ * with drmm_add_action().
+ *
+ * Returns:
+ * Pointer to new encoder, or ERR_PTR on failure.
+ */
+#define drmm_simple_encoder_alloc(dev, type, member, encoder_type) \
+	((type *)__drmm_simple_encoder_alloc(dev, sizeof(type), \
+					     offsetof(type, member), \
+					     encoder_type))
+
 #endif /* __LINUX_DRM_SIMPLE_KMS_HELPER_H */
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
