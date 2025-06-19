Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67412AE0798
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08DD10EA66;
	Thu, 19 Jun 2025 13:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IzP60Hfb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FE310EA60;
 Thu, 19 Jun 2025 13:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750340460; x=1781876460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FK8iPgxlJ4zgUvROxTJhmQD5YkO5yzuQ12Cl3B8/xFo=;
 b=IzP60Hfbwn/yBEaLF4pO0Pdo0sVYheOLTI3qM+LczhzIGpZ+qJgMbJ3c
 W1p9z586lZi1NR5E6V/1M61BtOth5NAww7R9FKvZncbmSQmzvxNwBL9y/
 4qflVnpvjc1jMUoO5HZsLrOaPGyte1R1afx/jpAARxVkqiccan6Zp6m+6
 //h/d6+2k0c2hRANKLFGfapx4zciPiQnRQFMFuXXTJv3UKe71HrQrk8KH
 RdXB60c2o4h0YXc0BtOoQoZcsrRnOPK1ku/j+obwe9vsYDBd82tiXHqBm
 6SCq/xamRdCcecYxZuqq+PbzmxjvKrPG43iwwq9RsYex4j+sI785A7rNJ A==;
X-CSE-ConnectionGUID: d24mFu6TQoiQslq1on1TQg==
X-CSE-MsgGUID: tlDw5DJVTTeCulfuROMWAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="62862131"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="62862131"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 06:40:59 -0700
X-CSE-ConnectionGUID: 1LYCp646QQGgMoV48cNw+w==
X-CSE-MsgGUID: ktFm8Hc+T7KHIG5IiKENKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="150247431"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 06:40:55 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 dri-devel@lists.freedesktop.org, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>,
 =?UTF-8?q?Felix=20K=C3=BChling?= <felix.kuehling@amd.com>,
 "Philip Yang" <philip.yang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v6 1/3] drm/gpusvm,
 drm/pagemap: Move migration functionality to drm_pagemap
Date: Thu, 19 Jun 2025 15:40:33 +0200
Message-ID: <20250619134035.170086-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619134035.170086-1-thomas.hellstrom@linux.intel.com>
References: <20250619134035.170086-1-thomas.hellstrom@linux.intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

The migration functionality and track-keeping of per-pagemap VRAM
mapped to the CPU mm is not per GPU_vm, but rather per pagemap.
This is also reflected by the functions not needing the drm_gpusvm
structures. So move to drm_pagemap.

With this, drm_gpusvm shouldn't really access the page zone-device-data
since its meaning is internal to drm_pagemap. Currently it's used to
reject mapping ranges backed by multiple drm_pagemap allocations.
For now, make the zone-device-data a void pointer.

Alter the interface of drm_gpusvm_migrate_to_devmem() to ensure we don't
pass a gpusvm pointer.

Rename CONFIG_DRM_XE_DEVMEM_MIRROR to CONFIG_DRM_XE_PAGEMAP.

Matt is listed as author of this commit since he wrote most of the code,
and it makes sense to retain his git authorship.
Thomas mostly moved the code around.

v3:
- Kerneldoc fixes (CI)
- Don't update documentation about how the drm_pagemap
  migration should be interpreted until upcoming
  patches where the functionality is implemented.
  (Matt Brost)
v4:
- More kerneldoc fixes around timeslice_ms
  (Himal Ghimiray, Matt Brost)
v6:
- Fix an uninitialized pagemap pointer (CI)

Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 Documentation/gpu/rfc/gpusvm.rst     |  12 +-
 drivers/gpu/drm/Makefile             |   6 +-
 drivers/gpu/drm/drm_gpusvm.c         | 761 +------------------------
 drivers/gpu/drm/drm_pagemap.c        | 794 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/Kconfig           |  10 +-
 drivers/gpu/drm/xe/xe_bo_types.h     |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h |   2 +-
 drivers/gpu/drm/xe/xe_svm.c          |  47 +-
 include/drm/drm_gpusvm.h             |  96 ----
 include/drm/drm_pagemap.h            | 101 ++++
 10 files changed, 958 insertions(+), 873 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_pagemap.c

diff --git a/Documentation/gpu/rfc/gpusvm.rst b/Documentation/gpu/rfc/gpusvm.rst
index bcf66a8137a6..469db1372f16 100644
--- a/Documentation/gpu/rfc/gpusvm.rst
+++ b/Documentation/gpu/rfc/gpusvm.rst
@@ -73,15 +73,21 @@ Overview of baseline design
 .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
    :doc: Locking
 
-.. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
-   :doc: Migration
-
 .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
    :doc: Partial Unmapping of Ranges
 
 .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
    :doc: Examples
 
+Overview of drm_pagemap design
+==============================
+
+.. kernel-doc:: drivers/gpu/drm/drm_pagemap.c
+   :doc: Overview
+
+.. kernel-doc:: drivers/gpu/drm/drm_pagemap.c
+   :doc: Migration
+
 Possible future design features
 ===============================
 
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 5050ac32bba2..4dafbdc8f86a 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -104,7 +104,11 @@ obj-$(CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS) += drm_panel_backlight_quirks.o
 #
 obj-$(CONFIG_DRM_EXEC) += drm_exec.o
 obj-$(CONFIG_DRM_GPUVM) += drm_gpuvm.o
-obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm.o
+
+drm_gpusvm_helper-y := \
+	drm_gpusvm.o\
+	drm_pagemap.o
+obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm_helper.o
 
 obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
 
diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index ab198645d90f..e454bb806c72 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -9,10 +9,9 @@
 #include <linux/dma-mapping.h>
 #include <linux/export.h>
 #include <linux/hmm.h>
+#include <linux/hugetlb_inline.h>
 #include <linux/memremap.h>
-#include <linux/migrate.h>
 #include <linux/mm_types.h>
-#include <linux/pagemap.h>
 #include <linux/slab.h>
 
 #include <drm/drm_device.h>
@@ -108,21 +107,6 @@
  * to add annotations to GPU SVM.
  */
 
