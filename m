Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 204BFA39A1E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 12:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D8D10E2B9;
	Tue, 18 Feb 2025 11:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DGl1DWoD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9D210E2B9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 11:13:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6C9675C5DBD;
 Tue, 18 Feb 2025 11:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E7BC4CEED;
 Tue, 18 Feb 2025 11:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739877193;
 bh=ryBWSSH+vxnj25RO828aq+7FfD30J+Zn25JvG2s5aZM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DGl1DWoD4yPr9flUvAElnD7BmbAhxGOWSg2uq3MVvp5CfT2MjsIjogEjO9sV+eJrC
 d7YGG5zAfnsfMh3lB2crsOmzQWlJHnq7iBH6hzXGfKfcEiW/9GuqnNz7SUweysVnW7
 3FHDgLhzdvjkfkg0pkZN/AFrowBUTPv+CVVFWjUssENzGeJ4qPxlQ3ZN6ExyMFzAfs
 s+A95S81MDXoYn2ejkcKkpMLE8FZeNFU2u2j6f6/tNF6XuD3LvZuQC9bf3vu8ayIql
 abkX2haLB74Z2sTQIrMt8kspozJHxxN79yAOiL68J/os0GW0+rifzQbJmC9vL58YeG
 G8Hh6vpTWHsCw==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4 2/3] drm/sched: Adjust outdated docu for run_job()
Date: Tue, 18 Feb 2025 12:12:46 +0100
Message-ID: <20250218111246.108266-4-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250218111246.108266-2-phasta@kernel.org>
References: <20250218111246.108266-2-phasta@kernel.org>
MIME-Version: 1.0
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

The documentation for drm_sched_backend_ops.run_job() mentions a certain
function called drm_sched_job_recovery(). This function does not exist.
What's actually meant is drm_sched_resubmit_jobs(), which is by now also
deprecated.

Remove the mention of the removed function.

Discourage the behavior of drm_sched_backend_ops.run_job() being called
multiple times for the same job.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 include/drm/gpu_scheduler.h | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 916279b5aa00..3fc43c6dc405 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -421,20 +421,24 @@ struct drm_sched_backend_ops {
 
 	/**
 	 * @run_job: Called to execute the job once all of the dependencies
-	 * have been resolved. This may be called multiple times, if
-	 * timedout_job() has happened and drm_sched_job_recovery() decides to
-	 * try it again.
+	 * have been resolved.
+	 *
+	 * The deprecated drm_sched_resubmit_jobs() (called from
+	 * drm_sched_backend_ops.timedout_job()) can invoke this again with the
+	 * same parameters.
 	 *
 	 * @sched_job: the job to run
 	 *
-	 * Returns: dma_fence the driver must signal once the hardware has
-	 *	completed the job ("hardware fence").
-	 *
 	 * Note that the scheduler expects to 'inherit' its own reference to
 	 * this fence from the callback. It does not invoke an extra
 	 * dma_fence_get() on it. Consequently, this callback must take a
 	 * reference for the scheduler, and additional ones for the driver's
 	 * respective needs.
+	 *
+	 * Return:
+	 * * On success: dma_fence the driver must signal once the hardware has
+	 * completed the job ("hardware fence").
+	 * * On failure: NULL or an ERR_PTR.
 	 */
 	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
 
-- 
2.47.1

