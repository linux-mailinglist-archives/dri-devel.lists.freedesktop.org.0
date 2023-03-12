Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1CB6B6B38
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 21:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AF910E288;
	Sun, 12 Mar 2023 20:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7592A10E287;
 Sun, 12 Mar 2023 20:42:35 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id k2so2957094pll.8;
 Sun, 12 Mar 2023 13:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678653755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kr8/B6ZuKF5w1o2Xbtc5QxJNFXAuL1a2D00htOsDOJ0=;
 b=i6L90ta3FW+HD5hKwf50gFT6MudXIKIxU4z+zs+w0wqd+NNB7XbeRnGj3kQ+EUkJV1
 5kIRjQqyYaDEOYfHWpjlUxIZ0tUB+EyfXAO4mA9lvr/tb/p9RCL5nqMf8ZQdGnZ1gA6D
 Epw9OS3zhuhb2uIAKPhLvEJww2J55PqsV0RYqXovjsQQm3uqbV+7UctYf7VSvaZXSLVl
 YvS8lWAqfL2CbmcqFQOz7WpJGKM4M8G3TET7PxxWDYz7FGqEQz4iyGjCQYz8gcO5kq5M
 pfmCeDJBhAWzo1/jSMNdAQgQyQfvgJq9BXMyspV7n7+iug/HQFP+gsB7v5cjh/lRD/xw
 1B0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678653755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kr8/B6ZuKF5w1o2Xbtc5QxJNFXAuL1a2D00htOsDOJ0=;
 b=tKbax5ysLEMNhTfr8mVculBKYnP1yQ0AL/6F9he9kRfU8Nd7KijCOfKSZYwpTEvHNm
 PtdJwETJFNtOg7YsOcDa9j7JA9IIgI7lUlBp7E6xy4TPQ15+IAQI/H+Wce0YZjN0SOI3
 N3SoDvZPu5FB7KwC7YfnNusB/VnT6NeMJRfwI9VMFMAElpDc5aR1Efaar2o67gTG9xaE
 6UZ5XwGsLwp7BWJ1g8Uq5FazhcRx/fKTIxiD47UVgqzYhb0R830TdknOEsAhSJvOoEcI
 TqS2bqAty8jz6yg7lxFquDTv9gR3W8vg0XOiNizquGPVMsE5biVqljk8qpb28zevYr+0
 w71g==
X-Gm-Message-State: AO0yUKW7DGqpZ4su0nrsEGP3EfDXDccKZywJ2avtMj+tB5h5v1VTm13b
 vqPLUuptPacdLPZjaldizwJUtshBH5o=
X-Google-Smtp-Source: AK7set94mZD1V4cF+2prjJ26GvpuG4rOoe7mSGLRKUTe4xzzOviPtI56XjULkjxk94uDt1ptZAT7gw==
X-Received: by 2002:a05:6a20:8e0a:b0:c7:6a98:5bd8 with SMTP id
 y10-20020a056a208e0a00b000c76a985bd8mr16993612pzj.0.1678653754940; 
 Sun, 12 Mar 2023 13:42:34 -0700 (PDT)
Received: from localhost ([2601:1c0:5080:d9fa:9b45:95de:f47d:f85e])
 by smtp.gmail.com with ESMTPSA id
 m26-20020a056a00165a00b006247123adf1sm592767pfc.143.2023.03.12.13.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 13:42:34 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/13] drm/msm/gpu: Move BO allocation out of hw_init
Date: Sun, 12 Mar 2023 13:41:32 -0700
Message-Id: <20230312204150.1353517-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312204150.1353517-1-robdclark@gmail.com>
References: <20230312204150.1353517-1-robdclark@gmail.com>
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Nathan Chancellor <nathan@kernel.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

These allocations are only done the first (successful) time through
hw_init() so they won't actually happen in the job_run() path.  But
lockdep doesn't know this.  So dis-entangle them from the hw_init()
path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 48 +++++++++++-----------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 46 ++++++++++-----------
 drivers/gpu/drm/msm/adreno/adreno_device.c |  6 +++
 drivers/gpu/drm/msm/msm_gpu.h              |  6 +++
 4 files changed, 57 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 660ba0db8900..f8e278d46dcf 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -567,7 +567,7 @@ static void a5xx_ucode_check_version(struct a5xx_gpu *a5xx_gpu,
 	msm_gem_put_vaddr(obj);
 }
 
