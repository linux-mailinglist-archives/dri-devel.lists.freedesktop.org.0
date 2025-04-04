Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6E8A7B9DF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 11:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F4810EBA2;
	Fri,  4 Apr 2025 09:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PSrjU1Ap";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0817810EB9B;
 Fri,  4 Apr 2025 09:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743758797;
 bh=HkdaPvg07AvJ7+zigc1LJGMKs69amgEdZfPzMvxkjFg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PSrjU1ApDppcNJk40hABaEfhuFGq3MAMTrUvsrN/890tn1+li1dp7bVtoe2hGHzfp
 bqHAVPV3QhDI3xCsEGE2M1NmBhz+vxycP29cRUSnxPyRPOmmew5LAsaEvMS40lgdwr
 j0ChdWo9XSic+eoIEygpps6ooC4q9QMQgAr58BlUk8XZh18oTOlCvV6abgwoarxxGK
 sfE3NtaEy5kV+n+LeBUPz7MoQSLWSVhEfrL8kgBpE/aGwZHmoxT968HjviTpfZ2i5i
 r4An3FEMCDA2yvtyKKMn8ahjiwf4V8UZS4Kj6WNV2qEXMgQ7drlhcg7WqHJMb7bSYJ
 hdbUz5lP7gFRQ==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E1C6017E0B0B;
 Fri,  4 Apr 2025 11:26:36 +0200 (CEST)
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
Subject: [PATCH v3 2/8] drm/gem-shmem: Support sparse backing
Date: Fri,  4 Apr 2025 11:26:28 +0200
Message-ID: <20250404092634.2968115-3-boris.brezillon@collabora.com>
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

We have several drivers open-coding an alloc-on-fault behavior, each
in a slightly different way. This is an attempt at generalizing the
implementation and allowing for real non-blocking allocations in the
fault handler, so we can finally stop violating one of the dma-fence
signalling rules: nothing in the fence signalling path should block
on memory allocation.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 404 ++++++++++++++++++++++++-
 include/drm/drm_gem_shmem_helper.h     | 285 ++++++++++++++++-
 2 files changed, 680 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 2d924d547a51..13ab497bd9e0 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -176,6 +176,16 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 		if (shmem->pages)
 			drm_gem_shmem_put_pages_locked(shmem);
 
+		/* Auto-cleanup of sparse resources if it's not been done before.
+		 * We shouldn't rely on that, but the implicit ref taken by
+		 * the sgt also pulls resources from the sparse arrays when
+		 * sparse GEM is used as a regular GEM. Hopefully this all goes
+		 * away once we've patched drivers to explicitly request/release
+		 * pages instead of relying on the implicit ref taken by the sgt.
+		 */
+		if (shmem->sparse)
+			drm_gem_shmem_sparse_finish(shmem);
+
 		drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_use_count));
 		drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_pin_count));
 
@@ -191,17 +201,51 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 	struct page **pages;
+	int ret;
 
 	dma_resv_assert_held(shmem->base.resv);
 
 	if (refcount_inc_not_zero(&shmem->pages_use_count))
 		return 0;
 
