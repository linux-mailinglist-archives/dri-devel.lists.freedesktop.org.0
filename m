Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9B94C7A84
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 21:34:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678D610E8AD;
	Mon, 28 Feb 2022 20:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA43710E8BF;
 Mon, 28 Feb 2022 20:34:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXV4IxVdV2lSFqjTWrl6VVbIvXZygsC+ElMIkqAhb0+vMhHdCdq1C+jkd3Hv6yLqWAE6kT4K9MdhqCHuVz3jYvCbefYFkMuPJ4DKSJ+6T46EVxUgNXXYLHX9O9ZXmqnAuAHiLyuzJA4z6IVD6qCJWJ6jE+PQoUO97oz5emXdJ1PYbphCdj+nXHuyPkxrw/nBZFyuLfqf7O6SVT6bizNVmtHLUQGDWloXnwj1M7ErsXyK8pvYQ/MIMBqOrLOM2//FpUGOT3BnumTJVUwhrvxge301LHPY2xJE9qQQ/WEH8ha4zFWtLll7+NuNO4J6TH6OFwWK7ux/zyKR/3xwZ6V31Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RX7PGB/PChp3W1B92xyGcTqjJyfE4keZYAfy4x0ERm8=;
 b=ERvvt34VE7ykQE5WhcWc35qTqDQSs3HCLaliN1uHAIZXyWSQjfXvaVbASu2S+NaxokVdzSYXGoe5058DpljjxLUB6W7dJGnJD2tdx/VbJIUaKWpPf6ipVx6qGuHhLaPTxSBw+T8zlAEP57mBNqXcNuQvFNAIioNo1cLfuizhktgf00wEb7r0rALqoY+MGkI/Ivfg0SYMevMlTkGlSiYPaWsV9qQjbkumkw1C6KIrAdE5Ze1qDxoJloGslfRrB6tGscNnMVcGLXCEH6/6nqj/lpbkfoHllrlSlHvEijpwjG3m5WXVMZTYmWlMFyeirCb25v665LmzvKNu/DoimPU3LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RX7PGB/PChp3W1B92xyGcTqjJyfE4keZYAfy4x0ERm8=;
 b=sc3DQMt2hk7eqOy9Itw8w8yY3YR30VSI0heny+CldXJ6vy+zdH/3YSxccah52z9mkgXkwCZsDtjNDZffxv2AgPe/URujkCxEm9PjTFctYJs+zmQhmNuc6/nOCsFdzHU9CktcZVX3JhmCvZtJvhKQKWY/u7rQ68qakFOc8Sm8m7Y=
