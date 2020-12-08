Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A422D2EB8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 16:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA3F6E96D;
	Tue,  8 Dec 2020 15:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94776E953
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 15:55:15 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kmfKc-0007AN-7S; Tue, 08 Dec 2020 16:55:14 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 02/19] drm: add drmm_encoder_alloc()
Date: Tue,  8 Dec 2020 16:54:34 +0100
Message-Id: <20201208155451.8421-3-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208155451.8421-1-p.zabel@pengutronix.de>
References: <20201208155451.8421-1-p.zabel@pengutronix.de>
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

Add an alternative to drm_encoder_init() that allocates and initializes
an encoder and registers drm_encoder_cleanup() with
drmm_add_action_or_reset().

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v3:
 - allow the funcs parameter to __drmm_encoder_alloc() to be NULL
---
 drivers/gpu/drm/drm_encoder.c | 101 ++++++++++++++++++++++++++--------
 include/drm/drm_encoder.h     |  30 ++++++++++
 2 files changed, 108 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index b0b86a3c08f5..cc0edb8361e8 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -26,6 +26,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_managed.h>
 
 #include "drm_crtc_internal.h"
 
@@ -91,25 +92,11 @@ void drm_encoder_unregister_all(struct drm_device *dev)
 	}
 }
 
-/**
- * drm_encoder_init - Init a preallocated encoder
- * @dev: drm device
- * @encoder: the encoder to init
- * @funcs: callbacks for this encoder
- * @encoder_type: user visible type of the encoder
- * @name: printf style format string for the encoder name, or NULL for default name
- *
- * Initialises a preallocated encoder. Encoder should be subclassed as part of
- * driver encoder objects. At driver unload time drm_encoder_cleanup() should be
- * called from the driver's &drm_encoder_funcs.destroy hook.
- *
- * Returns:
- * Zero on success, error code on failure.
- */
-int drm_encoder_init(struct drm_device *dev,
-		     struct drm_encoder *encoder,
-		     const struct drm_encoder_funcs *funcs,
-		     int encoder_type, const char *name, ...)
+__printf(5, 0)
+static int __drm_encoder_init(struct drm_device *dev,
+			      struct drm_encoder *encoder,
+			      const struct drm_encoder_funcs *funcs,
+			      int encoder_type, const char *name, va_list ap)
 {
 	int ret;
 
@@ -125,11 +112,7 @@ int drm_encoder_init(struct drm_device *dev,
 	encoder->encoder_type = encoder_type;
 	encoder->funcs = funcs;
 	if (name) {
-		va_list ap;
-
-		va_start(ap, name);
 		encoder->name = kvasprintf(GFP_KERNEL, name, ap);
-		va_end(ap);
 	} else {
 		encoder->name = kasprintf(GFP_KERNEL, "%s-%d",
 					  drm_encoder_enum_list[encoder_type].name,
@@ -150,6 +133,36 @@ int drm_encoder_init(struct drm_device *dev,
 
 	return ret;
 }
+
+/**
+ * drm_encoder_init - Init a preallocated encoder
+ * @dev: drm device
+ * @encoder: the encoder to init
+ * @funcs: callbacks for this encoder
+ * @encoder_type: user visible type of the encoder
+ * @name: printf style format string for the encoder name, or NULL for default name
+ *
+ * Initializes a preallocated encoder. Encoder should be subclassed as part of
+ * driver encoder objects. At driver unload time drm_encoder_cleanup() should be
+ * called from the driver's &drm_encoder_funcs.destroy hook.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_encoder_init(struct drm_device *dev,
+		     struct drm_encoder *encoder,
+		     const struct drm_encoder_funcs *funcs,
+		     int encoder_type, const char *name, ...)
+{
+	va_list ap;
+	int ret;
+
+	va_start(ap, name);
+	ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, name, ap);
+	va_end(ap);
+
+	return ret;
+}
 EXPORT_SYMBOL(drm_encoder_init);
 
 /**
@@ -181,6 +194,48 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
 }
 EXPORT_SYMBOL(drm_encoder_cleanup);
 
+static void drmm_encoder_alloc_release(struct drm_device *dev, void *ptr)
+{
+	struct drm_encoder *encoder = ptr;
+
+	if (WARN_ON(!encoder->dev))
+		return;
+
+	drm_encoder_cleanup(encoder);
+}
+
+void *__drmm_encoder_alloc(struct drm_device *dev, size_t size, size_t offset,
+			   const struct drm_encoder_funcs *funcs,
+			   int encoder_type, const char *name, ...)
+{
+	void *container;
+	struct drm_encoder *encoder;
+	va_list ap;
+	int ret;
+
+	if (WARN_ON(funcs && funcs->destroy))
+		return ERR_PTR(-EINVAL);
+
+	container = drmm_kzalloc(dev, size, GFP_KERNEL);
+	if (!container)
+		return ERR_PTR(-EINVAL);
+
+	encoder = container + offset;
+
+	va_start(ap, name);
+	ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, name, ap);
+	va_end(ap);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = drmm_add_action_or_reset(dev, drmm_encoder_alloc_release, encoder);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return container;
+}
+EXPORT_SYMBOL(__drmm_encoder_alloc);
+
 static struct drm_crtc *drm_encoder_get_crtc(struct drm_encoder *encoder)
 {
 	struct drm_connector *connector;
diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
index 833123637fbf..fb2f56c006db 100644
--- a/include/drm/drm_encoder.h
+++ b/include/drm/drm_encoder.h
@@ -194,6 +194,36 @@ int drm_encoder_init(struct drm_device *dev,
 		     const struct drm_encoder_funcs *funcs,
 		     int encoder_type, const char *name, ...);
 
+__printf(6, 7)
+void *__drmm_encoder_alloc(struct drm_device *dev,
+			   size_t size, size_t offset,
+			   const struct drm_encoder_funcs *funcs,
+			   int encoder_type,
+			   const char *name, ...);
+
+/**
+ * drmm_encoder_alloc - Allocate and initialize an encoder
+ * @dev: drm device
+ * @type: the type of the struct which contains struct &drm_encoder
+ * @member: the name of the &drm_encoder within @type.
+ * @funcs: callbacks for this encoder
+ * @encoder_type: user visible type of the encoder
+ * @name: printf style format string for the encoder name, or NULL for default name
+ *
+ * Allocates and initializes an encoder. Encoder should be subclassed as part of
+ * driver encoder objects. Cleanup is automatically handled through registering
+ * drm_encoder_cleanup() with drmm_add_action().
+ *
+ * The @drm_encoder_funcs.destroy hook must be NULL.
+ *
+ * Returns:
+ * Pointer to new encoder, or ERR_PTR on failure.
+ */
+#define drmm_encoder_alloc(dev, type, member, funcs, encoder_type, name, ...) \
+	((type *)__drmm_encoder_alloc(dev, sizeof(type), \
+				      offsetof(type, member), funcs, \
+				      encoder_type, name, ##__VA_ARGS__))
+
 /**
  * drm_encoder_index - find the index of a registered encoder
  * @encoder: encoder to find index for
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
