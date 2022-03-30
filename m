Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0914ECEB7
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 23:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CDCD10EB1C;
	Wed, 30 Mar 2022 21:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09D310EB0B;
 Wed, 30 Mar 2022 21:26:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OrbTr4+GAcOnaEctNRx5vcWGpLLG6J4npRFeMyRDrdfOVj4dZ6INu4vupd9c7vvM5DcY3Gq71LhtaYAGiiGqhT5QLO/bedkm6GI9Lx1oi0euVZBxbkqgDbigLvmlzKDrykdyFiLRS28cYNiTGsM7WCpHBt97wbfrr9ii2h5QSR+Giqj3b4jvSjoCZHqOWD3PQGM7Gm+2v17RHH+OdaJ42q8SK5G9YW0JS5flReMn/9qJ3xiQufNCkxOt5srZMbGTzlmNDTLhyo5cfvKpAlb272Oq84xeLe3BaVcGpuHdsl2Zu2tt21Cb+ghwYiuKirp8I9WeKWu5mpWfWiDfkPeObA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7OzLEUjt1C0jLbBAbwyMlbLOLG8GN5Sb/8CXrETsyY=;
 b=Gu8/0WEaSnMMgrP7jDFH3PAeWjM8MeeOQL3XSPiDZBjbO2VHBD+Xeb0URrdJRLocfIQ4YKI49O1afK1X+sN5KOx3Wj3zI019bs0thCUhjHsfr1BTdHOUprFKLWS5PXpTQQYImheKXfEvql+GU3+qywDC1FFnZ93Gn9Ng02VX/VQxzXWf6rBDRQd3KuAAR0f5Gq+LM/hXqFy+CfYqOAuJow85/Gtjl/dvhjB1ADdFOXgOUCWP7+KeJnMgDnD264vkW1E/YWYNt462FctUNCRq8pshGqBpXafQ7T0RjZ/laCk2C+15xOJe29wm1uqorc0bR86ECFOvaJzkLz7elVCmGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7OzLEUjt1C0jLbBAbwyMlbLOLG8GN5Sb/8CXrETsyY=;
 b=oxQcKosngLUcX4/rmRHS8HwA7DYu0lsdvTF3LriyHGiVsmQNS9DV0EySzlSdEw/HcoINfDgvv0/S7dkpcnfAi3Hbq5kGgk/1F2GmmmtrTTZlcmJ1KMhvl3TFZ7XEDReMvO5fwpNScOjyc4o+SZTF4/8Mm3hVeVOXMALRR8isqME=
Received: from MW4PR03CA0208.namprd03.prod.outlook.com (2603:10b6:303:b8::33)
 by SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Wed, 30 Mar
 2022 21:25:57 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::4a) by MW4PR03CA0208.outlook.office365.com
 (2603:10b6:303:b8::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.13 via Frontend
 Transport; Wed, 30 Mar 2022 21:25:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5123.19 via Frontend Transport; Wed, 30 Mar 2022 21:25:56 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 30 Mar
 2022 16:25:54 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v2 1/3] mm: add vm_normal_lru_pages for LRU handled pages only
