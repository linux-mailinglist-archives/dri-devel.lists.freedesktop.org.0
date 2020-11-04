Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 167D52A6FEB
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 22:52:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63CF46E092;
	Wed,  4 Nov 2020 21:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59ED891C5
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 21:52:41 +0000 (UTC)
IronPort-SDR: c+RkUot2DLskazUa5bLhgPK/4S488Boiv4XLDt5fAQh1cdxYl3GDyxpO1IiapRrOLYa+03g/pU
 8q64Ohxk6hCQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="157067606"
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; d="scan'208";a="157067606"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 13:52:41 -0800
IronPort-SDR: FeWejK1yBrJpSONTHJgEcc+4cRCob3coWDdGfXBZYW2XyaZ3b2DZdVsWLFAh06WoZ7I6vJcdXD
 bFcKYk5erEWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; d="scan'208";a="337019374"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by orsmga002.jf.intel.com with ESMTP; 04 Nov 2020 13:52:41 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 1/5] RDMA/umem: Support importing dma-buf as user memory
 region
Date: Wed,  4 Nov 2020 14:06:31 -0800
Message-Id: <1604527595-39736-2-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1604527595-39736-1-git-send-email-jianxin.xiong@intel.com>
References: <1604527595-39736-1-git-send-email-jianxin.xiong@intel.com>
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
 drivers/infiniband/core/Makefile      |   2 +-
 drivers/infiniband/core/umem.c        |   7 ++
 drivers/infiniband/core/umem_dmabuf.c | 131 ++++++++++++++++++++++++++++++++++
 drivers/infiniband/core/umem_dmabuf.h |  11 +++
 include/rdma/ib_umem.h                |  35 ++++++++-
 5 files changed, 184 insertions(+), 2 deletions(-)
 create mode 100644 drivers/infiniband/core/umem_dmabuf.c
 create mode 100644 drivers/infiniband/core/umem_dmabuf.h

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
index f1fc7e3..1a8a5b5 100644
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
@@ -43,6 +44,7 @@
 #include <rdma/ib_umem_odp.h>
 
 #include "uverbs.h"
