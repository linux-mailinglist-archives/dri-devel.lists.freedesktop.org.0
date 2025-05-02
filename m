Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9239AA7209
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 14:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2767E10E908;
	Fri,  2 May 2025 12:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hP+Egst8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2481810E8F4;
 Fri,  2 May 2025 12:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vnDTXACFSsJdnZxvl2grVKdl5UHiQMP+UlIlGTKO04A=; b=hP+Egst8RRN+UojJXcJXpz3q+z
 43mOdcDIp9FVcY/76FNHi5pKqKRS6NWLanaEm065tf71W4B6SovIYjG9UQrrxRv3btkC0RxP9A0Z7
 JCNV+AosPT+MQz5e5ATXd3J0OifANeeo7SAFJEXfESMU2vem8Z9mpgkxjduuzSQCW1R+G+0cJ3AQf
 FuGccjg+braaHUhgdIV4xZiW0M+NrFOxJhgIr4R2aR9Md8maAjSUasnIUqKUeSLXv107f9j6naE9y
 rdl+gLs4AHgbPElHOfAhf9wyGvQCxLadLh0M1qp2S/D9U6gMQWqxR2A0Iabj08W/mxanMmQNF51th
 QWL9MGaA==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uApYp-0025GB-Re; Fri, 02 May 2025 14:34:03 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [RFC 05/23] drm/sched: Consolidate drm_sched_job_timedout
Date: Fri,  2 May 2025 13:32:38 +0100
Message-ID: <20250502123256.50540-6-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250502123256.50540-1-tvrtko.ursulin@igalia.com>
References: <20250502123256.50540-1-tvrtko.ursulin@igalia.com>
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

Also fix one stale comment while touching the function.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 37 +++++++++++++-------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index d482ecc436d8..788d52547f2d 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -516,38 +516,37 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
 
 static void drm_sched_job_timedout(struct work_struct *work)
 {
-	struct drm_gpu_scheduler *sched;
+	struct drm_gpu_scheduler *sched =
+		container_of(work, struct drm_gpu_scheduler, work_tdr.work);
+	enum drm_gpu_sched_stat status;
 	struct drm_sched_job *job;
-	enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_NOMINAL;
-
-	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
 
 	/* Protects against concurrent deletion in drm_sched_get_finished_job */
 	spin_lock(&sched->job_list_lock);
 	job = list_first_entry_or_null(&sched->pending_list,
 				       struct drm_sched_job, list);
-
 	if (job) {
 		/*
 		 * Remove the bad job so it cannot be freed by concurrent
-		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
-		 * is parked at which point it's safe.
+		 * drm_sched_get_finished_job. It will be reinserted back after
+		 * scheduler worker is stopped at which point it's safe.
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
-	} else {
-		spin_unlock(&sched->job_list_lock);
+	status = job->sched->ops->timedout_job(job);
+
+	/*
+	 * Guilty job did complete and hence needs to be manually removed. See
+	 * documentation for drm_sched_stop.
+	 */
+	if (sched->free_guilty) {
+		job->sched->ops->free_job(job);
+		sched->free_guilty = false;
 	}
 
 	if (status != DRM_GPU_SCHED_STAT_ENODEV)
-- 
2.48.0

