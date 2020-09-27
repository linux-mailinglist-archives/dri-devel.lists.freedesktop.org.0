Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 244AF279F09
	for <lists+dri-devel@lfdr.de>; Sun, 27 Sep 2020 08:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D499F6E245;
	Sun, 27 Sep 2020 06:47:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6EF6E241;
 Sun, 27 Sep 2020 06:47:03 +0000 (UTC)
Received: from localhost (unknown [213.57.247.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C6203239D4;
 Sun, 27 Sep 2020 06:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601189223;
 bh=gl14ZErzehWQb9/1WcJI2wZGRSjulxeuYZbP3y4EGLc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZMispFsOQLvz+Qyxmrt6Qc0ik7QXjFAb+TFUmE8BjHObN8yQ6F7vLrE/qymgZKfFS
 yyJHHX+n5q/7piF1S4/keK1b/SPLD425FV4m4bEyAUqCGjRzudjxlVAEFzs9keBLme
 DpUVbiO1gbp7UwKvsWHFW1fGX3qGgOCshU8lQtnM=
From: Leon Romanovsky <leon@kernel.org>
To: Doug Ledford <dledford@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH rdma-next v4 4/4] RDMA/umem: Move to allocate SG table from
 pages
Date: Sun, 27 Sep 2020 09:46:47 +0300
Message-Id: <20200927064647.3106737-5-leon@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200927064647.3106737-1-leon@kernel.org>
References: <20200927064647.3106737-1-leon@kernel.org>
MIME-Version: 1.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maor Gottlieb <maorg@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maor Gottlieb <maorg@nvidia.com>

Remove the implementation of ib_umem_add_sg_table and instead
call to __sg_alloc_table_from_pages which already has the logic to
merge contiguous pages.

Besides that it removes duplicated functionality, it reduces the
memory consumption of the SG table significantly. Prior to this
patch, the SG table was allocated in advance regardless consideration
of contiguous pages.

In huge pages system of 2MB page size, without this change, the SG table
would contain x512 SG entries. E.g. for 100GB memory registration:

	 Number of entries	Size
Before 	      26214400          600.0MB
After            51200		  1.2MB

Signed-off-by: Maor Gottlieb <maorg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/infiniband/core/umem.c | 92 +++++-----------------------------
 1 file changed, 12 insertions(+), 80 deletions(-)

diff --git a/drivers/infiniband/core/umem.c b/drivers/infiniband/core/umem.c
index 01b680b62846..0ef736970aba 100644
--- a/drivers/infiniband/core/umem.c
+++ b/drivers/infiniband/core/umem.c
@@ -63,73 +63,6 @@ static void __ib_umem_release(struct ib_device *dev, struct ib_umem *umem, int d
 	sg_free_table(&umem->sg_head);
 }

-/* ib_umem_add_sg_table - Add N contiguous pages to scatter table
- *
- * sg: current scatterlist entry
- * page_list: array of npage struct page pointers
- * npages: number of pages in page_list
- * max_seg_sz: maximum segment size in bytes
- * nents: [out] number of entries in the scatterlist
- *
- * Return new end of scatterlist
- */
-static struct scatterlist *ib_umem_add_sg_table(struct scatterlist *sg,
-						struct page **page_list,
-						unsigned long npages,
-						unsigned int max_seg_sz,
-						int *nents)
-{
-	unsigned long first_pfn;
-	unsigned long i = 0;
-	bool update_cur_sg = false;
-	bool first = !sg_page(sg);
-
-	/* Check if new page_list is contiguous with end of previous page_list.
-	 * sg->length here is a multiple of PAGE_SIZE and sg->offset is 0.
-	 */
-	if (!first && (page_to_pfn(sg_page(sg)) + (sg->length >> PAGE_SHIFT) ==
-		       page_to_pfn(page_list[0])))
-		update_cur_sg = true;
-
-	while (i != npages) {
-		unsigned long len;
-		struct page *first_page = page_list[i];
-
-		first_pfn = page_to_pfn(first_page);
-
-		/* Compute the number of contiguous pages we have starting
-		 * at i
-		 */
-		for (len = 0; i != npages &&
-			      first_pfn + len == page_to_pfn(page_list[i]) &&
-			      len < (max_seg_sz >> PAGE_SHIFT);
-		     len++)
-			i++;
-
-		/* Squash N contiguous pages from page_list into current sge */
-		if (update_cur_sg) {
-			if ((max_seg_sz - sg->length) >= (len << PAGE_SHIFT)) {
-				sg_set_page(sg, sg_page(sg),
-					    sg->length + (len << PAGE_SHIFT),
-					    0);
-				update_cur_sg = false;
-				continue;
-			}
-			update_cur_sg = false;
-		}
-
-		/* Squash N contiguous pages into next sge or first sge */
-		if (!first)
-			sg = sg_next(sg);
-
-		(*nents)++;
-		sg_set_page(sg, first_page, len << PAGE_SHIFT, 0);
-		first = false;
-	}
-
-	return sg;
-}
-
 /**
  * ib_umem_find_best_pgsz - Find best HW page size to use for this MR
  *
@@ -221,7 +154,7 @@ static struct ib_umem *__ib_umem_get(struct ib_device *device,
 	struct mm_struct *mm;
 	unsigned long npages;
 	int ret;
-	struct scatterlist *sg;
+	struct scatterlist *sg = NULL;
 	unsigned int gup_flags = FOLL_WRITE;

 	/*
@@ -276,15 +209,9 @@ static struct ib_umem *__ib_umem_get(struct ib_device *device,

 	cur_base = addr & PAGE_MASK;

-	ret = sg_alloc_table(&umem->sg_head, npages, GFP_KERNEL);
-	if (ret)
-		goto vma;
-
 	if (!umem->writable)
 		gup_flags |= FOLL_FORCE;

-	sg = umem->sg_head.sgl;
-
 	while (npages) {
 		cond_resched();
 		ret = pin_user_pages_fast(cur_base,
@@ -296,11 +223,17 @@ static struct ib_umem *__ib_umem_get(struct ib_device *device,
 			goto umem_release;

 		cur_base += ret * PAGE_SIZE;
-		npages   -= ret;
-
-		sg = ib_umem_add_sg_table(sg, page_list, ret,
-			dma_get_max_seg_size(device->dma_device),
-			&umem->sg_nents);
+		npages -= ret;
+		sg = __sg_alloc_table_from_pages(
+			&umem->sg_head, page_list, ret, 0, ret << PAGE_SHIFT,
+			dma_get_max_seg_size(device->dma_device), sg, npages,
+			GFP_KERNEL);
+		umem->sg_nents = umem->sg_head.nents;
+		if (IS_ERR(sg)) {
+			unpin_user_pages_dirty_lock(page_list, ret, 0);
+			ret = PTR_ERR(sg);
+			goto umem_release;
+		}
 	}

 	sg_mark_end(sg);
@@ -322,7 +255,6 @@ static struct ib_umem *__ib_umem_get(struct ib_device *device,

 umem_release:
 	__ib_umem_release(device, umem, 0);
-vma:
 	atomic64_sub(ib_umem_num_pages(umem), &mm->pinned_vm);
 out:
 	free_page((unsigned long) page_list);
--
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
