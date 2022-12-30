Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD61659781
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 12:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C18A10E1C9;
	Fri, 30 Dec 2022 11:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8887310E1C8
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 11:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672398757; x=1703934757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zQi3/q/+hsatMwGKr+Jc98p4qlBVrYNCOl5Qzyx4RGU=;
 b=LOrSqOIM0Kd0VV5kbB0aKyRklkm2Kh7TRaw9Gt1Decfq88iE67Aef/36
 Q3DWiw01Ydlp4Kl++/p279Erl0iVd/cnhy9btnBAFg+9TpFb4Vr3JRJb8
 kA35zcV7Lw827Was2b02smT+sW0O2WasKfqIM/Zmli2CC6TZ8u4Oc1J4f
 s15C6GUnnqFi7rHK1ShKz3x7kGmpHhhdVi5IKfSLobSuBVoVfb9sNbeAr
 n66dVDVpDinmK6OJL0/pWrAeGz5Sc7JX52kDMupdtYwAFrbD2bTg/HF7m
 6viHSXgjXO1RwjWCPz4ptHh+8QgqaxqXekkB0No9jOtQmUJO01MBnmU0R w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10575"; a="323178232"
X-IronPort-AV: E=Sophos;i="5.96,287,1665471600"; d="scan'208";a="323178232"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2022 03:12:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10575"; a="655839540"
X-IronPort-AV: E=Sophos;i="5.96,287,1665471600"; d="scan'208";a="655839540"
Received: from ahedstro-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2022 03:12:35 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org,
	christian.koenig@amd.com
Subject: [RFC PATCH 1/1] mm: Add interfaces to back up and recover folio
 contents using swap
Date: Fri, 30 Dec 2022 12:11:59 +0100
Message-Id: <20221230111159.75410-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221230111159.75410-1-thomas.hellstrom@linux.intel.com>
References: <20221230111159.75410-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GPU drivers have traditionally used shmem to back up GPU buffer contents
for swap on physical memory shortage. Some integrated GPU drivers use
shmem files as the backing storage for their GPU buffers, other drivers,
in particular drivers that need a Write-Combining caching strategy on
system pages, (but also drivers for discrete gpus in general) need to copy
to shmem on anticipated memory shortage.

The latter strategy does not lend itself very well to shrinker usage,
since in the shrinker, shmem memory up to PMD size first has to be
allocated before the gpu buffer page can be transitioned to normal caching
and handed back to the system.
This memory allocation will dive into kernel reserves allocating shmem
pages which aren't freed until a writeback happens from kswapd, which
makes the approach very fragile at best. Possibly one could transition
caching and split huge pages to be backed up before copying to shmem as an
alternative strategy.

Another approach is outlined in this RFC.

Add interfaces for GPU drivers to directly insert pages into the
swap-cache, thereby bypassing shmem and avoiding the shmem page
allocation at shrink time completely, as well as the content copy.

Also add a kunit test for experimenting with the interface functionality,
currently it seems PMD size folios doesn't work properly. Needs
further investigation if this is a viable approach. Also cgroup
accounting needs a thorough revisit.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 mm/Makefile                 |   3 +-
 mm/swap_backup_folio.c      | 134 ++++++++++++++++++++++++++++++++++++
 mm/swap_backup_folio_test.c | 109 +++++++++++++++++++++++++++++
 3 files changed, 245 insertions(+), 1 deletion(-)
 create mode 100644 mm/swap_backup_folio.c
 create mode 100644 mm/swap_backup_folio_test.c

diff --git a/mm/Makefile b/mm/Makefile
index 8e105e5b3e29..c7432d607f7a 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -54,7 +54,7 @@ obj-y			:= filemap.o mempool.o oom_kill.o fadvise.o \
 			   mm_init.o percpu.o slab_common.o \
 			   compaction.o \
 			   interval_tree.o list_lru.o workingset.o \
-			   debug.o gup.o mmap_lock.o $(mmu-y)
+			   debug.o gup.o mmap_lock.o swap_backup_folio.o $(mmu-y)
 
 # Give 'page_alloc' its own module-parameter namespace
 page-alloc-y := page_alloc.o
@@ -138,3 +138,4 @@ obj-$(CONFIG_IO_MAPPING) += io-mapping.o
 obj-$(CONFIG_HAVE_BOOTMEM_INFO_NODE) += bootmem_info.o
 obj-$(CONFIG_GENERIC_IOREMAP) += ioremap.o
 obj-$(CONFIG_SHRINKER_DEBUG) += shrinker_debug.o
