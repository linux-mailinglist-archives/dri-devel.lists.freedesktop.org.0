Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0B7A4FF80
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:06:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA0510E0E5;
	Wed,  5 Mar 2025 13:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oSAr/Q0p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B14A10E0E5
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 13:06:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A21805C68E6;
 Wed,  5 Mar 2025 13:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BABBC4CEEA;
 Wed,  5 Mar 2025 13:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741179965;
 bh=s9ST4+emcIcU6IvxekHRjVJTnRB1rgArxQeZs5dv/lA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oSAr/Q0pBfAR1NOqM9X7y8gIvBFuKdF4nPTlJcNTbHzobtgmuEOwOi/ppny0+5l9g
 VDVrQhHvm9iN1eJlJAGBKXuJ/eLHRBXzPCurdzfB1kl3KmsqaiCFahOr4crecf77jd
 61l9tvUQtuzrWKA1bCa9sFKYdKGal8dT2HnZIeLn/SrqalHOTOzjPhDHjv+36INNWR
 rJ2omCO271m+vNjC2MNAKGFuf10tECiMqhyoFd5Pns+Z8K5kRuttp40Fw/OfexdNc8
 /mAXeCzV14QDbWJuh32SXahw9muHUS85lqHURNrh9ppSeS14zwEqfHKMyrwLfxGmWL
 Bx7gUkfPIG43A==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/3] drm/sched: Adjust outdated docu for run_job()
Date: Wed,  5 Mar 2025 14:05:50 +0100
Message-ID: <20250305130551.136682-3-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305130551.136682-2-phasta@kernel.org>
References: <20250305130551.136682-2-phasta@kernel.org>
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

Furthermore, the scheduler expects to "inherit" a reference on the fence
from the run_job() callback. This, so far, is also not documented.

Remove the mention of the removed function.

Discourage the behavior of drm_sched_backend_ops.run_job() being called
multiple times for the same job.

Document the necessity of incrementing the refcount in run_job().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 include/drm/gpu_scheduler.h | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 50928a7ae98e..6381baae8024 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -410,10 +410,36 @@ struct drm_sched_backend_ops {
 					 struct drm_sched_entity *s_entity);
 
 	/**
-         * @run_job: Called to execute the job once all of the dependencies
-         * have been resolved.  This may be called multiple times, if
-	 * timedout_job() has happened and drm_sched_job_recovery()
-	 * decides to try it again.
+	 * @run_job: Called to execute the job once all of the dependencies
+	 * have been resolved.
+	 *
+	 * @sched_job: the job to run
+	 *
+	 * The deprecated drm_sched_resubmit_jobs() (called by &struct
+	 * drm_sched_backend_ops.timedout_job) can invoke this again with the
+	 * same parameters. Using this is discouraged because it violates
+	 * dma_fence rules, notably dma_fence_init() has to be called on
+	 * already initialized fences for a second time. Moreover, this is
+	 * dangerous because attempts to allocate memory might deadlock with
+	 * memory management code waiting for the reset to complete.
+	 *
+	 * TODO: Document what drivers should do / use instead.
+	 *
+	 * This method is called in a workqueue context - either from the
+	 * submit_wq the driver passed through drm_sched_init(), or, if the
+	 * driver passed NULL, a separate, ordered workqueue the scheduler
+	 * allocated.
+	 *
+	 * Note that the scheduler expects to 'inherit' its own reference to
+	 * this fence from the callback. It does not invoke an extra
+	 * dma_fence_get() on it. Consequently, this callback must take a
+	 * reference for the scheduler, and additional ones for the driver's
+	 * respective needs.
+	 *
+	 * Return:
+	 * * On success: dma_fence the driver must signal once the hardware has
+	 * completed the job ("hardware fence").
+	 * * On failure: NULL or an ERR_PTR.
 	 */
 	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
 
-- 
2.48.1

