Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57368A53FC6
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 02:26:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8630F10E89A;
	Thu,  6 Mar 2025 01:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CEjXvpDo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6C010E887;
 Thu,  6 Mar 2025 01:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741224359; x=1772760359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R/TULqq9oorBwLAtyINe8dPPy0T9sNiFkGIpj+0ktcI=;
 b=CEjXvpDozCViLF7xnUQikRO9fcZoxax+4Rpm5s6OGwVTHlEUQ9By6YJk
 0MaO2zqS3JdwNo8O6WnBhMPHJmnEu1/UaFTOLzHh7cNktZXa6ze6RpzLO
 27ACd9ZWMPbfGpxf6rnp6HCpvFCfuRfXuDGWr8Se3XC9FFVwPr9sRef3G
 7Lttju/eLYQfD1kz4oyBv59PhMZkuZdAPSvLk6uwMsfEGov+CC+MswLiq
 MTeXpT1E9hbHS63eLkMiZ2WKHxfBnzLXkMP8aNV4Ngi9nCNN3JSdIUNpp
 4xe/w0ibw0XiHkSEtk2MG2vTiDGSxMnlQGB/9F7E8vCTxbDC2GKCC6iCM w==;
X-CSE-ConnectionGUID: izUhz00HSTiesjQkfEzzRg==
X-CSE-MsgGUID: f9UPZyyPQRmbXBJMlWAeqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52427267"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="52427267"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:53 -0800
X-CSE-ConnectionGUID: BCqQSk08R9u9PmTec6RErQ==
X-CSE-MsgGUID: kxYBIq/pT6q03tsZNOBgkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124063240"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v7 03/32] mm/migrate: Trylock device page in do_swap_page
Date: Wed,  5 Mar 2025 17:26:28 -0800
Message-Id: <20250306012657.3505757-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306012657.3505757-1-matthew.brost@intel.com>
References: <20250306012657.3505757-1-matthew.brost@intel.com>
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

Avoid multiple CPU page faults to the same device page racing by trying
to lock the page in do_swap_page before taking an extra reference to the
page. This prevents scenarios where multiple CPU page faults each take
an extra reference to a device page, which could abort migration in
folio_migrate_mapping. With the device page being locked in
do_swap_page, the migrate_vma_* functions need to be updated to avoid
locking the fault_page argument.

Prior to this change, a livelock scenario could occur in Xe's (Intel GPU
DRM driver) SVM implementation if enough threads faulted the same device
page.

v3:
 - Put page after unlocking page (Alistair)
 - Warn on spliting a TPH which is fault page (Alistair)
 - Warn on dst page == fault page (Alistair)
v6:
 - Add more verbose comment around THP (Alistair)
v7:
 - Fix migrate_device_finalize alignment (Checkpatch)

Cc: Alistair Popple <apopple@nvidia.com>
Cc: Philip Yang <Philip.Yang@amd.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Tested-by: Alistair Popple <apopple@nvidia.com>
---
 mm/memory.c         | 13 ++++++---
 mm/migrate_device.c | 64 ++++++++++++++++++++++++++++++++-------------
 2 files changed, 55 insertions(+), 22 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index b4d3d4893267..59b804f4bf3f 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4348,10 +4348,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 			 * Get a page reference while we know the page can't be
 			 * freed.
 			 */
