Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 019AC304BB7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 22:45:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36346E4BB;
	Tue, 26 Jan 2021 21:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14CE46E466;
 Tue, 26 Jan 2021 21:44:39 +0000 (UTC)
IronPort-SDR: kRyTBmGzx4AWPKJyjIR+6tuiXjgXmJkWLMiTV+xyW2gNawMBHaGP3xdNcxgaYk4RsjKI4IEGhI
 w5VTmpF73WVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="198770835"
X-IronPort-AV: E=Sophos;i="5.79,377,1602572400"; d="scan'208";a="198770835"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 13:44:38 -0800
IronPort-SDR: zc66kQ1JtSLeYK+wt641PVVb/HET+nEaDxne1KFIOAlpQAAsXthG14gnFUqzJrerD6iJkLIOGH
 +M/naXge3Lrw==
X-IronPort-AV: E=Sophos;i="5.79,377,1602572400"; d="scan'208";a="362139908"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 26 Jan 2021 13:44:37 -0800
From: Brian Welty <brian.welty@intel.com>
To: Brian Welty <brian.welty@intel.com>, cgroups@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Kenny Ho <Kenny.Ho@amd.com>, amd-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Eero Tamminen <eero.t.tamminen@intel.com>
Subject: [RFC PATCH 9/9] drm/i915: Use memory cgroup for enforcing device
 memory limit
Date: Tue, 26 Jan 2021 13:46:26 -0800
Message-Id: <20210126214626.16260-10-brian.welty@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210126214626.16260-1-brian.welty@intel.com>
References: <20210126214626.16260-1-brian.welty@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To charge device memory allocations, we need to (1) identify appropriate
cgroup to charge (currently decided at object creation time), and (2)
make the charging call at the time that memory pages are being allocated.

For (1), see prior DRM patch which associates current task's cgroup with
GEM objects as they are created.  That cgroup will be charged/uncharged
for all paging activity against the GEM object.

For (2), we call drm_get_object_charge_mem() in .get_pages callback
for the GEM object type.  Uncharging is done in .put_pages when the
memory is marked such that it can be evicted.  The try_charge() call will
fail with -ENOMEM if the current memory allocation will exceed the cgroup
device memory maximum, and allow for driver to perform memory reclaim.

We also set the total device memory reported by DRM cgroup by storing
in drm_device.drmcg_props after initializing LMEM memory regions.

FIXME: to release drm cgroup reference requires this additional patch:
  https://patchwork.freedesktop.org/patch/349029

Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c   |  1 +
 drivers/gpu/drm/i915/gem/i915_gem_region.c | 23 ++++++++++++++++++----
 drivers/gpu/drm/i915/intel_memory_region.c | 13 ++++++++++--
 drivers/gpu/drm/i915/intel_memory_region.h |  2 +-
 4 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index ec28a6cde49b..9fbe91d4d2f1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -16,6 +16,7 @@
 #include "i915_gem_gtt.h"
 #include "i915_gem_ioctls.h"
 #include "i915_gem_object.h"
+#include "i915_gem_lmem.h"
 #include "i915_gem_mman.h"
 #include "i915_trace.h"
 #include "i915_user_extensions.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
index 3e3dad22a683..690b36b25984 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
@@ -12,11 +12,14 @@ void
 i915_gem_object_put_pages_buddy(struct drm_i915_gem_object *obj,
 				struct sg_table *pages)
 {
-	__intel_memory_region_put_pages_buddy(obj->mm.region, &obj->mm.blocks);
+	u64 freed;
 
+	freed = __intel_memory_region_put_pages_buddy(obj->mm.region,
+						      &obj->mm.blocks);
 	obj->mm.dirty = false;
 	sg_free_table(pages);
 	kfree(pages);
+	drm_gem_object_uncharge_mem(&obj->base, freed);
 }
 
 int
