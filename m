Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F39059FE925
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 17:53:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221A310E387;
	Mon, 30 Dec 2024 16:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gTKwYo44";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146C410E527
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 16:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ppP2ltD/fqdU3EpZm/D4OpRI0IUCcdxlakILhiMJfgA=; b=gTKwYo44gUrohcG5PPeUkgiij4
 E9G4PVE2n148XRXE/tpG30S16tZCggUy0vyy3gSdQUWgZgcrhCF5AOHQn/yWOvgM50SERFVUD5gJ5
 JrAY8umLiITi37GYYbEX9R9+Gfrq3xf0expbmRdpOHwKQgZ5Ar3hRaIxAKJLT1XfX7PIrrZWDj/Mo
 L7qu87s+1Wb2wEIhm4OxlsIBbUDMMzv7JIGGjy1aCzW/ZXwGbxireHuT2yfaKmF2zjYCd5TNIFyLH
 +8rr8LO/dOliTBa1UKt5DrwFFdK1L9bxs2DWT+YtQHXao0COy1zyJ4wyH4N18dBg9Vbm9JUJNGEKJ
 cai1Trmw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tSJ0r-009ZvO-8p; Mon, 30 Dec 2024 17:53:05 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [RFC 02/14] drm/sched: Remove idle entity from tree
Date: Mon, 30 Dec 2024 16:52:47 +0000
Message-ID: <20241230165259.95855-3-tursulin@igalia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241230165259.95855-1-tursulin@igalia.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
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
index 1734c17aeea5..9beb4c611988 100644
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
index e2e6af8849c6..978ca621cc13 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -591,6 +591,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 				struct drm_sched_entity *entity);
 
+void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
+				     struct drm_sched_rq *rq);
 void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
 				     struct drm_sched_rq *rq, ktime_t ts);
 
-- 
2.47.1

