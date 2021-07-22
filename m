Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F5C3D2FAE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 00:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21DA6ECF5;
	Thu, 22 Jul 2021 22:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D3C6ECF5;
 Thu, 22 Jul 2021 22:17:43 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 m2-20020a17090a71c2b0290175cf22899cso1242687pjs.2; 
 Thu, 22 Jul 2021 15:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KOj4T9MSF9gxvN5EZKSnYxLTf4ljzXVKQMqxx38M28M=;
 b=mZpAQSjCV17+qaPbtXgZ5eEFb+4CO3M2Zx+OEKYxNd3R2OoEEQbQCVKLAGL915e+Fw
 nphREHgjFC/Y0ansvqtf8IvbsvF81wZDNgneD/fCzVA9dCrWN7gD/8n49NWPzNtCyZh2
 dpghLZPzhXGiVaNQ13SagcquVJUiXr0yX9Zx+YVmSSjPpzdszRxd3wQlwlM8KMcDD3w6
 gNAfZvx1a3tiEFyEc7C+zOXVFvYnqRALFfbxbtQ+FlzMszf6iHaIq/6/h6sNNrh3Azjt
 NfWtvlMPWZEV28YJZZNiUSQ+QN77u+vds9QT6qooRciqpmPkyPtIoQ2I0m2XNQp24ecq
 o/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KOj4T9MSF9gxvN5EZKSnYxLTf4ljzXVKQMqxx38M28M=;
 b=YvAMUYBIT+FRsi31cn4BnrhrBdjrgkvdbmhkwX9guiNtms2qYYgOhHiVfCH36cF2l2
 rVeksppOap6FfaJOJPjC2Xhf0bHYif9xgA+8hXhQE4lQF5FkydowwuqvldE1p/Npy2Fm
 TcFh4ioPA+BnLMY46RAA8CAT7ZznWAUG919OQ6o9CI7GoWO/6vAny/4+WFKpO4hey9G+
 /yoVSarJnxO5NV17+vSgNwoqT0Prlco9ekojELCTUbEKaG82DEFcf2LITE8YyatGox15
 xQIFoAJbjuCiDbG+AlBG7CTYXpSua/PnbG+WEwL16+L5sBARzRvkajjywdbLRyj1qnCK
 GmZA==
X-Gm-Message-State: AOAM531w8igrr54dPFQ0QVEZeK2Ia4xKvZkA6yiFksVLPkhkyCexFU1G
 ekC7rrgPWrbF1JVMP7kj0vJ/3RsMR+nksg==
X-Google-Smtp-Source: ABdhPJx2WIFTxyaXEUhhk1qZC8990wqgTFa2FVN74TE5kE5mlZXFOp3f1jTam5iWhE0nQFO228llJg==
X-Received: by 2002:a17:90a:55c8:: with SMTP id
 o8mr10814843pjm.223.1626992262883; 
 Thu, 22 Jul 2021 15:17:42 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 5sm35794307pgv.25.2021.07.22.15.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 15:17:41 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/msm: Split out devfreq handling
Date: Thu, 22 Jul 2021 15:21:39 -0700
Message-Id: <20210722222145.1759900-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722222145.1759900-1-robdclark@gmail.com>
References: <20210722222145.1759900-1-robdclark@gmail.com>
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
 <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Before we start adding more cleverness, split it into it's own file.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/Makefile          |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |   4 +-
 drivers/gpu/drm/msm/msm_gpu.c         | 116 +---------------------
 drivers/gpu/drm/msm/msm_gpu.h         |  18 ++--
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 133 ++++++++++++++++++++++++++
 5 files changed, 151 insertions(+), 121 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_gpu_devfreq.c

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 2c00aa70b708..904535eda0c4 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -90,6 +90,7 @@ msm-y := \
 	msm_gem_submit.o \
 	msm_gem_vma.o \
 	msm_gpu.o \
