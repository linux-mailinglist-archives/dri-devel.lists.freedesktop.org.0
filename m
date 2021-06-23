Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 336953B1F6B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 19:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB276E96B;
	Wed, 23 Jun 2021 17:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951066E96A;
 Wed, 23 Jun 2021 17:27:17 +0000 (UTC)
IronPort-SDR: Tb1LIJ0lIlIZdWtk3qnNb9/AlyXX4iL1B8VdvemWWHvN8Pjp1/ea2FDeu6G9PdqwOODNXlYJfq
 IqadsVrD65Ew==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="187000638"
X-IronPort-AV: E=Sophos;i="5.83,294,1616482800"; d="scan'208";a="187000638"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 10:27:17 -0700
IronPort-SDR: ne61GF9W5rZN+Bo2SOjotqR5uAGMcMCg6V99M/MnXesEWUbgi7dekw85loBVyggbYi4nbVHWht
 TYAqd3Pl/bdw==
X-IronPort-AV: E=Sophos;i="5.83,294,1616482800"; d="scan'208";a="423768979"
Received: from dconnon-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.14.111])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 10:27:15 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: add back the avail tracking
Date: Wed, 23 Jun 2021 18:27:06 +0100
Message-Id: <20210623172706.315165-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks like it got lost along the way, so add it back. This is needed for
the region query uAPI where we want to report a snapshot of how much
lmem is available.

This time around let's push it directly into the allocator, which
simplifies things, like not having to care about internal fragmentation,
or having to remember to track things for all possible interfaces that
might want to allocate or reserve pages.

v2(Thomas): add some more kernel doc

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_buddy.c             |  6 ++++++
 drivers/gpu/drm/i915/i915_buddy.h             |  1 +
 drivers/gpu/drm/i915/i915_debugfs.c           |  5 +++--
 drivers/gpu/drm/i915/i915_query.c             |  2 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 13 +++++++++++++
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |  2 ++
 drivers/gpu/drm/i915/intel_memory_region.c    | 15 +++++++++++++++
 drivers/gpu/drm/i915/intel_memory_region.h    |  4 ++++
 8 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_buddy.c b/drivers/gpu/drm/i915/i915_buddy.c
index 29dd7d0310c1..27cd2487a18f 100644
--- a/drivers/gpu/drm/i915/i915_buddy.c
+++ b/drivers/gpu/drm/i915/i915_buddy.c
@@ -80,6 +80,7 @@ int i915_buddy_init(struct i915_buddy_mm *mm, u64 size, u64 chunk_size)
 	size = round_down(size, chunk_size);
 
 	mm->size = size;
+	mm->avail = size;
 	mm->chunk_size = chunk_size;
 	mm->max_order = ilog2(size) - ilog2(chunk_size);
 
@@ -159,6 +160,8 @@ void i915_buddy_fini(struct i915_buddy_mm *mm)
 		i915_block_free(mm, mm->roots[i]);
 	}
 
+	GEM_WARN_ON(mm->avail != mm->size);
+
 	kfree(mm->roots);
 	kfree(mm->free_list);
 	kmem_cache_destroy(mm->slab_blocks);
@@ -235,6 +238,7 @@ void i915_buddy_free(struct i915_buddy_mm *mm,
 		     struct i915_buddy_block *block)
 {
 	GEM_BUG_ON(!i915_buddy_block_is_allocated(block));
+	mm->avail += i915_buddy_block_size(mm, block);
 	__i915_buddy_free(mm, block);
 }
 
@@ -288,6 +292,7 @@ i915_buddy_alloc(struct i915_buddy_mm *mm, unsigned int order)
 	}
 
 	mark_allocated(block);
+	mm->avail -= i915_buddy_block_size(mm, block);
 	kmemleak_update_trace(block);
 	return block;
 
@@ -373,6 +378,7 @@ int i915_buddy_alloc_range(struct i915_buddy_mm *mm,
 			}
 
 			mark_allocated(block);
