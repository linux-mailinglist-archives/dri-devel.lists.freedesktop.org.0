Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AC78AFCEF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 01:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9D8113781;
	Tue, 23 Apr 2024 23:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O6qZVhBb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111FC11377A;
 Tue, 23 Apr 2024 23:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713916586; x=1745452586;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FkOi2zVfaSw9XbSlrMCfXPWMasGyyPIA+qtei/cco54=;
 b=O6qZVhBbPQAoRZkHHAi14hH8+cYUFTKA8OT0Eb4NtpBt4WnuI5Irj9Iz
 qw96x7HRcQ1m4nYLfmA1tG4RJ0vyRKGyRM7ppv0quQbnWSZmcJhDOaqBW
 N0yioIb4aLFvIuoGHQt+oB/m2hKlOK6bJvz5oQcigh8/w+qPiuiINlWZd
 Hqlg0UBZERdJJk3EXrm0RJcoCE3qqDDybdcbXXiY7uZhuTG6jl8II2e4A
 uXWg7IMKpQVdRAY8Rg+HtOirAEFPhkEsHWKtu65RezdnC0ko3Zig605Qf
 jHwD7KGIq03A3YOCfHrfJzMR+3HWZKeJOc1ZfpZ8eLxI8IP/T35eigpJK A==;
X-CSE-ConnectionGUID: L8J4WJ7oSnSeLhm2PivDKw==
X-CSE-MsgGUID: AfRdTSV0RKmcKOQfBLZevA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="27040648"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="27040648"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:56:25 -0700
X-CSE-ConnectionGUID: WnFq/9/RTpS+Brd22YKs4w==
X-CSE-MsgGUID: H8Rd3Cv9TFiVvbK2jMU5eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29170915"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:56:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: dri-devel@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 3/6] drm/xe: Add helper to accumulate exec queue runtime
Date: Tue, 23 Apr 2024 16:56:48 -0700
Message-ID: <20240423235652.1959945-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423235652.1959945-1-lucas.demarchi@intel.com>
References: <20240423235652.1959945-1-lucas.demarchi@intel.com>
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
exec queues. Currently that is done in 2 places:

	1. when the exec_queue is destroyed
	2. when the sched job is completed

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++
 drivers/gpu/drm/xe/xe_exec_queue.c   | 37 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h   |  1 +
 drivers/gpu/drm/xe/xe_sched_job.c    |  2 ++
 4 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 2e62450d86e1..33d3bf93a2f1 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -547,6 +547,15 @@ struct xe_file {
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
index 395de93579fa..b7b6256cb96a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -214,6 +214,8 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 {
 	int i;
 
+	xe_exec_queue_update_runtime(q);
+
 	for (i = 0; i < q->width; ++i)
 		xe_lrc_finish(q->lrc + i);
 	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
@@ -769,6 +771,41 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
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
+	lrc = &q->lrc[0];
+
+	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
+
+	/*
+	 * Special case the very first timestamp: we don't want the
+	 * initial delta to be a huge value
+	 */
+	if (old_ts)
+		xef->runtime[q->class] += new_ts - old_ts;
+}
+
 void xe_exec_queue_kill(struct xe_exec_queue *q)
 {
 	struct xe_exec_queue *eq = q, *next;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 02ce8d204622..45b72daa2db3 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -66,5 +66,6 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
 					       struct xe_vm *vm);
 void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
 				  struct dma_fence *fence);
+void xe_exec_queue_update_runtime(struct xe_exec_queue *q);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index cd8a2fba5438..6a081a4fa190 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -242,6 +242,8 @@ bool xe_sched_job_completed(struct xe_sched_job *job)
 {
 	struct xe_lrc *lrc = job->q->lrc;
 
+	xe_exec_queue_update_runtime(job->q);
+
 	/*
 	 * Can safely check just LRC[0] seqno as that is last seqno written when
 	 * parallel handshake is done.
-- 
2.43.0

