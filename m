Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DDDA064A2
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 19:35:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CAF910EC64;
	Wed,  8 Jan 2025 18:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="MPoW2kry";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFE610EC71
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 18:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2wwIYaE+jciVaex1MXDJVeACMFTTlaYh8QEVscPlQfQ=; b=MPoW2kryfVD23ufluG0ZP3eXxU
 rzNgphfSqXbVekHQTN+YT+xQOlbHpDFMgsI8gvI29ikDQ1Qd294X3OxyA30yZDIVS74NiBh5uffup
 T7TLsfUweNDMcgfycSucECTpxl6d1S7zRmI+saeQRoKMxs1jhCg/2kqc0fNR+XdVdNR/hr5xIV08K
 XRV2ALc8TlvyYH3uYOsqvMnentka9l66rps7ZCDrLkTvrjiAf3kELEkG+H9JBf5W1d3unpinhFWcS
 fAkMuGEgpY2eYwGjlp94+L/0GkuB+Jlh5Ow47PVeAVAxebMqLAR40wJSZI1IxvkNGRMDaDkK5ZnQc
 mNvGppTA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tVau8-00DFGj-BK; Wed, 08 Jan 2025 19:35:44 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>, Rob Clark <robdclark@gmail.com>
Subject: [RFC 16/18] drm/sched: Connect with dma-fence deadlines
Date: Wed,  8 Jan 2025 18:35:26 +0000
Message-ID: <20250108183528.41007-17-tvrtko.ursulin@igalia.com>
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

Now that the scheduling policy is deadline based it feels completely
natural to allow propagating externaly set deadlines to the scheduler.

Scheduler deadlines are not a guarantee but as the dma-fence facility is
already in use by userspace lets wire it up.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
Cc: Rob Clark <robdclark@gmail.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 98c78d1373d8..db5d34310b18 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -410,7 +410,16 @@ ktime_t
 drm_sched_entity_get_job_deadline(struct drm_sched_entity *entity,
 				  struct drm_sched_job *job)
 {
-	return __drm_sched_entity_get_job_deadline(entity, job->submit_ts);
+	struct drm_sched_fence *s_fence = job->s_fence;
+	struct dma_fence *fence = &s_fence->finished;
+	ktime_t deadline;
+
+	deadline = __drm_sched_entity_get_job_deadline(entity, job->submit_ts);
+	if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags) &&
+	    ktime_before(s_fence->deadline, deadline))
+		deadline = s_fence->deadline;
+
+	return deadline;
 }
 
 /*
@@ -579,9 +588,12 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
  */
 void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 {
+	struct drm_sched_fence *s_fence = sched_job->s_fence;
 	struct drm_sched_entity *entity = sched_job->entity;
-	bool first;
+	struct dma_fence *fence = &s_fence->finished;
+	ktime_t fence_deadline;
 	ktime_t submit_ts;
+	bool first;
 
 	trace_drm_sched_job(sched_job, entity);
 	atomic_inc(entity->rq->sched->score);
@@ -593,6 +605,11 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 	 * Make sure to set the submit_ts first, to avoid a race.
 	 */
 	sched_job->submit_ts = submit_ts = ktime_get();
+	if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags))
+		fence_deadline = s_fence->deadline;
+	else
+		fence_deadline = KTIME_MAX;
+
 	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
 
 	/* first job wakes up scheduler */
@@ -601,6 +618,9 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 
 		submit_ts = __drm_sched_entity_get_job_deadline(entity,
 								submit_ts);
+		if (ktime_before(fence_deadline, submit_ts))
+			submit_ts = fence_deadline;
+
 		sched = drm_sched_rq_add_entity(entity->rq, entity, submit_ts);
 		if (sched)
 			drm_sched_wakeup(sched);
-- 
2.47.1

