Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6481F38E788
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 15:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718376E5B9;
	Mon, 24 May 2021 13:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E236E59B;
 Mon, 24 May 2021 13:28:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQf/poHXOoMIPT52uOVp6oYS/KsFzBEEOXrOZVyPslE014oDYSVKoZLf5efV6tlmsUGroCjyZMdjMzpadnm565cCLVKTncSq8vTFQGEJ9R514SbaPglxJNyVyiVdcmOpy1QqDwgi1n5mgIVWAQGIt1i0hTSdrx1dADjtC2Ssci9/PsKbE6BxiziIaswiOYlENDh8CP9VVUNsy+qhIJDcY6zSgXyjuHpQaIFz+0wzYjaG7Lzuq5etmyb+TRAgVbbU5n/wFRn7pg3uag3Cu4tlqUpsyrRJj4Cv8asRDEpmWvs7njeOZesDbmTP9lZZs7sPGCn4neSgMPvkk+h7cS2rQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCRqs4pCwzuTyMauXbqINzqp8SWwHBLx6rkFKbBktRI=;
 b=oAPvPaC9rUMDauMoqECu9nfy0nBRtBD5jxtMsmaRkLqOKSkPQuT3UswRs1jtzbZYEVE2JTmYrXccp6imz3ESVQKP/46JxsoLIpPRFq5v//v7FWaK2y3QJhQaUVg1UsvAddvtly9f52WRPvu2bBcpywAuhdL/E1h/ZJ+g173oIOITGM3d8tPSyzBDUaBP5j3b+PXo0xqqNYI55E+Fsp89rJwpfuAhXs/dz8ziwu9ylyRSWeWMNZi5B8N5LutkLU6qN5D1UbtkXR2QPcJogki0XjCYQEQd/rXZ43WaAl57fSpEYf8DNFdfNgkC0ZobZeHqAv3qfT8iWmy8caUn62v/fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCRqs4pCwzuTyMauXbqINzqp8SWwHBLx6rkFKbBktRI=;
 b=Yfwlsa3FMNdriXUBw324sLq/SQ7RzJmBJmePoA4v9KoRjMTPpNsWD09NqAqYT3zc7G4au4L97uRGR8VfGN81W1nePF2eP6FLYlblX2LKJvwXlxQtXUT7HTHRb1BTc2FpX7CPqK7JOVTMvga9iRYu6BE++q1Loja2UnH/fEvO107wfVHAYclDRXHR/wMKum/JFq8ncd557PXpfjptbNwWUg4zdF9GYF9xmvGqfkcnNOtEn9LLKVP+Z7YpmD13mbbWba6OvbjmYcBngZDT5Kd4PwARMOrxfKQD61zKWb4I5gA7NjJ6u/ds1TEsnidgER6+2Cgfi6qHn2gIDmPQj53yqw==
