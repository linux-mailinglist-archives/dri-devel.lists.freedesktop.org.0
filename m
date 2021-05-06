Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E992375B07
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 20:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81AC16ED16;
	Thu,  6 May 2021 18:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82136ED1B;
 Thu,  6 May 2021 18:57:13 +0000 (UTC)
IronPort-SDR: GFsWqkhVz0n0QXcQsyqHzG8srKWvpePKFB5bSC5XOV2zGjQWBY/wRxq8QiLWO6lKBEhknnlunZ
 CcXj5BNo1Ktw==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="198195453"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="198195453"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:12 -0700
IronPort-SDR: VYv8aA7v6op1DKKUTNmYQkBEHyr1mHVDLgEFgOfuQyO36O5VFAXksVZE1tXSGXqxmqlBHK4Xdy
 magef56F232g==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583533"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 56/97] drm/i915/guc: Update GuC debugfs to support new GuC
Date: Thu,  6 May 2021 12:14:10 -0700
Message-Id: <20210506191451.77768-57-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, jason.ekstrand@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update GuC debugfs to support the new GuC structures.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 22 ++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |  3 ++
 .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    | 23 +++++++-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 52 +++++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  4 ++
 drivers/gpu/drm/i915/i915_debugfs.c           |  1 +
 6 files changed, 104 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index cf701056fa14..b3194d753b13 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -1131,3 +1131,25 @@ void intel_guc_ct_event_handler(struct intel_guc_ct *ct)
 
 	ct_try_receive_message(ct);
 }
+
+void intel_guc_log_ct_info(struct intel_guc_ct *ct,
+			   struct drm_printer *p)
+{
+	if (!ct->enabled) {
+		drm_puts(p, "CT disabled\n");
+		return;
+	}
+
+	drm_printf(p, "H2G Space: %u\n",
+		   atomic_read(&ct->ctbs.send.space) * 4);
+	drm_printf(p, "Head: %u\n",
+		   ct->ctbs.send.desc->head);
+	drm_printf(p, "Tail: %u\n",
+		   ct->ctbs.send.desc->tail);
+	drm_printf(p, "G2H Space: %u\n",
+		   atomic_read(&ct->ctbs.recv.space) * 4);
+	drm_printf(p, "Head: %u\n",
+		   ct->ctbs.recv.desc->head);
+	drm_printf(p, "Tail: %u\n",
+		   ct->ctbs.recv.desc->tail);
+}
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
index ab1b79ab960b..f62eb06b32fc 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
@@ -16,6 +16,7 @@
 
 struct i915_vma;
 struct intel_guc;
+struct drm_printer;
 
 /**
  * DOC: Command Transport (CT).
@@ -106,4 +107,6 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
 		      u32 *response_buf, u32 response_buf_size, u32 flags);
 void intel_guc_ct_event_handler(struct intel_guc_ct *ct);
 
+void intel_guc_log_ct_info(struct intel_guc_ct *ct, struct drm_printer *p);
+
 #endif /* _INTEL_GUC_CT_H_ */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
index fe7cb7b29a1e..62b9ce0fafaa 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
@@ -9,6 +9,8 @@
 #include "intel_guc.h"
 #include "intel_guc_debugfs.h"
 #include "intel_guc_log_debugfs.h"
+#include "gt/uc/intel_guc_ct.h"
+#include "gt/uc/intel_guc_submission.h"
 
 static int guc_info_show(struct seq_file *m, void *data)
 {
@@ -22,16 +24,35 @@ static int guc_info_show(struct seq_file *m, void *data)
 	drm_puts(&p, "\n");
 	intel_guc_log_info(&guc->log, &p);
 
-	/* Add more as required ... */
+	if (!intel_guc_submission_is_used(guc))
+		return 0;
+
+	intel_guc_log_ct_info(&guc->ct, &p);
+	intel_guc_log_submission_info(guc, &p);
 
 	return 0;
 }
 DEFINE_GT_DEBUGFS_ATTRIBUTE(guc_info);
 
