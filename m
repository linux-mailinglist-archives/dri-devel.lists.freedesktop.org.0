Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 637112D5FF6
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 16:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ACE96EAB6;
	Thu, 10 Dec 2020 15:39:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103A26EA88
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 15:39:06 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1knO24-00020b-Go; Thu, 10 Dec 2020 16:39:04 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 04/19] drm/plane: add drmm_universal_plane_alloc()
Date: Thu, 10 Dec 2020 16:38:30 +0100
Message-Id: <20201210153845.12176-5-p.zabel@pengutronix.de>
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

Add an alternative to drm_universal_plane_init() that allocates
and initializes a plane and registers drm_plane_cleanup() with
drmm_add_action_or_reset().

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
Changes since v4:
 - Mention that plane_funcs.destroy should kfree() the plane structure, and that
   it should not be allocated with devm_kzalloc(),
 - point out drmm_universal_plane_alloc() in the drm_universal_plane_init()
   documentation.
 - WARN_ON(!funcs->destroy) in drm_universal_plane_init().
 - WARN_ON(!funcs || funcs->destroy) in drmm_universal_plane_alloc().
---
 drivers/gpu/drm/drm_plane.c | 134 ++++++++++++++++++++++++++++--------
 include/drm/drm_plane.h     |  42 +++++++++++
 2 files changed, 147 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index e6231947f987..8b9471a59919 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -30,6 +30,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_vblank.h>
 
 #include "drm_crtc_internal.h"
@@ -152,31 +153,16 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
 	return 0;
 }
 
