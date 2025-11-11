Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E22C4F194
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 17:45:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9632D10E61C;
	Tue, 11 Nov 2025 16:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VQ01SKP2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEEF10E61C;
 Tue, 11 Nov 2025 16:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762879522; x=1794415522;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pwbtpJTxphEzGH55wzvcZIiFQZdZfA/3D+ri+Plh64g=;
 b=VQ01SKP24RJHKiexUsVoBOLesAxt7K49RM76giauqfIWKUrbqbrwyx6g
 tx8S1myuZfRxHoHoop6TzXKq9XNfpVd9XDn/3/rLc4sIvcM3vkw2noD+h
 DQwFDjEBS8JpvXSqJYieRETZIzLHybHbFZ2ZgprsFibyNZTKwxLNofg0m
 J6QagUoBYKpVW3TiyzQ5ERa0ZwnvXT6w4uT1V5Uq91sFBuPvJx8VBJq26
 4Ke5F62WddYuHjXia09vPNR04EUAfIz6+hASfqhavFhShjsz3DnfshJxl
 T9Kbrt3E74zbvR0VWipNaGEmAWeO76f6edNFaHFLA+gLb5V7Uu4P7Raub w==;
X-CSE-ConnectionGUID: bbB3WexlS3KEITz3/Tbf1g==
X-CSE-MsgGUID: G2/w/ttdTJmSG7nboLRvjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75244789"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="75244789"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 08:45:22 -0800
X-CSE-ConnectionGUID: 9c+2qH3aR7adX7LStiDKTA==
X-CSE-MsgGUID: epDwYRXAQpGQCJ9Uy7BzyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="188647000"
Received: from rvuia-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 08:45:19 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v2 16/17] drm/pagemap,
 drm/xe: Support migration over interconnect
Date: Tue, 11 Nov 2025 17:44:06 +0100
Message-ID: <20251111164408.113070-17-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
References: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
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

Support migration over interconnect when migrating from
device-private pages with the same dev_pagemap owner.

Since we now also collect device-private pages to migrate,
also abort migration if the range to migrate is already
fully populated with pages from the desired pagemap.

Finally return -EBUSY from drm_pagemap_populate_mm()
if the migration can't be completed without first migrating all
pages in the range to system. It is expected that the caller
will perform that before retrying the call to
drm_pagemap_populate_mm().

Assume for now that the drm_pagemap implementation is *not*
capable of migrating data within the pagemap itself. This
restriction will be configurable in upcoming patches.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 177 +++++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_svm.c   |  20 ++--
 2 files changed, 143 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 1477a2057a15..e87676313ff9 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -210,6 +210,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
 /**
  * drm_pagemap_migrate_map_pages() - Map migration pages for GPU SVM migration
  * @dev: The device for which the pages are being mapped
+ * @local_dpagemap: The drm_pagemap pointer of the local drm_pagemap.
  * @pagemap_addr: Array to store DMA information corresponding to mapped pages
  * @migrate_pfn: Array of migrate page frame numbers to map
  * @npages: Number of pages to map
@@ -223,12 +224,14 @@ static void drm_pagemap_get_devmem_page(struct page *page,
  * Returns: 0 on success, -EFAULT if an error occurs during mapping.
  */
 static int drm_pagemap_migrate_map_pages(struct device *dev,
+					 struct drm_pagemap *local_dpagemap,
 					 struct drm_pagemap_addr *pagemap_addr,
 					 unsigned long *migrate_pfn,
 					 unsigned long npages,
 					 enum dma_data_direction dir)
 {
 	unsigned long i;
+	unsigned long num_peer_pages = 0;
 
 	for (i = 0; i < npages;) {
 		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
@@ -239,31 +242,48 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
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
+		if (is_zone_device_page(page)) {
+			struct drm_pagemap_zdd *zdd = page->zone_device_data;
+			struct drm_pagemap *dpagemap = zdd->dpagemap;
+			struct drm_pagemap_addr addr;
+
+			if (dpagemap == local_dpagemap)
+				goto next;
 
-		pagemap_addr[i] =
-			drm_pagemap_addr_encode(dma_addr,
-						DRM_INTERCONNECT_SYSTEM,
-						order, dir);
+			num_peer_pages += NR_PAGES(order);
+			addr = dpagemap->ops->device_map(dpagemap, dev, page, order, dir);
+			if (dma_mapping_error(dev, addr.addr))
+				return -EFAULT;
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
@@ -274,16 +294,27 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
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
@@ -308,6 +339,7 @@ npages_in_range(unsigned long start, unsigned long end)
  * @timeslice_ms: The time requested for the migrated pagemap pages to
  * be present in @mm before being allowed to be migrated back.
  * @pgmap_owner: Not used currently, since only system memory is considered.
+ * @mflags: Flags governing the migration.
  *
  * This function migrates the specified virtual address range to device memory.
  * It performs the necessary setup and invokes the driver-specific operations for
@@ -333,13 +365,18 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		.start		= start,
 		.end		= end,
 		.pgmap_owner	= pgmap_owner,
-		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
+		.flags		= MIGRATE_VMA_SELECT_SYSTEM |
+		MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
+		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
 	};
 	unsigned long i, npages = npages_in_range(start, end);
+	unsigned long own_pages = 0, migrated_pages = 0;
 	struct vm_area_struct *vas;
 	struct drm_pagemap_zdd *zdd = NULL;
 	struct page **pages;
 	struct drm_pagemap_addr *pagemap_addr;
+	struct drm_pagemap *dpagemap = devmem_allocation->dpagemap;
+	struct dev_pagemap *pagemap = dpagemap->pagemap;
 	void *buf;
 	int err;
 
@@ -374,11 +411,13 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 	pagemap_addr = buf + (2 * sizeof(*migrate.src) * npages);
 	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*pagemap_addr)) * npages;
 