+			mm->avail -= i915_buddy_block_size(mm, block);
 			list_add_tail(&block->link, &allocated);
 			continue;
 		}
diff --git a/drivers/gpu/drm/i915/i915_buddy.h b/drivers/gpu/drm/i915/i915_buddy.h
index 37f8c42071d1..feb7c1bb6244 100644
--- a/drivers/gpu/drm/i915/i915_buddy.h
+++ b/drivers/gpu/drm/i915/i915_buddy.h
@@ -70,6 +70,7 @@ struct i915_buddy_mm {
 	/* Must be at least PAGE_SIZE */
 	u64 chunk_size;
 	u64 size;
+	u64 avail;
 };
 
 static inline u64
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index cc745751ac53..4765f220469e 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -246,8 +246,9 @@ static int i915_gem_object_info(struct seq_file *m, void *data)
 		   atomic_read(&i915->mm.free_count),
 		   i915->mm.shrink_memory);
 	for_each_memory_region(mr, i915, id)
-		seq_printf(m, "%s: total:%pa, available:%pa bytes\n",
-			   mr->name, &mr->total, &mr->avail);
+		seq_printf(m, "%s: total:%pa, available:%llu bytes\n",
+			   mr->name, &mr->total,
+			   intel_memory_region_get_avail(mr));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index e49da36c62fb..f10dcea94ac9 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -465,7 +465,7 @@ static int query_memregion_info(struct drm_i915_private *i915,
 		info.region.memory_class = mr->type;
 		info.region.memory_instance = mr->instance;
 		info.probed_size = mr->total;
-		info.unallocated_size = mr->avail;
+		info.unallocated_size = intel_memory_region_get_avail(mr);
 
 		if (__copy_to_user(info_ptr, &info, sizeof(info)))
 			return -EFAULT;
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index fc7ad5c035b8..562d11edc5e4 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -246,3 +246,16 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
 	return ret;
 }
 
+/**
+ * i915_ttm_buddy_man_avail - Get the currently available size
+ * @man: The buddy allocator ttm manager
+ *
+ * Return: The available size in bytes
+ */
+u64 i915_ttm_buddy_man_get_avail(struct ttm_resource_manager *man)
+{
+	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
+	struct i915_buddy_mm *mm = &bman->mm;
+
+	return mm->avail;
+}
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
index 26026213e20a..39f5b1a4c3e7 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
@@ -53,4 +53,6 @@ int i915_ttm_buddy_man_fini(struct ttm_device *bdev,
 int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
 			       u64 start, u64 size);
 
+u64 i915_ttm_buddy_man_get_avail(struct ttm_resource_manager *man);
+
 #endif
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index df59f884d37c..d5edf088be48 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -132,6 +132,21 @@ void intel_memory_region_set_name(struct intel_memory_region *mem,
 	va_end(ap);
 }
 
+/**
+ * intel_memory_region_get_avail - Get the currently available size for the
+ * region
+ * @mr: The memory region
+ *
+ * Return: The available size in bytes
+ */
+u64 intel_memory_region_get_avail(struct intel_memory_region *mr)
+{
+	if (mr->type == INTEL_MEMORY_LOCAL)
+		return i915_ttm_buddy_man_get_avail(mr->region_private);
+
+	return mr->avail;
+}
+
 static void __intel_memory_region_destroy(struct kref *kref)
 {
 	struct intel_memory_region *mem =
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index 2be8433d373a..6f7a073d5a70 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -74,6 +74,7 @@ struct intel_memory_region {
 	resource_size_t io_start;
 	resource_size_t min_page_size;
 	resource_size_t total;
+	/* Do not access directly. Use the accessor instead. */
 	resource_size_t avail;
 
 	u16 type;
@@ -125,4 +126,7 @@ intel_memory_region_set_name(struct intel_memory_region *mem,
 int intel_memory_region_reserve(struct intel_memory_region *mem,
 				resource_size_t offset,
 				resource_size_t size);
+
+u64 intel_memory_region_get_avail(struct intel_memory_region *mem);
+
 #endif
-- 
2.26.3

