Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD9B7FBEAC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 16:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1222A10E587;
	Tue, 28 Nov 2023 15:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61BC710E515;
 Tue, 28 Nov 2023 13:10:14 +0000 (UTC)
Received: from kwepemm000018.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Sfj021mG3z1P8qX;
 Tue, 28 Nov 2023 20:47:14 +0800 (CST)
Received: from DESKTOP-RAUQ1L5.china.huawei.com (10.174.179.172) by
 kwepemm000018.china.huawei.com (7.193.23.4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 28 Nov 2023 20:50:49 +0800
From: Weixi Zhu <weixi.zhu@huawei.com>
To: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <akpm@linux-foundation.org>
Subject: [RFC PATCH 6/6] mm/gmem: extending Linux core MM to support unified
 virtual address space
Date: Tue, 28 Nov 2023 20:50:25 +0800
Message-ID: <20231128125025.4449-7-weixi.zhu@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231128125025.4449-1-weixi.zhu@huawei.com>
References: <20231128125025.4449-1-weixi.zhu@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.179.172]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000018.china.huawei.com (7.193.23.4)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 28 Nov 2023 15:54:49 +0000
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
Cc: dri-devel@lists.freedesktop.org, leonro@nvidia.com, apopple@nvidia.com,
 amd-gfx@lists.freedesktop.org, mgorman@suse.de, ziy@nvidia.com,
 zhi.a.wang@intel.com, rcampbell@nvidia.com, jgg@nvidia.com,
 weixi.zhu@openeuler.sh, jhubbard@nvidia.com, intel-gfx@lists.freedesktop.org,
 mhairgrove@nvidia.com, jglisse@redhat.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com,
 Felix.Kuehling@amd.com, Xinhui.Pan@amd.com, christian.koenig@amd.com,
 alexander.deucher@amd.com, ogabbay@kernel.org,
 Weixi Zhu <weixi.zhu@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch extends Linux core MM to support unified virtual address space.
A unified virtual address space provides a coherent view of memory for the
CPU and devices. This is achieved by maintaining coherent page tables for
the CPU and any attached devices for each process, without assuming that
the underlying interconnect between the CPU and peripheral device is
cache-coherent.

Specifically, for each mm_struct that is attached with one or more device
computing contexts, a per-process logical page table is utilized to track
the mapping status of anonymous memory allocated via mmap(MAP_PRIVATE |
MAP_PEER_SHARED). The CPU page fault handling path is modified to examine
whether a faulted virtual page has already been faulted elsewhere, e.g. on
a device, by looking up the logical page table in vm_object. If so, a page
migration operation should be orchestrated by the core MM to prepare the
CPU physical page, instead of zero-filling. This is achieved by invoking
gm_host_fault_locked(). The logical page table must also be updated once
the CPU page table gets modified.

Ideally, the logical page table should always be looked up or modified
first if the CPU page table is changed, but the currently implementation is
reverse. Also, current implementation only considers anonymous memory,
while a device may want to operate on a disk-file directly via mmap(fd). In
the future, logical page table is planned to play a more generic role for
anonymous memory, folios/huge pages and file-backed memory, as well as to
provide a clean abstraction for CPU page table functions (including these
stage-2 functions). More, the page fault handler path will be enhanced to
deal with cache-coherent buses as well, since it might be desirable for
devices to operate sparse data remotely instead of migration data at page
granules.

