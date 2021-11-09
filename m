Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A83044B265
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 19:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B503689BF1;
	Tue,  9 Nov 2021 18:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C09A89BE8;
 Tue,  9 Nov 2021 18:06:33 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id t21so22375092plr.6;
 Tue, 09 Nov 2021 10:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3tZ1S04C4EAQ5XxmojtM0aVw3lWi2dwz1Lbk9kzWLGo=;
 b=PZ3sj4/oxFqGhgxbsDcGdaMcClt1Kwgo1H92HL78/yiW5pOnE2WcQ7B2MHmiUAPgp/
 DFfMbLeJWHDRlqU+mNoILtC42xloQT9g6fyYID/dJHYdR+gf8fvZax53ap7q7AmI+PwF
 /ra0x3kweMPN+lUiNJlRautKAMmzjgWkEWUluie4pzOVER5koyJbHqBO6oEd0//X/D1l
 vK31BncSb66UYw1XcmbgPCf4lQCTYYHls7bvFgbgaXx4RHSA4zq7ZkFKOyFZOFz7iQFq
 asyaYqoGqvC6bbVKXBECj6Op2GrbrIKn6uAl0f8LzvnIAUsyJlJoFuqsr65BMIymlywo
 pTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3tZ1S04C4EAQ5XxmojtM0aVw3lWi2dwz1Lbk9kzWLGo=;
 b=19rUbKB0feFOcvw6xkUoKCB9IKR/XUDADZ7key7wULX1pqP51DIyDw8WAgoi7JRwQ8
 44FS+qwiWviSRLsSID6nGat4Qmt6RV35RP7rQsGjEXhmbxDsNNiP9TcZH+Gy42XV6hsn
 shVBUTtKqbHftTjLU0DanueM+vZ8zf4gLq+JGwVsLp2tnIsf/dy/SkZjVXIN79GhhTPU
 ZOYHJtG8hueYBlk/Fim6R0mqOBYlt2n08Pyb3/ioaFPGTta00FQY1nIC0TvXmunL0M1j
 M7DamNzzY58DokXVPkIBgmdaJjXYKctBLQdHkJiNf6PvhEYnjxXmMiiHFWMwy4IVbbuR
 Xm1g==
X-Gm-Message-State: AOAM530yjwRw7RZoYgDGLrgDFhqEYo4h7vicyp9lE/grJzO6fpCf77X7
 kMElq2hJ1l2duh4OgPRb1df+OTcxkv0=
X-Google-Smtp-Source: ABdhPJwQH5scEQJYsC+Dj9cUavd/1wStMxCxDcLB7iZnLD4iXwRmT28GvR5I8lkVf+60G5hb10Gm8Q==
X-Received: by 2002:a17:90a:9907:: with SMTP id
 b7mr6180580pjp.137.1636481192253; 
 Tue, 09 Nov 2021 10:06:32 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 b19sm7326190pfv.63.2021.11.09.10.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 10:06:30 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/msm: Remove struct_mutex usage
Date: Tue,  9 Nov 2021 10:11:03 -0800
Message-Id: <20211109181117.591148-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211109181117.591148-1-robdclark@gmail.com>
References: <20211109181117.591148-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Deepak R Varma <mh12gx2825@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The remaining struct_mutex usage is just to serialize various gpu
related things (submit/retire/recover/fault/etc), so replace
struct_mutex with gpu->lock.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c  |  4 ++--
 drivers/gpu/drm/msm/adreno/adreno_device.c |  4 ++--
 drivers/gpu/drm/msm/msm_debugfs.c          | 12 ++++++------
 drivers/gpu/drm/msm/msm_gpu.c              | 14 +++++++-------
 drivers/gpu/drm/msm/msm_gpu.h              | 20 +++++++++++++++-----
 drivers/gpu/drm/msm/msm_perf.c             |  9 ++++++---
 drivers/gpu/drm/msm/msm_rd.c               | 16 +++++++++-------
 drivers/gpu/drm/msm/msm_ringbuffer.c       |  4 ++--
 8 files changed, 49 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
index dd593ec2bc56..6bd397a85834 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
@@ -107,7 +107,7 @@ reset_set(void *data, u64 val)
 	 * try to reset an active GPU.
 	 */
 
-	mutex_lock(&dev->struct_mutex);
+	mutex_lock(&gpu->lock);
 
 	release_firmware(adreno_gpu->fw[ADRENO_FW_PM4]);
 	adreno_gpu->fw[ADRENO_FW_PM4] = NULL;
@@ -133,7 +133,7 @@ reset_set(void *data, u64 val)
 	gpu->funcs->recover(gpu);
 
 	pm_runtime_put_sync(&gpu->pdev->dev);
-	mutex_unlock(&dev->struct_mutex);
+	mutex_unlock(&gpu->lock);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 2a6ce76656aa..9e01ccc800a6 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -408,9 +408,9 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
 		return NULL;
 	}
 
-	mutex_lock(&dev->struct_mutex);
+	mutex_lock(&gpu->lock);
 	ret = msm_gpu_hw_init(gpu);
