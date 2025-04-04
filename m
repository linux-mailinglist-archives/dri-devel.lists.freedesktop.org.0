Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D381A7B9E3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 11:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13D310EBB8;
	Fri,  4 Apr 2025 09:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="iKaHxkHU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE4A610EB9D;
 Fri,  4 Apr 2025 09:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743758801;
 bh=dRE5vKS4gGWWcaFLc9LqaNs60IxI7jaIn250QK+cMBo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iKaHxkHUgP9cfIIBb3K7NUwrdKxVyi+O3jSdI/Bz96AyTYWo9eYfitTTjdXJj/AAv
 opf7zs+t0ebsbEe2GPlXviS7XMLFwxoySGe3+OIiKd7lI7JEvLNCZbLlNsj3G7UKYW
 Tcct32ME2j3kzgdioVfXBEV4vD2VYQj1FUkzIZcmpiU8eoA6xJj8KXMoQGd7VWHVUI
 v8zh2PZb5mqpEGd3BcLFjnEp0ixOvEu28uEt8C9TopzHSP+kgh7nl9I+qSCb1/P+N+
 oayZGX27lZJkWKIPyJh+yEwIjvAhj1W+miiJZYjyxpZHMvGFn5H6vpkbSw2UY1dInK
 zdRbeLGI6SE6g==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EEDE817E07FD;
 Fri,  4 Apr 2025 11:26:40 +0200 (CEST)
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
Subject: [PATCH v3 8/8] drm/lima: Use drm_gem_shmem_sparse_backing for heap
 buffers
Date: Fri,  4 Apr 2025 11:26:34 +0200
Message-ID: <20250404092634.2968115-9-boris.brezillon@collabora.com>
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

Now that with have generic support for sparse shmem objects, use it
to simplify the code.

