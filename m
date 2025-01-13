Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A706EA0B4A4
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 11:33:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8B910E64B;
	Mon, 13 Jan 2025 10:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="KxIyR8gu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F4E10E656
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 10:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XhUJZOeDUg8YhuinAnB7Z0Vz7EuI4R80OgZw5y1Mvok=; b=KxIyR8guo7EQ1YpFKwPoDEETod
 9X3uSURC6PF3yfCTNPuS+kLZxnKGGiEkMNqDUlGomlm2pXlkYNvEWwACcBU3C4fQPfWWwntiU69IR
 Vt/8EqiAvr7txEuj+7DMUteGPzH/f1QjgmbLs16q8N30gik1OyN0Hs6DMcJcoEhAihI44gUXWBPwJ
 NV76c31zMWVvENGIJklsLPDwWz0TIQxDfI7rkm48dzXnaHsKvTKaxn2Ef3cRGvJvgudWw2bYJP5KS
 UYCLADsdUIPBMEMN9wXurapp17chJMCSOyyubschfyBaOtsZRgiBF8UGVJRbaMZokTrGw/TmsMkJ/
 v9+oATvw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tXHlT-00F8jK-Rd; Mon, 13 Jan 2025 11:33:47 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>, Matt Coster <matt.coster@imgtec.com>
Subject: [PATCH 1/2] drm/sched: Add helper to check job dependencies
Date: Mon, 13 Jan 2025 10:33:40 +0000
Message-ID: <20250113103341.43914-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Lets isolate scheduler internals from drivers such as pvr which currently
walks the dependency array to look for fences.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
Reviewed-by: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 23 +++++++++++++++++++++++
 include/drm/gpu_scheduler.h            |  3 ++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 57da84908752..e6f1f2a8e033 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -997,6 +997,29 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
 }
 EXPORT_SYMBOL(drm_sched_job_add_implicit_dependencies);
 
+/**
+ * drm_sched_job_has_dependency - check whether fence is the job's dependency
+ * @job: scheduler job to check
+ * @fence: fence to look for
+ *
+ * Returns:
+ * True if @fence is found within the job's dependencies, or otherwise false.
+ */
+bool drm_sched_job_has_dependency(struct drm_sched_job *job,
+				  struct dma_fence *fence)
+{
+	struct dma_fence *f;
+	unsigned long index;
+
+	xa_for_each(&job->dependencies, index, f) {
+		if (f == fence)
+			return true;
+	}
+
+	return false;
+}
+EXPORT_SYMBOL(drm_sched_job_has_dependency);
+
 /**
  * drm_sched_job_cleanup - clean up scheduler job resources
  * @job: scheduler job to clean up
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 95e17504e46a..d118a0a57ab1 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -577,7 +577,8 @@ int drm_sched_job_add_resv_dependencies(struct drm_sched_job *job,
 int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
 					    struct drm_gem_object *obj,
 					    bool write);
-
+bool drm_sched_job_has_dependency(struct drm_sched_job *job,
+				  struct dma_fence *fence);
 
 void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				    struct drm_gpu_scheduler **sched_list,
-- 
2.47.1

