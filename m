Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F72A7B9DD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 11:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACFAB10EB9A;
	Fri,  4 Apr 2025 09:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ah9t7SAT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C9910EB9A;
 Fri,  4 Apr 2025 09:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743758798;
 bh=uhqIj7F/iaGotn7HPjJhMgANzaswGoO7rAy/WQfgNaA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ah9t7SATpG8xhP2VEl4qUt9ZEsWT25gw923fDsKnHrmptMXc9RUlURCdt9Qz9k2f3
 D6bQpyHb8/j8e9OZesVFOaW6nW/OthPBEIKLe0TbFMHWcWwwEq2Zk//BGdUtrXoN6V
 p8NOWE/ZSkew7BDNVUoid5lXGSKLW900q/r5LFjj2tD+5E5yKKYP4qsCfCTbDgHLYm
 kG6FRpm0lnLspShFb1gcfUaqhohz5OX/OneonzfhtSB/5OM/NEKiEtZ5Ig1ozWJMzs
 Z8+7C+Q9ZPvpoe5YaBlq7r7N3CFMcdxjN6a9y2unP+uF5LtbPNHrGnED0HynUDxcxR
 MkQPj937EnNnw==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 94D5317E1017;
 Fri,  4 Apr 2025 11:26:37 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, kernel@collabora.com
Subject: [PATCH v3 3/8] drm/panfrost: Switch to sparse gem shmem to implement
 our alloc-on-fault
Date: Fri,  4 Apr 2025 11:26:29 +0200
Message-ID: <20250404092634.2968115-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404092634.2968115-1-boris.brezillon@collabora.com>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
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

Use the new gem_shmem helpers providing sparse GEM backing so we can
simplify the code, and finally have a non-blocking allocation scheme
in the fault handler path.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c |  2 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c | 37 ++++++----
 drivers/gpu/drm/panfrost/panfrost_gem.h |  8 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 98 +++++++------------------
 drivers/gpu/drm/panfrost/panfrost_mmu.h |  2 +
 5 files changed, 56 insertions(+), 91 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index b87f83e94eda..93831d18da90 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -389,7 +389,7 @@ static int panfrost_ioctl_mmap_bo(struct drm_device *dev, void *data,
 	}
 
 	/* Don't allow mmapping of heap objects as pages are not pinned. */
