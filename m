Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FD94219C0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 00:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983336E235;
	Mon,  4 Oct 2021 22:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6C96E22B;
 Mon,  4 Oct 2021 22:11:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="248854280"
X-IronPort-AV: E=Sophos;i="5.85,347,1624345200"; d="scan'208";a="248854280"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 15:11:32 -0700
X-IronPort-AV: E=Sophos;i="5.85,347,1624345200"; d="scan'208";a="487735508"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 15:11:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <john.c.harrison@intel.com>,
	<daniele.ceraolospurio@intel.com>
Subject: [PATCH 15/26] drm/i915/guc: Update debugfs for GuC multi-lrc
Date: Mon,  4 Oct 2021 15:06:26 -0700
Message-Id: <20211004220637.14746-16-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211004220637.14746-1-matthew.brost@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
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

v2:
 (John Harrison)
  - Output number children in debugfs

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 53 ++++++++++++++-----
 1 file changed, 39 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index d661a69ef4f7..f69e984683aa 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3704,6 +3704,26 @@ static inline void guc_log_context_priority(struct drm_printer *p,
 	drm_printf(p, "\n");
 }
 
+
+static inline void guc_log_context(struct drm_printer *p,
+				   struct intel_context *ce)
+{
+	drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id.id);
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
+		   atomic_read(&ce->guc_id.ref));
+	drm_printf(p, "\t\tSchedule State: 0x%x\n\n",
+		   ce->guc_state.sched_state);
+}
+
 void intel_guc_submission_print_context_info(struct intel_guc *guc,
 					     struct drm_printer *p)
 {
@@ -3713,22 +3733,27 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
 
 	xa_lock_irqsave(&guc->context_lookup, flags);
 	xa_for_each(&guc->context_lookup, index, ce) {
-		drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id.id);
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
-			   atomic_read(&ce->guc_id.ref));
-		drm_printf(p, "\t\tSchedule State: 0x%x\n\n",
-			   ce->guc_state.sched_state);
+		GEM_BUG_ON(intel_context_is_child(ce));
 
+		guc_log_context(p, ce);
 		guc_log_context_priority(p, ce);
+
+		if (intel_context_is_parent(ce)) {
+			struct guc_process_desc *desc = __get_process_desc(ce);
+			struct intel_context *child;
+
+			drm_printf(p, "\t\tNumber children: %u\n",
+				   ce->parallel.number_children);
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
 	xa_unlock_irqrestore(&guc->context_lookup, flags);
 }
-- 
2.32.0

