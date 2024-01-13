Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C47782CA67
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jan 2024 08:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB4110E142;
	Sat, 13 Jan 2024 07:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FF310E0D5
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jan 2024 07:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705130199; x=1736666199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O22F+haVAFNBQJcPOK3PWw+AnkziG39TSsVTrN+ZPik=;
 b=B/MnesznGzl2hMYQDv1BgwpNyeMYPzhcvUzOx8gg1nk3ujMSRMYaHrC2
 56FoxOBiRVS1P4euHqe8ppPGeakleCzYxfFUrYteGQnG1+x4OOvukTQ+w
 YgHiwgDpakzXPSc6O16FBHJeFj9n3/m4zP5oa8/WzkbWsU2/T4I8xHFRu
 508rY5PFFWLKSsARuuQ1IP5IyDUr7VlWziVA9vytD5OKr7WmkL7eHnbhp
 xI8A0lpGIR1HHn4DunHx3yzoLlFfd+Yu1FFFaoSBIhgEfHc82PWaVRYiB
 Wg0gyWt7SRlrilBvTO/AdbeM4C5rcdwLxfka8uq+/KeitHwGpJ5RCQeu9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6078122"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="6078122"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 23:16:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="783269491"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; d="scan'208";a="783269491"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 23:16:37 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v11 2/8] mm/gup: Introduce check_and_migrate_movable_folios()
Date: Fri, 12 Jan 2024 22:52:17 -0800
Message-Id: <20240113065223.1532987-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240113065223.1532987-1-vivek.kasireddy@intel.com>
References: <20240113065223.1532987-1-vivek.kasireddy@intel.com>
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
Cc: David Hildenbrand <david@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Peter Xu <peterx@redhat.com>,
 Christoph Hellwig <hch@infradead.org>, Matthew Wilcox <willy@infradead.org>,
 Jason Gunthorpe <jgg@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This helper is the folio equivalent of check_and_migrate_movable_pages().
Therefore, all the rules that apply to check_and_migrate_movable_pages()
also apply to this one as well. Currently, this helper is only used by
memfd_pin_folios().

This patch also includes changes to rename and convert the internal
functions collect_longterm_unpinnable_pages() and
migrate_longterm_unpinnable_pages() to work on folios. Since they
are also used by check_and_migrate_movable_pages(), a temporary
array is used to collect and share the folios with these functions.

Cc: David Hildenbrand <david@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Peter Xu <peterx@redhat.com>
Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 mm/gup.c | 129 +++++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 92 insertions(+), 37 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 4d7bc4453819..00b24a429ba8 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2097,20 +2097,24 @@ struct page *get_dump_page(unsigned long addr)
 
 #ifdef CONFIG_MIGRATION
 /*
- * Returns the number of collected pages. Return value is always >= 0.
+ * Returns the number of collected folios. Return value is always >= 0.
  */
-static unsigned long collect_longterm_unpinnable_pages(
-					struct list_head *movable_page_list,
-					unsigned long nr_pages,
+static unsigned long collect_longterm_unpinnable_folios(
+					struct list_head *movable_folio_list,
+					unsigned long nr_folios,
+					struct folio **folios,
 					struct page **pages)
 {
 	unsigned long i, collected = 0;
 	struct folio *prev_folio = NULL;
 	bool drain_allow = true;
+	struct folio *folio;
 
-	for (i = 0; i < nr_pages; i++) {
-		struct folio *folio = page_folio(pages[i]);
+	for (i = 0; i < nr_folios; i++) {
+		if (pages)
+			folios[i] = page_folio(pages[i]);
 
+		folio = folios[i];
 		if (folio == prev_folio)
 			continue;
 		prev_folio = folio;
@@ -2124,7 +2128,7 @@ static unsigned long collect_longterm_unpinnable_pages(
 			continue;
 
 		if (folio_test_hugetlb(folio)) {
-			isolate_hugetlb(folio, movable_page_list);
+			isolate_hugetlb(folio, movable_folio_list);
 			continue;
 		}
 
@@ -2136,7 +2140,7 @@ static unsigned long collect_longterm_unpinnable_pages(
 		if (!folio_isolate_lru(folio))
 			continue;
 
-		list_add_tail(&folio->lru, movable_page_list);
+		list_add_tail(&folio->lru, movable_folio_list);
 		node_stat_mod_folio(folio,
 				    NR_ISOLATED_ANON + folio_is_file_lru(folio),
 				    folio_nr_pages(folio));
@@ -2146,27 +2150,28 @@ static unsigned long collect_longterm_unpinnable_pages(
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
 
@@ -2179,23 +2184,23 @@ static int migrate_longterm_unpinnable_pages(
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
 		};
 
-		if (migrate_pages(movable_page_list, alloc_migration_target,
+		if (migrate_pages(movable_folio_list, alloc_migration_target,
 				  NULL, (unsigned long)&mtc, MIGRATE_SYNC,
 				  MR_LONGTERM_PIN, NULL)) {
 			ret = -ENOMEM;
@@ -2203,15 +2208,15 @@ static int migrate_longterm_unpinnable_pages(
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
+	for (i = 0; i < nr_folios; i++)
+		if (folios[i])
+			unpin_folio(folios[i]);
+	putback_movable_pages(movable_folio_list);
 
 	return ret;
 }
@@ -2235,16 +2240,60 @@ static int migrate_longterm_unpinnable_pages(
 static long check_and_migrate_movable_pages(unsigned long nr_pages,
 					    struct page **pages)
 {
+	unsigned long nr_folios = nr_pages;
 	unsigned long collected;
-	LIST_HEAD(movable_page_list);
+	LIST_HEAD(movable_folio_list);
+	struct folio **folios;
+	long ret;
 
-	collected = collect_longterm_unpinnable_pages(&movable_page_list,
-						nr_pages, pages);
+	folios = kmalloc_array(nr_folios, sizeof(*folios), GFP_KERNEL);
+	if (!folios)
+		return -ENOMEM;
+
+	collected = collect_longterm_unpinnable_folios(&movable_folio_list,
+						       nr_folios, folios,
+						       pages);
+	if (!collected) {
+		kfree(folios);
+		return 0;
+	}
+
+	ret = migrate_longterm_unpinnable_folios(&movable_folio_list,
+						 nr_folios, folios);
+	kfree(folios);
+	return ret;
+}
+
+/*
+ * Check whether all folios are *allowed* to be pinned. Rather confusingly, all
+ * folios in the range are required to be pinned via FOLL_PIN, before calling
+ * this routine.
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
+						       nr_folios, folios,
+						       NULL);
 	if (!collected)
 		return 0;
 
-	return migrate_longterm_unpinnable_pages(&movable_page_list, nr_pages,
-						pages);
+	return migrate_longterm_unpinnable_folios(&movable_folio_list,
+						  nr_folios, folios);
 }
 #else
 static long check_and_migrate_movable_pages(unsigned long nr_pages,
@@ -2252,6 +2301,12 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
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
2.39.2