+	msm_gpu_devfreq.o \
 	msm_iommu.o \
 	msm_perf.o \
 	msm_rd.o \
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a7df02298479..55ea136b8933 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1477,7 +1477,7 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
-	msm_gpu_resume_devfreq(gpu);
+	msm_devfreq_resume(gpu);
 
 	a6xx_llc_activate(a6xx_gpu);
 
@@ -1494,7 +1494,7 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 
 	a6xx_llc_deactivate(a6xx_gpu);
 
-	devfreq_suspend_device(gpu->devfreq.devfreq);
+	msm_devfreq_suspend(gpu);
 
 	ret = a6xx_gmu_stop(a6xx_gpu);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index c4e202f0366c..70d8610b1b73 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -13,8 +13,6 @@
 
 #include <generated/utsrelease.h>
 #include <linux/string_helpers.h>
-#include <linux/devfreq.h>
-#include <linux/devfreq_cooling.h>
 #include <linux/devcoredump.h>
 #include <linux/sched/task.h>
 
@@ -22,106 +20,6 @@
  * Power Management:
  */
 
-static int msm_devfreq_target(struct device *dev, unsigned long *freq,
-		u32 flags)
-{
-	struct msm_gpu *gpu = dev_to_gpu(dev);
-	struct dev_pm_opp *opp;
-
-	opp = devfreq_recommended_opp(dev, freq, flags);
-
-	if (IS_ERR(opp))
-		return PTR_ERR(opp);
-
-	trace_msm_gpu_freq_change(dev_pm_opp_get_freq(opp));
-
-	if (gpu->funcs->gpu_set_freq)
-		gpu->funcs->gpu_set_freq(gpu, opp);
-	else
-		clk_set_rate(gpu->core_clk, *freq);
-
-	dev_pm_opp_put(opp);
-
-	return 0;
-}
-
-static int msm_devfreq_get_dev_status(struct device *dev,
-		struct devfreq_dev_status *status)
-{
-	struct msm_gpu *gpu = dev_to_gpu(dev);
-	ktime_t time;
-
-	if (gpu->funcs->gpu_get_freq)
-		status->current_frequency = gpu->funcs->gpu_get_freq(gpu);
-	else
-		status->current_frequency = clk_get_rate(gpu->core_clk);
-
-	status->busy_time = gpu->funcs->gpu_busy(gpu);
-
-	time = ktime_get();
-	status->total_time = ktime_us_delta(time, gpu->devfreq.time);
-	gpu->devfreq.time = time;
-
-	return 0;
-}
-
-static int msm_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
-{
-	struct msm_gpu *gpu = dev_to_gpu(dev);
-
-	if (gpu->funcs->gpu_get_freq)
-		*freq = gpu->funcs->gpu_get_freq(gpu);
-	else
-		*freq = clk_get_rate(gpu->core_clk);
-
-	return 0;
-}
-
-static struct devfreq_dev_profile msm_devfreq_profile = {
-	.polling_ms = 10,
-	.target = msm_devfreq_target,
-	.get_dev_status = msm_devfreq_get_dev_status,
-	.get_cur_freq = msm_devfreq_get_cur_freq,
-};
-
-static void msm_devfreq_init(struct msm_gpu *gpu)
-{
-	/* We need target support to do devfreq */
-	if (!gpu->funcs->gpu_busy)
-		return;
-
-	msm_devfreq_profile.initial_freq = gpu->fast_rate;
-
-	/*
-	 * Don't set the freq_table or max_state and let devfreq build the table
-	 * from OPP
-	 * After a deferred probe, these may have be left to non-zero values,
-	 * so set them back to zero before creating the devfreq device
-	 */
-	msm_devfreq_profile.freq_table = NULL;
-	msm_devfreq_profile.max_state = 0;
-
-	gpu->devfreq.devfreq = devm_devfreq_add_device(&gpu->pdev->dev,
-			&msm_devfreq_profile, DEVFREQ_GOV_SIMPLE_ONDEMAND,
-			NULL);
-
-	if (IS_ERR(gpu->devfreq.devfreq)) {
-		DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize GPU devfreq\n");
-		gpu->devfreq.devfreq = NULL;
-		return;
-	}
-
-	devfreq_suspend_device(gpu->devfreq.devfreq);
-
-	gpu->cooling = of_devfreq_cooling_register(gpu->pdev->dev.of_node,
-			gpu->devfreq.devfreq);
-	if (IS_ERR(gpu->cooling)) {
-		DRM_DEV_ERROR(&gpu->pdev->dev,
-				"Couldn't register GPU cooling device\n");
-		gpu->cooling = NULL;
-	}
-}
-
 static int enable_pwrrail(struct msm_gpu *gpu)
 {
 	struct drm_device *dev = gpu->dev;
@@ -196,14 +94,6 @@ static int disable_axi(struct msm_gpu *gpu)
 	return 0;
 }
 
