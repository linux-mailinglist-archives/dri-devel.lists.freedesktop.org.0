Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6E880E55C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 09:01:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600CA10E57C;
	Tue, 12 Dec 2023 08:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9660210E4F6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 08:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702368086; x=1733904086;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O1c3JIhGATN1dxcRTvUuRK9RhQSZEkJPgfU5c33zkAo=;
 b=Z5y/J2+3cfMIRGQYaC2XE55IkTmRTzz0wIcEy0LUNL4uQneSnAf7dtUq
 SisvXBt+OH5Ay7tVr4f3QjR+finRuys53pPwB5/sZbcDckK2OZCRB7e8N
 7TzpZBK9TjS0+4v+DcSy3A/aMWMs5buoNPS/LJR96Lj1E2V3Fc6G61IAX
 WAxuuNh9gEAdeSJtshxWUk1f0DQqV+AJu8QxrTi1aB13BqFxMwHO0KH/f
 5DhOYmt/tT9F1KJH277beIrEeuoRbzslsUR6sl2jFi4rbfu6U7vrZEesk
 gRjItUAFkL0r+wsb7rosFugrfptj4c5hrFVKA9iMuVOvLchnuXMKkgb4L w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="397553955"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="397553955"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 00:01:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="802376324"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="802376324"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 00:01:24 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v7 2/6] udmabuf: Add back support for mapping hugetlb pages
 (v6)
Date: Mon, 11 Dec 2023 23:37:59 -0800
Message-Id: <20231212073803.3233055-3-vivek.kasireddy@intel.com>
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

A user or admin can configure a VMM (Qemu) Guest's memory to be
backed by hugetlb pages for various reasons. However, a Guest OS
would still allocate (and pin) buffers that are backed by regular
4k sized pages. In order to map these buffers and create dma-bufs
for them on the Host, we first need to find the hugetlb pages where
the buffer allocations are located and then determine the offsets
of individual chunks (within those pages) and use this information
to eventually populate a scatterlist.

Testcase: default_hugepagesz=2M hugepagesz=2M hugepages=2500 options
were passed to the Host kernel and Qemu was launched with these
relevant options: qemu-system-x86_64 -m 4096m....
-device virtio-gpu-pci,max_outputs=1,blob=true,xres=1920,yres=1080
-display gtk,gl=on
-object memory-backend-memfd,hugetlb=on,id=mem1,size=4096M
-machine memory-backend=mem1

Replacing -display gtk,gl=on with -display gtk,gl=off above would
exercise the mmap handler.

v2: Updated get_sg_table() to manually populate the scatterlist for
    both huge page and non-huge-page cases.

v3: s/offsets/subpgoff/g
    s/hpoff/mapidx/g

v4: Replaced find_get_page_flags() with __filemap_get_folio() to
    ensure that we only obtain head pages from the mapping

v5: Fix the calculation of mapidx to ensure that it is a order-n
    page multiple

v6:
- Split the processing of hugetlb or shmem pages into helpers to
  simplify the code in udmabuf_create() (Christoph)
- Move the creation of offsets array out of hugetlb context and
  into common code

Cc: David Hildenbrand <david@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Hugh Dickins <hughd@google.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Junxiao Chang <junxiao.chang@intel.com>
Acked-by: Mike Kravetz <mike.kravetz@oracle.com> (v2)
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/udmabuf.c | 122 +++++++++++++++++++++++++++++++-------
 1 file changed, 101 insertions(+), 21 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 820c993c8659..274defd3fa3e 100644
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
+	pgoff_t *offsets;
 };
 
 static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
@@ -41,6 +43,8 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
 		return VM_FAULT_SIGBUS;
 
 	pfn = page_to_pfn(ubuf->pages[pgoff]);
+	pfn += ubuf->offsets[pgoff] >> PAGE_SHIFT;
+
 	return vmf_insert_pfn(vma, vmf->address, pfn);
 }
 
@@ -90,23 +94,29 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 {
 	struct udmabuf *ubuf = buf->priv;
 	struct sg_table *sg;
+	struct scatterlist *sgl;
+	unsigned int i = 0;
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
+	for_each_sg(sg->sgl, sgl, ubuf->pagecount, i)
+		sg_set_page(sgl, ubuf->pages[i], PAGE_SIZE, ubuf->offsets[i]);
+
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
@@ -143,6 +153,7 @@ static void release_udmabuf(struct dma_buf *buf)
 
 	for (pg = 0; pg < ubuf->pagecount; pg++)
 		put_page(ubuf->pages[pg]);
+	kfree(ubuf->offsets);
 	kfree(ubuf->pages);
 	kfree(ubuf);
 }