-/**
- * DOC: Migration
- *
- * The migration support is quite simple, allowing migration between RAM and
- * device memory at the range granularity. For example, GPU SVM currently does
- * not support mixing RAM and device memory pages within a range. This means
- * that upon GPU fault, the entire range can be migrated to device memory, and
- * upon CPU fault, the entire range is migrated to RAM. Mixed RAM and device
- * memory storage within a range could be added in the future if required.
- *
- * The reasoning for only supporting range granularity is as follows: it
- * simplifies the implementation, and range sizes are driver-defined and should
- * be relatively small.
- */
-
 /**
  * DOC: Partial Unmapping of Ranges
  *
@@ -194,10 +178,10 @@
  *		if (driver_migration_policy(range)) {
  *			mmap_read_lock(mm);
  *			devmem = driver_alloc_devmem();
- *			err = drm_gpusvm_migrate_to_devmem(gpusvm, range,
- *							   devmem_allocation,
- *							   &ctx);
- *			mmap_read_unlock(mm);
+ *			err = drm_pagemap_migrate_to_devmem(devmem, gpusvm->mm, gpuva_start,
+ *                                                          gpuva_end, ctx->timeslice_ms,
+ *                                                          driver_pgmap_owner());
+ *                      mmap_read_unlock(mm);
  *			if (err)	// CPU mappings may have changed
  *				goto retry;
  *		}
@@ -289,97 +273,6 @@ npages_in_range(unsigned long start, unsigned long end)
 	return (end - start) >> PAGE_SHIFT;
 }
 
-/**
- * struct drm_gpusvm_zdd - GPU SVM zone device data
- *
- * @refcount: Reference count for the zdd
- * @devmem_allocation: device memory allocation
- * @device_private_page_owner: Device private pages owner
- *
- * This structure serves as a generic wrapper installed in
- * page->zone_device_data. It provides infrastructure for looking up a device
- * memory allocation upon CPU page fault and asynchronously releasing device
- * memory once the CPU has no page references. Asynchronous release is useful
- * because CPU page references can be dropped in IRQ contexts, while releasing
- * device memory likely requires sleeping locks.
- */
-struct drm_gpusvm_zdd {
-	struct kref refcount;
-	struct drm_gpusvm_devmem *devmem_allocation;
-	void *device_private_page_owner;
-};
-
-/**
- * drm_gpusvm_zdd_alloc() - Allocate a zdd structure.
- * @device_private_page_owner: Device private pages owner
- *
- * This function allocates and initializes a new zdd structure. It sets up the
- * reference count and initializes the destroy work.
- *
- * Return: Pointer to the allocated zdd on success, ERR_PTR() on failure.
- */
-static struct drm_gpusvm_zdd *
-drm_gpusvm_zdd_alloc(void *device_private_page_owner)
-{
-	struct drm_gpusvm_zdd *zdd;
-
-	zdd = kmalloc(sizeof(*zdd), GFP_KERNEL);
-	if (!zdd)
-		return NULL;
-
-	kref_init(&zdd->refcount);
-	zdd->devmem_allocation = NULL;
-	zdd->device_private_page_owner = device_private_page_owner;
-
-	return zdd;
-}
-
-/**
- * drm_gpusvm_zdd_get() - Get a reference to a zdd structure.
- * @zdd: Pointer to the zdd structure.
- *
- * This function increments the reference count of the provided zdd structure.
- *
- * Return: Pointer to the zdd structure.
- */
-static struct drm_gpusvm_zdd *drm_gpusvm_zdd_get(struct drm_gpusvm_zdd *zdd)
-{
-	kref_get(&zdd->refcount);
-	return zdd;
-}
-
-/**
- * drm_gpusvm_zdd_destroy() - Destroy a zdd structure.
- * @ref: Pointer to the reference count structure.
- *
- * This function queues the destroy_work of the zdd for asynchronous destruction.
- */
-static void drm_gpusvm_zdd_destroy(struct kref *ref)
-{
-	struct drm_gpusvm_zdd *zdd =
-		container_of(ref, struct drm_gpusvm_zdd, refcount);
-	struct drm_gpusvm_devmem *devmem = zdd->devmem_allocation;
-
-	if (devmem) {
-		complete_all(&devmem->detached);
-		if (devmem->ops->devmem_release)
-			devmem->ops->devmem_release(devmem);
-	}
-	kfree(zdd);
-}
-
-/**
- * drm_gpusvm_zdd_put() - Put a zdd reference.
- * @zdd: Pointer to the zdd structure.
- *
- * This function decrements the reference count of the provided zdd structure
- * and schedules its destruction if the count drops to zero.
- */
-static void drm_gpusvm_zdd_put(struct drm_gpusvm_zdd *zdd)
-{
-	kref_put(&zdd->refcount, drm_gpusvm_zdd_destroy);
-}
-
 /**
  * drm_gpusvm_range_find() - Find GPU SVM range from GPU SVM notifier
  * @notifier: Pointer to the GPU SVM notifier structure.
@@ -946,7 +839,7 @@ drm_gpusvm_range_chunk_size(struct drm_gpusvm *gpusvm,
 		 * process-many-malloc' fails. In the failure case, each process
 		 * mallocs 16k but the CPU VMA is ~128k which results in 64k SVM
 		 * ranges. When migrating the SVM ranges, some processes fail in
-		 * drm_gpusvm_migrate_to_devmem with 'migrate.cpages != npages'
+		 * drm_pagemap_migrate_to_devmem with 'migrate.cpages != npages'
 		 * and then upon drm_gpusvm_range_get_pages device pages from
 		 * other processes are collected + faulted in which creates all
 		 * sorts of problems. Unsure exactly how this happening, also
@@ -1364,7 +1257,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 		.dev_private_owner = gpusvm->device_private_page_owner,
 	};
 	struct mm_struct *mm = gpusvm->mm;
-	struct drm_gpusvm_zdd *zdd;
+	void *zdd;
 	unsigned long timeout =
 		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	unsigned long i, j;
@@ -1447,6 +1340,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 	}
 
 	zdd = NULL;
+	pagemap = NULL;
 	num_dma_mapped = 0;
 	for (i = 0, j = 0; i < npages; ++j) {
 		struct page *page = hmm_pfn_to_page(pfns[i]);
@@ -1466,7 +1360,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 				}
 
 				pagemap = page_pgmap(page);
-				dpagemap = zdd->devmem_allocation->dpagemap;
+				dpagemap = drm_pagemap_page_to_dpagemap(page);
 				if (drm_WARN_ON(gpusvm->drm, !dpagemap)) {
 					/*
 					 * Raced. This is not supposed to happen
@@ -1490,7 +1384,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 		} else {
 			dma_addr_t addr;
 
-			if (is_zone_device_page(page) || zdd) {
+			if (is_zone_device_page(page) || pagemap) {
 				err = -EOPNOTSUPP;
 				goto err_unmap;
 			}
@@ -1518,7 +1412,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 		flags.has_dma_mapping = true;
 	}
 
-	if (zdd) {
+	if (pagemap) {
 		flags.has_devmem_pages = true;
 		range->dpagemap = dpagemap;
 	}
@@ -1546,6 +1440,7 @@ EXPORT_SYMBOL_GPL(drm_gpusvm_range_get_pages);
 
 /**
  * drm_gpusvm_range_unmap_pages() - Unmap pages associated with a GPU SVM range
+ * drm_gpusvm_range_evict() - Evict GPU SVM range
  * @gpusvm: Pointer to the GPU SVM structure
  * @range: Pointer to the GPU SVM range structure
  * @ctx: GPU SVM context
@@ -1576,562 +1471,11 @@ void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_unmap_pages);
 
 /**
- * drm_gpusvm_migration_unlock_put_page() - Put a migration page
- * @page: Pointer to the page to put
- *
- * This function unlocks and puts a page.
- */
-static void drm_gpusvm_migration_unlock_put_page(struct page *page)
-{
-	unlock_page(page);
-	put_page(page);
-}
-
-/**
- * drm_gpusvm_migration_unlock_put_pages() - Put migration pages
- * @npages: Number of pages
- * @migrate_pfn: Array of migrate page frame numbers
- *
- * This function unlocks and puts an array of pages.
- */
-static void drm_gpusvm_migration_unlock_put_pages(unsigned long npages,
-						  unsigned long *migrate_pfn)
-{
-	unsigned long i;
-
-	for (i = 0; i < npages; ++i) {
-		struct page *page;
-
-		if (!migrate_pfn[i])
-			continue;
-
-		page = migrate_pfn_to_page(migrate_pfn[i]);
-		drm_gpusvm_migration_unlock_put_page(page);
-		migrate_pfn[i] = 0;
-	}
-}
-
-/**
- * drm_gpusvm_get_devmem_page() - Get a reference to a device memory page
- * @page: Pointer to the page
- * @zdd: Pointer to the GPU SVM zone device data
- *
- * This function associates the given page with the specified GPU SVM zone
- * device data and initializes it for zone device usage.
- */
-static void drm_gpusvm_get_devmem_page(struct page *page,
-				       struct drm_gpusvm_zdd *zdd)
-{
-	page->zone_device_data = drm_gpusvm_zdd_get(zdd);
-	zone_device_page_init(page);
-}
-
-/**
- * drm_gpusvm_migrate_map_pages() - Map migration pages for GPU SVM migration
- * @dev: The device for which the pages are being mapped
- * @dma_addr: Array to store DMA addresses corresponding to mapped pages
- * @migrate_pfn: Array of migrate page frame numbers to map
- * @npages: Number of pages to map
- * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
- *
- * This function maps pages of memory for migration usage in GPU SVM. It
- * iterates over each page frame number provided in @migrate_pfn, maps the
- * corresponding page, and stores the DMA address in the provided @dma_addr
- * array.
- *
- * Return: 0 on success, -EFAULT if an error occurs during mapping.
- */
-static int drm_gpusvm_migrate_map_pages(struct device *dev,
-					dma_addr_t *dma_addr,
-					unsigned long *migrate_pfn,
-					unsigned long npages,
-					enum dma_data_direction dir)
-{
-	unsigned long i;
-
-	for (i = 0; i < npages; ++i) {
-		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
-
-		if (!page)
-			continue;
-
-		if (WARN_ON_ONCE(is_zone_device_page(page)))
-			return -EFAULT;
-
-		dma_addr[i] = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
-		if (dma_mapping_error(dev, dma_addr[i]))
-			return -EFAULT;
-	}
-
-	return 0;
-}
-
-/**
- * drm_gpusvm_migrate_unmap_pages() - Unmap pages previously mapped for GPU SVM migration
- * @dev: The device for which the pages were mapped
- * @dma_addr: Array of DMA addresses corresponding to mapped pages
- * @npages: Number of pages to unmap
- * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
- *
- * This function unmaps previously mapped pages of memory for GPU Shared Virtual
- * Memory (SVM). It iterates over each DMA address provided in @dma_addr, checks
- * if it's valid and not already unmapped, and unmaps the corresponding page.
- */
-static void drm_gpusvm_migrate_unmap_pages(struct device *dev,
-					   dma_addr_t *dma_addr,
-					   unsigned long npages,
-					   enum dma_data_direction dir)
-{
-	unsigned long i;
-
-	for (i = 0; i < npages; ++i) {
-		if (!dma_addr[i] || dma_mapping_error(dev, dma_addr[i]))
-			continue;
-
-		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE, dir);
-	}
-}
-
-/**
- * drm_gpusvm_migrate_to_devmem() - Migrate GPU SVM range to device memory
+ * drm_gpusvm_range_evict() - Evict GPU SVM range
  * @gpusvm: Pointer to the GPU SVM structure
- * @range: Pointer to the GPU SVM range structure
- * @devmem_allocation: Pointer to the device memory allocation. The caller
- *                     should hold a reference to the device memory allocation,
- *                     which should be dropped via ops->devmem_release or upon
- *                     the failure of this function.
- * @ctx: GPU SVM context
- *
- * This function migrates the specified GPU SVM range to device memory. It
- * performs the necessary setup and invokes the driver-specific operations for
- * migration to device memory. Upon successful return, @devmem_allocation can
- * safely reference @range until ops->devmem_release is called which only upon
- * successful return. Expected to be called while holding the mmap lock in read
- * mode.
- *
- * Return: 0 on success, negative error code on failure.
- */
-int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
-				 struct drm_gpusvm_range *range,
-				 struct drm_gpusvm_devmem *devmem_allocation,
-				 const struct drm_gpusvm_ctx *ctx)
-{
-	const struct drm_gpusvm_devmem_ops *ops = devmem_allocation->ops;
-	unsigned long start = drm_gpusvm_range_start(range),
-		      end = drm_gpusvm_range_end(range);
-	struct migrate_vma migrate = {
-		.start		= start,
-		.end		= end,
-		.pgmap_owner	= gpusvm->device_private_page_owner,
-		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
-	};
-	struct mm_struct *mm = gpusvm->mm;
-	unsigned long i, npages = npages_in_range(start, end);
-	struct vm_area_struct *vas;
-	struct drm_gpusvm_zdd *zdd = NULL;
-	struct page **pages;
-	dma_addr_t *dma_addr;
-	void *buf;
-	int err;
-
-	mmap_assert_locked(gpusvm->mm);
-
-	if (!range->flags.migrate_devmem)
-		return -EINVAL;
-
-	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
-	    !ops->copy_to_ram)
-		return -EOPNOTSUPP;
-
-	vas = vma_lookup(mm, start);
-	if (!vas) {
-		err = -ENOENT;
-		goto err_out;
-	}
-
-	if (end > vas->vm_end || start < vas->vm_start) {
-		err = -EINVAL;
-		goto err_out;
-	}
-
-	if (!vma_is_anonymous(vas)) {
-		err = -EBUSY;
-		goto err_out;
-	}
-
-	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
-		       sizeof(*pages), GFP_KERNEL);
-	if (!buf) {
-		err = -ENOMEM;
-		goto err_out;
-	}
-	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
-	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
-
-	zdd = drm_gpusvm_zdd_alloc(gpusvm->device_private_page_owner);
-	if (!zdd) {
-		err = -ENOMEM;
-		goto err_free;
-	}
-
-	migrate.vma = vas;
-	migrate.src = buf;
-	migrate.dst = migrate.src + npages;
-
-	err = migrate_vma_setup(&migrate);
-	if (err)
-		goto err_free;
-
-	if (!migrate.cpages) {
-		err = -EFAULT;
-		goto err_free;
-	}
-
-	if (migrate.cpages != npages) {
-		err = -EBUSY;
-		goto err_finalize;
-	}
-
-	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
-	if (err)
-		goto err_finalize;
-
-	err = drm_gpusvm_migrate_map_pages(devmem_allocation->dev, dma_addr,
-					   migrate.src, npages, DMA_TO_DEVICE);
-	if (err)
-		goto err_finalize;
-
-	for (i = 0; i < npages; ++i) {
-		struct page *page = pfn_to_page(migrate.dst[i]);
-
-		pages[i] = page;
-		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
-		drm_gpusvm_get_devmem_page(page, zdd);
-	}
-
-	err = ops->copy_to_devmem(pages, dma_addr, npages);
-	if (err)
-		goto err_finalize;
-
-	/* Upon success bind devmem allocation to range and zdd */
-	devmem_allocation->timeslice_expiration = get_jiffies_64() +
-		msecs_to_jiffies(ctx->timeslice_ms);
-	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
-
-err_finalize:
-	if (err)
-		drm_gpusvm_migration_unlock_put_pages(npages, migrate.dst);
-	migrate_vma_pages(&migrate);
-	migrate_vma_finalize(&migrate);
-	drm_gpusvm_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
-				       DMA_TO_DEVICE);
-err_free:
-	if (zdd)
-		drm_gpusvm_zdd_put(zdd);
-	kvfree(buf);
-err_out:
-	return err;
-}
-EXPORT_SYMBOL_GPL(drm_gpusvm_migrate_to_devmem);
-
-/**
- * drm_gpusvm_migrate_populate_ram_pfn() - Populate RAM PFNs for a VM area
- * @vas: Pointer to the VM area structure, can be NULL
- * @fault_page: Fault page
- * @npages: Number of pages to populate
- * @mpages: Number of pages to migrate
- * @src_mpfn: Source array of migrate PFNs
- * @mpfn: Array of migrate PFNs to populate
- * @addr: Start address for PFN allocation
- *
- * This function populates the RAM migrate page frame numbers (PFNs) for the
- * specified VM area structure. It allocates and locks pages in the VM area for
- * RAM usage. If vas is non-NULL use alloc_page_vma for allocation, if NULL use
- * alloc_page for allocation.
- *
- * Return: 0 on success, negative error code on failure.
- */
-static int drm_gpusvm_migrate_populate_ram_pfn(struct vm_area_struct *vas,
-					       struct page *fault_page,
-					       unsigned long npages,
-					       unsigned long *mpages,
-					       unsigned long *src_mpfn,
-					       unsigned long *mpfn,
-					       unsigned long addr)
-{
-	unsigned long i;
-
-	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
-		struct page *page, *src_page;
-
-		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
-			continue;
-
-		src_page = migrate_pfn_to_page(src_mpfn[i]);
-		if (!src_page)
-			continue;
-
-		if (fault_page) {
-			if (src_page->zone_device_data !=
-			    fault_page->zone_device_data)
-				continue;
-		}
-
-		if (vas)
-			page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
-		else
-			page = alloc_page(GFP_HIGHUSER);
-
-		if (!page)
-			goto free_pages;
-
-		mpfn[i] = migrate_pfn(page_to_pfn(page));
-	}
-
-	for (i = 0; i < npages; ++i) {
-		struct page *page = migrate_pfn_to_page(mpfn[i]);
-
-		if (!page)
-			continue;
-
-		WARN_ON_ONCE(!trylock_page(page));
-		++*mpages;
-	}
-
-	return 0;
-
-free_pages:
-	for (i = 0; i < npages; ++i) {
-		struct page *page = migrate_pfn_to_page(mpfn[i]);
-
-		if (!page)
-			continue;
-
-		put_page(page);
-		mpfn[i] = 0;
-	}
-	return -ENOMEM;
-}
-
-/**
- * drm_gpusvm_evict_to_ram() - Evict GPU SVM range to RAM
- * @devmem_allocation: Pointer to the device memory allocation
- *
- * Similar to __drm_gpusvm_migrate_to_ram but does not require mmap lock and
- * migration done via migrate_device_* functions.
- *
- * Return: 0 on success, negative error code on failure.
- */
-int drm_gpusvm_evict_to_ram(struct drm_gpusvm_devmem *devmem_allocation)
-{
-	const struct drm_gpusvm_devmem_ops *ops = devmem_allocation->ops;
-	unsigned long npages, mpages = 0;
-	struct page **pages;
-	unsigned long *src, *dst;
-	dma_addr_t *dma_addr;
-	void *buf;
-	int i, err = 0;
-	unsigned int retry_count = 2;
-
-	npages = devmem_allocation->size >> PAGE_SHIFT;
-
-retry:
-	if (!mmget_not_zero(devmem_allocation->mm))
-		return -EFAULT;
-
-	buf = kvcalloc(npages, 2 * sizeof(*src) + sizeof(*dma_addr) +
-		       sizeof(*pages), GFP_KERNEL);
-	if (!buf) {
-		err = -ENOMEM;
-		goto err_out;
-	}
-	src = buf;
-	dst = buf + (sizeof(*src) * npages);
-	dma_addr = buf + (2 * sizeof(*src) * npages);
-	pages = buf + (2 * sizeof(*src) + sizeof(*dma_addr)) * npages;
-
-	err = ops->populate_devmem_pfn(devmem_allocation, npages, src);
-	if (err)
-		goto err_free;
-
-	err = migrate_device_pfns(src, npages);
-	if (err)
-		goto err_free;
-
-	err = drm_gpusvm_migrate_populate_ram_pfn(NULL, NULL, npages, &mpages,
-						  src, dst, 0);
-	if (err || !mpages)
-		goto err_finalize;
-
-	err = drm_gpusvm_migrate_map_pages(devmem_allocation->dev, dma_addr,
-					   dst, npages, DMA_FROM_DEVICE);
-	if (err)
-		goto err_finalize;
-
-	for (i = 0; i < npages; ++i)
-		pages[i] = migrate_pfn_to_page(src[i]);
-
-	err = ops->copy_to_ram(pages, dma_addr, npages);
-	if (err)
-		goto err_finalize;
-
-err_finalize:
-	if (err)
-		drm_gpusvm_migration_unlock_put_pages(npages, dst);
-	migrate_device_pages(src, dst, npages);
-	migrate_device_finalize(src, dst, npages);
-	drm_gpusvm_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
-				       DMA_FROM_DEVICE);
-err_free:
-	kvfree(buf);
-err_out:
-	mmput_async(devmem_allocation->mm);
-
-	if (completion_done(&devmem_allocation->detached))
-		return 0;
-
-	if (retry_count--) {
-		cond_resched();
-		goto retry;
-	}
-
-	return err ?: -EBUSY;
-}
-EXPORT_SYMBOL_GPL(drm_gpusvm_evict_to_ram);
-
-/**
- * __drm_gpusvm_migrate_to_ram() - Migrate GPU SVM range to RAM (internal)
- * @vas: Pointer to the VM area structure
- * @device_private_page_owner: Device private pages owner
- * @page: Pointer to the page for fault handling (can be NULL)
- * @fault_addr: Fault address
- * @size: Size of migration
- *
- * This internal function performs the migration of the specified GPU SVM range
- * to RAM. It sets up the migration, populates + dma maps RAM PFNs, and
- * invokes the driver-specific operations for migration to RAM.
- *
- * Return: 0 on success, negative error code on failure.
- */
-static int __drm_gpusvm_migrate_to_ram(struct vm_area_struct *vas,
-				       void *device_private_page_owner,
-				       struct page *page,
-				       unsigned long fault_addr,
-				       unsigned long size)
-{
-	struct migrate_vma migrate = {
-		.vma		= vas,
-		.pgmap_owner	= device_private_page_owner,
-		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
-			MIGRATE_VMA_SELECT_DEVICE_COHERENT,
-		.fault_page	= page,
-	};
-	struct drm_gpusvm_zdd *zdd;
-	const struct drm_gpusvm_devmem_ops *ops;
-	struct device *dev = NULL;
-	unsigned long npages, mpages = 0;
-	struct page **pages;
-	dma_addr_t *dma_addr;
-	unsigned long start, end;
-	void *buf;
-	int i, err = 0;
-
-	if (page) {
-		zdd = page->zone_device_data;
-		if (time_before64(get_jiffies_64(),
-				  zdd->devmem_allocation->timeslice_expiration))
-			return 0;
-	}
-
-	start = ALIGN_DOWN(fault_addr, size);
-	end = ALIGN(fault_addr + 1, size);
-
-	/* Corner where VMA area struct has been partially unmapped */
-	if (start < vas->vm_start)
-		start = vas->vm_start;
-	if (end > vas->vm_end)
-		end = vas->vm_end;
-
-	migrate.start = start;
-	migrate.end = end;
-	npages = npages_in_range(start, end);
-
-	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
-		       sizeof(*pages), GFP_KERNEL);
-	if (!buf) {
-		err = -ENOMEM;
-		goto err_out;
-	}
-	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
-	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
-
-	migrate.vma = vas;
-	migrate.src = buf;
-	migrate.dst = migrate.src + npages;
-
-	err = migrate_vma_setup(&migrate);
-	if (err)
-		goto err_free;
-
-	/* Raced with another CPU fault, nothing to do */
-	if (!migrate.cpages)
-		goto err_free;
-
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
-	ops = zdd->devmem_allocation->ops;
-	dev = zdd->devmem_allocation->dev;
-
-	err = drm_gpusvm_migrate_populate_ram_pfn(vas, page, npages, &mpages,
-						  migrate.src, migrate.dst,
-						  start);
-	if (err)
-		goto err_finalize;
-
-	err = drm_gpusvm_migrate_map_pages(dev, dma_addr, migrate.dst, npages,
-					   DMA_FROM_DEVICE);
-	if (err)
-		goto err_finalize;
-
-	for (i = 0; i < npages; ++i)
-		pages[i] = migrate_pfn_to_page(migrate.src[i]);
-
-	err = ops->copy_to_ram(pages, dma_addr, npages);
-	if (err)
-		goto err_finalize;
-
-err_finalize:
-	if (err)
-		drm_gpusvm_migration_unlock_put_pages(npages, migrate.dst);
-	migrate_vma_pages(&migrate);
-	migrate_vma_finalize(&migrate);
-	if (dev)
-		drm_gpusvm_migrate_unmap_pages(dev, dma_addr, npages,
-					       DMA_FROM_DEVICE);
-err_free:
-	kvfree(buf);
-err_out:
-
-	return err;
-}
-
-/**
- * drm_gpusvm_range_evict - Evict GPU SVM range
  * @range: Pointer to the GPU SVM range to be removed
  *
- * This function evicts the specified GPU SVM range. This function will not
- * evict coherent pages.
+ * This function evicts the specified GPU SVM range.
  *
  * Return: 0 on success, a negative error code on failure.
  */
