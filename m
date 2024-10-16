Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 054789A093A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 14:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530EC10E615;
	Wed, 16 Oct 2024 12:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cppNTBbg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7F610E5BA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 12:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1YvOqsj9wdxZBqPIZaE5wshldRefEhRn9B66XUbgi/U=; b=cppNTBbgfVPZbwthzH7LfazcW9
 vkVZnOhv1/7TVQ8jkNGKqE5sh04nvHR9xBOWcvwQHfZuMXXy6LSp59EycvHTqxapXPnfinK5x3dGh
 xtORulDvi1s+m7nTO8dU5KRVo0lVcsrJR/vyXSFz//Ah3jH2i/0xOc5UDBZTatGh+AML5QBFPkCbe
 7QTFh9ifjk1CYoZ35Gjdvym7ED2xz+Ag6rK61NBQaC1R9nJ9PQEPycq5zildE2LliaIpOQK+JKm6Q
 0YF0+Z9lXPV+/Bzx0tYp5kMc82yx6Dtba8trUVuR+u5+fAGZvD/SUvt0XE0s4oj5aGuWIUC2Wrke3
 PxoaCYpA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1t130i-00Ajie-Vc; Wed, 16 Oct 2024 14:20:17 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH 1/5] drm/sched: Optimise drm_sched_entity_push_job
Date: Wed, 16 Oct 2024 13:20:09 +0100
Message-ID: <20241016122013.7857-2-tursulin@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241016122013.7857-1-tursulin@igalia.com>
References: <20241016122013.7857-1-tursulin@igalia.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

In FIFO mode (which is the default), both drm_sched_entity_push_job() and
drm_sched_rq_update_fifo(), where the latter calls the former, are
currently taking and releasing the same entity->rq_lock.

We can avoid that design inelegance, and also have a miniscule
efficiency improvement on the submit from idle path, by introducing a new
drm_sched_rq_update_fifo_locked() helper and pulling up the lock taking to
its callers.

v2:
 * Remove drm_sched_rq_update_fifo() altogether. (Christian)

v3:
 * Improved commit message. (Philipp)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 13 +++++++++----
 drivers/gpu/drm/scheduler/sched_main.c   |  6 +++---
 include/drm/gpu_scheduler.h              |  2 +-
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 2951fcc2e6b1..b72cba292839 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -514,8 +514,12 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 		struct drm_sched_job *next;
 
 		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
-		if (next)
-			drm_sched_rq_update_fifo(entity, next->submit_ts);
+		if (next) {
+			spin_lock(&entity->rq_lock);
+			drm_sched_rq_update_fifo_locked(entity,
+							next->submit_ts);
+			spin_unlock(&entity->rq_lock);
+		}
 	}
 
 	/* Jobs and entities might have different lifecycles. Since we're
@@ -613,10 +617,11 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 		sched = rq->sched;
 
 		drm_sched_rq_add_entity(rq, entity);
-		spin_unlock(&entity->rq_lock);
 
 		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
-			drm_sched_rq_update_fifo(entity, submit_ts);
+			drm_sched_rq_update_fifo_locked(entity, submit_ts);
+
+		spin_unlock(&entity->rq_lock);
 
 		drm_sched_wakeup(sched);
 	}
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index e32b0f7d7e94..bbd1630407e4 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -169,14 +169,15 @@ static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *enti
 	}
 }
 
-void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
+void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity, ktime_t ts)
 {
 	/*
 	 * Both locks need to be grabbed, one to protect from entity->rq change
 	 * for entity from within concurrent drm_sched_entity_select_rq and the
 	 * other to update the rb tree structure.
 	 */
-	spin_lock(&entity->rq_lock);
+	lockdep_assert_held(&entity->rq_lock);
+
 	spin_lock(&entity->rq->lock);
 
 	drm_sched_rq_remove_fifo_locked(entity);
@@ -187,7 +188,6 @@ void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
 		      drm_sched_entity_compare_before);
 
 	spin_unlock(&entity->rq->lock);
-	spin_unlock(&entity->rq_lock);
 }
 
 /**
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index e9f075f51db3..3658a6cb048e 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -593,7 +593,7 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 				struct drm_sched_entity *entity);
 
-void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts);
+void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity, ktime_t ts);
 
 int drm_sched_entity_init(struct drm_sched_entity *entity,
 			  enum drm_sched_priority priority,
-- 
2.46.0

