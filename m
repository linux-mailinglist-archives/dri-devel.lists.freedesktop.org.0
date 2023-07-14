Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A78BD753501
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 10:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD3B10E82C;
	Fri, 14 Jul 2023 08:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81ABF10E836
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 08:31:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: linasend@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 477955BC41;
 Fri, 14 Jul 2023 08:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1689322906;
 bh=DL0HcpNnaq62QnwTFHu2+eWSTA+us8B0tZYj+4sZi9A=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=LY2skEBBhivIyGJs6j2I6//vYIBT9A6FegazsY5W1icthWJA0ZH01P5biTfimyZSl
 s1bzUnQsLSVfvbGMAh310XYK1riGjOyRWIUCXkjw0PJK3rT/DPl1WUwXdnR3p+Qxe2
 7DK7A3uHYdZ8tVDJ9eydZibGPE/rPQ12VLIYC7bgOXM4ehFdZw2h5u/N2tj14/Yedl
 l4FcyYZDnRJyWYtX3Pt5SfOI55elff60j+C5FIWdoONWPuxEZeWYLdD/DpkDQg7RPN
 ZjeHWL1n7a4srdMwNfNbbk1asXK2x/nIAEbtb7n76REtIF3ZBlTFfzHkbcn3me6QXF
 2Aa5UIqsXHkNw==
From: Asahi Lina <lina@asahilina.net>
Date: Fri, 14 Jul 2023 17:21:31 +0900
Subject: [PATCH 3/3] drm/scheduler: Clean up jobs when the scheduler is
 torn down.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230714-drm-sched-fixes-v1-3-c567249709f7@asahilina.net>
References: <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
In-Reply-To: <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
To: Luben Tuikov <luben.tuikov@amd.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689322891; l=2399;
 i=lina@asahilina.net; s=20230221; h=from:subject:message-id;
 bh=DL0HcpNnaq62QnwTFHu2+eWSTA+us8B0tZYj+4sZi9A=;
 b=r4JAZ5SsLR1ABJAGgswG/w06/9Z8YAtBlcxFJE2s82va4E4Ux6B2DLkVnNr2uuWp7xekQ2Unx
 sUgYVv6hvKyAFu70SDykSmPZ2Z+Wh9mz8X9Qu6GizGTOT+ZR4K8t0tB
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=Qn8jZuOtR1m5GaiDfTrAoQ4NE1XoYVZ/wmt5YtXWFC4=
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
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>,
 Asahi Lina <lina@asahilina.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_sched_fini() currently leaves any pending jobs dangling, which
causes segfaults and other badness when job completion fences are
signaled after the scheduler is torn down.

Explicitly detach all jobs from their completion callbacks and free
them. This makes it possible to write a sensible safe abstraction for
drm_sched, without having to externally duplicate the tracking of
in-flight jobs.

This shouldn't regress any existing drivers, since calling
drm_sched_fini() with any pending jobs is broken and this change should
be a no-op if there are no pending jobs.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 drivers/gpu/drm/scheduler/sched_main.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 1f3bc3606239..a4da4aac0efd 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1186,10 +1186,38 @@ EXPORT_SYMBOL(drm_sched_init);
 void drm_sched_fini(struct drm_gpu_scheduler *sched)
 {
 	struct drm_sched_entity *s_entity;
+	struct drm_sched_job *s_job, *tmp;
 	int i;
 
-	if (sched->thread)
-		kthread_stop(sched->thread);
+	if (!sched->thread)
+		return;
+
+	/*
+	 * Stop the scheduler, detaching all jobs from their hardware callbacks
+	 * and cleaning up complete jobs.
+	 */
+	drm_sched_stop(sched, NULL);
+
+	/*
+	 * Iterate through the pending job list and free all jobs.
+	 * This assumes the driver has either guaranteed jobs are already stopped, or that
+	 * otherwise it is responsible for keeping any necessary data structures for
+	 * in-progress jobs alive even when the free_job() callback is called early (e.g. by
+	 * putting them in its own queue or doing its own refcounting).
+	 */
+	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
+		spin_lock(&sched->job_list_lock);
+		list_del_init(&s_job->list);
+		spin_unlock(&sched->job_list_lock);
+
+		dma_fence_set_error(&s_job->s_fence->finished, -ESRCH);
+		drm_sched_fence_finished(s_job->s_fence);
+
+		WARN_ON(s_job->s_fence->parent);
+		sched->ops->free_job(s_job);
+	}
+
+	kthread_stop(sched->thread);
 
 	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
 		struct drm_sched_rq *rq = &sched->sched_rq[i];

-- 
2.40.1

