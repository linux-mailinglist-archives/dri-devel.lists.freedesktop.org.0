Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A90A20B14B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 14:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54076E0E7;
	Fri, 26 Jun 2020 12:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E6D6E0E7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 12:20:59 +0000 (UTC)
IronPort-SDR: Eh+B2KCkgwnQktLjO96MKtHeECELh0g2O32Gggf7qL1CAGiTWbq+fh4mUuoAPpRToEDIPVapdJ
 rT/h0Sd0/oig==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="146794154"
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; d="scan'208";a="146794154"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2020 05:20:59 -0700
IronPort-SDR: cOHEBMQ9ilVyeOMsntKYa73bFgBHh0VPD/STlcy0W2hAx6ZUc38lUxrSEpN+LUv6RXtXUj2tkk
 XfPx0A10IBqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; d="scan'208";a="453346853"
Received: from marisaku-mobl.ger.corp.intel.com (HELO
 delly.ger.corp.intel.com) ([10.252.49.150])
 by orsmga005.jf.intel.com with ESMTP; 26 Jun 2020 05:20:58 -0700
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: document dma-fence-chain purpose/behavior
Date: Fri, 26 Jun 2020 15:21:00 +0300
Message-Id: <20200626122100.55123-1-lionel.g.landwerlin@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Trying to explain a bit how this thing works. In my opinion diagrams
are a bit easier to understand than words.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 drivers/dma-buf/dma-fence-chain.c | 37 +++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 3d123502ff12..ac90ddf37b55 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -9,6 +9,43 @@
 
 #include <linux/dma-fence-chain.h>
 
+/**
+ * DOC: DMA fence chains overview
+ *
+ * DMA fence chains, represented by &struct dma_fence_chain, are a kernel
+ * internal synchronization primitive providing a wrapping mechanism of other
+ * DMA fences in the form a single link list.
+ *
+ * One of the use case of this primitive is to implement Vulkan timeline
+ * semaphores (see VK_KHR_timeline_semaphore extension or Vulkan specification
+ * 1.2).
+ *
+ * Each DMA fence chain item wraps 2 items :
+ *
+ * - A previous DMA fence.
+ *
+ * - A DMA fence associated to the current &struct dma_fence_chain.
+ *
+ * A DMA fence chain becomes signaled when its previous fence as well as its
+ * associated fence are signaled. If a chain of dma fence chains is created,
+ * this property recurses, meaning that any dma fence chain element in the
+ * list becomes signaled only if its associated fence and all the previous
+ * fences in the chain are also signaled.
+ *
+ * A DMA fence chain's seqno is specified through dma_fence_chain_init(). This
+ * value is lower bound to the seqno of the previous fence to ensure the chain
+ * is monotically increasing.
+ *
+ * By traversing the chain's linked list, one can compute a seqno number
+ * associated with the chain such that is the highest number for which all
+ * previous fences have signaled.
+ *
+ * One can also traverse the chain's linked list to find a &struct
+ * dma_fence_chain that when signaled guarantees that all previous fences in
+ * the chain are signaled. dma_fence_chain_find_seqno() provides this
+ * functionality.
+ */
+
 static bool dma_fence_chain_enable_signaling(struct dma_fence *fence);
 
 /**
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
