Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBD6A170D0
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 17:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E1C10E445;
	Mon, 20 Jan 2025 16:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Ql1Aup+i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BAAA10E445;
 Mon, 20 Jan 2025 16:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C+K3Tx+PRHiNg45R4nE9FIMCvfXS+0c4yrx8qW5Et2A=; b=Ql1Aup+iN9YzwDZkuaplnCcA4J
 /Hz/uMHCIiWWQt6CjWv3rlz4TZMORw0u6aBe8KeFgzUjMGVRLCHT5vsAH5ff8izEXx6n9MLrIZdoQ
 CH3jJiU6DBqOQTOVFLynWUO0x2CJ8MxC8m7lCnBZIkbRJUyNuZTpvmLEjoUQjvTx5qlQeuyyA+zO0
 mG/FwrSKv5AiGqZ5oWPWiZMftk6uLufCfvGTSC3ZyKhTjZE5yb3BQ1lnUZqmfkjZsjHekqDh0emWw
 RGLh8YkKv1QD1DzXscIHa3bvsBqXt8J7J4/C/RG/nvvPPfmY6oiteHFH09aNvHThW3sohGDO0bmxH
 IRGzodFA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tZv13-000v9T-G1; Mon, 20 Jan 2025 17:52:45 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 1/4] drm/sched: Add job popping API
Date: Mon, 20 Jan 2025 16:52:37 +0000
Message-ID: <20250120165240.9105-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120165240.9105-1-tvrtko.ursulin@igalia.com>
References: <20250120165240.9105-1-tvrtko.ursulin@igalia.com>
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

Idea is to add a helper for popping jobs from the entity with the goal
of making amdgpu use it in the next patch. That way amdgpu will decouple
itself a tiny bit more from scheduler implementation details.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c |  2 +-
 include/drm/gpu_scheduler.h              | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 69bcf0e99d57..7c0d266a89ef 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -255,7 +255,7 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
 	/* The entity is guaranteed to not be used by the scheduler */
 	prev = rcu_dereference_check(entity->last_scheduled, true);
 	dma_fence_get(prev);
-	while ((job = to_drm_sched_job(spsc_queue_pop(&entity->job_queue)))) {
+	while ((job = __drm_sched_entity_pop_job(entity))) {
 		struct drm_sched_fence *s_fence = job->s_fence;
 
 		dma_fence_get(&s_fence->finished);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index a0ff08123f07..092242f2464f 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -611,6 +611,27 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
 bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
 int drm_sched_entity_error(struct drm_sched_entity *entity);
 
+/**
+ * __drm_sched_entity_pop_job - Low level helper for popping queued jobs
+ *
+ * @entity: scheduler entity
+ *
+ * Low level helper for popping queued jobs. Drivers should not use it.
+ *
+ * Returns the job dequeued or NULL.
+ */
+static inline struct drm_sched_job *
+__drm_sched_entity_pop_job(struct drm_sched_entity *entity)
+{
+	struct spsc_node *node;
+
+	node = spsc_queue_pop(&entity->job_queue);
+	if (!node)
+		return NULL;
+
+	return container_of(node, struct drm_sched_job, queue_node);
+}
+
 struct drm_sched_fence *drm_sched_fence_alloc(
 	struct drm_sched_entity *s_entity, void *owner);
 void drm_sched_fence_init(struct drm_sched_fence *fence,
-- 
2.47.1

