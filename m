Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1786597D038
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 05:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41CC10E791;
	Fri, 20 Sep 2024 03:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RVFnUV0M";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F8A10E77E;
 Fri, 20 Sep 2024 03:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726802409; x=1758338409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZX08GJ+B7S70HH6Udtlg1KJsdNtorenXuuQa0d4IjK4=;
 b=RVFnUV0M2j0o152v1cn7tUhEQxHCzKQnPBrSQgj1Pl7LPcLNk/jhFC04
 vrGqzmaj7V84E85KsjiyU+9EZOCqdmU6GLoFsMGCiOfiRDOKRDt6YQ1BQ
 ZJYDMSE+FZWtp2CHBu4mbTttSFs/y0iEMLBdgEC/2SBlQ4W5NoY4gl8vB
 VtWsQn1Qjq6xohCNNCrljYFSVhocw/R11hh6zYiQ4h6SrkblTQ/LTecmg
 l6hjVeAMtA+7Y2eQLLrHOYwseaNBPrrXHouY4LKWS9L+urpo10nnH09AM
 SaOziOUr2ikTbqyhKEq/cjvZ/KdCtecQiX5npzL+uMp0eKFIqRkx64hMG g==;
X-CSE-ConnectionGUID: GJjmQ0/pSQmnFrpYR9MdEg==
X-CSE-MsgGUID: fsuL/8zvRTabyjp/OjGIIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25269809"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="25269809"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 20:20:09 -0700
X-CSE-ConnectionGUID: NDf72ZJoRG+HFgsk0o1QZg==
X-CSE-MsgGUID: DJkHyfMwQ2e33GYgJSTfWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="69746197"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa007.fm.intel.com with ESMTP; 19 Sep 2024 20:20:09 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v8 10/11] drm/xe/guc: Add GuC log to devcoredump captures
Date: Thu, 19 Sep 2024 20:20:05 -0700
Message-ID: <20240920032007.629624-11-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920032007.629624-1-John.C.Harrison@Intel.com>
References: <20240920032007.629624-1-John.C.Harrison@Intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Include the GuC log in devcoredump captures because they can be useful
with debugging certain types of bug.

v2: Fix kerneldoc
v3: Drop module parameter as now using more compact ascii85 encoding
rather than hexdump (although still not compressed) (review feedback
from Matthew B). Rebase onto recent refactoring of devcoredump code.
v4: Don't move the submission snapshot inside the GuC internals
structure 'cos it really doesn't belong there.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 16 ++++++++++++----
 drivers/gpu/drm/xe/xe_devcoredump_types.h | 10 +++++++---
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 0884c49942fe..a2d816713489 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -18,8 +18,10 @@
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_guc_ct.h"
+#include "xe_guc_log.h"
 #include "xe_guc_submit.h"
 #include "xe_hw_engine.h"
+#include "xe_module.h"
 #include "xe_sched_job.h"
 #include "xe_vm.h"
 
@@ -100,8 +102,10 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
 	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
 	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
 
+	drm_puts(&p, "\n**** GuC Log ****\n");
+	xe_guc_log_snapshot_print(ss->guc.log, &p);
 	drm_puts(&p, "\n**** GuC CT ****\n");
-	xe_guc_ct_snapshot_print(ss->ct, &p);
+	xe_guc_ct_snapshot_print(ss->guc.ct, &p);
 
 	drm_puts(&p, "\n**** Contexts ****\n");
 	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
@@ -124,8 +128,11 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 {
 	int i;
 
-	xe_guc_ct_snapshot_free(ss->ct);
-	ss->ct = NULL;
+	xe_guc_log_snapshot_free(ss->guc.log);
+	ss->guc.log = NULL;
+
+	xe_guc_ct_snapshot_free(ss->guc.ct);
+	ss->guc.ct = NULL;
 
 	xe_guc_exec_queue_snapshot_free(ss->ge);
 	ss->ge = NULL;
@@ -253,7 +260,8 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	if (xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL))
 		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
 
-	ss->ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
+	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
+	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
 	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
 	ss->job = xe_sched_job_snapshot_capture(job);
 	ss->vm = xe_vm_snapshot_capture(q->vm);
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 3cc2f095fdfb..06ac75ce63dd 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -34,9 +34,13 @@ struct xe_devcoredump_snapshot {
 	/** @work: Workqueue for deferred capture outside of signaling context */
 	struct work_struct work;
 
-	/* GuC snapshots */
-	/** @ct: GuC CT snapshot */
-	struct xe_guc_ct_snapshot *ct;
+	/** @guc: GuC snapshots */
+	struct {
+		/** @guc.ct: GuC CT snapshot */
+		struct xe_guc_ct_snapshot *ct;
+		/** @guc.log: GuC log snapshot */
+		struct xe_guc_log_snapshot *log;
+	} guc;
 
 	/** @ge: GuC Submission Engine snapshot */
 	struct xe_guc_submit_exec_queue_snapshot *ge;
-- 
2.46.0

