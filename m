Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CD0539472
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 17:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9391010F362;
	Tue, 31 May 2022 15:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D6B10F1C8;
 Tue, 31 May 2022 15:56:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYjR/0M2IZPSGNruWJorK29/PXun7bFuzFoplNfX7GtGyIptahpfGbMgPjKXMTEwshBYqm33HW1Z1sbClq4ta13tuwWLHFE4zFP2zD3h7JtTlqOlltgdUQRQLRVg1oMfCur8HYRJIJMMGFRNcCbVgw5B89FiDgMDMdcS7JNZIk4T1eGDf0GiZk56+eppgyDt+FkL2rAGk7YnlANmbu0J6BPLbYk5GLN0zjPyM/TdfCh8nIAm/vFd77cLCX7BewH+ER1IvLUfSo9+ChPObJRwY82kSB2gP6lvpKFfB3GHViguf7pg+M6GoIDIvdLCaeoMif05v3WF54uWds+k2M2vxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UB1A6mVp2FjGDcQ5stu74yF2RVvpM6RjTh5m5iBLXAk=;
 b=nQRBUK/g3aTGruJ5gMq8DzQ2ZCb/H7LBSai5jq/9DrJScIp9yEJZryGE2v+DkvDTT8OwHAJk+q5cUArsn1ENgyxfRjt0CGebNUNCpyC/xxuRTzg4CoqnoyGZPxRcX/F++iVeBa4xSCTuSBQdUTizyyMHVgf0l820D6OUKdq4dq4hTJNm4JfZNFzbuIW8hxymolYl48VwKD98ShB63shtr8ZXza3feS89lvU2Kdv/A851n7HyPbWOWAZgLTmKjCaMh2/HyZykPComZ6BxBHyBqhADD679GyJGYN0UUPvaTEct5HnFVops37HaHdHneE1+vC4Ax5S08FkBeXR8GZZ7Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UB1A6mVp2FjGDcQ5stu74yF2RVvpM6RjTh5m5iBLXAk=;
 b=LntWL5h8l2203PH3wW61zCnB3YZz8J35fx8RGly9vSazHndSSr8lFYwVJiKl6L/RcPIWeaH08fVRlyv06oDJU803FZgK4K6qfNJ0hDJ0JEGPYjyUR4ZmImUwa1FEIOjBGpkNLIZBaBj7dW16QvNuqJvuyt26gxiPHHiGgr+f5j8=
Received: from BN6PR13CA0049.namprd13.prod.outlook.com (2603:10b6:404:11::11)
 by MWHPR12MB1630.namprd12.prod.outlook.com (2603:10b6:301:c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 15:56:42 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:11:cafe::aa) by BN6PR13CA0049.outlook.office365.com
 (2603:10b6:404:11::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12 via Frontend
 Transport; Tue, 31 May 2022 15:56:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 15:56:41 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 31 May
 2022 10:56:40 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v4 02/13] mm: handling Non-LRU pages returned by
 vm_normal_pages
Date: Tue, 31 May 2022 10:56:18 -0500
Message-ID: <20220531155629.20057-3-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220531155629.20057-1-alex.sierra@amd.com>
References: <20220531155629.20057-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5473dfc-cb76-43e3-4f58-08da431e2791
X-MS-TrafficTypeDiagnostic: MWHPR12MB1630:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB16306CA2BA82F55EE2BEFC95FDDC9@MWHPR12MB1630.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zd5/sb5SmkEdaD5jcLbhxCdgkNqFInRaotgKlIyDW3CmKQZP3H8GSeoNLgnSCSJpHGBtTR+Ckc+0FzxcwqC5PCG8gI6bPBsYSDRxZ1f33vpXMBQYyMJidgzFU5GejUgMc8yMcGRl1Qq65VoBASHCO5h5Ga90OMshqAdRWQjn2AdZBYys+kcpVJ0cQ9AmNA+O5q4jhG5XtXOjze5Q/BDsn8yplZ0S0dX7zQeHqRLq+2PWRZiFsm7uF+P7cE5VgdBMT+aN9Uh6JNDXN3mLs2Qvo70ewZZcUnmoEWgqWvxm05ZjYfleHGOwHFmj8pRXEuYCH51CgVEI7JcDh4m1Vdq5S7vCQTJd0M7VlBrUkJ2Do+Z/Wjr2LYbndcTP21d+ObbrHLvNfypXMtacw2ZPiqt4z5Fp2F1+ldsQMiOx/CYz+wJ06gUwBCZW36TnbPmLggYutaSYXbAuJvCGM/j7dx1DPw/Y64fCOwuT/B04PwCgFGYQ40AB9QyOgmX6XUFg7lh2OMOOI8QJkATzCQnU3i7V+TAeyL3ik0CiNSbyi95Fl4rjC642VEZmDkN9jdLDaqUVRZ1TPREf2BrfLBugQl0pu3HL2zgGXvlM+v1cpIvFCOZ5E7ylBl+K1dRS1NMNyKDFy4AmVCEPGHvDsXUbM7XE7Az2eiPHbP5Cv4r0yJ6LS0KWxqEuZbaUNu/KP4huYQ44VKwfdbH3E7Yl8e+3JfJd6GpgZ4VPd9OT36JvsEWOAKctAUufVMG/tW0qIgA8Uaic
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(16526019)(86362001)(2616005)(508600001)(1076003)(186003)(81166007)(44832011)(6666004)(2906002)(7696005)(356005)(8936002)(5660300002)(26005)(82310400005)(6916009)(54906003)(316002)(36756003)(7416002)(36860700001)(4326008)(83380400001)(40460700003)(426003)(47076005)(336012)(70586007)(70206006)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 15:56:41.7635 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5473dfc-cb76-43e3-4f58-08da431e2791
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1630
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
COW. They do not support LRU lists, NUMA migration or THP.

