Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 656AE69807E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:15:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2950010EB1D;
	Wed, 15 Feb 2023 16:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B5B10EB0C;
 Wed, 15 Feb 2023 16:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676477731; x=1708013731;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0GOXh0gS6sWajQ1gHnS/5gVSVEN8A7soG6TR0c6oZTI=;
 b=gYVRHTJWoISOyS3PvWQZ/noq5kGrXANFEWovJbLKRLziGKsKsm6Cwknh
 q6gB14PCYW3qGLPvcbMMOclrv00aZqmyu8VSHEyZQi4UmQanc4c3J1HDM
 Q5HurouLk2KrbgsZWisms4/acyxCBKe8Y2hsig/pckMTlY8bs/op9zqwv
 pdkeeaQSu3vERhObT9uUdHTj9a+xG2OaptKajJt8GEo8Rjl3lEKXqSKW2
 hTz15TonmVwSUK5f3BPY6rgEk3mHs/Ijbn8GbidXh7xBhsa/H9aLA4WQ3
 A8LIcJYyMqgf/ZCTxnVSYAABohC4A4oFReFdcTWqvoKGu5ons3tERZUaE A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="393871091"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="393871091"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:15:30 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="758472640"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="758472640"
Received: from auliel-mobl1.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.14])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:15:25 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 12/16] mm: Add interfaces to back up and recover folio
 contents using swap
Date: Wed, 15 Feb 2023 17:14:01 +0100
Message-Id: <20230215161405.187368-13-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
References: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, NeilBrown <neilb@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Dave Hansen <dave.hansen@intel.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-mm@kvack.org,
 linux-graphics-maintainer@vmware.com, Peter Xu <peterx@redhat.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Dave Airlie <airlied@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GPU drivers have traditionally used shmem to back up GPU buffer contents
for swap on physical memory shortage. Some integrated GPU drivers use
shmem files as the backing storage for their GPU buffers, other drivers,
in particular drivers that need a Write-Combining caching strategy on
system pages, (but also drivers for discrete gpus in general) need to copy
to shmem on anticipated memory shortage.

The latter strategy does not lend itself very well to shrinker usage,
since shmem memory needs to be allocated and page trylocking of pagecache
pages need to be performed from reclaim context and both are prone to
failures. That makes the approach very fragile at best.

Add interfaces for GPU drivers to directly insert pages into the
swap-cache, thereby bypassing shmem and avoiding the shmem page
allocation and locking at shrink time completely, as well as the
content copy.

Also add a kunit test for experimenting with the interface functionality,
currently it seems PMD size folios doesn't work properly. Needs
further investigation if this is a viable approach.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Peter Xu <peterx@redhat.com>
Cc: NeilBrown <neilb@suse.de>
Cc: linux-mm@kvack.org

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 include/linux/swap.h        |  10 ++
 mm/Kconfig                  |  18 ++++
 mm/Makefile                 |   2 +
 mm/swap_backup_folio.c      | 178 ++++++++++++++++++++++++++++++++++++
 mm/swap_backup_folio_test.c | 111 ++++++++++++++++++++++
 5 files changed, 319 insertions(+)
 create mode 100644 mm/swap_backup_folio.c
 create mode 100644 mm/swap_backup_folio_test.c

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 0ceed49516ad..fc38c72fe9ab 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -706,5 +706,15 @@ static inline bool mem_cgroup_swap_full(struct folio *folio)
 }
 #endif
 
+#ifdef CONFIG_SWAP_BACKUP_FOLIO
+swp_entry_t swap_backup_folio(struct folio *folio, bool writeback,
+			      gfp_t folio_gfp, gfp_t alloc_gfp);
+
+int swap_copy_folio(swp_entry_t swap, struct page *page, unsigned long index,
+		    bool killable);
+
+void swap_drop_folio(swp_entry_t swap);
+#endif
+
 #endif /* __KERNEL__*/
 #endif /* _LINUX_SWAP_H */
diff --git a/mm/Kconfig b/mm/Kconfig
index ff7b209dec05..b9e0a40e9e1a 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -191,6 +191,10 @@ config ZSMALLOC_STAT
 	  information to userspace via debugfs.
 	  If unsure, say N.
 
+config SWAP_BACKUP_FOLIO
+       bool
+       default n
+
 menu "SLAB allocator options"
 
 choice
@@ -1183,6 +1187,20 @@ config LRU_GEN_STATS
 	  This option has a per-memcg and per-node memory overhead.
 # }
 
+config SWAP_BACKUP_FOLIO_KUNIT_TEST
+       tristate "KUnit tests for swap_backup_folio() functionality" if !KUNIT_ALL_TESTS
+       depends on SWAP && KUNIT && SWAP_BACKUP_FOLIO
+       help
+	 This builds unit tests for the swap_backup_folio_functionality().
+	 This option is not useful for distributions or general kernels,
+	 but only for kernel developers working on MM swap functionality.
+
+	 For more information on KUnit and unit tests in general,
+	 please refer to the KUnit documentation in
+	 Documentation/dev-tools/kunit/.
+
+	 If in doubt, say "N".
+
 source "mm/damon/Kconfig"
 
 endmenu
