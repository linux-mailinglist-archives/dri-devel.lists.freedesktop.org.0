Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 220D889828A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 09:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFD3113165;
	Thu,  4 Apr 2024 07:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gnh59T3o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82FE0113213
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 07:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712217269; x=1743753269;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yb7amEGe1VBc3b0oe6v93Jw3wp7VQuVAA8DFhsG6G1g=;
 b=gnh59T3obwngrkZZ7JgRiimvORo6TtAnlpGY3QNplMRjlUEf8VVpmb1f
 w6wopN4pddslrfmar8iomufz35ApjyiovT3kZBouyuVTf/8ApSOXccBsp
 yaAJndQNLMPTUQHVVdiAOHi34rI9Whi+Ol6ZtsE4vleBZtkkHk76O5uWK
 LRXIPLX9rFACJukgmS8lREP2bLvyCp0vkWZmRHvpkWipgkiwbm2bWf9ml
 WeJdesCo63P0maQKAPhnGhOfuC9Lo9rXP85DEAR/itmoiqSlu3J3z43Fo
 en3xDZKsg45HrQW6JGg4/u5qSThQO1ZusQeeza4i3KfwwLlgqPpEL0QE8 w==;
X-CSE-ConnectionGUID: SNtpWSBMTgODMhj6/JLH4g==
X-CSE-MsgGUID: 9g0neLBDRuiWFRQOGwxZRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="10450787"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="10450787"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 00:54:27 -0700
X-CSE-ConnectionGUID: oyRgjK/WTKuzsJABcC3ksA==
X-CSE-MsgGUID: vozHhhVGQIeScfbT58z8VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="19298762"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 00:54:28 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mike Kravetz <mike.kravetz@oracle.com>, Hugh Dickins <hughd@google.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>,
 Junxiao Chang <junxiao.chang@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Subject: [PATCH v13 3/8] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios
Date: Thu,  4 Apr 2024 00:26:10 -0700
Message-ID: <20240404073053.3073706-4-vivek.kasireddy@intel.com>
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

Cc: David Hildenbrand <david@redhat.com>
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
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
 mm/gup.c              | 136 ++++++++++++++++++++++++++++++++++++++++++
 mm/memfd.c            |  35 +++++++++++
 4 files changed, 179 insertions(+)

diff --git a/include/linux/memfd.h b/include/linux/memfd.h
index e7abf6fa4c52..3f2cf339ceaf 100644
--- a/include/linux/memfd.h
+++ b/include/linux/memfd.h
@@ -6,11 +6,16 @@
 
 #ifdef CONFIG_MEMFD_CREATE
 extern long memfd_fcntl(struct file *file, unsigned int cmd, unsigned int arg);
+struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx);
 #else
 static inline long memfd_fcntl(struct file *f, unsigned int c, unsigned int a)
 {
 	return -EINVAL;
 }
+static inline struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
+{
+	return ERR_PTR(-EINVAL);
+}
 #endif
 
 #endif /* __LINUX_MEMFD_H */
diff --git a/include/linux/mm.h b/include/linux/mm.h
index f2ffd54e1736..9e5055f11021 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2533,6 +2533,9 @@ long get_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
 		    struct page **pages, unsigned int gup_flags);
 long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
 		    struct page **pages, unsigned int gup_flags);
+long memfd_pin_folios(struct file *memfd, loff_t start, loff_t end,
+		      struct folio **folios, unsigned int max_folios,
+		      pgoff_t *offset);
 
 int get_user_pages_fast(unsigned long start, int nr_pages,
 			unsigned int gup_flags, struct page **pages);
diff --git a/mm/gup.c b/mm/gup.c
index 00ee3b987307..9e64a89182b5 100644
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
 
@@ -3746,3 +3748,137 @@ long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
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
+ * unpin_folios() or unpin_folio().
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
+		      pgoff_t *offset)
+{
+	unsigned int flags, nr_folios, nr_found;
+	unsigned int i, pgshift = PAGE_SHIFT;
+	pgoff_t start_idx, end_idx, next_idx;
+	struct folio *folio = NULL;
+	struct folio_batch fbatch;
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
+					goto err;
+				}
+
+				if (nr_folios == 0)
+					*offset = offset_in_folio(folio, start);
+
+				folios[nr_folios] = folio;
+				next_idx = folio_next_index(folio);
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
+					if (ret != -EEXIST)
+						goto err;
+				}
+			}
+		}
+
+		ret = check_and_migrate_movable_folios(nr_folios, folios);
+	} while (ret == -EAGAIN);
+
+	memalloc_pin_restore(flags);
+	return ret ? ret : nr_folios;
+err:
+	memalloc_pin_restore(flags);
+	unpin_folios(folios, nr_folios);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(memfd_pin_folios);
+
diff --git a/mm/memfd.c b/mm/memfd.c
index 7d8d3ab3fa37..6ce2abb22c2d 100644
--- a/mm/memfd.c
+++ b/mm/memfd.c
@@ -59,6 +59,41 @@ static void memfd_tag_pins(struct xa_state *xas)
 	xas_unlock_irq(xas);
 }
 
+/*
+ * This is a helper function used by memfd_pin_user_pages() in GUP (gup.c).
+ * It is mainly called to allocate a page in a memfd when the caller
+ * (memfd_pin_folios()) cannot find a page in the page cache at a given
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
+						     GFP_USER,
+						     false);
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
2.43.0

