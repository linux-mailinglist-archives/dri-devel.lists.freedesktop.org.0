Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BD3898289
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 09:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3C81131C3;
	Thu,  4 Apr 2024 07:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZhZ/I8VP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39A01131C6
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 07:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712217268; x=1743753268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9qpUkYyGQ6L0Mu+KSteX8nLnFmHei1juZzZ9jluV9vI=;
 b=ZhZ/I8VP0ZqoK7OxGpnoEfjPZEA/lWw/P83zXdxqhRmvbGDmxdEHtpoQ
 OU8NtGOXzjxEcHKEj5okeaj2haA5qhcCyRYS17wMFMbAhDNrvHnnZH1aZ
 YM8RjFMeQXi5bPsZu9Of9+q40K0UqMzIxDSpkG4bPZiq4MPL9CnJEErcV
 GqQ30zpdd8mYriV6mwhFIMR2K3/Pjmz29M63pWosxyuq3DGpM/BPPT+PM
 uXsoJaWBBv8GlQRTSyHOg0aJEk72bHNmVnXQ8bA8QoA0no6SnLuNjWfeP
 6SIW6Zm2qtK8hxkskMSeWqdOBbKeYgNzMlJ/Dv+RnLa3NJdVTm7RslA99 g==;
X-CSE-ConnectionGUID: PzBDDjSvQp+LmPQNQ9BNSA==
X-CSE-MsgGUID: GFOVY/5CQTWyVpg9nXbzxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="10450781"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="10450781"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 00:54:27 -0700
X-CSE-ConnectionGUID: 4trDXvagRGyRG4Ql3bqG2Q==
X-CSE-MsgGUID: yv8NIvqbSyySHFMUE5nu2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="19298759"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 00:54:27 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH v13 2/8] mm/gup: Introduce check_and_migrate_movable_folios()
Date: Thu,  4 Apr 2024 00:26:09 -0700
Message-ID: <20240404073053.3073706-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240404073053.3073706-1-vivek.kasireddy@intel.com>
References: <20240404073053.3073706-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This helper is the folio equivalent of check_and_migrate_movable_pages().
Therefore, all the rules that apply to check_and_migrate_movable_pages()
also apply to this one as well. Currently, this helper is only used by
memfd_pin_folios().

This patch also includes changes to rename and convert the internal
functions collect_longterm_unpinnable_pages() and
migrate_longterm_unpinnable_pages() to work on folios. As a result,
check_and_migrate_movable_pages() is now a wrapper around
check_and_migrate_movable_folios().

Cc: David Hildenbrand <david@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Peter Xu <peterx@redhat.com>
Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 mm/gup.c | 122 ++++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 81 insertions(+), 41 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 9cf2adfa4ce5..00ee3b987307 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2416,19 +2416,19 @@ struct page *get_dump_page(unsigned long addr)
 
 #ifdef CONFIG_MIGRATION
 /*
- * Returns the number of collected pages. Return value is always >= 0.
+ * Returns the number of collected folios. Return value is always >= 0.
  */
