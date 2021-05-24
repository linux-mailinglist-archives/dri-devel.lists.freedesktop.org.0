Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D33DE38E782
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 15:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84E3899E9;
	Mon, 24 May 2021 13:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295226E1DE;
 Mon, 24 May 2021 13:28:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdn9+7sI00LXoWbhXA+Mmuipk3Qau+L5Aeox7pJhXmvPQbpIBnv3osXWaektjtEzF2edpUAmTHJgOtyUziJ7o8BF4Esp2zOVxHA4zvqRViwO2QC5CUPx5AXnT2iFXeH8HKKl839I8uwUvSrOP9aywiQua5eZmMwRK9yuoZihKfJ7NOcGXL+ese2fr1rJz09cLfiPpdbtjmj/A9XUKC62E/d1D6l2KPSYDfCMdPkPj/0myLadzivRbV//GMiSJr+dF+ZgKSrzQ6ritFCdtTw0uVQiFdnvZqLd7kOcTNv1OnxBsM6wAkfp8+Ag+vPih79nLD/seOWHfcHe0Iq5r/ytGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyhBgOyxSRgpNjhz1Vip5Z6Z+9zR73AsNDn0JBEaM9A=;
 b=iwIb6VnHIY6z01mraq+RUgWhtgnJaAv3JGBKE+3DydvWSFUC8cjeCH172ey+m6Io052LaH5q6pOT1tX0fMmwbyZWYxLaWmjvToY8AnPsgwBdZq/IRhxqpNugzqBJ7WXgVPv4BjFI2Qt4Z8F0+2PJajrKgueHQrYXzQYt1mOG21lAw4B5VBHchIr9ks7LyGb/19MEcOwWe0GqfCOtxiFgkuWED7/R5m6yOCkSDcGfvYiwBCovUNWh8KlVxNdc5pgRucF3u44u7hEXCD1K9oS0yDCD4ICu5eAAwAeerwH/Eh5dBEA0+Xuh8tJgREATWUwAylEOGhCNLrn1WIjKhQzoAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyhBgOyxSRgpNjhz1Vip5Z6Z+9zR73AsNDn0JBEaM9A=;
 b=upCFVdVsddbgY4meXUTUtEcBROPkvIpOGg9pOvzjKszUTBR1/rc1LQE1jox72PBBHrvmwu8GWibeFBuVpLuD5r/XNkYb9NokC8f3hDPCedz/egUgyTbaL23PqmaApFjUi5xDuWYeiQeWlV0GVk5i9RfZFr2pUcEXk+DCkmO3bBgHsdhrOdTHfK8/v75eih4/JgUOfQsIqaFcfVsLU4JbMieBa+b5he9en1oF2UlDVluQQwObE2R9/4bEN/5l0sktZR6DYy70u15iwN17GS51TRID3L8ujRsDgDlAZN1GzLJnUFUp7wQQW6nO0wM4GQX8AjOT8cJmqUScDuolBzBMOg==
