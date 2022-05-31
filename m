Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EA053977F
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 22:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF7410E42D;
	Tue, 31 May 2022 20:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E51CB10E42D;
 Tue, 31 May 2022 20:00:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uk75A+Xu726xzvfMcrJ5WUy6cQ+Xonff2wkWTLqMKZuQv55dwChAUOcNKojFzAXREIBPfZBuJVPjAdSobGHNe8APemLAWw1ALAE0zzUxQJnwXrQTnPZOnL+28hyTpDEViynxjEXety/kDiYHx5t8L4uL0QWApiZopujoX51zAYQ28PQx/oQJHcv1MbPh1+ZFp31IifqmGjgvpGS1oMQPlMSotMPpBZxkb2oHP5BBgh1f8xVydWwju02xSuJICgkUbyV1sz2XCZp6AINqceSH7A2Y7fUlRTDx8psvO5d/yWBgS1hHEGwTMHpw1Fa4hMNBNvrx3kDQEmdxrVo7r2VB1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UB1A6mVp2FjGDcQ5stu74yF2RVvpM6RjTh5m5iBLXAk=;
 b=TGaqP3uWiElpcIhqWStW6KnzwO/v9eKGXrSZX444fjuqssc6fL0M0lieeItuqFL6cEzS3+fBozvKz0y5TFfNL2xkWrnkbp6c+srft1gyFOdMUVaCBS0pLuX/diK3MmCVAfMfbo5XOHvKMrC5WTfG+lp1WOhwUo81LvL3cKhOAgJAV/+U8SjPKUnSDQL3lrSBITI83jjw/LOzdORb49vceDTqHBJueKALdofCsJr0QRkZIFFHIUttwop7Uqc+7ImIEAuX8r7D+hVX+L6qugtXVsyqU7u0waisjdYJBfZCEhDQlmXmxR6wHaXgjsqQAJE3SC9+hZUo9v8sapkwAQBiWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UB1A6mVp2FjGDcQ5stu74yF2RVvpM6RjTh5m5iBLXAk=;
 b=YzjXVY6E6d0Wu1Eh+mvjuokt7bExxBOMoBhBwZgu1347FH5xtOuCFnV8MVZQHeeMgvzLlKM/lKuPd8nXlM3zZ2oRGBBDwFDZeysiQKDoYbMKoHN9KlJR7uoOjQ7VjgbtmZ8K07htgfoJlxiDKTlY9ZbaciyQxB83ki8eVCiiidE=
Received: from BN9PR03CA0413.namprd03.prod.outlook.com (2603:10b6:408:111::28)
 by MWHPR12MB1597.namprd12.prod.outlook.com (2603:10b6:301:e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 20:00:56 +0000
Received: from BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::ba) by BN9PR03CA0413.outlook.office365.com
 (2603:10b6:408:111::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 31 May 2022 20:00:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT027.mail.protection.outlook.com (10.13.177.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 20:00:56 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 31 May
 2022 15:00:55 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v5 02/13] mm: handling Non-LRU pages returned by
 vm_normal_pages
Date: Tue, 31 May 2022 15:00:30 -0500
Message-ID: <20220531200041.24904-3-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220531200041.24904-1-alex.sierra@amd.com>
References: <20220531200041.24904-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e1a1b61-3d26-49f5-878c-08da43404686
X-MS-TrafficTypeDiagnostic: MWHPR12MB1597:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1597226208E70238D4FC0141FDDC9@MWHPR12MB1597.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Im+L2FSV2zixXJ30+pgvFZcUDxMkDqrbAF472QIzq9qWeTws6mxOYsnR9L2m020tf8gTe91ZrZ0XDDxZQAkPzZDgn9y8hmodkvUDtM7g0VBLtX9JuFPaxOqvyeQ8TSGPjsdpxlLMdqGLG8UD9K7pgPV3Anz++7VEKg1p0qa9pkzcHc7KK0QaYUiy3xC0kD9DtejS5tmZX736M2e0uHdKSYiU9LpNwpoLwE5l13q/xkwhU5uWSorYE7+UoGJ1uIZ+dtKaXZzgiZwo0B732v4XOlIveSPcnw+d4BYZauE15hIRnk7/r0xnGxtL1aI/G0VHF84QIIDMFi/0BoyGVNBcMybGZib/5vG+O4SNAdz8pxICigYaHkdaPY7Bq3tXGRmFU65thfTpQz1z1hb/VRGW+GSk4om6jpmqiYHN00Pk7h7JnqM5mJlH9Sxu8+QWSRH4TbMZs0d6pr/0nM+VbHeeEWN7sEk4PD1ie5TIdPijuNzUmvl1pWt2aQuIfT+e9nKO7VzT5On+2qDJ7lpQvr8Vuz7r+1iXbBMW83mX0dcFkj9zB51VCYFmKlltxsMIrKtup7owNGsBbb14oGxW9PCquLrtZ3gAY8012ngtU2Hq/Es0kls0q9OtwjXNmOKNtuCqAv7fEY3XSmf27ys+CZI2M7H62MsuAL46KZaS+xpdxenkl7zj17RMXxPoLTbTIzCi0YAM28GVW6hFmeQZWhYuug==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(86362001)(6666004)(16526019)(186003)(40460700003)(356005)(336012)(81166007)(70206006)(7416002)(5660300002)(7696005)(4326008)(70586007)(1076003)(426003)(36756003)(83380400001)(8936002)(6916009)(316002)(44832011)(82310400005)(2616005)(8676002)(2906002)(54906003)(26005)(508600001)(47076005)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 20:00:56.5754 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1a1b61-3d26-49f5-878c-08da43404686
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1597
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

