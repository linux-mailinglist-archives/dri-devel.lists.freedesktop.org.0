Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEF774283E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 16:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E0B10E146;
	Thu, 29 Jun 2023 14:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181EA10E139;
 Thu, 29 Jun 2023 14:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688048691; x=1719584691;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E9N/R9C7obADgzicZ93KLZ32KRV8MBe3AZaiN3wMZPs=;
 b=dPBSXzNsdx8iZkCV7rsVbUvgPzwu5AbiwhIjxC0GU57y2U6YAChQdhPH
 jgBw9XWRVPR4xp8BZfVNKaJfsad0ivOVw+qLf6BV44uiGW4vhmBa7SgUz
 apcidBCNZ2Wy8HrR3RvMvTD4fo70ru5Hr19JcVBx867eyl0dgj4kalGSd
 b12xmYB7kEVsKKH8lNDjUpDZzML4OLCENpjGXNvJHSWcR+ZIVMAANtJAQ
 HVyEWbDopPx+O5s55wh4f/NN4wvFqReWqlu3U5Z1uWKBD6VXvwgJjBuxl
 8+Wr896/DHO4cbfDH0YKNoPqsBNyMAL/ym6FBcM9OEJY4OrQzE0/UjfSc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="346899217"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; d="scan'208";a="346899217"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 07:15:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="752652745"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; d="scan'208";a="752652745"
Received: from coflynn-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.199.178])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 07:15:17 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/i915: Refactor PAT/cache handling
Date: Thu, 29 Jun 2023 15:15:09 +0100
Message-Id: <20230629141509.3194090-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Fei Yang <fei.yang@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Informal commit message for now.

I got a bit impatient and curious to see if the idea we discussed would
work so sketched something out. I think it is what I was describing back
then..

So high level idea is to teach the driver what caching modes are hidden
behind PAT indices. Given you already had that in static tables, if we
just turn the tables a bit around and add a driver abstraction of caching
modes this is what happens:

 * We can lose the ugly runtime i915_gem_get_pat_index.

 * We can have a smarter i915_gem_object_has_cache_level, which now can
   use the above mentioned table to understand the caching modes and so
   does not have to pessimistically return true for _any_ input when user
   has set the PAT index. This may improve things even for MTL.

 * We can simplify the debugfs printout to be platform agnostic.

 * We are perhaps opening the door to un-regress the dodgy addition
   made to i915_gem_object_can_bypass_llc? See QQQ/FIXME in the patch.

I hope I did not forget anything, but anyway, please have a read and see
what you think. I think it has potential.

Proper commit message can come later.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_dpt.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |   2 +-
 .../drm/i915/display/intel_plane_initial.c    |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    |  66 +++++-----
 drivers/gpu/drm/i915/gem/i915_gem_domain.h    |   7 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  13 +-
 drivers/gpu/drm/i915/gem/i915_gem_internal.c  |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  10 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 116 +++++++++--------
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   9 +-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  | 117 +++---------------
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  10 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  13 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  43 ++++---
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |   2 +-
 .../drm/i915/gem/selftests/huge_gem_object.c  |   6 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |   8 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |   4 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |  19 +--
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  33 ++---
 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c     |   4 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c           |   2 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   3 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c       |  11 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |   6 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |   2 +-
 drivers/gpu/drm/i915/gt/intel_timeline.c      |   2 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |   2 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c    |   9 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |  14 +--
 drivers/gpu/drm/i915/gt/selftest_timeline.c   |   1 +
 drivers/gpu/drm/i915/gt/selftest_tlb.c        |   5 +-
 .../gpu/drm/i915/gt/selftest_workarounds.c    |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |   8 +-
 drivers/gpu/drm/i915/i915_cache.c             |  72 +++++++++++
 drivers/gpu/drm/i915/i915_cache.h             |  49 ++++++++
 drivers/gpu/drm/i915/i915_debugfs.c           |  65 +++-------
 drivers/gpu/drm/i915/i915_driver.c            |   5 +
 drivers/gpu/drm/i915/i915_drv.h               |   3 +
 drivers/gpu/drm/i915/i915_gem.c               |  21 +---
 drivers/gpu/drm/i915/i915_gpu_error.c         |   7 +-
 drivers/gpu/drm/i915/i915_pci.c               |  83 +++++++------
 drivers/gpu/drm/i915/i915_perf.c              |   2 +-
 drivers/gpu/drm/i915/intel_device_info.h      |   6 +-
 drivers/gpu/drm/i915/selftests/i915_gem.c     |   5 +-
 .../gpu/drm/i915/selftests/i915_gem_evict.c   |   8 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  13 +-
 drivers/gpu/drm/i915/selftests/igt_spinner.c  |   2 +-
 .../drm/i915/selftests/intel_memory_region.c  |   4 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  12 +-
 drivers/gpu/drm/i915/selftests/mock_region.c  |   2 +-
 54 files changed, 440 insertions(+), 485 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_cache.c
 create mode 100644 drivers/gpu/drm/i915/i915_cache.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 2be9dd960540..2c3da8f0c78e 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -30,6 +30,7 @@ subdir-ccflags-y += -I$(srctree)/$(src)
 # core driver code
 i915-y += i915_driver.o \
 	  i915_drm_client.o \
+	  i915_cache.o \
 	  i915_config.o \
 	  i915_getparam.o \
 	  i915_ioctl.o \
diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
index 7c5fddb203ba..5baf0d27a288 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.c
+++ b/drivers/gpu/drm/i915/display/intel_dpt.c
@@ -268,7 +268,7 @@ intel_dpt_create(struct intel_framebuffer *fb)
 
 	ret = i915_gem_object_lock_interruptible(dpt_obj, NULL);
 	if (!ret) {
-		ret = i915_gem_object_set_cache_level(dpt_obj, I915_CACHE_NONE);
+		ret = i915_gem_object_set_cache(dpt_obj, I915_CACHE(UC));
 		i915_gem_object_unlock(dpt_obj);
 	}
 	if (ret) {
diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c
index fffd568070d4..dcf54b354a74 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
+++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
@@ -66,7 +66,7 @@ intel_pin_fb_obj_dpt(struct drm_framebuffer *fb,
 				continue;
 		}
 
-		ret = i915_gem_object_set_cache_level(obj, I915_CACHE_NONE);
+		ret = i915_gem_object_set_cache(obj, I915_CACHE(UC));
 		if (ret)
 			continue;
 
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index 736072a8b2b0..9988f6562392 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -121,8 +121,8 @@ initial_plane_vma(struct drm_i915_private *i915,
 	 * cache_level during fbdev initialization. The
 	 * unbind there would get stuck waiting for rcu.
 	 */
-	i915_gem_object_set_cache_coherency(obj, HAS_WT(i915) ?
-					    I915_CACHE_WT : I915_CACHE_NONE);
+	i915_gem_object_set_cache_coherency(obj, HAS_WT(i915) ? I915_CACHE(WT) :
+								I915_CACHE(UC));
 
 	switch (plane_config->tiling) {
 	case I915_TILING_NONE:
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index dfaaa8b66ac3..f899da2c622a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -8,6 +8,7 @@
 #include "display/intel_frontbuffer.h"
 #include "gt/intel_gt.h"
 
+#include "i915_cache.h"
 #include "i915_drv.h"
 #include "i915_gem_clflush.h"
 #include "i915_gem_domain.h"
@@ -27,15 +28,8 @@ static bool gpu_write_needs_clflush(struct drm_i915_gem_object *obj)
 	if (IS_DGFX(i915))
 		return false;
 
-	/*
-	 * For objects created by userspace through GEM_CREATE with pat_index
-	 * set by set_pat extension, i915_gem_object_has_cache_level() will
-	 * always return true, because the coherency of such object is managed
-	 * by userspace. Othereise the call here would fall back to checking
-	 * whether the object is un-cached or write-through.
-	 */
-	return !(i915_gem_object_has_cache_level(obj, I915_CACHE_NONE) ||
-		 i915_gem_object_has_cache_level(obj, I915_CACHE_WT));
+	return i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC) != 1 &&
+	       i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WT) != 1;
 }
 
 bool i915_gem_cpu_write_needs_clflush(struct drm_i915_gem_object *obj)
@@ -255,9 +249,9 @@ i915_gem_object_set_to_gtt_domain(struct drm_i915_gem_object *obj, bool write)
 }
 
 /**
- * i915_gem_object_set_cache_level - Changes the cache-level of an object across all VMA.
+ * i915_gem_object_set_cache - Changes the cache-level of an object across all VMA.
  * @obj: object to act on
- * @cache_level: new cache level to set for the object
+ * @cache: new caching mode to set for the object
  *
  * After this function returns, the object will be in the new cache-level
  * across all GTT and the contents of the backing storage will be coherent,
@@ -269,19 +263,28 @@ i915_gem_object_set_to_gtt_domain(struct drm_i915_gem_object *obj, bool write)
  * cache coherency) and all non-MOCS GPU access will also be uncached so
  * that all direct access to the scanout remains coherent.
  */
