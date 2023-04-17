Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AC46E5173
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 22:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B5710E5B5;
	Mon, 17 Apr 2023 20:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED7310E5C1;
 Mon, 17 Apr 2023 20:12:24 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id lh8so14162389plb.1;
 Mon, 17 Apr 2023 13:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681762343; x=1684354343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tG6YslYBKkuazr2dWr4ftni9ZweXIehBqMaA0S88C5g=;
 b=ranf+f0tP4Pb5Lh3n2WP/yUu2QmlnNs1+iNecDfUR5KzPGDF2bZRgZqk1mWXpHnHt5
 LvjFfEz45tozCyPEEtQjKkO8d/GjRWICY4Hv4JwW6qTQHxWO9CZfLaHGX8p2r4CW9gPn
 jMzksiwIj2fJfm/8vwU20S8sWgres5UTA5RA7TWq47jF1gyXHpo9quj4zTNbN3BzCa/u
 opUoVSqp96ZbME/+aQRIHHBrCgoRQ4uAp9Giig/8md+Q4eWVzwdTzUdpfQWjKL0hFWnn
 Vc3VUfTXzlPtTiL1SdnAxgrtE/Cl2UhuPJaDPjJVqT9V/wnujeoXWsWJHFu7pNrDbT3C
 VwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681762343; x=1684354343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tG6YslYBKkuazr2dWr4ftni9ZweXIehBqMaA0S88C5g=;
 b=k6Nd4Mn/FCn+ogVWQhOpQb8kSJ8f8u08AViAsDKVdPYWV2QDPaJsiQNHzhxxGgc2KQ
 qpXH+E6tkMxelkmojv2ACkK+ppUGIIgY6DR6KemO3X5ehsd0htQSOf0RSFqzKjuwag+Q
 mFc6PqQPVXqF4TSJcFyAbOj+hB6g88rZuIQFbXIV7DP+W7qe5mlQ8+zF4ozmSsDWmvoN
 4Ba82VIMaNBhtOo6tItWVtp7Dfmz3zf/Sx3QHYsmJd6jDyN+uZ6XtTRLzXDsAAIFXIiY
 hlJNLlxt5Wttv/EaMbc723ubF+If6Vq+LvLaoqu+jTXcw3vREyvjcDzBXbvpu4uPbCkv
 OB3g==
X-Gm-Message-State: AAQBX9dXGXgrgXgZrz7ZorA1GnoA98B+rrCZQfsWVxTKJKuO2H84SRC0
 Q8ZF3s/1ZhqvNBVo7FlNeZpsS+wtbbs=
X-Google-Smtp-Source: AKy350Z897P0ebUOEGMZ5BJSTsfQqtu+SrNiRCFFaWIYGgI+O1qDjfMdnTtEGHt9vqVAg5JBSzDliQ==
X-Received: by 2002:a17:902:82c5:b0:1a1:b11d:6af5 with SMTP id
 u5-20020a17090282c500b001a1b11d6af5mr76812plz.52.1681762343629; 
 Mon, 17 Apr 2023 13:12:23 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm8094636plq.293.2023.04.17.13.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 13:12:23 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 2/3] drm/msm: Rework get_comm_cmdline() helper
Date: Mon, 17 Apr 2023 13:12:11 -0700
Message-Id: <20230417201215.448099-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417201215.448099-1-robdclark@gmail.com>
References: <20230417201215.448099-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Make it work in terms of ctx so that it can be re-used for fdinfo.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 ++--
 drivers/gpu/drm/msm/msm_drv.c           |  2 ++
 drivers/gpu/drm/msm/msm_gpu.c           | 13 ++++++-------
 drivers/gpu/drm/msm/msm_gpu.h           | 12 ++++++++++--
 drivers/gpu/drm/msm/msm_submitqueue.c   |  1 +
 5 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index bb38e728864d..43c4e1fea83f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -412,7 +412,7 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		/* Ensure string is null terminated: */
 		str[len] = '\0';
 
