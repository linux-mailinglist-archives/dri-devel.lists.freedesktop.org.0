Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7A6C07294
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 18:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C37410EADF;
	Fri, 24 Oct 2025 16:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="BTiJrYJ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85A710EAC8;
 Fri, 24 Oct 2025 16:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r99l6u0BlUiEuKPoTfx5q+o9T6qhcn8/spRENPL/yP4=; b=BTiJrYJ96HtdXFOelKboANXfhv
 FEU1VO0rozl8ezgT/YimVvirfpOsGx6Q+GSC+lyc9R+Hd/Db/XvpuUcCPfKhjX1+kFeFCTqoDyoOf
 TMuFtdz5EmOXznE3qhorAXnGBPBIs0jSLAiTNWF2//BayMk7WP3fAdoNDqxR4V1cvyr/QruEbUCQw
 ufu6Eh1MScUHV2AL2xq7//PVE8P20cnuDcFS+Yjm5UTmMK9WK6jduaQpBZX1FKl4ALaPWz81jmTuj
 N+tFnBPo4lPrP/APTqAs9HVvjOZoN1zQcKz+V0pzwAfPLBweVBJKc9llZZa8UgqLIavqqpfP/x8YO
 HUhZk0JQ==;
Received: from [90.242.12.242] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vCKKn-00Ep6L-2Q; Fri, 24 Oct 2025 18:08:09 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v3 08/27] drm/sched: Remove idle entity from tree
Date: Fri, 24 Oct 2025 17:07:41 +0100
Message-ID: <20251024160800.79836-9-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251024160800.79836-1-tvrtko.ursulin@igalia.com>
References: <20251024160800.79836-1-tvrtko.ursulin@igalia.com>
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
nicer and more efficient as entities are removed and re-added on every
popped job.

Apart from that, the upcoming fair scheduling algorithm will rely on the
tree only containing runnable entities.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_rq.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
index cf03b38c4eb5..2d1f579d8352 100644
--- a/drivers/gpu/drm/scheduler/sched_rq.c
+++ b/drivers/gpu/drm/scheduler/sched_rq.c
@@ -19,6 +19,9 @@ drm_sched_entity_compare_before(struct rb_node *a, const struct rb_node *b)
 static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
 					    struct drm_sched_rq *rq)
 {
+	lockdep_assert_held(&entity->lock);
+	lockdep_assert_held(&rq->lock);
+
 	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
 		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
 		RB_CLEAR_NODE(&entity->rb_tree_node);
@@ -155,27 +158,30 @@ drm_sched_rq_next_rr_ts(struct drm_sched_rq *rq,
 void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
 {
 	struct drm_sched_job *next_job;
+	struct drm_sched_rq *rq;
 
 	/*
 	 * Update the entity's location in the min heap according to
 	 * the timestamp of the next job, if any.
 	 */
+	spin_lock(&entity->lock);
+	rq = entity->rq;
+	spin_lock(&rq->lock);
 	next_job = drm_sched_entity_queue_peek(entity);
 	if (next_job) {
-		struct drm_sched_rq *rq;
 		ktime_t ts;
 
-		spin_lock(&entity->lock);
-		rq = entity->rq;
-		spin_lock(&rq->lock);
 		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
 			ts = next_job->submit_ts;
 		else
 			ts = drm_sched_rq_next_rr_ts(rq, entity);
+
 		drm_sched_rq_update_fifo_locked(entity, rq, ts);
-		spin_unlock(&rq->lock);
-		spin_unlock(&entity->lock);
+	} else {
+		drm_sched_rq_remove_fifo_locked(entity, rq);
 	}
+	spin_unlock(&rq->lock);
+	spin_unlock(&entity->lock);
 }
 
 /**
-- 
2.48.0

