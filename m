Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6977C907EAD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 00:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B5810EBD3;
	Thu, 13 Jun 2024 22:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LRsQp+2P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E72810EBCE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 22:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718316818; x=1749852818;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tt6lFLF/Si06sd9m8G4bs00brFbAJk62FJizVRolUmA=;
 b=LRsQp+2PELFYBRbXh0lAo0J8JFk6Lge/FdNVXgDn2c7ZuZy32htcTbtX
 mfTkxDAxD7Rx8cuJwSr8zu5CAK0saE8PUm9XIyYx2udmQwnXCjN9sQxYF
 7wl8D1d2kclu+2xrmlO0fyjFCJkGQI/gQTl19psx8yS1XQThFiL36ObHe
 XY9RuoUCiutQZeljwDN6FaiNXNX9pG5kftwn5Yeq588iyJZ9oe22w1KkU
 wRqA8/KJvbXuYpTPP/7xafx6UujKGUCxhnlegPNNx6gEb7m0LKBuvwSrX
 Y1+nMUO5w/nhTm3DwVghepLfdNf/TO20CDrssgRqtHxit20wZgKHtdwHE Q==;
X-CSE-ConnectionGUID: tzkEY+cIRuK3hed7mrY1Yg==
X-CSE-MsgGUID: fSHO3y1URc+ebhh2bGygzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="32720575"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="32720575"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 15:13:38 -0700
X-CSE-ConnectionGUID: xrU9K2iCT16aHJMZi0oBxQ==
X-CSE-MsgGUID: mj1NBO4RQICH4KdWcZDYNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="45214114"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 15:13:37 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>,
 Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 Junxiao Chang <junxiao.chang@intel.com>, Dave Airlie <airlied@redhat.com>
Subject: [PATCH v15 8/9] udmabuf: Pin the pages using memfd_pin_folios() API
Date: Thu, 13 Jun 2024 14:42:10 -0700
Message-ID: <20240613214741.1029446-9-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240613214741.1029446-1-vivek.kasireddy@intel.com>
References: <20240613214741.1029446-1-vivek.kasireddy@intel.com>
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

Using memfd_pin_folios() will ensure that the pages are pinned
correctly using FOLL_PIN. And, this also ensures that we don't
accidentally break features such as memory hotunplug as it would
not allow pinning pages in the movable zone.

Using this new API also simplifies the code as we no longer have
to deal with extracting individual pages from their mappings or
handle shmem and hugetlb cases separately.

Cc: David Hildenbrand <david@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Hugh Dickins <hughd@google.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Junxiao Chang <junxiao.chang@intel.com>
Acked-by: Dave Airlie <airlied@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/udmabuf.c | 155 ++++++++++++++++++++------------------
 1 file changed, 80 insertions(+), 75 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index e67515808ed3..047c3cd2ceff 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -30,6 +30,12 @@ struct udmabuf {
 	struct sg_table *sg;
 	struct miscdevice *device;
 	pgoff_t *offsets;
+	struct list_head unpin_list;
+};
+
+struct udmabuf_folio {
+	struct folio *folio;
+	struct list_head list;
 };
 
 static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
@@ -153,17 +159,43 @@ static void unmap_udmabuf(struct dma_buf_attachment *at,
 	return put_sg_table(at->dev, sg, direction);
 }
 
