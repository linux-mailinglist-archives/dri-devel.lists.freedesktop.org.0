Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9504B282CA2
	for <lists+dri-devel@lfdr.de>; Sun,  4 Oct 2020 20:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC0689E52;
	Sun,  4 Oct 2020 18:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13E889E52
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Oct 2020 18:59:03 +0000 (UTC)
IronPort-SDR: Yv1lu59uZ/ET8yLEyrv+GcfMVguzb3mJmMeGvwFzPgShFRrWEZ9gC1gcPMqp7Qkf2qJpgxHKyh
 DhKd3dNO90Pg==
X-IronPort-AV: E=McAfee;i="6000,8403,9764"; a="224919336"
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; d="scan'208";a="224919336"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2020 11:59:03 -0700
IronPort-SDR: 1zS1NWET5cIpLzdAYSK+ap6okcsxVoukK9YiEklbimDSmXEcbrwS1WqaWlwnsqQ36nQmQR0x8b
 Po7X4uLrrpYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; d="scan'208";a="295384602"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by fmsmga007.fm.intel.com with ESMTP; 04 Oct 2020 11:59:02 -0700
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Date: Sun,  4 Oct 2020 12:12:28 -0700
Message-Id: <1601838751-148544-2-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1601838751-148544-1-git-send-email-jianxin.xiong@intel.com>
References: <1601838751-148544-1-git-send-email-jianxin.xiong@intel.com>
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
Cc: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dma-buf is a standard cross-driver buffer sharing mechanism that can be
used to support peer-to-peer access from RDMA devices.

Device memory exported via dma-buf is associated with a file descriptor.
This is passed to the user space as a property associated with the
buffer allocation. When the buffer is registered as a memory region,
the file descriptor is passed to the RDMA driver along with other
parameters.

Implement the common code for importing dma-buf object and mapping
dma-buf pages.

Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
Reviewed-by: Sean Hefty <sean.hefty@intel.com>
Acked-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/infiniband/core/Makefile      |   2 +-
 drivers/infiniband/core/umem.c        |   4 +
 drivers/infiniband/core/umem_dmabuf.c | 291 ++++++++++++++++++++++++++++++++++
 drivers/infiniband/core/umem_dmabuf.h |  14 ++
 drivers/infiniband/core/umem_odp.c    |  12 ++
 include/rdma/ib_umem.h                |  19 ++-
 6 files changed, 340 insertions(+), 2 deletions(-)
 create mode 100644 drivers/infiniband/core/umem_dmabuf.c
 create mode 100644 drivers/infiniband/core/umem_dmabuf.h

diff --git a/drivers/infiniband/core/Makefile b/drivers/infiniband/core/Makefile
index 24cb71a..b8d51a7 100644
--- a/drivers/infiniband/core/Makefile
+++ b/drivers/infiniband/core/Makefile
@@ -40,5 +40,5 @@ ib_uverbs-y :=			uverbs_main.o uverbs_cmd.o uverbs_marshall.o \
 				uverbs_std_types_srq.o \
 				uverbs_std_types_wq.o \
 				uverbs_std_types_qp.o
-ib_uverbs-$(CONFIG_INFINIBAND_USER_MEM) += umem.o
+ib_uverbs-$(CONFIG_INFINIBAND_USER_MEM) += umem.o umem_dmabuf.o
 ib_uverbs-$(CONFIG_INFINIBAND_ON_DEMAND_PAGING) += umem_odp.o
diff --git a/drivers/infiniband/core/umem.c b/drivers/infiniband/core/umem.c
index 831bff8..59ec36c 100644
--- a/drivers/infiniband/core/umem.c
+++ b/drivers/infiniband/core/umem.c
@@ -2,6 +2,7 @@
  * Copyright (c) 2005 Topspin Communications.  All rights reserved.
  * Copyright (c) 2005 Cisco Systems.  All rights reserved.
  * Copyright (c) 2005 Mellanox Technologies. All rights reserved.
+ * Copyright (c) 2020 Intel Corporation. All rights reserved.
  *
  * This software is available to you under a choice of one of two
  * licenses.  You may choose to be licensed under the terms of the GNU
@@ -42,6 +43,7 @@
 #include <rdma/ib_umem_odp.h>
 
 #include "uverbs.h"
