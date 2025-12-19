Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 419F6CCF9B6
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 12:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9863E10EF3E;
	Fri, 19 Dec 2025 11:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L4vaOMzt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F0810EF48;
 Fri, 19 Dec 2025 11:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766144124; x=1797680124;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LQcv1iw1AuRYnVL04bgAmkWGJSCgE8ypC67rzoujNmw=;
 b=L4vaOMztVBMZ8WpeT6ATOEaUMU4hY1sunDqCUpl46TAaE2DG869TgM9+
 saUWz4Bvh50yIycZGz0F+DqixEnC8xB1SAlAGChDugM607P6h2h5A/+1T
 yquMVcz1yb1WzX6CsuvC0mcZ2SzCX8mBgj4+gDP9mmfk5V6KnWHUEIivJ
 /HvSW1SoEnSQYy7rvEyAQgWyMTrwAEqEkcoYGyMLsu8H8wBoXIxAkB1o3
 gG1sJ2T170/bxIUf7XOOqf9lVqBgBy8ttN5M1t7FN/ZIGvWdxBwkfREud
 G5fQKIM8IO5l3gGiuHZCGCsYe9SQYg3N/1VCHLeuWWT99+O3H7oKSR17K g==;
X-CSE-ConnectionGUID: A+WEWATKSvOzFP1UkKjpHw==
X-CSE-MsgGUID: /J2+DQ82TeKGf8ouGdrHFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79224626"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79224626"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:35:24 -0800
X-CSE-ConnectionGUID: GgGYYd7aRjmndBsR4taSJQ==
X-CSE-MsgGUID: cS7y4VLGTq28CxFKu/zidg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203005836"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.251])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:35:20 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v6 22/24] drm/pagemap,
 drm/xe: Support destination migration over interconnect
Date: Fri, 19 Dec 2025 12:33:18 +0100
Message-ID: <20251219113320.183860-23-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251219113320.183860-1-thomas.hellstrom@linux.intel.com>
References: <20251219113320.183860-1-thomas.hellstrom@linux.intel.com>
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

Support destination migration over interconnect when migrating from
device-private pages with the same dev_pagemap owner.

Since we now also collect device-private pages to migrate,
also abort migration if the range to migrate is already
fully populated with pages from the desired pagemap.

Finally return -EBUSY from drm_pagemap_populate_mm()
if the migration can't be completed without first migrating all
pages in the range to system. It is expected that the caller
will perform that before retrying the call to
drm_pagemap_populate_mm().

v3:
- Fix a bug where the p2p dma-address was never used.
- Postpone enabling destination interconnect migration,
  since xe devices require source interconnect migration to
  ensure the source L2 cache is flushed at migration time.
- Update the drm_pagemap_migrate_to_devmem() interface to
  pass migration details.
