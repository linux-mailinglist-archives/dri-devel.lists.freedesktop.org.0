Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF11654878
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 23:30:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B755210E5C4;
	Thu, 22 Dec 2022 22:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2AF10E594;
 Thu, 22 Dec 2022 22:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671748121; x=1703284121;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=YAJkVMnNORvD6fO99HfkCFA6W7EmjgoZokuwK8cfHeo=;
 b=Wg0z/0h/ovsZnPK/l1MDN7E4mG/174rC09WSV5wcwzAUb660pAjrV6wo
 Mcz5yD3C5+L1fFir07EOBicY+RHeFuphV274E7GDG96kngB67zg3VW+dG
 7sK84ZLH8qxnd/MD9g/gVAIZdEoCck6X7PRS2+ANFVr5tgp60qycOf3jd
 fITl5hRkBaXY/FEFa/Gx1KcxIeV6YYrgtDd2EjghAmkk11PL3sqxVDvlr
 Vdw0Ip3AySBFXJRD2emiL0Ulefty5ENPxJ2Q2SVKWxGxK0CQUMfu/VZB3
 2hwlm3+vipZkqz0FXC1xNXYDnb6FAqdAOP+W3E/LXLq9SPCug3hWS4WFU Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="406472859"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="406472859"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="645412320"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="645412320"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 12/20] drm/i915/display: Neuter frontbuffer tracking harder
Date: Thu, 22 Dec 2022 14:21:19 -0800
Message-Id: <20221222222127.34560-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221222222127.34560-1-matthew.brost@intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Remove intel_frontbuffer type, and use fb->bits.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c   |   6 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   4 +-
 .../drm/i915/display/intel_display_types.h    |   8 +-
 drivers/gpu/drm/i915/display/intel_fb.c       |  11 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |   6 -
 drivers/gpu/drm/i915/display/intel_fbdev.c    |   7 +-
 .../gpu/drm/i915/display/intel_frontbuffer.c  | 103 ++----------------
 .../gpu/drm/i915/display/intel_frontbuffer.h  |  67 +++---------
 .../drm/i915/display/intel_plane_initial.c    |   2 +-
 9 files changed, 32 insertions(+), 182 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index d190fa0d393b..371009f8e194 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -692,10 +692,10 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
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
index e75b9b2a0e01..7a6191cad52a 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7663,8 +7663,8 @@ static void intel_atomic_track_fbs(struct intel_atomic_state *state)
 
 	for_each_oldnew_intel_plane_in_state(state, plane, old_plane_state,
 					     new_plane_state, i)
