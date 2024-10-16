Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D64399FF5E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 05:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667DC10E649;
	Wed, 16 Oct 2024 03:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="frO9h/jR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF0010E002;
 Wed, 16 Oct 2024 03:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729049098; x=1760585098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7L7mp3cx2N4b3LLUjOguTS0voFVyCg1wRlFDmHOBUQ8=;
 b=frO9h/jRDr2aGRemaHVmTN8BKZsgS/P8ggD3McfBZ8iZU8TW1j+/m3TI
 UNa4wyKGTMa1J0mHKhO1ZnYvU8P2HNY6A6rSFoH1BXJRjjl3DUcGF416c
 +5qR4RCHXsspzbtbtCfNJ/tZMNnemPQitu3RN8PFbFjntINVmv/5lEcvt
 ZtjH9Edq6inaw6BCTBbr91/Zfd807A513M72qw2I04X8Oxsqie2pcrETq
 iMDKLeSx3jWADyNHOet0DXbsTdj2tWFfdtaGM1RobIXUwSHaEtf68DOXg
 lD0Bgwao+sz0FStc1mgR1pXCPG4qLyJaxd1DYJQ5wSaHQZoa927W6QZot Q==;
X-CSE-ConnectionGUID: gMPUOFahTeKNe369BayRHA==
X-CSE-MsgGUID: D1CEjgxlQlyazQ0dWtK0VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39056343"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="39056343"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:57 -0700
X-CSE-ConnectionGUID: km/YSzaoRX29QD66wNwNfg==
X-CSE-MsgGUID: WFLfxXr+S6iKIWpl7VkIsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="78930252"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v2 03/29] mm/migrate: Trylock device page in do_swap_page
Date: Tue, 15 Oct 2024 20:24:52 -0700
Message-Id: <20241016032518.539495-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016032518.539495-1-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
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

Cc: Philip Yang <Philip.Yang@amd.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Suggessted-by: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 mm/memory.c         | 13 ++++++---
 mm/migrate_device.c | 69 ++++++++++++++++++++++++++++++---------------
 2 files changed, 56 insertions(+), 26 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 2366578015ad..b72bde782611 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4252,10 +4252,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
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
+				put_page(vmf->page);
+				unlock_page(vmf->page);
+			} else {
+				pte_unmap_unlock(vmf->pte, vmf->ptl);
+			}
 		} else if (is_hwpoison_entry(entry)) {
 			ret = VM_FAULT_HWPOISON;
 		} else if (is_pte_marker_entry(entry)) {
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index f163c2131022..2477d39f57be 100644
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
@@ -88,11 +90,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 
 			folio_get(folio);
 			spin_unlock(ptl);
-			if (unlikely(!folio_trylock(folio)))
+			if (unlikely(fault_folio != folio &&
+				     !folio_trylock(folio)))
 				return migrate_vma_collect_skip(start, end,
 								walk);
 			ret = split_folio(folio);
-			folio_unlock(folio);
+			if (fault_folio != folio)
+				folio_unlock(folio);
 			folio_put(folio);
 			if (ret)
 				return migrate_vma_collect_skip(start, end,
@@ -192,7 +196,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 		 * optimisation to avoid walking the rmap later with
 		 * try_to_migrate().
 		 */
-		if (folio_trylock(folio)) {
+		if (fault_folio == folio || folio_trylock(folio)) {
 			bool anon_exclusive;
 			pte_t swp_pte;
 
@@ -204,7 +208,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 
 				if (folio_try_share_anon_rmap_pte(folio, page)) {
 					set_pte_at(mm, addr, ptep, pte);
-					folio_unlock(folio);
+					if (fault_folio != folio)
+						folio_unlock(folio);
 					folio_put(folio);
 					mpfn = 0;
 					goto next;
@@ -363,6 +368,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 					  unsigned long npages,
 					  struct page *fault_page)
 {
+	struct folio *fault_folio = fault_page ?
+		page_folio(fault_page) : NULL;
 	unsigned long i, restore = 0;
 	bool allow_drain = true;
 	unsigned long unmapped = 0;
@@ -427,7 +434,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 		remove_migration_ptes(folio, folio, 0);
 
 		src_pfns[i] = 0;
-		folio_unlock(folio);
+		if (fault_folio != folio)
+			folio_unlock(folio);
 		folio_put(folio);
 		restore--;
 	}
@@ -536,6 +544,8 @@ int migrate_vma_setup(struct migrate_vma *args)
 		return -EINVAL;
 	if (args->fault_page && !is_device_private_page(args->fault_page))
 		return -EINVAL;
+	if (args->fault_page && !PageLocked(args->fault_page))
+		return -EINVAL;
 
 	memset(args->src, 0, sizeof(*args->src) * nr_pages);
 	args->cpages = 0;
@@ -799,19 +809,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
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
@@ -824,7 +828,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
 
 		if (!page) {
 			if (dst) {
-				folio_unlock(dst);
+				if (fault_folio != dst)
+					folio_unlock(dst);
 				folio_put(dst);
 			}
 			continue;
@@ -834,14 +839,16 @@ void migrate_device_finalize(unsigned long *src_pfns,
 
 		if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE) || !dst) {
 			if (dst) {
-				folio_unlock(dst);
+				if (fault_folio != dst)
+					folio_unlock(dst);
 				folio_put(dst);
 			}
 			dst = src;
 		}
 
 		remove_migration_ptes(src, dst, 0);
-		folio_unlock(src);
+		if (fault_folio != src)
+			folio_unlock(src);
 
 		if (folio_is_zone_device(src))
 			folio_put(src);
@@ -849,7 +856,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
 			folio_putback_lru(src);
 
 		if (dst != src) {
-			folio_unlock(dst);
+			if (fault_folio != dst)
+				folio_unlock(dst);
 			if (folio_is_zone_device(dst))
 				folio_put(dst);
 			else
@@ -857,6 +865,22 @@ void migrate_device_finalize(unsigned long *src_pfns,
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
+			unsigned long *dst_pfns, unsigned long npages)
+{
+	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL);
+}
 EXPORT_SYMBOL(migrate_device_finalize);
 
 /**
@@ -872,7 +896,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
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

