Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA2911A1CA
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 03:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B448D6EA57;
	Wed, 11 Dec 2019 02:53:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F686EA53
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 02:53:38 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df05a2a0001>; Tue, 10 Dec 2019 18:53:30 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 10 Dec 2019 18:53:37 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 10 Dec 2019 18:53:37 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Dec
 2019 02:53:36 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 11 Dec 2019 02:53:35 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5df05a2e0001>; Tue, 10 Dec 2019 18:53:35 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v9 22/25] mm,
 tree-wide: rename put_user_page*() to unpin_user_page*()
Date: Tue, 10 Dec 2019 18:53:15 -0800
Message-ID: <20191211025318.457113-23-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191211025318.457113-1-jhubbard@nvidia.com>
References: <20191211025318.457113-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576032811; bh=5US+iyBtKSnnNLbdpv29WTKIiIZnWZKvrAlic4H6UU4=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=AGU3LjNilWPA3HABJJgneU1NpS1u6dKudoXGJY6xPri2CYnHX38PsE2OFbt+eAyDW
 fzPvqNKMS0lbg6gZsbPwPX8Bc5mVmvCbWGey+V/JJPLr+bK0THY7HKBT4/l1ogcVe5
 YZlrkAPDx0vZDD/VMGpf2NtDYMJDcGE9adXhrRwRFuxFk89Z1QPral28sijYze0Ekr
 RDnx/qR0aSrtlC1TMAOp4OTFgkNaCEF+sFKV9Ey+si5LO/HhnB+rA0oTdcY/73Op67
 7cJ4zX03IpSKOd1Ji2Jtpvv+HtF82y7kEKk1GmciX9Q9HHD23eOpY6Renj/as72lUA
 ZI7QTM4vlK9YQ==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to provide a clearer, more symmetric API for pinning
and unpinning DMA pages. This way, pin_user_pages*() calls
match up with unpin_user_pages*() calls, and the API is a lot
closer to being self-explanatory.

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 Documentation/core-api/pin_user_pages.rst   |  2 +-
 arch/powerpc/mm/book3s64/iommu_api.c        |  4 +--
 drivers/gpu/drm/via/via_dmablit.c           |  4 +--
 drivers/infiniband/core/umem.c              |  2 +-
 drivers/infiniband/hw/hfi1/user_pages.c     |  2 +-
 drivers/infiniband/hw/mthca/mthca_memfree.c |  6 ++--
 drivers/infiniband/hw/qib/qib_user_pages.c  |  2 +-
 drivers/infiniband/hw/qib/qib_user_sdma.c   |  6 ++--
 drivers/infiniband/hw/usnic/usnic_uiom.c    |  2 +-
 drivers/infiniband/sw/siw/siw_mem.c         |  2 +-
 drivers/media/v4l2-core/videobuf-dma-sg.c   |  4 +--
 drivers/platform/goldfish/goldfish_pipe.c   |  4 +--
 drivers/vfio/vfio_iommu_type1.c             |  2 +-
 fs/io_uring.c                               |  4 +--
 include/linux/mm.h                          | 26 ++++++++---------
 mm/gup.c                                    | 32 ++++++++++-----------
 mm/process_vm_access.c                      |  4 +--
 net/xdp/xdp_umem.c                          |  2 +-
 18 files changed, 55 insertions(+), 55 deletions(-)

diff --git a/Documentation/core-api/pin_user_pages.rst b/Documentation/core-api/pin_user_pages.rst
index a7a261d869f1..fd2a19c96189 100644
--- a/Documentation/core-api/pin_user_pages.rst
+++ b/Documentation/core-api/pin_user_pages.rst
@@ -219,7 +219,7 @@ since the system was booted, via two new /proc/vmstat entries: ::
     /proc/vmstat/nr_foll_pin_requested
 
 Those are both going to show zero, unless CONFIG_DEBUG_VM is set. This is
-because there is a noticeable performance drop in put_user_page(), when they
+because there is a noticeable performance drop in unpin_user_page(), when they
 are activated.
 
 References
diff --git a/arch/powerpc/mm/book3s64/iommu_api.c b/arch/powerpc/mm/book3s64/iommu_api.c
index a86547822034..eba73ebd8ae5 100644
--- a/arch/powerpc/mm/book3s64/iommu_api.c
+++ b/arch/powerpc/mm/book3s64/iommu_api.c
@@ -168,7 +168,7 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, unsigned long ua,
 
 free_exit:
 	/* free the references taken */