-void msm_gpu_resume_devfreq(struct msm_gpu *gpu)
-{
-	gpu->devfreq.busy_cycles = 0;
-	gpu->devfreq.time = ktime_get();
-
-	devfreq_resume_device(gpu->devfreq.devfreq);
-}
-
 int msm_gpu_pm_resume(struct msm_gpu *gpu)
 {
 	int ret;
@@ -223,7 +113,7 @@ int msm_gpu_pm_resume(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
-	msm_gpu_resume_devfreq(gpu);
+	msm_devfreq_resume(gpu);
 
 	gpu->needs_hw_init = true;
 
@@ -237,7 +127,7 @@ int msm_gpu_pm_suspend(struct msm_gpu *gpu)
 	DBG("%s", gpu->name);
 	trace_msm_gpu_suspend(0);
 
-	devfreq_suspend_device(gpu->devfreq.devfreq);
+	msm_devfreq_suspend(gpu);
 
 	ret = disable_axi(gpu);
 	if (ret)
@@ -1082,5 +972,5 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
 		kthread_destroy_worker(gpu->worker);
 	}
 
-	devfreq_cooling_unregister(gpu->cooling);
+	msm_devfreq_cleanup(gpu);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 090cb89fa238..ada15e28f251 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -80,6 +80,12 @@ struct msm_gpu_fault_info {
 	const char *block;
 };
 
+struct msm_gpu_devfreq {
+	struct devfreq *devfreq;
+	u64 busy_cycles;
+	ktime_t time;
+};
+
 struct msm_gpu {
 	const char *name;
 	struct drm_device *dev;
@@ -151,11 +157,7 @@ struct msm_gpu {
 
 	struct drm_gem_object *memptrs_bo;
 
-	struct {
-		struct devfreq *devfreq;
-		u64 busy_cycles;
-		ktime_t time;
-	} devfreq;
+	struct msm_gpu_devfreq devfreq;
 
 	uint32_t suspend_count;
 
@@ -377,7 +379,11 @@ static inline void gpu_write64(struct msm_gpu *gpu, u32 lo, u32 hi, u64 val)
 
 int msm_gpu_pm_suspend(struct msm_gpu *gpu);
 int msm_gpu_pm_resume(struct msm_gpu *gpu);
-void msm_gpu_resume_devfreq(struct msm_gpu *gpu);
+
+void msm_devfreq_init(struct msm_gpu *gpu);
+void msm_devfreq_cleanup(struct msm_gpu *gpu);
+void msm_devfreq_resume(struct msm_gpu *gpu);
+void msm_devfreq_suspend(struct msm_gpu *gpu);
 
 int msm_gpu_hw_init(struct msm_gpu *gpu);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
new file mode 100644
index 000000000000..3bcea0baddab
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013 Red Hat
+ * Author: Rob Clark <robdclark@gmail.com>
+ */
+
+#include "msm_gpu.h"
+#include "msm_gpu_trace.h"
+
+#include <linux/devfreq.h>
+#include <linux/devfreq_cooling.h>
+
+/*
+ * Power Management:
+ */
+
+static int msm_devfreq_target(struct device *dev, unsigned long *freq,
+		u32 flags)
+{
+	struct msm_gpu *gpu = dev_to_gpu(dev);
+	struct dev_pm_opp *opp;
+
+	opp = devfreq_recommended_opp(dev, freq, flags);
+
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
+
+	trace_msm_gpu_freq_change(dev_pm_opp_get_freq(opp));
+
+	if (gpu->funcs->gpu_set_freq)
+		gpu->funcs->gpu_set_freq(gpu, opp);
+	else
+		clk_set_rate(gpu->core_clk, *freq);
+
+	dev_pm_opp_put(opp);
+
+	return 0;
+}
+
+static int msm_devfreq_get_dev_status(struct device *dev,
+		struct devfreq_dev_status *status)
+{
+	struct msm_gpu *gpu = dev_to_gpu(dev);
+	ktime_t time;
+
+	if (gpu->funcs->gpu_get_freq)
+		status->current_frequency = gpu->funcs->gpu_get_freq(gpu);
+	else
+		status->current_frequency = clk_get_rate(gpu->core_clk);
+
+	status->busy_time = gpu->funcs->gpu_busy(gpu);
+
+	time = ktime_get();
+	status->total_time = ktime_us_delta(time, gpu->devfreq.time);
+	gpu->devfreq.time = time;
+
+	return 0;
+}
+
+static int msm_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
+{
+	struct msm_gpu *gpu = dev_to_gpu(dev);
+
+	if (gpu->funcs->gpu_get_freq)
+		*freq = gpu->funcs->gpu_get_freq(gpu);
+	else
+		*freq = clk_get_rate(gpu->core_clk);
+
+	return 0;
+}
+
+static struct devfreq_dev_profile msm_devfreq_profile = {
+	.polling_ms = 10,
+	.target = msm_devfreq_target,
+	.get_dev_status = msm_devfreq_get_dev_status,
+	.get_cur_freq = msm_devfreq_get_cur_freq,
+};
+
+void msm_devfreq_init(struct msm_gpu *gpu)
+{
+	/* We need target support to do devfreq */
+	if (!gpu->funcs->gpu_busy)
+		return;
+
+	msm_devfreq_profile.initial_freq = gpu->fast_rate;
+
+	/*
+	 * Don't set the freq_table or max_state and let devfreq build the table
+	 * from OPP
+	 * After a deferred probe, these may have be left to non-zero values,
+	 * so set them back to zero before creating the devfreq device
+	 */
+	msm_devfreq_profile.freq_table = NULL;
+	msm_devfreq_profile.max_state = 0;
+
+	gpu->devfreq.devfreq = devm_devfreq_add_device(&gpu->pdev->dev,
+			&msm_devfreq_profile, DEVFREQ_GOV_SIMPLE_ONDEMAND,
+			NULL);
+
+	if (IS_ERR(gpu->devfreq.devfreq)) {
+		DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize GPU devfreq\n");
+		gpu->devfreq.devfreq = NULL;
+		return;
+	}
+
+	devfreq_suspend_device(gpu->devfreq.devfreq);
+
+	gpu->cooling = of_devfreq_cooling_register(gpu->pdev->dev.of_node,
+			gpu->devfreq.devfreq);
+	if (IS_ERR(gpu->cooling)) {
+		DRM_DEV_ERROR(&gpu->pdev->dev,
+				"Couldn't register GPU cooling device\n");
+		gpu->cooling = NULL;
+	}
+}
+
+void msm_devfreq_cleanup(struct msm_gpu *gpu)
+{
+	devfreq_cooling_unregister(gpu->cooling);
+}
+
+void msm_devfreq_resume(struct msm_gpu *gpu)
+{
+	gpu->devfreq.busy_cycles = 0;
+	gpu->devfreq.time = ktime_get();
+
+	devfreq_resume_device(gpu->devfreq.devfreq);
+}
+
+void msm_devfreq_suspend(struct msm_gpu *gpu)
+{
+	devfreq_suspend_device(gpu->devfreq.devfreq);
+}
-- 
2.31.1