-	mutex_unlock(&dev->struct_mutex);
+	mutex_unlock(&gpu->lock);
 	pm_runtime_put_autosuspend(&pdev->dev);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "gpu hw init failed: %d\n", ret);
diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 698e86f5b960..6a99e8b5d25d 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -29,14 +29,14 @@ static int msm_gpu_show(struct seq_file *m, void *arg)
 	struct msm_gpu *gpu = priv->gpu;
 	int ret;
 
-	ret = mutex_lock_interruptible(&show_priv->dev->struct_mutex);
+	ret = mutex_lock_interruptible(&gpu->lock);
 	if (ret)
 		return ret;
 
 	drm_printf(&p, "%s Status:\n", gpu->name);
 	gpu->funcs->show(gpu, show_priv->state, &p);
 
-	mutex_unlock(&show_priv->dev->struct_mutex);
+	mutex_unlock(&gpu->lock);
 
 	return 0;
 }
@@ -48,9 +48,9 @@ static int msm_gpu_release(struct inode *inode, struct file *file)
 	struct msm_drm_private *priv = show_priv->dev->dev_private;
 	struct msm_gpu *gpu = priv->gpu;
 
-	mutex_lock(&show_priv->dev->struct_mutex);
+	mutex_lock(&gpu->lock);
 	gpu->funcs->gpu_state_put(show_priv->state);
-	mutex_unlock(&show_priv->dev->struct_mutex);
+	mutex_unlock(&gpu->lock);
 
 	kfree(show_priv);
 
@@ -72,7 +72,7 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
 	if (!show_priv)
 		return -ENOMEM;
 
-	ret = mutex_lock_interruptible(&dev->struct_mutex);
+	ret = mutex_lock_interruptible(&gpu->lock);
 	if (ret)
 		goto free_priv;
 
@@ -81,7 +81,7 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
 	show_priv->state = gpu->funcs->gpu_state_get(gpu);
 	pm_runtime_put_sync(&gpu->pdev->dev);
 
-	mutex_unlock(&dev->struct_mutex);
+	mutex_unlock(&gpu->lock);
 
 	if (IS_ERR(show_priv->state)) {
 		ret = PTR_ERR(show_priv->state);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 3dfc58e6498f..13de1241d595 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -150,7 +150,7 @@ int msm_gpu_hw_init(struct msm_gpu *gpu)
 {
 	int ret;
 
-	WARN_ON(!mutex_is_locked(&gpu->dev->struct_mutex));
+	WARN_ON(!mutex_is_locked(&gpu->lock));
 
 	if (!gpu->needs_hw_init)
 		return 0;
@@ -361,7 +361,7 @@ static void recover_worker(struct kthread_work *work)
 	char *comm = NULL, *cmd = NULL;
 	int i;
 
-	mutex_lock(&dev->struct_mutex);
+	mutex_lock(&gpu->lock);
 
 	DRM_DEV_ERROR(dev->dev, "%s: hangcheck recover!\n", gpu->name);
 
@@ -442,7 +442,7 @@ static void recover_worker(struct kthread_work *work)
 		}
 	}
 
-	mutex_unlock(&dev->struct_mutex);
+	mutex_unlock(&gpu->lock);
 
 	msm_gpu_retire(gpu);
 }
@@ -450,12 +450,11 @@ static void recover_worker(struct kthread_work *work)
 static void fault_worker(struct kthread_work *work)
 {
 	struct msm_gpu *gpu = container_of(work, struct msm_gpu, fault_work);
-	struct drm_device *dev = gpu->dev;
 	struct msm_gem_submit *submit;
 	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
 	char *comm = NULL, *cmd = NULL;
 
-	mutex_lock(&dev->struct_mutex);
+	mutex_lock(&gpu->lock);
 
 	submit = find_submit(cur_ring, cur_ring->memptrs->fence + 1);
 	if (submit && submit->fault_dumped)
@@ -490,7 +489,7 @@ static void fault_worker(struct kthread_work *work)
 	memset(&gpu->fault_info, 0, sizeof(gpu->fault_info));
 	gpu->aspace->mmu->funcs->resume_translation(gpu->aspace->mmu);
 
-	mutex_unlock(&dev->struct_mutex);
+	mutex_unlock(&gpu->lock);
 }
 
 static void hangcheck_timer_reset(struct msm_gpu *gpu)
@@ -733,7 +732,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned long flags;
 
-	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
+	WARN_ON(!mutex_is_locked(&gpu->lock));
 
 	pm_runtime_get_sync(&gpu->pdev->dev);
 
@@ -848,6 +847,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	INIT_LIST_HEAD(&gpu->active_list);
 	mutex_init(&gpu->active_lock);
