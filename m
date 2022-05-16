Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCCB5294F5
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 01:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BFB10E66F;
	Mon, 16 May 2022 23:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2054.outbound.protection.outlook.com [40.107.102.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1208310E8CE;
 Mon, 16 May 2022 23:15:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXO306FxIXg1LVDoYXSICOfjaIsHYZLHRt5YJQ30t6pvkO/xpNgwwIXEDLzwNHAz2BxgMysdoSgnZcwnnv9LwOE6DJBQCxefPDMmX2yJtgBdRFLG/wTK16lV41egkThzbsNOXbS3C0tNpXAbSuWWS9G5NkRYGNKpiV8zcq0TPAkrTfCWG5Q3xVpd9cLV75g8yeBZKbrvhB195rbkzCX25jIR4/ohYbmoN9DnwN5wwmiWVI1aX10PiuI8/OqghvG5FbYMt/B0mOT3Lkl6F+Q46MQK4n9zsIZ+H695ypMAKN1cHkeXfn0HXsr4UwpHwrXmyNaoNhIhYuLv7w2DnJkLGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YYePLtbTgIOF8ew+l9yPAyCRqb6w1OAoVj7JzT49p4=;
 b=keNZML1hFDaUWNnX7Xsi/uxFf4RS9EVS3OjlgxjaanK4/sVH2zMlRPzF4qoQ4w1ci4VDjmx0Zu5d58qlMCIKEn0KtYrrF/phbhm0tkhaNLxmW9MmHEAICnNcpHxYjTzzDMB1fCZgcxX3DgK4jUHqJIDE5Kw0MiZnqRnA2JYLZjeWNiu0YXuacbkaGqbmrYnb33iLl4/ewUgJwJwveHVipCCuk9th1mGFzOEuaOZ7w2zZGnRCjqszoYmnSsrzDo77ISuudAwi951RCWpy8imQTSmqwh1Kc0LNzY2o4jeCfC94/h2RxVXN3qC//BUIdKzk8dxSILVyfKcRgeHr1F3TeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+YYePLtbTgIOF8ew+l9yPAyCRqb6w1OAoVj7JzT49p4=;
 b=DSXbAQHh9RxEjCgsIf5ex4EgghAvSt7eG8Cq3JCQNbg0h9xwhIR5mFVksESh4wp4qypEP/sDzC1POmO6lm6INbHzo9WmYsarzp6P+l69LpIGuNjrDrXM/vA45aFO/5xMAy4j6v3scH+2VLdTtjkeIZ/YrP3D1C2GwGlBgnrLJtA=
Received: from BN9PR03CA0695.namprd03.prod.outlook.com (2603:10b6:408:ef::10)
 by BN8PR12MB2866.namprd12.prod.outlook.com (2603:10b6:408:68::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Mon, 16 May
 2022 23:15:05 +0000
Received: from BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::6) by BN9PR03CA0695.outlook.office365.com
 (2603:10b6:408:ef::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14 via Frontend
 Transport; Mon, 16 May 2022 23:15:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT041.mail.protection.outlook.com (10.13.177.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Mon, 16 May 2022 23:15:05 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 16 May
 2022 18:15:04 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v2 11/13] mm: handling Non-LRU pages returned by
 vm_normal_pages
Date: Mon, 16 May 2022 18:14:30 -0500
Message-ID: <20220516231432.20200-12-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220516231432.20200-1-alex.sierra@amd.com>
References: <20220516231432.20200-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 370e0492-adfa-4eed-422a-08da3791e9ca
X-MS-TrafficTypeDiagnostic: BN8PR12MB2866:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB286614CAFC27B997296D3476FDCF9@BN8PR12MB2866.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kWFTRVyra4vXZFsVwArUywf3jzGIPWZMRnxhFYrMtqQPRri/EDkUIRrEVLus0g9imLXR8qhtUmSFUcUF/XLZD2597T1BKiDlgJwXYrB3fMhOGJXRm7nYhCdYBr2R9aZeBZ0SdoloBu5GQsBlg6iAUnDHycLeMsgpPiygagTTXMFI7w7G76jl/cNwnwoV3BlLxVXjr1o4ZZAgu65LSBTbKqhnYL2wFoQ3F5pfygfQ6eRBa8pSwJSO1hyM7Sqom1LQsd7J5N6j/XZq5B/7IxYfKwdCaK8ByULhFB4ItdgTSX8LYjDzfYEt7bCPmHlbRmRv0WBgkwc2OGhl+Dro8q3SR3wm+D/nU1+ic2DcTE+o9UknQNc1T78qWY2bTG41vNICTEtLDTiChhYZnef4E2Hk2B8eZSIEYYmP2N4aNQUnfCR3zp33wYp7lxHjLeO8DTRjjhFtSA9PgrvJpIj6rftSHdNLNeu8bItgG3pQQT649JZyKNC6/DJV0BTrUl+fEXC6doPqPVW340EqzXeFV9xBCqGL0v4BKvuTliS3dJOJJXMcU7Mk/wTQADhqomnkJ9XD99RFhoQothRod0U87dmOfC4UdsBdxA6fakb0V1ch0q2MatynUKWvPHm3/mz2dOdEsHrNwBr3Uy7+KVirryjl8sWlieyQ5Cw94lG5m4kbykzRY4dGi06v/wKzNpWzY4wIaT2UMdbw028WNEXk3JM9hw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(40460700003)(316002)(83380400001)(186003)(336012)(5660300002)(426003)(8676002)(6916009)(7416002)(86362001)(70206006)(47076005)(4326008)(54906003)(356005)(81166007)(7696005)(1076003)(6666004)(36756003)(16526019)(44832011)(8936002)(508600001)(2616005)(82310400005)(70586007)(2906002)(26005)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 23:15:05.7853 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 370e0492-adfa-4eed-422a-08da3791e9ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2866
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
 mm/gup.c           | 2 ++
 mm/huge_memory.c   | 2 +-
 mm/khugepaged.c    | 9 ++++++---
 mm/ksm.c           | 6 +++---
 mm/madvise.c       | 4 ++--
 mm/memory.c        | 9 ++++++++-
 mm/mempolicy.c     | 2 +-
 mm/migrate.c       | 4 ++--
 mm/mlock.c         | 2 +-
 mm/mprotect.c      | 2 +-
 12 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index f46060eb91b5..5d620733f173 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1785,7 +1785,7 @@ static struct page *can_gather_numa_stats(pte_t pte, struct vm_area_struct *vma,
 		return NULL;
 
 	page = vm_normal_page(vma, addr, pte);
-	if (!page)
+	if (!page || is_zone_device_page(page))
 		return NULL;
 
 	if (PageReserved(page))
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 9f44254af8ce..d7f253a0c41e 100644
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
@@ -2929,6 +2929,7 @@ struct page *follow_page(struct vm_area_struct *vma, unsigned long address,
 #define FOLL_NUMA	0x200	/* force NUMA hinting page fault */
 #define FOLL_MIGRATION	0x400	/* wait for page to replace migration entry */
 #define FOLL_TRIED	0x800	/* a retry, previous pass started an IO */
+#define FOLL_LRU        0x1000  /* return only LRU (anon or page cache) */
 #define FOLL_REMOTE	0x2000	/* we are working on non-current tsk/mm */
 #define FOLL_COW	0x4000	/* internal GUP flag */
 #define FOLL_ANON	0x8000	/* don't do file mappings */
diff --git a/mm/gup.c b/mm/gup.c
index a214c8df7140..13bf04bce132 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -479,6 +479,8 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
 	}
 
 	page = vm_normal_page(vma, address, pte);
+	if ((flags & FOLL_LRU) && page && is_zone_device_page(page))
+		page = NULL;
 	if (!page && pte_devmap(pte) && (flags & (FOLL_GET | FOLL_PIN))) {
 		/*
 		 * Only return device mapping pages in the FOLL_GET or FOLL_PIN
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 910a138e9859..eed80696c5fd 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2856,7 +2856,7 @@ static int split_huge_pages_pid(int pid, unsigned long vaddr_start,
 		}
 
 		/* FOLL_DUMP to ignore special (like zero) pages */
-		page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP);
+		page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP | FOLL_LRU);
 
 		if (IS_ERR(page))
 			continue;
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index a4e5eaf3eb01..eb3cfd679800 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -627,7 +627,7 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
 			goto out;
 		}
 		page = vm_normal_page(vma, address, pteval);
-		if (unlikely(!page)) {
+		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
 			result = SCAN_PAGE_NULL;
 			goto out;
 		}
@@ -1276,7 +1276,7 @@ static int khugepaged_scan_pmd(struct mm_struct *mm,
 			writable = true;
 
 		page = vm_normal_page(vma, _address, pteval);
-		if (unlikely(!page)) {
+		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
 			result = SCAN_PAGE_NULL;
 			goto out_unmap;
 		}
@@ -1484,7 +1484,8 @@ void collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr)
 			goto abort;
 
 		page = vm_normal_page(vma, addr, *pte);
-
+		if (page && is_zone_device_page(page))
+			page = NULL;
 		/*
 		 * Note that uprobe, debugger, or MAP_PRIVATE may change the
 		 * page table, but the new page will not be a subpage of hpage.
@@ -1502,6 +1503,8 @@ void collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr)
 		if (pte_none(*pte))
 			continue;
 		page = vm_normal_page(vma, addr, *pte);
+		if (page && is_zone_device_page(page))
+			goto abort;
 		page_remove_rmap(page, vma, false);
 	}
 
diff --git a/mm/ksm.c b/mm/ksm.c
index 063a48eeb5ee..f16056efca21 100644
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
@@ -2288,7 +2288,7 @@ static struct rmap_item *scan_get_next_rmap_item(struct page **page)
 		while (ksm_scan.address < vma->vm_end) {
 			if (ksm_test_exit(mm))
 				break;
-			*page = follow_page(vma, ksm_scan.address, FOLL_GET);
+			*page = follow_page(vma, ksm_scan.address, FOLL_GET | FOLL_LRU);
 			if (IS_ERR_OR_NULL(*page)) {
 				ksm_scan.address += PAGE_SIZE;
 				cond_resched();
diff --git a/mm/madvise.c b/mm/madvise.c
index 1873616a37d2..e9c24c834e98 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -413,7 +413,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 			continue;
 
 		page = vm_normal_page(vma, addr, ptent);
-		if (!page)
+		if (!page || is_zone_device_page(page))
 			continue;
 
 		/*
@@ -628,7 +628,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
 		}
 
 		page = vm_normal_page(vma, addr, ptent);
-		if (!page)
+		if (!page || is_zone_device_page(page))
 			continue;
 
 		/*
diff --git a/mm/memory.c b/mm/memory.c
index 76e3af9639d9..571a26805ee1 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -621,6 +621,13 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
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
@@ -4422,7 +4429,7 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
 	pte = pte_modify(old_pte, vma->vm_page_prot);
 
 	page = vm_normal_page(vma, vmf->address, pte);
-	if (!page)
+	if (!page || is_zone_device_page(page))
 		goto out_map;
 
 	/* TODO: handle PTE-mapped THP */
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 8c74107a2b15..e32edbecb0cd 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -528,7 +528,7 @@ static int queue_pages_pte_range(pmd_t *pmd, unsigned long addr,
 		if (!pte_present(*pte))
 			continue;
 		page = vm_normal_page(vma, addr, *pte);
-		if (!page)
+		if (!page || is_zone_device_page(page))
 			continue;
 		/*
 		 * vm_normal_page() filters out zero pages, but there might
diff --git a/mm/migrate.c b/mm/migrate.c
index 6c31ee1e1c9b..c5d50e96ecd7 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -1611,7 +1611,7 @@ static int add_page_for_migration(struct mm_struct *mm, unsigned long addr,
 		goto out;
 
 	/* FOLL_DUMP to ignore special (like zero) pages */
-	page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP);
+	page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP | FOLL_LRU);
 
 	err = PTR_ERR(page);
 	if (IS_ERR(page))
@@ -1802,7 +1802,7 @@ static void do_pages_stat_array(struct mm_struct *mm, unsigned long nr_pages,
 			goto set_status;
 
 		/* FOLL_DUMP to ignore special (like zero) pages */
-		page = follow_page(vma, addr, FOLL_DUMP);
+		page = follow_page(vma, addr, FOLL_DUMP | FOLL_LRU);
 
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
index b69ce7a7b2b7..a6f3587ea29a 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -91,7 +91,7 @@ static unsigned long change_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
 					continue;
 
 				page = vm_normal_page(vma, addr, oldpte);
-				if (!page || PageKsm(page))
+				if (!page || is_zone_device_page(page) || PageKsm(page))
 					continue;
 
 				/* Also skip shared copy-on-write pages */
-- 
2.32.0

