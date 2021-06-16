Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A0E3A9872
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 13:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAB96E581;
	Wed, 16 Jun 2021 11:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C976E593;
 Wed, 16 Jun 2021 11:00:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAY1bd6BFIUM0JoY7LX80lc6UqXwoSXffGdopwhu/uBSMyOWFlnXzrb8LWgBkPdrEYFSMYBo0SB3DNvKzkL0yJR5omHhoZ2f8Q2neNNb8i/Sr7ZFXRPyVBPJGD+3t194O3+aoHeRBN5dtuiRZmJNDd6oHfNvAW49zOgdeUElBreHJp+T7vIJ3nUXVoEtzsFgoE3YvREwFN+z2Wxgky3yZ7/ScK2qiyT14IhBtPG7xflGSF7Ml6d7T6eDkn1gkSEKRiZfVSsfORq2Ul6bTXv1ClcLJbHw8iikTki0efx5WXSs6QMtlNoaQGV8Juikx1avgCUSDgfT9TERcAThL836lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cC5osuYHwb4kdAym1cFiorCyAS5us880pYXww50MbyM=;
 b=Kn8TsYAfq6VkiJ0pq5f9hoJbPx7XRJdNhkfVjtiv1IyZ7fW1KD3DWzWGMqKu6QTPKfX6GBUotXcMCmJ+1cL4C825VdJYEqcWFQOOgi1BgR3ESP1YBfV3rF3pbcMVWmGaWXwKevguqeLesIAub7IgKtu9nBXwwfGPnaX9Qh7MjGno85/86c+JQ+uiYDVp87/R0Kaf42GOIqJPSVaap33FJmxqju2roUQHggsYB27z8/8Wg2Pz31oc7aP6+2GUXLuX6YfKMh5/IdNkdII74muSTBaGZuPixEBFWo/yFwc1HXK9jHzZTyT0H10MQJv7ET1kFx2+/xlQVqbg2yhn9c/PQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cC5osuYHwb4kdAym1cFiorCyAS5us880pYXww50MbyM=;
 b=WHG9AO3UJcxT5YZhh/y/E80eaib0oVSkr4vOo7z1yGyq19Lri+PgC1hj3DvfBhqfc3MfWeNkzOrBVQ/qh8bZhnqo1sfbEUwHvaX1FqLICGjY7OFkr23NaOzkfJa6kTR/mgJmccPRucJ0efNjYd25Dq7uVWk7j+k0qIOZoRRJsQncMPKStRV/JqOZrCr5S5Iy0k8JaRWBCPYhXwYF58ZHeAez1HEbK60Kync1jiN5NIvTZNxCX1pbC8XBJVdAGwdR22CzLsfCFZwpKhG0TEnnI0zMQ9HS4uP1jzWH0tiX3zfJ5K9ZN7UeTsQGGvjRHVqqvyqZa027rPEojCRAX2hTdw==