Received: from DM5PR13CA0047.namprd13.prod.outlook.com (2603:10b6:3:7b::33) by
 DM6PR12MB4812.namprd12.prod.outlook.com (2603:10b6:5:1ff::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.24; Mon, 28 Feb 2022 20:34:29 +0000
Received: from DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:7b:cafe::ec) by DM5PR13CA0047.outlook.office365.com
 (2603:10b6:3:7b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.9 via Frontend
 Transport; Mon, 28 Feb 2022 20:34:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT040.mail.protection.outlook.com (10.13.173.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Mon, 28 Feb 2022 20:34:29 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 28 Feb
 2022 14:34:28 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH] mm: split vm_normal_pages for LRU and non-LRU handling
Date: Mon, 28 Feb 2022 14:34:01 -0600
Message-ID: <20220228203401.7155-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220218192640.GV4160@nvidia.com>
References: <20220218192640.GV4160@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94d984be-580f-471a-330e-08d9faf9b84b
X-MS-TrafficTypeDiagnostic: DM6PR12MB4812:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4812E8C5360D9C54DA67E62CFD019@DM6PR12MB4812.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ewojKT4bXnNf7kepHvRQ4fntm6t2pg2ypZCyh0eR4FfVeu+hj0g+28RVLHQFpjUMehdZKvFUdg3G+mZLEE0mppgpv46KLwwp3xXuUOoMl/BaFDKDjXkeVuUY1SQnI5xZ2tDJDdI4ZeDG8MXDB7WiFtZONuxVErlTEAVtAkriaX9baAXv8f0zTIpMSqTiDzcGYZkINhDLZ4lziW7tYjnCgb6giPxd/e8/8ZmI/gnS/aE9sQ2r32RlmKs7UbqfXqYDpCL8GHVYdLRTVX7Ingz/HaalJxkPHxSk9/XSoI2TXbkHr39vH5R0uVwSMtekfJr3qIlwZh1+oYcBXiSfO1T88ZfmEuwU7ao8LIY8ZKmlPIryELMXnNGfIzQcVzx66Q89KppnxVw7X8ygjVn25tcgYDsiuFsLk2s/MICHm1r96q+xxRsETSd3CkppxvFrylXwkKM0KhWz76S890JRjEQF9MRwy3yfe/SvYAPvd3o+K0oO+TDLG3hA9SxgUQ+rooQ8UqFF6EU147DyvdX0xIwsS9VyFa0u70b7E2VjAJ/+JT0oZbub4gLDbH3fksCMmD+p09lBPZuThKI0ggsHkVl+ety/Qp91gOhvgO4+UN4GUdfK18VtWjlcobWxlLhOfowfnUPYPqr4b2cUlEKLRIwjjOFJgA5HCNesYK4s8D373kL7rabT9xrBLYttGVHJzCxhvguPJ5LScj2gMkxt8WcWGA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(316002)(5660300002)(7416002)(8936002)(1076003)(86362001)(44832011)(8676002)(82310400004)(70586007)(70206006)(4326008)(2616005)(2906002)(30864003)(16526019)(186003)(26005)(7696005)(36756003)(81166007)(356005)(6666004)(83380400001)(508600001)(54906003)(426003)(336012)(6916009)(36860700001)(47076005)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 20:34:29.4122 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d984be-580f-471a-330e-08d9faf9b84b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4812
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

DEVICE_COHERENT pages introduce a subtle distinction in the way
"normal" pages can be used by various callers throughout the kernel.
They behave like normal pages for purposes of mapping in CPU page
tables, and for COW. But they do not support LRU lists, NUMA
migration or THP. Therefore we split vm_normal_page into two
functions vm_normal_any_page and vm_normal_lru_page. The latter will
only return pages that can be put on an LRU list and that support
NUMA migration and THP.

We also introduced a FOLL_LRU flag that adds the same behaviour to
follow_page and related APIs, to allow callers to specify that they
expect to put pages on an LRU list.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 fs/proc/task_mmu.c  | 12 +++++-----
 include/linux/mm.h  | 53 ++++++++++++++++++++++++---------------------
 mm/gup.c            | 10 +++++----
 mm/hmm.c            |  2 +-
 mm/huge_memory.c    |  2 +-
 mm/khugepaged.c     |  8 +++----
 mm/ksm.c            |  4 ++--
 mm/madvise.c        |  4 ++--
 mm/memcontrol.c     |  2 +-
 mm/memory.c         | 38 ++++++++++++++++++++++----------
 mm/mempolicy.c      |  4 ++--
 mm/migrate.c        |  2 +-
 mm/migrate_device.c |  2 +-
 mm/mlock.c          |  6 ++---
 mm/mprotect.c       |  2 +-
 15 files changed, 85 insertions(+), 66 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 18f8c3acbb85..4274128fbb4c 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -519,7 +519,7 @@ static void smaps_pte_entry(pte_t *pte, unsigned long addr,
 	struct page *page = NULL;
 
 	if (pte_present(*pte)) {
-		page = vm_normal_page(vma, addr, *pte);
+		page = vm_normal_any_page(vma, addr, *pte);
 	} else if (is_swap_pte(*pte)) {
 		swp_entry_t swpent = pte_to_swp_entry(*pte);
 
@@ -705,7 +705,7 @@ static int smaps_hugetlb_range(pte_t *pte, unsigned long hmask,
 	struct page *page = NULL;
 
 	if (pte_present(*pte)) {
-		page = vm_normal_page(vma, addr, *pte);
+		page = vm_normal_any_page(vma, addr, *pte);
 	} else if (is_swap_pte(*pte)) {
 		swp_entry_t swpent = pte_to_swp_entry(*pte);
 
@@ -1059,7 +1059,7 @@ static inline bool pte_is_pinned(struct vm_area_struct *vma, unsigned long addr,
 		return false;
 	if (likely(!test_bit(MMF_HAS_PINNED, &vma->vm_mm->flags)))
 		return false;
-	page = vm_normal_page(vma, addr, pte);
+	page = vm_normal_any_page(vma, addr, pte);
 	if (!page)
 		return false;
 	return page_maybe_dma_pinned(page);
@@ -1172,7 +1172,7 @@ static int clear_refs_pte_range(pmd_t *pmd, unsigned long addr,
 		if (!pte_present(ptent))
 			continue;
 
-		page = vm_normal_page(vma, addr, ptent);
+		page = vm_normal_any_page(vma, addr, ptent);
 		if (!page)
 			continue;
 
@@ -1383,7 +1383,7 @@ static pagemap_entry_t pte_to_pagemap_entry(struct pagemapread *pm,
 		if (pm->show_pfn)
 			frame = pte_pfn(pte);
 		flags |= PM_PRESENT;
-		page = vm_normal_page(vma, addr, pte);
+		page = vm_normal_any_page(vma, addr, pte);
 		if (pte_soft_dirty(pte))
 			flags |= PM_SOFT_DIRTY;
 		if (pte_uffd_wp(pte))
@@ -1761,7 +1761,7 @@ static struct page *can_gather_numa_stats(pte_t pte, struct vm_area_struct *vma,
 	if (!pte_present(pte))
 		return NULL;
 
-	page = vm_normal_page(vma, addr, pte);
+	page = vm_normal_lru_page(vma, addr, pte);
 	if (!page)
 		return NULL;
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index ff9f149ca201..8c9f87151d93 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -593,8 +593,8 @@ struct vm_operations_struct {
 					unsigned long addr);
 #endif
 	/*
-	 * Called by vm_normal_page() for special PTEs to find the
-	 * page for @addr.  This is useful if the default behavior
+	 * Called by vm_normal_x_page() for special PTEs to find the
+	 * page for @addr. This is useful if the default behavior
 	 * (using pte_page()) would not find the correct page.
 	 */
 	struct page *(*find_special_page)(struct vm_area_struct *vma,
@@ -1781,7 +1781,9 @@ static inline bool can_do_mlock(void) { return false; }
 extern int user_shm_lock(size_t, struct ucounts *);
 extern void user_shm_unlock(size_t, struct ucounts *);
 
-struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
+struct page *vm_normal_any_page(struct vm_area_struct *vma, unsigned long addr,
+			     pte_t pte);
+struct page *vm_normal_lru_page(struct vm_area_struct *vma, unsigned long addr,
 			     pte_t pte);
 struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
 				pmd_t pmd);
@@ -2880,27 +2882,28 @@ static inline vm_fault_t vmf_error(int err)
 struct page *follow_page(struct vm_area_struct *vma, unsigned long address,
 			 unsigned int foll_flags);
 
-#define FOLL_WRITE	0x01	/* check pte is writable */
-#define FOLL_TOUCH	0x02	/* mark page accessed */
-#define FOLL_GET	0x04	/* do get_page on page */
-#define FOLL_DUMP	0x08	/* give error on hole if it would be zero */
-#define FOLL_FORCE	0x10	/* get_user_pages read/write w/o permission */
-#define FOLL_NOWAIT	0x20	/* if a disk transfer is needed, start the IO
-				 * and return without waiting upon it */
-#define FOLL_POPULATE	0x40	/* fault in pages (with FOLL_MLOCK) */
-#define FOLL_NOFAULT	0x80	/* do not fault in pages */
-#define FOLL_HWPOISON	0x100	/* check page is hwpoisoned */
-#define FOLL_NUMA	0x200	/* force NUMA hinting page fault */
-#define FOLL_MIGRATION	0x400	/* wait for page to replace migration entry */
-#define FOLL_TRIED	0x800	/* a retry, previous pass started an IO */
-#define FOLL_MLOCK	0x1000	/* lock present pages */
-#define FOLL_REMOTE	0x2000	/* we are working on non-current tsk/mm */
-#define FOLL_COW	0x4000	/* internal GUP flag */
-#define FOLL_ANON	0x8000	/* don't do file mappings */
-#define FOLL_LONGTERM	0x10000	/* mapping lifetime is indefinite: see below */
-#define FOLL_SPLIT_PMD	0x20000	/* split huge pmd before returning */
-#define FOLL_PIN	0x40000	/* pages must be released via unpin_user_page */
-#define FOLL_FAST_ONLY	0x80000	/* gup_fast: prevent fall-back to slow gup */
+#define FOLL_WRITE	0x01	 /* check pte is writable */
+#define FOLL_TOUCH	0x02	 /* mark page accessed */
+#define FOLL_GET	0x04	 /* do get_page on page */
+#define FOLL_DUMP	0x08	 /* give error on hole if it would be zero */
+#define FOLL_FORCE	0x10	 /* get_user_pages read/write w/o permission */
+#define FOLL_NOWAIT	0x20	 /* if a disk transfer is needed, start the IO
+				  * and return without waiting upon it */
+#define FOLL_POPULATE	0x40	 /* fault in pages (with FOLL_MLOCK) */
+#define FOLL_NOFAULT	0x80	 /* do not fault in pages */
+#define FOLL_HWPOISON	0x100	 /* check page is hwpoisoned */
+#define FOLL_NUMA	0x200	 /* force NUMA hinting page fault */
+#define FOLL_MIGRATION	0x400	 /* wait for page to replace migration entry */
+#define FOLL_TRIED	0x800	 /* a retry, previous pass started an IO */
+#define FOLL_MLOCK	0x1000	 /* lock present pages */
+#define FOLL_REMOTE	0x2000	 /* we are working on non-current tsk/mm */
+#define FOLL_COW	0x4000	 /* internal GUP flag */
+#define FOLL_ANON	0x8000	 /* don't do file mappings */
+#define FOLL_LONGTERM	0x10000	 /* mapping lifetime is indefinite: see below */
+#define FOLL_SPLIT_PMD	0x20000	 /* split huge pmd before returning */
+#define FOLL_PIN	0x40000	 /* pages must be released via unpin_user_page */
+#define FOLL_FAST_ONLY	0x80000	 /* gup_fast: prevent fall-back to slow gup */
+#define FOLL_LRU	0x100000 /* return only LRU (anon or page cache) */
 
 /*
  * FOLL_PIN and FOLL_LONGTERM may be used in various combinations with each
@@ -3227,7 +3230,7 @@ extern long copy_huge_page_from_user(struct page *dst_page,
  * @vma: Pointer to the struct vm_area_struct to consider
  *
  * Whether transhuge page-table entries are considered "special" following
- * the definition in vm_normal_page().
+ * the definition in vm_normal_x_page().
  *
  * Return: true if transhuge page-table entries should be considered special,
  * false otherwise.
diff --git a/mm/gup.c b/mm/gup.c
index 41349b685eaf..9e172c906ded 100644
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
+		page = vm_normal_any_page(vma, address, pte);
 	if (!page && pte_devmap(pte) && (flags & (FOLL_GET | FOLL_PIN))) {
 		/*
 		 * Only return device mapping pages in the FOLL_GET or FOLL_PIN
@@ -824,7 +826,7 @@ static struct page *follow_p4d_mask(struct vm_area_struct *vma,
  *
  * Return: the mapped (struct page *), %NULL if no mapping exists, or
  * an error pointer if there is a mapping to something not represented
- * by a page descriptor (see also vm_normal_page()).
+ * by a page descriptor (see also vm_normal_x_page()).
  */
 static struct page *follow_page_mask(struct vm_area_struct *vma,
 			      unsigned long address, unsigned int flags,
@@ -917,7 +919,7 @@ static int get_gate_page(struct mm_struct *mm, unsigned long address,
 	*vma = get_gate_vma(mm);
 	if (!page)
 		goto out;
-	*page = vm_normal_page(*vma, address, *pte);
+	*page = vm_normal_any_page(*vma, address, *pte);
 	if (!*page) {
 		if ((gup_flags & FOLL_DUMP) || !is_zero_pfn(pte_pfn(*pte)))
 			goto unmap;
diff --git a/mm/hmm.c b/mm/hmm.c
index bd56641c79d4..90c949d66712 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -300,7 +300,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 	 * Since each architecture defines a struct page for the zero page, just
 	 * fall through and treat it like a normal page.
 	 */
-	if (!vm_normal_page(walk->vma, addr, pte) &&
+	if (!vm_normal_any_page(walk->vma, addr, pte) &&
 	    !pte_devmap(pte) &&
 	    !is_zero_pfn(pte_pfn(pte))) {
 		if (hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0)) {
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
index 5604064df464..1a553aad9aa3 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -439,7 +439,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 		if (!pte_present(ptent))
 			continue;
 
-		page = vm_normal_page(vma, addr, ptent);
+		page = vm_normal_lru_page(vma, addr, ptent);
 		if (!page)
 			continue;
 
@@ -649,7 +649,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
 			continue;
 		}
 
-		page = vm_normal_page(vma, addr, ptent);
+		page = vm_normal_lru_page(vma, addr, ptent);
 		if (!page)
 			continue;
 
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 10259c35fde2..9677eb27dea8 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5476,7 +5476,7 @@ enum mc_target_type {
 static struct page *mc_handle_present_pte(struct vm_area_struct *vma,
 						unsigned long addr, pte_t ptent)
 {
-	struct page *page = vm_normal_page(vma, addr, ptent);
+	struct page *page = vm_normal_any_page(vma, addr, ptent);
 
 	if (!page || !page_mapped(page))
 		return NULL;
diff --git a/mm/memory.c b/mm/memory.c
index c125c4969913..cff84e6a6c4b 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -565,7 +565,7 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
 }
 
 /*
- * vm_normal_page -- This function gets the "struct page" associated with a pte.
+ * vm_normal_any_page -- This function gets the "struct page" associated with a pte.
  *
  * "Special" mappings do not wish to be associated with a "struct page" (either
  * it doesn't exist, or it exists but they don't want to touch it). In this
@@ -606,7 +606,7 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
  * PFNMAP mappings in order to support COWable mappings.
  *
  */
-struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
+struct page *vm_normal_any_page(struct vm_area_struct *vma, unsigned long addr,
 			    pte_t pte)
 {
 	unsigned long pfn = pte_pfn(pte);
@@ -620,8 +620,6 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
 			return NULL;
 		if (is_zero_pfn(pfn))
 			return NULL;
-		if (pte_devmap(pte))
-			return NULL;
 
 		print_bad_pte(vma, addr, pte, NULL);
 		return NULL;
@@ -661,6 +659,22 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
 	return pfn_to_page(pfn);
 }
 
+/*
+ * vm_normal_lru_page -- This function gets the "struct page" associated
+ * with a pte only for page cache and anon page. These pages are LRU handled.
+ */
+struct page *vm_normal_lru_page(struct vm_area_struct *vma, unsigned long addr,
+			    pte_t pte)
+{
+	struct page *page;
+
+	page = vm_normal_any_page(vma, addr, pte);
+	if (is_zone_device_page(page))
+		return NULL;
+
+	return page;
+}
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
 				pmd_t pmd)
@@ -670,7 +684,7 @@ struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
 	/*
 	 * There is no pmd_special() but there may be special pmds, e.g.
 	 * in a direct-access (dax) mapping, so let's just replicate the
-	 * !CONFIG_ARCH_HAS_PTE_SPECIAL case from vm_normal_page() here.
+	 * !CONFIG_ARCH_HAS_PTE_SPECIAL case from vm_normal_any_page() here.
 	 */
 	if (unlikely(vma->vm_flags & (VM_PFNMAP|VM_MIXEDMAP))) {
 		if (vma->vm_flags & VM_MIXEDMAP) {
@@ -946,7 +960,7 @@ copy_present_pte(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 	pte_t pte = *src_pte;
 	struct page *page;
 
-	page = vm_normal_page(src_vma, addr, pte);
+	page = vm_normal_any_page(src_vma, addr, pte);
 	if (page) {
 		int retval;
 
@@ -1358,7 +1372,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
 		if (pte_present(ptent)) {
 			struct page *page;
 
-			page = vm_normal_page(vma, addr, ptent);
+			page = vm_normal_any_page(vma, addr, ptent);
 			if (unlikely(zap_skip_check_mapping(details, page)))
 				continue;
 			ptent = ptep_get_and_clear_full(mm, addr, pte,
@@ -2168,7 +2182,7 @@ EXPORT_SYMBOL(vmf_insert_pfn);
 
 static bool vm_mixed_ok(struct vm_area_struct *vma, pfn_t pfn)
 {
-	/* these checks mirror the abort conditions in vm_normal_page */
+	/* these checks mirror the abort conditions in vm_normal_lru_page */
 	if (vma->vm_flags & VM_MIXEDMAP)
 		return true;
 	if (pfn_t_devmap(pfn))
@@ -2198,7 +2212,7 @@ static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
 
 	/*
 	 * If we don't have pte special, then we have to use the pfn_valid()
-	 * based VM_MIXEDMAP scheme (see vm_normal_page), and thus we *must*
+	 * based VM_MIXEDMAP scheme (see vm_normal_any_page), and thus we *must*
 	 * refcount the page if pfn_valid is true (hence insert_page rather
 	 * than insert_pfn).  If a zero_pfn were inserted into a VM_MIXEDMAP
 	 * without pte special, it would there be refcounted as a normal page.
@@ -2408,7 +2422,7 @@ int remap_pfn_range_notrack(struct vm_area_struct *vma, unsigned long addr,
 	 * There's a horrible special case to handle copy-on-write
 	 * behaviour that some programs depend on. We mark the "original"
 	 * un-COW'ed pages by matching them up with "vma->vm_pgoff".
-	 * See vm_normal_page() for details.
+	 * See vm_normal_any_page() for details.
 	 */
 	if (is_cow_mapping(vma->vm_flags)) {
 		if (addr != vma->vm_start || end != vma->vm_end)
@@ -3267,7 +3281,7 @@ static vm_fault_t do_wp_page(struct vm_fault *vmf)
 		     mm_tlb_flush_pending(vmf->vma->vm_mm)))
 		flush_tlb_page(vmf->vma, vmf->address);
 
-	vmf->page = vm_normal_page(vma, vmf->address, vmf->orig_pte);
+	vmf->page = vm_normal_any_page(vma, vmf->address, vmf->orig_pte);
 	if (!vmf->page) {
 		/*
 		 * VM_MIXEDMAP !pfn_valid() case, or VM_SOFTDIRTY clear on a
@@ -4364,7 +4378,7 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
 	old_pte = ptep_get(vmf->pte);
 	pte = pte_modify(old_pte, vma->vm_page_prot);
 
-	page = vm_normal_page(vma, vmf->address, pte);
+	page = vm_normal_lru_page(vma, vmf->address, pte);
 	if (!page)
 		goto out_map;
 
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 028e8dd82b44..9962de4981d6 100644
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
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 3373b535d5c9..fac1b6978361 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -154,7 +154,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 				migrate->cpages++;
 				goto next;
 			}
-			page = vm_normal_page(migrate->vma, addr, pte);
+			page = vm_normal_any_page(migrate->vma, addr, pte);
 			if (page && !is_zone_device_page(page) &&
 			    !(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
 				goto next;
diff --git a/mm/mlock.c b/mm/mlock.c
index 8f584eddd305..52613e2f2a70 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -342,7 +342,7 @@ static void __munlock_pagevec(struct pagevec *pvec, struct zone *zone)
  * a non-TPH page already pinned and in the @pvec, and that it belongs to @zone.
  *
  * The rest of @pvec is filled by subsequent pages within the same pmd and same
- * zone, as long as the pte's are present and vm_normal_page() succeeds. These
+ * zone, as long as the pte's are present and vm_normal_any_page() succeeds. These
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
index 0138dfcdb1d8..d236394d41d5 100644
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

