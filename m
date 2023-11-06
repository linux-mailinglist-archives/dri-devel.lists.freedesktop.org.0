Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E987E1A24
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 07:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D000B10E26F;
	Mon,  6 Nov 2023 06:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8803D10E26A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 06:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699251456; x=1730787456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LRgtqEGhnRjdv65luGGLdEpI5+g8BPuw2uD/fg3QljU=;
 b=fQnCSK9xjZSTPc6TYPqK0oReIpFHLJIPyvj7cekPST8TygpeHVlW3nOW
 m6o2Ar2j1KjsNLxKfb1ftCKaYaEQfD1yJQweKPNcWxUMLKoLuokgeVYWo
 tk796pdtbOtb4xrSHJ8IMbdBC2dNMFaeRaRa6BHObT0ZHWwUfYLBZfiCx
 /MCAxvR1jZMvwhpLUq6P/XD4j1JrDUULaES93WGn/xf+PFMc//uqzm9D7
 BhCXwFhqS4tfua1Ly4/042dlHBB1bff+B8GG9rPtphIjC530So91uf5EN
 klB84tlwwAh/UFnN+shrY21U8cBXGOVoOr+1/txF8k5+PSmZfpnPjIXyQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="393113916"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; d="scan'208";a="393113916"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 22:17:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="797213047"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; d="scan'208";a="797213047"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.7])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 22:17:35 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v2 1/3] mm/gup: Introduce pin_user_pages_fd() for pinning
 shmem/hugetlbfs file pages (v2)
Date: Sun,  5 Nov 2023 22:15:39 -0800
Message-Id: <20231106061541.507116-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106061541.507116-1-vivek.kasireddy@intel.com>
References: <20231106061541.507116-1-vivek.kasireddy@intel.com>
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

For drivers that would like to longterm-pin the pages associated
with a file, the pin_user_pages_fd() API provides an option to
not only pin the pages via FOLL_PIN but also to check and migrate
them if they reside in movable zone or CMA block. This API
currently works with files that belong to either shmem or hugetlbfs.
Files belonging to other filesystems are rejected for now.

The pages need to be located first before pinning them via FOLL_PIN.
If they are found in the page cache, they can be immediately pinned.
Otherwise, they need to be allocated using the filesystem specific
APIs and then pinned.

v2:
- Drop gup_flags and improve comments and commit message (David)
- Allocate a page if we cannot find in page cache for the hugetlbfs
  case as well (David)
- Don't unpin pages if there is a migration related failure (David)
- Drop the unnecessary nr_pages <= 0 check (Jason)
- Have the caller of the API pass in file * instead of fd (Jason)

Cc: David Hildenbrand <david@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Hugh Dickins <hughd@google.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Junxiao Chang <junxiao.chang@intel.com>
Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/linux/mm.h |  2 +
 mm/gup.c           | 99 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bf5d0b1b16f4..f6cc17b14653 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2457,6 +2457,8 @@ long get_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
 		    struct page **pages, unsigned int gup_flags);
 long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
 		    struct page **pages, unsigned int gup_flags);
+long pin_user_pages_fd(struct file *file, pgoff_t start,
+		       unsigned long nr_pages, struct page **pages);
 
 int get_user_pages_fast(unsigned long start, int nr_pages,
 			unsigned int gup_flags, struct page **pages);
diff --git a/mm/gup.c b/mm/gup.c
index 2f8a2d89fde1..d30b9dfebbb6 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -3400,3 +3400,102 @@ long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
 				     &locked, gup_flags);
 }
 EXPORT_SYMBOL(pin_user_pages_unlocked);
+
+static struct page *alloc_file_page(struct file *file, pgoff_t idx)
+{
+	struct page *page = ERR_PTR(-ENOMEM);
+	struct folio *folio;
+	int err;
+
+	if (shmem_file(file))
+		return shmem_read_mapping_page(file->f_mapping, idx);
+
+	folio = alloc_hugetlb_folio_nodemask(hstate_file(file),
+					     NUMA_NO_NODE,
+					     NULL,
+					     GFP_USER);
+	if (folio && folio_try_get(folio)) {
+		page = &folio->page;
+		err = hugetlb_add_to_page_cache(folio, file->f_mapping, idx);
+		if (err) {
+			folio_put(folio);
+			free_huge_folio(folio);
+			page = ERR_PTR(err);
+		}
+	}
+
+	return page;
+}
+
+/**
+ * pin_user_pages_fd() - pin user pages associated with a file
+ * @file:       the file whose pages are to be pinned
+ * @start:      starting file offset
+ * @nr_pages:   number of pages from start to pin
+ * @pages:      array that receives pointers to the pages pinned.
+ *              Should be at-least nr_pages long.
+ *
+ * Attempt to pin pages associated with a file that belongs to either shmem
+ * or hugetlbfs. The pages are either found in the page cache or allocated
+ * if necessary. Once the pages are located, they are all pinned via FOLL_PIN.
+ * And, these pinned pages need to be released using unpin_user_pages() or
+ * unpin_user_page().
+ *
+ * Returns number of pages pinned. This would be equal to the number of
+ * pages requested. If no pages were pinned, it returns -errno.
+ */
+long pin_user_pages_fd(struct file *file, pgoff_t start,
+		       unsigned long nr_pages, struct page **pages)
+{
+	struct page *page;
+	unsigned int flags, i;
+	long ret;
+
+	if (start < 0)
+		return -EINVAL;
+
+	if (!file)
+	    return -EINVAL;
+
+	if (!shmem_file(file) && !is_file_hugepages(file))
+	    return -EINVAL;
+
+	flags = memalloc_pin_save();
+	do {
+		for (i = 0; i < nr_pages; i++) {
+			/*
+ 			 * In most cases, we should be able to find the page
+			 * in the page cache. If we cannot find it, we try to
+			 * allocate one and add it to the page cache.
+			 */
+			page = find_get_page_flags(file->f_mapping,
+						   start + i,
+						   FGP_ACCESSED);
+			if (!page) {
+				page = alloc_file_page(file, start + i);
+				if (IS_ERR(page)) {
+					ret = PTR_ERR(page);
+					goto err;
+				}
+			}
+			ret = try_grab_page(page, FOLL_PIN);
+			if (unlikely(ret))
+				goto err;
+
+			pages[i] = page;
+			put_page(pages[i]);
+		}
+
+		ret = check_and_migrate_movable_pages(nr_pages, pages);
+	} while (ret == -EAGAIN);
+
+	memalloc_pin_restore(flags);
+	return ret ? ret : nr_pages;
+err:
+	while (i > 0 && pages[--i])
+		unpin_user_page(pages[i]);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(pin_user_pages_fd);
+
-- 
2.39.2

