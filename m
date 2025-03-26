Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFE4A70ECE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 03:15:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC93010E080;
	Wed, 26 Mar 2025 02:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="HBDmjPwb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC0D10E080
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 02:15:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742955323; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PR+2CEuiTe4RGa18gO0RGsX6+14UsNC982cgzVfTWXZK/InopzF5hNmRQ2Umf7S2F4RbfyRajYrTYdEW7HDg6unXQl4A1mtSO22xhgEq7obLrqTMUNrbs3JtxT4+oC2q8VWiqS1N3kQpiAPHpB0+K/I3k9UHWhjADKVzowO9M1M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742955323;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=kXGLmdYL5utl+URRB2IhZ0LySRvXMl8oQiv1N+1XSco=; 
 b=BZM1ANsRGLSW8/HLRd6izhWBCN43x/5laTSRhHpsvu8gfxQIO7v8AHxBSb6gvxgz/VG3ND3r84g265S83lMLgdnLJKSR1LGOYGpx96rGkRZzHk9j7KN9qb8k9S7zFEb5BqXzNSQNflESK+4IPmKiq9HXNW1zFR5XDkcYiG/TjEY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742955323; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=kXGLmdYL5utl+URRB2IhZ0LySRvXMl8oQiv1N+1XSco=;
 b=HBDmjPwbbM2ObA3eZ5gi4XxGaZyh9SFqGbN9tA4By/UzqwXSKbzvb7nt72WgAk0h
 AK4E4fztdSqBRAef8OIvz7qLBNYvYDD14nIUiIyzOu6UDACnmUg6M3Btt/S7tC/rnvj
 G9fNghMBiC/peMip3opSWB/+MchoLj/+mT4Zdf9s=
Received: by mx.zohomail.com with SMTPS id 1742955321182133.1525005800388;
 Tue, 25 Mar 2025 19:15:21 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v2 3/6] drm/shmem: Implement sparse allocation of pages
 for shmem objects
Date: Wed, 26 Mar 2025 02:14:23 +0000
Message-ID: <20250326021433.772196-4-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250326021433.772196-1-adrian.larumbe@collabora.com>
References: <20250326021433.772196-1-adrian.larumbe@collabora.com>
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

Add a new function that lets drivers allocate pages for a subset of the
shmem object's virtual address range, and another function for obtaining
an SG table from those pages, so that memory can be mapped onto an MMU.

Add also a new function for putting the pages of a sparse page array.

The sparse allocation function allowed a gfp argument to allow
allocations other than GFP_KERNEL, in cases where memory allocation can
race with the shrinker's memory reclaim path

There is factorization potential with drm_gem_put_pages and
drm_get_pages_, but it is yet to be decided what this should look like.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/drm_gem.c              | 117 ++++++++++++++++
 drivers/gpu/drm/drm_gem_shmem_helper.c | 182 ++++++++++++++++++++++++-
 include/drm/drm_gem.h                  |   6 +
 include/drm/drm_gem_shmem_helper.h     |   4 +
 4 files changed, 303 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index c6240bab3fa5..fa9b3f01f9ac 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -679,6 +679,123 @@ void drm_gem_put_pages(struct drm_gem_object *obj, struct page **pages,
 }
 EXPORT_SYMBOL(drm_gem_put_pages);
 
