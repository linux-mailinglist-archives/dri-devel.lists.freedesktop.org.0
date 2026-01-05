Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87398CF333B
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 12:20:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6632710E3CE;
	Mon,  5 Jan 2026 11:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NkLgRFnm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E7E10E3BD;
 Mon,  5 Jan 2026 11:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767612022; x=1799148022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HPe2DSIQ0WgKMF3qGZ12Csc19+G88lmiB2z20+dikGM=;
 b=NkLgRFnmrZrIBYlpY92YKt7t1NNddptfQArkpygToXnSJ4ZQOKNh54zw
 2HAQkJlAoatp7pRJr3nYIK4ABAQyWD/17+HjdbI1H71SBdulY8CXbCoT/
 Ex6ykgOmeqmNELqzq6MYfgWkGptQlWMYUVJDHDipUYFJA7lJFcgpCfPhQ
 sAKVnNvijk8IdwDs07KkC6N4oO6cGbsn38lUr+0G2xO36luIyXWE8DEeZ
 jENJ39bi1176bTqfent5UqBWOpMV+3Mhr+QU0MraH9Ghf5sZy1TcAMQ4M
 uEcFhQ15qe3aVrHsv5fNcd/Kip3aY6yFmCkzy8t4iUPNkMd1lu1Y8kQMx w==;
X-CSE-ConnectionGUID: ShuVTtD7QTiIW2A+vAcuRA==
X-CSE-MsgGUID: aDwlS9a3TuyE6mkv/bY0vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="80095661"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="80095661"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 03:20:22 -0800
X-CSE-ConnectionGUID: B4dM6TnBQlmWoEa0WSMnPg==
X-CSE-MsgGUID: 9M/Xkw7USdObPQWbCXnD0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="201996951"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.244.143])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 03:20:20 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>
Subject: [PATCH v2 5/5] drm/pagemap: Enable THP support for GPU memory
 migration
Date: Mon,  5 Jan 2026 12:18:28 +0100
Message-ID: <20260105111945.73292-6-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260105111945.73292-1-francois.dugast@intel.com>
References: <20260105111945.73292-1-francois.dugast@intel.com>
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

v2:
- Fix one occurrence of drm_pagemap_get_devmem_page() (Matthew Brost)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 77 +++++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_svm.c   |  4 ++
 include/drm/drm_pagemap.h     |  3 ++
 3 files changed, 76 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 05e708730132..1ea8526ce946 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -200,16 +200,20 @@ static void drm_pagemap_migration_unlock_put_pages(unsigned long npages,
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
@@ -522,7 +526,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		.end		= end,
 		.pgmap_owner	= pagemap->owner,
 		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT |
-		MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
+		MIGRATE_VMA_SELECT_DEVICE_PRIVATE | MIGRATE_VMA_SELECT_COMPOUND,
 	};
 	unsigned long i, npages = npages_in_range(start, end);
 	unsigned long own_pages = 0, migrated_pages = 0;
@@ -628,10 +632,13 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 
 	own_pages = 0;
 
-	for (i = 0; i < npages; ++i) {
+	mutex_lock(&dpagemap->folio_split_lock);
+	for (i = 0; i < npages;) {
+		unsigned long j;
 		struct page *page = pfn_to_page(migrate.dst[i]);
 		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
 		cur.start = i;
+		unsigned int order;
 
 		pages[i] = NULL;
 		if (src_page && is_device_private_page(src_page)) {
@@ -658,7 +665,23 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 			pages[i] = page;
 		}
 		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
-		drm_pagemap_get_devmem_page(page, zdd);
+
+		if (migrate.src[i] & MIGRATE_PFN_COMPOUND) {
+			order = HPAGE_PMD_ORDER;
+
+			migrate.dst[i] |= MIGRATE_PFN_COMPOUND;
+
+			for (j = 1; j < NR_PAGES(order) && i + j < npages; j++)
+				migrate.dst[i + j] = 0;
+
+		} else {
+			order = 0;
+
+			if (folio_order(page_folio(page)))
+				migrate_device_split_page(page);
+		}
+
+		drm_pagemap_get_devmem_page(page, order, zdd);
 
 		/* If we switched the migrating drm_pagemap, migrate previous pages now */
 		err = drm_pagemap_migrate_range(devmem_allocation, migrate.src, migrate.dst,
@@ -666,7 +689,11 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 						mdetails);
 		if (err)
 			goto err_finalize;
+
+		i += NR_PAGES(order);
 	}
+	mutex_unlock(&dpagemap->folio_split_lock);
+
 	cur.start = npages;
 	cur.ops = NULL; /* Force migration */
 	err = drm_pagemap_migrate_range(devmem_allocation, migrate.src, migrate.dst,
@@ -775,6 +802,8 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
 		page = folio_page(folio, 0);
 		mpfn[i] = migrate_pfn(page_to_pfn(page));
 
+		if (order)
+			mpfn[i] |= MIGRATE_PFN_COMPOUND;
 next:
 		if (page)
 			addr += page_size(page);
@@ -1030,8 +1059,15 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
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
 
 	err = ops->copy_to_ram(pages, pagemap_addr, npages, NULL);
 	if (err)
@@ -1084,7 +1120,8 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 		.vma		= vas,
 		.pgmap_owner	= page_pgmap(page)->owner,
 		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
-		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
+		MIGRATE_VMA_SELECT_DEVICE_COHERENT |
+		MIGRATE_VMA_SELECT_COMPOUND,
 		.fault_page	= page,
 	};
 	struct drm_pagemap_migrate_details mdetails = {};
@@ -1150,8 +1187,15 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
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
 
 	err = ops->copy_to_ram(pages, pagemap_addr, npages, NULL);
 	if (err)
@@ -1209,9 +1253,26 @@ static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
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
index fa2ee2c08f31..05dba6abbcc8 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1760,6 +1760,10 @@ static struct xe_pagemap *xe_pagemap_create(struct xe_device *xe, struct xe_vram
 	if (err)
 		goto out_no_dpagemap;
 
+	err = drmm_mutex_init(&xe->drm, &dpagemap->folio_split_lock);
+	if (err)
+		goto out_err;
+
 	res = devm_request_free_mem_region(dev, &iomem_resource,
 					   vr->usable_size);
 	if (IS_ERR(res)) {
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index 736fb6cb7b33..3c8bacfc79e6 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -161,6 +161,7 @@ struct drm_pagemap_ops {
  * &struct drm_pagemap. May be NULL if no cache is used.
  * @shrink_link: Link into the shrinker's list of drm_pagemaps. Only
  * used if also using a pagemap cache.
+ * @folio_split_lock: Lock to protect device folio splitting.
  */
 struct drm_pagemap {
 	const struct drm_pagemap_ops *ops;
@@ -170,6 +171,8 @@ struct drm_pagemap {
 	struct drm_pagemap_dev_hold *dev_hold;
 	struct drm_pagemap_cache *cache;
 	struct list_head shrink_link;
+	/* Protect device folio splitting */
+	struct mutex folio_split_lock;
 };
 
 struct drm_pagemap_devmem;
-- 
2.43.0

