Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1A9804999
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 06:59:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2859710E21C;
	Tue,  5 Dec 2023 05:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BF210E0F2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 05:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701755932; x=1733291932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=USaDsXb+eUlaG8Jvcx/0BopeELbgynaKZTJfyFBFcCc=;
 b=SpNMGllaqUDw5kbrANyQKXQnRE3R0TMYP6/x4ctY+Z859NYx7a5KVREf
 0kdxmwHcyY3HecMwGMaZwu2LnKp4eD5M6EyhCpvm1hVd5UZsm7lHA6n0r
 XC08OyiE0Y7SA+/ZQwwhfcCXFW434VJ8sNI0uGbwij7rdzi0hKcUZL+zU
 EzAWOV9idE3BhgIgIO4y+Uc3Jd4nPyInvNqkQY9/5OxCVb1YHM6eVaDfg
 qB+R0I15LkseV4CG3Rtadsjc0urf3mjTb1LMCHwtlJC0s427vHKRwcLmc
 M5lxySRQJpyjt/lhVKHV6OjKGwhN5UVfZXGqZWXFKagk4Umt0g6zwyl6Q g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="906309"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="906309"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 21:58:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="888807730"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="888807730"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 21:58:50 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v6 3/5] mm/gup: Introduce memfd_pin_user_pages() for pinning
 memfd pages (v6)
Date: Mon,  4 Dec 2023 21:35:07 -0800
Message-Id: <20231205053509.2342169-4-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231205053509.2342169-1-vivek.kasireddy@intel.com>
References: <20231205053509.2342169-1-vivek.kasireddy@intel.com>
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
 Christoph Hellwig <hch@infradead.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Junxiao Chang <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For drivers that would like to longterm-pin the pages associated
with a memfd, the pin_user_pages_fd() API provides an option to
not only pin the pages via FOLL_PIN but also to check and migrate
them if they reside in movable zone or CMA block. This API
currently works with memfds but it should work with any files
that belong to either shmemfs or hugetlbfs. Files belonging to
other filesystems are rejected for now.

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

v6: (Christoph)
- Rename this API to memfd_pin_user_pages() to make it clear that it
  is intended for memfds
- Move the memfd page allocation helper from gup.c to memfd.c
- Fix indentation errors in memfd_pin_user_pages()
- For contiguous ranges of folios, use a helper such as
  filemap_get_folios_contig() to lookup the page cache in batches

Cc: David Hildenbrand <david@redhat.com>
Cc: Christoph Hellwig <hch@infradead.org>
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
 include/linux/memfd.h |   5 +++
 include/linux/mm.h    |   2 +
 mm/gup.c              | 102 ++++++++++++++++++++++++++++++++++++++++++
 mm/memfd.c            |  34 ++++++++++++++
 4 files changed, 143 insertions(+)

diff --git a/include/linux/memfd.h b/include/linux/memfd.h
index e7abf6fa4c52..6fc0d1282151 100644
--- a/include/linux/memfd.h
+++ b/include/linux/memfd.h
@@ -6,11 +6,16 @@
 
 #ifdef CONFIG_MEMFD_CREATE
 extern long memfd_fcntl(struct file *file, unsigned int cmd, unsigned int arg);
+extern struct page *memfd_alloc_page(struct file *memfd, pgoff_t idx);
 #else
 static inline long memfd_fcntl(struct file *f, unsigned int c, unsigned int a)
 {
 	return -EINVAL;
 }
+static inline struct page *memfd_alloc_page(struct file *memfd, pgoff_t idx)
+{
+	return ERR_PTR(-EINVAL);
+}
 #endif
 
 #endif /* __LINUX_MEMFD_H */
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 418d26608ece..ac69db45509f 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2472,6 +2472,8 @@ long get_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
 		    struct page **pages, unsigned int gup_flags);
 long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
 		    struct page **pages, unsigned int gup_flags);
+long memfd_pin_user_pages(struct file *file, pgoff_t start,
+			  unsigned long nr_pages, struct page **pages);
 
 int get_user_pages_fast(unsigned long start, int nr_pages,
 			unsigned int gup_flags, struct page **pages);
diff --git a/mm/gup.c b/mm/gup.c
index 231711efa390..eb93d1ec9dc6 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -5,6 +5,7 @@
 #include <linux/spinlock.h>
 
 #include <linux/mm.h>
+#include <linux/memfd.h>
 #include <linux/memremap.h>
 #include <linux/pagemap.h>
 #include <linux/rmap.h>
@@ -17,6 +18,7 @@
 #include <linux/hugetlb.h>
 #include <linux/migrate.h>
 #include <linux/mm_inline.h>
+#include <linux/pagevec.h>
 #include <linux/sched/mm.h>
 #include <linux/shmem_fs.h>
 
