Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 781295732A4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 11:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F01D98A9C;
	Wed, 13 Jul 2022 09:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD5B98A70;
 Wed, 13 Jul 2022 09:30:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 009C961CC5;
 Wed, 13 Jul 2022 09:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07134C385A2;
 Wed, 13 Jul 2022 09:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657704622;
 bh=+GgweU1Qvz3U0myu7Eg5zYjBW9WmB7ZwmFBD8Cp4cUM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Pp6vjho4VjWsQPlyPa2b6aseR9AtRNLEmExELYnroH25HjSoYFv7MB6Pq6ICIUoqR
 fMShmj+jlj1Cmm5Hje1dZFiZAZF+SoPkI3NwD3EQxO35uQtn6/OPvkobnr+vbk1hN/
 xpEnq9TlvUA+Tu98JyRO0CF39mX7fwP6Oh6BZl7FQGr6lj4fWgW17BDcaVV0xwBWaG
 yGuLX8qDZ4rJmXyHNheE04KpBGxqVyW9R7R3lJlDYSYg+AhBYTqwijPbsoMsN6gsCL
 eoMuH1odwnwp+WuzwQqQTHYPbEtOsILEyD1XVD2LxNcJWC87dQO7HhsLOB8lpY7M86
 QDPVB5eFYGouw==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBYhH-0050La-Nj;
 Wed, 13 Jul 2022 10:30:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 09/21] drm/i915/guc: Define CTB based TLB invalidation routines
Date: Wed, 13 Jul 2022 10:30:06 +0100
Message-Id: <4855438b4aea605421211d00bd281489a4a45503.1657703926.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657703926.git.mchehab@kernel.org>
References: <cover.1657703926.git.mchehab@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>, Borislav Petkov <bp@suse.de>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-kernel@vger.kernel.org,
 Bruce Chang <yu.bruce.chang@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>

Add routines to interface with GuC firmware for TLB invalidation.

Signed-off-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Cc: Bruce Chang <yu.bruce.chang@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH 00/21] at: https://lore.kernel.org/all/cover.1657703926.git.mchehab@kernel.org/

 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  | 35 +++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 90 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        | 13 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 24 ++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  6 ++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 91 ++++++++++++++++++-
 6 files changed, 253 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