-int i915_gem_object_set_cache_level(struct drm_i915_gem_object *obj,
-				    enum i915_cache_level cache_level)
+int i915_gem_object_set_cache(struct drm_i915_gem_object *obj,
+			      i915_cache_t cache)
 {
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	int ret;
 
-	/*
-	 * For objects created by userspace through GEM_CREATE with pat_index
-	 * set by set_pat extension, simply return 0 here without touching
-	 * the cache setting, because such objects should have an immutable
-	 * cache setting by desgin and always managed by userspace.
-	 */
-	if (i915_gem_object_has_cache_level(obj, cache_level))
+	ret = i915_cache_find_pat(i915, cache);
+	if (ret < 0) {
+		struct drm_printer p =
+			drm_err_printer("Attempting to use unknown caching mode ");
+
+		i915_cache_print(&p, cache);
+		drm_puts(&p, "!\n");
+
+		return -EINVAL;
+	} else if (ret == obj->pat_index) {
 		return 0;
+	} else if (obj->pat_set_by_user) {
+		drm_notice_once(&i915->drm,
+				"Attempting to change caching mode on an object with fixed PAT!\n");
+		return -EINVAL;
+	}
 
 	ret = i915_gem_object_wait(obj,
 				   I915_WAIT_INTERRUPTIBLE |
@@ -291,7 +294,7 @@ int i915_gem_object_set_cache_level(struct drm_i915_gem_object *obj,
 		return ret;
 
 	/* Always invalidate stale cachelines */
-	i915_gem_object_set_cache_coherency(obj, cache_level);
+	i915_gem_object_set_cache_coherency(obj, cache);
 	obj->cache_dirty = true;
 
 	/* The cache-level will be applied when each vma is rebound. */
@@ -326,10 +329,9 @@ int i915_gem_get_caching_ioctl(struct drm_device *dev, void *data,
 		goto out;
 	}
 
-	if (i915_gem_object_has_cache_level(obj, I915_CACHE_LLC) ||
-	    i915_gem_object_has_cache_level(obj, I915_CACHE_L3_LLC))
+	if (i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WB))
 		args->caching = I915_CACHING_CACHED;
-	else if (i915_gem_object_has_cache_level(obj, I915_CACHE_WT))
+	else if (i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WT))
 		args->caching = I915_CACHING_DISPLAY;
 	else
 		args->caching = I915_CACHING_NONE;
@@ -344,7 +346,7 @@ int i915_gem_set_caching_ioctl(struct drm_device *dev, void *data,
 	struct drm_i915_private *i915 = to_i915(dev);
 	struct drm_i915_gem_caching *args = data;
 	struct drm_i915_gem_object *obj;
-	enum i915_cache_level level;
+	i915_cache_t cache;
 	int ret = 0;
 
 	if (IS_DGFX(i915))
@@ -355,7 +357,7 @@ int i915_gem_set_caching_ioctl(struct drm_device *dev, void *data,
 
 	switch (args->caching) {
 	case I915_CACHING_NONE:
-		level = I915_CACHE_NONE;
+		cache = I915_CACHE(UC);
 		break;
 	case I915_CACHING_CACHED:
 		/*
@@ -367,10 +369,10 @@ int i915_gem_set_caching_ioctl(struct drm_device *dev, void *data,
 		if (!HAS_LLC(i915) && !HAS_SNOOP(i915))
 			return -ENODEV;
 
-		level = I915_CACHE_LLC;
+		cache = I915_CACHE(WB);
 		break;
 	case I915_CACHING_DISPLAY:
-		level = HAS_WT(i915) ? I915_CACHE_WT : I915_CACHE_NONE;
+		cache = HAS_WT(i915) ? I915_CACHE(WT) : I915_CACHE(UC);
 		break;
 	default:
 		return -EINVAL;
@@ -409,7 +411,7 @@ int i915_gem_set_caching_ioctl(struct drm_device *dev, void *data,
 	if (ret)
 		goto out;
 
-	ret = i915_gem_object_set_cache_level(obj, level);
+	ret = i915_gem_object_set_cache(obj, cache);
 	i915_gem_object_unlock(obj);
 
 out:
@@ -448,9 +450,9 @@ i915_gem_object_pin_to_display_plane(struct drm_i915_gem_object *obj,
 	 * of uncaching, which would allow us to flush all the LLC-cached data
 	 * with that bit in the PTE to main memory with just one PIPE_CONTROL.
 	 */
-	ret = i915_gem_object_set_cache_level(obj,
-					      HAS_WT(i915) ?
-					      I915_CACHE_WT : I915_CACHE_NONE);
+	ret = i915_gem_object_set_cache(obj,
+					HAS_WT(i915) ?
+					I915_CACHE(WT) : I915_CACHE(UC));
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.h b/drivers/gpu/drm/i915/gem/i915_gem_domain.h
index 9622df962bfc..d07926758b36 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.h
@@ -6,10 +6,11 @@
 #ifndef __I915_GEM_DOMAIN_H__
 #define __I915_GEM_DOMAIN_H__
 
+#include "i915_cache.h"
+
 struct drm_i915_gem_object;
-enum i915_cache_level;
 
-int i915_gem_object_set_cache_level(struct drm_i915_gem_object *obj,
-				    enum i915_cache_level cache_level);
+int i915_gem_object_set_cache(struct drm_i915_gem_object *obj,
+			      i915_cache_t cache);
 
 #endif /* __I915_GEM_DOMAIN_H__ */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index d3208a325614..ee85221fa6eb 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -640,15 +640,9 @@ static inline int use_cpu_reloc(const struct reloc_cache *cache,
 	if (DBG_FORCE_RELOC == FORCE_GTT_RELOC)
 		return false;
 
-	/*
-	 * For objects created by userspace through GEM_CREATE with pat_index
-	 * set by set_pat extension, i915_gem_object_has_cache_level() always
-	 * return true, otherwise the call would fall back to checking whether
-	 * the object is un-cached.
-	 */
 	return (cache->has_llc ||
 		obj->cache_dirty ||
-		!i915_gem_object_has_cache_level(obj, I915_CACHE_NONE));
+		i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC) != 1);
 }
 
 static int eb_reserve_vma(struct i915_execbuffer *eb,
@@ -1329,10 +1323,7 @@ static void *reloc_iomap(struct i915_vma *batch,
 	if (drm_mm_node_allocated(&cache->node)) {
 		ggtt->vm.insert_page(&ggtt->vm,
 				     i915_gem_object_get_dma_address(obj, page),
-				     offset,
-				     i915_gem_get_pat_index(ggtt->vm.i915,
-							    I915_CACHE_NONE),
-				     0);
+				     offset, eb->i915->pat_uc, 0);
 	} else {
 		offset += page << PAGE_SHIFT;
 	}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
index 6bc26b4b06b8..7e7bfe7da76f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
@@ -142,7 +142,6 @@ __i915_gem_object_create_internal(struct drm_i915_private *i915,
 {
 	static struct lock_class_key lock_class;
 	struct drm_i915_gem_object *obj;
-	unsigned int cache_level;
 
 	GEM_BUG_ON(!size);
 	GEM_BUG_ON(!IS_ALIGNED(size, PAGE_SIZE));
@@ -170,8 +169,9 @@ __i915_gem_object_create_internal(struct drm_i915_private *i915,
 	obj->read_domains = I915_GEM_DOMAIN_CPU;
 	obj->write_domain = I915_GEM_DOMAIN_CPU;
 
-	cache_level = HAS_LLC(i915) ? I915_CACHE_LLC : I915_CACHE_NONE;
-	i915_gem_object_set_cache_coherency(obj, cache_level);
+	i915_gem_object_set_cache_coherency(obj, HAS_LLC(i915) ?
+						 I915_CACHE(WB) :
+						 I915_CACHE(UC));
 
 	return obj;
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index aa4d842d4c5a..5e21aedb02d2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -386,13 +386,11 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 	/*
 	 * For objects created by userspace through GEM_CREATE with pat_index
 	 * set by set_pat extension, coherency is managed by userspace, make
-	 * sure we don't fail handling the vm fault by calling
-	 * i915_gem_object_has_cache_level() which always return true for such
-	 * objects. Otherwise this helper function would fall back to checking
-	 * whether the object is un-cached.
+	 * sure we don't fail handling the vm fault by making sure that we
+	 * know the object is uncached or that we have LLC.
 	 */
-	if (!(i915_gem_object_has_cache_level(obj, I915_CACHE_NONE) ||
-	      HAS_LLC(i915))) {
+	if (i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC) != 1 &&
+	    !HAS_LLC(i915)) {
 		ret = -EFAULT;
 		goto err_unpin;
 	}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index d77a375871b7..2d3a58c62122 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -45,33 +45,6 @@ static struct kmem_cache *slab_objects;
 
 static const struct drm_gem_object_funcs i915_gem_object_funcs;
 
-unsigned int i915_gem_get_pat_index(struct drm_i915_private *i915,
-				    enum i915_cache_level level)
-{
-	if (drm_WARN_ON(&i915->drm, level >= I915_MAX_CACHE_LEVEL))
-		return 0;
-
-	return INTEL_INFO(i915)->cachelevel_to_pat[level];
-}
-
-bool i915_gem_object_has_cache_level(const struct drm_i915_gem_object *obj,
-				     enum i915_cache_level lvl)
-{
-	/*
-	 * In case the pat_index is set by user space, this kernel mode
-	 * driver should leave the coherency to be managed by user space,
-	 * simply return true here.
-	 */
-	if (obj->pat_set_by_user)
-		return true;
-
-	/*
-	 * Otherwise the pat_index should have been converted from cache_level
-	 * so that the following comparison is valid.
-	 */
-	return obj->pat_index == i915_gem_get_pat_index(obj_to_i915(obj), lvl);
-}
-
 struct drm_i915_gem_object *i915_gem_object_alloc(void)
 {
 	struct drm_i915_gem_object *obj;
@@ -144,30 +117,70 @@ void __i915_gem_object_fini(struct drm_i915_gem_object *obj)
 	dma_resv_fini(&obj->base._resv);
 }
 
+int i915_gem_object_has_cache_mode(const struct drm_i915_gem_object *obj,
+				   enum i915_cache_mode mode)
+{
+	struct drm_i915_private *i915 = obj_to_i915(obj);
+	i915_cache_t cache = INTEL_INFO(i915)->cache_modes[obj->pat_index];
+
+	if (I915_CACHE_MODE(cache) == mode)
+		return 1;
+	else if (obj->pat_set_by_user)
+		return -1; /* Unknown, callers should assume no. */
+	else
+		return 0;
+}
+
+static void __i915_gem_object_update_coherency(struct drm_i915_gem_object *obj)
+{
+	struct drm_i915_private *i915 = obj_to_i915(obj);
+	i915_cache_t cache = INTEL_INFO(i915)->cache_modes[obj->pat_index];
+	unsigned int mode = I915_CACHE_MODE(cache);
+
+	if (mode == I915_CACHE_MODE_UNKNOWN) {
+		drm_notice_once(&i915->drm, "Undefined PAT index %u!\n",
+				obj->pat_index);
+		obj->cache_coherent = 0;
+	} else  if (mode != I915_CACHE_MODE_UC) {
+		obj->cache_coherent = I915_BO_CACHE_COHERENT_FOR_READ |
+				      I915_BO_CACHE_COHERENT_FOR_WRITE;
+	} else if (HAS_LLC(i915)) {
+		obj->cache_coherent = I915_BO_CACHE_COHERENT_FOR_READ;
+	} else {
+		obj->cache_coherent = 0;
+	}
+
+	obj->cache_dirty =
+		!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE) &&
+		!IS_DGFX(i915);
+}
+
 /**
  * i915_gem_object_set_cache_coherency - Mark up the object's coherency levels
- * for a given cache_level
+ * for a given caching mode
  * @obj: #drm_i915_gem_object
- * @cache_level: cache level
+ * @cache: cache mode
  */
 void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
-					 unsigned int cache_level)
+					 i915_cache_t cache)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = obj_to_i915(obj);
+	int found;
 
-	obj->pat_index = i915_gem_get_pat_index(i915, cache_level);
+	found = i915_cache_find_pat(i915, cache);
+	if (found < 0) {
+		struct drm_printer p =
+			drm_err_printer("Unknown cache mode ");
 
-	if (cache_level != I915_CACHE_NONE)
-		obj->cache_coherent = (I915_BO_CACHE_COHERENT_FOR_READ |
-				       I915_BO_CACHE_COHERENT_FOR_WRITE);
-	else if (HAS_LLC(i915))
-		obj->cache_coherent = I915_BO_CACHE_COHERENT_FOR_READ;
-	else
-		obj->cache_coherent = 0;
+		i915_cache_print(&p, cache);
+		drm_puts(&p, "!\n");
 
-	obj->cache_dirty =
-		!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE) &&
-		!IS_DGFX(i915);
+		found = i915->pat_uc;
+	}
+
+	obj->pat_index = found;
+
+	__i915_gem_object_update_coherency(obj);
 }
 
 /**
@@ -181,24 +194,18 @@ void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
 void i915_gem_object_set_pat_index(struct drm_i915_gem_object *obj,
 				   unsigned int pat_index)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = obj_to_i915(obj);
 
 	if (obj->pat_index == pat_index)
 		return;
 
+	if (drm_WARN_ON_ONCE(&i915->drm,
+			     pat_index > INTEL_INFO(i915)->max_pat_index))
+		return;
+
 	obj->pat_index = pat_index;
 
-	if (pat_index != i915_gem_get_pat_index(i915, I915_CACHE_NONE))
-		obj->cache_coherent = (I915_BO_CACHE_COHERENT_FOR_READ |
-				       I915_BO_CACHE_COHERENT_FOR_WRITE);
-	else if (HAS_LLC(i915))
-		obj->cache_coherent = I915_BO_CACHE_COHERENT_FOR_READ;
-	else
-		obj->cache_coherent = 0;
-
-	obj->cache_dirty =
-		!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE) &&
-		!IS_DGFX(i915);
+	__i915_gem_object_update_coherency(obj);
 }
 
 bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
@@ -215,6 +222,7 @@ bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
 	/*
 	 * Always flush cache for UMD objects at creation time.
 	 */
+	/* QQQ/FIXME why? avoidable performance penalty? */
 	if (obj->pat_set_by_user)
 		return true;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 884a17275b3a..c852e59aeef9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -13,6 +13,7 @@
 
 #include "display/intel_frontbuffer.h"
 #include "intel_memory_region.h"
+#include "i915_cache.h"
 #include "i915_gem_object_types.h"
 #include "i915_gem_gtt.h"
 #include "i915_gem_ww.h"
@@ -32,10 +33,6 @@ static inline bool i915_gem_object_size_2big(u64 size)
 	return false;
 }
 
