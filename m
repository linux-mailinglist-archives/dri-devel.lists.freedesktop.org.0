Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AB862895D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 20:30:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8161D10E312;
	Mon, 14 Nov 2022 19:30:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C3910E312;
 Mon, 14 Nov 2022 19:30:40 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id h14so11251355pjv.4;
 Mon, 14 Nov 2022 11:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tx8h1+slTqTXF986/02ULsIRK8OtzrVz2Dvm9dDyAxA=;
 b=QifibJS61fWL1HGx/0e8GFXq+VuHeNTBbFcThhRJw13hYBsfRsaVPd9VM7fpGIdQFz
 4nwi3Ic0vEWMQaohZCSy9gK1b/7YeyeEKoiHG0DVgaGOuRTJ8KE3bHzVMNvut5wRZ9mw
 Er/hhuhWeUzRd4LA2eYeVKy4a7rq7S0fXUdSGUj9IkGLe8eGwstJX9Mx57+ZoldTeXEh
 XWagC0/lORihDM5vDJhAzARIjOx8PxUVJfluJGhd8IRtFDdgtWyJgC1JcJaw143aTLe/
 T/6x4kcppc0GDTyVILAsAYqXp2HQiz7djuQfqiGzPlcxSVUe67907/eX+HY/uMQZ3dA9
 gHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tx8h1+slTqTXF986/02ULsIRK8OtzrVz2Dvm9dDyAxA=;
 b=ZTmta6l0lWFg1qw1VGle7NUZQ0OFW9U17eF7dhdyuR3RjeFPW0mYC63s635Y3u89kq
 TB5hmAwTzksL1sR2LGP6mLkj4KyteVGrhZsQDpniWPZJhSDxTlV/Z74aonNgdrbBWS8c
 PWhWIv3C7EaYBljdhPzCODN+9NcZXOdXmg9JPSBD8skCs+gEfxOW5uvpwP9J6XpZaT13
 vhi3wZ/lOzyT6sCqKGxGtRFagCvFmAXRt+/vfEeXSO9WODbK/sWDSx0rI0/KqPx5t9C5
 xLsLaIMcTkCFaQ9b2K6A6/Cz5DIAvmJ4oJZ6OXlBEGZloK6+HV87S1gsy3qpZ+QqihbQ
 5Tcw==
X-Gm-Message-State: ANoB5plKT7pTZuzFVArB+2LxVVeNvaJ5xaMZU7+Jl4BJinXIBpwU6CZE
 1eP1vb8sQeZSpkFJIJbyE0D1FjASp1s=
X-Google-Smtp-Source: AA0mqf4ooDMBchFn1Jxqg3CCJiJo4Tzhpsv6PZwJfb+djOktzYc1G4hrMtnMpkc0tlV7VulUo0ylMA==
X-Received: by 2002:a17:90a:8d14:b0:213:dce7:e1fe with SMTP id
 c20-20020a17090a8d1400b00213dce7e1femr15411689pjo.110.1668454239117; 
 Mon, 14 Nov 2022 11:30:39 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 fa13-20020a17090af0cd00b002086ac07041sm6821973pjb.44.2022.11.14.11.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 11:30:38 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/2] drm/msm: Hangcheck progress detection
Date: Mon, 14 Nov 2022 11:30:41 -0800
Message-Id: <20221114193049.1533391-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221114193049.1533391-1-robdclark@gmail.com>
References: <20221114193049.1533391-1-robdclark@gmail.com>
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

If the hangcheck timer expires, check if the fw's position in the
cmdstream has advanced (changed) since last timer expiration, and
allow it up to three additional "extensions" to it's alotted time.
The intention is to continue to catch "shader stuck in a loop" type
hangs quickly, but allow more time for things that are actually
making forward progress.

Because we need to sample the CP state twice to detect if there has
not been progress, this also cuts the the timer's duration in half.

v2: Fix typo (REG_A6XX_CP_CSQ_IB2_STAT), add comment
v3: Only halve hangcheck timer duration for generations which
    support progress detection (hdanton); removed unused a5xx
    progress (without knowing how to adjust for data buffered
    in ROQ it is too likely to report a false negative)
