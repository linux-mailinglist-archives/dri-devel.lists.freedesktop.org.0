Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E38D22B1E4
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 16:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEDDA6E0E2;
	Thu, 23 Jul 2020 14:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BA16E1F3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 14:56:19 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jycdt-0007Ez-MI; Thu, 23 Jul 2020 16:56:17 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/simple_kms_helper: add drmm_simple_encoder_init()
Date: Thu, 23 Jul 2020 16:56:14 +0200
Message-Id: <20200723145614.18459-2-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200723145614.18459-1-p.zabel@pengutronix.de>
References: <20200723145614.18459-1-p.zabel@pengutronix.de>
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
Cc: kernel@pengutronix.de, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a drm_simple_encoder_init() variant that allocates an encoder with
drmm_kzalloc() and registers drm_encoder_cleanup() with
drmm_add_action_or_reset().

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes since v1:
 - based on drmm_encoder_init
 - use AE initialize spelling
 - fold allocation into drmm_(simple_)encoder_init, to reduce
   boilerplate
---
 drivers/gpu/drm/drm_simple_kms_helper.c | 12 ++++++++++++
 include/drm/drm_simple_kms_helper.h     | 24 ++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 74946690aba4..eb1ea7b6f05d 100644
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
@@ -71,6 +72,17 @@ int drm_simple_encoder_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_simple_encoder_init);
 
+static const struct drm_encoder_funcs drmm_simple_encoder_funcs_empty = { };
+
+void *__drmm_simple_encoder_init(struct drm_device *dev, size_t size,
+				 size_t offset, int encoder_type)
+{
+	return __drmm_encoder_init(dev, size, offset,
+				   &drmm_simple_encoder_funcs_empty,
+				   encoder_type, NULL);
+}
+EXPORT_SYMBOL(__drmm_simple_encoder_init);
+
 static enum drm_mode_status
 drm_simple_kms_crtc_mode_valid(struct drm_crtc *crtc,
 			       const struct drm_display_mode *mode)
diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
index a026375464ff..58f5d4d5e78a 100644
--- a/include/drm/drm_simple_kms_helper.h
+++ b/include/drm/drm_simple_kms_helper.h
@@ -185,4 +185,28 @@ int drm_simple_encoder_init(struct drm_device *dev,
 			    struct drm_encoder *encoder,
 			    int encoder_type);
 
+void *__drmm_simple_encoder_init(struct drm_device *dev, size_t size,
+				 size_t offset, int encoder_type);
+
+/**
+ * drmm_simple_encoder_init - Allocate and initialize an encoder with basic
+ *                            functionality.
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
+#define drmm_simple_encoder_init(dev, type, member, encoder_type) \
+	((type *) __drmm_simple_encoder_init(dev, sizeof(type), \
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
