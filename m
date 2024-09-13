Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A137978569
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 18:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC7310E287;
	Fri, 13 Sep 2024 16:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="koT7zPpM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331E610E0EA;
 Fri, 13 Sep 2024 16:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BC85KIj9QdzBWvHu6F/YsDn9FZhaZ+lqi40FCUFk6k8=; b=koT7zPpMbqVfVfsTXOGjpsNatL
 bRYE8RxU2xN2B7uen8yMGjnQJ+HlI+T7TGB58B1o014GPCrudNqCmb6oE2e/mGciuJrc/x0CZ1wXy
 uzfISwZht0dBDzqr0iKQGC6PUsYx7kXoM3egn7oUMokHwmwTN+xTIJiL4/RbImCHsCfR8co5j51wm
 HuUH+jfwFYwI/kzJgUskB3PVg0vHOuCIgrDSk6+DCzY6KrfhA4Kv6EPV7Yc940EUNh53u9unWWmaH
 1Z5E4jYj2jYlCgpiJ55fHeCWngjOonBQrqMM1PDXpff+9nFArxgnih64t8Ef6RQUPruGTj99M8Bdn
 OaHhJOiw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sp8o8-00DOeg-FP; Fri, 13 Sep 2024 18:06:04 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH 4/8] drm/sched: Optimise drm_sched_entity_push_job
Date: Fri, 13 Sep 2024 17:05:55 +0100
Message-ID: <20240913160559.49054-5-tursulin@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913160559.49054-1-tursulin@igalia.com>
References: <20240913160559.49054-1-tursulin@igalia.com>
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

In FIFO mode We can avoid dropping the lock only to immediately re-acquire
by adding a new drm_sched_rq_update_fifo_locked() helper.

v2:
 * Remove drm_sched_rq_update_fifo() altogether. (Christian)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 13 +++++++++----
 drivers/gpu/drm/scheduler/sched_main.c   |  6 +++---
 include/drm/gpu_scheduler.h              |  2 +-
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 6645a8524699..aff79055643f 100644
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
@@ -615,10 +619,11 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 
 		atomic_inc(sched->score);
 		drm_sched_rq_add_entity(rq, entity);
-		spin_unlock(&entity->rq_lock);
 
 		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
-			drm_sched_rq_update_fifo(entity, submit_ts);
+			drm_sched_rq_update_fifo_locked(entity, submit_ts);
+
+		spin_unlock(&entity->rq_lock);
 
 		drm_sched_wakeup(sched, entity);
 	}
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index f093616fe53c..d0ee0ba75a86 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -163,14 +163,15 @@ static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *enti
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
@@ -181,7 +182,6 @@ void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
 		      drm_sched_entity_compare_before);
 
 	spin_unlock(&entity->rq->lock);
-	spin_unlock(&entity->rq_lock);
 }
 
 /**
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index a8d19b10f9b8..38465b78c7d5 100644
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

