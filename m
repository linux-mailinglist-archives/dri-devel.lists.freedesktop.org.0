Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2252A7F58DC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 08:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE40C10E6D6;
	Thu, 23 Nov 2023 07:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DAEE10E6D3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 07:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700723309; x=1732259309;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JveC5J73AXuIFwcZCQaP9Gn0jICa/20AkT8Zw92eLmk=;
 b=iMP4b4CJpA02vl90yrAQbo7TONq2fZKBFC5TewDFfkm1LKTC8hkKl6Us
 jCNGEMJRsv8S75VIfQxoTVP0kBo0VLzFhrlQXoPgU2THYv5f/sPViJF7K
 QoUkHcO1nquF1Nf4iU/4wzrYVmovBtYmjpX69y1F6VyDtxVXZDsRFSydK
 lplQcrTul8zNeMWatUDj+P1PXKJub4WHbQITPld2JIMBOWZhg9SPf+nfI
 KTEkMMmXV8cogRtyRsC5VuAzsuTgDvvrkLgoBnVZlsRdQABcFKPrUeptR
 QNOXFAcvn9jLTJa39P6PrYuECKuW/ZJ/kA+VolCXvA5fLYzWjCLH95u3W w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="382612351"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; d="scan'208";a="382612351"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 23:08:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="8757723"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 23:08:24 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v5 4/5] udmabuf: Pin the pages using pin_user_pages_fd() API
 (v3)
Date: Wed, 22 Nov 2023 22:44:42 -0800
Message-Id: <20231123064443.1035709-5-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231123064443.1035709-1-vivek.kasireddy@intel.com>
References: <20231123064443.1035709-1-vivek.kasireddy@intel.com>
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

Using pin_user_pages_fd() will ensure that the pages are pinned
correctly using FOLL_PIN. And, this also ensures that we don't
accidentally break features such as memory hotunplug as it would
not allow pinning pages in the movable zone.

Using this new API also simplifies the code as we no longer have
to deal with extracting individual pages from their mappings. As
a result, we can drop some of the local variables such as page,
hpage, mapping, etc.

v2:
- Adjust to the change in signature of pin_user_pages_fd() by
  passing in file * instead of fd.

v3:
- Limit the changes in this patch only to those that are required
  for using pin_user_pages_fd()
- Slightly improve the commit message

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
 drivers/dma-buf/udmabuf.c | 61 ++++++++++++++-------------------------
 1 file changed, 22 insertions(+), 39 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index d77d119f4048..883bd97e4076 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -156,7 +156,8 @@ static void release_udmabuf(struct dma_buf *buf)
 		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
 
 	for (pg = 0; pg < ubuf->pagecount; pg++)
-		put_page(ubuf->pages[pg]);
+		unpin_user_page(ubuf->pages[pg]);
+
 	kfree(ubuf->subpgoff);
 	kfree(ubuf->pages);
 	kfree(ubuf);
@@ -217,15 +218,13 @@ static long udmabuf_create(struct miscdevice *device,
 {
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 	struct file *memfd = NULL;
-	struct address_space *mapping = NULL;
 	struct udmabuf *ubuf;
 	struct dma_buf *buf;
-	pgoff_t pgoff, pgcnt, pgidx, pgbuf = 0, pglimit;
-	struct page *page, *hpage = NULL;
-	struct folio *folio;
+	pgoff_t pgcnt, pgbuf = 0, pglimit, nr_pages;
 	pgoff_t mapidx, chunkoff, maxchunks;
 	struct hstate *hpstate;
-	int seals, ret = -EINVAL;
+	long ret = -EINVAL;
+	int seals;
 	u32 i, flags;
 
 	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
@@ -259,8 +258,7 @@ static long udmabuf_create(struct miscdevice *device,
 		memfd = fget(list[i].memfd);
 		if (!memfd)
 			goto err;
-		mapping = memfd->f_mapping;
-		if (!shmem_mapping(mapping) && !is_file_hugepages(memfd))
+		if (!shmem_file(memfd) && !is_file_hugepages(memfd))
 			goto err;
 		seals = memfd_fcntl(memfd, F_GET_SEALS, 0);
 		if (seals == -EINVAL)
@@ -269,7 +267,7 @@ static long udmabuf_create(struct miscdevice *device,
 		if ((seals & SEALS_WANTED) != SEALS_WANTED ||
 		    (seals & SEALS_DENIED) != 0)
 			goto err;
-		pgoff = list[i].offset >> PAGE_SHIFT;
+		mapidx = list[i].offset >> PAGE_SHIFT;
 		pgcnt = list[i].size   >> PAGE_SHIFT;
 		if (is_file_hugepages(memfd)) {
 			if (!ubuf->subpgoff) {
@@ -287,42 +285,26 @@ static long udmabuf_create(struct miscdevice *device,
 				    ~huge_page_mask(hpstate)) >> PAGE_SHIFT;
 			maxchunks = huge_page_size(hpstate) >> PAGE_SHIFT;
 		}
-		for (pgidx = 0; pgidx < pgcnt; pgidx++) {
+
+		do {
+			nr_pages = shmem_file(memfd) ? pgcnt : 1;
+			ret = pin_user_pages_fd(memfd, mapidx, nr_pages,
+						ubuf->pages + pgbuf);
+			if (ret < 0)
+				goto err;
+
 			if (is_file_hugepages(memfd)) {
-				if (!hpage) {
-					folio = __filemap_get_folio(mapping, mapidx,
-								    FGP_ACCESSED, 0);
-					hpage = IS_ERR(folio) ? NULL: &folio->page;
-					if (!hpage) {
-						ret = -EINVAL;
-						goto err;
-					}
-				}
-				get_page(hpage);
-				ubuf->pages[pgbuf] = hpage;
-				ubuf->subpgoff[pgbuf++] = chunkoff << PAGE_SHIFT;
+				ubuf->subpgoff[pgbuf] = chunkoff << PAGE_SHIFT;
 				if (++chunkoff == maxchunks) {
-					put_page(hpage);
-					hpage = NULL;
 					chunkoff = 0;
 					mapidx++;
 				}
-			} else {
-				mapidx = pgoff + pgidx;
-				page = shmem_read_mapping_page(mapping, mapidx);
-				if (IS_ERR(page)) {
-					ret = PTR_ERR(page);
-					goto err;
-				}
-				ubuf->pages[pgbuf++] = page;
 			}
-		}
+			pgbuf += nr_pages;
+			pgcnt -= nr_pages;
+		} while (pgcnt > 0);
 		fput(memfd);
 		memfd = NULL;
-		if (hpage) {
-			put_page(hpage);
-			hpage = NULL;
-		}
 	}
 
 	exp_info.ops  = &udmabuf_ops;
@@ -343,8 +325,9 @@ static long udmabuf_create(struct miscdevice *device,
 	return dma_buf_fd(buf, flags);
 
 err:
-	while (pgbuf > 0)
-		put_page(ubuf->pages[--pgbuf]);
+	while (pgbuf-- > 0)
+		if (ubuf->pages[pgbuf])
+			unpin_user_page(ubuf->pages[pgbuf]);
 	if (memfd)
 		fput(memfd);
 	kfree(ubuf->subpgoff);
-- 
2.39.2