Signed-off-by: Weixi Zhu <weixi.zhu@huawei.com>
---
 kernel/fork.c    |  1 +
 mm/huge_memory.c | 85 +++++++++++++++++++++++++++++++++++++++++++-----
 mm/memory.c      | 42 +++++++++++++++++++++---
 mm/mmap.c        |  2 ++
 mm/oom_kill.c    |  2 ++
 mm/vm_object.c   | 84 +++++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 203 insertions(+), 13 deletions(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index eab96cdb25a6..06130c73bf2e 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -543,6 +543,7 @@ static void vm_area_free_rcu_cb(struct rcu_head *head)
 
 void vm_area_free(struct vm_area_struct *vma)
 {
+	free_gm_mappings(vma);
 #ifdef CONFIG_PER_VMA_LOCK
 	call_rcu(&vma->vm_rcu, vm_area_free_rcu_cb);
 #else
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 4f542444a91f..590000f63f04 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -37,6 +37,7 @@
 #include <linux/page_owner.h>
 #include <linux/sched/sysctl.h>
 #include <linux/memory-tiers.h>
+#include <linux/gmem.h>
 
 #include <asm/tlb.h>
 #include <asm/pgalloc.h>
@@ -684,6 +685,10 @@ static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf,
 	pgtable_t pgtable;
 	unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
 	vm_fault_t ret = 0;
+	struct gm_mapping *gm_mapping = NULL;
+
+	if (vma_is_peer_shared(vma))
+		gm_mapping = vm_object_lookup(vma->vm_mm->vm_obj, haddr);
 
 	VM_BUG_ON_FOLIO(!folio_test_large(folio), folio);
 
@@ -691,7 +696,8 @@ static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf,
 		folio_put(folio);
 		count_vm_event(THP_FAULT_FALLBACK);
 		count_vm_event(THP_FAULT_FALLBACK_CHARGE);
-		return VM_FAULT_FALLBACK;
+		ret = VM_FAULT_FALLBACK;
+		goto gm_mapping_release;
 	}
 	folio_throttle_swaprate(folio, gfp);
 
@@ -701,7 +707,14 @@ static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf,
 		goto release;
 	}
 