@@ -2183,60 +1527,6 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_evict);
 
-/**
- * drm_gpusvm_page_free() - Put GPU SVM zone device data associated with a page
- * @page: Pointer to the page
- *
- * This function is a callback used to put the GPU SVM zone device data
- * associated with a page when it is being released.
- */
-static void drm_gpusvm_page_free(struct page *page)
-{
-	drm_gpusvm_zdd_put(page->zone_device_data);
-}
-
-/**
- * drm_gpusvm_migrate_to_ram() - Migrate GPU SVM range to RAM (page fault handler)
- * @vmf: Pointer to the fault information structure
- *
- * This function is a page fault handler used to migrate a GPU SVM range to RAM.
- * It retrieves the GPU SVM range information from the faulting page and invokes
- * the internal migration function to migrate the range back to RAM.
- *
- * Return: VM_FAULT_SIGBUS on failure, 0 on success.
- */
-static vm_fault_t drm_gpusvm_migrate_to_ram(struct vm_fault *vmf)
-{
-	struct drm_gpusvm_zdd *zdd = vmf->page->zone_device_data;
-	int err;
-
-	err = __drm_gpusvm_migrate_to_ram(vmf->vma,
-					  zdd->device_private_page_owner,
-					  vmf->page, vmf->address,
-					  zdd->devmem_allocation->size);
-
-	return err ? VM_FAULT_SIGBUS : 0;
-}
-
-/*
- * drm_gpusvm_pagemap_ops - Device page map operations for GPU SVM
- */
-static const struct dev_pagemap_ops drm_gpusvm_pagemap_ops = {
-	.page_free = drm_gpusvm_page_free,
-	.migrate_to_ram = drm_gpusvm_migrate_to_ram,
-};
-
-/**
- * drm_gpusvm_pagemap_ops_get() - Retrieve GPU SVM device page map operations
- *
- * Return: Pointer to the GPU SVM device page map operations structure.
- */
-const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void)
-{
-	return &drm_gpusvm_pagemap_ops;
-}
-EXPORT_SYMBOL_GPL(drm_gpusvm_pagemap_ops_get);
-
 /**
  * drm_gpusvm_has_mapping() - Check if GPU SVM has mapping for the given address range
  * @gpusvm: Pointer to the GPU SVM structure.
@@ -2281,28 +1571,5 @@ void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_set_unmapped);
 
-/**
- * drm_gpusvm_devmem_init() - Initialize a GPU SVM device memory allocation
- *
- * @dev: Pointer to the device structure which device memory allocation belongs to
- * @mm: Pointer to the mm_struct for the address space
- * @ops: Pointer to the operations structure for GPU SVM device memory
- * @dpagemap: The struct drm_pagemap we're allocating from.
- * @size: Size of device memory allocation
- */
-void drm_gpusvm_devmem_init(struct drm_gpusvm_devmem *devmem_allocation,
-			    struct device *dev, struct mm_struct *mm,
-			    const struct drm_gpusvm_devmem_ops *ops,
-			    struct drm_pagemap *dpagemap, size_t size)
-{
-	init_completion(&devmem_allocation->detached);
-	devmem_allocation->dev = dev;
-	devmem_allocation->mm = mm;
-	devmem_allocation->ops = ops;
-	devmem_allocation->dpagemap = dpagemap;
-	devmem_allocation->size = size;
-}
-EXPORT_SYMBOL_GPL(drm_gpusvm_devmem_init);
-
 MODULE_DESCRIPTION("DRM GPUSVM");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
