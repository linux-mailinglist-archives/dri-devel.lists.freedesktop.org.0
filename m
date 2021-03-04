Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAA532CC88
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 07:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EDF6E9EA;
	Thu,  4 Mar 2021 06:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098EC6E9E6;
 Thu,  4 Mar 2021 06:16:55 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B60407b570001>; Wed, 03 Mar 2021 22:16:55 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 4 Mar
 2021 06:16:55 +0000
Received: from localhost (172.20.145.6) by DRHQMAIL107.nvidia.com (10.27.9.16)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 4 Mar 2021 06:16:54 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH v4 1/8] mm: Remove special swap entry functions
Date: Thu, 4 Mar 2021 17:16:38 +1100
Message-ID: <20210304061645.29747-2-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210304061645.29747-1-apopple@nvidia.com>
References: <20210304061645.29747-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614838615; bh=6phE4x1NIuT8ANY+v15jxQFMulobxzGnKOdFMxNOIPc=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=NSYLvynFnYlg+tdldYhrVdoGEZ8fyGoI+iq+aAe54Kyg9nOeq5lD4I9PoNKB/n4sR
 cbUulT31RJUrG16IMdEdDaAK8T1p1Brftu3aLtTvHhrFUuvSxJ2ivPl+pGdRIOiqS2
 p+lzztxVx7yOIXPq22IZMfyG80aYsHE6g7JpqH16q+ekWvS7yEVM+hFOEwu+WkEPlL
 CAwTT2s4FTWFOF93jKAJXN3piukBWPbG0IdoYvsXx2d6g+fdu6ihKfnYy4jpfCjLR8
 Rzcx7uSvikVdcF4oUjpkWecNFY0f9VXiRcWymlkP6IiLuECKYdXv85OTNZQ+B2evoO
 JGdp3zIjzq1qQ==
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org, jhubbard@nvidia.com,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jglisse@redhat.com, kvm-ppc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the migration and device private entry_to_page() and
entry_to_pfn() inline functions and instead open code them directly.
This results in shorter code which is easier to understand.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

v4:
* Added pfn_swap_entry_to_page()
* Reinstated check that migration entries point to locked pages
* Removed #define swapcache_prepare which isn't needed for CONFIG_SWAP=0
  builds
---
 arch/s390/mm/pgtable.c  |  2 +-
 fs/proc/task_mmu.c      | 23 +++++---------
 include/linux/swap.h    |  4 +--
 include/linux/swapops.h | 69 ++++++++++++++---------------------------
 mm/hmm.c                |  5 ++-
 mm/huge_memory.c        |  4 +--
 mm/memcontrol.c         |  2 +-
 mm/memory.c             | 10 +++---
 mm/migrate.c            |  6 ++--
 mm/page_vma_mapped.c    |  6 ++--
 10 files changed, 50 insertions(+), 81 deletions(-)

diff --git a/arch/s390/mm/pgtable.c b/arch/s390/mm/pgtable.c
index 18205f851c24..aae001096c46 100644
--- a/arch/s390/mm/pgtable.c
+++ b/arch/s390/mm/pgtable.c
@@ -691,7 +691,7 @@ static void ptep_zap_swap_entry(struct mm_struct *mm, swp_entry_t entry)
 	if (!non_swap_entry(entry))
 		dec_mm_counter(mm, MM_SWAPENTS);
 	else if (is_migration_entry(entry)) {
-		struct page *page = migration_entry_to_page(entry);
+		struct page *page = pfn_swap_entry_to_page(entry));
 
 		dec_mm_counter(mm, mm_counter(page));
 	}
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 602e3a52884d..7c75af0fc423 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -514,10 +514,8 @@ static void smaps_pte_entry(pte_t *pte, unsigned long addr,
 			} else {
 				mss->swap_pss += (u64)PAGE_SIZE << PSS_SHIFT;
 			}
