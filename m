Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F3A6ADC4E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 11:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC6610E46A;
	Tue,  7 Mar 2023 10:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A9210E433;
 Tue,  7 Mar 2023 10:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678186116; x=1709722116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VAdPNmhggk8AJ/HP2lLLsL16Brg57NuNdC29Ei5z0is=;
 b=JSCsM7qYRW240ZzhnqqfOehWvno541IiTt2fvsa5EEII5AqATALb3hlS
 6yYFVQnUrwGVawRSskena34s4vKZsjCIOr8CZRMx1eaYmKvkWX3cLGFsD
 kwXBleiQ/c1YU0pngJeMr75jCKCUwJPKhcWEvbaUK1nqQmdvQCOgOh/UJ
 Z3vQFHM8csSXTiZuVVllCXllDiaD7G5slDmHhMRkbIMFGV1duwbst7/We
 yyghbtyODaOz/kqrprIKWBSMS7bsa2x1odqkqyXSN+RIi28OJfWNmGcHu
 F82gnKxe0GyYArp/1+44zwIaQ7FawJoMvn1r/rG/KxP2nn1IExv9K09Is A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="400643410"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="400643410"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 02:48:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="819712811"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="819712811"
Received: from tanzeelu-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.205.53])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 02:48:34 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 02/12] dma-fence: Add callback initialization helper
Date: Tue,  7 Mar 2023 10:48:14 +0000
Message-Id: <20230307104824.231094-3-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230307104824.231094-1-tvrtko.ursulin@linux.intel.com>
References: <20230307104824.231094-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Matt Turner <mattst88@gmail.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
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
2.37.2

