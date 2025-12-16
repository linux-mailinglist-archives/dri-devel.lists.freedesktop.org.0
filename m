Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F205CC512A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 21:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA5410E87C;
	Tue, 16 Dec 2025 20:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H4aO2zRD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7AC10E87C;
 Tue, 16 Dec 2025 20:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765915970; x=1797451970;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tb/yXcxfm7XCY+dRySS3mc+X74macG+qKQySt7gm4ZA=;
 b=H4aO2zRDcRd94UVJKlyV77h4kg2JDe3J9mYMUi4qmOHcQpAJ3VSvCEzx
 4/E6LjvLDDhGCmvT0ccuS9y2PoU5+Ur/wFgMgr7g6WMDtGTCxXWNBNkiK
 Sn+Ohi09nLdB8xSiL9d1VCVZME2zxJJiI4JnFOrq2ifvpn4ysYNKyinPY
 wziF9yAWfMRV8ljbE1ojM1dgWas0N0Sh56bOcE7c43Nhg4Q1gFWhE19bn
 xXisvYEvpOxY90xkYKTyYw7jZShTuES6PjLGn0gJiH2+SZ2qCzHJB/3ta
 l1+igBw24SzaPps94+Qre6U4ZTncgBw1HikqVX/jytVwz4Oy6kxa9tRVW w==;
X-CSE-ConnectionGUID: TD/ufKYxTGusNKxh3687Ww==
X-CSE-MsgGUID: kcHudSFKQCGqMF8zSgSJig==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="68000589"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="68000589"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 12:12:49 -0800
X-CSE-ConnectionGUID: iool+LL3S7SrttB4Wa9f3g==
X-CSE-MsgGUID: pBJrkObRTniNFLs2xZD+fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="202612455"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.214])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 12:12:48 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>
Subject: [PATCH 4/4] drm/pagemap: Enable THP support for GPU memory migration
Date: Tue, 16 Dec 2025 21:10:14 +0100
Message-ID: <20251216201206.1660899-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216201206.1660899-1-francois.dugast@intel.com>
References: <20251216201206.1660899-1-francois.dugast@intel.com>
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

This enables support for Transparent Huge Pages (THP) for device pages by
using MIGRATE_VMA_SELECT_COMPOUND during migration. It removes the need to
split folios and loop multiple times over all pages to perform required
operations at page level. Instead, we rely on newly introduced support for
higher orders in drm_pagemap and folio-level API.

In Xe, this drastically improves performance when using SVM. The GT stats
below collected after a 2MB page fault show overall servicing is more than
7 times faster, and thanks to reduced CPU overhead the time spent on the
actual copy goes from 23% without THP to 80% with THP:

Without THP:

    svm_2M_pagefault_us: 966
    svm_2M_migrate_us: 942
    svm_2M_device_copy_us: 223
    svm_2M_get_pages_us: 9
    svm_2M_bind_us: 10

