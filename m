Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0F9C98BE9
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 19:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3DFE10E461;
	Mon,  1 Dec 2025 18:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ye05Pace";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FC510E459;
 Mon,  1 Dec 2025 18:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764614400; x=1796150400;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zFZN+ojxe3SnHu5xRv7nITuXKofcxMGSjGBCv/sR7qQ=;
 b=Ye05Pace1I/MntZvNblBw44JmjohX09W0MmUkXRXK4oMwApJFYqUZJ7+
 q9jJ2Tzga5ztwkX2tfml36RIIspVVzmFzIChvSbHjQEnx9axTadn+27q2
 Pyy/+Pc/osqnmIIncE8U79EDnwIQ1hMUCqvZTXASzB/bxRmvMLmF/DAEQ
 Ff5ocW2rr0ZrXksbvzXB6ZLwvDq7NahM6A/UG4XYTbWhhsQIoCCDmemeu
 ZfVPifV+XRi0MDa/hJtbQaok7/yZZgA7DzkROKuk+o0vq+Pv+E8iON2/j
 sLFeYHVDM5cOP3bKok4EtBSqiTtErOKQASNXZ/kpbUGjA2xloc5c9yAFB Q==;
X-CSE-ConnectionGUID: WFg5qts0TgKIiBkLhLRulQ==
X-CSE-MsgGUID: lDWOwd6VQC2rzT3zmh1B/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="78031142"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="78031142"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 10:39:59 -0800
X-CSE-ConnectionGUID: ebNwb3muR4aO2fCUqfyHOA==
X-CSE-MsgGUID: 88WDXH2tT4i4wQbo2yD/7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194359100"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 10:39:58 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 1/9] drm/sched: Add several job helpers to avoid drivers
 touching scheduler state
Date: Mon,  1 Dec 2025 10:39:46 -0800
Message-Id: <20251201183954.852637-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251201183954.852637-1-matthew.brost@intel.com>
References: <20251201183954.852637-1-matthew.brost@intel.com>
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

Add helpers to see if scheduler is stopped and a jobs signaled state.
Expected to be used driver side on recovery and debug flows.

v4:
 - Reorder patch to first in series (Niranjana)
 - Also check parent fence for signaling (Niranjana)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c |  4 ++--
 include/drm/gpu_scheduler.h            | 32 ++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 1d4f1b822e7b..cf40c18ab433 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -344,7 +344,7 @@ drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
  */
 static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
 {
-	if (!READ_ONCE(sched->pause_submit))
+	if (!drm_sched_is_stopped(sched))
 		queue_work(sched->submit_wq, &sched->work_run_job);
 }
 
@@ -354,7 +354,7 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
  */
 static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
 {
-	if (!READ_ONCE(sched->pause_submit))
+	if (!drm_sched_is_stopped(sched))
 		queue_work(sched->submit_wq, &sched->work_free_job);
 }
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index fb88301b3c45..385bf34e76fe 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -698,4 +698,36 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				   struct drm_gpu_scheduler **sched_list,
 				   unsigned int num_sched_list);
 
+/* Inlines */
+
+/**
+ * drm_sched_is_stopped() - DRM is stopped
+ * @sched: DRM scheduler
+ *
+ * Return: True if sched is stopped, False otherwise
+ */
+static inline bool drm_sched_is_stopped(struct drm_gpu_scheduler *sched)
+{
+	return READ_ONCE(sched->pause_submit);
+}
+
+/**
+ * drm_sched_job_is_signaled() - DRM scheduler job is signaled
+ * @job: DRM scheduler job
+ *
+ * Determine if DRM scheduler job is signaled. DRM scheduler should be stopped
+ * to obtain a stable snapshot of state. Both parent fence (hardware fence) and
+ * finished fence (software fence) are check to determine signaling state.
+ *
+ * Return: True if job is signaled, False otherwise
+ */
+static inline bool drm_sched_job_is_signaled(struct drm_sched_job *job)
+{
+	struct drm_sched_fence *s_fence = job->s_fence;
+
+	WARN_ON(!drm_sched_is_stopped(job->sched));
+	return (s_fence->parent && dma_fence_is_signaled(s_fence->parent)) ||
+		dma_fence_is_signaled(&s_fence->finished);
+}
+
 #endif
-- 
2.34.1