@@ -25,7 +28,7 @@ i915_gem_object_get_pages_buddy(struct drm_i915_gem_object *obj)
 	const u64 max_segment = i915_sg_segment_size();
 	struct intel_memory_region *mem = obj->mm.region;
 	struct list_head *blocks = &obj->mm.blocks;
-	resource_size_t size = obj->base.size;
+	resource_size_t charged, size = obj->base.size;
 	resource_size_t prev_end;
 	struct i915_buddy_block *block;
 	unsigned int flags;
@@ -44,12 +47,22 @@ i915_gem_object_get_pages_buddy(struct drm_i915_gem_object *obj)
 	}
 
 	flags = I915_ALLOC_MIN_PAGE_SIZE;
-	if (obj->flags & I915_BO_ALLOC_CONTIGUOUS)
+	if (obj->flags & I915_BO_ALLOC_CONTIGUOUS) {
 		flags |= I915_ALLOC_CONTIGUOUS;
+		charged = roundup_pow_of_two(size);
+	} else {
+		charged = size;
+	}
+
+	ret = drm_gem_object_charge_mem(&obj->base, charged);
+	if (ret) {
+		DRM_DEBUG("DRMCG: charge_mem failed for %lld\n", charged);
+		goto err_free_sg;
+	}
 
 	ret = __intel_memory_region_get_pages_buddy(mem, size, flags, blocks);
 	if (ret)
-		goto err_free_sg;
+		goto err_uncharge;
 
 	GEM_BUG_ON(list_empty(blocks));
 
@@ -99,6 +112,8 @@ i915_gem_object_get_pages_buddy(struct drm_i915_gem_object *obj)
 
 	return 0;
 
+err_uncharge:
+	drm_gem_object_uncharge_mem(&obj->base, charged);
 err_free_sg:
 	sg_free_table(st);
 	kfree(st);
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index 1bfcdd89b241..9b1edbf4361c 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -46,13 +46,18 @@ intel_memory_region_free_pages(struct intel_memory_region *mem,
 	return size;
 }
 
-void
+u64
 __intel_memory_region_put_pages_buddy(struct intel_memory_region *mem,
 				      struct list_head *blocks)
 {
+	u64 freed;
+
 	mutex_lock(&mem->mm_lock);
-	mem->avail += intel_memory_region_free_pages(mem, blocks);
+	freed = intel_memory_region_free_pages(mem, blocks);
+	mem->avail += freed;
 	mutex_unlock(&mem->mm_lock);
+
+	return freed;
 }
 
 void
@@ -241,6 +246,7 @@ void intel_memory_region_put(struct intel_memory_region *mem)
 
 int intel_memory_regions_hw_probe(struct drm_i915_private *i915)
 {
+	u64 lmem_total = 0;
 	int err, i;
 
 	for (i = 0; i < ARRAY_SIZE(i915->mm.regions); i++) {
@@ -260,6 +266,7 @@ int intel_memory_regions_hw_probe(struct drm_i915_private *i915)
 			break;
 		case INTEL_MEMORY_LOCAL:
 			mem = intel_setup_fake_lmem(i915);
+			lmem_total += mem->total;
 			break;
 		}
 
@@ -278,6 +285,8 @@ int intel_memory_regions_hw_probe(struct drm_i915_private *i915)
 		i915->mm.regions[i] = mem;
 	}
 
+	i915->drm.drmcg_props.memory_total = lmem_total;
+
 	return 0;
 
 out_cleanup:
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index 6ffc0673f005..c9fca951a372 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -109,7 +109,7 @@ struct i915_buddy_block *
 __intel_memory_region_get_block_buddy(struct intel_memory_region *mem,
 				      resource_size_t size,
 				      unsigned int flags);
-void __intel_memory_region_put_pages_buddy(struct intel_memory_region *mem,
+u64 __intel_memory_region_put_pages_buddy(struct intel_memory_region *mem,
 					   struct list_head *blocks);
 void __intel_memory_region_put_block_buddy(struct i915_buddy_block *block);
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