Received: from BN6PR13CA0002.namprd13.prod.outlook.com (2603:10b6:404:10a::12)
 by DM5PR12MB1436.namprd12.prod.outlook.com (2603:10b6:3:78::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.15; Wed, 16 Jun 2021 11:00:53 +0000
Received: from BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:10a:cafe::b5) by BN6PR13CA0002.outlook.office365.com
 (2603:10b6:404:10a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.10 via Frontend
 Transport; Wed, 16 Jun 2021 11:00:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT031.mail.protection.outlook.com (10.13.177.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4242.16 via Frontend Transport; Wed, 16 Jun 2021 11:00:52 +0000
Received: from localhost (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 16 Jun
 2021 11:00:51 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>
Subject: [PATCH v11 04/10] mm/rmap: Split migration into its own function
Date: Wed, 16 Jun 2021 20:59:31 +1000
Message-ID: <20210616105937.23201-5-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210616105937.23201-1-apopple@nvidia.com>
References: <20210616105937.23201-1-apopple@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26b39d7d-762d-45e2-df09-08d930b6021c
X-MS-TrafficTypeDiagnostic: DM5PR12MB1436:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1436C39643BF347B96C69364DF0F9@DM5PR12MB1436.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IjgD5n22mguYyAchKBDPpXYGjeuqm7Q9y/0Cdw4zfKVbEDPEXf0tnGBYFH3a+oR5pmrYwucsNEX3ECTOib8D9kMchOG2KIg+ef/dcH6HLO8fGt4wXLEjmr3vMCiRYWfTIeYFrhyIiCfvpbYFx1lKIWh5lVpVMMpZSGmoqOnjjL1tKQ2F7p7C9AO503iczswRMtfpBa8m1UnIHp+1slDQa66H7+SHK8inOMjYfWmWRcPZNPe19AXPb7EbTmGfMAQqbVU5LTulqxibtC4yxQOnVbcEJ2B5K1PG6vslP25Y4b5s7Kn+Yz5xlIq5mE0o1EFen35C0T7btocS9YjJId9Xl/BnWFDcFBP5upr59pDOlcL1rCAVyUimHGe7QoVI7PgJPWngID5Y/nJy8n6/v89tiyTYU9o5evq2VZHSZCTizn9Yxxr2HAiqEYDpAi0mUA1LsF395pITGxCHiWOlGoP325X0KT88JGKuZDyjNiHDe2GqSOzzYeA9jP5wypAIuJCqh7YgrBe7tifF4EfSWrdSeTbL2dyFh6uqZoOqMKJSwn0xtI5JxgIDhjJj4Fi1OjLlYCAnmmUbgsecEzW10P884vb7Xw7+UnlNKo6tvxCtEoXd996kqLdNEDCw6mG4AwmvU1RE77UYsnEoQzf8OCKL/986hOxf8hHsS4fzGMjD5Rk=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(46966006)(36840700001)(316002)(8676002)(82310400003)(7416002)(356005)(5660300002)(36906005)(83380400001)(47076005)(6916009)(2906002)(7636003)(36860700001)(36756003)(86362001)(54906003)(336012)(4326008)(70206006)(70586007)(30864003)(426003)(26005)(8936002)(1076003)(186003)(6666004)(16526019)(82740400003)(2616005)(478600001)(21314003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 11:00:52.5464 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b39d7d-762d-45e2-df09-08d930b6021c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1436
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 hughd@google.com, linux-kernel@vger.kernel.org, willy@infradead.org,
 hch@infradead.org, linux-mm@kvack.org, peterx@redhat.com, shakeelb@google.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, jhubbard@nvidia.com,
 Christoph Hellwig <hch@lst.de>, bskeggs@redhat.com
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
 mm/huge_memory.c     |  16 +-
 mm/migrate.c         |   9 +-
 mm/rmap.c            | 367 ++++++++++++++++++++++++++++++++-----------
 4 files changed, 289 insertions(+), 107 deletions(-)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 69190efbd842..b0ea9d98302f 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -86,8 +86,6 @@ struct anon_vma_chain {
 };
 
 enum ttu_flags {
-	TTU_MIGRATION		= 0x1,	/* migration mode */
-
 	TTU_SPLIT_HUGE_PMD	= 0x4,	/* split huge PMD if any */
 	TTU_IGNORE_MLOCK	= 0x8,	/* ignore mlock */
 	TTU_SYNC		= 0x10,	/* avoid racy checks with PVMW_SYNC */
@@ -97,7 +95,6 @@ enum ttu_flags {
 					 * do a final flush if necessary */
 	TTU_RMAP_LOCKED		= 0x80,	/* do not grab rmap lock:
 					 * caller holds it */
-	TTU_SPLIT_FREEZE	= 0x100,		/* freeze pte under splitting thp */
 };
 
 #ifdef CONFIG_MMU
@@ -194,6 +191,7 @@ static inline void page_dup_rmap(struct page *page, bool compound)
 int page_referenced(struct page *, int is_locked,
 			struct mem_cgroup *memcg, unsigned long *vm_flags);
 
+void try_to_migrate(struct page *page, enum ttu_flags flags);
 void try_to_unmap(struct page *, enum ttu_flags flags);
 
 /* Avoid racy checks */
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 1c81aa11d618..8b731d53e9f4 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2309,16 +2309,20 @@ void vma_adjust_trans_huge(struct vm_area_struct *vma,
 
 static void unmap_page(struct page *page)
 {
-	enum ttu_flags ttu_flags = TTU_IGNORE_MLOCK | TTU_SYNC |
-		TTU_RMAP_LOCKED | TTU_SPLIT_HUGE_PMD;
+	enum ttu_flags ttu_flags = TTU_RMAP_LOCKED | TTU_SPLIT_HUGE_PMD |
+		TTU_SYNC;
 
 	VM_BUG_ON_PAGE(!PageHead(page), page);
 
-	/* If TTU_SPLIT_FREEZE is ever extended to file, update remap_page() */
+	/*
+	 * Anon pages need migration entries to preserve them, but file
+	 * pages can simply be left unmapped, then faulted back on demand.
+	 * If that is ever changed (perhaps for mlock), update remap_page().
+	 */
 	if (PageAnon(page))
-		ttu_flags |= TTU_SPLIT_FREEZE;
-
-	try_to_unmap(page, ttu_flags);
+		try_to_migrate(page, ttu_flags);
+	else
+		try_to_unmap(page, ttu_flags | TTU_IGNORE_MLOCK);
 
 	VM_WARN_ON_ONCE_PAGE(page_mapped(page), page);
 }
diff --git a/mm/migrate.c b/mm/migrate.c
index de47bdfbd2f8..a69f54bd92b9 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -1109,7 +1109,7 @@ static int __unmap_and_move(struct page *page, struct page *newpage,
 		/* Establish migration ptes */
 		VM_BUG_ON_PAGE(PageAnon(page) && !PageKsm(page) && !anon_vma,
 				page);
-		try_to_unmap(page, TTU_MIGRATION|TTU_IGNORE_MLOCK);
+		try_to_migrate(page, 0);
 		page_was_mapped = 1;
 	}
 
@@ -1311,7 +1311,7 @@ static int unmap_and_move_huge_page(new_page_t get_new_page,
 
 	if (page_mapped(hpage)) {
 		bool mapping_locked = false;
-		enum ttu_flags ttu = TTU_MIGRATION|TTU_IGNORE_MLOCK;
+		enum ttu_flags ttu = 0;
 
 		if (!PageAnon(hpage)) {
 			/*
@@ -1328,7 +1328,7 @@ static int unmap_and_move_huge_page(new_page_t get_new_page,
 			ttu |= TTU_RMAP_LOCKED;
 		}
 
-		try_to_unmap(hpage, ttu);
+		try_to_migrate(hpage, ttu);
 		page_was_mapped = 1;
 
 		if (mapping_locked)
@@ -2602,7 +2602,6 @@ static void migrate_vma_prepare(struct migrate_vma *migrate)
  */
 static void migrate_vma_unmap(struct migrate_vma *migrate)
 {
-	int flags = TTU_MIGRATION | TTU_IGNORE_MLOCK;
 	const unsigned long npages = migrate->npages;
 	const unsigned long start = migrate->start;
 	unsigned long addr, i, restore = 0;
@@ -2614,7 +2613,7 @@ static void migrate_vma_unmap(struct migrate_vma *migrate)
 			continue;
 
 		if (page_mapped(page)) {
-			try_to_unmap(page, flags);
+			try_to_migrate(page, 0);
 			if (page_mapped(page))
 				goto restore;
 		}
diff --git a/mm/rmap.c b/mm/rmap.c
index d9938a0f27e9..860d1c23ab48 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1411,14 +1411,8 @@ static bool try_to_unmap_one(struct page *page, struct vm_area_struct *vma,
 	if (flags & TTU_SYNC)
 		pvmw.flags = PVMW_SYNC;
 
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
@@ -1443,16 +1437,6 @@ static bool try_to_unmap_one(struct page *page, struct vm_area_struct *vma,
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
@@ -1514,46 +1498,6 @@ static bool try_to_unmap_one(struct page *page, struct vm_area_struct *vma,
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
@@ -1606,39 +1550,6 @@ static bool try_to_unmap_one(struct page *page, struct vm_area_struct *vma,
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
@@ -1766,6 +1677,277 @@ void try_to_unmap(struct page *page, enum ttu_flags flags)
 		.anon_lock = page_lock_anon_vma_read,
 	};
 
+	if (flags & TTU_RMAP_LOCKED)
+		rmap_walk_locked(page, &rwc);
+	else
+		rmap_walk(page, &rwc);
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
+	 * When racing against e.g. zap_pte_range() on another cpu,
+	 * in between its ptep_get_and_clear_full() and page_remove_rmap(),
+	 * try_to_migrate() may return before page_mapped() has become false,
+	 * if page table locking is skipped: use TTU_SYNC to wait for that.
+	 */
+	if (flags & TTU_SYNC)
+		pvmw.flags = PVMW_SYNC;
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
+	range.end = PageKsm(page) ?
+			address + PAGE_SIZE : vma_address_end(page, vma);
+	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma, vma->vm_mm,
+				address, range.end);
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
+void try_to_migrate(struct page *page, enum ttu_flags flags)
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
+	 * TTU_SPLIT_HUGE_PMD and TTU_SYNC flags.
+	 */
+	if (WARN_ON_ONCE(flags & ~(TTU_RMAP_LOCKED | TTU_SPLIT_HUGE_PMD |
+					TTU_SYNC)))
+		return;
+
 	/*
 	 * During exec, a temporary VMA is setup and later moved.
 	 * The VMA is moved under the anon_vma lock but not the
@@ -1774,8 +1956,7 @@ void try_to_unmap(struct page *page, enum ttu_flags flags)
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

