Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC1D5EDC31
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 14:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E647210E49F;
	Wed, 28 Sep 2022 12:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1DAB10E488;
 Wed, 28 Sep 2022 12:02:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKZtDse83kzXKxROuyCVMfS3lk+TmrCb/+dBmk0U6aQUbn7ZqxbKdjTpYRQCqTJw70MHFkFPcIGgjSs/XdN8JVxI72ALAh20TpPL85ltmR3Q8L2ZoNyz4A7ZPFMaxf+tnl+KWEgoNbxKBFJOlpZdLXYtjK/Ck/Gg0k0XlRKi/bGjQmyPjDtY2ifZE0OfxlHD5ZnsglHdO8Fgf0CATZzkkwGnmgioA/C5WkkxqpZ4Dl9/kUnLmz2zEWNjD6ip3xIrFP13ao+aGy10IO+FXRcToWof7XMm3s1xU49Z/qFM9p1Jd62AsW6yUpAK6JrzyDUwdfBHW4QVvq1NAwbUgWZ/kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ief9eruoW4PaeSi1pjMuUgPTPH5kc5KOb/oQ3J3KlkI=;
 b=kRTarwt6OSETGZK8NzJGbtEt/mRgUdRkMDV3vW8TTMtgSLQB1XTpcXEpkI9KKHYXGJDgZhjt2pWlMt2HjQdPIuQYWomjSwGxMX+Mx4wB5fuVYKSyMQmtL3Gj2MLnTARuFFbD5E4bbhhjZ8rRfKf0mYcpEBZXR0S/EvgmFQH0F6ls6num+Ipm3rgpJDw0/92rJNgXb10P+0gWoAF5qNidPfN8Gd+AV7HLFUtTGO8nCZ2jBU9RdgCdTbgA0ja2io108Yi3eDkBIsjxiiT+4tT0U60ULs2pIbZW+am2D0zaXSh+GPET8wlh1K9C2QEcUBC4LIMYWqpwj1lnhGRFSVQC/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ief9eruoW4PaeSi1pjMuUgPTPH5kc5KOb/oQ3J3KlkI=;
 b=ovAB/8gt4CeRVFox9S/8k1EWHb0qLua/UwSOTBVkQaPyWJ0XzLNyUZ5Uy64OaR3j8hNbM1QkTnvReYepVKt10FCCQ920PWzDCuHZbwaR1U5dJDajOu2baUvxKL/UAS2Yl0lPSwHFl0qDhulDl85deph9UeQsYnXP/dtLc0boLaCtG4FkU6LOJn7wP0qDXCecN4lfcxzDXMY06I4j1XPiex8XmX463hWHbkWQTiFLit0NZw+njGpsxtvtEH5pUgSu+PXjd4eHCUy8D0ickbJhemc5pGlJK4ZdfGs8Le/F1F7N4PLAWA9n5I3EbP3cgq6+1x6X33gi5LirMktkjv5sQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by DM6PR12MB4337.namprd12.prod.outlook.com (2603:10b6:5:2a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 12:02:05 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936%5]) with mapi id 15.20.5654.026; Wed, 28 Sep 2022
 12:02:04 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Subject: [PATCH v2 4/8] mm/migrate_device.c: Refactor migrate_vma and
 migrate_deivce_coherent_page()