v4:
- Define XE_INTERCONNECT_P2P unconditionally (CI)
- Include a missing header (CI)
v5:
- Use page order increments where possible (Matt Brost).
- Fix a negated value of can_migrate_same_pagemap.
- Move removal of some dead code to a separate patch (Matt Brost).
- Remove an unnecessary zdd get() and put() (Matt Brost).

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c   | 184 +++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_migrate.c |   4 +-
 drivers/gpu/drm/xe/xe_svm.c     |  26 +++--
 drivers/gpu/drm/xe/xe_svm.h     |   1 +
 include/drm/drm_pagemap.h       |  19 +++-
 5 files changed, 187 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index d44372a80a90..09356d50b8d1 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -207,10 +207,12 @@ static void drm_pagemap_get_devmem_page(struct page *page,
 /**
  * drm_pagemap_migrate_map_pages() - Map migration pages for GPU SVM migration
  * @dev: The device for which the pages are being mapped
+ * @local_dpagemap: The drm_pagemap pointer of the local drm_pagemap.
  * @pagemap_addr: Array to store DMA information corresponding to mapped pages
  * @migrate_pfn: Array of migrate page frame numbers to map
  * @npages: Number of pages to map
  * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
+ * @mdetails: Details governing the migration behaviour.
  *
  * This function maps pages of memory for migration usage in GPU SVM. It
  * iterates over each page frame number provided in @migrate_pfn, maps the
@@ -220,12 +222,15 @@ static void drm_pagemap_get_devmem_page(struct page *page,
  * Returns: 0 on success, -EFAULT if an error occurs during mapping.
  */
 static int drm_pagemap_migrate_map_pages(struct device *dev,
+					 struct drm_pagemap *local_dpagemap,
 					 struct drm_pagemap_addr *pagemap_addr,
 					 unsigned long *migrate_pfn,
 					 unsigned long npages,
-					 enum dma_data_direction dir)
+					 enum dma_data_direction dir,
+					 const struct drm_pagemap_migrate_details *mdetails)
 {
 	unsigned long i;
+	unsigned long num_peer_pages = 0;
 
 	for (i = 0; i < npages;) {
 		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
@@ -236,31 +241,50 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
 		if (!page)
 			goto next;
 
-		if (WARN_ON_ONCE(is_zone_device_page(page)))
-			return -EFAULT;
-
 		folio = page_folio(page);
 		order = folio_order(folio);
 
-		dma_addr = dma_map_page(dev, page, 0, page_size(page), dir);
-		if (dma_mapping_error(dev, dma_addr))
-			return -EFAULT;
+		if (is_device_private_page(page)) {
+			struct drm_pagemap_zdd *zdd = page->zone_device_data;
+			struct drm_pagemap *dpagemap = zdd->dpagemap;
+			struct drm_pagemap_addr addr;
+
+			if (dpagemap == local_dpagemap && !mdetails->can_migrate_same_pagemap)
+				goto next;
 
-		pagemap_addr[i] =
-			drm_pagemap_addr_encode(dma_addr,
-						DRM_INTERCONNECT_SYSTEM,
-						order, dir);
+			num_peer_pages += NR_PAGES(order);
+			addr = dpagemap->ops->device_map(dpagemap, dev, page, order, dir);
+			if (dma_mapping_error(dev, addr.addr))
+				return -EFAULT;
+
+			pagemap_addr[i] = addr;
+		} else {
+			dma_addr = dma_map_page(dev, page, 0, page_size(page), dir);
+			if (dma_mapping_error(dev, dma_addr))
+				return -EFAULT;
+
+			pagemap_addr[i] =
+				drm_pagemap_addr_encode(dma_addr,
+							DRM_INTERCONNECT_SYSTEM,
+							order, dir);
+		}
 
 next:
 		i += NR_PAGES(order);
 	}
 
+	if (num_peer_pages)
+		drm_dbg(local_dpagemap->drm, "Migrating %lu peer pages over interconnect.\n",
+			num_peer_pages);
+
 	return 0;
 }
 
 /**
  * drm_pagemap_migrate_unmap_pages() - Unmap pages previously mapped for GPU SVM migration
  * @dev: The device for which the pages were mapped
+ * @migrate_pfn: Array of migrate pfns set up for the mapped pages. Used to
+ * determine the drm_pagemap of a peer device private page.
  * @pagemap_addr: Array of DMA information corresponding to mapped pages
  * @npages: Number of pages to unmap
  * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
@@ -271,16 +295,27 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
  */
 static void drm_pagemap_migrate_unmap_pages(struct device *dev,
 					    struct drm_pagemap_addr *pagemap_addr,
+					    unsigned long *migrate_pfn,
 					    unsigned long npages,
 					    enum dma_data_direction dir)
 {
 	unsigned long i;
 
 	for (i = 0; i < npages;) {
-		if (!pagemap_addr[i].addr || dma_mapping_error(dev, pagemap_addr[i].addr))
+		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
+
+		if (!page || !pagemap_addr[i].addr || dma_mapping_error(dev, pagemap_addr[i].addr))
 			goto next;
 
-		dma_unmap_page(dev, pagemap_addr[i].addr, PAGE_SIZE << pagemap_addr[i].order, dir);
+		if (is_zone_device_page(page)) {
+			struct drm_pagemap_zdd *zdd = page->zone_device_data;
+			struct drm_pagemap *dpagemap = zdd->dpagemap;
+
+			dpagemap->ops->device_unmap(dpagemap, dev, pagemap_addr[i]);
+		} else {
+			dma_unmap_page(dev, pagemap_addr[i].addr,
+				       PAGE_SIZE << pagemap_addr[i].order, dir);
+		}
 
 next:
 		i += NR_PAGES(pagemap_addr[i].order);
@@ -297,13 +332,12 @@ npages_in_range(unsigned long start, unsigned long end)
  * drm_pagemap_migrate_to_devmem() - Migrate a struct mm_struct range to device memory
  * @devmem_allocation: The device memory allocation to migrate to.
  * The caller should hold a reference to the device memory allocation,
- * and the reference is consumed by this function unless it returns with
+ * and the reference is consumed by this function even if it returns with
  * an error.
  * @mm: Pointer to the struct mm_struct.
  * @start: Start of the virtual address range to migrate.
  * @end: End of the virtual address range to migrate.
- * @timeslice_ms: The time requested for the migrated pagemap pages to
- * be present in @mm before being allowed to be migrated back.
+ * @mdetails: Details to govern the migration.
  *
  * This function migrates the specified virtual address range to device memory.
  * It performs the necessary setup and invokes the driver-specific operations for
@@ -321,7 +355,7 @@ npages_in_range(unsigned long start, unsigned long end)
 int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 				  struct mm_struct *mm,
 				  unsigned long start, unsigned long end,
-				  unsigned long timeslice_ms)
+				  const struct drm_pagemap_migrate_details *mdetails)
 {
 	const struct drm_pagemap_devmem_ops *ops = devmem_allocation->ops;
 	struct drm_pagemap *dpagemap = devmem_allocation->dpagemap;
@@ -330,9 +364,11 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		.start		= start,
 		.end		= end,
 		.pgmap_owner	= pagemap->owner,
-		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
+		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT |
+		(mdetails->source_peer_migrates ? 0 : MIGRATE_VMA_SELECT_DEVICE_PRIVATE),
 	};
 	unsigned long i, npages = npages_in_range(start, end);
