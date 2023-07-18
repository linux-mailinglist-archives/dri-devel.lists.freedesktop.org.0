Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A33BD757EE7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 16:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132EE10E353;
	Tue, 18 Jul 2023 14:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93F610E038;
 Tue, 18 Jul 2023 14:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689688984; x=1721224984;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MVSVsGvPntIjWgX+JtdVPWPKWYvRKckGrcGw35FCzoA=;
 b=m+ZuVO+a2zW4E5bbFAdLSemdHgEiT3h/ywwgVK2a0SNDbjsiRc9QM5dW
 LE1oad+LtEZrdvnrZHA6xH2Wl6849gkfMx2gMAUGIAZMCjLoQBMden7mJ
 Xtpik04Jolgmp6CuYZLHXtpb9k5ja3qWX/aUpQUUukJ/DWM2MEaXb1adW
 m1JttfCHfPwDxLNrzWmAx31vLB7dGx+i/1OryUlgjb+2vqtvkEb0l9SQP
 lv7/Hgqv8s+kWQQBKiDpUUY3HNtVmMRWWVPZFkQQ2lzr5NSry0l2AcK1E
 kByyi6w9Jc27i15OYgHUmM8+6VGIMI6oS6sZUZmuo+5tqwDPghwaL2Qp5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="346512966"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="346512966"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 07:03:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="813763184"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="813763184"
Received: from maloneyj-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.207.99])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 07:02:59 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/i915: Refactor PAT/object cache handling
Date: Tue, 18 Jul 2023 15:02:52 +0100
Message-Id: <20230718140252.1011393-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Fei Yang <fei.yang@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Commit 9275277d5324 ("drm/i915: use pat_index instead of cache_level") has
introduced PAT indices to i915 internal APIs, partially replacing the
usage of driver internal cache_level, but has also added a few
questionable design decisions which this patch tries to improve upon.

Principal change is to invert the per platform cache level to PAT index
table which was added by the referenced commit, and by doing so enable
i915 to understand the cache mode between PAT indices, changing them from
opaque to transparent.

Once we have the inverted table we are able to remove the hidden false
"return true" from i915_gem_object_has_cache_level.

Other changes/fixes/improvements we are able to do:

1)
Replace the enum i915_cache_level with i915_cache_t, composed of a more
detailed representation of each cache mode (base mode plus flags).

For instance this way we are able to express the difference between WB and
1-way coherent WB on Meteorlake. Which in turn enables us to map the i915
"cached" mode to the correct Meteorlake PAT index.

2)
We can cache PAT indices of the caching modes used by the driver itself in
struct drm_i915_private, which eliminates the runtime calls to
i915_gem_get_pat_index from both high- and low-level i915 components.

3)
We can also cache the caching modes used by the driver for coherent
access and for display buffers.

4)
Remove the incorrect references to enum i915_cache_level from low level
PTE encode vfuncs, since those are actually given PAT indices by their
callers.

5)
Because i915 now understands PAT indices, we can remove the overly
aggressive flushing triggered from i915_gem_object_can_bypass_llc() and
limit it to non-coherent write-back mode only.

6)
Finally we are able to replace the platform dependent cache mode to string
code in debugfs and elsewhere by the single implementation based on
i915_cache_t.

v2:
 * Fix PAT-to-cache-mode table for PVC. (Fei)
 * Cache display caching mode too. (Fei)
 * Improve and document criteria in i915_gem_object_can_bypass_llc() (Matt)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Fixes: 9275277d5324 ("drm/i915: use pat_index instead of cache_level")
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../drm/i915/display/intel_plane_initial.c    |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    |  56 +++----
 drivers/gpu/drm/i915/gem/i915_gem_domain.h    |   5 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  13 +-
 drivers/gpu/drm/i915/gem/i915_gem_internal.c  |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  12 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 147 ++++++++++--------
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  11 +-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  | 116 +-------------
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  11 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  44 +++---
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |   2 +-
 .../drm/i915/gem/selftests/huge_gem_object.c  |   4 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |   6 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |   4 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |  19 +--
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  33 ++--
 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c     |   4 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c           |   2 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   3 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c       |  11 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |   6 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |   4 +-
 drivers/gpu/drm/i915/gt/intel_timeline.c      |   2 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |   2 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c    |   9 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |  14 +-
 drivers/gpu/drm/i915/gt/selftest_tlb.c        |   5 +-
 .../gpu/drm/i915/gt/selftest_workarounds.c    |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |   8 +-
 drivers/gpu/drm/i915/i915_cache.c             |  92 +++++++++++
 drivers/gpu/drm/i915/i915_cache.h             |  61 ++++++++
 drivers/gpu/drm/i915/i915_debugfs.c           |  53 +------
 drivers/gpu/drm/i915/i915_driver.c            |   5 +
 drivers/gpu/drm/i915/i915_drv.h               |   5 +
 drivers/gpu/drm/i915/i915_gem.c               |  21 +--
 drivers/gpu/drm/i915/i915_gpu_error.c         |   7 +-
 drivers/gpu/drm/i915/i915_pci.c               |  82 +++++-----
 drivers/gpu/drm/i915/i915_perf.c              |   2 +-
 drivers/gpu/drm/i915/intel_device_info.h      |   6 +-
 drivers/gpu/drm/i915/selftests/i915_gem.c     |   5 +-
 .../gpu/drm/i915/selftests/i915_gem_evict.c   |   8 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  13 +-
 drivers/gpu/drm/i915/selftests/igt_spinner.c  |   2 +-
 .../drm/i915/selftests/intel_memory_region.c  |   4 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  14 +-
 49 files changed, 465 insertions(+), 488 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_cache.c
 create mode 100644 drivers/gpu/drm/i915/i915_cache.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index c5fc91cd58e7..905a51a16588 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -35,6 +35,7 @@ subdir-ccflags-y += -I$(srctree)/$(src)
 # core driver code
 i915-y += i915_driver.o \
 	  i915_drm_client.o \