Date: Wed, 28 Sep 2022 22:01:18 +1000
Message-Id: <c7b2ff84e9b33d022cf4a40f87d051f281a16d8f.1664366292.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com>
References: <cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYCP282CA0004.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:80::16) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|DM6PR12MB4337:EE_
X-MS-Office365-Filtering-Correlation-Id: 5db009e4-50fa-4842-fc1b-08daa149425d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6bHyFhJuTYdjplcig/FgtJsbsj+q8c1DEbmssZ+wbS68yKFbAUL41+TtK0Bz54yBxjwSguHoOj/owQOX3/p4rzTBC+SVKItWBLcxfB8snv9eNqvRCWHnZIyFeZY0vM6xaIblPC9QYxHldpIXwYPvbpeJj+kKaol9czr/N7dXa9FR6kFmKYw6YVTM7KnZv2I1Sfs3AOU7soA2JyO6k66mQZFUuvsGiA8zqbd94S/RG9zAShslPodG2H2OdzsnfOWLuMfFB5zHuzu03Iry0O2LkPhqVpJAkVlgqucQYHP/rgMo4CEw1Mg4hH/ieGCiqgMNuQ71MvkhwN5rTo5vQVbE92sPON0HauIBAJC7wjqD0Bw8qqadJT2/GCRQlZASEHw9Lc0NtJ2HehxPCAudIdiaCwLh3b26GoV/AEiCKYChJ00wKMRhnLr3v1ia15QzpGlf16cmsTJv62EfwDDd9yhicbhyRqJnSaYCy435KVl4FdXjR+TdkNSVBINrLbI49ljtszJzPnQxTPeMyOLXNY79gRexVFfBwpzPrRVt2NV3tK2Kb61XDOQktSYGBjJaSAeBigrKbIPBxTQippU0ruYyYia9au9AUcKPjkDJhzIfz/aGpwHhuwVSmDX5v/8CVQ0GfmL6KsahwmlYQaVYBkRhuhgLRmLclPW5ZJQh4NChVGIxSmLMIFHHWHDLNlRQqXX7NCl5+3HwA4merzbAyToDmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199015)(86362001)(36756003)(2906002)(2616005)(6506007)(107886003)(7416002)(6666004)(30864003)(6512007)(26005)(38100700002)(83380400001)(54906003)(316002)(186003)(8936002)(5660300002)(4326008)(66556008)(8676002)(66946007)(66476007)(6486002)(478600001)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NCRpf0NEkcAh3Zq1BKy4DZb573pfUYbTbVxcHQqQT0MXVOuL01YncslDb7cu?=
 =?us-ascii?Q?PAUJqBPqKyzEAWXRNfWMSpjWtu2R7mKmC3gYa7xGQsJrdc5vNGCQyVy/t5rH?=
 =?us-ascii?Q?2i127z05HbsVJz8q6ub6dyuJbTpHUWDRLFuaPGg9B8cn0pA3FH4AZeoqoLq/?=
 =?us-ascii?Q?fTSMJcq3qG+tc3f/GalKN88MFLpNMweBEhX7+NTFiK2ckrOWQ8D9ZLznL+it?=
 =?us-ascii?Q?N41K2DgfUh0Z4Jkss9eqYaMFuCixYBVqu1IUsu2gKZX3jBj9bqsRgy0XszX/?=
 =?us-ascii?Q?mODQbrhH/6/ld6YuDvr0CKFdRb9uqev4HdYgokW3hPmvgnIV10dNizAVqwSH?=
 =?us-ascii?Q?fA3xY7UPnnjnYAMT+8c6clfCM7xoh+NHAnbpGlhD8alTUlF7tddO/bq9TY0v?=
 =?us-ascii?Q?lwMGGUTUgG1NuiCf+cb/aWpBvEYW4nGhb1VFAGfI52adOqb/ac2OYgSR4C2J?=
 =?us-ascii?Q?Z/3Xij0OiVPpD8w5h3j1J+8w5b2OUly+UG1FlopRfmcDL6JHMG9A/TdD2hOv?=
 =?us-ascii?Q?BLCiUZ0GhihcZDHMxvsmIENTY1hcoCuVHoQAtA48LGqbOW0PoE/FYy8N6oqT?=
 =?us-ascii?Q?sz8SvSndktPuOsIFxbRP31OS602qinD2miPIBupVASrH4iNg58q3eKOsLVwb?=
 =?us-ascii?Q?wq3eqAMjYOlxEqBFLrPVynGA19ISJ6oXZV0KQoV0PeHVVWx83PLI5iO+pjJh?=
 =?us-ascii?Q?7VVlLoInmmx9WGZKFLXeVnX9weXVyghQkAQvRd+bsSxYtVp6EwCqpCrWwNoC?=
 =?us-ascii?Q?SxWyrMkCrW87fCdk1gLtsVKQLBID9inftW+3bFOhxjEiF18Xum45jyW9QaMH?=
 =?us-ascii?Q?n+FEZa4xMmjibHU3o+znmnhxsw+J3zOfyehMmN7QgsDPuXmmCm95NwmJimN1?=
 =?us-ascii?Q?UtlwpqoUxRrmoKnVoJVNu94wfYVW3I/Ou17eBOTkdYWe5XCB8rxl56LUdXXY?=
 =?us-ascii?Q?kODS64VIbBqdmaAUPlOD+a2mXp5HvV0YUMB+yOUr1LD/T9Kkt4kbXSy9llLV?=
 =?us-ascii?Q?s2NN+h6GdIG8yA/dK2pQtFU6u/6WbHGt4trl/AMR6o93+bINg/B6PIiW7Q3X?=
 =?us-ascii?Q?6z6XlesinSBs3yVyG78Bbo/tbhzyAe8a7bYpUFIq+EQldQJDOe8/zB259+BE?=
 =?us-ascii?Q?6CrYbJF+QpkVnG6T5r+J5x6DdsTLYz1eV2PAelAE4H9K+aWFOfL+yJm3WiR4?=
 =?us-ascii?Q?zs8fU16AC7q67DHbU+C3/bsSIz0GADoz1J/S0I+r1KySzIfeh9QfAHXwy3zG?=
 =?us-ascii?Q?EBchUx8+X21KpoBGz+6ldsJxCs11DPuJzEcMPZ8OZ1y69NPQBUe/xFXb0Vf4?=
 =?us-ascii?Q?QYc71JnrmTxxm/6oWIaUi83+NfeCsH+cf5c89xZPWzbktOMtD6tV9XsmclO7?=
 =?us-ascii?Q?8JctBIKWsOmm7IE/n+iseQSCpsopL9htOOO+okUBOBGglUluFEqYqkE2ltQa?=
 =?us-ascii?Q?Ku6ZsFNfeuHp2QJO/vYY07eSBVzQ5fyRVQqYVQD2Qe43Bwp8IQVxNS/I1t+5?=
 =?us-ascii?Q?c2gly3Mj/3RjoZIb4VU9WyDfnjjDjstGLLgz/+EfEhuQro4+uIQBhKGaDG/o?=
 =?us-ascii?Q?aH8UYof+eWoZhzMHnmCSCSst+fUfjLH9fpx/DbiX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db009e4-50fa-4842-fc1b-08daa149425d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 12:02:04.7455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RadTLMLcz6FKpgo8s4o9hOeihUg5OvwAnyP8pPm2Cl2ePx7TMfQ0FsJs3LUlVmYv6lkiW06RJUuFQZgBX1WuHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4337
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Matthew Wilcox <willy@infradead.org>,
 John Hubbard <jhubbard@nvidia.com>, David Hildenbrand <david@redhat.com>,
 nouveau@lists.freedesktop.org, Yang Shi <shy828301@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Zi Yan <ziy@nvidia.com>, "Huang, Ying" <ying.huang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

