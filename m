Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC57A2B174F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 09:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B286E459;
	Fri, 13 Nov 2020 08:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765176E323
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 18:27:34 +0000 (UTC)
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 12 Nov 2020 10:27:33 -0800
X-QCInternal: smtphost
Received: from veeras-linux.qualcomm.com ([10.134.68.137])
 by ironmsg04-sd.qualcomm.com with ESMTP; 12 Nov 2020 10:27:33 -0800
Received: by veeras-linux.qualcomm.com (Postfix, from userid 330320)
 id 4688021A36; Thu, 12 Nov 2020 10:27:33 -0800 (PST)
From: Veera Sundaram Sankaran <veeras@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org, gustavo@padovan.org, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH RESEND 1/2] dma-fence: allow signaling drivers to set fence
 timestamp
Date: Thu, 12 Nov 2020 10:27:22 -0800
Message-Id: <1605205643-12746-1-git-send-email-veeras@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Fri, 13 Nov 2020 08:38:02 +0000
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
Cc: Veera Sundaram Sankaran <veeras@codeaurora.org>, abhinavk@codeaurora.org,
 pdhaval@codeaurora.org, sean@poorly.run
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