-	clear_huge_page(page, vmf->address, HPAGE_PMD_NR);
+	/*
+	 * Skip zero-filling page if the logical mapping indicates
+	 * that page contains valid data of the virtual address. This
+	 * could happen if the page was a victim of device memory
+	 * oversubscription.
+	 */
+	if (!(vma_is_peer_shared(vma) && gm_mapping_cpu(gm_mapping)))
+		clear_huge_page(page, vmf->address, HPAGE_PMD_NR);
 	/*
 	 * The memory barrier inside __folio_mark_uptodate makes sure that
 	 * clear_huge_page writes become visible before the set_pmd_at()
@@ -726,7 +739,7 @@ static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf,
 			pte_free(vma->vm_mm, pgtable);
 			ret = handle_userfault(vmf, VM_UFFD_MISSING);
 			VM_BUG_ON(ret & VM_FAULT_FALLBACK);
-			return ret;
+			goto gm_mapping_release;
 		}
 
 		entry = mk_huge_pmd(page, vma->vm_page_prot);
@@ -734,6 +747,13 @@ static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf,
 		folio_add_new_anon_rmap(folio, vma, haddr);
 		folio_add_lru_vma(folio, vma);
 		pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, pgtable);
+		if (vma_is_peer_shared(vma) && gm_mapping_device(gm_mapping)) {
+			vmf->page = page;
+			ret = gm_host_fault_locked(vmf, PMD_ORDER);
+			if (ret)
+				goto unlock_release;
+		}
+
 		set_pmd_at(vma->vm_mm, haddr, vmf->pmd, entry);
 		update_mmu_cache_pmd(vma, vmf->address, vmf->pmd);
 		add_mm_counter(vma->vm_mm, MM_ANONPAGES, HPAGE_PMD_NR);
@@ -741,6 +761,11 @@ static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf,
 		spin_unlock(vmf->ptl);
 		count_vm_event(THP_FAULT_ALLOC);
 		count_memcg_event_mm(vma->vm_mm, THP_FAULT_ALLOC);
+		if (vma_is_peer_shared(vma)) {
+			gm_mapping_flags_set(gm_mapping, GM_PAGE_CPU);
+			gm_mapping->page = page;
+			mutex_unlock(&gm_mapping->lock);
+		}
 	}
 
 	return 0;
@@ -750,6 +775,9 @@ static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf,
 	if (pgtable)
 		pte_free(vma->vm_mm, pgtable);
 	folio_put(folio);
+gm_mapping_release:
+	if (vma_is_peer_shared(vma))
+		mutex_unlock(&gm_mapping->lock);
 	return ret;
 
 }
@@ -808,17 +836,41 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	gfp_t gfp;
-	struct folio *folio;
+	struct folio *folio = NULL;
 	unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
+	vm_fault_t ret = 0;
+	struct gm_mapping *gm_mapping;
+
+	if (vma_is_peer_shared(vma)) {
+		struct vm_object *vm_obj = vma->vm_mm->vm_obj;
 
-	if (!transhuge_vma_suitable(vma, haddr))
-		return VM_FAULT_FALLBACK;
-	if (unlikely(anon_vma_prepare(vma)))
-		return VM_FAULT_OOM;
+		xa_lock(vm_obj->logical_page_table);
+		gm_mapping = vm_object_lookup(vm_obj, haddr);
+		if (!gm_mapping) {
+			vm_object_mapping_create(vm_obj, haddr);
+			gm_mapping = vm_object_lookup(vm_obj, haddr);
+		}
+		xa_unlock(vm_obj->logical_page_table);
+		mutex_lock(&gm_mapping->lock);
+		if (unlikely(!pmd_none(*vmf->pmd))) {
+			mutex_unlock(&gm_mapping->lock);
+			goto gm_mapping_release;
+		}
+	}
+
+	if (!transhuge_vma_suitable(vma, haddr)) {
+		ret = VM_FAULT_FALLBACK;
+		goto gm_mapping_release;
+	}
+	if (unlikely(anon_vma_prepare(vma))) {
+		ret = VM_FAULT_OOM;
+		goto gm_mapping_release;
+	}
 	khugepaged_enter_vma(vma, vma->vm_flags);
 
 	if (!(vmf->flags & FAULT_FLAG_WRITE) &&
 			!mm_forbids_zeropage(vma->vm_mm) &&
+			!vma_is_peer_shared(vma) &&
 			transparent_hugepage_use_zero_page()) {
 		pgtable_t pgtable;
 		struct page *zero_page;
@@ -857,12 +909,27 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 		return ret;
 	}
 	gfp = vma_thp_gfp_mask(vma);
+
+	if (vma_is_peer_shared(vma) && gm_mapping_cpu(gm_mapping))
+		folio = page_folio(gm_mapping->page);
+	if (!folio) {
+		if (vma_is_peer_shared(vma))
+			gfp = GFP_TRANSHUGE;
+		folio = vma_alloc_folio(gfp, HPAGE_PMD_ORDER, vma, haddr, true);
+	}
 	folio = vma_alloc_folio(gfp, HPAGE_PMD_ORDER, vma, haddr, true);
+
 	if (unlikely(!folio)) {
 		count_vm_event(THP_FAULT_FALLBACK);
-		return VM_FAULT_FALLBACK;
+		ret = VM_FAULT_FALLBACK;
+		goto gm_mapping_release;
 	}
 	return __do_huge_pmd_anonymous_page(vmf, &folio->page, gfp);
+
+gm_mapping_release:
+	if (vma_is_peer_shared(vma))
+		mutex_unlock(&gm_mapping->lock);
+	return ret;
 }
 
 static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
diff --git a/mm/memory.c b/mm/memory.c
index 1f18ed4a5497..d6cc278dc39b 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -78,6 +78,7 @@
 #include <linux/ptrace.h>
 #include <linux/vmalloc.h>
 #include <linux/sched/sysctl.h>
+#include <linux/gmem.h>
 
 #include <trace/events/kmem.h>
 
@@ -1695,8 +1696,10 @@ static void unmap_single_vma(struct mmu_gather *tlb,
 				__unmap_hugepage_range(tlb, vma, start, end,
 							     NULL, zap_flags);
 			}
-		} else
+		} else {
 			unmap_page_range(tlb, vma, start, end, details);
+			unmap_gm_mappings_range(vma, start, end);
+		}
 	}
 }
 
@@ -4126,7 +4129,9 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 {
 	bool uffd_wp = vmf_orig_pte_uffd_wp(vmf);
 	struct vm_area_struct *vma = vmf->vma;
-	struct folio *folio;
+	struct gm_mapping *gm_mapping;
+	bool skip_put_page = false;
+	struct folio *folio = NULL;
 	vm_fault_t ret = 0;
 	pte_t entry;
 
@@ -4141,8 +4146,25 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 	if (pte_alloc(vma->vm_mm, vmf->pmd))
 		return VM_FAULT_OOM;
 
+	if (vma_is_peer_shared(vma)) {
+		xa_lock(vma->vm_mm->vm_obj->logical_page_table);
+		gm_mapping = vm_object_lookup(vma->vm_mm->vm_obj, vmf->address);
+		if (!gm_mapping) {
+			vm_object_mapping_create(vma->vm_mm->vm_obj, vmf->address);
+			gm_mapping = vm_object_lookup(vma->vm_mm->vm_obj, vmf->address);
+		}
+		xa_unlock(vma->vm_mm->vm_obj->logical_page_table);
+		mutex_lock(&gm_mapping->lock);
+
+		if (gm_mapping_cpu(gm_mapping)) {
+			folio = page_folio(gm_mapping->page);
+			skip_put_page = true;
+		}
+	}
+
 	/* Use the zero-page for reads */
 	if (!(vmf->flags & FAULT_FLAG_WRITE) &&
+			!vma_is_peer_shared(vma) &&
 			!mm_forbids_zeropage(vma->vm_mm)) {
 		entry = pte_mkspecial(pfn_pte(my_zero_pfn(vmf->address),
 						vma->vm_page_prot));
@@ -4168,7 +4190,8 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 	/* Allocate our own private page. */
 	if (unlikely(anon_vma_prepare(vma)))
 		goto oom;
-	folio = vma_alloc_zeroed_movable_folio(vma, vmf->address);
+	if (!folio)
+		folio = vma_alloc_zeroed_movable_folio(vma, vmf->address);
 	if (!folio)
 		goto oom;
 
@@ -4211,6 +4234,14 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 	inc_mm_counter(vma->vm_mm, MM_ANONPAGES);
 	folio_add_new_anon_rmap(folio, vma, vmf->address);
 	folio_add_lru_vma(folio, vma);
+	if (vma_is_peer_shared(vma)) {
+		if (gm_mapping_device(gm_mapping)) {
+			vmf->page = &folio->page;
+			gm_host_fault_locked(vmf, 0);
+		}
+		gm_mapping_flags_set(gm_mapping, GM_PAGE_CPU);
+		gm_mapping->page = &folio->page;
+	}
 setpte:
 	if (uffd_wp)
 		entry = pte_mkuffd_wp(entry);
@@ -4221,9 +4252,12 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 unlock:
 	if (vmf->pte)
 		pte_unmap_unlock(vmf->pte, vmf->ptl);
+	if (vma_is_peer_shared(vma))
+		mutex_unlock(&gm_mapping->lock);
 	return ret;
 release:
-	folio_put(folio);
+	if (!skip_put_page)
+		folio_put(folio);
 	goto unlock;
 oom_free_page:
 	folio_put(folio);
diff --git a/mm/mmap.c b/mm/mmap.c
index 55d43763ea49..8b8faa007dbc 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2616,6 +2616,8 @@ do_vmi_align_munmap(struct vma_iterator *vmi, struct vm_area_struct *vma,
 #endif
 	} for_each_vma_range(*vmi, next, end);
 
+	munmap_in_peer_devices(mm, start, end);
+
 #if defined(CONFIG_DEBUG_VM_MAPLE_TREE)
 	/* Make sure no VMAs are about to be lost. */
 	{
diff --git a/mm/oom_kill.c b/mm/oom_kill.c
index 9e6071fde34a..31ec027e98c7 100644
--- a/mm/oom_kill.c
+++ b/mm/oom_kill.c
@@ -44,6 +44,7 @@
 #include <linux/kthread.h>
 #include <linux/init.h>
 #include <linux/mmu_notifier.h>
+#include <linux/gmem.h>
 
 #include <asm/tlb.h>
 #include "internal.h"
@@ -547,6 +548,7 @@ static bool __oom_reap_task_mm(struct mm_struct *mm)
 				continue;
 			}
 			unmap_page_range(&tlb, vma, range.start, range.end, NULL);
+			unmap_gm_mappings_range(vma, range.start, range.end);
 			mmu_notifier_invalidate_range_end(&range);
 			tlb_finish_mmu(&tlb);
 		}
