Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C92B07883
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 16:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D8B210E029;
	Wed, 16 Jul 2025 14:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="JwCRq0oG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92DD410E029;
 Wed, 16 Jul 2025 14:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PuaDlYCQ78iBPZOCQunQGLFBK/vdbR2rNx03lUUH0EY=; b=JwCRq0oGqrS8l2Ll8NW2YJFt6u
 YcWuqaDp+G5ad02AyWoKhG+saWG1eHjJYyW0qmCKv/NpjPhbZJrQPi0ZBjjTt1GSlLqxdNQCBlNlc
 hkm97LGe9cGI3hDnCBjUHAVrQ1fS72mEH+CPVKvvELCjtEEH79iNE+cBKYwr486dz4xtcMklvnw4f
 MIsAQC7Ds51YobnThE1SBwBKC3pkIfCwbeJ71SqZuXnRUSqPMnQTghDuMZpyZraJFVvuNaEiquFbV
 rSL3U6cgcTf2Jypgk5zGPff53QGjwIg6QrQd8/hUcz41uiss6o819I1m/rV/7QfBL4mxEhc/IGBbB
 TqTruVRQ==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uc3Qz-00HMGo-HH; Wed, 16 Jul 2025 16:48:37 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] drm/sched: Consolidate drm_sched_job_timedout
Date: Wed, 16 Jul 2025 15:48:32 +0100
Message-ID: <20250716144832.62494-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
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

Reduce to one spin_unlock for hopefully a little bit clearer flow in the
function. It may appear that there is a behavioural change with the
drm_sched_start_timeout_unlocked() now not being called if there were
initially no jobs on the pending list, and then some appeared after
unlock, however if the code would rely on the TDR handler restarting
itself then it would fail to do that if the job arrived on the pending
list after the check.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Maíra Canal <mcanal@igalia.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 36 ++++++++++++--------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index e2cda28a1af4..60ae600590dc 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -556,17 +556,15 @@ static void drm_sched_job_reinsert_on_false_timeout(struct drm_gpu_scheduler *sc
 
 static void drm_sched_job_timedout(struct work_struct *work)
 {
-	struct drm_gpu_scheduler *sched;
+	struct drm_gpu_scheduler *sched =
+		container_of(work, struct drm_gpu_scheduler, work_tdr.work);
+	enum drm_gpu_sched_stat status;
 	struct drm_sched_job *job;
-	enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_RESET;
-
-	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
 
 	/* Protects against concurrent deletion in drm_sched_get_finished_job */
 	spin_lock(&sched->job_list_lock);
 	job = list_first_entry_or_null(&sched->pending_list,
 				       struct drm_sched_job, list);
-
 	if (job) {
 		/*
 		 * Remove the bad job so it cannot be freed by a concurrent
@@ -575,23 +573,23 @@ static void drm_sched_job_timedout(struct work_struct *work)
 		 * cancelled, at which point it's safe.
 		 */
 		list_del_init(&job->list);
-		spin_unlock(&sched->job_list_lock);
+	}
+	spin_unlock(&sched->job_list_lock);
 
-		status = job->sched->ops->timedout_job(job);
+	if (!job)
+		return;
 
-		/*
-		 * Guilty job did complete and hence needs to be manually removed
-		 * See drm_sched_stop doc.
-		 */
-		if (sched->free_guilty) {
-			job->sched->ops->free_job(job);
-			sched->free_guilty = false;
-		}
+	status = job->sched->ops->timedout_job(job);
 
-		if (status == DRM_GPU_SCHED_STAT_NO_HANG)
-			drm_sched_job_reinsert_on_false_timeout(sched, job);
-	} else {
-		spin_unlock(&sched->job_list_lock);
+	/*
+	 * Guilty job did complete and hence needs to be manually removed. See
+	 * documentation for drm_sched_stop.
+	 */
+	if (sched->free_guilty) {
+		job->sched->ops->free_job(job);
+		sched->free_guilty = false;
+	} else if (status == DRM_GPU_SCHED_STAT_NO_HANG) {
+		drm_sched_job_reinsert_on_false_timeout(sched, job);
 	}
 
 	if (status != DRM_GPU_SCHED_STAT_ENODEV)
-- 
2.48.0

