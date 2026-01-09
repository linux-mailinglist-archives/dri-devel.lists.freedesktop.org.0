Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A433BD08037
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:56:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0604310E87C;
	Fri,  9 Jan 2026 08:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hH539nJS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1593D10E875;
 Fri,  9 Jan 2026 08:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767949006; x=1799485006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h1ASdeN/O0vxyTijAXhXC87fph4Q1vK+qgLbkkaHE78=;
 b=hH539nJS2tsDGsRbTo6sybRYbGvrTRiBmsW376h/eQ48c+DWveqs7mfG
 y3i6KMrpySyxMb0a5QgS07Nuzl+a9kIHl5I/F8qLnh9O2mUhK2/boyjrM
 zBOoKCYXIDXgJqwFEuo8s7u/uulp5Xr2cKJHCPJroY+U67u/t09TJYR4x
 cORdgBU7jAMWOCdxCfXYccnlV+6m5u0rknqd1coRlDjaM9n61MdRrq7UG
 OeCCxYySUiA9rv9xTwgmJXPa1D9c6lWXEYKHQWMJAGdzMF2YKZnOWjRFz
 xbgnFacLP4+9VaXOjuhCgoX02HbRy7ORZ1tXUlhGAnjakiSHRUvI2kCTi g==;
X-CSE-ConnectionGUID: y3hmu5VjQLO6Fgwp1ukUwA==
X-CSE-MsgGUID: wAYTSr4aRkK5s/hysnSuvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="79626024"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="79626024"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:56:46 -0800
X-CSE-ConnectionGUID: Iuh+grkiQVCx/re01xu5EA==
X-CSE-MsgGUID: ykGppMPbT0+byLZEFCuLsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="202538645"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.244.83])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:56:45 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>
Subject: [PATCH v3 7/7] drm/pagemap: Enable THP support for GPU memory
 migration
Date: Fri,  9 Jan 2026 09:54:27 +0100
Message-ID: <20260109085605.443316-8-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109085605.443316-1-francois.dugast@intel.com>
References: <20260109085605.443316-1-francois.dugast@intel.com>
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

v3:
- Remove migrate_device_split_page() and folio_split_lock, instead rely on
  free_zone_device_folio() to split folios before freeing (Matthew Brost)
- Assert folio order is HPAGE_PMD_ORDER (Matthew Brost)
- Always use folio_set_zone_device_data() in split (Matthew Brost)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 69 +++++++++++++++++++++++++++++++----
 1 file changed, 61 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 121234cef38c..5b89140edb8e 100644
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
@@ -534,7 +538,8 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		 * rare and only occur when the madvise attributes of memory are
 		 * changed or atomics are being used.
 		 */
-		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT,
+		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT |
+				  MIGRATE_VMA_SELECT_COMPOUND,
 	};
 	unsigned long i, npages = npages_in_range(start, end);
 	unsigned long own_pages = 0, migrated_pages = 0;
@@ -640,10 +645,12 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 
 	own_pages = 0;
 
-	for (i = 0; i < npages; ++i) {
+	for (i = 0; i < npages;) {
+		unsigned long j;
 		struct page *page = pfn_to_page(migrate.dst[i]);
 		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
 		cur.start = i;
+		unsigned int order = 0;
 
 		pages[i] = NULL;
 		if (src_page && is_device_private_page(src_page)) {
@@ -670,7 +677,20 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 			pages[i] = page;
 		}
 		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
-		drm_pagemap_get_devmem_page(page, zdd);
+
+		if (migrate.src[i] & MIGRATE_PFN_COMPOUND) {
+			drm_WARN_ONCE(dpagemap->drm, src_page &&
+				      folio_order(page_folio(src_page)) != HPAGE_PMD_ORDER,
+				      "Unexpected folio order\n");
+
+			order = HPAGE_PMD_ORDER;
+			migrate.dst[i] |= MIGRATE_PFN_COMPOUND;
+
+			for (j = 1; j < NR_PAGES(order) && i + j < npages; j++)
+				migrate.dst[i + j] = 0;
+		}
+
+		drm_pagemap_get_devmem_page(page, order, zdd);
 
 		/* If we switched the migrating drm_pagemap, migrate previous pages now */
 		err = drm_pagemap_migrate_range(devmem_allocation, migrate.src, migrate.dst,
@@ -680,7 +700,10 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 			npages = i + 1;
 			goto err_finalize;
 		}
+
+		i += NR_PAGES(order);
 	}
+
 	cur.start = npages;
 	cur.ops = NULL; /* Force migration */
 	err = drm_pagemap_migrate_range(devmem_allocation, migrate.src, migrate.dst,
@@ -789,6 +812,8 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
 		page = folio_page(folio, 0);
 		mpfn[i] = migrate_pfn(page_to_pfn(page));
 
+		if (order)
+			mpfn[i] |= MIGRATE_PFN_COMPOUND;
 next:
 		if (page)
 			addr += page_size(page);
@@ -1044,8 +1069,15 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
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
@@ -1098,7 +1130,8 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 		.vma		= vas,
 		.pgmap_owner	= page_pgmap(page)->owner,
 		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
-		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
+				  MIGRATE_VMA_SELECT_DEVICE_COHERENT |
+				  MIGRATE_VMA_SELECT_COMPOUND,
 		.fault_page	= page,
 	};
 	struct drm_pagemap_migrate_details mdetails = {};
@@ -1164,8 +1197,15 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
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
@@ -1223,9 +1263,22 @@ static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
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
+	folio_set_zone_device_data(new_folio, drm_pagemap_zdd_get(zdd));
+}
+
 static const struct dev_pagemap_ops drm_pagemap_pagemap_ops = {
 	.folio_free = drm_pagemap_folio_free,
 	.migrate_to_ram = drm_pagemap_migrate_to_ram,
+	.folio_split = drm_pagemap_folio_split,
 };
 
 /**
-- 
2.43.0

