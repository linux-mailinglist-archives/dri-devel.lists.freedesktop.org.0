Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC8D4D5073
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 18:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE5210E840;
	Thu, 10 Mar 2022 17:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAB510E6F4;
 Thu, 10 Mar 2022 17:26:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfhHLVfWR0Wgxu/H3Vh01Jes+HnHtg1xLBa/iD7wH2AuTKIfp/CwjrH+LPKX7nE7FDSAvp0QnueNQUsQ6QrXgrpfofsLBnu0QO9NRhgiPIPVgkKl+BhhWi0+rMZFmqKS5SdEI7hJNF/M0vI9uHMDMpFuWXYtuAd02b34rCPTImJG5PvWRGZCQOjiFwWgLrhmJv13pvreB2ydB3WlQ+NBtY7I9DaFZ1nw4irzyGBy6pEvgrZ3ErC/4ocpDbtExWvT/A6uhp9oy7h3sW80jiMWWady98xXkB8A2L5pZ4eg7WAOz8Oz67hPMAu6Sk2OtGj4IqYOSCS/nXdivl8YIX66Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVq79cS0d6V/NkPMYLcAbkSJpde0OPYFucZGLHE3tFc=;
 b=O5+vCNCTkORBshDOxPv3aJS67JGlkmdXaXbUGuOy5jAM91cZY7AyYYXGEUdls2RVFDWEYg96FhfZ/7jHWUle6pdFqIfeJdcS+WUScdsyasKnz0EvYO6kttD+XIF/y/vKHTNXrzJ42sJFcKobciP9AgR/gnn+XhCp297dsiBVNe9PwyKf+xcbG2GwmS46F7KCbh7jjS7NllF7Md9K6hqLHuWUC4+BLsFrD/2d/41NlyH43H9brNJZran4QGb/gfcI6IMx4Intdu9yDLG3ml1OCgFqylgKT9H8kL0UbBE8Cqs/ewlK5W+8b3L8nfPaYM+gSxsrTsb67bdo7ODlDDPCMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVq79cS0d6V/NkPMYLcAbkSJpde0OPYFucZGLHE3tFc=;
 b=4yf0XY8qlpJzSsKPFUCxkbf9vHUJT4LXu9AL5Xo8IFYumzf16ZNSPJyfZIBCUNHLaIV2UnGl95Ny8+OcnKWk655vHlsPbOOWOy0we8okdpMDChYZ1kCwMqd3b34ras1wOifZRQbJSOsJ8LMQjje96u1MyUGNgDNjHEvt9Hk0Zug=
