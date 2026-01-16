Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF19BD302EB
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 12:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EAB610E887;
	Fri, 16 Jan 2026 11:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yb0vyGR4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71AC510E88B;
 Fri, 16 Jan 2026 11:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768562056; x=1800098056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0bXpiyD5D1p0BHaDpVOZ3vCIiWJnAz1jNbixl6MsiwI=;
 b=Yb0vyGR4wSnlvVW9M3HKEeBP42/kljrlCREkXDndsvTXhPvLpCH87d32
 SFHu8ibagIamoKWuKnYUHrAC1QKsx8Ok023sk6ULtxLw6ajiT5T7L/CHm
 S4IiSfjPYwL4RRDu0Jg4Fd58uM2tfqg+7a9I4PXMWVt+qV8sQlq1AOvdr
 5nCBt1FiTHknYDdKJr82HGW9+/A7IWLMoxkUb4PvHOt5XDo+CVcoXKXoB
 dKCjYlHKQz7p3HpesB9njYWwV55/Vd+g/u+JNRlEi1Waq9wkiapITd1Jv
 hf+IK5KErigGL5ovMquEEY7CphTuZ14NQWDK6byJ8te3OoD+xdcwfzdl/ w==;
X-CSE-ConnectionGUID: XWpHxUEbSdeD+CNPdfqfDA==
X-CSE-MsgGUID: h25vsigxRBqZgapJynNjHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69930678"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="69930678"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 03:14:16 -0800
X-CSE-ConnectionGUID: kdoUG+RKTnydb50m5cMYlg==
X-CSE-MsgGUID: wZs93xzgRiaqMSgQu8kekA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="209713464"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.245.100])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 03:14:12 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, linux-mm@kvack.org,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v6 3/5] drm/pagemap: Add helper to access zone_device_data
Date: Fri, 16 Jan 2026 12:10:18 +0100
Message-ID: <20260116111325.1736137-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116111325.1736137-1-francois.dugast@intel.com>
References: <20260116111325.1736137-1-francois.dugast@intel.com>
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

v2:
- Move to drm_pagemap.h, stick to folio_zone_device_data (Matthew Brost)
- Return struct drm_pagemap_zdd * (Matthew Brost)

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Balbir Singh <balbirs@nvidia.com>
Cc: linux-mm@kvack.org
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c  |  7 +++++--
 drivers/gpu/drm/drm_pagemap.c | 21 ++++++++++++---------
 include/drm/drm_pagemap.h     | 15 +++++++++++++++
 3 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index aa9a0b60e727..585d913d3d19 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1488,12 +1488,15 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
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
index 8e24a2c24729..61c6ca59df81 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -252,7 +252,7 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
 		order = folio_order(folio);
 
 		if (is_device_private_page(page)) {
-			struct drm_pagemap_zdd *zdd = page->zone_device_data;
+			struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(page);
 			struct drm_pagemap *dpagemap = zdd->dpagemap;
 			struct drm_pagemap_addr addr;
 
@@ -323,7 +323,7 @@ static void drm_pagemap_migrate_unmap_pages(struct device *dev,
 			goto next;
 
 		if (is_zone_device_page(page)) {
-			struct drm_pagemap_zdd *zdd = page->zone_device_data;
+			struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(page);
 			struct drm_pagemap *dpagemap = zdd->dpagemap;
 
 			dpagemap->ops->device_unmap(dpagemap, dev, pagemap_addr[i]);
@@ -611,7 +611,8 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 
 		pages[i] = NULL;
 		if (src_page && is_device_private_page(src_page)) {
-			struct drm_pagemap_zdd *src_zdd = src_page->zone_device_data;
+			struct drm_pagemap_zdd *src_zdd =
+				drm_pagemap_page_zone_device_data(src_page);
 
 			if (page_pgmap(src_page) == pagemap &&
 			    !mdetails->can_migrate_same_pagemap) {
@@ -733,8 +734,8 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
 			goto next;
 
 		if (fault_page) {
-			if (src_page->zone_device_data !=
-			    fault_page->zone_device_data)
+			if (drm_pagemap_page_zone_device_data(src_page) !=
+			    drm_pagemap_page_zone_device_data(fault_page))
 				goto next;
 		}
 
@@ -1075,7 +1076,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	void *buf;
 	int i, err = 0;
 
-	zdd = page->zone_device_data;
+	zdd = drm_pagemap_page_zone_device_data(page);
 	if (time_before64(get_jiffies_64(), zdd->devmem_allocation->timeslice_expiration))
 		return 0;
 
@@ -1158,7 +1159,9 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
  */
 static void drm_pagemap_folio_free(struct folio *folio)
 {
-	drm_pagemap_zdd_put(folio->page.zone_device_data);
+	struct page *page = folio_page(folio, 0);
+
+	drm_pagemap_zdd_put(drm_pagemap_page_zone_device_data(page));
 }
 
 /**
@@ -1174,7 +1177,7 @@ static void drm_pagemap_folio_free(struct folio *folio)
  */
 static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
 {
-	struct drm_pagemap_zdd *zdd = vmf->page->zone_device_data;
+	struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(vmf->page);
 	int err;
 
 	err = __drm_pagemap_migrate_to_ram(vmf->vma,
@@ -1240,7 +1243,7 @@ EXPORT_SYMBOL_GPL(drm_pagemap_devmem_init);
  */
 struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page)
 {
-	struct drm_pagemap_zdd *zdd = page->zone_device_data;
+	struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(page);
 
 	return zdd->devmem_allocation->dpagemap;
 }
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index 46e9c58f09e0..736fb6cb7b33 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -4,6 +4,7 @@
 
 #include <linux/dma-direction.h>
 #include <linux/hmm.h>
+#include <linux/memremap.h>
 #include <linux/types.h>
 
 #define NR_PAGES(order) (1U << (order))
@@ -359,4 +360,18 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool is_atomic_or_reclaim);
 
 int drm_pagemap_reinit(struct drm_pagemap *dpagemap);
+
+/**
+ * drm_pagemap_page_zone_device_data() - Page to zone_device_data
+ * @page: Pointer to the page
+ *
+ * Return: Page's zone_device_data
+ */
+static inline struct drm_pagemap_zdd *drm_pagemap_page_zone_device_data(struct page *page)
+{
+	struct folio *folio = page_folio(page);
+
+	return folio_zone_device_data(folio);
+}
+
 #endif
-- 
2.43.0