+static int guc_registered_contexts_show(struct seq_file *m, void *data)
+{
+	struct intel_guc *guc = m->private;
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	if (!intel_guc_submission_is_used(guc))
+		return -ENODEV;
+
+	intel_guc_log_context_info(guc, &p);
+
+	return 0;
+}
+DEFINE_GT_DEBUGFS_ATTRIBUTE(guc_registered_contexts);
+
 void intel_guc_debugfs_register(struct intel_guc *guc, struct dentry *root)
 {
 	static const struct debugfs_gt_file files[] = {
 		{ "guc_info", &guc_info_fops, NULL },
+		{ "guc_registered_contexts", &guc_registered_contexts_fops, NULL },
 	};
 
 	if (!intel_guc_is_supported(guc))
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 0ff7dd6d337d..c7a8968f22c5 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1607,3 +1607,55 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 
 	return 0;
 }
+
+void intel_guc_log_submission_info(struct intel_guc *guc,
+				   struct drm_printer *p)
+{
+	struct i915_sched_engine *sched_engine = guc->sched_engine;
+	struct rb_node *rb;
+	unsigned long flags;
+
+	drm_printf(p, "GuC Number Outstanding Submission G2H: %u\n",
+		   atomic_read(&guc->outstanding_submission_g2h));
+	drm_printf(p, "GuC tasklet count: %u\n\n",
+		   atomic_read(&sched_engine->tasklet.count));
+
+	spin_lock_irqsave(&sched_engine->lock, flags);
+	drm_printf(p, "Requests in GuC submit tasklet:\n");
+	for (rb = rb_first_cached(&sched_engine->queue); rb; rb = rb_next(rb)) {
+		struct i915_priolist *pl = to_priolist(rb);
+		struct i915_request *rq;
+
+		priolist_for_each_request(rq, pl)
+			drm_printf(p, "guc_id=%u, seqno=%llu\n",
+				   rq->context->guc_id,
+				   rq->fence.seqno);
+	}
+	spin_unlock_irqrestore(&sched_engine->lock, flags);
+	drm_printf(p, "\n");
+}
+
+void intel_guc_log_context_info(struct intel_guc *guc,
+				struct drm_printer *p)
+{
+	struct intel_context *ce;
+	unsigned long index;
+
+	xa_for_each(&guc->context_lookup, index, ce) {
+		drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id);
+		drm_printf(p, "\tHW Context Desc: 0x%08x\n", ce->lrc.lrca);
+		drm_printf(p, "\t\tLRC Head: Internal %u, Memory %u\n",
+			   ce->ring->head,
+			   ce->lrc_reg_state[CTX_RING_HEAD]);
+		drm_printf(p, "\t\tLRC Tail: Internal %u, Memory %u\n",
+			   ce->ring->tail,
+			   ce->lrc_reg_state[CTX_RING_TAIL]);
+		drm_printf(p, "\t\tContext Pin Count: %u\n",
+			   atomic_read(&ce->pin_count));
+		drm_printf(p, "\t\tGuC ID Ref Count: %u\n",
+			   atomic_read(&ce->guc_id_ref));
+		drm_printf(p, "\t\tSchedule State: 0x%x, 0x%x\n\n",
+			   ce->guc_state.sched_state,
+			   atomic_read(&ce->guc_sched_state_no_lock));
+	}
+}
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
index 3f7005018939..6453e2bfa151 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
@@ -10,6 +10,7 @@
 
 #include "intel_guc.h"
 
+struct drm_printer;
 struct intel_engine_cs;
 
 void intel_guc_submission_init_early(struct intel_guc *guc);
@@ -20,6 +21,9 @@ void intel_guc_submission_fini(struct intel_guc *guc);
 int intel_guc_preempt_work_create(struct intel_guc *guc);
 void intel_guc_preempt_work_destroy(struct intel_guc *guc);
 int intel_guc_submission_setup(struct intel_engine_cs *engine);
+void intel_guc_log_submission_info(struct intel_guc *guc,
+				   struct drm_printer *p);
+void intel_guc_log_context_info(struct intel_guc *guc, struct drm_printer *p);
 
 static inline bool intel_guc_submission_is_supported(struct intel_guc *guc)
 {
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index bb29838d1cd7..d540dd8029d0 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -50,6 +50,7 @@
 #include "i915_trace.h"
 #include "intel_pm.h"
 #include "intel_sideband.h"
+#include "gt/intel_lrc_reg.h"
 
 static inline struct drm_i915_private *node_to_i915(struct drm_info_node *node)
 {
-- 
2.28.0