Received: from DM3PR11CA0014.namprd11.prod.outlook.com (2603:10b6:0:54::24) by
 MW2PR12MB2507.namprd12.prod.outlook.com (2603:10b6:907:c::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22; Thu, 10 Mar 2022 17:26:46 +0000
Received: from DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:54:cafe::e6) by DM3PR11CA0014.outlook.office365.com
 (2603:10b6:0:54::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.27 via Frontend
 Transport; Thu, 10 Mar 2022 17:26:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT010.mail.protection.outlook.com (10.13.172.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Thu, 10 Mar 2022 17:26:45 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 10 Mar
 2022 11:26:44 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v1 1/3] mm: split vm_normal_pages for LRU and non-LRU handling
Date: Thu, 10 Mar 2022 11:26:31 -0600
Message-ID: <20220310172633.9151-2-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220310172633.9151-1-alex.sierra@amd.com>
References: <20220310172633.9151-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9949dd69-f48a-4bbc-c73e-08da02bb26a8
X-MS-TrafficTypeDiagnostic: MW2PR12MB2507:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB2507BEDF37A0C80A45E32186FD0B9@MW2PR12MB2507.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CmaBAsRYPgZ7xi3MGYAKlDbisaaV2m8oZioMUL3DK+AoRwe0UV/yP+4bQzkGZ2XoB/iG7oAUPeCRt/+cB/nh4vMWB2qZc/0J8aNocUYUSpQAeEZ+E+P1vtaSnf8q3Fhi6Jk6nuHtOx4+1wbcYQtMUeeI9ImzHPSl5Us/wXUcOeFmLaZ5/7FpF8Z3OafICAfhLW6nSCP+V8ibMCnwCMNgEx0eSAEAXcAtDop6qV8E2z6qtd8DBW8RDUCm6B5KVhqSyIbCjijXiHNqjv3bRi5AssZy3gNP6GtGIJ7LCVN5aR8jWKet/kHZpo0ZL7+K2DhupS5GCMygOe6yC7ksSnRuHim+WI+xdWJx8nBfq7DlIEIszGxhBdfKmDFD2Y3u7ffQ87RwlKbd1mQJ3Aei4qS6k+PPJ+AnTjxt9X2jKBG0Lc8umfGNyPemUdzZiWsx9sGf4ExWloot/E9Imr3+bIS6voWcU0e6ZqlAjVQbqrTWIITaxUA+NVXUt1ooLwN2OUX+PWEfqCNT9p8/pAE5NVUyqWsQv39LfpO/XE+H5SHv8ZHZYRp0A2zX5b2yc1ZOybzsjpwE4kY4fzZPGvf4y0eFxrY9f+mwXYryLMQMVIgog+iZdOyXQmZsnSP08YgwxMWaKH/1MCyBG/6gv1RP0bEjTg2AWosKuxFpDI4lNcaUYHPuyC0geJtKMmRdzMzZFesK1DznmOkePQgDxA1v0KBHcQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(47076005)(16526019)(186003)(7416002)(2616005)(36860700001)(70586007)(36756003)(26005)(426003)(8936002)(4326008)(6916009)(86362001)(8676002)(70206006)(30864003)(316002)(336012)(5660300002)(54906003)(40460700003)(82310400004)(83380400001)(1076003)(508600001)(7696005)(2906002)(6666004)(356005)(44832011)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 17:26:45.5675 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9949dd69-f48a-4bbc-c73e-08da02bb26a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2507
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
NUMA migration, KSM and THP.

We also introduced a FOLL_LRU flag that adds the same behaviour to
follow_page and related APIs, to allow callers to specify that they
expect to put pages on an LRU list.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 fs/proc/task_mmu.c  | 12 ++++++------
 include/linux/mm.h  | 11 +++++++----
 mm/gup.c            | 10 ++++++----
 mm/hmm.c            |  2 +-
 mm/huge_memory.c    |  2 +-
 mm/khugepaged.c     |  8 ++++----
 mm/ksm.c            |  4 ++--
 mm/madvise.c        |  4 ++--
 mm/memcontrol.c     |  2 +-
 mm/memory.c         | 38 ++++++++++++++++++++++++++------------
 mm/mempolicy.c      |  4 ++--
 mm/migrate.c        |  2 +-
 mm/migrate_device.c |  2 +-
 mm/mlock.c          |  6 +++---
 mm/mprotect.c       |  2 +-
 15 files changed, 64 insertions(+), 45 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index f46060eb91b5..cada3e702693 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -528,7 +528,7 @@ static void smaps_pte_entry(pte_t *pte, unsigned long addr,
 	bool migration = false;
 
 	if (pte_present(*pte)) {
-		page = vm_normal_page(vma, addr, *pte);
+		page = vm_normal_any_page(vma, addr, *pte);
 	} else if (is_swap_pte(*pte)) {
 		swp_entry_t swpent = pte_to_swp_entry(*pte);
 
@@ -723,7 +723,7 @@ static int smaps_hugetlb_range(pte_t *pte, unsigned long hmask,
 	struct page *page = NULL;
 
 	if (pte_present(*pte)) {
-		page = vm_normal_page(vma, addr, *pte);
+		page = vm_normal_any_page(vma, addr, *pte);
 	} else if (is_swap_pte(*pte)) {
 		swp_entry_t swpent = pte_to_swp_entry(*pte);
 
@@ -1077,7 +1077,7 @@ static inline bool pte_is_pinned(struct vm_area_struct *vma, unsigned long addr,
 		return false;
 	if (likely(!test_bit(MMF_HAS_PINNED, &vma->vm_mm->flags)))
 		return false;
-	page = vm_normal_page(vma, addr, pte);
+	page = vm_normal_any_page(vma, addr, pte);
 	if (!page)
 		return false;
 	return page_maybe_dma_pinned(page);
@@ -1190,7 +1190,7 @@ static int clear_refs_pte_range(pmd_t *pmd, unsigned long addr,
 		if (!pte_present(ptent))
 			continue;
 
-		page = vm_normal_page(vma, addr, ptent);
+		page = vm_normal_any_page(vma, addr, ptent);
 		if (!page)
 			continue;
 
@@ -1402,7 +1402,7 @@ static pagemap_entry_t pte_to_pagemap_entry(struct pagemapread *pm,
 		if (pm->show_pfn)
 			frame = pte_pfn(pte);
 		flags |= PM_PRESENT;
-		page = vm_normal_page(vma, addr, pte);
+		page = vm_normal_any_page(vma, addr, pte);
 		if (pte_soft_dirty(pte))
 			flags |= PM_SOFT_DIRTY;
 		if (pte_uffd_wp(pte))
@@ -1784,7 +1784,7 @@ static struct page *can_gather_numa_stats(pte_t pte, struct vm_area_struct *vma,
 	if (!pte_present(pte))
 		return NULL;
 
-	page = vm_normal_page(vma, addr, pte);
+	page = vm_normal_lru_page(vma, addr, pte);
 	if (!page)
 		return NULL;
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index d507c32724c0..46b0bb43cef3 100644
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
index 41349b685eaf..0ed597143d80 100644
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
+ * by a page descriptor (see also vm_normal_*_page()).
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
 
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index d9cd8f2afa3c..1d791760608b 100644
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
index c125c4969913..1422b1f71f0e 100644
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
+	if (page && is_zone_device_page(page))
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

