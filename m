Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E63A81580C
	for <lists+dri-devel@lfdr.de>; Sat, 16 Dec 2023 07:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11CF810E32C;
	Sat, 16 Dec 2023 06:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D051810E06F
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Dec 2023 06:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702708137; x=1734244137;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y7c0p+lPK1aglp77lTkz3x2+xm9XiI7T8TRoE4cz9K8=;
 b=PTQJ2MIgmgWSp2p/6MEF6hH7ofqUHxQpxU/teFki9zw1xOCOOYNLObVn
 6b4FlfRE/aeFIkNuL6+yvi0QbEqUgb3+DR1hkyX6zWcQsoD//68udSlik
 YLahbIbBhplvMKmCzh/1ATfIMlF2GDHpZGfksRETEnB4lGvN3Frwe/2F0
 dTdfwje3IRwdUvGKowWrMS8tjChL4aqIHxzlU+rmPHxGZeSkrvzcptMKS
 3XEDNTsmtfHKj6Q0BHXY/wNmZBbQRVsv+Dq/XGH+v2Z50hajGdoYOMFxQ
 pRljeWVWpFGBzUWxgm4EnWyFP+u2H1uaJcXRA3tg5zuuxRXXOJ2Z7MuRE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="2186030"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="2186030"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 22:28:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="751178910"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="751178910"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 22:28:55 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v8 3/6] mm/gup: Introduce memfd_pin_folios() for pinning memfd
 folios (v8)
Date: Fri, 15 Dec 2023 22:05:33 -0800
Message-Id: <20231216060536.3716466-4-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231216060536.3716466-1-vivek.kasireddy@intel.com>
References: <20231216060536.3716466-1-vivek.kasireddy@intel.com>
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
 Christoph Hellwig <hch@lst.de>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For drivers that would like to longterm-pin the folios associated
with a memfd, the memfd_pin_folios() API provides an option to
not only pin the folios via FOLL_PIN but also to check and migrate
them if they reside in movable zone or CMA block. This API
currently works with memfds but it should work with any files
that belong to either shmemfs or hugetlbfs. Files belonging to
other filesystems are rejected for now.

The folios need to be located first before pinning them via FOLL_PIN.
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

v7:
- Rename this API to memfd_pin_folios() and make it return folios
  and offsets instead of pages (David)
- Don't continue processing the folios in the batch returned by
  filemap_get_folios_contig() if they do not have correct next_idx
- Add the R-b tag from Christoph

v8: (David)
- Have caller pass [start, end], max_folios instead of start, nr_pages
- Replace offsets array with just offset into the first page
- Add comments explaning the need for next_idx
- Pin (and return) the folio (via FOLL_PIN) only once

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
Reviewed-by: Christoph Hellwig <hch@lst.de> (v6)
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/linux/memfd.h |   5 ++
 include/linux/mm.h    |   3 +
 mm/gup.c              | 149 ++++++++++++++++++++++++++++++++++++++++++
 mm/memfd.c            |  34 ++++++++++
 4 files changed, 191 insertions(+)

diff --git a/include/linux/memfd.h b/include/linux/memfd.h
index e7abf6fa4c52..b38fb35f4271 100644
--- a/include/linux/memfd.h
+++ b/include/linux/memfd.h
@@ -6,11 +6,16 @@
 
 #ifdef CONFIG_MEMFD_CREATE
 extern long memfd_fcntl(struct file *file, unsigned int cmd, unsigned int arg);
+extern struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx);
 #else
 static inline long memfd_fcntl(struct file *f, unsigned int c, unsigned int a)
 {
 	return -EINVAL;
 }
+static inline struct page *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
+{
+	return ERR_PTR(-EINVAL);
+}
 #endif
 
 #endif /* __LINUX_MEMFD_H */
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 418d26608ece..956f0ec24598 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2472,6 +2472,9 @@ long get_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
 		    struct page **pages, unsigned int gup_flags);
 long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
 		    struct page **pages, unsigned int gup_flags);
+long memfd_pin_folios(struct file *file, loff_t start, loff_t end,
+		      struct folio **folios, unsigned int max_folios,
+		      unsigned long *offset);
 
 int get_user_pages_fast(unsigned long start, int nr_pages,
 			unsigned int gup_flags, struct page **pages);
diff --git a/mm/gup.c b/mm/gup.c
index 231711efa390..70ae653e4109 100644
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
 
@@ -3410,3 +3412,150 @@ long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
 				     &locked, gup_flags);
 }
 EXPORT_SYMBOL(pin_user_pages_unlocked);
