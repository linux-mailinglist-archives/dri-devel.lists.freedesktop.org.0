Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC191A2C63F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 15:52:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C252510EB30;
	Fri,  7 Feb 2025 14:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DGjJTj5D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED94810EB36;
 Fri,  7 Feb 2025 14:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DglLAR/GEsqMHh8HY8P3C5qTcF8n7QKMLRydhqOK17g=; b=DGjJTj5DaYn70o6sFfhoeRxE8a
 QK3Cqpvt06b/mewQY9C7YCau2ffQu2DC4l9FDBAf822nDIqohiSjwmEEKcZxlvVM0ymCJKCo8ulnG
 q+kNjgbDmsGgVJLi4IzBjqur60O0nLdYN72LPpi2sPTBsW7yiRuyR3iV2Z/D8PtXB/f7QUAwFyZK8
 hIOIUYktF7JA6xy6/hj8hu8PBnVFQgmS6KhOpLUV1yc779yf60+w1E5G1Jw9mCQi0/p0qhut1aEBI
 YNL+ont9cIbSiR4eG+KiwXlFs6MqyV6AdzBeOH/TeWW6TZ/2YWvhDA0ws6pKtukAum4faro2oGXQ5
 aZVwlBbw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tgPhE-005spc-BT; Fri, 07 Feb 2025 15:51:14 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 6/6] drm/sched: Group exported prototypes by object type
Date: Fri,  7 Feb 2025 14:51:04 +0000
Message-ID: <20250207145104.60455-7-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250207145104.60455-1-tvrtko.ursulin@igalia.com>
References: <20250207145104.60455-1-tvrtko.ursulin@igalia.com>
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

Do a bit of house keeping in gpu_scheduler.h by grouping the API by type
of object it operates on.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 include/drm/gpu_scheduler.h | 60 ++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 27 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index f45a9333ed04..217fb8f1809a 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -383,12 +383,6 @@ struct drm_sched_job {
 	struct xarray			dependencies;
 };
 
-static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
-					    int threshold)
-{
-	return s_job && atomic_inc_return(&s_job->karma) > threshold;
-}
-
 enum drm_gpu_sched_stat {
 	DRM_GPU_SCHED_STAT_NONE, /* Reserve 0 */
 	DRM_GPU_SCHED_STAT_NOMINAL,
@@ -536,6 +530,8 @@ struct drm_gpu_scheduler {
 	struct device			*dev;
 };
 
+/* Scheduler operations */
+
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
 		   struct workqueue_struct *submit_wq,
@@ -544,10 +540,30 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   atomic_t *score, const char *name, struct device *dev);
 
 void drm_sched_fini(struct drm_gpu_scheduler *sched);
+
+unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler *sched);
+void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
+			      unsigned long remaining);
+void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
+bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
+void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
+void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
+void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
+void drm_sched_start(struct drm_gpu_scheduler *sched, int errno);
+void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
+void drm_sched_fault(struct drm_gpu_scheduler *sched);
+
+struct drm_gpu_scheduler *
+drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
+		    unsigned int num_sched_list);
+
+/* Jobs */
+
 int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
 		       u32 credits, void *owner);
 void drm_sched_job_arm(struct drm_sched_job *job);
+void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
 int drm_sched_job_add_dependency(struct drm_sched_job *job,
 				 struct dma_fence *fence);
 int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,
@@ -562,21 +578,16 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
 					    bool write);
 bool drm_sched_job_has_dependency(struct drm_sched_job *job,
 				  struct dma_fence *fence);
-
-void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
-				    struct drm_gpu_scheduler **sched_list,
-                                   unsigned int num_sched_list);
-
-void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
 void drm_sched_job_cleanup(struct drm_sched_job *job);
-bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
-void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
-void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
-void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
-void drm_sched_start(struct drm_gpu_scheduler *sched, int errno);
-void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
 void drm_sched_increase_karma(struct drm_sched_job *bad);
-void drm_sched_fault(struct drm_gpu_scheduler *sched);
+
+static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
+					    int threshold)
+{
+	return s_job && atomic_inc_return(&s_job->karma) > threshold;
+}
+
+/* Entities */
 
 int drm_sched_entity_init(struct drm_sched_entity *entity,
 			  enum drm_sched_priority priority,
@@ -586,16 +597,11 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout);
 void drm_sched_entity_fini(struct drm_sched_entity *entity);
 void drm_sched_entity_destroy(struct drm_sched_entity *entity);
-void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
 void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
 				   enum drm_sched_priority priority);
 int drm_sched_entity_error(struct drm_sched_entity *entity);
-
-unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler *sched);
-void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
-		                unsigned long remaining);
-struct drm_gpu_scheduler *
-drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
-		     unsigned int num_sched_list);
+void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
+				   struct drm_gpu_scheduler **sched_list,
+				   unsigned int num_sched_list);
 
 #endif
-- 
2.48.0

