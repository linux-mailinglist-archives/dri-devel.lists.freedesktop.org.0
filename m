Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8CB77F0ED
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 09:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2BDD10E1BB;
	Thu, 17 Aug 2023 07:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7814310E1B4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 07:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692256220; x=1723792220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JjzPYPUuROIA08YPCfDWkzc6f7ow2v3WRVW39hUB6/A=;
 b=SZ6oeVXPhc7JCQMgsmsZ7Sfa1GN1v9qVhw5hczAbtvjWpGGAS/bL9OqE
 DVChFS/xR5GSvyJKwoPj8uTaxsp0HuD9X9761mZj/e8qvv6glR3Z4jFKk
 k6X6FBu//3z3lD+XasBv/N6YmmYPJadGJfQVL5nXv455+4qP8qVV9C26F
 JrzUYjq1Yo3uqGLD4YNjAzoyDcadxMRhMdIBe65zxE+OWIgzOteGBcS/c
 JD1VLSVN9RUmlLToY5ryMRm/jodfm5rnZ+vP5zhA0Xrm7HBWEWtcr6sPr
 0PNg7568d8BK8quLH3QuqsMFT0vRuJ8PPBNK0H3HxQosBISnX7jZFZ5Ii g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="370200885"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="370200885"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 00:10:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="1065142182"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="1065142182"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 00:10:18 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v1 1/3] mm/gup: Export check_and_migrate_movable_pages()
Date: Wed, 16 Aug 2023 23:49:32 -0700
Message-Id: <20230817064934.3424431-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230817064934.3424431-1-vivek.kasireddy@intel.com>
References: <20230817064934.3424431-1-vivek.kasireddy@intel.com>
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, David Hildenbrand <david@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Junxiao Chang <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For drivers that would like to migrate pages out of the movable
zone (or CMA) in order to pin them (longterm) for DMA, using
check_and_migrate_movable_pages() directly provides a convenient
option instead of duplicating similar checks (e.g, checking
the folios for zone, hugetlb, etc) and calling migrate_pages()
directly.

Ideally, a driver is expected to call pin_user_pages(FOLL_LONGTERM)
to migrate and pin the pages for longterm DMA but there are
situations where the GUP APIs cannot be used directly for
various reasons (e.g, when the VMA or start addr cannot be
easily determined but the relevant pages are available).

Cc: David Hildenbrand <david@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Hugh Dickins <hughd@google.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Junxiao Chang <junxiao.chang@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/linux/mm.h | 2 ++
 mm/gup.c           | 9 +++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 406ab9ea818f..81871ffd3ff9 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1547,6 +1547,8 @@ void unpin_user_pages_dirty_lock(struct page **pages, unsigned long npages,
 void unpin_user_page_range_dirty_lock(struct page *page, unsigned long npages,
 				      bool make_dirty);
 void unpin_user_pages(struct page **pages, unsigned long npages);
+long check_and_migrate_movable_pages(unsigned long nr_pages,
+				     struct page **pages);
 
 static inline bool is_cow_mapping(vm_flags_t flags)
 {
diff --git a/mm/gup.c b/mm/gup.c
index 76d222ccc3ff..18beda89fcf3 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2141,8 +2141,8 @@ static int migrate_longterm_unpinnable_pages(
  * If everything is OK and all pages in the range are allowed to be pinned, then
  * this routine leaves all pages pinned and returns zero for success.
  */
-static long check_and_migrate_movable_pages(unsigned long nr_pages,
-					    struct page **pages)
+long check_and_migrate_movable_pages(unsigned long nr_pages,
+				     struct page **pages)
 {
 	unsigned long collected;
 	LIST_HEAD(movable_page_list);
@@ -2156,12 +2156,13 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 						pages);
 }
 #else
-static long check_and_migrate_movable_pages(unsigned long nr_pages,
-					    struct page **pages)
+long check_and_migrate_movable_pages(unsigned long nr_pages,
+				     struct page **pages)
 {
 	return 0;
 }
 #endif /* CONFIG_MIGRATION */
+EXPORT_SYMBOL(check_and_migrate_movable_pages);
 
 /*
  * __gup_longterm_locked() is a wrapper for __get_user_pages_locked which
-- 
2.39.2

