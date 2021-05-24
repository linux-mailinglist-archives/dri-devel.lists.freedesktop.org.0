Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9F938E776
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 15:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DC96E58B;
	Mon, 24 May 2021 13:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C696E58B;
 Mon, 24 May 2021 13:28:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPW+ZWJ0jqiPR5PqrruDQvp2UldegNAwVqh1DmnAjVSbqY5AeegTBJI5ryvt/NqJiwlR17s1nj8qb71sUWmfqKuDCftxIMiDZTBUFNq4eqLiEHQxCTq5QfrORrxhHBt357V4U/HUXOV/4nYLrU3P10BtHEUKAHCyxFKSjb2DkJSy8ZcniCF6fIGxlPrcyEuno8zAcGM3MoxYOgoPcD3cko5srRJJ9/RCOYQR9qDlmVQiRQv9wZV6Ve1yPVUofrMts8oDpCTV0uAyN0Oyx2MFqTaXdvriG1RbGrYcYWekg3MHCgbIXpfetY8mTYCcxfNl6reJjW/xh4q/yNrzg1fXPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PEGx81mu8+VEoEAWcNYBVRUxbgmnrE9lLsuA/GT4Xk=;
 b=QNoRsCoWr5t8Zs14eBcb+sCCqRFVXhCCI6yVDfKNV60WIRMaVSxY8COwf19t0mJU6xqM6/UPfTY65e0/Xe6918Vl8p3tzjrITUReInSZ/pM353HFg/7kVeb5q61toFvTJNdAfup7O8TzG36QyxWeABqlv3vNcff/dC7zbt9A8gzGSS1pMl5thboiH73xpfRGto41hQDrPg5EBV0XFYonQ17ptsjNiT0TDx4Hrm9/KsVtpmaLMYml7v5L87Tvl3DFNBmVzY7CL9257b8zcYHk4syNWenQhjVGUw262qxb/htzL8mW/S5MC2oHIjOdc36iGpqF1sHZlXe6Iq1/vUdjmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PEGx81mu8+VEoEAWcNYBVRUxbgmnrE9lLsuA/GT4Xk=;
 b=GzdXu2ooknzli9J2ap4qZyPXjG7R40kZwDS0CpuDyM9qki+Yf/aikihT4vB/Qv8VNKNnoRdEb6VCaeT+nAn5fIMmPd+3v0xl7HNwzxq6pUSwWn3AeyZ4NN9kOH5qYI0QDbAbORCpQ3AhBu4I/cSGQ+6FxzYb2zG4AzgtAY+VlsgkxUSwYBLBUJ7hctAUZRp9zuCqMGNmtX4aGT6J87Sv+UqlzS+Fbr0wy6miFfVsgOSZUKk+g1PihDY8zepTdX2m2pzpNuHzQv2tqvyQhWVt9QZhLZOcx/8W7avsmZeb/LR5JGk2kRlOOnYK7RKT+C5cm9V1s9CIcl+Z4Ls2wmiIiA==
