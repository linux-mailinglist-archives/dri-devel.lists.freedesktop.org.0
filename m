Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455259C2EBC
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 18:29:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C9C10E358;
	Sat,  9 Nov 2024 17:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NIfcRLkO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4550510E358;
 Sat,  9 Nov 2024 17:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731173355; x=1762709355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Uz5kzDi9IAxZrVKYL/re+EaFsCe6g7nbZcl0A58Os7E=;
 b=NIfcRLkONRIDd8lWIaqVNFw0xoi8CNO5mCeejwKg+CJIxNQJEgDiMflp
 tva1/SW3tKQS5sykCiJV6N1t9ikUaT2z/WI7dQTIU03J4AaBKjXTqxDNt
 J1hsl5ziS3+MbKQ1B6p4LCH0Fjl09IuPrZ2jFU12EsX0QOCjclUgucXc9
 krJQA560Ja4tzFCDwrV43aDXPQxJq5jRmqVTqpH98K8plrpHU3dcECZpc
 ceTcaxR0O85aQ9vqUh1BaYsCbrpxNAebc3L6SQRvu6TH2sHfnO1kqLnet
 FP1Pygy5DC6tUC8vmVm1dbBnX5dWlGUJi/P1n6CKbrztTP5y5vqWyTbJS A==;
X-CSE-ConnectionGUID: cdrL2O3aT5KAiog3uVNZYQ==
X-CSE-MsgGUID: CeudMJmDQBirifiCsdBznA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41600106"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41600106"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2024 09:29:13 -0800
X-CSE-ConnectionGUID: EEViczvuQU+4QVObovza8g==
X-CSE-MsgGUID: qN0rFfPbS4mJ2iailITIfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; d="scan'208";a="86499487"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2024 09:29:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, thomas.hellstrom@linux.intel.com,
 pstanner@redhat.com, boris.brezillon@collabora.com, airlied@gmail.com,
 ltuikov89@gmail.com, dakr@kernel.org, christian.koenig@amd.com,
 mihail.atanassov@arm.com, steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 1/6] dma-resv: Add DMA_RESV_USAGE_PREEMPT
Date: Sat,  9 Nov 2024 09:29:37 -0800
Message-Id: <20241109172942.482630-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241109172942.482630-1-matthew.brost@intel.com>
References: <20241109172942.482630-1-matthew.brost@intel.com>
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

Add a new DMA reservation slot, which is the highest priority and used
exclusively for preemptive fences. The semantics of this slot require
that all other fences in other slots must be signaled before any fences
in the preemptive slot enable signaling. These semantics exist to avoid
deadlocks during user submissions when using DMA fences. These rules are
baked into dma-resv.

Cc: Dave Airlie <airlied@redhat.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/dma-buf/dma-resv.c    | 43 +++++++++++++++++++++++------------
 drivers/dma-buf/st-dma-resv.c |  2 +-
 include/linux/dma-fence.h     |  1 +
 include/linux/dma-resv.h      | 24 ++++++++++++++-----
 4 files changed, 49 insertions(+), 21 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 5f8d010516f0..7358aa466c75 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -57,9 +57,6 @@
 DEFINE_WD_CLASS(reservation_ww_class);
 EXPORT_SYMBOL(reservation_ww_class);
 
