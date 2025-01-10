Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F754A08EF4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 12:15:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D375010F083;
	Fri, 10 Jan 2025 11:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="E3w6zSr2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA69310E4F8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 11:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JR3qg8roNPa1r4OHOvGTJw/zOE29GW/7Nvx132GrPZ0=; b=E3w6zSr25msb6mlKNti/l8+i5I
 qfbwYqVLtifV2h0LC7m1bSqLhSlpUcBCu70nmon6s40OE0dscX78tPCNfQQYqF8AujahLe9swoscY
 ZYjoKIrlBVOpJ5EjMtSSkwGeIADqXSpjCF6jJBMQ2frUKe46jUnGCJrfeWHRRf0tthSr4Ax8abDYB
 DJ+v3w6nZ0iaE0iD1As8sfR46MEYko4WvcUKFiVEYVYOTYruIlA62OKX9bf+c7iRu0xsbq7XpME9B
 tPesFMExo85VbjeLQZE7jcIzHPsxwGB06AKCJ3Z7Um8/LblyHdB5yx2EEvRovutnji3CsDIrItaGt
 2vb9MELw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tWCyc-00Dvn1-SM; Fri, 10 Jan 2025 12:14:54 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>, stable@vger.kernel.org
Subject: [PATCH] drm/sched: Remove job submit/free race when using unordered
 workqueues
Date: Fri, 10 Jan 2025 11:14:52 +0000
Message-ID: <20250110111452.76976-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.47.1
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

After commit f7fe64ad0f22 ("drm/sched: Split free_job into own work item")
and with drivers who use the unordered workqueue sched_jobs can be freed
in parallel as soon as the complete_all(&entity->entity_idle) is called.
This makes all dereferencing in the lower part of the worker unsafe so
lets fix it by moving the complete_all() call to after the worker is done
touching the job.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: f7fe64ad0f22 ("drm/sched: Split free_job into own work item")
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/scheduler/sched_main.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 57da84908752..f0d02c061c23 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1188,7 +1188,6 @@ static void drm_sched_run_job_work(struct work_struct *w)
 		container_of(w, struct drm_gpu_scheduler, work_run_job);
 	struct drm_sched_entity *entity;
 	struct dma_fence *fence;
-	struct drm_sched_fence *s_fence;
 	struct drm_sched_job *sched_job;
 	int r;
 
@@ -1207,15 +1206,12 @@ static void drm_sched_run_job_work(struct work_struct *w)
 		return;
 	}
 
-	s_fence = sched_job->s_fence;
-
 	atomic_add(sched_job->credits, &sched->credit_count);
 	drm_sched_job_begin(sched_job);
 
 	trace_drm_run_job(sched_job, entity);
 	fence = sched->ops->run_job(sched_job);
-	complete_all(&entity->entity_idle);
-	drm_sched_fence_scheduled(s_fence, fence);
+	drm_sched_fence_scheduled(sched_job->s_fence, fence);
 
 	if (!IS_ERR_OR_NULL(fence)) {
 		/* Drop for original kref_init of the fence */
@@ -1232,6 +1228,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
 				   PTR_ERR(fence) : 0);
 	}
 
+	complete_all(&entity->entity_idle);
 	wake_up(&sched->job_scheduled);
 	drm_sched_run_job_queue(sched);
 }
-- 
2.47.1

