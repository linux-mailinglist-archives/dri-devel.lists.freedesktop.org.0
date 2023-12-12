Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C80880E55D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 09:01:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A709210E589;
	Tue, 12 Dec 2023 08:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41A510E4F6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 08:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702368086; x=1733904086;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mAcJFIew1ykttdyyN6tBQbZzsTFAdhUHsqSaxgVF/4Y=;
 b=jEY61eTSYJSBZoDg/OPxDcG9RqD1gzPRlWs3bnLxbPn0uiQUzL7tn0i3
 h5qnijzhBdQdZO/7gxdnPnTlz6MKbXSOmvRvOw7FQb38vEAoQGTeOFhxK
 VNKppcSkuauNCF2omSmIhB3CU+0eAvn5NF2l3WGfvPuul3Ewcon45vtAy
 KM/q/XfcyBfvMiPjQEbszr0VGBQpibsVb5Pwu+ApsthP2pI7muJUwQRnJ
 w+oWxM6rUWdf8vg0YDwXH3OLBvHtJ+5+z2iLKrbDxZk4bKCDdltFNpNQd
 d721yqtVQ1MLr+QFSMTJdluBk00DKqHqTGufcgDAOwTvOsr/qEGQqbhFE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="397553985"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="397553985"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 00:01:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="802376335"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="802376335"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 00:01:25 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v7 5/6] udmabuf: Pin the pages using memfd_pin_folios() API
 (v5)
Date: Mon, 11 Dec 2023 23:38:02 -0800
Message-Id: <20231212073803.3233055-6-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231212073803.3233055-1-vivek.kasireddy@intel.com>
References: <20231212073803.3233055-1-vivek.kasireddy@intel.com>
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
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Junxiao Chang <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using memfd_pin_folios() will ensure that the pages are pinned
correctly using FOLL_PIN. And, this also ensures that we don't
accidentally break features such as memory hotunplug as it would
not allow pinning pages in the movable zone.

Using this new API also simplifies the code as we no longer have
to deal with extracting individual pages from their mappings or
handle shmem and hugetlb cases separately.

v2:
- Adjust to the change in signature of pin_user_pages_fd() by
  passing in file * instead of fd.

v3:
- Limit the changes in this patch only to those that are required
  for using pin_user_pages_fd()
- Slightly improve the commit message

v4:
- Adjust to the change in name of the API (memfd_pin_user_pages)

v5:
- Adjust to the changes in memfd_pin_folios which now populates
  a list of folios and offsets

Cc: David Hildenbrand <david@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Hugh Dickins <hughd@google.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Junxiao Chang <junxiao.chang@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/udmabuf.c | 85 ++++++---------------------------------
 1 file changed, 12 insertions(+), 73 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index e1b8da3c9b2a..a614e720837d 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -42,7 +42,7 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
 	if (pgoff >= ubuf->pagecount)
 		return VM_FAULT_SIGBUS;
 
-	pfn = page_to_pfn(&ubuf->folios[pgoff]->page);
+	pfn = page_to_pfn(folio_page(ubuf->folios[pgoff], 0));
 	pfn += ubuf->offsets[pgoff] >> PAGE_SHIFT;
 
 	return vmf_insert_pfn(vma, vmf->address, pfn);
@@ -79,7 +79,7 @@ static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 		return -ENOMEM;
 
 	for (pg = 0; pg < ubuf->pagecount; pg++)
-		pages[pg] = &ubuf->folios[pg]->page;
+		pages[pg] = folio_page(ubuf->folios[pg], 0);
 
 	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
 	kfree(pages);
@@ -163,7 +163,8 @@ static void release_udmabuf(struct dma_buf *buf)
 		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
 
 	for (pg = 0; pg < ubuf->pagecount; pg++)
-		folio_put(ubuf->folios[pg]);
+		unpin_user_page(folio_page(ubuf->folios[pg], 0));
+
 	kfree(ubuf->offsets);
 	kfree(ubuf->folios);
 	kfree(ubuf);
@@ -218,65 +219,6 @@ static const struct dma_buf_ops udmabuf_ops = {
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
-		folio = shmem_read_folio(memfd->f_mapping,
-					 pgoff + pgidx);
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
@@ -325,7 +267,7 @@ static long udmabuf_create(struct miscdevice *device,
 	pgoff_t pgcnt, pgbuf = 0, pglimit;
 	struct file *memfd = NULL;
 	struct udmabuf *ubuf;
-	int ret = -EINVAL;
+	long ret = -EINVAL;
 	u32 i, flags;
 
 	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
@@ -366,17 +308,13 @@ static long udmabuf_create(struct miscdevice *device,
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
+		ret = memfd_pin_folios(memfd, list[i].offset, pgcnt,
+				       ubuf->folios + pgbuf,
+				       ubuf->offsets + pgbuf);
 		if (ret < 0)
 			goto err;
 
+		pgbuf += pgcnt;
 		fput(memfd);
 		memfd = NULL;
 	}
@@ -389,8 +327,9 @@ static long udmabuf_create(struct miscdevice *device,
 	return ret;
 
 err:
-	while (pgbuf > 0)
-		folio_put(ubuf->folios[--pgbuf]);
+	while (pgbuf-- > 0)
+		if (ubuf->folios[pgbuf])
+			unpin_user_page(folio_page(ubuf->folios[pgbuf], 0));
 	if (memfd)
 		fput(memfd);
 	kfree(ubuf->offsets);
-- 
2.39.2

