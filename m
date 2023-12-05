Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFDA804997
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 06:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56BC10E208;
	Tue,  5 Dec 2023 05:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24A610E110
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 05:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701755932; x=1733291932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2lJJFbXrRuB2RlRAET5QtLu2irPUsw8bf+ZLAugxfOs=;
 b=Cn3FsqTLCypB9JPOniUE6JPEb9KLhDAOkuy1fXGDY6IPnGke5c9OArHI
 1IT8sFMyrno1sMXilFbZ+tBepzeV0PPokqibCcHz1Zv/jBUcjY/zL4HQe
 xHs0X6wnrAWr6PuehF+5xL2N3H/7tK9YGzpSkEAimzD1Ns0cqabmjlZKj
 +AoPtbZKMNoUaFd57jCC05XosO5zjO7dUEshgEWBQQ0uX3oF7MI06yXeN
 VqboPxcJQTim8B1y6H831HENU3kl0juuGriMwv0p7r5FtuvueDSz15Khs
 utYi/vk+GbUg7FW3ZBCL27H18RB+tGF9jpb5q+FO63PZSfVh/LYp5n17J Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="906316"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="906316"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 21:58:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="888807735"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="888807735"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 21:58:50 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v6 4/5] udmabuf: Pin the pages using memfd_pin_user_pages()
 API (v4)
Date: Mon,  4 Dec 2023 21:35:08 -0800
Message-Id: <20231205053509.2342169-5-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231205053509.2342169-1-vivek.kasireddy@intel.com>
References: <20231205053509.2342169-1-vivek.kasireddy@intel.com>
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

Using memfd_pin_user_pages() will ensure that the pages are pinned
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

v4:
- Adjust to the change in name of the API (memfd_pin_user_pages)

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
 drivers/dma-buf/udmabuf.c | 62 +++++++++++++++------------------------
 1 file changed, 23 insertions(+), 39 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 1d1cc5e7e613..887dc287a23c 100644
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
@@ -288,42 +286,27 @@ static long udmabuf_create(struct miscdevice *device,
 				    ~huge_page_mask(hpstate)) >> PAGE_SHIFT;
 			maxchunks = huge_page_size(hpstate) >> PAGE_SHIFT;
 		}
-		for (pgidx = 0; pgidx < pgcnt; pgidx++) {
+
+		do {
+			nr_pages = shmem_file(memfd) ? pgcnt : 1;
+			ret = memfd_pin_user_pages(memfd, mapidx, nr_pages,
+						   ubuf->pages + pgbuf);
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
 					mapidx += pages_per_huge_page(hpstate);
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
+
 		fput(memfd);
 		memfd = NULL;
-		if (hpage) {
-			put_page(hpage);
-			hpage = NULL;
-		}
 	}
 
 	exp_info.ops  = &udmabuf_ops;
@@ -344,8 +327,9 @@ static long udmabuf_create(struct miscdevice *device,
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

