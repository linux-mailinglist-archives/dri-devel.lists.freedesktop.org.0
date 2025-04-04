Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56336A7B9E1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 11:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E75E10EBA4;
	Fri,  4 Apr 2025 09:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="e4ELU7Ih";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0DE10EB9C;
 Fri,  4 Apr 2025 09:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743758796;
 bh=xliOrKm5kMx4CT9Ta7jUUPECfyVE3BnGikvenamuELg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e4ELU7IhvekWFYwXBi0n5vHf8P1cjl+Eo3jYH5OpRfqsFgZTw+/3JBVl9LKE+NjmA
 7g9Vcj5o1sKEqw7UIlvF5IlgxEpJjkfzSEGBriqB8MNUmMi8v+V3NlypdZOrIaZvGs
 ZanhA7GeEV6pZtCK/jGLxfQMXTpXHau8BJtHJF7HoRoLLepyQPKvN2iGPMDEy0O6IX
 oH47FMarCnCPJcHUXwauYj1JFKAWh/adrsHeumya4/uupUQIwI2pfC11ZJwapRl1V9
 ji+s2oFRzzCP0JQf0yIi+r8Fqz+PZ4tY7hpCqgQi3mj+YAOMPufg+4BIRX53m/kg7d
 f+cXqgGklvkUg==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3A6CA17E0865;
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
Subject: [PATCH v3 1/8] drm/gem: Add helpers to request a range of pages on a
 GEM
Date: Fri,  4 Apr 2025 11:26:27 +0200
Message-ID: <20250404092634.2968115-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404092634.2968115-1-boris.brezillon@collabora.com>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
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

From: Adrián Larumbe <adrian.larumbe@collabora.com>

This new API provides a way to partially populate/unpopulate a GEM
object, and also lets the caller specify the GFP flags to use for
the allocation.

This will help drivers that need to support sparse/alloc-on-demand
GEM objects.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/drm_gem.c | 134 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_gem.h     |  14 ++++
 2 files changed, 148 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 1e659d2660f7..769eaf9943d7 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -679,6 +679,140 @@ void drm_gem_put_pages(struct drm_gem_object *obj, struct page **pages,
 }
 EXPORT_SYMBOL(drm_gem_put_pages);
 
