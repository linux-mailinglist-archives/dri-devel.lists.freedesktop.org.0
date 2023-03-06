Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 428DA6AC2D4
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 15:16:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCD010E140;
	Mon,  6 Mar 2023 14:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D2B10E140;
 Mon,  6 Mar 2023 14:16:47 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/display: Do not use i915 frontbuffer tracking
 implementation
Date: Mon,  6 Mar 2023 15:16:38 +0100
Message-Id: <20230306141638.196359-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As a fallback if we decide not to merge the frontbuffer tracking, allow
i915 to keep its own implementation, and do the right thing in Xe.

The frontbuffer tracking for Xe is still done per-fb, while i915 can
keep doing the weird intel_frontbuffer + i915_active thing without
blocking Xe.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 .../gpu/drm/i915/display/intel_display_types.h  | 12 ++++++++++++
 drivers/gpu/drm/i915/display/intel_drrs.c       |  1 +
 drivers/gpu/drm/i915/display/intel_fb.c         |  8 +++++---
 drivers/gpu/drm/i915/display/intel_fbdev.c      |  2 +-
 .../gpu/drm/i915/display/intel_frontbuffer.c    | 17 +++++++++++++----
 .../gpu/drm/i915/display/intel_frontbuffer.h    | 12 ++++++++++--
 drivers/gpu/drm/i915/display/intel_psr.c        |  1 +
 .../gpu/drm/i915/display/skl_universal_plane.c  |  2 ++
 8 files changed, 45 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index f2918bb07107..a4a57aa24422 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -133,7 +133,11 @@ struct intel_fb_view {
 
 struct intel_framebuffer {
 	struct drm_framebuffer base;
+#ifdef I915
 	struct intel_frontbuffer *frontbuffer;
+#else
+	atomic_t bits;
+#endif
 
 	/* Params to remap the FB pages and program the plane registers in each view. */
 	struct intel_fb_view normal_view;
@@ -2074,10 +2078,18 @@ static inline u32 intel_plane_ggtt_offset(const struct intel_plane_state *plane_
 #endif
 }
 
+#ifdef I915
 static inline struct intel_frontbuffer *
 to_intel_frontbuffer(struct drm_framebuffer *fb)
 {
 	return fb ? to_intel_framebuffer(fb)->frontbuffer : NULL;
 }
+#else
+static inline struct intel_framebuffer *
+to_intel_frontbuffer(struct drm_framebuffer *fb)
+{
+	return fb ? to_intel_framebuffer(fb) : NULL;
+}
+#endif
 
 #endif /*  __INTEL_DISPLAY_TYPES_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_drrs.c b/drivers/gpu/drm/i915/display/intel_drrs.c
index 5b9e44443814..3503d112387d 100644
--- a/drivers/gpu/drm/i915/display/intel_drrs.c
+++ b/drivers/gpu/drm/i915/display/intel_drrs.c
@@ -9,6 +9,7 @@
 #include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_drrs.h"
+#include "intel_frontbuffer.h"
 #include "intel_panel.h"
 
 /**
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 8c357a4098f6..e67c71f9b29d 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1846,6 +1846,8 @@ static void intel_user_framebuffer_destroy(struct drm_framebuffer *fb)
 #ifdef I915
 	if (intel_fb_uses_dpt(fb))
 		intel_dpt_destroy(intel_fb->dpt_vm);
+
+	intel_frontbuffer_put(intel_fb->frontbuffer);
 #else
 	if (intel_fb_obj(fb)->flags & XE_BO_CREATE_PINNED_BIT) {
 		struct xe_bo *bo = intel_fb_obj(fb);
@@ -1857,8 +1859,6 @@ static void intel_user_framebuffer_destroy(struct drm_framebuffer *fb)
 	}
 #endif
 
-	intel_frontbuffer_put(intel_fb->frontbuffer);
-
 	kfree(intel_fb);
 }
 
@@ -1966,9 +1966,9 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 		obj->flags |= XE_BO_SCANOUT_BIT;
 	}
 	ttm_bo_unreserve(&obj->ttm);
-#endif
 
 	atomic_set(&intel_fb->bits, 0);
+#endif
 
 	if (!drm_any_plane_has_format(&dev_priv->drm,
 				      mode_cmd->pixel_format,
@@ -2085,7 +2085,9 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 	return 0;
 
 err:
+#ifdef I915
 	intel_frontbuffer_put(intel_fb->frontbuffer);
+#endif
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 75d8029185f0..2682b26b511f 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -82,7 +82,7 @@ struct intel_fbdev {
 
 static struct intel_frontbuffer *to_frontbuffer(struct intel_fbdev *ifbdev)
 {
-	return ifbdev->fb->frontbuffer;
+	return to_intel_frontbuffer(&ifbdev->fb->base);
 }
 
 static void intel_fbdev_invalidate(struct intel_fbdev *ifbdev)
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 17a7aa8b28c2..64fe73d2ac4d 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -163,11 +163,17 @@ void intel_frontbuffer_flip(struct drm_i915_private *i915,
 	frontbuffer_flush(i915, frontbuffer_bits, ORIGIN_FLIP);
 }
 
+#ifdef I915
+#define intel_front_obj(front) ((front)->obj)
+#else
+#define intel_front_obj(front) (front)
+#endif
+
 void __intel_fb_invalidate(struct intel_frontbuffer *front,
 			   enum fb_op_origin origin,
 			   unsigned int frontbuffer_bits)
 {
-	struct drm_i915_private *i915 = to_i915(front->obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(intel_front_obj(front)->base.dev);
 
 	if (origin == ORIGIN_CS) {
 		spin_lock(&i915->display.fb_tracking.lock);
@@ -188,7 +194,7 @@ void __intel_fb_flush(struct intel_frontbuffer *front,
 		      enum fb_op_origin origin,
 		      unsigned int frontbuffer_bits)
 {
-	struct drm_i915_private *i915 = to_i915(front->obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(intel_front_obj(front)->base.dev);
 
 	if (origin == ORIGIN_CS) {
 		spin_lock(&i915->display.fb_tracking.lock);
@@ -202,6 +208,7 @@ void __intel_fb_flush(struct intel_frontbuffer *front,
 		frontbuffer_flush(i915, frontbuffer_bits, origin);
 }
 
+#ifdef I915
 static int frontbuffer_active(struct i915_active *ref)
 {
 	struct intel_frontbuffer *front =
@@ -289,6 +296,8 @@ void intel_frontbuffer_put(struct intel_frontbuffer *front)
 		      &to_i915(front->obj->base.dev)->display.fb_tracking.lock);
 }
 
+#endif
+
 /**
  * intel_frontbuffer_track - update frontbuffer tracking
  * @old: current buffer for the frontbuffer slots
@@ -315,13 +324,13 @@ void intel_frontbuffer_track(struct intel_frontbuffer *old,
 	BUILD_BUG_ON(I915_MAX_PLANES > INTEL_FRONTBUFFER_BITS_PER_PIPE);
 
 	if (old) {
-		drm_WARN_ON(old->obj->base.dev,
+		drm_WARN_ON(intel_front_obj(old)->base.dev,
 			    !(atomic_read(&old->bits) & frontbuffer_bits));
 		atomic_andnot(frontbuffer_bits, &old->bits);
 	}
 
 	if (new) {
-		drm_WARN_ON(new->obj->base.dev,
+		drm_WARN_ON(intel_front_obj(new)->base.dev,
 			    atomic_read(&new->bits) & frontbuffer_bits);
 		atomic_or(frontbuffer_bits, &new->bits);
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.h b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
index 3c474ed937fb..a79e5ca419ec 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.h
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
@@ -28,8 +28,6 @@
 #include <linux/bits.h>
 #include <linux/kref.h>
 
-#include "gem/i915_gem_object_types.h"
-#include "i915_active_types.h"
 
 struct drm_i915_private;
 
@@ -41,6 +39,10 @@ enum fb_op_origin {
 	ORIGIN_CURSOR_UPDATE,
 };
 
+#ifdef I915
+#include "gem/i915_gem_object_types.h"
+#include "i915_active_types.h"
+
 struct intel_frontbuffer {
 	struct kref ref;
 	atomic_t bits;
@@ -48,6 +50,9 @@ struct intel_frontbuffer {
 	struct drm_i915_gem_object *obj;
 	struct rcu_head rcu;
 };
+#else
+#define intel_frontbuffer intel_framebuffer
+#endif
 
 /*
  * Frontbuffer tracking bits. Set in obj->frontbuffer_bits while a gem bo is
@@ -73,6 +78,7 @@ void intel_frontbuffer_flip_complete(struct drm_i915_private *i915,
 void intel_frontbuffer_flip(struct drm_i915_private *i915,
 			    unsigned frontbuffer_bits);
 
+#ifdef I915
 void intel_frontbuffer_put(struct intel_frontbuffer *front);
 
 static inline struct intel_frontbuffer *
@@ -105,6 +111,8 @@ __intel_frontbuffer_get(const struct drm_i915_gem_object *obj)
 struct intel_frontbuffer *
 intel_frontbuffer_get(struct drm_i915_gem_object *obj);
 
+#endif
+
 void __intel_fb_invalidate(struct intel_frontbuffer *front,
 			   enum fb_op_origin origin,
 			   unsigned int frontbuffer_bits);
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 9820e5fdd087..bc998b526d88 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -33,6 +33,7 @@
 #include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_dp_aux.h"
+#include "intel_frontbuffer.h"
 #include "intel_hdmi.h"
 #include "intel_psr.h"
 #include "intel_snps_phy.h"
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 38f70f27ff1b..86d022e195c7 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -16,11 +16,13 @@
 #include "intel_display_types.h"
 #include "intel_fb.h"
 #include "intel_fbc.h"
+#include "intel_frontbuffer.h"
 #include "intel_psr.h"
 #include "intel_sprite.h"
 #include "skl_scaler.h"
 #include "skl_universal_plane.h"
 #include "skl_watermark.h"
+
 #ifdef I915
 #include "pxp/intel_pxp.h"
 #else
-- 
2.34.1

