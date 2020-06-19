Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AAF20069C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 12:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FFD6EC72;
	Fri, 19 Jun 2020 10:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0AF6EC6F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:37:16 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200619103714euoutp017fb8df58e28afe0d94765081f5fd9df1~Z66RrOyU01836418364euoutp01y
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:37:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200619103714euoutp017fb8df58e28afe0d94765081f5fd9df1~Z66RrOyU01836418364euoutp01y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592563034;
 bh=aaZTZ5x9zU33iQSvUdNimV6zB4azWieuKqbzqgFwTCo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z3UPmXvLVM9FsQaLQZsc+rGjOPIJaJtWZc2gn0Nr9tVmDTA28lMLIGgcs7bXI7FmG
 hcXYqwThLFNw9QzRzWyMkFOST3NjOjWKqEfNIAZ928zCmtw28ziGIjmhvRIChVDBg7
 C59NW3bQyMyDrfHgGWAWelPFL+6Z/jodC0CW6tn8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200619103714eucas1p21bb34b9251700c4606d417f307dd1394~Z66RXcliU3081530815eucas1p2l;
 Fri, 19 Jun 2020 10:37:14 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id BA.9C.06318.A559CEE5; Fri, 19
 Jun 2020 11:37:14 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103714eucas1p2bfc6c1d97d7913ad5988e3aaef8cc5ff~Z66RE32sZ3081430814eucas1p26;
 Fri, 19 Jun 2020 10:37:14 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200619103714eusmtrp14f1015c33bc878149e336e3aceac6f45~Z66REJ89X0959609596eusmtrp1h;
 Fri, 19 Jun 2020 10:37:14 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-84-5eec955ad2ba
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 77.1B.06017.9559CEE5; Fri, 19
 Jun 2020 11:37:13 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103713eusmtip22cdfa14575c6643c088f3ac78f6e55ea~Z66QKUyfm0229502295eusmtip2l;
 Fri, 19 Jun 2020 10:37:12 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 30/36] staging: ion: fix common struct sg_table related
 issues
