Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF58F3B30B6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 16:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96716EBA3;
	Thu, 24 Jun 2021 14:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47966EB97
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:00:37 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id f15so6791868wro.8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 07:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s2oQX/0BIM0zO+Rg/hyReJ77FeRzMeKV5vGv//WVvTY=;
 b=CLLee9WLae/OmElTJziVaW2wE+nPW9lKoKhVfTxhtcNSS3irIs9mAKRqiu9nBO32r4
 iaPV5p9IuARbxfzXB3DA63DGXy2csJIJP4aJF0J7btWJUZcuMbSvsYh/q4XntKIHHmes
 6v6uwzWEj+l+YdZ9BTOxWSv/q6r+iZ6IqQUVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s2oQX/0BIM0zO+Rg/hyReJ77FeRzMeKV5vGv//WVvTY=;
 b=UvF+sAEFMKuDeh9tao5Sikj8sf+TMcUholvxgzW9Xd/Krsr/gZtukbyMWpPOcENNyp
 oxXlJFmt3V4xc4a7XPSmnJIK66MKRUHI55p4oyghuI0CF0cN4sHB7gkGpRrYHZKVafcF
 /gWMW+d+7MJg93FQru+3vkhkaj3xjljt1N7uWOQmk6/shkLs+0Wk5bX2U06XPJdThWFj
 oDSUawfIEiNML3WQaphFCu/buR+1RMyUooe2denRiELxej95VXy0qvYPctghkvbO6QDi
 uRnXS7hkK9/lwkTxBBzJMsZXwb6vh/i6SoO5a1QzOwS7A8AS2c4j91mTTSUb1iUmFH4X
 GlMA==
X-Gm-Message-State: AOAM533EARsuknAwi4Qx6IQTfTAZF3uIUWpPKp2o7W7UL09qLsthrRxb
 4HAQkyZS4eH7G7yTY5osx6cJNDEdmosJyA==
X-Google-Smtp-Source: ABdhPJzGVJSoaSx8kIWNbSIkvo9TJsUsXW7QnaeVz8Eq1/ZFfHLQGgZlaMTux8yn7pKi5SpKamEptg==
X-Received: by 2002:a5d:5181:: with SMTP id k1mr4524268wrv.415.1624543236497; 
 Thu, 24 Jun 2021 07:00:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p5sm3600167wrd.25.2021.06.24.07.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:00:36 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 05/11] drm/lima: use scheduler dependency tracking
Date: Thu, 24 Jun 2021 16:00:19 +0200
Message-Id: <20210624140025.438303-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
References: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nothing special going on here.

Aside reviewing the code, it seems like drm_sched_job_arm() should be
moved into lima_sched_context_queue_task and put under some mutex
together with drm_sched_push_job(). See the kerneldoc for
drm_sched_push_job().

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
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
index de7e71c42a69..c8d032429853 100644
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
2.32.0.rc2

