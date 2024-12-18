Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1051D9F5A74
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 00:33:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4006010EAB1;
	Tue, 17 Dec 2024 23:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DlTaAfDT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1F310E307;
 Tue, 17 Dec 2024 23:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734478388; x=1766014388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CEH5sej1V48OhyKKd0SnWz9CyK8tN6ERQugH5BiBRsg=;
 b=DlTaAfDTNhUfOMO21NRG9T9Hzcz5Q2HoehsFe6Evt3f0jJ+yQYDe/6HU
 HUtCLNVmPbkQQzWc4rwfpRDZ4syy8RJblgTdpGJdMHThzp/3azGCBifMF
 /DTQ0RQUW9ZlPT8FWo7wdPz9ab1jtsAgPUVAl3aIr2GXtTGqnSQmyOFws
 bohXjuyGt+CP+f211AX5mCCHjJbJmioF1CvYH9l6Ba1bDOv2c6JRJNbg2
 FhGzSxQIwpTLDxco6do0Fn4vE4X4mIbEpa5Gp1QZOPukAKfb1GJDdYAVo
 xuZWQ6v8+0UyvIojq82avlkkcfiq2g+FJHztKQ2NNhCVFDEyrnzaykgzk w==;
X-CSE-ConnectionGUID: p0W0Ao2IS9yKXBLekq9PiA==
X-CSE-MsgGUID: 4hJhzK/CT1i0ecdDaj8Lfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="22517340"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="22517340"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:07 -0800
X-CSE-ConnectionGUID: N17vf9j9R9yOgn3ygzX2FA==
X-CSE-MsgGUID: ZBW+0QPgT7y39zJWWfc9qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102273424"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v3 03/30] mm/migrate: Trylock device page in do_swap_page
Date: Tue, 17 Dec 2024 15:33:21 -0800
Message-Id: <20241217233348.3519726-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217233348.3519726-1-matthew.brost@intel.com>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
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

Cc: Alistair Popple <apopple@nvidia.com>
Cc: Philip Yang <Philip.Yang@amd.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 mm/memory.c         | 13 ++++++---
 mm/migrate_device.c | 64 ++++++++++++++++++++++++++++++++-------------
 2 files changed, 55 insertions(+), 22 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 75c2dfd04f72..ae8b11131dad 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4267,10 +4267,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
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
index 19960743f927..3470357d9bae 100644
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
+			/* FIXME support THP */
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
@@ -841,7 +850,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
 		}
 
 		remove_migration_ptes(src, dst, 0);
-		folio_unlock(src);
+		if (fault_folio != src)
+			folio_unlock(src);
 
 		if (folio_is_zone_device(src))
 			folio_put(src);
@@ -849,6 +859,7 @@ void migrate_device_finalize(unsigned long *src_pfns,
 			folio_putback_lru(src);
 
 		if (dst != src) {
+			WARN_ON_ONCE(fault_folio == dst);
 			folio_unlock(dst);
 			if (folio_is_zone_device(dst))
 				folio_put(dst);
@@ -857,6 +868,22 @@ void migrate_device_finalize(unsigned long *src_pfns,
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
@@ -872,7 +899,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
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

