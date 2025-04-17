Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2222A919C9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 12:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41AF710EAAE;
	Thu, 17 Apr 2025 10:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HXhIeYBj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD7610EAAC;
 Thu, 17 Apr 2025 10:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744887104; x=1776423104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xSvE39Zl4Cgn6EErRtx2N+S0N959YwdGgTAleE7nAf4=;
 b=HXhIeYBjXWhHTy6xhrCibbE4zqlOhaPP29B4huWCX8DKdL5Zen5ZQUa9
 uWq4+DyQRxDNAX2eKV6EnHPGfoqqhQYTnIOWSdeji11cdQNHRW2Drzyds
 wXGnPzE1Uh6X1mZat1OhwKmX/XtPG4vYvG39lDgaMAVaH30JuupzOh/BB
 AvfqmkdJhdWf0r1e2TaX4x+T42Ygk0BBNuJYS3DNFcoIckO7V6lDQQAX7
 aD0IkegbAgtypMdcaDcDQRWGAVZUa08SBg/OydyACOF17ryuIKzs8ru1n
 mimc5KtzATA0sCfZ4cqvZaTIEsLJlZIJegQV7csbutt/+P7MnCfCSRO2q A==;
X-CSE-ConnectionGUID: Y3AsNq6NSvWEaN/efZO+hQ==
X-CSE-MsgGUID: ubecrWweRIyiTyzgIz+01g==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="68959786"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="68959786"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 03:51:43 -0700
X-CSE-ConnectionGUID: t3MxeC+US/KuxyyMD1PzOw==
X-CSE-MsgGUID: c4RxyTZbRiinJECMDDr6wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="130729661"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.168])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 03:51:40 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH 2/3] drm/pagemap: Add a populate_mm op
Date: Thu, 17 Apr 2025 12:51:12 +0200
Message-ID: <20250417105113.48831-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417105113.48831-1-thomas.hellstrom@linux.intel.com>
References: <20250417105113.48831-1-thomas.hellstrom@linux.intel.com>
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
private memory.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c  |  7 ++-----
 drivers/gpu/drm/drm_pagemap.c | 32 ++++++++++++++++++++++++++++++++
 include/drm/drm_pagemap.h     | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 85e358336ed8..0c53afc3e112 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -175,11 +175,8 @@
  *		}
  *
  *		if (driver_migration_policy(range)) {
- *			mmap_read_lock(mm);
- *			devmem = driver_alloc_devmem();
- *			err = drm_pagemap_migrate_to_devmem(devmem, gpusvm->mm, gpuva_start,
- *                                                          gpuva_end, driver_pgmap_owner());
- *                      mmap_read_unlock(mm);
+ *			err = drm_pagemap_populate_mm(driver_choose_drm_pagemap(),
+ *                                                    gpuva_start, gpuva_end, gpusvm->mm);
  *			if (err)	// CPU mappings may have changed
  *				goto retry;
  *		}
diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index c46bb4384444..27e3f90cf49a 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -6,6 +6,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/migrate.h>
 #include <linux/pagemap.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_pagemap.h>
 
 /**
@@ -782,3 +783,34 @@ struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page)
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
+ *
+ * Attempt to populate a virtual range with device memory pages,
+ * clearing them or migrating data from the existing pages if necessary.
+ * The function is best effort only, and implementations may vary
+ * in how hard they try to satisfy the request.
+ *
+ * Return: 0 on success, negative error code on error. If the hardware
+ * device was removed / unbound the function will return -ENODEV;
+ */
+int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
+			    unsigned long start, unsigned long end,
+			    struct mm_struct *mm)
+{
+	int err;
+
+	if (!mmget_not_zero(mm))
+		return -EFAULT;
+	mmap_read_lock(mm);
+	err = dpagemap->ops->populate_mm(dpagemap, start, end, mm);
+	mmap_read_unlock(mm);
+	mmput(mm);
+
+	return err;
+}
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index 32f0d7f23075..c591736e7c48 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -92,6 +92,34 @@ struct drm_pagemap_ops {
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
+			   struct mm_struct *mm);
 };
 
 /**
@@ -202,4 +230,8 @@ void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
 			     const struct drm_pagemap_devmem_ops *ops,
 			     struct drm_pagemap *dpagemap, size_t size);
 
+int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
+			    unsigned long start, unsigned long end,
+			    struct mm_struct *mm);
+
 #endif
-- 
2.49.0

