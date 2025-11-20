Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23859C75890
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 18:05:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7710410E78F;
	Thu, 20 Nov 2025 17:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVBDHs8c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2B310E78F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 17:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763658327; x=1795194327;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0P+F2Tg0fn+MXjgxnMgiCiFpy4TcG5e/HDS82IiOpjI=;
 b=JVBDHs8coFTYxq8wiuyCHU4Jr7lyJYuonmE9NMVYM/IyP36ypBR66veI
 YfH82lFy7MFIUrYBIHlOeQtMOTtS7ryVM4CxVMH6VwEcB8+flWZLqRvin
 FkyQrHlp7dHhjKmtcxq44QzJJ/fK2jthGIYBsfkUz27n8QPU+PFZ3ABLi
 J7IXabkQp6frCn7JBIOPCISa7NB4yPCUeSlF/pieWRCC/dvEvsAEQnqYI
 n5FAI0L16pLMB7ouMlHmys0Wk6rOsFOovBtwRwfvHL4BR5gm7gHaHNSUY
 Azc2mYu8IhWhb7veAIeMF2eHAvJlqPO9t8O5iuxiQv1bM7r37HjuOc7Yk w==;
X-CSE-ConnectionGUID: aOmsG8a8ROCEvovsSLvBkA==
X-CSE-MsgGUID: 8LQyXUmRRxGYUQPqtlOAOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="77205140"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="77205140"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 09:05:26 -0800
X-CSE-ConnectionGUID: d67znad0TziXigjrOBwcAQ==
X-CSE-MsgGUID: SxjtGamwQXaoMQ8AZZezmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="190710630"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 09:05:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Balbir Singh <balbirs@nvidia.com>
Subject: [PATCH] fixup: mm/migrate_device: handle partially mapped folios
 during
Date: Thu, 20 Nov 2025 09:05:15 -0800
Message-Id: <20251120170515.46504-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Splitting a partially mapped folio caused a regression in the Intel Xe
SVM test suite in the mremap section, resulting in the following stack
trace:

 NFO: task kworker/u65:2:1642 blocked for more than 30 seconds.
[  212.624286]       Tainted: G S      W           6.18.0-rc6-xe+ #1719
[  212.638288] Workqueue: xe_page_fault_work_queue xe_pagefault_queue_work [xe]
[  212.638323] Call Trace:
[  212.638324]  <TASK>
[  212.638325]  __schedule+0x4b0/0x990
[  212.638330]  schedule+0x22/0xd0
[  212.638331]  io_schedule+0x41/0x60
[  212.638333]  migration_entry_wait_on_locked+0x1d8/0x2d0
[  212.638336]  ? __pfx_wake_page_function+0x10/0x10
[  212.638339]  migration_entry_wait+0xd2/0xe0
[  212.638341]  hmm_vma_walk_pmd+0x7c9/0x8d0
[  212.638343]  walk_pgd_range+0x51d/0xa40
[  212.638345]  __walk_page_range+0x75/0x1e0
[  212.638347]  walk_page_range_mm+0x138/0x1f0
[  212.638349]  hmm_range_fault+0x59/0xa0
[  212.638351]  drm_gpusvm_get_pages+0x194/0x7b0 [drm_gpusvm_helper]
[  212.638354]  drm_gpusvm_range_get_pages+0x2d/0x40 [drm_gpusvm_helper]
[  212.638355]  __xe_svm_handle_pagefault+0x259/0x900 [xe]
[  212.638375]  ? update_load_avg+0x7f/0x6c0
[  212.638377]  ? update_curr+0x13d/0x170
[  212.638379]  xe_svm_handle_pagefault+0x37/0x90 [xe]
[  212.638396]  xe_pagefault_queue_work+0x2da/0x3c0 [xe]
[  212.638420]  process_one_work+0x16e/0x2e0
[  212.638422]  worker_thread+0x284/0x410
[  212.638423]  ? __pfx_worker_thread+0x10/0x10
[  212.638425]  kthread+0xec/0x210
[  212.638427]  ? __pfx_kthread+0x10/0x10
[  212.638428]  ? __pfx_kthread+0x10/0x10
[  212.638430]  ret_from_fork+0xbd/0x100
[  212.638433]  ? __pfx_kthread+0x10/0x10
[  212.638434]  ret_from_fork_asm+0x1a/0x30
[  212.638436]  </TASK>

The issue appears to be that migration PTEs are not properly removed
after a split.

This change refactors the code to perform the split in a slightly
different manner while retaining the original patch’s intent. With this
update, the Intel Xe SVM test suite fully passes.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Rakie Kim <rakie.kim@sk.com>
Cc: Byungchul Park <byungchul@sk.com>
Cc: Gregory Price <gourry@gourry.net>
Cc: Ying Huang <ying.huang@linux.alibaba.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: Mika Penttilä <mpenttil@redhat.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Balbir Singh <balbirs@nvidia.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>

---
This fixup should be squashed into the patch "mm/migrate_device: handle
partially mapped folios during" in mm/mm-unstable

I replaced the original patch with a local patch I authored a while back
that solves the same problem but uses a different code structure. The
failing test case—only available on an Xe driver—passes with this patch.
I can attempt to fix up the original patch within its structure if
that’s preferred.
---
 mm/migrate_device.c | 42 ++++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index fa42d2ebd024..69e88f4a2563 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -254,6 +254,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 	spinlock_t *ptl;
 	struct folio *fault_folio = migrate->fault_page ?
 		page_folio(migrate->fault_page) : NULL;
+	struct folio *split_folio = NULL;
 	pte_t *ptep;
 
 again:
@@ -266,10 +267,11 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			return 0;
 	}
 
-	ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
+	ptep = pte_offset_map_lock(mm, pmdp, start, &ptl);
 	if (!ptep)
 		goto again;
 	arch_enter_lazy_mmu_mode();
+	ptep += (addr - start) / PAGE_SIZE;
 
 	for (; addr < end; addr += PAGE_SIZE, ptep++) {
 		struct dev_pagemap *pgmap;
@@ -347,22 +349,6 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 					pgmap->owner != migrate->pgmap_owner)
 					goto next;
 			}
-			folio = page ? page_folio(page) : NULL;
-			if (folio && folio_test_large(folio)) {
-				int ret;
-
-				pte_unmap_unlock(ptep, ptl);
-				ret = migrate_vma_split_folio(folio,
-							  migrate->fault_page);
-
-				if (ret) {
-					ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
-					goto next;
-				}
-
-				addr = start;
-				goto again;
-			}
 			mpfn = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
 			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
 		}
@@ -400,6 +386,11 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			bool anon_exclusive;
 			pte_t swp_pte;
 
+			if (folio_order(folio)) {
+				split_folio = folio;
+				goto split;
+			}
+
 			flush_cache_page(vma, addr, pte_pfn(pte));
 			anon_exclusive = folio_test_anon(folio) &&
 					  PageAnonExclusive(page);
@@ -478,8 +469,23 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 	if (unmapped)
 		flush_tlb_range(walk->vma, start, end);
 
+split:
 	arch_leave_lazy_mmu_mode();
-	pte_unmap_unlock(ptep - 1, ptl);
+	pte_unmap_unlock(ptep - 1 + !!split_folio, ptl);
+
+	if (split_folio) {
+		int ret;
+
+		ret = split_folio(split_folio);
+		if (fault_folio != split_folio)
+			folio_unlock(split_folio);
+		folio_put(split_folio);
+		if (ret)
+			return migrate_vma_collect_skip(addr, end, walk);
+
+		split_folio = NULL;
+		goto again;
+	}
 
 	return 0;
 }
-- 
2.34.1

