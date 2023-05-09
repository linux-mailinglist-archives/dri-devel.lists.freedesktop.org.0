Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BFF6FCF7F
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 22:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B9010E3CC;
	Tue,  9 May 2023 20:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FBB10E3CC;
 Tue,  9 May 2023 20:30:46 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-64359d9c531so4794624b3a.3; 
 Tue, 09 May 2023 13:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683664245; x=1686256245;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q12a5WAfbjE9tI2h9PcKYehgmQ2VIuui/JVi4STZnFM=;
 b=TiyGvRVlKc2lRSa5ZO/dIelreRCeOR7friP4DKkQISR6S3JHHW9R233VhYOQ7PyyYx
 rhKy7PGBmN1k9FQXVgvp8ZVUmNXWdVHYKafzSnlPVWhly6lFuonItSi+x2evVxnmbBUE
 pp9dcAxcsc60Drkxcb7ud/HrucKighPBo+pWUi00mWF/ots3r8HMwUVpz/0zzuZTOE85
 TJw3z6eGGJDGqjVjbZqLtVrHHB/amzBAxsWeStDq1brOFl5wU5/f/P0Y8SrLutQulFQX
 MpEODxRlrF0805XGiF0On7JOOki6lFWMgmE9KvaSSnlUdMr1tFKNTQLUSStH6bIf1+ak
 svog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683664245; x=1686256245;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q12a5WAfbjE9tI2h9PcKYehgmQ2VIuui/JVi4STZnFM=;
 b=RYNgiIEcx6meqi5aMHHh6WwF+GEJN1fdbtwDoiCQLkN7XgQwNBIxPKErN6fdB3hJWC
 0k3IGofs7jHF8XBt7E2LQXJPoqwRpoZJjlN4ymZqFMA+fBsQeaJxf0wJGzYqwo4msvFz
 RiGYcJMtOhUxxtSwHlZM51V08bNJu2VX/asK1mzAwVB7+CtFGPBa4W9Pwhq87T0JBQK2
 r0K8BZUhPYjq08gS63HHaWnEj3vKq65JloTFiKm1soh+A3BJuUFNkIdGpC63EvZJ0gsx
 QToY027YIrr8l7fcYJEUncLD0jg3WrpGkSn8JaHqZ6hSaIkpN5hjx+JXy8O8+P36tDXz
 /Www==
X-Gm-Message-State: AC+VfDxVpVqPkrCmKec1MVleNBs6r4A0fGVsWn9x2OHiLhTpinef/vYD
 xf7L8L2soP1ZVY26I/dKyMN/tHhNtDg=
X-Google-Smtp-Source: ACHHUZ77EKns869ZjZdNydQB7QDHos3f3dAgAlTjEC1RUVhm1f8GZ1v+WcQUl6K/L6lHLkzHUFA3hg==
X-Received: by 2002:a17:902:d2c6:b0:1ab:16e0:ef49 with SMTP id
 n6-20020a170902d2c600b001ab16e0ef49mr18761259plc.24.1683664244752; 
 Tue, 09 May 2023 13:30:44 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a170902684c00b001ac69bdc9d1sm2051939pln.156.2023.05.09.13.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 13:30:44 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4] drm/msm: Fix submit error-path leaks
Date: Tue,  9 May 2023 13:30:41 -0700
Message-Id: <20230509203041.440619-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, pinkperfect2021@gmail.com,
 Sean Paul <sean@poorly.run>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

For errors after msm_submitqueue_get(), we need to drop the submitqueue
reference.  Additionally after get_unused_fd() we need to drop the fd.
The ordering for dropping the queue lock and put_unused_fd() is not
important, so just move this all into out_post_unlock.

v2: Only drop queue ref if submit doesn't take it
v3: Fix unitialized submit ref in error path
v4: IS_ERR_OR_NULL()

Reported-by: pinkperfect2021@gmail.com
Fixes: f0de40a131d9 drm/msm: ("Reorder lock vs submit alloc")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 6c6aefaa72be..8a3c9246ebf7 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -720,21 +720,21 @@ static void msm_process_post_deps(struct msm_submit_post_dep *post_deps,
 		}
 	}
 }
 
 int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_msm_gem_submit *args = data;
 	struct msm_file_private *ctx = file->driver_priv;
-	struct msm_gem_submit *submit;
+	struct msm_gem_submit *submit = NULL;
 	struct msm_gpu *gpu = priv->gpu;
 	struct msm_gpu_submitqueue *queue;
 	struct msm_ringbuffer *ring;
 	struct msm_submit_post_dep *post_deps = NULL;
 	struct drm_syncobj **syncobjs_to_reset = NULL;
 	int out_fence_fd = -1;
 	bool has_ww_ticket = false;
 	unsigned i;
 	int ret;
 
@@ -767,27 +767,29 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	queue = msm_submitqueue_get(ctx, args->queueid);
 	if (!queue)
 		return -ENOENT;
 
 	ring = gpu->rb[queue->ring_nr];
 
 	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
 		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
 		if (out_fence_fd < 0) {
 			ret = out_fence_fd;
-			return ret;
+			goto out_post_unlock;
 		}
 	}
 
 	submit = submit_create(dev, gpu, queue, args->nr_bos, args->nr_cmds);
-	if (IS_ERR(submit))
-		return PTR_ERR(submit);
+	if (IS_ERR(submit)) {
+		ret = PTR_ERR(submit);
+		goto out_post_unlock;
+	}
 
 	trace_msm_gpu_submit(pid_nr(submit->pid), ring->id, submit->ident,
 		args->nr_bos, args->nr_cmds);
 
 	ret = mutex_lock_interruptible(&queue->lock);
 	if (ret)
 		goto out_post_unlock;
 
 	if (args->flags & MSM_SUBMIT_SUDO)
 		submit->in_rb = true;
@@ -962,25 +964,34 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	msm_reset_syncobjs(syncobjs_to_reset, args->nr_in_syncobjs);
 	msm_process_post_deps(post_deps, args->nr_out_syncobjs,
 	                      submit->user_fence);
 
 
 out:
 	submit_cleanup(submit, !!ret);
 	if (has_ww_ticket)
 		ww_acquire_fini(&submit->ticket);
 out_unlock:
-	if (ret && (out_fence_fd >= 0))
-		put_unused_fd(out_fence_fd);
 	mutex_unlock(&queue->lock);
 out_post_unlock:
-	msm_gem_submit_put(submit);
+	if (ret && (out_fence_fd >= 0))
+		put_unused_fd(out_fence_fd);
+
+	if (!IS_ERR_OR_NULL(submit)) {
+		msm_gem_submit_put(submit);
+	} else {
+		/*
+		 * If the submit hasn't yet taken ownership of the queue
+		 * then we need to drop the reference ourself:
+		 */
+		msm_submitqueue_put(queue);
+	}
 	if (!IS_ERR_OR_NULL(post_deps)) {
 		for (i = 0; i < args->nr_out_syncobjs; ++i) {
 			kfree(post_deps[i].chain);
 			drm_syncobj_put(post_deps[i].syncobj);
 		}
 		kfree(post_deps);
 	}
 
 	if (!IS_ERR_OR_NULL(syncobjs_to_reset)) {
 		for (i = 0; i < args->nr_in_syncobjs; ++i) {
-- 
2.40.1

