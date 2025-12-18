Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D33CCCBC6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 17:22:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F04E10EA58;
	Thu, 18 Dec 2025 16:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MeYQr9kG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E443410EA59;
 Thu, 18 Dec 2025 16:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766074965; x=1797610965;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q/IZnWoCcBHfvbtJCM7X066WpEG8aImbwXe7VDcvLmQ=;
 b=MeYQr9kGUWk7559k2YGz6HM/uWKUG4X5KRW6ntk2KkHb6j7f/Gb+rR85
 iDiXAKZy8QeJAx76BS8nibIYdUc+02K4pJ0CkPfXHaxFbE45Gan7hDd4V
 vp6mMdoUSVQ+q+zCxtcfGx8kWByJoxmP2lwgdrPPF7aNVcSCGfr016IrX
 tnED3eQmQzgV93r6LkL7fPoMYX4eusMzjpPDu47M1DDWzo/QT5moh7gta
 8Wj1KA8Btqfqi8RTqs0czbieoxfMTHinhHZ95xfHa3MYPTbcH0QLfXUuX
 udqRBlHDoNeH9IKxaciL+MCCUx85El5T1DHJ/S+tPVS635lpCMBQOE/yP g==;
X-CSE-ConnectionGUID: 3rK1lkUWQZevYXWQLdjRkQ==
X-CSE-MsgGUID: ZXDo1QIOR6eLQbZw8rBzbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="70607718"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="70607718"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 08:22:45 -0800
X-CSE-ConnectionGUID: zLmaTZLzRbqPb0QmRZZCWQ==
X-CSE-MsgGUID: AT+/0NIWQZq4HCaK8epZZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="203705793"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO fedora)
 ([10.245.244.93])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 08:22:42 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 dri-devel@lists.freedesktop.org, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v5 19/24] drm/pagemap,
 drm/xe: Clean up the use of the device-private page owner
Date: Thu, 18 Dec 2025 17:20:56 +0100
Message-ID: <20251218162101.605379-20-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251218162101.605379-1-thomas.hellstrom@linux.intel.com>
References: <20251218162101.605379-1-thomas.hellstrom@linux.intel.com>
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

Use the dev_pagemap->owner field wherever possible, simplifying
the code slightly.

v3: New patch

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 32 +++++++++++---------------------
 drivers/gpu/drm/xe/xe_svm.c   |  3 +--
 include/drm/drm_pagemap.h     |  3 +--
 3 files changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 5dd9fd30dc7f..d44372a80a90 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -66,7 +66,6 @@
  * @refcount: Reference count for the zdd
  * @devmem_allocation: device memory allocation
  * @dpagemap: Refcounted pointer to the underlying struct drm_pagemap.
- * @device_private_page_owner: Device private pages owner
  *
  * This structure serves as a generic wrapper installed in
  * page->zone_device_data. It provides infrastructure for looking up a device
@@ -79,13 +78,11 @@ struct drm_pagemap_zdd {
 	struct kref refcount;
 	struct drm_pagemap_devmem *devmem_allocation;
 	struct drm_pagemap *dpagemap;
-	void *device_private_page_owner;
 };
 
 /**
  * drm_pagemap_zdd_alloc() - Allocate a zdd structure.
  * @dpagemap: Pointer to the underlying struct drm_pagemap.
- * @device_private_page_owner: Device private pages owner
  *
  * This function allocates and initializes a new zdd structure. It sets up the
  * reference count and initializes the destroy work.
@@ -93,7 +90,7 @@ struct drm_pagemap_zdd {
  * Return: Pointer to the allocated zdd on success, ERR_PTR() on failure.
  */
 static struct drm_pagemap_zdd *
