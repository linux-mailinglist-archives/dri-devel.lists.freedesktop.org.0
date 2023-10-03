Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4D37B6325
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 10:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B58A10E25E;
	Tue,  3 Oct 2023 08:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B9510E25E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 08:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696320326; x=1727856326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nn3xjby11PVMXRKfpdpNwR1Yzd2Qu+4y8cyJ8c9gw2c=;
 b=ZcMJDX1acijHkn3RL96QhhjCMx+0Zm6Q5J63TJLin2fugo7zjm3xaiFp
 DMsSAWiq/CrZQ/YgJCOHPpmtwLPV3UM3sTPlngJI8UY4scauxsqcfggIO
 ocv68+TLwkE38S2Pb6yYkpXrgG6cyxptIazmhvtQsRIGzXJjXheqjIeDT
 gfwdgMbVDWlHp6ZfTTcGV4I5KJOw+UG1o1FQegkZ0ji1hmZR+ajVCQ2Kr
 8zw2X8Sd5mNrA13gOZgC9cf7MF6Yd9zKaooxgaIQon9I9MBWQWliHilP0
 7HCLX8VFLxQebPkbtvyqodSMQ8EJ42grImz6YXM9ZJmU3V3L0Ijhtc+j/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="449306992"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; d="scan'208";a="449306992"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 01:05:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="700615299"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; d="scan'208";a="700615299"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 01:05:25 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v1 2/3] udmabuf: Pin the pages using pin_user_pages_fd() API
Date: Tue,  3 Oct 2023 00:44:46 -0700
Message-Id: <20231003074447.3245729-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003074447.3245729-1-vivek.kasireddy@intel.com>
References: <20231003074447.3245729-1-vivek.kasireddy@intel.com>
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

This patch also adds back support for mapping hugetlbfs pages
by noting the subpage offsets within the huge pages and uses
this information while populating the scatterlist.

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
 drivers/dma-buf/udmabuf.c | 82 +++++++++++++++++++++++++++++----------
 1 file changed, 61 insertions(+), 21 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 820c993c8659..9ef1eaf4df4b 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -10,6 +10,7 @@
 #include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/shmem_fs.h>
+#include <linux/hugetlb.h>
 #include <linux/slab.h>
 #include <linux/udmabuf.h>
 #include <linux/vmalloc.h>
@@ -28,6 +29,7 @@ struct udmabuf {
 	struct page **pages;
 	struct sg_table *sg;
 	struct miscdevice *device;
+	pgoff_t *subpgoff;
 };
 
 static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
@@ -90,23 +92,31 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 {
 	struct udmabuf *ubuf = buf->priv;
 	struct sg_table *sg;
+	struct scatterlist *sgl;
+	pgoff_t offset;
+	unsigned long i = 0;
 	int ret;
 
 	sg = kzalloc(sizeof(*sg), GFP_KERNEL);
 	if (!sg)
 		return ERR_PTR(-ENOMEM);
-	ret = sg_alloc_table_from_pages(sg, ubuf->pages, ubuf->pagecount,
-					0, ubuf->pagecount << PAGE_SHIFT,
-					GFP_KERNEL);
+
+	ret = sg_alloc_table(sg, ubuf->pagecount, GFP_KERNEL);
 	if (ret < 0)
-		goto err;
+		goto err_alloc;
+
+	for_each_sg(sg->sgl, sgl, ubuf->pagecount, i) {
+		offset = ubuf->subpgoff ? ubuf->subpgoff[i] : 0;
+		sg_set_page(sgl, ubuf->pages[i], PAGE_SIZE, offset);
+	}
 	ret = dma_map_sgtable(dev, sg, direction, 0);
 	if (ret < 0)
-		goto err;
+		goto err_map;
 	return sg;
 
-err:
+err_map:
 	sg_free_table(sg);
+err_alloc:
 	kfree(sg);
 	return ERR_PTR(ret);
 }
@@ -142,7 +152,9 @@ static void release_udmabuf(struct dma_buf *buf)
 		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
 
 	for (pg = 0; pg < ubuf->pagecount; pg++)