migrate_device_coherent_page() reuses the existing migrate_vma family of
functions to migrate a specific page without providing a valid mapping
or vma. This looks a bit odd because it means we are calling
migrate_vma_*() without setting a valid vma, however it was considered
acceptable at the time because the details were internal to
migrate_device.c and there was only a single user.

One of the reasons the details could be kept internal was that this was
strictly for migrating device coherent memory. Such memory can be copied
directly by the CPU without intervention from a driver. However this
isn't true for device private memory, and a future change requires
similar functionality for device private memory. So refactor the code
into something more sensible for migrating device memory without a vma.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Cc: "Huang, Ying" <ying.huang@intel.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Yang Shi <shy828301@gmail.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
---
 mm/migrate_device.c | 150 +++++++++++++++++++++++++--------------------
 1 file changed, 85 insertions(+), 65 deletions(-)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index f756c00..ba479b5 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -345,26 +345,20 @@ static bool migrate_vma_check_page(struct page *page, struct page *fault_page)
 }
 
 /*
- * migrate_vma_unmap() - replace page mapping with special migration pte entry
- * @migrate: migrate struct containing all migration information
- *
- * Isolate pages from the LRU and replace mappings (CPU page table pte) with a
- * special migration pte entry and check if it has been pinned. Pinned pages are
- * restored because we cannot migrate them.
- *
- * This is the last step before we call the device driver callback to allocate
- * destination memory and copy contents of original page over to new page.
+ * Unmaps pages for migration. Returns number of unmapped pages.
  */
