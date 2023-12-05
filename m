Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB473804998
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 06:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626F810E211;
	Tue,  5 Dec 2023 05:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1606D10E0F2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 05:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701755931; x=1733291931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ObYOQ8MIUmEaPxTiLC5uRoa6H7+5D11n4MFPzMj/Kdc=;
 b=G5gF++mhc4PoofP/mSyDaBWUZ6KljpQMT/b9jDb17BRl1uHgWiuw9eZi
 1oe5fNcJmGeogvAorlnPmMG0ejyik5u18izDF7+SNa+zUydO4n1yWyaJc
 AGaBeFuNIU6M9ockhx4PDPFCfZ/9+qrapczEA4VGm/6+dmzgx71cXGB1K
 ua4XHn6UGRgU5pQpj0cuRhAOe9LS5l0WmeEmpZ1ww9wx03r4GKCrIUCWm
 k75RTtEgChA3dXiCTWlKIU0jrPd3Y7BvZgZ7/zOm9GHV8YauZ+N1hwfx3
 8/yEfF+Y6VJ7XL3JM7Tg6anWlAZtUUOtXOHHW4GEMP2aoZbXM69D6cXuF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="906304"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="906304"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 21:58:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="888807727"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="888807727"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 21:58:50 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v6 2/5] udmabuf: Add back support for mapping hugetlb pages
 (v5)
Date: Mon,  4 Dec 2023 21:35:06 -0800
Message-Id: <20231205053509.2342169-3-vivek.kasireddy@intel.com>
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
 drivers/dma-buf/udmabuf.c | 88 +++++++++++++++++++++++++++++++++------
 1 file changed, 75 insertions(+), 13 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 820c993c8659..1d1cc5e7e613 100644
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
@@ -41,6 +43,10 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
 		return VM_FAULT_SIGBUS;
 
 	pfn = page_to_pfn(ubuf->pages[pgoff]);
+	if (ubuf->subpgoff) {
+		pfn += ubuf->subpgoff[pgoff] >> PAGE_SHIFT;
+	}
+
 	return vmf_insert_pfn(vma, vmf->address, pfn);
 }
 
@@ -90,23 +96,31 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
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
@@ -143,6 +157,7 @@ static void release_udmabuf(struct dma_buf *buf)
 
 	for (pg = 0; pg < ubuf->pagecount; pg++)
 		put_page(ubuf->pages[pg]);
+	kfree(ubuf->subpgoff);
 	kfree(ubuf->pages);
 	kfree(ubuf);
 }
@@ -206,7 +221,10 @@ static long udmabuf_create(struct miscdevice *device,
 	struct udmabuf *ubuf;
 	struct dma_buf *buf;
 	pgoff_t pgoff, pgcnt, pgidx, pgbuf = 0, pglimit;
-	struct page *page;
+	struct page *page, *hpage = NULL;
+	struct folio *folio;
+	pgoff_t mapidx, chunkoff, maxchunks;
+	struct hstate *hpstate;
 	int seals, ret = -EINVAL;
 	u32 i, flags;
 
@@ -242,7 +260,7 @@ static long udmabuf_create(struct miscdevice *device,
 		if (!memfd)
 			goto err;
 		mapping = memfd->f_mapping;
-		if (!shmem_mapping(mapping))
+		if (!shmem_mapping(mapping) && !is_file_hugepages(memfd))
 			goto err;
 		seals = memfd_fcntl(memfd, F_GET_SEALS, 0);
 		if (seals == -EINVAL)
@@ -253,16 +271,59 @@ static long udmabuf_create(struct miscdevice *device,
 			goto err;
 		pgoff = list[i].offset >> PAGE_SHIFT;
 		pgcnt = list[i].size   >> PAGE_SHIFT;
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
+			mapidx = list[i].offset >> huge_page_shift(hpstate);
+			mapidx <<= huge_page_order(hpstate);
+			chunkoff = (list[i].offset &
+				    ~huge_page_mask(hpstate)) >> PAGE_SHIFT;
+			maxchunks = huge_page_size(hpstate) >> PAGE_SHIFT;
+		}
 		for (pgidx = 0; pgidx < pgcnt; pgidx++) {
-			page = shmem_read_mapping_page(mapping, pgoff + pgidx);
-			if (IS_ERR(page)) {
-				ret = PTR_ERR(page);
-				goto err;
+			if (is_file_hugepages(memfd)) {
+				if (!hpage) {
+					folio = __filemap_get_folio(mapping, mapidx,
+								    FGP_ACCESSED, 0);
+					hpage = IS_ERR(folio) ? NULL: &folio->page;
+					if (!hpage) {
+						ret = -EINVAL;
+						goto err;
+					}
+				}
+				get_page(hpage);
+				ubuf->pages[pgbuf] = hpage;
+				ubuf->subpgoff[pgbuf++] = chunkoff << PAGE_SHIFT;
+				if (++chunkoff == maxchunks) {
+					put_page(hpage);
+					hpage = NULL;
+					chunkoff = 0;
+					mapidx += pages_per_huge_page(hpstate);
+				}
+			} else {
+				mapidx = pgoff + pgidx;
+				page = shmem_read_mapping_page(mapping, mapidx);
+				if (IS_ERR(page)) {
+					ret = PTR_ERR(page);
+					goto err;
+				}
+				ubuf->pages[pgbuf++] = page;
 			}
-			ubuf->pages[pgbuf++] = page;
 		}
 		fput(memfd);
 		memfd = NULL;
+		if (hpage) {
+			put_page(hpage);
+			hpage = NULL;
+		}
 	}
 
 	exp_info.ops  = &udmabuf_ops;
@@ -287,6 +348,7 @@ static long udmabuf_create(struct miscdevice *device,
 		put_page(ubuf->pages[--pgbuf]);
 	if (memfd)
 		fput(memfd);
+	kfree(ubuf->subpgoff);
 	kfree(ubuf->pages);
 	kfree(ubuf);
 	return ret;
-- 
2.39.2

