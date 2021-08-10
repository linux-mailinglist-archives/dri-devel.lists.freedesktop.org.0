Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4C33DF773
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 00:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292E36E93D;
	Tue,  3 Aug 2021 22:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659EB6E8F1;
 Tue,  3 Aug 2021 22:11:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="235745916"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="235745916"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:54 -0700
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="511512723"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 25/46] drm/i915/guc: Update debugfs for GuC multi-lrc
Date: Tue,  3 Aug 2021 15:29:22 -0700
Message-Id: <20210803222943.27686-26-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210803222943.27686-1-matthew.brost@intel.com>
References: <20210803222943.27686-1-matthew.brost@intel.com>
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

Display the workqueue status in debugfs for GuC contexts that are in
parent-child relationship.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 56 +++++++++++++------
 1 file changed, 39 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 30df1c8db491..44a7582c9aed 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4527,31 +4527,53 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
 		gse_log_submission_info(guc->gse[i], p, i);
 }
 
+static inline void guc_log_context(struct drm_printer *p,
+				   struct intel_context *ce)
+{
+	drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id);
+	drm_printf(p, "\tHW Context Desc: 0x%08x\n", ce->lrc.lrca);
+	drm_printf(p, "\t\tLRC Head: Internal %u, Memory %u\n",
+		   ce->ring->head,
+		   ce->lrc_reg_state[CTX_RING_HEAD]);
+	drm_printf(p, "\t\tLRC Tail: Internal %u, Memory %u\n",
+		   ce->ring->tail,
+		   ce->lrc_reg_state[CTX_RING_TAIL]);
+	drm_printf(p, "\t\tContext Pin Count: %u\n",
+		   atomic_read(&ce->pin_count));
+	drm_printf(p, "\t\tGuC ID Ref Count: %u\n",
+		   atomic_read(&ce->guc_id_ref));
+	drm_printf(p, "\t\tNumber Requests Not Ready: %u\n",
+		   atomic_read(&ce->guc_num_rq_not_ready));
+	drm_printf(p, "\t\tSchedule State: 0x%x, 0x%x\n\n",
+		   ce->guc_state.sched_state,
+		   atomic_read(&ce->guc_sched_state_no_lock));
+}
+
 void intel_guc_submission_print_context_info(struct intel_guc *guc,
 					     struct drm_printer *p)
 {
 	struct intel_context *ce;
 	unsigned long index;
 	xa_for_each(&guc->context_lookup, index, ce) {
-		drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id);
-		drm_printf(p, "\tHW Context Desc: 0x%08x\n", ce->lrc.lrca);
-		drm_printf(p, "\t\tLRC Head: Internal %u, Memory %u\n",
-			   ce->ring->head,
-			   ce->lrc_reg_state[CTX_RING_HEAD]);
-		drm_printf(p, "\t\tLRC Tail: Internal %u, Memory %u\n",
-			   ce->ring->tail,
-			   ce->lrc_reg_state[CTX_RING_TAIL]);
-		drm_printf(p, "\t\tContext Pin Count: %u\n",
-			   atomic_read(&ce->pin_count));
-		drm_printf(p, "\t\tGuC ID Ref Count: %u\n",
-			   atomic_read(&ce->guc_id_ref));
-		drm_printf(p, "\t\tNumber Requests Not Ready: %u\n",
-			   atomic_read(&ce->guc_num_rq_not_ready));
-		drm_printf(p, "\t\tSchedule State: 0x%x, 0x%x\n\n",
-			   ce->guc_state.sched_state,
-			   atomic_read(&ce->guc_sched_state_no_lock));
+		GEM_BUG_ON(intel_context_is_child(ce));
 
+		guc_log_context(p, ce);
 		guc_log_context_priority(p, ce);
+
+		if (intel_context_is_parent(ce)) {
+			struct guc_process_desc *desc = __get_process_desc(ce);
+			struct intel_context *child;
+
+			drm_printf(p, "\t\tWQI Head: %u\n",
+				   READ_ONCE(desc->head));
+			drm_printf(p, "\t\tWQI Tail: %u\n",
+				   READ_ONCE(desc->tail));
+			drm_printf(p, "\t\tWQI Status: %u\n\n",
+				   READ_ONCE(desc->wq_status));
+
+			for_each_child(ce, child)
+				guc_log_context(p, child);
+		}
 	}
 }
 
-- 
2.28.0

