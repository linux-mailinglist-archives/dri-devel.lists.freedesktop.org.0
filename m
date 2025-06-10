Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE782AD3F45
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 18:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9E110E5A8;
	Tue, 10 Jun 2025 16:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mrQaeM13";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF80610E5A5;
 Tue, 10 Jun 2025 16:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m+vrMcejk3eCa66Dd+YJW3rhGo2ghe8nIMxm681Ihug=; b=mrQaeM13SVgAWnUAZV4NgiT2EA
 BqlrpF4KBpdo0OBnqc7BE/FN1hisnFBa5RQHhe1ubwXp432+SuqFQvuX2UZ0BZnfCoZeZiyUZdDhX
 hJyeOBneziq6GBt59RQkN0PipIHpJrWYOHMA6SUMwgrGvDNwW7O39zNSUm6SubQZzCzI/ad2+V3ic
 Qbjpx/zuRKpl8OYWtW6pzbE+LO1slqkmHbsKujmiqvqEVuoAhAOnNbxVoHedkX0wDgsyQlTWmtbPb
 do9BIEhfQm37d5LKQpc2NPNmVDlSBCYtiIsK+ls6xEyTVmNF8g29zK1/T/YtE3Y7OJLMZbDE15aJ/
 XZmSbTOQ==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uP23X-001t9m-T6; Tue, 10 Jun 2025 18:42:36 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v6 3/4] dma-fence: Add safe access helpers and document the
 rules
Date: Tue, 10 Jun 2025 17:42:25 +0100
Message-ID: <20250610164226.10817-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250610164226.10817-1-tvrtko.ursulin@igalia.com>
References: <20250610164226.10817-1-tvrtko.ursulin@igalia.com>
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

Dma-fence objects currently suffer from a potential use after free problem
where fences exported to userspace and other drivers can outlive the
exporting driver, or the associated data structures.

The discussion on how to address this concluded that adding reference
counting to all the involved objects is not desirable, since it would need
to be very wide reaching and could cause unloadable drivers if another
entity would be holding onto a signaled fence reference potentially
indefinitely.

This patch enables the safe access by introducing and documenting a
contract between fence exporters and users. It documents a set of
contraints and adds helpers which a) drivers with potential to suffer from
the use after free must use and b) users of the dma-fence API must use as
well.

Premise of the design has multiple sides:

1. Drivers (fence exporters) MUST ensure a RCU grace period between
signalling a fence and freeing the driver private data associated with it.

The grace period does not have to follow the signalling immediately but
HAS to happen before data is freed.

2. Users of the dma-fence API marked with such requirement MUST contain
the complete access to the data within a single code block guarded by
rcu_read_lock() and rcu_read_unlock().

The combination of the two ensures that whoever sees the
DMA_FENCE_FLAG_SIGNALED_BIT not set is guaranteed to have access to a
valid fence->lock and valid data potentially accessed by the fence->ops
virtual functions, until the call to rcu_read_unlock().

3. Module unload (fence->ops) disappearing is for now explicitly not
handled. That would required a more complex protection, possibly needing
SRCU instead of RCU to handle callers such as dma_fence_release() and
dma_fence_wait_timeout(), where race between
dma_fence_enable_sw_signaling, signalling, and dereference of
fence->ops->wait() would need a sleeping SRCU context.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/dma-buf/dma-fence.c      | 111 ++++++++++++++++++++++++++++---
 include/linux/dma-fence.h        |  31 ++++++---
 include/trace/events/dma_fence.h |  38 +++++++++--
 3 files changed, 157 insertions(+), 23 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 74f9e4b665e3..3f78c56b58dc 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -511,12 +511,20 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 
 	dma_fence_enable_sw_signaling(fence);
 
-	trace_dma_fence_wait_start(fence);
+	if (trace_dma_fence_wait_start_enabled()) {
+		rcu_read_lock();
+		trace_dma_fence_wait_start(fence);
+		rcu_read_unlock();
+	}
 	if (fence->ops->wait)
 		ret = fence->ops->wait(fence, intr, timeout);
 	else
 		ret = dma_fence_default_wait(fence, intr, timeout);
-	trace_dma_fence_wait_end(fence);
+	if (trace_dma_fence_wait_end_enabled()) {
+		rcu_read_lock();
+		trace_dma_fence_wait_end(fence);
+		rcu_read_unlock();
+	}
 	return ret;
 }
 EXPORT_SYMBOL(dma_fence_wait_timeout);