Received: from MWHPR15CA0049.namprd15.prod.outlook.com (2603:10b6:301:4c::11)
 by MWHPR1201MB0223.namprd12.prod.outlook.com (2603:10b6:301:58::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Mon, 24 May
 2021 13:28:40 +0000
Received: from CO1NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4c:cafe::88) by MWHPR15CA0049.outlook.office365.com
 (2603:10b6:301:4c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend
 Transport; Mon, 24 May 2021 13:28:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT014.mail.protection.outlook.com (10.13.175.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Mon, 24 May 2021 13:28:40 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 24 May
 2021 13:28:39 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <akpm@linux-foundation.org>
Subject: [PATCH v9 01/10] mm: Remove special swap entry functions
Date: Mon, 24 May 2021 23:27:16 +1000
Message-ID: <20210524132725.12697-2-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210524132725.12697-1-apopple@nvidia.com>
References: <20210524132725.12697-1-apopple@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67f92dde-28f9-49d6-9937-08d91eb7d805
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0223:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0223EFBF345ECAAD33372A19DF269@MWHPR1201MB0223.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:62;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DIEzNYKXncRDe7rDFYhtONQOvK8zRjIZIrrZ8Zr5Z4AhZtK+GcJPxhEgWkcdheQMnNU32QJm8dpIy3Nz9KGW7OuSE3wIhQ+sMQV8/cvZPdBDKZFNiqFlWvJp2tMUwtb6kRet2u6J3Nnv3Kp1tv/vsIxivP14Hvcq/DVf2GJHY2PSVDvhHknjNdr8YdW9tS30YIiC3wcvMbNejVTYLQumWZUBgIersY3nJDO7DzIvs4uaK0QacBhpvlmaQfPcOzxRqaMwKjfJvjlLMvJHjBxH2zAucaiAJpbghEa1C0jn8Eut1mh+RdeTL2Eo6y0BYsEkF5nOnPgQyKXTZ0XSXHQBbb3/y9vbTbo8ouZbsemSSoVNvqjKJg/cruipwXyIfpCf5uLXKNy1IwzJBhZf/tKg6oCeR815ZaACuwF5F03l2rVR31UvTbOc3CP7zXhbxKzQ64brCEoFvDRq/zo2VBB4T46t+yhibW2j3+FdGCktet5o8Zk3DRuOj7EvF0XTPI5ocawVWzVjucxi0X3ukrWppqPLPVOzBsK916UsEKM1k8JgMBAhPXdF8cfqPACY5Qj3NQrTP7PkcqkdXIMFDX751KpSY5n+R4wWU8KQH1+JqMB5eQupw5VGtNaqxL4gJHNHbl3CpMjfPcBUH2FTzWsa7g==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(46966006)(36840700001)(186003)(70586007)(30864003)(70206006)(36756003)(426003)(47076005)(8676002)(2616005)(7416002)(336012)(4326008)(8936002)(26005)(5660300002)(1076003)(16526019)(316002)(478600001)(6666004)(83380400001)(110136005)(36906005)(2906002)(82740400003)(7636003)(356005)(82310400003)(54906003)(86362001)(36860700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 13:28:40.0290 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f92dde-28f9-49d6-9937-08d91eb7d805
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0223
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, bsingharora@gmail.com,
 Alistair Popple <apopple@nvidia.com>, hughd@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, jglisse@redhat.com, bskeggs@redhat.com, jgg@nvidia.com,
 jhubbard@nvidia.com, peterx@redhat.com, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove multiple similar inline functions for dealing with different
types of special swap entries.

Both migration and device private swap entries use the swap offset to
store a pfn. Instead of multiple inline functions to obtain a struct
page for each swap entry type use a common function
pfn_swap_entry_to_page(). Also open-code the various entry_to_pfn()
functions as this results is shorter code that is easier to understand.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>

---

v9:
* Rebased on v5.13-rc2

v8:
* No changes

v7:
* Reworded commit message to include pfn_swap_entry_to_page()
* Added Christoph's Reviewed-by

v6:
* Removed redundant compound_page() call from inside PageLocked()
* Fixed a minor build issue for s390 reported by kernel test bot

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
index 18205f851c24..eec3a9d7176e 100644
--- a/arch/s390/mm/pgtable.c
+++ b/arch/s390/mm/pgtable.c
@@ -691,7 +691,7 @@ static void ptep_zap_swap_entry(struct mm_struct *mm, swp_entry_t entry)
 	if (!non_swap_entry(entry))
 		dec_mm_counter(mm, MM_SWAPENTS);
 	else if (is_migration_entry(entry)) {
-		struct page *page = migration_entry_to_page(entry);
+		struct page *page = pfn_swap_entry_to_page(entry);
 
 		dec_mm_counter(mm, mm_counter(page));
 	}
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index fc9784544b24..0953732c8ce1 100644
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
@@ -694,10 +692,8 @@ static int smaps_hugetlb_range(pte_t *pte, unsigned long hmask,
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
@@ -1384,11 +1380,8 @@ static pagemap_entry_t pte_to_pagemap_entry(struct pagemapread *pm,
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
@@ -1445,7 +1438,7 @@ static int pagemap_pmd_range(pmd_t *pmdp, unsigned long addr, unsigned long end,
 			if (pmd_swp_soft_dirty(pmd))
 				flags |= PM_SOFT_DIRTY;
 			VM_BUG_ON(!is_pmd_migration_entry(pmd));
-			page = migration_entry_to_page(entry);
+			page = pfn_swap_entry_to_page(entry);
 		}
 #endif
 
diff --git a/include/linux/swap.h b/include/linux/swap.h
index 144727041e78..a6d4505ecf73 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -545,8 +545,8 @@ static inline void show_swap_cache_info(void)
 {
 }
 
-#define free_swap_and_cache(e) ({(is_migration_entry(e) || is_device_private_entry(e));})
-#define swapcache_prepare(e) ({(is_migration_entry(e) || is_device_private_entry(e));})
+/* used to sanity check ptes in zap_pte_range when CONFIG_SWAP=0 */
+#define free_swap_and_cache(e) is_pfn_swap_entry(e)
 
 static inline int add_swap_count_continuation(swp_entry_t swp, gfp_t gfp_mask)
 {
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index d9b7c9132c2f..139be8235ad2 100644
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
+	BUG_ON(is_migration_entry(entry) && !PageLocked(p));
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
index 63ed6b25deaa..7137ab31766a 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1694,7 +1694,7 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 
 			VM_BUG_ON(!is_pmd_migration_entry(orig_pmd));
 			entry = pmd_to_swp_entry(orig_pmd);
-			page = migration_entry_to_page(entry);
+			page = pfn_swap_entry_to_page(entry);
 			flush_needed = 0;
 		} else
 			WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
@@ -2102,7 +2102,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		swp_entry_t entry;
 
 		entry = pmd_to_swp_entry(old_pmd);
-		page = migration_entry_to_page(entry);
+		page = pfn_swap_entry_to_page(entry);
 		write = is_write_migration_entry(entry);
 		young = false;
 		soft_dirty = pmd_swp_soft_dirty(old_pmd);
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 64ada9e650a5..649758b78d27 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5349,7 +5349,7 @@ static struct page *mc_handle_swap_pte(struct vm_area_struct *vma,
 	 * as special swap entry in the CPU page table.
 	 */
 	if (is_device_private_entry(ent)) {
-		page = device_private_entry_to_page(ent);
+		page = pfn_swap_entry_to_page(ent);
 		/*
 		 * MEMORY_DEVICE_PRIVATE means ZONE_DEVICE page and which have
 		 * a refcount of 1 when free (unlike normal page)
diff --git a/mm/memory.c b/mm/memory.c
index 730daa00952b..1f5c3f6134fb 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -730,7 +730,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		}
 		rss[MM_SWAPENTS]++;
 	} else if (is_migration_entry(entry)) {
-		page = migration_entry_to_page(entry);
+		page = pfn_swap_entry_to_page(entry);
 
 		rss[mm_counter(page)]++;
 
@@ -749,7 +749,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 			set_pte_at(src_mm, addr, src_pte, pte);
 		}
 	} else if (is_device_private_entry(entry)) {
-		page = device_private_entry_to_page(entry);
+		page = pfn_swap_entry_to_page(entry);
 
 		/*
 		 * Update rss count even for unaddressable pages, as
@@ -1280,7 +1280,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
 
 		entry = pte_to_swp_entry(ptent);
 		if (is_device_private_entry(entry)) {
-			struct page *page = device_private_entry_to_page(entry);
+			struct page *page = pfn_swap_entry_to_page(entry);
 
 			if (unlikely(details && details->check_mapping)) {
 				/*
@@ -1309,7 +1309,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
 		else if (is_migration_entry(entry)) {
 			struct page *page;
 
-			page = migration_entry_to_page(entry);
+			page = pfn_swap_entry_to_page(entry);
 			rss[mm_counter(page)]--;
 		}
 		if (unlikely(!free_swap_and_cache(entry)))
@@ -3327,7 +3327,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 			migration_entry_wait(vma->vm_mm, vmf->pmd,
 					     vmf->address);
 		} else if (is_device_private_entry(entry)) {
-			vmf->page = device_private_entry_to_page(entry);
+			vmf->page = pfn_swap_entry_to_page(entry);
 			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
 		} else if (is_hwpoison_entry(entry)) {
 			ret = VM_FAULT_HWPOISON;
diff --git a/mm/migrate.c b/mm/migrate.c
index b234c3f3acb7..749321ae3026 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -294,7 +294,7 @@ void __migration_entry_wait(struct mm_struct *mm, pte_t *ptep,
 	if (!is_migration_entry(entry))
 		goto out;
 
-	page = migration_entry_to_page(entry);
+	page = pfn_swap_entry_to_page(entry);
 
 	/*
 	 * Once page cache replacement of page migration started, page_count
@@ -334,7 +334,7 @@ void pmd_migration_entry_wait(struct mm_struct *mm, pmd_t *pmd)
 	ptl = pmd_lock(mm, pmd);
 	if (!is_pmd_migration_entry(*pmd))
 		goto unlock;
-	page = migration_entry_to_page(pmd_to_swp_entry(*pmd));
+	page = pfn_swap_entry_to_page(pmd_to_swp_entry(*pmd));
 	if (!get_page_unless_zero(page))
 		goto unlock;
 	spin_unlock(ptl);
@@ -2399,7 +2399,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			if (!is_device_private_entry(entry))
 				goto next;
 
-			page = device_private_entry_to_page(entry);
+			page = pfn_swap_entry_to_page(entry);
 			if (!(migrate->flags &
 				MIGRATE_VMA_SELECT_DEVICE_PRIVATE) ||
 			    page->pgmap->owner != migrate->pgmap_owner)
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index 2cf01d933f13..a6a7febb4d93 100644
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

