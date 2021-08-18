Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 706873F0749
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 16:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AFB6E817;
	Wed, 18 Aug 2021 14:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FBA6E81D;
 Wed, 18 Aug 2021 14:59:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="216372968"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="216372968"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 07:59:39 -0700
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="488747404"
Received: from moloings-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.10.29])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 07:59:38 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 1/2] drm/i915/buddy: add some pretty printing
Date: Wed, 18 Aug 2021 15:58:49 +0100
Message-Id: <20210818145850.225387-1-matthew.auld@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement the debug hook for the buddy resource manager. For this we
want to print out the status of the memory manager, including how much
memory is still allocatable, what page sizes we have etc. This will be
triggered when TTM is unable to fulfil an allocation request for device
local-memory.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_buddy.c             | 45 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_buddy.h             |  8 ++++
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 20 ++++++++-
 3 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_buddy.c b/drivers/gpu/drm/i915/i915_buddy.c
index 7b274c51cac0..240e881d9eb0 100644
--- a/drivers/gpu/drm/i915/i915_buddy.c
+++ b/drivers/gpu/drm/i915/i915_buddy.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/kmemleak.h>
+#include <linux/sizes.h>
 
 #include "i915_buddy.h"
 
@@ -82,6 +83,7 @@ int i915_buddy_init(struct i915_buddy_mm *mm, u64 size, u64 chunk_size)
 	size = round_down(size, chunk_size);
 
 	mm->size = size;
+	mm->avail = size;
 	mm->chunk_size = chunk_size;
 	mm->max_order = ilog2(size) - ilog2(chunk_size);
 
@@ -155,6 +157,8 @@ void i915_buddy_fini(struct i915_buddy_mm *mm)
 		i915_block_free(mm, mm->roots[i]);
 	}
 
+	GEM_WARN_ON(mm->avail != mm->size);
+
 	kfree(mm->roots);
 	kfree(mm->free_list);
 }
@@ -230,6 +234,7 @@ void i915_buddy_free(struct i915_buddy_mm *mm,
 		     struct i915_buddy_block *block)
 {
 	GEM_BUG_ON(!i915_buddy_block_is_allocated(block));
+	mm->avail += i915_buddy_block_size(mm, block);
 	__i915_buddy_free(mm, block);
 }
 
@@ -283,6 +288,7 @@ i915_buddy_alloc(struct i915_buddy_mm *mm, unsigned int order)
 	}
 
 	mark_allocated(block);
+	mm->avail -= i915_buddy_block_size(mm, block);
 	kmemleak_update_trace(block);
 	return block;
 
@@ -368,6 +374,7 @@ int i915_buddy_alloc_range(struct i915_buddy_mm *mm,
 			}
 
 			mark_allocated(block);
+			mm->avail -= i915_buddy_block_size(mm, block);
 			list_add_tail(&block->link, &allocated);
 			continue;
 		}
@@ -402,6 +409,44 @@ int i915_buddy_alloc_range(struct i915_buddy_mm *mm,
 	return err;
 }
 
+void i915_buddy_block_print(struct i915_buddy_mm *mm,
+			    struct i915_buddy_block *block,
+			    struct drm_printer *p)
+{
+	u64 start = i915_buddy_block_offset(block);
+	u64 size = i915_buddy_block_size(mm, block);
+
+	drm_printf(p, "%#018llx-%#018llx: %llu\n", start, start + size, size);
+}
+
+void i915_buddy_print(struct i915_buddy_mm *mm, struct drm_printer *p)
+{
+	int order;
+
+	drm_printf(p, "chunk_size: %lluKB, total: %lluMB, free: %lluMB\n",
+		   mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20);
+
+	for (order = mm->max_order; order >= 0; order--) {
+		struct i915_buddy_block *block;
+		u64 count = 0, free;
+
+		list_for_each_entry(block, &mm->free_list[order], link) {
+			GEM_BUG_ON(!i915_buddy_block_is_free(block));
+			count++;
+		}
+
+		drm_printf(p, "order-%d ", order);
+
+		free = count * (mm->chunk_size << order);
+		if (free < SZ_1M)
+			drm_printf(p, "free: %lluKB", free >> 10);
+		else
+			drm_printf(p, "free: %lluMB", free >> 20);
+
+		drm_printf(p, ", pages: %llu\n", count);
+	}
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftests/i915_buddy.c"
 #endif
diff --git a/drivers/gpu/drm/i915/i915_buddy.h b/drivers/gpu/drm/i915/i915_buddy.h
index 3940d632f208..7077742112ac 100644
--- a/drivers/gpu/drm/i915/i915_buddy.h
+++ b/drivers/gpu/drm/i915/i915_buddy.h
@@ -10,6 +10,8 @@
 #include <linux/list.h>
 #include <linux/slab.h>
 
+#include <drm/drm_print.h>
+
 struct i915_buddy_block {
 #define I915_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
 #define I915_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
@@ -69,6 +71,7 @@ struct i915_buddy_mm {
 	/* Must be at least PAGE_SIZE */
 	u64 chunk_size;
 	u64 size;
+	u64 avail;
 };
 
 static inline u64
@@ -129,6 +132,11 @@ void i915_buddy_free(struct i915_buddy_mm *mm, struct i915_buddy_block *block);
 
 void i915_buddy_free_list(struct i915_buddy_mm *mm, struct list_head *objects);
 
+void i915_buddy_print(struct i915_buddy_mm *mm, struct drm_printer *p);
+void i915_buddy_block_print(struct i915_buddy_mm *mm,
+			    struct i915_buddy_block *block,
+			    struct drm_printer *p);
+
 void i915_buddy_module_exit(void);
 int i915_buddy_module_init(void);
 
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index 6877362f6b85..95ab786a1fe4 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -126,12 +126,30 @@ static void i915_ttm_buddy_man_free(struct ttm_resource_manager *man,
 	kfree(bman_res);
 }
 
+static void i915_ttm_buddy_man_debug(struct ttm_resource_manager *man,
+				     struct drm_printer *printer)
+{
+	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
+	struct i915_buddy_block *block;
+
+	mutex_lock(&bman->lock);
+	drm_printf(printer, "default_page_size: %lluKB\n",
+		   bman->default_page_size >> 10);
+
+	i915_buddy_print(&bman->mm, printer);
+
+	drm_printf(printer, "reserved:\n");
+	list_for_each_entry(block, &bman->reserved, link)
+		i915_buddy_block_print(&bman->mm, block, printer);
+	mutex_unlock(&bman->lock);
+}
+
 static const struct ttm_resource_manager_func i915_ttm_buddy_manager_func = {
 	.alloc = i915_ttm_buddy_man_alloc,
 	.free = i915_ttm_buddy_man_free,
+	.debug = i915_ttm_buddy_man_debug,
 };
 
-
 /**
  * i915_ttm_buddy_man_init - Setup buddy allocator based ttm manager
  * @bdev: The ttm device
-- 
2.26.3