+/**
+ * drm_get_pages_xarray - helper to allocate backing pages for a GEM object
+ * from shmem, and store them in an xarray.
+ * @obj: obj in question
+ * @pa: xarray that holds the backing pages
+ * @page_offset: shmem index of the very first page to allocate
+ * @npages: number of consecutive shmem pages to allocate
+ * @gfp: additional allocation flags
+ *
+ * This reads the page-array of the shmem-backing storage of the given gem
+ * object. The input xarray is where the pages are stored. If a page is not
+ * allocated or swapped-out, this will allocate/swap-in the required pages.
+ * Only the requested range is covered with physical pages.
+ *
+ * Use drm_gem_put_xarray_page_range() to release the same xarray subset of pages.
+ *
+ * This uses the GFP-mask set on the shmem-mapping (see mapping_set_gfp_mask()),
+ * and any further mask bits set in the gfp input parameter.
+ *
+ * This function is only valid on objects initialized with
+ * drm_gem_object_init(), but not for those initialized with
+ * drm_gem_private_object_init() only.
+ */
+int drm_get_pages_xarray(struct drm_gem_object *obj, struct xarray *pa,
+			 pgoff_t page_offset, unsigned int npages, gfp_t gfp)
+{
+	struct address_space *mapping;
+	struct page *page;
+	int ret = 0;
+	int i;
+
+	if (WARN_ON(!obj->filp))
+		return -EINVAL;
+
+	/* This is the shared memory object that backs the GEM resource */
+	mapping = obj->filp->f_mapping;
+
+	/* We already BUG_ON() for non-page-aligned sizes in
+	 * drm_gem_object_init(), so we should never hit this unless
+	 * driver author is doing something really wrong:
+	 */
+	WARN_ON((obj->size & (PAGE_SIZE - 1)) != 0);
+
+	mapping = obj->filp->f_mapping;
+	mapping_set_unevictable(mapping);
+
+	for (i = 0; i < npages; i++) {
+		page  = shmem_read_mapping_page_gfp(mapping, page_offset + i,
+						    mapping_gfp_mask(mapping) | gfp);
+		if (IS_ERR(page)) {
+			ret = PTR_ERR(page);
+			goto err_free_pages;
+		}
+
+		/* Add the page into the xarray */
+		ret = xa_err(xa_store(pa, page_offset + i, page, gfp));
+		if (ret) {
+			put_page(page);
+			goto err_free_pages;
+		}
+	}
+
+	return ret;
+
+err_free_pages:
+	while (--i) {
+		page = xa_erase(pa, page_offset + i);
+		if (drm_WARN_ON(obj->dev, !page))
+			continue;
+		put_page(page);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_get_pages_xarray);
+
+/**
+ * drm_gem_put_xarray_page_range - helper to free some backing pages for a
+ * sparse GEM object
+ * @pa: xarray that holds the backing pages
+ * @idx: xarray index of the first page tof ree
+ * @npages: number of consecutive pages in the xarray to free
+ * @dirty: if true, pages will be marked as dirty
+ * @accessed: if true, the pages will be marked as accessed
+ */
+void drm_gem_put_xarray_page_range(struct xarray *pa, unsigned long idx,
+				   unsigned int npages, bool dirty, bool accessed)
+{
+	struct folio_batch fbatch;
+	struct page *page;
+
+	folio_batch_init(&fbatch);
+
+	xa_for_each(pa, idx, page) {
+		struct folio *folio = page_folio(page);
+
+		if (dirty)
+			folio_mark_dirty(folio);
+		if (accessed)
+			folio_mark_accessed(folio);
+
+		/* Undo the reference we took when populating the table */
+		if (!folio_batch_add(&fbatch, folio))
+			drm_gem_check_release_batch(&fbatch);
+
+		xa_erase(pa, idx);
+
+		idx += folio_nr_pages(folio) - 1;
+	}
+
+	if (folio_batch_count(&fbatch))
+		drm_gem_check_release_batch(&fbatch);
+
+	WARN_ON((idx+1) != npages);
+}
+EXPORT_SYMBOL(drm_gem_put_xarray_page_range);
+
 static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
 			  struct drm_gem_object **objs)
 {
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 5f75eb1230f6..1bf33e5a1c4c 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -174,6 +174,34 @@ struct drm_gem_shmem_object *drm_gem_shmem_create_with_mnt(struct drm_device *de
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_create_with_mnt);
 
+static void drm_gem_shmem_put_pages_sparse(struct drm_gem_shmem_object *shmem)
+{
+	struct page *page;
+	unsigned long idx;
+
+	if (drm_WARN_ON(shmem->base.dev, !shmem->sparse))
+		return;
+
+	idx = 0;
+	xa_for_each(&shmem->xapages, idx, page) {
+		unsigned long consecutive = 1;
+
+		if (!page)
+			continue;
+
+		while (xa_load(&shmem->xapages, idx + consecutive))
+			consecutive++;
+
+		drm_gem_put_xarray_page_range(&shmem->xapages, idx, consecutive,
+					      shmem->pages_mark_dirty_on_put,
+					      shmem->pages_mark_accessed_on_put);
+
+		idx += consecutive;
+	}
+
+	drm_WARN_ON(shmem->base.dev, !xa_empty(&shmem->xapages));
+}
+
 /**
  * drm_gem_shmem_free - Free resources associated with a shmem GEM object
  * @shmem: shmem GEM object to free
@@ -266,8 +294,8 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
 		if (!shmem->pages)
 			return;
 	} else {
-		/* Not implemented yet */
-		return;
+		if (xa_empty(&shmem->xapages))
+			return;
 	}
 
 	if (drm_WARN_ON_ONCE(obj->dev, !shmem->pages_use_count))
