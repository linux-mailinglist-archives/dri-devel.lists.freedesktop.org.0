Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6424F54526E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 18:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B889F11B0D3;
	Thu,  9 Jun 2022 16:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A8E11B0E1;
 Thu,  9 Jun 2022 16:52:30 +0000 (UTC)
Received: from hermes-devbox.fritz.box (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4388E66017D4;
 Thu,  9 Jun 2022 17:52:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1654793549;
 bh=MGn9iBCsniZdmRCdIAa++weJY0D7b+5IQJe187ejM5U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cgR5iHRom6/xyWmhAmHF8e0U0NDxyerdc6zwTCBNp4FjtLqv7wEvhP0XDaWD7i8zp
 s2pp3yy2nsOqueL6AouIIJyTu0SDa14O/14sGrYVWHpA/BCGThaEdf/MlDmtX5i9H6
 /DeldVH7N27V1WprR+gSc1WZcm0kvAV3AwswI60OPbTFvs8RxDJ9oLBCzNFPyzQfvM
 vaOxPRBGDLdSY2PTpbbBaABKJBnd2YiHvMn73hve2LdAZnNFMZNVb+lz0SxqGX1KnK
 biXWFK+JboVkWUxF9Jt8ieenps/dHhNKAfmIoDJ0slohclODSsyblk94BQfQgYirWC
 aj6PFkXgLVxQQ==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 8/8] drm/i915: internal buffers use ttm backend
Date: Thu,  9 Jun 2022 16:52:00 +0000
Message-Id: <20220609165200.842821-9-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609165200.842821-1-bob.beckett@collabora.com>
References: <20220609165200.842821-1-bob.beckett@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 kernel@collabora.com, Matthew Auld <matthew.auld@intel.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create a kernel only internal memory region that uses ttm pool allocator to
allocate volatile system pages.
Refactor internal buffer backend to simply allocate from this new
region.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_internal.c  | 187 +-----------------
 drivers/gpu/drm/i915/gem/i915_gem_internal.h  |   5 -
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |   1 +
 .../drm/i915/gem/selftests/i915_gem_mman.c    |   3 +
 drivers/gpu/drm/i915/i915_pci.c               |   4 +-
 drivers/gpu/drm/i915/intel_memory_region.c    |   8 +-
 drivers/gpu/drm/i915/intel_memory_region.h    |   2 +
 .../gpu/drm/i915/selftests/mock_gem_device.c  |   2 +-
 8 files changed, 21 insertions(+), 191 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
index c698f95af15f..a83751867ac7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
@@ -4,188 +4,9 @@
  * Copyright © 2014-2016 Intel Corporation
  */
 
-#include <linux/scatterlist.h>
-#include <linux/slab.h>
-#include <linux/swiotlb.h>
-
+#include "gem/i915_gem_internal.h"
+#include "gem/i915_gem_region.h"
 #include "i915_drv.h"