-		} else if (is_migration_entry(swpent))
-			page = migration_entry_to_page(swpent);
-		else if (is_device_private_entry(swpent))
-			page = device_private_entry_to_page(swpent);
+		} else if (is_pfn_swap_entry(swpent))
+			page = pfn_swap_entry_to_page(swpent);
 	} else if (unlikely(IS_ENABLED(CONFIG_SHMEM) && mss->check_shmem_swap
 							&& pte_none(*pte))) {
 		page = xa_load(&vma->vm_file->f_mapping->i_pages,
@@ -549,7 +547,7 @@ static void smaps_pmd_entry(pmd_t *pmd, unsigned long addr,
 		swp_entry_t entry = pmd_to_swp_entry(*pmd);
 
 		if (is_migration_entry(entry))
-			page = migration_entry_to_page(entry);
+			page = pfn_swap_entry_to_page(entry);
 	}
 	if (IS_ERR_OR_NULL(page))
 		return;
@@ -691,10 +689,8 @@ static int smaps_hugetlb_range(pte_t *pte, unsigned long hmask,
 	} else if (is_swap_pte(*pte)) {
 		swp_entry_t swpent = pte_to_swp_entry(*pte);
 
-		if (is_migration_entry(swpent))
-			page = migration_entry_to_page(swpent);
-		else if (is_device_private_entry(swpent))
-			page = device_private_entry_to_page(swpent);
+		if (is_pfn_swap_entry(swpent))
+			page = pfn_swap_entry_to_page(swpent);
 	}
 	if (page) {
 		int mapcount = page_mapcount(page);
@@ -1382,11 +1378,8 @@ static pagemap_entry_t pte_to_pagemap_entry(struct pagemapread *pm,
 			frame = swp_type(entry) |
 				(swp_offset(entry) << MAX_SWAPFILES_SHIFT);
 		flags |= PM_SWAP;
-		if (is_migration_entry(entry))
-			page = migration_entry_to_page(entry);
-
-		if (is_device_private_entry(entry))
-			page = device_private_entry_to_page(entry);
+		if (is_pfn_swap_entry(entry))
+			page = pfn_swap_entry_to_page(entry);
 	}
 
 	if (page && !PageAnon(page))
@@ -1443,7 +1436,7 @@ static int pagemap_pmd_range(pmd_t *pmdp, unsigned long addr, unsigned long end,
 			if (pmd_swp_soft_dirty(pmd))
 				flags |= PM_SOFT_DIRTY;
 			VM_BUG_ON(!is_pmd_migration_entry(pmd));
-			page = migration_entry_to_page(entry);
+			page = pfn_swap_entry_to_page(entry);
 		}
 #endif
 
diff --git a/include/linux/swap.h b/include/linux/swap.h
index 596bc2f4d9b0..57a7690966a4 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -519,8 +519,8 @@ static inline void show_swap_cache_info(void)
 {
 }
 
-#define free_swap_and_cache(e) ({(is_migration_entry(e) || is_device_private_entry(e));})
-#define swapcache_prepare(e) ({(is_migration_entry(e) || is_device_private_entry(e));})
+/* used to sanity check ptes in zap_pte_range when CONFIG_SWAP=0 */
+#define free_swap_and_cache(e) is_pfn_swap_entry(e)
 
 static inline int add_swap_count_continuation(swp_entry_t swp, gfp_t gfp_mask)
 {
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index d9b7c9132c2f..3fd88081107c 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -121,16 +121,6 @@ static inline bool is_write_device_private_entry(swp_entry_t entry)
 {
 	return unlikely(swp_type(entry) == SWP_DEVICE_WRITE);
 }
-
-static inline unsigned long device_private_entry_to_pfn(swp_entry_t entry)
-{
-	return swp_offset(entry);
-}
-
-static inline struct page *device_private_entry_to_page(swp_entry_t entry)
-{
-	return pfn_to_page(swp_offset(entry));
-}
 #else /* CONFIG_DEVICE_PRIVATE */
 static inline swp_entry_t make_device_private_entry(struct page *page, bool write)
 {
@@ -150,16 +140,6 @@ static inline bool is_write_device_private_entry(swp_entry_t entry)
 {
 	return false;
 }
-
-static inline unsigned long device_private_entry_to_pfn(swp_entry_t entry)
-{
-	return 0;
-}
-
-static inline struct page *device_private_entry_to_page(swp_entry_t entry)
-{
-	return NULL;
-}
 #endif /* CONFIG_DEVICE_PRIVATE */
 
 #ifdef CONFIG_MIGRATION
@@ -182,22 +162,6 @@ static inline int is_write_migration_entry(swp_entry_t entry)
 	return unlikely(swp_type(entry) == SWP_MIGRATION_WRITE);
 }
 
-static inline unsigned long migration_entry_to_pfn(swp_entry_t entry)
-{
-	return swp_offset(entry);
-}
-
-static inline struct page *migration_entry_to_page(swp_entry_t entry)
-{
-	struct page *p = pfn_to_page(swp_offset(entry));
-	/*
-	 * Any use of migration entries may only occur while the
-	 * corresponding page is locked
-	 */
-	BUG_ON(!PageLocked(compound_head(p)));
-	return p;
-}
-
 static inline void make_migration_entry_read(swp_entry_t *entry)
 {
 	*entry = swp_entry(SWP_MIGRATION_READ, swp_offset(*entry));
@@ -217,16 +181,6 @@ static inline int is_migration_entry(swp_entry_t swp)
 	return 0;
 }
 
-static inline unsigned long migration_entry_to_pfn(swp_entry_t entry)
-{
-	return 0;
-}
-
-static inline struct page *migration_entry_to_page(swp_entry_t entry)
-{
-	return NULL;
-}
-
 static inline void make_migration_entry_read(swp_entry_t *entryp) { }
 static inline void __migration_entry_wait(struct mm_struct *mm, pte_t *ptep,
 					spinlock_t *ptl) { }
@@ -241,6 +195,29 @@ static inline int is_write_migration_entry(swp_entry_t entry)
 
 #endif
 
+static inline struct page *pfn_swap_entry_to_page(swp_entry_t entry)
+{
+	struct page *p = pfn_to_page(swp_offset(entry));
+
+	/*
+	 * Any use of migration entries may only occur while the
+	 * corresponding page is locked
+	 */
+	BUG_ON(is_migration_entry(entry) && !PageLocked(compound_head(p)));
+
+	return p;
+}
+
+/*
+ * A pfn swap entry is a special type of swap entry that always has a pfn stored
+ * in the swap offset. They are used to represent unaddressable device memory
+ * and to restrict access to a page undergoing migration.
+ */
+static inline bool is_pfn_swap_entry(swp_entry_t entry)
+{
+	return is_migration_entry(entry) || is_device_private_entry(entry);
+}
+
 struct page_vma_mapped_walk;
 
 #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
diff --git a/mm/hmm.c b/mm/hmm.c
index 943cb2ba4442..3b2dda71d0ed 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -214,7 +214,7 @@ static inline bool hmm_is_device_private_entry(struct hmm_range *range,
 		swp_entry_t entry)
 {
 	return is_device_private_entry(entry) &&
-		device_private_entry_to_page(entry)->pgmap->owner ==
+		pfn_swap_entry_to_page(entry)->pgmap->owner ==
 		range->dev_private_owner;
 }
 
@@ -257,8 +257,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 			cpu_flags = HMM_PFN_VALID;
 			if (is_write_device_private_entry(entry))
 				cpu_flags |= HMM_PFN_WRITE;
-			*hmm_pfn = device_private_entry_to_pfn(entry) |
-					cpu_flags;
+			*hmm_pfn = swp_offset(entry) | cpu_flags;
 			return 0;
 		}
 
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 91ca9b103ee5..d65eebf446ae 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1695,7 +1695,7 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 
 			VM_BUG_ON(!is_pmd_migration_entry(orig_pmd));
 			entry = pmd_to_swp_entry(orig_pmd);
-			page = pfn_to_page(swp_offset(entry));
+			page = pfn_swap_entry_to_page(entry);
 			flush_needed = 0;
 		} else
 			WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
@@ -2103,7 +2103,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		swp_entry_t entry;
 
 		entry = pmd_to_swp_entry(old_pmd);
-		page = pfn_to_page(swp_offset(entry));
+		page = pfn_swap_entry_to_page(entry);
 		write = is_write_migration_entry(entry);
 		young = false;
 		soft_dirty = pmd_swp_soft_dirty(old_pmd);
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 913c2b9e5c72..9fa9ec9d0ace 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5544,7 +5544,7 @@ static struct page *mc_handle_swap_pte(struct vm_area_struct *vma,
 	 * as special swap entry in the CPU page table.
 	 */
 	if (is_device_private_entry(ent)) {
-		page = device_private_entry_to_page(ent);
+		page = pfn_swap_entry_to_page(ent);
 		/*
 		 * MEMORY_DEVICE_PRIVATE means ZONE_DEVICE page and which have
 		 * a refcount of 1 when free (unlike normal page)
diff --git a/mm/memory.c b/mm/memory.c
index feff48e1465a..99a6a695b1b1 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -718,7 +718,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		}
 		rss[MM_SWAPENTS]++;
 	} else if (is_migration_entry(entry)) {
-		page = migration_entry_to_page(entry);
+		page = pfn_swap_entry_to_page(entry);
 
 		rss[mm_counter(page)]++;
 
@@ -737,7 +737,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 			set_pte_at(src_mm, addr, src_pte, pte);
 		}
 	} else if (is_device_private_entry(entry)) {
-		page = device_private_entry_to_page(entry);
+		page = pfn_swap_entry_to_page(entry);
 
 		/*
 		 * Update rss count even for unaddressable pages, as
@@ -1274,7 +1274,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
 
 		entry = pte_to_swp_entry(ptent);
 		if (is_device_private_entry(entry)) {
-			struct page *page = device_private_entry_to_page(entry);
+			struct page *page = pfn_swap_entry_to_page(entry);
 
 			if (unlikely(details && details->check_mapping)) {
 				/*
@@ -1303,7 +1303,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
 		else if (is_migration_entry(entry)) {
 			struct page *page;
 
-			page = migration_entry_to_page(entry);
+			page = pfn_swap_entry_to_page(entry);
 			rss[mm_counter(page)]--;
 		}
 		if (unlikely(!free_swap_and_cache(entry)))
@@ -3271,7 +3271,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 			migration_entry_wait(vma->vm_mm, vmf->pmd,
 					     vmf->address);
 		} else if (is_device_private_entry(entry)) {
-			vmf->page = device_private_entry_to_page(entry);
+			vmf->page = pfn_swap_entry_to_page(entry);
 			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
 		} else if (is_hwpoison_entry(entry)) {
 			ret = VM_FAULT_HWPOISON;
diff --git a/mm/migrate.c b/mm/migrate.c
index 20ca887ea769..39246907eac3 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -321,7 +321,7 @@ void __migration_entry_wait(struct mm_struct *mm, pte_t *ptep,
 	if (!is_migration_entry(entry))
 		goto out;
 
-	page = migration_entry_to_page(entry);
+	page = pfn_swap_entry_to_page(entry);
 
 	/*
 	 * Once page cache replacement of page migration started, page_count
@@ -361,7 +361,7 @@ void pmd_migration_entry_wait(struct mm_struct *mm, pmd_t *pmd)
 	ptl = pmd_lock(mm, pmd);
 	if (!is_pmd_migration_entry(*pmd))
 		goto unlock;
-	page = migration_entry_to_page(pmd_to_swp_entry(*pmd));
+	page = pfn_swap_entry_to_page(pmd_to_swp_entry(*pmd));
 	if (!get_page_unless_zero(page))
 		goto unlock;
 	spin_unlock(ptl);
@@ -2437,7 +2437,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			if (!is_device_private_entry(entry))
 				goto next;
 
-			page = device_private_entry_to_page(entry);
+			page = pfn_swap_entry_to_page(entry);
 			if (!(migrate->flags &
 				MIGRATE_VMA_SELECT_DEVICE_PRIVATE) ||
 			    page->pgmap->owner != migrate->pgmap_owner)
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index 86e3a3688d59..eed988ab2e81 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -96,7 +96,7 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)
 		if (!is_migration_entry(entry))
 			return false;
 
-		pfn = migration_entry_to_pfn(entry);
+		pfn = swp_offset(entry);
 	} else if (is_swap_pte(*pvmw->pte)) {
 		swp_entry_t entry;
 
@@ -105,7 +105,7 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)
 		if (!is_device_private_entry(entry))
 			return false;
 
-		pfn = device_private_entry_to_pfn(entry);
+		pfn = swp_offset(entry);
 	} else {
 		if (!pte_present(*pvmw->pte))
 			return false;
@@ -200,7 +200,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 				if (is_migration_entry(pmd_to_swp_entry(*pvmw->pmd))) {
 					swp_entry_t entry = pmd_to_swp_entry(*pvmw->pmd);
 
-					if (migration_entry_to_page(entry) != page)
+					if (pfn_swap_entry_to_page(entry) != page)
 						return not_found(pvmw);
 					return true;
 				}
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