-/* Mask for the lower fence pointer bits */
-#define DMA_RESV_LIST_MASK	0x3
-
 struct dma_resv_list {
 	struct rcu_head rcu;
 	u32 num_fences, max_fences;
@@ -71,13 +68,14 @@ static void dma_resv_list_entry(struct dma_resv_list *list, unsigned int index,
 				struct dma_resv *resv, struct dma_fence **fence,
 				enum dma_resv_usage *usage)
 {
-	long tmp;
 
-	tmp = (long)rcu_dereference_check(list->table[index],
-					  resv ? dma_resv_held(resv) : true);
-	*fence = (struct dma_fence *)(tmp & ~DMA_RESV_LIST_MASK);
+	*fence = (struct dma_fence *)rcu_dereference_check(list->table[index],
+							   resv ?
+							   dma_resv_held(resv) :
+							   true);
+
 	if (usage)
-		*usage = tmp & DMA_RESV_LIST_MASK;
+		*usage = (*fence)->usage;
 }
 
 /* Set the fence and usage flags at the specific index in the list. */
@@ -86,9 +84,8 @@ static void dma_resv_list_set(struct dma_resv_list *list,
 			      struct dma_fence *fence,
 			      enum dma_resv_usage usage)
 {
-	long tmp = ((long)fence) | usage;
-
-	RCU_INIT_POINTER(list->table[index], (struct dma_fence *)tmp);
+	fence->usage = usage;
+	RCU_INIT_POINTER(list->table[index], fence);
 }
 
 /*
@@ -527,7 +524,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 
 	list = NULL;
 
-	dma_resv_iter_begin(&cursor, src, DMA_RESV_USAGE_BOOKKEEP);
+	dma_resv_iter_begin(&cursor, src, DMA_RESV_USAGE_PREEMPT);
 	dma_resv_for_each_fence_unlocked(&cursor, f) {
 
 		if (dma_resv_iter_is_restarted(&cursor)) {
@@ -680,8 +677,11 @@ long dma_resv_wait_timeout(struct dma_resv *obj, enum dma_resv_usage usage,
 	long ret = timeout ? timeout : 1;
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
+	enum dma_resv_usage walk_usage = (usage == DMA_RESV_USAGE_PREEMPT) ?
+		DMA_RESV_USAGE_BOOKKEEP : usage;
 
-	dma_resv_iter_begin(&cursor, obj, usage);
+wait_again:
+	dma_resv_iter_begin(&cursor, obj, walk_usage);
 	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 
 		ret = dma_fence_wait_timeout(fence, intr, ret);
@@ -692,6 +692,20 @@ long dma_resv_wait_timeout(struct dma_resv *obj, enum dma_resv_usage usage,
 	}
 	dma_resv_iter_end(&cursor);
 
+	/*
+	 * Now wait on preempt fences, pipeline preemption by enabling signaling
+	 * before waiting.
+	 */
+	if (walk_usage != usage) {
+		dma_resv_iter_begin(&cursor, obj, usage);
+		dma_resv_for_each_fence_unlocked(&cursor, fence)
+			dma_fence_enable_sw_signaling(fence);
+		dma_resv_iter_end(&cursor);
+
+		walk_usage = usage;
+		goto wait_again;
+	}
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
@@ -757,7 +771,8 @@ EXPORT_SYMBOL_GPL(dma_resv_test_signaled);
  */
 void dma_resv_describe(struct dma_resv *obj, struct seq_file *seq)
 {
-	static const char *usage[] = { "kernel", "write", "read", "bookkeep" };
+	static const char *usage[] = { "kernel", "write", "read", "bookkeep",
+		"preempt" };
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 
diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
index 15dbea1462ed..ddef3c99885f 100644
--- a/drivers/dma-buf/st-dma-resv.c
+++ b/drivers/dma-buf/st-dma-resv.c
@@ -306,7 +306,7 @@ int dma_resv(void)
 	int r;
 
 	spin_lock_init(&fence_lock);
-	for (usage = DMA_RESV_USAGE_KERNEL; usage <= DMA_RESV_USAGE_BOOKKEEP;
+	for (usage = DMA_RESV_USAGE_KERNEL; usage <= DMA_RESV_USAGE_PREEMPT;
 	     ++usage) {
 		r = subtests(tests, (void *)(unsigned long)usage);
 		if (r)
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index e7ad819962e3..05f3ec2adece 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -94,6 +94,7 @@ struct dma_fence {
 	unsigned long flags;
 	struct kref refcount;
 	int error;
+	u8 usage;
 };
 
 enum dma_fence_flag_bits {
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index c5ab6fd9ebe8..eb40c526d570 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -55,9 +55,10 @@ struct dma_resv_list;
  * This enum describes the different use cases for a dma_resv object and
  * controls which fences are returned when queried.
  *
- * An important fact is that there is the order KERNEL<WRITE<READ<BOOKKEEP and
- * when the dma_resv object is asked for fences for one use case the fences
- * for the lower use case are returned as well.
+ * An important fact is that there is the order
+ * KERNEL<WRITE<READ<BOOKKEEP<PREEMPT and when the dma_resv object is asked for
+ * fences for one use case the fences for the lower use case are returned as
+ * well.
  *
  * For example when asking for WRITE fences then the KERNEL fences are returned
  * as well. Similar when asked for READ fences then both WRITE and KERNEL
@@ -105,15 +106,26 @@ enum dma_resv_usage {
 	 * This should be used by submissions which don't want to participate in
 	 * any implicit synchronization.
 	 *
-	 * The most common cases are preemption fences, page table updates, TLB
-	 * flushes as well as explicitly synced user submissions.
+	 * The most common cases are page table updates, TLB flushes as well as
+	 * explicitly synced user submissions.
 	 *
 	 * Explicitly synced user submissions can be promoted to
 	 * DMA_RESV_USAGE_READ or DMA_RESV_USAGE_WRITE as needed using
 	 * dma_buf_import_sync_file() when implicit synchronization should
 	 * become necessary after initial adding of the fence.
 	 */
-	DMA_RESV_USAGE_BOOKKEEP
+	DMA_RESV_USAGE_BOOKKEEP,
+
+	/**
+	 * @DMA_RESV_USAGE_PREEMPT: Preempt.
+	 *
+	 * This kernel-owned slot is to install preempt fences. The semantics
+	 * require that enabling signaling on a preemption fence (and thus
+	 * preempting device execution) only occurs once all other fences in the
+	 * reservation are signaled. These rules are enforced by dma-resv to
+	 * ensure correct usage.
+	 */
+	DMA_RESV_USAGE_PREEMPT,
 };
 
 /**
-- 
2.34.1

