Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE7E82CA65
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jan 2024 08:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D56110E119;
	Sat, 13 Jan 2024 07:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E6D10E0F6
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jan 2024 07:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705130199; x=1736666199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mnov74aVUnZ/JsntlOzaB+N14p4KDWATuD5/BakBI78=;
 b=fh+Tr7kYW3u08zPlCKIpyndPyps2xEtQgF5Rywoe19g80QehkMuo/cDq
 c/yKD5935sKx2H1at9/YYO3tn+HsRWSIL4N9sUZqH5SR0gQUj4trdruIL
 1KjfvFZomGlT5Wde6tWm7Hw0upzEbpB9WUOJwV6mR4HSfjG7PlHkGAjLT
 zwV0GCYXm/QAnONxuQ7LMcj4ynO8zC6E2J51O3dwdyCY9Lfh4/vSrZM7h
 Vt0ckm7knLbNzJbD6B+haCBGEWgO9OiS8djyivAw3u10qyGD9hwK/dsA+
 EcZ0CtZp3PO7EYUWy1BTWPnWW/h+2DMn+FPsGatPVYtuhLohqex+Au7td g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6078117"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="6078117"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 23:16:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="783269487"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; d="scan'208";a="783269487"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 23:16:37 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v11 1/8] mm/gup: Introduce unpin_folio/unpin_folios helpers
Date: Fri, 12 Jan 2024 22:52:16 -0800
Message-Id: <20240113065223.1532987-2-vivek.kasireddy@intel.com>
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
index da5219b48d52..a0321adaefad 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1585,11 +1585,13 @@ static inline void put_page(struct page *page)
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
index 231711efa390..4d7bc4453819 100644
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
2.39.2