-static void migrate_vma_unmap(struct migrate_vma *migrate)
+static unsigned long migrate_device_unmap(unsigned long *src_pfns,
+					  unsigned long npages,
+					  struct page *fault_page)
 {
-	const unsigned long npages = migrate->npages;
 	unsigned long i, restore = 0;
 	bool allow_drain = true;
+	unsigned long unmapped = 0;
 
 	lru_add_drain();
 
 	for (i = 0; i < npages; i++) {
-		struct page *page = migrate_pfn_to_page(migrate->src[i]);
+		struct page *page = migrate_pfn_to_page(src_pfns[i]);
 		struct folio *folio;
 
 		if (!page)
@@ -379,8 +373,7 @@ static void migrate_vma_unmap(struct migrate_vma *migrate)
 			}
 
 			if (isolate_lru_page(page)) {
-				migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
-				migrate->cpages--;
+				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 				restore++;
 				continue;
 			}
@@ -394,34 +387,54 @@ static void migrate_vma_unmap(struct migrate_vma *migrate)
 			try_to_migrate(folio, 0);
 
 		if (page_mapped(page) ||
-		    !migrate_vma_check_page(page, migrate->fault_page)) {
+		    !migrate_vma_check_page(page, fault_page)) {
 			if (!is_zone_device_page(page)) {
 				get_page(page);
 				putback_lru_page(page);
 			}
 
-			migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
-			migrate->cpages--;
+			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 			restore++;
 			continue;
 		}
+
+		unmapped++;
 	}
 
 	for (i = 0; i < npages && restore; i++) {
-		struct page *page = migrate_pfn_to_page(migrate->src[i]);
+		struct page *page = migrate_pfn_to_page(src_pfns[i]);
 		struct folio *folio;
 
-		if (!page || (migrate->src[i] & MIGRATE_PFN_MIGRATE))
+		if (!page || (src_pfns[i] & MIGRATE_PFN_MIGRATE))
 			continue;
 
 		folio = page_folio(page);
 		remove_migration_ptes(folio, folio, false);
 
-		migrate->src[i] = 0;
+		src_pfns[i] = 0;
 		folio_unlock(folio);
 		folio_put(folio);
 		restore--;
 	}