@@ -533,16 +541,23 @@ void dma_fence_release(struct kref *kref)
 	struct dma_fence *fence =
 		container_of(kref, struct dma_fence, refcount);
 
+	rcu_read_lock();
 	trace_dma_fence_destroy(fence);
 
-	if (WARN(!list_empty(&fence->cb_list) &&
-		 !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags),
-		 "Fence %s:%s:%llx:%llx released with pending signals!\n",
-		 dma_fence_driver_name(fence),
-		 dma_fence_timeline_name(fence),
-		 fence->context, fence->seqno)) {
+	if (!list_empty(&fence->cb_list) &&
+	    !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
+		const char __rcu *timeline;
+		const char __rcu *driver;
 		unsigned long flags;
 
+		driver = dma_fence_driver_name(fence);
+		timeline = dma_fence_timeline_name(fence);
+
+		WARN(1,
+		     "Fence %s:%s:%llx:%llx released with pending signals!\n",
+		     rcu_dereference(driver), rcu_dereference(timeline),
+		     fence->context, fence->seqno);
+
 		/*
 		 * Failed to signal before release, likely a refcounting issue.
 		 *
@@ -556,6 +571,8 @@ void dma_fence_release(struct kref *kref)
 		spin_unlock_irqrestore(fence->lock, flags);
 	}
 
+	rcu_read_unlock();
+
 	if (fence->ops->release)
 		fence->ops->release(fence);
 	else
@@ -982,11 +999,21 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
  */
 void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
 {
+	const char __rcu *timeline;
+	const char __rcu *driver;
+
+	rcu_read_lock();
+
+	timeline = dma_fence_timeline_name(fence);
+	driver = dma_fence_driver_name(fence);
+
 	seq_printf(seq, "%s %s seq %llu %ssignalled\n",
-		   dma_fence_driver_name(fence),
-		   dma_fence_timeline_name(fence),
+		   rcu_dereference(driver),
+		   rcu_dereference(timeline),
 		   fence->seqno,
 		   dma_fence_is_signaled(fence) ? "" : "un");
+
+	rcu_read_unlock();
 }
 EXPORT_SYMBOL(dma_fence_describe);
 
@@ -1055,3 +1082,67 @@ dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
 			 BIT(DMA_FENCE_FLAG_SEQNO64_BIT));
 }
 EXPORT_SYMBOL(dma_fence_init64);
+
+/**
+ * dma_fence_driver_name - Access the driver name
+ * @fence: the fence to query
+ *
+ * Returns a driver name backing the dma-fence implementation.
+ *
+ * IMPORTANT CONSIDERATION:
+ * Dma-fence contract stipulates that access to driver provided data (data not
+ * directly embedded into the object itself), such as the &dma_fence.lock and
+ * memory potentially accessed by the &dma_fence.ops functions, is forbidden
+ * after the fence has been signalled. Drivers are allowed to free that data,
+ * and some do.
+ *
+ * To allow safe access drivers are mandated to guarantee a RCU grace period
+ * between signalling the fence and freeing said data.
+ *
+ * As such access to the driver name is only valid inside a RCU locked section.
+ * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE block guarded
+ * by the &rcu_read_lock and &rcu_read_unlock pair.
+ */
+const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
+{
+	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
+			 "RCU protection is required for safe access to returned string");
+
+	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
+		return fence->ops->get_driver_name(fence);
+	else
+		return "detached-driver";
+}
+EXPORT_SYMBOL(dma_fence_driver_name);
+
+/**
+ * dma_fence_timeline_name - Access the timeline name
+ * @fence: the fence to query
+ *
+ * Returns a timeline name provided by the dma-fence implementation.
+ *
+ * IMPORTANT CONSIDERATION:
+ * Dma-fence contract stipulates that access to driver provided data (data not
+ * directly embedded into the object itself), such as the &dma_fence.lock and
+ * memory potentially accessed by the &dma_fence.ops functions, is forbidden
+ * after the fence has been signalled. Drivers are allowed to free that data,
+ * and some do.
+ *
+ * To allow safe access drivers are mandated to guarantee a RCU grace period
+ * between signalling the fence and freeing said data.
+ *
+ * As such access to the driver name is only valid inside a RCU locked section.
+ * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE block guarded
+ * by the &rcu_read_lock and &rcu_read_unlock pair.
+ */
+const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
+{
+	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
+			 "RCU protection is required for safe access to returned string");
+
+	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
+		return fence->ops->get_driver_name(fence);
+	else
+		return "signaled-timeline";
+}
+EXPORT_SYMBOL(dma_fence_timeline_name);
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 10a849cb2d3f..64639e104110 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -378,15 +378,28 @@ bool dma_fence_remove_callback(struct dma_fence *fence,
 			       struct dma_fence_cb *cb);
 void dma_fence_enable_sw_signaling(struct dma_fence *fence);
 
