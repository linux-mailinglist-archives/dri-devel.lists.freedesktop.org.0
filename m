Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 550AB50320F
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 02:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A4010E29B;
	Sat, 16 Apr 2022 00:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5609410E296;
 Sat, 16 Apr 2022 00:33:28 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so12886161pjn.3; 
 Fri, 15 Apr 2022 17:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6AjOHVLmy++hjINXRHfH8cU0LeusCvQBspyIU/e7Ce0=;
 b=V6AbaaBfcxy6hGk0b1qQITAALp/O74mu0yqKHh9E0usgncipduK6ZimZFu/NKaizWR
 PmC1Qc2RAQDfBFy1Wo2nI5k2T5I8UkvjuwaHca8MgHf8RoqeZgq5aGRolU7vIJ+zPbG2
 VSe840ftq8IFxDyWMMYHnfZekGmHolMArsU2Lg2lFz3YEHMH9mTHS7mMLFfuDLTLDnVP
 81VQWMdzXKQnQmAJQ/xyDiycuqriaFKt50p2yjMANK6RiE4dLL5+1D/HbPYgYrW4cXyC
 H2skzngtvsM9Y3P5k9/FdV2PWM6VnR3tY0ppjiy9o8WA9dpGpfhX8B5JYwrAGwz53Mcu
 buYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6AjOHVLmy++hjINXRHfH8cU0LeusCvQBspyIU/e7Ce0=;
 b=vNKiVWchnmn4JgcTvc2KaXQc8+7LMk4rgsPjVT0+iDEWcyITdV15io8b1wGQ5+D+Ms
 N2/lWW3lJ/t5wWkCvKA4RHEpARxA8busf8mBiQSchXeUT7QlG1r70expSZyTGuF1AJd7
 aZZLUu2jOsPAWrmRlQpQkmmYRNFZi24cof9pkofYmlQJgF6UnzIYnGjVH/uaWyAulsSW
 am7/65xplzpsrFoVWjXi9njq6/5SIjyw4youL8N+b54kDxXK8RObbkTBzgqOdiHYrmdS
 /XrLiIXf5YExHZ1miEPvUsMwZFmyDY/NLt+TAGHv9/Rh8XpxkqVvlus6orljkUkxCTvs
 cyEQ==
X-Gm-Message-State: AOAM530Au9emRosjhznXcIk+6dHzdTDkvifxtD/SwaERqe7QCoBNhZwt
 pTi2bymZX6FB5+yvzpPWrKdYysNX7Ns=
X-Google-Smtp-Source: ABdhPJyBrqZl5LOp0s0qaGDNrkbxcqh3vZYA7lMg4NOvJNi65Ee61pXXMUbe3iypkScV4FihsWN+PQ==
X-Received: by 2002:a17:903:22d0:b0:158:9d42:6af6 with SMTP id
 y16-20020a17090322d000b001589d426af6mr1186928plg.159.1650069207513; 
 Fri, 15 Apr 2022 17:33:27 -0700 (PDT)
Received: from olv-glaptop3.lan ([2601:647:4400:452:4301:d32e:a8ad:adbf])
 by smtp.gmail.com with ESMTPSA id
 oo17-20020a17090b1c9100b001bf0ccc59c2sm9900249pjb.16.2022.04.15.17.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 17:33:27 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 2/3] drm/msm: simplify gpu_busy callback
Date: Fri, 15 Apr 2022 17:33:13 -0700
Message-Id: <20220416003314.59211-2-olvaffe@gmail.com>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
In-Reply-To: <20220416003314.59211-1-olvaffe@gmail.com>
References: <20220416003314.59211-1-olvaffe@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move tracking and busy time calculation to msm_devfreq_get_dev_status.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 19 ++++++----------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 +++++--------
 drivers/gpu/drm/msm/msm_gpu.h         |  9 +++-----
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 32 ++++++++++++++++++++++-----
 4 files changed, 41 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 407f50a15faa..217615e0e850 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1662,28 +1662,23 @@ static struct msm_ringbuffer *a5xx_active_ring(struct msm_gpu *gpu)
 	return a5xx_gpu->cur_ring;
 }
 