-	pages = drm_gem_get_pages(obj);
-	if (IS_ERR(pages)) {
-		drm_dbg_kms(obj->dev, "Failed to get pages (%ld)\n",
-			    PTR_ERR(pages));
-		return PTR_ERR(pages);
+	if (shmem->sparse) {
+		/* Request pages for the entire object. */
+		pages = kvmalloc_array(obj->size >> PAGE_SHIFT,
+				       sizeof(*pages), GFP_KERNEL);
+		if (!pages) {
+			ret = -ENOMEM;
+		} else {
+			drm_gem_shmem_sparse_get_locked(shmem);
+			ret = drm_gem_get_page_range(obj, &shmem->sparse->pages, 0, UINT_MAX,
+						     mapping_gfp_mask(obj->filp->f_mapping),
+						     GFP_KERNEL);
+			if (!ret) {
+				unsigned int npages = obj->size >> PAGE_SHIFT;
+				unsigned int copied;
+
+				copied = xa_extract(&shmem->sparse->pages,
+						    (void **)pages, 0, UINT_MAX,
+						    npages, XA_PRESENT);
+				if (copied != npages)
+					ret = -EINVAL;
+			}
+
+			if (ret) {
+				drm_gem_shmem_sparse_put_locked(shmem);
+				kvfree(pages);
+			}
+		}
+	} else {
+		pages = drm_gem_get_pages(obj);
+		if (IS_ERR(pages))
+			ret = PTR_ERR(pages);
+		else
+			ret = 0;
+	}
+
+	if (ret) {
+		drm_dbg_kms(obj->dev, "Failed to get pages (%d)\n", ret);
+		return ret;
 	}
 
 	/*
@@ -233,7 +277,17 @@ void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
 
 	dma_resv_assert_held(shmem->base.resv);
 
-	if (refcount_dec_and_test(&shmem->pages_use_count)) {
+	if (!refcount_dec_and_test(&shmem->pages_use_count))
+		return;
+
+	if (shmem->sparse) {
+		/* drm_gem_shmem_sparse_finish() will return pages to WB mode.
+		 * all we have to do here is free the array we allocated in
+		 * drm_gem_shmem_get_pages_locked().
+		 */
+		drm_gem_shmem_sparse_put_locked(shmem);
+		kvfree(shmem->pages);
+	} else {
 #ifdef CONFIG_X86
 		if (shmem->map_wc)
 			set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
@@ -242,8 +296,9 @@ void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
 		drm_gem_put_pages(obj, shmem->pages,
 				  shmem->pages_mark_dirty_on_put,
 				  shmem->pages_mark_accessed_on_put);
-		shmem->pages = NULL;
 	}
+
+	shmem->pages = NULL;
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
 
@@ -258,9 +313,14 @@ int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
 	if (refcount_inc_not_zero(&shmem->pages_pin_count))
 		return 0;
 
+	if (shmem->sparse)
+		drm_gem_shmem_sparse_pin_locked(shmem);
+
 	ret = drm_gem_shmem_get_pages_locked(shmem);
 	if (!ret)
 		refcount_set(&shmem->pages_pin_count, 1);
+	else if (shmem->sparse)
+		drm_gem_shmem_sparse_unpin_locked(shmem);
 
 	return ret;
 }
@@ -270,8 +330,12 @@ void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
 {
 	dma_resv_assert_held(shmem->base.resv);
 
-	if (refcount_dec_and_test(&shmem->pages_pin_count))
+	if (refcount_dec_and_test(&shmem->pages_pin_count)) {
+		if (shmem->sparse)
+			drm_gem_shmem_sparse_unpin_locked(shmem);
+
 		drm_gem_shmem_put_pages_locked(shmem);
+	}
 }
 EXPORT_SYMBOL(drm_gem_shmem_unpin_locked);
 
@@ -327,6 +391,61 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_unpin);
 
