Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B035A0933
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 08:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B37CD849D;
	Thu, 25 Aug 2022 06:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 453 seconds by postgrey-1.36 at gabe;
 Thu, 25 Aug 2022 06:54:41 UTC
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59313D8493
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 06:54:41 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: Remove special frontbuffer type
Date: Thu, 25 Aug 2022 08:47:01 +0200
Message-Id: <20220825064701.768595-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825064701.768595-1-maarten.lankhorst@linux.intel.com>
References: <20220825064701.768595-1-maarten.lankhorst@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c   |   6 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   4 +-
 .../drm/i915/display/intel_display_types.h    |   8 +-
 drivers/gpu/drm/i915/display/intel_fb.c       |  10 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |   7 +-
 .../gpu/drm/i915/display/intel_frontbuffer.c  | 103 ++----------------
 .../gpu/drm/i915/display/intel_frontbuffer.h  |  65 ++---------
 .../drm/i915/display/intel_plane_initial.c    |   2 +-
 drivers/gpu/drm/i915/i915_driver.c            |   1 +
 drivers/gpu/drm/i915/i915_gem.c               |   2 -
 10 files changed, 32 insertions(+), 176 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 16ac560eab49..eaf46487e720 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -689,10 +689,10 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	if (ret)
 		goto out_free;
 