-static unsigned long collect_longterm_unpinnable_pages(
-					struct list_head *movable_page_list,
-					unsigned long nr_pages,
-					struct page **pages)
+static unsigned long collect_longterm_unpinnable_folios(
+					struct list_head *movable_folio_list,
+					unsigned long nr_folios,
+					struct folio **folios)
 {
 	unsigned long i, collected = 0;
 	struct folio *prev_folio = NULL;
 	bool drain_allow = true;
 
-	for (i = 0; i < nr_pages; i++) {
-		struct folio *folio = page_folio(pages[i]);
+	for (i = 0; i < nr_folios; i++) {
+		struct folio *folio = folios[i];
 
 		if (folio == prev_folio)
 			continue;
@@ -2443,7 +2443,7 @@ static unsigned long collect_longterm_unpinnable_pages(
 			continue;
 
 		if (folio_test_hugetlb(folio)) {
-			isolate_hugetlb(folio, movable_page_list);
+			isolate_hugetlb(folio, movable_folio_list);
 			continue;
 		}
 
@@ -2455,7 +2455,7 @@ static unsigned long collect_longterm_unpinnable_pages(
 		if (!folio_isolate_lru(folio))
 			continue;
 
-		list_add_tail(&folio->lru, movable_page_list);
+		list_add_tail(&folio->lru, movable_folio_list);
 		node_stat_mod_folio(folio,
 				    NR_ISOLATED_ANON + folio_is_file_lru(folio),
 				    folio_nr_pages(folio));
@@ -2465,27 +2465,28 @@ static unsigned long collect_longterm_unpinnable_pages(
 }
 
 /*
- * Unpins all pages and migrates device coherent pages and movable_page_list.
- * Returns -EAGAIN if all pages were successfully migrated or -errno for failure
- * (or partial success).
+ * Unpins all folios and migrates device coherent folios and movable_folio_list.
+ * Returns -EAGAIN if all folios were successfully migrated or -errno for
+ * failure (or partial success).
  */
-static int migrate_longterm_unpinnable_pages(
-					struct list_head *movable_page_list,
-					unsigned long nr_pages,
-					struct page **pages)
+static int migrate_longterm_unpinnable_folios(
+					struct list_head *movable_folio_list,
+					unsigned long nr_folios,
+					struct folio **folios)
 {
 	int ret;
 	unsigned long i;
 
-	for (i = 0; i < nr_pages; i++) {
-		struct folio *folio = page_folio(pages[i]);
+	for (i = 0; i < nr_folios; i++) {
+		struct folio *folio = folios[i];
 
 		if (folio_is_device_coherent(folio)) {
 			/*
-			 * Migration will fail if the page is pinned, so convert
-			 * the pin on the source page to a normal reference.
+			 * Migration will fail if the folio is pinned, so
+			 * convert the pin on the source folio to a normal
+			 * reference.
 			 */
-			pages[i] = NULL;
+			folios[i] = NULL;
 			folio_get(folio);
 			gup_put_folio(folio, 1, FOLL_PIN);
 
@@ -2498,24 +2499,24 @@ static int migrate_longterm_unpinnable_pages(
 		}
 
 		/*
-		 * We can't migrate pages with unexpected references, so drop
+		 * We can't migrate folios with unexpected references, so drop
 		 * the reference obtained by __get_user_pages_locked().
-		 * Migrating pages have been added to movable_page_list after
+		 * Migrating folios have been added to movable_folio_list after
 		 * calling folio_isolate_lru() which takes a reference so the
-		 * page won't be freed if it's migrating.
+		 * folio won't be freed if it's migrating.
 		 */
-		unpin_user_page(pages[i]);
-		pages[i] = NULL;
+		unpin_folio(folios[i]);
+		folios[i] = NULL;
 	}
 
-	if (!list_empty(movable_page_list)) {
+	if (!list_empty(movable_folio_list)) {
 		struct migration_target_control mtc = {
 			.nid = NUMA_NO_NODE,
 			.gfp_mask = GFP_USER | __GFP_NOWARN,
 			.reason = MR_LONGTERM_PIN,
 		};
 
-		if (migrate_pages(movable_page_list, alloc_migration_target,
+		if (migrate_pages(movable_folio_list, alloc_migration_target,
 				  NULL, (unsigned long)&mtc, MIGRATE_SYNC,
 				  MR_LONGTERM_PIN, NULL)) {
 			ret = -ENOMEM;
@@ -2523,19 +2524,48 @@ static int migrate_longterm_unpinnable_pages(
 		}
 	}
 
-	putback_movable_pages(movable_page_list);
+	putback_movable_pages(movable_folio_list);
 
 	return -EAGAIN;
 
 err:
-	for (i = 0; i < nr_pages; i++)
-		if (pages[i])
-			unpin_user_page(pages[i]);
-	putback_movable_pages(movable_page_list);
+	unpin_folios(folios, nr_folios);
+	putback_movable_pages(movable_folio_list);
 
 	return ret;
 }
 
+/*
+ * Check whether all folios are *allowed* to be pinned indefinitely (longterm).
+ * Rather confusingly, all folios in the range are required to be pinned via
+ * FOLL_PIN, before calling this routine.
+ *
+ * If any folios in the range are not allowed to be pinned, then this routine
+ * will migrate those folios away, unpin all the folios in the range and return
+ * -EAGAIN. The caller should re-pin the entire range with FOLL_PIN and then
+ * call this routine again.
+ *
+ * If an error other than -EAGAIN occurs, this indicates a migration failure.
+ * The caller should give up, and propagate the error back up the call stack.
+ *
+ * If everything is OK and all folios in the range are allowed to be pinned,
+ * then this routine leaves all folios pinned and returns zero for success.
+ */
+static long check_and_migrate_movable_folios(unsigned long nr_folios,
+					     struct folio **folios)
+{
+	unsigned long collected;
+	LIST_HEAD(movable_folio_list);
+
+	collected = collect_longterm_unpinnable_folios(&movable_folio_list,
+						       nr_folios, folios);
+	if (!collected)
+		return 0;
+
+	return migrate_longterm_unpinnable_folios(&movable_folio_list,
+						  nr_folios, folios);
+}
+
 /*
  * Check whether all pages are *allowed* to be pinned. Rather confusingly, all
  * pages in the range are required to be pinned via FOLL_PIN, before calling
@@ -2555,16 +2585,20 @@ static int migrate_longterm_unpinnable_pages(
 static long check_and_migrate_movable_pages(unsigned long nr_pages,
 					    struct page **pages)
 {
-	unsigned long collected;
-	LIST_HEAD(movable_page_list);
+	struct folio **folios;
+	long i, ret;
 
-	collected = collect_longterm_unpinnable_pages(&movable_page_list,
-						nr_pages, pages);
-	if (!collected)
-		return 0;
+	folios = kmalloc_array(nr_pages, sizeof(*folios), GFP_KERNEL);
+	if (!folios)
+		return -ENOMEM;
 
-	return migrate_longterm_unpinnable_pages(&movable_page_list, nr_pages,
-						pages);
+	for (i = 0; i < nr_pages; i++)
+		folios[i] = page_folio(pages[i]);
+
+	ret = check_and_migrate_movable_folios(nr_pages, folios);
+
+	kfree(folios);
+	return ret;
 }
 #else
 static long check_and_migrate_movable_pages(unsigned long nr_pages,
@@ -2572,6 +2606,12 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 {
 	return 0;
 }
+
+static long check_and_migrate_movable_folios(unsigned long nr_folios,
+					     struct folio **folios)
+{
+	return 0;
+}
 #endif /* CONFIG_MIGRATION */
 
 /*
-- 
2.43.0