-static int a5xx_ucode_init(struct msm_gpu *gpu)
+static int a5xx_ucode_load(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
@@ -605,9 +605,24 @@ static int a5xx_ucode_init(struct msm_gpu *gpu)
 		a5xx_ucode_check_version(a5xx_gpu, a5xx_gpu->pfp_bo);
 	}
 
-	gpu_write64(gpu, REG_A5XX_CP_ME_INSTR_BASE_LO, a5xx_gpu->pm4_iova);
+	if (a5xx_gpu->has_whereami) {
+		if (!a5xx_gpu->shadow_bo) {
+			a5xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
+				sizeof(u32) * gpu->nr_rings,
+				MSM_BO_WC | MSM_BO_MAP_PRIV,
+				gpu->aspace, &a5xx_gpu->shadow_bo,
+				&a5xx_gpu->shadow_iova);
 
-	gpu_write64(gpu, REG_A5XX_CP_PFP_INSTR_BASE_LO, a5xx_gpu->pfp_iova);
+			if (IS_ERR(a5xx_gpu->shadow))
+				return PTR_ERR(a5xx_gpu->shadow);
+
+			msm_gem_object_set_name(a5xx_gpu->shadow_bo, "shadow");
+		}
+	} else if (gpu->nr_rings > 1) {
+		/* Disable preemption if WHERE_AM_I isn't available */
+		a5xx_preempt_fini(gpu);
+		gpu->nr_rings = 1;
+	}
 
 	return 0;
 }
@@ -900,9 +915,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	if (adreno_is_a530(adreno_gpu) || adreno_is_a540(adreno_gpu))
 		a5xx_gpmu_ucode_init(gpu);
 
-	ret = a5xx_ucode_init(gpu);
-	if (ret)
-		return ret;
+	gpu_write64(gpu, REG_A5XX_CP_ME_INSTR_BASE_LO, a5xx_gpu->pm4_iova);
+	gpu_write64(gpu, REG_A5XX_CP_PFP_INSTR_BASE_LO, a5xx_gpu->pfp_iova);
 
 	/* Set the ringbuffer address */
 	gpu_write64(gpu, REG_A5XX_CP_RB_BASE, gpu->rb[0]->iova);
@@ -916,27 +930,10 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A5XX_CP_RB_CNTL,
 		MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE);
 
-	/* Create a privileged buffer for the RPTR shadow */
-	if (a5xx_gpu->has_whereami) {
-		if (!a5xx_gpu->shadow_bo) {
-			a5xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
-				sizeof(u32) * gpu->nr_rings,
-				MSM_BO_WC | MSM_BO_MAP_PRIV,
-				gpu->aspace, &a5xx_gpu->shadow_bo,
-				&a5xx_gpu->shadow_iova);
-
-			if (IS_ERR(a5xx_gpu->shadow))
-				return PTR_ERR(a5xx_gpu->shadow);
-
-			msm_gem_object_set_name(a5xx_gpu->shadow_bo, "shadow");
-		}
-
+	/* Configure the RPTR shadow if needed: */
+	if (a5xx_gpu->shadow_bo) {
 		gpu_write64(gpu, REG_A5XX_CP_RB_RPTR_ADDR,
 			    shadowptr(a5xx_gpu, gpu->rb[0]));
-	} else if (gpu->nr_rings > 1) {
-		/* Disable preemption if WHERE_AM_I isn't available */
-		a5xx_preempt_fini(gpu);
-		gpu->nr_rings = 1;
 	}
 
 	a5xx_preempt_hw_init(gpu);
@@ -1682,6 +1679,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.get_param = adreno_get_param,
 		.set_param = adreno_set_param,
 		.hw_init = a5xx_hw_init,
+		.ucode_load = a5xx_ucode_load,
 		.pm_suspend = a5xx_pm_suspend,
 		.pm_resume = a5xx_pm_resume,
 		.recover = a5xx_recover,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index aae60cbd9164..89049094a242 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -917,7 +917,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 	return ret;
 }
 
