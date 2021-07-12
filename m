Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C54EB3C6486
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 22:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C1F89DD8;
	Mon, 12 Jul 2021 20:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E6389DE3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 20:02:06 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id j34so12160918wms.5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 13:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mls2ejKErj4+c/cv4r8BLVM3Y5XNHv+hyokEAjrvlQQ=;
 b=TZF0hyBFpS1vsTqLrgPGXx7gHY9EIbAogXDEzNUpRcT0JYixUfW5rthX5zfAwDJu5q
 7jrhbmWGQQM+9v8amO0UFFXE5fVP/JD4bKN4X9eIAi+rvuR9AkHavMnQ5SqAKOAwpmgc
 teou2jLgAIwjwCjGTF6ThxN8EYw6U1ohO8bUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mls2ejKErj4+c/cv4r8BLVM3Y5XNHv+hyokEAjrvlQQ=;
 b=paLHKTrPHwCZZzFK25yifzXyRTpHsHPkvRkG2YQGjATRryx4IkLyQIFbbjuqvrpytf
 C/ofn+hN8dGRPaqdxizqH3KHVxdHrwHhGB8p6zmdvm8lPeznTDePdKWXWIxHicRxZ085
 8t68stJym0FI7St/o9WGK7GCDUGz39c9p/yVfgsUq4//fiHK0q+97LXDkc68jhGLJcrs
 33NYLEsdC7EGukCpA23xIi893+NyPisHhbODmkiu8SeW9LYgQCiH9+NqK90iU5oaNxX1
 9FijnZnhgqBmK0d5wDMHeqPz2Va13x2Mz8LqpdL2lIoRTNK6nKdAQUgVikBDrrY7+BLO
 7HsQ==
X-Gm-Message-State: AOAM5306936R/7G1Uk+cAYVWJN15evCgRwYkqdxMJ0tz36S/Uuc4ESdy
 6O2NC++jSx8QIKWqebnYyDfWcuaTI0dTEg==
X-Google-Smtp-Source: ABdhPJwdi7rBCrFLfTx5H3zKTMz97fhbVcwAliFAProEP+U0KEJaehupP6FshYX9s69rTZEs/LFbzA==
X-Received: by 2002:a05:600c:cb:: with SMTP id u11mr928206wmm.66.1626120125399; 
 Mon, 12 Jul 2021 13:02:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l14sm9858221wrs.22.2021.07.12.13.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 13:02:04 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 07/18] drm/lima: use scheduler dependency tracking
Date: Mon, 12 Jul 2021 19:53:41 +0200
Message-Id: <20210712175352.802687-8-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
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
Cc: lima@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, Qiang Yu <yuq825@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nothing special going on here.

Aside reviewing the code, it seems like drm_sched_job_arm() should be
moved into lima_sched_context_queue_task and put under some mutex
together with drm_sched_push_job(). See the kerneldoc for
drm_sched_push_job().

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Qiang Yu <yuq825@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: lima@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/gpu/drm/lima/lima_gem.c   |  4 ++--
 drivers/gpu/drm/lima/lima_sched.c | 21 ---------------------
 drivers/gpu/drm/lima/lima_sched.h |  3 ---
 3 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index c528f40981bb..e54a88d5037a 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -267,7 +267,7 @@ static int lima_gem_sync_bo(struct lima_sched_task *task, struct lima_bo *bo,
 	if (explicit)
 		return 0;
 
-	return drm_gem_fence_array_add_implicit(&task->deps, &bo->base.base, write);
+	return drm_sched_job_await_implicit(&task->base, &bo->base.base, write);
 }
 
 static int lima_gem_add_deps(struct drm_file *file, struct lima_submit *submit)
@@ -285,7 +285,7 @@ static int lima_gem_add_deps(struct drm_file *file, struct lima_submit *submit)
 		if (err)
 			return err;
 
-		err = drm_gem_fence_array_add(&submit->task->deps, fence);
+		err = drm_sched_job_await_fence(&submit->task->base, fence);
 		if (err) {
 			dma_fence_put(fence);
 			return err;
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index e968b5a8f0b0..99d5f6f1a882 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -134,24 +134,15 @@ int lima_sched_task_init(struct lima_sched_task *task,
 	task->num_bos = num_bos;
 	task->vm = lima_vm_get(vm);
 
-	xa_init_flags(&task->deps, XA_FLAGS_ALLOC);
-
 	return 0;
 }
 
 void lima_sched_task_fini(struct lima_sched_task *task)
 {
-	struct dma_fence *fence;
-	unsigned long index;
 	int i;
 
 	drm_sched_job_cleanup(&task->base);
 
-	xa_for_each(&task->deps, index, fence) {
-		dma_fence_put(fence);
-	}
-	xa_destroy(&task->deps);
-
 	if (task->bos) {
 		for (i = 0; i < task->num_bos; i++)
 			drm_gem_object_put(&task->bos[i]->base.base);
@@ -186,17 +177,6 @@ struct dma_fence *lima_sched_context_queue_task(struct lima_sched_task *task)
 	return fence;
 }
 
-static struct dma_fence *lima_sched_dependency(struct drm_sched_job *job,
-					       struct drm_sched_entity *entity)
-{
-	struct lima_sched_task *task = to_lima_task(job);
-
-	if (!xa_empty(&task->deps))
-		return xa_erase(&task->deps, task->last_dep++);
-
-	return NULL;
-}
-
 static int lima_pm_busy(struct lima_device *ldev)
 {
 	int ret;
@@ -472,7 +452,6 @@ static void lima_sched_free_job(struct drm_sched_job *job)
 }
 
 static const struct drm_sched_backend_ops lima_sched_ops = {
-	.dependency = lima_sched_dependency,
 	.run_job = lima_sched_run_job,
 	.timedout_job = lima_sched_timedout_job,
 	.free_job = lima_sched_free_job,
diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lima_sched.h
index ac70006b0e26..6a11764d87b3 100644
--- a/drivers/gpu/drm/lima/lima_sched.h
+++ b/drivers/gpu/drm/lima/lima_sched.h
@@ -23,9 +23,6 @@ struct lima_sched_task {
 	struct lima_vm *vm;
 	void *frame;
 
-	struct xarray deps;
-	unsigned long last_dep;
-
 	struct lima_bo **bos;
 	int num_bos;
 
-- 
2.32.0

