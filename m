Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 921B9254A32
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 18:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE796EB4E;
	Thu, 27 Aug 2020 16:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2B089FA6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 16:06:09 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kBKPg-0008J4-8b; Thu, 27 Aug 2020 18:06:08 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/plane: add drmm_universal_plane_alloc()
Date: Thu, 27 Aug 2020 18:05:44 +0200
Message-Id: <20200827160545.1146-3-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200827160545.1146-1-p.zabel@pengutronix.de>
References: <20200827160545.1146-1-p.zabel@pengutronix.de>
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

Add an alternative to drm_universal_plane_init() that allocates
and initializes a plane and registers drm_plane_cleanup() with
drmm_add_action_or_reset().

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes since v1:
 - add __printf annotation to __drm_universal_plane_init() and make it static
---
 drivers/gpu/drm/drm_plane.c | 130 ++++++++++++++++++++++++++++--------
 include/drm/drm_plane.h     |  42 ++++++++++++
 2 files changed, 143 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index b7b90b3a2e38..ddf7f0724260 100644
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
@@ -286,8 +268,98 @@ int drm_universal_plane_init(struct drm_device *dev, struct drm_plane *plane,
 
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
+ * Initializes a plane object of type @type.
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
+	if (name)
+		va_start(ap, name);
+	ret = __drm_universal_plane_init(dev, plane, possible_crtcs, funcs,
+					 formats, format_count, format_modifiers,
+					 type, name, ap);
+	if (name)
+		va_end(ap);
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
+	if (!funcs || funcs->destroy)
+		return ERR_PTR(-EINVAL);
+
+	container = drmm_kzalloc(dev, size, GFP_KERNEL);
+	if (!container)
+		return ERR_PTR(-ENOMEM);
+
+	plane = container + offset;
+
+	if (name)
+		va_start(ap, name);
+	ret = __drm_universal_plane_init(dev, plane, possible_crtcs, funcs,
+					 formats, format_count, format_modifiers,
+					 type, name, ap);
+	if (name)
+		va_end(ap);
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
index 3f396d94afe4..82bd63710a39 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -746,6 +746,48 @@ int drm_plane_init(struct drm_device *dev,
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