-	put_user_pages(mem->hpages, pinned);
+	unpin_user_pages(mem->hpages, pinned);
 
 	vfree(mem->hpas);
 	kfree(mem);
@@ -214,7 +214,7 @@ static void mm_iommu_unpin(struct mm_iommu_table_group_mem_t *mem)
 		if (mem->hpas[i] & MM_IOMMU_TABLE_GROUP_PAGE_DIRTY)
 			SetPageDirty(page);
 
-		put_user_page(page);
+		unpin_user_page(page);
 
 		mem->hpas[i] = 0;
 	}
diff --git a/drivers/gpu/drm/via/via_dmablit.c b/drivers/gpu/drm/via/via_dmablit.c
index 37c5e572993a..719d036c9384 100644
--- a/drivers/gpu/drm/via/via_dmablit.c
+++ b/drivers/gpu/drm/via/via_dmablit.c
@@ -188,8 +188,8 @@ via_free_sg_info(struct pci_dev *pdev, drm_via_sg_info_t *vsg)
 		kfree(vsg->desc_pages);
 		/* fall through */
 	case dr_via_pages_locked:
-		put_user_pages_dirty_lock(vsg->pages, vsg->num_pages,
-					  (vsg->direction == DMA_FROM_DEVICE));
+		unpin_user_pages_dirty_lock(vsg->pages, vsg->num_pages,
+					   (vsg->direction == DMA_FROM_DEVICE));
 		/* fall through */
 	case dr_via_pages_alloc:
 		vfree(vsg->pages);
