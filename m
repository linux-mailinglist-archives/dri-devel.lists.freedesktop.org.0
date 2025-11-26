Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E52C8C17C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 22:47:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE7910E6F1;
	Wed, 26 Nov 2025 21:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MalEq4Fb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A2910E6F1;
 Wed, 26 Nov 2025 21:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764193674; x=1795729674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zFZN+ojxe3SnHu5xRv7nITuXKofcxMGSjGBCv/sR7qQ=;
 b=MalEq4FbQStT5M6byoURCW/TRrsEyfaG8HQU+OnXMW5C8lzzhuna/SoG
 DK4qiMTan1w+KyQ8dgwwF7sFreBK+sHtmSrrT+lnBcqV9/sylYhQDSY9n
 JvHfnh6QX6MsZ/9aDJUr4cqcNGuKm+m2tDAQaDyHi/GY3Uepji81eS9Tw
 IkvjzlbSm150NyLGR3hOQ5FrMEUr05dmHLyeXlgn9qL7iaN+OvYSYViHf
 ZrhLLFDtVxsetWy/Fas+HBs4ZOxf77ioAK/tfZGpJ4d9URh2gb5nwcugs
 Su76L/LQLteVaj6lLLGE4QJ6TMWT9Agh4pkLn2huwaWKb5IHWvl1+3mZp Q==;
X-CSE-ConnectionGUID: m0qzYIFQRMa5+vimDC/3JA==
X-CSE-MsgGUID: pDxK7/nmQHekMxVfpaAIkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="91721896"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="91721896"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 13:47:53 -0800
X-CSE-ConnectionGUID: e7oQNd+FQnCcAdmfnupmFA==
X-CSE-MsgGUID: hErWhGItS0eyV394sUDIyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="193281172"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 13:47:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 1/8] drm/sched: Add several job helpers to avoid drivers
 touching scheduler state
Date: Wed, 26 Nov 2025 13:47:41 -0800
Message-Id: <20251126214748.650107-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126214748.650107-1-matthew.brost@intel.com>
References: <20251126214748.650107-1-matthew.brost@intel.com>
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