index 4ef9990ed7f8..2e39d8df4c82 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
@@ -134,6 +134,10 @@ enum intel_guc_action {
 	INTEL_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
 	INTEL_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
 	INTEL_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
+	INTEL_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
+	INTEL_GUC_ACTION_PAGE_FAULT_NOTIFICATION = 0x6001,
+	INTEL_GUC_ACTION_TLB_INVALIDATION = 0x7000,
+	INTEL_GUC_ACTION_TLB_INVALIDATION_DONE = 0x7001,
 	INTEL_GUC_ACTION_STATE_CAPTURE_NOTIFICATION = 0x8002,
 	INTEL_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE = 0x8003,
 	INTEL_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED = 0x8004,
@@ -177,4 +181,35 @@ enum intel_guc_state_capture_event_status {
 
 #define INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_MASK      0x000000FF
 
+#define INTEL_GUC_TLB_INVAL_TYPE_SHIFT 0
+#define INTEL_GUC_TLB_INVAL_MODE_SHIFT 8
+/* Flush PPC or SMRO caches along with TLB invalidation request */
+#define INTEL_GUC_TLB_INVAL_FLUSH_CACHE (1 << 31)
+
+enum intel_guc_tlb_invalidation_type {
+	INTEL_GUC_TLB_INVAL_GUC = 0x3,
+};
+
+/*
+ * 0: Heavy mode of Invalidation:
+ * The pipeline of the engine(s) for which the invalidation is targeted to is
+ * blocked, and all the in-flight transactions are guaranteed to be Globally
+ * Observed before completing the TLB invalidation
+ * 1: Lite mode of Invalidation:
+ * TLBs of the targeted engine(s) are immediately invalidated.
+ * In-flight transactions are NOT guaranteed to be Globally Observed before
+ * completing TLB invalidation.
+ * Light Invalidation Mode is to be used only when
+ * it can be guaranteed (by SW) that the address translations remain invariant
+ * for the in-flight transactions across the TLB invalidation. In other words,
+ * this mode can be used when the TLB invalidation is intended to clear out the
+ * stale cached translations that are no longer in use. Light Invalidation Mode
+ * is much faster than the Heavy Invalidation Mode, as it does not wait for the
+ * in-flight transactions to be GOd.
+ */
+enum intel_guc_tlb_inval_mode {
+	INTEL_GUC_TLB_INVAL_MODE_HEAVY = 0x0,
+	INTEL_GUC_TLB_INVAL_MODE_LITE = 0x1,
+};
+
 #endif /* _ABI_GUC_ACTIONS_ABI_H */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 2706a8c65090..5c59f9b144a3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -855,6 +855,96 @@ int intel_guc_self_cfg64(struct intel_guc *guc, u16 key, u64 value)
 	return __guc_self_cfg(guc, key, 2, value);
 }
 
+static int guc_send_invalidate_tlb(struct intel_guc *guc, u32 *action, u32 size)
+{
+	struct intel_guc_tlb_wait _wq, *wq = &_wq;
+	DEFINE_WAIT_FUNC(wait, woken_wake_function);
+	int err = 0;
+	u32 seqno;
+
+	init_waitqueue_head(&_wq.wq);
+
+	if (xa_alloc_cyclic_irq(&guc->tlb_lookup, &seqno, wq,
+				xa_limit_32b, &guc->next_seqno,
+				GFP_ATOMIC | __GFP_NOWARN) < 0) {
+		/* Under severe memory pressure? Serialise TLB allocations */
+		xa_lock_irq(&guc->tlb_lookup);
+		wq = xa_load(&guc->tlb_lookup, guc->serial_slot);
+		wait_event_lock_irq(wq->wq,
+				    !READ_ONCE(wq->status),
+				    guc->tlb_lookup.xa_lock);
+		/*
+		 * Update wq->status under lock to ensure only one waiter can
+		 * issue the tlb invalidation command using the serial slot at a
+		 * time. The condition is set to false before releasing the lock
+		 * so that other caller continue to wait until woken up again.
+		 */
+		wq->status = 1;
+		xa_unlock_irq(&guc->tlb_lookup);
+
+		seqno = guc->serial_slot;
+	}
+
+	action[1] = seqno;
+
+	add_wait_queue(&wq->wq, &wait);
+
+	err = intel_guc_send_busy_loop(guc, action, size, G2H_LEN_DW_INVALIDATE_TLB, true);
+	if (err) {
+		/*
+		 * XXX: Failure of tlb invalidation is critical and would
+		 * warrant a gt reset.
+		 */
+		goto out;
+	}
+/*
+ * GuC has a timeout of 1ms for a tlb invalidation response from GAM. On a
+ * timeout GuC drops the request and has no mechanism to notify the host about
+ * the timeout. So keep a larger timeout that accounts for this individual
+ * timeout and max number of outstanding invalidation requests that can be
+ * queued in CT buffer.
+ */
+#define OUTSTANDING_GUC_TIMEOUT_PERIOD  (HZ)
+	if (!wait_woken(&wait, TASK_UNINTERRUPTIBLE,
+			OUTSTANDING_GUC_TIMEOUT_PERIOD)) {
+		/*
+		 * XXX: Failure of tlb invalidation is critical and would
+		 * warrant a gt reset.
+		 */
+		drm_err(&guc_to_gt(guc)->i915->drm,
+			 "tlb invalidation response timed out for seqno %u\n", seqno);
+		err = -ETIME;
+	}
+out:
+	remove_wait_queue(&wq->wq, &wait);
+	if (seqno != guc->serial_slot)
+		xa_erase_irq(&guc->tlb_lookup, seqno);
+
+	return err;
+}
+
+/*
+ * Guc TLB Invalidation: Invalidate the TLB's of GuC itself.
+ */
+int intel_guc_invalidate_tlb_guc(struct intel_guc *guc,
+				 enum intel_guc_tlb_inval_mode mode)
+{
+	u32 action[] = {
+		INTEL_GUC_ACTION_TLB_INVALIDATION,
+		0,
+		INTEL_GUC_TLB_INVAL_GUC << INTEL_GUC_TLB_INVAL_TYPE_SHIFT |
+			mode << INTEL_GUC_TLB_INVAL_MODE_SHIFT |
+			INTEL_GUC_TLB_INVAL_FLUSH_CACHE,
+	};
+
+	if (!INTEL_GUC_SUPPORTS_TLB_INVALIDATION(guc)) {
+		DRM_ERROR("Tlb invalidation: Operation not supported in this platform!\n");
+		return 0;
+	}
+
+	return guc_send_invalidate_tlb(guc, action, ARRAY_SIZE(action));
+}
+
 /**
  * intel_guc_load_status - dump information about GuC load status
  * @guc: the GuC
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index d0d99f178f2d..f82a121b0838 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -77,6 +77,10 @@ struct intel_guc {
 	atomic_t outstanding_submission_g2h;
 
 	/** @interrupts: pointers to GuC interrupt-managing functions. */
+	struct xarray tlb_lookup;
+	u32 serial_slot;
+	u32 next_seqno;
+
 	struct {
 		void (*reset)(struct intel_guc *guc);
 		void (*enable)(struct intel_guc *guc);
@@ -248,6 +252,11 @@ struct intel_guc {
 #endif
 };
 
+struct intel_guc_tlb_wait {
+	struct wait_queue_head wq;
+	u8 status;
+} __aligned(4);
+
 static inline struct intel_guc *log_to_guc(struct intel_guc_log *log)
 {
 	return container_of(log, struct intel_guc, log);
@@ -363,6 +372,9 @@ int intel_guc_allocate_and_map_vma(struct intel_guc *guc, u32 size,
 int intel_guc_self_cfg32(struct intel_guc *guc, u16 key, u32 value);
 int intel_guc_self_cfg64(struct intel_guc *guc, u16 key, u64 value);
 
+int intel_guc_invalidate_tlb_guc(struct intel_guc *guc,
+				 enum intel_guc_tlb_inval_mode mode);
+
 static inline bool intel_guc_is_supported(struct intel_guc *guc)
 {
 	return intel_uc_fw_is_supported(&guc->fw);
@@ -440,6 +452,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 					 const u32 *msg, u32 len);
 int intel_guc_error_capture_process_msg(struct intel_guc *guc,
 					const u32 *msg, u32 len);
+void intel_guc_tlb_invalidation_done(struct intel_guc *guc, u32 seqno);
 
 struct intel_engine_cs *
 intel_guc_lookup_engine(struct intel_guc *guc, u8 guc_class, u8 instance);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index f01325cd1b62..c1ce542b7855 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -1023,7 +1023,7 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
 	return 0;
 }
 
-static bool ct_process_incoming_requests(struct intel_guc_ct *ct)
+static bool ct_process_incoming_requests(struct intel_guc_ct *ct, struct list_head *incoming)
 {
 	unsigned long flags;
 	struct ct_incoming_msg *request;
@@ -1031,11 +1031,11 @@ static bool ct_process_incoming_requests(struct intel_guc_ct *ct)
 	int err;
 
 	spin_lock_irqsave(&ct->requests.lock, flags);
-	request = list_first_entry_or_null(&ct->requests.incoming,
+	request = list_first_entry_or_null(incoming,
 					   struct ct_incoming_msg, link);
 	if (request)
 		list_del(&request->link);
-	done = !!list_empty(&ct->requests.incoming);
+	done = !!list_empty(incoming);
 	spin_unlock_irqrestore(&ct->requests.lock, flags);
 
 	if (!request)
@@ -1058,7 +1058,7 @@ static void ct_incoming_request_worker_func(struct work_struct *w)
 	bool done;
 
 	do {
-		done = ct_process_incoming_requests(ct);
+		done = ct_process_incoming_requests(ct, &ct->requests.incoming);
 	} while (!done);
 }
 
@@ -1078,14 +1078,30 @@ static int ct_handle_event(struct intel_guc_ct *ct, struct ct_incoming_msg *requ
 	switch (action) {
 	case INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_DONE:
 	case INTEL_GUC_ACTION_DEREGISTER_CONTEXT_DONE:
+	case INTEL_GUC_ACTION_TLB_INVALIDATION_DONE:
 		g2h_release_space(ct, request->size);
 	}
+	/* Handle tlb invalidation response in interrupt context */
+	if (action == INTEL_GUC_ACTION_TLB_INVALIDATION_DONE) {
+		const u32 *payload;
+		u32 hxg_len, len;
+
+		hxg_len = request->size - GUC_CTB_MSG_MIN_LEN;
+		len = hxg_len - GUC_HXG_MSG_MIN_LEN;
+		if (unlikely(len < 1))
+			return -EPROTO;
+		payload = &hxg[GUC_HXG_MSG_MIN_LEN];
+		intel_guc_tlb_invalidation_done(ct_to_guc(ct),  payload[0]);
+		ct_free_msg(request);
+		return 0;
+	}
 
 	spin_lock_irqsave(&ct->requests.lock, flags);
 	list_add_tail(&request->link, &ct->requests.incoming);
 	spin_unlock_irqrestore(&ct->requests.lock, flags);
 
 	queue_work(system_unbound_wq, &ct->requests.worker);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index b3c9a9327f76..3edf567b3f65 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -22,6 +22,7 @@
 /* Payload length only i.e. don't include G2H header length */
 #define G2H_LEN_DW_SCHED_CONTEXT_MODE_SET	2
 #define G2H_LEN_DW_DEREGISTER_CONTEXT		1
+#define G2H_LEN_DW_INVALIDATE_TLB		1
 
 #define GUC_CONTEXT_DISABLE		0
 #define GUC_CONTEXT_ENABLE		1
@@ -431,4 +432,9 @@ enum intel_guc_recv_message {
 	INTEL_GUC_RECV_MSG_EXCEPTION = BIT(30),
 };
 
+#define INTEL_GUC_SUPPORTS_TLB_INVALIDATION(guc) \
+	((intel_guc_ct_enabled(&(guc)->ct)) && \
+	 (intel_guc_submission_is_used(guc)) && \
+	 (GRAPHICS_VER(guc_to_gt((guc))->i915) >= 12))
+
 #endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 40f726c61e95..6888ea1bc7c1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1653,11 +1653,20 @@ static void __guc_reset_context(struct intel_context *ce, intel_engine_mask_t st
 	intel_context_put(parent);
 }
 
+static void wake_up_tlb_invalidate(struct intel_guc_tlb_wait *wait)
+{
+	/* Barrier to ensure the store is observed by the woken thread */
+	smp_store_mb(wait->status, 0);
+	wake_up(&wait->wq);
+}
+
 void intel_guc_submission_reset(struct intel_guc *guc, intel_engine_mask_t stalled)
 {
+	struct intel_guc_tlb_wait *wait;
 	struct intel_context *ce;
 	unsigned long index;
 	unsigned long flags;
+	unsigned long i;
 
 	if (unlikely(!guc_submission_initialized(guc))) {
 		/* Reset called during driver load? GuC not yet initialised! */
@@ -1683,6 +1692,13 @@ void intel_guc_submission_reset(struct intel_guc *guc, intel_engine_mask_t stall
 
 	/* GuC is blown away, drop all references to contexts */
 	xa_destroy(&guc->context_lookup);
+
+	/*
+	 * The full GT reset will have cleared the TLB caches and flushed the
+	 * G2H message queue; we can release all the blocked waiters.
+	 */
+	xa_for_each(&guc->tlb_lookup, i, wait)
+		wake_up_tlb_invalidate(wait);
 }
 
 static void guc_cancel_context_requests(struct intel_context *ce)
@@ -1805,6 +1821,41 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
 static void destroyed_worker_func(struct work_struct *w);
 static void reset_fail_worker_func(struct work_struct *w);
 
+static int init_tlb_lookup(struct intel_guc *guc)
+{
+	struct intel_guc_tlb_wait *wait;
+	int err;
+
+	xa_init_flags(&guc->tlb_lookup, XA_FLAGS_ALLOC);
+
+	wait = kzalloc(sizeof(*wait), GFP_KERNEL);
+	if (!wait)
+		return -ENOMEM;
+
+	init_waitqueue_head(&wait->wq);
+	err = xa_alloc_cyclic_irq(&guc->tlb_lookup, &guc->serial_slot, wait,
+				  xa_limit_32b, &guc->next_seqno, GFP_KERNEL);
+	if (err == -ENOMEM) {
+		kfree(wait);
+		return err;
+	}
+
+	return 0;
+}
+
+static void fini_tlb_lookup(struct intel_guc *guc)
+{
+	struct intel_guc_tlb_wait *wait;
+
+	wait = xa_load(&guc->tlb_lookup, guc->serial_slot);
+	if (wait) {
+		GEM_BUG_ON(wait->status);
+		kfree(wait);
+	}
+
+	xa_destroy(&guc->tlb_lookup);
+}
+
 /*
  * Set up the memory resources to be shared with the GuC (via the GGTT)
  * at firmware loading time.
@@ -1812,20 +1863,31 @@ static void reset_fail_worker_func(struct work_struct *w);
 int intel_guc_submission_init(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
+	int ret;
 
 	if (guc->submission_initialized)
 		return 0;
 
+	ret = init_tlb_lookup(guc);
+	if (ret)
+		return ret;
+
 	guc->submission_state.guc_ids_bitmap =
 		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
-	if (!guc->submission_state.guc_ids_bitmap)
-		return -ENOMEM;
+	if (!guc->submission_state.guc_ids_bitmap) {
+		ret = -ENOMEM;
+		goto err;
+	}
 
 	guc->timestamp.ping_delay = (POLL_TIME_CLKS / gt->clock_frequency + 1) * HZ;
 	guc->timestamp.shift = gpm_timestamp_shift(gt);
 	guc->submission_initialized = true;
 
 	return 0;
+
+err:
+	fini_tlb_lookup(guc);
+	return ret;
 }
 
 void intel_guc_submission_fini(struct intel_guc *guc)
@@ -1836,6 +1898,7 @@ void intel_guc_submission_fini(struct intel_guc *guc)
 	guc_flush_destroyed_contexts(guc);
 	i915_sched_engine_put(guc->sched_engine);
 	bitmap_free(guc->submission_state.guc_ids_bitmap);
+	fini_tlb_lookup(guc);
 	guc->submission_initialized = false;
 }
 
@@ -4027,6 +4090,30 @@ g2h_context_lookup(struct intel_guc *guc, u32 ctx_id)
 	return ce;
 }
 
+static void wait_wake_outstanding_tlb_g2h(struct intel_guc *guc, u32 seqno)
+{
+	struct intel_guc_tlb_wait *wait;
+	unsigned long flags;
+
+	xa_lock_irqsave(&guc->tlb_lookup, flags);
+	wait = xa_load(&guc->tlb_lookup, seqno);
+
+	/* We received a response after the waiting task did exit with a timeout */
+	if (unlikely(!wait))
+		drm_dbg(&guc_to_gt(guc)->i915->drm,
+			"Stale tlb invalidation response with seqno %d\n", seqno);
+
+	if (wait)
+		wake_up_tlb_invalidate(wait);
+
+	xa_unlock_irqrestore(&guc->tlb_lookup, flags);
+}
+
+void intel_guc_tlb_invalidation_done(struct intel_guc *guc, u32 seqno)
+{
+	wait_wake_outstanding_tlb_g2h(guc, seqno);
+}
+
 int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 					  const u32 *msg,
 					  u32 len)
-- 
2.36.1

