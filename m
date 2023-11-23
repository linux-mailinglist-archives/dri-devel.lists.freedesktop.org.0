Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D20D7F58DA
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 08:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A7F10E6D4;
	Thu, 23 Nov 2023 07:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8481610E6CE
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 07:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700723308; x=1732259308;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dk8F7Q/oBhEAmsAwkSHXM8PeNKfeERmLQrUShteflOg=;
 b=IWz4Gk8jpI+xIL5f05SkMrexOUWhKJI+me0nDBNtxvQnU87YXI0NbUZA
 a6voikDokwCid8B+mFGBdlYswHE7kGyFR3p5eHqVxWAbEeBFihFnDfKhk
 jVqnB0nG+pZlXrLeTDdZkLp+K0XhqzPH4TyJkdNCEpmHYezpzbQdiIcpl
 RFZylAwfUdjONuoWaE4KFDVayz/FR8XIA0yBOe62sFEosyssGjITEVJ2v
 gRklw1laIWcQ9GGopV9/0h9bSpC+DM7bN5FHhZuIOMY7rBAUuINVbn5EX
 tw9U0KZdBfKkbVOGgPCFZvs8HESyRUrGs54m5l15q/G5DPnHoskeFSXM6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="382612342"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; d="scan'208";a="382612342"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 23:08:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="8757720"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 23:08:23 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v5 3/5] mm/gup: Introduce pin_user_pages_fd() for pinning
 shmem/hugetlbfs file pages (v5)
Date: Wed, 22 Nov 2023 22:44:41 -0800
Message-Id: <20231123064443.1035709-4-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231123064443.1035709-1-vivek.kasireddy@intel.com>
References: <20231123064443.1035709-1-vivek.kasireddy@intel.com>
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

v3: (David)
- Enclose the huge page allocation code with #ifdef CONFIG_HUGETLB_PAGE
  (Build error reported by kernel test robot <lkp@intel.com>)
- Don't forget memalloc_pin_restore() on non-migration related errors
- Improve the readability of the cleanup code associated with
  non-migration related errors
- Augment the comments by describing FOLL_LONGTERM like behavior
- Include the R-b tag from Jason

v4:
- Remove the local variable "page" and instead use 3 return statements
  in alloc_file_page() (David)
- Add the R-b tag from David

v5: (David)
- For hugetlb case, ensure that we only obtain head pages from the
  mapping by using __filemap_get_folio() instead of find_get_page_flags()
- Handle -EEXIST when two or more potential users try to simultaneously
  add a huge page to the mapping by forcing them to retry on failure

Cc: David Hildenbrand <david@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Hugh Dickins <hughd@google.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Junxiao Chang <junxiao.chang@intel.com>
Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com> (v2)
Reviewed-by: David Hildenbrand <david@redhat.com> (v3)
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/linux/mm.h |   2 +
 mm/gup.c           | 114 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 116 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 418d26608ece..1b675fa35059 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2472,6 +2472,8 @@ long get_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
 		    struct page **pages, unsigned int gup_flags);
 long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
 		    struct page **pages, unsigned int gup_flags);
+long pin_user_pages_fd(struct file *file, pgoff_t start,
+		       unsigned long nr_pages, struct page **pages);
 
 int get_user_pages_fast(unsigned long start, int nr_pages,
 			unsigned int gup_flags, struct page **pages);
diff --git a/mm/gup.c b/mm/gup.c
index 231711efa390..ab1056b3e75b 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -3410,3 +3410,117 @@ long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
 				     &locked, gup_flags);
 }
 EXPORT_SYMBOL(pin_user_pages_unlocked);
+
+static struct page *alloc_file_page(struct file *file, pgoff_t idx)
+{
+#ifdef CONFIG_HUGETLB_PAGE
+	struct folio *folio;
+	int err;
+
+	if (is_file_hugepages(file)) {
+		folio = alloc_hugetlb_folio_nodemask(hstate_file(file),
+						     NUMA_NO_NODE,
+						     NULL,
+						     GFP_USER);
+		if (folio && folio_try_get(folio)) {
+			err = hugetlb_add_to_page_cache(folio,
+							file->f_mapping,
+							idx);
+			if (err) {
+				folio_put(folio);
+				free_huge_folio(folio);
+				return ERR_PTR(err);
+			}
+			return &folio->page;
+		}
+		return ERR_PTR(-ENOMEM);
+	}
+#endif
+	return shmem_read_mapping_page(file->f_mapping, idx);
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
+ * or hugetlb. The pages are either found in the page cache or allocated if
+ * necessary. Once the pages are located, they are all pinned via FOLL_PIN.
+ * And, these pinned pages need to be released either using unpin_user_pages()
+ * or unpin_user_page().
+ *
+ * It must be noted that the pages may be pinned for an indefinite amount
+ * of time. And, in most cases, the duration of time they may stay pinned
+ * would be controlled by the userspace. This behavior is effectively the
+ * same as using FOLL_LONGTERM with other GUP APIs.
+ *
+ * Returns number of pages pinned. This would be equal to the number of
+ * pages requested. If no pages were pinned, it returns -errno.
+ */
+long pin_user_pages_fd(struct file *file, pgoff_t start,
+		       unsigned long nr_pages, struct page **pages)
+{
+	struct page *page;
+	struct folio *folio;
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
+retry:
+			folio = __filemap_get_folio(file->f_mapping,
+						    start + i,
+						    FGP_ACCESSED, 0);
+
+			page = IS_ERR(folio) ? NULL: &folio->page;
+			if (!page) {
+				page = alloc_file_page(file, start + i);
+				if (IS_ERR(page)) {
+					ret = PTR_ERR(page);
+					if (ret == -EEXIST)
+						goto retry;
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
+	memalloc_pin_restore(flags);
+	while (i-- > 0)
+		if (pages[i])
+			unpin_user_page(pages[i]);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(pin_user_pages_fd);
+
-- 
2.39.2