Date: Fri, 19 Jun 2020 12:36:30 +0200
Message-Id: <20200619103636.11974-31-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619103636.11974-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSa1CMURzGnX33vbRjm7fV6KhGM2vUMOSSMccUg+nDGT4g+aAZZdNrXSrb
 bheXD1ZiWJtb5RJllyXdQ1ZTKZWs2mzo4lbkkkpqbdkmIdre5Nvv//yf5zwz/zkMIRkg3Zmd
 0bGcMloWKaVEQuOjH43zQ9K+hi58XuSCki11AmT9/Y5Cty4UkuhQ/yz0x3iGQOUNIzRqtlsp
 dPhaIYWyc2sFSFfpj26oZ6Ps8mEB+t78XoBuf2wlUVPpZQrlP2ynkTFPTaKqb59IVN8+SCNd
 6wi90hUby4wkzsvMA/h3ho3AbytqhPj+kE6I9QN2Ere1llP43lAHiSsz8mj87oRJgO8YDuI3
 ox8JnPIyC+CyV2oKWytaKHyyOAesdwkRBURwkTvjOeWCFVtFO36mthCKvoC9pyyphBqcXawB
 DAPZJXD0xSoNEDES9iaAn+0NBD98B/C67Qrgh0EA0zINQg1wGk8Y7tbT/CILwK4PHdRkpGP4
 M+1wUewiqOnTUA52ZY8A+Dh5qsNEsFoS9hQVjS+msRuh2mYDDhays6Hl2a9xXcyugPdKX1N8
 nRfMLXpAONhpTO9NqiIdD0E2g4F6Xc2EKRB2DptpnqfBL6biCfaE5hStkA8cBvC9JZ/mBy2A
 TYkXAO/yh22WEcpxD4KdAwtLF/DyKlhQ0U/zZ3KGL/tcHDIxhmeN5wleFsNjRyW82xummwom
 a6uePid4xtDQpp046hkAUwc7qdPAK/1/mQ6AHODGxami5JzKL5pL8FXJolRx0XLfbXuiboOx
 n2geNdlLQMWv8GrAMkA6Vdwd3BsqIWXxqn1R1QAyhNRVvPqJOVQijpDt288p94Qp4yI5VTXw
 YIRSN7Hf1Z4tElYui+V2c5yCU/7bChgndzWocw+qcpaseWtikonFxUFDJbasiw8vHzgWPPPb
 Or2XTpNZvyvCuTnQN7G7JqnRPuPuEXZtmsnHQx16vutS4TmFXKGYp2HyjS79tTGe8aalXw3W
 ZebKdO9X1T90IZu05ah7oaePc8yUDS2kUeCdEHM8fEng9rDlA/rNQaKYT9Pl/lKhaods0VxC
 qZL9BXV4omGFAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRmVeSWpSXmKPExsVy+t/xe7qRU9/EGRw4ZmHRe+4kk8X7v/fZ
 LDbOWM9q0fhO2eL/tonMFnvO/GK3uPL1PZtF8+L1bBYrVx9lsliw39piWYOqxco9P5gsvlx5
 yGSx6fE1VovLu+awWaw9cpfdYtuaBlaLgx+esFqcuvuZ3WLBtV/sDiIe23ZvY/VYM28No8ff
 uR+ZPe7tO8zisffbAhaPhZ++snrcubaHzWP7twesHvvnrmH3uN99nMlj85J6j9v/HjN7TL6x
 nNFj980GNo/3+66yefRtWcUYIBilZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2Vk
 qqRvZ5OSmpNZllqkb5egl/F7ylXmgrc2Ff3npjA3ME4y6mLk5JAQMJFYsvUUexcjF4eQwFJG
 iU23r7JBJGQkTk5rYIWwhSX+XOsCiwsJfGKUuN5sCWKzCRhKdL0FiXNxiAh0MkpM6/4INolZ
 YAarxLoD99hBqoQFAiUaL3YygtgsAqoS5y7+AZvEK2AnsX3XLaht8hKrNxxgBrE5geKvWw6y
 QmyzlVi+4D3zBEa+BYwMqxhFUkuLc9Nzi430ihNzi0vz0vWS83M3MQIjdNuxn1t2MHa9Cz7E
 KMDBqMTD+yLkdZwQa2JZcWXuIUYJDmYlEV6ns6fjhHhTEiurUovy44tKc1KLDzGaAh01kVlK
 NDkfmDzySuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeWpGanphakFsH0MXFwSjUwdgc31edU
 yOc++vBz54GN+ft9dhycrykeNv3dsen2EZf+hWk5HVzItbG+gO3kvh82l6P+XnJelWDIk/Iw
 O4o/g+l9g7XOUhm9h9lm74Tj2+5q8lyOOGU2X0tqeXCi2LSPy8x1Tm/YtHXfmscyd6457Vuz
 LOwQ0637+1sCDotw/tww61lGWlbbViWW4oxEQy3mouJEAGVqbczmAgAA
X-CMS-MailID: 20200619103714eucas1p2bfc6c1d97d7913ad5988e3aaef8cc5ff
X-Msg-Generator: CA
X-RootMTR: 20200619103714eucas1p2bfc6c1d97d7913ad5988e3aaef8cc5ff
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200619103714eucas1p2bfc6c1d97d7913ad5988e3aaef8cc5ff
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103714eucas1p2bfc6c1d97d7913ad5988e3aaef8cc5ff@eucas1p2.samsung.com>
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
Cc: devel@driverdev.osuosl.org, Todd Kjos <tkjos@android.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>,
 Joel Fernandes <joel@joelfernandes.org>, Laura Abbott <labbott@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg() function
returns the number of the created entries in the DMA address space.
However the subsequent calls to the dma_sync_sg_for_{device,cpu}() and
dma_unmap_sg must be called with the original number of the entries
passed to the dma_map_sg().

struct sg_table is a common structure used for describing a non-contiguous
memory buffer, used commonly in the DRM and graphics subsystems. It
consists of a scatterlist with memory pages and DMA addresses (sgl entry),
as well as the number of scatterlist entries: CPU pages (orig_nents entry)
and DMA mapped pages (nents entry).

It turned out that it was a common mistake to misuse nents and orig_nents
entries, calling DMA-mapping functions with a wrong number of entries or
ignoring the number of mapped entries returned by the dma_map_sg()
function.