We also introduced a FOLL_LRU flag that adds the same behaviour to
follow_page and related APIs, to allow callers to specify that they
expect to put pages on an LRU list.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 fs/proc/task_mmu.c | 2 +-
 include/linux/mm.h | 3 ++-
 mm/gup.c           | 6 +++++-
 mm/huge_memory.c   | 2 +-
 mm/khugepaged.c    | 9 ++++++---
 mm/ksm.c           | 6 +++---
 mm/madvise.c       | 4 ++--
 mm/memory.c        | 9 ++++++++-
 mm/mempolicy.c     | 2 +-
 mm/migrate.c       | 4 ++--
 mm/mlock.c         | 2 +-
 mm/mprotect.c      | 2 +-
 12 files changed, 33 insertions(+), 18 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 2d04e3470d4c..2dd8c8a66924 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1792,7 +1792,7 @@ static struct page *can_gather_numa_stats(pte_t pte, struct vm_area_struct *vma,
 		return NULL;
 
 	page = vm_normal_page(vma, addr, pte);
-	if (!page)
+	if (!page || is_zone_device_page(page))
 		return NULL;
 
 	if (PageReserved(page))
diff --git a/include/linux/mm.h b/include/linux/mm.h
index bc8f326be0ce..d3f43908ff8d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -601,7 +601,7 @@ struct vm_operations_struct {
 #endif
 	/*
 	 * Called by vm_normal_page() for special PTEs to find the
-	 * page for @addr.  This is useful if the default behavior
+	 * page for @addr. This is useful if the default behavior
 	 * (using pte_page()) would not find the correct page.
 	 */
 	struct page *(*find_special_page)(struct vm_area_struct *vma,
@@ -2934,6 +2934,7 @@ struct page *follow_page(struct vm_area_struct *vma, unsigned long address,
 #define FOLL_NUMA	0x200	/* force NUMA hinting page fault */
 #define FOLL_MIGRATION	0x400	/* wait for page to replace migration entry */
 #define FOLL_TRIED	0x800	/* a retry, previous pass started an IO */
+#define FOLL_LRU        0x1000  /* return only LRU (anon or page cache) */
 #define FOLL_REMOTE	0x2000	/* we are working on non-current tsk/mm */
 #define FOLL_COW	0x4000	/* internal GUP flag */
 #define FOLL_ANON	0x8000	/* don't do file mappings */
diff --git a/mm/gup.c b/mm/gup.c
index 551264407624..48b45bcc8501 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -532,7 +532,11 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
 	}
 
 	page = vm_normal_page(vma, address, pte);
-	if (!page && pte_devmap(pte) && (flags & (FOLL_GET | FOLL_PIN))) {
+	if ((flags & FOLL_LRU) && ((page && is_zone_device_page(page)) ||
+	    (!page && pte_devmap(pte)))) {
+		page = ERR_PTR(-EEXIST);
+		goto out;
+	} else if (!page && pte_devmap(pte) && (flags & (FOLL_GET | FOLL_PIN))) {
 		/*
 		 * Only return device mapping pages in the FOLL_GET or FOLL_PIN
 		 * case since they are only valid while holding the pgmap
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index a77c78a2b6b5..48182c8fe151 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2906,7 +2906,7 @@ static int split_huge_pages_pid(int pid, unsigned long vaddr_start,
 		}
 
 		/* FOLL_DUMP to ignore special (like zero) pages */
-		page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP);
+		page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP | FOLL_LRU);
 
 		if (IS_ERR(page))
 			continue;
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 16be62d493cd..671ac7800e53 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -618,7 +618,7 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
 			goto out;
 		}
 		page = vm_normal_page(vma, address, pteval);
-		if (unlikely(!page)) {
+		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
 			result = SCAN_PAGE_NULL;
 			goto out;
 		}
@@ -1267,7 +1267,7 @@ static int khugepaged_scan_pmd(struct mm_struct *mm,
 			writable = true;
 
 		page = vm_normal_page(vma, _address, pteval);
-		if (unlikely(!page)) {
+		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
 			result = SCAN_PAGE_NULL;
 			goto out_unmap;
 		}
@@ -1479,7 +1479,8 @@ void collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr)
 			goto abort;
 
 		page = vm_normal_page(vma, addr, *pte);
-
+		if (WARN_ON_ONCE(page && is_zone_device_page(page)))
+			page = NULL;
 		/*
 		 * Note that uprobe, debugger, or MAP_PRIVATE may change the
 		 * page table, but the new page will not be a subpage of hpage.
@@ -1497,6 +1498,8 @@ void collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr)
 		if (pte_none(*pte))
 			continue;
 		page = vm_normal_page(vma, addr, *pte);
+		if (WARN_ON_ONCE(page && is_zone_device_page(page)))
+			goto abort;
 		page_remove_rmap(page, vma, false);
 	}
 
diff --git a/mm/ksm.c b/mm/ksm.c
index 54f78c9eecae..400790128102 100644
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
@@ -2307,7 +2307,7 @@ static struct rmap_item *scan_get_next_rmap_item(struct page **page)
 		while (ksm_scan.address < vma->vm_end) {
 			if (ksm_test_exit(mm))
 				break;
-			*page = follow_page(vma, ksm_scan.address, FOLL_GET);
+			*page = follow_page(vma, ksm_scan.address, FOLL_GET | FOLL_LRU);
 			if (IS_ERR_OR_NULL(*page)) {
 				ksm_scan.address += PAGE_SIZE;
 				cond_resched();
diff --git a/mm/madvise.c b/mm/madvise.c
index d7b4f2602949..e5637181de1b 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -421,7 +421,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 			continue;
 
 		page = vm_normal_page(vma, addr, ptent);
-		if (!page)
+		if (!page || is_zone_device_page(page))
 			continue;
 
 		/*
@@ -639,7 +639,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
 		}
 
 		page = vm_normal_page(vma, addr, ptent);
-		if (!page)
+		if (!page || is_zone_device_page(page))
 			continue;
 
 		/*
diff --git a/mm/memory.c b/mm/memory.c
index 21dadf03f089..30ecbc715e60 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -624,6 +624,13 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
 		if (is_zero_pfn(pfn))
 			return NULL;
 		if (pte_devmap(pte))
+/*
+ * NOTE: New uers of ZONE_DEVICE will not set pte_devmap() and will have
+ * refcounts incremented on their struct pages when they are inserted into
+ * PTEs, thus they are safe to return here. Legacy ZONE_DEVICE pages that set
+ * pte_devmap() do not have refcounts. Example of legacy ZONE_DEVICE is
+ * MEMORY_DEVICE_FS_DAX type in pmem or virtio_fs drivers.
+ */
 			return NULL;
 
 		print_bad_pte(vma, addr, pte, NULL);
@@ -4685,7 +4692,7 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
 	pte = pte_modify(old_pte, vma->vm_page_prot);
 
 	page = vm_normal_page(vma, vmf->address, pte);
-	if (!page)
+	if (!page || is_zone_device_page(page))
 		goto out_map;
 
 	/* TODO: handle PTE-mapped THP */
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index d39b01fd52fe..abc26890fc95 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -523,7 +523,7 @@ static int queue_pages_pte_range(pmd_t *pmd, unsigned long addr,
 		if (!pte_present(*pte))
 			continue;
 		page = vm_normal_page(vma, addr, *pte);
-		if (!page)
+		if (!page || is_zone_device_page(page))
 			continue;
 		/*
 		 * vm_normal_page() filters out zero pages, but there might
diff --git a/mm/migrate.c b/mm/migrate.c
index e51588e95f57..f7d1b8312631 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -1612,7 +1612,7 @@ static int add_page_for_migration(struct mm_struct *mm, unsigned long addr,
 		goto out;
 
 	/* FOLL_DUMP to ignore special (like zero) pages */
-	page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP);
+	page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP | FOLL_LRU);
 
 	err = PTR_ERR(page);
 	if (IS_ERR(page))
@@ -1803,7 +1803,7 @@ static void do_pages_stat_array(struct mm_struct *mm, unsigned long nr_pages,
 			goto set_status;
 
 		/* FOLL_DUMP to ignore special (like zero) pages */
-		page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP);
+		page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP | FOLL_LRU);
 
 		err = PTR_ERR(page);
 		if (IS_ERR(page))
diff --git a/mm/mlock.c b/mm/mlock.c
index 716caf851043..b14e929084cc 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -333,7 +333,7 @@ static int mlock_pte_range(pmd_t *pmd, unsigned long addr,
 		if (!pte_present(*pte))
 			continue;
 		page = vm_normal_page(vma, addr, *pte);
-		if (!page)
+		if (!page || is_zone_device_page(page))
 			continue;
 		if (PageTransCompound(page))
 			continue;
diff --git a/mm/mprotect.c b/mm/mprotect.c
index ba5592655ee3..e034aae2a98b 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -95,7 +95,7 @@ static unsigned long change_pte_range(struct mmu_gather *tlb,
 					continue;
 
 				page = vm_normal_page(vma, addr, oldpte);
-				if (!page || PageKsm(page))
+				if (!page || is_zone_device_page(page) || PageKsm(page))
 					continue;
 
 				/* Also skip shared copy-on-write pages */
-- 
2.32.0