-	zdd = drm_pagemap_zdd_alloc(devmem_allocation->dpagemap, pgmap_owner);
+	zdd = drm_pagemap_zdd_alloc(dpagemap, pgmap_owner);
 	if (!zdd) {
 		err = -ENOMEM;
-		goto err_free;
+		kvfree(buf);
+		goto err_out;
 	}
+	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
 
 	migrate.vma = vas;
 	migrate.src = buf;
@@ -389,54 +428,108 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
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
+	for (i = 0; i < npages; ++i) {
+		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
+
+		if (src_page && is_zone_device_page(src_page)) {
+			if (page_pgmap(src_page) == pagemap)
+				own_pages++;
+		}
+	}
+
+	drm_dbg(dpagemap->drm, "Total pages %lu; Own pages: %lu.\n",
+		npages, own_pages);
+	if (own_pages == npages) {
+		err = 0;
+		drm_dbg(dpagemap->drm, "Migration wasn't necessary.\n");
+		goto err_aborted_migration;
+	} else if (own_pages) {
+		err = -EBUSY;
+		drm_dbg(dpagemap->drm, "Migration aborted due to fragmentation.\n");
+		goto err_aborted_migration;
 	}
 
 	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
 	if (err)
 		goto err_finalize;
 
-	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, pagemap_addr,
+	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev,
+					    devmem_allocation->dpagemap, pagemap_addr,
 					    migrate.src, npages, DMA_TO_DEVICE);
 
-	if (err)
+	if (err) {
+		drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr,
+						migrate.src, npages, DMA_TO_DEVICE);
+
 		goto err_finalize;
+	}
 
+	own_pages = 0;
 	for (i = 0; i < npages; ++i) {
 		struct page *page = pfn_to_page(migrate.dst[i]);
+		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
 
+		if (unlikely(src_page && is_zone_device_page(src_page) &&
+			     page_pgmap(src_page) == pagemap)) {
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
 
 	err = ops->copy_to_devmem(pages, pagemap_addr, npages);
+	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr,
+					migrate.src, npages, DMA_TO_DEVICE);
 	if (err)
 		goto err_finalize;
 
 	/* Upon success bind devmem allocation to range and zdd */
 	devmem_allocation->timeslice_expiration = get_jiffies_64() +
 		msecs_to_jiffies(timeslice_ms);
-	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
 
 err_finalize:
 	if (err)
 		drm_pagemap_migration_unlock_put_pages(npages, migrate.dst);
+err_aborted_migration:
 	migrate_vma_pages(&migrate);
+
+	for (i = 0; i < npages; ++i)
+		if (migrate.src[i] & MIGRATE_PFN_MIGRATE)
+			migrated_pages++;
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
@@ -747,7 +840,8 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	if (err || !mpages)
 		goto err_finalize;
 
-	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, pagemap_addr,
+	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev,
+					    devmem_allocation->dpagemap, pagemap_addr,
 					    dst, npages, DMA_FROM_DEVICE);
 	if (err)
 		goto err_finalize;