Date: Wed, 30 Mar 2022 16:25:35 -0500
Message-ID: <20220330212537.12186-2-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220330212537.12186-1-alex.sierra@amd.com>
References: <20220330212537.12186-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62e4f0cd-4001-44e3-ad0a-08da1293e0c7
X-MS-TrafficTypeDiagnostic: SN6PR12MB2782:EE_
X-Microsoft-Antispam-PRVS: <SN6PR12MB27825F1B602761779943B78FFD1F9@SN6PR12MB2782.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aQYDu6itl8DwKkRnGMD4bwXruBeUwKdSay+MO/9U6Ev1klcQvGLb0wmUvjzMTeb+aLrCZkzP/ePqYGq2NSB9WHBwwLnXrrSpkw+Q1Eg/OHCgOR/4UFmND+o+TW/Mf2DwYcJ4aif+prFbLzb3BOMhOXJzZV962pmsN9O4dn1MfxosvZwttLvXg8J5wFoB6jXIzSBOmdQHUZFG1n8cWfnY+ziM44QoUSWcH3CIZ5/vo0PARgRP+Xq8LvuoBREjEx3UF9EIzlFQrEf+ZkeceQvUFUlxKGAfRnj1+UcyzEs+8B77TY9Jn5Q8IXe6NZUe9hijqsPWOPpImh0XmpH5suU+b7lV/Ui1PdVpNmo0TLdxESOhqN4E5iYA64znhuBgOCPcVZKsPIpbKWqKKmmwpWthFgiuA3jHqyPwHTrGuNlTETz9bn6Pcz0TuFk96v0VYvVRkpG5yQqsR3sZChLrUtSddXkKUZLO5//UGJTvDLPoNr7lhzqYmQ+cBHhEeXajkMJ1yn0jnNjQxxp7pVtzZFjKDrgSnxTZM9yTaT/gAmaQqAxE0kdd0AGk+Gz8BgLldnJw5fDvr6da2VXSIdVJGwiuKdhMcEEEkoVF3mNMwxYUc9jm8ZroPvye1w2zKJ0ioEmbag0JhpCcuHuxrF+0+RQfEiNDeWvfdFGab6i8jIpn7lO8iEm3oaLBn5DavpiGjyBkiIGW2uB+Q/yXvvHU7U86sg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(5660300002)(8936002)(82310400004)(30864003)(44832011)(508600001)(2906002)(81166007)(356005)(83380400001)(336012)(426003)(40460700003)(7416002)(8676002)(1076003)(54906003)(6916009)(26005)(86362001)(47076005)(70206006)(7696005)(70586007)(36756003)(16526019)(186003)(316002)(2616005)(36860700001)(6666004)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 21:25:56.5302 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e4f0cd-4001-44e3-ad0a-08da1293e0c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2782
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
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 Felix.Kuehling@amd.com, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With DEVICE_COHERENT, we'll soon have vm_normal_pages() return
device-managed anonymous pages that are not LRU pages. Although they
behave like normal pages for purposes of mapping in CPU page, and for
COW. They do not support LRU lists, NUMA migration or THP. The
difference between new vm_normal_lru_pages vs vm_normal_pages() is,
the former makes sure to return pages that are LRU handled only.

We also introduced a FOLL_LRU flag that adds the same behaviour to
follow_page and related APIs, to allow callers to specify that they
expect to put pages on an LRU list.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 fs/proc/task_mmu.c |  2 +-
 include/linux/mm.h |  9 ++++++---
 mm/gup.c           |  8 +++++---
 mm/huge_memory.c   |  2 +-
 mm/khugepaged.c    |  8 ++++----
 mm/ksm.c           |  4 ++--
 mm/madvise.c       |  4 ++--
 mm/memory.c        | 40 ++++++++++++++++++++++++++++++++++++++--
 mm/mempolicy.c     |  4 ++--
 mm/migrate.c       |  2 +-
 mm/mlock.c         |  6 +++---
 mm/mprotect.c      |  2 +-
 12 files changed, 66 insertions(+), 25 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index f46060eb91b5..1791a86d9ecb 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1784,7 +1784,7 @@ static struct page *can_gather_numa_stats(pte_t pte, struct vm_area_struct *vma,
 	if (!pte_present(pte))
 		return NULL;
 
-	page = vm_normal_page(vma, addr, pte);
+	page = vm_normal_lru_page(vma, addr, pte);
 	if (!page)
 		return NULL;
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index d507c32724c0..0299dbb35335 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -593,8 +593,8 @@ struct vm_operations_struct {
 					unsigned long addr);
 #endif
 	/*
-	 * Called by vm_normal_page() for special PTEs to find the
-	 * page for @addr.  This is useful if the default behavior
+	 * Called by vm_normal_*_page() for special PTEs to find the
+	 * page for @addr. This is useful if the default behavior
 	 * (using pte_page()) would not find the correct page.
 	 */
 	struct page *(*find_special_page)(struct vm_area_struct *vma,
@@ -1783,6 +1783,8 @@ extern void user_shm_unlock(size_t, struct ucounts *);
 
 struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
 			     pte_t pte);
+struct page *vm_normal_lru_page(struct vm_area_struct *vma, unsigned long addr,
+			     pte_t pte);
 struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
 				pmd_t pmd);
 