-static inline const char *dma_fence_driver_name(struct dma_fence *fence)
-{
-	return fence->ops->get_driver_name(fence);
-}
-
-static inline const char *dma_fence_timeline_name(struct dma_fence *fence)
-{
-	return fence->ops->get_timeline_name(fence);
-}
+/**
+ * DOC: Safe external access to driver provided object members
+ *
+ * All data not stored directly in the dma-fence object, such as the
+ * &dma_fence.lock and memory potentially accessed by functions in the
+ * &dma_fence.ops table, MUST NOT be accessed after the fence has been signalled
+ * because after that point drivers are allowed to free it.
+ *
+ * All code accessing that data via the dma-fence API (or directly, which is
+ * discouraged), MUST make sure to contain the complete access within a
+ * &rcu_read_lock and &rcu_read_unlock pair.
+ *
+ * Some dma-fence API handles this automatically, while other, as for example
+ * &dma_fence_driver_name and &dma_fence_timeline_name, leave that
+ * responsibility to the caller.
+ *
+ * To enable this scheme to work drivers MUST ensure a RCU grace period elapses
+ * between signalling the fence and freeing the said data.
+ *
+ */
+const char __rcu *dma_fence_driver_name(struct dma_fence *fence);
+const char __rcu *dma_fence_timeline_name(struct dma_fence *fence);
 
 /**
  * dma_fence_is_signaled_locked - Return an indication if the fence
diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
index 84c83074ee81..4814a65b68dc 100644
--- a/include/trace/events/dma_fence.h
+++ b/include/trace/events/dma_fence.h
@@ -34,14 +34,44 @@ DECLARE_EVENT_CLASS(dma_fence,
 		  __entry->seqno)
 );
 
-DEFINE_EVENT(dma_fence, dma_fence_emit,
+/*
+ * Safe only for call sites which are guaranteed to not race with fence
+ * signaling,holding the fence->lock and having checked for not signaled, or the
+ * signaling path itself.
+ */
+DECLARE_EVENT_CLASS(dma_fence_unsignaled,
+
+	TP_PROTO(struct dma_fence *fence),
+
+	TP_ARGS(fence),
+
+	TP_STRUCT__entry(
+		__string(driver, fence->ops->get_driver_name(fence))
+		__string(timeline, fence->ops->get_timeline_name(fence))
+		__field(unsigned int, context)
+		__field(unsigned int, seqno)
+	),
+
+	TP_fast_assign(
+		__assign_str(driver);
+		__assign_str(timeline);
+		__entry->context = fence->context;
+		__entry->seqno = fence->seqno;
+	),
+
+	TP_printk("driver=%s timeline=%s context=%u seqno=%u",
+		  __get_str(driver), __get_str(timeline), __entry->context,
+		  __entry->seqno)
+);
+
+DEFINE_EVENT(dma_fence_unsignaled, dma_fence_emit,
 
 	TP_PROTO(struct dma_fence *fence),
 
 	TP_ARGS(fence)
 );
 
-DEFINE_EVENT(dma_fence, dma_fence_init,
+DEFINE_EVENT(dma_fence_unsignaled, dma_fence_init,
 
 	TP_PROTO(struct dma_fence *fence),
 
@@ -55,14 +85,14 @@ DEFINE_EVENT(dma_fence, dma_fence_destroy,
 	TP_ARGS(fence)
 );
 
-DEFINE_EVENT(dma_fence, dma_fence_enable_signal,
+DEFINE_EVENT(dma_fence_unsignaled, dma_fence_enable_signal,
 
 	TP_PROTO(struct dma_fence *fence),
 
 	TP_ARGS(fence)
 );
 
-DEFINE_EVENT(dma_fence, dma_fence_signaled,
+DEFINE_EVENT(dma_fence_unsignaled, dma_fence_signaled,
 
 	TP_PROTO(struct dma_fence *fence),
 
-- 
2.48.0

