Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC09CAA56FF
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 23:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3653710E05A;
	Wed, 30 Apr 2025 21:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="HSa56L30";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1300 seconds by postgrey-1.36 at gabe;
 Wed, 30 Apr 2025 21:28:45 UTC
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F70F10E05A
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 21:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TVgKImvOgQ5iXDXZfftce7xrDvSiDUF+zpUQsNobFrs=; b=HSa56L305mTrLVk+NvbMdZDA7R
 Wn9S5z2dVS/FPy8OyystdtzbCukxf8+wynrKyvE9Cw116i9otLsjKmC59kVNiWofYl6veVBnMlhDo
 L+j14T+45PWsqOhUB3k0cYNeYY2LYQtF8lqK1WJJCPId/svnpM/fa8n0bj/Le5cAnOnOECuptXHdU
 Sv1OL8euZ/lrOJUOpEMv+awEpL+iLwaifcKBqT79We2FNZfo1piHHE3JVgx02WGQntukKrRBY2lrR
 s76Oay7VIwBv6UY/LEev39LwH5s9L4qdJSypeH9UA0F5nPJxrP8RLKN0dKrVMCZjsSCqcDFTZV/QZ
 1aF3PP1Q==;
Received: from [189.7.87.174] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__CHACHA20_POLY1305:256)
 (Exim) id 1uAEcw-0016h9-4o; Wed, 30 Apr 2025 23:07:01 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, stable@vger.kernel.org,
 Daivik Bhatia <dtgs1208@gmail.com>
Subject: [PATCH v2] drm/v3d: Add job to pending list if the reset was skipped
Date: Wed, 30 Apr 2025 17:51:52 -0300
Message-ID: <20250430210643.57924-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.49.0
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

When a CL/CSD job times out, we check if the GPU has made any progress
since the last timeout. If so, instead of resetting the hardware, we skip
the reset and let the timer get rearmed. This gives long-running jobs a
chance to complete.

However, when `timedout_job()` is called, the job in question is removed
from the pending list, which means it won't be automatically freed through
`free_job()`. Consequently, when we skip the reset and keep the job
running, the job won't be freed when it finally completes.

This situation leads to a memory leak, as exposed in [1] and [2].

Similarly to commit 704d3d60fec4 ("drm/etnaviv: don't block scheduler when
GPU is still active"), this patch ensures the job is put back on the
pending list when extending the timeout.

Cc: stable@vger.kernel.org # 6.0
Reported-by: Daivik Bhatia <dtgs1208@gmail.com>
Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/12227 [1]
Closes: https://github.com/raspberrypi/linux/issues/6817 [2]
Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
---

Hi,

While we typically strive to avoid exposing the scheduler's internals
within the drivers, I'm proposing this fix as an interim solution. I'm aware
that a comprehensive fix will need some adjustments on the DRM sched side,
and I plan to address that soon.

However, it would be hard to justify the backport of such patches to the
stable branches and this issue is affecting users in the moment.
Therefore, I'd like to push this patch to drm-misc-fixes in order to
address this leak as soon as possible, while working in a more generic
solution.

Best Regards,
- Maíra

v1 -> v2: https://lore.kernel.org/dri-devel/20250427202907.94415-2-mcanal@igalia.com/

- Protect the pending list by using its spinlock.
- Add the URL of another downstream issue related to this patch. 

 drivers/gpu/drm/v3d/v3d_sched.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index b3be08b0ca91..c612363181df 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -734,11 +734,16 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
 	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
 
-/* If the current address or return address have changed, then the GPU
- * has probably made progress and we should delay the reset.  This
- * could fail if the GPU got in an infinite loop in the CL, but that
- * is pretty unlikely outside of an i-g-t testcase.
- */
+static void
+v3d_sched_skip_reset(struct drm_sched_job *sched_job)
+{
+	struct drm_gpu_scheduler *sched = sched_job->sched;
+
+	spin_lock(&sched->job_list_lock);
+	list_add(&sched_job->list, &sched->pending_list);
+	spin_unlock(&sched->job_list_lock);
+}
+
 static enum drm_gpu_sched_stat
 v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
 		    u32 *timedout_ctca, u32 *timedout_ctra)
@@ -748,9 +753,16 @@ v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
 	u32 ctca = V3D_CORE_READ(0, V3D_CLE_CTNCA(q));
 	u32 ctra = V3D_CORE_READ(0, V3D_CLE_CTNRA(q));
 
+	/* If the current address or return address have changed, then the GPU
+	 * has probably made progress and we should delay the reset. This
+	 * could fail if the GPU got in an infinite loop in the CL, but that
+	 * is pretty unlikely outside of an i-g-t testcase.
+	 */
 	if (*timedout_ctca != ctca || *timedout_ctra != ctra) {
 		*timedout_ctca = ctca;
 		*timedout_ctra = ctra;
+
+		v3d_sched_skip_reset(sched_job);
 		return DRM_GPU_SCHED_STAT_NOMINAL;
 	}
 
@@ -790,11 +802,13 @@ v3d_csd_job_timedout(struct drm_sched_job *sched_job)
 	struct v3d_dev *v3d = job->base.v3d;
 	u32 batches = V3D_CORE_READ(0, V3D_CSD_CURRENT_CFG4(v3d->ver));
 
-	/* If we've made progress, skip reset and let the timer get
-	 * rearmed.
+	/* If we've made progress, skip reset, add the job to the pending
+	 * list, and let the timer get rearmed.
 	 */
 	if (job->timedout_batches != batches) {
 		job->timedout_batches = batches;
+
+		v3d_sched_skip_reset(sched_job);
 		return DRM_GPU_SCHED_STAT_NOMINAL;
 	}
 
-- 
2.49.0

