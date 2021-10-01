Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CD841F5BF
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 21:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F7B6F38C;
	Fri,  1 Oct 2021 19:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC196F383;
 Fri,  1 Oct 2021 19:28:02 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id bb10so6969487plb.2;
 Fri, 01 Oct 2021 12:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MMNTBntVzKygVq0hqqFgHRj5ZdEdCR0hZf65zLuUi4k=;
 b=UUU76DOsbZw3ep4rh/1quCAvw2oi84GyEbWItBW9nIoEzitOYfb9fj/AecW+SGk9vb
 obEwOXb/H/9dYQ74oNqHeMn4F4XvyAXKwoQWms9ivpcHaKlPrX+bi7RB+9+bMpepwo6D
 2YQMX6JY3rzntES0yciuVFrbEw1amwrwXc0tRLVU+aobFDJmR8QttqEP24F8osTEFPfJ
 3IOv/jLntWxEcBTjXtBJ2YAsj8nPiQBCRgPwoshe+wN/PW7cP0uSFo/AIgRqtuSGnba9
 mJElK8vrxQU0X8LJeahGll/upvD+lXhM94M3nKDSBOjyCS3/yGEglIQqeH+Cvh4iwQny
 SJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MMNTBntVzKygVq0hqqFgHRj5ZdEdCR0hZf65zLuUi4k=;
 b=yAjq9YmI1JjtrDnNxPpjtBmp4nIsjHw5o3j75oJWz0X2anMjrlKMKxJOYHL2tOpxrN
 uGFw0C27vf+gAtJTlp3tCvHuWxGwrHIemVVvNqLtsGRBmJ7l02jwkurQe2+Z3a5r4ypq
 xIdpDvGGUWoqXqS4P+bBw9BmMC/f06z308I1LOcT0dZMUj9mmIAhI2MylXzsgU+Vr1km
 A53GqA+rcqXm2NsoIQ7T+AE5Gn73z0dyC7aNJowoggD4mAaC1PV/87SEcKpu5lfTXv3+
 QIPfvZwwKUGRvCa7X5jGbzIimcqO0XE1/XuV8spd8//nreDYpjME00ETs0IShcROk72P
 /uCg==
X-Gm-Message-State: AOAM532gVraRbD+Vtx2DblmxG5mIfcI0K/orhemUzRTdcIp2xEyraWyF
 5F5fjrXtomnTVIimOeiCk6hrI/KMZYg=
X-Google-Smtp-Source: ABdhPJxJEGlGwS+NDMQK+F2w+z58ZgoKk/GjU5f4vo06X3YBeIB6CRcvACNsWEEfWXVIHYZ3h3S/bg==
X-Received: by 2002:a17:90a:1c6:: with SMTP id
 6mr15233784pjd.194.1633116480909; 
 Fri, 01 Oct 2021 12:28:00 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id j7sm6926937pfh.168.2021.10.01.12.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 12:27:59 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>,
 Eric Anholt <eric@anholt.net>, Jordan Crouse <jordan@cosmicpenguin.net>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx: Serialize GMU communication
Date: Fri,  1 Oct 2021 12:32:37 -0700
Message-Id: <20211001193241.1348868-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

I've seen some crashes in our crash reporting that *look* like multiple
threads stomping on each other while communicating with GMU.  So wrap
all those paths in a lock.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  6 ++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  3 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 40 +++++++++++++++++++++++----
 3 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index a7c58018959f..8b73f70766a4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -296,6 +296,8 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 	u32 val;
 	int request, ack;
 
+	WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
+
 	if (state >= ARRAY_SIZE(a6xx_gmu_oob_bits))
 		return -EINVAL;
 
@@ -337,6 +339,8 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 {
 	int bit;
 
+	WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
+
 	if (state >= ARRAY_SIZE(a6xx_gmu_oob_bits))
 		return;
 
@@ -1482,6 +1486,8 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	if (!pdev)
 		return -ENODEV;
 
+	mutex_init(&gmu->lock);
+
 	gmu->dev = &pdev->dev;
 
 	of_dma_configure(gmu->dev, node, true);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 3c74f64e3126..84bd516f01e8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -44,6 +44,9 @@ struct a6xx_gmu_bo {
 struct a6xx_gmu {
 	struct device *dev;
 
+	/* For serializing communication with the GMU: */
+	struct mutex lock;
+
 	struct msm_gem_address_space *aspace;
 
 	void * __iomem mmio;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index f6a4dbef796b..bd7bdeff5d6f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -881,7 +881,7 @@ static int a6xx_zap_shader_init(struct msm_gpu *gpu)
 	  A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS | \
 	  A6XX_RBBM_INT_0_MASK_UCHE_TRAP_INTR)
 
-static int a6xx_hw_init(struct msm_gpu *gpu)
+static int hw_init(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
@@ -1135,6 +1135,19 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	return ret;
 }
 
+static int a6xx_hw_init(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	int ret;
+
+	mutex_lock(&a6xx_gpu->gmu.lock);
+	ret = hw_init(gpu);
+	mutex_unlock(&a6xx_gpu->gmu.lock);
+
+	return ret;
+}
+
 static void a6xx_dump(struct msm_gpu *gpu)
 {
 	DRM_DEV_INFO(&gpu->pdev->dev, "status:   %08x\n",
@@ -1509,7 +1522,9 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 
 	trace_msm_gpu_resume(0);
 
+	mutex_lock(&a6xx_gpu->gmu.lock);
 	ret = a6xx_gmu_resume(a6xx_gpu);
+	mutex_unlock(&a6xx_gpu->gmu.lock);
 	if (ret)
 		return ret;
 
@@ -1532,7 +1547,9 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 
 	msm_devfreq_suspend(gpu);
 
+	mutex_lock(&a6xx_gpu->gmu.lock);
 	ret = a6xx_gmu_stop(a6xx_gpu);
+	mutex_unlock(&a6xx_gpu->gmu.lock);
 	if (ret)
 		return ret;
 
@@ -1547,18 +1564,19 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-	static DEFINE_MUTEX(perfcounter_oob);
 
-	mutex_lock(&perfcounter_oob);
+	mutex_lock(&a6xx_gpu->gmu.lock);
 
 	/* Force the GPU power on so we can read this register */
 	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
 
 	*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER_LO,
-		REG_A6XX_CP_ALWAYS_ON_COUNTER_HI);
+			    REG_A6XX_CP_ALWAYS_ON_COUNTER_HI);
 
 	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
-	mutex_unlock(&perfcounter_oob);
+
+	mutex_unlock(&a6xx_gpu->gmu.lock);
+
 	return 0;
 }
 
@@ -1622,6 +1640,16 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
 	return (unsigned long)busy_time;
 }
 
+void a6xx_gpu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+
+	mutex_lock(&a6xx_gpu->gmu.lock);
+	a6xx_gmu_set_freq(gpu, opp);
+	mutex_unlock(&a6xx_gpu->gmu.lock);
+}
+
 static struct msm_gem_address_space *
 a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
 {
@@ -1766,7 +1794,7 @@ static const struct adreno_gpu_funcs funcs = {
 #endif
 		.gpu_busy = a6xx_gpu_busy,
 		.gpu_get_freq = a6xx_gmu_get_freq,
-		.gpu_set_freq = a6xx_gmu_set_freq,
+		.gpu_set_freq = a6xx_gpu_set_freq,
 #if defined(CONFIG_DRM_MSM_GPU_STATE)
 		.gpu_state_get = a6xx_gpu_state_get,
 		.gpu_state_put = a6xx_gpu_state_put,
-- 
2.31.1