-		put_page(ubuf->pages[pg]);
+		unpin_user_page(ubuf->pages[pg]);
+
+	kfree(ubuf->subpgoff);
 	kfree(ubuf->pages);
 	kfree(ubuf);
 }
@@ -202,12 +214,13 @@ static long udmabuf_create(struct miscdevice *device,
 {
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 	struct file *memfd = NULL;
-	struct address_space *mapping = NULL;
 	struct udmabuf *ubuf;
 	struct dma_buf *buf;
-	pgoff_t pgoff, pgcnt, pgidx, pgbuf = 0, pglimit;
-	struct page *page;
-	int seals, ret = -EINVAL;
+	pgoff_t pgoff, pgcnt, pgbuf = 0, pglimit, nr_pages;
+	pgoff_t subpgoff, maxsubpgs;
+	struct hstate *hpstate;
+	long ret = -EINVAL;
+	int seals;
 	u32 i, flags;
 
 	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
@@ -241,8 +254,7 @@ static long udmabuf_create(struct miscdevice *device,
 		memfd = fget(list[i].memfd);
 		if (!memfd)
 			goto err;
-		mapping = memfd->f_mapping;
-		if (!shmem_mapping(mapping))
+		if (!shmem_file(memfd) && !is_file_hugepages(memfd))
 			goto err;
 		seals = memfd_fcntl(memfd, F_GET_SEALS, 0);
 		if (seals == -EINVAL)
@@ -253,14 +265,41 @@ static long udmabuf_create(struct miscdevice *device,
 			goto err;
 		pgoff = list[i].offset >> PAGE_SHIFT;
 		pgcnt = list[i].size   >> PAGE_SHIFT;
-		for (pgidx = 0; pgidx < pgcnt; pgidx++) {
-			page = shmem_read_mapping_page(mapping, pgoff + pgidx);
-			if (IS_ERR(page)) {
-				ret = PTR_ERR(page);
+		if (is_file_hugepages(memfd)) {
+			if (!ubuf->subpgoff) {
+				ubuf->subpgoff = kmalloc_array(ubuf->pagecount,
+							       sizeof(*ubuf->subpgoff),
+							       GFP_KERNEL);
+				if (!ubuf->subpgoff) {
+					ret = -ENOMEM;
+					goto err;
+				}
+			}
+			hpstate = hstate_file(memfd);
+			pgoff = list[i].offset >> huge_page_shift(hpstate);
+			subpgoff = (list[i].offset &
+				    ~huge_page_mask(hpstate)) >> PAGE_SHIFT;
+			maxsubpgs = huge_page_size(hpstate) >> PAGE_SHIFT;
+		}
+
+		do {
+			nr_pages = shmem_file(memfd) ? pgcnt : 1;
+			ret = pin_user_pages_fd(list[i].memfd, pgoff,
+						nr_pages, FOLL_LONGTERM,
+						ubuf->pages + pgbuf);
+			if (ret < 0)
 				goto err;
+
+			if (is_file_hugepages(memfd)) {
+				ubuf->subpgoff[pgbuf] = subpgoff << PAGE_SHIFT;
+				if (++subpgoff == maxsubpgs) {
+					subpgoff = 0;
+					pgoff++;
+				}
 			}
-			ubuf->pages[pgbuf++] = page;
-		}
+			pgbuf += nr_pages;
+			pgcnt -= nr_pages;
+		} while (pgcnt > 0);
 		fput(memfd);
 		memfd = NULL;
 	}
@@ -283,10 +322,11 @@ static long udmabuf_create(struct miscdevice *device,
 	return dma_buf_fd(buf, flags);
 
 err:
-	while (pgbuf > 0)
-		put_page(ubuf->pages[--pgbuf]);
+	while (pgbuf > 0 && ubuf->pages[--pgbuf])
+		unpin_user_page(ubuf->pages[pgbuf]);
 	if (memfd)
 		fput(memfd);
+	kfree(ubuf->subpgoff);
 	kfree(ubuf->pages);
 	kfree(ubuf);
 	return ret;
-- 
2.39.2