+
+	return unmapped;
+}
+
+/*
+ * migrate_vma_unmap() - replace page mapping with special migration pte entry
+ * @migrate: migrate struct containing all migration information
+ *
+ * Isolate pages from the LRU and replace mappings (CPU page table pte) with a
+ * special migration pte entry and check if it has been pinned. Pinned pages are
+ * restored because we cannot migrate them.
+ *
+ * This is the last step before we call the device driver callback to allocate
+ * destination memory and copy contents of original page over to new page.
+ */
+static void migrate_vma_unmap(struct migrate_vma *migrate)
+{
+	migrate->cpages = migrate_device_unmap(migrate->src, migrate->npages,
+					migrate->fault_page);
 }
 
 /**
@@ -668,41 +681,36 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 	*src &= ~MIGRATE_PFN_MIGRATE;
 }
 
-/**
- * migrate_vma_pages() - migrate meta-data from src page to dst page
- * @migrate: migrate struct containing all migration information
- *
- * This migrates struct page meta-data from source struct page to destination
- * struct page. This effectively finishes the migration from source page to the
- * destination page.
- */
-void migrate_vma_pages(struct migrate_vma *migrate)
+static void migrate_device_pages(unsigned long *src_pfns,
+				unsigned long *dst_pfns, unsigned long npages,
+				struct migrate_vma *migrate)
 {
-	const unsigned long npages = migrate->npages;
-	const unsigned long start = migrate->start;
 	struct mmu_notifier_range range;
-	unsigned long addr, i;
+	unsigned long i;
 	bool notified = false;
 
-	for (i = 0, addr = start; i < npages; addr += PAGE_SIZE, i++) {
-		struct page *newpage = migrate_pfn_to_page(migrate->dst[i]);
-		struct page *page = migrate_pfn_to_page(migrate->src[i]);
+	for (i = 0; i < npages; i++) {
+		struct page *newpage = migrate_pfn_to_page(dst_pfns[i]);
+		struct page *page = migrate_pfn_to_page(src_pfns[i]);
 		struct address_space *mapping;
 		int r;
 
 		if (!newpage) {
-			migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
+			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 			continue;
 		}
 
 		if (!page) {
+			unsigned long addr;
+
 			/*
 			 * The only time there is no vma is when called from
 			 * migrate_device_coherent_page(). However this isn't
 			 * called if the page could not be unmapped.
 			 */
-			VM_BUG_ON(!migrate->vma);
-			if (!(migrate->src[i] & MIGRATE_PFN_MIGRATE))
+			VM_BUG_ON(!migrate);
+			addr = migrate->start + i*PAGE_SIZE;
+			if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE))
 				continue;
 			if (!notified) {
 				notified = true;
@@ -714,7 +722,7 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 				mmu_notifier_invalidate_range_start(&range);
 			}
 			migrate_vma_insert_page(migrate, addr, newpage,
-						&migrate->src[i]);
+						&src_pfns[i]);
 			continue;
 		}
 
@@ -727,18 +735,18 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 			 * device private or coherent memory.
 			 */
 			if (mapping) {
-				migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
+				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 				continue;
 			}
 		} else if (is_zone_device_page(newpage)) {
 			/*
 			 * Other types of ZONE_DEVICE page are not supported.
 			 */
-			migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
+			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 			continue;
 		}
 
-		if (migrate->fault_page == page)
+		if (migrate && migrate->fault_page == page)
 			r = migrate_folio_extra(mapping, page_folio(newpage),
 						page_folio(page),
 						MIGRATE_SYNC_NO_COPY, 1);
@@ -746,7 +754,7 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 			r = migrate_folio(mapping, page_folio(newpage),
 					page_folio(page), MIGRATE_SYNC_NO_COPY);
 		if (r != MIGRATEPAGE_SUCCESS)
-			migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
+			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 	}
 
 	/*
@@ -757,28 +765,30 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 	if (notified)
 		mmu_notifier_invalidate_range_only_end(&range);
 }
-EXPORT_SYMBOL(migrate_vma_pages);
 
 /**
- * migrate_vma_finalize() - restore CPU page table entry
+ * migrate_vma_pages() - migrate meta-data from src page to dst page
  * @migrate: migrate struct containing all migration information
  *
- * This replaces the special migration pte entry with either a mapping to the
- * new page if migration was successful for that page, or to the original page
- * otherwise.
- *
- * This also unlocks the pages and puts them back on the lru, or drops the extra
- * refcount, for device pages.
+ * This migrates struct page meta-data from source struct page to destination
+ * struct page. This effectively finishes the migration from source page to the
+ * destination page.
  */
