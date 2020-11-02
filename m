Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE69A2A3E6D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:14:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F5C6EBA6;
	Tue,  3 Nov 2020 08:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 364 seconds by postgrey-1.36 at gabe;
 Mon, 02 Nov 2020 19:01:03 UTC
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A737A6E50C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 19:01:03 +0000 (UTC)
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 02 Nov 2020 10:54:58 -0800
X-QCInternal: smtphost
Received: from veeras-linux.qualcomm.com ([10.134.68.137])
 by ironmsg01-sd.qualcomm.com with ESMTP; 02 Nov 2020 10:54:58 -0800
Received: by veeras-linux.qualcomm.com (Postfix, from userid 330320)
 id 3A2A22192E; Mon,  2 Nov 2020 10:54:58 -0800 (PST)
From: Veera Sundaram Sankaran <veeras@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org, gustavo@padovan.org
Subject: [PATCH 1/2] dma-fence: allow signaling drivers to set fence timestamp
Date: Mon,  2 Nov 2020 10:54:45 -0800
Message-Id: <1604343286-3262-1-git-send-email-veeras@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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
Cc: pdhaval@codeaurora.org, Veera Sundaram Sankaran <veeras@codeaurora.org>,
 abhinavk@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some drivers have hardware capability to get the precise timestamp of
certain events based on which the fences are triggered. This allows it
to set accurate timestamp factoring out any software and IRQ latencies.
Move the timestamp parameter out of union in dma_fence struct to allow
signaling drivers to set it. If the parameter is not set, ktime_get is
used to set the current time to fence timestamp during dma_fence_signal.

Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>
---
 drivers/dma-buf/dma-fence.c | 18 ++++++++++--------
 include/linux/dma-fence.h   | 15 +++------------
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 43624b4..7cef49a 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2012 Canonical Ltd
  * Copyright (C) 2012 Texas Instruments
+ * Copyright (c) 2020 The Linux Foundation. All rights reserved.
  *
  * Authors:
  * Rob Clark <robdclark@gmail.com>
@@ -329,7 +330,6 @@ void __dma_fence_might_wait(void)
 int dma_fence_signal_locked(struct dma_fence *fence)
 {
 	struct dma_fence_cb *cur, *tmp;
-	struct list_head cb_list;
 
 	lockdep_assert_held(fence->lock);
 
@@ -337,16 +337,18 @@ int dma_fence_signal_locked(struct dma_fence *fence)
 				      &fence->flags)))
 		return -EINVAL;
 
-	/* Stash the cb_list before replacing it with the timestamp */
-	list_replace(&fence->cb_list, &cb_list);
-
-	fence->timestamp = ktime_get();
+	/* set current time, if not set by signaling driver */
+	if (!fence->timestamp)
+		fence->timestamp = ktime_get();
 	set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
 	trace_dma_fence_signaled(fence);
 
-	list_for_each_entry_safe(cur, tmp, &cb_list, node) {
-		INIT_LIST_HEAD(&cur->node);
-		cur->func(fence, cur);
+	if (!list_empty(&fence->cb_list)) {
+		list_for_each_entry_safe(cur, tmp, &fence->cb_list, node) {
+			INIT_LIST_HEAD(&cur->node);
+			cur->func(fence, cur);
+		}
+		INIT_LIST_HEAD(&fence->cb_list);
 	}
 
 	return 0;
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 09e23ad..a9eebaf 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2012 Canonical Ltd
  * Copyright (C) 2012 Texas Instruments
+ * Copyright (c) 2020 The Linux Foundation. All rights reserved.
  *
  * Authors:
  * Rob Clark <robdclark@gmail.com>
@@ -70,26 +71,16 @@ struct dma_fence {
 	 * release the fence it is unused. No one should be adding to the
 	 * cb_list that they don't themselves hold a reference for.
 	 *
-	 * The lifetime of the timestamp is similarly tied to both the
-	 * rcu freelist and the cb_list. The timestamp is only set upon
-	 * signaling while simultaneously notifying the cb_list. Ergo, we
-	 * only use either the cb_list of timestamp. Upon destruction,
-	 * neither are accessible, and so we can use the rcu. This means
-	 * that the cb_list is *only* valid until the signal bit is set,
-	 * and to read either you *must* hold a reference to the fence,
-	 * and not just the rcu_read_lock.
-	 *
 	 * Listed in chronological order.
 	 */
 	union {
 		struct list_head cb_list;
-		/* @cb_list replaced by @timestamp on dma_fence_signal() */
-		ktime_t timestamp;
-		/* @timestamp replaced by @rcu on dma_fence_release() */
+		/* @cb_list replaced by @rcu on dma_fence_release() */
 		struct rcu_head rcu;
 	};
 	u64 context;
 	u64 seqno;
+	ktime_t timestamp;
 	unsigned long flags;
 	struct kref refcount;
 	int error;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
