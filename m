Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 184555A093E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 08:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553BED851B;
	Thu, 25 Aug 2022 06:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEEFED8496
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 06:54:42 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915: Remove gem and overlay frontbuffer tracking
Date: Thu, 25 Aug 2022 08:47:00 +0200
Message-Id: <20220825064701.768595-2-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825064701.768595-1-maarten.lankhorst@linux.intel.com>
References: <20220825064701.768595-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Frontbuffer update handling should be done explicitly by using dirtyfb
calls only.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c       |  1 +
 drivers/gpu/drm/i915/display/intel_overlay.c  | 14 -----------
 .../drm/i915/display/intel_plane_initial.c    |  1 +
 drivers/gpu/drm/i915/display/intel_psr.c      |  1 +
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |  4 ---
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    |  7 ------
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 --
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 25 -------------------
 drivers/gpu/drm/i915/gem/i915_gem_object.h    | 22 ----------------
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      |  4 ---
 drivers/gpu/drm/i915/i915_drv.h               |  1 -
 drivers/gpu/drm/i915/i915_gem.c               |  6 -----
 drivers/gpu/drm/i915/i915_gem_gtt.c           |  1 -
 drivers/gpu/drm/i915/i915_vma.c               | 12 ---------
 14 files changed, 3 insertions(+), 98 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index b191915ab351..88d6189f9c1c 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -12,6 +12,7 @@
 #include "intel_display_types.h"
 #include "intel_dpt.h"
 #include "intel_fb.h"
+#include "intel_frontbuffer.h"
 
 #define check_array_bounds(i915, a, i) drm_WARN_ON(&(i915)->drm, (i) >= ARRAY_SIZE(a))
 
diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 79ed8bd04a07..23feb6e8d336 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -186,7 +186,6 @@ struct intel_overlay {
 	struct intel_crtc *crtc;
 	struct i915_vma *vma;
 	struct i915_vma *old_vma;
-	struct intel_frontbuffer *frontbuffer;
 	bool active;
 	bool pfit_active;
 	u32 pfit_vscale_ratio; /* shifted-point number, (1<<12) == 1.0 */
@@ -287,20 +286,9 @@ static void intel_overlay_flip_prepare(struct intel_overlay *overlay,
 				       struct i915_vma *vma)
 {
 	enum pipe pipe = overlay->crtc->pipe;
-	struct intel_frontbuffer *frontbuffer = NULL;
 
 	drm_WARN_ON(&overlay->i915->drm, overlay->old_vma);
 
-	if (vma)
-		frontbuffer = intel_frontbuffer_get(vma->obj);
-
-	intel_frontbuffer_track(overlay->frontbuffer, frontbuffer,
-				INTEL_FRONTBUFFER_OVERLAY(pipe));
-
-	if (overlay->frontbuffer)
-		intel_frontbuffer_put(overlay->frontbuffer);
-	overlay->frontbuffer = frontbuffer;
-
 	intel_frontbuffer_flip_prepare(overlay->i915,
 				       INTEL_FRONTBUFFER_OVERLAY(pipe));
 
@@ -810,8 +798,6 @@ static int intel_overlay_do_put_image(struct intel_overlay *overlay,
 		goto out_pin_section;
 	}
 
-	i915_gem_object_flush_frontbuffer(new_bo, ORIGIN_DIRTYFB);
-
 	if (!overlay->active) {
 		const struct intel_crtc_state *crtc_state =
 			overlay->crtc->config;
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index d10f27d0b7b0..8ca6d2fab243 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -9,6 +9,7 @@
 #include "intel_display.h"
 #include "intel_display_types.h"
 #include "intel_fb.h"
+#include "intel_frontbuffer.h"
 #include "intel_plane_initial.h"
 
 static bool
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 98c3c8015a5c..a12ef0132697 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -32,6 +32,7 @@
 #include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_dp_aux.h"
+#include "intel_frontbuffer.h"
 #include "intel_hdmi.h"
 #include "intel_psr.h"
 #include "intel_snps_phy.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
index 0512afdd20d8..427ff744b02a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
@@ -6,8 +6,6 @@
 
 #include <drm/drm_cache.h>
 
-#include "display/intel_frontbuffer.h"
-
 #include "i915_drv.h"
 #include "i915_gem_clflush.h"
 #include "i915_sw_fence_work.h"
@@ -22,8 +20,6 @@ static void __do_clflush(struct drm_i915_gem_object *obj)
 {
 	GEM_BUG_ON(!i915_gem_object_has_pages(obj));
 	drm_clflush_sg(obj->mm.pages);
-
-	i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
 }
 
 static void clflush_work(struct dma_fence_work *base)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index 1674b0c5802b..667c76aefb52 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -4,7 +4,6 @@
  * Copyright © 2014-2016 Intel Corporation
  */
 
-#include "display/intel_frontbuffer.h"
 #include "gt/intel_gt.h"
 
 #include "i915_drv.h"
@@ -63,8 +62,6 @@ flush_write_domain(struct drm_i915_gem_object *obj, unsigned int flush_domains)
 				intel_gt_flush_ggtt_writes(vma->vm->gt);
 		}
 		spin_unlock(&obj->vma.lock);
-
-		i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
 		break;
 
 	case I915_GEM_DOMAIN_WC:
@@ -616,9 +613,6 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, void *data,
 out_unlock:
 	i915_gem_object_unlock(obj);
 
-	if (!err && write_domain)
-		i915_gem_object_invalidate_frontbuffer(obj, ORIGIN_CPU);
-
 out:
 	i915_gem_object_put(obj);
 	return err;
@@ -729,7 +723,6 @@ int i915_gem_object_prepare_write(struct drm_i915_gem_object *obj,
 	}
 
 out:
-	i915_gem_object_invalidate_frontbuffer(obj, ORIGIN_CPU);
 	obj->mm.dirty = true;
 	/* return with the pages pinned */
 	return 0;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index cd75b0ca2555..166bc7fc35bd 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -11,8 +11,6 @@
 
 #include <drm/drm_syncobj.h>
 
-#include "display/intel_frontbuffer.h"
-
 #include "gem/i915_gem_ioctls.h"
 #include "gt/intel_context.h"
 #include "gt/intel_gpu_commands.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 389e9f157ca5..65f1a8fcc401 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -27,7 +27,6 @@
 
 #include <drm/drm_cache.h>
 
-#include "display/intel_frontbuffer.h"
 #include "pxp/intel_pxp.h"
 
 #include "i915_drv.h"
@@ -386,30 +385,6 @@ static void i915_gem_free_object(struct drm_gem_object *gem_obj)
 		queue_work(i915->wq, &i915->mm.free_work);
 }
 
-void __i915_gem_object_flush_frontbuffer(struct drm_i915_gem_object *obj,
-					 enum fb_op_origin origin)
-{
-	struct intel_frontbuffer *front;
-
-	front = __intel_frontbuffer_get(obj);
-	if (front) {
-		intel_frontbuffer_flush(front, origin);
-		intel_frontbuffer_put(front);
-	}
-}
-
-void __i915_gem_object_invalidate_frontbuffer(struct drm_i915_gem_object *obj,
-					      enum fb_op_origin origin)
-{
-	struct intel_frontbuffer *front;
-
-	front = __intel_frontbuffer_get(obj);
-	if (front) {
-		intel_frontbuffer_invalidate(front, origin);
-		intel_frontbuffer_put(front);
-	}
-}
-
 static void
 i915_gem_object_read_from_page_kmap(struct drm_i915_gem_object *obj, u64 offset, void *dst, int size)
 {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 6f0a3ce35567..549a17e7a77b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -11,7 +11,6 @@
 #include <drm/drm_file.h>
 #include <drm/drm_device.h>
 
-#include "display/intel_frontbuffer.h"
 #include "intel_memory_region.h"
 #include "i915_gem_object_types.h"
 #include "i915_gem_gtt.h"
@@ -570,27 +569,6 @@ int i915_gem_object_wait_priority(struct drm_i915_gem_object *obj,
 				  unsigned int flags,
 				  const struct i915_sched_attr *attr);
 
-void __i915_gem_object_flush_frontbuffer(struct drm_i915_gem_object *obj,
-					 enum fb_op_origin origin);
-void __i915_gem_object_invalidate_frontbuffer(struct drm_i915_gem_object *obj,
-					      enum fb_op_origin origin);
-
-static inline void
-i915_gem_object_flush_frontbuffer(struct drm_i915_gem_object *obj,
-				  enum fb_op_origin origin)
-{
-	if (unlikely(rcu_access_pointer(obj->frontbuffer)))
-		__i915_gem_object_flush_frontbuffer(obj, origin);
-}
-
-static inline void
-i915_gem_object_invalidate_frontbuffer(struct drm_i915_gem_object *obj,
-				       enum fb_op_origin origin)
-{
-	if (unlikely(rcu_access_pointer(obj->frontbuffer)))
-		__i915_gem_object_invalidate_frontbuffer(obj, origin);
-}
-
 int i915_gem_object_read_from_page(struct drm_i915_gem_object *obj, u64 offset, void *dst, int size);
 
 bool i915_gem_object_is_shmem(const struct drm_i915_gem_object *obj);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
index 0d0e46dae559..b768a210f29a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
@@ -156,15 +156,11 @@ int i915_gem_object_pwrite_phys(struct drm_i915_gem_object *obj,
 	 * We manually control the domain here and pretend that it
 	 * remains coherent i.e. in the GTT domain, like shmem_pwrite.
 	 */
-	i915_gem_object_invalidate_frontbuffer(obj, ORIGIN_CPU);
-
 	if (copy_from_user(vaddr, user_data, args->size))
 		return -EFAULT;
 
 	drm_clflush_virt_range(vaddr, args->size);
 	intel_gt_chipset_flush(to_gt(i915));
-
-	i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index b4733c5a01da..4a5d42b1cf41 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -44,7 +44,6 @@
 #include "display/intel_dpll_mgr.h"
 #include "display/intel_dsb.h"
 #include "display/intel_fbc.h"
-#include "display/intel_frontbuffer.h"
 #include "display/intel_global_state.h"
 #include "display/intel_gmbus.h"
 #include "display/intel_opregion.h"
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 702e5b89be22..331f5d96c18f 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -40,7 +40,6 @@
 #include <drm/drm_vma_manager.h>
 
 #include "display/intel_display.h"
-#include "display/intel_frontbuffer.h"
 
 #include "gem/i915_gem_clflush.h"
 #include "gem/i915_gem_context.h"
@@ -569,8 +568,6 @@ i915_gem_gtt_pwrite_fast(struct drm_i915_gem_object *obj,
 		goto out_rpm;
 	}
 
-	i915_gem_object_invalidate_frontbuffer(obj, ORIGIN_CPU);
-
 	user_data = u64_to_user_ptr(args->data_ptr);
 	offset = args->offset;
 	remain = args->size;
@@ -613,7 +610,6 @@ i915_gem_gtt_pwrite_fast(struct drm_i915_gem_object *obj,
 	}
 
 	intel_gt_flush_ggtt_writes(ggtt->vm.gt);
-	i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
 
 	i915_gem_gtt_cleanup(obj, &node, vma);
 out_rpm:
@@ -700,8 +696,6 @@ i915_gem_shmem_pwrite(struct drm_i915_gem_object *obj,
 		offset = 0;
 	}
 
-	i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
-
 	i915_gem_object_unpin_pages(obj);
 	return ret;
 
diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
index 329ff75b80b9..416a6e931ac8 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
@@ -15,7 +15,6 @@
 #include <asm/set_memory.h>
 #include <asm/smp.h>
 
-#include "display/intel_frontbuffer.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_requests.h"
 
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 260371716490..df86baba1d8f 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -26,7 +26,6 @@
 #include <linux/dma-fence-array.h>
 #include <drm/drm_gem.h>
 
-#include "display/intel_frontbuffer.h"
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_tiling.h"
 #include "gt/intel_engine.h"
@@ -1866,17 +1865,6 @@ int _i915_vma_move_to_active(struct i915_vma *vma,
 			return err;
 	}
 
-	if (flags & EXEC_OBJECT_WRITE) {
-		struct intel_frontbuffer *front;
-
-		front = __intel_frontbuffer_get(obj);
-		if (unlikely(front)) {
-			if (intel_frontbuffer_invalidate(front, ORIGIN_CS))
-				i915_active_add_request(&front->write, rq);
-			intel_frontbuffer_put(front);
-		}
-	}
-
 	if (fence) {
 		struct dma_fence *curr;
 		enum dma_resv_usage usage;
-- 
2.34.1

