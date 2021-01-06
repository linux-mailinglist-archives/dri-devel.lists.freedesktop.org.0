Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AE42ECBF1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 09:53:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829936E424;
	Thu,  7 Jan 2021 08:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 364 seconds by postgrey-1.36 at gabe;
 Wed, 06 Jan 2021 19:55:29 UTC
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFCB89D4F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 19:55:29 +0000 (UTC)
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 06 Jan 2021 11:49:24 -0800
X-QCInternal: smtphost
Received: from veeras-linux.qualcomm.com ([10.134.68.137])
 by ironmsg03-sd.qualcomm.com with ESMTP; 06 Jan 2021 11:49:24 -0800
Received: by veeras-linux.qualcomm.com (Postfix, from userid 330320)
 id 2387721B46; Wed,  6 Jan 2021 11:49:23 -0800 (PST)
From: Veera Sundaram Sankaran <veeras@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org, gustavo@padovan.org, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH RESEND v2 1/2] dma-fence: allow signaling drivers to set fence
 timestamp
Date: Wed,  6 Jan 2021 11:49:13 -0800
Message-Id: <1609962554-13872-1-git-send-email-veeras@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Thu, 07 Jan 2021 08:53:13 +0000
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
certain events based on which the fences are triggered. This allows it to
set accurate timestamp factoring out any software and IRQ latencies. Add
a timestamp variant of fence signal function, dma_fence_signal_timestamp
to allow drivers to update the precise timestamp for fences.

Changes in v2:
- Add a new fence signal variant instead of modifying fence struct

Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>
---
 drivers/dma-buf/dma-fence.c | 70 ++++++++++++++++++++++++++++++++++++++++-----
 include/linux/dma-fence.h   |  3 ++
 2 files changed, 66 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 7475e09..8887c5a 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -312,22 +312,25 @@ void __dma_fence_might_wait(void)
 
 
 /**
- * dma_fence_signal_locked - signal completion of a fence
+ * dma_fence_signal_timestamp_locked - signal completion of a fence
  * @fence: the fence to signal
+ * @timestamp: fence signal timestamp
  *
  * Signal completion for software callbacks on a fence, this will unblock
  * dma_fence_wait() calls and run all the callbacks added with
  * dma_fence_add_callback(). Can be called multiple times, but since a fence
  * can only go from the unsignaled to the signaled state and not back, it will
- * only be effective the first time.
+ * only be effective the first time. Set the timestamp provided as the fence
+ * signal timestamp.
  *
- * Unlike dma_fence_signal(), this function must be called with &dma_fence.lock
- * held.
+ * Unlike dma_fence_signal_timestamp(), this function must be called with
+ * &dma_fence.lock held.
  *
  * Returns 0 on success and a negative error value when @fence has been
  * signalled already.
  */
-int dma_fence_signal_locked(struct dma_fence *fence)
+int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
+			ktime_t timestamp)
 {
 	struct dma_fence_cb *cur, *tmp;
 	struct list_head cb_list;
@@ -341,7 +344,7 @@ int dma_fence_signal_locked(struct dma_fence *fence)
 	/* Stash the cb_list before replacing it with the timestamp */
 	list_replace(&fence->cb_list, &cb_list);
 
-	fence->timestamp = ktime_get();
+	fence->timestamp = timestamp;
 	set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
 	trace_dma_fence_signaled(fence);
 
@@ -352,6 +355,59 @@ int dma_fence_signal_locked(struct dma_fence *fence)
 
 	return 0;
 }
+EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
+
+/**
+ * dma_fence_signal_timestamp - signal completion of a fence
+ * @fence: the fence to signal
+ * @timestamp: fence signal timestamp
+ *
+ * Signal completion for software callbacks on a fence, this will unblock
+ * dma_fence_wait() calls and run all the callbacks added with
+ * dma_fence_add_callback(). Can be called multiple times, but since a fence
+ * can only go from the unsignaled to the signaled state and not back, it will
+ * only be effective the first time. Set the timestamp provided as the fence
+ * signal timestamp.
+ *
+ * Returns 0 on success and a negative error value when @fence has been
+ * signalled already.
+ */
+int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp)
+{
+	unsigned long flags;
+	int ret;
+
+	if (!fence)
+		return -EINVAL;
+
+	spin_lock_irqsave(fence->lock, flags);
+	ret = dma_fence_signal_timestamp_locked(fence, timestamp);
+	spin_unlock_irqrestore(fence->lock, flags);
+
+	return ret;
+}
+EXPORT_SYMBOL(dma_fence_signal_timestamp);
+
+/**
+ * dma_fence_signal_locked - signal completion of a fence
+ * @fence: the fence to signal
+ *
+ * Signal completion for software callbacks on a fence, this will unblock
+ * dma_fence_wait() calls and run all the callbacks added with
+ * dma_fence_add_callback(). Can be called multiple times, but since a fence
+ * can only go from the unsignaled to the signaled state and not back, it will
+ * only be effective the first time.
+ *
+ * Unlike dma_fence_signal(), this function must be called with &dma_fence.lock
+ * held.
+ *
+ * Returns 0 on success and a negative error value when @fence has been
+ * signalled already.
+ */
+int dma_fence_signal_locked(struct dma_fence *fence)
+{
+	return dma_fence_signal_timestamp_locked(fence, ktime_get());
+}
 EXPORT_SYMBOL(dma_fence_signal_locked);
 
 /**
@@ -379,7 +435,7 @@ int dma_fence_signal(struct dma_fence *fence)
 	tmp = dma_fence_begin_signalling();
 
 	spin_lock_irqsave(fence->lock, flags);
-	ret = dma_fence_signal_locked(fence);
+	ret = dma_fence_signal_timestamp_locked(fence, ktime_get());
 	spin_unlock_irqrestore(fence->lock, flags);
 
 	dma_fence_end_signalling(tmp);
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 09e23ad..9f12efa 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -372,6 +372,9 @@ static inline void __dma_fence_might_wait(void) {}
 
 int dma_fence_signal(struct dma_fence *fence);
 int dma_fence_signal_locked(struct dma_fence *fence);
+int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
+int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
+				      ktime_t timestamp);
 signed long dma_fence_default_wait(struct dma_fence *fence,
 				   bool intr, signed long timeout);
 int dma_fence_add_callback(struct dma_fence *fence,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
