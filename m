Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 016A26ADC4A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 11:48:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A91310E441;
	Tue,  7 Mar 2023 10:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FF410E40A;
 Tue,  7 Mar 2023 10:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678186114; x=1709722114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cVF2ra7oTnbq4fpvT5foqJGinYsgG/tHcRGOAr/1f3s=;
 b=FIORNnzMdDvdB9gXwiiH9d2RP8XYRymKxsLU+yuezKDsmDEb2jD5jISN
 nVI8/EavVSWWC4aBsbVyykeaPUstbNWeq9YM5Jb0rs0Frt5f1sAk9E5sV
 NqVPCJH92sDsSXEgx1Hys1HNEeTxqmdYaXNwk8qovLpH0W9NAgDDS0URk
 Te5p4ZP/E29VIncvfPyIl2syo3QRKq+07gv6h5RyZPUbcMwOUj0djF6dn
 N0BR5u+X8/stgeQDH0cuAc1RbYhOh+kxr5pvEmnj1C4U/VtPEQbf/LT7K
 Wj6T+x4jl/MwtHHAG5nwoDOkcZMOOnutgr30/Pw7NNGMpykKzseC88Nta Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="400643406"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="400643406"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 02:48:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="819712802"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="819712802"
Received: from tanzeelu-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.205.53])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 02:48:32 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 01/12] dma-fence: Move i915 helpers into common
Date: Tue,  7 Mar 2023 10:48:13 +0000
Message-Id: <20230307104824.231094-2-tvrtko.ursulin@linux.intel.com>
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

Unhide some i915 helpers which are used for splitting the signalled
check vs notification stages during en masse fence processing.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/dma-buf/dma-fence.c                 | 35 +++++++++++++++------
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c | 22 -------------
 include/linux/dma-fence.h                   |  4 +++
 3 files changed, 30 insertions(+), 31 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 0de0482cd36e..41da0da17eba 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -344,6 +344,30 @@ void __dma_fence_might_wait(void)
 }
 #endif
 
+void __dma_fence_signal__timestamp(struct dma_fence *fence, ktime_t timestamp)
+{
+	lockdep_assert_held(fence->lock);
+
+	fence->timestamp = timestamp;
+	set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
+	trace_dma_fence_signaled(fence);
+}
+EXPORT_SYMBOL(__dma_fence_signal__timestamp);
+
+void
+__dma_fence_signal__notify(struct dma_fence *fence,
+			   const struct list_head *list)
+{
+	struct dma_fence_cb *cur, *tmp;
+
+	lockdep_assert_held(fence->lock);
+
+	list_for_each_entry_safe(cur, tmp, list, node) {
+		INIT_LIST_HEAD(&cur->node);
+		cur->func(fence, cur);
+	}
+}
+EXPORT_SYMBOL(__dma_fence_signal__notify);
 
 /**
  * dma_fence_signal_timestamp_locked - signal completion of a fence
@@ -366,7 +390,6 @@ void __dma_fence_might_wait(void)
 int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 				      ktime_t timestamp)
 {
-	struct dma_fence_cb *cur, *tmp;
 	struct list_head cb_list;
 
 	lockdep_assert_held(fence->lock);
@@ -378,14 +401,8 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 	/* Stash the cb_list before replacing it with the timestamp */
 	list_replace(&fence->cb_list, &cb_list);
 
-	fence->timestamp = timestamp;
-	set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
-	trace_dma_fence_signaled(fence);
-
-	list_for_each_entry_safe(cur, tmp, &cb_list, node) {
-		INIT_LIST_HEAD(&cur->node);
-		cur->func(fence, cur);
-	}
+	__dma_fence_signal__timestamp(fence, timestamp);
+	__dma_fence_signal__notify(fence, &cb_list);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
index ecc990ec1b95..26b6b777c479 100644
--- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
+++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
@@ -127,28 +127,6 @@ __dma_fence_signal(struct dma_fence *fence)
 	return !test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
 }
 
-static void
-__dma_fence_signal__timestamp(struct dma_fence *fence, ktime_t timestamp)
-{
-	fence->timestamp = timestamp;
-	set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
-	trace_dma_fence_signaled(fence);
-}
-
-static void
-__dma_fence_signal__notify(struct dma_fence *fence,
-			   const struct list_head *list)
-{
-	struct dma_fence_cb *cur, *tmp;
-
-	lockdep_assert_held(fence->lock);
-
-	list_for_each_entry_safe(cur, tmp, list, node) {
-		INIT_LIST_HEAD(&cur->node);
-		cur->func(fence, cur);
-	}
-}
-
 static void add_retire(struct intel_breadcrumbs *b, struct intel_timeline *tl)
 {
 	if (b->irq_engine)
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 775cdc0b4f24..2af328a89468 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -367,6 +367,10 @@ static inline void dma_fence_end_signalling(bool cookie) {}
 static inline void __dma_fence_might_wait(void) {}
 #endif
 
+void __dma_fence_signal__timestamp(struct dma_fence *fence, ktime_t timestamp);
+void __dma_fence_signal__notify(struct dma_fence *fence,
+				const struct list_head *list);
+
 int dma_fence_signal(struct dma_fence *fence);
 int dma_fence_signal_locked(struct dma_fence *fence);
 int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
-- 
2.37.2

