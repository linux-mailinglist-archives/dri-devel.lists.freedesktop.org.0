Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D3DA35B5D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 11:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6801810EC3D;
	Fri, 14 Feb 2025 10:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="CMx08Onw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47CD910EC38;
 Fri, 14 Feb 2025 10:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T6STChmIUYE9dm4Tk2lowbr59o0UmDI2s3KVyYDsG/Q=; b=CMx08Onwkr1bNHOYYkOvmnqW5R
 4h0LRfj+uALJIACZHpv3weYEvXAHysbq/UrwCJXVz8m/am31zpDe0+oSjKVPXWjXUPBue00OAytPv
 Tz3Tt+oSVcKeE4bA4ZGfoJhDOw+l/OYivtoi/3zrNoXotCl0lHZS+/Lg2CWCcseXuJ/rpDamYtsnc
 5JKbu/6uDaClidjODrXqFKEFDi02s4WBCmXaFcDIImxZ61Vt3zILBGfPZhXj6Xkj6wtjN0kgzLW8Z
 z1gxxZlC6MovyPuw+FcqSzOmtI6oDcCX6qWq8He1Z857TLbVQI5EDUDF9IEe6kdwRw0Q5Xxg1AqRW
 kPCGzBuw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tisnU-00HYn5-Ld; Fri, 14 Feb 2025 11:19:54 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v5 5/6] drm/sched: Move internal prototypes to internal header
Date: Fri, 14 Feb 2025 10:19:43 +0000
Message-ID: <20250214101944.19390-6-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250214101944.19390-1-tvrtko.ursulin@igalia.com>
References: <20250214101944.19390-1-tvrtko.ursulin@igalia.com>
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

Now that we have a header file for internal scheduler interfaces we can
move some more prototypes into it. By doing that we eliminate the chance
of drivers trying to use something which was not intended to be used.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_fence.c    |  2 ++
 drivers/gpu/drm/scheduler/sched_internal.h | 30 ++++++++++++++++++++++
 include/drm/gpu_scheduler.h                | 27 -------------------
 3 files changed, 32 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 0f35f009b9d3..e971528504a5 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -29,6 +29,8 @@
 
 #include <drm/gpu_scheduler.h>
 
+#include "sched_internal.h"
+
 static struct kmem_cache *sched_fence_slab;
 
 static int __init drm_sched_fence_slab_init(void)
diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
index 2fdf9dbd632e..53f587e9a8b4 100644
--- a/drivers/gpu/drm/scheduler/sched_internal.h
+++ b/drivers/gpu/drm/scheduler/sched_internal.h
@@ -1,6 +1,36 @@
 #ifndef _DRM_GPU_SCHEDULER_INTERNAL_H_
 #define _DRM_GPU_SCHEDULER_INTERNAL_H_
 
+
+/* Used to choose between FIFO and RR job-scheduling */
+extern int drm_sched_policy;
+
+#define DRM_SCHED_POLICY_RR    0
+#define DRM_SCHED_POLICY_FIFO  1
+
+void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
+
+void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
+			     struct drm_sched_entity *entity);
+void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
+				struct drm_sched_entity *entity);
+
+void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
+				     struct drm_sched_rq *rq, ktime_t ts);
+
+void drm_sched_entity_select_rq(struct drm_sched_entity *entity);
+struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity);
+
+struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *s_entity,
+					      void *owner);
+void drm_sched_fence_init(struct drm_sched_fence *fence,
+			  struct drm_sched_entity *entity);
+void drm_sched_fence_free(struct drm_sched_fence *fence);
+
+void drm_sched_fence_scheduled(struct drm_sched_fence *fence,
+			       struct dma_fence *parent);
+void drm_sched_fence_finished(struct drm_sched_fence *fence, int result);
+
 /**
  * drm_sched_entity_queue_pop - Low level helper for popping queued jobs
  *
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 6cd0f288f6ed..8cb12f6231b8 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -71,12 +71,6 @@ enum drm_sched_priority {
 	DRM_SCHED_PRIORITY_COUNT
 };
 
-/* Used to choose between FIFO and RR job-scheduling */
-extern int drm_sched_policy;
-
-#define DRM_SCHED_POLICY_RR    0
-#define DRM_SCHED_POLICY_FIFO  1
-
 /**
  * struct drm_sched_entity - A wrapper around a job queue (typically
  * attached to the DRM file_priv).
@@ -601,7 +595,6 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 
 void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
 void drm_sched_job_cleanup(struct drm_sched_job *job);
-void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
 bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
 void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
 void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
@@ -611,14 +604,6 @@ void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
 void drm_sched_increase_karma(struct drm_sched_job *bad);
 void drm_sched_fault(struct drm_gpu_scheduler *sched);
 
-void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
-			     struct drm_sched_entity *entity);
-void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
-				struct drm_sched_entity *entity);
-
-void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
-				     struct drm_sched_rq *rq, ktime_t ts);
-
 int drm_sched_entity_init(struct drm_sched_entity *entity,
 			  enum drm_sched_priority priority,
 			  struct drm_gpu_scheduler **sched_list,
@@ -627,23 +612,11 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout);
 void drm_sched_entity_fini(struct drm_sched_entity *entity);
 void drm_sched_entity_destroy(struct drm_sched_entity *entity);
-void drm_sched_entity_select_rq(struct drm_sched_entity *entity);
-struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity);
 void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
 void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
 				   enum drm_sched_priority priority);
 int drm_sched_entity_error(struct drm_sched_entity *entity);
 
-struct drm_sched_fence *drm_sched_fence_alloc(
-	struct drm_sched_entity *s_entity, void *owner);
-void drm_sched_fence_init(struct drm_sched_fence *fence,
-			  struct drm_sched_entity *entity);
-void drm_sched_fence_free(struct drm_sched_fence *fence);
-
-void drm_sched_fence_scheduled(struct drm_sched_fence *fence,
-			       struct dma_fence *parent);
-void drm_sched_fence_finished(struct drm_sched_fence *fence, int result);
-
 unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler *sched);
 void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
 		                unsigned long remaining);
-- 
2.48.0

