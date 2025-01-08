Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CA6A0649A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 19:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76FEA10EC6A;
	Wed,  8 Jan 2025 18:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nnRAXk4a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B6B10EC67
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 18:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=trAgTDHW9T+Hpqd9iO5aZQNFEmsxpWQAEmQlcX6ag9E=; b=nnRAXk4azPGuNtizq3KGqYDSLf
 u92+0pclTtNkKQQ4BpvE4muMapX0IdGugcmf6FWifbl3eT80zObgHrJ+MPkZk+z/T+phGUfI/MmaJ
 NbkQxjNiUbuaRcRu4UKwfJbWXyaHvJYbIHvfHn5uTouGwGjDKufyKLhWjKVfVD6vNfeeVTPHNWxsi
 MNqibbQka3qDBk1zxOc6/ZGG/S8OH80zhptubnh1nmFT2YhAVUwRcxbddDjd94/aIvTdutalE0ye6
 coucGLAiYk/2JIMOLOa4ETu2Nw65/jKxtMZLqdNtd1CwMXYBdX4P98bRg1tGdg/NNhdZLZ5uU0EzO
 kfbXbdFw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tVau1-00DFF8-8Z; Wed, 08 Jan 2025 19:35:37 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [RFC 06/18] drm/sched: Add helper to check job dependencies
Date: Wed,  8 Jan 2025 18:35:16 +0000
Message-ID: <20250108183528.41007-7-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
References: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
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
---
 drivers/gpu/drm/scheduler/sched_main.c | 23 +++++++++++++++++++++++
 include/drm/gpu_scheduler.h            |  3 ++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 64cd79e1793a..f07b19c97d0f 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -968,6 +968,29 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
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
index e2e6af8849c6..a0ff08123f07 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -564,7 +564,8 @@ int drm_sched_job_add_resv_dependencies(struct drm_sched_job *job,
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

