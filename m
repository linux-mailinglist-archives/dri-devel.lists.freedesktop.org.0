Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F99A7919F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 17:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BA410E7FA;
	Wed,  2 Apr 2025 15:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="XHNF/9U/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0670A10E7FC;
 Wed,  2 Apr 2025 15:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=UNBvZu32+wbhgVGJ/9V2hTzAlK5EbvmAK/2hRd+u46M=; b=XHNF/9U/du9de/iK9s+5I0zADe
 O+pcJekTrVv0miXdwnb2siiLrxPQ27obx126RH95lkiAfLPAAiw5DvsERoraJ1GxJ5zwc0OJN8MLJ
 mzz6kW7koritqrR8/48YFJXZ8pTDxscVtOMVpcZEwruRJWoZgw7wP6NWFJE+OwtsX98cnjHp30+IB
 mBwUPemgYHjyVvwXxn6n+4vuYbWzk0y5zi0LnKrLC/Wp2/1dvYNXnRqeKPpFabINxRCSZHqn+ho1y
 MGDRzGBrEvmxT/3g7p5MVUDU9NOB6UTqSjIzkQtteVdvzD7oY9ZCxp71gpUWpcba7+RjXi61HPi8L
 4YWmojyQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzzZX-00000009gsH-1u8G;
 Wed, 02 Apr 2025 15:00:07 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/9] shmem: Add shmem_writeout()
Date: Wed,  2 Apr 2025 15:59:59 +0100
Message-ID: <20250402150005.2309458-6-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402150005.2309458-1-willy@infradead.org>
References: <20250402150005.2309458-1-willy@infradead.org>
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

This will be the replacement for shmem_writepage().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/shmem_fs.h |  7 ++++---
 mm/shmem.c               | 20 ++++++++++++++------
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
index 0b273a7b9f01..5f03a39a26f7 100644
--- a/include/linux/shmem_fs.h
+++ b/include/linux/shmem_fs.h
@@ -104,10 +104,11 @@ static inline bool shmem_mapping(struct address_space *mapping)
 	return false;
 }
 #endif /* CONFIG_SHMEM */
-extern void shmem_unlock_mapping(struct address_space *mapping);
-extern struct page *shmem_read_mapping_page_gfp(struct address_space *mapping,
+void shmem_unlock_mapping(struct address_space *mapping);
+struct page *shmem_read_mapping_page_gfp(struct address_space *mapping,
 					pgoff_t index, gfp_t gfp_mask);
-extern void shmem_truncate_range(struct inode *inode, loff_t start, loff_t end);
+int shmem_writeout(struct folio *folio, struct writeback_control *wbc);
+void shmem_truncate_range(struct inode *inode, loff_t start, loff_t end);
 int shmem_unuse(unsigned int type);
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
diff --git a/mm/shmem.c b/mm/shmem.c
index 99327c30507c..7d377ceae035 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1536,12 +1536,20 @@ int shmem_unuse(unsigned int type)
 	return error;
 }
 
-/*
- * Move the page from the page cache to the swap cache.
- */
 static int shmem_writepage(struct page *page, struct writeback_control *wbc)
 {
-	struct folio *folio = page_folio(page);
+	return shmem_writeout(page_folio(page), wbc);
+}
+
+/**
+ * shmem_writeout - Write the folio to swap
+ * @folio: The folio to write
+ * @wbc: How writeback is to be done
+ *
+ * Move the folio from the page cache to the swap cache.
+ */
+int shmem_writeout(struct folio *folio, struct writeback_control *wbc)
+{
 	struct address_space *mapping = folio->mapping;
 	struct inode *inode = mapping->host;
 	struct shmem_inode_info *info = SHMEM_I(inode);
@@ -1586,9 +1594,8 @@ static int shmem_writepage(struct page *page, struct writeback_control *wbc)
 try_split:
 		/* Ensure the subpages are still dirty */
 		folio_test_set_dirty(folio);
-		if (split_huge_page_to_list_to_order(page, wbc->list, 0))
+		if (split_folio_to_list(folio, wbc->list))
 			goto redirty;
-		folio = page_folio(page);
 		folio_clear_dirty(folio);
 	}
 
@@ -1660,6 +1667,7 @@ static int shmem_writepage(struct page *page, struct writeback_control *wbc)
 	folio_unlock(folio);
 	return 0;
 }
+EXPORT_SYMBOL_GPL(shmem_writeout);
 
 #if defined(CONFIG_NUMA) && defined(CONFIG_TMPFS)
 static void shmem_show_mpol(struct seq_file *seq, struct mempolicy *mpol)
-- 
2.47.2