v4: Comment updates to better describe the total hangcheck
    duration when progress detection is applied

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Tested-by: Chia-I Wu <olvaffe@gmail.com> # dEQP-GLES2.functional.flush_finish.wait
Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 34 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.c         |  1 -
 drivers/gpu/drm/msm/msm_drv.h         |  8 ++++++-
 drivers/gpu/drm/msm/msm_gpu.c         | 31 +++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_gpu.h         | 10 ++++++++
 drivers/gpu/drm/msm/msm_ringbuffer.h  | 28 ++++++++++++++++++++++
 6 files changed, 109 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 1ff605c18ee6..7fe60c65a1eb 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1843,6 +1843,39 @@ static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return ring->memptrs->rptr = gpu_read(gpu, REG_A6XX_CP_RB_RPTR);
 }
 
+static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+{
+	struct msm_cp_state cp_state = {
+		.ib1_base = gpu_read64(gpu, REG_A6XX_CP_IB1_BASE),
+		.ib2_base = gpu_read64(gpu, REG_A6XX_CP_IB2_BASE),
+		.ib1_rem  = gpu_read(gpu, REG_A6XX_CP_IB1_REM_SIZE),
+		.ib2_rem  = gpu_read(gpu, REG_A6XX_CP_IB2_REM_SIZE),
+	};
+	bool progress;
+
+	/*
+	 * Adjust the remaining data to account for what has already been
+	 * fetched from memory, but not yet consumed by the SQE.
+	 *
+	 * This is not *technically* correct, the amount buffered could
+	 * exceed the IB size due to hw prefetching ahead, but:
+	 *
+	 * (1) We aren't trying to find the exact position, just whether
+	 *     progress has been made
+	 * (2) The CP_REG_TO_MEM at the end of a submit should be enough
+	 *     to prevent prefetching into an unrelated submit.  (And
+	 *     either way, at some point the ROQ will be full.)
+	 */
+	cp_state.ib1_rem += gpu_read(gpu, REG_A6XX_CP_CSQ_IB1_STAT) >> 16;
+	cp_state.ib2_rem += gpu_read(gpu, REG_A6XX_CP_CSQ_IB2_STAT) >> 16;
+
+	progress = !!memcmp(&cp_state, &ring->last_cp_state, sizeof(cp_state));
+
+	ring->last_cp_state = cp_state;
+
+	return progress;
+}
+
 static u32 a618_get_speed_bin(u32 fuse)
 {
 	if (fuse == 0)
@@ -1961,6 +1994,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.create_address_space = a6xx_create_address_space,
 		.create_private_address_space = a6xx_create_private_address_space,
 		.get_rptr = a6xx_get_rptr,
+		.progress = a6xx_progress,
 	},
 	.get_timestamp = a6xx_get_timestamp,
 };
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 670651cdfa79..c3b77b44b2aa 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -419,7 +419,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	priv->dev = ddev;
 
 	priv->wq = alloc_ordered_workqueue("msm", 0);
