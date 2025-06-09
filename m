Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48795AD1C1E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 13:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF81610E126;
	Mon,  9 Jun 2025 11:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qHmj+IIc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D409710E067;
 Mon,  9 Jun 2025 11:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7Zd5F1Ae3/+QwfeQGnc24NKPdYGoktaeRALUE9N+JH8=; b=qHmj+IIcNprdm4CNH8V5CDBdce
 +uu1nfW2tfGEVmHj/0ylxJhFWS3RxYS0AAs5uzr0gmGM5DBZgNguPiHVi+HZ785tbac7hArMVGhy0
 ArDZ/rOAIrkPk8lp2H+8yN4oHFyYyN/KbnHwTVGSWCmqTbD0pCYDnCQ/SIpj6LzsnjufiPeOTeykJ
 O4QGN1ZZqdt5duc0OJ7C8KBA12CjChweBEuVbBSwNTVOTL5uLxn0BWv+Xf/SIOtAp7jyFSxPGoE64
 glqHweqAUMN4NfhxtnrQjVuGkbowMFQSTFrgrg39jdu8hwI6TQUChhs2DdNWOXAowBcDD/Q8OjpEi
 B5sIKp5Q==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uOaI5-001NxF-M6; Mon, 09 Jun 2025 13:03:45 +0200
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
Subject: [PATCH v5 1/4] dma-fence: Add safe access helpers and document the
 rules
Date: Mon,  9 Jun 2025 12:03:27 +0100
Message-ID: <20250609110330.74705-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250609110330.74705-1-tvrtko.ursulin@igalia.com>
References: <20250609110330.74705-1-tvrtko.ursulin@igalia.com>
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
the complete access to the data within a single code block guarded by the
new dma_fence_access_begin() and dma_fence_access_end() helpers.

The combination of the two ensures that whoever sees the
DMA_FENCE_FLAG_SIGNALED_BIT not set is guaranteed to have access to a
valid fence->lock and valid data potentially accessed by the fence->ops
virtual functions, until the call to dma_fence_access_end().

3. Module unload (fence->ops) disappearing is for now explicitly not
handled. That would required a more complex protection, possibly needing
SRCU instead of RCU to handle callers such as dma_fence_release() and
dma_fence_wait_timeout(), where race between
dma_fence_enable_sw_signaling, signalling, and dereference of
fence->ops->wait() would need a sleeping SRCU context.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/dma-buf/dma-fence.c      | 82 +++++++++++++++++++++++++++++++-
 include/linux/dma-fence.h        | 32 +++++++++----
 include/trace/events/dma_fence.h | 38 +++++++++++++--
 3 files changed, 138 insertions(+), 14 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 74f9e4b665e3..36604d68bdc8 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -511,12 +511,20 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 
 	dma_fence_enable_sw_signaling(fence);
 
-	trace_dma_fence_wait_start(fence);
+	if (trace_dma_fence_wait_start_enabled()) {
+		dma_fence_access_begin();
+		trace_dma_fence_wait_start(fence);
+		dma_fence_access_end();
+	}
 	if (fence->ops->wait)
 		ret = fence->ops->wait(fence, intr, timeout);
 	else
 		ret = dma_fence_default_wait(fence, intr, timeout);
-	trace_dma_fence_wait_end(fence);
+	if (trace_dma_fence_wait_end_enabled()) {
+		dma_fence_access_begin();
+		trace_dma_fence_wait_end(fence);
+		dma_fence_access_end();
+	}
 	return ret;
 }
 EXPORT_SYMBOL(dma_fence_wait_timeout);
@@ -533,6 +541,7 @@ void dma_fence_release(struct kref *kref)
 	struct dma_fence *fence =
 		container_of(kref, struct dma_fence, refcount);
 
+	dma_fence_access_begin();
 	trace_dma_fence_destroy(fence);
 
 	if (WARN(!list_empty(&fence->cb_list) &&
@@ -556,10 +565,13 @@ void dma_fence_release(struct kref *kref)
 		spin_unlock_irqrestore(fence->lock, flags);
 	}
 
+	dma_fence_access_end();
+
 	if (fence->ops->release)
 		fence->ops->release(fence);
 	else
 		dma_fence_free(fence);
+
 }
 EXPORT_SYMBOL(dma_fence_release);
 
@@ -982,11 +994,13 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
  */
 void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
 {
+	dma_fence_access_begin();
 	seq_printf(seq, "%s %s seq %llu %ssignalled\n",
 		   dma_fence_driver_name(fence),
 		   dma_fence_timeline_name(fence),
 		   fence->seqno,
 		   dma_fence_is_signaled(fence) ? "" : "un");
+	dma_fence_access_end();
 }
 EXPORT_SYMBOL(dma_fence_describe);
 
@@ -1055,3 +1069,67 @@ dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
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
+ * by the &dma_fence_access_being and &dma_fence_access_end pair.
+ */
+const char *dma_fence_driver_name(struct dma_fence *fence)
+{
+	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
+			 "dma_fence_access_begin/end() are required for safe access to returned string");
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
+ * by the &dma_fence_access_being and &dma_fence_access_end pair.
+ */
+const char *dma_fence_timeline_name(struct dma_fence *fence)
+{
+	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
+			 "dma_fence_access_begin/end() are required for safe access to returned string");
+
+	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
+		return fence->ops->get_driver_name(fence);
+	else
+		return "signaled-timeline";
+}
+EXPORT_SYMBOL(dma_fence_timeline_name);
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 10a849cb2d3f..366da956fb85 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -378,15 +378,31 @@ bool dma_fence_remove_callback(struct dma_fence *fence,
 			       struct dma_fence_cb *cb);
 void dma_fence_enable_sw_signaling(struct dma_fence *fence);
 
-static inline const char *dma_fence_driver_name(struct dma_fence *fence)
-{
-	return fence->ops->get_driver_name(fence);
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
+ * &dma_fence_access_begin and &dma_fence_access_end pair.
+ *
+ * Some dma-fence API handles this automatically, while other, as for example
+ * &dma_fence_driver_name and &dma_fence_timeline_name, leave that
+ * responsibility to the caller.
+ *
+ * To enable this scheme to work drivers MUST ensure a RCU grace period elapses
+ * between signalling the fence and freeing the said data.
+ *
+ */
+#define dma_fence_access_begin	rcu_read_lock
+#define dma_fence_access_end	rcu_read_unlock
 
-static inline const char *dma_fence_timeline_name(struct dma_fence *fence)
-{
-	return fence->ops->get_timeline_name(fence);
-}
+const char *dma_fence_driver_name(struct dma_fence *fence);
+const char *dma_fence_timeline_name(struct dma_fence *fence);
 
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

