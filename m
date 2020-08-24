Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A96AB25080B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 20:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07AE6E456;
	Mon, 24 Aug 2020 18:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A4C6E2EC;
 Mon, 24 Aug 2020 18:42:15 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id mw10so4659728pjb.2;
 Mon, 24 Aug 2020 11:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OaIqnFEnSkG5jht+rvtzHghjtM2fJzi44KHW2/E9B5c=;
 b=AgaUrq3IFFV5Lf01o7fJOsRYsvGbkYY3/ima/MrQvHWPWBb2drUk030D42JzUT9kZ8
 /acRI0/VCLzKQYh3EcubguRil6MUbbyqmtzAcaD5c1WOayFSleoMpts0FjHzv6pE+pvt
 NuhjGiPbKCriwoy9J5x5Yh+CeaXA4DJN9J/XEwzb+4op2GAZecSriSoIZdHR5r/ZbJG3
 sGac31uioQhiN2nFsC3ve5ZNOFyi+nBZS7qPWhdGCH82bd32jBcVwWM8mrKTI2ogRCMV
 ckK57GELg7KFkiJaPYHgFCc7UCCf+Rpon5pq/0esktb9QUrhVxaRWk2gBmNrL0ycVwaB
 WrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OaIqnFEnSkG5jht+rvtzHghjtM2fJzi44KHW2/E9B5c=;
 b=s+tG4RFnmCA1qpVsYenKA4vHv7gsdnSSaJoxtohOV+k8PVNXAQdXK0nWb9ge1jvZJh
 ZRDSa8P06S5YKW3FUek3B8fhAVyezy9kxki3oGIDrWnE0o8auousH7ehaQ2IsF6AG4Xs
 uIzl5h9sRxLdgNMHObNl3CIV9XILDPJ6cBzt/5BQENrSLCI4XtRUWhgghFRNt8ZqPTiG
 O2xJXC5AAQps9vwsFEs73mbnj5IwsrCmV8tFrBpiTU56fhnMxjKTDW986+nACBFojc0v
 uE64nMHT61xReQDiG1dtPxuO0n0dzVgPkDv5Dyve93mSth/viQ7Ob/VvD6AezVBBnCP2
 hyeA==
X-Gm-Message-State: AOAM530EuZyb+Fl2tDvH90ys1j9tFSXhP+WRMwOm9c+KECIfvt0LI/YE
 7bU2ryn/OqIgr0QpZqNUwA9XgZnuU0WZ0v2n
X-Google-Smtp-Source: ABdhPJweO3UyH2UJ+2+a0TD5oHmb7hduBj4c5LDpUnnEK2vzWIpwK/LZ/DbqTaanUusvrGqkAfuuzg==
X-Received: by 2002:a17:90b:ec1:: with SMTP id gz1mr516986pjb.48.1598294534710; 
 Mon, 24 Aug 2020 11:42:14 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id o16sm13248453pfu.188.2020.08.24.11.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 11:42:13 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 06/20] drm/msm/gpu: add dev_to_gpu() helper
Date: Mon, 24 Aug 2020 11:37:40 -0700
Message-Id: <20200824183825.1778810-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200824183825.1778810-1-robdclark@gmail.com>
References: <20200824183825.1778810-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Akhil P Oommen <akhilpo@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Joerg Roedel <joro@8bytes.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Sibi Sankar <sibis@codeaurora.org>,
 Brian Masney <masneyb@onstation.org>, Joerg Roedel <jroedel@suse.de>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In a later patch, the drvdata will not directly be 'struct msm_gpu *',
so add a helper to reduce the churn.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 10 ++++------
 drivers/gpu/drm/msm/msm_gpu.c              |  6 +++---
 drivers/gpu/drm/msm/msm_gpu.h              |  5 +++++
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 9eeb46bf2a5d..26664e1b30c0 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -282,7 +282,7 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
 	int ret;
 
 	if (pdev)
-		gpu = platform_get_drvdata(pdev);
+		gpu = dev_to_gpu(&pdev->dev);
 
 	if (!gpu) {
 		dev_err_once(dev->dev, "no GPU device was found\n");
@@ -425,7 +425,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 static void adreno_unbind(struct device *dev, struct device *master,
 		void *data)
 {
-	struct msm_gpu *gpu = dev_get_drvdata(dev);
+	struct msm_gpu *gpu = dev_to_gpu(dev);
 
 	pm_runtime_force_suspend(dev);
 	gpu->funcs->destroy(gpu);
@@ -490,16 +490,14 @@ static const struct of_device_id dt_match[] = {
 #ifdef CONFIG_PM
 static int adreno_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_gpu *gpu = platform_get_drvdata(pdev);
+	struct msm_gpu *gpu = dev_to_gpu(dev);
 
 	return gpu->funcs->pm_resume(gpu);
 }
 
 static int adreno_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_gpu *gpu = platform_get_drvdata(pdev);
+	struct msm_gpu *gpu = dev_to_gpu(dev);
 
 	return gpu->funcs->pm_suspend(gpu);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index d5645472b25d..6aa9e04e52e7 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -24,7 +24,7 @@
 static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 		u32 flags)
 {
-	struct msm_gpu *gpu = platform_get_drvdata(to_platform_device(dev));
+	struct msm_gpu *gpu = dev_to_gpu(dev);
 	struct dev_pm_opp *opp;
 
 	opp = devfreq_recommended_opp(dev, freq, flags);
@@ -45,7 +45,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 static int msm_devfreq_get_dev_status(struct device *dev,
 		struct devfreq_dev_status *status)
 {
-	struct msm_gpu *gpu = platform_get_drvdata(to_platform_device(dev));
+	struct msm_gpu *gpu = dev_to_gpu(dev);
 	ktime_t time;
 
 	if (gpu->funcs->gpu_get_freq)
@@ -64,7 +64,7 @@ static int msm_devfreq_get_dev_status(struct device *dev,
 
 static int msm_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
 {
-	struct msm_gpu *gpu = platform_get_drvdata(to_platform_device(dev));
+	struct msm_gpu *gpu = dev_to_gpu(dev);
 
 	if (gpu->funcs->gpu_get_freq)
 		*freq = gpu->funcs->gpu_get_freq(gpu);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 0db117a7339b..8bda7beaed4b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -141,6 +141,11 @@ struct msm_gpu {
 	struct msm_gpu_state *crashstate;
 };
 
+static inline struct msm_gpu *dev_to_gpu(struct device *dev)
+{
+	return dev_get_drvdata(dev);
+}
+
 /* It turns out that all targets use the same ringbuffer size */
 #define MSM_GPU_RINGBUFFER_SZ SZ_32K
 #define MSM_GPU_RINGBUFFER_BLKSIZE 32
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