+	mutex_init(&gpu->lock);
 	kthread_init_work(&gpu->retire_work, retire_worker);
 	kthread_init_work(&gpu->recover_work, recover_worker);
 	kthread_init_work(&gpu->fault_work, fault_worker);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 623ee416c568..0dcc31c27ac3 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -161,13 +161,23 @@ struct msm_gpu {
 	 */
 	struct list_head active_list;
 
+	/**
+	 * lock:
+	 *
+	 * General lock for serializing all the gpu things.
+	 *
+	 * TODO move to per-ring locking where feasible (ie. submit/retire
+	 * path, etc)
+	 */
+	struct mutex lock;
+
 	/**
 	 * active_submits:
 	 *
 	 * The number of submitted but not yet retired submits, used to
 	 * determine transitions between active and idle.
 	 *
-	 * Protected by lock
+	 * Protected by active_lock
 	 */
 	int active_submits;
 
@@ -541,28 +551,28 @@ static inline struct msm_gpu_state *msm_gpu_crashstate_get(struct msm_gpu *gpu)
 {
 	struct msm_gpu_state *state = NULL;
 
-	mutex_lock(&gpu->dev->struct_mutex);
+	mutex_lock(&gpu->lock);
 
 	if (gpu->crashstate) {
 		kref_get(&gpu->crashstate->ref);
 		state = gpu->crashstate;
 	}
 
-	mutex_unlock(&gpu->dev->struct_mutex);
+	mutex_unlock(&gpu->lock);
 
 	return state;
 }
 
 static inline void msm_gpu_crashstate_put(struct msm_gpu *gpu)
 {
-	mutex_lock(&gpu->dev->struct_mutex);
+	mutex_lock(&gpu->lock);
 
 	if (gpu->crashstate) {
 		if (gpu->funcs->gpu_state_put(gpu->crashstate))
 			gpu->crashstate = NULL;
 	}
 
-	mutex_unlock(&gpu->dev->struct_mutex);
+	mutex_unlock(&gpu->lock);
 }
 
 /*
diff --git a/drivers/gpu/drm/msm/msm_perf.c b/drivers/gpu/drm/msm/msm_perf.c
index 3a27153eef08..3d3da79fec2a 100644
--- a/drivers/gpu/drm/msm/msm_perf.c
+++ b/drivers/gpu/drm/msm/msm_perf.c
@@ -155,9 +155,12 @@ static int perf_open(struct inode *inode, struct file *file)
 	struct msm_gpu *gpu = priv->gpu;
 	int ret = 0;
 
-	mutex_lock(&dev->struct_mutex);
+	if (!gpu)
+		return -ENODEV;
 
-	if (perf->open || !gpu) {
+	mutex_lock(&gpu->lock);
+
+	if (perf->open) {
 		ret = -EBUSY;
 		goto out;
 	}
@@ -171,7 +174,7 @@ static int perf_open(struct inode *inode, struct file *file)
 	perf->next_jiffies = jiffies + SAMPLE_TIME;
 
 out:
-	mutex_unlock(&dev->struct_mutex);
+	mutex_unlock(&gpu->lock);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index b55398a34fa4..81432ec07012 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -86,7 +86,7 @@ struct msm_rd_state {
 	struct msm_gem_submit *submit;
 
 	/* fifo access is synchronized on the producer side by
-	 * struct_mutex held by submit code (otherwise we could
+	 * gpu->lock held by submit code (otherwise we could
 	 * end up w/ cmds logged in different order than they
 	 * were executed).  And read_lock synchronizes the reads
 	 */
@@ -181,9 +181,12 @@ static int rd_open(struct inode *inode, struct file *file)
 	uint32_t gpu_id;
 	int ret = 0;
 
-	mutex_lock(&dev->struct_mutex);
+	if (!gpu)
+		return -ENODEV;
 
-	if (rd->open || !gpu) {
+	mutex_lock(&gpu->lock);
+
+	if (rd->open) {
 		ret = -EBUSY;
 		goto out;
 	}
@@ -200,7 +203,7 @@ static int rd_open(struct inode *inode, struct file *file)
 	rd_write_section(rd, RD_GPU_ID, &gpu_id, sizeof(gpu_id));
 
 out:
-	mutex_unlock(&dev->struct_mutex);
+	mutex_unlock(&gpu->lock);
 	return ret;
 }
 
@@ -340,11 +343,10 @@ static void snapshot_buf(struct msm_rd_state *rd,
 	msm_gem_unlock(&obj->base);
 }
 
-/* called under struct_mutex */
+/* called under gpu->lock */
 void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 		const char *fmt, ...)
 {
-	struct drm_device *dev = submit->dev;
 	struct task_struct *task;
 	char msg[256];
 	int i, n;
@@ -355,7 +357,7 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 	/* writing into fifo is serialized by caller, and
 	 * rd->read_lock is used to serialize the reads
 	 */
-	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
+	WARN_ON(!mutex_is_locked(&submit->gpu->lock));
 
 	if (fmt) {
 		va_list args;
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index bd54c1412649..a2314b75962f 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -32,11 +32,11 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 	pm_runtime_get_sync(&gpu->pdev->dev);
 
 	/* TODO move submit path over to using a per-ring lock.. */
-	mutex_lock(&gpu->dev->struct_mutex);
+	mutex_lock(&gpu->lock);
 
 	msm_gpu_submit(gpu, submit);
 
-	mutex_unlock(&gpu->dev->struct_mutex);
+	mutex_unlock(&gpu->lock);
 
 	pm_runtime_put(&gpu->pdev->dev);
 
-- 
2.31.1

