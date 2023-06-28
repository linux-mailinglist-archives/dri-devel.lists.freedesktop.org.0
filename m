Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53765741611
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 18:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B1110E11D;
	Wed, 28 Jun 2023 16:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4705510E11D;
 Wed, 28 Jun 2023 16:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687968733; x=1719504733;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=odGVzAEFTmtBdZYXAY6Qr/uMYx66UMRNWNCeJO1BWdI=;
 b=Sj+Jh/v4lFwQaOYjY63msmH9J6Hq3ACrau7sT2gI8ROHtQGfNO3xDb/G
 2AMcqKk4f32Y7V+Pq2muUjMp0EEVzB6ntLStkpDImK45lOD6EUu4DRTJJ
 puC2kbRgMcFM6RudkjcfOU9WFxQQCjRwXQ8uS4TydYlZA4qprKI6A+0zv
 XwlHg2il2xJ9AVmjBtPZqO8bYbRxTxnzKHnZ9i3Ng9w3dvvj2FKQnyA6E
 1/aYjVZo1i4r8fWGBf+nJVCJFjC6uct5hKBgR9NN5b34nprQXP5/Ae1fM
 Kduwt//eTO8ceeXsDztm6xZeOGn3Rj62hciLU/AIDewnnkCDchrBrlWQi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="364440347"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="364440347"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 09:10:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="717018520"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="717018520"
Received: from mearsdax-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.199.179])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 09:10:34 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC] drm/i915: Refactor PAT/cache handling
Date: Wed, 28 Jun 2023 17:10:23 +0100
Message-Id: <20230628161023.2944972-1-tvrtko.ursulin@linux.intel.com>
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
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    |  34 ++---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  13 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  10 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  78 ++++-------
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  18 ++-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  99 +-------------
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |   7 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  26 ++--
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |   2 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |   4 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |  13 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |   9 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c       |  11 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c    |   9 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |  14 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c   |   5 +-
 drivers/gpu/drm/i915/gt/selftest_tlb.c        |   5 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |   8 +-
 drivers/gpu/drm/i915/i915_cache.c             |  59 ++++++++
 drivers/gpu/drm/i915/i915_cache.h             | 129 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_debugfs.c           |  83 ++++++-----
 drivers/gpu/drm/i915/i915_driver.c            |   3 +
 drivers/gpu/drm/i915/i915_drv.h               |   3 +
 drivers/gpu/drm/i915/i915_gem.c               |  21 +--
 drivers/gpu/drm/i915/i915_gpu_error.c         |   7 +-
 drivers/gpu/drm/i915/i915_pci.c               |  83 +++++------
 drivers/gpu/drm/i915/intel_device_info.h      |   6 +-
 drivers/gpu/drm/i915/selftests/i915_gem.c     |   5 +-
 .../gpu/drm/i915/selftests/i915_gem_evict.c   |   4 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  13 +-
 .../drm/i915/selftests/intel_memory_region.c  |   4 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  10 +-
 33 files changed, 415 insertions(+), 381 deletions(-)
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
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index dfaaa8b66ac3..49bfae45390f 100644
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
@@ -272,15 +266,18 @@ i915_gem_object_set_to_gtt_domain(struct drm_i915_gem_object *obj, bool write)
 int i915_gem_object_set_cache_level(struct drm_i915_gem_object *obj,
 				    enum i915_cache_level cache_level)
 {
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	i915_cache_t mode;
 	int ret;
 
-	/*
-	 * For objects created by userspace through GEM_CREATE with pat_index
-	 * set by set_pat extension, simply return 0 here without touching
-	 * the cache setting, because such objects should have an immutable
-	 * cache setting by desgin and always managed by userspace.
-	 */
-	if (i915_gem_object_has_cache_level(obj, cache_level))
+	if (obj->pat_set_by_user)
+		return -EINVAL;
+
+	ret = i915_cache_level_to_pat_and_mode(i915, cache_level, &mode);
+	if (ret < 0)
+		return -EINVAL;
+
+	if (mode == obj->cache_mode)
 		return 0;
 
 	ret = i915_gem_object_wait(obj,
@@ -326,10 +323,9 @@ int i915_gem_get_caching_ioctl(struct drm_device *dev, void *data,
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
index 0004d5fa7cc2..52c6c5f09bdd 100644
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
@@ -144,6 +117,24 @@ void __i915_gem_object_fini(struct drm_i915_gem_object *obj)
 	dma_resv_fini(&obj->base._resv);
 }
 
+void __i915_gem_object_update_coherency(struct drm_i915_gem_object *obj)
+{
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	const unsigned int mode = I915_CACHE_MODE(obj->cache_mode);
+
+	if (!(mode == I915_CACHE_MODE_UNKNOWN || mode == I915_CACHE_MODE_UC))
+		obj->cache_coherent = (I915_BO_CACHE_COHERENT_FOR_READ |
+				       I915_BO_CACHE_COHERENT_FOR_WRITE);
+	else if (mode != I915_CACHE_MODE_UNKNOWN && HAS_LLC(i915))
+		obj->cache_coherent = I915_BO_CACHE_COHERENT_FOR_READ;
+	else
+		obj->cache_coherent = 0;
+
+	obj->cache_dirty =
+		!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE) &&
+		!IS_DGFX(i915);
+}
+
 /**
  * i915_gem_object_set_cache_coherency - Mark up the object's coherency levels
  * for a given cache_level
@@ -154,20 +145,15 @@ void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
 					 unsigned int cache_level)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	i915_cache_t mode;
+	int found;
 
-	obj->pat_index = i915_gem_get_pat_index(i915, cache_level);
+	found = i915_cache_level_to_pat_and_mode(i915, cache_level, &mode);
+	GEM_WARN_ON(found < 0);
+	obj->pat_index = found;
+	obj->cache_mode = mode;
 
-	if (cache_level != I915_CACHE_NONE)
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
 
 /**
@@ -187,18 +173,9 @@ void i915_gem_object_set_pat_index(struct drm_i915_gem_object *obj,
 		return;
 
 	obj->pat_index = pat_index;
+	obj->cache_mode = INTEL_INFO(i915)->cache_modes[pat_index];
 
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
@@ -215,6 +192,7 @@ bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
 	/*
 	 * Always flush cache for UMD objects at creation time.
 	 */
+	/* QQQ/FIXME why? avoidable performance penalty? */
 	if (obj->pat_set_by_user)
 		return true;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 884a17275b3a..f84f41e9f81f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -13,6 +13,7 @@
 
 #include "display/intel_frontbuffer.h"
 #include "intel_memory_region.h"
+#include "i915_cache.h"
 #include "i915_gem_object_types.h"
 #include "i915_gem_gtt.h"
 #include "i915_gem_ww.h"
@@ -32,10 +33,18 @@ static inline bool i915_gem_object_size_2big(u64 size)
 	return false;
 }
 