-#include "i915_gem.h"
-#include "i915_gem_internal.h"
-#include "i915_gem_object.h"
-#include "i915_scatterlist.h"
-#include "i915_utils.h"
-
-#define QUIET (__GFP_NORETRY | __GFP_NOWARN)
-#define MAYFAIL (__GFP_RETRY_MAYFAIL | __GFP_NOWARN)
-
-static void internal_free_pages(struct sg_table *st)
-{
-	struct scatterlist *sg;
-
-	for (sg = st->sgl; sg; sg = __sg_next(sg)) {
-		if (sg_page(sg))
-			__free_pages(sg_page(sg), get_order(sg->length));
-	}
-
-	sg_free_table(st);
-	kfree(st);
-}
-
-static int i915_gem_object_get_pages_internal(struct drm_i915_gem_object *obj)
-{
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct sg_table *st;
-	struct scatterlist *sg;
-	unsigned int sg_page_sizes;
-	unsigned int npages;
-	int max_order;
-	gfp_t gfp;
-
-	max_order = MAX_ORDER;
-#ifdef CONFIG_SWIOTLB
-	if (is_swiotlb_active(obj->base.dev->dev)) {
-		unsigned int max_segment;
-
-		max_segment = swiotlb_max_segment();
-		if (max_segment) {
-			max_segment = max_t(unsigned int, max_segment,
-					    PAGE_SIZE) >> PAGE_SHIFT;
-			max_order = min(max_order, ilog2(max_segment));
-		}
-	}
-#endif
-
-	gfp = GFP_KERNEL | __GFP_HIGHMEM | __GFP_RECLAIMABLE;
-	if (IS_I965GM(i915) || IS_I965G(i915)) {
-		/* 965gm cannot relocate objects above 4GiB. */
-		gfp &= ~__GFP_HIGHMEM;
-		gfp |= __GFP_DMA32;
-	}
-
-create_st:
-	st = kmalloc(sizeof(*st), GFP_KERNEL);
-	if (!st)
-		return -ENOMEM;
-
-	npages = obj->base.size / PAGE_SIZE;
-	if (sg_alloc_table(st, npages, GFP_KERNEL)) {
-		kfree(st);
-		return -ENOMEM;
-	}
-
-	sg = st->sgl;
-	st->nents = 0;
-	sg_page_sizes = 0;
-
-	do {
-		int order = min(fls(npages) - 1, max_order);
-		struct page *page;
-
-		do {
-			page = alloc_pages(gfp | (order ? QUIET : MAYFAIL),
-					   order);
-			if (page)
-				break;
-			if (!order--)
-				goto err;
-
-			/* Limit subsequent allocations as well */
-			max_order = order;
-		} while (1);
-
-		sg_set_page(sg, page, PAGE_SIZE << order, 0);
-		sg_page_sizes |= PAGE_SIZE << order;
-		st->nents++;
-
-		npages -= 1 << order;
-		if (!npages) {
-			sg_mark_end(sg);
-			break;
-		}
-
-		sg = __sg_next(sg);
-	} while (1);
-
-	if (i915_gem_gtt_prepare_pages(obj, st)) {
-		/* Failed to dma-map try again with single page sg segments */
-		if (get_order(st->sgl->length)) {
-			internal_free_pages(st);
-			max_order = 0;
-			goto create_st;
-		}
-		goto err;
-	}
-
-	__i915_gem_object_set_pages(obj, st, sg_page_sizes);
-
-	return 0;
-
-err:
-	sg_set_page(sg, NULL, 0, 0);
-	sg_mark_end(sg);
-	internal_free_pages(st);
-
-	return -ENOMEM;
-}
-
-static void i915_gem_object_put_pages_internal(struct drm_i915_gem_object *obj,
-					       struct sg_table *pages)
-{
-	i915_gem_gtt_finish_pages(obj, pages);
-	internal_free_pages(pages);
-
-	obj->mm.dirty = false;
-
-	__start_cpu_write(obj);
-}
-
-static const struct drm_i915_gem_object_ops i915_gem_object_internal_ops = {
-	.name = "i915_gem_object_internal",
-	.flags = I915_GEM_OBJECT_IS_SHRINKABLE,
-	.get_pages = i915_gem_object_get_pages_internal,
-	.put_pages = i915_gem_object_put_pages_internal,
-};
-
-struct drm_i915_gem_object *
-__i915_gem_object_create_internal(struct drm_i915_private *i915,
-				  const struct drm_i915_gem_object_ops *ops,
-				  phys_addr_t size)
-{
-	static struct lock_class_key lock_class;
-	struct drm_i915_gem_object *obj;
-	unsigned int cache_level;
-
-	GEM_BUG_ON(!size);
-	GEM_BUG_ON(!IS_ALIGNED(size, PAGE_SIZE));
-
-	if (overflows_type(size, obj->base.size))
-		return ERR_PTR(-E2BIG);
-
-	obj = i915_gem_object_alloc();
-	if (!obj)
-		return ERR_PTR(-ENOMEM);
-
-	drm_gem_private_object_init(&i915->drm, &obj->base, size);
-	i915_gem_object_init(obj, ops, &lock_class, 0);
-	obj->mem_flags |= I915_BO_FLAG_STRUCT_PAGE;
-
-	/*
-	 * Mark the object as volatile, such that the pages are marked as
-	 * dontneed whilst they are still pinned. As soon as they are unpinned
-	 * they are allowed to be reaped by the shrinker, and the caller is
-	 * expected to repopulate - the contents of this object are only valid
-	 * whilst active and pinned.
-	 */
-	i915_gem_object_set_volatile(obj);
-
-	obj->read_domains = I915_GEM_DOMAIN_CPU;
-	obj->write_domain = I915_GEM_DOMAIN_CPU;
-
-	cache_level = HAS_LLC(i915) ? I915_CACHE_LLC : I915_CACHE_NONE;
-	i915_gem_object_set_cache_coherency(obj, cache_level);
-
-	return obj;
-}
 
 /**
  * i915_gem_object_create_internal: create an object with volatile pages
@@ -206,5 +27,7 @@ struct drm_i915_gem_object *
 i915_gem_object_create_internal(struct drm_i915_private *i915,
 				phys_addr_t size)
 {
-	return __i915_gem_object_create_internal(i915, &i915_gem_object_internal_ops, size);
+	return i915_gem_object_create_region(i915->mm.regions[INTEL_REGION_INTERNAL],
+					     size, 0, I915_BO_ALLOC_VOLATILE);
 }
+
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.h b/drivers/gpu/drm/i915/gem/i915_gem_internal.h
index 6664e06112fc..524e1042b20f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_internal.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.h
@@ -15,9 +15,4 @@ struct drm_i915_private;
 struct drm_i915_gem_object *
 i915_gem_object_create_internal(struct drm_i915_private *i915,
 				phys_addr_t size);
-struct drm_i915_gem_object *
-__i915_gem_object_create_internal(struct drm_i915_private *i915,
-				  const struct drm_i915_gem_object_ops *ops,
-				  phys_addr_t size);
-
 #endif /* __I915_GEM_INTERNAL_H__ */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
