Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 291C34C4815
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 15:56:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F4510E4C7;
	Fri, 25 Feb 2022 14:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F3A10E378;
 Fri, 25 Feb 2022 14:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645800975; x=1677336975;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F7YbBOrBSY/FF0oO69lS/AyqZbTaniBKV6JTpVWovo4=;
 b=FdxwZh3Ki4IQJsqRgI2vYzfubADl9MJu/et2+b1eDQ6CVWgZNMduudmv
 WM+6N6AR/gChO/P6OWJjF9BiJcT9kSg1QNUh7FqymCKu85uSN1kk7Gwmy
 0QaaMjWrlJ4SGD/F3Wjz+xxM4WLkdTYAyJNdVAH10rfWxvkL6g91ue9eJ
 kjZ4ccc0T12tR2dCQqRZrYxUZx7T6Qy0SnG0F6n+X1Ws3zfTJkk+Q6xeR
 KKBGC3yjNDCCP0HaCogUtmfnjLOjn9K+J0cEatvnMBlH5ICmaomSkrXIW
 U8wk6fsE9by89fHCnjgSVxJi2x2+VU4Rh497hakpy2wFP1lPBgTsXnGOX g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252237231"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="252237231"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 06:56:15 -0800
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="707882135"
Received: from phelanmi-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.25.227])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 06:56:14 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [CI 4/7] drm/i915/buddy: track available visible size
Date: Fri, 25 Feb 2022 14:54:59 +0000
Message-Id: <20220225145502.331818-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220225145502.331818-1-matthew.auld@intel.com>
References: <20220225145502.331818-1-matthew.auld@intel.com>
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

Track the total amount of available visible memory, and also track
per-resource the amount of used visible memory. For now this is useful
for our debug output, and deciding if it is even worth calling into the
buddy allocator. In the future tracking the per-resource visible usage
will be useful for when deciding if we should attempt to evict certain
buffers.

v2:
 - s/place->lpfn/lpfn/, that way we can avoid scanning the list if the
   entire range is already mappable.
 - Move the end declaration inside the if block(Thomas).
 - Make sure to also account for reserved memory.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 68 ++++++++++++++++++-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |  8 ++-
 drivers/gpu/drm/i915/intel_region_ttm.c       |  1 +
 3 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index 76d5211c25eb..e47a3d46c6ff 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -19,6 +19,9 @@ struct i915_ttm_buddy_manager {
 	struct drm_buddy mm;
 	struct list_head reserved;
 	struct mutex lock;
+	unsigned long visible_size;
+	unsigned long visible_avail;
+	unsigned long visible_reserved;
 	u64 default_page_size;
 };
 
@@ -87,6 +90,12 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	n_pages = size >> ilog2(mm->chunk_size);
 
 	mutex_lock(&bman->lock);
+	if (lpfn <= bman->visible_size && n_pages > bman->visible_avail) {
+		mutex_unlock(&bman->lock);
+		err = -ENOSPC;
+		goto err_free_res;
+	}
+
 	err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
 				     (u64)lpfn << PAGE_SHIFT,
 				     (u64)n_pages << PAGE_SHIFT,
@@ -107,6 +116,31 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 		mutex_unlock(&bman->lock);
 	}
 
+	if (lpfn <= bman->visible_size) {
+		bman_res->used_visible_size = bman_res->base.num_pages;
+	} else {
+		struct drm_buddy_block *block;
+
+		list_for_each_entry(block, &bman_res->blocks, link) {
+			unsigned long start =
+				drm_buddy_block_offset(block) >> PAGE_SHIFT;
+
+			if (start < bman->visible_size) {
+				unsigned long end = start +
+					(drm_buddy_block_size(mm, block) >> PAGE_SHIFT);
+
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
 
@@ -128,6 +162,7 @@ static void i915_ttm_buddy_man_free(struct ttm_resource_manager *man,
 
 	mutex_lock(&bman->lock);
 	drm_buddy_free_list(&bman->mm, &bman_res->blocks);
+	bman->visible_avail += bman_res->used_visible_size;
 	mutex_unlock(&bman->lock);
 
 	ttm_resource_fini(man, res);
@@ -143,6 +178,12 @@ static void i915_ttm_buddy_man_debug(struct ttm_resource_manager *man,
 	mutex_lock(&bman->lock);
 	drm_printf(printer, "default_page_size: %lluKiB\n",
 		   bman->default_page_size >> 10);
+	drm_printf(printer, "visible_avail: %lluMiB\n",
+		   (u64)bman->visible_avail << PAGE_SHIFT >> 20);
+	drm_printf(printer, "visible_size: %lluMiB\n",
+		   (u64)bman->visible_size << PAGE_SHIFT >> 20);
+	drm_printf(printer, "visible_reserved: %lluMiB\n",
+		   (u64)bman->visible_reserved << PAGE_SHIFT >> 20);
 
 	drm_buddy_print(&bman->mm, printer);
 
@@ -164,6 +205,7 @@ static const struct ttm_resource_manager_func i915_ttm_buddy_manager_func = {
  * @type: Memory type we want to manage
  * @use_tt: Set use_tt for the manager
  * @size: The size in bytes to manage
+ * @visible_size: The CPU visible size in bytes to manage
  * @default_page_size: The default minimum page size in bytes for allocations,
  * this must be at least as large as @chunk_size, and can be overridden by
  * setting the BO page_alignment, to be larger or smaller as needed.
@@ -187,7 +229,7 @@ static const struct ttm_resource_manager_func i915_ttm_buddy_manager_func = {
  */
 int i915_ttm_buddy_man_init(struct ttm_device *bdev,
 			    unsigned int type, bool use_tt,
-			    u64 size, u64 default_page_size,
+			    u64 size, u64 visible_size, u64 default_page_size,
 			    u64 chunk_size)
 {
 	struct ttm_resource_manager *man;
@@ -206,6 +248,8 @@ int i915_ttm_buddy_man_init(struct ttm_device *bdev,
 	INIT_LIST_HEAD(&bman->reserved);
 	GEM_BUG_ON(default_page_size < chunk_size);
 	bman->default_page_size = default_page_size;
+	bman->visible_size = visible_size >> PAGE_SHIFT;
+	bman->visible_avail = bman->visible_size;
 
 	man = &bman->manager;
 	man->use_tt = use_tt;
@@ -250,6 +294,8 @@ int i915_ttm_buddy_man_fini(struct ttm_device *bdev, unsigned int type)
 	mutex_lock(&bman->lock);
 	drm_buddy_free_list(mm, &bman->reserved);
 	drm_buddy_fini(mm);
+	bman->visible_avail += bman->visible_reserved;
+	WARN_ON_ONCE(bman->visible_avail != bman->visible_size);
 	mutex_unlock(&bman->lock);
 
 	ttm_resource_manager_cleanup(man);
@@ -273,6 +319,7 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
 {
 	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
 	struct drm_buddy *mm = &bman->mm;
+	unsigned long fpfn = start >> PAGE_SHIFT;
 	unsigned long flags = 0;
 	int ret;
 
@@ -284,8 +331,27 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
 				     size, mm->chunk_size,
 				     &bman->reserved,
 				     flags);
+
+	if (fpfn < bman->visible_size) {
+		unsigned long lpfn = fpfn + (size >> PAGE_SHIFT);
+		unsigned long visible = min(lpfn, bman->visible_size) - fpfn;
+
+		bman->visible_reserved += visible;
+		bman->visible_avail -= visible;
+	}
 	mutex_unlock(&bman->lock);
 
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
index 6cfe9090ede7..737ef3f4ab54 100644
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