+static void unpin_all_folios(struct list_head *unpin_list)
+{
+	struct udmabuf_folio *ubuf_folio;
+
+	while (!list_empty(unpin_list)) {
+		ubuf_folio = list_first_entry(unpin_list,
+					      struct udmabuf_folio, list);
+		unpin_folio(ubuf_folio->folio);
+
+		list_del(&ubuf_folio->list);
+		kfree(ubuf_folio);
+	}
+}
+
+static int add_to_unpin_list(struct list_head *unpin_list,
+			     struct folio *folio)
+{
+	struct udmabuf_folio *ubuf_folio;
+
+	ubuf_folio = kzalloc(sizeof(*ubuf_folio), GFP_KERNEL);
+	if (!ubuf_folio)
+		return -ENOMEM;
+
+	ubuf_folio->folio = folio;
+	list_add_tail(&ubuf_folio->list, unpin_list);
+	return 0;
+}
+
 static void release_udmabuf(struct dma_buf *buf)
 {
 	struct udmabuf *ubuf = buf->priv;
 	struct device *dev = ubuf->device->this_device;
-	pgoff_t pg;
 
 	if (ubuf->sg)
 		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
 
-	for (pg = 0; pg < ubuf->pagecount; pg++)
-		folio_put(ubuf->folios[pg]);
+	unpin_all_folios(&ubuf->unpin_list);
 	kfree(ubuf->offsets);
 	kfree(ubuf->folios);
 	kfree(ubuf);
@@ -218,64 +250,6 @@ static const struct dma_buf_ops udmabuf_ops = {
 #define SEALS_WANTED (F_SEAL_SHRINK)
 #define SEALS_DENIED (F_SEAL_WRITE)
 
-static int handle_hugetlb_pages(struct udmabuf *ubuf, struct file *memfd,
-				pgoff_t offset, pgoff_t pgcnt,
-				pgoff_t *pgbuf)
-{
-	struct hstate *hpstate = hstate_file(memfd);
-	pgoff_t mapidx = offset >> huge_page_shift(hpstate);
-	pgoff_t subpgoff = (offset & ~huge_page_mask(hpstate)) >> PAGE_SHIFT;
-	pgoff_t maxsubpgs = huge_page_size(hpstate) >> PAGE_SHIFT;
-	struct folio *folio = NULL;
-	pgoff_t pgidx;
-
-	mapidx <<= huge_page_order(hpstate);
-	for (pgidx = 0; pgidx < pgcnt; pgidx++) {
-		if (!folio) {
-			folio = __filemap_get_folio(memfd->f_mapping,
-						    mapidx,
-						    FGP_ACCESSED, 0);
-			if (IS_ERR(folio))
-				return PTR_ERR(folio);
-		}
-
-		folio_get(folio);
-		ubuf->folios[*pgbuf] = folio;
-		ubuf->offsets[*pgbuf] = subpgoff << PAGE_SHIFT;
-		(*pgbuf)++;
-		if (++subpgoff == maxsubpgs) {
-			folio_put(folio);
-			folio = NULL;
-			subpgoff = 0;
-			mapidx += pages_per_huge_page(hpstate);
-		}
-	}
-
-	if (folio)
-		folio_put(folio);
-
-	return 0;
-}
-
-static int handle_shmem_pages(struct udmabuf *ubuf, struct file *memfd,
-			      pgoff_t offset, pgoff_t pgcnt,
-			      pgoff_t *pgbuf)
-{
-	pgoff_t pgidx, pgoff = offset >> PAGE_SHIFT;
-	struct folio *folio = NULL;
-
-	for (pgidx = 0; pgidx < pgcnt; pgidx++) {
-		folio = shmem_read_folio(memfd->f_mapping, pgoff + pgidx);
-		if (IS_ERR(folio))
-			return PTR_ERR(folio);
-
-		ubuf->folios[*pgbuf] = folio;
-		(*pgbuf)++;
-	}
-
-	return 0;
-}
-
 static int check_memfd_seals(struct file *memfd)
 {
 	int seals;
@@ -321,16 +295,19 @@ static long udmabuf_create(struct miscdevice *device,
 			   struct udmabuf_create_list *head,
 			   struct udmabuf_create_item *list)
 {
-	pgoff_t pgcnt, pgbuf = 0, pglimit;
+	pgoff_t pgoff, pgcnt, pglimit, pgbuf = 0;
+	long nr_folios, ret = -EINVAL;
 	struct file *memfd = NULL;
+	struct folio **folios;
 	struct udmabuf *ubuf;
-	int ret = -EINVAL;
-	u32 i, flags;
+	u32 i, j, k, flags;
+	loff_t end;
 
 	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
 	if (!ubuf)
 		return -ENOMEM;
 
+	INIT_LIST_HEAD(&ubuf->unpin_list);
 	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
 	for (i = 0; i < head->count; i++) {
 		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
@@ -366,17 +343,46 @@ static long udmabuf_create(struct miscdevice *device,
 			goto err;
 
 		pgcnt = list[i].size >> PAGE_SHIFT;
-		if (is_file_hugepages(memfd))
-			ret = handle_hugetlb_pages(ubuf, memfd,
-						   list[i].offset,
-						   pgcnt, &pgbuf);
-		else
-			ret = handle_shmem_pages(ubuf, memfd,
-						 list[i].offset,
-						 pgcnt, &pgbuf);
-		if (ret < 0)
+		folios = kmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
+		if (!folios) {
+			ret = -ENOMEM;
 			goto err;
+		}
 
+		end = list[i].offset + (pgcnt << PAGE_SHIFT) - 1;
+		ret = memfd_pin_folios(memfd, list[i].offset, end,
+				       folios, pgcnt, &pgoff);
+		if (ret <= 0) {
+			kfree(folios);
+			if (!ret)
+				ret = -EINVAL;
+			goto err;
+		}
+
+		nr_folios = ret;
+		pgoff >>= PAGE_SHIFT;
+		for (j = 0, k = 0; j < pgcnt; j++) {
+			ubuf->folios[pgbuf] = folios[k];
+			ubuf->offsets[pgbuf] = pgoff << PAGE_SHIFT;
+
+			if (j == 0 || ubuf->folios[pgbuf-1] != folios[k]) {
+				ret = add_to_unpin_list(&ubuf->unpin_list,
+							folios[k]);
+				if (ret < 0) {
+					kfree(folios);
+					goto err;
+				}
+			}
+
+			pgbuf++;
+			if (++pgoff == folio_nr_pages(folios[k])) {
+				pgoff = 0;
+				if (++k == nr_folios)
+					break;
+			}
+		}
+
+		kfree(folios);
 		fput(memfd);
 		memfd = NULL;
 	}
@@ -389,10 +395,9 @@ static long udmabuf_create(struct miscdevice *device,
 	return ret;
 
 err:
-	while (pgbuf > 0)
-		folio_put(ubuf->folios[--pgbuf]);
 	if (memfd)
 		fput(memfd);
+	unpin_all_folios(&ubuf->unpin_list);
 	kfree(ubuf->offsets);
 	kfree(ubuf->folios);
 	kfree(ubuf);
-- 
2.45.1

