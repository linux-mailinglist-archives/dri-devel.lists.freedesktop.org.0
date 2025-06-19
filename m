Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9AFAE079A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:41:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EEF10EA6A;
	Thu, 19 Jun 2025 13:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nG9oWS0h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB0F710EA66;
 Thu, 19 Jun 2025 13:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750340463; x=1781876463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YmrV3Pdd9+0BDGq4Px9lMiiM8oUpcdxr0+nI8Y24rIg=;
 b=nG9oWS0huH6Skn4hcjH/kgs67Mgz4oAaqtojI2rvZmN4eO9MxHNJ5XG9
 z/VG8yvK/HiQMy3znuOJUtXPaRgZMGobVqjoFwuH6V86JQ01oPkTwUyNz
 +N2peXuRZRYusJIPiQvDC6gUVLAe95y4WvmvFYNCH9Jx8sJ643uVi2CHI
 5B300LzmPJNLwrYXLszT3xA7OGu9pNRYlyy7j2zJOnqpKxYwp4HKlLG12
 3OAnDUQDpWUtYmrl/D202QIAqUZ14zFtqAx5S3JMo+PPVqGk8M8Q/ddob
 hsYHe02/U1/8FUXXGKdKAxrOq5aFxdBDsUZNFpiLFekMgW+l9LrQA25Mo w==;
X-CSE-ConnectionGUID: 7jzn0EM5SSWQcAU5mDvq6A==
X-CSE-MsgGUID: Sfp0+sI1RmKEFC4/CIbjnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="62862137"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="62862137"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 06:41:03 -0700
X-CSE-ConnectionGUID: HFxsnW7TS5SidRV2RXu4Cw==
X-CSE-MsgGUID: AaGe4bitQ/6/3dOuLn2WVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="150247439"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 06:40:59 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>,
 =?UTF-8?q?Felix=20K=C3=BChling?= <felix.kuehling@amd.com>,
 "Philip Yang" <philip.yang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v6 2/3] drm/pagemap: Add a populate_mm op
Date: Thu, 19 Jun 2025 15:40:34 +0200
Message-ID: <20250619134035.170086-3-thomas.hellstrom@linux.intel.com>
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

Add an operation to populate a part of a drm_mm with device
private memory. Clarify how migration using it is intended
to work.

v3:
- Kerneldoc fixes and updates (Matt Brost).
v4:
- More kerneldoc fixes. Rebase.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c  |  9 ++---
 drivers/gpu/drm/drm_pagemap.c | 67 ++++++++++++++++++++++++++++-------
 include/drm/drm_pagemap.h     | 34 ++++++++++++++++++
 3 files changed, 92 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index e454bb806c72..5bb4c77db2c3 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -176,12 +176,9 @@
  *		}
  *
  *		if (driver_migration_policy(range)) {
- *			mmap_read_lock(mm);
- *			devmem = driver_alloc_devmem();
- *			err = drm_pagemap_migrate_to_devmem(devmem, gpusvm->mm, gpuva_start,
- *                                                          gpuva_end, ctx->timeslice_ms,
- *                                                          driver_pgmap_owner());
- *                      mmap_read_unlock(mm);
+ *			err = drm_pagemap_populate_mm(driver_choose_drm_pagemap(),
+ *						      gpuva_start, gpuva_end, gpusvm->mm,
+ *						      ctx->timeslice_ms);
  *			if (err)	// CPU mappings may have changed
  *				goto retry;
  *		}
diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index cef4657b6e8a..13e1519aa6d6 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -6,6 +6,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/migrate.h>
 #include <linux/pagemap.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_pagemap.h>
 
 /**
@@ -20,23 +21,30 @@
  * system.
  *
  * Typically the DRM pagemap receives requests from one or more DRM GPU SVM
- * instances to populate struct mm_struct virtual ranges with memory.
+ * instances to populate struct mm_struct virtual ranges with memory, and the
+ * migration is best effort only and may thus fail. The implementation should
+ * also handle device unbinding by blocking (return an -ENODEV) error for new
+ * population requests and after that migrate all device pages to system ram.
  */
 
 /**
  * DOC: Migration
  *
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
- *
+ * Migration granularity typically follows the GPU SVM range requests, but
+ * if there are clashes, due to races or due to the fact that multiple GPU
+ * SVM instances have different views of the ranges used, and because of that
+ * parts of a requested range is already present in the requested device memory,
+ * the implementation has a variety of options. It can fail and it can choose
+ * to populate only the part of the range that isn't already in device memory,
+ * and it can evict the range to system before trying to migrate. Ideally an
+ * implementation would just try to migrate the missing part of the range and
+ * allocate just enough memory to do so.
+ *
+ * When migrating to system memory as a response to a cpu fault or a device
+ * memory eviction request, currently a full device memory allocation is
+ * migrated back to system. Moving forward this might need improvement for
+ * situations where a single page needs bouncing between system memory and
+ * device memory due to, for example, atomic operations.
  *
  * Key DRM pagemap components:
  *
@@ -792,3 +800,38 @@ struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page)
 	return zdd->devmem_allocation->dpagemap;
 }
 EXPORT_SYMBOL_GPL(drm_pagemap_page_to_dpagemap);
+
+/**
+ * drm_pagemap_populate_mm() - Populate a virtual range with device memory pages
+ * @dpagemap: Pointer to the drm_pagemap managing the device memory
+ * @start: Start of the virtual range to populate.
+ * @end: End of the virtual range to populate.
+ * @mm: Pointer to the virtual address space.
+ * @timeslice_ms: The time requested for the migrated pagemap pages to
+ * be present in @mm before being allowed to be migrated back.
+ *
+ * Attempt to populate a virtual range with device memory pages,
+ * clearing them or migrating data from the existing pages if necessary.
+ * The function is best effort only, and implementations may vary
+ * in how hard they try to satisfy the request.
+ *
+ * Return: %0 on success, negative error code on error. If the hardware
+ * device was removed / unbound the function will return %-ENODEV.
+ */
+int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
+			    unsigned long start, unsigned long end,
+			    struct mm_struct *mm,
+			    unsigned long timeslice_ms)
+{
+	int err;
+
+	if (!mmget_not_zero(mm))
+		return -EFAULT;
+	mmap_read_lock(mm);
+	err = dpagemap->ops->populate_mm(dpagemap, start, end, mm,
+					 timeslice_ms);
+	mmap_read_unlock(mm);
+	mmput(mm);
+
+	return err;
+}
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index dabc9c365df4..e5f20a1235be 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -92,6 +92,35 @@ struct drm_pagemap_ops {
 			     struct device *dev,
 			     struct drm_pagemap_device_addr addr);
 
+	/**
+	 * @populate_mm: Populate part of the mm with @dpagemap memory,
+	 * migrating existing data.
+	 * @dpagemap: The struct drm_pagemap managing the memory.
+	 * @start: The virtual start address in @mm
+	 * @end: The virtual end address in @mm
+	 * @mm: Pointer to a live mm. The caller must have an mmget()
+	 * reference.
+	 *
+	 * The caller will have the mm lock at least in read mode.
+	 * Note that there is no guarantee that the memory is resident
+	 * after the function returns, it's best effort only.
+	 * When the mm is not using the memory anymore,
+	 * it will be released. The struct drm_pagemap might have a
+	 * mechanism in place to reclaim the memory and the data will
+	 * then be migrated. Typically to system memory.
+	 * The implementation should hold sufficient runtime power-
+	 * references while pages are used in an address space and
+	 * should ideally guard against hardware device unbind in
+	 * a way such that device pages are migrated back to system
+	 * followed by device page removal. The implementation should
+	 * return -ENODEV after device removal.
+	 *
+	 * Return: 0 if successful. Negative error code on error.
+	 */
+	int (*populate_mm)(struct drm_pagemap *dpagemap,
+			   unsigned long start, unsigned long end,
+			   struct mm_struct *mm,
+			   unsigned long timeslice_ms);
 };
 
 /**
@@ -205,4 +234,9 @@ void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
 			     const struct drm_pagemap_devmem_ops *ops,
 			     struct drm_pagemap *dpagemap, size_t size);
 
+int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
+			    unsigned long start, unsigned long end,
+			    struct mm_struct *mm,
+			    unsigned long timeslice_ms);
+
 #endif
-- 
2.49.0