@@ -196,17 +207,77 @@ static const struct dma_buf_ops udmabuf_ops = {
 #define SEALS_WANTED (F_SEAL_SHRINK)
 #define SEALS_DENIED (F_SEAL_WRITE)
 
+static int handle_hugetlb_pages(struct udmabuf *ubuf, struct file *memfd,
+				pgoff_t offset, pgoff_t pgcnt,
+				pgoff_t *pgbuf)
+{
+	struct hstate *hpstate = hstate_file(memfd);
+	pgoff_t mapidx = offset >> huge_page_shift(hpstate);
+	pgoff_t subpgoff = (offset & ~huge_page_mask(hpstate)) >> PAGE_SHIFT;
+	pgoff_t maxsubpgs = huge_page_size(hpstate) >> PAGE_SHIFT;
+	struct page *hpage = NULL;
+	struct folio *folio;
+	pgoff_t pgidx;
+
+	mapidx <<= huge_page_order(hpstate);
+	for (pgidx = 0; pgidx < pgcnt; pgidx++) {
+		if (!hpage) {
+			folio = __filemap_get_folio(memfd->f_mapping,
+						    mapidx,
+						    FGP_ACCESSED, 0);
+			if (IS_ERR(folio))
+				return PTR_ERR(folio);
+
+			hpage = &folio->page;
+		}
+
+		get_page(hpage);
+		ubuf->pages[*pgbuf] = hpage;
+		ubuf->offsets[*pgbuf] = subpgoff << PAGE_SHIFT;
+		(*pgbuf)++;
+		if (++subpgoff == maxsubpgs) {
+			put_page(hpage);
+			hpage = NULL;
+			subpgoff = 0;
+			mapidx += pages_per_huge_page(hpstate);
+		}
+	}
+
+	if (hpage)
+		put_page(hpage);
+
+	return 0;
+}
+
+static int handle_shmem_pages(struct udmabuf *ubuf, struct file *memfd,
+			      pgoff_t offset, pgoff_t pgcnt,
+			      pgoff_t *pgbuf)
+{
+	pgoff_t pgidx, pgoff = offset >> PAGE_SHIFT;
+	struct page *page;
+
+	for (pgidx = 0; pgidx < pgcnt; pgidx++) {
+		page = shmem_read_mapping_page(memfd->f_mapping,
+					       pgoff + pgidx);
+		if (IS_ERR(page))
+			return PTR_ERR(page);
+
+		ubuf->pages[*pgbuf] = page;
+		(*pgbuf)++;
+	}
+
+	return 0;
+}
+
 static long udmabuf_create(struct miscdevice *device,
 			   struct udmabuf_create_list *head,
 			   struct udmabuf_create_item *list)
 {
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 	struct file *memfd = NULL;
-	struct address_space *mapping = NULL;
 	struct udmabuf *ubuf;
 	struct dma_buf *buf;
-	pgoff_t pgoff, pgcnt, pgidx, pgbuf = 0, pglimit;
-	struct page *page;
+	pgoff_t pgcnt, pgbuf = 0, pglimit;
 	int seals, ret = -EINVAL;
 	u32 i, flags;
 
@@ -234,6 +305,12 @@ static long udmabuf_create(struct miscdevice *device,
 		ret = -ENOMEM;
 		goto err;
 	}
+	ubuf->offsets = kcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
+				GFP_KERNEL);
+	if (!ubuf->offsets) {
+		ret = -ENOMEM;
+		goto err;
+	}
 
 	pgbuf = 0;
 	for (i = 0; i < head->count; i++) {
@@ -241,8 +318,7 @@ static long udmabuf_create(struct miscdevice *device,
 		memfd = fget(list[i].memfd);
 		if (!memfd)
 			goto err;
-		mapping = memfd->f_mapping;
-		if (!shmem_mapping(mapping))
+		if (!shmem_file(memfd) && !is_file_hugepages(memfd))
 			goto err;
 		seals = memfd_fcntl(memfd, F_GET_SEALS, 0);
 		if (seals == -EINVAL)
@@ -251,16 +327,19 @@ static long udmabuf_create(struct miscdevice *device,
 		if ((seals & SEALS_WANTED) != SEALS_WANTED ||
 		    (seals & SEALS_DENIED) != 0)
 			goto err;
-		pgoff = list[i].offset >> PAGE_SHIFT;
-		pgcnt = list[i].size   >> PAGE_SHIFT;
-		for (pgidx = 0; pgidx < pgcnt; pgidx++) {
-			page = shmem_read_mapping_page(mapping, pgoff + pgidx);
-			if (IS_ERR(page)) {
-				ret = PTR_ERR(page);
-				goto err;
-			}
-			ubuf->pages[pgbuf++] = page;
-		}
+
+		pgcnt = list[i].size >> PAGE_SHIFT;
+		if (is_file_hugepages(memfd))
+			ret = handle_hugetlb_pages(ubuf, memfd,
+						   list[i].offset,
+						   pgcnt, &pgbuf);
+		else
+			ret = handle_shmem_pages(ubuf, memfd,
+						 list[i].offset,
+						 pgcnt, &pgbuf);
+		if (ret < 0)
+			goto err;
+
 		fput(memfd);
 		memfd = NULL;
 	}
@@ -287,6 +366,7 @@ static long udmabuf_create(struct miscdevice *device,
 		put_page(ubuf->pages[--pgbuf]);
 	if (memfd)
 		fput(memfd);
+	kfree(ubuf->offsets);
 	kfree(ubuf->pages);
 	kfree(ubuf);
 	return ret;
-- 
2.39.2