+	unsigned long own_pages = 0, migrated_pages = 0;
 	struct vm_area_struct *vas;
 	struct drm_pagemap_zdd *zdd = NULL;
 	struct page **pages;
@@ -374,8 +410,10 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 	zdd = drm_pagemap_zdd_alloc(dpagemap);
 	if (!zdd) {
 		err = -ENOMEM;
-		goto err_free;
+		kvfree(buf);
+		goto err_out;
 	}
+	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
 
 	migrate.vma = vas;
 	migrate.src = buf;
@@ -386,35 +424,84 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		goto err_free;
 
 	if (!migrate.cpages) {
-		err = -EFAULT;
+		/* No pages to migrate. Raced or unknown device pages. */
+		err = -EBUSY;
 		goto err_free;
 	}
 
 	if (migrate.cpages != npages) {
+		/*
+		 * Some pages to migrate. But we want to migrate all or
+		 * nothing. Raced or unknown device pages.
+		 */
 		err = -EBUSY;
-		goto err_finalize;
+		goto err_aborted_migration;
+	}
+
+	/* Count device-private pages to migrate */
+	for (i = 0; i < npages;) {
+		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
+		unsigned long nr_pages = src_page ? NR_PAGES(folio_order(page_folio(src_page))) : 1;
+
+		if (src_page && is_zone_device_page(src_page)) {
+			if (page_pgmap(src_page) == pagemap)
+				own_pages += nr_pages;
+		}
+
+		i += nr_pages;
+	}
+
+	drm_dbg(dpagemap->drm, "Total pages %lu; Own pages: %lu.\n",
+		npages, own_pages);
+	if (own_pages == npages) {
+		err = 0;
+		drm_dbg(dpagemap->drm, "Migration wasn't necessary.\n");
+		goto err_aborted_migration;
+	} else if (own_pages && !mdetails->can_migrate_same_pagemap) {
+		err = -EBUSY;
+		drm_dbg(dpagemap->drm, "Migration aborted due to fragmentation.\n");
+		goto err_aborted_migration;
 	}
 
 	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
 	if (err)
 		goto err_finalize;
 
-	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, pagemap_addr,
-					    migrate.src, npages, DMA_TO_DEVICE);
+	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev,
+					    devmem_allocation->dpagemap, pagemap_addr,
+					    migrate.src, npages, DMA_TO_DEVICE,
+					    mdetails);
+
+	if (err) {
+		drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr,
+						migrate.src, npages, DMA_TO_DEVICE);
 
-	if (err)
 		goto err_finalize;
+	}
 
+	own_pages = 0;
 	for (i = 0; i < npages; ++i) {
 		struct page *page = pfn_to_page(migrate.dst[i]);
-
+		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
+
+		if (unlikely(src_page && is_zone_device_page(src_page) &&
+			     page_pgmap(src_page) == pagemap &&
+			     !mdetails->can_migrate_same_pagemap)) {
+			migrate.dst[i] = 0;
+			pages[i] = NULL;
+			own_pages++;
+			continue;
+		}
 		pages[i] = page;
 		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
 		drm_pagemap_get_devmem_page(page, zdd);
 	}
