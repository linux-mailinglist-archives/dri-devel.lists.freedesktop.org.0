Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D05356711
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 10:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7CB6E082;
	Wed,  7 Apr 2021 08:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6766E082;
 Wed,  7 Apr 2021 08:43:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7DSmJZDRLSS8RIL511pTMI8JsnwrMObBePhaIWjkmSdJbuSs6/xW9NKNS8AfvVnWEduxEx0BzAFr0MsCSN0xNoYqISXzLfM+EOS52yBczSXPYd8JxbFr1js3qXlDXEXPfXgotdnyzvNNAdsZ57DCFd4Oy4TiYwU4/hBNc28uHew6+rzz7HbNue62enr9wCb++LpVq9zuZFRHbComZZ40S2Be52bqNaJiukwJPNe/lEzKpTX+/uVjmFGPgbqWcYZsAPu48omUOAeWb9pndFHJs/umR/wkyAHmebR5/f1YrH5KZogmZJmZeImpNxlQxsjvndq7jr0ZJAXtSUhAK1Cbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5UKUt63GWMG/q0rdwsQSKZzi5XNYK8gxkE0j7W9Ghw=;
 b=epbPn4asAkCcFZMsK7ld/tqdiUMruXHtTMAGL0Fws7qPJsONWgWNo1lQIy0Ptbwv6vfKN6uDJZ4Auf96z+m34VmGQdct9OZwl5Sa+ckUI6b7O5as4TnGzJSjDspUIrFTxaNZjmn9LVO5PDLFtkpx/D68UBNmPvVs4FfXGV/7MC1SidJq4WaaH0a6+/6ERyN8eAz2TNF3OdSAWj1FkfSijIGLfwRfbzs5SXSjh5rN9mENn+T/Js9xnsNECYFO/utb1xO0jkl9rrt+WLUPk+Nvh/dk9rQ7JNxGZZ9R5Z/VEZx+SzXaCAeb57usnOqwEEcdqW25l5lfLLu4jWA7ymzNlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5UKUt63GWMG/q0rdwsQSKZzi5XNYK8gxkE0j7W9Ghw=;
 b=kSHk4pWjqh6FFOlPfyJ9hV7mCFkjr7lzzQH/P17ERg6rWh0rOJam6OmvF+W/YgwpvbVXrFP5Qrn9R41GJwmqnBZ/MvlnQYJ2zKLN4QClAvAH2IzGtf2drxRmiKxPNWzwl3oIMwD51ucB51UAD43/JK0TmAGNmREFA5vORQJ4jyJhSyjjEtu4lvSCruASrafLcArLuF9ORG1sY0hOBayZJ67Mwh0pn937irTxs03621Wbjl/Ic2u68UH058e8P/gijU0hdzE2zsaMSo51yQE4C+uaxHKjFqG34nXIqU62a65bbERDK8hsH4m+OBTA9znAa+viWHlDZRBlkcnBB6fFvg==
Received: from BN6PR13CA0031.namprd13.prod.outlook.com (2603:10b6:404:13e::17)
 by BN6PR1201MB0131.namprd12.prod.outlook.com (2603:10b6:405:5b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Wed, 7 Apr
 2021 08:43:06 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:13e:cafe::96) by BN6PR13CA0031.outlook.office365.com
 (2603:10b6:404:13e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.9 via Frontend
 Transport; Wed, 7 Apr 2021 08:43:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3999.28 via Frontend Transport; Wed, 7 Apr 2021 08:43:05 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 7 Apr
 2021 08:43:04 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH v8 3/8] mm/rmap: Split try_to_munlock from try_to_unmap