+/**
+ * drm_gem_put_page_range - helper to return a range of pages backing a GEM
+ * @obj: Object this request applies to.
+ * @pa: Page array to unpopulate.
+ * @start: The first page to unpopulate.
+ * @npages: The number of pages to unpopulate.
+ * @dirty: Flag all returned pages dirty if true.
+ * @accessed: Flag all returned pages accessed if true.
+ *
+ * This is used to flag pages as unused. The pages themselves will stay
+ * unreclaimable until all pages are gone, because we can't partially
+ * flag a mapping unevictable.
+ *
+ * @npages is clamped to the object size, so start=0, npages=UINT_MAX
+ * effectively return all pages.
+ */
+void drm_gem_put_page_range(struct drm_gem_object *obj, struct xarray *pa,
+			    pgoff_t start, unsigned int npages,
+			    bool dirty, bool accessed)
+{
+	struct folio_batch fbatch;
+	unsigned long idx;
+	unsigned long end = start + npages - 1;
+	struct page *page;
+
+	xa_for_each_range(pa, idx, page, start, end)
+		xa_clear_mark(pa, idx, DRM_GEM_PAGE_USED);
+
+	/* If the mapping is still used, we bail out. */
+	if (xa_marked(pa, DRM_GEM_PAGE_USED))
+		return;
+
+	mapping_clear_unevictable(file_inode(obj->filp)->i_mapping);
+
+	folio_batch_init(&fbatch);
+
+	xa_for_each(pa, idx, page) {
+		struct folio *folio = page_folio(page);
+		unsigned long folio_pg_idx = folio_page_idx(folio, page);
+
+		xa_erase(pa, idx);
+
+		if (dirty)
+			folio_mark_dirty(folio);
+
+		if (accessed)
+			folio_mark_accessed(folio);
+
+		/* Undo the reference we took when populating the table */
+		if (!folio_batch_add(&fbatch, folio))
+			drm_gem_check_release_batch(&fbatch);
+
+		idx += folio_nr_pages(folio) - folio_pg_idx - 1;
+	}
+
+	if (folio_batch_count(&fbatch))
+		drm_gem_check_release_batch(&fbatch);
+}
+EXPORT_SYMBOL(drm_gem_put_page_range);
+
+/**
+ * drm_gem_get_page_range - helper to populate GEM a range of pages
+ * @obj: Object this request applies to.
+ * @pa: Page array to populate.
+ * @start: The first page to populate.
+ * @npages: The number of pages to populate.
+ * @page_gfp: GFP flags to use for page allocations.
+ * @other_gfp: GFP flags to use for other allocations, like extending the xarray.
+ *
+ * Partially or fully populate a page xarray backing a GEM object. @npages will
+ * be clamped to the object size, so passing start=0, npages=UINT_MAX fully
+ * populates the GEM object.
+ *
+ * There's no optimization to avoid repopulating already populated ranges, but
+ * this case is not rejected either. As soon as one page is populated, the entire
+ * mapping is flagged unevictable, meaning pages returned with
+ * drm_gem_put_page_range() won't be reclaimable until all pages have been
+ * returned.
+ *
+ * If something fails in the middle, pages that were acquired stay there. The
+ * caller should call drm_gem_put_page_range() explicitly to undo what was
+ * partially done.
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+int drm_gem_get_page_range(struct drm_gem_object *obj, struct xarray *pa,
+			   pgoff_t start, unsigned int npages, gfp_t page_gfp,
+			   gfp_t other_gfp)
+{
+	struct address_space *mapping;
+	struct page *page;
+	unsigned long i;
+	int ret = 0;
+
+	if (WARN_ON(!obj->filp))
+		return -EINVAL;
+
+	if (start + npages < start)
+		return -EINVAL;
+
+	if (start + npages > obj->size >> PAGE_SHIFT)
+		return -EINVAL;
+
+	if (npages == 0)
+		return 0;
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
+	mapping_set_unevictable(mapping);
+
+	for (i = 0; i < npages; i++) {
+		page  = shmem_read_mapping_page_gfp(mapping, start + i, page_gfp);
+		if (IS_ERR(page))
+			return PTR_ERR(page);
+
+		/* Add the page into the xarray */
+		ret = xa_err(xa_store(pa, start + i, page, other_gfp));
+		if (ret)
+			return ret;
+
+		xa_set_mark(pa, start + i, DRM_GEM_PAGE_USED);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_gem_get_page_range);
+
 static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
 			  struct drm_gem_object **objs)
 {
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 9b71f7a9f3f8..9980c04355b6 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -39,11 +39,13 @@
 #include <linux/dma-resv.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/xarray.h>
 
 #include <drm/drm_vma_manager.h>
 
 struct iosys_map;
 struct drm_gem_object;
+struct xarray;
 
 /**
  * enum drm_gem_object_status - bitmask of object state for fdinfo reporting
@@ -537,6 +539,18 @@ struct page **drm_gem_get_pages(struct drm_gem_object *obj);
 void drm_gem_put_pages(struct drm_gem_object *obj, struct page **pages,
 		bool dirty, bool accessed);
 
+/* drm_gem_{get,put}_page_range() use XA_MARK_1 to track which pages are
+ * currently used. Make sure you don't mess up with this mark.
+ */
+#define DRM_GEM_PAGE_USED	XA_MARK_1
+
+int drm_gem_get_page_range(struct drm_gem_object *obj, struct xarray *pa,
+			   pgoff_t start, unsigned int npages,
+			   gfp_t page_gfp, gfp_t other_gfp);
+void drm_gem_put_page_range(struct drm_gem_object *obj, struct xarray *pa,
+			    pgoff_t start, unsigned int npages,
+			    bool dirty, bool accessed);
+
 void drm_gem_lock(struct drm_gem_object *obj);
 void drm_gem_unlock(struct drm_gem_object *obj);
 
-- 
2.49.0

