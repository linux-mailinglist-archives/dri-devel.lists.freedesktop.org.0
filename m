Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FFE3F80F4
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 05:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C836E4C1;
	Thu, 26 Aug 2021 03:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A133B6E4B6;
 Thu, 26 Aug 2021 03:28:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="217660049"
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="217660049"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 20:28:39 -0700
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="684738521"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 20:28:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniele.ceraolospurio@intel.com>
Subject: [PATCH 02/27] drm/i915/guc: Fix outstanding G2H accounting
Date: Wed, 25 Aug 2021 20:23:02 -0700
Message-Id: <20210826032327.18078-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826032327.18078-1-matthew.brost@intel.com>
References: <20210826032327.18078-1-matthew.brost@intel.com>
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

A small race that could result in incorrect accounting of the number
of outstanding G2H. Basically prior to this patch we did not increment
the number of outstanding G2H if we encoutered a GT reset while sending
a H2G. This was incorrect as the context state had already been updated
to anticipate a G2H response thus the counter should be incremented.

Also always use helper when decrementing this value.

Fixes: f4eb1f3fe946 ("drm/i915/guc: Ensure G2H response has space in buffer")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 23 ++++++++++---------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 69faa39da178..03a86da6011e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -352,6 +352,12 @@ static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
 	xa_unlock_irqrestore(&guc->context_lookup, flags);
 }
 
+static void decr_outstanding_submission_g2h(struct intel_guc *guc)
+{
+	if (atomic_dec_and_test(&guc->outstanding_submission_g2h))
+		wake_up_all(&guc->ct.wq);
+}
+
 static int guc_submission_send_busy_loop(struct intel_guc *guc,
 					 const u32 *action,
 					 u32 len,
@@ -360,11 +366,12 @@ static int guc_submission_send_busy_loop(struct intel_guc *guc,
 {
 	int err;
 
-	err = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
-
-	if (!err && g2h_len_dw)
+	if (g2h_len_dw)
 		atomic_inc(&guc->outstanding_submission_g2h);
 
+	err = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
+	GEM_BUG_ON(g2h_len_dw && err == -EBUSY);
+
 	return err;
 }
 
@@ -616,7 +623,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
 		init_sched_state(ce);
 
 		if (pending_enable || destroyed || deregister) {
-			atomic_dec(&guc->outstanding_submission_g2h);
+			decr_outstanding_submission_g2h(guc);
 			if (deregister)
 				guc_signal_context_fence(ce);
 			if (destroyed) {
@@ -635,7 +642,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
 				intel_engine_signal_breadcrumbs(ce->engine);
 			}
 			intel_context_sched_disable_unpin(ce);
-			atomic_dec(&guc->outstanding_submission_g2h);
+			decr_outstanding_submission_g2h(guc);
 			spin_lock_irqsave(&ce->guc_state.lock, flags);
 			guc_blocked_fence_complete(ce);
 			spin_unlock_irqrestore(&ce->guc_state.lock, flags);
@@ -2583,12 +2590,6 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
 	return ce;
 }
 
-static void decr_outstanding_submission_g2h(struct intel_guc *guc)
-{
-	if (atomic_dec_and_test(&guc->outstanding_submission_g2h))
-		wake_up_all(&guc->ct.wq);
-}
-
 int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 					  const u32 *msg,
 					  u32 len)
-- 
2.32.0

