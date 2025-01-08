Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA5FA0649B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 19:35:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9894E10EC6C;
	Wed,  8 Jan 2025 18:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="g4EmrNmN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F27C10EC6A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 18:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GeyObeo2uor5DcPn6wlo9tAqYGFGQNWWl/r5rdGf+YU=; b=g4EmrNmNXf0iBNa+iQggG/KebY
 CI2dCUI+Jh2Z7Kfr7CehYJKTKk1szUyerj7fzGIwxOb6YUVQFw+P41mJY1gnD+lOkGl1q9XjzPPDW
 1s9A/SX6hNZrRFpXsYPd5mOkIKs6w7duMDAS1YDjD0PmjYMocyRwoWdrN6SdvOTAJMcO6s9D9FQbc
 QTqrgbfYFAo+w/Wvhfnp0s8/rGaj2Rr3UaOadIhKKEISxCr6DCqBpIdGasSdiKidA3foHx3v5Nve2
 djJPOQQsDsSkWfoqhmGeamHG/w+rz6x3TZ8R1dIIkMZBtaZ6iKSfP9KARmMPnui2yVZIEnw5n6SYW
 wgl4Z2yA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tVau3-00DFFa-Al; Wed, 08 Jan 2025 19:35:39 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [RFC 09/18] drm/sched: Remove idle entity from tree
Date: Wed,  8 Jan 2025 18:35:19 +0000
Message-ID: <20250108183528.41007-10-tvrtko.ursulin@igalia.com>
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

There is no need to keep entities with no jobs in the tree so lets remove
it once the last job is consumed. This keeps the tree smaller which is
nicer and more efficient.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 15 ++++++++-------
 drivers/gpu/drm/scheduler/sched_main.c   |  4 ++--
 include/drm/gpu_scheduler.h              |  2 ++
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 69bcf0e99d57..8e910586979e 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -512,19 +512,20 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	 */
 	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
 		struct drm_sched_job *next;
+		struct drm_sched_rq *rq;
 
+		spin_lock(&entity->lock);
+		rq = entity->rq;
+		spin_lock(&rq->lock);
 		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
 		if (next) {
-			struct drm_sched_rq *rq;
-
-			spin_lock(&entity->lock);
-			rq = entity->rq;
-			spin_lock(&rq->lock);
 			drm_sched_rq_update_fifo_locked(entity, rq,
 							next->submit_ts);
-			spin_unlock(&rq->lock);
-			spin_unlock(&entity->lock);
+		} else {
+			drm_sched_rq_remove_fifo_locked(entity, rq);
 		}
+		spin_unlock(&rq->lock);
+		spin_unlock(&entity->lock);
 	}
 
 	/* Jobs and entities might have different lifecycles. Since we're
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 9a3d31c33fa9..bcfc2abe349a 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -146,8 +146,8 @@ static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
 	return ktime_before(ent_a->oldest_job_waiting, ent_b->oldest_job_waiting);
 }
 
-static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
-					    struct drm_sched_rq *rq)
+void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
+				     struct drm_sched_rq *rq)
 {
 	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
 		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index a0ff08123f07..005db1e35fad 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -592,6 +592,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 				struct drm_sched_entity *entity);
 
+void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
+				     struct drm_sched_rq *rq);
 void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
 				     struct drm_sched_rq *rq, ktime_t ts);
 
-- 
2.47.1

