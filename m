Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 493C3988090
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 10:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E4710EC7A;
	Fri, 27 Sep 2024 08:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="izGtNxyr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7722C10EC7A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 08:41:59 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-42cb6f3a5bcso22440125e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 01:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727426518; x=1728031318; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=yfL963GX4hn+9etH+Dw3PZf4XacBtknkoH+Zc75J+9U=;
 b=izGtNxyrP1F5lHrc7g9hr/+mpJ6X9HxebE8Mkbur6rS2mFJ3FusbahWDoCLdP1S9fj
 1+Sad6iDHhqsEWvTl725mwFxiVi5qKst7ST5wjysfr467uX3tfvGAdYo67g7tcIYfFJH
 tKNhmh8sFcdYT4igbeEQ/MihUcRd/snUOi9k4O5Sj+tlVXMBLKCLSnOeTYz2HshdglUa
 Mv9Uj965i9imxbUAEAdXGY4KTG1KiRILgihfq1Gm4+sUrXRK+nGIkD8rxg1guLGpCaGn
 Dh22G2eWwwImHPOj5ijygW+zsyZIlQ1An9zJ/WD4aEJilOyZJAXAfQ/G1oAnUKbk1bqm
 ETMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727426518; x=1728031318;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yfL963GX4hn+9etH+Dw3PZf4XacBtknkoH+Zc75J+9U=;
 b=svDv1t8n/foplgtyU5b+SS1AkeaeBaKbyuX5R7FM93BxOkJzO+E8WT8Jf+OJGMKvE0
 b1KPCuKKPxgiIj8n3dtBZ+V1myJ3d1DDKco3TQiclhjzgOirIkzzfVGweN5Cs5AX4+jb
 vkKsqSarqIQFE57a/tb8+YTOOHnxuHh4iITFKYKgXZNc6MiR/l5oKopgrHkz3enLdv2m
 z0wijcBw3NdQV2FqKx5HVrB2Io1kg4SRrqMOSCxSfR4PH3EFWYrOPcuAfhixheF0pDYj
 nGICtntIOUmINOORotjf7VpQlki/bSsUvavzQDDnfU3LiNelhESDnF4lCZ2gyCGL2I/n
 7aQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr7PZmStJUAmWWFE5g1+q6kljch+xXCQHfRJchAWnSBRenagAkOhZJCmQLXSJ6tAAQYpumhb91f3Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXqkjz7hNIPhFeMvLltdGINafIZm6PxMmoJqclDy00kuZjkPgb
 +swpuAfTwRbpf6rLp5v+r+Y50rnO05JLlk0ucOckLrvRkMTYltlQ
X-Google-Smtp-Source: AGHT+IE9J4Yz7rR1vqk4wpKDwrfqBMd5vYI8n8qK6UMnVF+1gzG+Bh6ctExNxaZTBHkPz8EsPHSssA==
X-Received: by 2002:a05:600c:5117:b0:42c:a8cb:6a5a with SMTP id
 5b1f17b1804b1-42f5844b9dcmr21342025e9.15.1727426517326; 
 Fri, 27 Sep 2024 01:41:57 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1515:2900:6181:3f3e:a0cc:be1a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f57de2e46sm19363415e9.19.2024.09.27.01.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 01:41:56 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: pstanner@redhat.com, dakr@kernel.org, ltuikov89@gmail.com,
 simona.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/sched: document drm_sched_fini requirements
Date: Fri, 27 Sep 2024 10:41:52 +0200
Message-Id: <20240927084153.18583-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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

Document the necessary steps which needs to be done before calling
drm_sched_fini().

Tearing down the scheduler with jobs still on the pending list can
lead to use after free issues. Add a warning if drivers try to
destroy a scheduler which still has work pushed to the HW.

When there are still entities with jobs the situation is even worse
since the dma_fences for those jobs can never signal we can just
choose between potentially locking up core memory management and
random memory corruption. When drivers really mess it up that well
let them run into a BUG() to prevent further damage.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 33 ++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index b5e9f657d829..2082cacada69 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1324,7 +1324,16 @@ EXPORT_SYMBOL(drm_sched_init);
  *
  * @sched: scheduler instance
  *
- * Tears down and cleans up the scheduler.
+ * Before calling this function all entities which potentially used this
+ * scheduler instance should be forced idle using drm_sched_entity_flush() and
+ * detached from their scheduler using drm_entity_fini().
+ *
+ * Special care must be taken if drivers allocate scheduler instances
+ * dynamically. Since the dma_fence signaling doesn't guarantee any processing
+ * order of callbacks it is possible that the scheduler is still cleaning up
+ * when fences have already signaled. The easiest way to avoid that is to keep a
+ * reference from the job to the scheduler and tear down the scheduler from a
+ * work item after the last job was cleaned up.
  */
 void drm_sched_fini(struct drm_gpu_scheduler *sched)
 {
@@ -1333,17 +1342,37 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 
 	drm_sched_wqueue_stop(sched);
 
+	/*
+	 * Tearing down the scheduler wile there are still unprocessed jobs can
+	 * lead to use after free issues in the scheduler fence.
+	 */
+	WARN_ON(!list_empty(&sched->pending_list));
+
 	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
 		struct drm_sched_rq *rq = sched->sched_rq[i];
 
 		spin_lock(&rq->lock);
-		list_for_each_entry(s_entity, &rq->entities, list)
+		list_for_each_entry(s_entity, &rq->entities, list) {
+			/*
+			 * The justification for this BUG() is that tearing
+			 * down the scheduler while jobs are pending leaves
+			 * dma_fences unsignaled. Since we have dependencies
+			 * from the core memory management to eventually signal
+			 * dma_fences this can lead to a system wide stop
+			 * because of a locked up memory management.
+			 */
+			if (spsc_queue_count(&s_entity->job_queue))
+				BUG();
+			else
+				WARN();
+
 			/*
 			 * Prevents reinsertion and marks job_queue as idle,
 			 * it will be removed from the rq in drm_sched_entity_fini()
 			 * eventually
 			 */
 			s_entity->stopped = true;
+		}
 		spin_unlock(&rq->lock);
 		kfree(sched->sched_rq[i]);
 	}
-- 
2.34.1