-	intel_frontbuffer_flush(to_intel_frontbuffer(new_plane_state->hw.fb),
+	intel_frontbuffer_flush(to_intel_framebuffer(new_plane_state->hw.fb),
 				ORIGIN_CURSOR_UPDATE);
-	intel_frontbuffer_track(to_intel_frontbuffer(old_plane_state->hw.fb),
-				to_intel_frontbuffer(new_plane_state->hw.fb),
+	intel_frontbuffer_track(to_intel_framebuffer(old_plane_state->hw.fb),
+				to_intel_framebuffer(new_plane_state->hw.fb),
 				plane->frontbuffer_bit);
 
 	/* Swap plane state */
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 533fff79aeda..ae71ac40de41 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7727,8 +7727,8 @@ static void intel_atomic_track_fbs(struct intel_atomic_state *state)
 
 	for_each_oldnew_intel_plane_in_state(state, plane, old_plane_state,
 					     new_plane_state, i)
-		intel_frontbuffer_track(to_intel_frontbuffer(old_plane_state->hw.fb),
-					to_intel_frontbuffer(new_plane_state->hw.fb),
+		intel_frontbuffer_track(to_intel_framebuffer(old_plane_state->hw.fb),
+					to_intel_framebuffer(new_plane_state->hw.fb),
 					plane->frontbuffer_bit);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 0da9b208d56e..f0963de13abf 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -132,6 +132,8 @@ struct intel_fb_view {
 
 struct intel_framebuffer {
 	struct drm_framebuffer base;
+
+	atomic_t bits;
 	struct intel_frontbuffer *frontbuffer;
 
 	/* Params to remap the FB pages and program the plane registers in each view. */
@@ -2061,10 +2063,4 @@ static inline u32 intel_plane_ggtt_offset(const struct intel_plane_state *plane_
 	return i915_ggtt_offset(plane_state->ggtt_vma);
 }
 
-static inline struct intel_frontbuffer *
-to_intel_frontbuffer(struct drm_framebuffer *fb)
-{
-	return fb ? to_intel_framebuffer(fb)->frontbuffer : NULL;
-}
-
 #endif /*  __INTEL_DISPLAY_TYPES_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 88d6189f9c1c..9c1a093ed9b1 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1820,8 +1820,6 @@ static void intel_user_framebuffer_destroy(struct drm_framebuffer *fb)
 	if (intel_fb_uses_dpt(fb))
 		intel_dpt_destroy(intel_fb->dpt_vm);
 
-	intel_frontbuffer_put(intel_fb->frontbuffer);
-
 	kfree(intel_fb);
 }
 
@@ -1850,7 +1848,7 @@ static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
 	struct drm_i915_gem_object *obj = intel_fb_obj(fb);
 
 	i915_gem_object_flush_if_display(obj);
-	intel_frontbuffer_flush(to_intel_frontbuffer(fb), ORIGIN_DIRTYFB);
+	intel_frontbuffer_flush(to_intel_framebuffer(fb), ORIGIN_DIRTYFB);
 
 	return 0;
 }
@@ -1872,10 +1870,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 	int ret = -EINVAL;
 	int i;
 
-	intel_fb->frontbuffer = intel_frontbuffer_get(obj);
-	if (!intel_fb->frontbuffer)
-		return -ENOMEM;
-
+	atomic_set(&intel_fb->bits, 0);
 	i915_gem_object_lock(obj, NULL);
 	tiling = i915_gem_object_get_tiling(obj);
 	stride = i915_gem_object_get_stride(obj);
@@ -2011,7 +2006,6 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 	return 0;
 
 err:
-	intel_frontbuffer_put(intel_fb->frontbuffer);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 221336178991..002e850dcd62 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -67,14 +67,9 @@ struct intel_fbdev {
 	struct mutex hpd_lock;
 };
 
-static struct intel_frontbuffer *to_frontbuffer(struct intel_fbdev *ifbdev)
-{
-	return ifbdev->fb->frontbuffer;
-}
-
 static void intel_fbdev_invalidate(struct intel_fbdev *ifbdev)
 {
-	intel_frontbuffer_invalidate(to_frontbuffer(ifbdev), ORIGIN_CPU);
+	intel_frontbuffer_invalidate(ifbdev->fb, ORIGIN_CPU);
 }
 
 static int intel_fbdev_set_par(struct fb_info *info)
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 791248f812aa..8215faefcc1a 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -163,11 +163,11 @@ void intel_frontbuffer_flip(struct drm_i915_private *i915,
 	frontbuffer_flush(i915, frontbuffer_bits, ORIGIN_FLIP);
 }
 
-void __intel_fb_invalidate(struct intel_frontbuffer *front,
+void __intel_fb_invalidate(struct intel_framebuffer *fb,
 			   enum fb_op_origin origin,
 			   unsigned int frontbuffer_bits)
 {
-	struct drm_i915_private *i915 = to_i915(front->obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(fb->base.dev);
 
 	if (origin == ORIGIN_CS) {
 		spin_lock(&i915->fb_tracking.lock);
@@ -184,11 +184,11 @@ void __intel_fb_invalidate(struct intel_frontbuffer *front,
 	intel_fbc_invalidate(i915, frontbuffer_bits, origin);
 }
 
-void __intel_fb_flush(struct intel_frontbuffer *front,
+void __intel_fb_flush(struct intel_framebuffer *fb,
 		      enum fb_op_origin origin,
 		      unsigned int frontbuffer_bits)
 {
-	struct drm_i915_private *i915 = to_i915(front->obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(fb->base.dev);
 
 	if (origin == ORIGIN_CS) {
 		spin_lock(&i915->fb_tracking.lock);
@@ -202,93 +202,6 @@ void __intel_fb_flush(struct intel_frontbuffer *front,
 		frontbuffer_flush(i915, frontbuffer_bits, origin);
 }
 
-static int frontbuffer_active(struct i915_active *ref)
-{
-	struct intel_frontbuffer *front =
-		container_of(ref, typeof(*front), write);
-
-	kref_get(&front->ref);
-	return 0;
-}
-
-static void frontbuffer_retire(struct i915_active *ref)
-{
-	struct intel_frontbuffer *front =
-		container_of(ref, typeof(*front), write);
-
-	intel_frontbuffer_flush(front, ORIGIN_CS);
-	intel_frontbuffer_put(front);
-}
-
-static void frontbuffer_release(struct kref *ref)
-	__releases(&to_i915(front->obj->base.dev)->fb_tracking.lock)
-{
-	struct intel_frontbuffer *front =
-		container_of(ref, typeof(*front), ref);
-	struct drm_i915_gem_object *obj = front->obj;
-	struct i915_vma *vma;
-
-	drm_WARN_ON(obj->base.dev, atomic_read(&front->bits));
-
-	spin_lock(&obj->vma.lock);
-	for_each_ggtt_vma(vma, obj) {
-		i915_vma_clear_scanout(vma);
-		vma->display_alignment = I915_GTT_MIN_ALIGNMENT;
-	}
-	spin_unlock(&obj->vma.lock);
-
-	RCU_INIT_POINTER(obj->frontbuffer, NULL);
-	spin_unlock(&to_i915(obj->base.dev)->fb_tracking.lock);
-
-	i915_active_fini(&front->write);
-
-	i915_gem_object_put(obj);
-	kfree_rcu(front, rcu);
-}
-
-struct intel_frontbuffer *
-intel_frontbuffer_get(struct drm_i915_gem_object *obj)
-{
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct intel_frontbuffer *front;
-
-	front = __intel_frontbuffer_get(obj);
-	if (front)
-		return front;
-
-	front = kmalloc(sizeof(*front), GFP_KERNEL);
-	if (!front)
-		return NULL;
-
-	front->obj = obj;
-	kref_init(&front->ref);
-	atomic_set(&front->bits, 0);
-	i915_active_init(&front->write,
-			 frontbuffer_active,
-			 frontbuffer_retire,
-			 I915_ACTIVE_RETIRE_SLEEPS);
-
-	spin_lock(&i915->fb_tracking.lock);
-	if (rcu_access_pointer(obj->frontbuffer)) {
-		kfree(front);
-		front = rcu_dereference_protected(obj->frontbuffer, true);
-		kref_get(&front->ref);
-	} else {
-		i915_gem_object_get(obj);
-		rcu_assign_pointer(obj->frontbuffer, front);
-	}
-	spin_unlock(&i915->fb_tracking.lock);
-
-	return front;
-}
-
-void intel_frontbuffer_put(struct intel_frontbuffer *front)
-{
-	kref_put_lock(&front->ref,
-		      frontbuffer_release,
-		      &to_i915(front->obj->base.dev)->fb_tracking.lock);
-}
-
 /**
  * intel_frontbuffer_track - update frontbuffer tracking
  * @old: current buffer for the frontbuffer slots
@@ -298,8 +211,8 @@ void intel_frontbuffer_put(struct intel_frontbuffer *front)
  * This updates the frontbuffer tracking bits @frontbuffer_bits by clearing them
  * from @old and setting them in @new. Both @old and @new can be NULL.
  */
-void intel_frontbuffer_track(struct intel_frontbuffer *old,
-			     struct intel_frontbuffer *new,
+void intel_frontbuffer_track(struct intel_framebuffer *old,
+			     struct intel_framebuffer *new,
 			     unsigned int frontbuffer_bits)
 {
 	/*
@@ -313,13 +226,13 @@ void intel_frontbuffer_track(struct intel_frontbuffer *old,
 		     BITS_PER_TYPE(atomic_t));
 
 	if (old) {
-		drm_WARN_ON(old->obj->base.dev,
+		drm_WARN_ON(old->base.dev,
 			    !(atomic_read(&old->bits) & frontbuffer_bits));
 		atomic_andnot(frontbuffer_bits, &old->bits);
 	}
 
 	if (new) {
-		drm_WARN_ON(new->obj->base.dev,
+		drm_WARN_ON(new->base.dev,
 			    atomic_read(&new->bits) & frontbuffer_bits);
 		atomic_or(frontbuffer_bits, &new->bits);
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.h b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
index ff0c37b079aa..c2e921c9efd9 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.h
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
@@ -28,7 +28,6 @@
 #include <linux/kref.h>
 
 #include "gem/i915_gem_object_types.h"
-#include "i915_active_types.h"
 
 struct drm_i915_private;
 
@@ -40,14 +39,6 @@ enum fb_op_origin {
 	ORIGIN_CURSOR_UPDATE,
 };
 
-struct intel_frontbuffer {
-	struct kref ref;
-	atomic_t bits;
-	struct i915_active write;
-	struct drm_i915_gem_object *obj;
-	struct rcu_head rcu;
-};
-
 void intel_frontbuffer_flip_prepare(struct drm_i915_private *i915,
 				    unsigned frontbuffer_bits);
 void intel_frontbuffer_flip_complete(struct drm_i915_private *i915,
@@ -55,39 +46,7 @@ void intel_frontbuffer_flip_complete(struct drm_i915_private *i915,
 void intel_frontbuffer_flip(struct drm_i915_private *i915,
 			    unsigned frontbuffer_bits);
 
-void intel_frontbuffer_put(struct intel_frontbuffer *front);
-
-static inline struct intel_frontbuffer *
-__intel_frontbuffer_get(const struct drm_i915_gem_object *obj)
-{
-	struct intel_frontbuffer *front;
-
-	if (likely(!rcu_access_pointer(obj->frontbuffer)))
-		return NULL;
-
-	rcu_read_lock();
-	do {
-		front = rcu_dereference(obj->frontbuffer);
-		if (!front)
-			break;
-
-		if (unlikely(!kref_get_unless_zero(&front->ref)))
-			continue;
-
-		if (likely(front == rcu_access_pointer(obj->frontbuffer)))
-			break;
-
-		intel_frontbuffer_put(front);
-	} while (1);
-	rcu_read_unlock();
-
-	return front;
-}
-
-struct intel_frontbuffer *
-intel_frontbuffer_get(struct drm_i915_gem_object *obj);
-
-void __intel_fb_invalidate(struct intel_frontbuffer *front,
+void __intel_fb_invalidate(struct intel_framebuffer *front,
 			   enum fb_op_origin origin,
 			   unsigned int frontbuffer_bits);
 
@@ -102,23 +61,23 @@ void __intel_fb_invalidate(struct intel_frontbuffer *front,
  * until the rendering completes or a flip on this frontbuffer plane is
  * scheduled.
  */
-static inline bool intel_frontbuffer_invalidate(struct intel_frontbuffer *front,
+static inline bool intel_frontbuffer_invalidate(struct intel_framebuffer *fb,
 						enum fb_op_origin origin)
 {
 	unsigned int frontbuffer_bits;
 
-	if (!front)
+	if (!fb)
 		return false;
 
-	frontbuffer_bits = atomic_read(&front->bits);
+	frontbuffer_bits = atomic_read(&fb->bits);
 	if (!frontbuffer_bits)
 		return false;
 
-	__intel_fb_invalidate(front, origin, frontbuffer_bits);
+	__intel_fb_invalidate(fb, origin, frontbuffer_bits);
 	return true;
 }
 
-void __intel_fb_flush(struct intel_frontbuffer *front,
+void __intel_fb_flush(struct intel_framebuffer *fb,
 		      enum fb_op_origin origin,
 		      unsigned int frontbuffer_bits);
 
@@ -130,23 +89,23 @@ void __intel_fb_flush(struct intel_frontbuffer *front,
  * This function gets called every time rendering on the given object has
  * completed and frontbuffer caching can be started again.
  */
-static inline void intel_frontbuffer_flush(struct intel_frontbuffer *front,
+static inline void intel_frontbuffer_flush(struct intel_framebuffer *fb,
 					   enum fb_op_origin origin)
 {
 	unsigned int frontbuffer_bits;
 
-	if (!front)
+	if (!fb)
 		return;
 
-	frontbuffer_bits = atomic_read(&front->bits);
+	frontbuffer_bits = atomic_read(&fb->bits);
 	if (!frontbuffer_bits)
 		return;
 
-	__intel_fb_flush(front, origin, frontbuffer_bits);
+	__intel_fb_flush(fb, origin, frontbuffer_bits);
 }
 
-void intel_frontbuffer_track(struct intel_frontbuffer *old,
-			     struct intel_frontbuffer *new,
+void intel_frontbuffer_track(struct intel_framebuffer *old,
+			     struct intel_framebuffer *new,
 			     unsigned int frontbuffer_bits);
 
 #endif /* __INTEL_FRONTBUFFER_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index 8ca6d2fab243..8b35cc1e50d7 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -281,7 +281,7 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
 	plane_state->uapi.crtc = &crtc->base;
 	intel_plane_copy_uapi_to_hw_state(plane_state, plane_state, crtc);
 
-	atomic_or(plane->frontbuffer_bit, &to_intel_frontbuffer(fb)->bits);
+	atomic_or(plane->frontbuffer_bit, &to_intel_framebuffer(fb)->bits);
 }
 
 static void plane_config_fini(struct intel_initial_plane_config *plane_config)
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index deb8a8b76965..1985b8b0cc98 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -330,6 +330,7 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 
 	spin_lock_init(&dev_priv->irq_lock);
 	spin_lock_init(&dev_priv->gpu_error.lock);
+	spin_lock_init(&dev_priv->fb_tracking.lock);
 	mutex_init(&dev_priv->backlight_lock);
 
 	mutex_init(&dev_priv->sb_lock);
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 331f5d96c18f..26c228ca4a1c 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1206,8 +1206,6 @@ void i915_gem_init_early(struct drm_i915_private *dev_priv)
 {
 	i915_gem_init__mm(dev_priv);
 	i915_gem_init__contexts(dev_priv);
-
-	spin_lock_init(&dev_priv->fb_tracking.lock);
 }
 
 void i915_gem_cleanup_early(struct drm_i915_private *dev_priv)
-- 
2.34.1