+/**
+ * drm_gem_shmem_sparse_vmap_range - helper to vmap() a range of pages in a sparse object
+ *
+ * Returns a kernel mapping of a portion of a sparse GEM object. In case of
+ * success the returned value must be unmapped with vunmap().
+ *
+ * This mapping is not shared with the any mapping returned by drm_gem_vmap() and
+ * must be explicitly unmappped.
+ *
+ * Return: a valid pointer in case of success, and ERR_PTR() otherwise.
+ */
+void *drm_gem_shmem_sparse_vmap_range(struct drm_gem_shmem_object *shmem,
+				      pgoff_t first_page, unsigned int npages)
+{
+	pgprot_t prot = PAGE_KERNEL;
+	unsigned int copied;
+	struct page **pages;
+	void *vaddr;
+
+	if (!shmem->sparse)
+		return ERR_PTR(-EINVAL);
+
+	if (!npages)
+		return NULL;
+
+	if (shmem->map_wc)
+		prot = pgprot_writecombine(prot);
+
+	pages = kvmalloc_array(npages, sizeof(*pages), GFP_KERNEL);
+	if (!pages)
+		return ERR_PTR(-ENOMEM);
+
+	copied = xa_extract(&shmem->sparse->pages, (void **)pages,
+			    first_page, first_page + npages - 1,
+			    npages, XA_PRESENT);
+	if (copied != npages) {
+		vaddr = ERR_PTR(-EINVAL);
+		goto out_free_pages;
+	}
+
+	vaddr = vmap(pages, npages, VM_MAP, prot);
+	if (!vaddr) {
+		vaddr = ERR_PTR(-ENOMEM);
+		goto out_free_pages;
+	}
+
+out_free_pages:
+	/* Once the thing is mapped, we can get rid of the pages array,
+	 * since pages are retained in the xarray anyway.
+	 */
+	kvfree(pages);
+	return vaddr;
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_sparse_vmap_range);
+
 /*
  * drm_gem_shmem_vmap_locked - Create a virtual mapping for a shmem GEM object
  * @shmem: shmem GEM object
@@ -673,6 +792,275 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_print_info);
 
+struct drm_gem_shmem_sparse_sgt {
+	struct sg_table sgt;
+	u32 gem_pgoffset;
+	u32 npages;
+};
+
+/**
+ * drm_gem_shmem_sparse_get_sgt - helper to get an SGT for a given GEM offset
+ * @shmem: object to populate.
+ * @gem_pgoffset: page to get an sgt for.
+ * @sgt_pgoffset: returns the page offset to start at in the returned sgt.
+ * @sgt_remaining_pages: returns the number of pages remaining in the sgt after *sgt_pgoffset.
+ *
+ * Used to retrieve an sgt allocated by drm_gem_shmem_sparse_populate_range() so the
+ * driver can map a section of a sparse GEM.
+ *
+ * Return: a valid sg_table pointer in case of success, and ERR_PTR() otherwise.
+ */
+struct sg_table *drm_gem_shmem_sparse_get_sgt(struct drm_gem_shmem_object *shmem,
+					      pgoff_t gem_pgoffset,
+					      pgoff_t *sgt_pgoffset,
+					      unsigned int *sgt_remaining_pages)
+{
+	struct drm_gem_shmem_sparse_sgt *sgt_entry;
+	unsigned long sgt_idx;
+	u32 granularity_shift;
+
+	if (!shmem->sparse)
+		return ERR_PTR(-EINVAL);
+
+	if (gem_pgoffset & (shmem->sparse->granularity - 1))
+		return ERR_PTR(-EINVAL);
+
+	granularity_shift = ilog2(shmem->sparse->granularity);
+	sgt_idx = gem_pgoffset >> granularity_shift;
+	sgt_entry = xa_load(&shmem->sparse->sgts, sgt_idx);
+	if (xa_err(sgt_entry))
+		return ERR_PTR(xa_err(sgt_entry));
+	else if (!sgt_entry)
+		return ERR_PTR(-ENOENT);
+
+	*sgt_pgoffset = gem_pgoffset - sgt_entry->gem_pgoffset;
+	*sgt_remaining_pages = sgt_entry->npages - *sgt_pgoffset;
+	return &sgt_entry->sgt;
+}
+EXPORT_SYMBOL(drm_gem_shmem_sparse_get_sgt);
+
+static int drm_gem_shmem_sparse_add_sgt(struct drm_gem_shmem_object *shmem,
+					struct page **pages, unsigned int npages,
+					pgoff_t gem_pgoffset, gfp_t gfp)
+{
+	u32 granularity_shift = ilog2(shmem->sparse->granularity);
+	unsigned long first_sgt = gem_pgoffset >> granularity_shift;
+	unsigned long last_sgt = (gem_pgoffset + npages - 1) >> granularity_shift;
+	struct drm_gem_shmem_sparse_sgt *sgt_entry;
+	size_t max_segment = 0;
+	unsigned int copied;
+	int ret;
+
+	copied = xa_extract(&shmem->sparse->pages, (void **)pages,
+			    gem_pgoffset, gem_pgoffset + npages - 1,
+			    npages, XA_PRESENT);
+
+	if (copied != npages)
+		return -EINVAL;
+
+#ifdef CONFIG_X86
+	if (shmem->map_wc)
+		set_pages_array_wc(pages, npages);
+#endif
+
+	sgt_entry = kzalloc(sizeof(*sgt_entry), gfp);
+	if (!sgt_entry)
+		return -ENOMEM;
+
+	sgt_entry->npages = npages;
+	sgt_entry->gem_pgoffset = gem_pgoffset;
+
+	if (shmem->base.dev->dev)
+		max_segment = dma_max_mapping_size(shmem->base.dev->dev);
+
+	if (!max_segment)
+		max_segment = UINT_MAX;
+
+	ret = sg_alloc_table_from_pages_segment(&sgt_entry->sgt, pages, npages, 0,
+						npages << PAGE_SHIFT, max_segment,
+						gfp);
+	if (ret)
+		goto err_free_sgt;
+
+	ret = dma_map_sgtable(shmem->base.dev->dev, &sgt_entry->sgt, DMA_BIDIRECTIONAL, 0);
+	if (ret)
+		goto err_free_sgt;
+
+	ret = xa_err(xa_store_range(&shmem->sparse->sgts, first_sgt, last_sgt, sgt_entry, gfp));
+	if (ret)
+		goto err_unmap_sgt;
+
+	return 0;
+
+err_unmap_sgt:
+	dma_unmap_sgtable(shmem->base.dev->dev, &sgt_entry->sgt,  DMA_BIDIRECTIONAL, 0);
+
+err_free_sgt:
+	sg_free_table(&sgt_entry->sgt);
+	kfree(sgt_entry);
+	return ret;
+}
+
+/**
+ * drm_gem_shmem_sparse_populate_range - populate GEM object range
+ * @shmem: object to populate.
+ * @offset: first page to populate.
+ * @npages: Number of pages to populate.
+ * @page_gfp: GFP flags to use for page allocation.
+ * @other_gfp: GFP flags to use for other allocations.
+ *
+ * This function takes care of both the page allocation, and the sg_table
+ * chunks preparation.
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+int drm_gem_shmem_sparse_populate_range(struct drm_gem_shmem_object *shmem,
+					pgoff_t offset, unsigned int npages,
+					gfp_t page_gfp, gfp_t other_gfp)
+{
+	unsigned long first_sgt, last_sgt;
+	u32 granularity_shift;
+	struct page **pages;
+	int ret;
+
+	if (!shmem->sparse || !is_power_of_2(shmem->sparse->granularity))
+		return -EINVAL;
+
+	/* The range must be aligned on the granularity. */
+	if ((offset | npages) & (shmem->sparse->granularity - 1))
+		return -EINVAL;
+
+	/* Bail out early if there's nothing to populate. */
+	if (!npages)
+		return 0;
+
+	ret = drm_gem_get_page_range(&shmem->base, &shmem->sparse->pages,
+				     offset, npages, page_gfp, other_gfp);
+	if (ret)
+		return ret;
+
+	pages = kmalloc_array(npages, sizeof(*pages), other_gfp);
+	if (!pages)
+		return -ENOMEM;
+
+	granularity_shift = ilog2(shmem->sparse->granularity);
+	first_sgt = offset >> granularity_shift;
+	last_sgt = (offset + npages - 1) >> granularity_shift;
+
+	for (unsigned long sgt_idx = first_sgt; sgt_idx <= last_sgt; ) {
+		struct drm_gem_shmem_sparse_sgt *sgt_entry = NULL;
+		unsigned long next_sgt_idx = sgt_idx;
+
+		sgt_entry = xa_load(&shmem->sparse->sgts, sgt_idx);
+		if (sgt_entry) {
+			/* Skip already populated sections. */
+			sgt_idx += sgt_entry->npages >> granularity_shift;
+			continue;
+		}
+
+		if (!xa_find_after(&shmem->sparse->sgts, &next_sgt_idx, last_sgt, XA_PRESENT))
+			next_sgt_idx = last_sgt + 1;
+
+		ret = drm_gem_shmem_sparse_add_sgt(shmem, pages,
+						   (next_sgt_idx - sgt_idx) << granularity_shift,
+						   sgt_idx << granularity_shift,
+						   other_gfp);
+		if (ret)
+			break;
+
+		sgt_idx = next_sgt_idx;
+	}
+
+	kfree(pages);
+	return ret;
+}
+EXPORT_SYMBOL(drm_gem_shmem_sparse_populate_range);
+
+/**
+ * drm_gem_shmem_sparse_init - Initialize the sparse backing
+ *
+ * Must be called just after drm_gem_shmem_create[with_mnt]() when sparse
+ * allocation is wanted.
+ */
+int drm_gem_shmem_sparse_init(struct drm_gem_shmem_object *shmem,
+			      struct drm_gem_shmem_sparse_backing *sparse,
+			      unsigned int granularity)
+{
+	if (!is_power_of_2(granularity))
+		return -EINVAL;
+
+	sparse->granularity = granularity;
+	xa_init_flags(&sparse->pages, 0);
+	xa_init_flags(&sparse->sgts, 0);
+	shmem->sparse = sparse;
+	return 0;
+}
+EXPORT_SYMBOL(drm_gem_shmem_sparse_init);
+
+#ifdef CONFIG_X86
+static int drm_gem_shmem_set_pages_wb(struct drm_gem_shmem_object *shmem,
+				      struct page **pages, pgoff_t offset,
+				      unsigned int count, void *data)
+{
+	set_pages_array_wb(pages, count);
+	return 0;
+}
+#endif
+
+/**
+ * drm_gem_shmem_sparse_finish - Release sparse backing resources
+ *
+ * Must be called just before drm_gem_shmem_free().
+ */
+void
+drm_gem_shmem_sparse_finish(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_shmem_sparse_sgt *sgt_entry;
+	unsigned long sgt_idx;
+
+	if (!shmem->sparse)
+		return;
+
+	/* drm_gem_shmem_object::pages_use_count should be zero and
+	 * drm_gem_shmem_object::pages NULL when this function is called,
+	 * otherwise the pages array would contain pages that might be
+	 * reclaimed after that point.
+	 */
+	drm_WARN_ON(shmem->base.dev,
+		    refcount_read(&shmem->pages_use_count));
+
+	xa_for_each(&shmem->sparse->sgts, sgt_idx, sgt_entry) {
+		xa_erase(&shmem->sparse->sgts, sgt_idx);
+		dma_unmap_sgtable(shmem->base.dev->dev, &sgt_entry->sgt, DMA_BIDIRECTIONAL, 0);
+		sg_free_table(&sgt_entry->sgt);
+		kfree(sgt_entry);
+	}
+	xa_destroy(&shmem->sparse->sgts);
+
+#ifdef CONFIG_X86
+	if (shmem->map_wc) {
+		unsigned int npages = shmem->base.size >> PAGE_SHIFT;
+		struct page *pages[64];
+		pgoff_t pos = 0;
+		int ret;
+
+		ret = drm_gem_shmem_sparse_iterate_pages_in_batch(shmem, &pos, npages,
+								  drm_gem_shmem_set_pages_wb,
+								  pages, ARRAY_SIZE(pages),
+								  NULL);
+		drm_WARN_ON(shmem->base.dev, ret);
+	}
+#endif
+
+	drm_gem_put_page_range(&shmem->base, &shmem->sparse->pages, 0,
+			       UINT_MAX,
+			       shmem->pages_mark_dirty_on_put,
+			       shmem->pages_mark_accessed_on_put);
+	xa_destroy(&shmem->sparse->pages);
+	shmem->sparse = NULL;
+}
+EXPORT_SYMBOL(drm_gem_shmem_sparse_finish);
+
 /**
  * drm_gem_shmem_get_sg_table - Provide a scatter/gather table of pinned
  *                              pages for a shmem GEM object
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index b4f993da3cae..d8d6456d2171 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -6,6 +6,7 @@
 #include <linux/fs.h>
 #include <linux/mm.h>
 #include <linux/mutex.h>
+#include <linux/xarray.h>
 
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
@@ -17,6 +18,56 @@ struct drm_mode_create_dumb;
 struct drm_printer;
 struct sg_table;
 
+/**
+ * struct drm_gem_shmem_sparse_backing - Structure used to manage sparse backing
+ *
+ * Locking is deferred to the user, which is fundamental if we want to support
+ * allocation-on-fault, where blocking on allocation or taking the GEM resv lock
+ * is not allowed.
+ */
+struct drm_gem_shmem_sparse_backing {
+	/**
+	 * @pages: Page table
+	 */
+	struct xarray pages;
+
+	/**
+	 * @sgts: Array of sgt tables.
+	 */
+	struct xarray sgts;
+
+	/**
+	 * @granularity: Granularity of the page population in number of pages.
+	 *
+	 * Must be a power-of-two.
+	 */
+	unsigned int granularity;
+
+	/**
+	 * @counters_lock: Lock used to protect {use,pin}_count when they
+	 * go out/return to zero.
+	 */
+	spinlock_t counters_lock;
+
+	/**
+	 * @use_count: Use count on the page/sgt tables.
+	 *
+	 * Count the number of users of any portion of the GEM object.
+	 * Pages can be reclaimed if/once the GEM is idle (no active fences in the GEM resv),
+	 * but should otherwise be considered used.
+	 */
+	refcount_t use_count;
+
+	/**
+	 * @pin_count: Pin count on the page/sgt tables.
+	 *
+	 * Count the number of users of any portion of the GEM object requiring memory
+	 * to be resident. The pages are considered unreclaimable until this counter
+	 * drops to zero.
+	 */
+	refcount_t pin_count;
+};
+
 /**
  * struct drm_gem_shmem_object - GEM object backed by shmem
  */
