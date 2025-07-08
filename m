Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B8EAFC783
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 11:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5211E10E5FC;
	Tue,  8 Jul 2025 09:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hfkwkqob";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F3B10E5E8;
 Tue,  8 Jul 2025 09:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JCL2ChtCeR8mKOIhxXZfrNdDmBWo499T3B/tqFwlq0k=; b=hfkwkqobqXVZB9wNhcAzZ92d9e
 96lQl+vW9Ek6LAFuhCYnGKNMMR3MP0dHHo2GFV+j4HUoeSEBu95RdCrgteMaRjkt1Bgn6VGex4FDt
 qziFvIxiKCRySziUpmBDZMd3S77sHqyq59wa8wlMJpxCUQPz/RVIjYm2Cfy0USjuWqNNXdCsOS0js
 cgUJfWCygbP1+vsKBzy6e0MahlLdYxMSMRWTA10MrE0/r9dC5OsC0lhNe7Dc7yMDFQO/Pjfe+7Qw3
 CrMI54c2PV090Va3Zi74CbdgANomcQ450E9I6lmvgK8ka/1Dg/6J5mZe97vwNFGQkTdy3tbB9VerA
 Q6/xyvQA==;
Received: from [84.65.48.237] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uZ4zW-00Dx4a-Ak; Tue, 08 Jul 2025 11:51:58 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v6 11/15] drm/sched: Remove idle entity from tree
Date: Tue,  8 Jul 2025 10:51:43 +0100
Message-ID: <20250708095147.73366-12-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250708095147.73366-1-tvrtko.ursulin@igalia.com>
References: <20250708095147.73366-1-tvrtko.ursulin@igalia.com>
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

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_rq.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
index 0492d1f21572..9f1b4ea99cad 100644
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
@@ -153,24 +156,27 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
 {
 	struct drm_sched_job *next_job;
 	struct drm_sched_rq *rq;
-	ktime_t ts;
 
 	/*
 	 * Update the entity's location in the min heap according to
 	 * the timestamp of the next job, if any.
 	 */
+	spin_lock(&entity->lock);
+	rq = entity->rq;
+	spin_lock(&rq->lock);
 	next_job = drm_sched_entity_queue_peek(entity);
-	if (!next_job)
-		return;
+	if (next_job) {
+		ktime_t ts;
 
-	spin_lock(&entity->lock);
-	rq = entity->rq;
-	spin_lock(&rq->lock);
-	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
-		ts = next_job->submit_ts;
-	else
-		ts = drm_sched_rq_get_rr_deadline(rq);
-	drm_sched_rq_update_fifo_locked(entity, rq, ts);
+		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
+			ts = next_job->submit_ts;
+		else
+			ts = drm_sched_rq_get_rr_deadline(rq);
+
+		drm_sched_rq_update_fifo_locked(entity, rq, ts);
+	} else {
+		drm_sched_rq_remove_fifo_locked(entity, rq);
+	}
 	spin_unlock(&rq->lock);
 	spin_unlock(&entity->lock);
 }
-- 
2.48.0

