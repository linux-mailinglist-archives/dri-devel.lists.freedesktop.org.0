Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122AFA4E061
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 15:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BDC10E5E3;
	Tue,  4 Mar 2025 14:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K3K9tKpm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFFC10E5E3
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 14:14:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1921BA45599;
 Tue,  4 Mar 2025 14:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7450C4CEEB;
 Tue,  4 Mar 2025 14:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741097650;
 bh=kUUHqPubu3Hi755v/SEctdBCsR+sFrtHh2SfYt9GoKI=;
 h=From:To:Cc:Subject:Date:From;
 b=K3K9tKpmE3BeEYu2AiwAQvhlAfNCEDVEO8RhmBVWswSS+t1BE7OYBhziYgs+KPQT9
 /xNIEbGh8EOUARZgqKsIhowQ4b12rlzUULnQBQUaZqD1QVF316Fe8XQOEw1/txaxX+
 rZGNfLC1wlYxybTii2bl6sEkD2ISXTYawlRsfmKvAeMrHvl+M9kmVVraVPCyKLhQLZ
 C4YL7XSOFR+U/xIBh+sg3M53q8yawXRvZGsE9R5O2YoXkOU3+mPMQIlcyACEV6y091
 86ZNAbY4oW0q8DEGp+aZrPX6v6D6ZUCZYZ32KabZHXQkUW3Px1vT2KOzjypv3vjaLB
 6uux/5+x8hsCA==
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
Subject: [PATCH v2] drm/sched: drm_sched_job_cleanup(): correct false doc
Date: Tue,  4 Mar 2025 15:13:47 +0100
Message-ID: <20250304141346.102683-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
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

drm_sched_job_cleanup()'s documentation claims that calling
drm_sched_job_arm() is a "point of no return", implying that afterwards
a job cannot be cancelled anymore.

This is not correct, as proven by the function's code itself, which
takes a previous call to drm_sched_job_arm() into account. In truth, the
decisive factors are whether fences have been shared (e.g., with other
processes) and if the job has been submitted to an entity already.

Correct the wrong docstring.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
Changes in v2:
  - Also adjust comment about arm inside function's body. (Tvrtko)
---
 drivers/gpu/drm/scheduler/sched_main.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index c634993f1346..7e71e89cea89 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1013,11 +1013,13 @@ EXPORT_SYMBOL(drm_sched_job_has_dependency);
  * Cleans up the resources allocated with drm_sched_job_init().
  *
  * Drivers should call this from their error unwind code if @job is aborted
- * before drm_sched_job_arm() is called.
+ * before it was submitted to an entity with drm_sched_entity_push_job().
  *
- * After that point of no return @job is committed to be executed by the
- * scheduler, and this function should be called from the
- * &drm_sched_backend_ops.free_job callback.
+ * Since calling drm_sched_job_arm() causes the job's fences to be initialized,
+ * it is up to the driver to ensure that fences that were exposed to external
+ * parties get signaled. drm_sched_job_cleanup() does not ensure this.
+ *
+ * This function must also be called in &struct drm_sched_backend_ops.free_job
  */
 void drm_sched_job_cleanup(struct drm_sched_job *job)
 {
@@ -1028,7 +1030,7 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
 		/* drm_sched_job_arm() has been called */
 		dma_fence_put(&job->s_fence->finished);
 	} else {
-		/* aborted job before committing to run it */
+		/* aborted job before arming */
 		drm_sched_fence_free(job->s_fence);
 	}
 
-- 
2.48.1