-static int a6xx_ucode_init(struct msm_gpu *gpu)
+static int a6xx_ucode_load(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
@@ -946,7 +946,23 @@ static int a6xx_ucode_init(struct msm_gpu *gpu)
 		}
 	}
 
-	gpu_write64(gpu, REG_A6XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
+	/*
+	 * Expanded APRIV and targets that support WHERE_AM_I both need a
+	 * privileged buffer to store the RPTR shadow
+	 */
+	if ((adreno_gpu->base.hw_apriv || a6xx_gpu->has_whereami) &&
+	    !a6xx_gpu->shadow_bo) {
+		a6xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
+						      sizeof(u32) * gpu->nr_rings,
+						      MSM_BO_WC | MSM_BO_MAP_PRIV,
+						      gpu->aspace, &a6xx_gpu->shadow_bo,
+						      &a6xx_gpu->shadow_iova);
+
+		if (IS_ERR(a6xx_gpu->shadow))
+			return PTR_ERR(a6xx_gpu->shadow);
+
+		msm_gem_object_set_name(a6xx_gpu->shadow_bo, "shadow");
+	}
 
 	return 0;
 }
@@ -1135,9 +1151,7 @@ static int hw_init(struct msm_gpu *gpu)
 	if (ret)
 		goto out;
 
-	ret = a6xx_ucode_init(gpu);
-	if (ret)
-		goto out;
+	gpu_write64(gpu, REG_A6XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
 
 	/* Set the ringbuffer address */
 	gpu_write64(gpu, REG_A6XX_CP_RB_BASE, gpu->rb[0]->iova);
@@ -1152,25 +1166,8 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_CP_RB_CNTL,
 			MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE);
 
-	/*
-	 * Expanded APRIV and targets that support WHERE_AM_I both need a
-	 * privileged buffer to store the RPTR shadow
-	 */
-
-	if (adreno_gpu->base.hw_apriv || a6xx_gpu->has_whereami) {
-		if (!a6xx_gpu->shadow_bo) {
-			a6xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
-				sizeof(u32) * gpu->nr_rings,
-				MSM_BO_WC | MSM_BO_MAP_PRIV,
-				gpu->aspace, &a6xx_gpu->shadow_bo,
-				&a6xx_gpu->shadow_iova);
-
-			if (IS_ERR(a6xx_gpu->shadow))
-				return PTR_ERR(a6xx_gpu->shadow);
-
-			msm_gem_object_set_name(a6xx_gpu->shadow_bo, "shadow");
-		}
-
+	/* Configure the RPTR shadow if needed: */
+	if (a6xx_gpu->shadow_bo) {
 		gpu_write64(gpu, REG_A6XX_CP_RB_RPTR_ADDR_LO,
 			shadowptr(a6xx_gpu, gpu->rb[0]));
 	}
@@ -1952,6 +1949,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.get_param = adreno_get_param,
 		.set_param = adreno_set_param,
 		.hw_init = a6xx_hw_init,
+		.ucode_load = a6xx_ucode_load,
 		.pm_suspend = a6xx_pm_suspend,
 		.pm_resume = a6xx_pm_resume,
 		.recover = a6xx_recover,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 36f062c7582f..83d89b8d93e4 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -432,6 +432,12 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
 	if (ret)
 		return NULL;
 
+	if (gpu->funcs->ucode_load) {
+		ret = gpu->funcs->ucode_load(gpu);
+		if (ret)
+			return NULL;
+	}
+
 	/*
 	 * Now that we have firmware loaded, and are ready to begin
 	 * booting the gpu, go ahead and enable runpm:
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index fc1c0d8611a8..5828b7333d81 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -50,6 +50,12 @@ struct msm_gpu_funcs {
 	int (*set_param)(struct msm_gpu *gpu, struct msm_file_private *ctx,
 			 uint32_t param, uint64_t value, uint32_t len);
 	int (*hw_init)(struct msm_gpu *gpu);
+
+	/**
+	 * @ucode_load: Optional hook to upload fw to GEM objs
+	 */
+	int (*ucode_load)(struct msm_gpu *gpu);
+
 	int (*pm_suspend)(struct msm_gpu *gpu);
 	int (*pm_resume)(struct msm_gpu *gpu);
 	void (*submit)(struct msm_gpu *gpu, struct msm_gem_submit *submit);
-- 
2.39.2