-		mutex_lock(&gpu->lock);
+		mutex_lock(&ctx->lock);
 
 		if (param == MSM_PARAM_COMM) {
 			paramp = &ctx->comm;
@@ -423,7 +423,7 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		kfree(*paramp);
 		*paramp = str;
 
-		mutex_unlock(&gpu->lock);
+		mutex_unlock(&ctx->lock);
 
 		return 0;
 	}
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 3d73b98d6a9c..ca0e89e46e13 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -581,6 +581,8 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 	rwlock_init(&ctx->queuelock);
 
 	kref_init(&ctx->ref);
+	ctx->pid = get_pid(task_pid(current));
+	mutex_init(&ctx->lock);
 	msm_submitqueue_init(dev, ctx);
 
 	ctx->aspace = msm_gpu_create_private_address_space(priv->gpu, current);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index c403912d13ab..f0f4f845c32d 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -327,18 +327,17 @@ find_submit(struct msm_ringbuffer *ring, uint32_t fence)
 
 static void retire_submits(struct msm_gpu *gpu);
 
-static void get_comm_cmdline(struct msm_gem_submit *submit, char **comm, char **cmd)
+static void get_comm_cmdline(struct msm_file_private *ctx, char **comm, char **cmd)
 {
-	struct msm_file_private *ctx = submit->queue->ctx;
 	struct task_struct *task;
 
-	WARN_ON(!mutex_is_locked(&submit->gpu->lock));
-
 	/* Note that kstrdup will return NULL if argument is NULL: */
+	mutex_lock(&ctx->lock);
 	*comm = kstrdup(ctx->comm, GFP_KERNEL);
 	*cmd  = kstrdup(ctx->cmdline, GFP_KERNEL);
+	mutex_unlock(&ctx->lock);
 
-	task = get_pid_task(submit->pid, PIDTYPE_PID);
+	task = get_pid_task(ctx->pid, PIDTYPE_PID);
 	if (!task)
 		return;
 
@@ -372,7 +371,7 @@ static void recover_worker(struct kthread_work *work)
 		if (submit->aspace)
 			submit->aspace->faults++;
 
-		get_comm_cmdline(submit, &comm, &cmd);
+		get_comm_cmdline(submit->queue->ctx, &comm, &cmd);
 
 		if (comm && cmd) {
 			DRM_DEV_ERROR(dev->dev, "%s: offending task: %s (%s)\n",
@@ -460,7 +459,7 @@ static void fault_worker(struct kthread_work *work)
 		goto resume_smmu;
 
 	if (submit) {
-		get_comm_cmdline(submit, &comm, &cmd);
+		get_comm_cmdline(submit->queue->ctx, &comm, &cmd);
 
 		/*
 		 * When we get GPU iova faults, we can get 1000s of them,
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 7a4fa1b8655b..b2023a42116b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -377,17 +377,25 @@ struct msm_file_private {
 	 */
 	int sysprof;
 
+	/** @pid: Process that opened this file. */
+	struct pid *pid;
+
+	/**
+	 * lock: Protects comm and cmdline
+	 */
+	struct mutex lock;
+
 	/**
 	 * comm: Overridden task comm, see MSM_PARAM_COMM
 	 *
-	 * Accessed under msm_gpu::lock
+	 * Accessed under msm_file_private::lock
 	 */
 	char *comm;
 
 	/**
 	 * cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE
 	 *
-	 * Accessed under msm_gpu::lock
+	 * Accessed under msm_file_private::lock
 	 */
 	char *cmdline;
 
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 0e803125a325..0444ba04fa06 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -61,6 +61,7 @@ void __msm_file_private_destroy(struct kref *kref)
 	}
 
 	msm_gem_address_space_put(ctx->aspace);
+	put_pid(ctx->pid);
 	kfree(ctx->comm);
 	kfree(ctx->cmdline);
 	kfree(ctx);
-- 
2.39.2