new file mode 100644
index 000000000000..cef4657b6e8a
--- /dev/null
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -0,0 +1,794 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright © 2024-2025 Intel Corporation
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/migrate.h>
+#include <linux/pagemap.h>
+#include <drm/drm_pagemap.h>
+
+/**
+ * DOC: Overview
+ *
+ * The DRM pagemap layer is intended to augment the dev_pagemap functionality by
+ * providing a way to populate a struct mm_struct virtual range with device
+ * private pages and to provide helpers to abstract device memory allocations,
+ * to migrate memory back and forth between device memory and system RAM and
+ * to handle access (and in the future migration) between devices implementing
+ * a fast interconnect that is not necessarily visible to the rest of the
+ * system.
+ *
+ * Typically the DRM pagemap receives requests from one or more DRM GPU SVM
+ * instances to populate struct mm_struct virtual ranges with memory.
+ */
+
+/**
+ * DOC: Migration
+ *
+ * The migration support is quite simple, allowing migration between RAM and
+ * device memory at the range granularity. For example, GPU SVM currently does
+ * not support mixing RAM and device memory pages within a range. This means
+ * that upon GPU fault, the entire range can be migrated to device memory, and
+ * upon CPU fault, the entire range is migrated to RAM. Mixed RAM and device
+ * memory storage within a range could be added in the future if required.
+ *
+ * The reasoning for only supporting range granularity is as follows: it
+ * simplifies the implementation, and range sizes are driver-defined and should
+ * be relatively small.
+ *
+ *
+ * Key DRM pagemap components:
+ *
+ * - Device Memory Allocations:
+ *      Embedded structure containing enough information for the drm_pagemap to
+ *      migrate to / from device memory.
+ *
+ * - Device Memory Operations:
+ *      Define the interface for driver-specific device memory operations
+ *      release memory, populate pfns, and copy to / from device memory.
+ */
+
+/**
+ * struct drm_pagemap_zdd - GPU SVM zone device data
+ *
+ * @refcount: Reference count for the zdd
+ * @devmem_allocation: device memory allocation
+ * @device_private_page_owner: Device private pages owner
+ *
+ * This structure serves as a generic wrapper installed in
+ * page->zone_device_data. It provides infrastructure for looking up a device
+ * memory allocation upon CPU page fault and asynchronously releasing device
+ * memory once the CPU has no page references. Asynchronous release is useful
+ * because CPU page references can be dropped in IRQ contexts, while releasing
+ * device memory likely requires sleeping locks.
+ */
+struct drm_pagemap_zdd {
+	struct kref refcount;
+	struct drm_pagemap_devmem *devmem_allocation;
+	void *device_private_page_owner;
+};
+
+/**
+ * drm_pagemap_zdd_alloc() - Allocate a zdd structure.
+ * @device_private_page_owner: Device private pages owner
+ *
+ * This function allocates and initializes a new zdd structure. It sets up the
+ * reference count and initializes the destroy work.
+ *
+ * Return: Pointer to the allocated zdd on success, ERR_PTR() on failure.
+ */
+static struct drm_pagemap_zdd *
+drm_pagemap_zdd_alloc(void *device_private_page_owner)
+{
+	struct drm_pagemap_zdd *zdd;
+
+	zdd = kmalloc(sizeof(*zdd), GFP_KERNEL);
+	if (!zdd)
+		return NULL;
+
+	kref_init(&zdd->refcount);
+	zdd->devmem_allocation = NULL;
+	zdd->device_private_page_owner = device_private_page_owner;
+
+	return zdd;
+}
+
+/**
+ * drm_pagemap_zdd_get() - Get a reference to a zdd structure.
+ * @zdd: Pointer to the zdd structure.
+ *
+ * This function increments the reference count of the provided zdd structure.
+ *
+ * Return: Pointer to the zdd structure.
+ */
+static struct drm_pagemap_zdd *drm_pagemap_zdd_get(struct drm_pagemap_zdd *zdd)
+{
+	kref_get(&zdd->refcount);
+	return zdd;
+}
+
+/**
+ * drm_pagemap_zdd_destroy() - Destroy a zdd structure.
+ * @ref: Pointer to the reference count structure.
+ *
+ * This function queues the destroy_work of the zdd for asynchronous destruction.
+ */
+static void drm_pagemap_zdd_destroy(struct kref *ref)
+{
+	struct drm_pagemap_zdd *zdd =
+		container_of(ref, struct drm_pagemap_zdd, refcount);
+	struct drm_pagemap_devmem *devmem = zdd->devmem_allocation;
+
+	if (devmem) {
+		complete_all(&devmem->detached);
+		if (devmem->ops->devmem_release)
+			devmem->ops->devmem_release(devmem);
+	}
+	kfree(zdd);
+}
+
+/**
+ * drm_pagemap_zdd_put() - Put a zdd reference.
+ * @zdd: Pointer to the zdd structure.
+ *
+ * This function decrements the reference count of the provided zdd structure
+ * and schedules its destruction if the count drops to zero.
+ */
+static void drm_pagemap_zdd_put(struct drm_pagemap_zdd *zdd)
+{
+	kref_put(&zdd->refcount, drm_pagemap_zdd_destroy);
+}
+
+/**
+ * drm_pagemap_migration_unlock_put_page() - Put a migration page
+ * @page: Pointer to the page to put
+ *
+ * This function unlocks and puts a page.
+ */
+static void drm_pagemap_migration_unlock_put_page(struct page *page)
+{
+	unlock_page(page);
+	put_page(page);
+}
+
+/**
+ * drm_pagemap_migration_unlock_put_pages() - Put migration pages
+ * @npages: Number of pages
+ * @migrate_pfn: Array of migrate page frame numbers
+ *
+ * This function unlocks and puts an array of pages.
+ */
+static void drm_pagemap_migration_unlock_put_pages(unsigned long npages,
+						   unsigned long *migrate_pfn)
+{
+	unsigned long i;
+
+	for (i = 0; i < npages; ++i) {
+		struct page *page;
+
+		if (!migrate_pfn[i])
+			continue;
+
+		page = migrate_pfn_to_page(migrate_pfn[i]);
+		drm_pagemap_migration_unlock_put_page(page);
+		migrate_pfn[i] = 0;
+	}
+}
+
+/**
+ * drm_pagemap_get_devmem_page() - Get a reference to a device memory page
+ * @page: Pointer to the page
+ * @zdd: Pointer to the GPU SVM zone device data
+ *
+ * This function associates the given page with the specified GPU SVM zone
+ * device data and initializes it for zone device usage.
+ */
+static void drm_pagemap_get_devmem_page(struct page *page,
+					struct drm_pagemap_zdd *zdd)
+{
+	page->zone_device_data = drm_pagemap_zdd_get(zdd);
+	zone_device_page_init(page);
+}
+
+/**
+ * drm_pagemap_migrate_map_pages() - Map migration pages for GPU SVM migration
+ * @dev: The device for which the pages are being mapped
+ * @dma_addr: Array to store DMA addresses corresponding to mapped pages
+ * @migrate_pfn: Array of migrate page frame numbers to map
+ * @npages: Number of pages to map
+ * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
+ *
+ * This function maps pages of memory for migration usage in GPU SVM. It
+ * iterates over each page frame number provided in @migrate_pfn, maps the
+ * corresponding page, and stores the DMA address in the provided @dma_addr
+ * array.
+ *
+ * Returns: 0 on success, -EFAULT if an error occurs during mapping.
+ */
+static int drm_pagemap_migrate_map_pages(struct device *dev,
+					 dma_addr_t *dma_addr,
+					 unsigned long *migrate_pfn,
+					 unsigned long npages,
+					 enum dma_data_direction dir)
+{
+	unsigned long i;
+
+	for (i = 0; i < npages; ++i) {
+		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
+
+		if (!page)
+			continue;
+
+		if (WARN_ON_ONCE(is_zone_device_page(page)))
+			return -EFAULT;
+
+		dma_addr[i] = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
+		if (dma_mapping_error(dev, dma_addr[i]))
+			return -EFAULT;
+	}
+
+	return 0;
+}
+
+/**
+ * drm_pagemap_migrate_unmap_pages() - Unmap pages previously mapped for GPU SVM migration
+ * @dev: The device for which the pages were mapped
+ * @dma_addr: Array of DMA addresses corresponding to mapped pages
+ * @npages: Number of pages to unmap
+ * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
+ *
+ * This function unmaps previously mapped pages of memory for GPU Shared Virtual
+ * Memory (SVM). It iterates over each DMA address provided in @dma_addr, checks
+ * if it's valid and not already unmapped, and unmaps the corresponding page.
+ */
+static void drm_pagemap_migrate_unmap_pages(struct device *dev,
+					    dma_addr_t *dma_addr,
+					    unsigned long npages,
+					    enum dma_data_direction dir)
+{
+	unsigned long i;
+
+	for (i = 0; i < npages; ++i) {
+		if (!dma_addr[i] || dma_mapping_error(dev, dma_addr[i]))
+			continue;
+
+		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE, dir);
+	}
+}
+
+static unsigned long
+npages_in_range(unsigned long start, unsigned long end)
+{
+	return (end - start) >> PAGE_SHIFT;
+}
+
+/**
+ * drm_pagemap_migrate_to_devmem() - Migrate a struct mm_struct range to device memory
+ * @devmem_allocation: The device memory allocation to migrate to.
+ * The caller should hold a reference to the device memory allocation,
+ * and the reference is consumed by this function unless it returns with
+ * an error.
+ * @mm: Pointer to the struct mm_struct.
+ * @start: Start of the virtual address range to migrate.
+ * @end: End of the virtual address range to migrate.
+ * @timeslice_ms: The time requested for the migrated pagemap pages to
+ * be present in @mm before being allowed to be migrated back.
+ * @pgmap_owner: Not used currently, since only system memory is considered.
+ *
+ * This function migrates the specified virtual address range to device memory.
+ * It performs the necessary setup and invokes the driver-specific operations for
+ * migration to device memory. Expected to be called while holding the mmap lock in
+ * at least read mode.
+ *
+ * Note: The @timeslice_ms parameter can typically be used to force data to
+ * remain in pagemap pages long enough for a GPU to perform a task and to prevent
+ * a migration livelock. One alternative would be for the GPU driver to block
+ * in a mmu_notifier for the specified amount of time, but adding the
+ * functionality to the pagemap is likely nicer to the system as a whole.
+ *
+ * Return: %0 on success, negative error code on failure.
+ */
+int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
+				  struct mm_struct *mm,
+				  unsigned long start, unsigned long end,
+				  unsigned long timeslice_ms,
+				  void *pgmap_owner)
+{
+	const struct drm_pagemap_devmem_ops *ops = devmem_allocation->ops;
+	struct migrate_vma migrate = {
+		.start		= start,
+		.end		= end,
+		.pgmap_owner	= pgmap_owner,
+		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
+	};
+	unsigned long i, npages = npages_in_range(start, end);
+	struct vm_area_struct *vas;
+	struct drm_pagemap_zdd *zdd = NULL;
+	struct page **pages;
+	dma_addr_t *dma_addr;
+	void *buf;
+	int err;
+
+	mmap_assert_locked(mm);
+
+	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
+	    !ops->copy_to_ram)
+		return -EOPNOTSUPP;
+
+	vas = vma_lookup(mm, start);
+	if (!vas) {
+		err = -ENOENT;
+		goto err_out;
+	}
+
+	if (end > vas->vm_end || start < vas->vm_start) {
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	if (!vma_is_anonymous(vas)) {
+		err = -EBUSY;
+		goto err_out;
+	}
+
+	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
+		       sizeof(*pages), GFP_KERNEL);
+	if (!buf) {
+		err = -ENOMEM;
+		goto err_out;
+	}
+	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
+	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
+
+	zdd = drm_pagemap_zdd_alloc(pgmap_owner);
+	if (!zdd) {
+		err = -ENOMEM;
+		goto err_free;
+	}
+
+	migrate.vma = vas;
+	migrate.src = buf;
+	migrate.dst = migrate.src + npages;
+
+	err = migrate_vma_setup(&migrate);
+	if (err)
+		goto err_free;
+
+	if (!migrate.cpages) {
+		err = -EFAULT;
+		goto err_free;
+	}
+
+	if (migrate.cpages != npages) {
+		err = -EBUSY;
+		goto err_finalize;
+	}
+
+	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
+	if (err)
+		goto err_finalize;
+
+	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, dma_addr,
+					    migrate.src, npages, DMA_TO_DEVICE);
+	if (err)
+		goto err_finalize;
+
+	for (i = 0; i < npages; ++i) {
+		struct page *page = pfn_to_page(migrate.dst[i]);
+
+		pages[i] = page;
+		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
+		drm_pagemap_get_devmem_page(page, zdd);
+	}
+
+	err = ops->copy_to_devmem(pages, dma_addr, npages);
+	if (err)
+		goto err_finalize;
+
+	/* Upon success bind devmem allocation to range and zdd */
+	devmem_allocation->timeslice_expiration = get_jiffies_64() +
+		msecs_to_jiffies(timeslice_ms);
+	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
+
+err_finalize:
+	if (err)
+		drm_pagemap_migration_unlock_put_pages(npages, migrate.dst);
+	migrate_vma_pages(&migrate);
+	migrate_vma_finalize(&migrate);
+	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
+					DMA_TO_DEVICE);
+err_free:
+	if (zdd)
+		drm_pagemap_zdd_put(zdd);
+	kvfree(buf);
+err_out:
+	return err;
+}
+EXPORT_SYMBOL_GPL(drm_pagemap_migrate_to_devmem);
+
+/**
+ * drm_pagemap_migrate_populate_ram_pfn() - Populate RAM PFNs for a VM area
+ * @vas: Pointer to the VM area structure, can be NULL
+ * @fault_page: Fault page
+ * @npages: Number of pages to populate
+ * @mpages: Number of pages to migrate
+ * @src_mpfn: Source array of migrate PFNs
+ * @mpfn: Array of migrate PFNs to populate
+ * @addr: Start address for PFN allocation
+ *
+ * This function populates the RAM migrate page frame numbers (PFNs) for the
+ * specified VM area structure. It allocates and locks pages in the VM area for
+ * RAM usage. If vas is non-NULL use alloc_page_vma for allocation, if NULL use
+ * alloc_page for allocation.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
+						struct page *fault_page,
+						unsigned long npages,
+						unsigned long *mpages,
+						unsigned long *src_mpfn,
+						unsigned long *mpfn,
+						unsigned long addr)
+{
+	unsigned long i;
+
+	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
+		struct page *page, *src_page;
+
+		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
+			continue;
+
+		src_page = migrate_pfn_to_page(src_mpfn[i]);
+		if (!src_page)
+			continue;
+
+		if (fault_page) {
+			if (src_page->zone_device_data !=
+			    fault_page->zone_device_data)
+				continue;
+		}
+
+		if (vas)
+			page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
+		else
+			page = alloc_page(GFP_HIGHUSER);
+
+		if (!page)
+			goto free_pages;
+
+		mpfn[i] = migrate_pfn(page_to_pfn(page));
+	}
+
+	for (i = 0; i < npages; ++i) {
+		struct page *page = migrate_pfn_to_page(mpfn[i]);
+
+		if (!page)
+			continue;
+
+		WARN_ON_ONCE(!trylock_page(page));
+		++*mpages;
+	}
+
+	return 0;
+
+free_pages:
+	for (i = 0; i < npages; ++i) {
+		struct page *page = migrate_pfn_to_page(mpfn[i]);
+
+		if (!page)
+			continue;
+
+		put_page(page);
+		mpfn[i] = 0;
+	}
+	return -ENOMEM;
+}
+
+/**
+ * drm_pagemap_evict_to_ram() - Evict GPU SVM range to RAM
+ * @devmem_allocation: Pointer to the device memory allocation
+ *
+ * Similar to __drm_pagemap_migrate_to_ram but does not require mmap lock and
+ * migration done via migrate_device_* functions.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
+{
+	const struct drm_pagemap_devmem_ops *ops = devmem_allocation->ops;
+	unsigned long npages, mpages = 0;
+	struct page **pages;
+	unsigned long *src, *dst;
+	dma_addr_t *dma_addr;
+	void *buf;
+	int i, err = 0;
+	unsigned int retry_count = 2;
+
+	npages = devmem_allocation->size >> PAGE_SHIFT;
+
+retry:
+	if (!mmget_not_zero(devmem_allocation->mm))
+		return -EFAULT;
+
+	buf = kvcalloc(npages, 2 * sizeof(*src) + sizeof(*dma_addr) +
+		       sizeof(*pages), GFP_KERNEL);
+	if (!buf) {
+		err = -ENOMEM;
+		goto err_out;
+	}
+	src = buf;
+	dst = buf + (sizeof(*src) * npages);
+	dma_addr = buf + (2 * sizeof(*src) * npages);
+	pages = buf + (2 * sizeof(*src) + sizeof(*dma_addr)) * npages;
+
+	err = ops->populate_devmem_pfn(devmem_allocation, npages, src);
+	if (err)
+		goto err_free;
+
+	err = migrate_device_pfns(src, npages);
+	if (err)
+		goto err_free;
+
+	err = drm_pagemap_migrate_populate_ram_pfn(NULL, NULL, npages, &mpages,
+						   src, dst, 0);
+	if (err || !mpages)
+		goto err_finalize;
+
+	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, dma_addr,
+					    dst, npages, DMA_FROM_DEVICE);
+	if (err)
+		goto err_finalize;
+
+	for (i = 0; i < npages; ++i)
+		pages[i] = migrate_pfn_to_page(src[i]);
+
+	err = ops->copy_to_ram(pages, dma_addr, npages);
+	if (err)
+		goto err_finalize;
+
+err_finalize:
+	if (err)
+		drm_pagemap_migration_unlock_put_pages(npages, dst);
+	migrate_device_pages(src, dst, npages);
+	migrate_device_finalize(src, dst, npages);
+	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
+					DMA_FROM_DEVICE);
+err_free:
+	kvfree(buf);
+err_out:
+	mmput_async(devmem_allocation->mm);
+
+	if (completion_done(&devmem_allocation->detached))
+		return 0;
+
+	if (retry_count--) {
+		cond_resched();
+		goto retry;
+	}
+
+	return err ?: -EBUSY;
+}
+EXPORT_SYMBOL_GPL(drm_pagemap_evict_to_ram);
+
+/**
+ * __drm_pagemap_migrate_to_ram() - Migrate GPU SVM range to RAM (internal)
+ * @vas: Pointer to the VM area structure
+ * @device_private_page_owner: Device private pages owner
+ * @page: Pointer to the page for fault handling (can be NULL)
+ * @fault_addr: Fault address
+ * @size: Size of migration
+ *
+ * This internal function performs the migration of the specified GPU SVM range
+ * to RAM. It sets up the migration, populates + dma maps RAM PFNs, and
+ * invokes the driver-specific operations for migration to RAM.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
+					void *device_private_page_owner,
+					struct page *page,
+					unsigned long fault_addr,
+					unsigned long size)
+{
+	struct migrate_vma migrate = {
+		.vma		= vas,
+		.pgmap_owner	= device_private_page_owner,
+		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
+		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
+		.fault_page	= page,
+	};
+	struct drm_pagemap_zdd *zdd;
+	const struct drm_pagemap_devmem_ops *ops;
+	struct device *dev = NULL;
+	unsigned long npages, mpages = 0;
+	struct page **pages;
+	dma_addr_t *dma_addr;
+	unsigned long start, end;
+	void *buf;
+	int i, err = 0;
+
+	if (page) {
+		zdd = page->zone_device_data;
+		if (time_before64(get_jiffies_64(),
+				  zdd->devmem_allocation->timeslice_expiration))
+			return 0;
+	}
+
+	start = ALIGN_DOWN(fault_addr, size);
+	end = ALIGN(fault_addr + 1, size);
+
+	/* Corner where VMA area struct has been partially unmapped */
+	if (start < vas->vm_start)
+		start = vas->vm_start;
+	if (end > vas->vm_end)
+		end = vas->vm_end;
+
+	migrate.start = start;
+	migrate.end = end;
+	npages = npages_in_range(start, end);
+
+	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
+		       sizeof(*pages), GFP_KERNEL);
+	if (!buf) {
+		err = -ENOMEM;
+		goto err_out;
+	}
+	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
+	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
+
+	migrate.vma = vas;
+	migrate.src = buf;
+	migrate.dst = migrate.src + npages;
+
+	err = migrate_vma_setup(&migrate);
+	if (err)
+		goto err_free;
+
+	/* Raced with another CPU fault, nothing to do */
+	if (!migrate.cpages)
+		goto err_free;
+
+	if (!page) {
+		for (i = 0; i < npages; ++i) {
+			if (!(migrate.src[i] & MIGRATE_PFN_MIGRATE))
+				continue;
+
+			page = migrate_pfn_to_page(migrate.src[i]);
+			break;
+		}
+
+		if (!page)
+			goto err_finalize;
+	}
+	zdd = page->zone_device_data;
+	ops = zdd->devmem_allocation->ops;
+	dev = zdd->devmem_allocation->dev;
+
+	err = drm_pagemap_migrate_populate_ram_pfn(vas, page, npages, &mpages,
+						   migrate.src, migrate.dst,
+						   start);
+	if (err)
+		goto err_finalize;
+
+	err = drm_pagemap_migrate_map_pages(dev, dma_addr, migrate.dst, npages,
+					    DMA_FROM_DEVICE);
+	if (err)
+		goto err_finalize;
+
+	for (i = 0; i < npages; ++i)
+		pages[i] = migrate_pfn_to_page(migrate.src[i]);
+
+	err = ops->copy_to_ram(pages, dma_addr, npages);
+	if (err)
+		goto err_finalize;
+
+err_finalize:
+	if (err)
+		drm_pagemap_migration_unlock_put_pages(npages, migrate.dst);
+	migrate_vma_pages(&migrate);
+	migrate_vma_finalize(&migrate);
+	if (dev)
+		drm_pagemap_migrate_unmap_pages(dev, dma_addr, npages,
+						DMA_FROM_DEVICE);
+err_free:
+	kvfree(buf);
+err_out:
+
+	return err;
+}
+
+/**
+ * drm_pagemap_page_free() - Put GPU SVM zone device data associated with a page
+ * @page: Pointer to the page
+ *
+ * This function is a callback used to put the GPU SVM zone device data
+ * associated with a page when it is being released.
+ */
+static void drm_pagemap_page_free(struct page *page)
+{
+	drm_pagemap_zdd_put(page->zone_device_data);
+}
+
+/**
+ * drm_pagemap_migrate_to_ram() - Migrate a virtual range to RAM (page fault handler)
+ * @vmf: Pointer to the fault information structure
+ *
+ * This function is a page fault handler used to migrate a virtual range
+ * to ram. The device memory allocation in which the device page is found is
+ * migrated in its entirety.
+ *
+ * Returns:
+ * VM_FAULT_SIGBUS on failure, 0 on success.
+ */
+static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
+{
+	struct drm_pagemap_zdd *zdd = vmf->page->zone_device_data;
+	int err;
+
+	err = __drm_pagemap_migrate_to_ram(vmf->vma,
+					   zdd->device_private_page_owner,
+					   vmf->page, vmf->address,
+					   zdd->devmem_allocation->size);
+
+	return err ? VM_FAULT_SIGBUS : 0;
+}
+
+static const struct dev_pagemap_ops drm_pagemap_pagemap_ops = {
+	.page_free = drm_pagemap_page_free,
+	.migrate_to_ram = drm_pagemap_migrate_to_ram,
+};
+
+/**
+ * drm_pagemap_pagemap_ops_get() - Retrieve GPU SVM device page map operations
+ *
+ * Returns:
+ * Pointer to the GPU SVM device page map operations structure.
+ */
+const struct dev_pagemap_ops *drm_pagemap_pagemap_ops_get(void)
+{
+	return &drm_pagemap_pagemap_ops;
+}
+EXPORT_SYMBOL_GPL(drm_pagemap_pagemap_ops_get);
+
+/**
+ * drm_pagemap_devmem_init() - Initialize a drm_pagemap device memory allocation
+ *
+ * @devmem_allocation: The struct drm_pagemap_devmem to initialize.
+ * @dev: Pointer to the device structure which device memory allocation belongs to
+ * @mm: Pointer to the mm_struct for the address space
+ * @ops: Pointer to the operations structure for GPU SVM device memory
+ * @dpagemap: The struct drm_pagemap we're allocating from.
+ * @size: Size of device memory allocation
+ */
+void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
+			     struct device *dev, struct mm_struct *mm,
+			     const struct drm_pagemap_devmem_ops *ops,
+			     struct drm_pagemap *dpagemap, size_t size)
+{
+	init_completion(&devmem_allocation->detached);
+	devmem_allocation->dev = dev;
+	devmem_allocation->mm = mm;
+	devmem_allocation->ops = ops;
+	devmem_allocation->dpagemap = dpagemap;
+	devmem_allocation->size = size;
+}
+EXPORT_SYMBOL_GPL(drm_pagemap_devmem_init);
+
+/**
+ * drm_pagemap_page_to_dpagemap() - Return a pointer the drm_pagemap of a page
+ * @page: The struct page.
+ *
+ * Return: A pointer to the struct drm_pagemap of a device private page that
+ * was populated from the struct drm_pagemap. If the page was *not* populated
+ * from a struct drm_pagemap, the result is undefined and the function call
+ * may result in dereferencing and invalid address.
+ */
+struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page)
+{
+	struct drm_pagemap_zdd *zdd = page->zone_device_data;
+
+	return zdd->devmem_allocation->dpagemap;
+}
+EXPORT_SYMBOL_GPL(drm_pagemap_page_to_dpagemap);
diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 30ed74ad29ab..553c29e1030b 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -87,14 +87,16 @@ config DRM_XE_GPUSVM
 
 	  If in doubut say "Y".
 
