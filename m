Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B6781580D
	for <lists+dri-devel@lfdr.de>; Sat, 16 Dec 2023 07:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5CB10EA7B;
	Sat, 16 Dec 2023 06:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E1510E077
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Dec 2023 06:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702708138; x=1734244138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KZifQoWRpsSYXJ0ERWQORaReoIuSKvbcn4vSOcCzi/s=;
 b=jrYmn4jQcTADvv85JwLO/cEykOiufPdsWENorbhQ8f509UMgsVOR2vP8
 kA8s/IJGsh3sSQ0+X+6R9DFE5Hgk48jd/D60cCP7J5out/vL/+zgh8iWC
 oyx/W/vnKY8+uY0J4yRI9tgusisz0WEO+eBe0C/lm4c1xfmpDYAszZcWE
 q8lAr+JSlNP6OagQAQrDUEysyn8uuYYCyLcFUHcNr++5dlrcd6KPyXhOc
 uVjLeyrJvGTTuqWNkZvuAmH0I8+QaD7JKdGPGZi4Z5s2GwzLwEIoyGI0A
 2C5LMSynbp3YrZHXxmuJtvOo9QdlEZs5A5MTAz57gW14kaD9Xco571ucj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="2186048"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="2186048"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 22:28:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="751178916"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="751178916"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 22:28:56 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v8 5/6] udmabuf: Pin the pages using memfd_pin_folios() API
 (v6)
Date: Fri, 15 Dec 2023 22:05:35 -0800
Message-Id: <20231216060536.3716466-6-vivek.kasireddy@intel.com>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hugh Dickins <hughd@google.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Matthew Wilcox <willy@infradead.org>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Junxiao Chang <junxiao.chang@intel.com>,
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

v6:
- Don't unnecessarily use folio_page() (Matthew)
- Pass [start, end] and max_folios to memfd_pin_folios()
- Create another temporary array to hold the folios returned by
  memfd_pin_folios() as we populate ubuf->folios.
- Unpin the folios only once as memfd_pin_folios pins them once

Cc: David Hildenbrand <david@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>
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
 drivers/dma-buf/udmabuf.c | 124 +++++++++++++++-----------------------
 1 file changed, 49 insertions(+), 75 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index a8f3af61f7f2..088f3a64e94c 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -153,17 +153,30 @@ static void unmap_udmabuf(struct dma_buf_attachment *at,
 	return put_sg_table(at->dev, sg, direction);
 }
 
+static void unpin_all_folios(struct udmabuf *ubuf, pgoff_t pgbuf)
+{
+	unsigned int i = 0, j;
+
+	while (i < pgbuf) {
+		for (j = i + 1; j < pgbuf; j++) {
+			if (ubuf->folios[i] != ubuf->folios[j])
+				break;
+		}
+
+		unpin_user_page(&ubuf->folios[i]->page);
+		i = j;
+	}
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
+	unpin_all_folios(ubuf, ubuf->pagecount);
 	kfree(ubuf->offsets);
 	kfree(ubuf->folios);
 	kfree(ubuf);
@@ -218,64 +231,6 @@ static const struct dma_buf_ops udmabuf_ops = {
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
@@ -321,11 +276,13 @@ static long udmabuf_create(struct miscdevice *device,
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
@@ -366,17 +323,35 @@ static long udmabuf_create(struct miscdevice *device,
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
+		if (ret < 0) {
+			kfree(folios);
+			goto err;
+		}
+
+		nr_folios = ret;
+		pgoff >>= PAGE_SHIFT;
+		for (j = 0, k = 0; j < pgcnt; j++) {
+			ubuf->folios[pgbuf] = folios[k];
+			ubuf->offsets[pgbuf] = pgoff << PAGE_SHIFT;
+			pgbuf++;
+
+			if (++pgoff == folio_nr_pages(folios[k])) {
+				pgoff = 0;
+				if (++k == nr_folios)
+					break;
+			}
+		}
+
+		kfree(folios);
 		fput(memfd);
 	}
 
@@ -388,10 +363,9 @@ static long udmabuf_create(struct miscdevice *device,
 	return ret;
 
 err:
-	while (pgbuf > 0)
-		folio_put(ubuf->folios[--pgbuf]);
 	if (memfd)
 		fput(memfd);
+	unpin_all_folios(ubuf, pgbuf);
 	kfree(ubuf->offsets);
 	kfree(ubuf->folios);
 	kfree(ubuf);
-- 
2.39.2

