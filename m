Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D54298C6DDC
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 23:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8EB10E3CA;
	Wed, 15 May 2024 21:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B48Jl9lx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0509610E267;
 Wed, 15 May 2024 21:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715809380; x=1747345380;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=II4IT1+MpR8Glvw/FHTDM6nfFh7W8K8VNJfz9XaJt2Q=;
 b=B48Jl9lxl5y1vw+YuO6cfBQW6DAlc2vN/ry3ymij7D3HIzCaG80bM3kN
 ftfU+K8/HjL5ZeNDEAIHiYxe084sOJi/8s3dBzs8tj5GFAhyVQxWD9Jve
 s5CY173J2Gl8o9PtGoMdEEOH52sSJA66TlPhWBplltwXeg7g4YaXFot58
 mhNzON1TFpTDyE4/YHo6Gw9VeLvFqf0K2M6wXlJIXnW920njE4E6j5/O2
 a2da5oMXfiROvh4oEvi293qMMZ4HYYIWSbZuf/u5dctCNccz1/upbHk6E
 cUKmTxV1RwHnvQiYMbfmorKp7EQCe1Co4KBwl4AaqMirjRWvizXm9srXY w==;
X-CSE-ConnectionGUID: zka37fQ4R4ezbFXzg3Ih7g==
X-CSE-MsgGUID: Z41JTPS6QVWS7VNfSZBn+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11739168"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="11739168"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 14:43:00 -0700
X-CSE-ConnectionGUID: vqtSIWB+Q8uv8OvsUAVqNQ==
X-CSE-MsgGUID: PNpb1aPlRpuenRqvyQLTiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="35651138"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 14:42:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 5/8] drm/xe: Add helper to accumulate exec queue runtime
Date: Wed, 15 May 2024 14:42:55 -0700
Message-ID: <20240515214258.59209-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240515214258.59209-1-lucas.demarchi@intel.com>
References: <20240515214258.59209-1-lucas.demarchi@intel.com>
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

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Add a helper to accumulate per-client runtime of all its
exec queues. This is called every time a sched job is finished.

v2:
  - Use guc_exec_queue_free_job() and execlist_job_free() to accumulate
    runtime when job is finished since xe_sched_job_completed() is not a
    notification that job finished.
  - Stop trying to update runtime from xe_exec_queue_fini() - that is
    redundant and may happen after xef is closed, leading to a
    use-after-free
  - Do not special case the first timestamp read: the default LRC sets
    CTX_TIMESTAMP to zero, so even the first sample should be a valid
    one.
  - Handle the parallel submission case by multiplying the runtime by
    width.
v3: Update comments

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_exec_queue.c   | 37 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h   |  1 +
 drivers/gpu/drm/xe/xe_execlist.c     |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c   |  2 ++
 5 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 5c5e36de452a..bc97990fd032 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -555,6 +555,9 @@ struct xe_file {
 		struct mutex lock;
 	} exec_queue;
 
+	/** @runtime: hw engine class runtime in ticks for this drm client */
+	u64 runtime[XE_ENGINE_CLASS_MAX];
+
 	/** @client: drm client */
 	struct xe_drm_client *client;
 };
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 395de93579fa..fa6dc996eca8 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -769,6 +769,43 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
 		q->lrc[0].fence_ctx.next_seqno - 1;
 }
 
+/**
+ * xe_exec_queue_update_runtime() - Update runtime for this exec queue from hw
+ * @q: The exec queue
+ *
+ * Update the timestamp saved by HW for this exec queue and save runtime
+ * calculated by using the delta from last update. On multi-lrc case, only the
+ * first is considered.
+ */
+void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
+{
+	struct xe_file *xef;
+	struct xe_lrc *lrc;
+	u32 old_ts, new_ts;
+
+	/*
+	 * Jobs that are run during driver load may use an exec_queue, but are
+	 * not associated with a user xe file, so avoid accumulating busyness
+	 * for kernel specific work.
+	 */
+	if (!q->vm || !q->vm->xef)
+		return;
+
+	xef = q->vm->xef;
+
+	/*
+	 * Only sample the first LRC. For parallel submission, all of them are
+	 * scheduled together and we compensate that below by multiplying by
+	 * width - this may introduce errors if that premise is not true and
+	 * they don't exit 100% aligned. On the other hand, looping through
+	 * the LRCs and reading them in different time could also introduce
+	 * errors.
+	 */
+	lrc = &q->lrc[0];
+	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
+	xef->runtime[q->class] += (new_ts - old_ts) * q->width;
+}
+
 void xe_exec_queue_kill(struct xe_exec_queue *q)
 {
 	struct xe_exec_queue *eq = q, *next;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 48f6da53a292..e0f07d28ee1a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -75,5 +75,6 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
 					       struct xe_vm *vm);
 void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
 				  struct dma_fence *fence);
+void xe_exec_queue_update_runtime(struct xe_exec_queue *q);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index e9dee1e14fef..bd7f27efe0e0 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -306,6 +306,7 @@ static void execlist_job_free(struct drm_sched_job *drm_job)
 {
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
 
+	xe_exec_queue_update_runtime(job->q);
 	xe_sched_job_put(job);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4efb88e3e056..ad2b8067d071 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -749,6 +749,8 @@ static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
 {
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
 
+	xe_exec_queue_update_runtime(job->q);
+
 	trace_xe_sched_job_free(job);
 	xe_sched_job_put(job);
 }
-- 
2.43.0