@@ -84,6 +135,13 @@ struct drm_gem_shmem_object {
 	 */
 	refcount_t vmap_use_count;
 
+	/**
+	 * @sparse: object used to manage sparse backing.
+	 *
+	 * NULL if sparse backing is disabled.
+	 */
+	struct drm_gem_shmem_sparse_backing *sparse;
+
 	/**
 	 * @pages_mark_dirty_on_put:
 	 *
@@ -113,9 +171,181 @@ struct drm_gem_shmem_object *drm_gem_shmem_create_with_mnt(struct drm_device *de
 							   struct vfsmount *gemfs);
 void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem);
 
+/**
+ * drm_gem_shmem_sparse_get_locked - Take a use ref on the sparse shmem object
+ * @shmem: object to take a ref on.
+ *
+ * Like drm_gem_shmem_sparse_get(), but with the resv lock held by the caller.
+ */
+static inline void drm_gem_shmem_sparse_get_locked(struct drm_gem_shmem_object *shmem)
+{
+	dma_resv_assert_held(shmem->base.resv);
+
+	if (!shmem->sparse)
+		return;
+
+	if (!refcount_inc_not_zero(&shmem->sparse->use_count))
+		refcount_set(&shmem->sparse->use_count, 1);
+}
+
+/**
+ * drm_gem_shmem_sparse_get - Take a use ref on the sparse shmem object
+ * @shmem: object to take a ref on.
+ *
+ * Note that this doesn't populate the pages array, it just flags the
+ * array as being used. The sparse array can be populated with
+ * drm_gem_shmem_sparse_populate_range() after drm_gem_shmem_sparse_get()
+ * or drm_gem_shmem_sparse_pin() is called.
+ */
+static inline void drm_gem_shmem_sparse_get(struct drm_gem_shmem_object *shmem)
+{
+	if (!shmem->sparse)
+		return;
+
+	if (refcount_inc_not_zero(&shmem->sparse->use_count))
+		return;
+
+	dma_resv_lock(shmem->base.resv, NULL);
+	drm_gem_shmem_sparse_get_locked(shmem);
+	dma_resv_unlock(shmem->base.resv);
+}
+
+/**
+ * drm_gem_shmem_sparse_put_locked - Return a use ref on the sparse shmem object
+ * @shmem: object to take a ref on.
+ *
+ * Like drm_gem_shmem_sparse_put(), but with the resv lock held by the caller.
+ */
+static inline void drm_gem_shmem_sparse_put_locked(struct drm_gem_shmem_object *shmem)
+{
+	dma_resv_assert_held(shmem->base.resv);
+
+	if (!shmem->sparse)
+		return;
+
+	if (!refcount_dec_not_one(&shmem->sparse->use_count))
+		refcount_set(&shmem->sparse->use_count, 0);
+}
+
+/**
+ * drm_gem_shmem_sparse_put - Return a use ref on the sparse shmem object
+ * @shmem: object to return a ref on.
+ *
+ * Note that this doesn't release the pages in the page array, it just flags
+ * the array as being unused. The sparse array will be shrunk when/if the
+ * object is purged.
+ */
+static inline void drm_gem_shmem_sparse_put(struct drm_gem_shmem_object *shmem)
+{
+	if (!shmem->sparse)
+		return;
+
+	if (refcount_dec_not_one(&shmem->sparse->use_count))
+		return;
+
+	dma_resv_lock(shmem->base.resv, NULL);
+	drm_gem_shmem_sparse_put_locked(shmem);
+	dma_resv_unlock(shmem->base.resv);
+}
+
+/**
+ * drm_gem_shmem_sparse_pin_locked - Take a pin ref on the sparse shmem object
+ * @shmem: object to take a ref on.
+ *
+ * Like drm_gem_shmem_sparse_pin() but with the resv lock held by the called.
+ */
+static inline void drm_gem_shmem_sparse_pin_locked(struct drm_gem_shmem_object *shmem)
+{
+	dma_resv_assert_held(shmem->base.resv);
+
+	if (!shmem->sparse)
+		return;
+
+	if (!refcount_inc_not_zero(&shmem->sparse->pin_count)) {
+		drm_gem_shmem_sparse_get_locked(shmem);
+		refcount_set(&shmem->sparse->pin_count, 1);
+	}
+}
+
+/**
+ * drm_gem_shmem_sparse_pin - Take a pin ref on the sparse shmem object
+ * @shmem: object to take a ref on.
+ *
+ * This also takes a use ref along the way. Like with
+ * drm_gem_shmem_sparse_get(), this function doesn't populate the sparse
+ * arrays, it just flags the existing resources and all future resources
+ * populated with drm_gem_shmem_sparse_populate_range() as pinned.
+ */
+static inline void drm_gem_shmem_sparse_pin(struct drm_gem_shmem_object *shmem)
+{
+	if (!shmem->sparse)
+		return;
+
+	if (refcount_inc_not_zero(&shmem->sparse->pin_count))
+		return;
+
+	dma_resv_lock(shmem->base.resv, NULL);
+	drm_gem_shmem_sparse_pin_locked(shmem);
+	dma_resv_unlock(shmem->base.resv);
+}
+
+/**
+ * drm_gem_shmem_sparse_unpin_locked - Return a pin ref on the sparse shmem object
+ * @shmem: object to take a ref on.
+ *
+ * Like drm_gem_shmem_sparse_unpin() but with the resv lock held by the called.
+ */
+static inline void drm_gem_shmem_sparse_unpin_locked(struct drm_gem_shmem_object *shmem)
+{
+	dma_resv_assert_held(shmem->base.resv);
+
+	if (!shmem->sparse)
+		return;
+
+	if (!refcount_dec_not_one(&shmem->sparse->pin_count)) {
+		refcount_set(&shmem->sparse->pin_count, 0);
+		drm_gem_shmem_sparse_put_locked(shmem);
+	}
+}
+
+/**
+ * drm_gem_shmem_sparse_unpin - Return a pin ref on the sparse shmem object
+ * @shmem: object to take a ref on.
+ *
+ * This also returns a use ref along the way. Like with
+ * drm_gem_shmem_sparse_put(), this function doesn't release the resources,
+ * this will be done at purge/reclaim time.
+ */
+static inline void drm_gem_shmem_sparse_unpin(struct drm_gem_shmem_object *shmem)
+{
+	if (!shmem->sparse)
+		return;
+
+	if (refcount_dec_not_one(&shmem->sparse->pin_count))
+		return;
+
+	dma_resv_lock(shmem->base.resv, NULL);
+	drm_gem_shmem_sparse_unpin_locked(shmem);
+	dma_resv_unlock(shmem->base.resv);
+}
+
+struct sg_table *drm_gem_shmem_sparse_get_sgt(struct drm_gem_shmem_object *shmem,
+					      pgoff_t gem_pgoffset,
+					      pgoff_t *sgt_pgoffset,
+					      unsigned int *sgt_remaining_pages);
+int drm_gem_shmem_sparse_populate_range(struct drm_gem_shmem_object *shmem,
+					pgoff_t offset, unsigned int npages,
+					gfp_t page_gfp, gfp_t other_gfp);
+int drm_gem_shmem_sparse_init(struct drm_gem_shmem_object *shmem,
+			      struct drm_gem_shmem_sparse_backing *sparse,
+			      unsigned int granularity);
+void drm_gem_shmem_sparse_finish(struct drm_gem_shmem_object *shmem);
+
 void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem);
 int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem);
