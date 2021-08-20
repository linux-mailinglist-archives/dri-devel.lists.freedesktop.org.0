Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E143F3706
	for <lists+dri-devel@lfdr.de>; Sat, 21 Aug 2021 00:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8446EB92;
	Fri, 20 Aug 2021 22:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDD86EB3E;
 Fri, 20 Aug 2021 22:50:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10082"; a="216580049"
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="216580049"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 15:50:02 -0700
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="513098614"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 15:50:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniel.vetter@ffwll.ch>,
	<tony.ye@intel.com>,
	<zhengguo.xu@intel.com>
Subject: [PATCH 18/27] drm/i915/guc: Update debugfs for GuC multi-lrc
Date: Fri, 20 Aug 2021 15:44:37 -0700
Message-Id: <20210820224446.30620-19-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210820224446.30620-1-matthew.brost@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
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
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 51 ++++++++++++++-----
 1 file changed, 37 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index e34e0ea9136a..07eee9a399c8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3673,6 +3673,26 @@ static void guc_log_context_priority(struct drm_printer *p,
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
@@ -3682,22 +3702,25 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
 
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

