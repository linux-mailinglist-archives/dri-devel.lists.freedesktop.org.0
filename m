Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E542A064A5
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 19:35:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3AFC10EC79;
	Wed,  8 Jan 2025 18:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="UA7DDtQ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E51F10EC64
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 18:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pj8yAP2qRVCHCDNlUibJeSVxfzeJLkGjPAsrvnOZANM=; b=UA7DDtQ/Jsp3/FoYIt+m39qgpS
 bhSqBbUynrRBZK5Tj3eXrVu/wL+04V+WiJctT9h4g3cD3scZ+NDDJ8/NaPZlWs8a728D4dajaqu1X
 sTW5SvyWkDcNK/cvQ7xrNufPY75UYpyDVXuD3KnZHZZwwdOCKJ6jstg7t82rVjkrW67tgE1ofENXH
 b+vyh9lOUYZ7i7q07/aFtSE6SyHMOs/mGDuF528B3xQyAj5tlINb9fqHBMSo0Uki1gd2xSQtTGE0+
 BIUYMUIyKiK4G1qImPIw/CSXItGGG/kfhLMcgFfhgceMLEeu7klWubyln+xRdSCjWV2Hev7Mxp4GT
 unIx3FNQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tVau9-00DFH1-Og; Wed, 08 Jan 2025 19:35:45 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [RFC 18/18] drm/sched: Scale deadlines depending on queue depth
Date: Wed,  8 Jan 2025 18:35:28 +0000
Message-ID: <20250108183528.41007-19-tvrtko.ursulin@igalia.com>
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

Speculative idea for the concern of how to somewhat prioritise clients who
submit small amount of work infrequently is to scale their deadline
calculation based on their queue depth and priority. Kernel context we can
pull in more aggressively into the past.

On the other hand queue depth may not be representative on the GPU
utilisation so it can also incorrectly penalise short deep(-ish) queues
versus single large jobs.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 24 ++++++++++++++++++------
 include/drm/gpu_scheduler.h              |  2 ++
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 29daee6b06e5..d17980af85fc 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -391,14 +391,24 @@ static ktime_t
 __drm_sched_entity_get_job_deadline(struct drm_sched_entity *entity,
 				    ktime_t submit_ts)
 {
-	static const unsigned int d_us[] = {
-		[DRM_SCHED_PRIORITY_KERNEL] =    100,
-		[DRM_SCHED_PRIORITY_HIGH]   =   1000,
-		[DRM_SCHED_PRIORITY_NORMAL] =   5000,
-		[DRM_SCHED_PRIORITY_LOW]    = 100000,
+	static const long d_us[] = {
+		[DRM_SCHED_PRIORITY_KERNEL] = -1000,
+		[DRM_SCHED_PRIORITY_HIGH]   =   334,
+		[DRM_SCHED_PRIORITY_NORMAL] =  1000,
+		[DRM_SCHED_PRIORITY_LOW]    =  6667,
 	};
+	static const unsigned int shift[] = {
+		[DRM_SCHED_PRIORITY_KERNEL] = 4,
+		[DRM_SCHED_PRIORITY_HIGH]   = 1,
+		[DRM_SCHED_PRIORITY_NORMAL] = 2,
+		[DRM_SCHED_PRIORITY_LOW]    = 3,
+	};
+	const unsigned int prio = entity->priority;
+	long d;
+
+	d = d_us[prio] * (atomic_read(&entity->qd) << shift[prio]);
 
-	return ktime_add_us(submit_ts, d_us[entity->priority]);
+	return ktime_add_us(submit_ts, d);
 }
 
 ktime_t
@@ -520,6 +530,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	 */
 	smp_wmb();
 
+	atomic_dec(&entity->qd);
 	spsc_queue_pop(&entity->job_queue);
 	drm_sched_rq_pop_entity(entity->rq, entity);
 
@@ -608,6 +619,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 	else
 		fence_deadline = KTIME_MAX;
 
+	atomic_inc(&entity->qd);
 	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
 
 	/* first job wakes up scheduler */
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 25786fb941d8..bce88c9b30c1 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -147,6 +147,8 @@ struct drm_sched_entity {
 	 */
 	struct spsc_queue		job_queue;
 
+	atomic_t			qd;
+
 	/**
 	 * @fence_seq:
 	 *
-- 
2.47.1