To avoid such issues, lets use a common dma-mapping wrappers operating
directly on the struct sg_table objects and use scatterlist page
iterators where possible. This, almost always, hides references to the
nents and orig_nents entries, making the code robust, easier to follow
and copy/paste safe.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/staging/android/ion/ion.c             | 25 +++++------
 drivers/staging/android/ion/ion_heap.c        | 44 ++++++-------------
 drivers/staging/android/ion/ion_system_heap.c |  2 +-
 3 files changed, 25 insertions(+), 46 deletions(-)

diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/android/ion/ion.c
index 38b51eace4f9..3c9f09506ffa 100644
--- a/drivers/staging/android/ion/ion.c
+++ b/drivers/staging/android/ion/ion.c
@@ -147,14 +147,14 @@ static struct sg_table *dup_sg_table(struct sg_table *table)
 	if (!new_table)
 		return ERR_PTR(-ENOMEM);
 
-	ret = sg_alloc_table(new_table, table->nents, GFP_KERNEL);
+	ret = sg_alloc_table(new_table, table->orig_nents, GFP_KERNEL);
 	if (ret) {
 		kfree(new_table);
 		return ERR_PTR(-ENOMEM);
 	}
 
 	new_sg = new_table->sgl;
-	for_each_sg(table->sgl, sg, table->nents, i) {
+	for_each_sgtable_sg(table, sg, i) {
 		memcpy(new_sg, sg, sizeof(*sg));
 		new_sg->dma_address = 0;
 		new_sg = sg_next(new_sg);
@@ -224,12 +224,13 @@ static struct sg_table *ion_map_dma_buf(struct dma_buf_attachment *attachment,
 {
 	struct ion_dma_buf_attachment *a = attachment->priv;
 	struct sg_table *table;
+	int ret;
 
 	table = a->table;
 
-	if (!dma_map_sg(attachment->dev, table->sgl, table->nents,
-			direction))
-		return ERR_PTR(-ENOMEM);
+	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
+	if (ret)
+		return ERR_PTR(ret);
 
 	return table;
 }
@@ -238,7 +239,7 @@ static void ion_unmap_dma_buf(struct dma_buf_attachment *attachment,
 			      struct sg_table *table,
 			      enum dma_data_direction direction)
 {
-	dma_unmap_sg(attachment->dev, table->sgl, table->nents, direction);
+	dma_unmap_sgtable(attachment->dev, table, direction, 0);
 }
 
 static int ion_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
@@ -296,10 +297,8 @@ static int ion_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
 	}
 
 	mutex_lock(&buffer->lock);
-	list_for_each_entry(a, &buffer->attachments, list) {
-		dma_sync_sg_for_cpu(a->dev, a->table->sgl, a->table->nents,
-				    direction);
-	}
+	list_for_each_entry(a, &buffer->attachments, list)
+		dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
 
 unlock:
 	mutex_unlock(&buffer->lock);
@@ -319,10 +318,8 @@ static int ion_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
 	}
 
 	mutex_lock(&buffer->lock);
-	list_for_each_entry(a, &buffer->attachments, list) {
-		dma_sync_sg_for_device(a->dev, a->table->sgl, a->table->nents,
-				       direction);
-	}
+	list_for_each_entry(a, &buffer->attachments, list)
+		dma_sync_sgtable_for_device(a->dev, a->table, direction);
 	mutex_unlock(&buffer->lock);
 
 	return 0;
diff --git a/drivers/staging/android/ion/ion_heap.c b/drivers/staging/android/ion/ion_heap.c
index 9c23b2382a1e..79f27949edda 100644
--- a/drivers/staging/android/ion/ion_heap.c
+++ b/drivers/staging/android/ion/ion_heap.c
@@ -20,8 +20,7 @@
 void *ion_heap_map_kernel(struct ion_heap *heap,
 			  struct ion_buffer *buffer)
 {
-	struct scatterlist *sg;
-	int i, j;
+	struct sg_page_iter piter;
 	void *vaddr;
 	pgprot_t pgprot;
 	struct sg_table *table = buffer->sg_table;
@@ -38,14 +37,11 @@ void *ion_heap_map_kernel(struct ion_heap *heap,
 	else
 		pgprot = pgprot_writecombine(PAGE_KERNEL);
 
-	for_each_sg(table->sgl, sg, table->nents, i) {
-		int npages_this_entry = PAGE_ALIGN(sg->length) / PAGE_SIZE;
-		struct page *page = sg_page(sg);
-
-		BUG_ON(i >= npages);
-		for (j = 0; j < npages_this_entry; j++)
-			*(tmp++) = page++;
+	for_each_sgtable_page(table, &piter, 0) {
+		BUG_ON(tmp - pages >= npages);
+		*tmp++ = sg_page_iter_page(&piter);
 	}
+
 	vaddr = vmap(pages, npages, VM_MAP, pgprot);
 	vfree(pages);
 
@@ -64,32 +60,19 @@ void ion_heap_unmap_kernel(struct ion_heap *heap,
 int ion_heap_map_user(struct ion_heap *heap, struct ion_buffer *buffer,
 		      struct vm_area_struct *vma)
 {
+	struct sg_page_iter piter;
 	struct sg_table *table = buffer->sg_table;
 	unsigned long addr = vma->vm_start;
-	unsigned long offset = vma->vm_pgoff * PAGE_SIZE;
-	struct scatterlist *sg;
-	int i;
 	int ret;
 
-	for_each_sg(table->sgl, sg, table->nents, i) {
-		struct page *page = sg_page(sg);
-		unsigned long remainder = vma->vm_end - addr;
-		unsigned long len = sg->length;
+	for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
+		struct page *page = sg_page_iter_page(&piter);
 
-		if (offset >= sg->length) {
-			offset -= sg->length;
-			continue;
-		} else if (offset) {
-			page += offset / PAGE_SIZE;
-			len = sg->length - offset;
-			offset = 0;
-		}
-		len = min(len, remainder);
-		ret = remap_pfn_range(vma, addr, page_to_pfn(page), len,
+		ret = remap_pfn_range(vma, addr, page_to_pfn(page), PAGE_SIZE,
 				      vma->vm_page_prot);
 		if (ret)
 			return ret;
-		addr += len;
+		addr += PAGE_SIZE;
 		if (addr >= vma->vm_end)
 			return 0;
 	}
@@ -109,15 +92,14 @@ static int ion_heap_clear_pages(struct page **pages, int num, pgprot_t pgprot)
 	return 0;
 }
 
-static int ion_heap_sglist_zero(struct scatterlist *sgl, unsigned int nents,
-				pgprot_t pgprot)
+static int ion_heap_sglist_zero(struct sg_table *sgt, pgprot_t pgprot)
 {
 	int p = 0;
 	int ret = 0;
 	struct sg_page_iter piter;
 	struct page *pages[32];
 
-	for_each_sg_page(sgl, &piter, nents, 0) {
+	for_each_sgtable_page(sgt, &piter, 0) {
 		pages[p++] = sg_page_iter_page(&piter);
 		if (p == ARRAY_SIZE(pages)) {
 			ret = ion_heap_clear_pages(pages, p, pgprot);
@@ -142,7 +124,7 @@ int ion_heap_buffer_zero(struct ion_buffer *buffer)
 	else
 		pgprot = pgprot_writecombine(PAGE_KERNEL);
 
-	return ion_heap_sglist_zero(table->sgl, table->nents, pgprot);
+	return ion_heap_sglist_zero(table, pgprot);
 }
 
 void ion_heap_freelist_add(struct ion_heap *heap, struct ion_buffer *buffer)
diff --git a/drivers/staging/android/ion/ion_system_heap.c b/drivers/staging/android/ion/ion_system_heap.c
index b83a1d16bd89..eac0632ab4e8 100644
--- a/drivers/staging/android/ion/ion_system_heap.c
+++ b/drivers/staging/android/ion/ion_system_heap.c
@@ -162,7 +162,7 @@ static void ion_system_heap_free(struct ion_buffer *buffer)
 	if (!(buffer->private_flags & ION_PRIV_FLAG_SHRINKER_FREE))
 		ion_heap_buffer_zero(buffer);
 
-	for_each_sg(table->sgl, sg, table->nents, i)
+	for_each_sgtable_sg(table, sg, i)
 		free_buffer_page(sys_heap, buffer, sg_page(sg));
 	sg_free_table(table);
 	kfree(table);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
