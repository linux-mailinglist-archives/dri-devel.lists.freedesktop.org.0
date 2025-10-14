Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2972CBDAA44
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 18:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A3710E667;
	Tue, 14 Oct 2025 16:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=unisoc.com header.i=@unisoc.com header.b="A6BMxK4r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2238 seconds by postgrey-1.36 at gabe;
 Tue, 14 Oct 2025 09:13:17 UTC
Received: from SHSQR01.spreadtrum.com (mx1.unisoc.com [222.66.158.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DEB210E0E6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 09:13:16 +0000 (UTC)
Received: from SHSQR01.spreadtrum.com (localhost [127.0.0.2] (may be forged))
 by SHSQR01.spreadtrum.com with ESMTP id 59E8Zx5m003994
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 16:35:59 +0800 (+08)
 (envelope-from zhaoyang.huang@unisoc.com)
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 59E8WlsX086161;
 Tue, 14 Oct 2025 16:32:47 +0800 (+08)
 (envelope-from zhaoyang.huang@unisoc.com)
Received: from SHDLP.spreadtrum.com (BJMBX01.spreadtrum.com [10.0.64.7])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4cm6q45dHRz2Q1PRd;
 Tue, 14 Oct 2025 16:30:24 +0800 (CST)
Received: from bj03382pcu03.spreadtrum.com (10.0.73.40) by
 BJMBX01.spreadtrum.com (10.0.64.7) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Tue, 14 Oct 2025 16:32:43 +0800
From: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
 <david@redhat.com>, Matthew Wilcox <willy@infradead.org>, Mel Gorman
 <mgorman@techsingularity.net>, Vlastimil Babka <vbabka@suse.cz>,
 Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>,
 Zhaoyang Huang <huangzhaoyang@gmail.com>, <steve.kang@unisoc.com>
Subject: [PATCH 1/2] mm: call back alloc_pages_bulk_list since it is useful
Date: Tue, 14 Oct 2025 16:32:29 +0800
Message-ID: <20251014083230.1181072-2-zhaoyang.huang@unisoc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251014083230.1181072-1-zhaoyang.huang@unisoc.com>
References: <20251014083230.1181072-1-zhaoyang.huang@unisoc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.73.40]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX01.spreadtrum.com (10.0.64.7)
X-MAIL: SHSQR01.spreadtrum.com 59E8WlsX086161
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unisoc.com;
 s=default; t=1760430782;
 bh=63LZGfJJc6amCQ8kyFsu44XHeulr67TgoXNrETLf0zo=;
 h=From:To:Subject:Date:In-Reply-To:References;
 b=A6BMxK4rAeYaYPIcBx+mHWlG7KIuigkXVQwQ+QYyf8pYMQ9eq1TaZ+9gEkWaordnG
 Gy3RD/QSsz1QQlfedaoYYiFTBj1kD9J2QtYt2mxt/nRSwI3bDlSHeKUB+w7Ty+QgId
 oQjhEME1ywmxLfeaOcLCesMNyuGmV7s2Pp6wwC1WW18l2kzI6ZWpfTWdb8H8i5DLY5
 7KUOPMQrmAUX7BBglGhlSGP/fxlJUCyRDgCXYxGjBQEshMP8XJxPqu2jteIr6l+3iA
 ErL5jR5yKccLLRMbnNj4zuKS839zHMHgmQcGrRXMqlhX7As6s/yo07v54F2LKorGUe
 RhV4Z6d1cPSlw==
X-Mailman-Approved-At: Tue, 14 Oct 2025 16:36:49 +0000
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

From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>

commit c8b979530f27 ("mm: alloc_pages_bulk_noprof: drop page_list
argument") drops alloc_pages_bulk_list. This commit would like to call back
it since it is proved to be helpful to the drivers which allocate a bulk of
pages(see patch of 2 in this series ).
I do notice that Matthew's comment of the time cost of iterating a list.
However, I also observed in our test that the extra page_array's allocation
could be more expensive than cpu iteration when direct reclaiming happens
when ram is low[1]. IMHO, could we leave the API here to have the users
choose between the array or list according to their scenarios.

[1]
android.hardwar-728     [002] .....   334.573875: system_heap_do_allocate: Execution time: order 0 1 us
android.hardwar-728     [002] .....   334.573879: system_heap_do_allocate: Execution time: order 0 2 us
android.hardwar-728     [002] .....   334.574239: system_heap_do_allocate: Execution time: order 0 354 us
android.hardwar-728     [002] .....   334.574247: system_heap_do_allocate: Execution time: order 0 4 us
android.hardwar-728     [002] .....   334.574250: system_heap_do_allocate: Execution time: order 0 2 us

Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
---
 include/linux/gfp.h |  9 +++++++--
 mm/mempolicy.c      | 14 +++++++-------
 mm/page_alloc.c     | 39 +++++++++++++++++++++++++++------------
 3 files changed, 41 insertions(+), 21 deletions(-)

diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index 5ebf26fcdcfa..f1540c9fcd87 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -231,6 +231,7 @@ struct folio *__folio_alloc_noprof(gfp_t gfp, unsigned int order, int preferred_
 
 unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 				nodemask_t *nodemask, int nr_pages,
+				struct list_head *page_list,
 				struct page **page_array);
 #define __alloc_pages_bulk(...)			alloc_hooks(alloc_pages_bulk_noprof(__VA_ARGS__))
 
@@ -242,7 +243,11 @@ unsigned long alloc_pages_bulk_mempolicy_noprof(gfp_t gfp,
 
 /* Bulk allocate order-0 pages */
 #define alloc_pages_bulk(_gfp, _nr_pages, _page_array)		\
-	__alloc_pages_bulk(_gfp, numa_mem_id(), NULL, _nr_pages, _page_array)
+	__alloc_pages_bulk(_gfp, numa_mem_id(), NULL, _nr_pages, NULL, _page_array)
+
+#define alloc_pages_bulk_list(_gfp, _nr_pages, _list)			\
+	__alloc_pages_bulk(_gfp, numa_mem_id(), NULL, _nr_pages, _list, NULL)
+
 
 static inline unsigned long
 alloc_pages_bulk_node_noprof(gfp_t gfp, int nid, unsigned long nr_pages,
@@ -251,7 +256,7 @@ alloc_pages_bulk_node_noprof(gfp_t gfp, int nid, unsigned long nr_pages,
 	if (nid == NUMA_NO_NODE)
 		nid = numa_mem_id();
 
-	return alloc_pages_bulk_noprof(gfp, nid, NULL, nr_pages, page_array);
+	return alloc_pages_bulk_noprof(gfp, nid, NULL, nr_pages, NULL, page_array);
 }
 
 #define alloc_pages_bulk_node(...)				\
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index eb83cff7db8c..26274302ee01 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -2537,13 +2537,13 @@ static unsigned long alloc_pages_bulk_interleave(gfp_t gfp,
 		if (delta) {
 			nr_allocated = alloc_pages_bulk_noprof(gfp,
 					interleave_nodes(pol), NULL,
-					nr_pages_per_node + 1,
+					nr_pages_per_node + 1, NULL,
 					page_array);
 			delta--;
 		} else {
 			nr_allocated = alloc_pages_bulk_noprof(gfp,
 					interleave_nodes(pol), NULL,
-					nr_pages_per_node, page_array);
+					nr_pages_per_node, NULL, page_array);
 		}
 
 		page_array += nr_allocated;
@@ -2593,7 +2593,7 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
 	if (weight && node_isset(node, nodes)) {
 		node_pages = min(rem_pages, weight);
 		nr_allocated = __alloc_pages_bulk(gfp, node, NULL, node_pages,
-						  page_array);
+						  NULL, page_array);
 		page_array += nr_allocated;
 		total_allocated += nr_allocated;
 		/* if that's all the pages, no need to interleave */
@@ -2658,7 +2658,7 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
 		if (!node_pages)
 			break;
 		nr_allocated = __alloc_pages_bulk(gfp, node, NULL, node_pages,
-						  page_array);
+						  NULL, page_array);
 		page_array += nr_allocated;
 		total_allocated += nr_allocated;
 		if (total_allocated == nr_pages)
@@ -2682,11 +2682,11 @@ static unsigned long alloc_pages_bulk_preferred_many(gfp_t gfp, int nid,
 	preferred_gfp &= ~(__GFP_DIRECT_RECLAIM | __GFP_NOFAIL);
 
 	nr_allocated  = alloc_pages_bulk_noprof(preferred_gfp, nid, &pol->nodes,
-					   nr_pages, page_array);
+					   nr_pages, NULL, page_array);
 
 	if (nr_allocated < nr_pages)
 		nr_allocated += alloc_pages_bulk_noprof(gfp, numa_node_id(), NULL,
-				nr_pages - nr_allocated,
+				nr_pages - nr_allocated, NULL,
 				page_array + nr_allocated);
 	return nr_allocated;
 }
@@ -2722,7 +2722,7 @@ unsigned long alloc_pages_bulk_mempolicy_noprof(gfp_t gfp,
 	nid = numa_node_id();
 	nodemask = policy_nodemask(gfp, pol, NO_INTERLEAVE_INDEX, &nid);
 	return alloc_pages_bulk_noprof(gfp, nid, nodemask,
-				       nr_pages, page_array);
+				       nr_pages, NULL, page_array);
 }
 
 int vma_dup_policy(struct vm_area_struct *src, struct vm_area_struct *dst)
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index d1d037f97c5f..a95bdd8cbf5b 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4940,23 +4940,28 @@ static inline bool prepare_alloc_pages(gfp_t gfp_mask, unsigned int order,
 }
 
 /*
- * __alloc_pages_bulk - Allocate a number of order-0 pages to an array
+ * __alloc_pages_bulk - Allocate a number of order-0 pages to a list or array
  * @gfp: GFP flags for the allocation
  * @preferred_nid: The preferred NUMA node ID to allocate from
  * @nodemask: Set of nodes to allocate from, may be NULL
- * @nr_pages: The number of pages desired in the array
- * @page_array: Array to store the pages
+ * @nr_pages: The number of pages desired on the list or array
+ * @page_list: Optional list to store the allocated pages
+ * @page_array: Optional array to store the pages
  *
  * This is a batched version of the page allocator that attempts to
- * allocate nr_pages quickly. Pages are added to the page_array.
+ * allocate nr_pages quickly. Pages are added to page_list if page_list
+ * is not NULL, otherwise it is assumed that the page_array is valid.
  *
- * Note that only NULL elements are populated with pages and nr_pages
+ * For lists, nr_pages is the number of pages that should be allocated.
+ *
+ * For arrays, only NULL elements are populated with pages and nr_pages
  * is the maximum number of pages that will be stored in the array.
  *
- * Returns the number of pages in the array.
+ * Returns the number of pages on the list or array.
  */
 unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 			nodemask_t *nodemask, int nr_pages,
+			struct list_head *page_list,
 			struct page **page_array)
 {
 	struct page *page;
@@ -4974,7 +4979,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 	 * Skip populated array elements to determine if any pages need
 	 * to be allocated before disabling IRQs.
 	 */
-	while (nr_populated < nr_pages && page_array[nr_populated])
+	while (page_array && nr_populated < nr_pages && page_array[nr_populated])
 		nr_populated++;
 
 	/* No pages requested? */
@@ -4982,7 +4987,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 		goto out;
 
 	/* Already populated array? */
-	if (unlikely(nr_pages - nr_populated == 0))
+	if (unlikely(page_array && nr_pages - nr_populated == 0))
 		goto out;
 
 	/* Bulk allocator does not support memcg accounting. */
@@ -5064,7 +5069,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 	while (nr_populated < nr_pages) {
 
 		/* Skip existing pages */
-		if (page_array[nr_populated]) {
+		if (page_array && page_array[nr_populated]) {
 			nr_populated++;
 			continue;
 		}
@@ -5083,7 +5088,11 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 
 		prep_new_page(page, 0, gfp, 0);
 		set_page_refcounted(page);
-		page_array[nr_populated++] = page;
+		if (page_list)
+			list_add(&page->lru, page_list);
+		else
+			page_array[nr_populated] = page;
+		nr_populated++;
 	}
 
 	pcp_spin_unlock(pcp);
@@ -5100,8 +5109,14 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 
 failed:
 	page = __alloc_pages_noprof(gfp, 0, preferred_nid, nodemask);
-	if (page)
-		page_array[nr_populated++] = page;
+	if (page) {
+		if (page_list)
+			list_add(&page->lru, page_list);
+		else
+			page_array[nr_populated] = page;
+		nr_populated++;
+	}
+
 	goto out;
 }
 EXPORT_SYMBOL_GPL(alloc_pages_bulk_noprof);
-- 
2.25.1