@@ -3410,3 +3412,103 @@ long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
 				     &locked, gup_flags);
 }
 EXPORT_SYMBOL(pin_user_pages_unlocked);
+
+/**
+ * memfd_pin_user_pages() - pin user pages associated with a memfd
+ * @memfd:      the memfd whose pages are to be pinned
+ * @start:      starting memfd offset
+ * @nr_pages:   number of pages from start to pin
+ * @pages:      array that receives pointers to the pages pinned.
+ *              Should be at-least nr_pages long.
+ *
+ * Attempt to pin pages associated with a memfd; given that a memfd is either
+ * backed by shmem or hugetlb, the pages can either be found in the page cache
+ * or need to be allocated if necessary. Once the pages are located, they are
+ * all pinned via FOLL_PIN. And, these pinned pages need to be released either
+ * using unpin_user_pages() or unpin_user_page().
+ *
+ * It must be noted that the pages may be pinned for an indefinite amount
+ * of time. And, in most cases, the duration of time they may stay pinned
+ * would be controlled by the userspace. This behavior is effectively the
+ * same as using FOLL_LONGTERM with other GUP APIs.
+ *
+ * Returns number of pages pinned. This would be equal to the number of
+ * pages requested. If no pages were pinned, it returns -errno.
+ */
+long memfd_pin_user_pages(struct file *memfd, pgoff_t start,
+			  unsigned long nr_pages, struct page **pages)
+{
+	pgoff_t start_idx, end_idx = start + nr_pages - 1;
+	unsigned int flags, nr_folios, i, j;
+	struct folio_batch fbatch;
+	struct page *page = NULL;
+	struct folio *folio;
+	long ret;
+
+	if (!nr_pages)
+		return -EINVAL;
+
+	if (!memfd)
+		return -EINVAL;
+
+	if (!shmem_file(memfd) && !is_file_hugepages(memfd))
+		return -EINVAL;
+
+	flags = memalloc_pin_save();
+	do {
+		folio_batch_init(&fbatch);
+		start_idx = start;
+		i = 0;
+
+		while (start_idx <= end_idx) {
+			/*
+			 * In most cases, we should be able to find the page
+			 * in the page cache. If we cannot find it for some
+			 * reason, we try to allocate one and add it to the
+			 * page cache.
+			 */
+			nr_folios = filemap_get_folios_contig(memfd->f_mapping,
+							      &start_idx,
+							      end_idx,
+							      &fbatch);
+			if (page) {
+				put_page(page);
+				page = NULL;
+			}
+			for (j = 0; j < nr_folios; j++) {
+				folio = fbatch.folios[j];
+				ret = try_grab_page(&folio->page, FOLL_PIN);
+				if (unlikely(ret)) {
+					folio_batch_release(&fbatch);
+					goto err;
+				}
+
+				pages[i++] = &folio->page;
+			}
+
+			folio_batch_release(&fbatch);
+			if (!nr_folios) {
+				page = memfd_alloc_page(memfd, start_idx);
+				if (IS_ERR(page)) {
+					ret = PTR_ERR(page);
+					if (ret != -EEXIST)
+						goto err;
+				}
+			}
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
+EXPORT_SYMBOL_GPL(memfd_pin_user_pages);
+
diff --git a/mm/memfd.c b/mm/memfd.c
index d3a1ba4208c9..b315cd12bdb7 100644
--- a/mm/memfd.c
+++ b/mm/memfd.c
@@ -63,6 +63,40 @@ static void memfd_tag_pins(struct xa_state *xas)
 	xas_unlock_irq(xas);
 }
 
+/*
+ * This is a helper function used by memfd_pin_user_pages() in GUP (gup.c).
+ * It is mainly called to allocate a page in a memfd when the caller
+ * (memfd_pin_user_pages()) cannot find a page in the page cache at a given
+ * index in the mapping.
+ */
+struct page *memfd_alloc_page(struct file *memfd, pgoff_t idx)
+{
+#ifdef CONFIG_HUGETLB_PAGE
+	struct folio *folio;
+	int err;
+
+	if (is_file_hugepages(memfd)) {
+		folio = alloc_hugetlb_folio_nodemask(hstate_file(memfd),
+						     NUMA_NO_NODE,
+						     NULL,
+						     GFP_USER);
+		if (folio && folio_try_get(folio)) {
+			err = hugetlb_add_to_page_cache(folio,
+							memfd->f_mapping,
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
+	return shmem_read_mapping_page(memfd->f_mapping, idx);
+}
+
 /*
  * Setting SEAL_WRITE requires us to verify there's no pending writer. However,
  * via get_user_pages(), drivers might have some pending I/O without any active
-- 
2.39.2