+
+/**
+ * memfd_pin_folios() - pin folios associated with a memfd
+ * @memfd:      the memfd whose folios are to be pinned
+ * @start:      the first memfd offset
+ * @end:        the last memfd offset (inclusive)
+ * @folios:     array that receives pointers to the folios pinned
+ * @max_folios: maximum number of entries in @folios
+ * @offset:     the offset into the first folio
+ *
+ * Attempt to pin folios associated with a memfd in the contiguous range
+ * [start, end]. Given that a memfd is either backed by shmem or hugetlb,
+ * the folios can either be found in the page cache or need to be allocated
+ * if necessary. Once the folios are located, they are all pinned via
+ * FOLL_PIN and @offset is populatedwith the offset into the first folio.
+ * And, eventually, these pinned folios must be released either using
+ * unpin_user_pages() or unpin_user_page().
+ *
+ * It must be noted that the folios may be pinned for an indefinite amount
+ * of time. And, in most cases, the duration of time they may stay pinned
+ * would be controlled by the userspace. This behavior is effectively the
+ * same as using FOLL_LONGTERM with other GUP APIs.
+ *
+ * Returns number of folios pinned, which could be less than @max_folios
+ * as it depends on the folio sizes that cover the range [start, end].
+ * If no folios were pinned, it returns -errno.
+ */
+long memfd_pin_folios(struct file *memfd, loff_t start, loff_t end,
+		      struct folio **folios, unsigned int max_folios,
+		      unsigned long *offset)
+{
+	unsigned int flags, nr_folios, nr_found;
+	unsigned int i, pgshift = PAGE_SHIFT;
+	pgoff_t start_idx, end_idx, next_idx;
+	struct folio *folio = NULL;
+	struct folio_batch fbatch;
+	struct page **pages;
+	struct hstate *h;
+	long ret;
+
+	if (start > end || !max_folios)
+		return -EINVAL;
+
+	if (!memfd)
+		return -EINVAL;
+
+	if (!shmem_file(memfd) && !is_file_hugepages(memfd))
+		return -EINVAL;
+
+	pages = kmalloc_array(max_folios, sizeof(*pages), GFP_KERNEL);
+	if (!pages)
+		return -ENOMEM;
+
+	if (is_file_hugepages(memfd)) {
+		h = hstate_file(memfd);
+		pgshift = huge_page_shift(h);
+	}
+
+	flags = memalloc_pin_save();
+	do {
+		nr_folios = 0;
+		start_idx = start >> pgshift;
+		end_idx = end >> pgshift;
+		if (is_file_hugepages(memfd)) {
+			start_idx <<= huge_page_order(h);
+			end_idx <<= huge_page_order(h);
+		}
+
+		folio_batch_init(&fbatch);
+		while (start_idx <= end_idx && nr_folios < max_folios) {
+			/*
+			 * In most cases, we should be able to find the folios
+			 * in the page cache. If we cannot find them for some
+			 * reason, we try to allocate them and add them to the
+			 * page cache.
+			 */
+			nr_found = filemap_get_folios_contig(memfd->f_mapping,
+							     &start_idx,
+							     end_idx,
+							     &fbatch);
+			if (folio) {
+				folio_put(folio);
+				folio = NULL;
+			}
+
+			next_idx = 0;
+			for (i = 0; i < nr_found; i++) {
+				/*
+				 * As there can be multiple entries for a
+				 * given folio in the batch returned by
+				 * filemap_get_folios_contig(), the below
+				 * check is to ensure that we pin and return a
+				 * unique set of folios between start and end.
+				 */
+				if (next_idx &&
+				    next_idx != folio_index(fbatch.folios[i]))
+					continue;
+
+				folio = try_grab_folio(&fbatch.folios[i]->page,
+						       1, FOLL_PIN);
+				if (!folio) {
+					folio_batch_release(&fbatch);
+					kfree(pages);
+					goto err;
+				}
+
+				if (nr_folios == 0)
+					*offset = offset_in_folio(folio, start);
+
+				folios[nr_folios] = folio;
+				pages[nr_folios] = folio_page(folio, 0);
+				next_idx = folio_next_index(folio);
+
+				if (++nr_folios == max_folios)
+					break;
+			}
+
+			folio = NULL;
+			folio_batch_release(&fbatch);
+			if (!nr_found) {
+				folio = memfd_alloc_folio(memfd, start_idx);
+				if (IS_ERR(folio)) {
+					ret = PTR_ERR(folio);
+					if (ret != -EEXIST) {
+						kfree(pages);
+						goto err;
+					}
+				}
+			}
+		}
+
+		ret = check_and_migrate_movable_pages(nr_folios, pages);
+	} while (ret == -EAGAIN);
+
+	kfree(pages);
+	memalloc_pin_restore(flags);
+	return ret ? ret : nr_folios;
+err:
+	memalloc_pin_restore(flags);
+	while (i-- > 0)
+		if (folios[i])
+			gup_put_folio(folios[i], 1, FOLL_PIN);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(memfd_pin_folios);
+
diff --git a/mm/memfd.c b/mm/memfd.c
index d3a1ba4208c9..36a75e8249f8 100644
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
+struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
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
+			return folio;
+		}
+		return ERR_PTR(-ENOMEM);
+	}
+#endif
+	return shmem_read_folio(memfd->f_mapping, idx);
+}
+
 /*
  * Setting SEAL_WRITE requires us to verify there's no pending writer. However,
  * via get_user_pages(), drivers might have some pending I/O without any active
-- 
2.39.2

