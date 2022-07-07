Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F8356AB54
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 21:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCDD113422;
	Thu,  7 Jul 2022 19:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D191133F3;
 Thu,  7 Jul 2022 19:04:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jp041srEQyc/xhbVk+vHB3CmVX9EQ5aBJZ8gxnY00i+mRhE8/fEXe0iHr2xktQ+lEZ4g4c58x47+nnYs0t0jLyVu9oXGaSRZW80vX1Oc1LRfp/nuenmWzH5XKxoG0Yr+FYhHJmDoU5il5XLMSahsuAPC47valtILcP3PRhEPj2aslGKcNLEyw1ThkUVJD9i3nfQgrdRemX86VHQDllgYalDyNkdoRMkFxETG575cUVEQ7+qXWe3p1bOje+9EAeY0WX/yfAAjKHIKjur82e1HvqDdGbuilPEh6i8QYk6qCGZgEVlbcVUgojQi1Aa9koO9b+5hcbVueevf8Uz6wtD0Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3nkUMpYvhc4iRzoRiya8+B1v3TTGiLb/Ae1GoXG7iU=;
 b=NYWt4ygukXx6t5+xZBy3g9LHVn+BlG+uQZSxrKKAJ1cxGMqBfySER57knmmbV5zJWB/8gEev3m4XAltCy34xHwwfZ4RjYFIQutK8C1AGgkIl4yX167hnw5ViYYUz9JxAZGNJ1jL8h68Q9RxzoNkftZip/7n4wyDxKl1Cs61DKCjtKDh3cbSJ22vk31T/u0zKmZOuw54f86W1QlFpoyXZH/ti4Fir5r/GPdtUuFiNP9+Agutr8S+OzkA2nuzbefr4jNQKeqePHecQimW3HVsIxpu8zNDpjGrVBexa34DPIj/3K++2t06gllQRLE9nG/oinkyQXjZuxGvDE4Pd2LehXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3nkUMpYvhc4iRzoRiya8+B1v3TTGiLb/Ae1GoXG7iU=;
 b=5L0+iFo/kiegxHfGqZ3Xr57G3RH4l5MXUiKHI52ZuL0TCl/WkuAx8pU8lNzH3P3xZn+aCcW3I6qyy55p7dgzCfNuVUeu8aMmlAvucddB4ioGSEDkVB7+AXdT3hBn54KRZoBtE1c5xTDGzScLZjzsoVvqjf4HDSuj246wJ0zaXJA=
Received: from BN9P222CA0011.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::16)
 by DM6PR12MB3115.namprd12.prod.outlook.com (2603:10b6:5:11c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Thu, 7 Jul
 2022 19:04:09 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::f3) by BN9P222CA0011.outlook.office365.com
 (2603:10b6:408:10c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Thu, 7 Jul 2022 19:04:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 19:04:09 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 7 Jul
 2022 14:04:08 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v8 04/15] mm: handling Non-LRU pages returned by
 vm_normal_pages
Date: Thu, 7 Jul 2022 14:03:38 -0500
Message-ID: <20220707190349.9778-5-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220707190349.9778-1-alex.sierra@amd.com>
References: <20220707190349.9778-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d53bd325-d940-4931-99b1-08da604b792d
X-MS-TrafficTypeDiagnostic: DM6PR12MB3115:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aiy86YJzvgGoU20hUXuaRUjDuP6fwHtDQ6hRfE/9OhmAZtlHhL61fofeMOOJVhUHa1k+attaRBB+PrXYuux//SbV4TwOuCcBW7lNyEjSJUIQmQ54lXqfuO4LSIwpGg0+4CZ4RWrNkH4P6pebsUqsixKnG6d+xJwcpTnQuQyS7VJ2NjHzv98XQz6OCApCqwxkNHIWLGJ5h0b4+OEE2NZY6ETn97HmxB9PDSMGl3sp1tat6deCzpXqgB2+NXPfHKrpeAFNIvvfKLFXZH1dstmpdSZ2gDx5DpZhc+zAmjzsxSacQC+crXbHZYLmRfx+WEVs8vCzZ5uhdaunZmJCwpBhxYbCFl7jgYh2MtI56XUaVV+BmqOnZzDlFU0M5T4WxA72ZYGucbJcs85XsUfoYTXluGEIzlJcXfuVDcBHekMdvrS3/sAhydiiAZkLtE+Bfqmi/qJVa1BwCrhi9Pkuy6/TwO0llvwT8BObsQd6donGVnKKR6iNJf7FDuIPfZvZ8+48JQfOjI+aSUYTI3MP6L3+kIri1qPYdhpriLnWvYkGV6TjT890UTNQ/35H83B/gGz5DZJvC6piKSgODciZ45VJdUQAoo4jEZV/fSx4Nizk8GQol3NTUz3hpTrLnzkYOjnfLnNZmhLWw+AcxeHvG3GGAIWTQ9qsCqCFwAEK7UGpfLFHuBS+UIZHUe/rTD96iIXOlcQcC3ToVNhFlq+kglVsK5gIDHyW9DkbfxYe2lPpwgFpbUN1zMvJP5qfw67iNOQ8St2gJlTZvlbzy38Dn0WYZ56KKTjFEANtf3W1x6tgFWec1/+XB1rCCFNMV7pvb7kFW3bT5XKv5RzzDMGfw98iW38h5+C5v1c+unc+PKPFeXavapA5BLG8vBeFXQQ8vkiw
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(136003)(39860400002)(346002)(46966006)(36840700001)(40470700004)(478600001)(7696005)(7416002)(36860700001)(70586007)(40480700001)(81166007)(34020700004)(8936002)(41300700001)(70206006)(6666004)(8676002)(4326008)(5660300002)(356005)(2906002)(82740400003)(47076005)(54906003)(16526019)(186003)(26005)(336012)(40460700003)(6916009)(426003)(2616005)(86362001)(44832011)(36756003)(83380400001)(316002)(1076003)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 19:04:09.7566 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d53bd325-d940-4931-99b1-08da604b792d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3115
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

