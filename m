Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1823D5BFA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 16:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BA56EDF9;
	Mon, 26 Jul 2021 14:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4748A6E49A;
 Mon, 26 Jul 2021 14:42:46 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id e5so9906321pld.6;
 Mon, 26 Jul 2021 07:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7QcrlTywukSz2PKz24z0zEJ3rCmK55/THXy/9fxZEN8=;
 b=N5DLQKs95Ra/6WhIDTJWzfdamAUA+HGnDFaHuBwvGw7F6ngrcPWy5fBhiXxAow3djk
 fNYIhEo5LZj6fKAGbl69yUUseFiBFMeKzctq9fwht6IBkLExso4mdoKH0gmLw6ixZfIg
 wa5WXjGycPtRxuajpToyMQgz6m29HOZ69j0ffST1ZiLA6kvYGAge0PmY4hufVxWTFwaJ
 fxv3Q9tt0mcaQSIUAqD8X8FH1EcbeyhDC4XxiI+zWpPIWmIVC4ctLVNuM5KvLA4lJkUl
 rdLsSf98LJIwKtkU7quIW+TSOvjZyCfOO8E0H7TUgCEnT3A7vknyHmtsixMJiPteyo/g
 ptyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7QcrlTywukSz2PKz24z0zEJ3rCmK55/THXy/9fxZEN8=;
 b=IJGqn+Vlxr5gUvJiosaGQhj1a9b4L5pLBzQtuI90kQzs9nja4LOhgRqvUhq9QcLEVZ
 MJGK2ojo8e+IXZgW3mKxbU0InVgJUQFMt1m3rUw2lSUSNGwZt0/Q2m7QfRbEeaI1ZMS6
 jDH2eQZw4hMS344a4wfOYjQ31dyFZRBwNEl9+4wahyl7EFpanyp/oOTaZSealZpVbUYT
 DtlzsfCn0TG8YbmoyQ2qenbqt5Nni4ZfNzKdxpXNuJg5n9KexhG86nYSZ5mZKSGR3lua
 5fl1MHtnAkMjIdIbbCXXlVipG+OsxXFfgtwDXQKX0JIlogTMUezf2YmVkO2lPnH1xzYJ
 KTDg==
X-Gm-Message-State: AOAM533PFXaB90iq9/W/QfZhcFa+ejQdOs4vbK4LYYxbMACcTeejcjje
 uwLSL5U5s6nXD6OmjOWS1yR80mWRf+7SuA==
X-Google-Smtp-Source: ABdhPJzeAdVynpqWMkO33MeI9BK8+7aHKZ25qaK5ssVs90hsKP33OvBBbWf83/PLhU7UO8TCc6/jDQ==
X-Received: by 2002:a17:902:74c9:b029:12b:60fa:bde0 with SMTP id
 f9-20020a17090274c9b029012b60fabde0mr14808293plt.8.1627310565295; 
 Mon, 26 Jul 2021 07:42:45 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id g12sm202316pfv.167.2021.07.26.07.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:42:44 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/msm: Split out devfreq handling
Date: Mon, 26 Jul 2021 07:46:48 -0700
Message-Id: <20210726144653.2180096-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726144653.2180096-1-robdclark@gmail.com>
References: <20210726144653.2180096-1-robdclark@gmail.com>
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
 drivers/gpu/drm/msm/msm_gpu.h         |  32 +++++--
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 133 ++++++++++++++++++++++++++
 5 files changed, 165 insertions(+), 121 deletions(-)
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
index 9db9f7847ea8..91f637b908f4 100644
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
index 647af45cf892..fedbd785e42f 100644
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
@@ -1116,5 +1006,5 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
 		kthread_destroy_worker(gpu->worker);
 	}
 
-	devfreq_cooling_unregister(gpu->cooling);
+	msm_devfreq_cleanup(gpu);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index ef41ec09f59c..2e61d05293e6 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -80,6 +80,26 @@ struct msm_gpu_fault_info {
 	const char *block;
 };
 
+/**
+ * struct msm_gpu_devfreq - devfreq related state
+ */
+struct msm_gpu_devfreq {
+	/** devfreq: devfreq instance */
+	struct devfreq *devfreq;
+
+	/**
+	 * busy_cycles:
+	 *
+	 * Used by implementation of gpu->gpu_busy() to track the last
+	 * busy counter value, for calculating elapsed busy cycles since
+	 * last sampling period.
+	 */
+	u64 busy_cycles;
+
+	/** time: Time of last sampling period. */
+	ktime_t time;
+};
+
 struct msm_gpu {
 	const char *name;
 	struct drm_device *dev;
@@ -151,11 +171,7 @@ struct msm_gpu {
 
 	struct drm_gem_object *memptrs_bo;
 
-	struct {
-		struct devfreq *devfreq;
-		u64 busy_cycles;
-		ktime_t time;
-	} devfreq;
+	struct msm_gpu_devfreq devfreq;
 
 	uint32_t suspend_count;
 
@@ -301,7 +317,11 @@ static inline void gpu_write64(struct msm_gpu *gpu, u32 lo, u32 hi, u64 val)
 
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