-	priv->hangcheck_period = DRM_MSM_HANGCHECK_DEFAULT_PERIOD;
 
 	INIT_LIST_HEAD(&priv->objects);
 	mutex_init(&priv->obj_lock);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 0609daf4fa4c..876d8d5eec2f 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -225,7 +225,13 @@ struct msm_drm_private {
 
 	struct drm_atomic_state *pm_state;
 
-	/* For hang detection, in ms */
+	/**
+	 * hangcheck_period: For hang detection, in ms
+	 *
+	 * Note that in practice, a submit/job will get at least two hangcheck
+	 * periods, due to checking for progress being implemented as simply
+	 * "have the CP position registers changed since last time?"
+	 */
 	unsigned int hangcheck_period;
 
 	/**
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 3dffee54a951..bfef659d3a5c 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -500,6 +500,21 @@ static void hangcheck_timer_reset(struct msm_gpu *gpu)
 			round_jiffies_up(jiffies + msecs_to_jiffies(priv->hangcheck_period)));
 }
 
+static bool made_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+{
+	if (ring->hangcheck_progress_retries >= DRM_MSM_HANGCHECK_PROGRESS_RETRIES)
+		return false;
+
+	if (!gpu->funcs->progress)
+		return false;
+
+	if (!gpu->funcs->progress(gpu, ring))
+		return false;
+
+	ring->hangcheck_progress_retries++;
+	return true;
+}
+
 static void hangcheck_handler(struct timer_list *t)
 {
 	struct msm_gpu *gpu = from_timer(gpu, t, hangcheck_timer);
@@ -511,9 +526,12 @@ static void hangcheck_handler(struct timer_list *t)
 	if (fence != ring->hangcheck_fence) {
 		/* some progress has been made.. ya! */
 		ring->hangcheck_fence = fence;
-	} else if (fence_before(fence, ring->fctx->last_fence)) {
+		ring->hangcheck_progress_retries = 0;
+	} else if (fence_before(fence, ring->fctx->last_fence) &&
+			!made_progress(gpu, ring)) {
 		/* no progress and not done.. hung! */
 		ring->hangcheck_fence = fence;
+		ring->hangcheck_progress_retries = 0;
 		DRM_DEV_ERROR(dev->dev, "%s: hangcheck detected gpu lockup rb %d!\n",
 				gpu->name, ring->id);
 		DRM_DEV_ERROR(dev->dev, "%s:     completed fence: %u\n",
@@ -845,6 +863,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		struct msm_gpu *gpu, const struct msm_gpu_funcs *funcs,
 		const char *name, struct msm_gpu_config *config)
 {
+	struct msm_drm_private *priv = drm->dev_private;
 	int i, ret, nr_rings = config->nr_rings;
 	void *memptrs;
 	uint64_t memptrs_iova;
@@ -872,6 +891,16 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	kthread_init_work(&gpu->recover_work, recover_worker);
 	kthread_init_work(&gpu->fault_work, fault_worker);
 
+	priv->hangcheck_period = DRM_MSM_HANGCHECK_DEFAULT_PERIOD;
+
+	/*
+	 * If progress detection is supported, halve the hangcheck timer
+	 * duration, as it takes two iterations of the hangcheck handler
+	 * to detect a hang.
+	 */
+	if (funcs->progress)
+		priv->hangcheck_period /= 2;
+
 	timer_setup(&gpu->hangcheck_timer, hangcheck_handler, 0);
 
 	spin_lock_init(&gpu->perf_lock);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 585fd9c8d45a..651786bc55e5 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -78,6 +78,15 @@ struct msm_gpu_funcs {
 	struct msm_gem_address_space *(*create_private_address_space)
 		(struct msm_gpu *gpu);
 	uint32_t (*get_rptr)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
+
+	/**
+	 * progress: Has the GPU made progress?
+	 *
+	 * Return true if GPU position in cmdstream has advanced (or changed)
+	 * since the last call.  To avoid false negatives, this should account
+	 * for cmdstream that is buffered in this FIFO upstream of the CP fw.
+	 */
+	bool (*progress)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 };
 
 /* Additional state for iommu faults: */
@@ -237,6 +246,7 @@ struct msm_gpu {
 #define DRM_MSM_INACTIVE_PERIOD   66 /* in ms (roughly four frames) */
 
 #define DRM_MSM_HANGCHECK_DEFAULT_PERIOD 500 /* in ms */
+#define DRM_MSM_HANGCHECK_PROGRESS_RETRIES 3
 	struct timer_list hangcheck_timer;
 
 	/* Fault info for most recent iova fault: */
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
index 2a5045abe46e..698b333abccd 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.h
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
@@ -35,6 +35,11 @@ struct msm_rbmemptrs {
 	volatile u64 ttbr0;
 };
 
+struct msm_cp_state {
+	uint64_t ib1_base, ib2_base;
+	uint32_t ib1_rem, ib2_rem;
+};
+
 struct msm_ringbuffer {
 	struct msm_gpu *gpu;
 	int id;
@@ -64,6 +69,29 @@ struct msm_ringbuffer {
 	uint64_t memptrs_iova;
 	struct msm_fence_context *fctx;
 
+	/**
+	 * hangcheck_progress_retries:
+	 *
+	 * The number of extra hangcheck duration cycles that we have given
+	 * due to it appearing that the GPU is making forward progress.
+	 *
+	 * For GPU generations which support progress detection (see.
+	 * msm_gpu_funcs::progress()), if the GPU appears to be making progress
+	 * (ie. the CP has advanced in the command stream, we'll allow up to
+	 * DRM_MSM_HANGCHECK_PROGRESS_RETRIES expirations of the hangcheck timer
+	 * before killing the job.  But to detect progress we need two sample
+	 * points, so the duration of the hangcheck timer is halved.  In other
+	 * words we'll let the submit run for up to:
+	 *
+	 * (DRM_MSM_HANGCHECK_DEFAULT_PERIOD / 2) * (DRM_MSM_HANGCHECK_PROGRESS_RETRIES + 1)
+	 */
+	int hangcheck_progress_retries;
+
+	/**
+	 * last_cp_state: The state of the CP at the last call to gpu->progress()
+	 */
+	struct msm_cp_state last_cp_state;
+
 	/*
 	 * preempt_lock protects preemption and serializes wptr updates against
 	 * preemption.  Can be aquired from irq context.
-- 
2.38.1