-void migrate_vma_finalize(struct migrate_vma *migrate)
+void migrate_vma_pages(struct migrate_vma *migrate)
+{
+	migrate_device_pages(migrate->src, migrate->dst, migrate->npages, migrate);
+}
+EXPORT_SYMBOL(migrate_vma_pages);
+
+static void migrate_device_finalize(unsigned long *src_pfns,
+				unsigned long *dst_pfns, unsigned long npages)
 {
-	const unsigned long npages = migrate->npages;
 	unsigned long i;
 
 	for (i = 0; i < npages; i++) {
 		struct folio *dst, *src;
-		struct page *newpage = migrate_pfn_to_page(migrate->dst[i]);
-		struct page *page = migrate_pfn_to_page(migrate->src[i]);
+		struct page *newpage = migrate_pfn_to_page(dst_pfns[i]);
+		struct page *page = migrate_pfn_to_page(src_pfns[i]);
 
 		if (!page) {
 			if (newpage) {
@@ -788,7 +798,7 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
 			continue;
 		}
 
-		if (!(migrate->src[i] & MIGRATE_PFN_MIGRATE) || !newpage) {
+		if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE) || !newpage) {
 			if (newpage) {
 				unlock_page(newpage);
 				put_page(newpage);
@@ -815,6 +825,22 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
 		}
 	}
 }
+
+/**
+ * migrate_vma_finalize() - restore CPU page table entry
+ * @migrate: migrate struct containing all migration information
+ *
+ * This replaces the special migration pte entry with either a mapping to the
+ * new page if migration was successful for that page, or to the original page
+ * otherwise.
+ *
+ * This also unlocks the pages and puts them back on the lru, or drops the extra
+ * refcount, for device pages.
+ */
+void migrate_vma_finalize(struct migrate_vma *migrate)
+{
+	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
+}
 EXPORT_SYMBOL(migrate_vma_finalize);
 
 /*
@@ -825,25 +851,19 @@ EXPORT_SYMBOL(migrate_vma_finalize);
 int migrate_device_coherent_page(struct page *page)
 {
 	unsigned long src_pfn, dst_pfn = 0;
-	struct migrate_vma args;
 	struct page *dpage;
 
 	WARN_ON_ONCE(PageCompound(page));
 
 	lock_page(page);
 	src_pfn = migrate_pfn(page_to_pfn(page)) | MIGRATE_PFN_MIGRATE;
-	args.src = &src_pfn;
-	args.dst = &dst_pfn;
-	args.cpages = 1;
-	args.npages = 1;
-	args.vma = NULL;
 
 	/*
 	 * We don't have a VMA and don't need to walk the page tables to find
 	 * the source page. So call migrate_vma_unmap() directly to unmap the
 	 * page as migrate_vma_setup() will fail if args.vma == NULL.
 	 */
-	migrate_vma_unmap(&args);
+	migrate_device_unmap(&src_pfn, 1, NULL);
 	if (!(src_pfn & MIGRATE_PFN_MIGRATE))
 		return -EBUSY;
 
@@ -853,10 +873,10 @@ int migrate_device_coherent_page(struct page *page)
 		dst_pfn = migrate_pfn(page_to_pfn(dpage));
 	}
 
-	migrate_vma_pages(&args);
+	migrate_device_pages(&src_pfn, &dst_pfn, 1, NULL);
 	if (src_pfn & MIGRATE_PFN_MIGRATE)
 		copy_highpage(dpage, page);
-	migrate_vma_finalize(&args);
+	migrate_device_finalize(&src_pfn, &dst_pfn, 1);
 
 	if (src_pfn & MIGRATE_PFN_MIGRATE)
 		return 0;
-- 
git-series 0.9.1