+#include "umem_dmabuf.h"
 
 static void __ib_umem_release(struct ib_device *dev, struct ib_umem *umem, int dirty)
 {
@@ -318,6 +320,8 @@ void ib_umem_release(struct ib_umem *umem)
 {
 	if (!umem)
 		return;
+	if (umem->is_dmabuf)
+		return ib_umem_dmabuf_release(umem);
 	if (umem->is_odp)
 		return ib_umem_odp_release(to_ib_umem_odp(umem));
 
diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
new file mode 100644
index 0000000..10ed646
--- /dev/null
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -0,0 +1,291 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Copyright (c) 2020 Intel Corporation. All rights reserved.
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/dma-resv.h>
+#include <linux/dma-mapping.h>
+#include <rdma/ib_umem_odp.h>
+
+#include "uverbs.h"
+
+struct ib_umem_dmabuf {
+	struct ib_umem_odp umem_odp;
+	struct dma_buf_attachment *attach;
+	struct sg_table *sgt;
+	atomic_t notifier_seq;
+};
+
+static inline struct ib_umem_dmabuf *to_ib_umem_dmabuf(struct ib_umem *umem)
+{
+	struct ib_umem_odp *umem_odp = to_ib_umem_odp(umem);
+	return container_of(umem_odp, struct ib_umem_dmabuf, umem_odp);
+}
+
+static void ib_umem_dmabuf_invalidate_cb(struct dma_buf_attachment *attach)
+{
+	struct ib_umem_dmabuf *umem_dmabuf = attach->importer_priv;
+	struct ib_umem_odp *umem_odp = &umem_dmabuf->umem_odp;
+	struct mmu_notifier_range range = {};
+	unsigned long current_seq;
+
+	/* no concurrent invalidation due to the dma_resv lock */
+
+	dma_resv_assert_held(umem_dmabuf->attach->dmabuf->resv);
+
+	if (!umem_dmabuf->sgt)
+		return;
+
+	range.start = ib_umem_start(umem_odp);
+	range.end = ib_umem_end(umem_odp);
+	range.flags = MMU_NOTIFIER_RANGE_BLOCKABLE;
+	current_seq = atomic_read(&umem_dmabuf->notifier_seq);
+	umem_odp->notifier.ops->invalidate(&umem_odp->notifier, &range,
+					   current_seq);
+
+	atomic_inc(&umem_dmabuf->notifier_seq);
+}
+
+static struct dma_buf_attach_ops ib_umem_dmabuf_attach_ops = {
+	.allow_peer2peer = 1,
+	.move_notify = ib_umem_dmabuf_invalidate_cb,
+};
+
+static inline int ib_umem_dmabuf_init_odp(struct ib_umem_odp *umem_odp)
+{
+	size_t page_size = 1UL << umem_odp->page_shift;
+	unsigned long start;
+	unsigned long end;
+	size_t pages;
+
+	umem_odp->umem.is_odp = 1;
+	mutex_init(&umem_odp->umem_mutex);
+
+	start = ALIGN_DOWN(umem_odp->umem.address, page_size);
+	if (check_add_overflow(umem_odp->umem.address,
+			       (unsigned long)umem_odp->umem.length,
+			       &end))
+		return -EOVERFLOW;
+	end = ALIGN(end, page_size);
+	if (unlikely(end < page_size))
+		return -EOVERFLOW;
+
+	pages = (end - start) >> umem_odp->page_shift;
+	if (!pages)
+		return -EINVAL;
+
+	/* used for ib_umem_start() & ib_umem_end() */
+	umem_odp->notifier.interval_tree.start = start;
+	umem_odp->notifier.interval_tree.last = end - 1;
+
+	/* umem_odp->page_list is never used for dma-buf */
+
+	umem_odp->dma_list = kvcalloc(
+		pages, sizeof(*umem_odp->dma_list), GFP_KERNEL);
+	if (!umem_odp->dma_list)
+		return -ENOMEM;
+
+	return 0;
+}
+
+struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
+				   unsigned long addr, size_t size,
+				   int dmabuf_fd, int access,
+				   const struct mmu_interval_notifier_ops *ops)
+{
+	struct dma_buf *dmabuf;
+	struct ib_umem_dmabuf *umem_dmabuf;
+	struct ib_umem *umem;
+	struct ib_umem_odp *umem_odp;
+	unsigned long end;
+	long ret;
+
+	if (check_add_overflow(addr, size, &end))
+		return ERR_PTR(-EINVAL);
+
+	if (unlikely(PAGE_ALIGN(end) < PAGE_SIZE))
+		return ERR_PTR(-EINVAL);
+
+	umem_dmabuf = kzalloc(sizeof(*umem_dmabuf), GFP_KERNEL);
+	if (!umem_dmabuf)
+		return ERR_PTR(-ENOMEM);
+
+	umem = &umem_dmabuf->umem_odp.umem;
+	umem->ibdev = device;
+	umem->length = size;
+	umem->address = addr;
+	umem->writable = ib_access_writable(access);
+	umem->is_dmabuf = 1;
+
+	dmabuf = dma_buf_get(dmabuf_fd);
+	if (IS_ERR(dmabuf)) {
+		ret = PTR_ERR(dmabuf);
+		goto out_free_umem;
+	}
+
+	/* always attach dynamically to pass the allow_peer2peer flag */
+	umem_dmabuf->attach = dma_buf_dynamic_attach(
+					dmabuf,
+					device->dma_device,
+					&ib_umem_dmabuf_attach_ops,
+					umem_dmabuf);
+	if (IS_ERR(umem_dmabuf->attach)) {
+		ret = PTR_ERR(umem_dmabuf->attach);
+		goto out_release_dmabuf;
+	}
+
+	umem_odp = &umem_dmabuf->umem_odp;
+	umem_odp->page_shift = PAGE_SHIFT;
+	if (access & IB_ACCESS_HUGETLB) {
+		/* don't support huge_tlb at this point */
+		ret = -EINVAL;
+		goto out_detach_dmabuf;
+	}
+
+	ret = ib_umem_dmabuf_init_odp(umem_odp);
+	if (ret)
+		goto out_detach_dmabuf;
+
+	umem_odp->notifier.ops = ops;
+	return umem;
+
+out_detach_dmabuf:
+	dma_buf_detach(dmabuf, umem_dmabuf->attach);
+
+out_release_dmabuf:
+	dma_buf_put(dmabuf);
+
+out_free_umem:
+	kfree(umem_dmabuf);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL(ib_umem_dmabuf_get);
+
+unsigned long ib_umem_dmabuf_notifier_read_begin(struct ib_umem_odp *umem_odp)
+{
+	struct ib_umem_dmabuf *umem_dmabuf = to_ib_umem_dmabuf(&umem_odp->umem);
+
+	return atomic_read(&umem_dmabuf->notifier_seq);
+}
+EXPORT_SYMBOL(ib_umem_dmabuf_notifier_read_begin);
+
+int ib_umem_dmabuf_notifier_read_retry(struct ib_umem_odp *umem_odp,
+				       unsigned long current_seq)
+{
+	struct ib_umem_dmabuf *umem_dmabuf = to_ib_umem_dmabuf(&umem_odp->umem);
+
+	return (atomic_read(&umem_dmabuf->notifier_seq) != current_seq);
+}
+EXPORT_SYMBOL(ib_umem_dmabuf_notifier_read_retry);
+
+int ib_umem_dmabuf_map_pages(struct ib_umem *umem, u64 user_virt, u64 bcnt,
+			     u64 access_mask, unsigned long current_seq)
+{
+	struct ib_umem_dmabuf *umem_dmabuf = to_ib_umem_dmabuf(umem);
+	struct ib_umem_odp *umem_odp = &umem_dmabuf->umem_odp;
+	u64 start, end, addr;
+	int j, k, ret = 0, user_pages, pages, total_pages;
+	unsigned int page_shift;
+	size_t page_size;
+	struct scatterlist *sg;
+	struct sg_table *sgt;
+
+	if (access_mask == 0)
+		return -EINVAL;
+
+	if (user_virt < ib_umem_start(umem_odp) ||
+	    user_virt + bcnt > ib_umem_end(umem_odp))
+		return -EFAULT;
+
+	page_shift = umem_odp->page_shift;
+	page_size = 1UL << page_shift;
+	start = ALIGN_DOWN(user_virt, page_size);
+	end = ALIGN(user_virt + bcnt, page_size);
+	user_pages = (end - start) >> page_shift;
+
+	mutex_lock(&umem_odp->umem_mutex);
+
+	/* check for on-ongoing invalidations */
+	if (ib_umem_dmabuf_notifier_read_retry(umem_odp, current_seq)) {
+		ret = -EAGAIN;
+		goto out;
+	}
+
+	ret = user_pages;
+	if (umem_dmabuf->sgt)
+		goto out;
+
+	dma_resv_lock(umem_dmabuf->attach->dmabuf->resv, NULL);
+	sgt = dma_buf_map_attachment(umem_dmabuf->attach,
+				     DMA_BIDIRECTIONAL);
+	dma_resv_unlock(umem_dmabuf->attach->dmabuf->resv);
+
+	if (IS_ERR(sgt)) {
+		ret = PTR_ERR(sgt);
+		goto out;
+	}
+
+	umem->sg_head = *sgt;
+	umem->nmap = sgt->nents;
+	umem_dmabuf->sgt = sgt;
+
+	k = 0;
+	total_pages = ib_umem_odp_num_pages(umem_odp);
+	for_each_sg(umem->sg_head.sgl, sg, umem->sg_head.nents, j) {
+		addr = sg_dma_address(sg);
+		pages = sg_dma_len(sg) >> page_shift;
+		while (pages > 0 && k < total_pages) {
+			umem_odp->dma_list[k++] = addr | access_mask;
+			umem_odp->npages++;
+			addr += page_size;
+			pages--;
+		}
+	}
+
+	WARN_ON(k != total_pages);
+
+out:
+	mutex_unlock(&umem_odp->umem_mutex);
+	return ret;
+}
+
+void ib_umem_dmabuf_unmap_pages(struct ib_umem *umem)
+{
+	struct ib_umem_dmabuf *umem_dmabuf = to_ib_umem_dmabuf(umem);
+	struct ib_umem_odp *umem_odp = &umem_dmabuf->umem_odp;
+	int npages = ib_umem_odp_num_pages(umem_odp);
+	int i;
+
+	lockdep_assert_held(&umem_odp->umem_mutex);
+	dma_resv_assert_held(umem_dmabuf->attach->dmabuf->resv);
+
+	if (!umem_dmabuf->sgt)
+		return;
+
+	dma_buf_unmap_attachment(umem_dmabuf->attach, umem_dmabuf->sgt,
+				 DMA_BIDIRECTIONAL);
+
+	umem_dmabuf->sgt = NULL;
+
+	for (i = 0; i < npages; i++)
+		umem_odp->dma_list[i] = 0;
+	umem_odp->npages = 0;
+}
+
+void ib_umem_dmabuf_release(struct ib_umem *umem)
+{
+	struct ib_umem_dmabuf *umem_dmabuf = to_ib_umem_dmabuf(umem);
+	struct ib_umem_odp *umem_odp = &umem_dmabuf->umem_odp;
+	struct dma_buf *dmabuf = umem_dmabuf->attach->dmabuf;
+
+	mutex_lock(&umem_odp->umem_mutex);
+	dma_resv_lock(umem_dmabuf->attach->dmabuf->resv, NULL);
+	ib_umem_dmabuf_unmap_pages(umem);
+	dma_resv_unlock(umem_dmabuf->attach->dmabuf->resv);
+	mutex_unlock(&umem_odp->umem_mutex);
+	kvfree(umem_odp->dma_list);
+	dma_buf_detach(dmabuf, umem_dmabuf->attach);
+	dma_buf_put(dmabuf);
+	kfree(umem_dmabuf);
+}
diff --git a/drivers/infiniband/core/umem_dmabuf.h b/drivers/infiniband/core/umem_dmabuf.h
new file mode 100644
index 0000000..b9378bd
--- /dev/null
+++ b/drivers/infiniband/core/umem_dmabuf.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Copyright (c) 2020 Intel Corporation. All rights reserved.
+ */
+
+#ifndef UMEM_DMABUF_H
+#define UMEM_DMABUF_H
+
+int ib_umem_dmabuf_map_pages(struct ib_umem *umem, u64 user_virt, u64 bcnt,
+			     u64 access_mask, unsigned long current_seq);
+void ib_umem_dmabuf_unmap_pages(struct ib_umem *umem);
+void ib_umem_dmabuf_release(struct ib_umem *umem);
+
+#endif /* UMEM_DMABUF_H */
diff --git a/drivers/infiniband/core/umem_odp.c b/drivers/infiniband/core/umem_odp.c
index cc6b4be..7e11619 100644
--- a/drivers/infiniband/core/umem_odp.c
+++ b/drivers/infiniband/core/umem_odp.c
@@ -1,5 +1,6 @@
 /*
  * Copyright (c) 2014 Mellanox Technologies. All rights reserved.
+ * Copyright (c) 2020 Intel Corporation. All rights reserved.
  *
  * This software is available to you under a choice of one of two
  * licenses.  You may choose to be licensed under the terms of the GNU
@@ -47,6 +48,7 @@
 #include <rdma/ib_umem_odp.h>
 
 #include "uverbs.h"
+#include "umem_dmabuf.h"
 
 static inline int ib_init_umem_odp(struct ib_umem_odp *umem_odp,
 				   const struct mmu_interval_notifier_ops *ops)
@@ -263,6 +265,9 @@ struct ib_umem_odp *ib_umem_odp_get(struct ib_device *device,
 
 void ib_umem_odp_release(struct ib_umem_odp *umem_odp)
 {
+	if (umem_odp->umem.is_dmabuf)
+		return ib_umem_dmabuf_release(&umem_odp->umem);
+
 	/*
 	 * Ensure that no more pages are mapped in the umem.
 	 *
@@ -392,6 +397,10 @@ int ib_umem_odp_map_dma_pages(struct ib_umem_odp *umem_odp, u64 user_virt,
 	unsigned int flags = 0, page_shift;
 	phys_addr_t p = 0;
 
+	if (umem_odp->umem.is_dmabuf)
+		return ib_umem_dmabuf_map_pages(&umem_odp->umem, user_virt,
+						bcnt, access_mask, current_seq);
+
 	if (access_mask == 0)
 		return -EINVAL;
 
@@ -517,6 +526,9 @@ void ib_umem_odp_unmap_dma_pages(struct ib_umem_odp *umem_odp, u64 virt,
 	u64 addr;
 	struct ib_device *dev = umem_odp->umem.ibdev;
 
+	if (umem_odp->umem.is_dmabuf)
+		return ib_umem_dmabuf_unmap_pages(&umem_odp->umem);
+
 	lockdep_assert_held(&umem_odp->umem_mutex);
 
 	virt = max_t(u64, virt, ib_umem_start(umem_odp));
diff --git a/include/rdma/ib_umem.h b/include/rdma/ib_umem.h
index 71f573a..b8ea693 100644
--- a/include/rdma/ib_umem.h
+++ b/include/rdma/ib_umem.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB */
 /*
  * Copyright (c) 2007 Cisco Systems.  All rights reserved.
+ * Copyright (c) 2020 Intel Corporation.  All rights reserved.
  */
 
 #ifndef IB_UMEM_H
@@ -13,6 +14,7 @@
 
 struct ib_ucontext;
 struct ib_umem_odp;
+struct ib_umem_dmabuf;
 
 struct ib_umem {
 	struct ib_device       *ibdev;
@@ -21,6 +23,7 @@ struct ib_umem {
 	unsigned long		address;
 	u32 writable : 1;
 	u32 is_odp : 1;
+	u32 is_dmabuf : 1;
 	struct work_struct	work;
 	struct sg_table sg_head;
 	int             nmap;
@@ -51,6 +54,13 @@ int ib_umem_copy_from(void *dst, struct ib_umem *umem, size_t offset,
 unsigned long ib_umem_find_best_pgsz(struct ib_umem *umem,
 				     unsigned long pgsz_bitmap,
 				     unsigned long virt);
+struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
+				   unsigned long addr, size_t size,
+				   int dmabuf_fd, int access,
+				   const struct mmu_interval_notifier_ops *ops);
+unsigned long ib_umem_dmabuf_notifier_read_begin(struct ib_umem_odp *umem_odp);
+int ib_umem_dmabuf_notifier_read_retry(struct ib_umem_odp *umem_odp,
+				       unsigned long current_seq);
 
 #else /* CONFIG_INFINIBAND_USER_MEM */
 
@@ -73,7 +83,14 @@ static inline int ib_umem_find_best_pgsz(struct ib_umem *umem,
 					 unsigned long virt) {
 	return -EINVAL;
 }
+static inline struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
+						 unsigned long addr,
+						 size_t size, int dmabuf_fd,
+						 int access,
+						 struct mmu_interval_notifier_ops *ops)
+{
+	return ERR_PTR(-EINVAL);
+}
 
 #endif /* CONFIG_INFINIBAND_USER_MEM */
-
 #endif /* IB_UMEM_H */
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