-unsigned int i915_gem_get_pat_index(struct drm_i915_private *i915,
-				    enum i915_cache_level level);
-bool i915_gem_object_has_cache_level(const struct drm_i915_gem_object *obj,
-				     enum i915_cache_level lvl);
+static inline int
+i915_gem_object_has_cache_mode(const struct drm_i915_gem_object *obj,
+			       unsigned int mode)
+{
+	if (I915_CACHE_MODE(obj->cache_mode) == mode)
+		return 1;
+	else if (obj->pat_set_by_user)
+		return -1; /* Unknown, callers should assume no. */
+	else
+		return 0;
+}
+
 void i915_gem_init__objects(struct drm_i915_private *i915);
 
 void i915_objects_module_exit(void);
@@ -764,6 +773,7 @@ int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
 				      bool intr);
 bool i915_gem_object_has_unknown_state(struct drm_i915_gem_object *obj);
 
+void __i915_gem_object_update_coherency(struct drm_i915_gem_object *obj);
 void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
 					 unsigned int cache_level);
 void i915_gem_object_set_pat_index(struct drm_i915_gem_object *obj,
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 8de2b91b3edf..1f9fa28d07df 100644
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
@@ -375,6 +289,9 @@ struct drm_i915_gem_object {
 	unsigned int mem_flags;
 #define I915_BO_FLAG_STRUCT_PAGE BIT(0) /* Object backed by struct pages */
 #define I915_BO_FLAG_IOMEM       BIT(1) /* Object backed by IO memory */
+
+	i915_cache_t cache_mode;
+
 	/**
 	 * @pat_index: The desired PAT index.
 	 *
@@ -409,9 +326,7 @@ struct drm_i915_gem_object {
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
@@ -492,9 +407,7 @@ struct drm_i915_gem_object {
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
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 3b094d36a0b0..a7012f1a9c70 100644
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
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 7078af2f8f79..e794bd2a7ccb 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -58,6 +58,16 @@ i915_ttm_cache_level(struct drm_i915_private *i915, struct ttm_resource *res,
 		I915_CACHE_NONE;
 }
 
+static unsigned int
+i915_ttm_cache_pat(struct drm_i915_private *i915, struct ttm_resource *res,
+		     struct ttm_tt *ttm)
+{
+	return ((HAS_LLC(i915) || HAS_SNOOP(i915)) &&
+		!i915_ttm_gtt_binds_lmem(res) &&
+		ttm->caching == ttm_cached) ? i915->pat_wb :
+		i915->pat_uc;
+}
+
 static struct intel_memory_region *
 i915_ttm_region(struct ttm_device *bdev, int ttm_mem_type)
 {
@@ -196,7 +206,7 @@ static struct dma_fence *i915_ttm_accel_move(struct ttm_buffer_object *bo,
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 	struct i915_request *rq;
 	struct ttm_tt *src_ttm = bo->ttm;
-	enum i915_cache_level src_level, dst_level;
+	unsigned int src_pat, dst_pat;
 	int ret;
 
 	if (!to_gt(i915)->migrate.context || intel_gt_is_wedged(to_gt(i915)))
@@ -206,16 +216,15 @@ static struct dma_fence *i915_ttm_accel_move(struct ttm_buffer_object *bo,
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
@@ -225,14 +234,13 @@ static struct dma_fence *i915_ttm_accel_move(struct ttm_buffer_object *bo,
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
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index df6c9a84252c..c8925918784e 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -354,7 +354,7 @@ fake_huge_pages_object(struct drm_i915_private *i915, u64 size, bool single)
 
 	obj->write_domain = I915_GEM_DOMAIN_CPU;
 	obj->read_domains = I915_GEM_DOMAIN_CPU;
-	obj->pat_index = i915_gem_get_pat_index(i915, I915_CACHE_NONE);
+	i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
 
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
index f948d33e5ec5..a6692ea1a91e 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
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
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index dd0ed941441a..c97379cf8241 100644
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
@@ -1297,10 +1295,7 @@ bool i915_ggtt_resume_vm(struct i915_address_space *vm)
 		 * ptes to be repopulated.
 		 */
 		vma->resource->bound_flags = 0;
-		vma->ops->bind_vma(vm, NULL, vma->resource,
-				   obj ? obj->pat_index :
-					 i915_gem_get_pat_index(vm->i915,
-								I915_CACHE_NONE),
+		vma->ops->bind_vma(vm, NULL, vma->resource, obj->cache_mode,
 				   was_bound);
 
 		if (obj) { /* only used during resume => exclusive access */
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
index 39c3ec12df1a..db64dc7d3fce 100644
--- a/drivers/gpu/drm/i915/gt/selftest_timeline.c
+++ b/drivers/gpu/drm/i915/gt/selftest_timeline.c
@@ -836,7 +836,10 @@ static int setup_watcher(struct hwsp_watcher *w, struct intel_gt *gt,
 		return PTR_ERR(obj);
 
 	/* keep the same cache settings as timeline */
-	i915_gem_object_set_pat_index(obj, tl->hwsp_ggtt->obj->pat_index);
+	obj->pat_index = tl->hwsp_ggtt->obj->pat_index;
+	obj->cache_mode = tl->hwsp_ggtt->obj->cache_mode;
+	__i915_gem_object_update_coherency(obj);
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
index 000000000000..7a8002ebd2ec
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_cache.c
@@ -0,0 +1,59 @@
+/*
+ * SPDX-License-Identifier: MIT
+ *
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "i915_cache.h"
+#include "i915_drv.h"
+
+static int find_pat(const struct intel_device_info *info, i915_cache_t mode)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(info->cache_modes); i++) {
+		if (info->cache_modes[i] == mode)
+			return i;
+	}
+
+	return -1;
+}
+
+void i915_cache_init(struct drm_i915_private *i915)
+{
+	int ret;
+
+	ret = find_pat(INTEL_INFO(i915), I915_CACHE(UC));
+	WARN_ON(ret < 0);
+	drm_info(&i915->drm, "Using PAT index %u for uncached access\n", ret);
+	i915->pat_uc = ret;
+
+	ret = find_pat(INTEL_INFO(i915), I915_CACHE(WB));
+	WARN_ON(ret < 0);
+	drm_info(&i915->drm, "Using PAT index %u for write-back access\n", ret);
+	i915->pat_wb = ret;
+}
+
+int i915_cache_level_to_pat_and_mode(struct drm_i915_private *i915,
+				     unsigned int cache_level,
+				     i915_cache_t *mode)
+{
+	const struct intel_device_info *info = INTEL_INFO(i915);
+	i915_cache_t level_to_mode[] = {
+		[I915_CACHE_NONE]	= I915_CACHE(UC),
+		[I915_CACHE_WT]		= I915_CACHE(WT),
+		[I915_CACHE_LLC]	= I915_CACHE(WB),
+	};
+	int ret;
+
+	if (GRAPHICS_VER(i915) >= 12)
+		level_to_mode[I915_CACHE_L3_LLC] = I915_CACHE(WB);
+	else
+		level_to_mode[I915_CACHE_L3_LLC] = _I915_CACHE(WB, LLC);
+
+	ret = find_pat(info, level_to_mode[cache_level]);
+	if (ret >= 0 && mode)
+		*mode = info->cache_modes[ret];
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/i915/i915_cache.h b/drivers/gpu/drm/i915/i915_cache.h
new file mode 100644
index 000000000000..0df03f1f01ef
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_cache.h
@@ -0,0 +1,129 @@
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
+struct drm_i915_private;
+
+typedef u16 i915_cache_t;
+
+#define I915_CACHE(mode) \
+	(i915_cache_t)(I915_CACHE_MODE_##mode)
+
+#define _I915_CACHE(mode, flag) \
+	(i915_cache_t)((I915_CACHE_MODE_##mode) | ( BIT(8 + I915_CACHE_##flag)))
+
+#define I915_CACHE_MODE(cache) \
+	(unsigned int)(((i915_cache_t)(cache)) & 0xff)
+#define I915_CACHE_FLAGS(cache) \
+	(unsigned int)((((i915_cache_t)(cache) & 0xff00)) >> 16)
+
+/* Cache mode values */
+#define I915_CACHE_MODE_UNKNOWN (0)
+#define I915_CACHE_MODE_UC	(1)
+#define I915_CACHE_MODE_WB	(2)
+#define I915_CACHE_MODE_WT	(3)
+#define I915_CACHE_MODE_WC	(4)
+
+/* Mode flag bits */
+#define I915_CACHE_L3		(0)
+#define I915_CACHE_COH1W	(1)
+#define I915_CACHE_COH2W	(2)
+#define I915_CACHE_CLOS1	(3)
+#define I915_CACHE_CLOS2	(4)
+
+void i915_cache_init(struct drm_i915_private *i915);
+int i915_cache_level_to_pat_and_mode(struct drm_i915_private *i915,
+				     unsigned int cache_level,
+				     i915_cache_t *mode);
+
+/*
+ * Legacy/kernel internal interface below:
+ */
+
+/**
+ * enum i915_cache_level - The supported GTT caching values for system memory
+ * pages.
+ *
+ * These translate to some special GTT PTE bits when binding pages into some
+ * address space. It also determines whether an object, or rather its pages are
+ * coherent with the GPU, when also reading or writing through the CPU cache
+ * with those pages.
+ *
+ * Userspace can also control this through struct drm_i915_gem_caching.
+ */
+enum i915_cache_level {
+	/**
+	 * @I915_CACHE_NONE:
+	 *
+	 * GPU access is not coherent with the CPU cache. If the cache is dirty
+	 * and we need the underlying pages to be coherent with some later GPU
+	 * access then we need to manually flush the pages.
+	 *
+	 * On shared LLC platforms reads and writes through the CPU cache are
+	 * still coherent even with this setting. See also
+	 * &drm_i915_gem_object.cache_coherent for more details. Due to this we
+	 * should only ever use uncached for scanout surfaces, otherwise we end
+	 * up over-flushing in some places.
+	 *
+	 * This is the default on non-LLC platforms.
+	 */
+	I915_CACHE_NONE = 0,
+	/**
+	 * @I915_CACHE_LLC:
+	 *
+	 * GPU access is coherent with the CPU cache. If the cache is dirty,
+	 * then the GPU will ensure that access remains coherent, when both
+	 * reading and writing through the CPU cache. GPU writes can dirty the
+	 * CPU cache.
+	 *
+	 * Not used for scanout surfaces.
+	 *
+	 * Applies to both platforms with shared LLC(HAS_LLC), and snooping
+	 * based platforms(HAS_SNOOP).
+	 *
+	 * This is the default on shared LLC platforms.  The only exception is
+	 * scanout objects, where the display engine is not coherent with the
+	 * CPU cache. For such objects I915_CACHE_NONE or I915_CACHE_WT is
+	 * automatically applied by the kernel in pin_for_display, if userspace
+	 * has not done so already.
+	 */
+	I915_CACHE_LLC,
+	/**
+	 * @I915_CACHE_L3_LLC:
+	 *
+	 * Explicitly enable the Gfx L3 cache, with coherent LLC.
+	 *
+	 * The Gfx L3 sits between the domain specific caches, e.g
+	 * sampler/render caches, and the larger LLC. LLC is coherent with the
+	 * GPU, but L3 is only visible to the GPU, so likely needs to be flushed
+	 * when the workload completes.
+	 *
+	 * Not used for scanout surfaces.
+	 *
+	 * Only exposed on some gen7 + GGTT. More recent hardware has dropped
+	 * this explicit setting, where it should now be enabled by default.
+	 */
+	I915_CACHE_L3_LLC,
+	/**
+	 * @I915_CACHE_WT:
+	 *
+	 * Write-through. Used for scanout surfaces.
+	 *
+	 * The GPU can utilise the caches, while still having the display engine
+	 * be coherent with GPU writes, as a result we don't need to flush the
+	 * CPU caches when moving out of the render domain. This is the default
+	 * setting chosen by the kernel, if supported by the HW, otherwise we
+	 * fallback to I915_CACHE_NONE. On the CPU side writes through the CPU
+	 * cache still need to be flushed, to remain coherent with the display
+	 * engine.
+	 */
+	I915_CACHE_WT,
+};
+
+#endif /* __I915_CACHE_H__ */
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 76ccd4e03e31..e2da57397770 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -139,48 +139,37 @@ static const char *stringify_vma_type(const struct i915_vma *vma)
 	return "ppgtt";
 }
 
-static const char *i915_cache_level_str(struct drm_i915_gem_object *obj)
+static void obj_cache_str(struct seq_file *m, struct drm_i915_gem_object *obj)
 {
-	struct drm_i915_private *i915 = obj_to_i915(obj);
+	const i915_cache_t cache = obj->cache_mode;
+	const unsigned int mode = I915_CACHE_MODE(cache);
+	const unsigned long flags = I915_CACHE_FLAGS(cache);
+	static const char *mode_str[] = {
+		[I915_CACHE_MODE_UC] = "UC",
+		[I915_CACHE_MODE_WB] = "WB",
+		[I915_CACHE_MODE_WT] = "WT",
+		[I915_CACHE_MODE_WC] = "WC",
+	};
+	static const char *flag_str[] = {
+		[I915_CACHE_L3] = "L3",
+		[I915_CACHE_COH1W] = "1-Way-Coherent",
+		[I915_CACHE_COH2W] = "2-Way-Coherent",
+		[I915_CACHE_CLOS1] = "CLOS1",
+		[I915_CACHE_CLOS2] = "CLOS2",
+	};
 
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
+	if (mode == I915_CACHE_MODE_UNKNOWN || mode > ARRAY_SIZE(mode_str)) {
+		if (obj->pat_set_by_user)
+			seq_printf(m, " PAT-%u", obj->pat_index);
+		else
+			seq_printf(m, " PAT-%u-???", obj->pat_index);
 	} else {
-		switch (obj->pat_index) {
-		case 0: return " UC";
-		case 1: return HAS_LLC(i915) ?
-			       " LLC" : " snooped";
-		case 2: return " L3+LLC";
-		case 3: return " WT";
-		default: return " not defined";
-		}
+		unsigned long bit;
+
+		seq_printf(m, " %s", mode_str[mode]);
+
+		for_each_set_bit(bit, &flags, sizeof(i915_cache_t))
+			seq_printf(m, "-%s", flag_str[bit]);
 	}
 }
 
@@ -190,17 +179,23 @@ i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
 	struct i915_vma *vma;
 	int pin_count = 0;
 
-	seq_printf(m, "%pK: %c%c%c %8zdKiB %02x %02x %s%s%s",
+	seq_printf(m, "%pK: %c%c%c %8zdKiB %02x %02x",
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
+	obj_cache_str(m, obj);
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
index 222d0a1f3b55..deab26752ba4 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -80,6 +80,7 @@
 #include "soc/intel_dram.h"
 #include "soc/intel_gmch.h"
 
+#include "i915_cache.h"
 #include "i915_debugfs.h"
 #include "i915_driver.h"
 #include "i915_drm_client.h"
@@ -267,6 +268,8 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 
 	intel_detect_preproduction_hw(dev_priv);
 
+	i915_cache_init(dev_priv);
+
 	return 0;
 
 err_rootgt:
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index b4cf6f0f636d..cb1c0c9d98ef 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -251,6 +251,9 @@ struct drm_i915_private {
 	unsigned int hpll_freq;
 	unsigned int czclk_freq;
 
+	unsigned int pat_uc;
+	unsigned int pat_wb;
+
 	/**
 	 * wq - Driver workqueue for GEM.
 	 *
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 7ae42f746cc2..9aae75862e6f 100644
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
index 4749f99e6320..fad336a45699 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1122,14 +1122,11 @@ i915_vma_coredump_create(const struct intel_gt *gt,
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
index 3d7a5db9833b..fbdce31afeb1 100644
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
 	.__runtime.platform_engine_mask = BIT(RCS0) | BIT(VCS0) | BIT(BCS0),
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
 	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
 	.__runtime.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
 	.require_force_probe = 1,
-	MTL_CACHELEVEL,
+	MTL_CACHE_MODES
 };
 
 #undef PLATFORM
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 069291b3bd37..5cbae7c2ee30 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -27,6 +27,8 @@
 
 #include <uapi/drm/i915_drm.h>
 
+#include "i915_cache.h"
+
 #include "intel_step.h"
 
 #include "display/intel_display_device.h"
@@ -248,8 +250,8 @@ struct intel_device_info {
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
index f8fe3681c3dc..658a5b59545e 100644
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
@@ -309,7 +309,7 @@ static int igt_evict_for_cache_color(void *arg)
 	/* Attempt to remove the first *pinned* vma, by removing the (empty)
 	 * neighbour -- this should fail.
 	 */
-	target.color = i915_gem_get_pat_index(gt->i915, I915_CACHE_L3_LLC);
+	target.color = _I915_CACHE(WB, LLC);
 
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
index 09d4bbcdcdbf..ad778842cba2 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -126,7 +126,12 @@ struct drm_i915_private *mock_gem_device(void)
 	struct drm_i915_private *i915;
 	struct intel_device_info *i915_info;
 	struct pci_dev *pdev;
-	unsigned int i;
+	static const i915_cache_t legacy_cache_modes[] = {
+		[0] = I915_CACHE(UC),
+		[1] = I915_CACHE(WB),
+		[2] = _I915_CACHE(WB, L3),
+		[3] = I915_CACHE(WT),
+	};
 	int ret;
 
 	pdev = kzalloc(sizeof(*pdev), GFP_KERNEL);
@@ -187,8 +192,7 @@ struct drm_i915_private *mock_gem_device(void)
 	/* simply use legacy cache level for mock device */
 	i915_info = (struct intel_device_info *)INTEL_INFO(i915);
 	i915_info->max_pat_index = 3;
-	for (i = 0; i < I915_MAX_CACHE_LEVEL; i++)
-		i915_info->cachelevel_to_pat[i] = i;
+	memcpy(i915_info->cache_modes, legacy_cache_modes, sizeof(legacy_cache_modes));
 
 	intel_memory_regions_hw_probe(i915);
 
-- 
2.39.2

