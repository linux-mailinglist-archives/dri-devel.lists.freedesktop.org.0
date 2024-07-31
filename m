Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACF39423D3
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 02:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA8C10E5A5;
	Wed, 31 Jul 2024 00:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="heYVBTWE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5EC10E32E;
 Wed, 31 Jul 2024 00:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722385832; x=1753921832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ND0M1O/b09cO9CGWjH0eDAueXMZa8J6c/uYozl9G1ZY=;
 b=heYVBTWEnOgKTeGtPmN88abSoBK3roawDjU+33pmiwExLYJhNSFDn6qS
 dR3S66HQjhTAz/Pf0Wk2x3FJMYHGAPJco9wYq+XnfRVL7nJMtgsxV9seg
 rF0TWEs3rdtDMEsKHB6V5ncT/tg9NPDoVOyq1j47eXT3zzkYOa73/h7mD
 P0iWL75W5QAgq6xcB7rNmHh2qFxum4SVhs+cxhAL0/tgdwUfUZ2xaND7N
 8dj1J6VcbLNlJcyPxbuK4WedLcVZCRQ8L2XGh9kP/o2BXokaH9hYto+fG
 tcUekTVv40WvwdoMg+JyjKIiorX6v0p4GrTWqsS8jk7BkdmiKjVW4TULt Q==;
X-CSE-ConnectionGUID: LuQoxQuJTgu0RQCRA2EmNg==
X-CSE-MsgGUID: 3ux164IfQnuLu070zXcs4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="23156103"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23156103"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 17:30:31 -0700
X-CSE-ConnectionGUID: jsP8RgPXRo6BK5inw1iByA==
X-CSE-MsgGUID: SKrLtFNsQsqF3bG5sjq9xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="77781801"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 17:30:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: tj@kernel.org, jiangshanlai@gmail.com, christian.koenig@amd.com,
 ltuikov89@gmail.com, daniel@ffwll.ch
Subject: [PATCH v2 5/5] drm/xe: Drop GuC submit_wq pool
Date: Tue, 30 Jul 2024 17:31:19 -0700
Message-Id: <20240731003119.2422940-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240731003119.2422940-1-matthew.brost@intel.com>
References: <20240731003119.2422940-1-matthew.brost@intel.com>
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

Now that drm sched uses a single lockdep map for all submit_wq, drop the
GuC submit_wq pool hack.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 60 +-----------------------------
 drivers/gpu/drm/xe/xe_guc_types.h  |  7 ----
 2 files changed, 1 insertion(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 460808507947..882cef3a10dc 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -224,64 +224,11 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
 		 EXEC_QUEUE_STATE_BANNED));
 }
 
-#ifdef CONFIG_PROVE_LOCKING
-static int alloc_submit_wq(struct xe_guc *guc)
-{
-	int i;
-
-	for (i = 0; i < NUM_SUBMIT_WQ; ++i) {
-		guc->submission_state.submit_wq_pool[i] =
-			alloc_ordered_workqueue("submit_wq", 0);
-		if (!guc->submission_state.submit_wq_pool[i])
-			goto err_free;
-	}
-
-	return 0;
-
-err_free:
-	while (i)
-		destroy_workqueue(guc->submission_state.submit_wq_pool[--i]);
-
-	return -ENOMEM;
-}
-
-static void free_submit_wq(struct xe_guc *guc)
-{
-	int i;
-
-	for (i = 0; i < NUM_SUBMIT_WQ; ++i)
-		destroy_workqueue(guc->submission_state.submit_wq_pool[i]);
-}
-
-static struct workqueue_struct *get_submit_wq(struct xe_guc *guc)
-{
-	int idx = guc->submission_state.submit_wq_idx++ % NUM_SUBMIT_WQ;
-
-	return guc->submission_state.submit_wq_pool[idx];
-}
-#else
-static int alloc_submit_wq(struct xe_guc *guc)
-{
-	return 0;
-}
-
-static void free_submit_wq(struct xe_guc *guc)
-{
-
-}
-
-static struct workqueue_struct *get_submit_wq(struct xe_guc *guc)
-{
-	return NULL;
-}
-#endif
-
 static void guc_submit_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_guc *guc = arg;
 
 	xa_destroy(&guc->submission_state.exec_queue_lookup);
-	free_submit_wq(guc);
 }
 
 static void guc_submit_wedged_fini(struct drm_device *drm, void *arg)
@@ -337,10 +284,6 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
 	if (err)
 		return err;
 
-	err = alloc_submit_wq(guc);
-	if (err)
-		return err;
-
 	gt->exec_queue_ops = &guc_exec_queue_ops;
 
 	xa_init(&guc->submission_state.exec_queue_lookup);
@@ -1445,8 +1388,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
 		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
 	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
-			    get_submit_wq(guc),
-			    q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES, 64,
+			    NULL, q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES, 64,
 			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
 			    q->name, gt_to_xe(q->gt)->drm.dev);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 546ac6350a31..585f5c274f09 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -72,13 +72,6 @@ struct xe_guc {
 		atomic_t stopped;
 		/** @submission_state.lock: protects submission state */
 		struct mutex lock;
-#ifdef CONFIG_PROVE_LOCKING
-#define NUM_SUBMIT_WQ	256
-		/** @submission_state.submit_wq_pool: submission ordered workqueues pool */
-		struct workqueue_struct *submit_wq_pool[NUM_SUBMIT_WQ];
-		/** @submission_state.submit_wq_idx: submission ordered workqueue index */
-		int submit_wq_idx;
-#endif
 		/** @submission_state.enabled: submission is enabled */
 		bool enabled;
 	} submission_state;
-- 
2.34.1