index 73e371aa3850..cb4cab8a13e1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
@@ -92,4 +92,5 @@ static inline bool i915_ttm_cpu_maps_iomem(struct ttm_resource *mem)
 	/* Once / if we support GGTT, this is also false for cached ttm_tts */
 	return mem->mem_type != I915_PL_SYSTEM;
 }
+
 #endif
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index ee2ad1281f97..dcb2bda6cbc5 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -864,6 +864,9 @@ static bool can_mmap(struct drm_i915_gem_object *obj, enum i915_mmap_type type)
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	bool no_map;
 
+	if (obj->mm.region && obj->mm.region->private)
+		return false;
+
 	if (obj->ops->mmap_offset)
 		return type == I915_MMAP_TYPE_FIXED;
 	else if (type == I915_MMAP_TYPE_FIXED)
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index a5a1a7647320..7ba7becdf71c 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -159,7 +159,7 @@
 	.page_sizes = I915_GTT_PAGE_SIZE_4K
 
 #define GEN_DEFAULT_REGIONS \
-	.memory_regions = REGION_SMEM | REGION_STOLEN_SMEM
+	.memory_regions = REGION_SMEM | REGION_STOLEN_SMEM | REGION_INTERNAL
 
 #define I830_FEATURES \
 	GEN(2), \
@@ -905,7 +905,7 @@ static const struct intel_device_info rkl_info = {
 };
 
 #define DGFX_FEATURES \
-	.memory_regions = REGION_SMEM | REGION_LMEM | REGION_STOLEN_LMEM, \
+	.memory_regions = REGION_SMEM | REGION_LMEM | REGION_STOLEN_LMEM | REGION_INTERNAL, \
 	.has_llc = 0, \
 	.has_pxp = 0, \
 	.has_snoop = 1, \
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index e38d2db1c3e3..a91756fcee85 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -31,6 +31,10 @@ static const struct {
 		.class = INTEL_MEMORY_STOLEN_LOCAL,
 		.instance = 0,
 	},
+	[INTEL_REGION_INTERNAL] = {
+		.class = INTEL_MEMORY_SYSTEM,
+		.instance = 1,
+	}
 };
 
 static int __iopagetest(struct intel_memory_region *mem,
@@ -309,12 +313,14 @@ int intel_memory_regions_hw_probe(struct drm_i915_private *i915)
 		instance = intel_region_map[i].instance;
 		switch (type) {
 		case INTEL_MEMORY_SYSTEM:
-			if (IS_DGFX(i915))
+			if (IS_DGFX(i915) || i == INTEL_REGION_INTERNAL)
 				mem = i915_gem_ttm_system_setup(i915, type,
 								instance);
 			else
 				mem = i915_gem_shmem_setup(i915, type,
 							   instance);
+			if (i == INTEL_REGION_INTERNAL)
+				mem->private = true;
 			break;
 		case INTEL_MEMORY_STOLEN_LOCAL:
 			mem = i915_gem_stolen_lmem_setup(i915, type, instance);
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index 3d8378c1b447..4038913bc467 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -35,6 +35,7 @@ enum intel_region_id {
 	INTEL_REGION_LMEM_3,
 	INTEL_REGION_STOLEN_SMEM,
 	INTEL_REGION_STOLEN_LMEM,
+	INTEL_REGION_INTERNAL,
 	INTEL_REGION_UNKNOWN, /* Should be last */
 };
 
@@ -42,6 +43,7 @@ enum intel_region_id {
 #define REGION_LMEM     BIT(INTEL_REGION_LMEM_0)
 #define REGION_STOLEN_SMEM   BIT(INTEL_REGION_STOLEN_SMEM)
 #define REGION_STOLEN_LMEM   BIT(INTEL_REGION_STOLEN_LMEM)
+#define REGION_INTERNAL	BIT(INTEL_REGION_INTERNAL)
 
 #define I915_ALLOC_CONTIGUOUS     BIT(0)
 
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index 9c31a16f8380..eaa169effedc 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -179,7 +179,7 @@ struct drm_i915_private *mock_gem_device(void)
 		I915_GTT_PAGE_SIZE_64K |
 		I915_GTT_PAGE_SIZE_2M;
 
-	mkwrite_device_info(i915)->memory_regions = REGION_SMEM;
+	mkwrite_device_info(i915)->memory_regions = REGION_SMEM | REGION_INTERNAL;
 	intel_memory_regions_hw_probe(i915);
 
 	spin_lock_init(&i915->gpu_error.lock);
-- 
2.25.1