+	drm_WARN_ON(dpagemap->drm, !!own_pages);
 
 	err = ops->copy_to_devmem(pages, pagemap_addr, npages,
 				  devmem_allocation->pre_migrate_fence);
+	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr,
+					migrate.src, npages, DMA_TO_DEVICE);
 	if (err)
 		goto err_finalize;
 
@@ -423,21 +510,37 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 
 	/* Upon success bind devmem allocation to range and zdd */
 	devmem_allocation->timeslice_expiration = get_jiffies_64() +
-		msecs_to_jiffies(timeslice_ms);
-	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
+		msecs_to_jiffies(mdetails->timeslice_ms);
 
 err_finalize:
 	if (err)
 		drm_pagemap_migration_unlock_put_pages(npages, migrate.dst);
+err_aborted_migration:
 	migrate_vma_pages(&migrate);
+
+	for (i = 0; i < npages;) {
+		struct page *page = migrate_pfn_to_page(migrate.src[i]);
+		unsigned long nr_pages = page ? NR_PAGES(folio_order(page_folio(page))) : 1;
+
+		if (migrate.src[i] & MIGRATE_PFN_MIGRATE)
+			migrated_pages += nr_pages;
+
+		i += nr_pages;
+	}
+
+	if (!err && migrated_pages < npages - own_pages) {
+		drm_dbg(dpagemap->drm, "Raced while finalizing migration.\n");
+		err = -EBUSY;
+	}
+
 	migrate_vma_finalize(&migrate);
-	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, npages,
-					DMA_TO_DEVICE);
 err_free:
-	if (zdd)
-		drm_pagemap_zdd_put(zdd);
+	drm_pagemap_zdd_put(zdd);
 	kvfree(buf);
+	return err;
+
 err_out:
+	devmem_allocation->ops->devmem_release(devmem_allocation);
 	return err;
 }
 EXPORT_SYMBOL_GPL(drm_pagemap_migrate_to_devmem);
@@ -710,6 +813,7 @@ EXPORT_SYMBOL(drm_pagemap_put);
 int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 {
 	const struct drm_pagemap_devmem_ops *ops = devmem_allocation->ops;
+	struct drm_pagemap_migrate_details mdetails = {};
 	unsigned long npages, mpages = 0;
 	struct page **pages;
 	unsigned long *src, *dst;
@@ -748,8 +852,10 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	if (err || !mpages)
 		goto err_finalize;
 
-	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, pagemap_addr,
-					    dst, npages, DMA_FROM_DEVICE);
+	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev,
+					    devmem_allocation->dpagemap, pagemap_addr,
+					    dst, npages, DMA_FROM_DEVICE,
+					    &mdetails);
 	if (err)
 		goto err_finalize;
 
@@ -765,8 +871,9 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 		drm_pagemap_migration_unlock_put_pages(npages, dst);
 	migrate_device_pages(src, dst, npages);
 	migrate_device_finalize(src, dst, npages);
-	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, npages,
+	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, dst, npages,
 					DMA_FROM_DEVICE);
+
 err_free:
 	kvfree(buf);
 err_out:
@@ -809,6 +916,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
 		.fault_page	= page,
 	};
+	struct drm_pagemap_migrate_details mdetails = {};
 	struct drm_pagemap_zdd *zdd;
 	const struct drm_pagemap_devmem_ops *ops;
 	struct device *dev = NULL;
@@ -866,8 +974,8 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	if (err)
 		goto err_finalize;
 
-	err = drm_pagemap_migrate_map_pages(dev, pagemap_addr, migrate.dst, npages,
-					    DMA_FROM_DEVICE);
+	err = drm_pagemap_migrate_map_pages(dev, zdd->dpagemap, pagemap_addr, migrate.dst, npages,
+					    DMA_FROM_DEVICE, &mdetails);
 	if (err)
 		goto err_finalize;
 
@@ -884,8 +992,8 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	migrate_vma_pages(&migrate);
 	migrate_vma_finalize(&migrate);
 	if (dev)
-		drm_pagemap_migrate_unmap_pages(dev, pagemap_addr, npages,
-						DMA_FROM_DEVICE);
+		drm_pagemap_migrate_unmap_pages(dev, pagemap_addr, migrate.dst,
+						npages, DMA_FROM_DEVICE);
 err_free:
 	kvfree(buf);
 err_out:
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 284b575346ee..3de8ce2516e2 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -35,6 +35,7 @@
 #include "xe_sa.h"
 #include "xe_sched_job.h"
 #include "xe_sriov_vf_ccs.h"