With THP:

    svm_2M_pagefault_us: 132
    svm_2M_migrate_us: 128
    svm_2M_device_copy_us: 106
    svm_2M_get_pages_us: 1
    svm_2M_bind_us: 2

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 88 +++++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_svm.c   |  5 ++
 include/drm/drm_pagemap.h     |  5 +-
 3 files changed, 83 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index b71e47136112..797ec2094fdf 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -211,16 +211,20 @@ void *drm_pagemap_page_zone_device_data(struct page *page)
 /**
  * drm_pagemap_get_devmem_page() - Get a reference to a device memory page
  * @page: Pointer to the page
+ * @order: Order
  * @zdd: Pointer to the GPU SVM zone device data
  *
  * This function associates the given page with the specified GPU SVM zone
  * device data and initializes it for zone device usage.
  */
 static void drm_pagemap_get_devmem_page(struct page *page,
+					unsigned int order,
 					struct drm_pagemap_zdd *zdd)
 {
-	page->zone_device_data = drm_pagemap_zdd_get(zdd);
-	zone_device_page_init(page, 0);
+	struct folio *folio = page_folio(page);
+
+	folio_set_zone_device_data(folio, drm_pagemap_zdd_get(zdd));
+	zone_device_page_init(page, order);
 }
 
 /**
@@ -345,11 +349,13 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 				  void *pgmap_owner)
 {
 	const struct drm_pagemap_devmem_ops *ops = devmem_allocation->ops;
+	struct drm_pagemap *dpagemap = devmem_allocation->dpagemap;
 	struct migrate_vma migrate = {
 		.start		= start,
 		.end		= end,
 		.pgmap_owner	= pgmap_owner,
-		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
+		.flags		= MIGRATE_VMA_SELECT_SYSTEM
+				| MIGRATE_VMA_SELECT_COMPOUND,
 	};
 	unsigned long i, npages = npages_in_range(start, end);
 	struct vm_area_struct *vas;
@@ -409,11 +415,6 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		goto err_free;
 	}
 
-	if (migrate.cpages != npages) {
-		err = -EBUSY;
-		goto err_finalize;
-	}
-
 	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
 	if (err)
 		goto err_finalize;
@@ -424,13 +425,38 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 	if (err)
 		goto err_finalize;
 
-	for (i = 0; i < npages; ++i) {
+	mutex_lock(&dpagemap->folio_split_lock);
+	for (i = 0; i < npages;) {
+		unsigned long j;
 		struct page *page = pfn_to_page(migrate.dst[i]);
+		unsigned int order;
 
 		pages[i] = page;
 		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
-		drm_pagemap_get_devmem_page(page, zdd);
+
+		if (migrate.src[i] & MIGRATE_PFN_COMPOUND) {
+			order = HPAGE_PMD_ORDER;
+
+			migrate.dst[i] |= MIGRATE_PFN_COMPOUND;
+
+			drm_pagemap_get_devmem_page(page, order, zdd);
+
+			for (j = 1; j < NR_PAGES(order) && i + j < npages; j++)
+				migrate.dst[i + j] = 0;
+
+		} else {
+			order = 0;
+
+			if (folio_order(page_folio(page)))
+				migrate_device_split_page(page);
+
+			zone_device_page_init(page, 0);
+			page->zone_device_data = drm_pagemap_zdd_get(zdd);
+		}
+
+		i += NR_PAGES(order);
 	}
+	mutex_unlock(&dpagemap->folio_split_lock);
 
 	err = ops->copy_to_devmem(pages, pagemap_addr, npages);
 	if (err)
@@ -516,6 +542,8 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
 		page = folio_page(folio, 0);
 		mpfn[i] = migrate_pfn(page_to_pfn(page));
 
+		if (order)
+			mpfn[i] |= MIGRATE_PFN_COMPOUND;
 next:
 		if (page)
 			addr += page_size(page);
@@ -617,8 +645,15 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	if (err)
 		goto err_finalize;
 
-	for (i = 0; i < npages; ++i)
+	for (i = 0; i < npages;) {
+		unsigned int order = 0;
+
 		pages[i] = migrate_pfn_to_page(src[i]);
+		if (pages[i])
+			order = folio_order(page_folio(pages[i]));
+
+		i += NR_PAGES(order);
+	}
 
 	err = ops->copy_to_ram(pages, pagemap_addr, npages);
 	if (err)
@@ -671,8 +706,9 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	struct migrate_vma migrate = {
 		.vma		= vas,
 		.pgmap_owner	= device_private_page_owner,
-		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
-		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
+		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE
+				| MIGRATE_VMA_SELECT_DEVICE_COHERENT
+				| MIGRATE_VMA_SELECT_COMPOUND,
 		.fault_page	= page,
 	};
 	struct drm_pagemap_zdd *zdd;
@@ -753,8 +789,15 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	if (err)
 		goto err_finalize;
 
-	for (i = 0; i < npages; ++i)
+	for (i = 0; i < npages;) {
+		unsigned int order = 0;
+
 		pages[i] = migrate_pfn_to_page(migrate.src[i]);
+		if (pages[i])
+			order = folio_order(page_folio(pages[i]));
+
+		i += NR_PAGES(order);
+	}
 
 	err = ops->copy_to_ram(pages, pagemap_addr, npages);
 	if (err)
@@ -813,9 +856,26 @@ static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
 	return err ? VM_FAULT_SIGBUS : 0;
 }
 
+static void drm_pagemap_folio_split(struct folio *orig_folio, struct folio *new_folio)
+{
+	struct drm_pagemap_zdd *zdd;
+
+	if (!new_folio)
+		return;
+
+	new_folio->pgmap = orig_folio->pgmap;
+	zdd = folio_zone_device_data(orig_folio);
+	if (folio_order(new_folio))
+		folio_set_zone_device_data(new_folio, drm_pagemap_zdd_get(zdd));
+	else
+		folio_page(new_folio, 0)->zone_device_data =
+			drm_pagemap_zdd_get(zdd);
+}
+
 static const struct dev_pagemap_ops drm_pagemap_pagemap_ops = {
 	.folio_free = drm_pagemap_folio_free,
 	.migrate_to_ram = drm_pagemap_migrate_to_ram,
+	.folio_split = drm_pagemap_folio_split,
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 93550c7c84ac..037c77de2757 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_drv.h>
+#include <drm/drm_managed.h>
 
 #include "xe_bo.h"
 #include "xe_exec_queue_types.h"
@@ -1470,6 +1471,10 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
 	void *addr;
 	int ret;
 
+	ret = drmm_mutex_init(&tile->xe->drm, &vr->dpagemap.folio_split_lock);
+	if (ret)
+		return ret;
+
 	res = devm_request_free_mem_region(dev, &iomem_resource,
 					   vr->usable_size);
 	if (IS_ERR(res)) {
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index 3a8d0e1cef43..82b9c0e6392e 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -129,11 +129,14 @@ struct drm_pagemap_ops {
  * struct drm_pagemap: Additional information for a struct dev_pagemap
  * used for device p2p handshaking.
  * @ops: The struct drm_pagemap_ops.
- * @dev: The struct drevice owning the device-private memory.
+ * @dev: The struct device owning the device-private memory.
+ * @folio_split_lock: Lock to protect device folio splitting.
  */
 struct drm_pagemap {
 	const struct drm_pagemap_ops *ops;
 	struct device *dev;
+	/* Protect device folio splitting */
+	struct mutex folio_split_lock;
 };
 
 struct drm_pagemap_devmem;
-- 
2.43.0