diff --git a/drivers/infiniband/core/umem.c b/drivers/infiniband/core/umem.c
index 55daefaa9b88..a6094766b6f5 100644
--- a/drivers/infiniband/core/umem.c
+++ b/drivers/infiniband/core/umem.c
@@ -54,7 +54,7 @@ static void __ib_umem_release(struct ib_device *dev, struct ib_umem *umem, int d
 
 	for_each_sg_page(umem->sg_head.sgl, &sg_iter, umem->sg_nents, 0) {
 		page = sg_page_iter_page(&sg_iter);
-		put_user_pages_dirty_lock(&page, 1, umem->writable && dirty);
+		unpin_user_pages_dirty_lock(&page, 1, umem->writable && dirty);
 	}
 
 	sg_free_table(&umem->sg_head);
diff --git a/drivers/infiniband/hw/hfi1/user_pages.c b/drivers/infiniband/hw/hfi1/user_pages.c
index 9a94761765c0..3b505006c0a6 100644
--- a/drivers/infiniband/hw/hfi1/user_pages.c
+++ b/drivers/infiniband/hw/hfi1/user_pages.c
@@ -118,7 +118,7 @@ int hfi1_acquire_user_pages(struct mm_struct *mm, unsigned long vaddr, size_t np
 void hfi1_release_user_pages(struct mm_struct *mm, struct page **p,
 			     size_t npages, bool dirty)
 {
-	put_user_pages_dirty_lock(p, npages, dirty);
+	unpin_user_pages_dirty_lock(p, npages, dirty);
 
 	if (mm) { /* during close after signal, mm can be NULL */
 		atomic64_sub(npages, &mm->pinned_vm);
diff --git a/drivers/infiniband/hw/mthca/mthca_memfree.c b/drivers/infiniband/hw/mthca/mthca_memfree.c
index 8269ab040c21..78a48aea3faf 100644
--- a/drivers/infiniband/hw/mthca/mthca_memfree.c
+++ b/drivers/infiniband/hw/mthca/mthca_memfree.c
@@ -482,7 +482,7 @@ int mthca_map_user_db(struct mthca_dev *dev, struct mthca_uar *uar,
 
 	ret = pci_map_sg(dev->pdev, &db_tab->page[i].mem, 1, PCI_DMA_TODEVICE);
 	if (ret < 0) {
-		put_user_page(pages[0]);
+		unpin_user_page(pages[0]);
 		goto out;
 	}
 
@@ -490,7 +490,7 @@ int mthca_map_user_db(struct mthca_dev *dev, struct mthca_uar *uar,
 				 mthca_uarc_virt(dev, uar, i));
 	if (ret) {
 		pci_unmap_sg(dev->pdev, &db_tab->page[i].mem, 1, PCI_DMA_TODEVICE);
-		put_user_page(sg_page(&db_tab->page[i].mem));
+		unpin_user_page(sg_page(&db_tab->page[i].mem));
 		goto out;
 	}
 
@@ -556,7 +556,7 @@ void mthca_cleanup_user_db_tab(struct mthca_dev *dev, struct mthca_uar *uar,
 		if (db_tab->page[i].uvirt) {
 			mthca_UNMAP_ICM(dev, mthca_uarc_virt(dev, uar, i), 1);
 			pci_unmap_sg(dev->pdev, &db_tab->page[i].mem, 1, PCI_DMA_TODEVICE);
-			put_user_page(sg_page(&db_tab->page[i].mem));
+			unpin_user_page(sg_page(&db_tab->page[i].mem));
 		}
 	}
 
diff --git a/drivers/infiniband/hw/qib/qib_user_pages.c b/drivers/infiniband/hw/qib/qib_user_pages.c
index 7fc4b5f81fcd..342e3172ca40 100644
--- a/drivers/infiniband/hw/qib/qib_user_pages.c
+++ b/drivers/infiniband/hw/qib/qib_user_pages.c
@@ -40,7 +40,7 @@
 static void __qib_release_user_pages(struct page **p, size_t num_pages,
 				     int dirty)
 {
-	put_user_pages_dirty_lock(p, num_pages, dirty);
+	unpin_user_pages_dirty_lock(p, num_pages, dirty);
 }
 
 /**
diff --git a/drivers/infiniband/hw/qib/qib_user_sdma.c b/drivers/infiniband/hw/qib/qib_user_sdma.c
index 1a3cc2957e3a..a67599b5a550 100644
--- a/drivers/infiniband/hw/qib/qib_user_sdma.c
+++ b/drivers/infiniband/hw/qib/qib_user_sdma.c
@@ -317,7 +317,7 @@ static int qib_user_sdma_page_to_frags(const struct qib_devdata *dd,
 		 * the caller can ignore this page.
 		 */
 		if (put) {
-			put_user_page(page);
+			unpin_user_page(page);
 		} else {
 			/* coalesce case */
 			kunmap(page);
@@ -631,7 +631,7 @@ static void qib_user_sdma_free_pkt_frag(struct device *dev,
 			kunmap(pkt->addr[i].page);
 
 		if (pkt->addr[i].put_page)
-			put_user_page(pkt->addr[i].page);
+			unpin_user_page(pkt->addr[i].page);
 		else
 			__free_page(pkt->addr[i].page);
 	} else if (pkt->addr[i].kvaddr) {
@@ -706,7 +706,7 @@ static int qib_user_sdma_pin_pages(const struct qib_devdata *dd,
 	/* if error, return all pages not managed by pkt */
 free_pages:
 	while (i < j)
-		put_user_page(pages[i++]);
+		unpin_user_page(pages[i++]);
 
 done:
 	return ret;
diff --git a/drivers/infiniband/hw/usnic/usnic_uiom.c b/drivers/infiniband/hw/usnic/usnic_uiom.c
index 600896727d34..bd9f944b68fc 100644
--- a/drivers/infiniband/hw/usnic/usnic_uiom.c
+++ b/drivers/infiniband/hw/usnic/usnic_uiom.c
@@ -75,7 +75,7 @@ static void usnic_uiom_put_pages(struct list_head *chunk_list, int dirty)
 		for_each_sg(chunk->page_list, sg, chunk->nents, i) {
 			page = sg_page(sg);
 			pa = sg_phys(sg);
-			put_user_pages_dirty_lock(&page, 1, dirty);
+			unpin_user_pages_dirty_lock(&page, 1, dirty);
 			usnic_dbg("pa: %pa\n", &pa);
 		}
 		kfree(chunk);
diff --git a/drivers/infiniband/sw/siw/siw_mem.c b/drivers/infiniband/sw/siw/siw_mem.c
index e53b07dcfed5..e2061dc0b043 100644
--- a/drivers/infiniband/sw/siw/siw_mem.c
+++ b/drivers/infiniband/sw/siw/siw_mem.c
@@ -63,7 +63,7 @@ struct siw_mem *siw_mem_id2obj(struct siw_device *sdev, int stag_index)
 static void siw_free_plist(struct siw_page_chunk *chunk, int num_pages,
 			   bool dirty)
 {
-	put_user_pages_dirty_lock(chunk->plist, num_pages, dirty);
+	unpin_user_pages_dirty_lock(chunk->plist, num_pages, dirty);
 }
 
 void siw_umem_release(struct siw_umem *umem, bool dirty)
diff --git a/drivers/media/v4l2-core/videobuf-dma-sg.c b/drivers/media/v4l2-core/videobuf-dma-sg.c
index 162a2633b1e3..13b65ed9e74c 100644
--- a/drivers/media/v4l2-core/videobuf-dma-sg.c
+++ b/drivers/media/v4l2-core/videobuf-dma-sg.c
@@ -349,8 +349,8 @@ int videobuf_dma_free(struct videobuf_dmabuf *dma)
 	BUG_ON(dma->sglen);
 
 	if (dma->pages) {
-		put_user_pages_dirty_lock(dma->pages, dma->nr_pages,
-					  dma->direction == DMA_FROM_DEVICE);
+		unpin_user_pages_dirty_lock(dma->pages, dma->nr_pages,
+					    dma->direction == DMA_FROM_DEVICE);
 		kfree(dma->pages);
 		dma->pages = NULL;
 	}
diff --git a/drivers/platform/goldfish/goldfish_pipe.c b/drivers/platform/goldfish/goldfish_pipe.c
index 2a5901efecde..1ab207ec9c94 100644
--- a/drivers/platform/goldfish/goldfish_pipe.c
+++ b/drivers/platform/goldfish/goldfish_pipe.c
@@ -360,8 +360,8 @@ static int transfer_max_buffers(struct goldfish_pipe *pipe,
 
 	*consumed_size = pipe->command_buffer->rw_params.consumed_size;
 
-	put_user_pages_dirty_lock(pipe->pages, pages_count,
-				  !is_write && *consumed_size > 0);
+	unpin_user_pages_dirty_lock(pipe->pages, pages_count,
+				    !is_write && *consumed_size > 0);
 
 	mutex_unlock(&pipe->lock);
 	return 0;
diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 18bfc2fc8e6d..a177bf2c6683 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -310,7 +310,7 @@ static int put_pfn(unsigned long pfn, int prot)
 	if (!is_invalid_reserved_pfn(pfn)) {
 		struct page *page = pfn_to_page(pfn);
 
-		put_user_pages_dirty_lock(&page, 1, prot & IOMMU_WRITE);
+		unpin_user_pages_dirty_lock(&page, 1, prot & IOMMU_WRITE);
 		return 1;
 	}
 	return 0;
diff --git a/fs/io_uring.c b/fs/io_uring.c
index 9639ebc21e8a..f5a378251995 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -4400,7 +4400,7 @@ static int io_sqe_buffer_unregister(struct io_ring_ctx *ctx)
 		struct io_mapped_ubuf *imu = &ctx->user_bufs[i];
 
 		for (j = 0; j < imu->nr_bvecs; j++)
-			put_user_page(imu->bvec[j].bv_page);
+			unpin_user_page(imu->bvec[j].bv_page);
 
 		if (ctx->account_mem)
 			io_unaccount_mem(ctx->user, imu->nr_bvecs);
@@ -4545,7 +4545,7 @@ static int io_sqe_buffer_register(struct io_ring_ctx *ctx, void __user *arg,
 			 * release any pages we did get
 			 */
 			if (pret > 0)
-				put_user_pages(pages, pret);
+				unpin_user_pages(pages, pret);
 			if (ctx->account_mem)
 				io_unaccount_mem(ctx->user, nr_pages);
 			kvfree(imu->bvec);
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0fb9929e00af..6a1a357e7d86 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1045,27 +1045,27 @@ static inline void put_page(struct page *page)
 }
 
 /**
- * put_user_page() - release a gup-pinned page
+ * unpin_user_page() - release a gup-pinned page
  * @page:            pointer to page to be released
  *
  * Pages that were pinned via pin_user_pages*() must be released via either
- * put_user_page(), or one of the put_user_pages*() routines. This is so that
- * eventually such pages can be separately tracked and uniquely handled. In
+ * unpin_user_page(), or one of the unpin_user_pages*() routines. This is so
+ * that eventually such pages can be separately tracked and uniquely handled. In
  * particular, interactions with RDMA and filesystems need special handling.
  *
- * put_user_page() and put_page() are not interchangeable, despite this early
- * implementation that makes them look the same. put_user_page() calls must
+ * unpin_user_page() and put_page() are not interchangeable, despite this early
+ * implementation that makes them look the same. unpin_user_page() calls must
  * be perfectly matched up with pin*() calls.
  */
-static inline void put_user_page(struct page *page)
+static inline void unpin_user_page(struct page *page)
 {
 	put_page(page);
 }
 
-void put_user_pages_dirty_lock(struct page **pages, unsigned long npages,
-			       bool make_dirty);
+void unpin_user_pages_dirty_lock(struct page **pages, unsigned long npages,
+				 bool make_dirty);
 
-void put_user_pages(struct page **pages, unsigned long npages);
+void unpin_user_pages(struct page **pages, unsigned long npages);
 
 #if defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
 #define SECTION_IN_PAGE_FLAGS
@@ -2595,7 +2595,7 @@ struct page *follow_page(struct vm_area_struct *vma, unsigned long address,
 #define FOLL_ANON	0x8000	/* don't do file mappings */
 #define FOLL_LONGTERM	0x10000	/* mapping lifetime is indefinite: see below */
 #define FOLL_SPLIT_PMD	0x20000	/* split huge pmd before returning */
-#define FOLL_PIN	0x40000	/* pages must be released via put_user_page() */
+#define FOLL_PIN	0x40000	/* pages must be released via unpin_user_page */
 
 /*
  * FOLL_PIN and FOLL_LONGTERM may be used in various combinations with each
@@ -2630,7 +2630,7 @@ struct page *follow_page(struct vm_area_struct *vma, unsigned long address,
  * Direct IO). This lets the filesystem know that some non-file-system entity is
  * potentially changing the pages' data. In contrast to FOLL_GET (whose pages
  * are released via put_page()), FOLL_PIN pages must be released, ultimately, by
- * a call to put_user_page().
+ * a call to unpin_user_page().
  *
  * FOLL_PIN is similar to FOLL_GET: both of these pin pages. They use different
  * and separate refcounting mechanisms, however, and that means that each has
@@ -2638,7 +2638,7 @@ struct page *follow_page(struct vm_area_struct *vma, unsigned long address,
  *
  *     FOLL_GET: get_user_pages*() to acquire, and put_page() to release.
  *
- *     FOLL_PIN: pin_user_pages*() to acquire, and put_user_pages to release.
+ *     FOLL_PIN: pin_user_pages*() to acquire, and unpin_user_pages to release.
  *
  * FOLL_PIN and FOLL_GET are mutually exclusive for a given function call.
  * (The underlying pages may experience both FOLL_GET-based and FOLL_PIN-based
@@ -2648,7 +2648,7 @@ struct page *follow_page(struct vm_area_struct *vma, unsigned long address,
  * FOLL_PIN should be set internally by the pin_user_pages*() APIs, never
  * directly by the caller. That's in order to help avoid mismatches when
  * releasing pages: get_user_pages*() pages must be released via put_page(),
- * while pin_user_pages*() pages must be released via put_user_page().
+ * while pin_user_pages*() pages must be released via unpin_user_page().
  *
  * Please see Documentation/vm/pin_user_pages.rst for more information.
  */
diff --git a/mm/gup.c b/mm/gup.c
index 4862ff982bc3..73aedcefa4bd 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -52,7 +52,7 @@ static inline struct page *try_get_compound_head(struct page *page, int refs)
 }
 
 /**
- * put_user_pages_dirty_lock() - release and optionally dirty gup-pinned pages
+ * unpin_user_pages_dirty_lock() - release and optionally dirty gup-pinned pages
  * @pages:  array of pages to be maybe marked dirty, and definitely released.
  * @npages: number of pages in the @pages array.
  * @make_dirty: whether to mark the pages dirty
@@ -62,19 +62,19 @@ static inline struct page *try_get_compound_head(struct page *page, int refs)
  *
  * For each page in the @pages array, make that page (or its head page, if a
  * compound page) dirty, if @make_dirty is true, and if the page was previously
- * listed as clean. In any case, releases all pages using put_user_page(),
- * possibly via put_user_pages(), for the non-dirty case.
+ * listed as clean. In any case, releases all pages using unpin_user_page(),
+ * possibly via unpin_user_pages(), for the non-dirty case.
  *
- * Please see the put_user_page() documentation for details.
+ * Please see the unpin_user_page() documentation for details.
  *
  * set_page_dirty_lock() is used internally. If instead, set_page_dirty() is
  * required, then the caller should a) verify that this is really correct,
  * because _lock() is usually required, and b) hand code it:
- * set_page_dirty_lock(), put_user_page().
+ * set_page_dirty_lock(), unpin_user_page().
  *
  */
-void put_user_pages_dirty_lock(struct page **pages, unsigned long npages,
-			       bool make_dirty)
+void unpin_user_pages_dirty_lock(struct page **pages, unsigned long npages,
+				 bool make_dirty)
 {
 	unsigned long index;
 
@@ -85,7 +85,7 @@ void put_user_pages_dirty_lock(struct page **pages, unsigned long npages,
 	 */
 
 	if (!make_dirty) {
-		put_user_pages(pages, npages);
+		unpin_user_pages(pages, npages);
 		return;
 	}
 
@@ -113,21 +113,21 @@ void put_user_pages_dirty_lock(struct page **pages, unsigned long npages,
 		 */
 		if (!PageDirty(page))
 			set_page_dirty_lock(page);
-		put_user_page(page);
+		unpin_user_page(page);
 	}
 }
-EXPORT_SYMBOL(put_user_pages_dirty_lock);
+EXPORT_SYMBOL(unpin_user_pages_dirty_lock);
 
 /**
- * put_user_pages() - release an array of gup-pinned pages.
+ * unpin_user_pages() - release an array of gup-pinned pages.
  * @pages:  array of pages to be marked dirty and released.
  * @npages: number of pages in the @pages array.
  *
- * For each page in the @pages array, release the page using put_user_page().
+ * For each page in the @pages array, release the page using unpin_user_page().
  *
- * Please see the put_user_page() documentation for details.
+ * Please see the unpin_user_page() documentation for details.
  */
-void put_user_pages(struct page **pages, unsigned long npages)
+void unpin_user_pages(struct page **pages, unsigned long npages)
 {
 	unsigned long index;
 
@@ -137,9 +137,9 @@ void put_user_pages(struct page **pages, unsigned long npages)
 	 * single operation to the head page should suffice.
 	 */
 	for (index = 0; index < npages; index++)
-		put_user_page(pages[index]);
+		unpin_user_page(pages[index]);
 }
-EXPORT_SYMBOL(put_user_pages);
+EXPORT_SYMBOL(unpin_user_pages);
 
 #ifdef CONFIG_MMU
 static struct page *no_page_table(struct vm_area_struct *vma,
diff --git a/mm/process_vm_access.c b/mm/process_vm_access.c
index fd20ab675b85..de41e830cdac 100644
--- a/mm/process_vm_access.c
+++ b/mm/process_vm_access.c
@@ -126,8 +126,8 @@ static int process_vm_rw_single_vec(unsigned long addr,
 		pa += pinned_pages * PAGE_SIZE;
 
 		/* If vm_write is set, the pages need to be made dirty: */
-		put_user_pages_dirty_lock(process_pages, pinned_pages,
-					  vm_write);
+		unpin_user_pages_dirty_lock(process_pages, pinned_pages,
+					    vm_write);
 	}
 
 	return rc;
diff --git a/net/xdp/xdp_umem.c b/net/xdp/xdp_umem.c
index d071003b5e76..ac182c38f7b0 100644
--- a/net/xdp/xdp_umem.c
+++ b/net/xdp/xdp_umem.c
@@ -212,7 +212,7 @@ static int xdp_umem_map_pages(struct xdp_umem *umem)
 
 static void xdp_umem_unpin_pages(struct xdp_umem *umem)
 {
-	put_user_pages_dirty_lock(umem->pgs, umem->npgs, true);
+	unpin_user_pages_dirty_lock(umem->pgs, umem->npgs, true);
 
 	kfree(umem->pgs);
 	umem->pgs = NULL;
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
