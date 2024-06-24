Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FF3914323
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414CC10E36E;
	Mon, 24 Jun 2024 07:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGyg79v2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339C010E363
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719212726; x=1750748726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uRaov+u2QvECVr64vlaQOQuZJ9huFgCJS0IymQdZ56s=;
 b=eGyg79v2Y/U8Tyiqptqq6ma2bLGdw3eYtJby9yX2XmauJwwjtaNATWGH
 +zk9Qj46as7sHaWkrCK8Y70NfqZDJdp1RzULU5zl5xDRe3K6kjWReLMj/
 5H3TtMdY0PJEDxMSe0F21W8wDV+NccRX13b8e/JvHeLs244l9s0SiMGU7
 uzevOmDaTgZ1WogUWAfjix3PUlwaQziXuohHngcELMsuGpRdExjLaZufH
 RuAlvgJtW8mkAu+KWbuiGNECUieYy3fH7FDzDUwwJVPzImUvMYVm1/B/M
 Z3OvbNh2PcV1G9YnYck0Gq/UQSpxful4jknvEaNIXWqkQfNsjVBawQmx5 w==;
X-CSE-ConnectionGUID: NbJaY9oPStSL4QzfnoRqRw==
X-CSE-MsgGUID: CVPjvPSVSIinnuquscKTHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="16134947"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="16134947"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 00:05:25 -0700
X-CSE-ConnectionGUID: 0fviiTFzQO2YaP2pRpoTdw==
X-CSE-MsgGUID: HhwAJyebTXOiekSkjBRXsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="73955868"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 00:05:25 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>,
 Junxiao Chang <junxiao.chang@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, Dave Airlie <airlied@redhat.com>
Subject: [PATCH v16 3/9] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios
Date: Sun, 23 Jun 2024 23:36:11 -0700
Message-ID: <20240624063952.1572359-4-vivek.kasireddy@intel.com>
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
Cc: Hugh Dickins <hughd@google.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Junxiao Chang <junxiao.chang@intel.com>
Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com> (v2)
Reviewed-by: David Hildenbrand <david@redhat.com> (v3)
Reviewed-by: Christoph Hellwig <hch@lst.de> (v6)
Acked-by: Dave Airlie <airlied@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/linux/memfd.h |   5 ++
 include/linux/mm.h    |   3 +
 mm/gup.c              | 137 ++++++++++++++++++++++++++++++++++++++++++
 mm/memfd.c            |  45 ++++++++++++++
 4 files changed, 190 insertions(+)

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
index c0ee5f7978a0..2bdeb94c2a28 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2510,6 +2510,9 @@ long get_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
 		    struct page **pages, unsigned int gup_flags);
 long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
 		    struct page **pages, unsigned int gup_flags);
+long memfd_pin_folios(struct file *memfd, loff_t start, loff_t end,
+		      struct folio **folios, unsigned int max_folios,
+		      pgoff_t *offset);
 
 int get_user_pages_fast(unsigned long start, int nr_pages,
 			unsigned int gup_flags, struct page **pages);
diff --git a/mm/gup.c b/mm/gup.c
index a88e19c78730..94160abbf499 100644
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
 
@@ -3747,3 +3749,138 @@ long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
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
+	long ret = -EINVAL;
+
+	if (start < 0 || start > end || !max_folios)
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
+					ret = -EINVAL;
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
index 7d8d3ab3fa37..e7b7c5294d59 100644
--- a/mm/memfd.c
+++ b/mm/memfd.c
@@ -59,6 +59,51 @@ static void memfd_tag_pins(struct xa_state *xas)
 	xas_unlock_irq(xas);
 }
 
+/*
+ * This is a helper function used by memfd_pin_user_pages() in GUP (gup.c).
+ * It is mainly called to allocate a folio in a memfd when the caller
+ * (memfd_pin_folios()) cannot find a folio in the page cache at a given
+ * index in the mapping.
+ */
+struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
+{
+#ifdef CONFIG_HUGETLB_PAGE
+	struct folio *folio;
+	gfp_t gfp_mask;
+	int err;
+
+	if (is_file_hugepages(memfd)) {
+		/*
+		 * The folio would most likely be accessed by a DMA driver,
+		 * therefore, we have zone memory constraints where we can
+		 * alloc from. Also, the folio will be pinned for an indefinite
+		 * amount of time, so it is not expected to be migrated away.
+		 */
+		gfp_mask = htlb_alloc_mask(hstate_file(memfd));
+		gfp_mask &= ~(__GFP_HIGHMEM | __GFP_MOVABLE);
+
+		folio = alloc_hugetlb_folio_nodemask(hstate_file(memfd),
+						     numa_node_id(),
+						     NULL,
+						     gfp_mask,
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
2.45.1

