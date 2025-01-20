Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FF4A170D2
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 17:52:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A8210E44B;
	Mon, 20 Jan 2025 16:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="M/pA39P+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF7810E445;
 Mon, 20 Jan 2025 16:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S2hHi/6jlJEmF1CmndarywrlV6toPIhN/xEBGhbkEN4=; b=M/pA39P+HkMZD+W5l8ESqWQUPU
 Pe+w5eBvKYRkdPyYOwDd672lZlDMwvmDrceaKDhLgHTtcedVPOzdlxO+2p2+FTwxU2297AhFhiN+e
 DSHGJp1VrSeZ5y/H2W60/U6aiGSh0RY5VOtyxWAolKJaybbHTocOBc6mBnKvHWJrlu1sKyvC69x2K
 UYAvSrCc+t0n2Sj0JH7g9Uhgftn0+iJt/ux5xSiqXrGVuYsHHjK3/vHx7Guo26+wa7CFcGtJLv/ux
 KJ5PH7W5hO4wxXK3/AZZB2uJ1FwLflkH+9GubBGo3QJ2qoTAJfUpNNQi024QexQKbNkCAZ9kD0NGX
 5d7i5TXw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tZv14-000v9f-SP; Mon, 20 Jan 2025 17:52:46 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 3/4] drm/sched: Remove to_drm_sched_job internal helper
Date: Mon, 20 Jan 2025 16:52:39 +0000
Message-ID: <20250120165240.9105-4-tvrtko.ursulin@igalia.com>
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

The code assumes queue node is the first element in struct
drm_sched_job. Since this is not documented it can be very fragile so lets
just remove the internal helper and explicitly check for "nothing
dequeued", before converting the node to a sched job.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 18 +++++++++---------
 drivers/gpu/drm/scheduler/sched_main.c   | 10 +++++-----
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 7c0d266a89ef..8992bb432ec6 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -30,9 +30,6 @@
 
 #include "gpu_scheduler_trace.h"
 
-#define to_drm_sched_job(sched_job)		\
-		container_of((sched_job), struct drm_sched_job, queue_node)
-
 /**
  * drm_sched_entity_init - Init a context entity used by scheduler when
  * submit to HW ring.
@@ -476,11 +473,14 @@ drm_sched_job_dependency(struct drm_sched_job *job,
 struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 {
 	struct drm_sched_job *sched_job;
+	struct spsc_node *node;
 
-	sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
-	if (!sched_job)
+	node = spsc_queue_peek(&entity->job_queue);
+	if (!node)
 		return NULL;
 
+	sched_job = container_of(node, typeof(*sched_job), queue_node);
+
 	while ((entity->dependency =
 			drm_sched_job_dependency(sched_job, entity))) {
 		trace_drm_sched_job_wait_dep(sched_job, entity->dependency);
@@ -511,10 +511,10 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	 * the timestamp of the next job, if any.
 	 */
 	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
-		struct drm_sched_job *next;
-
-		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
-		if (next) {
+		node = spsc_queue_peek(&entity->job_queue);
+		if (node) {
+			struct drm_sched_job *next =
+				container_of(node, typeof(*next), queue_node);
 			struct drm_sched_rq *rq;
 
 			spin_lock(&entity->lock);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index a48be16ab84f..66eee6372253 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -87,9 +87,6 @@ static struct lockdep_map drm_sched_lockdep_map = {
 };
 #endif
 
-#define to_drm_sched_job(sched_job)		\
-		container_of((sched_job), struct drm_sched_job, queue_node)
-
 int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
 
 /**
@@ -122,11 +119,14 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
 				struct drm_sched_entity *entity)
 {
 	struct drm_sched_job *s_job;
+	struct spsc_node *node;
 
-	s_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
-	if (!s_job)
+	node = spsc_queue_peek(&entity->job_queue);
+	if (!node)
 		return false;
 
+	s_job = container_of(node, typeof(*s_job), queue_node);
+
 	/* If a job exceeds the credit limit, truncate it to the credit limit
 	 * itself to guarantee forward progress.
 	 */
-- 
2.47.1