Received: from MW4P220CA0030.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::35)
 by MN2PR12MB4341.namprd12.prod.outlook.com (2603:10b6:208:262::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 13:28:49 +0000
Received: from CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::61) by MW4P220CA0030.outlook.office365.com
 (2603:10b6:303:115::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26 via Frontend
 Transport; Mon, 24 May 2021 13:28:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT016.mail.protection.outlook.com (10.13.175.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Mon, 24 May 2021 13:28:49 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 24 May
 2021 13:28:47 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <akpm@linux-foundation.org>
Subject: [PATCH v9 04/10] mm/rmap: Split migration into its own function
Date: Mon, 24 May 2021 23:27:19 +1000
Message-ID: <20210524132725.12697-5-apopple@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2aa8079e-e1c8-4b79-87a9-08d91eb7dd85
X-MS-TrafficTypeDiagnostic: MN2PR12MB4341:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43418BD385F604DF3F4F5D3EDF269@MN2PR12MB4341.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zoB6aD1kjaSW9oDm9qF4AYiye+ESwlG9IqCSRWh9EUGPwSfIX6aCi/kY3czXsU3SmEK7qeONgY2N+3MpcflfNXAUeGW79y+RfhAvBBQFaSP94eNYUFVdhbqGTmY2wCozNyj5mzPMA8Z58Nj4beUoilP7lqJoXhbDq5d7oxWKG6k9yZZb28imQC8skphp9cdIXrhXXvXO7psYgIO2B6JLKMFwMImBAgHuIOZjkSY6VBl644wsI93GAh9Wqe3lFZemNlyuYUGRvuW4B2uQOomD8bkQ4Udu5fIUVrHjz9M5axLy6nW0iyTktJkhCa+/lKBJEZq1YwcbgpdJmEvzaQ+uM+KtdqCffOpsyl4WkK6892V31lwtJil2hSAGRGGETT6v3ioHd4FgstnUnsBKCvDF51SI2dSep/SjUkkKKQHCySCeP+HwxrJNnJTWqKZwJHKARCGNARK6C2miSwCAucOtYplhhdVYtMeDV7hHm+0RXp5NEFt35h1nTeKDgmghVko7UEdxNphDyYETCYBw26N1Jl0CHA913rqC1D+ysKMRU2DVhKQqGF6rbokPKsl2eEzWgZYACUttF/P8AWLdOwoELkRjY6twQV2WdXpOJm4brLexW12lkBXxkZyX9hd+O8KNFm8ayVpBCXM/odsVpW7L/G3/huKZK+feZXHZxn0wqds=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(36840700001)(46966006)(47076005)(356005)(36860700001)(336012)(7636003)(54906003)(2616005)(110136005)(36906005)(8936002)(426003)(16526019)(316002)(2906002)(86362001)(186003)(4326008)(82740400003)(6666004)(478600001)(30864003)(70586007)(82310400003)(8676002)(26005)(7416002)(70206006)(5660300002)(83380400001)(1076003)(36756003)(21314003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 13:28:49.2390 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa8079e-e1c8-4b79-87a9-08d91eb7dd85
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4341
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

Migration is currently implemented as a mode of operation for
try_to_unmap_one() generally specified by passing the TTU_MIGRATION flag
or in the case of splitting a huge anonymous page TTU_SPLIT_FREEZE.

However it does not have much in common with the rest of the unmap
functionality of try_to_unmap_one() and thus splitting it into a
separate function reduces the complexity of try_to_unmap_one() making it
more readable.

Several simplifications can also be made in try_to_migrate_one() based
on the following observations:

 - All users of TTU_MIGRATION also set TTU_IGNORE_MLOCK.
 - No users of TTU_MIGRATION ever set TTU_IGNORE_HWPOISON.
 - No users of TTU_MIGRATION ever set TTU_BATCH_FLUSH.

TTU_SPLIT_FREEZE is a special case of migration used when splitting an
anonymous page. This is most easily dealt with by calling the correct
function from unmap_page() in mm/huge_memory.c  - either
try_to_migrate() for PageAnon or try_to_unmap().

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

---

v5:
* Added comments about how PMD splitting works for migration vs.
  unmapping
* Tightened up the flag check in try_to_migrate() to be explicit about
  which TTU_XXX flags are supported.
---
 include/linux/rmap.h |   4 +-
 mm/huge_memory.c     |  15 +-
 mm/migrate.c         |   9 +-
 mm/rmap.c            | 358 ++++++++++++++++++++++++++++++++-----------
 4 files changed, 280 insertions(+), 106 deletions(-)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 38a746787c2f..0e25d829f742 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -86,8 +86,6 @@ struct anon_vma_chain {
 };
 
 enum ttu_flags {
-	TTU_MIGRATION		= 0x1,	/* migration mode */
-
 	TTU_SPLIT_HUGE_PMD	= 0x4,	/* split huge PMD if any */
 	TTU_IGNORE_MLOCK	= 0x8,	/* ignore mlock */
 	TTU_IGNORE_HWPOISON	= 0x20,	/* corrupted page is recoverable */
@@ -96,7 +94,6 @@ enum ttu_flags {
 					 * do a final flush if necessary */
 	TTU_RMAP_LOCKED		= 0x80,	/* do not grab rmap lock:
 					 * caller holds it */
-	TTU_SPLIT_FREEZE	= 0x100,		/* freeze pte under splitting thp */
 };
 
 #ifdef CONFIG_MMU
@@ -193,6 +190,7 @@ static inline void page_dup_rmap(struct page *page, bool compound)
 int page_referenced(struct page *, int is_locked,
 			struct mem_cgroup *memcg, unsigned long *vm_flags);
 
+bool try_to_migrate(struct page *page, enum ttu_flags flags);
 bool try_to_unmap(struct page *, enum ttu_flags flags);
 
 /* Avoid racy checks */
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 2ec6dab72217..6dddc75b89ee 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2345,16 +2345,21 @@ void vma_adjust_trans_huge(struct vm_area_struct *vma,
 
 static void unmap_page(struct page *page)
 {
-	enum ttu_flags ttu_flags = TTU_IGNORE_MLOCK |
-		TTU_RMAP_LOCKED | TTU_SPLIT_HUGE_PMD;
+	enum ttu_flags ttu_flags = TTU_RMAP_LOCKED | TTU_SPLIT_HUGE_PMD;
 	bool unmap_success;
 
 	VM_BUG_ON_PAGE(!PageHead(page), page);
 
 	if (PageAnon(page))
-		ttu_flags |= TTU_SPLIT_FREEZE;
-
-	unmap_success = try_to_unmap(page, ttu_flags);
+		unmap_success = try_to_migrate(page, ttu_flags);
+	else
+		/*
+		 * Don't install migration entries for file backed pages. This
+		 * helps handle cases when i_size is in the middle of the page
+		 * as there is no need to unmap pages beyond i_size manually.
+		 */
+		unmap_success = try_to_unmap(page, ttu_flags |
+						TTU_IGNORE_MLOCK);
 	VM_BUG_ON_PAGE(!unmap_success, page);
 }
 
diff --git a/mm/migrate.c b/mm/migrate.c
index 930de919b1f2..05740f816bc4 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -1103,7 +1103,7 @@ static int __unmap_and_move(struct page *page, struct page *newpage,
 		/* Establish migration ptes */
 		VM_BUG_ON_PAGE(PageAnon(page) && !PageKsm(page) && !anon_vma,
 				page);
-		try_to_unmap(page, TTU_MIGRATION|TTU_IGNORE_MLOCK);
+		try_to_migrate(page, 0);
 		page_was_mapped = 1;
 	}
 
@@ -1305,7 +1305,7 @@ static int unmap_and_move_huge_page(new_page_t get_new_page,
 
 	if (page_mapped(hpage)) {
 		bool mapping_locked = false;
-		enum ttu_flags ttu = TTU_MIGRATION|TTU_IGNORE_MLOCK;
+		enum ttu_flags ttu = 0;
 
 		if (!PageAnon(hpage)) {
 			/*
@@ -1322,7 +1322,7 @@ static int unmap_and_move_huge_page(new_page_t get_new_page,
 			ttu |= TTU_RMAP_LOCKED;
 		}
 
-		try_to_unmap(hpage, ttu);
+		try_to_migrate(hpage, ttu);
 		page_was_mapped = 1;
 
 		if (mapping_locked)
@@ -2712,7 +2712,6 @@ static void migrate_vma_prepare(struct migrate_vma *migrate)
  */
 static void migrate_vma_unmap(struct migrate_vma *migrate)
 {
-	int flags = TTU_MIGRATION | TTU_IGNORE_MLOCK;
 	const unsigned long npages = migrate->npages;
 	const unsigned long start = migrate->start;
 	unsigned long addr, i, restore = 0;
@@ -2724,7 +2723,7 @@ static void migrate_vma_unmap(struct migrate_vma *migrate)
 			continue;
 
 		if (page_mapped(page)) {
-			try_to_unmap(page, flags);
+			try_to_migrate(page, 0);
 			if (page_mapped(page))
 				goto restore;
 		}
diff --git a/mm/rmap.c b/mm/rmap.c
index e88966903e1e..8ed1853060cf 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1405,14 +1405,8 @@ static bool try_to_unmap_one(struct page *page, struct vm_area_struct *vma,
 	struct mmu_notifier_range range;
 	enum ttu_flags flags = (enum ttu_flags)(long)arg;
 
-	if (IS_ENABLED(CONFIG_MIGRATION) && (flags & TTU_MIGRATION) &&
-	    is_zone_device_page(page) && !is_device_private_page(page))
-		return true;
-
-	if (flags & TTU_SPLIT_HUGE_PMD) {
-		split_huge_pmd_address(vma, address,
-				flags & TTU_SPLIT_FREEZE, page);
-	}
+	if (flags & TTU_SPLIT_HUGE_PMD)
+		split_huge_pmd_address(vma, address, false, page);
 
 	/*
 	 * For THP, we have to assume the worse case ie pmd for invalidation.
@@ -1436,16 +1430,6 @@ static bool try_to_unmap_one(struct page *page, struct vm_area_struct *vma,
 	mmu_notifier_invalidate_range_start(&range);
 
 	while (page_vma_mapped_walk(&pvmw)) {
-#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
-		/* PMD-mapped THP migration entry */
-		if (!pvmw.pte && (flags & TTU_MIGRATION)) {
-			VM_BUG_ON_PAGE(PageHuge(page) || !PageTransCompound(page), page);
-
-			set_pmd_migration_entry(&pvmw, page);
-			continue;
-		}
-#endif
-
 		/*
 		 * If the page is mlock()d, we cannot swap it out.
 		 * If it's recently referenced (perhaps page_referenced
@@ -1507,46 +1491,6 @@ static bool try_to_unmap_one(struct page *page, struct vm_area_struct *vma,
 			}
 		}
 
-		if (IS_ENABLED(CONFIG_MIGRATION) &&
-		    (flags & TTU_MIGRATION) &&
-		    is_zone_device_page(page)) {
-			swp_entry_t entry;
-			pte_t swp_pte;
-
-			pteval = ptep_get_and_clear(mm, pvmw.address, pvmw.pte);
-
-			/*
-			 * Store the pfn of the page in a special migration
-			 * pte. do_swap_page() will wait until the migration
-			 * pte is removed and then restart fault handling.
-			 */
-			entry = make_readable_migration_entry(page_to_pfn(page));
-			swp_pte = swp_entry_to_pte(entry);
-
-			/*
-			 * pteval maps a zone device page and is therefore
-			 * a swap pte.
-			 */
-			if (pte_swp_soft_dirty(pteval))
-				swp_pte = pte_swp_mksoft_dirty(swp_pte);
-			if (pte_swp_uffd_wp(pteval))
-				swp_pte = pte_swp_mkuffd_wp(swp_pte);
-			set_pte_at(mm, pvmw.address, pvmw.pte, swp_pte);
-			/*
-			 * No need to invalidate here it will synchronize on
-			 * against the special swap migration pte.
-			 *
-			 * The assignment to subpage above was computed from a
-			 * swap PTE which results in an invalid pointer.
-			 * Since only PAGE_SIZE pages can currently be
-			 * migrated, just set it to page. This will need to be
-			 * changed when hugepage migrations to device private
-			 * memory are supported.
-			 */
-			subpage = page;
-			goto discard;
-		}
-
 		/* Nuke the page table entry. */
 		flush_cache_page(vma, address, pte_pfn(*pvmw.pte));
 		if (should_defer_flush(mm, flags)) {
@@ -1599,39 +1543,6 @@ static bool try_to_unmap_one(struct page *page, struct vm_area_struct *vma,
 			/* We have to invalidate as we cleared the pte */
 			mmu_notifier_invalidate_range(mm, address,
 						      address + PAGE_SIZE);
-		} else if (IS_ENABLED(CONFIG_MIGRATION) &&
-				(flags & (TTU_MIGRATION|TTU_SPLIT_FREEZE))) {
-			swp_entry_t entry;
-			pte_t swp_pte;
-
-			if (arch_unmap_one(mm, vma, address, pteval) < 0) {
-				set_pte_at(mm, address, pvmw.pte, pteval);
-				ret = false;
-				page_vma_mapped_walk_done(&pvmw);
-				break;
-			}
-
-			/*
-			 * Store the pfn of the page in a special migration
-			 * pte. do_swap_page() will wait until the migration
-			 * pte is removed and then restart fault handling.
-			 */
-			if (pte_write(pteval))
-				entry = make_writable_migration_entry(
-							page_to_pfn(subpage));
-			else
-				entry = make_readable_migration_entry(
-							page_to_pfn(subpage));
-			swp_pte = swp_entry_to_pte(entry);
-			if (pte_soft_dirty(pteval))
-				swp_pte = pte_swp_mksoft_dirty(swp_pte);
-			if (pte_uffd_wp(pteval))
-				swp_pte = pte_swp_mkuffd_wp(swp_pte);
-			set_pte_at(mm, address, pvmw.pte, swp_pte);
-			/*
-			 * No need to invalidate here it will synchronize on
-			 * against the special swap migration pte.
-			 */
 		} else if (PageAnon(page)) {
 			swp_entry_t entry = { .val = page_private(subpage) };
 			pte_t swp_pte;
@@ -1758,6 +1669,268 @@ bool try_to_unmap(struct page *page, enum ttu_flags flags)
 		.anon_lock = page_lock_anon_vma_read,
 	};
 
+	if (flags & TTU_RMAP_LOCKED)
+		rmap_walk_locked(page, &rwc);
+	else
+		rmap_walk(page, &rwc);
+
+	return !page_mapcount(page) ? true : false;
+}
+
+/*
+ * @arg: enum ttu_flags will be passed to this argument.
+ *
+ * If TTU_SPLIT_HUGE_PMD is specified any PMD mappings will be split into PTEs
+ * containing migration entries. This and TTU_RMAP_LOCKED are the only supported
+ * flags.
+ */
+static bool try_to_migrate_one(struct page *page, struct vm_area_struct *vma,
+		     unsigned long address, void *arg)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	struct page_vma_mapped_walk pvmw = {
+		.page = page,
+		.vma = vma,
+		.address = address,
+	};
+	pte_t pteval;
+	struct page *subpage;
+	bool ret = true;
+	struct mmu_notifier_range range;
+	enum ttu_flags flags = (enum ttu_flags)(long)arg;
+
+	if (is_zone_device_page(page) && !is_device_private_page(page))
+		return true;
+
+	/*
+	 * unmap_page() in mm/huge_memory.c is the only user of migration with
+	 * TTU_SPLIT_HUGE_PMD and it wants to freeze.
+	 */
+	if (flags & TTU_SPLIT_HUGE_PMD)
+		split_huge_pmd_address(vma, address, true, page);
+
+	/*
+	 * For THP, we have to assume the worse case ie pmd for invalidation.
+	 * For hugetlb, it could be much worse if we need to do pud
+	 * invalidation in the case of pmd sharing.
+	 *
+	 * Note that the page can not be free in this function as call of
+	 * try_to_unmap() must hold a reference on the page.
+	 */
+	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma, vma->vm_mm,
+				address,
+				min(vma->vm_end, address + page_size(page)));
+	if (PageHuge(page)) {
+		/*
+		 * If sharing is possible, start and end will be adjusted
+		 * accordingly.
+		 */
+		adjust_range_if_pmd_sharing_possible(vma, &range.start,
+						     &range.end);
+	}
+	mmu_notifier_invalidate_range_start(&range);
+
+	while (page_vma_mapped_walk(&pvmw)) {
+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
+		/* PMD-mapped THP migration entry */
+		if (!pvmw.pte) {
+			VM_BUG_ON_PAGE(PageHuge(page) ||
+				       !PageTransCompound(page), page);
+
+			set_pmd_migration_entry(&pvmw, page);
+			continue;
+		}
+#endif
+
+		/* Unexpected PMD-mapped THP? */
+		VM_BUG_ON_PAGE(!pvmw.pte, page);
+
+		subpage = page - page_to_pfn(page) + pte_pfn(*pvmw.pte);
+		address = pvmw.address;
+
+		if (PageHuge(page) && !PageAnon(page)) {
+			/*
+			 * To call huge_pmd_unshare, i_mmap_rwsem must be
+			 * held in write mode.  Caller needs to explicitly
+			 * do this outside rmap routines.
+			 */
+			VM_BUG_ON(!(flags & TTU_RMAP_LOCKED));
+			if (huge_pmd_unshare(mm, vma, &address, pvmw.pte)) {
+				/*
+				 * huge_pmd_unshare unmapped an entire PMD
+				 * page.  There is no way of knowing exactly
+				 * which PMDs may be cached for this mm, so
+				 * we must flush them all.  start/end were
+				 * already adjusted above to cover this range.
+				 */
+				flush_cache_range(vma, range.start, range.end);
+				flush_tlb_range(vma, range.start, range.end);
+				mmu_notifier_invalidate_range(mm, range.start,
+							      range.end);
+
+				/*
+				 * The ref count of the PMD page was dropped
+				 * which is part of the way map counting
+				 * is done for shared PMDs.  Return 'true'
+				 * here.  When there is no other sharing,
+				 * huge_pmd_unshare returns false and we will
+				 * unmap the actual page and drop map count
+				 * to zero.
+				 */
+				page_vma_mapped_walk_done(&pvmw);
+				break;
+			}
+		}
+
+		/* Nuke the page table entry. */
+		flush_cache_page(vma, address, pte_pfn(*pvmw.pte));
+		pteval = ptep_clear_flush(vma, address, pvmw.pte);
+
+		/* Move the dirty bit to the page. Now the pte is gone. */
+		if (pte_dirty(pteval))
+			set_page_dirty(page);
+
+		/* Update high watermark before we lower rss */
+		update_hiwater_rss(mm);
+
+		if (is_zone_device_page(page)) {
+			swp_entry_t entry;
+			pte_t swp_pte;
+
+			/*
+			 * Store the pfn of the page in a special migration
+			 * pte. do_swap_page() will wait until the migration
+			 * pte is removed and then restart fault handling.
+			 */
+			entry = make_readable_migration_entry(
+							page_to_pfn(page));
+			swp_pte = swp_entry_to_pte(entry);
+
+			/*
+			 * pteval maps a zone device page and is therefore
+			 * a swap pte.
+			 */
+			if (pte_swp_soft_dirty(pteval))
+				swp_pte = pte_swp_mksoft_dirty(swp_pte);
+			if (pte_swp_uffd_wp(pteval))
+				swp_pte = pte_swp_mkuffd_wp(swp_pte);
+			set_pte_at(mm, pvmw.address, pvmw.pte, swp_pte);
+			/*
+			 * No need to invalidate here it will synchronize on
+			 * against the special swap migration pte.
+			 *
+			 * The assignment to subpage above was computed from a
+			 * swap PTE which results in an invalid pointer.
+			 * Since only PAGE_SIZE pages can currently be
+			 * migrated, just set it to page. This will need to be
+			 * changed when hugepage migrations to device private
+			 * memory are supported.
+			 */
+			subpage = page;
+		} else if (PageHWPoison(page)) {
+			pteval = swp_entry_to_pte(make_hwpoison_entry(subpage));
+			if (PageHuge(page)) {
+				hugetlb_count_sub(compound_nr(page), mm);
+				set_huge_swap_pte_at(mm, address,
+						     pvmw.pte, pteval,
+						     vma_mmu_pagesize(vma));
+			} else {
+				dec_mm_counter(mm, mm_counter(page));
+				set_pte_at(mm, address, pvmw.pte, pteval);
+			}
+
+		} else if (pte_unused(pteval) && !userfaultfd_armed(vma)) {
+			/*
+			 * The guest indicated that the page content is of no
+			 * interest anymore. Simply discard the pte, vmscan
+			 * will take care of the rest.
+			 * A future reference will then fault in a new zero
+			 * page. When userfaultfd is active, we must not drop
+			 * this page though, as its main user (postcopy
+			 * migration) will not expect userfaults on already
+			 * copied pages.
+			 */
+			dec_mm_counter(mm, mm_counter(page));
+			/* We have to invalidate as we cleared the pte */
+			mmu_notifier_invalidate_range(mm, address,
+						      address + PAGE_SIZE);
+		} else {
+			swp_entry_t entry;
+			pte_t swp_pte;
+
+			if (arch_unmap_one(mm, vma, address, pteval) < 0) {
+				set_pte_at(mm, address, pvmw.pte, pteval);
+				ret = false;
+				page_vma_mapped_walk_done(&pvmw);
+				break;
+			}
+
+			/*
+			 * Store the pfn of the page in a special migration
+			 * pte. do_swap_page() will wait until the migration
+			 * pte is removed and then restart fault handling.
+			 */
+			if (pte_write(pteval))
+				entry = make_writable_migration_entry(
+							page_to_pfn(subpage));
+			else
+				entry = make_readable_migration_entry(
+							page_to_pfn(subpage));
+
+			swp_pte = swp_entry_to_pte(entry);
+			if (pte_soft_dirty(pteval))
+				swp_pte = pte_swp_mksoft_dirty(swp_pte);
+			if (pte_uffd_wp(pteval))
+				swp_pte = pte_swp_mkuffd_wp(swp_pte);
+			set_pte_at(mm, address, pvmw.pte, swp_pte);
+			/*
+			 * No need to invalidate here it will synchronize on
+			 * against the special swap migration pte.
+			 */
+		}
+
+		/*
+		 * No need to call mmu_notifier_invalidate_range() it has be
+		 * done above for all cases requiring it to happen under page
+		 * table lock before mmu_notifier_invalidate_range_end()
+		 *
+		 * See Documentation/vm/mmu_notifier.rst
+		 */
+		page_remove_rmap(subpage, PageHuge(page));
+		put_page(page);
+	}
+
+	mmu_notifier_invalidate_range_end(&range);
+
+	return ret;
+}
+
+/**
+ * try_to_migrate - try to replace all page table mappings with swap entries
+ * @page: the page to replace page table entries for
+ * @flags: action and flags
+ *
+ * Tries to remove all the page table entries which are mapping this page and
+ * replace them with special swap entries. Caller must hold the page lock.
+ *
+ * If is successful, return true. Otherwise, false.
+ */
+bool try_to_migrate(struct page *page, enum ttu_flags flags)
+{
+	struct rmap_walk_control rwc = {
+		.rmap_one = try_to_migrate_one,
+		.arg = (void *)flags,
+		.done = page_not_mapped,
+		.anon_lock = page_lock_anon_vma_read,
+	};
+
+	/*
+	 * Migration always ignores mlock and only supports TTU_RMAP_LOCKED and
+	 * TTU_SPLIT_HUGE_PMD flags.
+	 */
+	if (WARN_ON_ONCE(flags & ~(TTU_RMAP_LOCKED | TTU_SPLIT_HUGE_PMD)))
+		return false;
+
 	/*
 	 * During exec, a temporary VMA is setup and later moved.
 	 * The VMA is moved under the anon_vma lock but not the
@@ -1766,8 +1939,7 @@ bool try_to_unmap(struct page *page, enum ttu_flags flags)
 	 * locking requirements of exec(), migration skips
 	 * temporary VMAs until after exec() completes.
 	 */
-	if ((flags & (TTU_MIGRATION|TTU_SPLIT_FREEZE))
-	    && !PageKsm(page) && PageAnon(page))
+	if (!PageKsm(page) && PageAnon(page))
 		rwc.invalid_vma = invalid_migration_vma;
 
 	if (flags & TTU_RMAP_LOCKED)
-- 
2.20.1

