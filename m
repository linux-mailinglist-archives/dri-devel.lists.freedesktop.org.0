Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A80522DB5A4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 22:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3795B89A35;
	Tue, 15 Dec 2020 21:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A101B89A1A
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 21:11:53 +0000 (UTC)
IronPort-SDR: CC5iarnQPR6a+hN9QAOBxJSEnCxiEl8EPbD4IhS1zOL8xh5/Wd4486taPuN+tZ4nYsUFoze4AZ
 0F3zDZnLeoHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="239051452"
X-IronPort-AV: E=Sophos;i="5.78,422,1599548400"; d="scan'208";a="239051452"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2020 13:11:52 -0800
IronPort-SDR: sYEzzdqvm76611n9Qw8F0Tp7MKybairiCKlfspZjmGTme035uPUJmUIyk421fLEYTNeRsbc32Y
 cnfrJwMMrL+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,422,1599548400"; d="scan'208";a="488052988"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by orsmga004.jf.intel.com with ESMTP; 15 Dec 2020 13:11:52 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v16 1/4] RDMA/umem: Support importing dma-buf as user memory
 region
Date: Tue, 15 Dec 2020 13:27:13 -0800
Message-Id: <1608067636-98073-2-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1608067636-98073-1-git-send-email-jianxin.xiong@intel.com>
References: <1608067636-98073-1-git-send-email-jianxin.xiong@intel.com>
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
Acked-by: Christian Koenig <christian.koenig@amd.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/infiniband/Kconfig            |   1 +
 drivers/infiniband/core/Makefile      |   2 +-
 drivers/infiniband/core/umem.c        |   3 +
 drivers/infiniband/core/umem_dmabuf.c | 174 ++++++++++++++++++++++++++++++++++
 include/rdma/ib_umem.h                |  48 +++++++++-
 5 files changed, 224 insertions(+), 4 deletions(-)
 create mode 100644 drivers/infiniband/core/umem_dmabuf.c

diff --git a/drivers/infiniband/Kconfig b/drivers/infiniband/Kconfig
index 9325e18..04a78d9 100644
--- a/drivers/infiniband/Kconfig
+++ b/drivers/infiniband/Kconfig
@@ -41,6 +41,7 @@ config INFINIBAND_USER_MEM
 	bool
 	depends on INFINIBAND_USER_ACCESS != n
 	depends on MMU
+	select DMA_SHARED_BUFFER
 	default y
 
 config INFINIBAND_ON_DEMAND_PAGING
