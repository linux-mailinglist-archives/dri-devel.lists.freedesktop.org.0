Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADE6ACDB14
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 11:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E0910E91A;
	Wed,  4 Jun 2025 09:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e4oftrxP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF7AA10E91A;
 Wed,  4 Jun 2025 09:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749029766; x=1780565766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KzjnV6ffApZ5YXxqXhnaSUt1TjbJ8L8p7p++I7FJTkc=;
 b=e4oftrxP6ETbHmv0XUEw1wP/MyzmDO7elWiE0TVA6lMVcHczIOzL8tU1
 cA5UQDnUpX6qFfigRac9nUXzlUw5Tu7PEhyccI4T3cEtEUhiPxo2+YJCl
 DTkNCSOYydsnN0AocfGXEhxrdBBot/VHrVsUzewziGEnaINxQ9q9cSS31
 GMWcWJl6E2QVP/Bqw+UrB2U+FEjjaFV/7M4rO0LaKhQDMo36ZJfnCBPAe
 VLUX0HywY2SApk54q1rpHbWniKVhazrO03njUBTBQ12dz4s/bcdGaAjRL
 r8yIMw98V/5gkWcjv4l0mEviJO9Srzb0QEWHHrJmBBmabHPYKk6/wgp/I w==;
X-CSE-ConnectionGUID: iOWIQnS3TLGqM/Lfuo9CSA==
X-CSE-MsgGUID: eu6xDVroR52TJUopyVjNUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50344679"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="50344679"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 02:36:06 -0700
X-CSE-ConnectionGUID: ee7Ok2/EQ/idYqnyKy1B3A==
X-CSE-MsgGUID: 7KNX06rKRbOuSdsfXYjt+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="176001326"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.121])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 02:36:03 -0700
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
Subject: [PATCH v2 2/3] drm/pagemap: Add a populate_mm op
Date: Wed,  4 Jun 2025 11:35:35 +0200
Message-ID: <20250604093536.95982-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604093536.95982-1-thomas.hellstrom@linux.intel.com>
References: <20250604093536.95982-1-thomas.hellstrom@linux.intel.com>
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
 drivers/gpu/drm/drm_pagemap.c | 34 ++++++++++++++++++++++++++++++++++
 include/drm/drm_pagemap.h     | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index ef81381609de..51afc8a9704d 100644
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
index 3551a50d7381..25395685a9b8 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -6,6 +6,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/migrate.h>
 #include <linux/pagemap.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_pagemap.h>
 
 /**
@@ -809,3 +810,36 @@ struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page)
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