-		intel_frontbuffer_track(to_intel_frontbuffer(old_plane_state->hw.fb),
-					to_intel_frontbuffer(new_plane_state->hw.fb),
+		intel_frontbuffer_track(to_intel_framebuffer(old_plane_state->hw.fb),
+					to_intel_framebuffer(new_plane_state->hw.fb),
 					plane->frontbuffer_bit);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 32e8b2fc3cc6..34250a9cf3e1 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -132,7 +132,7 @@ struct intel_fb_view {
 
 struct intel_framebuffer {
 	struct drm_framebuffer base;
-	struct intel_frontbuffer *frontbuffer;
+	atomic_t bits;
 
 	/* Params to remap the FB pages and program the plane registers in each view. */
 	struct intel_fb_view normal_view;
@@ -2056,10 +2056,4 @@ static inline u32 intel_plane_ggtt_offset(const struct intel_plane_state *plane_
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
index 7cf31c87884c..56cdacf33db2 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1833,8 +1833,7 @@ static void intel_user_framebuffer_destroy(struct drm_framebuffer *fb)
 	if (intel_fb_uses_dpt(fb))
 		intel_dpt_destroy(intel_fb->dpt_vm);
 
-	intel_frontbuffer_put(intel_fb->frontbuffer);
-
+	drm_gem_object_put(fb->obj[0]);
 	kfree(intel_fb);
 }
 
@@ -1863,7 +1862,7 @@ static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
 	struct drm_i915_gem_object *obj = intel_fb_obj(fb);
 
 	i915_gem_object_flush_if_display(obj);
-	intel_frontbuffer_flush(to_intel_frontbuffer(fb), ORIGIN_DIRTYFB);
+	intel_frontbuffer_flush(to_intel_framebuffer(fb), ORIGIN_DIRTYFB);
 
 	return 0;
 }
@@ -1885,10 +1884,6 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 	int ret = -EINVAL;
 	int i;
 
-	intel_fb->frontbuffer = intel_frontbuffer_get(obj);
-	if (!intel_fb->frontbuffer)
-		return -ENOMEM;
-
 	i915_gem_object_lock(obj, NULL);
 	tiling = i915_gem_object_get_tiling(obj);
 	stride = i915_gem_object_get_stride(obj);
@@ -2021,10 +2016,10 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 		goto err;
 	}
 
+	drm_gem_object_get(fb->obj[0]);
 	return 0;
 
 err:
-	intel_frontbuffer_put(intel_fb->frontbuffer);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c
index 1aca7552a85d..70bce1a99a53 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
+++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
@@ -37,9 +37,6 @@ intel_pin_fb_obj_dpt(struct drm_framebuffer *fb,
 	 */
 	GEM_WARN_ON(vm->bind_async_flags);
 
-	if (WARN_ON(!i915_gem_object_is_framebuffer(obj)))
-		return ERR_PTR(-EINVAL);
-
 	alignment = 4096 * 512;
 
 	atomic_inc(&dev_priv->gpu_error.pending_fb_pin);
@@ -119,9 +116,6 @@ intel_pin_and_fence_fb_obj(struct drm_framebuffer *fb,
 	u32 alignment;
 	int ret;
 
-	if (drm_WARN_ON(dev, !i915_gem_object_is_framebuffer(obj)))
-		return ERR_PTR(-EINVAL);
-
 	if (phys_cursor)
 		alignment = intel_cursor_alignment(dev_priv);
 	else
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 03ed4607a46d..8ccdf1a964ff 100644
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
index 17a7aa8b28c2..99d194803520 100644
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
 		spin_lock(&i915->display.fb_tracking.lock);
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
 		spin_lock(&i915->display.fb_tracking.lock);
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
-	__releases(&to_i915(front->obj->base.dev)->display.fb_tracking.lock)
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
-	spin_unlock(&to_i915(obj->base.dev)->display.fb_tracking.lock);
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
-	spin_lock(&i915->display.fb_tracking.lock);
-	if (rcu_access_pointer(obj->frontbuffer)) {
-		kfree(front);
-		front = rcu_dereference_protected(obj->frontbuffer, true);
-		kref_get(&front->ref);
-	} else {
-		i915_gem_object_get(obj);
-		rcu_assign_pointer(obj->frontbuffer, front);
-	}
-	spin_unlock(&i915->display.fb_tracking.lock);
-
-	return front;
-}
-
-void intel_frontbuffer_put(struct intel_frontbuffer *front)
-{
-	kref_put_lock(&front->ref,
-		      frontbuffer_release,
-		      &to_i915(front->obj->base.dev)->display.fb_tracking.lock);
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
@@ -315,13 +228,13 @@ void intel_frontbuffer_track(struct intel_frontbuffer *old,
 	BUILD_BUG_ON(I915_MAX_PLANES > INTEL_FRONTBUFFER_BITS_PER_PIPE);
 
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
index 3c474ed937fb..b91338651139 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.h
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
@@ -28,8 +28,7 @@
 #include <linux/bits.h>
 #include <linux/kref.h>
 
-#include "gem/i915_gem_object_types.h"
-#include "i915_active_types.h"
+#include "intel_display_types.h"
 
 struct drm_i915_private;
 
@@ -41,14 +40,6 @@ enum fb_op_origin {
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
 /*
  * Frontbuffer tracking bits. Set in obj->frontbuffer_bits while a gem bo is
  * considered to be the frontbuffer for the given plane interface-wise. This
@@ -73,39 +64,7 @@ void intel_frontbuffer_flip_complete(struct drm_i915_private *i915,
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
 
@@ -120,23 +79,23 @@ void __intel_fb_invalidate(struct intel_frontbuffer *front,
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
 
@@ -148,23 +107,23 @@ void __intel_fb_flush(struct intel_frontbuffer *front,
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
index cad9c8884af3..82a54152d731 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -281,7 +281,7 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
 	plane_state->uapi.crtc = &crtc->base;
 	intel_plane_copy_uapi_to_hw_state(plane_state, plane_state, crtc);
 
-	atomic_or(plane->frontbuffer_bit, &to_intel_frontbuffer(fb)->bits);
+	atomic_or(plane->frontbuffer_bit, &to_intel_framebuffer(fb)->bits);
 }
 
 static void plane_config_fini(struct intel_initial_plane_config *plane_config)
-- 
2.37.3