-unsigned int i915_gem_get_pat_index(struct drm_i915_private *i915,
-				    enum i915_cache_level level);
-bool i915_gem_object_has_cache_level(const struct drm_i915_gem_object *obj,
-				     enum i915_cache_level lvl);
 void i915_gem_init__objects(struct drm_i915_private *i915);
 
 void i915_objects_module_exit(void);
@@ -764,8 +761,10 @@ int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
 				      bool intr);
 bool i915_gem_object_has_unknown_state(struct drm_i915_gem_object *obj);
 
+int i915_gem_object_has_cache_mode(const struct drm_i915_gem_object *obj,
+				   enum i915_cache_mode mode);
 void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
-					 unsigned int cache_level);
+					 i915_cache_t cache);
 void i915_gem_object_set_pat_index(struct drm_i915_gem_object *obj,
 				   unsigned int pat_index);
 bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 8de2b91b3edf..a136d137b980 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -14,6 +14,7 @@
 #include <uapi/drm/i915_drm.h>
 
 #include "i915_active.h"
+#include "i915_cache.h"
 #include "i915_selftest.h"
 #include "i915_vma_resource.h"
 
@@ -116,93 +117,6 @@ struct drm_i915_gem_object_ops {
 	const char *name; /* friendly name for debug, e.g. lockdep classes */
 };
 
