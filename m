Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C85AA3AC7B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 00:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3447610E239;
	Tue, 18 Feb 2025 23:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="bWfB42Hu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D02710E157
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 23:29:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1739921336; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=l0KzvJGwWpePn6EQSYFdMNxLgi1lxE3dcL7INCLKWOPETJf9XELBUfuTDbmUi4J29CRfbGBts5w70TAQIG2Fcd33u7f5eZwjY8StUwnD/O0kXPbu5Ns/JcrjCLJcUnPhlGXfXk989lhZcZGCIs8CHZAO1OC/Wpr0yomVb4m+/Bw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1739921336;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=8Rmrq+SVHz9TSycz2daVmEOgD0I/l/bPDtjOwgr6T4I=; 
 b=kOdPjJasFNnkctBMarNyUNAcUu5ruNFarIBLbsMBPDdaEHgn3+hacinnLd9kMTJjliBdSFyHXE0u8s88wKUHz/hU8rbacHwwydU/k/s/5+K5Bb5Vo0kGXq9jWfLHhwKKX+lwGS8t4qmEDK7F3jPG9oaOXO5Ksc1sE8TZkHaFAJc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739921336; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=8Rmrq+SVHz9TSycz2daVmEOgD0I/l/bPDtjOwgr6T4I=;
 b=bWfB42HuLv1Z+nllroUYZ+ikzWa0+ulO1cDS+ohv5ZKQOs/tgR4pisGzzEK4vUI0
 7Q5W4lTEXexyw/wO7RgC1xscPa4EjM9Bd38rIYEYGZjGHngriDBlfeVmrV9+lzba6QX
 34id3AF1B/ZUhHU9ILByIufRcU3o91udZXfu2waE=
Received: by mx.zohomail.com with SMTPS id 1739921333909239.0258459553687;
 Tue, 18 Feb 2025 15:28:53 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [RFC PATCH 2/7] lib/scatterlist.c: Support constructing sgt from page
 xarray
Date: Tue, 18 Feb 2025 23:25:32 +0000
Message-ID: <20250218232552.3450939-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250218232552.3450939-1-adrian.larumbe@collabora.com>
References: <20250218232552.3450939-1-adrian.larumbe@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for a future commit that will introduce sparse allocation of
pages in DRM shmem, a scatterlist function that knows how to deal with an xarray
collection of memory pages had to be introduced.

Because the new function is identical to the existing one that deals with a page
array, the page_array abstraction is also introduced, which hides the way pages
are retrieved from a collection.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 include/linux/scatterlist.h |  47 +++++++++++++
 lib/scatterlist.c           | 128 ++++++++++++++++++++++++++++++++++++
 2 files changed, 175 insertions(+)

diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index d836e7440ee8..0045df9c374f 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -48,6 +48,39 @@ struct sg_append_table {
 	unsigned int total_nents;	/* Total entries in the table */
 };
 