diff --git a/mm/Makefile b/mm/Makefile
index 8e105e5b3e29..91cb9c73e16e 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -138,3 +138,5 @@ obj-$(CONFIG_IO_MAPPING) += io-mapping.o
 obj-$(CONFIG_HAVE_BOOTMEM_INFO_NODE) += bootmem_info.o
 obj-$(CONFIG_GENERIC_IOREMAP) += ioremap.o
 obj-$(CONFIG_SHRINKER_DEBUG) += shrinker_debug.o
+obj-$(CONFIG_SWAP_BACKUP_FOLIO) += swap_backup_folio.o
+obj-$(CONFIG_SWAP_BACKUP_FOLIO_KUNIT_TEST) += swap_backup_folio_test.o
diff --git a/mm/swap_backup_folio.c b/mm/swap_backup_folio.c
new file mode 100644
index 000000000000..f77ca478e625
--- /dev/null
+++ b/mm/swap_backup_folio.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/mm_types.h>
+#include <linux/module.h>
+#include <linux/pagemap.h>
+#include <linux/swap.h>
+
+#include <linux/mm_inline.h>
+#include "swap.h"
+
+/**
+ * swap_backup_folio() - Insert an isolated folio into the swap-cache.
+ * @folio: The folio to insert.
+ * @writeback: Whether to perform immediate writeback.
+ * @folio_gfp: The gfp value used when the folio was allocated. Used for
+ *             cgroup charging only.
+ * @alloc_fgp: The gfp value used for swap cache radix tree memory allocations.
+ *
+ * Insert a folio into the swap cache and get a swp_entry_t back as a reference.
+ * If the swap cache folio should be subject of immediate writeback to
+ * a swap device, @writeback should be set to true.
+ * After a call to swap_backup_folio() the caller can
+ * drop its folio reference and use swap_copy_folio() to get the folio
+ * content back, or swap_drop_folio() to drop it completely.
+ * Currently only PAGE_SIZE folios work, or if CONFIG_THP_SWAP is
+ * enabled, HPAGE_PMD_NR*PAGE_SIZE may work as well, although that
+ * needs further testing.
+ *
+ * Return: A swp_entry_t. If its .val field is zero, an error occurred.
+ */
+swp_entry_t swap_backup_folio(struct folio *folio, bool writeback,
+			      gfp_t folio_gfp, gfp_t alloc_gfp)
+{
+	swp_entry_t swap = {};
+
+	if (VM_WARN_ON_ONCE_FOLIO(folio_nr_pages(folio) != 1 &&
+				  !(IS_ENABLED(CONFIG_THP_SWAP) &&
+				    folio_nr_pages(folio) == HPAGE_PMD_NR),
+				  folio))
+		return swap;
+
+	if (VM_WARN_ON_ONCE_FOLIO(folio_ref_count(folio) != 1 ||
+				  folio_test_lru(folio) ||
+				  folio_test_locked(folio), folio))
+		return swap;
+
+	/*
+	 * Typically called from reclaim so use folio_trylock. If the folio
+	 * is isolated with refcount == 1, then this trylock should always
+	 * succeed.
+	 */
+	if (!folio_trylock(folio))
+		return swap;
+
+	__folio_mark_uptodate(folio);
+	__folio_set_swapbacked(folio);
+
+	mem_cgroup_charge(folio, NULL, folio_gfp);
+
+	swap = folio_alloc_swap(folio);
+	if (!swap.val)
+		goto out;
+
+	if (add_to_swap_cache(folio, swap, alloc_gfp, NULL) == 0) {
+		int ret = -EINVAL;
+
+		swap_shmem_alloc(swap);
+		folio_add_lru(folio);
+		lru_add_drain();
+
+		/* Stolen from pageout(). */
+		if (writeback && folio_clear_dirty_for_io(folio)) {
+			struct writeback_control wbc = {
+				.sync_mode = WB_SYNC_NONE,
+				.nr_to_write = SWAP_CLUSTER_MAX,
+				.range_start = 0,
+				.range_end = LLONG_MAX,
+				.for_reclaim = 1,
+			};
+
+			folio_set_reclaim(folio);
+			ret = swap_writepage(folio_page(folio, 0), &wbc);
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
+out:
+	folio_clear_swapbacked(folio);
+	folio_mark_dirty(folio);
+	folio_unlock(folio);
+	mem_cgroup_uncharge(folio);
+
+	return swap;
+}
+EXPORT_SYMBOL(swap_backup_folio);
+
+/**
+ * swap_copy_folio() - Copy folio content that was previously backed up
+ * @swap: The swp_entry_t returned from swap_backup_folio().
+ * @to_page: The page to copy to.
+ * @index: The index to the source page in the folio represented by @swap.
+ * @killable: Whether to perform sleeping operations killable.
+ *
+ * Copies content that was previously backed up using swap_backup_folio(),
+ * to the destination page to_page. The swp_entry_t @swap is not freed, and
+ * copying can thus be done multiple times using @swap.
+ *
+ * Return: Zero on success, negative error code on error. In particular,
+ * -EINTR may be returned if a fatal signal is pending during wait for
+ * page-lock or wait for writeback and @killable is set to true.
+ */
+int swap_copy_folio(swp_entry_t swap, struct page *to_page,
+		    unsigned long index, bool killable)
+{
+	struct folio *folio = swap_cache_get_folio(swap, NULL, 0);
+	int ret;
+
+	if (!folio) {
+		struct vm_fault vmf = {};
+		struct page *page;
+
+		page = swap_cluster_readahead(swap, GFP_HIGHUSER_MOVABLE, &vmf);
+		if (page)
+			folio = page_folio(page);
+	}
+
+	if (!folio)
+		return -ENOMEM;
+
+	if (killable) {
+		ret = __folio_lock_killable(folio);
+		if (ret)
+			goto out_err;
+	} else {
+		folio_lock(folio);
+	}
+
+	VM_WARN_ON_ONCE_FOLIO(!folio_test_swapcache(folio) ||
+			      folio_swap_entry(folio).val != swap.val ||
+			      !folio_test_uptodate(folio), folio);
+
+	if (killable) {
+		ret = folio_wait_writeback_killable(folio);
+		if (ret)
+			goto out_err;
+	} else {
+		folio_wait_writeback(folio);
+	}
+
+	arch_swap_restore(swap, folio);
+	folio_unlock(folio);
+
+	copy_highpage(to_page, folio_page(folio, index));
+out_err:
+	folio_put(folio);
+	return ret;
+}
+EXPORT_SYMBOL(swap_copy_folio);
+
+/**
+ * swap_drop_folio - Drop a swap entry and its associated swap cache folio
+ * if any.
+ * @swap: The swap entry.
+ *
+ * Releases resources associated with a swap entry returned from
+ * swap_backup_folio().
+ */
+void swap_drop_folio(swp_entry_t swap)
+{
+	free_swap_and_cache(swap);
+}
+EXPORT_SYMBOL(swap_drop_folio);
diff --git a/mm/swap_backup_folio_test.c b/mm/swap_backup_folio_test.c
new file mode 100644
index 000000000000..34cde56d2a57
--- /dev/null
+++ b/mm/swap_backup_folio_test.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: MIT or GPL-2.0
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include <kunit/test.h>
+#include <linux/delay.h>
+#include <linux/swap.h>
+#include <linux/sysinfo.h>
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
+	long i = 0L;
+	long num_folios;
+	unsigned long avail_ram;
+
+	avail_ram = si_mem_available() << PAGE_SHIFT;
+	kunit_info(test, "Available RAM is %lu MiB.\n", avail_ram / SZ_1M);
+	num_folios = get_nr_swap_pages();
+	num_folios = min_t(long, num_folios, avail_ram >> PAGE_SHIFT);
+
+	kunit_info(test, "Trying %ld swap pages\n", num_folios);
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
+		/* Use true instead of false here to trigger immediate writeback. */
+		gsp->swap = swap_backup_folio(folio, false, gfp,
+					      GFP_KERNEL | __GFP_HIGH |
+					      __GFP_NOWARN);
+		if (gsp->swap.val == 0) {
+			kunit_info(test, "swap_backup_folio() failed.\n");
+			folio_put(folio);
+			kfree(gsp);
+			break;
+		}
+
+		list_add_tail(&gsp->link, &list);
+		folio_put(folio);
+		cond_resched();
+		if (i % 1000 == 0)
+			kunit_info(test, "Backed up %ld\n", i);
+	} while (i++ < num_folios);
+
+	i = 0;
+	list_for_each_entry_safe(gsp, next, &list, link) {
+		int ret;
+
+		folio = folio_alloc(GFP_HIGHUSER, 0);
+		if (!folio) {
+			KUNIT_FAIL(test, "Allocation of readback folio failed.\n");
+		} else {
+			ret = swap_copy_folio(gsp->swap, folio_page(folio, 0),
+					      0, false);
+			if (ret)
+				KUNIT_FAIL(test, "swap_copy_folio() failed.\n");
+		}
+		folio_put(folio);
+		swap_drop_folio(gsp->swap);
+		list_del(&gsp->link);
+		kfree(gsp);
+		i++;
+		cond_resched();
+		if (i % 1000 == 0)
+			kunit_info(test, "Recovered %ld\n", i);
+	}
+
+	kunit_info(test, "Recover_total: %ld\n", i);
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
2.34.1