-static unsigned long a5xx_gpu_busy(struct msm_gpu *gpu)
+static u64 a5xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
 {
-	u64 busy_cycles, busy_time;
+	u64 busy_cycles;
 
 	/* Only read the gpu busy if the hardware is already active */
-	if (pm_runtime_get_if_in_use(&gpu->pdev->dev) == 0)
+	if (pm_runtime_get_if_in_use(&gpu->pdev->dev) == 0) {
+		*out_sample_rate = 1;
 		return 0;
+	}
 
 	busy_cycles = gpu_read64(gpu, REG_A5XX_RBBM_PERFCTR_RBBM_0_LO,
 			REG_A5XX_RBBM_PERFCTR_RBBM_0_HI);
-
-	busy_time = busy_cycles - gpu->devfreq.busy_cycles;
-	do_div(busy_time, clk_get_rate(gpu->core_clk) / 1000000);
-
-	gpu->devfreq.busy_cycles = busy_cycles;
+	*out_sample_rate = clk_get_rate(gpu->core_clk);
 
 	pm_runtime_put(&gpu->pdev->dev);
 
-	if (WARN_ON(busy_time > ~0LU))
-		return ~0LU;
-
-	return (unsigned long)busy_time;
+	return busy_cycles;
 }
 
 static uint32_t a5xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ccc4fcf7a630..fba6259395dd 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1649,12 +1649,14 @@ static void a6xx_destroy(struct msm_gpu *gpu)
 	kfree(a6xx_gpu);
 }
 
-static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
+static u64 a6xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-	u64 busy_cycles, busy_time;
+	u64 busy_cycles;
 
+	/* 19.2MHz */
+	*out_sample_rate = 19200000;
 
 	/* Only read the gpu busy if the hardware is already active */
 	if (pm_runtime_get_if_in_use(a6xx_gpu->gmu.dev) == 0)
@@ -1664,17 +1666,10 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
 			REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_L,
 			REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_H);
 
-	busy_time = (busy_cycles - gpu->devfreq.busy_cycles) * 10;
-	do_div(busy_time, 192);
-
-	gpu->devfreq.busy_cycles = busy_cycles;
 
 	pm_runtime_put(a6xx_gpu->gmu.dev);
 
-	if (WARN_ON(busy_time > ~0LU))
-		return ~0LU;
-
-	return (unsigned long)busy_time;
+	return busy_cycles;
 }
 
 static void a6xx_gpu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 02419f2ca2bc..389c6dab751b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -62,7 +62,7 @@ struct msm_gpu_funcs {
 	/* for generation specific debugfs: */
 	void (*debugfs_init)(struct msm_gpu *gpu, struct drm_minor *minor);
 #endif
-	unsigned long (*gpu_busy)(struct msm_gpu *gpu);
+	u64 (*gpu_busy)(struct msm_gpu *gpu, unsigned long *out_sample_rate);
 	struct msm_gpu_state *(*gpu_state_get)(struct msm_gpu *gpu);
 	int (*gpu_state_put)(struct msm_gpu_state *state);
 	unsigned long (*gpu_get_freq)(struct msm_gpu *gpu);
@@ -106,11 +106,8 @@ struct msm_gpu_devfreq {
 	struct dev_pm_qos_request boost_freq;
 
 	/**
-	 * busy_cycles:
-	 *
-	 * Used by implementation of gpu->gpu_busy() to track the last
-	 * busy counter value, for calculating elapsed busy cycles since
-	 * last sampling period.
+	 * busy_cycles: Last busy counter value, for calculating elapsed busy
+	 * cycles since last sampling period.
 	 */
 	u64 busy_cycles;
 
diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 317a95d42922..f531015107c3 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -49,18 +49,38 @@ static unsigned long get_freq(struct msm_gpu *gpu)
 	return clk_get_rate(gpu->core_clk);
 }
 
-static int msm_devfreq_get_dev_status(struct device *dev,
+static void get_raw_dev_status(struct msm_gpu *gpu,
 		struct devfreq_dev_status *status)
 {
-	struct msm_gpu *gpu = dev_to_gpu(dev);
+	struct msm_gpu_devfreq *df = &gpu->devfreq;
+	u64 busy_cycles, busy_time;
+	unsigned long sample_rate;
 	ktime_t time;
 
 	status->current_frequency = get_freq(gpu);
-	status->busy_time = gpu->funcs->gpu_busy(gpu);
-
+	busy_cycles = gpu->funcs->gpu_busy(gpu, &sample_rate);
 	time = ktime_get();
-	status->total_time = ktime_us_delta(time, gpu->devfreq.time);
-	gpu->devfreq.time = time;
+
+	busy_time = busy_cycles - df->busy_cycles;
+	status->total_time = ktime_us_delta(time, df->time);
+
+	df->busy_cycles = busy_cycles;
+	df->time = time;
+
+	busy_time *= USEC_PER_SEC;
+	do_div(busy_time, sample_rate);
+	if (WARN_ON(busy_time > ~0LU))
+		busy_time = ~0LU;
+
+	status->busy_time = busy_time;
+}
+
+static int msm_devfreq_get_dev_status(struct device *dev,
+		struct devfreq_dev_status *status)
+{
+	struct msm_gpu *gpu = dev_to_gpu(dev);
+
+	get_raw_dev_status(gpu, status);
 
 	return 0;
 }
-- 
2.36.0.rc0.470.gd361397f0d-goog

