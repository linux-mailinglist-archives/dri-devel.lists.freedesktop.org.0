Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD671699283
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 11:59:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A766210ED3A;
	Thu, 16 Feb 2023 10:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF9810E2BE;
 Thu, 16 Feb 2023 10:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676545170; x=1708081170;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=QutN+efEVB8E3nC/YDlbdNrmmmnI/0o9j6soojqaUuk=;
 b=bJJqDo34/36xl5jE8A7bU5hfBsLIcwEn9u+03Ap4SL4JZovFTxmIdoXP
 z7zKE13KMhJWztUIBZV6MQv6M+d+1mB1Dnw0AdjNSVBwksHv3ACBJ3tyw
 eMlgsJxpbjqoXbNPVilulcvRO2H1kF0BKt7vcOgaFad6KgJPy2Gx2JbI5
 4mUVSEKG2oeS+BnFKlQ/cRud75+f9ZJt7JWReY0Tr3rdpa8NZzx4nU9Tx
 xnNma3wYnpJPy9xMbbOPbSlGnv9x9fbRL7mqpK2LngQ5RqVYXQbSbVmuw
 7vfhmSZqefySHERHXBHTBLsMXTKG+tlX30r+s56UnUTxhjUUbdO1kByRa w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="311317599"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="311317599"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 02:59:30 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="812917909"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="812917909"
Received: from murrayal-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.229.164])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 02:59:29 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 2/9] dma-fence: Add callback initialization helper
Date: Thu, 16 Feb 2023 10:59:14 +0000
Message-Id: <20230216105921.624960-3-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216105921.624960-1-tvrtko.ursulin@linux.intel.com>
References: <20230216105921.624960-1-tvrtko.ursulin@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

In preparation of adding a new field to struct dma_fence_cb we will need
an initialization helper for those callers who add callbacks by open-
coding. That will ensure they initialize all the fields so common code
does not get confused by potential garbage in some fields.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/dma-buf/dma-fence.c | 10 ++++------
 include/linux/dma-fence.h   |  7 +++++++
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 41da0da17eba..ea4a1f82c9bf 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -662,21 +662,19 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
 	unsigned long flags;
 	int ret = 0;
 
+	__dma_fence_cb_init(cb, func);
+
 	if (WARN_ON(!fence || !func))
 		return -EINVAL;
 
-	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
-		INIT_LIST_HEAD(&cb->node);
+	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 		return -ENOENT;
-	}
 
 	spin_lock_irqsave(fence->lock, flags);
 
 	if (__dma_fence_enable_signaling(fence)) {
-		cb->func = func;
 		list_add_tail(&cb->node, &fence->cb_list);
 	} else {
-		INIT_LIST_HEAD(&cb->node);
 		ret = -ENOENT;
 	}
 
@@ -795,7 +793,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 		goto out;
 	}
 
-	cb.base.func = dma_fence_default_wait_cb;
+	__dma_fence_cb_init(&cb.base, dma_fence_default_wait_cb);
 	cb.task = current;
 	list_add(&cb.base.node, &fence->cb_list);
 
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 2af328a89468..35933e0ae62c 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -629,4 +629,11 @@ static inline bool dma_fence_is_container(struct dma_fence *fence)
 	return dma_fence_is_array(fence) || dma_fence_is_chain(fence);
 }
 
+static inline void __dma_fence_cb_init(struct dma_fence_cb *cb,
+				       dma_fence_func_t func)
+{
+	INIT_LIST_HEAD(&cb->node);
+	cb->func = func;
+}
+
 #endif /* __LINUX_DMA_FENCE_H */
-- 
2.34.1