@@ -764,7 +858,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 		drm_pagemap_migration_unlock_put_pages(npages, dst);
 	migrate_device_pages(src, dst, npages);
 	migrate_device_finalize(src, dst, npages);
-	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, npages,
+	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, dst, npages,
 					DMA_FROM_DEVICE);
 err_free:
 	kvfree(buf);
@@ -820,12 +914,10 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	void *buf;
 	int i, err = 0;
 
-	if (page) {
-		zdd = page->zone_device_data;
-		if (time_before64(get_jiffies_64(),
-				  zdd->devmem_allocation->timeslice_expiration))
-			return 0;
-	}
+	zdd = page->zone_device_data;
+	if (time_before64(get_jiffies_64(),
+			  zdd->devmem_allocation->timeslice_expiration))
+		return 0;
 
 	start = ALIGN_DOWN(fault_addr, size);
 	end = ALIGN(fault_addr + 1, size);
@@ -861,19 +953,6 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	if (!migrate.cpages)
 		goto err_free;
 
-	if (!page) {
-		for (i = 0; i < npages; ++i) {
-			if (!(migrate.src[i] & MIGRATE_PFN_MIGRATE))
-				continue;
-
-			page = migrate_pfn_to_page(migrate.src[i]);
-			break;
-		}
-
-		if (!page)
-			goto err_finalize;
-	}
-	zdd = page->zone_device_data;
 	ops = zdd->devmem_allocation->ops;
 	dev = zdd->devmem_allocation->dev;
 
@@ -883,7 +962,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	if (err)
 		goto err_finalize;
 
-	err = drm_pagemap_migrate_map_pages(dev, pagemap_addr, migrate.dst, npages,
+	err = drm_pagemap_migrate_map_pages(dev, zdd->dpagemap, pagemap_addr, migrate.dst, npages,
 					    DMA_FROM_DEVICE);
 	if (err)
 		goto err_finalize;
@@ -901,8 +980,8 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
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
@@ -938,10 +1017,12 @@ static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
 	struct drm_pagemap_zdd *zdd = vmf->page->zone_device_data;
 	int err;
 
+	drm_pagemap_zdd_get(zdd);
 	err = __drm_pagemap_migrate_to_ram(vmf->vma,
 					   zdd->device_private_page_owner,
 					   vmf->page, vmf->address,
 					   zdd->devmem_allocation->size);
+	drm_pagemap_zdd_put(zdd);
 
 	return err ? VM_FAULT_SIGBUS : 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 0b39905c9312..56bb3896b89a 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1028,11 +1028,10 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 
 		/* Ensure the device has a pm ref while there are device pages active. */
 		xe_pm_runtime_get_noresume(xe);
+		/* Consumes the devmem allocation. */
 		err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
 						    start, end, timeslice_ms,
 						    xpagemap->pagemap.owner);
-		if (err)
-			xe_svm_devmem_release(&bo->devmem_allocation);
 		xe_bo_unlock(bo);
 		xe_bo_put(bo);
 	}
@@ -1546,6 +1545,7 @@ int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *c
 		      struct drm_pagemap *dpagemap)
 {
 	struct xe_device *xe = range_to_vm(&range->base)->xe;
+	int err, retries = 1;
 
 	xe_assert(range_to_vm(&range->base)->xe, range->base.pages.flags.migrate_devmem);
 	range_debug(range, "ALLOCATE VRAM");
@@ -1554,10 +1554,18 @@ int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *c
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
-- 
2.51.1