+	  i915_cache.o \
 	  i915_config.o \
 	  i915_getparam.o \
 	  i915_ioctl.o \
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index 736072a8b2b0..b07cc0c98be0 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -121,8 +121,7 @@ initial_plane_vma(struct drm_i915_private *i915,
 	 * cache_level during fbdev initialization. The
 	 * unbind there would get stuck waiting for rcu.
 	 */
-	i915_gem_object_set_cache_coherency(obj, HAS_WT(i915) ?
-					    I915_CACHE_WT : I915_CACHE_NONE);
+	i915_gem_object_set_cache_coherency(obj, i915->display_cache);
 
 	switch (plane_config->tiling) {
 	case I915_TILING_NONE:
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index dfaaa8b66ac3..567f24041b78 100644
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
@@ -257,7 +251,7 @@ i915_gem_object_set_to_gtt_domain(struct drm_i915_gem_object *obj, bool write)
 /**
  * i915_gem_object_set_cache_level - Changes the cache-level of an object across all VMA.
  * @obj: object to act on
- * @cache_level: new cache level to set for the object
+ * @cache: new caching mode to set for the object
  *
  * After this function returns, the object will be in the new cache-level
  * across all GTT and the contents of the backing storage will be coherent,
@@ -270,18 +264,28 @@ i915_gem_object_set_to_gtt_domain(struct drm_i915_gem_object *obj, bool write)
  * that all direct access to the scanout remains coherent.
  */
 int i915_gem_object_set_cache_level(struct drm_i915_gem_object *obj,
-				    enum i915_cache_level cache_level)
+				    i915_cache_t cache)
 {
-	int ret;
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	int pat, ret;
 
-	/*
-	 * For objects created by userspace through GEM_CREATE with pat_index
-	 * set by set_pat extension, simply return 0 here without touching
-	 * the cache setting, because such objects should have an immutable
-	 * cache setting by desgin and always managed by userspace.
-	 */
-	if (i915_gem_object_has_cache_level(obj, cache_level))
+	pat = i915_cache_find_pat(i915, cache);
+	if (pat < 0) {
+		char buf[I915_CACHE_NAME_LEN];
+
+		i915_cache_print(buf, sizeof(buf), NULL, cache);
+		drm_err_ratelimited(&i915->drm,
+				    "Attempting to use unknown caching mode %s!\n",
+				    buf);
+
+		return -EINVAL;
+	} else if (pat == obj->pat_index) {
 		return 0;
+	} else if (obj->pat_set_by_user) {
+		drm_notice_once(&i915->drm,
+				"Attempting to change caching mode on an object with fixed PAT!\n");
+		return -EINVAL;
+	}
 
 	ret = i915_gem_object_wait(obj,
 				   I915_WAIT_INTERRUPTIBLE |
@@ -291,7 +295,7 @@ int i915_gem_object_set_cache_level(struct drm_i915_gem_object *obj,
 		return ret;
 
 	/* Always invalidate stale cachelines */
-	i915_gem_object_set_cache_coherency(obj, cache_level);
+	i915_gem_object_set_pat_index(obj, pat);
 	obj->cache_dirty = true;
 
 	/* The cache-level will be applied when each vma is rebound. */
@@ -326,10 +330,10 @@ int i915_gem_get_caching_ioctl(struct drm_device *dev, void *data,
 		goto out;
 	}
 
-	if (i915_gem_object_has_cache_level(obj, I915_CACHE_LLC) ||
-	    i915_gem_object_has_cache_level(obj, I915_CACHE_L3_LLC))
+	if (i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WB) &&
+	    i915_gem_object_has_cache_flag(obj, I915_CACHE_FLAG_COH1W) == 1)
 		args->caching = I915_CACHING_CACHED;
-	else if (i915_gem_object_has_cache_level(obj, I915_CACHE_WT))
+	else if (i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WT))
 		args->caching = I915_CACHING_DISPLAY;
 	else
 		args->caching = I915_CACHING_NONE;
@@ -344,7 +348,7 @@ int i915_gem_set_caching_ioctl(struct drm_device *dev, void *data,
 	struct drm_i915_private *i915 = to_i915(dev);
 	struct drm_i915_gem_caching *args = data;
 	struct drm_i915_gem_object *obj;
-	enum i915_cache_level level;
+	i915_cache_t level;
 	int ret = 0;
 
 	if (IS_DGFX(i915))
@@ -367,10 +371,10 @@ int i915_gem_set_caching_ioctl(struct drm_device *dev, void *data,
 		if (!HAS_LLC(i915) && !HAS_SNOOP(i915))
 			return -ENODEV;
 
-		level = I915_CACHE_LLC;
+		level = i915->cache;
 		break;
 	case I915_CACHING_DISPLAY:
-		level = HAS_WT(i915) ? I915_CACHE_WT : I915_CACHE_NONE;
+		level = i915->display_cache;
 		break;
 	default:
 		return -EINVAL;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.h b/drivers/gpu/drm/i915/gem/i915_gem_domain.h
index 9622df962bfc..6da5c351f6fd 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.h
@@ -6,10 +6,11 @@
 #ifndef __I915_GEM_DOMAIN_H__
 #define __I915_GEM_DOMAIN_H__
 
+#include "i915_cache.h"
+
 struct drm_i915_gem_object;
-enum i915_cache_level;
 
 int i915_gem_object_set_cache_level(struct drm_i915_gem_object *obj,
-				    enum i915_cache_level cache_level);
+				    i915_cache_t cache);
 
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
index 6bc26b4b06b8..de91b416f9dd 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
@@ -142,7 +142,6 @@ __i915_gem_object_create_internal(struct drm_i915_private *i915,
 {
 	static struct lock_class_key lock_class;
 	struct drm_i915_gem_object *obj;
-	unsigned int cache_level;
 
 	GEM_BUG_ON(!size);
 	GEM_BUG_ON(!IS_ALIGNED(size, PAGE_SIZE));
@@ -170,8 +169,7 @@ __i915_gem_object_create_internal(struct drm_i915_private *i915,
 	obj->read_domains = I915_GEM_DOMAIN_CPU;
 	obj->write_domain = I915_GEM_DOMAIN_CPU;
 
-	cache_level = HAS_LLC(i915) ? I915_CACHE_LLC : I915_CACHE_NONE;
-	i915_gem_object_set_cache_coherency(obj, cache_level);
+	i915_gem_object_set_cache_coherency(obj, i915->cache);
 
 	return obj;
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index aa4d842d4c5a..9686b3e23af9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -383,16 +383,8 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 	}
 
 	/* Access to snoopable pages through the GTT is incoherent. */
-	/*
-	 * For objects created by userspace through GEM_CREATE with pat_index
-	 * set by set_pat extension, coherency is managed by userspace, make
-	 * sure we don't fail handling the vm fault by calling
-	 * i915_gem_object_has_cache_level() which always return true for such
-	 * objects. Otherwise this helper function would fall back to checking
-	 * whether the object is un-cached.
-	 */
-	if (!(i915_gem_object_has_cache_level(obj, I915_CACHE_NONE) ||
-	      HAS_LLC(i915))) {
+	if (i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC) != 1 &&
+	    !HAS_LLC(i915)) {
 		ret = -EFAULT;
 		goto err_unpin;
 	}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 97ac6fb37958..f44a2d60ee8c 100644
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
@@ -140,30 +113,84 @@ void __i915_gem_object_fini(struct drm_i915_gem_object *obj)
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
+int i915_gem_object_has_cache_flag(const struct drm_i915_gem_object *obj,
+				   unsigned int flag)
+{
+	struct drm_i915_private *i915 = obj_to_i915(obj);
+	i915_cache_t cache = INTEL_INFO(i915)->cache_modes[obj->pat_index];
+
+	if (I915_CACHE_FLAGS(cache) & flag)
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
+	if (GEM_WARN_ON(mode == I915_CACHE_MODE_UNKNOWN)) {
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
+		char buf[I915_CACHE_NAME_LEN];
 
-	if (cache_level != I915_CACHE_NONE)
-		obj->cache_coherent = (I915_BO_CACHE_COHERENT_FOR_READ |
-				       I915_BO_CACHE_COHERENT_FOR_WRITE);
-	else if (HAS_LLC(i915))
-		obj->cache_coherent = I915_BO_CACHE_COHERENT_FOR_READ;
-	else
-		obj->cache_coherent = 0;
+		i915_cache_print(buf, sizeof(buf), NULL, cache);
+		drm_err_ratelimited(&i915->drm, "Unknown cache mode %s!\n",
+				    buf);
 
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
@@ -177,24 +204,18 @@ void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
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
@@ -208,12 +229,6 @@ bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
 	if (!(obj->flags & I915_BO_ALLOC_USER))
 		return false;
 
-	/*
-	 * Always flush cache for UMD objects at creation time.
-	 */
-	if (obj->pat_set_by_user)
-		return true;
-
 	/*
 	 * EHL and JSL add the 'Bypass LLC' MOCS entry, which should make it
 	 * possible for userspace to bypass the GTT caching bits set by the
@@ -226,7 +241,17 @@ bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
 	 * it, but since i915 takes the stance of always zeroing memory before
 	 * handing it to userspace, we need to prevent this.
 	 */
-	return IS_JSL_EHL(i915);
+	if (IS_JSL_EHL(i915))
+		return true;
+
+	/*
+	 * Non-coherent write-back mode can result in stale data being seen.
+	 */
+	if (i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WB) &&
+	    i915_gem_object_has_cache_flag(obj, I915_CACHE_FLAG_COH1W) != 1)
+		return true;
+
+	return false;
 }
 
 static void i915_gem_close_object(struct drm_gem_object *gem, struct drm_file *file)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 884a17275b3a..341c41da75e3 100644
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
@@ -764,8 +761,12 @@ int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
 				      bool intr);
 bool i915_gem_object_has_unknown_state(struct drm_i915_gem_object *obj);
 
+int i915_gem_object_has_cache_mode(const struct drm_i915_gem_object *obj,
+				   enum i915_cache_mode mode);
+int i915_gem_object_has_cache_flag(const struct drm_i915_gem_object *obj,
+				   unsigned int flag);
 void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
-					 unsigned int cache_level);
+					 i915_cache_t cache);
 void i915_gem_object_set_pat_index(struct drm_i915_gem_object *obj,
 				   unsigned int pat_index);
 bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index e72c57716bee..e2304f9879c2 100644
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
@@ -391,16 +305,6 @@ struct drm_i915_gem_object {
 	/**
 	 * @cache_coherent:
 	 *
-	 * Note: with the change above which replaced @cache_level with pat_index,
-	 * the use of @cache_coherent is limited to the objects created by kernel
-	 * or by userspace without pat index specified.
-	 * Check for @pat_set_by_user to find out if an object has pat index set
-	 * by userspace. The ioctl's to change cache settings have also been
-	 * disabled for the objects with pat index set by userspace. Please don't
-	 * assume @cache_coherent having the flags set as describe here. A helper
-	 * function i915_gem_object_has_cache_level() provides one way to bypass
-	 * the use of this field.
-	 *
 	 * Track whether the pages are coherent with the GPU if reading or
 	 * writing through the CPU caches. The largely depends on the
 	 * @cache_level setting.
@@ -435,7 +339,7 @@ struct drm_i915_gem_object {
 	 * flushing the surface just before doing the scanout.  This does mean
 	 * we might unnecessarily flush non-scanout objects in some places, but
 	 * the default assumption is that all normal objects should be using
-	 * I915_CACHE_LLC, at least on platforms with the shared LLC.
+	 * I915_CACHE_CACHED, at least on platforms with the shared LLC.
 	 *
 	 * Supported values:
 	 *
@@ -474,16 +378,6 @@ struct drm_i915_gem_object {
 	/**
 	 * @cache_dirty:
 	 *
-	 * Note: with the change above which replaced cache_level with pat_index,
-	 * the use of @cache_dirty is limited to the objects created by kernel
-	 * or by userspace without pat index specified.
-	 * Check for @pat_set_by_user to find out if an object has pat index set
-	 * by userspace. The ioctl's to change cache settings have also been
-	 * disabled for the objects with pat_index set by userspace. Please don't
-	 * assume @cache_dirty is set as describe here. Also see helper function
-	 * i915_gem_object_has_cache_level() for possible ways to bypass the use
-	 * of this field.
-	 *
 	 * Track if we are we dirty with writes through the CPU cache for this
 	 * object. As a result reading directly from main memory might yield
 	 * stale data.
@@ -519,9 +413,9 @@ struct drm_i915_gem_object {
 	 *
 	 *   1. All userspace objects, by default, have @cache_level set as
 	 *   I915_CACHE_NONE. The only exception is userptr objects, where we
-	 *   instead force I915_CACHE_LLC, but we also don't allow userspace to
-	 *   ever change the @cache_level for such objects. Another special case
-	 *   is dma-buf, which doesn't rely on @cache_dirty,  but there we
+	 *   instead force I915_CACHE_CACHED, but we also don't allow userspace
+	 *   to ever change the @cache_level for such objects. Another special
+	 *   case is dma-buf, which doesn't rely on @cache_dirty,  but there we
 	 *   always do a forced flush when acquiring the pages, if there is a
 	 *   chance that the pages can be read directly from main memory with
 	 *   the GPU.
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 8f1633c3fb93..aba908f0349f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -584,7 +584,7 @@ static int shmem_object_init(struct intel_memory_region *mem,
 	static struct lock_class_key lock_class;
 	struct drm_i915_private *i915 = mem->i915;
 	struct address_space *mapping;
-	unsigned int cache_level;
+	i915_cache_t cache;
 	gfp_t mask;
 	int ret;
 
@@ -628,11 +628,11 @@ static int shmem_object_init(struct intel_memory_region *mem,
 		 * However, we maintain the display planes as UC, and so
 		 * need to rebind when first used as such.
 		 */
-		cache_level = I915_CACHE_LLC;
+		cache = I915_CACHE_CACHED;
 	else
-		cache_level = I915_CACHE_NONE;
+		cache = I915_CACHE_NONE;
 
-	i915_gem_object_set_cache_coherency(obj, cache_level);
+	i915_gem_object_set_cache_coherency(obj, cache);
 
 	i915_gem_object_init_memory_region(obj, mem);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 3b094d36a0b0..1a230b230f90 100644
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
 
@@ -694,8 +690,7 @@ static int __i915_gem_object_create_stolen(struct intel_memory_region *mem,
 
 	obj->stolen = stolen;
 	obj->read_domains = I915_GEM_DOMAIN_CPU | I915_GEM_DOMAIN_GTT;
-	cache_level = HAS_LLC(mem->i915) ? I915_CACHE_LLC : I915_CACHE_NONE;
-	i915_gem_object_set_cache_coherency(obj, cache_level);
+	i915_gem_object_set_cache_coherency(obj, mem->i915->cache);
 
 	if (WARN_ON(!i915_gem_object_trylock(obj, NULL)))
 		return -EBUSY;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 7078af2f8f79..9dabd4598b90 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -48,14 +48,24 @@ void i915_ttm_migrate_set_ban_memcpy(bool ban)
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
+		ttm->caching == ttm_cached) ? I915_CACHE_CACHED :
+					      I915_CACHE_NONE;
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
@@ -102,8 +112,8 @@ void i915_ttm_adjust_domains_after_move(struct drm_i915_gem_object *obj)
 void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
 {
 	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
-	unsigned int cache_level;
 	unsigned int mem_flags;
+	i915_cache_t cache;
 	unsigned int i;
 	int mem_type;
 
@@ -116,13 +126,13 @@ void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
 	if (!bo->resource) {
 		mem_flags = I915_BO_FLAG_STRUCT_PAGE;
 		mem_type = I915_PL_SYSTEM;
-		cache_level = I915_CACHE_NONE;
+		cache = I915_CACHE_NONE;
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
@@ -147,7 +157,7 @@ void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
 	obj->mem_flags &= ~(I915_BO_FLAG_STRUCT_PAGE | I915_BO_FLAG_IOMEM);
 	obj->mem_flags |= mem_flags;
 
-	i915_gem_object_set_cache_coherency(obj, cache_level);
+	i915_gem_object_set_cache_coherency(obj, cache);
 }
 
 /**
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
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 1d3ebdf4069b..5d2891981bd4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -553,7 +553,7 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
 	obj->mem_flags = I915_BO_FLAG_STRUCT_PAGE;
 	obj->read_domains = I915_GEM_DOMAIN_CPU;
 	obj->write_domain = I915_GEM_DOMAIN_CPU;
-	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
+	i915_gem_object_set_cache_coherency(obj, I915_CACHE_CACHED);
 
 	obj->userptr.ptr = args->user_ptr;
 	obj->userptr.notifier_seq = ULONG_MAX;
diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c b/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c
index bac957755068..85b0ffff35a6 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c
@@ -104,7 +104,6 @@ huge_gem_object(struct drm_i915_private *i915,
 {
 	static struct lock_class_key lock_class;
 	struct drm_i915_gem_object *obj;
-	unsigned int cache_level;
 
 	GEM_BUG_ON(!phys_size || phys_size > dma_size);
 	GEM_BUG_ON(!IS_ALIGNED(phys_size, PAGE_SIZE));
@@ -123,8 +122,7 @@ huge_gem_object(struct drm_i915_private *i915,
 
 	obj->read_domains = I915_GEM_DOMAIN_CPU;
 	obj->write_domain = I915_GEM_DOMAIN_CPU;
-	cache_level = HAS_LLC(i915) ? I915_CACHE_LLC : I915_CACHE_NONE;
-	i915_gem_object_set_cache_coherency(obj, cache_level);
+	i915_gem_object_set_cache_coherency(obj, i915->cache);
 	obj->scratch = phys_size;
 
 	return obj;
diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index df6c9a84252c..69857e294251 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -177,7 +177,6 @@ huge_pages_object(struct drm_i915_private *i915,
 {
 	static struct lock_class_key lock_class;
 	struct drm_i915_gem_object *obj;
-	unsigned int cache_level;
 
 	GEM_BUG_ON(!size);
 	GEM_BUG_ON(!IS_ALIGNED(size, BIT(__ffs(page_mask))));
@@ -200,8 +199,7 @@ huge_pages_object(struct drm_i915_private *i915,
 	obj->write_domain = I915_GEM_DOMAIN_CPU;
 	obj->read_domains = I915_GEM_DOMAIN_CPU;
 
-	cache_level = HAS_LLC(i915) ? I915_CACHE_LLC : I915_CACHE_NONE;
-	i915_gem_object_set_cache_coherency(obj, cache_level);
+	i915_gem_object_set_cache_coherency(obj, i915->cache);
 
 	obj->mm.page_mask = page_mask;
 
@@ -354,7 +352,7 @@ fake_huge_pages_object(struct drm_i915_private *i915, u64 size, bool single)
 
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
index c8568e5d1147..b6b205d74ad8 100644
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
@@ -37,16 +37,11 @@ static u64 gen8_pte_encode(dma_addr_t addr,
 	if (unlikely(flags & PTE_READ_ONLY))
 		pte &= ~GEN8_PAGE_RW;
 
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
@@ -850,9 +845,7 @@ static int gen8_init_scratch(struct i915_address_space *vm)
 		pte_flags |= PTE_LM;
 
 	vm->scratch[0]->encode =
-		vm->pte_encode(px_dma(vm->scratch[0]),
-			       i915_gem_get_pat_index(vm->i915,
-						      I915_CACHE_NONE),
+		vm->pte_encode(px_dma(vm->scratch[0]), vm->i915->pat_uc,
 			       pte_flags);
 
 	for (i = 1; i <= vm->top; i++) {
@@ -871,7 +864,7 @@ static int gen8_init_scratch(struct i915_address_space *vm)
 		}
 
 		fill_px(obj, vm->scratch[i - 1]->encode);
-		obj->encode = gen8_pde_encode(px_dma(obj), I915_CACHE_NONE);
+		obj->encode = gen8_pde_encode(px_dma(obj), I915_CACHE_MODE_UC);
 
 		vm->scratch[i] = obj;
 	}
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 0aff5bb13c53..fad210b1cd8b 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1103,7 +1103,7 @@ static int init_status_page(struct intel_engine_cs *engine)
 		return PTR_ERR(obj);
 	}
 
-	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
+	i915_gem_object_set_cache_coherency(obj, I915_CACHE_CACHED);
 
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
index 731d9f2bbc56..9c2622104e89 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -670,7 +670,7 @@ __vm_create_scratch_for_read(struct i915_address_space *vm, unsigned long size)
 	if (IS_ERR(obj))
 		return ERR_CAST(obj);
 
-	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
+	i915_gem_object_set_cache_coherency(obj, I915_CACHE_CACHED);
 
 	vma = i915_vma_instance(obj, vm, NULL);
 	if (IS_ERR(vma)) {
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 4d6296cdbcfd..64743bea95c9 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -635,7 +635,8 @@ void
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
index 3fd795c3263f..01dc5f1cdcd3 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -551,7 +551,9 @@ alloc_context_vma(struct intel_engine_cs *engine)
 	 * later platforms don't have L3 control bits in the PTE.
 	 */
 	if (IS_IVYBRIDGE(i915))
-		i915_gem_object_set_cache_coherency(obj, I915_CACHE_L3_LLC);
+		i915_gem_object_set_cache_coherency(obj,
+						    I915_CACHE_CACHED |
+						    __I915_CACHE_FLAG(L3));
 
 	vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL);
 	if (IS_ERR(vma)) {
diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
index b9640212d659..025ce54c886d 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline.c
+++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
@@ -26,7 +26,7 @@ static struct i915_vma *hwsp_alloc(struct intel_gt *gt)
 	if (IS_ERR(obj))
 		return ERR_CAST(obj);
 
-	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
+	i915_gem_object_set_cache_coherency(obj, I915_CACHE_CACHED);
 
 	vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
 	if (IS_ERR(vma))
diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
index 8b0d84f2aad2..fc278fa463b0 100644
--- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
@@ -64,7 +64,7 @@ static int hang_init(struct hang *h, struct intel_gt *gt)
 		goto err_hws;
 	}
 
-	i915_gem_object_set_cache_coherency(h->hws, I915_CACHE_LLC);
+	i915_gem_object_set_cache_coherency(h->hws, I915_CACHE_CACHED);
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
index 14a8b25b6204..d25990d33d44 100644
--- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
@@ -111,7 +111,7 @@ read_nonprivs(struct intel_context *ce)
 	if (IS_ERR(result))
 		return result;
 
-	i915_gem_object_set_cache_coherency(result, I915_CACHE_LLC);
+	i915_gem_object_set_cache_coherency(result, I915_CACHE_CACHED);
 
 	cs = i915_gem_object_pin_map_unlocked(result, I915_MAP_WB);
 	if (IS_ERR(cs)) {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 08e16017584b..9cdb0f2f8e84 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -1007,14 +1007,10 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
 
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
index 000000000000..90ce964887f0
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_cache.c
@@ -0,0 +1,92 @@
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
+	struct drm_printer p = drm_info_printer(i915->drm.dev);
+	char buf[I915_CACHE_NAME_LEN];
+	int ret;
+
+	i915->cache = HAS_LLC(i915) ? I915_CACHE_CACHED : I915_CACHE_NONE;
+	i915_cache_print(buf, sizeof(buf), "", i915->cache);
+	drm_printf(&p, "Coherent cache mode %s", buf);
+
+	i915->display_cache = HAS_WT(i915) ? I915_CACHE_WT : I915_CACHE_NONE;
+	i915_cache_print(buf, sizeof(buf), "", i915->display_cache);
+	drm_printf(&p, "Display cache mode %s", buf);
+
+	ret = i915_cache_find_pat(i915, I915_CACHE_NONE);
+	if (ret < 0)
+		return -ENODEV;
+	drm_info(&i915->drm, "Using PAT index %u for uncached access\n", ret);
+	i915->pat_uc = ret;
+
+	ret = i915_cache_find_pat(i915, I915_CACHE_CACHED);
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
+void i915_cache_print(char *buf, size_t buflen, const char *suffix,
+		      i915_cache_t cache)
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
+		snprintf(buf, buflen, "0x%x%s", cache, suffix ?: "");
+	} else {
+		unsigned long bit;
+		int ret;
+
+		ret = snprintf(buf, buflen, "%s", mode_str[mode]);
+		buf += ret;
+		buflen -= ret;
+
+		for_each_set_bit(bit, &flags, sizeof(i915_cache_t)) {
+			ret = snprintf(buf, buflen, "-%s", flag_str[bit]);
+			buf += ret;
+			buflen -= ret;
+		}
+
+		if (suffix)
+			snprintf(buf, buflen, "%s", suffix);
+	}
+}
diff --git a/drivers/gpu/drm/i915/i915_cache.h b/drivers/gpu/drm/i915/i915_cache.h
new file mode 100644
index 000000000000..ff970edab151
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_cache.h
@@ -0,0 +1,61 @@
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
+#define __I915_CACHE_FLAG(flag) BIT(8 + I915_CACHE_FLAG_##flag)
+
+#define _I915_CACHE(mode, flag) \
+	(i915_cache_t)((I915_CACHE_MODE_##mode) | __I915_CACHE_FLAG(flag))
+
+#define __I915_CACHE(mode, flags) \
+	(i915_cache_t)((I915_CACHE_MODE_##mode) | ((flags) << 8))
+
+#define I915_CACHE_MODE(cache) \
+	(enum i915_cache_mode)(((i915_cache_t)(cache)) & 0xff)
+#define I915_CACHE_FLAGS(cache) \
+	(unsigned int)((((i915_cache_t)(cache) & 0xff00)) >> 8)
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
+/* Helpers for i915 caching modes. */
+#define I915_CACHE_NONE		I915_CACHE(UC)
+#define I915_CACHE_CACHED	_I915_CACHE(WB, COH1W)
+#define I915_CACHE_WT		I915_CACHE(WT)
+
+int i915_cache_init(struct drm_i915_private *i915);
+int i915_cache_find_pat(struct drm_i915_private *i915, i915_cache_t cache);
+void i915_cache_print(char *buf, size_t buflen, const char *suffix,
+		      i915_cache_t cache);
+
+#define I915_CACHE_NAME_LEN (20)
+
+#endif /* __I915_CACHE_H__ */
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 4de44cf1026d..4ec292011546 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -140,57 +140,18 @@ static const char *stringify_vma_type(const struct i915_vma *vma)
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
+	char buf[I915_CACHE_NAME_LEN];
 	struct i915_vma *vma;
 	int pin_count = 0;
 
+	i915_cache_print(buf, sizeof(buf),
+			 obj->pat_set_by_user ? "!" : NULL,
+			 INTEL_INFO(i915)->cache_modes[obj->pat_index]);
+
 	seq_printf(m, "%pK: %c%c%c %8zdKiB %02x %02x %s%s%s",
 		   &obj->base,
 		   get_tiling_flag(obj),
@@ -199,7 +160,7 @@ i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
 		   obj->base.size / 1024,
 		   obj->read_domains,
 		   obj->write_domain,
-		   i915_cache_level_str(obj),
+		   buf,
 		   obj->mm.dirty ? " dirty" : "",
 		   obj->mm.madv == I915_MADV_DONTNEED ? " purgeable" : "");
 	if (obj->base.name)
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
index 682ef2b5c7d5..025cdaa99b67 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -250,6 +250,11 @@ struct drm_i915_private {
 	unsigned int hpll_freq;
 	unsigned int czclk_freq;
 
+	unsigned int pat_uc;
+	unsigned int pat_wb;
+	i915_cache_t cache;
+	i915_cache_t display_cache;
+
 	/**
 	 * wq - Driver workqueue for GEM.
 	 *
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 1f65bb33dd21..814705cfeb12 100644
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
index 4008bb09fdb5..b87548346a97 100644
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
index fcacdc21643c..5767943f397e 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -32,6 +32,7 @@
 #include "gt/intel_sa_media.h"
 #include "gem/i915_gem_object_types.h"
 
+#include "i915_cache.h"
 #include "i915_driver.h"
 #include "i915_drv.h"
 #include "i915_pci.h"
@@ -43,36 +44,41 @@
 	.__runtime.graphics.ip.ver = (x), \
 	.__runtime.media.ip.ver = (x)
 
-#define LEGACY_CACHELEVEL \
-	.cachelevel_to_pat = { \
-		[I915_CACHE_NONE]   = 0, \
-		[I915_CACHE_LLC]    = 1, \
-		[I915_CACHE_L3_LLC] = 2, \
-		[I915_CACHE_WT]     = 3, \
+#define LEGACY_CACHE_MODES \
+	.cache_modes = { \
+		[0] = I915_CACHE(UC), \
+		[1] = _I915_CACHE(WB, COH1W), \
+		[2] = __I915_CACHE(WB, BIT(I915_CACHE_FLAG_COH1W) | BIT(I915_CACHE_FLAG_L3)), \
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
+		[0] = _I915_CACHE(WB, COH1W), \
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
+		[3] = _I915_CACHE(WB, COH1W), \
+		[4] = _I915_CACHE(WT, CLOS1), \
+		[5] = __I915_CACHE(WB, BIT(I915_CACHE_FLAG_COH1W) | BIT(I915_CACHE_FLAG_CLOS1)), \
+		[6] = _I915_CACHE(WT, CLOS2), \
+		[7] = __I915_CACHE(WB, BIT(I915_CACHE_FLAG_COH1W) | BIT(I915_CACHE_FLAG_CLOS2)), \
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
+		[4] = __I915_CACHE(WB, BIT(I915_CACHE_FLAG_COH1W) | BIT(I915_CACHE_FLAG_COH2W)), \
 	}
 
 /* Keep in gen based order, and chronological order within a gen */
@@ -97,7 +103,7 @@
 	.max_pat_index = 3, \
 	GEN_DEFAULT_PAGE_SIZES, \
 	GEN_DEFAULT_REGIONS, \
-	LEGACY_CACHELEVEL
+	LEGACY_CACHE_MODES
 
 #define I845_FEATURES \
 	GEN(2), \
@@ -112,7 +118,7 @@
 	.max_pat_index = 3, \
 	GEN_DEFAULT_PAGE_SIZES, \
 	GEN_DEFAULT_REGIONS, \
-	LEGACY_CACHELEVEL
+	LEGACY_CACHE_MODES
 
 static const struct intel_device_info i830_info = {
 	I830_FEATURES,
@@ -145,7 +151,7 @@ static const struct intel_device_info i865g_info = {
 	.max_pat_index = 3, \
 	GEN_DEFAULT_PAGE_SIZES, \
 	GEN_DEFAULT_REGIONS, \
-	LEGACY_CACHELEVEL
+	LEGACY_CACHE_MODES
 
 static const struct intel_device_info i915g_info = {
 	GEN3_FEATURES,
@@ -208,7 +214,7 @@ static const struct intel_device_info pnv_m_info = {
 	.max_pat_index = 3, \
 	GEN_DEFAULT_PAGE_SIZES, \
 	GEN_DEFAULT_REGIONS, \
-	LEGACY_CACHELEVEL
+	LEGACY_CACHE_MODES
 
 static const struct intel_device_info i965g_info = {
 	GEN4_FEATURES,
@@ -252,7 +258,7 @@ static const struct intel_device_info gm45_info = {
 	.max_pat_index = 3, \
 	GEN_DEFAULT_PAGE_SIZES, \
 	GEN_DEFAULT_REGIONS, \
-	LEGACY_CACHELEVEL
+	LEGACY_CACHE_MODES
 
 static const struct intel_device_info ilk_d_info = {
 	GEN5_FEATURES,
@@ -282,7 +288,7 @@ static const struct intel_device_info ilk_m_info = {
 	.__runtime.ppgtt_size = 31, \
 	GEN_DEFAULT_PAGE_SIZES, \
 	GEN_DEFAULT_REGIONS, \
-	LEGACY_CACHELEVEL
+	LEGACY_CACHE_MODES
 
 #define SNB_D_PLATFORM \
 	GEN6_FEATURES, \
@@ -330,7 +336,7 @@ static const struct intel_device_info snb_m_gt2_info = {
 	.__runtime.ppgtt_size = 31, \
 	GEN_DEFAULT_PAGE_SIZES, \
 	GEN_DEFAULT_REGIONS, \
-	LEGACY_CACHELEVEL
+	LEGACY_CACHE_MODES
 
 #define IVB_D_PLATFORM \
 	GEN7_FEATURES, \
@@ -387,7 +393,7 @@ static const struct intel_device_info vlv_info = {
 	.platform_engine_mask = BIT(RCS0) | BIT(VCS0) | BIT(BCS0),
 	GEN_DEFAULT_PAGE_SIZES,
 	GEN_DEFAULT_REGIONS,
-	LEGACY_CACHELEVEL,
+	LEGACY_CACHE_MODES
 };
 
 #define G75_FEATURES  \
@@ -473,7 +479,7 @@ static const struct intel_device_info chv_info = {
 	.has_coherent_ggtt = false,
 	GEN_DEFAULT_PAGE_SIZES,
 	GEN_DEFAULT_REGIONS,
-	LEGACY_CACHELEVEL,
+	LEGACY_CACHE_MODES
 };
 
 #define GEN9_DEFAULT_PAGE_SIZES \
@@ -536,7 +542,7 @@ static const struct intel_device_info skl_gt4_info = {
 	.max_pat_index = 3, \
 	GEN9_DEFAULT_PAGE_SIZES, \
 	GEN_DEFAULT_REGIONS, \
-	LEGACY_CACHELEVEL
+	LEGACY_CACHE_MODES
 
 static const struct intel_device_info bxt_info = {
 	GEN9_LP_FEATURES,
@@ -640,7 +646,7 @@ static const struct intel_device_info jsl_info = {
 #define GEN12_FEATURES \
 	GEN11_FEATURES, \
 	GEN(12), \
-	TGL_CACHELEVEL, \
+	GEN12_CACHE_MODES, \
 	.has_global_mocs = 1, \
 	.has_pxp = 1, \
 	.max_pat_index = 3
@@ -708,7 +714,7 @@ static const struct intel_device_info adl_p_info = {
 	.__runtime.graphics.ip.ver = 12, \
 	.__runtime.graphics.ip.rel = 50, \
 	XE_HP_PAGE_SIZES, \
-	TGL_CACHELEVEL, \
+	GEN12_CACHE_MODES, \
 	.dma_mask_size = 46, \
 	.has_3d_pipeline = 1, \
 	.has_64bit_reloc = 1, \
@@ -803,7 +809,7 @@ static const struct intel_device_info pvc_info = {
 		BIT(VCS0) |
 		BIT(CCS0) | BIT(CCS1) | BIT(CCS2) | BIT(CCS3),
 	.require_force_probe = 1,
-	PVC_CACHELEVEL,
+	PVC_CACHE_MODES
 };
 
 static const struct intel_gt_definition xelpmp_extra_gt[] = {
@@ -838,7 +844,7 @@ static const struct intel_device_info mtl_info = {
 	.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
 	.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
 	.require_force_probe = 1,
-	MTL_CACHELEVEL,
+	MTL_CACHE_MODES
 };
 
 #undef PLATFORM
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 49c6f1ff1128..c3906dcaf1e6 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -1870,7 +1870,7 @@ static int alloc_oa_buffer(struct i915_perf_stream *stream)
 		return PTR_ERR(bo);
 	}
 
-	i915_gem_object_set_cache_coherency(bo, I915_CACHE_LLC);
+	i915_gem_object_set_cache_coherency(bo, I915_CACHE_CACHED);
 
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
index f8fe3681c3dc..ba821e48baa5 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
@@ -246,7 +246,7 @@ static int igt_evict_for_cache_color(void *arg)
 	struct drm_mm_node target = {
 		.start = I915_GTT_PAGE_SIZE * 2,
 		.size = I915_GTT_PAGE_SIZE,
-		.color = i915_gem_get_pat_index(gt->i915, I915_CACHE_LLC),
+		.color = gt->i915->pat_wb,
 	};
 	struct drm_i915_gem_object *obj;
 	struct i915_vma *vma;
@@ -267,7 +267,7 @@ static int igt_evict_for_cache_color(void *arg)
 		err = PTR_ERR(obj);
 		goto cleanup;
 	}
-	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
+	i915_gem_object_set_cache_coherency(obj, I915_CACHE_CACHED);
 	quirk_add(obj, &objects);
 
 	vma = i915_gem_object_ggtt_pin(obj, NULL, 0, 0,
@@ -283,7 +283,7 @@ static int igt_evict_for_cache_color(void *arg)
 		err = PTR_ERR(obj);
 		goto cleanup;
 	}
-	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
+	i915_gem_object_set_cache_coherency(obj, I915_CACHE_CACHED);
 	quirk_add(obj, &objects);
 
 	/* Neighbouring; same colour - should fit */
@@ -309,7 +309,7 @@ static int igt_evict_for_cache_color(void *arg)
 	/* Attempt to remove the first *pinned* vma, by removing the (empty)
 	 * neighbour -- this should fail.
 	 */
-	target.color = i915_gem_get_pat_index(gt->i915, I915_CACHE_L3_LLC);
+	target.color = gt->i915->pat_uc;
 
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
index 618d9386d554..e23f23fea23c 100644
--- a/drivers/gpu/drm/i915/selftests/igt_spinner.c
+++ b/drivers/gpu/drm/i915/selftests/igt_spinner.c
@@ -23,7 +23,7 @@ int igt_spinner_init(struct igt_spinner *spin, struct intel_gt *gt)
 		err = PTR_ERR(spin->hws);
 		goto err;
 	}
-	i915_gem_object_set_cache_coherency(spin->hws, I915_CACHE_LLC);
+	i915_gem_object_set_cache_coherency(spin->hws, I915_CACHE_CACHED);
 
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
index 12aa7fbb0748..1e5de235b78f 100644
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
+		[1] = _I915_CACHE(WB, COH1W),
+		[2] = __I915_CACHE(WB, BIT(I915_CACHE_FLAG_COH1W) | BIT(I915_CACHE_FLAG_L3)), \
+		[3] = I915_CACHE(WT),
 	},
 };
 
@@ -181,6 +181,8 @@ struct drm_i915_private *mock_gem_device(void)
 	/* Set up device info and initial runtime info. */
 	intel_device_info_driver_create(i915, pdev->device, &mock_info);
 
+	WARN_ON(i915_cache_init(i915));
+
 	dev_pm_domain_set(&pdev->dev, &pm_domain);
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
-- 
2.39.2

