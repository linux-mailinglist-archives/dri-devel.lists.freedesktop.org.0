Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 982BC40A5D4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 07:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A9B6E405;
	Tue, 14 Sep 2021 05:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624276E3F7;
 Tue, 14 Sep 2021 05:15:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="208976891"
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="208976891"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 22:15:00 -0700
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="697404488"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 22:14:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniele.ceraolospurio@intel.com>,
	<john.c.harrison@intel.com>
Subject: [PATCH 4/4] drm/i915/guc: Refcount context during error capture
Date: Mon, 13 Sep 2021 22:09:56 -0700
Message-Id: <20210914050956.30685-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210914050956.30685-1-matthew.brost@intel.com>
References: <20210914050956.30685-1-matthew.brost@intel.com>
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

From: John Harrison <John.C.Harrison@Intel.com>

When i915 receives a context reset notification from GuC, it triggers
an error capture before resetting any outstanding requsts of that
context. Unfortunately, the error capture is not a time bound
operation. In certain situations it can take a long time, particularly
when multiple large LMEM buffers must be read back and eoncoded. If
this delay is longer than other timeouts (heartbeat, test recovery,
etc.) then a full GT reset can be triggered in the middle.

That can result in the context being reset by GuC actually being
destroyed before the error capture completes and the GuC submission
code resumes. Thus, the GuC side can start dereferencing stale
pointers and Bad Things ensue.

So add a refcount get of the context during the entire reset
operation. That way, the context can't be destroyed part way through
no matter what other resets or user interactions occur.

v2:
 (Matthew Brost)
  - Update patch to work with async error capture

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 1986a57b52cc..02917fc4d4a8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2888,6 +2888,8 @@ static void capture_worker_func(struct work_struct *w)
 	intel_engine_set_hung_context(engine, ce);
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
 		i915_capture_error_state(gt, ce->engine->mask);
+
+	intel_context_put(ce);
 }
 
 static void capture_error_state(struct intel_guc *guc,
@@ -2924,7 +2926,7 @@ static void guc_context_replay(struct intel_context *ce)
 	tasklet_hi_schedule(&sched_engine->tasklet);
 }
 
-static void guc_handle_context_reset(struct intel_guc *guc,
+static bool guc_handle_context_reset(struct intel_guc *guc,
 				     struct intel_context *ce)
 {
 	trace_intel_context_reset(ce);
@@ -2937,7 +2939,11 @@ static void guc_handle_context_reset(struct intel_guc *guc,
 		   !context_blocked(ce))) {
 		capture_error_state(guc, ce);
 		guc_context_replay(ce);
+
+		return false;
 	}
+
+	return true;
 }
 
 int intel_guc_context_reset_process_msg(struct intel_guc *guc,
@@ -2945,6 +2951,7 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
 {
 	struct intel_context *ce;
 	int desc_idx;
+	unsigned long flags;
 
 	if (unlikely(len != 1)) {
 		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
@@ -2952,11 +2959,24 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
 	}
 
 	desc_idx = msg[0];
+
+	/*
+	 * The context lookup uses the xarray but lookups only require an RCU lock
+	 * not the full spinlock. So take the lock explicitly and keep it until the
+	 * context has been reference count locked to ensure it can't be destroyed
+	 * asynchronously until the reset is done.
+	 */
+	xa_lock_irqsave(&guc->context_lookup, flags);
 	ce = g2h_context_lookup(guc, desc_idx);
+	if (ce)
+		intel_context_get(ce);
+	xa_unlock_irqrestore(&guc->context_lookup, flags);
+
 	if (unlikely(!ce))
 		return -EPROTO;
 
-	guc_handle_context_reset(guc, ce);
+	if (guc_handle_context_reset(guc, ce))
+		intel_context_put(ce);
 
 	return 0;
 }
-- 
2.32.0