@@ -281,10 +309,15 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
 		set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
 #endif
 
-	drm_gem_put_pages(obj, shmem->pages,
-			  shmem->pages_mark_dirty_on_put,
-			  shmem->pages_mark_accessed_on_put);
-	shmem->pages = NULL;
+	if (!shmem->sparse) {
+		drm_gem_put_pages(obj, shmem->pages,
+				  shmem->pages_mark_dirty_on_put,
+				  shmem->pages_mark_accessed_on_put);
+		shmem->pages = NULL;
+	} else {
+		drm_gem_shmem_put_pages_sparse(shmem);
+		xa_destroy(&shmem->xapages);
+	}
 }
 EXPORT_SYMBOL(drm_gem_shmem_put_pages);
 
@@ -797,6 +830,103 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
 	return ERR_PTR(ret);
 }
 
+static int
+drm_gem_shmem_sparse_populate_locked(struct drm_gem_shmem_object *shmem,
+				     unsigned int n_pages, pgoff_t page_offset,
+				     gfp_t gfp)
+{
+	bool first_alloc;
+	int ret;
+
+	if (!shmem->sparse)
+		return -EINVAL;
+
+	dma_resv_assert_held(shmem->base.resv);
+
+	/* If the mapping exists, then bail out immediately */
+	if (xa_load(&shmem->xapages, page_offset) != NULL)
+		return -EEXIST;
+
+	first_alloc = xa_empty(&shmem->xapages);
+
+	ret = drm_get_pages_xarray(&shmem->base, &shmem->xapages,
+				   page_offset, n_pages, gfp);
+	if (ret)
+		return ret;
+
+	if (first_alloc)
+		shmem->pages_use_count = 1;
+
+	return 0;
+}
+
+static struct sg_table *
+drm_gem_shmem_sparse_get_sgt_range(struct drm_gem_shmem_object *shmem,
+				   unsigned int n_pages, pgoff_t page_offset,
+				   gfp_t gfp)
+{
+	struct drm_gem_object *obj = &shmem->base;
+	struct sg_table *sgt;
+	int ret;
+
+	if (drm_WARN_ON(obj->dev, !shmem->sparse))
+		return ERR_PTR(-EINVAL);
+
+	/* If the page range wasn't allocated, then bail out immediately */
+	if (xa_load(&shmem->xapages, page_offset) == NULL)
+		return ERR_PTR(-EINVAL);
+
+	sgt = kzalloc(sizeof(*sgt), GFP_NOWAIT);
+	if (!sgt)
+		return ERR_PTR(-ENOMEM);
+
+	ret = sg_alloc_table_from_xarray(sgt, &shmem->xapages, page_offset,
+					 n_pages, 0, n_pages * PAGE_SIZE, gfp);
+	if (ret)
+		goto err_free_sgtable;
+
+	ret = dma_map_sgtable(obj->dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
+	if (ret)
+		goto err_free_sgtable;
+
+	return sgt;
+
+err_free_sgtable:
+	kfree(sgt);
+	return ERR_PTR(ret);
+}
+
+static struct sg_table *
+drm_gem_shmem_get_sparse_pages_locked(struct drm_gem_shmem_object *shmem,
+				      unsigned int n_pages, pgoff_t page_offset,
+				      gfp_t gfp)
+{
+	struct sg_table *sgt;
+	int ret;
+
+	if (!shmem->sparse)
+		return ERR_PTR(-EINVAL);
+
+	dma_resv_assert_held(shmem->base.resv);
+
+	ret = drm_gem_shmem_sparse_populate_locked(shmem, n_pages, page_offset, gfp);
+	if (ret)
+		return ERR_PTR(ret);
+
+	sgt = drm_gem_shmem_sparse_get_sgt_range(shmem, n_pages, page_offset, gfp);
+	if (IS_ERR(sgt)) {
+		ret = PTR_ERR(sgt);
+		goto err_free_pages;
+	}
+
+	return sgt;
+
+err_free_pages:
+	drm_gem_put_xarray_page_range(&shmem->xapages, page_offset,
+				      n_pages, false, false);
+	return ERR_PTR(ret);
+}
+
 /**
  * drm_gem_shmem_get_pages_sgt - Pin pages, dma map them, and return a
  *				 scatter/gather table for a shmem GEM object.
@@ -828,6 +958,46 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_get_pages_sgt);
 
+/**
+ * drm_gem_shmem_get_sparse_pages_sgt - Pin pages, dma map them, and return a
+ *				 scatter/gather table for a sparse shmem GEM object.
+ * @shmem: shmem GEM object
+ * @n_pages: number of pages to pin and map
+ * @page_offset: shmem file index of the first page to allocate and map
+ * @gfp: Further allocation flags
+ *
+ * This function conceptually does the same thing as drm_gem_shmem_get_pages_sgt,
+ * but only for a contiguous subset of pages from the underlying shmem file.
+ * The allocation flags allows users to allocate pages with a mask other than
+ * GFP_KERNEL, in cases where it can race with shmem shrinkers.
+ *
+ * Returns:
+ * A pointer to the scatter/gather table of pinned pages or errno on failure.
+ */
+struct sg_table *
+drm_gem_shmem_get_sparse_pages_sgt(struct drm_gem_shmem_object *shmem,
+				   unsigned int n_pages, pgoff_t page_offset,
+				   gfp_t gfp)
+{
+	struct drm_gem_object *obj = &shmem->base;
+	struct sg_table *sgt;
+	int ret;
+
+	if (drm_WARN_ON(obj->dev, !shmem->sparse))
+		return ERR_PTR(-EINVAL);
+
+	ret = dma_resv_lock(shmem->base.resv, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+
+	sgt = drm_gem_shmem_get_sparse_pages_locked(shmem, n_pages, page_offset, gfp);
+
+	dma_resv_unlock(shmem->base.resv);
+
+	return sgt;
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sparse_pages_sgt);
+
 /**
  * drm_gem_shmem_prime_import_sg_table - Produce a shmem GEM object from
  *                 another driver's scatter/gather table of pinned pages
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 2bf893eabb4b..d8288a119bc3 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -39,6 +39,7 @@
 #include <linux/dma-resv.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/xarray.h>
 
 #include <drm/drm_vma_manager.h>
 
@@ -534,6 +535,11 @@ struct page **drm_gem_get_pages(struct drm_gem_object *obj);
 void drm_gem_put_pages(struct drm_gem_object *obj, struct page **pages,
 		bool dirty, bool accessed);
 
+int drm_get_pages_xarray(struct drm_gem_object *obj, struct xarray *pa,
+			 pgoff_t page_offset, unsigned int npages, gfp_t gfp);
+void drm_gem_put_xarray_page_range(struct xarray *pa, unsigned long idx,
+				   unsigned int npages, bool dirty, bool accessed);
+
 void drm_gem_lock(struct drm_gem_object *obj);
 void drm_gem_unlock(struct drm_gem_object *obj);
 
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 00e47512b30f..cbe4548e3ff6 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -138,6 +138,10 @@ void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem);
 struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem);
 struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem);
 
+struct sg_table *drm_gem_shmem_get_sparse_pages_sgt(struct drm_gem_shmem_object *shmem,
+						     unsigned int n_pages, pgoff_t page_offset,
+						     gfp_t gfp);
+
 void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 			      struct drm_printer *p, unsigned int indent);
 
-- 
2.48.1