This has only been compile-tested, and we might want to consider using
NOWAIT gfp flags allocations happening in the fault handler path, but
I don't know the driver well enough to take that decision.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/lima/lima_gem.c | 89 ++++++++++-----------------------
 drivers/gpu/drm/lima/lima_gem.h |  1 +
 drivers/gpu/drm/lima/lima_vm.c  | 48 +++++++++++++++---
 3 files changed, 67 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 5deec673c11e..f9435d412cdc 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -20,89 +20,35 @@
 
 int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
 {
-	struct page **pages;
 	struct address_space *mapping = bo->base.base.filp->f_mapping;
-	struct device *dev = bo->base.base.dev->dev;
 	size_t old_size = bo->heap_size;
 	size_t new_size = bo->heap_size ? bo->heap_size * 2 :
 		(lima_heap_init_nr_pages << PAGE_SHIFT);
-	struct sg_table sgt;
-	int i, ret;
+	int ret;
 
 	if (bo->heap_size >= bo->base.base.size)
 		return -ENOSPC;
 
 	new_size = min(new_size, bo->base.base.size);
 
-	dma_resv_lock(bo->base.base.resv, NULL);
-
-	if (bo->base.pages) {
-		pages = bo->base.pages;
-	} else {
-		pages = kvmalloc_array(bo->base.base.size >> PAGE_SHIFT,
-				       sizeof(*pages), GFP_KERNEL | __GFP_ZERO);
-		if (!pages) {
-			dma_resv_unlock(bo->base.base.resv);
-			return -ENOMEM;
-		}
-
-		bo->base.pages = pages;
-		refcount_set(&bo->base.pages_use_count, 1);
-
-		mapping_set_unevictable(mapping);
-	}
-
-	for (i = old_size >> PAGE_SHIFT; i < new_size >> PAGE_SHIFT; i++) {
-		struct page *page = shmem_read_mapping_page(mapping, i);
-
-		if (IS_ERR(page)) {
-			dma_resv_unlock(bo->base.base.resv);
-			return PTR_ERR(page);
-		}
-		pages[i] = page;
-	}
-
-	dma_resv_unlock(bo->base.base.resv);
-
-	ret = sg_alloc_table_from_pages(&sgt, pages, i, 0,
-					new_size, GFP_KERNEL);
+	/* FIXME: Should we do a non-blocking allocation if we're called
+	 * from the fault handler (vm != NULL)?
+	 */
+	ret = drm_gem_shmem_sparse_populate_range(&bo->base, old_size >> PAGE_SHIFT,
+						  (new_size - old_size) >> PAGE_SHIFT,
+						  mapping_gfp_mask(mapping),
+						  GFP_KERNEL);
 	if (ret)
 		return ret;
 
-	if (bo->base.sgt) {
-		dma_unmap_sgtable(dev, bo->base.sgt, DMA_BIDIRECTIONAL, 0);
-		sg_free_table(bo->base.sgt);
-	} else {
-		bo->base.sgt = kmalloc(sizeof(*bo->base.sgt), GFP_KERNEL);
-		if (!bo->base.sgt) {
-			ret = -ENOMEM;
-			goto err_out0;
-		}
-	}
-
-	ret = dma_map_sgtable(dev, &sgt, DMA_BIDIRECTIONAL, 0);
-	if (ret)
-		goto err_out1;
-
-	*bo->base.sgt = sgt;
-
 	if (vm) {
 		ret = lima_vm_map_bo(vm, bo, old_size >> PAGE_SHIFT);
 		if (ret)
-			goto err_out2;
+			return ret;
 	}
 
 	bo->heap_size = new_size;
 	return 0;
-
-err_out2:
-	dma_unmap_sgtable(dev, &sgt, DMA_BIDIRECTIONAL, 0);
-err_out1:
-	kfree(bo->base.sgt);
-	bo->base.sgt = NULL;
-err_out0:
-	sg_free_table(&sgt);
-	return ret;
 }
 
 int lima_gem_create_handle(struct drm_device *dev, struct drm_file *file,
@@ -128,7 +74,19 @@ int lima_gem_create_handle(struct drm_device *dev, struct drm_file *file,
 	mapping_set_gfp_mask(obj->filp->f_mapping, mask);
 
 	if (is_heap) {
+		/* Granularity is the closest power-of-two less than
+		 * lima_heap_init_nr_pages.
+		 */
+		u32 granularity = lima_heap_init_nr_pages ?
+				  1 << (fls(lima_heap_init_nr_pages) - 1) : 8;
+
 		bo = to_lima_bo(obj);
+		err = drm_gem_shmem_sparse_init(shmem, &bo->sparse, granularity);
+		if (err)
+			goto out;
+
+		drm_gem_shmem_sparse_pin(shmem);
+
 		err = lima_heap_alloc(bo, NULL);
 		if (err)
 			goto out;
@@ -157,6 +115,11 @@ static void lima_gem_free_object(struct drm_gem_object *obj)
 	if (!list_empty(&bo->va))
 		dev_err(obj->dev->dev, "lima gem free bo still has va\n");
 
+	if (bo->base.sparse) {
+		drm_gem_shmem_sparse_unpin(&bo->base);
+		drm_gem_shmem_sparse_finish(&bo->base);
+	}
+
 	drm_gem_shmem_free(&bo->base);
 }
 
diff --git a/drivers/gpu/drm/lima/lima_gem.h b/drivers/gpu/drm/lima/lima_gem.h
index ccea06142f4b..9326b408306a 100644
--- a/drivers/gpu/drm/lima/lima_gem.h
+++ b/drivers/gpu/drm/lima/lima_gem.h
@@ -11,6 +11,7 @@ struct lima_vm;
 
 struct lima_bo {
 	struct drm_gem_shmem_object base;
+	struct drm_gem_shmem_sparse_backing sparse;
 
 	struct mutex lock;
 	struct list_head va;
diff --git a/drivers/gpu/drm/lima/lima_vm.c b/drivers/gpu/drm/lima/lima_vm.c
index 2b2739adc7f5..6e73b6a4881a 100644
--- a/drivers/gpu/drm/lima/lima_vm.c
+++ b/drivers/gpu/drm/lima/lima_vm.c
@@ -280,10 +280,32 @@ void lima_vm_print(struct lima_vm *vm)
 	}
 }
 
+static int lima_vm_map_sgt(struct lima_vm *vm, struct sg_table *sgt,
+			   u32 base, int pageoff)
+{
+	struct sg_dma_page_iter sg_iter;
+	int err, offset = 0;
+
+	for_each_sgtable_dma_page(sgt, &sg_iter, pageoff) {
+		err = lima_vm_map_page(vm, sg_page_iter_dma_address(&sg_iter),
+				       base + offset);
+		if (err)
+			goto err_unmap;
+
+		offset += PAGE_SIZE;
+	}
+
+	return 0;
+
+err_unmap:
+	if (offset)
+		lima_vm_unmap_range(vm, base, base + offset - 1);
+	return err;
+}
+
 int lima_vm_map_bo(struct lima_vm *vm, struct lima_bo *bo, int pageoff)
 {
 	struct lima_bo_va *bo_va;
-	struct sg_dma_page_iter sg_iter;
 	int offset = 0, err;
 	u32 base;
 
@@ -296,15 +318,24 @@ int lima_vm_map_bo(struct lima_vm *vm, struct lima_bo *bo, int pageoff)
 	}
 
 	mutex_lock(&vm->lock);
-
 	base = bo_va->node.start + (pageoff << PAGE_SHIFT);
-	for_each_sgtable_dma_page(bo->base.sgt, &sg_iter, pageoff) {
-		err = lima_vm_map_page(vm, sg_page_iter_dma_address(&sg_iter),
-				       base + offset);
-		if (err)
-			goto err_out1;
 
-		offset += PAGE_SIZE;
+	if (bo->base.sparse) {
+		unsigned int sgt_remaining_pages;
+		pgoff_t sgt_pgoffset;
+		struct sg_table *sgt;
+
+		sgt = drm_gem_shmem_sparse_get_sgt(&bo->base, pageoff,
+						   &sgt_pgoffset,
+						   &sgt_remaining_pages);
+		if (IS_ERR(sgt)) {
+			err = PTR_ERR(sgt);
+			goto err_out1;
+		}
+
+		err = lima_vm_map_sgt(vm, sgt, base, sgt_pgoffset);
+	} else {
+		err = lima_vm_map_sgt(vm, bo->base.sgt, base, pageoff);
 	}
 
 	mutex_unlock(&vm->lock);
@@ -315,6 +346,7 @@ int lima_vm_map_bo(struct lima_vm *vm, struct lima_bo *bo, int pageoff)
 err_out1:
 	if (offset)
 		lima_vm_unmap_range(vm, base, base + offset - 1);
+
 	mutex_unlock(&vm->lock);
 err_out0:
 	mutex_unlock(&bo->lock);
-- 
2.49.0