Date: Wed, 7 Apr 2021 18:42:33 +1000
Message-ID: <20210407084238.20443-4-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210407084238.20443-1-apopple@nvidia.com>
References: <20210407084238.20443-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e18c2f3-9582-43fb-dc55-08d8f9a129cd
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0131:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0131479217FACEB3C9B2F6CBDF759@BN6PR1201MB0131.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mu2sQAL702PrFfbqqGuHzlvtaTgZgfJvmdO9TtFm5toMY2UkqMCrQBk0Om96EMl+5813pugJJeSGdLeZPw+qN4y2kyDuYkvGyipXbVpQjfYUjsZsJasWdx07G4PXnCWm/HaloEYik1HDV9s9rHJYnosBGRcEM9qvfXFrijMBJSc1em/zIA+1enlwnnxaHlRrUQYIK/bInfhnXbKaXJ2WeJOLSJ99rIQ0h8Hpr3M0fOphB1EZE93civFfUPD7Z2FXoJO+po04y0nlwnRTodGEaW9XXtAk4/u+JLMxqFRevN2DXrmx3DLFOGpPWTKol/rZ77zi2mpH4AWbIplCu7OVols3Nw+Omtmefyn8Wz3b6bOVoSvw/om5OevTCEIewbn4yhwe1hwM4iD6Patjuyj/M8nX3EqQLgRmj7tBUD3ZhX6R0FNBJ2H3/ZbRHcs1yh0xg9TNZ+vdxJUkxQSqOeuwk1gF+qPVq6UDD3pgZsK8mdqWrWNCsiJgl24rE+bKKGygQqNELjX4KlNS5SA4WQOsg0mHEYJQvbT3LNzSNuHv1Q8cGOBSjtV4LZzo1DjiWZ4lSLXTGbj/XATX1fnNX0H7NLj8ycNnhWDQtJxL1L2E1IB6s30sZjS4ahqG0abJ/+7zf8Pq2vSe8jlBfwtu5AGgRWn0vrf19OFulwUceYPDu8U=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(36840700001)(46966006)(1076003)(356005)(186003)(2906002)(36860700001)(83380400001)(86362001)(82310400003)(16526019)(6666004)(478600001)(70586007)(426003)(70206006)(36756003)(7416002)(2616005)(7636003)(8936002)(336012)(8676002)(4326008)(110136005)(30864003)(54906003)(5660300002)(47076005)(26005)(36906005)(316002)(82740400003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 08:43:05.6075 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e18c2f3-9582-43fb-dc55-08d8f9a129cd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0131
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org, jhubbard@nvidia.com,
 bsingharora@gmail.com, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, jglisse@redhat.com, willy@infradead.org, jgg@nvidia.com,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

v8:
* Renamed try_to_munlock to page_mlock to better reflect what the
  function actually does.
* Removed the TODO from the documentation that this patch addresses.

v7:
* Added Christoph's Reviewed-by

v4:
* Removed redundant check for VM_LOCKED
---
 Documentation/vm/unevictable-lru.rst | 33 ++++++++-----------
 include/linux/rmap.h                 |  3 +-
 mm/mlock.c                           | 10 +++---
 mm/rmap.c                            | 48 +++++++++++++++++++++-------
 4 files changed, 55 insertions(+), 39 deletions(-)

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
index f8f8cc32d03d..9b8b82cfbbff 100644
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
index 977e70803ed8..f09d522725b9 100644
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
@@ -1784,8 +1778,39 @@ bool try_to_unmap(struct page *page, enum ttu_flags flags)
 	return !page_mapcount(page) ? true : false;
 }
 
+static bool page_mlock_one(struct page *page, struct vm_area_struct *vma,
+				 unsigned long address, void *arg)
+{
+	struct page_vma_mapped_walk pvmw = {
+		.page = page,
+		.vma = vma,
+		.address = address,
+	};
+
+	/* munlock has nothing to gain from examining un-locked vmas */
+	if (!(vma->vm_flags & VM_LOCKED))
+		return true;
+
+	while (page_vma_mapped_walk(&pvmw)) {
+		/* PTE-mapped THP are never mlocked */
+		if (!PageTransCompound(page)) {
+			/*
+			 * Holding pte lock, we do *not* need
+			 * mmap_lock here
+			 */
+			mlock_vma_page(page);
+		}
+		page_vma_mapped_walk_done(&pvmw);
+
+		/* found a mlocked page, no point continuing munlock check */
+		return false;
+	}
+
+	return true;
+}
+
 /**
- * try_to_munlock - try to munlock a page
+ * page_mlock - try to munlock a page
  * @page: the page to be munlocked
  *
  * Called from munlock code.  Checks all of the VMAs mapping the page
@@ -1793,11 +1818,10 @@ bool try_to_unmap(struct page *page, enum ttu_flags flags)
  * returned with PG_mlocked cleared if no other vmas have it mlocked.
  */
 
-void try_to_munlock(struct page *page)
+void page_mlock(struct page *page)
 {
 	struct rmap_walk_control rwc = {
-		.rmap_one = try_to_unmap_one,
-		.arg = (void *)TTU_MUNLOCK,
+		.rmap_one = page_mlock_one,
 		.done = page_not_mapped,
 		.anon_lock = page_lock_anon_vma_read,
 
@@ -1849,7 +1873,7 @@ static struct anon_vma *rmap_walk_anon_lock(struct page *page,
  * Find all the mappings of a page using the mapping pointer and the vma chains
  * contained in the anon_vma struct it points to.
  *
- * When called from try_to_munlock(), the mmap_lock of the mm containing the vma
+ * When called from page_mlock(), the mmap_lock of the mm containing the vma
  * where the page was found will be held for write.  So, we won't recheck
  * vm_flags for that VMA.  That should be OK, because that vma shouldn't be
  * LOCKED.
@@ -1901,7 +1925,7 @@ static void rmap_walk_anon(struct page *page, struct rmap_walk_control *rwc,
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
