Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9026355BC94
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 02:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D553D10E581;
	Tue, 28 Jun 2022 00:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0439D10E01F;
 Tue, 28 Jun 2022 00:15:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qpi6tTJNDwOv4KHTiRYMKcXYoUVewT+sguQ0tUyqvWJnohUtTSofBwzqdZWVTqb6XPY754XTAPjyvm8toOWFcdldasgYlh8OfiADlO9aZtcO5PBWNMujpxiVFf+z9kSGBtKavLOcx31gz6klkR+UIbi5IHeNj53u+d2vzF6eq+e3Cuuzh2XM4fkH3iZm+aNrOEkYgvyk+/fqjSoj4LJZcpOwQzcei9yisXaPzNndqCBAsHg101VlqMkGazBekEitEQmjPoVLn9xP7WJy2TU9imCYJ/got1eFkSGEkOIESn37ZF/IpzhHcrJURqidReFfu+ps1jbMZalEZHzTx6Xw+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYDXGg3K1in8s7W57rXMiHvUn8+n+gxnVSApI1oD/Fc=;
 b=hQbUUgpqlH+kY1iHS4joUag1WEMKj0BU8sdLbWESjB+OrpAmCxtDuQFgu1r5vvtj5GKd6v4DNLqtpf9gly24r6rD1fiMM1GU1hvcU6O+50ACsPcRNHrjJAMT44Eb/vr54ZRuKoQd4qkQA/HOm9CemCXgyBzif7m9pKRQfSNG+I+aA/MiSzdQc1m8ryTTxeCmNslOzkDSoRfwScLlWfHirkDzCwjs0Tc12OsfQ2HjNnXxwbnaVO+2pkMJC3mt+yZyn1yCzPBfaVH7F0edQK9VGTyiFhHcPJXKiP8kExcVp/f2eS43nqHMo46Xwzh/YWgw6eBkXP/OflhZ6gfS+bSWWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYDXGg3K1in8s7W57rXMiHvUn8+n+gxnVSApI1oD/Fc=;
 b=intcZ95BydNfStKFxe4cYnnEvk8IqznBg+IJKJVUao0bWHeV+c1Aj55aDHt8XKHQU4OeIqpsG9ii7hRBe8xX0CG+XDKrjuB48CaOEoAMNcczbPjGaKa2L6M8oH3TFkdBEG8CShwDSh7e9MtYZ9CBS5dXeHr5jfvw0c3a+cpDbQI=
Received: from MWHPR15CA0054.namprd15.prod.outlook.com (2603:10b6:301:4c::16)
 by SJ1PR12MB6337.namprd12.prod.outlook.com (2603:10b6:a03:456::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Tue, 28 Jun
 2022 00:15:22 +0000
Received: from CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4c:cafe::b7) by MWHPR15CA0054.outlook.office365.com
 (2603:10b6:301:4c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.21 via Frontend
 Transport; Tue, 28 Jun 2022 00:15:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT009.mail.protection.outlook.com (10.13.175.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 00:15:22 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 27 Jun
 2022 19:15:20 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v6 02/14] mm: handling Non-LRU pages returned by
 vm_normal_pages
Date: Mon, 27 Jun 2022 19:14:42 -0500
Message-ID: <20220628001454.3503-3-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220628001454.3503-1-alex.sierra@amd.com>
References: <20220628001454.3503-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afa43afa-82c1-46a4-7eb9-08da589b4ac8
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6337:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XHSLxf7diBsKIawg1nJzWyT8/FptRt2DtCVYvjvQR0uvyCnBFVu9A/FQl2kS7QAs1UEAkWDAXnOrQzc7nvAcVj+iuCbbqHoCU2B7rJ5bQQzNshx13LZGoLI4gKIT+S2Lgz+6n/hPbLeFKtYCqOLE9B6yv0BoXEn7Fq9K1eciKBLpylMF2kG+MSi6b6iAtr+3ek/pA8VqNAmJh2N2jz1FONnRwjPba1m9tdVyR2NeIPrSLm0QHziva0yCjneLSrZNgcsuPPzrWZmtaZynX++4cVqzNsq8H6k51CCNZT9DQSJgDSloOtXVAQ4P/IiGOhh3LAK0Xm5aZV3yjd3JgxmFZJjoKtHVFBWTAwD2fv5kvDI/Zrr+g7htQlBffG3Y2rnSRAl/DvaxZCUK2DQL0CE1gWVnmhYFe55dds20RGGIbHT/y3lr2DLmjYAlYbLWh5fDBCWdJd7F8EmaM226W89MFMrBZHqbofsm7xAFVFhvLoUjWdkvveHa+cXw8MOB7OoPFUHg5FWM7/bnQgmm1I3tlh2Ir/LmTaShmPfomkEk5c4ZYhlLXmxv9ilepjtKZaOmTo6Dyb5i7K97iMCULscq6QiQL4DkCcZQ65Ftiks+aOSCRV+2UNc+ybJswJDeaPmte1i7CNfWlwnRkhHQTFr9sxOYfMNlHr+zemR1hJD4CD3+Xs3l2qxPOls2k9Phcm84/rLfksIQMeTPr1ohd/w+lOahQNYc6Rv5hQOHvOF4SCk/F9wTbPAFgq+ZeQuMkMyniaCBeJDJdozRr6ORd/+yI6ykz3GFtqee/uSUzyL1FKNj5arFTXUVqJ0WkIn952F8QLi7sEecxDJJRk28sUK8Qw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(136003)(346002)(376002)(40470700004)(46966006)(36840700001)(7416002)(36756003)(316002)(70206006)(186003)(44832011)(478600001)(4326008)(356005)(2906002)(6916009)(81166007)(16526019)(8936002)(54906003)(5660300002)(1076003)(70586007)(82310400005)(8676002)(40460700003)(41300700001)(6666004)(7696005)(86362001)(40480700001)(36860700001)(2616005)(82740400003)(336012)(426003)(47076005)(26005)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 00:15:22.2300 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afa43afa-82c1-46a4-7eb9-08da589b4ac8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6337
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
Reviewed-by: Alistair Popple <apopple@nvidia.com>
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
index cf3d0d673f6b..f6f5d48c1934 100644
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
index 834f288b3769..d242184ab169 100644
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
index 0316bbc6441b..e252635fe935 100644
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
index 7a089145cad4..e18555af9024 100644
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
@@ -4693,7 +4700,7 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
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
index 6c1ea61f39d8..0b7f74a6c88e 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -1613,7 +1613,7 @@ static int add_page_for_migration(struct mm_struct *mm, unsigned long addr,
 		goto out;
 
 	/* FOLL_DUMP to ignore special (like zero) pages */
-	page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP);
+	page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP | FOLL_LRU);
 
 	err = PTR_ERR(page);
 	if (IS_ERR(page))
@@ -1804,7 +1804,7 @@ static void do_pages_stat_array(struct mm_struct *mm, unsigned long nr_pages,
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

