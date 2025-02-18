Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5D9A3AC7F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 00:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682F610E780;
	Tue, 18 Feb 2025 23:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="goQi3QnU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4143710E77E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 23:29:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1739921344; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RuyA0qYHE59i9UeK6jSfX+vKYF2pBJDcnJVG7va5kUfSTIk5jFN9ElBtkdnbN64Nzesvxv3whjj4eHuC2152ZxI5/8TTQi7uO79sxq6zPsY4M+DLbZTeZaYIM0tAtnNWUEgOoAWoKlVwHppUYthA44QDE9QNVf5Obm93RJQKSXU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1739921344;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=lxIiOljX+8RCkQFRb8Qc1CK/237y/rJX69Kr+P0hkwg=; 
 b=TGwkodcGf1i/Jv04xgiPBhLO9NrPPS/XDKsYKoPkXGpam+bF7ZAYsnwVzq/s8fSPK163/Gu3Dq66CT098bKyYlxzWU46dylQc4BnhX8zB5/DKBys6r4nj157DVzx4ae3Fe2uCBpW5nwFT4rdsLUQcwuR9jA3FcKlJl2Tju8KZMY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739921344; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=lxIiOljX+8RCkQFRb8Qc1CK/237y/rJX69Kr+P0hkwg=;
 b=goQi3QnU9PXH3+xd3RZvDZ+f09wsssdxlkz4goU4WmQefz985Zww0D1TKAQP8qMG
 czdr9dc96AlszkwAyLxfjMr95dEiDI3b2HoQhQI5dqIvMw3dz+C07NbQOVca5zopDer
 oS15tMIH2nyDW3pLDqKp+XU7AyIZtaRZCncxKWR8=
Received: by mx.zohomail.com with SMTPS id 1739921342252847.3662481768877;
 Tue, 18 Feb 2025 15:29:02 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [RFC PATCH 5/7] drm/shmem: Implement sparse allocation of pages for
 shmem objects
Date: Tue, 18 Feb 2025 23:25:35 +0000
Message-ID: <20250218232552.3450939-6-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250218232552.3450939-1-adrian.larumbe@collabora.com>
References: <20250218232552.3450939-1-adrian.larumbe@collabora.com>
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

Add a new function that lets drivers allocate pages for a subset of the shmem
object's virtual address range. Expand the shmem object's definition to include
an RSS field, since it's different from the base GEM object's virtual size.

Add also new function for putting the pages of a sparse page array. There is
refactorisation potential with drm_gem_put_pages, but it is yet to be decided
what this should look like.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/drm_gem.c              |  32 +++++++
 drivers/gpu/drm/drm_gem_shmem_helper.c | 123 ++++++++++++++++++++++++-
 include/drm/drm_gem.h                  |   3 +
 include/drm/drm_gem_shmem_helper.h     |  12 +++
 4 files changed, 165 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index ee811764c3df..930c5219e1e9 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -679,6 +679,38 @@ void drm_gem_put_pages(struct drm_gem_object *obj, struct page **pages,
 }
 EXPORT_SYMBOL(drm_gem_put_pages);
 