-config DRM_XE_DEVMEM_MIRROR
-	bool "Enable device memory mirror"
+config DRM_XE_PAGEMAP
+	bool "Enable device memory pool for SVM"
 	depends on DRM_XE_GPUSVM
 	select GET_FREE_REGION
 	default y
 	help
-	  Disable this option only if you want to compile out without device
-	  memory mirror. Will reduce KMD memory footprint when disabled.
+	  Disable this option only if you don't want to expose local device
+	  memory for SVM. Will reduce KMD memory footprint when disabled.
+
+	  If in doubut say "Y".
 
 config DRM_XE_FORCE_PROBE
 	string "Force probe xe for selected Intel hardware IDs"
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index eb5e83c5f233..e0efaf23d051 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -86,7 +86,7 @@ struct xe_bo {
 	u16 cpu_caching;
 
 	/** @devmem_allocation: SVM device memory allocation */
-	struct drm_gpusvm_devmem devmem_allocation;
+	struct drm_pagemap_devmem devmem_allocation;
 
 	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
 		struct list_head vram_userfault_link;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 003afb279a5e..1b0f509b59ac 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -105,7 +105,7 @@ struct xe_vram_region {
 	void __iomem *mapping;
 	/** @ttm: VRAM TTM manager */
 	struct xe_ttm_vram_mgr ttm;
-#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
+#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
 	struct dev_pagemap pagemap;
 	/**
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 26418e9bdff0..a4bb219b2407 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -295,7 +295,7 @@ static void xe_svm_garbage_collector_work_func(struct work_struct *w)
 	up_write(&vm->lock);
 }
 
-#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
+#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 
 static struct xe_vram_region *page_to_vr(struct page *page)
 {
@@ -483,12 +483,12 @@ static int xe_svm_copy_to_ram(struct page **pages, dma_addr_t *dma_addr,
 	return xe_svm_copy(pages, dma_addr, npages, XE_SVM_COPY_TO_SRAM);
 }
 
-static struct xe_bo *to_xe_bo(struct drm_gpusvm_devmem *devmem_allocation)
+static struct xe_bo *to_xe_bo(struct drm_pagemap_devmem *devmem_allocation)
 {
 	return container_of(devmem_allocation, struct xe_bo, devmem_allocation);
 }
 
-static void xe_svm_devmem_release(struct drm_gpusvm_devmem *devmem_allocation)
+static void xe_svm_devmem_release(struct drm_pagemap_devmem *devmem_allocation)
 {
 	struct xe_bo *bo = to_xe_bo(devmem_allocation);
 
@@ -505,7 +505,7 @@ static struct drm_buddy *tile_to_buddy(struct xe_tile *tile)
 	return &tile->mem.vram.ttm.mm;
 }
 
-static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocation,
+static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocation,
 				      unsigned long npages, unsigned long *pfn)
 {
 	struct xe_bo *bo = to_xe_bo(devmem_allocation);
@@ -528,7 +528,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocatio
 	return 0;
 }
 
-static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
+static const struct drm_pagemap_devmem_ops dpagemap_devmem_ops = {
 	.devmem_release = xe_svm_devmem_release,
 	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
 	.copy_to_devmem = xe_svm_copy_to_devmem,
@@ -676,7 +676,7 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 start, u64 end, struct xe_vma *v
 					 min(end, xe_vma_end(vma)));
 }
 
-#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
+#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
 {
 	return &tile->mem.vram;
@@ -704,6 +704,9 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 	ktime_t end = 0;
 	int err;
 
+	if (!range->base.flags.migrate_devmem)
+		return -EINVAL;
+
 	range_debug(range, "ALLOCATE VRAM");
 
 	if (!mmget_not_zero(mm))
@@ -723,19 +726,23 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 		goto unlock;
 	}
 
-	drm_gpusvm_devmem_init(&bo->devmem_allocation,
-			       vm->xe->drm.dev, mm,
-			       &gpusvm_devmem_ops,
-			       &tile->mem.vram.dpagemap,
-			       xe_svm_range_size(range));
+	drm_pagemap_devmem_init(&bo->devmem_allocation,
+				vm->xe->drm.dev, mm,
+				&dpagemap_devmem_ops,
+				&tile->mem.vram.dpagemap,
+				xe_svm_range_size(range));
 
 	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
 	list_for_each_entry(block, blocks, link)
 		block->private = vr;
 
 	xe_bo_get(bo);
-	err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm, &range->base,
-					   &bo->devmem_allocation, ctx);
+	err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation,
+					    mm,
+					    xe_svm_range_start(range),
+					    xe_svm_range_end(range),
+					    ctx->timeslice_ms,
+					    xe_svm_devm_owner(vm->xe));
 	if (err)
 		xe_svm_devmem_release(&bo->devmem_allocation);
 
@@ -810,13 +817,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	struct drm_gpusvm_ctx ctx = {
 		.read_only = xe_vma_read_only(vma),
 		.devmem_possible = IS_DGFX(vm->xe) &&
-			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
+			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
 		.check_pages_threshold = IS_DGFX(vm->xe) &&
-			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
+			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K : 0,
 		.devmem_only = atomic && IS_DGFX(vm->xe) &&
-			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
+			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
 		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
-			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
+			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
 			vm->xe->atomic_svm_timeslice_ms : 0,
 	};
 	struct xe_svm_range *range;
@@ -944,7 +951,7 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
  */
 int xe_svm_bo_evict(struct xe_bo *bo)
 {
-	return drm_gpusvm_evict_to_ram(&bo->devmem_allocation);
+	return drm_pagemap_evict_to_ram(&bo->devmem_allocation);
 }
 
 /**
@@ -997,7 +1004,7 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 	return err;
 }
 
-#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
+#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 
 static struct drm_pagemap_device_addr
 xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
@@ -1054,7 +1061,7 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
 	vr->pagemap.range.start = res->start;
 	vr->pagemap.range.end = res->end;
 	vr->pagemap.nr_range = 1;
-	vr->pagemap.ops = drm_gpusvm_pagemap_ops_get();
+	vr->pagemap.ops = drm_pagemap_pagemap_ops_get();
 	vr->pagemap.owner = xe_svm_devm_owner(xe);
 	addr = devm_memremap_pages(dev, &vr->pagemap);
 
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 6a5156476bf4..4aedc5423aff 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -16,91 +16,9 @@ struct drm_gpusvm;
 struct drm_gpusvm_notifier;
 struct drm_gpusvm_ops;
 struct drm_gpusvm_range;
-struct drm_gpusvm_devmem;
 struct drm_pagemap;
 struct drm_pagemap_device_addr;
 
-/**
- * struct drm_gpusvm_devmem_ops - Operations structure for GPU SVM device memory
- *
- * This structure defines the operations for GPU Shared Virtual Memory (SVM)
- * device memory. These operations are provided by the GPU driver to manage device memory
- * allocations and perform operations such as migration between device memory and system
- * RAM.
- */
-struct drm_gpusvm_devmem_ops {
-	/**
-	 * @devmem_release: Release device memory allocation (optional)
-	 * @devmem_allocation: device memory allocation
-	 *
-	 * Release device memory allocation and drop a reference to device
-	 * memory allocation.
-	 */
-	void (*devmem_release)(struct drm_gpusvm_devmem *devmem_allocation);
-
-	/**
-	 * @populate_devmem_pfn: Populate device memory PFN (required for migration)
-	 * @devmem_allocation: device memory allocation
-	 * @npages: Number of pages to populate
-	 * @pfn: Array of page frame numbers to populate
-	 *
-	 * Populate device memory page frame numbers (PFN).
-	 *
-	 * Return: 0 on success, a negative error code on failure.
-	 */
-	int (*populate_devmem_pfn)(struct drm_gpusvm_devmem *devmem_allocation,
-				   unsigned long npages, unsigned long *pfn);
-
-	/**
-	 * @copy_to_devmem: Copy to device memory (required for migration)
-	 * @pages: Pointer to array of device memory pages (destination)
-	 * @dma_addr: Pointer to array of DMA addresses (source)
-	 * @npages: Number of pages to copy
-	 *
-	 * Copy pages to device memory.
-	 *
-	 * Return: 0 on success, a negative error code on failure.
-	 */
-	int (*copy_to_devmem)(struct page **pages,
-			      dma_addr_t *dma_addr,
-			      unsigned long npages);
-
-	/**
-	 * @copy_to_ram: Copy to system RAM (required for migration)
-	 * @pages: Pointer to array of device memory pages (source)
-	 * @dma_addr: Pointer to array of DMA addresses (destination)
-	 * @npages: Number of pages to copy
-	 *
-	 * Copy pages to system RAM.
-	 *
-	 * Return: 0 on success, a negative error code on failure.
-	 */
-	int (*copy_to_ram)(struct page **pages,
-			   dma_addr_t *dma_addr,
-			   unsigned long npages);
-};
-
-/**
- * struct drm_gpusvm_devmem - Structure representing a GPU SVM device memory allocation
- *
- * @dev: Pointer to the device structure which device memory allocation belongs to
- * @mm: Pointer to the mm_struct for the address space
- * @detached: device memory allocations is detached from device pages
- * @ops: Pointer to the operations structure for GPU SVM device memory
- * @dpagemap: The struct drm_pagemap of the pages this allocation belongs to.
- * @size: Size of device memory allocation
- * @timeslice_expiration: Timeslice expiration in jiffies
- */
-struct drm_gpusvm_devmem {
-	struct device *dev;
-	struct mm_struct *mm;
-	struct completion detached;
-	const struct drm_gpusvm_devmem_ops *ops;
-	struct drm_pagemap *dpagemap;
-	size_t size;
-	u64 timeslice_expiration;
-};
-
 /**
  * struct drm_gpusvm_ops - Operations structure for GPU SVM
  *
@@ -361,15 +279,6 @@ void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
 				  struct drm_gpusvm_range *range,
 				  const struct drm_gpusvm_ctx *ctx);
 
-int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
-				 struct drm_gpusvm_range *range,
-				 struct drm_gpusvm_devmem *devmem_allocation,
-				 const struct drm_gpusvm_ctx *ctx);
-
-int drm_gpusvm_evict_to_ram(struct drm_gpusvm_devmem *devmem_allocation);
-
-const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void);
-
 bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, unsigned long start,
 			    unsigned long end);
 
@@ -380,11 +289,6 @@ drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
 void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
 				   const struct mmu_notifier_range *mmu_range);
 
-void drm_gpusvm_devmem_init(struct drm_gpusvm_devmem *devmem_allocation,
-			    struct device *dev, struct mm_struct *mm,
-			    const struct drm_gpusvm_devmem_ops *ops,
-			    struct drm_pagemap *dpagemap, size_t size);
-
 #ifdef CONFIG_LOCKDEP
 /**
  * drm_gpusvm_driver_set_lock() - Set the lock protecting accesses to GPU SVM
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index 202c157ff4d7..dabc9c365df4 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -7,6 +7,7 @@
 #include <linux/types.h>
 
 struct drm_pagemap;
+struct drm_pagemap_zdd;
 struct device;
 
 /**
@@ -104,4 +105,104 @@ struct drm_pagemap {
 	struct device *dev;
 };
 
+struct drm_pagemap_devmem;
+
+/**
+ * struct drm_pagemap_devmem_ops - Operations structure for GPU SVM device memory
+ *
+ * This structure defines the operations for GPU Shared Virtual Memory (SVM)
+ * device memory. These operations are provided by the GPU driver to manage device memory
+ * allocations and perform operations such as migration between device memory and system
+ * RAM.
+ */
+struct drm_pagemap_devmem_ops {
+	/**
+	 * @devmem_release: Release device memory allocation (optional)
+	 * @devmem_allocation: device memory allocation
+	 *
+	 * Release device memory allocation and drop a reference to device
+	 * memory allocation.
+	 */
+	void (*devmem_release)(struct drm_pagemap_devmem *devmem_allocation);
+
+	/**
+	 * @populate_devmem_pfn: Populate device memory PFN (required for migration)
+	 * @devmem_allocation: device memory allocation
+	 * @npages: Number of pages to populate
+	 * @pfn: Array of page frame numbers to populate
+	 *
+	 * Populate device memory page frame numbers (PFN).
+	 *
+	 * Return: 0 on success, a negative error code on failure.
+	 */
+	int (*populate_devmem_pfn)(struct drm_pagemap_devmem *devmem_allocation,
+				   unsigned long npages, unsigned long *pfn);
+
+	/**
+	 * @copy_to_devmem: Copy to device memory (required for migration)
+	 * @pages: Pointer to array of device memory pages (destination)
+	 * @dma_addr: Pointer to array of DMA addresses (source)
+	 * @npages: Number of pages to copy
+	 *
+	 * Copy pages to device memory.
+	 *
+	 * Return: 0 on success, a negative error code on failure.
+	 */
+	int (*copy_to_devmem)(struct page **pages,
+			      dma_addr_t *dma_addr,
+			      unsigned long npages);
+
+	/**
+	 * @copy_to_ram: Copy to system RAM (required for migration)
+	 * @pages: Pointer to array of device memory pages (source)
+	 * @dma_addr: Pointer to array of DMA addresses (destination)
+	 * @npages: Number of pages to copy
+	 *
+	 * Copy pages to system RAM.
+	 *
+	 * Return: 0 on success, a negative error code on failure.
+	 */
+	int (*copy_to_ram)(struct page **pages,
+			   dma_addr_t *dma_addr,
+			   unsigned long npages);
+};
+
+/**
+ * struct drm_pagemap_devmem - Structure representing a GPU SVM device memory allocation
+ *
+ * @dev: Pointer to the device structure which device memory allocation belongs to
+ * @mm: Pointer to the mm_struct for the address space
+ * @detached: device memory allocations is detached from device pages
+ * @ops: Pointer to the operations structure for GPU SVM device memory
+ * @dpagemap: The struct drm_pagemap of the pages this allocation belongs to.
+ * @size: Size of device memory allocation
+ * @timeslice_expiration: Timeslice expiration in jiffies
+ */
+struct drm_pagemap_devmem {
+	struct device *dev;
+	struct mm_struct *mm;
+	struct completion detached;
+	const struct drm_pagemap_devmem_ops *ops;
+	struct drm_pagemap *dpagemap;
+	size_t size;
+	u64 timeslice_expiration;
+};
+
+int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
+				  struct mm_struct *mm,
+				  unsigned long start, unsigned long end,
+				  unsigned long timeslice_ms,
+				  void *pgmap_owner);
+
+int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation);
+
+const struct dev_pagemap_ops *drm_pagemap_pagemap_ops_get(void);
+
+struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page);
+
+void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
+			     struct device *dev, struct mm_struct *mm,
+			     const struct drm_pagemap_devmem_ops *ops,
+			     struct drm_pagemap *dpagemap, size_t size);
+
 #endif
-- 
2.49.0