+void *drm_gem_shmem_sparse_vmap_range(struct drm_gem_shmem_object *shmem,
+				      pgoff_t first_page, unsigned int npages);
 int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
 			      struct iosys_map *map);
 void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
@@ -129,7 +359,7 @@ int drm_gem_shmem_madvise_locked(struct drm_gem_shmem_object *shmem, int madv);
 
 static inline bool drm_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem)
 {
-	return (shmem->madv > 0) &&
+	return (shmem->madv > 0) && !shmem->sparse &&
 		!refcount_read(&shmem->pages_pin_count) && shmem->sgt &&
 		!shmem->base.dma_buf && !drm_gem_is_imported(&shmem->base);
 }
@@ -142,6 +372,59 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
 void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 			      struct drm_printer *p, unsigned int indent);
 
+/**
+ * drm_gem_shmem_iterate_pages_in_batch - helper to iterate over GEM pages in batch
+ * @shmem: GEM object to iterate pages on.
+ * @pos: Position to start the iteration from. Updated to point to the final position,
+ * so one can know where things failed when en error is returned.
+ * @npages: Number of pages to iterate.
+ * @cb: Function called for each batch of pages.
+ * @tmp_pages: Array temporary array if page pointers to copy the xarray portion into.
+ * @tmp_page_count: Size of the @tmp_pages array.
+ * @data: Extra data passed to the callback.
+ *
+ * Some helper functions require a plain array of pages, which means we occasionally
+ * have to turn our xarray into an array. The buffer object can cover a significant
+ * amount of pages, and, in some occasions, we have the ability to iteratively pass
+ * pages to the helper function, meaning we don't have to copy the entire array in
+ * one go and can instead process things in batches. This function automates this
+ * batching.
+ */
+static inline int
+drm_gem_shmem_sparse_iterate_pages_in_batch(struct drm_gem_shmem_object *shmem,
+					    pgoff_t *pos, unsigned int npages,
+					    int (*cb)(struct drm_gem_shmem_object *shmem,
+						      struct page **pages, pgoff_t offset,
+						      unsigned int count, void *data),
+					    struct page **tmp_pages,
+					    unsigned int tmp_page_count,
+					    void *data)
+{
+	if (!shmem->sparse)
+		return -EINVAL;
+
+	for (unsigned int i = 0; i < npages; i += tmp_page_count) {
+		unsigned int batch_size = MIN(tmp_page_count, npages - i);
+		unsigned int copied;
+		int ret;
+
+		/* We expect all pages in the iterated range to be populated. */
+		copied = xa_extract(&shmem->sparse->pages, (void **)tmp_pages,
+				    *pos, *pos + batch_size - 1,
+				    batch_size, XA_PRESENT);
+		if (copied != batch_size)
+			return -EINVAL;
+
+		ret = cb(shmem, tmp_pages, *pos, batch_size, data);
+		if (ret)
+			return ret;
+
+		*pos += batch_size;
+	}
+
+	return 0;
+}
+
 extern const struct vm_operations_struct drm_gem_shmem_vm_ops;
 
 /*
-- 
2.49.0

