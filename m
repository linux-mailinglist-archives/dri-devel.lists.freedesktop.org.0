Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA3FA41E14
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 13:01:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE42510E2A2;
	Mon, 24 Feb 2025 12:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O6dKQYHt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4C110E2A0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 12:01:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E6D90611B7;
 Mon, 24 Feb 2025 12:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC689C4CEE9;
 Mon, 24 Feb 2025 12:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740398485;
 bh=+Uxhx1xGTovyycqe8ouVh7sgRJBt25e6QRniKx2bUmQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O6dKQYHtxTePq/dRC+AezFipPw6sLMRD6Q+EXeAK3mGa+Dl4spUImaYLkOyvlk5hT
 /M0gApa3ssZjqKx5aATb+948bnu3Zse85Im7zcn8tzLNle/xwNki2j9QL8vnoX6umf
 8neRN0HFHAT+0bT/VXzQ+R7JagTetd0QHzESpjn48cI9SWMR/yWm9TloZ2UrKaB2Fl
 jBeqZfHbs3wIk7YJ1+SkEnkiuzGMDxul3ikhDzW0mT+2TkKCxBCzjrqiUqX5AfAmc8
 HU7+NAsAL9YQtnZ3zfB+HE04ZJcMoc++BnF6S6teGUvxOomOUQeDDdXi4tebCxRNdE
 /CG73GO7RSATw==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/3] drm/sched: Adjust outdated docu for run_job()
Date: Mon, 24 Feb 2025 13:01:03 +0100
Message-ID: <20250224120104.26211-3-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224120104.26211-2-phasta@kernel.org>
References: <20250224120104.26211-2-phasta@kernel.org>
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
 include/drm/gpu_scheduler.h | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 6bf458dbce84..5d0394f40aae 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -420,10 +420,33 @@ struct drm_sched_backend_ops {
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
+	 * The deprecated drm_sched_resubmit_jobs() (called by
+	 * &drm_sched_backend_ops.timedout_job) can invoke this again with the
+	 * same parameters. Using this is discouraged because it, presumably,
+	 * violates dma_fence rules.
+	 *
+	 * TODO: Document which fence rules above.
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

