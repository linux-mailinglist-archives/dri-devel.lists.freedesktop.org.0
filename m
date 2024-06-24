Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDF091431B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8C710E362;
	Mon, 24 Jun 2024 07:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N01H7iEL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164B510E360
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719212725; x=1750748725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ncdL0L8mJN53zm+PMLx7hY1Hn3m6ZNVipfI63CPcPB0=;
 b=N01H7iELelx989St3KTP4bhVpzYv1mKE47xRo4gLL/T+urhH4+TXkGEc
 fH5V1MJBljVv+VJbREZ9F5A+M79gcBSwMmvVBIGcF8FHKAjzegMr3Jyw0
 /+hnI+thxEqTqgsEo0qQgjurCw2qjUHBo4xAYDHuEQvQCDPeo5l8ONFTX
 IvrwgM6IlP22VydxQgKo7fbt7TDi009Vw3u4dZArSqylBooMv+igRS8Kj
 FpKAxVu0mbQoAd6v/SNUhDB4YKbkHplSwBSrHLASPxdH61PwAzGSC/8uG
 8n2/UNnh+tmBWnvEmCn7KEtys46a1/yy93UieBxXHMedZ6aCFZ/oN1qqA w==;
X-CSE-ConnectionGUID: ad/0H1ZmTbaAaOZk6LHhKA==
X-CSE-MsgGUID: yCc4PoV6STSPb07TLYVxLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="16134938"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="16134938"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 00:05:24 -0700
X-CSE-ConnectionGUID: iWHG8+5/SZe4Yh0rlvYa6Q==
X-CSE-MsgGUID: abebW33HS8KZgNZTUwVY2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="73955859"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 00:05:24 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v16 1/9] mm/gup: Introduce unpin_folio/unpin_folios helpers
Date: Sun, 23 Jun 2024 23:36:09 -0700
Message-ID: <20240624063952.1572359-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240624063952.1572359-1-vivek.kasireddy@intel.com>
References: <20240624063952.1572359-1-vivek.kasireddy@intel.com>
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

We should probably sanity check the folio as part of unpin similar
to how it is done in unpin_user_page/unpin_user_pages but we cannot
cleanly do that at the moment without also checking the subpage.
Therefore, sanity checking needs to be added to these routines once
we have a way to determine if any given folio is anon-exclusive (via
a per folio AnonExclusive flag).

Cc: David Hildenbrand <david@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Peter Xu <peterx@redhat.com>
Suggested-by: David Hildenbrand <david@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Acked-by: Dave Airlie <airlied@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/linux/mm.h |  2 ++
 mm/gup.c           | 47 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index f1d3fd02e6a2..c0ee5f7978a0 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1594,11 +1594,13 @@ static inline void put_page(struct page *page)
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
index 6ff9f95a99a7..d9ea60621628 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -276,6 +276,19 @@ void unpin_user_page(struct page *page)
 }
 EXPORT_SYMBOL(unpin_user_page);
 
+/**
+ * unpin_folio() - release a dma-pinned folio
+ * @folio:         pointer to folio to be released
+ *
+ * Folios that were pinned via memfd_pin_folios() or other similar routines
+ * must be released either using unpin_folio() or unpin_folios().
+ */
+void unpin_folio(struct folio *folio)
+{
+	gup_put_folio(folio, 1, FOLL_PIN);
+}
+EXPORT_SYMBOL_GPL(unpin_folio);
+
 /**
  * folio_add_pin - Try to get an additional pin on a pinned folio
  * @folio: The folio to be pinned
@@ -488,6 +501,40 @@ void unpin_user_pages(struct page **pages, unsigned long npages)
 }
 EXPORT_SYMBOL(unpin_user_pages);
 
+/**
+ * unpin_folios() - release an array of gup-pinned folios.
+ * @folios:  array of folios to be marked dirty and released.
+ * @nfolios: number of folios in the @folios array.
+ *
+ * For each folio in the @folios array, release the folio using gup_put_folio.
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
+EXPORT_SYMBOL_GPL(unpin_folios);
+
 /*
  * Set the MMF_HAS_PINNED if not set yet; after set it'll be there for the mm's
  * lifecycle.  Avoid setting the bit unless necessary, or it might cause write
-- 
2.45.1