+#include "xe_svm.h"
 #include "xe_sync.h"
 #include "xe_trace_bo.h"
 #include "xe_validation.h"
@@ -2048,7 +2049,8 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 			u64 pte;
 
 			xe_tile_assert(m->tile, sram_addr[i].proto ==
-				       DRM_INTERCONNECT_SYSTEM);
+				       DRM_INTERCONNECT_SYSTEM ||
+				       sram_addr[i].proto == XE_INTERCONNECT_P2P);
 			xe_tile_assert(m->tile, addr);
 			xe_tile_assert(m->tile, PAGE_ALIGNED(addr));
 
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index ed4afb386ba2..84ff99aa3e49 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1023,6 +1023,10 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 				      unsigned long timeslice_ms)
 {
 	struct xe_pagemap *xpagemap = container_of(dpagemap, typeof(*xpagemap), dpagemap);
+	struct drm_pagemap_migrate_details mdetails = {
+		.timeslice_ms = timeslice_ms,
+		.source_peer_migrates = 1,
+	};
 	struct xe_vram_region *vr = xe_pagemap_to_vr(xpagemap);
 	struct dma_fence *pre_migrate_fence = NULL;
 	struct xe_device *xe = vr->xe;
@@ -1074,10 +1078,9 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 
 		/* Ensure the device has a pm ref while there are device pages active. */
 		xe_pm_runtime_get_noresume(xe);
+		/* Consumes the devmem allocation ref. */
 		err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
-						    start, end, timeslice_ms);
-		if (err)
-			xe_svm_devmem_release(&bo->devmem_allocation);
+						    start, end, &mdetails);
 		xe_bo_unlock(bo);
 		xe_bo_put(bo);
 	}
@@ -1593,6 +1596,7 @@ int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *c
 	struct xe_vm *vm = range_to_vm(&range->base);
 	enum drm_gpusvm_scan_result migration_state;
 	struct xe_device *xe = vm->xe;
+	int err, retries = 1;
 
 	xe_assert(range_to_vm(&range->base)->xe, range->base.pages.flags.migrate_devmem);
 	range_debug(range, "ALLOCATE VRAM");
@@ -1611,10 +1615,18 @@ int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *c
 		drm_dbg(&xe->drm, "Request migration to device memory on \"%s\".\n",
 			dpagemap->drm->unique);
 
-	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
-				       xe_svm_range_end(range),
-				       range->base.gpusvm->mm,
-				       ctx->timeslice_ms);
+	do {
+		err = drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
+					      xe_svm_range_end(range),
+					      range->base.gpusvm->mm,
+					      ctx->timeslice_ms);
+
+		if (err == -EBUSY && retries)
+			drm_gpusvm_range_evict(range->base.gpusvm, &range->base);
+
+	} while (err == -EBUSY && retries--);
+
+	return err;
 }
 
 static struct drm_pagemap_addr
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 50e80bc892b6..b7b8eeacf196 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -205,6 +205,7 @@ struct xe_tile;
 struct xe_vram_region;
 
 #define XE_INTERCONNECT_VRAM 1
+#define XE_INTERCONNECT_P2P (XE_INTERCONNECT_VRAM + 1)
 
 struct xe_svm_range {
 	struct {
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index f73afece42ba..46e9c58f09e0 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -317,10 +317,27 @@ struct drm_pagemap_devmem {
 	struct dma_fence *pre_migrate_fence;
 };
 
+/**
+ * struct drm_pagemap_migrate_details - Details to govern migration.
+ * @timeslice_ms: The time requested for the migrated pagemap pages to
+ * be present in @mm before being allowed to be migrated back.
+ * @can_migrate_same_pagemap: Whether the copy function as indicated by
+ * the @source_peer_migrates flag, can migrate device pages within a
+ * single drm_pagemap.
+ * @source_peer_migrates: Whether on p2p migration, The source drm_pagemap
+ * should use the copy_to_ram() callback rather than the destination
+ * drm_pagemap should use the copy_to_devmem() callback.
+ */
+struct drm_pagemap_migrate_details {
+	unsigned long timeslice_ms;
+	u32 can_migrate_same_pagemap : 1;
+	u32 source_peer_migrates : 1;
+};
+
 int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 				  struct mm_struct *mm,
 				  unsigned long start, unsigned long end,
-				  unsigned long timeslice_ms);
+				  const struct drm_pagemap_migrate_details *mdetails);
 
 int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation);
 
-- 
2.51.1

