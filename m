Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADEB619B0A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 16:08:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DBA10E866;
	Fri,  4 Nov 2022 15:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D53897E0;
 Fri,  4 Nov 2022 15:08:35 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id y13so4758842pfp.7;
 Fri, 04 Nov 2022 08:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tubi0QTMdkad7hrgfgDxR0Y1fIIjP+8lDNHbALWluvQ=;
 b=E1K+1yvJ96nCX46BN7OqmZ39YeY19x/dxURzqGRdm7yLA9UV/Btcd7Aw0gQaVaCEfA
 IoiZ8x7Mh3qVlKGya6dgQf6jSUcF3t22CG3LV/zcf3v/i68Q7tJGo2sGhZHIu8MzXsV0
 xoQmJ3yHRpz78tz5kRQPax/69FQKoIN26swG1fgL1oBwf16myV51weszGiI025THUgvU
 IrGRQuO8mIFX4ztTE4K99NGWVBJEyjf+ignLWrDnK2tDeEoA+f2l5mllt/PSGmqRQGg8
 6gkIyjQpjkeq2qXCtrHtP4Rns0mtZJfZHR0xgTnHY/AN8+/sV9m8CVV7KX70PhXQJQvB
 Z4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tubi0QTMdkad7hrgfgDxR0Y1fIIjP+8lDNHbALWluvQ=;
 b=S5gddN8jlDCNfSObv8SLhamRAApFFk1KhCSvAUmzl2aLR725jONjwT2UwvzXAULS51
 IEtVO9PGUF/CZqctgVGh3Hm4/x3Lx9x7+W680PfFRSxbErgGuGyioxMOvmVMWxOUlN1R
 jny8vCYzzuoc7YIxEAHAs4U8FjRwtOIXGlDFXzVaEqRvj6Krr54y///28jttd6Wfgtfm
 DYU2Bz1vCxSQA49BOYcxIz565Hz13f+eCckEoHw25UW2VSlJkJI7FtXvmCTctaedLSkv
 eZxKZOCABQsNrQ7JcQf1WPow7DpNNS4EqQuPzWuTx1aIzmGnOYR2yqrFmubDEEvxVOC9
 Jfzg==
X-Gm-Message-State: ACrzQf1zhQo3bkO+XWWoLM2/lS2ymBeo5/o54gL5zAEcn+2EvLxBMJSn
 ctvJqdqHYWZe24LhdtwVdHSEoykhe9U=
X-Google-Smtp-Source: AMsMyM5HTt387dIfF1j9FfL0KEi/eoKMuvBuZCGOQppTMU9k8VwOroeaq7sEpcMgkEJrK96hepX8yw==
X-Received: by 2002:a65:4909:0:b0:46b:2752:e4ab with SMTP id
 p9-20020a654909000000b0046b2752e4abmr31370020pgs.293.1667574514122; 
 Fri, 04 Nov 2022 08:08:34 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 123-20020a621781000000b00562784609fbsm2792890pfx.209.2022.11.04.08.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 08:08:33 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/msm: Hangcheck progress detection
Date: Fri,  4 Nov 2022 08:08:39 -0700
Message-Id: <20221104150847.525173-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104150847.525173-1-robdclark@gmail.com>
References: <20221104150847.525173-1-robdclark@gmail.com>
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

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 34 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.c         |  1 -
 drivers/gpu/drm/msm/msm_drv.h         |  8 ++++++-
 drivers/gpu/drm/msm/msm_gpu.c         | 31 +++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_gpu.h         |  3 +++
 drivers/gpu/drm/msm/msm_ringbuffer.h  | 24 +++++++++++++++++++
 6 files changed, 98 insertions(+), 3 deletions(-)

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
index 585fd9c8d45a..f0fbf6063baa 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -78,6 +78,8 @@ struct msm_gpu_funcs {
 	struct msm_gem_address_space *(*create_private_address_space)
 		(struct msm_gpu *gpu);
 	uint32_t (*get_rptr)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
+
+	bool (*progress)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 };
 
 /* Additional state for iommu faults: */
@@ -237,6 +239,7 @@ struct msm_gpu {
 #define DRM_MSM_INACTIVE_PERIOD   66 /* in ms (roughly four frames) */
 
 #define DRM_MSM_HANGCHECK_DEFAULT_PERIOD 500 /* in ms */
+#define DRM_MSM_HANGCHECK_PROGRESS_RETRIES 3
 	struct timer_list hangcheck_timer;
 
 	/* Fault info for most recent iova fault: */
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
index 2a5045abe46e..e3d33bae3380 100644
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
@@ -64,6 +69,25 @@ struct msm_ringbuffer {
 	uint64_t memptrs_iova;
 	struct msm_fence_context *fctx;
 
+	/**
+	 * hangcheck_progress_retries:
+	 *
+	 * The number of extra hangcheck duration cycles that we have given
+	 * due to it appearing that the GPU is making forward progress.
+	 *
+	 * If the GPU appears to be making progress (ie. the CP has advanced
+	 * in the command stream, we'll allow up to DRM_MSM_HANGCHECK_PROGRESS_RETRIES
+	 * expirations of the hangcheck timer before killing the job.  In other
+	 * words we'll let the submit run for up to
+	 * DRM_MSM_HANGCHECK_DEFAULT_PERIOD *  DRM_MSM_HANGCHECK_PROGRESS_RETRIES
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

