Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA2ACF332E
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 12:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 002F510E287;
	Mon,  5 Jan 2026 11:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TNekHw2z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD1A10E188;
 Mon,  5 Jan 2026 11:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767612017; x=1799148017;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2HIHA16zmLiFbZvq8CU5ASvcz/gqbvojMsrjuZnL27E=;
 b=TNekHw2zozx22AaZF+aNMslkjhcmPBl3kpNKuU56gby6XO2eqiWsmAee
 mtlDIXQJKDHrZ43i1oH1UE7Db8Yyt6+sAQdh5W+d01PdVnEUBhBtLLdLW
 T2siZ0rgv5+0PLKGlxKgMudW8z9YgC5jnD4ShMFglCfzWLbc7bYRlHF7M
 0ltBwI2sdDPHyu/4+s+L3xzUwQRLQNqGTswyC8Sm0R/cA/JnjzUGqFfBA
 /sGBdqw0gHwYlN6dVNvVhSNWDVDCOgiz20BPoSGhfrQmmZTJntlyGbOwL
 y2ETnJPypx00YZWme2nrsgkCSkixQpqO6gOHEBwBoTSyzkChH26X+1CGE A==;
X-CSE-ConnectionGUID: /J8GZ6ybQOCPDy+dZor9kg==
X-CSE-MsgGUID: YVD+67mcSmiSbUqZ/cHC/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="80095642"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="80095642"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 03:20:16 -0800
X-CSE-ConnectionGUID: RP8imotQR1C3BMcWXvqg1Q==
X-CSE-MsgGUID: 18SZC34nQBuomVq4t/zhCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="201996916"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.244.143])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 03:20:15 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v2 1/5] mm/migrate: Add migrate_device_split_page
Date: Mon,  5 Jan 2026 12:18:24 +0100
Message-ID: <20260105111945.73292-2-francois.dugast@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Introduce migrate_device_split_page() to split a device page into
lower-order pages. Used when a folio allocated as higher-order is freed
and later reallocated at a smaller order by the driver memory manager.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/linux/huge_mm.h |  3 +++
 include/linux/migrate.h |  1 +
 mm/huge_memory.c        |  6 ++---
 mm/migrate_device.c     | 49 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index a4d9f964dfde..6ad8f359bc0d 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -374,6 +374,9 @@ int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list
 int folio_split_unmapped(struct folio *folio, unsigned int new_order);
 unsigned int min_order_for_split(struct folio *folio);
 int split_folio_to_list(struct folio *folio, struct list_head *list);
+int __split_unmapped_folio(struct folio *folio, int new_order,
+			   struct page *split_at, struct xa_state *xas,
+			   struct address_space *mapping, enum split_type split_type);
 int folio_check_splittable(struct folio *folio, unsigned int new_order,
 			   enum split_type split_type);
 int folio_split(struct folio *folio, unsigned int new_order, struct page *page,
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 26ca00c325d9..ec65e4fd5f88 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -192,6 +192,7 @@ void migrate_device_pages(unsigned long *src_pfns, unsigned long *dst_pfns,
 			unsigned long npages);
 void migrate_device_finalize(unsigned long *src_pfns,
 			unsigned long *dst_pfns, unsigned long npages);
+int migrate_device_split_page(struct page *page);
 
 #endif /* CONFIG_MIGRATION */
 
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 40cf59301c21..7ded35a3ecec 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3621,9 +3621,9 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
  * Return: 0 - successful, <0 - failed (if -ENOMEM is returned, @folio might be
  * split but not to @new_order, the caller needs to check)
  */
-static int __split_unmapped_folio(struct folio *folio, int new_order,
-		struct page *split_at, struct xa_state *xas,
-		struct address_space *mapping, enum split_type split_type)
+int __split_unmapped_folio(struct folio *folio, int new_order,
+			   struct page *split_at, struct xa_state *xas,
+			   struct address_space *mapping, enum split_type split_type)
 {
 	const bool is_anon = folio_test_anon(folio);
 	int old_order = folio_order(folio);
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 23379663b1e1..eb0f0e938947 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -775,6 +775,49 @@ int migrate_vma_setup(struct migrate_vma *args)
 EXPORT_SYMBOL(migrate_vma_setup);
 
 #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
+/**
+ * migrate_device_split_page() - Split device page
+ * @page: Device page to split
+ *
+ * Splits a device page into smaller pages. Typically called when reallocating a
+ * folio to a smaller size. Inherently racy—only safe if the caller ensures
+ * mutual exclusion within the page's folio (i.e., no other threads are using
+ * pages within the folio). Expected to be called a free device page and
+ * restores all split out pages to a free state.
+ */
+int migrate_device_split_page(struct page *page)
+{
+	struct folio *folio = page_folio(page);
+	struct dev_pagemap *pgmap = folio->pgmap;
+	struct page *unlock_page = folio_page(folio, 0);
+	unsigned int order = folio_order(folio), i;
+	int ret = 0;
+
+	VM_BUG_ON_FOLIO(!order, folio);
+	VM_BUG_ON_FOLIO(!folio_is_device_private(folio), folio);
+	VM_BUG_ON_FOLIO(folio_ref_count(folio), folio);
+
+	folio_lock(folio);
+
+	ret = __split_unmapped_folio(folio, 0, page, NULL, NULL, SPLIT_TYPE_UNIFORM);
+	if (ret) {
+	       /*
+		* We can't fail here unless the caller doesn't know what they
+		* are doing.
+		*/
+		VM_BUG_ON_FOLIO(ret, folio);
+
+		return ret;
+	}
+
+	for (i = 0; i < 0x1 << order; ++i, ++unlock_page) {
+		page_folio(unlock_page)->pgmap = pgmap;
+		folio_unlock(page_folio(unlock_page));
+	}
+
+	return 0;
+}
+
 /**
  * migrate_vma_insert_huge_pmd_page: Insert a huge folio into @migrate->vma->vm_mm
  * at @addr. folio is already allocated as a part of the migration process with
@@ -927,6 +970,11 @@ static int migrate_vma_split_unmapped_folio(struct migrate_vma *migrate,
 	return ret;
 }
 #else /* !CONFIG_ARCH_ENABLE_THP_MIGRATION */
+int migrate_device_split_page(struct page *page)
+{
+	return 0;
+}
+
 static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
 					 unsigned long addr,
 					 struct page *page,
@@ -943,6 +991,7 @@ static int migrate_vma_split_unmapped_folio(struct migrate_vma *migrate,
 	return 0;
 }
 #endif
+EXPORT_SYMBOL(migrate_device_split_page);
 
 static unsigned long migrate_vma_nr_pages(unsigned long *src)
 {
-- 
2.43.0