@@ -2901,6 +2903,7 @@ struct page *follow_page(struct vm_area_struct *vma, unsigned long address,
 #define FOLL_SPLIT_PMD	0x20000	/* split huge pmd before returning */
 #define FOLL_PIN	0x40000	/* pages must be released via unpin_user_page */
 #define FOLL_FAST_ONLY	0x80000	/* gup_fast: prevent fall-back to slow gup */
+#define FOLL_LRU	0x100000 /* return only LRU (anon or page cache) */
 
 /*
  * FOLL_PIN and FOLL_LONGTERM may be used in various combinations with each
@@ -3227,7 +3230,7 @@ extern long copy_huge_page_from_user(struct page *dst_page,
  * @vma: Pointer to the struct vm_area_struct to consider
  *
  * Whether transhuge page-table entries are considered "special" following
- * the definition in vm_normal_page().
+ * the definition in vm_normal_*_page().
  *
  * Return: true if transhuge page-table entries should be considered special,
  * false otherwise.
diff --git a/mm/gup.c b/mm/gup.c
index 41349b685eaf..d0494428a0c3 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -539,8 +539,10 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
 		pte_unmap_unlock(ptep, ptl);
 		return NULL;
 	}
-
-	page = vm_normal_page(vma, address, pte);
+	if (flags & (FOLL_MLOCK | FOLL_LRU))
+		page = vm_normal_lru_page(vma, address, pte);
+	else
+		page = vm_normal_page(vma, address, pte);
 	if (!page && pte_devmap(pte) && (flags & (FOLL_GET | FOLL_PIN))) {
 		/*
 		 * Only return device mapping pages in the FOLL_GET or FOLL_PIN
@@ -824,7 +826,7 @@ static struct page *follow_p4d_mask(struct vm_area_struct *vma,
  *
  * Return: the mapped (struct page *), %NULL if no mapping exists, or
  * an error pointer if there is a mapping to something not represented
- * by a page descriptor (see also vm_normal_page()).
+ * by a page descriptor (see also vm_normal_*_page()).
  */
 static struct page *follow_page_mask(struct vm_area_struct *vma,
 			      unsigned long address, unsigned int flags,
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 406a3c28c026..ea1efc825774 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2966,7 +2966,7 @@ static int split_huge_pages_pid(int pid, unsigned long vaddr_start,
 		}
 
 		/* FOLL_DUMP to ignore special (like zero) pages */
-		follflags = FOLL_GET | FOLL_DUMP;
+		follflags = FOLL_GET | FOLL_DUMP | FOLL_LRU;
 		page = follow_page(vma, addr, follflags);
 
 		if (IS_ERR(page))
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 131492fd1148..a7153db09afa 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -627,7 +627,7 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
 			result = SCAN_PTE_NON_PRESENT;
 			goto out;
 		}
-		page = vm_normal_page(vma, address, pteval);
+		page = vm_normal_lru_page(vma, address, pteval);
 		if (unlikely(!page)) {
 			result = SCAN_PAGE_NULL;
 			goto out;
@@ -1286,7 +1286,7 @@ static int khugepaged_scan_pmd(struct mm_struct *mm,
 		if (pte_write(pteval))
 			writable = true;
 
-		page = vm_normal_page(vma, _address, pteval);
+		page = vm_normal_lru_page(vma, _address, pteval);
 		if (unlikely(!page)) {
 			result = SCAN_PAGE_NULL;
 			goto out_unmap;
@@ -1494,7 +1494,7 @@ void collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr)
 		if (!pte_present(*pte))
 			goto abort;
 
-		page = vm_normal_page(vma, addr, *pte);
+		page = vm_normal_lru_page(vma, addr, *pte);
 
 		/*
 		 * Note that uprobe, debugger, or MAP_PRIVATE may change the
@@ -1512,7 +1512,7 @@ void collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr)
 
 		if (pte_none(*pte))
 			continue;
-		page = vm_normal_page(vma, addr, *pte);
+		page = vm_normal_lru_page(vma, addr, *pte);
 		page_remove_rmap(page, false);
 	}
 
diff --git a/mm/ksm.c b/mm/ksm.c
index c20bd4d9a0d9..352d37e44694 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -474,7 +474,7 @@ static int break_ksm(struct vm_area_struct *vma, unsigned long addr)
 	do {
 		cond_resched();
 		page = follow_page(vma, addr,
-				FOLL_GET | FOLL_MIGRATION | FOLL_REMOTE);
+				FOLL_GET | FOLL_MIGRATION | FOLL_REMOTE | FOLL_LRU);
 		if (IS_ERR_OR_NULL(page))
 			break;
 		if (PageKsm(page))
@@ -559,7 +559,7 @@ static struct page *get_mergeable_page(struct rmap_item *rmap_item)
 	if (!vma)
 		goto out;
 
-	page = follow_page(vma, addr, FOLL_GET);
+	page = follow_page(vma, addr, FOLL_GET | FOLL_LRU);
 	if (IS_ERR_OR_NULL(page))
 		goto out;
 	if (PageAnon(page)) {
diff --git a/mm/madvise.c b/mm/madvise.c
index 38d0f515d548..8dcfb93fe0d5 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -411,7 +411,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 		if (!pte_present(ptent))
 			continue;
 
-		page = vm_normal_page(vma, addr, ptent);
+		page = vm_normal_lru_page(vma, addr, ptent);
 		if (!page)
 			continue;
 
@@ -621,7 +621,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
 			continue;
 		}
 
-		page = vm_normal_page(vma, addr, ptent);
+		page = vm_normal_lru_page(vma, addr, ptent);
 		if (!page)
 			continue;
 
diff --git a/mm/memory.c b/mm/memory.c
index c125c4969913..5e83b65a74aa 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -621,6 +621,13 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
 		if (is_zero_pfn(pfn))
 			return NULL;
 		if (pte_devmap(pte))
+/*
+ * NOTE: Technically this should goto check_pfn label. However, page->_mapcount
+ * is never incremented for device pages that are mmap through DAX mechanism
+ * using pmem driver mounted into ext4 filesystem. When these pages are unmap,
+ * zap_pte_range is called and vm_normal_page return a valid page with
+ * page_mapcount() = 0, before page_remove_rmap is called.
+ */
 			return NULL;
 
 		print_bad_pte(vma, addr, pte, NULL);
@@ -661,6 +668,35 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
 	return pfn_to_page(pfn);
 }
 
+/**
+ * vm_normal_lru_page - gets LRU handled page associated with a pte.
+ *
+ * @vma: user vma the page belongs to.
+ * @addr: user address the page belongs to.
+ * @pte: page table entry associated to the page.
+ *
+ * This function gets the "struct page" associated with a pte, only for pages
+ * that can be put on an LRU list and that support NUMA migration, KSM and
+ * THP.
+ *
+ * With DEVICE_COHERENT introduction, vm_normal_pages() could return
+ * device-managed anonymous pages that are not LRU pages. This
+ * vm_normal_lru_page function, makes sure to return LRU handled pages only.
+ *
+ * Return: "struct page" reference associated with the pte.
+ */
+struct page *vm_normal_lru_page(struct vm_area_struct *vma, unsigned long addr,
+			    pte_t pte)
+{
+	struct page *page;
+
+	page = vm_normal_page(vma, addr, pte);
+	if (page && is_zone_device_page(page))
+		return NULL;
+
+	return page;
+}
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
 				pmd_t pmd)
@@ -2168,7 +2204,7 @@ EXPORT_SYMBOL(vmf_insert_pfn);
 
 static bool vm_mixed_ok(struct vm_area_struct *vma, pfn_t pfn)
 {
-	/* these checks mirror the abort conditions in vm_normal_page */
+	/* these checks mirror the abort conditions in vm_normal_lru_page */
 	if (vma->vm_flags & VM_MIXEDMAP)
 		return true;
 	if (pfn_t_devmap(pfn))
@@ -4364,7 +4400,7 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
 	old_pte = ptep_get(vmf->pte);
 	pte = pte_modify(old_pte, vma->vm_page_prot);
 
-	page = vm_normal_page(vma, vmf->address, pte);
+	page = vm_normal_lru_page(vma, vmf->address, pte);
 	if (!page)
 		goto out_map;
 
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 69284d3b5e53..651408f14b3e 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -527,11 +527,11 @@ static int queue_pages_pte_range(pmd_t *pmd, unsigned long addr,
 	for (; addr != end; pte++, addr += PAGE_SIZE) {
 		if (!pte_present(*pte))
 			continue;
-		page = vm_normal_page(vma, addr, *pte);
+		page = vm_normal_lru_page(vma, addr, *pte);
 		if (!page)
 			continue;
 		/*
-		 * vm_normal_page() filters out zero pages, but there might
+		 * vm_normal_lru_page() filters out zero pages, but there might
 		 * still be PageReserved pages to skip, perhaps in a VDSO.
 		 */
 		if (PageReserved(page))
diff --git a/mm/migrate.c b/mm/migrate.c
index c31d04b46a5e..17d049311b78 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -1614,7 +1614,7 @@ static int add_page_for_migration(struct mm_struct *mm, unsigned long addr,
 		goto out;
 
 	/* FOLL_DUMP to ignore special (like zero) pages */
-	follflags = FOLL_GET | FOLL_DUMP;
+	follflags = FOLL_GET | FOLL_DUMP | FOLL_LRU;
 	page = follow_page(vma, addr, follflags);
 
 	err = PTR_ERR(page);
diff --git a/mm/mlock.c b/mm/mlock.c
index 25934e7db3e1..bb09926aeee7 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -342,7 +342,7 @@ static void __munlock_pagevec(struct pagevec *pvec, struct zone *zone)
  * a non-TPH page already pinned and in the @pvec, and that it belongs to @zone.
  *
  * The rest of @pvec is filled by subsequent pages within the same pmd and same
- * zone, as long as the pte's are present and vm_normal_page() succeeds. These
+ * zone, as long as the pte's are present and vm_normal_lru_page() succeeds. These
  * pages also get pinned.
  *
  * Returns the address of the next page that should be scanned. This equals
@@ -373,7 +373,7 @@ static unsigned long __munlock_pagevec_fill(struct pagevec *pvec,
 		struct page *page = NULL;
 		pte++;
 		if (pte_present(*pte))
-			page = vm_normal_page(vma, start, *pte);
+			page = vm_normal_lru_page(vma, start, *pte);
 		/*
 		 * Break if page could not be obtained or the page's node+zone does not
 		 * match
@@ -439,7 +439,7 @@ void munlock_vma_pages_range(struct vm_area_struct *vma,
 		 * suits munlock very well (and if somehow an abnormal page
 		 * has sneaked into the range, we won't oops here: great).
 		 */
-		page = follow_page(vma, start, FOLL_GET | FOLL_DUMP);
+		page = follow_page(vma, start, FOLL_GET | FOLL_DUMP | FOLL_LRU);
 
 		if (page && !IS_ERR(page)) {
 			if (PageTransTail(page)) {
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 2887644fd150..bc3e75334aeb 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -88,7 +88,7 @@ static unsigned long change_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
 				if (pte_protnone(oldpte))
 					continue;
 
-				page = vm_normal_page(vma, addr, oldpte);
+				page = vm_normal_lru_page(vma, addr, oldpte);
 				if (!page || PageKsm(page))
 					continue;
 
-- 
2.32.0

