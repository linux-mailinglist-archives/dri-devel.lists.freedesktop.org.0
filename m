Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E4549CDF7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 16:22:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115AA10E91A;
	Wed, 26 Jan 2022 15:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFADC10E8F3;
 Wed, 26 Jan 2022 15:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643210533; x=1674746533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O9YHsJJ8QqwcDnuFLKWvlpOsenMiBpdG/FkU34s/g8Q=;
 b=WfqgW16TRX2A8h99AQEQwuH98AevFlCZHVYYEfXA7QHaeAFQ8Iajy43d
 32QbbZWuS4pvjnvkwyBm5XtpH5S953byQ71arAzJDANtwDPUEbhzjZyfB
 bo++fvnLIgS2waHiPWpVx/V031OR/TLmoVHib0kifsAutuCk9lhc84Wvb
 EFNlRvpaBosP4XPrdxY7d5yRLCrft/fg0alcuAv7qPjhiVtOHbF1fPBo5
 grJNflWtTzJow/zOrb/JGWHXjSVpKNkk4fiFTpW043j+hKj1inFiXHl0+
 FOcqtZNnAl2JFlOg04TpsLynl7o+u4tvRvgnaSSkUR00uRt56/vgvHZTx Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="309885224"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="309885224"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="674386251"
Received: from jamesstx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.247.182])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:12 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 07/20] drm/i915/buddy: track available visible size
Date: Wed, 26 Jan 2022 15:21:42 +0000
Message-Id: <20220126152155.3070602-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126152155.3070602-1-matthew.auld@intel.com>
References: <20220126152155.3070602-1-matthew.auld@intel.com>
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

Track the total amount of available visible memory, and also track
per-resource the amount of used visible memory. For now this is useful
for our debug output, and deciding if it is even worth calling into the
buddy allocator. In the future tracking the per-resource visible usage
will be useful for when deciding if we should attempt to evict certain
buffers.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 55 ++++++++++++++++++-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |  8 ++-
 drivers/gpu/drm/i915/intel_region_ttm.c       |  1 +
 3 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index 53eb100688a6..6e5842155898 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -19,6 +19,8 @@ struct i915_ttm_buddy_manager {
 	struct drm_buddy mm;
 	struct list_head reserved;
 	struct mutex lock;
+	unsigned long visible_size;
+	unsigned long visible_avail;
 	u64 default_page_size;
 };
 
@@ -87,6 +89,13 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	n_pages = size >> ilog2(mm->chunk_size);
 
 	mutex_lock(&bman->lock);
+	if (place->lpfn && place->lpfn <= bman->visible_size &&
+	    n_pages > bman->visible_avail) {
+		mutex_unlock(&bman->lock);
+		err = -ENOSPC;
+		goto err_free_res;
+	}
+
 	err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
 				    (u64)lpfn << PAGE_SHIFT,
 				    (u64)n_pages << PAGE_SHIFT,
@@ -107,6 +116,30 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 		mutex_unlock(&bman->lock);
 	}
 
+	if (place->lpfn && place->lpfn <= bman->visible_size) {
+		bman_res->used_visible_size = bman_res->base.num_pages;
+	} else {
+		struct drm_buddy_block *block;
+
+		list_for_each_entry(block, &bman_res->blocks, link) {
+			unsigned long start =
+				drm_buddy_block_offset(block) >> PAGE_SHIFT;
+			unsigned long end = start +
+				(drm_buddy_block_size(mm, block) >> PAGE_SHIFT);
+
+			if (start < bman->visible_size) {
+				bman_res->used_visible_size +=
+					min(end, bman->visible_size) - start;
+			}
+		}
+	}
+
+	if (bman_res->used_visible_size) {
+		mutex_lock(&bman->lock);
+		bman->visible_avail -= bman_res->used_visible_size;
+		mutex_unlock(&bman->lock);
+	}
+
 	*res = &bman_res->base;
 	return 0;
 
