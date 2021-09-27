Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC234419DB5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 19:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7AF89E9B;
	Mon, 27 Sep 2021 17:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB4289EF7;
 Mon, 27 Sep 2021 17:59:11 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id k17so16578201pff.8;
 Mon, 27 Sep 2021 10:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x9PMRkScYQE770/qQauf0OHWoe2ppRvX6b1V34h55go=;
 b=f67WuWGQdjQS1Rw05S8XTSDl3zZnbdr3JW8bKXlR0nyfJZfHQnPIPtfa1URWA86t7z
 /RA2/B5Ffm1DSfoAJJYrDPpcj6uAOjlWfa3mFLEKUAJJI941cr2O6Z2bYejcnDXbFkfA
 aBmSvFPIQPETZ2UJ0l9PqPfeYIxyX5D2eyI7ujcLbqzrzXO1+GS6gSQt3TDZEVOwr3Fc
 dt/Ayf4VdULHQvEYnnORHitt2qWkfz+8MdfLgVvBJw9+0ExDMhAwYu2HRMPjGGsmutOW
 EhFuJjrSMxxwXy8oIgXXV3M10JxecZHmgtLyY8uraDYSGOhHfaVKpMY6HVV5OmyZ9gpb
 cfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x9PMRkScYQE770/qQauf0OHWoe2ppRvX6b1V34h55go=;
 b=UU12nnw0RNDfXOhLPGqVjInZCpH4rin3io+MIBxNu8rBjEZ0EADdgwv+flI8Woahym
 OrxOBTCpBWWfH0QvE1qOPhVx52wdmg+xB4aQGiZAMWMjXtEpy8DAKOYwbrJnZJfnn9kA
 80TDVbFRROstI0iVM5JeXoX+WSydAzIrLsuEJ4y0NbkCBBEUE51tJSefpOgB8UnE1WB/
 OCjEF5I47NYfWFAH6D+wtSaV+21MyVaLyff0Ut471tVbkMLIEdTgX4S5HDrxyr6lOPFl
 v9jAuXFrnmcgW4Tnj4TkrFTDjbPMaAwnVCndYHDNw//Rn7x6w3/uDtahLQw61KcEqfnh
 P0NQ==
X-Gm-Message-State: AOAM5309XpLRulLTOXdzNThqBeOaeFg0dUtakZPzfdXoVKPaiBDDydJv
 1meGF9rVctYHZOB6Z2osMbEiILsYMso=
X-Google-Smtp-Source: ABdhPJzPOmpQm77WyPV4rWtuv1w5GGK5dAwbu3Z8W7q7U8XKwZWq9/wQKiALSx3IkLjsOkkE9Us7zg==
X-Received: by 2002:a62:1dc5:0:b0:43e:f8a4:49a7 with SMTP id
 d188-20020a621dc5000000b0043ef8a449a7mr1328178pfd.26.1632765550594; 
 Mon, 27 Sep 2021 10:59:10 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 p10sm18780974pge.38.2021.09.27.10.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 10:59:09 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>,
 Eric Anholt <eric@anholt.net>, Akhil P Oommen <akhilpo@codeaurora.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [RFC] drm/msm/a6xx: Serialize GMU communication
Date: Mon, 27 Sep 2021 11:03:40 -0700
Message-Id: <20210927180345.878859-1-robdclark@gmail.com>
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
Are we allowed to use c99/gnu99 yet?

 drivers/gpu/drm/msm/Makefile          |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  6 ++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  9 +++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 50 ++++++++++++++++++++-------
 4 files changed, 54 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 904535eda0c4..57283bbad3f0 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-ccflags-y := -I $(srctree)/$(src)
+ccflags-y := -I $(srctree)/$(src) -std=gnu99
 ccflags-y += -I $(srctree)/$(src)/disp/dpu1
 ccflags-$(CONFIG_DRM_MSM_DSI) += -I $(srctree)/$(src)/dsi
 ccflags-$(CONFIG_DRM_MSM_DP) += -I $(srctree)/$(src)/dp
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
index 3c74f64e3126..f05a00c0afd0 100644
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
@@ -88,6 +91,12 @@ struct a6xx_gmu {
 	bool legacy; /* a618 or a630 */
 };
 
+/* Helper macro for serializing GMU access: */
+#define with_gmu_lock(gmu) \
+	for (bool done = ({ mutex_lock(&(gmu)->lock); false; }); \
+		!done; \
+		done = ({ mutex_unlock(&(gmu)->lock); true; }))
+
 static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
 {
 	return msm_readl(gmu->mmio + (offset << 2));
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index f6a4dbef796b..5e1ae3df42ba 100644
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
+	with_gmu_lock(&a6xx_gpu->gmu) {
+		ret = hw_init(gpu);
+	}
+
+	return ret;
+}
+
 static void a6xx_dump(struct msm_gpu *gpu)
 {
 	DRM_DEV_INFO(&gpu->pdev->dev, "status:   %08x\n",
@@ -1509,7 +1522,9 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 
 	trace_msm_gpu_resume(0);
 
-	ret = a6xx_gmu_resume(a6xx_gpu);
+	with_gmu_lock(&a6xx_gpu->gmu) {
+		ret = a6xx_gmu_resume(a6xx_gpu);
+	}
 	if (ret)
 		return ret;
 
@@ -1532,7 +1547,9 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 
 	msm_devfreq_suspend(gpu);
 
-	ret = a6xx_gmu_stop(a6xx_gpu);
+	with_gmu_lock(&a6xx_gpu->gmu) {
+		ret = a6xx_gmu_stop(a6xx_gpu);
+	}
 	if (ret)
 		return ret;
 
@@ -1547,18 +1564,17 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-	static DEFINE_MUTEX(perfcounter_oob);
 
-	mutex_lock(&perfcounter_oob);
+	with_gmu_lock(&a6xx_gpu->gmu) {
+		/* Force the GPU power on so we can read this register */
+		a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
 
-	/* Force the GPU power on so we can read this register */
-	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
+		*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER_LO,
+				    REG_A6XX_CP_ALWAYS_ON_COUNTER_HI);
 
-	*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER_LO,
-		REG_A6XX_CP_ALWAYS_ON_COUNTER_HI);
+		a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
+	}
 
-	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
-	mutex_unlock(&perfcounter_oob);
 	return 0;
 }
 
@@ -1622,6 +1638,16 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
 	return (unsigned long)busy_time;
 }
 
+void a6xx_gpu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+
+	with_gmu_lock(&a6xx_gpu->gmu) {
+		a6xx_gmu_set_freq(gpu, opp);
+	}
+}
+
 static struct msm_gem_address_space *
 a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
 {
@@ -1766,7 +1792,7 @@ static const struct adreno_gpu_funcs funcs = {
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