-/**
- * enum i915_cache_level - The supported GTT caching values for system memory
- * pages.
- *
- * These translate to some special GTT PTE bits when binding pages into some
- * address space. It also determines whether an object, or rather its pages are
- * coherent with the GPU, when also reading or writing through the CPU cache
- * with those pages.
- *
- * Userspace can also control this through struct drm_i915_gem_caching.
- */
-enum i915_cache_level {
-	/**
-	 * @I915_CACHE_NONE:
-	 *
-	 * GPU access is not coherent with the CPU cache. If the cache is dirty
-	 * and we need the underlying pages to be coherent with some later GPU
-	 * access then we need to manually flush the pages.
-	 *
-	 * On shared LLC platforms reads and writes through the CPU cache are
-	 * still coherent even with this setting. See also
-	 * &drm_i915_gem_object.cache_coherent for more details. Due to this we
-	 * should only ever use uncached for scanout surfaces, otherwise we end
-	 * up over-flushing in some places.
-	 *
-	 * This is the default on non-LLC platforms.
-	 */
-	I915_CACHE_NONE = 0,
-	/**
-	 * @I915_CACHE_LLC:
-	 *
-	 * GPU access is coherent with the CPU cache. If the cache is dirty,
-	 * then the GPU will ensure that access remains coherent, when both
-	 * reading and writing through the CPU cache. GPU writes can dirty the
-	 * CPU cache.
-	 *
-	 * Not used for scanout surfaces.
-	 *
-	 * Applies to both platforms with shared LLC(HAS_LLC), and snooping
-	 * based platforms(HAS_SNOOP).
-	 *
-	 * This is the default on shared LLC platforms.  The only exception is
-	 * scanout objects, where the display engine is not coherent with the
-	 * CPU cache. For such objects I915_CACHE_NONE or I915_CACHE_WT is
-	 * automatically applied by the kernel in pin_for_display, if userspace
-	 * has not done so already.
-	 */
-	I915_CACHE_LLC,
-	/**
-	 * @I915_CACHE_L3_LLC:
-	 *
-	 * Explicitly enable the Gfx L3 cache, with coherent LLC.
-	 *
-	 * The Gfx L3 sits between the domain specific caches, e.g
-	 * sampler/render caches, and the larger LLC. LLC is coherent with the
-	 * GPU, but L3 is only visible to the GPU, so likely needs to be flushed
-	 * when the workload completes.
-	 *
-	 * Not used for scanout surfaces.
-	 *
-	 * Only exposed on some gen7 + GGTT. More recent hardware has dropped
-	 * this explicit setting, where it should now be enabled by default.
-	 */
-	I915_CACHE_L3_LLC,
-	/**
-	 * @I915_CACHE_WT:
-	 *
-	 * Write-through. Used for scanout surfaces.
-	 *
-	 * The GPU can utilise the caches, while still having the display engine
-	 * be coherent with GPU writes, as a result we don't need to flush the
-	 * CPU caches when moving out of the render domain. This is the default
-	 * setting chosen by the kernel, if supported by the HW, otherwise we
-	 * fallback to I915_CACHE_NONE. On the CPU side writes through the CPU
-	 * cache still need to be flushed, to remain coherent with the display
-	 * engine.
-	 */
-	I915_CACHE_WT,
-	/**
-	 * @I915_MAX_CACHE_LEVEL:
-	 *
-	 * Mark the last entry in the enum. Used for defining cachelevel_to_pat
-	 * array for cache_level to pat translation table.
-	 */
-	I915_MAX_CACHE_LEVEL,
-};
-
 enum i915_map_type {
 	I915_MAP_WB = 0,
 	I915_MAP_WC,
@@ -409,9 +323,7 @@ struct drm_i915_gem_object {
 	 * Check for @pat_set_by_user to find out if an object has pat index set
 	 * by userspace. The ioctl's to change cache settings have also been
 	 * disabled for the objects with pat index set by userspace. Please don't
-	 * assume @cache_coherent having the flags set as describe here. A helper
-	 * function i915_gem_object_has_cache_level() provides one way to bypass
-	 * the use of this field.
+	 * assume @cache_coherent having the flags set as describe here.
 	 *
 	 * Track whether the pages are coherent with the GPU if reading or
 	 * writing through the CPU caches. The largely depends on the
@@ -426,7 +338,8 @@ struct drm_i915_gem_object {
 	 * i.e @cache_coherent is zero.
 	 *
 	 * On platforms that share the LLC with the CPU(HAS_LLC), all GT memory
-	 * access will automatically snoop the CPU caches(even with CACHE_NONE).
+	 * access will automatically snoop the CPU caches (even with
+	 * I915_CACHE(UC)).
 	 * The one exception is when dealing with the display engine, like with
 	 * scanout surfaces. To handle this the kernel will always flush the
 	 * surface out of the CPU caches when preparing it for scanout.  Also
@@ -437,8 +350,8 @@ struct drm_i915_gem_object {
 	 * Something strange here is why @cache_coherent is not a simple
 	 * boolean, i.e coherent vs non-coherent. The reasoning for this is back
 	 * to the display engine not being fully coherent. As a result scanout
-	 * surfaces will either be marked as I915_CACHE_NONE or I915_CACHE_WT.
-	 * In the case of seeing I915_CACHE_NONE the kernel makes the assumption
+	 * surfaces will either be marked as I915_CACHE(UC) or I915_CACHE(WT).
+	 * In the case of seeing I915_CACHE(UC) the kernel makes the assumption
 	 * that this is likely a scanout surface, and will set @cache_coherent
 	 * as only I915_BO_CACHE_COHERENT_FOR_READ, on platforms with the shared
 	 * LLC. The kernel uses this to always flush writes through the CPU
@@ -447,7 +360,7 @@ struct drm_i915_gem_object {
 	 * flushing the surface just before doing the scanout.  This does mean
 	 * we might unnecessarily flush non-scanout objects in some places, but
 	 * the default assumption is that all normal objects should be using
-	 * I915_CACHE_LLC, at least on platforms with the shared LLC.
+	 * I915_CACHE(WB), at least on platforms with the shared LLC.
 	 *
 	 * Supported values:
 	 *
@@ -459,13 +372,13 @@ struct drm_i915_gem_object {
 	 * optimisation we try to flush any writes as early as possible to avoid
 	 * stalling later.
 	 *
-	 * Thus for scanout surfaces using I915_CACHE_NONE, on shared LLC
+	 * Thus for scanout surfaces using I915_CACHE(UC), on shared LLC
 	 * platforms, we use:
 	 *
 	 *	cache_coherent = I915_BO_CACHE_COHERENT_FOR_READ
 	 *
 	 * While for normal objects that are fully coherent, including special
-	 * scanout surfaces marked as I915_CACHE_WT, we use:
+	 * scanout surfaces marked as I915_CACHE(WT), we use:
 	 *
 	 *	cache_coherent = I915_BO_CACHE_COHERENT_FOR_READ |
 	 *			 I915_BO_CACHE_COHERENT_FOR_WRITE
@@ -492,9 +405,7 @@ struct drm_i915_gem_object {
 	 * Check for @pat_set_by_user to find out if an object has pat index set
 	 * by userspace. The ioctl's to change cache settings have also been
 	 * disabled for the objects with pat_index set by userspace. Please don't
-	 * assume @cache_dirty is set as describe here. Also see helper function
-	 * i915_gem_object_has_cache_level() for possible ways to bypass the use
-	 * of this field.
+	 * assume @cache_dirty is set as describe here.
 	 *
 	 * Track if we are we dirty with writes through the CPU cache for this
 	 * object. As a result reading directly from main memory might yield
@@ -517,7 +428,7 @@ struct drm_i915_gem_object {
 	 * for both reads and writes though the CPU cache.
 	 *
 	 * Note that on shared LLC platforms we still apply the heavy flush for
-	 * I915_CACHE_NONE objects, under the assumption that this is going to
+	 * I915_CACHE(UC) objects, under the assumption that this is going to
 	 * be used for scanout.
 	 *
 	 * Update: On some hardware there is now also the 'Bypass LLC' MOCS
@@ -530,15 +441,15 @@ struct drm_i915_gem_object {
 	 * information leak. The driver currently ensures:
 	 *
 	 *   1. All userspace objects, by default, have @cache_level set as
-	 *   I915_CACHE_NONE. The only exception is userptr objects, where we
-	 *   instead force I915_CACHE_LLC, but we also don't allow userspace to
+	 *   I915_CACHE(UC). The only exception is userptr objects, where we
+	 *   instead force I915_CACHE(WB), but we also don't allow userspace to
 	 *   ever change the @cache_level for such objects. Another special case
 	 *   is dma-buf, which doesn't rely on @cache_dirty,  but there we
 	 *   always do a forced flush when acquiring the pages, if there is a
 	 *   chance that the pages can be read directly from main memory with
 	 *   the GPU.
 	 *
-	 *   2. All I915_CACHE_NONE objects have @cache_dirty initially true.
+	 *   2. All I915_CACHE(UC) objects have @cache_dirty initially true.
 	 *
 	 *   3. All swapped-out objects(i.e shmem) have @cache_dirty set to
 	 *   true.
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 33d5d5178103..538b3029de35 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -375,7 +375,7 @@ __i915_gem_object_release_shmem(struct drm_i915_gem_object *obj,
 	 * On non-LLC igfx platforms, force the flush-on-acquire if this is ever
 	 * swapped-in. Our async flush path is not trust worthy enough yet(and
 	 * happens in the wrong order), and with some tricks it's conceivable
-	 * for userspace to change the cache-level to I915_CACHE_NONE after the
+	 * for userspace to change the cache-level to I915_CACHE(UC) after the
 	 * pages are swapped-in, and since execbuf binds the object before doing
 	 * the async flush, we have a race window.
 	 */
@@ -577,7 +577,7 @@ static int shmem_object_init(struct intel_memory_region *mem,
 	static struct lock_class_key lock_class;
 	struct drm_i915_private *i915 = mem->i915;
 	struct address_space *mapping;
-	unsigned int cache_level;
+	i915_cache_t cache;
 	gfp_t mask;
 	int ret;
 
@@ -621,11 +621,11 @@ static int shmem_object_init(struct intel_memory_region *mem,
 		 * However, we maintain the display planes as UC, and so
 		 * need to rebind when first used as such.
 		 */
-		cache_level = I915_CACHE_LLC;
+		cache = I915_CACHE(WB);
 	else
-		cache_level = I915_CACHE_NONE;
+		cache = I915_CACHE(UC);
 
-	i915_gem_object_set_cache_coherency(obj, cache_level);
+	i915_gem_object_set_cache_coherency(obj, cache);
 
 	i915_gem_object_init_memory_region(obj, mem);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 3b094d36a0b0..e3a3b824a536 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -563,11 +563,8 @@ static void dbg_poison(struct i915_ggtt *ggtt,
 	while (size) {
 		void __iomem *s;
 
-		ggtt->vm.insert_page(&ggtt->vm, addr,
-				     ggtt->error_capture.start,
-				     i915_gem_get_pat_index(ggtt->vm.i915,
-							    I915_CACHE_NONE),
-				     0);
+		ggtt->vm.insert_page(&ggtt->vm, addr, ggtt->error_capture.start,
+				     ggtt->vm.i915->pat_uc, 0);
 		mb();
 
 		s = io_mapping_map_wc(&ggtt->iomap,
@@ -679,7 +676,6 @@ static int __i915_gem_object_create_stolen(struct intel_memory_region *mem,
 					   struct drm_mm_node *stolen)
 {
 	static struct lock_class_key lock_class;
-	unsigned int cache_level;
 	unsigned int flags;
 	int err;
 
@@ -694,8 +690,9 @@ static int __i915_gem_object_create_stolen(struct intel_memory_region *mem,
 
 	obj->stolen = stolen;
 	obj->read_domains = I915_GEM_DOMAIN_CPU | I915_GEM_DOMAIN_GTT;
-	cache_level = HAS_LLC(mem->i915) ? I915_CACHE_LLC : I915_CACHE_NONE;
-	i915_gem_object_set_cache_coherency(obj, cache_level);
+	i915_gem_object_set_cache_coherency(obj, HAS_LLC(mem->i915) ?
+						 I915_CACHE(WB) :
+						 I915_CACHE(UC));
 
 	if (WARN_ON(!i915_gem_object_trylock(obj, NULL)))
 		return -EBUSY;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 7078af2f8f79..52c0273001b2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -48,14 +48,23 @@ void i915_ttm_migrate_set_ban_memcpy(bool ban)
 }
 #endif
 
-static enum i915_cache_level
-i915_ttm_cache_level(struct drm_i915_private *i915, struct ttm_resource *res,
+static i915_cache_t
+i915_ttm_cache(struct drm_i915_private *i915, struct ttm_resource *res,
+	       struct ttm_tt *ttm)
+{
+	return ((HAS_LLC(i915) || HAS_SNOOP(i915)) &&
+		!i915_ttm_gtt_binds_lmem(res) &&
+		ttm->caching == ttm_cached) ? I915_CACHE(WB) : I915_CACHE(UC);
+}
+
+static unsigned int
+i915_ttm_cache_pat(struct drm_i915_private *i915, struct ttm_resource *res,
 		     struct ttm_tt *ttm)
 {
 	return ((HAS_LLC(i915) || HAS_SNOOP(i915)) &&
 		!i915_ttm_gtt_binds_lmem(res) &&
-		ttm->caching == ttm_cached) ? I915_CACHE_LLC :
-		I915_CACHE_NONE;
+		ttm->caching == ttm_cached) ? i915->pat_wb :
+		i915->pat_uc;
 }
 
 static struct intel_memory_region *
@@ -102,8 +111,8 @@ void i915_ttm_adjust_domains_after_move(struct drm_i915_gem_object *obj)
 void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
 {
 	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
-	unsigned int cache_level;
 	unsigned int mem_flags;
+	i915_cache_t cache;
 	unsigned int i;
 	int mem_type;
 
@@ -116,13 +125,13 @@ void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
 	if (!bo->resource) {
 		mem_flags = I915_BO_FLAG_STRUCT_PAGE;
 		mem_type = I915_PL_SYSTEM;
-		cache_level = I915_CACHE_NONE;
+		cache = I915_CACHE(UC);
 	} else {
 		mem_flags = i915_ttm_cpu_maps_iomem(bo->resource) ? I915_BO_FLAG_IOMEM :
 			I915_BO_FLAG_STRUCT_PAGE;
 		mem_type = bo->resource->mem_type;
-		cache_level = i915_ttm_cache_level(to_i915(bo->base.dev), bo->resource,
-						   bo->ttm);
+		cache = i915_ttm_cache(to_i915(bo->base.dev), bo->resource,
+				       bo->ttm);
 	}
 
 	/*
@@ -147,7 +156,7 @@ void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
 	obj->mem_flags &= ~(I915_BO_FLAG_STRUCT_PAGE | I915_BO_FLAG_IOMEM);
 	obj->mem_flags |= mem_flags;
 
-	i915_gem_object_set_cache_coherency(obj, cache_level);
+	i915_gem_object_set_cache_coherency(obj, cache);
 }
 
 /**
@@ -196,7 +205,7 @@ static struct dma_fence *i915_ttm_accel_move(struct ttm_buffer_object *bo,
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 	struct i915_request *rq;
 	struct ttm_tt *src_ttm = bo->ttm;
-	enum i915_cache_level src_level, dst_level;
+	unsigned int src_pat, dst_pat;
 	int ret;
 
 	if (!to_gt(i915)->migrate.context || intel_gt_is_wedged(to_gt(i915)))
@@ -206,16 +215,15 @@ static struct dma_fence *i915_ttm_accel_move(struct ttm_buffer_object *bo,
 	if (I915_SELFTEST_ONLY(fail_gpu_migration))
 		clear = true;
 
-	dst_level = i915_ttm_cache_level(i915, dst_mem, dst_ttm);
+	dst_pat = i915_ttm_cache_pat(i915, dst_mem, dst_ttm);
 	if (clear) {
 		if (bo->type == ttm_bo_type_kernel &&
 		    !I915_SELFTEST_ONLY(fail_gpu_migration))
 			return ERR_PTR(-EINVAL);
 
 		intel_engine_pm_get(to_gt(i915)->migrate.context->engine);
-		ret = intel_context_migrate_clear(to_gt(i915)->migrate.context, deps,
-						  dst_st->sgl,
-						  i915_gem_get_pat_index(i915, dst_level),
+		ret = intel_context_migrate_clear(to_gt(i915)->migrate.context,
+						  deps, dst_st->sgl, dst_pat,
 						  i915_ttm_gtt_binds_lmem(dst_mem),
 						  0, &rq);
 	} else {
@@ -225,14 +233,13 @@ static struct dma_fence *i915_ttm_accel_move(struct ttm_buffer_object *bo,
 		if (IS_ERR(src_rsgt))
 			return ERR_CAST(src_rsgt);
 
-		src_level = i915_ttm_cache_level(i915, bo->resource, src_ttm);
+		src_pat = i915_ttm_cache_pat(i915, bo->resource, src_ttm);
 		intel_engine_pm_get(to_gt(i915)->migrate.context->engine);
 		ret = intel_context_migrate_copy(to_gt(i915)->migrate.context,
 						 deps, src_rsgt->table.sgl,
-						 i915_gem_get_pat_index(i915, src_level),
+						 src_pat,
 						 i915_ttm_gtt_binds_lmem(bo->resource),
-						 dst_st->sgl,
-						 i915_gem_get_pat_index(i915, dst_level),
+						 dst_st->sgl, dst_pat,
 						 i915_ttm_gtt_binds_lmem(dst_mem),
 						 &rq);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 1d3ebdf4069b..7d50d43dfbfa 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -553,7 +553,7 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
 	obj->mem_flags = I915_BO_FLAG_STRUCT_PAGE;
 	obj->read_domains = I915_GEM_DOMAIN_CPU;
 	obj->write_domain = I915_GEM_DOMAIN_CPU;
-	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
+	i915_gem_object_set_cache_coherency(obj, I915_CACHE(WB));
 
 	obj->userptr.ptr = args->user_ptr;
 	obj->userptr.notifier_seq = ULONG_MAX;
diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c b/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c
index bac957755068..ad7798d34c74 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c
@@ -104,7 +104,6 @@ huge_gem_object(struct drm_i915_private *i915,
 {
 	static struct lock_class_key lock_class;
 	struct drm_i915_gem_object *obj;
-	unsigned int cache_level;
 
 	GEM_BUG_ON(!phys_size || phys_size > dma_size);
 	GEM_BUG_ON(!IS_ALIGNED(phys_size, PAGE_SIZE));
@@ -123,8 +122,9 @@ huge_gem_object(struct drm_i915_private *i915,
 
 	obj->read_domains = I915_GEM_DOMAIN_CPU;
 	obj->write_domain = I915_GEM_DOMAIN_CPU;
-	cache_level = HAS_LLC(i915) ? I915_CACHE_LLC : I915_CACHE_NONE;
-	i915_gem_object_set_cache_coherency(obj, cache_level);
+	i915_gem_object_set_cache_coherency(obj, HAS_LLC(i915) ?
+						 I915_CACHE(WB) :
+						 I915_CACHE(UC));
 	obj->scratch = phys_size;
 
 	return obj;
diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index df6c9a84252c..060830c51c2f 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -177,7 +177,6 @@ huge_pages_object(struct drm_i915_private *i915,
 {
 	static struct lock_class_key lock_class;
 	struct drm_i915_gem_object *obj;
-	unsigned int cache_level;
 
 	GEM_BUG_ON(!size);
 	GEM_BUG_ON(!IS_ALIGNED(size, BIT(__ffs(page_mask))));
@@ -200,8 +199,9 @@ huge_pages_object(struct drm_i915_private *i915,
 	obj->write_domain = I915_GEM_DOMAIN_CPU;
 	obj->read_domains = I915_GEM_DOMAIN_CPU;
 
-	cache_level = HAS_LLC(i915) ? I915_CACHE_LLC : I915_CACHE_NONE;
-	i915_gem_object_set_cache_coherency(obj, cache_level);
+	i915_gem_object_set_cache_coherency(obj, HAS_LLC(i915) ?
+						 I915_CACHE(WB) :
+						 I915_CACHE(UC));
 
 	obj->mm.page_mask = page_mask;
 
@@ -354,7 +354,7 @@ fake_huge_pages_object(struct drm_i915_private *i915, u64 size, bool single)
 
 	obj->write_domain = I915_GEM_DOMAIN_CPU;
 	obj->read_domains = I915_GEM_DOMAIN_CPU;
-	obj->pat_index = i915_gem_get_pat_index(i915, I915_CACHE_NONE);
+	i915_gem_object_set_cache_coherency(obj, I915_CACHE(UC));
 
 	return obj;
 }
diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
index c2bdc133c89a..fb69f667652a 100644
--- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
@@ -226,9 +226,7 @@ static int gen6_ppgtt_init_scratch(struct gen6_ppgtt *ppgtt)
 		return ret;
 
 	vm->scratch[0]->encode =
-		vm->pte_encode(px_dma(vm->scratch[0]),
-			       i915_gem_get_pat_index(vm->i915,
-						      I915_CACHE_NONE),
+		vm->pte_encode(px_dma(vm->scratch[0]), vm->i915->pat_uc,
 			       PTE_READ_ONLY);
 
 	vm->scratch[1] = vm->alloc_pt_dma(vm, I915_GTT_PAGE_SIZE_4K);
diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index f948d33e5ec5..bd5a7d295251 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -16,11 +16,11 @@
 #include "intel_gtt.h"
 
 static u64 gen8_pde_encode(const dma_addr_t addr,
-			   const enum i915_cache_level level)
+			   const enum i915_cache_mode cache_mode)
 {
 	u64 pde = addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
 
-	if (level != I915_CACHE_NONE)
+	if (cache_mode != I915_CACHE_MODE_UC)
 		pde |= PPAT_CACHED_PDE;
 	else
 		pde |= PPAT_UNCACHED;
@@ -40,16 +40,11 @@ static u64 gen8_pte_encode(dma_addr_t addr,
 	if (flags & PTE_LM)
 		pte |= GEN12_PPGTT_PTE_LM;
 
-	/*
-	 * For pre-gen12 platforms pat_index is the same as enum
-	 * i915_cache_level, so the switch-case here is still valid.
-	 * See translation table defined by LEGACY_CACHELEVEL.
-	 */
 	switch (pat_index) {
-	case I915_CACHE_NONE:
+	case 0:
 		pte |= PPAT_UNCACHED;
 		break;
-	case I915_CACHE_WT:
+	case 3:
 		pte |= PPAT_DISPLAY_ELLC;
 		break;
 	default:
@@ -853,9 +848,7 @@ static int gen8_init_scratch(struct i915_address_space *vm)
 		pte_flags |= PTE_LM;
 
 	vm->scratch[0]->encode =
-		vm->pte_encode(px_dma(vm->scratch[0]),
-			       i915_gem_get_pat_index(vm->i915,
-						      I915_CACHE_NONE),
+		vm->pte_encode(px_dma(vm->scratch[0]), vm->i915->pat_uc,
 			       pte_flags);
 
 	for (i = 1; i <= vm->top; i++) {
@@ -874,7 +867,7 @@ static int gen8_init_scratch(struct i915_address_space *vm)
 		}
 
 		fill_px(obj, vm->scratch[i - 1]->encode);
-		obj->encode = gen8_pde_encode(px_dma(obj), I915_CACHE_NONE);
+		obj->encode = gen8_pde_encode(px_dma(obj), I915_CACHE_MODE_UC);
 
 		vm->scratch[i] = obj;
 	}
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 0aff5bb13c53..b1e846682cd9 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1103,7 +1103,7 @@ static int init_status_page(struct intel_engine_cs *engine)
 		return PTR_ERR(obj);
 	}
 
-	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
+	i915_gem_object_set_cache_coherency(obj, I915_CACHE(WB));
 
 	vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL);
 	if (IS_ERR(vma)) {
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index dd0ed941441a..05fafb076556 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -921,9 +921,7 @@ static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
 		pte_flags |= PTE_LM;
 
 	ggtt->vm.scratch[0]->encode =
-		ggtt->vm.pte_encode(px_dma(ggtt->vm.scratch[0]),
-				    i915_gem_get_pat_index(i915,
-							   I915_CACHE_NONE),
+		ggtt->vm.pte_encode(px_dma(ggtt->vm.scratch[0]), i915->pat_uc,
 				    pte_flags);
 
 	return 0;
@@ -1013,11 +1011,6 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
 	return ggtt_probe_common(ggtt, size);
 }
 
-/*
- * For pre-gen8 platforms pat_index is the same as enum i915_cache_level,
- * so the switch-case statements in these PTE encode functions are still valid.
- * See translation table LEGACY_CACHELEVEL.
- */
 static u64 snb_pte_encode(dma_addr_t addr,
 			  unsigned int pat_index,
 			  u32 flags)
@@ -1025,11 +1018,11 @@ static u64 snb_pte_encode(dma_addr_t addr,
 	gen6_pte_t pte = GEN6_PTE_ADDR_ENCODE(addr) | GEN6_PTE_VALID;
 
 	switch (pat_index) {
-	case I915_CACHE_L3_LLC:
-	case I915_CACHE_LLC:
+	case 1:
+	case 2:
 		pte |= GEN6_PTE_CACHE_LLC;
 		break;
-	case I915_CACHE_NONE:
+	case 0:
 		pte |= GEN6_PTE_UNCACHED;
 		break;
 	default:
@@ -1046,13 +1039,13 @@ static u64 ivb_pte_encode(dma_addr_t addr,
 	gen6_pte_t pte = GEN6_PTE_ADDR_ENCODE(addr) | GEN6_PTE_VALID;
 
 	switch (pat_index) {
-	case I915_CACHE_L3_LLC:
+	case 2:
 		pte |= GEN7_PTE_CACHE_L3_LLC;
 		break;
-	case I915_CACHE_LLC:
+	case 1:
 		pte |= GEN6_PTE_CACHE_LLC;
 		break;
-	case I915_CACHE_NONE:
+	case 0:
 		pte |= GEN6_PTE_UNCACHED;
 		break;
 	default:
@@ -1071,7 +1064,7 @@ static u64 byt_pte_encode(dma_addr_t addr,
 	if (!(flags & PTE_READ_ONLY))
 		pte |= BYT_PTE_WRITEABLE;
 
-	if (pat_index != I915_CACHE_NONE)
+	if (pat_index)
 		pte |= BYT_PTE_SNOOPED_BY_CPU_CACHES;
 
 	return pte;
@@ -1083,7 +1076,7 @@ static u64 hsw_pte_encode(dma_addr_t addr,
 {
 	gen6_pte_t pte = HSW_PTE_ADDR_ENCODE(addr) | GEN6_PTE_VALID;
 
-	if (pat_index != I915_CACHE_NONE)
+	if (pat_index)
 		pte |= HSW_WB_LLC_AGE3;
 
 	return pte;
@@ -1096,9 +1089,9 @@ static u64 iris_pte_encode(dma_addr_t addr,
 	gen6_pte_t pte = HSW_PTE_ADDR_ENCODE(addr) | GEN6_PTE_VALID;
 
 	switch (pat_index) {
-	case I915_CACHE_NONE:
+	case 0:
 		break;
-	case I915_CACHE_WT:
+	case 3:
 		pte |= HSW_WT_ELLC_LLC_AGE3;
 		break;
 	default:
@@ -1298,9 +1291,7 @@ bool i915_ggtt_resume_vm(struct i915_address_space *vm)
 		 */
 		vma->resource->bound_flags = 0;
 		vma->ops->bind_vma(vm, NULL, vma->resource,
-				   obj ? obj->pat_index :
-					 i915_gem_get_pat_index(vm->i915,
-								I915_CACHE_NONE),
+				   obj ? obj->pat_index : vm->i915->pat_uc,
 				   was_bound);
 
 		if (obj) { /* only used during resume => exclusive access */
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c b/drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c
index 866c416afb73..fedf02c9ecb6 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c
@@ -21,7 +21,7 @@ static void gmch_ggtt_insert_page(struct i915_address_space *vm,
 				  unsigned int pat_index,
 				  u32 unused)
 {
-	unsigned int flags = (pat_index == I915_CACHE_NONE) ?
+	unsigned int flags = (pat_index == 0) ?
 		AGP_USER_MEMORY : AGP_USER_CACHED_MEMORY;
 
 	intel_gmch_gtt_insert_page(addr, offset >> PAGE_SHIFT, flags);
@@ -32,7 +32,7 @@ static void gmch_ggtt_insert_entries(struct i915_address_space *vm,
 				     unsigned int pat_index,
 				     u32 unused)
 {
-	unsigned int flags = (pat_index == I915_CACHE_NONE) ?
+	unsigned int flags = (pat_index == 0) ?
 		AGP_USER_MEMORY : AGP_USER_CACHED_MEMORY;
 
 	intel_gmch_gtt_insert_sg_entries(vma_res->bi.pages, vma_res->start >> PAGE_SHIFT,
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 126269a0d728..8729eb244d28 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -676,7 +676,7 @@ __vm_create_scratch_for_read(struct i915_address_space *vm, unsigned long size)
 	if (IS_ERR(obj))
 		return ERR_CAST(obj);
 
-	i915_gem_object_set_cache_coherency(obj, I915_CACHING_CACHED);
+	i915_gem_object_set_cache_coherency(obj, I915_CACHE(WB));
 
 	vma = i915_vma_instance(obj, vm, NULL);
 	if (IS_ERR(vma)) {
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 7192a534a654..af4277c1d577 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -636,7 +636,8 @@ void
 __set_pd_entry(struct i915_page_directory * const pd,
 	       const unsigned short idx,
 	       struct i915_page_table *pt,
-	       u64 (*encode)(const dma_addr_t, const enum i915_cache_level));
+	       u64 (*encode)(const dma_addr_t,
+			     const enum i915_cache_mode cache_mode));
 
 #define set_pd_entry(pd, idx, to) \
 	__set_pd_entry((pd), (idx), px_pt(to), gen8_pde_encode)
diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 6023288b0e2d..81f7834cc2db 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -45,9 +45,7 @@ static void xehpsdv_toggle_pdes(struct i915_address_space *vm,
 	 * Insert a dummy PTE into every PT that will map to LMEM to ensure
 	 * we have a correctly setup PDE structure for later use.
 	 */
-	vm->insert_page(vm, 0, d->offset,
-			i915_gem_get_pat_index(vm->i915, I915_CACHE_NONE),
-			PTE_LM);
+	vm->insert_page(vm, 0, d->offset, vm->i915->pat_uc, PTE_LM);
 	GEM_BUG_ON(!pt->is_compact);
 	d->offset += SZ_2M;
 }
@@ -65,9 +63,7 @@ static void xehpsdv_insert_pte(struct i915_address_space *vm,
 	 * alignment is 64K underneath for the pt, and we are careful
 	 * not to access the space in the void.
 	 */
-	vm->insert_page(vm, px_dma(pt), d->offset,
-			i915_gem_get_pat_index(vm->i915, I915_CACHE_NONE),
-			PTE_LM);
+	vm->insert_page(vm, px_dma(pt), d->offset, vm->i915->pat_uc, PTE_LM);
 	d->offset += SZ_64K;
 }
 
@@ -77,8 +73,7 @@ static void insert_pte(struct i915_address_space *vm,
 {
 	struct insert_pte_data *d = data;
 
-	vm->insert_page(vm, px_dma(pt), d->offset,
-			i915_gem_get_pat_index(vm->i915, I915_CACHE_NONE),
+	vm->insert_page(vm, px_dma(pt), d->offset, vm->i915->pat_uc,
 			i915_gem_object_is_lmem(pt->base) ? PTE_LM : 0);
 	d->offset += PAGE_SIZE;
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
index 436756bfbb1a..3e461d4f3693 100644
--- a/drivers/gpu/drm/i915/gt/intel_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
@@ -98,14 +98,16 @@ void
 __set_pd_entry(struct i915_page_directory * const pd,
 	       const unsigned short idx,
 	       struct i915_page_table * const to,
-	       u64 (*encode)(const dma_addr_t, const enum i915_cache_level))
+	       u64 (*encode)(const dma_addr_t,
+			     const enum i915_cache_mode cache_mode))
 {
 	/* Each thread pre-pins the pd, and we may have a thread per pde. */
 	GEM_BUG_ON(atomic_read(px_used(pd)) > NALLOC * I915_PDES);
 
 	atomic_inc(px_used(pd));
 	pd->entry[idx] = to;
-	write_dma_entry(px_base(pd), idx, encode(px_dma(to), I915_CACHE_LLC));
+	write_dma_entry(px_base(pd), idx,
+			encode(px_dma(to), I915_CACHE_MODE_WB));
 }
 
 void
diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index 3fd795c3263f..fc7781b47bbf 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -551,7 +551,7 @@ alloc_context_vma(struct intel_engine_cs *engine)
 	 * later platforms don't have L3 control bits in the PTE.
 	 */
 	if (IS_IVYBRIDGE(i915))
-		i915_gem_object_set_cache_coherency(obj, I915_CACHE_L3_LLC);
+		i915_gem_object_set_cache_coherency(obj, _I915_CACHE(WB, L3));
 
 	vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL);
 	if (IS_ERR(vma)) {
diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
index b9640212d659..ceb2616fb8d9 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline.c
+++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
@@ -26,7 +26,7 @@ static struct i915_vma *hwsp_alloc(struct intel_gt *gt)
 	if (IS_ERR(obj))
 		return ERR_CAST(obj);
 
-	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
+	i915_gem_object_set_cache_coherency(obj, I915_CACHE(WB));
 
 	vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
 	if (IS_ERR(vma))
diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
index 8b0d84f2aad2..f0baf86b6848 100644
--- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
@@ -64,7 +64,7 @@ static int hang_init(struct hang *h, struct intel_gt *gt)
 		goto err_hws;
 	}
 
-	i915_gem_object_set_cache_coherency(h->hws, I915_CACHE_LLC);
+	i915_gem_object_set_cache_coherency(h->hws, I915_CACHE(WB));
 	vaddr = i915_gem_object_pin_map_unlocked(h->hws, I915_MAP_WB);
 	if (IS_ERR(vaddr)) {
 		err = PTR_ERR(vaddr);
diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
index 3def5ca72dec..a67ede65d816 100644
--- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
+++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
@@ -904,8 +904,7 @@ static int perf_clear_blt(void *arg)
 
 		err = __perf_clear_blt(gt->migrate.context,
 				       dst->mm.pages->sgl,
-				       i915_gem_get_pat_index(gt->i915,
-							      I915_CACHE_NONE),
+				       gt->i915->pat_uc,
 				       i915_gem_object_is_lmem(dst),
 				       sizes[i]);
 
@@ -995,12 +994,10 @@ static int perf_copy_blt(void *arg)
 
 		err = __perf_copy_blt(gt->migrate.context,
 				      src->mm.pages->sgl,
-				      i915_gem_get_pat_index(gt->i915,
-							     I915_CACHE_NONE),
+				      gt->i915->pat_uc,
 				      i915_gem_object_is_lmem(src),
 				      dst->mm.pages->sgl,
-				      i915_gem_get_pat_index(gt->i915,
-							     I915_CACHE_NONE),
+				      gt->i915->pat_uc,
 				      i915_gem_object_is_lmem(dst),
 				      sz);
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
index 79aa6ac66ad2..327dc9294e0f 100644
--- a/drivers/gpu/drm/i915/gt/selftest_reset.c
+++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
@@ -84,11 +84,8 @@ __igt_reset_stolen(struct intel_gt *gt,
 		void __iomem *s;
 		void *in;
 
-		ggtt->vm.insert_page(&ggtt->vm, dma,
-				     ggtt->error_capture.start,
-				     i915_gem_get_pat_index(gt->i915,
-							    I915_CACHE_NONE),
-				     0);
+		ggtt->vm.insert_page(&ggtt->vm, dma, ggtt->error_capture.start,
+				     gt->i915->pat_uc, 0);
 		mb();
 
 		s = io_mapping_map_wc(&ggtt->iomap,
@@ -127,11 +124,8 @@ __igt_reset_stolen(struct intel_gt *gt,
 		void *in;
 		u32 x;
 
-		ggtt->vm.insert_page(&ggtt->vm, dma,
-				     ggtt->error_capture.start,
-				     i915_gem_get_pat_index(gt->i915,
-							    I915_CACHE_NONE),
-				     0);
+		ggtt->vm.insert_page(&ggtt->vm, dma, ggtt->error_capture.start,
+				     gt->i915->pat_uc, 0);
 		mb();
 
 		s = io_mapping_map_wc(&ggtt->iomap,
diff --git a/drivers/gpu/drm/i915/gt/selftest_timeline.c b/drivers/gpu/drm/i915/gt/selftest_timeline.c
index 39c3ec12df1a..87299158815f 100644
--- a/drivers/gpu/drm/i915/gt/selftest_timeline.c
+++ b/drivers/gpu/drm/i915/gt/selftest_timeline.c
@@ -837,6 +837,7 @@ static int setup_watcher(struct hwsp_watcher *w, struct intel_gt *gt,
 
 	/* keep the same cache settings as timeline */
 	i915_gem_object_set_pat_index(obj, tl->hwsp_ggtt->obj->pat_index);
+
 	w->map = i915_gem_object_pin_map_unlocked(obj,
 						  page_unmask_bits(tl->hwsp_ggtt->obj->mm.mapping));
 	if (IS_ERR(w->map)) {
diff --git a/drivers/gpu/drm/i915/gt/selftest_tlb.c b/drivers/gpu/drm/i915/gt/selftest_tlb.c
index 3bd6b540257b..6049f01be219 100644
--- a/drivers/gpu/drm/i915/gt/selftest_tlb.c
+++ b/drivers/gpu/drm/i915/gt/selftest_tlb.c
@@ -36,8 +36,6 @@ pte_tlbinv(struct intel_context *ce,
 	   u64 length,
 	   struct rnd_state *prng)
 {
-	const unsigned int pat_index =
-		i915_gem_get_pat_index(ce->vm->i915, I915_CACHE_NONE);
 	struct drm_i915_gem_object *batch;
 	struct drm_mm_node vb_node;
 	struct i915_request *rq;
@@ -157,7 +155,8 @@ pte_tlbinv(struct intel_context *ce,
 		/* Flip the PTE between A and B */
 		if (i915_gem_object_is_lmem(vb->obj))
 			pte_flags |= PTE_LM;
-		ce->vm->insert_entries(ce->vm, &vb_res, pat_index, pte_flags);
+		ce->vm->insert_entries(ce->vm, &vb_res, ce->vm->i915->pat_uc,
+				       pte_flags);
 
 		/* Flush the PTE update to concurrent HW */
 		tlbinv(ce->vm, addr & -length, length);
diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
index 14a8b25b6204..900b4e19087f 100644
--- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
@@ -111,7 +111,7 @@ read_nonprivs(struct intel_context *ce)
 	if (IS_ERR(result))
 		return result;
 
-	i915_gem_object_set_cache_coherency(result, I915_CACHE_LLC);
+	i915_gem_object_set_cache_coherency(result, I915_CACHE(WB));
 
 	cs = i915_gem_object_pin_map_unlocked(result, I915_MAP_WB);
 	if (IS_ERR(cs)) {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 2eb891b270ae..3a862051423c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -749,7 +749,7 @@ struct i915_vma *intel_guc_allocate_vma(struct intel_guc *guc, u32 size)
 	 * as WC on CPU side and UC (PAT index 2) on GPU side
 	 */
 	if (IS_METEORLAKE(gt->i915))
-		i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
+		i915_gem_object_set_cache_coherency(obj, I915_CACHE(UC));
 
 	vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
 	if (IS_ERR(vma))
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index d408856ae4c0..e099414d624d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -991,14 +991,10 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
 
 	if (ggtt->vm.raw_insert_entries)
 		ggtt->vm.raw_insert_entries(&ggtt->vm, vma_res,
-					    i915_gem_get_pat_index(ggtt->vm.i915,
-								   I915_CACHE_NONE),
-					    pte_flags);
+					    ggtt->vm.i915->pat_uc, pte_flags);
 	else
 		ggtt->vm.insert_entries(&ggtt->vm, vma_res,
-					i915_gem_get_pat_index(ggtt->vm.i915,
-							       I915_CACHE_NONE),
-					pte_flags);
+					ggtt->vm.i915->pat_uc, pte_flags);
 }
 
 static void uc_fw_unbind_ggtt(struct intel_uc_fw *uc_fw)
diff --git a/drivers/gpu/drm/i915/i915_cache.c b/drivers/gpu/drm/i915/i915_cache.c
new file mode 100644
index 000000000000..4d0033bf1658
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_cache.c
@@ -0,0 +1,72 @@
+/*
+ * SPDX-License-Identifier: MIT
+ *
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <drm/drm_print.h>
+
+#include "i915_cache.h"
+#include "i915_drv.h"
+
+int i915_cache_init(struct drm_i915_private *i915)
+{
+	int ret;
+
+	ret = i915_cache_find_pat(i915, I915_CACHE(UC));
+	if (ret < 0)
+		return -ENODEV;
+	drm_info(&i915->drm, "Using PAT index %u for uncached access\n", ret);
+	i915->pat_uc = ret;
+
+	ret = i915_cache_find_pat(i915, I915_CACHE(WB));
+	if (ret < 0)
+		return -ENODEV;
+	drm_info(&i915->drm, "Using PAT index %u for write-back access\n", ret);
+	i915->pat_wb = ret;
+
+	return 0;
+}
+
+int i915_cache_find_pat(struct drm_i915_private *i915, i915_cache_t cache)
+{
+	const struct intel_device_info *info = INTEL_INFO(i915);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(info->cache_modes); i++) {
+		if (info->cache_modes[i] == cache)
+			return i;
+	}
+
+	return -1;
+}
+
+void i915_cache_print(struct drm_printer *p, i915_cache_t cache)
+{
+	const enum i915_cache_mode mode = I915_CACHE_MODE(cache);
+	const unsigned long flags = I915_CACHE_FLAGS(cache);
+	static const char *mode_str[] = {
+		[I915_CACHE_MODE_UC] = "UC",
+		[I915_CACHE_MODE_WB] = "WB",
+		[I915_CACHE_MODE_WT] = "WT",
+		[I915_CACHE_MODE_WC] = "WC",
+	};
+	static const char *flag_str[] = {
+		[I915_CACHE_FLAG_L3] = "L3",
+		[I915_CACHE_FLAG_COH1W] = "1-Way-Coherent",
+		[I915_CACHE_FLAG_COH2W] = "2-Way-Coherent",
+		[I915_CACHE_FLAG_CLOS1] = "CLOS1",
+		[I915_CACHE_FLAG_CLOS2] = "CLOS2",
+	};
+
+	if (mode == I915_CACHE_MODE_UNKNOWN || mode > ARRAY_SIZE(mode_str)) {
+		drm_printf(p, "0x%x", cache);
+	} else {
+		unsigned long bit;
+
+		drm_printf(p, "%s", mode_str[mode]);
+
+		for_each_set_bit(bit, &flags, sizeof(i915_cache_t))
+			drm_printf(p, "-%s", flag_str[bit]);
+	}
+}
diff --git a/drivers/gpu/drm/i915/i915_cache.h b/drivers/gpu/drm/i915/i915_cache.h
new file mode 100644
index 000000000000..ffb621d8a8a0
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_cache.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __I915_CACHE_H__
+#define __I915_CACHE_H__
+
+#include <linux/types.h>
+
+struct drm_printer;
+
+struct drm_i915_private;
+
+typedef u16 i915_cache_t;
+
+#define I915_CACHE(mode) \
+	(i915_cache_t)(I915_CACHE_MODE_##mode)
+
+#define _I915_CACHE(mode, flag) \
+	(i915_cache_t)((I915_CACHE_MODE_##mode) | \
+		       (BIT(8 + I915_CACHE_FLAG_##flag)))
+
+#define I915_CACHE_MODE(cache) \
+	(enum i915_cache_mode)(((i915_cache_t)(cache)) & 0xff)
+#define I915_CACHE_FLAGS(cache) \
+	(unsigned int)((((i915_cache_t)(cache) & 0xff00)) >> 16)
+
+/* Cache modes */
+enum i915_cache_mode {
+	I915_CACHE_MODE_UNKNOWN = 0,
+	I915_CACHE_MODE_UC,
+	I915_CACHE_MODE_WB,
+	I915_CACHE_MODE_WT,
+	I915_CACHE_MODE_WC
+};
+
+/* Cache mode flag bits */
+#define I915_CACHE_FLAG_L3	(0)
+#define I915_CACHE_FLAG_COH1W	(1)
+#define I915_CACHE_FLAG_COH2W	(2)
+#define I915_CACHE_FLAG_CLOS1	(3)
+#define I915_CACHE_FLAG_CLOS2	(4)
+
+int i915_cache_init(struct drm_i915_private *i915);
+int i915_cache_find_pat(struct drm_i915_private *i915, i915_cache_t cache);
+void i915_cache_print(struct drm_printer *p, i915_cache_t cache);
+
+#endif /* __I915_CACHE_H__ */
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 4de44cf1026d..03d366e0bdf7 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -140,68 +140,33 @@ static const char *stringify_vma_type(const struct i915_vma *vma)
 	return "ppgtt";
 }
 
-static const char *i915_cache_level_str(struct drm_i915_gem_object *obj)
-{
-	struct drm_i915_private *i915 = obj_to_i915(obj);
-
-	if (IS_METEORLAKE(i915)) {
-		switch (obj->pat_index) {
-		case 0: return " WB";
-		case 1: return " WT";
-		case 2: return " UC";
-		case 3: return " WB (1-Way Coh)";
-		case 4: return " WB (2-Way Coh)";
-		default: return " not defined";
-		}
-	} else if (IS_PONTEVECCHIO(i915)) {
-		switch (obj->pat_index) {
-		case 0: return " UC";
-		case 1: return " WC";
-		case 2: return " WT";
-		case 3: return " WB";
-		case 4: return " WT (CLOS1)";
-		case 5: return " WB (CLOS1)";
-		case 6: return " WT (CLOS2)";
-		case 7: return " WT (CLOS2)";
-		default: return " not defined";
-		}
-	} else if (GRAPHICS_VER(i915) >= 12) {
-		switch (obj->pat_index) {
-		case 0: return " WB";
-		case 1: return " WC";
-		case 2: return " WT";
-		case 3: return " UC";
-		default: return " not defined";
-		}
-	} else {
-		switch (obj->pat_index) {
-		case 0: return " UC";
-		case 1: return HAS_LLC(i915) ?
-			       " LLC" : " snooped";
-		case 2: return " L3+LLC";
-		case 3: return " WT";
-		default: return " not defined";
-		}
-	}
-}
-
 void
 i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
 {
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_printer p = drm_seq_file_printer(m);
 	struct i915_vma *vma;
 	int pin_count = 0;
 
-	seq_printf(m, "%pK: %c%c%c %8zdKiB %02x %02x %s%s%s",
+	seq_printf(m, "%pK: %c%c%c %8zdKiB %02x %02x ",
 		   &obj->base,
 		   get_tiling_flag(obj),
 		   get_global_flag(obj),
 		   get_pin_mapped_flag(obj),
 		   obj->base.size / 1024,
 		   obj->read_domains,
-		   obj->write_domain,
-		   i915_cache_level_str(obj),
-		   obj->mm.dirty ? " dirty" : "",
-		   obj->mm.madv == I915_MADV_DONTNEED ? " purgeable" : "");
+		   obj->write_domain);
+
+        i915_cache_print(&p, INTEL_INFO(i915)->cache_modes[obj->pat_index]);
+	if (obj->pat_set_by_user)
+		drm_puts(&p, "!");
+
+	if (obj->mm.dirty)
+		seq_puts(m, " dirty");
+
+	if (obj->mm.madv == I915_MADV_DONTNEED)
+		seq_puts(m, " purgeable");
+
 	if (obj->base.name)
 		seq_printf(m, " (name: %d)", obj->base.name);
 
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 294b022de22b..8663388a524f 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -80,6 +80,7 @@
 #include "soc/intel_dram.h"
 #include "soc/intel_gmch.h"
 
+#include "i915_cache.h"
 #include "i915_debugfs.h"
 #include "i915_driver.h"
 #include "i915_drm_client.h"
@@ -240,6 +241,10 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 	i915_memcpy_init_early(dev_priv);
 	intel_runtime_pm_init_early(&dev_priv->runtime_pm);
 
+	ret = i915_cache_init(dev_priv);
+	if (ret < 0)
+		return ret;
+
 	ret = i915_workqueues_init(dev_priv);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index a18013787c9f..462b076e2650 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -250,6 +250,9 @@ struct drm_i915_private {
 	unsigned int hpll_freq;
 	unsigned int czclk_freq;
 
+	unsigned int pat_uc;
+	unsigned int pat_wb;
+
 	/**
 	 * wq - Driver workqueue for GEM.
 	 *
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index b46d7a2dab1a..ef6d33c2c288 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -422,9 +422,7 @@ i915_gem_gtt_pread(struct drm_i915_gem_object *obj,
 			ggtt->vm.insert_page(&ggtt->vm,
 					     i915_gem_object_get_dma_address(obj,
 									     offset >> PAGE_SHIFT),
-					     node.start,
-					     i915_gem_get_pat_index(i915,
-								    I915_CACHE_NONE), 0);
+					     node.start, i915->pat_uc, 0);
 		} else {
 			page_base += offset & PAGE_MASK;
 		}
@@ -603,9 +601,7 @@ i915_gem_gtt_pwrite_fast(struct drm_i915_gem_object *obj,
 			ggtt->vm.insert_page(&ggtt->vm,
 					     i915_gem_object_get_dma_address(obj,
 									     offset >> PAGE_SHIFT),
-					     node.start,
-					     i915_gem_get_pat_index(i915,
-								    I915_CACHE_NONE), 0);
+					     node.start, i915->pat_uc, 0);
 			wmb(); /* flush modifications to the GGTT (insert_page) */
 		} else {
 			page_base += offset & PAGE_MASK;
@@ -1148,19 +1144,6 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
 	unsigned int i;
 	int ret;
 
-	/*
-	 * In the proccess of replacing cache_level with pat_index a tricky
-	 * dependency is created on the definition of the enum i915_cache_level.
-	 * in case this enum is changed, PTE encode would be broken.
-	 * Add a WARNING here. And remove when we completely quit using this
-	 * enum
-	 */
-	BUILD_BUG_ON(I915_CACHE_NONE != 0 ||
-		     I915_CACHE_LLC != 1 ||
-		     I915_CACHE_L3_LLC != 2 ||
-		     I915_CACHE_WT != 3 ||
-		     I915_MAX_CACHE_LEVEL != 4);
-
 	/* We need to fallback to 4K pages if host doesn't support huge gtt. */
 	if (intel_vgpu_active(dev_priv) && !intel_vgpu_has_huge_gtt(dev_priv))
 		RUNTIME_INFO(dev_priv)->page_sizes = I915_GTT_PAGE_SIZE_4K;
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 92ca81f9feab..6a6f97aaec60 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1124,14 +1124,11 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 			mutex_lock(&ggtt->error_mutex);
 			if (ggtt->vm.raw_insert_page)
 				ggtt->vm.raw_insert_page(&ggtt->vm, dma, slot,
-							 i915_gem_get_pat_index(gt->i915,
-										I915_CACHE_NONE),
+							 ggtt->vm.i915->pat_uc,
 							 0);
 			else
 				ggtt->vm.insert_page(&ggtt->vm, dma, slot,
-						     i915_gem_get_pat_index(gt->i915,
-									    I915_CACHE_NONE),
-						     0);
+						     ggtt->vm.i915->pat_uc, 0);
 			mb();
 
 			s = io_mapping_map_wc(&ggtt->iomap, slot, PAGE_SIZE);
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index dea3609fc496..c0c6248fbc78 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -32,6 +32,7 @@
 #include "gt/intel_sa_media.h"
 #include "gem/i915_gem_object_types.h"
 
+#include "i915_cache.h"
 #include "i915_driver.h"
 #include "i915_drv.h"
 #include "i915_pci.h"
@@ -46,36 +47,42 @@ __diag_ignore_all("-Woverride-init", "Allow overriding inherited members");
 	.__runtime.graphics.ip.ver = (x), \
 	.__runtime.media.ip.ver = (x)
 
-#define LEGACY_CACHELEVEL \
-	.cachelevel_to_pat = { \
-		[I915_CACHE_NONE]   = 0, \
-		[I915_CACHE_LLC]    = 1, \
-		[I915_CACHE_L3_LLC] = 2, \
-		[I915_CACHE_WT]     = 3, \
+/* TODO/QQQ index 1 & 2 */
+#define LEGACY_CACHE_MODES \
+	.cache_modes = { \
+		[0] = I915_CACHE(UC), \
+		[1] = I915_CACHE(WB), \
+		[2] = _I915_CACHE(WB, L3), \
+		[3] = I915_CACHE(WT), \
 	}
 
-#define TGL_CACHELEVEL \
-	.cachelevel_to_pat = { \
-		[I915_CACHE_NONE]   = 3, \
-		[I915_CACHE_LLC]    = 0, \
-		[I915_CACHE_L3_LLC] = 0, \
-		[I915_CACHE_WT]     = 2, \
+#define GEN12_CACHE_MODES \
+	.cache_modes = { \
+		[0] = I915_CACHE(WB), \
+		[1] = I915_CACHE(WC), \
+		[2] = I915_CACHE(WT), \
+		[3] = I915_CACHE(UC), \
 	}
 
-#define PVC_CACHELEVEL \
-	.cachelevel_to_pat = { \
-		[I915_CACHE_NONE]   = 0, \
-		[I915_CACHE_LLC]    = 3, \
-		[I915_CACHE_L3_LLC] = 3, \
-		[I915_CACHE_WT]     = 2, \
+#define PVC_CACHE_MODES \
+	.cache_modes = { \
+		[0] = I915_CACHE(UC), \
+		[1] = I915_CACHE(WC), \
+		[2] = I915_CACHE(WT), \
+		[3] = I915_CACHE(WB), \
+		[4] = _I915_CACHE(WT, CLOS1), \
+		[5] = _I915_CACHE(WB, CLOS1), \
+		[6] = _I915_CACHE(WT, CLOS2), \
+		[7] = _I915_CACHE(WB, CLOS2), \
 	}
 
-#define MTL_CACHELEVEL \
-	.cachelevel_to_pat = { \
-		[I915_CACHE_NONE]   = 2, \
-		[I915_CACHE_LLC]    = 3, \
-		[I915_CACHE_L3_LLC] = 3, \
-		[I915_CACHE_WT]     = 1, \
+#define MTL_CACHE_MODES \
+	.cache_modes = { \
+		[0] = I915_CACHE(WB), \
+		[1] = I915_CACHE(WT), \
+		[2] = I915_CACHE(UC), \
+		[3] = _I915_CACHE(WB, COH1W), \
+		[4] = _I915_CACHE(WB, COH2W), \
 	}
 
 /* Keep in gen based order, and chronological order within a gen */
@@ -100,7 +107,7 @@ __diag_ignore_all("-Woverride-init", "Allow overriding inherited members");
 	.max_pat_index = 3, \
 	GEN_DEFAULT_PAGE_SIZES, \
 	GEN_DEFAULT_REGIONS, \
-	LEGACY_CACHELEVEL
+	LEGACY_CACHE_MODES
 
 #define I845_FEATURES \
 	GEN(2), \
@@ -115,7 +122,7 @@ __diag_ignore_all("-Woverride-init", "Allow overriding inherited members");
 	.max_pat_index = 3, \
 	GEN_DEFAULT_PAGE_SIZES, \
 	GEN_DEFAULT_REGIONS, \
-	LEGACY_CACHELEVEL
+	LEGACY_CACHE_MODES
 
 static const struct intel_device_info i830_info = {
 	I830_FEATURES,
@@ -148,7 +155,7 @@ static const struct intel_device_info i865g_info = {
 	.max_pat_index = 3, \
 	GEN_DEFAULT_PAGE_SIZES, \
 	GEN_DEFAULT_REGIONS, \
-	LEGACY_CACHELEVEL
+	LEGACY_CACHE_MODES
 
 static const struct intel_device_info i915g_info = {
 	GEN3_FEATURES,
@@ -211,7 +218,7 @@ static const struct intel_device_info pnv_m_info = {
 	.max_pat_index = 3, \
 	GEN_DEFAULT_PAGE_SIZES, \
 	GEN_DEFAULT_REGIONS, \
-	LEGACY_CACHELEVEL
+	LEGACY_CACHE_MODES
 
 static const struct intel_device_info i965g_info = {
 	GEN4_FEATURES,
@@ -255,7 +262,7 @@ static const struct intel_device_info gm45_info = {
 	.max_pat_index = 3, \
 	GEN_DEFAULT_PAGE_SIZES, \
 	GEN_DEFAULT_REGIONS, \
-	LEGACY_CACHELEVEL
+	LEGACY_CACHE_MODES
 
 static const struct intel_device_info ilk_d_info = {
 	GEN5_FEATURES,
@@ -285,7 +292,7 @@ static const struct intel_device_info ilk_m_info = {
 	.__runtime.ppgtt_size = 31, \
 	GEN_DEFAULT_PAGE_SIZES, \
 	GEN_DEFAULT_REGIONS, \
-	LEGACY_CACHELEVEL
+	LEGACY_CACHE_MODES
 
 #define SNB_D_PLATFORM \
 	GEN6_FEATURES, \
@@ -333,7 +340,7 @@ static const struct intel_device_info snb_m_gt2_info = {
 	.__runtime.ppgtt_size = 31, \
 	GEN_DEFAULT_PAGE_SIZES, \
 	GEN_DEFAULT_REGIONS, \
-	LEGACY_CACHELEVEL
+	LEGACY_CACHE_MODES
 
 #define IVB_D_PLATFORM \
 	GEN7_FEATURES, \
@@ -390,7 +397,7 @@ static const struct intel_device_info vlv_info = {
 	.platform_engine_mask = BIT(RCS0) | BIT(VCS0) | BIT(BCS0),
 	GEN_DEFAULT_PAGE_SIZES,
 	GEN_DEFAULT_REGIONS,
-	LEGACY_CACHELEVEL,
+	LEGACY_CACHE_MODES
 };
 
 #define G75_FEATURES  \
@@ -476,7 +483,7 @@ static const struct intel_device_info chv_info = {
 	.has_coherent_ggtt = false,
 	GEN_DEFAULT_PAGE_SIZES,
 	GEN_DEFAULT_REGIONS,
-	LEGACY_CACHELEVEL,
+	LEGACY_CACHE_MODES
 };
 
 #define GEN9_DEFAULT_PAGE_SIZES \
@@ -539,7 +546,7 @@ static const struct intel_device_info skl_gt4_info = {
 	.max_pat_index = 3, \
 	GEN9_DEFAULT_PAGE_SIZES, \
 	GEN_DEFAULT_REGIONS, \
-	LEGACY_CACHELEVEL
+	LEGACY_CACHE_MODES
 
 static const struct intel_device_info bxt_info = {
 	GEN9_LP_FEATURES,
@@ -643,7 +650,7 @@ static const struct intel_device_info jsl_info = {
 #define GEN12_FEATURES \
 	GEN11_FEATURES, \
 	GEN(12), \
-	TGL_CACHELEVEL, \
+	GEN12_CACHE_MODES, \
 	.has_global_mocs = 1, \
 	.has_pxp = 1, \
 	.max_pat_index = 3
@@ -711,7 +718,7 @@ static const struct intel_device_info adl_p_info = {
 	.__runtime.graphics.ip.ver = 12, \
 	.__runtime.graphics.ip.rel = 50, \
 	XE_HP_PAGE_SIZES, \
-	TGL_CACHELEVEL, \
+	GEN12_CACHE_MODES, \
 	.dma_mask_size = 46, \
 	.has_3d_pipeline = 1, \
 	.has_64bit_reloc = 1, \
@@ -806,7 +813,7 @@ static const struct intel_device_info pvc_info = {
 		BIT(VCS0) |
 		BIT(CCS0) | BIT(CCS1) | BIT(CCS2) | BIT(CCS3),
 	.require_force_probe = 1,
-	PVC_CACHELEVEL,
+	PVC_CACHE_MODES
 };
 
 static const struct intel_gt_definition xelpmp_extra_gt[] = {
@@ -841,7 +848,7 @@ static const struct intel_device_info mtl_info = {
 	.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
 	.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
 	.require_force_probe = 1,
-	MTL_CACHELEVEL,
+	MTL_CACHE_MODES
 };
 
 #undef PLATFORM
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 0a111b281578..1b8e067f37dd 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -1861,7 +1861,7 @@ static int alloc_oa_buffer(struct i915_perf_stream *stream)
 		return PTR_ERR(bo);
 	}
 
-	i915_gem_object_set_cache_coherency(bo, I915_CACHE_LLC);
+	i915_gem_object_set_cache_coherency(bo, I915_CACHE(WB));
 
 	/* PreHSW required 512K alignment, HSW requires 16M */
 	vma = i915_vma_instance(bo, &gt->ggtt->vm, NULL);
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index dbfe6443457b..f48a21895a85 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -27,6 +27,8 @@
 
 #include <uapi/drm/i915_drm.h>
 
+#include "i915_cache.h"
+
 #include "intel_step.h"
 
 #include "gt/intel_engine_types.h"
@@ -243,8 +245,8 @@ struct intel_device_info {
 	 */
 	const struct intel_runtime_info __runtime;
 
-	u32 cachelevel_to_pat[I915_MAX_CACHE_LEVEL];
-	u32 max_pat_index;
+	i915_cache_t cache_modes[9];
+	unsigned int max_pat_index;
 };
 
 struct intel_driver_caps {
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
index 61da4ed9d521..e620f73793a5 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
@@ -57,10 +57,7 @@ static void trash_stolen(struct drm_i915_private *i915)
 		u32 __iomem *s;
 		int x;
 
-		ggtt->vm.insert_page(&ggtt->vm, dma, slot,
-				     i915_gem_get_pat_index(i915,
-							    I915_CACHE_NONE),
-				     0);
+		ggtt->vm.insert_page(&ggtt->vm, dma, slot, i915->pat_uc, 0);
 
 		s = io_mapping_map_atomic_wc(&ggtt->iomap, slot);
 		for (x = 0; x < PAGE_SIZE / sizeof(u32); x++) {
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
index f8fe3681c3dc..862d3ba0e025 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
@@ -246,7 +246,7 @@ static int igt_evict_for_cache_color(void *arg)
 	struct drm_mm_node target = {
 		.start = I915_GTT_PAGE_SIZE * 2,
 		.size = I915_GTT_PAGE_SIZE,
-		.color = i915_gem_get_pat_index(gt->i915, I915_CACHE_LLC),
+		.color = I915_CACHE(WB),
 	};
 	struct drm_i915_gem_object *obj;
 	struct i915_vma *vma;
@@ -267,7 +267,7 @@ static int igt_evict_for_cache_color(void *arg)
 		err = PTR_ERR(obj);
 		goto cleanup;
 	}
-	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
+	i915_gem_object_set_cache_coherency(obj, I915_CACHE(WB));
 	quirk_add(obj, &objects);
 
 	vma = i915_gem_object_ggtt_pin(obj, NULL, 0, 0,
@@ -283,7 +283,7 @@ static int igt_evict_for_cache_color(void *arg)
 		err = PTR_ERR(obj);
 		goto cleanup;
 	}
-	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
+	i915_gem_object_set_cache_coherency(obj, I915_CACHE(WB));
 	quirk_add(obj, &objects);
 
 	/* Neighbouring; same colour - should fit */
@@ -309,7 +309,7 @@ static int igt_evict_for_cache_color(void *arg)
 	/* Attempt to remove the first *pinned* vma, by removing the (empty)
 	 * neighbour -- this should fail.
 	 */
-	target.color = i915_gem_get_pat_index(gt->i915, I915_CACHE_L3_LLC);
+	target.color = _I915_CACHE(WB, L3);
 
 	mutex_lock(&ggtt->vm.mutex);
 	err = i915_gem_evict_for_node(&ggtt->vm, NULL, &target, 0);
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index 5c397a2df70e..a24585784f75 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -135,7 +135,7 @@ fake_dma_object(struct drm_i915_private *i915, u64 size)
 
 	obj->write_domain = I915_GEM_DOMAIN_CPU;
 	obj->read_domains = I915_GEM_DOMAIN_CPU;
-	obj->pat_index = i915_gem_get_pat_index(i915, I915_CACHE_NONE);
+	obj->pat_index = i915->pat_uc;
 
 	/* Preallocate the "backing storage" */
 	if (i915_gem_object_pin_pages_unlocked(obj))
@@ -358,10 +358,8 @@ static int lowlevel_hole(struct i915_address_space *vm,
 			mock_vma_res->start = addr;
 
 			with_intel_runtime_pm(vm->gt->uncore->rpm, wakeref)
-			  vm->insert_entries(vm, mock_vma_res,
-					     i915_gem_get_pat_index(vm->i915,
-								    I915_CACHE_NONE),
-					     0);
+				vm->insert_entries(vm, mock_vma_res,
+						   vm->i915->pat_uc, 0);
 		}
 		count = n;
 
@@ -1379,10 +1377,7 @@ static int igt_ggtt_page(void *arg)
 
 		ggtt->vm.insert_page(&ggtt->vm,
 				     i915_gem_object_get_dma_address(obj, 0),
-				     offset,
-				     i915_gem_get_pat_index(i915,
-							    I915_CACHE_NONE),
-				     0);
+				     offset, ggtt->vm.i915->pat_uc, 0);
 	}
 
 	order = i915_random_order(count, &prng);
diff --git a/drivers/gpu/drm/i915/selftests/igt_spinner.c b/drivers/gpu/drm/i915/selftests/igt_spinner.c
index 618d9386d554..d42d1bcffe21 100644
--- a/drivers/gpu/drm/i915/selftests/igt_spinner.c
+++ b/drivers/gpu/drm/i915/selftests/igt_spinner.c
@@ -23,7 +23,7 @@ int igt_spinner_init(struct igt_spinner *spin, struct intel_gt *gt)
 		err = PTR_ERR(spin->hws);
 		goto err;
 	}
-	i915_gem_object_set_cache_coherency(spin->hws, I915_CACHE_LLC);
+	i915_gem_object_set_cache_coherency(spin->hws, I915_CACHE(WB));
 
 	spin->obj = i915_gem_object_create_internal(gt->i915, PAGE_SIZE);
 	if (IS_ERR(spin->obj)) {
diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
index d985d9bae2e8..b82fe0ef8cd7 100644
--- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
@@ -1070,9 +1070,7 @@ static int igt_lmem_write_cpu(void *arg)
 	/* Put the pages into a known state -- from the gpu for added fun */
 	intel_engine_pm_get(engine);
 	err = intel_context_migrate_clear(engine->gt->migrate.context, NULL,
-					  obj->mm.pages->sgl,
-					  i915_gem_get_pat_index(i915,
-								 I915_CACHE_NONE),
+					  obj->mm.pages->sgl, i915->pat_uc,
 					  true, 0xdeadbeaf, &rq);
 	if (rq) {
 		dma_resv_add_fence(obj->base.resv, &rq->fence,
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index 12aa7fbb0748..f478a4102299 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -126,13 +126,13 @@ static const struct intel_device_info mock_info = {
 	.memory_regions = REGION_SMEM,
 	.platform_engine_mask = BIT(0),
 
-	/* simply use legacy cache level for mock device */
+	/* Simply use legacy cache modes for the mock device. */
 	.max_pat_index = 3,
-	.cachelevel_to_pat = {
-		[I915_CACHE_NONE]   = 0,
-		[I915_CACHE_LLC]    = 1,
-		[I915_CACHE_L3_LLC] = 2,
-		[I915_CACHE_WT]     = 3,
+	.cache_modes = {
+		[0] = I915_CACHE(UC),
+		[1] = I915_CACHE(WB),
+		[2] = _I915_CACHE(WB, L3),
+		[3] = I915_CACHE(WT),
 	},
 };
 
diff --git a/drivers/gpu/drm/i915/selftests/mock_region.c b/drivers/gpu/drm/i915/selftests/mock_region.c
index 6324eb32d4dd..8c16202e79cb 100644
--- a/drivers/gpu/drm/i915/selftests/mock_region.c
+++ b/drivers/gpu/drm/i915/selftests/mock_region.c
@@ -77,7 +77,7 @@ static int mock_object_init(struct intel_memory_region *mem,
 
 	obj->read_domains = I915_GEM_DOMAIN_CPU | I915_GEM_DOMAIN_GTT;
 
-	i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
+	i915_gem_object_set_cache_coherency(obj, I915_CACHE(UC));
 
 	i915_gem_object_init_memory_region(obj, mem);
 
-- 
2.39.2

