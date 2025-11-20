Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56445C76931
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 00:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8B010E7DB;
	Thu, 20 Nov 2025 23:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jn+TaGvw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D7210E7DA
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 23:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763680112; x=1795216112;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x2VAm+R3jcI1JiM4uWkT0rwamPlQO26XoY+4izZN9Gs=;
 b=jn+TaGvwm6yhYINL9a3vuVTnNgFknAnLh5X29YlUmtRfz53GI7ZCdsRh
 GPBrT9Ej3GrUhW0r7kR0lE3pjoFCmDzBMfWS3ZgicmJ4/jkTF3K2WTrDK
 /psF8HosmOxtBWdtCv/VrlaSOW0uz/oIyOkr4/D23SAGVUta+kCAdeuLj
 BwZtEo2MuzTOX9oC0Vu2bX0QtUx2VD7v3ZesWxIuHvkqMtKH6bT8gmyRY
 EjJKMgf3e7nLAqckfeDZrdo3IBeSY6nCaaRsbN09djDdo6lofv8FLf9Xv
 bV243eoN+TCQVzsRIzWA+nyjAWpmp1d+exP4/goMd1DJ0azM/UaY0noYK A==;
X-CSE-ConnectionGUID: 4LAzX5bJSHORtHptTBCEUQ==
X-CSE-MsgGUID: NK7E3G+tRQqVc6Hz6ZdyQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65699762"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="65699762"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 15:08:31 -0800
X-CSE-ConnectionGUID: v6v9bqX9QrmQXgFYt1OkiA==
X-CSE-MsgGUID: MjETsGsXRL2vrmvo3mUyBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="191364901"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 15:08:29 -0800
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
Subject: [PATCH v2 1/2] fixup: mm/migrate_device: handle partially mapped
 folios during
Date: Thu, 20 Nov 2025 15:08:24 -0800
Message-Id: <20251120230825.181072-1-matthew.brost@intel.com>
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
after a split due to incorrect retry handling after a split failure or
success. Upon failure, collect a skip, and upon success, continue the
collection from the current position in the sequence.

Also, while here, fix migrate_vma_split_folio to only lock the new fault
folio if it is different from the original fault folio (i.e., it’s
possible the original fault folio is not the same as the one being
split).

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
---
 mm/migrate_device.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index fa42d2ebd024..4506e96dcd20 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -110,8 +110,10 @@ static int migrate_vma_split_folio(struct folio *folio,
 		folio_unlock(folio);
 		folio_put(folio);
 	} else if (folio != new_fault_folio) {
-		folio_get(new_fault_folio);
-		folio_lock(new_fault_folio);
+		if (new_fault_folio != fault_folio) {
+			folio_get(new_fault_folio);
+			folio_lock(new_fault_folio);
+		}
 		folio_unlock(folio);
 		folio_put(folio);
 	}
@@ -266,10 +268,11 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
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
@@ -351,16 +354,18 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			if (folio && folio_test_large(folio)) {
 				int ret;
 
+				arch_leave_lazy_mmu_mode();
 				pte_unmap_unlock(ptep, ptl);
 				ret = migrate_vma_split_folio(folio,
 							  migrate->fault_page);
 
 				if (ret) {
-					ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
-					goto next;
+					if (unmapped)
+						flush_tlb_range(walk->vma, start, end);
+
+					return migrate_vma_collect_skip(addr, end, walk);
 				}
 
-				addr = start;
 				goto again;
 			}
 			mpfn = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
-- 
2.34.1