@@ -127,6 +160,7 @@ static void i915_ttm_buddy_man_free(struct ttm_resource_manager *man,
 
 	mutex_lock(&bman->lock);
 	drm_buddy_free_list(&bman->mm, &bman_res->blocks);
+	bman->visible_avail += bman_res->used_visible_size;
 	mutex_unlock(&bman->lock);
 
 	kfree(bman_res);
@@ -141,6 +175,10 @@ static void i915_ttm_buddy_man_debug(struct ttm_resource_manager *man,
 	mutex_lock(&bman->lock);
 	drm_printf(printer, "default_page_size: %lluKiB\n",
 		   bman->default_page_size >> 10);
+	drm_printf(printer, "visible_avail: %luMiB\n",
+		   bman->visible_avail << PAGE_SHIFT >> 20);
+	drm_printf(printer, "visible_size: %luMiB\n",
+		   bman->visible_size << PAGE_SHIFT >> 20);
 
 	drm_buddy_print(&bman->mm, printer);
 
@@ -162,6 +200,7 @@ static const struct ttm_resource_manager_func i915_ttm_buddy_manager_func = {
  * @type: Memory type we want to manage
  * @use_tt: Set use_tt for the manager
  * @size: The size in bytes to manage
+ * @visible_size: The CPU visible size in bytes to manage
  * @default_page_size: The default minimum page size in bytes for allocations,
  * this must be at least as large as @chunk_size, and can be overridden by
  * setting the BO page_alignment, to be larger or smaller as needed.
@@ -185,7 +224,7 @@ static const struct ttm_resource_manager_func i915_ttm_buddy_manager_func = {
  */
 int i915_ttm_buddy_man_init(struct ttm_device *bdev,
 			    unsigned int type, bool use_tt,
-			    u64 size, u64 default_page_size,
+			    u64 size, u64 visible_size, u64 default_page_size,
 			    u64 chunk_size)
 {
 	struct ttm_resource_manager *man;
@@ -204,6 +243,8 @@ int i915_ttm_buddy_man_init(struct ttm_device *bdev,
 	INIT_LIST_HEAD(&bman->reserved);
 	GEM_BUG_ON(default_page_size < chunk_size);
 	bman->default_page_size = default_page_size;
+	bman->visible_size = visible_size >> PAGE_SHIFT;
+	bman->visible_avail = bman->visible_size;
 
 	man = &bman->manager;
 	man->use_tt = use_tt;
@@ -248,6 +289,7 @@ int i915_ttm_buddy_man_fini(struct ttm_device *bdev, unsigned int type)
 	mutex_lock(&bman->lock);
 	drm_buddy_free_list(mm, &bman->reserved);
 	drm_buddy_fini(mm);
+	WARN_ON_ONCE(bman->visible_avail != bman->visible_size);
 	mutex_unlock(&bman->lock);
 
 	ttm_resource_manager_cleanup(man);
@@ -287,3 +329,14 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
 	return ret;
 }
 
+/**
+ * i915_ttm_buddy_man_visible_size - Return the size of the CPU visible portion
+ * in pages.
+ * @man: The buddy allocator ttm manager
+ */
+u64 i915_ttm_buddy_man_visible_size(struct ttm_resource_manager *man)
+{
+	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
+
+	return bman->visible_size;
+}
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
index 72c90b432e87..35fe03a6a78c 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
@@ -21,6 +21,8 @@ struct drm_buddy;
  * @base: struct ttm_resource base class we extend
  * @blocks: the list of struct i915_buddy_block for this resource/allocation
  * @flags: DRM_BUDDY_*_ALLOCATION flags
+ * @used_visible_size: How much of this resource, if any, uses the CPU visible
+ * portion, in pages.
  * @mm: the struct i915_buddy_mm for this resource
  *
  * Extends the struct ttm_resource to manage an address space allocation with
@@ -30,6 +32,7 @@ struct i915_ttm_buddy_resource {
 	struct ttm_resource base;
 	struct list_head blocks;
 	unsigned long flags;
+	unsigned long used_visible_size;
 	struct drm_buddy *mm;
 };
 
@@ -48,11 +51,14 @@ to_ttm_buddy_resource(struct ttm_resource *res)
 
 int i915_ttm_buddy_man_init(struct ttm_device *bdev,
 			    unsigned type, bool use_tt,
-			    u64 size, u64 default_page_size, u64 chunk_size);
+			    u64 size, u64 visible_size,
+			    u64 default_page_size, u64 chunk_size);
 int i915_ttm_buddy_man_fini(struct ttm_device *bdev,
 			    unsigned int type);
 
 int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
 			       u64 start, u64 size);
 
+u64 i915_ttm_buddy_man_visible_size(struct ttm_resource_manager *man);
+
 #endif
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index 282802aed174..353ef195c3be 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -87,6 +87,7 @@ int intel_region_ttm_init(struct intel_memory_region *mem)
 
 	ret = i915_ttm_buddy_man_init(bdev, mem_type, false,
 				      resource_size(&mem->region),
+				      mem->io_size,
 				      mem->min_page_size, PAGE_SIZE);
 	if (ret)
 		return ret;
-- 
2.34.1