+struct page_array {
+	union {
+		struct page **array;
+		struct xarray *xarray;
+	};
+
+	struct page *(*get_page)(struct page_array, unsigned int);
+};
+
+static inline struct page *page_array_get_page(struct page_array a,
+					       unsigned int index)
+{
+	return a.array[index];
+}
+
+static inline struct page *page_xarray_get_page(struct page_array a,
+						unsigned int index)
+{
+	return xa_load(a.xarray, index);
+}
+
+#define PAGE_ARRAY(pages)				\
+	((struct page_array) {				\
+		.array = pages,				\
+		.get_page = page_array_get_page,	\
+	})
+
+#define PAGE_XARRAY(pages)				\
+	((struct page_array) {				\
+		.xarray = pages,			\
+		.get_page = page_xarray_get_page,	\
+	})
+
 /*
  * Notes on SG table design.
  *
@@ -448,6 +481,20 @@ int sg_alloc_table_from_pages_segment(struct sg_table *sgt, struct page **pages,
 				      unsigned long size,
 				      unsigned int max_segment, gfp_t gfp_mask);
 
+int sg_alloc_table_from_page_array_segment(struct sg_table *sgt, struct page_array pages,
+					   unsigned int idx, unsigned int n_pages, unsigned int offset,
+					   unsigned long size, unsigned int max_segment, gfp_t gfp_mask);
+
+static inline int sg_alloc_table_from_page_xarray(struct sg_table *sgt, struct xarray *pages,
+						  unsigned int idx, unsigned int n_pages, unsigned int offset,
+						  unsigned long size, gfp_t gfp_mask)
+{
+	struct page_array parray = PAGE_XARRAY(pages);
+
+	return sg_alloc_table_from_page_array_segment(sgt, parray, idx, n_pages, offset,
+						      size, UINT_MAX, gfp_mask);
+}
+
 /**
  * sg_alloc_table_from_pages - Allocate and initialize an sg table from
  *			       an array of pages
diff --git a/lib/scatterlist.c b/lib/scatterlist.c
index 5bb6b8aff232..669ebd23e4ad 100644
--- a/lib/scatterlist.c
+++ b/lib/scatterlist.c
@@ -553,6 +553,115 @@ int sg_alloc_append_table_from_pages(struct sg_append_table *sgt_append,
 }
 EXPORT_SYMBOL(sg_alloc_append_table_from_pages);
 
+static inline int
+sg_alloc_append_table_from_page_array(struct sg_append_table *sgt_append,
+				      struct page_array pages,
+				      unsigned int first_page,
+				      unsigned int n_pages,
+				      unsigned int offset, unsigned long size,
+				      unsigned int max_segment,
+				      unsigned int left_pages, gfp_t gfp_mask)
+{
+	unsigned int chunks, seg_len, i, prv_len = 0;
+	unsigned int added_nents = 0;
+	struct scatterlist *s = sgt_append->prv;
+	unsigned int cur_pg_index = first_page;
+	unsigned int last_pg_index = first_page + n_pages - 1;
+	struct page *last_pg;
+
+	/*
+	 * The algorithm below requires max_segment to be aligned to PAGE_SIZE
+	 * otherwise it can overshoot.
+	 */
+	max_segment = ALIGN_DOWN(max_segment, PAGE_SIZE);
+	if (WARN_ON(max_segment < PAGE_SIZE))
+		return -EINVAL;
+
+	if (IS_ENABLED(CONFIG_ARCH_NO_SG_CHAIN) && sgt_append->prv)
+		return -EOPNOTSUPP;
+
+	if (sgt_append->prv) {
+		unsigned long next_pfn;
+		struct page *page;
+
+		if (WARN_ON(offset))
+			return -EINVAL;
+
+		/* Merge contiguous pages into the last SG */
+		page = pages.get_page(pages, cur_pg_index);
+		prv_len = sgt_append->prv->length;
+		next_pfn = (sg_phys(sgt_append->prv) + prv_len) / PAGE_SIZE;
+		if (page_to_pfn(page) == next_pfn) {
+			last_pg = pfn_to_page(next_pfn - 1);
+			while (cur_pg_index <= last_pg_index &&
+			       pages_are_mergeable(page, last_pg)) {
+				if (sgt_append->prv->length + PAGE_SIZE > max_segment)
+					break;
+				sgt_append->prv->length += PAGE_SIZE;
+				last_pg = page;
+				cur_pg_index++;
+			}
+			if (cur_pg_index > last_pg_index)
+				goto out;
+		}
+	}
+
+	/* compute number of contiguous chunks */
+	chunks = 1;
+	seg_len = 0;
+	for (i = cur_pg_index + 1; i <= last_pg_index; i++) {
+		seg_len += PAGE_SIZE;
+		if (seg_len >= max_segment ||
+		    !pages_are_mergeable(pages.get_page(pages, i),
+					 pages.get_page(pages, i - 1))) {
+			chunks++;
+			seg_len = 0;
+		}
+	}
+
+	/* merging chunks and putting them into the scatterlist */
+	for (i = 0; i < chunks; i++) {
+		unsigned int j, chunk_size;
+
+		/* look for the end of the current chunk */
+		seg_len = 0;
+		for (j = cur_pg_index + 1; j <= last_pg_index; j++) {
+			seg_len += PAGE_SIZE;
+			if (seg_len >= max_segment ||
+			    !pages_are_mergeable(pages.get_page(pages, j),
+						 pages.get_page(pages, j - 1)))
+				break;
+		}
+
+		/* Pass how many chunks might be left */
+		s = get_next_sg(sgt_append, s, chunks - i + left_pages,
+				gfp_mask);
+		if (IS_ERR(s)) {
+			/*
+			 * Adjust entry length to be as before function was
+			 * called.
+			 */
+			if (sgt_append->prv)
+				sgt_append->prv->length = prv_len;
+			return PTR_ERR(s);
+		}
+		chunk_size = ((j - cur_pg_index) << PAGE_SHIFT) - offset;
+		sg_set_page(s, pages.get_page(pages, cur_pg_index),
+			    min_t(unsigned long, size, chunk_size), offset);
+		added_nents++;
+		size -= chunk_size;
+		offset = 0;
+		cur_pg_index = j;
+	}
+	sgt_append->sgt.nents += added_nents;
+	sgt_append->sgt.orig_nents = sgt_append->sgt.nents;
+	sgt_append->prv = s;
+out:
+	if (!left_pages)
+		sg_mark_end(s);
+	return 0;
+}
+
 /**
  * sg_alloc_table_from_pages_segment - Allocate and initialize an sg table from
  *                                     an array of pages and given maximum
@@ -596,6 +705,25 @@ int sg_alloc_table_from_pages_segment(struct sg_table *sgt, struct page **pages,
 }
 EXPORT_SYMBOL(sg_alloc_table_from_pages_segment);
 
+int sg_alloc_table_from_page_array_segment(struct sg_table *sgt, struct page_array pages,
+					   unsigned int idx, unsigned int n_pages, unsigned int offset,
+					   unsigned long size, unsigned int max_segment, gfp_t gfp_mask)
+{
+	struct sg_append_table append = {};
+	int err;
+
+	err = sg_alloc_append_table_from_page_array(&append, pages, idx, n_pages, offset,
+						    size, max_segment, 0, gfp_mask);
+	if (err) {
+		sg_free_append_table(&append);
+		return err;
+	}
+	memcpy(sgt, &append.sgt, sizeof(*sgt));
+	WARN_ON(append.total_nents != sgt->orig_nents);
+	return 0;
+}
+EXPORT_SYMBOL(sg_alloc_table_from_page_array_segment);
+
 #ifdef CONFIG_SGL_ALLOC
 
 /**
-- 
2.47.1

