Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7578629AD
	for <lists+dri-devel@lfdr.de>; Sun, 25 Feb 2024 09:24:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0B410E310;
	Sun, 25 Feb 2024 08:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iiu5hg0m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B993710E2FD
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 08:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708849453; x=1740385453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lrj5AnfXRm1ue52z3xjuiLSu7Sue1rj/iVQQ5WFlJ/c=;
 b=Iiu5hg0mEW9vgqmFF6kauJFKMELZvRsH9GIvd/M0Xxdvv2a5b1lhYu/M
 Ngw83d2LASFbFXIgORbfsjYldOmB1N8dx/luYRzgmqRlZmL7UlRJU1rcI
 q1gQHJ25wkNwZWH2+vmY3rKquKz7DDgmAh9GEkE97BACoiIaKHy8XTkAD
 XeXGY5aNYQ1l8I1cNYacnR9TrnjYQ3m9XUy3Ks2uK9leYV7wQzSDTTSbz
 XH+0u4A4A9CXfE3h4HAoqgzsdID7/y37uzPnr0WNVzve3ChTR7aJhTIX7
 o8EX/hiH6baDKvoqaWL+Q31XP+TEaIZ1fAxHpm5a351QkPectp/HC3ri5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="2988348"
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="2988348"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2024 00:24:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="6783243"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2024 00:24:11 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH v12 1/8] mm/gup: Introduce unpin_folio/unpin_folios helpers
Date: Sat, 24 Feb 2024 23:56:57 -0800
Message-ID: <20240225080008.1019653-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240225080008.1019653-1-vivek.kasireddy@intel.com>
References: <20240225080008.1019653-1-vivek.kasireddy@intel.com>
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

These helpers are the folio versions of unpin_user_page/unpin_user_pages.
They are currently only useful for unpinning folios pinned by
memfd_pin_folios() or other associated routines. However, they could
find new uses in the future, when more and more folio-only helpers
are added to GUP.

Cc: David Hildenbrand <david@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Peter Xu <peterx@redhat.com>
Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/linux/mm.h |  2 ++
 mm/gup.c           | 81 ++++++++++++++++++++++++++++++++++++++++------
 2 files changed, 74 insertions(+), 9 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 6f4825d82965..36e4c2b22600 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1601,11 +1601,13 @@ static inline void put_page(struct page *page)
 #define GUP_PIN_COUNTING_BIAS (1U << 10)
 
 void unpin_user_page(struct page *page);
+void unpin_folio(struct folio *folio);
 void unpin_user_pages_dirty_lock(struct page **pages, unsigned long npages,
 				 bool make_dirty);
 void unpin_user_page_range_dirty_lock(struct page *page, unsigned long npages,
 				      bool make_dirty);
 void unpin_user_pages(struct page **pages, unsigned long npages);
+void unpin_folios(struct folio **folios, unsigned long nfolios);
 
 static inline bool is_cow_mapping(vm_flags_t flags)
 {
diff --git a/mm/gup.c b/mm/gup.c
index df83182ec72d..0a45eda6aaeb 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -30,6 +30,23 @@ struct follow_page_context {
 	unsigned int page_mask;
 };
 
+static inline void sanity_check_pinned_folios(struct folio **folios,
+					      unsigned long nfolios)
+{
+	if (!IS_ENABLED(CONFIG_DEBUG_VM))
+		return;
+
+	for (; nfolios; nfolios--, folios++) {
+		struct folio *folio = *folios;
+
+		if (is_zero_folio(folio) ||
+		    !folio_test_anon(folio))
+			continue;
+
+		VM_BUG_ON_FOLIO(!PageAnonExclusive(&folio->page), folio);
+	}
+}
+
 static inline void sanity_check_pinned_pages(struct page **pages,
 					     unsigned long npages)
 {
@@ -52,15 +69,11 @@ static inline void sanity_check_pinned_pages(struct page **pages,
 		struct page *page = *pages;
 		struct folio *folio = page_folio(page);
 
-		if (is_zero_page(page) ||
-		    !folio_test_anon(folio))
-			continue;
-		if (!folio_test_large(folio) || folio_test_hugetlb(folio))
-			VM_BUG_ON_PAGE(!PageAnonExclusive(&folio->page), page);
-		else
-			/* Either a PTE-mapped or a PMD-mapped THP. */
-			VM_BUG_ON_PAGE(!PageAnonExclusive(&folio->page) &&
-				       !PageAnonExclusive(page), page);
+		sanity_check_pinned_folios(&folio, 1);
+
+		/* Either a PTE-mapped or a PMD-mapped THP. */
+		if (folio_test_large(folio) && !folio_test_hugetlb(folio))
+			VM_BUG_ON_PAGE(!PageAnonExclusive(page), page);
 	}
 }
 
@@ -276,6 +289,21 @@ void unpin_user_page(struct page *page)
 }
 EXPORT_SYMBOL(unpin_user_page);
 
+/**
+ * unpin_folio() - release a dma-pinned folio
+ * @folio:         pointer to folio to be released
+ *
+ * Folios that were pinned via memfd_pin_folios() or other similar routines
+ * must be released either using unpin_folio() or unpin_folios(). This is so
+ * that such folios can be separately tracked and uniquely handled.
+ */
+void unpin_folio(struct folio *folio)
+{
+	sanity_check_pinned_folios(&folio, 1);
+	gup_put_folio(folio, 1, FOLL_PIN);
+}
+EXPORT_SYMBOL(unpin_folio);
+
 /**
  * folio_add_pin - Try to get an additional pin on a pinned folio
  * @folio: The folio to be pinned
@@ -488,6 +516,41 @@ void unpin_user_pages(struct page **pages, unsigned long npages)
 }
 EXPORT_SYMBOL(unpin_user_pages);
 
+/**
+ * unpin_folios() - release an array of gup-pinned folios.
+ * @folios:  array of folios to be marked dirty and released.
+ * @nfolios: number of folios in the @folios array.
+ *
+ * For each folio in the @folios array, release the folio using unpin_folio().
+ *
+ * Please see the unpin_folio() documentation for details.
+ */
+void unpin_folios(struct folio **folios, unsigned long nfolios)
+{
+	unsigned long i = 0, j;
+
+	/*
+	 * If this WARN_ON() fires, then the system *might* be leaking folios
+	 * (by leaving them pinned), but probably not. More likely, gup/pup
+	 * returned a hard -ERRNO error to the caller, who erroneously passed
+	 * it here.
+	 */
+	if (WARN_ON(IS_ERR_VALUE(nfolios)))
+		return;
+
+	sanity_check_pinned_folios(folios, nfolios);
+	while (i < nfolios) {
+		for (j = i + 1; j < nfolios; j++)
+			if (folios[i] != folios[j])
+				break;
+
+		if (folios[i])
+			gup_put_folio(folios[i], j - i, FOLL_PIN);
+		i = j;
+	}
+}
+EXPORT_SYMBOL(unpin_folios);
+
 /*
  * Set the MMF_HAS_PINNED if not set yet; after set it'll be there for the mm's
  * lifecycle.  Avoid setting the bit unless necessary, or it might cause write
-- 
2.43.0

