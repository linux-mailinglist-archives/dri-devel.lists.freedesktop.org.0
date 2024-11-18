Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 419889D1BE5
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EBDE10E56A;
	Mon, 18 Nov 2024 23:37:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IrFj9FKw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4E010E040;
 Mon, 18 Nov 2024 23:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731973044; x=1763509044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y2XgvCO4mQouVbYYXxG/xv9Uz9Y6ODwgn8hTNcyktQQ=;
 b=IrFj9FKwvX3KSAKJBAnv8c7A6MU7ix050XzpqvCn9Wo3JadzGgIdbs0h
 wDfbz8dcSFHOkX/V7FHFor3ytRqHmOOe6uSLtw2dELY+kA5ZrN0jwjHIK
 54Ux6axXNo+xcYnEU9kgquuPLgSKxCQ+wbn07IrMaRHI0Rd8CaxX4v0Gp
 aGubjPRf5GDkmXO23lLG3naNdKm2ExtuVavcsxw6WeAdSlHI1EQpG3HKq
 CPsecNTIb18HBAKw08eJXwcZsA5sbeTG5YPy9aiJoB7YErNKPhOEieAUz
 6BlnDShgoh08UMh88cRTUF0eDlHL6o0AfkxQLxZH8jzk3fGjwN1uvjmPN A==;
X-CSE-ConnectionGUID: XUesvJgLRyeEmKvXb9EvyA==
X-CSE-MsgGUID: 95BpnEiUSFCdGCDKl21tJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31878857"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31878857"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:23 -0800
X-CSE-ConnectionGUID: jIkz5y60T46r1gXNkpZgtg==
X-CSE-MsgGUID: Zyda5ht9SuyPP51qVmDkYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89521675"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 02/29] dma-fence: Add dma_fence_user_fence
Date: Mon, 18 Nov 2024 15:37:30 -0800
Message-Id: <20241118233757.2374041-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118233757.2374041-1-matthew.brost@intel.com>
References: <20241118233757.2374041-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Normalize user fence attachment to a DMA fence. A user fence is a simple
seqno write to memory, implemented by attaching a DMA fence callback
that writes out the seqno. Intended use case is importing a dma-fence
into kernel and exporting a user fence.

Helpers added to allocate, attach, and free a dma_fence_user_fence.

Cc: Dave Airlie <airlied@redhat.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/dma-buf/Makefile               |  2 +-
 drivers/dma-buf/dma-fence-user-fence.c | 73 ++++++++++++++++++++++++++
 include/linux/dma-fence-user-fence.h   | 31 +++++++++++
 3 files changed, 105 insertions(+), 1 deletion(-)
 create mode 100644 drivers/dma-buf/dma-fence-user-fence.c
 create mode 100644 include/linux/dma-fence-user-fence.h

diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
index c25500bb38b5..ba9ba339319e 100644
--- a/drivers/dma-buf/Makefile
+++ b/drivers/dma-buf/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
-	 dma-fence-preempt.o dma-fence-unwrap.o dma-resv.o
+	 dma-fence-preempt.o dma-fence-unwrap.o dma-fence-user-fence.o dma-resv.o
 obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
 obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
 obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
diff --git a/drivers/dma-buf/dma-fence-user-fence.c b/drivers/dma-buf/dma-fence-user-fence.c
new file mode 100644
index 000000000000..5a4b289bacb8
--- /dev/null
+++ b/drivers/dma-buf/dma-fence-user-fence.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <linux/dma-fence-user-fence.h>
+#include <linux/slab.h>
+
+static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
+{
+	struct dma_fence_user_fence *user_fence =
+		container_of(cb, struct dma_fence_user_fence, cb);
+
+	if (user_fence->map.is_iomem)
+		writeq(user_fence->seqno, user_fence->map.vaddr_iomem);
+	else
+		*(u64 *)user_fence->map.vaddr = user_fence->seqno;
+
+	dma_fence_user_fence_free(user_fence);
+}
+
+/**
+ * dma_fence_user_fence_alloc() - Allocate user fence
+ *
+ * Return: Allocated struct dma_fence_user_fence on Success, NULL on failure
+ */
+struct dma_fence_user_fence *dma_fence_user_fence_alloc(void)
+{
+	return kmalloc(sizeof(struct dma_fence_user_fence), GFP_KERNEL);
+}
+EXPORT_SYMBOL(dma_fence_user_fence_alloc);
+
+/**
+ * dma_fence_user_fence_free() - Free user fence
+ *
+ * Free user fence. Should only be called on a user fence if
+ * dma_fence_user_fence_attach is not called to cleanup original allocation from
+ * dma_fence_user_fence_alloc.
+ */
+void dma_fence_user_fence_free(struct dma_fence_user_fence *user_fence)
+{
+	kfree(user_fence);
+}
+EXPORT_SYMBOL(dma_fence_user_fence_free);
+
+/**
+ * dma_fence_user_fence_attach() - Attach user fence to dma-fence
+ *
+ * @fence: fence
+ * @user_fence user fence
+ * @map: IOSYS map to write seqno to
+ * @seqno: seqno to write to IOSYS map
+ *
+ * Attach a user fence, which is a seqno write to an IOSYS map, to a DMA fence.
+ * The caller must guarantee that the memory in the IOSYS map doesn't move
+ * before the fence signals. This is typically done by installing the DMA fence
+ * into the BO's DMA reservation bookkeeping slot from which the IOSYS was
+ * derived.
+ */
+void dma_fence_user_fence_attach(struct dma_fence *fence,
+				 struct dma_fence_user_fence *user_fence,
+				 struct iosys_map *map, u64 seqno)
+{
+	int err;
+
+	user_fence->map = *map;
+	user_fence->seqno = seqno;
+
+	err = dma_fence_add_callback(fence, &user_fence->cb, user_fence_cb);
+	if (err == -ENOENT)
+		user_fence_cb(NULL, &user_fence->cb);
+}
+EXPORT_SYMBOL(dma_fence_user_fence_attach);
diff --git a/include/linux/dma-fence-user-fence.h b/include/linux/dma-fence-user-fence.h
new file mode 100644
index 000000000000..8678129c7d56
--- /dev/null
+++ b/include/linux/dma-fence-user-fence.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef __LINUX_DMA_FENCE_USER_FENCE_H
+#define __LINUX_DMA_FENCE_USER_FENCE_H
+
+#include <linux/dma-fence.h>
+#include <linux/iosys-map.h>
+
+/** struct dma_fence_user_fence - User fence */
+struct dma_fence_user_fence {
+	/** @cb: dma-fence callback used to attach user fence to dma-fence */
+	struct dma_fence_cb cb;
+	/** @map: IOSYS map to write seqno to */
+	struct iosys_map map;
+	/** @seqno: seqno to write to IOSYS map */
+	u64 seqno;
+};
+
+struct dma_fence_user_fence *dma_fence_user_fence_alloc(void);
+
+void dma_fence_user_fence_free(struct dma_fence_user_fence *user_fence);
+
+void dma_fence_user_fence_attach(struct dma_fence *fence,
+				 struct dma_fence_user_fence *user_fence,
+				 struct iosys_map *map,
+				 u64 seqno);
+
+#endif
-- 
2.34.1

