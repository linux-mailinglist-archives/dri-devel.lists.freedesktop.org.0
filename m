Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 936B08BEFE7
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 00:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA6F1126E4;
	Tue,  7 May 2024 22:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F8zopFK3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8151126E2;
 Tue,  7 May 2024 22:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715121862; x=1746657862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HN4UpKdFrjWP+LlIRY83zIvrT9haDD4Eke50bp9BWw4=;
 b=F8zopFK3G1EsEyYb3yjzudYKP/76LiZETmJTXIWrj3yir1fGkr4Z0OBy
 23YH3nWFaX2nFk9xfM4KPtQqZpvPWnLytTgbei8PtfdP9PO9+cuhu79PM
 kxuL9Gi/KODb15xHi60ASJiFkWQnpt6l65kaQICDvDsckbvMR7L3LKGhh
 VKa7mOQR0+XXLGrWWJO6hIlIpGVUva474jhNGLrHLYoY0UL5JrI7Ecezj
 q5haTDhqwDkF7QkPxBX2n4Y7xtlZZzI0+uynr5Ov4CGrk1lGR9g+9g1le
 lCdXM/ophCqTV0GJ77kf3f/YXWgok/Z5MzjDlGoPAg++FwqXYVZLUO+tH Q==;
X-CSE-ConnectionGUID: 4WH9Pzb7Sw6BLZy9srgSXQ==
X-CSE-MsgGUID: T5P/UFGeQuiDRIQcoPXIog==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11108501"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="11108501"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 15:44:20 -0700
X-CSE-ConnectionGUID: xVKCnXvfQKmcnnP5JIA4UA==
X-CSE-MsgGUID: lZFClaPKRVeuJ5sBKn5a+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="29231509"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 15:44:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 5/6] drm/xe: Add helper to accumulate exec queue runtime
Date: Tue,  7 May 2024 15:45:09 -0700
Message-ID: <20240507224510.442971-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507224510.442971-1-lucas.demarchi@intel.com>
References: <20240507224510.442971-1-lucas.demarchi@intel.com>
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++
 drivers/gpu/drm/xe/xe_exec_queue.c   | 35 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h   |  1 +
 drivers/gpu/drm/xe/xe_execlist.c     |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c   |  2 ++
 5 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 906b98fb973b..de078bdf0ab9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -560,6 +560,15 @@ struct xe_file {
 		struct mutex lock;
 	} exec_queue;
 
+	/**
+	 * @runtime: hw engine class runtime in ticks for this drm client
+	 *
+	 * Only stats from xe_exec_queue->lrc[0] are accumulated. For multi-lrc
+	 * case, since all jobs run in parallel on the engines, only the stats
+	 * from lrc[0] are sufficient.
+	 */
+	u64 runtime[XE_ENGINE_CLASS_MAX];
+
 	/** @client: drm client */
 	struct xe_drm_client *client;
 };
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 395de93579fa..86eb22e22c95 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -769,6 +769,41 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
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
+	 * width
+	 */
+	lrc = &q->lrc[0];
+
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
index dece2785933c..a316431025c7 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -307,6 +307,7 @@ static void execlist_job_free(struct drm_sched_job *drm_job)
 {
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
 
+	xe_exec_queue_update_runtime(job->q);
 	xe_sched_job_put(job);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d274a139010b..e0ebfe83dfe8 100644
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