+void drm_gem_put_sparse_xarray(struct xarray *pa, unsigned long idx,
+				unsigned int npages, bool dirty, bool accessed)
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
+EXPORT_SYMBOL(drm_gem_put_sparse_xarray);
+
 static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
 			  struct drm_gem_object **objs)
 {
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index d63e42be2d72..40f7f6812195 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -10,7 +10,6 @@
 #include <linux/shmem_fs.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
-#include <linux/xarray.h>
 
 #ifdef CONFIG_X86
 #include <asm/set_memory.h>
@@ -161,6 +160,18 @@ struct drm_gem_shmem_object *drm_gem_shmem_create_with_mnt(struct drm_device *de
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_create_with_mnt);
 
+static void drm_gem_shmem_put_pages_sparse(struct drm_gem_shmem_object *shmem)
+{
+	unsigned int n_pages = shmem->rss_size / PAGE_SIZE;
+
+	drm_WARN_ON(shmem->base.dev, (shmem->rss_size & (PAGE_SIZE - 1)) != 0);
+	drm_WARN_ON(shmem->base.dev, !shmem->sparse);
+
+	drm_gem_put_sparse_xarray(&shmem->xapages, 0, n_pages,
+				   shmem->pages_mark_dirty_on_put,
+				   shmem->pages_mark_accessed_on_put);
+}
+
 /**
  * drm_gem_shmem_free - Free resources associated with a shmem GEM object
  * @shmem: shmem GEM object to free
@@ -264,10 +275,15 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
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
 
@@ -765,6 +781,81 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
 	return ERR_PTR(ret);
 }
 
+static struct sg_table *drm_gem_shmem_get_sparse_pages_locked(struct drm_gem_shmem_object *shmem,
+							       unsigned int n_pages,
+							       pgoff_t page_offset)
+{
+	struct drm_gem_object *obj = &shmem->base;
+	gfp_t mask = GFP_KERNEL | GFP_NOWAIT;
+	size_t size = n_pages * PAGE_SIZE;
+	struct address_space *mapping;
+	struct sg_table *sgt;
+	struct page *page;
+	bool first_alloc;
+	int ret, i;
+
+	if (!shmem->sparse)
+		return ERR_PTR(-EINVAL);
+
+	/* If the mapping exists, then bail out immediately */
+	if (xa_load(&shmem->xapages, page_offset) != NULL)
+		return ERR_PTR(-EEXIST);
+
+	dma_resv_assert_held(shmem->base.resv);
+
+	first_alloc = xa_empty(&shmem->xapages);
+
+	mapping = shmem->base.filp->f_mapping;
+	mapping_set_unevictable(mapping);
+
+	for (i = 0; i < n_pages; i++) {
+		page = shmem_read_mapping_page_nonblocking(mapping, page_offset + i);
+		if (IS_ERR(page)) {
+			ret = PTR_ERR(page);
+			goto err_free_pages;
+		}
+
+		/* Add the page into the xarray */
+		ret = xa_err(xa_store(&shmem->xapages, page_offset + i, page, mask));
+		if (ret) {
+			put_page(page);
+			goto err_free_pages;
+		}
+	}
+
+	sgt = kzalloc(sizeof(*sgt), mask);
+	if (!sgt) {
+		ret = -ENOMEM;
+		goto err_free_pages;
+	}
+
+	ret = sg_alloc_table_from_page_xarray(sgt, &shmem->xapages, page_offset, n_pages, 0, size, mask);
+	if (ret)
+		goto err_free_sgtable;
+
+	ret = dma_map_sgtable(obj->dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
+	if (ret)
+		goto err_free_sgtable;
+
+	if (first_alloc)
+		shmem->pages_use_count = 1;
+
+	shmem->rss_size += size;
+
+	return sgt;
+
+err_free_sgtable:
+	kfree(sgt);
+err_free_pages:
+	while (--i) {
+		page = xa_erase(&shmem->xapages, page_offset + i);
+		if (drm_WARN_ON(obj->dev, !page))
+			continue;
+		put_page(page);
+	}
+	return ERR_PTR(ret);
+}
+
 /**
  * drm_gem_shmem_get_pages_sgt - Pin pages, dma map them, and return a
  *				 scatter/gather table for a shmem GEM object.
@@ -796,6 +887,28 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_get_pages_sgt);
 
+struct sg_table *drm_gem_shmem_get_sparse_pages_sgt(struct drm_gem_shmem_object *shmem,
+						     unsigned int n_pages, pgoff_t page_offset)
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
+	sgt = drm_gem_shmem_get_sparse_pages_locked(shmem, n_pages, page_offset);
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
index fdae947682cd..4fd45169a3af 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -38,6 +38,7 @@
 #include <linux/dma-resv.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/xarray.h>
 
 #include <drm/drm_vma_manager.h>
 
@@ -532,6 +533,8 @@ int drm_gem_create_mmap_offset_size(struct drm_gem_object *obj, size_t size);
 struct page **drm_gem_get_pages(struct drm_gem_object *obj);
 void drm_gem_put_pages(struct drm_gem_object *obj, struct page **pages,
 		bool dirty, bool accessed);
+void drm_gem_put_sparse_xarray(struct xarray *pa, unsigned long idx,
+				unsigned int npages, bool dirty, bool accessed);
 
 void drm_gem_lock(struct drm_gem_object *obj);
 void drm_gem_unlock(struct drm_gem_object *obj);
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 902039cfc4ce..fcd84c8cf8e7 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -44,6 +44,14 @@ struct drm_gem_shmem_object {
 	 */
 	unsigned int pages_use_count;
 
+	/**
+	 * @rss_size:
+	 *
+	 * Size of the object RSS, in bytes.
+	 * lifetime.
+	 */
+	size_t rss_size;
+
 	/**
 	 * @madv: State for madvise
 	 *
@@ -107,6 +115,7 @@ struct drm_gem_shmem_object {
 	container_of(obj, struct drm_gem_shmem_object, base)
 
 struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t size);
+struct drm_gem_shmem_object *drm_gem_shmem_create_sparse(struct drm_device *dev, size_t size);
 struct drm_gem_shmem_object *drm_gem_shmem_create_with_mnt(struct drm_device *dev,
 							   size_t size,
 							   struct vfsmount *gemfs);
@@ -138,6 +147,9 @@ void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem);
 struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem);
 struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem);
 
+struct sg_table *drm_gem_shmem_get_sparse_pages_sgt(struct drm_gem_shmem_object *shmem,
+						     unsigned int n_pages, pgoff_t page_offset);
+
 void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 			      struct drm_printer *p, unsigned int indent);
 
-- 
2.47.1