diff --git a/mm/vm_object.c b/mm/vm_object.c
index 5432930d1226..e0d1b558df31 100644
--- a/mm/vm_object.c
+++ b/mm/vm_object.c
@@ -142,6 +142,9 @@ void free_gm_mappings(struct vm_area_struct *vma)
 	struct gm_mapping *gm_mapping;
 	struct vm_object *obj;
 
+	if (vma_is_peer_shared(vma))
+		return;
+
 	obj = vma->vm_mm->vm_obj;
 	if (!obj)
 		return;
@@ -223,3 +226,84 @@ void gm_release_vma(struct mm_struct *mm, struct list_head *head)
 		kfree(node);
 	}
 }
+
+static int munmap_in_peer_devices_inner(struct mm_struct *mm,
+					struct vm_area_struct *vma,
+					unsigned long start, unsigned long end,
+					int page_size)
+{
+	struct vm_object *obj = mm->vm_obj;
+	struct gm_mapping *gm_mapping;
+	struct gm_fault_t gmf = {
+		.mm = mm,
+		.copy = false,
+	};
+	int ret;
+
+	start = start > vma->vm_start ? start : vma->vm_start;
+	end = end < vma->vm_end ? end : vma->vm_end;
+
+	for (; start < end; start += page_size) {
+		xa_lock(obj->logical_page_table);
+		gm_mapping = vm_object_lookup(obj, start);
+		if (!gm_mapping) {
+			xa_unlock(obj->logical_page_table);
+			continue;
+		}
+		xa_unlock(obj->logical_page_table);
+
+		mutex_lock(&gm_mapping->lock);
+		if (!gm_mapping_device(gm_mapping)) {
+			mutex_unlock(&gm_mapping->lock);
+			continue;
+		}
+
+		gmf.va = start;
+		gmf.size = page_size;
+		gmf.dev = gm_mapping->dev;
+		ret = gm_mapping->dev->mmu->peer_unmap(&gmf);
+		if (ret != GM_RET_SUCCESS) {
+			pr_err("%s: call dev peer_unmap error %d\n", __func__,
+			       ret);
+			mutex_unlock(&gm_mapping->lock);
+			continue;
+		}
+		mutex_unlock(&gm_mapping->lock);
+	}
+
+	return 0;
+}
+
+void munmap_in_peer_devices(struct mm_struct *mm, unsigned long start,
+			    unsigned long end)
+{
+	struct vm_object *obj = mm->vm_obj;
+	struct vm_area_struct *vma;
+
+	if (!gmem_is_enabled())
+		return;
+
+	if (!obj)
+		return;
+
+	if (!mm->gm_as)
+		return;
+
+	mmap_read_lock(mm);
+	do {
+		vma = find_vma_intersection(mm, start, end);
+		if (!vma) {
+			pr_debug("gmem: there is no valid vma\n");
+			break;
+		}
+
+		if (!vma_is_peer_shared(vma)) {
+			pr_debug("gmem: not peer-shared vma, skip dontneed\n");
+			start = vma->vm_end;
+			continue;
+		}
+
+		munmap_in_peer_devices_inner(mm, vma, start, end, HPAGE_SIZE);
+	} while (start < end);
+	mmap_read_unlock(mm);
+}
-- 
2.25.1