+obj-m += swap_backup_folio_test.o
diff --git a/mm/swap_backup_folio.c b/mm/swap_backup_folio.c
new file mode 100644
index 000000000000..76b761a19f99
--- /dev/null
+++ b/mm/swap_backup_folio.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/mm_types.h>
+#include <linux/module.h>
+#include <linux/pagemap.h>
+#include <linux/swap.h>
+
+#include "swap.h"
+
+/**
+ * swap_backup_folio() - Insert an unmapped and dirty folio into the swap-cache.
+ * @folio: The folio to insert.
+ * @wbc: The struct writeback_control for immediate writeback or NULL.
+ *
+ * Insert a folio into the swap cache and get a swp_entry_t back as a reference.
+ * If the swap cache folio should be subject of immediate writeback to
+ * a swap device, @wbc should be non-NULL and point to a struct writeback_control
+ * populated accordingly. After a call to swap_backup_folio() the caller can
+ * drop its folio reference and use swap_recover_folio() to get the folio
+ * content back. Currently only PAGE_SIZE folios work, or if CONFIG_THP_SWAP is
+ * enabled, HPAGE_PMD_NR*PAGE_SIZE may work as well.
+ * TODO: Add a gfp_t to control the needed add_to_swap_cache radix tree
+ * allocation?
+ *
+ * Return: A swp_entry_t. If its .val field is zero, an error occurred.
+ */
+swp_entry_t swap_backup_folio(struct folio *folio,
+			      struct writeback_control *wbc)
+{
+	swp_entry_t swap = {};
+
+	if (folio_nr_pages(folio) != 1 &&
+	    !(IS_ENABLED(CONFIG_THP_SWAP) &&
+	      folio_nr_pages(folio) == HPAGE_PMD_NR))
+		return swap;
+
+	folio_lock(folio);
+	__folio_mark_uptodate(folio);
+	__folio_set_swapbacked(folio);
+
+	swap = folio_alloc_swap(folio);
+	if (!swap.val) {
+		folio_unlock(folio);
+		return swap;
+	}
+
+	mem_cgroup_charge(folio, NULL, GFP_HIGHUSER_MOVABLE);
+
+	if (add_to_swap_cache(folio, swap, __GFP_HIGH | __GFP_NOWARN, NULL) == 0) {
+		int ret = -EINVAL;
+
+		/*
+		 * Add a swapcount to prevent immediate swap-space reclaim of
+		 * this entry. It's paired with a swap_free() in
+		 * swap_recover_folio().
+		 */
+		swap_shmem_alloc(swap);
+		folio_add_lru(folio);
+
+		/*
+		 * Stolen from pageout(). The folio_test_writeback() looks a
+		 * bit arbitrary, as writepage unlocks the folio and the
+		 * writeback may complete at any time...
+		 */
+		if (wbc && folio_clear_dirty_for_io(folio)) {
+			folio_set_reclaim(folio);
+			ret = swap_writepage(folio_page(folio, 0), wbc);
+			if (!folio_test_writeback(folio))
+				folio_clear_reclaim(folio);
+		}
+
+		if (ret)
+			folio_unlock(folio);
+		return swap;
+	}
+
+	put_swap_folio(folio, swap);
+	folio_clear_swapbacked(folio);
+	folio_mark_dirty(folio);
+	folio_unlock(folio);
+
+	return swap;
+}
+EXPORT_SYMBOL(swap_backup_folio);
+
+/**
+ * swap_recover_folio() - Recover folio content that was previously backed up
+ * @swap: The swp_entry_t returned from swap_backup_folio().
+ *
+ * Recovers content that was previously backed up using swap_backup_folio().
+ * TODO: If a new folio is allocated, explain how the allocation policy is
+ * chosen. We may want to add that as an argument to the function
+ * together with a suitable gfp_t.
+ *
+ * Return: Pointer to folio containing the backed up content. This may or may
+ * not be the same folio used in the call to swap_backup_folio().
+ */
+struct folio *swap_recover_folio(swp_entry_t swap)
+{
+	struct folio *folio = swap_cache_get_folio(swap, NULL, 0);
+
+	if (!folio) {
+		/*
+		 * TODO: Use a fake vma (like shmem) for the desired
+		 * allocation policy?
+		 */
+		struct vm_fault vmf = {};
+		struct page *page;
+
+		/*
+		 * FIXME: Does this really work with PMD size folios, or
+		 * do we need to retry from start after readahead?
+		 */
+		page = swap_cluster_readahead(swap, GFP_HIGHUSER_MOVABLE, &vmf);
+		if (page)
+			folio = page_folio(page);
+	}
+
+	if (!folio)
+		return ERR_PTR(-ENOMEM);
+
+	folio_lock(folio);
+	WARN_ON(!folio_test_swapcache(folio) ||
+		folio_swap_entry(folio).val != swap.val ||
+		!folio_test_uptodate(folio));
+	folio_wait_writeback(folio);
+	arch_swap_restore(swap, folio);
+	delete_from_swap_cache(folio);
+	folio_unlock(folio);
+	swap_free(swap);
+
+	return folio;
+}
+EXPORT_SYMBOL(swap_recover_folio);
diff --git a/mm/swap_backup_folio_test.c b/mm/swap_backup_folio_test.c
new file mode 100644
index 000000000000..1d6a9447d78a
--- /dev/null
+++ b/mm/swap_backup_folio_test.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: MIT or GPL-2.0
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include <kunit/test.h>
+#include <linux/delay.h>
+#include <linux/swap.h>
+
+/* TODO: Use memory- and swap size info to determine this. */
+#define MAX_BACKUP_FOLIOS 5000000
+
+swp_entry_t swap_backup_folio(struct folio *folio, struct writeback_control *wbc);
+struct folio *swap_recover_folio(swp_entry_t swap);
+
+static struct writeback_control __maybe_unused wbc = {
+	.sync_mode = WB_SYNC_NONE,
+	.nr_to_write = SWAP_CLUSTER_MAX,
+	.range_start = 0,
+	.range_end = LLONG_MAX,
+	.for_reclaim = 1,
+};
+
+struct gpu_swapped_page {
+	struct list_head link;
+	swp_entry_t swap;
+};
+
+static void swap_backup_test(struct kunit *test)
+{
+	gfp_t gfp = GFP_HIGHUSER_MOVABLE | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
+	struct gpu_swapped_page *gsp, *next;
+	struct folio *folio;
+	LIST_HEAD(list);
+	int i = 0;
+
+	do {
+		/*
+		 * Expect folio_alloc() (out-of-physical-memory) or
+		 * swap_backup_folio() (out-of-swap-space) to fail before
+		 * this kzalloc().
+		 */
+		gsp = kzalloc(sizeof(*gsp), GFP_KERNEL);
+		if (!gsp) {
+			KUNIT_FAIL(test, "alloc gsp failed.\n");
+			break;
+		}
+
+		folio = vma_alloc_folio(gfp, 0, NULL, 0, false);
+		if (!folio) {
+			kunit_info(test, "folio_alloc failed.\n");
+			kfree(gsp);
+			break;
+		}
+
+		folio_mark_dirty(folio);
+
+		/* Use &wbc instead of NULL here to trigger immediate writeback. */
+		gsp->swap = swap_backup_folio(folio, NULL);
+		if (gsp->swap.val == 0) {
+			kunit_info(test, "swap_backup_folio() failed.\n");
+			folio_put(folio);
+			kfree(gsp);
+			break;
+		}
+
+		list_add_tail(&gsp->link, &list);
+		folio_put(folio);
+		if (i % 1000 == 0)
+			kunit_info(test, "Backed up %d\n", i);
+	} while (i++ < MAX_BACKUP_FOLIOS);
+
+	kunit_info(test, "Backup total: %d. Now sleeping for 10s.\n", i);
+	ssleep(10);
+
+	i = 0;
+	list_for_each_entry_safe(gsp, next, &list, link) {
+		folio = swap_recover_folio(gsp->swap);
+		if (IS_ERR(folio)) {
+			KUNIT_FAIL(test, "swap_recover_folio() failed.\n");
+		} else {
+			folio->memcg_data = 0;
+			folio_put(folio);
+		}
+		list_del(&gsp->link);
+		kfree(gsp);
+		i++;
+
+		if (i % 1000 == 0)
+			kunit_info(test, "Recovered %d\n", i);
+	}
+
+	kunit_info(test, "Recover_total: %d\n", i);
+}
+
+static struct kunit_case swap_backup_tests[] = {
+	KUNIT_CASE(swap_backup_test),
+	{}
+};
+
+static struct kunit_suite swap_backup_test_suite = {
+	.name = "swap_backup_folio",
+	.test_cases = swap_backup_tests,
+};
+
+kunit_test_suite(swap_backup_test_suite);
+
+MODULE_AUTHOR("Intel Corporation");
+MODULE_LICENSE("Dual MIT/GPL");
-- 
2.38.1

