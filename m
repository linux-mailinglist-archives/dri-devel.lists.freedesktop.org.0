Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DE67E7617
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 01:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D32310E398;
	Fri, 10 Nov 2023 00:53:49 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE87E10E397;
 Fri, 10 Nov 2023 00:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699577624; x=1731113624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=84pDLDh6lmqngX7cXRImNXJrIJW9EiEqAA3XrlhYDPo=;
 b=XLfIT8QVDBPAIu35Kgyk0yUfPqV6nE210xWwppdERCgk7QMDuy7CD88o
 wKaW81JGf71U6k8KgsGFr7ZSo1a3Qzou9jqylKl9wsRzw5XGX0C+PgseA
 crddzjh94UlpymXVIxthfK50bWn3YQpeaLH/wFHg8fwc96w7IPHRUzAiO
 MFxNrDUbB7zJjvju6GlXHarw3SddJ1V6/4DHhPOi71xue4OaDp1MBUG+c
 obEJ8ljZo5d++P7vZ8c+BEw6TIY9fXMiSvD+NTueGr60BUoCg1XiNIfHo
 G/VPUXQ0hLPOja9csoGETnWzWgPV3Vp/uMpRi9TXFiRNZQyybDseByYWa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11654504"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="11654504"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 16:53:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="887206118"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="887206118"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga004.jf.intel.com with ESMTP; 09 Nov 2023 16:53:41 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/2] drm/i915/guc: Don't disable a context whose enable is
 still pending
Date: Thu,  9 Nov 2023 16:54:09 -0800
Message-ID: <20231110005409.304273-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231110005409.304273-1-John.C.Harrison@Intel.com>
References: <20231110005409.304273-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Various processes involve requesting GuC to disable a given context.
However context enable/disable is an asynchronous process in the GuC.
Thus, it is possible the previous enable request is still being
processed when the disable request is triggered. Having both enable
and disable in flight concurrently is illegal - GuC will return an
error and fail the second operation. The KMD side handler for the
completion message also can't cope with having both pending flags set.
So delay the disable request until it is safe to send.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 31 +++++++++++++++----
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index d399e4d238c10..8c34b0a5abf9a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3150,7 +3150,8 @@ guc_context_revoke(struct intel_context *ce, struct i915_request *rq,
 		guc_cancel_context_requests(ce);
 		intel_engine_signal_breadcrumbs(ce->engine);
 	} else if (!context_pending_disable(ce)) {
-		u16 guc_id;
+		u16 guc_id = ~0;
+		bool pending_enable = context_pending_enable(ce);
 
 		/*
 		 * We add +2 here as the schedule disable complete CTB handler
@@ -3158,7 +3159,11 @@ guc_context_revoke(struct intel_context *ce, struct i915_request *rq,
 		 */
 		atomic_add(2, &ce->pin_count);
 
-		guc_id = prep_context_pending_disable(ce);
+		if (pending_enable)
+			guc_id = ce->guc_id.id;
+		else
+			guc_id = prep_context_pending_disable(ce);
+
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
 		/*
@@ -3169,7 +3174,15 @@ guc_context_revoke(struct intel_context *ce, struct i915_request *rq,
 		with_intel_runtime_pm(runtime_pm, wakeref) {
 			__guc_context_set_preemption_timeout(guc, guc_id,
 							     preempt_timeout_ms);
-			__guc_context_sched_disable(guc, ce, guc_id);
+			if (!pending_enable)
+				__guc_context_sched_disable(guc, ce, guc_id);
+		}
+
+		if (pending_enable) {
+			/* Can't have both in flight concurrently, so try again later... */
+			mod_delayed_work(system_unbound_wq,
+					 &ce->guc_state.sched_disable_delay_work,
+					 msecs_to_jiffies(1));
 		}
 	} else {
 		if (!context_guc_id_invalid(ce))
@@ -3222,7 +3235,13 @@ static void __delay_sched_disable(struct work_struct *wrk)
 
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 
-	if (bypass_sched_disable(guc, ce)) {
+	if (context_pending_enable(ce)) {
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+		/* Can't have both in flight concurrently, so try again later... */
+		mod_delayed_work(system_unbound_wq,
+				 &ce->guc_state.sched_disable_delay_work,
+				 msecs_to_jiffies(1));
+	} else if (bypass_sched_disable(guc, ce)) {
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 		intel_context_sched_disable_unpin(ce);
 	} else {
@@ -3257,8 +3276,8 @@ static void guc_context_sched_disable(struct intel_context *ce)
 	if (bypass_sched_disable(guc, ce)) {
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 		intel_context_sched_disable_unpin(ce);
-	} else if (!intel_context_is_closed(ce) && !guc_id_pressure(guc, ce) &&
-		   delay) {
+	} else if ((!intel_context_is_closed(ce) && !guc_id_pressure(guc, ce) &&
+		    delay) || context_pending_enable(ce)) {
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 		mod_delayed_work(system_unbound_wq,
 				 &ce->guc_state.sched_disable_delay_work,
-- 
2.41.0