Callers to follow_page() currently don't expect ZONE_DEVICE pages,
however, with DEVICE_COHERENT we might now return ZONE_DEVICE. Check
for ZONE_DEVICE pages in applicable users of follow_page() as well.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com> (v2)
Reviewed-by: Alistair Popple <apopple@nvidia.com> (v6)
---
 fs/proc/task_mmu.c |  2 +-
 mm/huge_memory.c   |  2 +-
 mm/khugepaged.c    |  9 ++++++---
 mm/ksm.c           |  6 +++---
 mm/madvise.c       |  4 ++--
 mm/memory.c        | 10 +++++++++-
 mm/mempolicy.c     |  2 +-
 mm/migrate.c       |  4 ++--
 mm/mlock.c         |  2 +-
 mm/mprotect.c      |  2 +-
 10 files changed, 27 insertions(+), 16 deletions(-)

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
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 834f288b3769..c47e95b02244 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2910,7 +2910,7 @@ static int split_huge_pages_pid(int pid, unsigned long vaddr_start,
 
 		if (IS_ERR(page))
 			continue;
-		if (!page)
+		if (!page || is_zone_device_page(page))
 			continue;
 
 		if (!is_transparent_hugepage(page))
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
index 54f78c9eecae..831b18a7a50b 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -475,7 +475,7 @@ static int break_ksm(struct vm_area_struct *vma, unsigned long addr)
 		cond_resched();
 		page = follow_page(vma, addr,
 				FOLL_GET | FOLL_MIGRATION | FOLL_REMOTE);
-		if (IS_ERR_OR_NULL(page))
+		if (IS_ERR_OR_NULL(page) || is_zone_device_page(page))
 			break;
 		if (PageKsm(page))
 			ret = handle_mm_fault(vma, addr,
@@ -560,7 +560,7 @@ static struct page *get_mergeable_page(struct rmap_item *rmap_item)
 		goto out;
 
 	page = follow_page(vma, addr, FOLL_GET);
-	if (IS_ERR_OR_NULL(page))
+	if (IS_ERR_OR_NULL(page) || is_zone_device_page(page))
 		goto out;
 	if (PageAnon(page)) {
 		flush_anon_page(vma, page, addr);
@@ -2308,7 +2308,7 @@ static struct rmap_item *scan_get_next_rmap_item(struct page **page)
 			if (ksm_test_exit(mm))
 				break;
 			*page = follow_page(vma, ksm_scan.address, FOLL_GET);
-			if (IS_ERR_OR_NULL(*page)) {
+			if (IS_ERR_OR_NULL(*page) || is_zone_device_page(*page)) {
 				ksm_scan.address += PAGE_SIZE;
 				cond_resched();
 				continue;
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
index 7a089145cad4..4affde09cdd1 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -624,6 +624,14 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
 		if (is_zero_pfn(pfn))
 			return NULL;
 		if (pte_devmap(pte))
+		/*
+		 * NOTE: New users of ZONE_DEVICE will not set pte_devmap()
+		 * and will have refcounts incremented on their struct pages
+		 * when they are inserted into PTEs, thus they are safe to
+		 * return here. Legacy ZONE_DEVICE pages that set pte_devmap()
+		 * do not have refcounts. Example of legacy ZONE_DEVICE is
+		 * MEMORY_DEVICE_FS_DAX type in pmem or virtio_fs drivers.
+		 */
 			return NULL;
 
 		print_bad_pte(vma, addr, pte, NULL);
@@ -4693,7 +4701,7 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
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
index 6c1ea61f39d8..a98a219d12ab 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -1620,7 +1620,7 @@ static int add_page_for_migration(struct mm_struct *mm, unsigned long addr,
 		goto out;
 
 	err = -ENOENT;
-	if (!page)
+	if (!page || is_zone_device_page(page))
 		goto out;
 
 	err = 0;
@@ -1810,7 +1810,7 @@ static void do_pages_stat_array(struct mm_struct *mm, unsigned long nr_pages,
 		if (IS_ERR(page))
 			goto set_status;
 
-		if (page) {
+		if (page && !is_zone_device_page(page)) {
 			err = page_to_nid(page);
 			put_page(page);
 		} else {
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