-	if (to_panfrost_bo(gem_obj)->is_heap) {
+	if (panfrost_gem_is_heap(to_panfrost_bo(gem_obj))) {
 		ret = -EINVAL;
 		goto out;
 	}
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 8e0ff3efede7..08fbe47ac146 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -35,18 +35,9 @@ static void panfrost_gem_free_object(struct drm_gem_object *obj)
 	 */
 	WARN_ON_ONCE(!list_empty(&bo->mappings.list));
 
-	if (bo->sgts) {
-		int i;
-		int n_sgt = bo->base.base.size / SZ_2M;
-
-		for (i = 0; i < n_sgt; i++) {
-			if (bo->sgts[i].sgl) {
-				dma_unmap_sgtable(pfdev->dev, &bo->sgts[i],
-						  DMA_BIDIRECTIONAL, 0);
-				sg_free_table(&bo->sgts[i]);
-			}
-		}
-		kvfree(bo->sgts);
+	if (panfrost_gem_is_heap(bo)) {
+		drm_gem_shmem_sparse_unpin(&bo->base);
+		drm_gem_shmem_sparse_finish(&bo->base);
 	}
 
 	drm_gem_shmem_free(&bo->base);
@@ -149,7 +140,7 @@ int panfrost_gem_open(struct drm_gem_object *obj, struct drm_file *file_priv)
 	if (ret)
 		goto err;
 
-	if (!bo->is_heap) {
+	if (!panfrost_gem_is_heap(bo)) {
 		ret = panfrost_mmu_map(mapping);
 		if (ret)
 			goto err;
@@ -189,7 +180,7 @@ static int panfrost_gem_pin(struct drm_gem_object *obj)
 {
 	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
 
-	if (bo->is_heap)
+	if (panfrost_gem_is_heap(bo))
 		return -EINVAL;
 
 	return drm_gem_shmem_pin_locked(&bo->base);
@@ -213,7 +204,7 @@ static size_t panfrost_gem_rss(struct drm_gem_object *obj)
 {
 	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
 
-	if (bo->is_heap) {
+	if (panfrost_gem_is_heap(bo)) {
 		return bo->heap_rss_size;
 	} else if (bo->base.pages) {
 		WARN_ON(bo->heap_rss_size);
@@ -280,7 +271,21 @@ panfrost_gem_create(struct drm_device *dev, size_t size, u32 flags)
 
 	bo = to_panfrost_bo(&shmem->base);
 	bo->noexec = !!(flags & PANFROST_BO_NOEXEC);
-	bo->is_heap = !!(flags & PANFROST_BO_HEAP);
+
+	if (flags & PANFROST_BO_HEAP) {
+		int ret;
+
+		ret = drm_gem_shmem_sparse_init(shmem, &bo->sparse, NUM_FAULT_PAGES);
+		if (ret) {
+			drm_gem_shmem_free(shmem);
+			return ERR_PTR(ret);
+		}
+
+		/* Flag all pages of the sparse GEM as pinned as soon
+		 * as they are populated, so they can't be reclaimed.
+		 */
+		drm_gem_shmem_sparse_pin(shmem);
+	}
 
 	return bo;
 }
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index 7516b7ecf7fe..566532ed4790 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -11,7 +11,7 @@ struct panfrost_mmu;
 
 struct panfrost_gem_object {
 	struct drm_gem_shmem_object base;
-	struct sg_table *sgts;
+	struct drm_gem_shmem_sparse_backing sparse;
 
 	/*
 	 * Use a list for now. If searching a mapping ever becomes the
@@ -42,9 +42,13 @@ struct panfrost_gem_object {
 	size_t heap_rss_size;
 
 	bool noexec		:1;
-	bool is_heap		:1;
 };
 
+static inline bool panfrost_gem_is_heap(struct panfrost_gem_object *bo)
+{
+	return bo->base.sparse != NULL;
+}
+
 struct panfrost_gem_mapping {
 	struct list_head node;
 	struct kref refcount;
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index f6b91c052cfb..a95eb1882a30 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -469,9 +469,9 @@ void panfrost_mmu_unmap(struct panfrost_gem_mapping *mapping)
 		size_t unmapped_page, pgcount;
 		size_t pgsize = get_pgsize(iova, len - unmapped_len, &pgcount);
 
-		if (bo->is_heap)
+		if (panfrost_gem_is_heap(bo))
 			pgcount = 1;
-		if (!bo->is_heap || ops->iova_to_phys(ops, iova)) {
+		if (!panfrost_gem_is_heap(bo) || ops->iova_to_phys(ops, iova)) {
 			unmapped_page = ops->unmap_pages(ops, iova, pgsize, pgcount, NULL);
 			WARN_ON(unmapped_page != pgsize * pgcount);
 		}
@@ -539,26 +539,24 @@ addr_to_mapping(struct panfrost_device *pfdev, int as, u64 addr)
 	return mapping;
 }
 
-#define NUM_FAULT_PAGES (SZ_2M / PAGE_SIZE)
-
 static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 				       u64 addr)
 {
-	int ret, i;
+	int ret;
 	struct panfrost_gem_mapping *bomapping;
 	struct panfrost_gem_object *bo;
 	struct address_space *mapping;
-	struct drm_gem_object *obj;
-	pgoff_t page_offset;
+	pgoff_t page_offset, sgt_pgoffset;
+	unsigned int sgt_remaining_pages;
 	struct sg_table *sgt;
-	struct page **pages;
+	gfp_t page_gfp;
 
 	bomapping = addr_to_mapping(pfdev, as, addr);
 	if (!bomapping)
 		return -ENOENT;
 
 	bo = bomapping->obj;
-	if (!bo->is_heap) {
+	if (!panfrost_gem_is_heap(bo)) {
 		dev_WARN(pfdev->dev, "matching BO is not heap type (GPU VA = %llx)",
 			 bomapping->mmnode.start << PAGE_SHIFT);
 		ret = -EINVAL;
@@ -570,66 +568,30 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	addr &= ~((u64)SZ_2M - 1);
 	page_offset = addr >> PAGE_SHIFT;
 	page_offset -= bomapping->mmnode.start;
-
-	obj = &bo->base.base;
-
-	dma_resv_lock(obj->resv, NULL);
-
-	if (!bo->base.pages) {
-		bo->sgts = kvmalloc_array(bo->base.base.size / SZ_2M,
-				     sizeof(struct sg_table), GFP_KERNEL | __GFP_ZERO);
-		if (!bo->sgts) {
-			ret = -ENOMEM;
-			goto err_unlock;
-		}
-
-		pages = kvmalloc_array(bo->base.base.size >> PAGE_SHIFT,
-				       sizeof(struct page *), GFP_KERNEL | __GFP_ZERO);
-		if (!pages) {
-			kvfree(bo->sgts);
-			bo->sgts = NULL;
-			ret = -ENOMEM;
-			goto err_unlock;
-		}
-		bo->base.pages = pages;
-		refcount_set(&bo->base.pages_use_count, 1);
-	} else {
-		pages = bo->base.pages;
-		if (pages[page_offset]) {
-			/* Pages are already mapped, bail out. */
-			goto out;
-		}
-	}
-
 	mapping = bo->base.base.filp->f_mapping;
-	mapping_set_unevictable(mapping);
 
-	for (i = page_offset; i < page_offset + NUM_FAULT_PAGES; i++) {
-		/* Can happen if the last fault only partially filled this
-		 * section of the pages array before failing. In that case
-		 * we skip already filled pages.
-		 */
-		if (pages[i])
-			continue;
+	page_gfp = mapping_gfp_constraint(mapping, ~__GFP_RECLAIM) |
+		   __GFP_NORETRY | __GFP_NOWARN;
 
-		pages[i] = shmem_read_mapping_page(mapping, i);
-		if (IS_ERR(pages[i])) {
-			ret = PTR_ERR(pages[i]);
-			pages[i] = NULL;
-			goto err_unlock;
-		}
+	/* We want non-blocking allocations, if we're OOM, we just fail the job
+	 * to unblock things.
+	 */
+	ret = drm_gem_shmem_sparse_populate_range(&bo->base, page_offset,
+						  NUM_FAULT_PAGES, page_gfp,
+						  __GFP_NORETRY | __GFP_NOWARN);
+	if (ret)
+		goto err_bo;
+
+	sgt = drm_gem_shmem_sparse_get_sgt(&bo->base, page_offset,
+					   &sgt_pgoffset, &sgt_remaining_pages);
+	if (IS_ERR(sgt)) {
+		ret = PTR_ERR(sgt);
+		goto err_bo;
+	} else if (sgt_pgoffset != 0 || sgt_remaining_pages != NUM_FAULT_PAGES) {
+		ret = -EINVAL;
+		goto err_bo;
 	}
 
-	sgt = &bo->sgts[page_offset / (SZ_2M / PAGE_SIZE)];
-	ret = sg_alloc_table_from_pages(sgt, pages + page_offset,
-					NUM_FAULT_PAGES, 0, SZ_2M, GFP_KERNEL);
-	if (ret)
-		goto err_unlock;
-
-	ret = dma_map_sgtable(pfdev->dev, sgt, DMA_BIDIRECTIONAL, 0);
-	if (ret)
-		goto err_map;
-
 	mmu_map_sg(pfdev, bomapping->mmu, addr,
 		   IOMMU_WRITE | IOMMU_READ | IOMMU_CACHE | IOMMU_NOEXEC, sgt);
 
@@ -637,18 +599,10 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	bo->heap_rss_size += SZ_2M;
 
 	dev_dbg(pfdev->dev, "mapped page fault @ AS%d %llx", as, addr);
-
-out:
-	dma_resv_unlock(obj->resv);
-
 	panfrost_gem_mapping_put(bomapping);
 
 	return 0;
 
-err_map:
-	sg_free_table(sgt);
-err_unlock:
-	dma_resv_unlock(obj->resv);
 err_bo:
 	panfrost_gem_mapping_put(bomapping);
 	return ret;
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.h b/drivers/gpu/drm/panfrost/panfrost_mmu.h
index 022a9a74a114..a84ed4209f8d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.h
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.h
@@ -8,6 +8,8 @@ struct panfrost_gem_mapping;
 struct panfrost_file_priv;
 struct panfrost_mmu;
 
+#define NUM_FAULT_PAGES (SZ_2M / PAGE_SIZE)
+
 int panfrost_mmu_map(struct panfrost_gem_mapping *mapping);
 void panfrost_mmu_unmap(struct panfrost_gem_mapping *mapping);
 
-- 
2.49.0