Received: from MWHPR22CA0024.namprd22.prod.outlook.com (2603:10b6:300:ef::34)
 by BN6PR1201MB2528.namprd12.prod.outlook.com (2603:10b6:404:ae::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Mon, 24 May
 2021 13:28:46 +0000
Received: from CO1NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ef:cafe::54) by MWHPR22CA0024.outlook.office365.com
 (2603:10b6:300:ef::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend
 Transport; Mon, 24 May 2021 13:28:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT064.mail.protection.outlook.com (10.13.175.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Mon, 24 May 2021 13:28:46 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 24 May
 2021 13:28:45 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <akpm@linux-foundation.org>
Subject: [PATCH v9 03/10] mm/rmap: Split try_to_munlock from try_to_unmap
Date: Mon, 24 May 2021 23:27:18 +1000
Message-ID: <20210524132725.12697-4-apopple@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2b267fd5-17e5-4851-48f3-08d91eb7db9e
X-MS-TrafficTypeDiagnostic: BN6PR1201MB2528:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB25281BA04B30B7EC28691548DF269@BN6PR1201MB2528.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dz4Za2u4dhgrBymOFxOfGQfSChXERXP0qtnma3GYJNAEEJ3BFANRUDs7wLEVEH7BG/WdRaShkgzoGzAMF7VEIRqubmyGvjgoJ/sJ6cpxpJPWN3dSdNImazOV2Fc933uQrR8Tn769TLcMtrcNBLxBCe5lR7jQNH7xEsPYlpbnwzxruoPfrHR+CD13aj6D5uJhFjvrJqXvXAjnwNbWx7aIX3yuOJ4tSYz3t6RLVStubh5flBTEnCjWZlNwn4Lhuj4uN/DwkETarXQzYzvFWeOf2fkounWTYlCpQd6iWyxtHq6jAwJzcYaKbuGqBs/kvtMbNA3MUZXQ3o3sDX2sUJIcEg6dGvPc1vtKp0eSytK+a97Fxs+KssKiAGUnZQzG2HSPJbQuqVPe8X5VQ1BAg/I8Nh/u4ANNksumRp3Ron72GkcecWI0edIvuYksWIRp9uo8eT2yHjAwTaWzbgNlxirfnUwnpfk5VDGDL0U/GRQ/x3+jhnCytuKYfvAwgbOyHLbH6WCsLhFVUOFdUnjOTSr6Cc7cNw9yq5sKPuYeqraQb7hPiN7X/XtFP50F665V0w0cylLvHqFJQqSTBREAeQPFixTEx4gbHnQxrTyC9QMQ/gGGdTbCKL0r6qHpQHgjOuYBG1lhnkqWWRqTEYC3IArJ0Q6EgNnWqWTUBIkYXmnmDpc=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(346002)(39860400002)(46966006)(36840700001)(336012)(26005)(47076005)(7416002)(70206006)(2616005)(82310400003)(8936002)(426003)(36860700001)(86362001)(70586007)(83380400001)(6666004)(36756003)(54906003)(110136005)(478600001)(5660300002)(356005)(4326008)(16526019)(2906002)(1076003)(82740400003)(7636003)(316002)(30864003)(186003)(36906005)(8676002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 13:28:46.0748 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b267fd5-17e5-4851-48f3-08d91eb7db9e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2528
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

The behaviour of try_to_unmap_one() is difficult to follow because it
performs different operations based on a fairly large set of flags used
in different combinations.

TTU_MUNLOCK is one such flag. However it is exclusively used by
try_to_munlock() which specifies no other flags. Therefore rather than
overload try_to_unmap_one() with unrelated behaviour split this out into
it's own function and remove the flag.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>

---

v9:
* Improved comments

v8:
* Renamed try_to_munlock to page_mlock to better reflect what the
  function actually does.
* Removed the TODO from the documentation that this patch addresses.

v7:
* Added Christoph's Reviewed-by

v4:
* Removed redundant check for VM_LOCKED
---
 Documentation/vm/unevictable-lru.rst | 33 ++++++---------
 include/linux/rmap.h                 |  3 +-
 mm/mlock.c                           | 10 ++---
 mm/rmap.c                            | 61 ++++++++++++++++++++--------
 4 files changed, 63 insertions(+), 44 deletions(-)

diff --git a/Documentation/vm/unevictable-lru.rst b/Documentation/vm/unevictable-lru.rst
index 0e1490524f53..eae3af17f2d9 100644
--- a/Documentation/vm/unevictable-lru.rst
+++ b/Documentation/vm/unevictable-lru.rst
@@ -389,14 +389,14 @@ mlocked, munlock_vma_page() updates that zone statistics for the number of
 mlocked pages.  Note, however, that at this point we haven't checked whether
 the page is mapped by other VM_LOCKED VMAs.
 
-We can't call try_to_munlock(), the function that walks the reverse map to
+We can't call page_mlock(), the function that walks the reverse map to
 check for other VM_LOCKED VMAs, without first isolating the page from the LRU.
-try_to_munlock() is a variant of try_to_unmap() and thus requires that the page
+page_mlock() is a variant of try_to_unmap() and thus requires that the page
 not be on an LRU list [more on these below].  However, the call to
-isolate_lru_page() could fail, in which case we couldn't try_to_munlock().  So,
+isolate_lru_page() could fail, in which case we can't call page_mlock().  So,
 we go ahead and clear PG_mlocked up front, as this might be the only chance we
-have.  If we can successfully isolate the page, we go ahead and
-try_to_munlock(), which will restore the PG_mlocked flag and update the zone
+have.  If we can successfully isolate the page, we go ahead and call
+page_mlock(), which will restore the PG_mlocked flag and update the zone
 page statistics if it finds another VMA holding the page mlocked.  If we fail
 to isolate the page, we'll have left a potentially mlocked page on the LRU.
 This is fine, because we'll catch it later if and if vmscan tries to reclaim
@@ -545,31 +545,24 @@ munlock or munmap system calls, mm teardown (munlock_vma_pages_all), reclaim,
 holepunching, and truncation of file pages and their anonymous COWed pages.
 
 
-try_to_munlock() Reverse Map Scan
+page_mlock() Reverse Map Scan
 ---------------------------------
 
-.. warning::
-   [!] TODO/FIXME: a better name might be page_mlocked() - analogous to the
-   page_referenced() reverse map walker.
-
 When munlock_vma_page() [see section :ref:`munlock()/munlockall() System Call
 Handling <munlock_munlockall_handling>` above] tries to munlock a
 page, it needs to determine whether or not the page is mapped by any
 VM_LOCKED VMA without actually attempting to unmap all PTEs from the
 page.  For this purpose, the unevictable/mlock infrastructure
-introduced a variant of try_to_unmap() called try_to_munlock().
+introduced a variant of try_to_unmap() called page_mlock().
 
-try_to_munlock() calls the same functions as try_to_unmap() for anonymous and
-mapped file and KSM pages with a flag argument specifying unlock versus unmap
-processing.  Again, these functions walk the respective reverse maps looking
-for VM_LOCKED VMAs.  When such a VMA is found, as in the try_to_unmap() case,
-the functions mlock the page via mlock_vma_page() and return SWAP_MLOCK.  This
-undoes the pre-clearing of the page's PG_mlocked done by munlock_vma_page.
+page_mlock() walks the respective reverse maps looking for VM_LOCKED VMAs. When
+such a VMA is found the page is mlocked via mlock_vma_page(). This undoes the
+pre-clearing of the page's PG_mlocked done by munlock_vma_page.
 
-Note that try_to_munlock()'s reverse map walk must visit every VMA in a page's
+Note that page_mlock()'s reverse map walk must visit every VMA in a page's
 reverse map to determine that a page is NOT mapped into any VM_LOCKED VMA.
 However, the scan can terminate when it encounters a VM_LOCKED VMA.
-Although try_to_munlock() might be called a great many times when munlocking a
+Although page_mlock() might be called a great many times when munlocking a
 large region or tearing down a large address space that has been mlocked via
 mlockall(), overall this is a fairly rare event.
 
@@ -602,7 +595,7 @@ inactive lists to the appropriate node's unevictable list.
 shrink_inactive_list() should only see SHM_LOCK'd pages that became SHM_LOCK'd
 after shrink_active_list() had moved them to the inactive list, or pages mapped
 into VM_LOCKED VMAs that munlock_vma_page() couldn't isolate from the LRU to
-recheck via try_to_munlock().  shrink_inactive_list() won't notice the latter,
+recheck via page_mlock().  shrink_inactive_list() won't notice the latter,
 but will pass on to shrink_page_list().
 
 shrink_page_list() again culls obviously unevictable pages that it could
diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index def5c62c93b3..38a746787c2f 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -87,7 +87,6 @@ struct anon_vma_chain {
 
 enum ttu_flags {
 	TTU_MIGRATION		= 0x1,	/* migration mode */
-	TTU_MUNLOCK		= 0x2,	/* munlock mode */
 
 	TTU_SPLIT_HUGE_PMD	= 0x4,	/* split huge PMD if any */
 	TTU_IGNORE_MLOCK	= 0x8,	/* ignore mlock */
@@ -239,7 +238,7 @@ int page_mkclean(struct page *);
  * called in munlock()/munmap() path to check for other vmas holding
  * the page mlocked.
  */
-void try_to_munlock(struct page *);
+void page_mlock(struct page *page);
 
 void remove_migration_ptes(struct page *old, struct page *new, bool locked);
 
diff --git a/mm/mlock.c b/mm/mlock.c
index df590fda5688..a518d4c48e65 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -108,7 +108,7 @@ void mlock_vma_page(struct page *page)
 /*
  * Finish munlock after successful page isolation
  *
- * Page must be locked. This is a wrapper for try_to_munlock()
+ * Page must be locked. This is a wrapper for page_mlock()
  * and putback_lru_page() with munlock accounting.
  */
 static void __munlock_isolated_page(struct page *page)
@@ -118,7 +118,7 @@ static void __munlock_isolated_page(struct page *page)
 	 * and we don't need to check all the other vmas.
 	 */
 	if (page_mapcount(page) > 1)
-		try_to_munlock(page);
+		page_mlock(page);
 
 	/* Did try_to_unlock() succeed or punt? */
 	if (!PageMlocked(page))
@@ -158,7 +158,7 @@ static void __munlock_isolation_failed(struct page *page)
  * munlock()ed or munmap()ed, we want to check whether other vmas hold the
  * page locked so that we can leave it on the unevictable lru list and not
  * bother vmscan with it.  However, to walk the page's rmap list in
- * try_to_munlock() we must isolate the page from the LRU.  If some other
+ * page_mlock() we must isolate the page from the LRU.  If some other
  * task has removed the page from the LRU, we won't be able to do that.
  * So we clear the PageMlocked as we might not get another chance.  If we
  * can't isolate the page, we leave it for putback_lru_page() and vmscan
@@ -168,7 +168,7 @@ unsigned int munlock_vma_page(struct page *page)
 {
 	int nr_pages;
 
-	/* For try_to_munlock() and to serialize with page migration */
+	/* For page_mlock() and to serialize with page migration */
 	BUG_ON(!PageLocked(page));
 	VM_BUG_ON_PAGE(PageTail(page), page);
 
@@ -205,7 +205,7 @@ static int __mlock_posix_error_return(long retval)
  *
  * The fast path is available only for evictable pages with single mapping.
  * Then we can bypass the per-cpu pvec and get better performance.
- * when mapcount > 1 we need try_to_munlock() which can fail.
+ * when mapcount > 1 we need page_mlock() which can fail.
  * when !page_evictable(), we need the full redo logic of putback_lru_page to
  * avoid leaving evictable page in unevictable list.
  *
diff --git a/mm/rmap.c b/mm/rmap.c
index bc08c4d4b58a..e88966903e1e 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1405,10 +1405,6 @@ static bool try_to_unmap_one(struct page *page, struct vm_area_struct *vma,
 	struct mmu_notifier_range range;
 	enum ttu_flags flags = (enum ttu_flags)(long)arg;
 
-	/* munlock has nothing to gain from examining un-locked vmas */
-	if ((flags & TTU_MUNLOCK) && !(vma->vm_flags & VM_LOCKED))
-		return true;
-
 	if (IS_ENABLED(CONFIG_MIGRATION) && (flags & TTU_MIGRATION) &&
 	    is_zone_device_page(page) && !is_device_private_page(page))
 		return true;
@@ -1469,8 +1465,6 @@ static bool try_to_unmap_one(struct page *page, struct vm_area_struct *vma,
 				page_vma_mapped_walk_done(&pvmw);
 				break;
 			}
-			if (flags & TTU_MUNLOCK)
-				continue;
 		}
 
 		/* Unexpected PMD-mapped THP? */
@@ -1784,20 +1778,53 @@ bool try_to_unmap(struct page *page, enum ttu_flags flags)
 	return !page_mapcount(page) ? true : false;
 }
 
+/*
+ * Walks the vma's mapping a page and mlocks the page if any locked vma's are
+ * found. Once one is found the page is locked and the scan can be terminated.
+ */
+static bool page_mlock_one(struct page *page, struct vm_area_struct *vma,
+				 unsigned long address, void *unused)
+{
+	struct page_vma_mapped_walk pvmw = {
+		.page = page,
+		.vma = vma,
+		.address = address,
+	};
+
+	/* An un-locked vma doesn't have any pages to lock, continue the scan */
+	if (!(vma->vm_flags & VM_LOCKED))
+		return true;
+
+	while (page_vma_mapped_walk(&pvmw)) {
+		/* PTE-mapped THP are never mlocked */
+		if (!PageTransCompound(page))
+			mlock_vma_page(page);
+		page_vma_mapped_walk_done(&pvmw);
+
+		/*
+		 * no need to continue scanning other vma's if the page has
+		 * been locked.
+		 */
+		return false;
+	}
+
+	return true;
+}
+
 /**
- * try_to_munlock - try to munlock a page
- * @page: the page to be munlocked
+ * page_mlock - try to mlock a page
+ * @page: the page to be mlocked
  *
- * Called from munlock code.  Checks all of the VMAs mapping the page
- * to make sure nobody else has this page mlocked. The page will be
- * returned with PG_mlocked cleared if no other vmas have it mlocked.
+ * Called from munlock code. Checks all of the VMAs mapping the page and mlocks
+ * the page if any are found. The page will be returned with PG_mlocked cleared
+ * if it is not mapped by any locked vmas.
+ *
+ * mmap_lock should be held for read or write.
  */
-
-void try_to_munlock(struct page *page)
+void page_mlock(struct page *page)
 {
 	struct rmap_walk_control rwc = {
-		.rmap_one = try_to_unmap_one,
-		.arg = (void *)TTU_MUNLOCK,
+		.rmap_one = page_mlock_one,
 		.done = page_not_mapped,
 		.anon_lock = page_lock_anon_vma_read,
 
@@ -1849,7 +1876,7 @@ static struct anon_vma *rmap_walk_anon_lock(struct page *page,
  * Find all the mappings of a page using the mapping pointer and the vma chains
  * contained in the anon_vma struct it points to.
  *
- * When called from try_to_munlock(), the mmap_lock of the mm containing the vma
+ * When called from page_mlock(), the mmap_lock of the mm containing the vma
  * where the page was found will be held for write.  So, we won't recheck
  * vm_flags for that VMA.  That should be OK, because that vma shouldn't be
  * LOCKED.
@@ -1901,7 +1928,7 @@ static void rmap_walk_anon(struct page *page, struct rmap_walk_control *rwc,
  * Find all the mappings of a page using the mapping pointer and the vma chains
  * contained in the address_space struct it points to.
  *
- * When called from try_to_munlock(), the mmap_lock of the mm containing the vma
+ * When called from page_mlock(), the mmap_lock of the mm containing the vma
  * where the page was found will be held for write.  So, we won't recheck
  * vm_flags for that VMA.  That should be OK, because that vma shouldn't be
  * LOCKED.
-- 
2.20.1