-/**
- * drm_universal_plane_init - Initialize a new universal plane object
- * @dev: DRM device
- * @plane: plane object to init
- * @possible_crtcs: bitmask of possible CRTCs
- * @funcs: callbacks for the new plane
- * @formats: array of supported formats (DRM_FORMAT\_\*)
- * @format_count: number of elements in @formats
- * @format_modifiers: array of struct drm_format modifiers terminated by
- *                    DRM_FORMAT_MOD_INVALID
- * @type: type of plane (overlay, primary, cursor)
- * @name: printf style format string for the plane name, or NULL for default name
- *
- * Initializes a plane object of type @type.
- *
- * Returns:
- * Zero on success, error code on failure.
- */
-int drm_universal_plane_init(struct drm_device *dev, struct drm_plane *plane,
-			     uint32_t possible_crtcs,
-			     const struct drm_plane_funcs *funcs,
-			     const uint32_t *formats, unsigned int format_count,
-			     const uint64_t *format_modifiers,
-			     enum drm_plane_type type,
-			     const char *name, ...)
+__printf(9, 0)
+static int __drm_universal_plane_init(struct drm_device *dev,
+				      struct drm_plane *plane,
+				      uint32_t possible_crtcs,
+				      const struct drm_plane_funcs *funcs,
+				      const uint32_t *formats,
+				      unsigned int format_count,
+				      const uint64_t *format_modifiers,
+				      enum drm_plane_type type,
+				      const char *name, va_list ap)
 {
 	struct drm_mode_config *config = &dev->mode_config;
 	unsigned int format_modifier_count = 0;
@@ -237,11 +223,7 @@ int drm_universal_plane_init(struct drm_device *dev, struct drm_plane *plane,
 	}
 
 	if (name) {
-		va_list ap;
-
-		va_start(ap, name);
 		plane->name = kvasprintf(GFP_KERNEL, name, ap);
-		va_end(ap);
 	} else {
 		plane->name = kasprintf(GFP_KERNEL, "plane-%d",
 					drm_num_planes(dev));
@@ -286,8 +268,102 @@ int drm_universal_plane_init(struct drm_device *dev, struct drm_plane *plane,
 
 	return 0;
 }
+
+/**
+ * drm_universal_plane_init - Initialize a new universal plane object
+ * @dev: DRM device
+ * @plane: plane object to init
+ * @possible_crtcs: bitmask of possible CRTCs
+ * @funcs: callbacks for the new plane
+ * @formats: array of supported formats (DRM_FORMAT\_\*)
+ * @format_count: number of elements in @formats
+ * @format_modifiers: array of struct drm_format modifiers terminated by
+ *                    DRM_FORMAT_MOD_INVALID
+ * @type: type of plane (overlay, primary, cursor)
+ * @name: printf style format string for the plane name, or NULL for default name
+ *
+ * Initializes a plane object of type @type. The &drm_plane_funcs.destroy hook
+ * should call drm_plane_cleanup() and kfree() the plane structure. The plane
+ * structure should not be allocated with devm_kzalloc().
+ *
+ * Note: consider using drmm_universal_plane_alloc() instead of
+ * drm_universal_plane_init() to let the DRM managed resource infrastructure
+ * take care of cleanup and deallocation.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_universal_plane_init(struct drm_device *dev, struct drm_plane *plane,
+			     uint32_t possible_crtcs,
+			     const struct drm_plane_funcs *funcs,
+			     const uint32_t *formats, unsigned int format_count,
+			     const uint64_t *format_modifiers,
+			     enum drm_plane_type type,
+			     const char *name, ...)
+{
+	va_list ap;
+	int ret;
+
+	WARN_ON(!funcs->destroy);
+
+	va_start(ap, name);
+	ret = __drm_universal_plane_init(dev, plane, possible_crtcs, funcs,
+					 formats, format_count, format_modifiers,
+					 type, name, ap);
+	va_end(ap);
+	return ret;
+}
 EXPORT_SYMBOL(drm_universal_plane_init);
 
+static void drmm_universal_plane_alloc_release(struct drm_device *dev, void *ptr)
+{
+	struct drm_plane *plane = ptr;
+
+	if (WARN_ON(!plane->dev))
+		return;
+
+	drm_plane_cleanup(plane);
+}
+
+void *__drmm_universal_plane_alloc(struct drm_device *dev, size_t size,
+				   size_t offset, uint32_t possible_crtcs,
+				   const struct drm_plane_funcs *funcs,
+				   const uint32_t *formats, unsigned int format_count,
+				   const uint64_t *format_modifiers,
+				   enum drm_plane_type type,
+				   const char *name, ...)
+{
+	void *container;
+	struct drm_plane *plane;
+	va_list ap;
+	int ret;
+
+	if (WARN_ON(!funcs || funcs->destroy))
+		return ERR_PTR(-EINVAL);
+
+	container = drmm_kzalloc(dev, size, GFP_KERNEL);
+	if (!container)
+		return ERR_PTR(-ENOMEM);
+
+	plane = container + offset;
+
+	va_start(ap, name);
+	ret = __drm_universal_plane_init(dev, plane, possible_crtcs, funcs,
+					 formats, format_count, format_modifiers,
+					 type, name, ap);
+	va_end(ap);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = drmm_add_action_or_reset(dev, drmm_universal_plane_alloc_release,
+				       plane);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return container;
+}
+EXPORT_SYMBOL(__drmm_universal_plane_alloc);
+
 int drm_plane_register_all(struct drm_device *dev)
 {
 	unsigned int num_planes = 0;
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 1d82b264e5e4..8ef06ee1c8eb 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -764,6 +764,48 @@ int drm_plane_init(struct drm_device *dev,
 		   bool is_primary);
 void drm_plane_cleanup(struct drm_plane *plane);
 
+__printf(10, 11)
+void *__drmm_universal_plane_alloc(struct drm_device *dev,
+				   size_t size, size_t offset,
+				   uint32_t possible_crtcs,
+				   const struct drm_plane_funcs *funcs,
+				   const uint32_t *formats,
+				   unsigned int format_count,
+				   const uint64_t *format_modifiers,
+				   enum drm_plane_type plane_type,
+				   const char *name, ...);
+
+/**
+ * drmm_universal_plane_alloc - Allocate and initialize an universal plane object
+ * @dev: DRM device
+ * @type: the type of the struct which contains struct &drm_plane
+ * @member: the name of the &drm_plane within @type
+ * @possible_crtcs: bitmask of possible CRTCs
+ * @funcs: callbacks for the new plane
+ * @formats: array of supported formats (DRM_FORMAT\_\*)
+ * @format_count: number of elements in @formats
+ * @format_modifiers: array of struct drm_format modifiers terminated by
+ *                    DRM_FORMAT_MOD_INVALID
+ * @plane_type: type of plane (overlay, primary, cursor)
+ * @name: printf style format string for the plane name, or NULL for default name
+ *
+ * Allocates and initializes a plane object of type @type. Cleanup is
+ * automatically handled through registering drm_plane_cleanup() with
+ * drmm_add_action().
+ *
+ * The @drm_plane_funcs.destroy hook must be NULL.
+ *
+ * Returns:
+ * Pointer to new plane, or ERR_PTR on failure.
+ */
+#define drmm_universal_plane_alloc(dev, type, member, possible_crtcs, funcs, formats, \
+				   format_count, format_modifiers, plane_type, name, ...) \
+	((type *)__drmm_universal_plane_alloc(dev, sizeof(type), \
+					      offsetof(type, member), \
+					      possible_crtcs, funcs, formats, \
+					      format_count, format_modifiers, \
+					      plane_type, name, ##__VA_ARGS__))
+
 /**
  * drm_plane_index - find the index of a registered plane
  * @plane: plane to find index for
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