+#include "umem_dmabuf.h"
 
 static void __ib_umem_release(struct ib_device *dev, struct ib_umem *umem, int dirty)
 {
@@ -93,6 +95,9 @@ unsigned long ib_umem_find_best_pgsz(struct ib_umem *umem,
 		return page_size;
 	}
 
+	if (umem->is_dmabuf)
+		return PAGE_SIZE;
+
 	/* rdma_for_each_block() has a bug if the page size is smaller than the
 	 * page size used to build the umem. For now prevent smaller page sizes
 	 * from being returned.
@@ -278,6 +283,8 @@ void ib_umem_release(struct ib_umem *umem)
 {
 	if (!umem)
 		return;
+	if (umem->is_dmabuf)
+		return ib_umem_dmabuf_release(to_ib_umem_dmabuf(umem));
 	if (umem->is_odp)
 		return ib_umem_odp_release(to_ib_umem_odp(umem));
 
diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
new file mode 100644
index 0000000..816e73d
--- /dev/null
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -0,0 +1,131 @@
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
+#include "umem_dmabuf.h"
+
+int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
+{
+	struct sg_table *sgt;
+	struct dma_fence *fence;
+
+	dma_resv_assert_held(umem_dmabuf->attach->dmabuf->resv);
+
+	sgt = dma_buf_map_attachment(umem_dmabuf->attach,
+				     DMA_BIDIRECTIONAL);
+
+	if (IS_ERR(sgt))
+		return PTR_ERR(sgt);
+
+	umem_dmabuf->umem.sg_head = *sgt;
+	umem_dmabuf->umem.nmap = sgt->nents;
+	umem_dmabuf->sgt = sgt;
+
+	/*
+	 * Although the sg list is valid now, the content of the pages
+	 * may be not up-to-date. Wait for the exporter to finish
+	 * the migration.
+	 */
+	fence = dma_resv_get_excl(umem_dmabuf->attach->dmabuf->resv);
+	if (fence)
+		dma_fence_wait(fence, false);
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
+	dma_buf_unmap_attachment(umem_dmabuf->attach, umem_dmabuf->sgt,
+				 DMA_BIDIRECTIONAL);
+	umem_dmabuf->sgt = NULL;
+}
+EXPORT_SYMBOL(ib_umem_dmabuf_unmap_pages);
+
+struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
+				   unsigned long offset, size_t size,
+				   int fd, int access,
+				   const struct dma_buf_attach_ops *ops)
+{
+	struct dma_buf *dmabuf;
+	struct ib_umem_dmabuf *umem_dmabuf;
+	struct ib_umem *umem;
+	unsigned long end;
+	long ret;
+
+	if (check_add_overflow(offset, (unsigned long)size, &end))
+		return ERR_PTR(-EINVAL);
+
+	if (unlikely(PAGE_ALIGN(end) < PAGE_SIZE))
+		return ERR_PTR(-EINVAL);
+
+	if (unlikely(!ops || !ops->move_notify))
+		return ERR_PTR(-EINVAL);
+
+	umem_dmabuf = kzalloc(sizeof(*umem_dmabuf), GFP_KERNEL);
+	if (!umem_dmabuf)
+		return ERR_PTR(-ENOMEM);
+
+	umem = &umem_dmabuf->umem;
+	umem->ibdev = device;
+	umem->length = size;
+	umem->address = offset;
+	umem->iova = offset;
+	umem->writable = ib_access_writable(access);
+	umem->is_dmabuf = 1;
+
+	if (unlikely(!ib_umem_num_pages(umem))) {
+		ret = -EINVAL;
+		goto out_free_umem;
+	}
+
+	dmabuf = dma_buf_get(fd);
+	if (IS_ERR(dmabuf)) {
+		ret = PTR_ERR(dmabuf);
+		goto out_free_umem;
+	}
+
+	umem_dmabuf->attach = dma_buf_dynamic_attach(
+					dmabuf,
+					device->dma_device,
+					ops,
+					umem_dmabuf);
+	if (IS_ERR(umem_dmabuf->attach)) {
+		ret = PTR_ERR(umem_dmabuf->attach);
+		goto out_release_dmabuf;
+	}
+
+	return umem;
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
+void ib_umem_dmabuf_release(struct ib_umem_dmabuf *umem_dmabuf)
+{
+	struct dma_buf *dmabuf = umem_dmabuf->attach->dmabuf;
+
+	dma_resv_lock(dmabuf->resv, NULL);
+	ib_umem_dmabuf_unmap_pages(umem_dmabuf);
+	dma_resv_unlock(dmabuf->resv);
+
+	dma_buf_detach(dmabuf, umem_dmabuf->attach);
+	dma_buf_put(dmabuf);
+	kfree(umem_dmabuf);
+}
diff --git a/drivers/infiniband/core/umem_dmabuf.h b/drivers/infiniband/core/umem_dmabuf.h
new file mode 100644
index 0000000..13acf55
--- /dev/null
+++ b/drivers/infiniband/core/umem_dmabuf.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Copyright (c) 2020 Intel Corporation. All rights reserved.
+ */
+
+#ifndef UMEM_DMABUF_H
+#define UMEM_DMABUF_H
+
+void ib_umem_dmabuf_release(struct ib_umem_dmabuf *umem_dmabuf);
+
+#endif /* UMEM_DMABUF_H */
diff --git a/include/rdma/ib_umem.h b/include/rdma/ib_umem.h
index 7059750..cf46b15 100644
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
@@ -22,12 +24,25 @@ struct ib_umem {
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
@@ -79,6 +94,12 @@ int ib_umem_copy_from(void *dst, struct ib_umem *umem, size_t offset,
 unsigned long ib_umem_find_best_pgsz(struct ib_umem *umem,
 				     unsigned long pgsz_bitmap,
 				     unsigned long virt);
+struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
+				   unsigned long offset, size_t size,
+				   int fd, int access,
+				   const struct dma_buf_attach_ops *ops);
+int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf);
+void ib_umem_dmabuf_unmap_pages(struct ib_umem_dmabuf *umem_dmabuf);
 
 #else /* CONFIG_INFINIBAND_USER_MEM */
 
@@ -101,7 +122,19 @@ static inline unsigned long ib_umem_find_best_pgsz(struct ib_umem *umem,
 {
 	return 0;
 }
+static inline struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
+						 unsigned long offset,
+						 size_t size, int fd,
+						 int access,
+						 struct dma_buf_attach_ops *ops)
+{
+	return ERR_PTR(-EINVAL);
+}
+static inline int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
+{
+	return -EINVAL;
+}
+static inline void ib_umem_dmabuf_unmap_pages(struct ib_umem_dmabuf *umem_dmabuf) { }
 
 #endif /* CONFIG_INFINIBAND_USER_MEM */
-
 #endif /* IB_UMEM_H */
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
