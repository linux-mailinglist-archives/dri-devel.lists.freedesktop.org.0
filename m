Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92ED2CC5121
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 21:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED83310E877;
	Tue, 16 Dec 2025 20:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mu9zAX+F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE42010E877;
 Tue, 16 Dec 2025 20:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765915968; x=1797451968;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jJO3G10ACniqsqysGzqO6NRTVBgnrZPFSsiej9kH6HY=;
 b=mu9zAX+FHj+3AAlwFNuo40dYMNM4qRHDUSuzkX/nuIHDX0UfK2VviQSb
 zrTZacweB3gb2SIhZ+d3Zh/sUtWuEYpu+XAFRtcllB3cm6d0sg/7rQBDo
 3qCy1oy4eJrLv2T3FuBz0jAzcjgwfurHa8gHbqoxdQCERZqJtZEb7YZoa
 iTVJ6XZAVKgKaYG1vlPy/8XFjbA55rb+H5l5JEB0PfK9+ATKdLDdOArCE
 JyUG2rfvq+dMXxu3uWtbSVhZD+Tw2TT52S8T/EwaPBYrrW9P0w5pRU3ZT
 23Wz1Iokf067MWjrv3HsJC7CwvAKYFeiLo4JpbB/G+d5FdMdb4aVyCxto Q==;
X-CSE-ConnectionGUID: AIS4kTQLSM6XgxMrpu91Dg==
X-CSE-MsgGUID: IsyVKxNrTFKnc45kGowwJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="68000587"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="68000587"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 12:12:48 -0800
X-CSE-ConnectionGUID: RVENZz1xQe2yCg80GOVXUw==
X-CSE-MsgGUID: K/tDzmBqRJiYHh7wqMY/MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="202612446"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.214])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 12:12:46 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 3/4] drm/pagemap: Add helper to access zone_device_data
Date: Tue, 16 Dec 2025 21:10:13 +0100
Message-ID: <20251216201206.1660899-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216201206.1660899-1-francois.dugast@intel.com>
References: <20251216201206.1660899-1-francois.dugast@intel.com>
MIME-Version: 1.0
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

This new helper helps ensure all accesses to zone_device_data use the
correct API whether the page is part of a folio or not.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c  |  7 +++++--
 drivers/gpu/drm/drm_pagemap.c | 32 +++++++++++++++++++++++++-------
 include/drm/drm_pagemap.h     |  2 ++
 3 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 39c8c50401dd..d0ff6b65e543 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1366,12 +1366,15 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
 		if (is_device_private_page(page) ||
 		    is_device_coherent_page(page)) {
+			struct drm_pagemap_zdd *__zdd =
+				drm_pagemap_page_zone_device_data(page);
+
 			if (!ctx->allow_mixed &&
-			    zdd != page->zone_device_data && i > 0) {
+			    zdd != __zdd && i > 0) {
 				err = -EOPNOTSUPP;
 				goto err_unmap;
 			}
-			zdd = page->zone_device_data;
+			zdd = __zdd;
 			if (pagemap != page_pgmap(page)) {
 				if (i > 0) {
 					err = -EOPNOTSUPP;
diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 491de9275add..b71e47136112 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -192,6 +192,22 @@ static void drm_pagemap_migration_unlock_put_pages(unsigned long npages,
 	}
 }
 
+/**
+ * drm_pagemap_page_zone_device_data() - Page to zone_device_data
+ * @page: Pointer to the page
+ *
+ * Return: Page's zone_device_data
+ */
+void *drm_pagemap_page_zone_device_data(struct page *page)
+{
+	struct folio *folio = page_folio(page);
+
+	if (folio_order(folio))
+		return folio_zone_device_data(folio);
+
+	return page->zone_device_data;
+}
+
 /**
  * drm_pagemap_get_devmem_page() - Get a reference to a device memory page
  * @page: Pointer to the page
@@ -481,8 +497,8 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
 			goto next;
 
 		if (fault_page) {
-			if (src_page->zone_device_data !=
-			    fault_page->zone_device_data)
+			if (drm_pagemap_page_zone_device_data(src_page) !=
+			    drm_pagemap_page_zone_device_data(fault_page))
 				goto next;
 		}
 
@@ -670,7 +686,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	int i, err = 0;
 
 	if (page) {
-		zdd = page->zone_device_data;
+		zdd = drm_pagemap_page_zone_device_data(page);
 		if (time_before64(get_jiffies_64(),
 				  zdd->devmem_allocation->timeslice_expiration))
 			return 0;
@@ -722,7 +738,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 		if (!page)
 			goto err_finalize;
 	}
-	zdd = page->zone_device_data;
+	zdd = drm_pagemap_page_zone_device_data(page);
 	ops = zdd->devmem_allocation->ops;
 	dev = zdd->devmem_allocation->dev;
 
@@ -768,7 +784,9 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
  */
 static void drm_pagemap_folio_free(struct folio *folio)
 {
-	drm_pagemap_zdd_put(folio->page.zone_device_data);
+	struct page *page = folio_page(folio, 0);
+
+	drm_pagemap_zdd_put(drm_pagemap_page_zone_device_data(page));
 }
 
 /**
@@ -784,7 +802,7 @@ static void drm_pagemap_folio_free(struct folio *folio)
  */
 static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
 {
-	struct drm_pagemap_zdd *zdd = vmf->page->zone_device_data;
+	struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(vmf->page);
 	int err;
 
 	err = __drm_pagemap_migrate_to_ram(vmf->vma,
@@ -847,7 +865,7 @@ EXPORT_SYMBOL_GPL(drm_pagemap_devmem_init);
  */
 struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page)
 {
-	struct drm_pagemap_zdd *zdd = page->zone_device_data;
+	struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(page);
 
 	return zdd->devmem_allocation->dpagemap;
 }
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index f6e7e234c089..3a8d0e1cef43 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -245,4 +245,6 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 			    struct mm_struct *mm,
 			    unsigned long timeslice_ms);
 
+void *drm_pagemap_page_zone_device_data(struct page *page);
+
 #endif
-- 
2.43.0