-drm_pagemap_zdd_alloc(struct drm_pagemap *dpagemap, void *device_private_page_owner)
+drm_pagemap_zdd_alloc(struct drm_pagemap *dpagemap)
 {
 	struct drm_pagemap_zdd *zdd;
 
@@ -103,7 +100,6 @@ drm_pagemap_zdd_alloc(struct drm_pagemap *dpagemap, void *device_private_page_ow
 
 	kref_init(&zdd->refcount);
 	zdd->devmem_allocation = NULL;
-	zdd->device_private_page_owner = device_private_page_owner;
 	zdd->dpagemap = drm_pagemap_get(dpagemap);
 
 	return zdd;
@@ -308,7 +304,6 @@ npages_in_range(unsigned long start, unsigned long end)
  * @end: End of the virtual address range to migrate.
  * @timeslice_ms: The time requested for the migrated pagemap pages to
  * be present in @mm before being allowed to be migrated back.
- * @pgmap_owner: Not used currently, since only system memory is considered.
  *
  * This function migrates the specified virtual address range to device memory.
  * It performs the necessary setup and invokes the driver-specific operations for
@@ -326,14 +321,15 @@ npages_in_range(unsigned long start, unsigned long end)
 int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 				  struct mm_struct *mm,
 				  unsigned long start, unsigned long end,
-				  unsigned long timeslice_ms,
-				  void *pgmap_owner)
+				  unsigned long timeslice_ms)
 {
 	const struct drm_pagemap_devmem_ops *ops = devmem_allocation->ops;
+	struct drm_pagemap *dpagemap = devmem_allocation->dpagemap;
+	struct dev_pagemap *pagemap = dpagemap->pagemap;
 	struct migrate_vma migrate = {
 		.start		= start,
 		.end		= end,
-		.pgmap_owner	= pgmap_owner,
+		.pgmap_owner	= pagemap->owner,
 		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
 	};
 	unsigned long i, npages = npages_in_range(start, end);
@@ -375,7 +371,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 	pagemap_addr = buf + (2 * sizeof(*migrate.src) * npages);
 	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*pagemap_addr)) * npages;
 
-	zdd = drm_pagemap_zdd_alloc(devmem_allocation->dpagemap, pgmap_owner);
+	zdd = drm_pagemap_zdd_alloc(dpagemap);
 	if (!zdd) {
 		err = -ENOMEM;
 		goto err_free;
@@ -791,8 +787,7 @@ EXPORT_SYMBOL_GPL(drm_pagemap_evict_to_ram);
 /**
  * __drm_pagemap_migrate_to_ram() - Migrate GPU SVM range to RAM (internal)
  * @vas: Pointer to the VM area structure
- * @device_private_page_owner: Device private pages owner
- * @page: Pointer to the page for fault handling (can be NULL)
+ * @page: Pointer to the page for fault handling.
  * @fault_addr: Fault address
  * @size: Size of migration
  *
@@ -803,14 +798,13 @@ EXPORT_SYMBOL_GPL(drm_pagemap_evict_to_ram);
  * Return: 0 on success, negative error code on failure.
  */
 static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
-					void *device_private_page_owner,
 					struct page *page,
 					unsigned long fault_addr,
 					unsigned long size)
 {
 	struct migrate_vma migrate = {
 		.vma		= vas,
-		.pgmap_owner	= device_private_page_owner,
+		.pgmap_owner	= page_pgmap(page)->owner,
 		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
 		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
 		.fault_page	= page,
@@ -825,12 +819,9 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	void *buf;
 	int i, err = 0;
 
-	if (page) {
-		zdd = page->zone_device_data;
-		if (time_before64(get_jiffies_64(),
-				  zdd->devmem_allocation->timeslice_expiration))
-			return 0;
-	}
+	zdd = page->zone_device_data;
+	if (time_before64(get_jiffies_64(), zdd->devmem_allocation->timeslice_expiration))
+		return 0;
 
 	start = ALIGN_DOWN(fault_addr, size);
 	end = ALIGN(fault_addr + 1, size);
@@ -931,7 +922,6 @@ static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
 	int err;
 
 	err = __drm_pagemap_migrate_to_ram(vmf->vma,
-					   zdd->device_private_page_owner,
 					   vmf->page, vmf->address,
 					   zdd->devmem_allocation->size);
 
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index df31ba03f56f..f4254d45b32e 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1097,8 +1097,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 		/* Ensure the device has a pm ref while there are device pages active. */
 		xe_pm_runtime_get_noresume(xe);
 		err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
-						    start, end, timeslice_ms,
-						    xpagemap->pagemap.owner);
+						    start, end, timeslice_ms);
 		if (err)
 			xe_svm_devmem_release(&bo->devmem_allocation);
 		xe_bo_unlock(bo);
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index 78cc9011829f..f73afece42ba 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -320,8 +320,7 @@ struct drm_pagemap_devmem {
 int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 				  struct mm_struct *mm,
 				  unsigned long start, unsigned long end,
-				  unsigned long timeslice_ms,
-				  void *pgmap_owner);
+				  unsigned long timeslice_ms);
 
 int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation);
 
-- 
2.51.1