-			get_page(vmf->page);
-			pte_unmap_unlock(vmf->pte, vmf->ptl);
-			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
-			put_page(vmf->page);
+			if (trylock_page(vmf->page)) {
+				get_page(vmf->page);
+				pte_unmap_unlock(vmf->pte, vmf->ptl);
+				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
+				unlock_page(vmf->page);
+				put_page(vmf->page);
+			} else {
+				pte_unmap_unlock(vmf->pte, vmf->ptl);
+			}
 		} else if (is_hwpoison_entry(entry)) {
 			ret = VM_FAULT_HWPOISON;
 		} else if (is_pte_marker_entry(entry)) {
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index e85ed4ab6df2..a351497ced4a 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 				   struct mm_walk *walk)
 {
 	struct migrate_vma *migrate = walk->private;
+	struct folio *fault_folio = migrate->fault_page ?
+		page_folio(migrate->fault_page) : NULL;
 	struct vm_area_struct *vma = walk->vma;
 	struct mm_struct *mm = vma->vm_mm;
 	unsigned long addr = start, unmapped = 0;
@@ -88,11 +90,16 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 
 			folio_get(folio);
 			spin_unlock(ptl);
+			/* FIXME: we don't expect THP for fault_folio */
+			if (WARN_ON_ONCE(fault_folio == folio))
+				return migrate_vma_collect_skip(start, end,
+								walk);
 			if (unlikely(!folio_trylock(folio)))
 				return migrate_vma_collect_skip(start, end,
 								walk);
 			ret = split_folio(folio);
-			folio_unlock(folio);
+			if (fault_folio != folio)
+				folio_unlock(folio);
 			folio_put(folio);
 			if (ret)
 				return migrate_vma_collect_skip(start, end,
@@ -192,7 +199,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 		 * optimisation to avoid walking the rmap later with
 		 * try_to_migrate().
 		 */
-		if (folio_trylock(folio)) {
+		if (fault_folio == folio || folio_trylock(folio)) {
 			bool anon_exclusive;
 			pte_t swp_pte;
 
@@ -204,7 +211,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 
 				if (folio_try_share_anon_rmap_pte(folio, page)) {
 					set_pte_at(mm, addr, ptep, pte);
-					folio_unlock(folio);
+					if (fault_folio != folio)
+						folio_unlock(folio);
 					folio_put(folio);
 					mpfn = 0;
 					goto next;
@@ -363,6 +371,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 					  unsigned long npages,
 					  struct page *fault_page)
 {
+	struct folio *fault_folio = fault_page ?
+		page_folio(fault_page) : NULL;
 	unsigned long i, restore = 0;
 	bool allow_drain = true;
 	unsigned long unmapped = 0;
@@ -427,7 +437,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 		remove_migration_ptes(folio, folio, 0);
 
 		src_pfns[i] = 0;
-		folio_unlock(folio);
+		if (fault_folio != folio)
+			folio_unlock(folio);
 		folio_put(folio);
 		restore--;
 	}
@@ -536,6 +547,8 @@ int migrate_vma_setup(struct migrate_vma *args)
 		return -EINVAL;
 	if (args->fault_page && !is_device_private_page(args->fault_page))
 		return -EINVAL;
+	if (args->fault_page && !PageLocked(args->fault_page))
+		return -EINVAL;
 
 	memset(args->src, 0, sizeof(*args->src) * nr_pages);
 	args->cpages = 0;
@@ -799,19 +812,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 }
 EXPORT_SYMBOL(migrate_vma_pages);
 
-/*
- * migrate_device_finalize() - complete page migration
- * @src_pfns: src_pfns returned from migrate_device_range()
- * @dst_pfns: array of pfns allocated by the driver to migrate memory to
- * @npages: number of pages in the range
- *
- * Completes migration of the page by removing special migration entries.
- * Drivers must ensure copying of page data is complete and visible to the CPU
- * before calling this.
- */
-void migrate_device_finalize(unsigned long *src_pfns,
-			unsigned long *dst_pfns, unsigned long npages)
+static void __migrate_device_finalize(unsigned long *src_pfns,
+				      unsigned long *dst_pfns,
+				      unsigned long npages,
+				      struct page *fault_page)
 {
+	struct folio *fault_folio = fault_page ?
+		page_folio(fault_page) : NULL;
 	unsigned long i;
 
 	for (i = 0; i < npages; i++) {
@@ -824,6 +831,7 @@ void migrate_device_finalize(unsigned long *src_pfns,
 
 		if (!page) {
 			if (dst) {
+				WARN_ON_ONCE(fault_folio == dst);
 				folio_unlock(dst);
 				folio_put(dst);
 			}
@@ -834,6 +842,7 @@ void migrate_device_finalize(unsigned long *src_pfns,
 
 		if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE) || !dst) {
 			if (dst) {
+				WARN_ON_ONCE(fault_folio == dst);
 				folio_unlock(dst);
 				folio_put(dst);
 			}
@@ -843,15 +852,33 @@ void migrate_device_finalize(unsigned long *src_pfns,
 		if (!folio_is_zone_device(dst))
 			folio_add_lru(dst);
 		remove_migration_ptes(src, dst, 0);
-		folio_unlock(src);
+		if (fault_folio != src)
+			folio_unlock(src);
 		folio_put(src);
 
 		if (dst != src) {
+			WARN_ON_ONCE(fault_folio == dst);
 			folio_unlock(dst);
 			folio_put(dst);
 		}
 	}
 }
+
+/*
+ * migrate_device_finalize() - complete page migration
+ * @src_pfns: src_pfns returned from migrate_device_range()
+ * @dst_pfns: array of pfns allocated by the driver to migrate memory to
+ * @npages: number of pages in the range
+ *
+ * Completes migration of the page by removing special migration entries.
+ * Drivers must ensure copying of page data is complete and visible to the CPU
+ * before calling this.
+ */
+void migrate_device_finalize(unsigned long *src_pfns,
+			     unsigned long *dst_pfns, unsigned long npages)
+{
+	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL);
+}
 EXPORT_SYMBOL(migrate_device_finalize);
 
 /**
@@ -867,7 +894,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
  */
 void migrate_vma_finalize(struct migrate_vma *migrate)
 {
-	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
+	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npages,
+				  migrate->fault_page);
 }
 EXPORT_SYMBOL(migrate_vma_finalize);
 
-- 
2.34.1