diff --git a/drivers/infiniband/core/Makefile b/drivers/infiniband/core/Makefile
index ccf2670..8ab4eea 100644
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
index 7ca4112..cc131f8 100644
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
@@ -278,6 +279,8 @@ void ib_umem_release(struct ib_umem *umem)
 {
 	if (!umem)
 		return;
+	if (umem->is_dmabuf)
+		return ib_umem_dmabuf_release(to_ib_umem_dmabuf(umem));
 	if (umem->is_odp)
 		return ib_umem_odp_release(to_ib_umem_odp(umem));
 
diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
new file mode 100644
index 0000000..f9b5162
--- /dev/null
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Copyright (c) 2020 Intel Corporation. All rights reserved.
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/dma-resv.h>
+#include <linux/dma-mapping.h>
+
+#include "uverbs.h"
+
+int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
+{
+	struct sg_table *sgt;
+	struct scatterlist *sg;
+	struct dma_fence *fence;
+	unsigned long start, end, cur = 0;
+	unsigned int nmap = 0;
+	int i;
+
+	dma_resv_assert_held(umem_dmabuf->attach->dmabuf->resv);
+
+	if (umem_dmabuf->sgt)
+		goto wait_fence;
+
+	sgt = dma_buf_map_attachment(umem_dmabuf->attach, DMA_BIDIRECTIONAL);
+	if (IS_ERR(sgt))
+		return PTR_ERR(sgt);
+
+	/* modify the sg list in-place to match umem address and length */
+
+	start = ALIGN_DOWN(umem_dmabuf->umem.address, PAGE_SIZE);
+	end = ALIGN(umem_dmabuf->umem.address + umem_dmabuf->umem.length,
+		    PAGE_SIZE);
+	for_each_sgtable_dma_sg(sgt, sg, i) {
+		if (start < cur + sg_dma_len(sg) && cur < end)
+			nmap++;
+		if (cur <= start && start < cur + sg_dma_len(sg)) {
+			unsigned long offset = start - cur;
+
+			umem_dmabuf->first_sg = sg;
+			umem_dmabuf->first_sg_offset = offset;
+			sg_dma_address(sg) += offset;
+			sg_dma_len(sg) -= offset;
+			cur += offset;
+		}
+		if (cur < end && end <= cur + sg_dma_len(sg)) {
+			unsigned long trim = cur + sg_dma_len(sg) - end;
+
+			umem_dmabuf->last_sg = sg;
+			umem_dmabuf->last_sg_trim = trim;
+			sg_dma_len(sg) -= trim;
+			break;
+		}
+		cur += sg_dma_len(sg);
+	}
+
+	umem_dmabuf->umem.sg_head.sgl = umem_dmabuf->first_sg;
+	umem_dmabuf->umem.sg_head.nents = nmap;
+	umem_dmabuf->umem.nmap = nmap;
+	umem_dmabuf->sgt = sgt;
+
+wait_fence:
+	/*
+	 * Although the sg list is valid now, the content of the pages
+	 * may be not up-to-date. Wait for the exporter to finish
+	 * the migration.
+	 */
+	fence = dma_resv_get_excl(umem_dmabuf->attach->dmabuf->resv);
+	if (fence)
+		return dma_fence_wait(fence, false);
+
+	return 0;
+}
+EXPORT_SYMBOL(ib_umem_dmabuf_map_pages);
+
+void ib_umem_dmabuf_unmap_pages(struct ib_umem_dmabuf *umem_dmabuf)
+{
+	dma_resv_assert_held(umem_dmabuf->attach->dmabuf->resv);
+
+	if (!umem_dmabuf->sgt)
+		return;
+
+	/* retore the original sg list */
+	if (umem_dmabuf->first_sg) {
+		sg_dma_address(umem_dmabuf->first_sg) -=
+			umem_dmabuf->first_sg_offset;
+		sg_dma_len(umem_dmabuf->first_sg) +=
+			umem_dmabuf->first_sg_offset;
+		umem_dmabuf->first_sg = NULL;
+		umem_dmabuf->first_sg_offset = 0;
+	}
+	if (umem_dmabuf->last_sg) {
+		sg_dma_len(umem_dmabuf->last_sg) +=
+			umem_dmabuf->last_sg_trim;
+		umem_dmabuf->last_sg = NULL;
+		umem_dmabuf->last_sg_trim = 0;
+	}
+
+	dma_buf_unmap_attachment(umem_dmabuf->attach, umem_dmabuf->sgt,
+				 DMA_BIDIRECTIONAL);
+
+	umem_dmabuf->sgt = NULL;
+}
+EXPORT_SYMBOL(ib_umem_dmabuf_unmap_pages);
+
+struct ib_umem_dmabuf *ib_umem_dmabuf_get(struct ib_device *device,
+					  unsigned long offset, size_t size,
+					  int fd, int access,
+					  const struct dma_buf_attach_ops *ops)
+{
+	struct dma_buf *dmabuf;
+	struct ib_umem_dmabuf *umem_dmabuf;
+	struct ib_umem *umem;
+	unsigned long end;
+	struct ib_umem_dmabuf *ret = ERR_PTR(-EINVAL);
+
+	if (check_add_overflow(offset, (unsigned long)size, &end))
+		return ret;
+
+	if (unlikely(!ops || !ops->move_notify))
+		return ret;
+
+	dmabuf = dma_buf_get(fd);
+	if (IS_ERR(dmabuf))
+		return ERR_CAST(dmabuf);
+
+	if (dmabuf->size < end)
+		goto out_release_dmabuf;
+
+	umem_dmabuf = kzalloc(sizeof(*umem_dmabuf), GFP_KERNEL);
+	if (!umem_dmabuf) {
+		ret = ERR_PTR(-ENOMEM);
+		goto out_release_dmabuf;
+	}
+
+	umem = &umem_dmabuf->umem;
+	umem->ibdev = device;
+	umem->length = size;
+	umem->address = offset;
+	umem->writable = ib_access_writable(access);
+	umem->is_dmabuf = 1;
+
+	if (!ib_umem_num_pages(umem))
+		goto out_free_umem;
+
+	umem_dmabuf->attach = dma_buf_dynamic_attach(
+					dmabuf,
+					device->dma_device,
+					ops,
+					umem_dmabuf);
+	if (IS_ERR(umem_dmabuf->attach)) {
+		ret = ERR_CAST(umem_dmabuf->attach);
+		goto out_free_umem;
+	}
+	return umem_dmabuf;
+
+out_free_umem:
+	kfree(umem_dmabuf);
+
+out_release_dmabuf:
+	dma_buf_put(dmabuf);
+	return ret;
+}
+EXPORT_SYMBOL(ib_umem_dmabuf_get);
+
+void ib_umem_dmabuf_release(struct ib_umem_dmabuf *umem_dmabuf)
+{
+	struct dma_buf *dmabuf = umem_dmabuf->attach->dmabuf;
+
+	dma_buf_detach(dmabuf, umem_dmabuf->attach);
+	dma_buf_put(dmabuf);
+	kfree(umem_dmabuf);
+}
diff --git a/include/rdma/ib_umem.h b/include/rdma/ib_umem.h
index 7752211..676c57f 100644
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
+struct dma_buf_attach_ops;
 
 struct ib_umem {
 	struct ib_device       *ibdev;
@@ -22,12 +24,29 @@ struct ib_umem {
 	unsigned long		address;
 	u32 writable : 1;
 	u32 is_odp : 1;
+	u32 is_dmabuf : 1;
 	struct work_struct	work;
 	struct sg_table sg_head;
 	int             nmap;
 	unsigned int    sg_nents;
 };
 
+struct ib_umem_dmabuf {
+	struct ib_umem umem;
+	struct dma_buf_attachment *attach;
+	struct sg_table *sgt;
+	struct scatterlist *first_sg;
+	struct scatterlist *last_sg;
+	unsigned long first_sg_offset;
+	unsigned long last_sg_trim;
+	void *private;
+};
+
+static inline struct ib_umem_dmabuf *to_ib_umem_dmabuf(struct ib_umem *umem)
+{
+	return container_of(umem, struct ib_umem_dmabuf, umem);
+}
+
 /* Returns the offset of the umem start relative to the first page. */
 static inline int ib_umem_offset(struct ib_umem *umem)
 {
@@ -86,6 +105,7 @@ int ib_umem_copy_from(void *dst, struct ib_umem *umem, size_t offset,
 unsigned long ib_umem_find_best_pgsz(struct ib_umem *umem,
 				     unsigned long pgsz_bitmap,
 				     unsigned long virt);
+
 /**
  * ib_umem_find_best_pgoff - Find best HW page size
  *
@@ -116,6 +136,14 @@ static inline unsigned long ib_umem_find_best_pgoff(struct ib_umem *umem,
 				      dma_addr & pgoff_bitmask);
 }
 
+struct ib_umem_dmabuf *ib_umem_dmabuf_get(struct ib_device *device,
+					  unsigned long offset, size_t size,
+					  int fd, int access,
+					  const struct dma_buf_attach_ops *ops);
+int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf);
+void ib_umem_dmabuf_unmap_pages(struct ib_umem_dmabuf *umem_dmabuf);
+void ib_umem_dmabuf_release(struct ib_umem_dmabuf *umem_dmabuf);
+
 #else /* CONFIG_INFINIBAND_USER_MEM */
 
 #include <linux/err.h>
@@ -124,12 +152,12 @@ static inline struct ib_umem *ib_umem_get(struct ib_device *device,
 					  unsigned long addr, size_t size,
 					  int access)
 {
-	return ERR_PTR(-EINVAL);
+	return ERR_PTR(-EOPNOTSUPP);
 }
 static inline void ib_umem_release(struct ib_umem *umem) { }
 static inline int ib_umem_copy_from(void *dst, struct ib_umem *umem, size_t offset,
 		      		    size_t length) {
-	return -EINVAL;
+	return -EOPNOTSUPP;
 }
 static inline unsigned long ib_umem_find_best_pgsz(struct ib_umem *umem,
 						   unsigned long pgsz_bitmap,
@@ -143,7 +171,21 @@ static inline unsigned long ib_umem_find_best_pgoff(struct ib_umem *umem,
 {
 	return 0;
 }
+static inline
+struct ib_umem_dmabuf *ib_umem_dmabuf_get(struct ib_device *device,
+					  unsigned long offset,
+					  size_t size, int fd,
+					  int access,
+					  struct dma_buf_attach_ops *ops)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+static inline int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
+{
+	return -EOPNOTSUPP;
+}
+static inline void ib_umem_dmabuf_unmap_pages(struct ib_umem_dmabuf *umem_dmabuf) { }
+static inline void ib_umem_dmabuf_release(struct ib_umem_dmabuf *umem_dmabuf) { }
 
 #endif /* CONFIG_INFINIBAND_USER_MEM */
-
 #endif /* IB_UMEM_H */
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
