Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9449D739882
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 09:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053E910E4EE;
	Thu, 22 Jun 2023 07:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D789310E4E8
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 07:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687420382; x=1718956382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=smxqWtzF1UgM4ssvt0u5gPTlMBH+zFFcGG2SNZirXiQ=;
 b=X/9Y0YvvrtBRFjJXzhxMnQrjN+7+Sey7b4Qeg5uUE1o6tERcKyWqZOo+
 TGpNu1JvAtL/OxNm5bv8vUsNHvbpW9lcYLIiEHePOrWz3JPK5rrXDefCp
 mpq/e8ArptnJw5unhwETrwqfOjK6ccZiYwfxV1JkKrSfFjLyCSPvqumeO
 FArVlRkqL8Vu0CZDZ8FhGWZHohp9w01r8fOF5fYG+LN1IOyV8LJrQ3aQG
 YxoEnkzbse3clfTnsLsLpBzUO6vK5MJRXblGiIbVKMJmUqYz0naJStGAA
 /YbL5cjHIKl9G+ipYQFfKrutqkUy6ab98BiTxzQbmpouv0LSn/xsJwOGD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="357910367"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="357910367"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 00:52:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="784801074"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="784801074"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 00:52:24 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v1 2/2] udmabuf: Add back support for mapping hugetlb pages
Date: Thu, 22 Jun 2023 00:27:10 -0700
Message-Id: <20230622072710.3707315-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230622072710.3707315-1-vivek.kasireddy@intel.com>
References: <20230622072710.3707315-1-vivek.kasireddy@intel.com>
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
Cc: James Houghton <jthoughton@google.com>,
 Jerome Marchand <jmarchan@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, Junxiao Chang <junxiao.chang@intel.com>,
 Muchun Song <muchun.song@linux.dev>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Michal Hocko <mhocko@suse.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
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

Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: James Houghton <jthoughton@google.com>
Cc: Jerome Marchand <jmarchan@redhat.com>
Cc: Junxiao Chang <junxiao.chang@intel.com>
Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Muchun Song <muchun.song@linux.dev>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/udmabuf.c | 97 +++++++++++++++++++++++++++++++++------
 1 file changed, 83 insertions(+), 14 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 6de40c51d895..0ae44bce01e7 100644
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
@@ -41,6 +43,10 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
 		return VM_FAULT_SIGBUS;
 
 	pfn = page_to_pfn(ubuf->pages[pgoff]);
+	if (ubuf->offsets) {
+		pfn += ubuf->offsets[pgoff] >> PAGE_SHIFT;
+	}
+
 	return vmf_insert_pfn(vma, vmf->address, pfn);
 }
 
@@ -92,23 +98,40 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 {
 	struct udmabuf *ubuf = buf->priv;
 	struct sg_table *sg;
+	struct scatterlist *sgl;
+	unsigned long i = 0;
 	int ret;
 
 	sg = kzalloc(sizeof(*sg), GFP_KERNEL);
 	if (!sg)
 		return ERR_PTR(-ENOMEM);
-	ret = sg_alloc_table_from_pages(sg, ubuf->pages, ubuf->pagecount,
-					0, ubuf->pagecount << PAGE_SHIFT,
-					GFP_KERNEL);
-	if (ret < 0)
-		goto err;
+
+	if (ubuf->offsets) {
+		ret = sg_alloc_table(sg, ubuf->pagecount, GFP_KERNEL);
+		if (ret < 0)
+			goto err_alloc;
+
+		for_each_sg(sg->sgl, sgl, ubuf->pagecount, i) {
+			sg_set_page(sgl, ubuf->pages[i], PAGE_SIZE,
+				    ubuf->offsets[i]);
+		}
+	} else {
+		ret = sg_alloc_table_from_pages(sg, ubuf->pages,
+						ubuf->pagecount, 0,
+						ubuf->pagecount << PAGE_SHIFT,
+						GFP_KERNEL);
+		if (ret < 0)
+			goto err_alloc;
+
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
@@ -145,6 +168,8 @@ static void release_udmabuf(struct dma_buf *buf)
 
 	for (pg = 0; pg < ubuf->pagecount; pg++)
 		put_page(ubuf->pages[pg]);
+	if (ubuf->offsets)
+		kfree(ubuf->offsets);
 	kfree(ubuf->pages);
 	kfree(ubuf);
 }
@@ -208,7 +233,9 @@ static long udmabuf_create(struct miscdevice *device,
 	struct udmabuf *ubuf;
 	struct dma_buf *buf;
 	pgoff_t pgoff, pgcnt, pgidx, pgbuf = 0, pglimit;
-	struct page *page;
+	struct page *page, *hpage = NULL;
+	pgoff_t hpoff, chunkoff, maxchunks;
+	struct hstate *hpstate;
 	int seals, ret = -EINVAL;
 	u32 i, flags;
 
@@ -244,7 +271,7 @@ static long udmabuf_create(struct miscdevice *device,
 		if (!memfd)
 			goto err;
 		mapping = memfd->f_mapping;
-		if (!shmem_mapping(mapping))
+		if (!shmem_mapping(mapping) && !is_file_hugepages(memfd))
 			goto err;
 		seals = memfd_fcntl(memfd, F_GET_SEALS, 0);
 		if (seals == -EINVAL)
@@ -255,16 +282,56 @@ static long udmabuf_create(struct miscdevice *device,
 			goto err;
 		pgoff = list[i].offset >> PAGE_SHIFT;
 		pgcnt = list[i].size   >> PAGE_SHIFT;
+		if (is_file_hugepages(memfd)) {
+			if (!ubuf->offsets) {
+				ubuf->offsets = kmalloc_array(ubuf->pagecount,
+							      sizeof(*ubuf->offsets),
+							      GFP_KERNEL);
+				if (!ubuf->offsets) {
+					ret = -ENOMEM;
+					goto err;
+				}
+			}
+			hpstate = hstate_file(memfd);
+			hpoff = list[i].offset >> huge_page_shift(hpstate);
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
+					hpage = find_get_page_flags(mapping, hpoff,
+								    FGP_ACCESSED);
+					if (!hpage) {
+						ret = -EINVAL;
+						goto err;
+					}
+				}
+				get_page(hpage);
+				ubuf->pages[pgbuf] = hpage;
+				ubuf->offsets[pgbuf++] = chunkoff << PAGE_SHIFT;
+				if (++chunkoff == maxchunks) {
+					put_page(hpage);
+					hpage = NULL;
+					chunkoff = 0;
+					hpoff++;
+				}
+			} else {
+				page = shmem_read_mapping_page(mapping, pgoff + pgidx);
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
@@ -289,6 +356,8 @@ static long udmabuf_create(struct miscdevice *device,
 		put_page(ubuf->pages[--pgbuf]);
 	if (memfd)
 		fput(memfd);
+	if (ubuf->offsets)
+		kfree(ubuf->offsets);
 	kfree(ubuf->pages);
 	kfree(ubuf);
 	return ret;
-- 
2.39.2

