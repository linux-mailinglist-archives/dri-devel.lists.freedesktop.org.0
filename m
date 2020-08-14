Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5E524434D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D596EADC;
	Fri, 14 Aug 2020 02:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0858D6EAF0;
 Fri, 14 Aug 2020 02:41:23 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id ep8so3700536pjb.3;
 Thu, 13 Aug 2020 19:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wvz5YKiT932AWU4GOoumP4PC6lpfTwxubtkW9TJEg2g=;
 b=BY1djzUz+d/FaHPXRf8zOyhi08GOGS0hirvcPAsRghIkOsjdUuKuMMyqlO4f6hT0cI
 i7u0JfTwggmLPZbHSaceG2c3CH86UErv7laONOr+eg+QNJ3Fpj5vNL5T6V8SPU2Yj5Uv
 bBnolp/TOSK65L9B15Upktswzx0alm2zg1nj/mk76yuZ+oe19SsItpmo6RODs5Agt9ae
 aLwOCvULFDESiwZJrXmMQShRjaL5T72AgMOTueBZfqnH/tSv3Rx5lGrZt2t6TYU5JDap
 Z4nOzcW0iVPyhNu5uzxJ92fkdqAHV+kybDOx2aGKcvOZInD1wXK86qMLLuBP0dulv5rY
 RCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wvz5YKiT932AWU4GOoumP4PC6lpfTwxubtkW9TJEg2g=;
 b=L90mlbZpa9UYSrS0qMGnr5H1d14TkWSH4wlkDWfYEnJp0/jaM7TLGHjkl/6LP5cWJf
 NGpOs6r7O8gM3N339Gc3uwUsyTtx2pJuio5shXSEhtvt0ySfmjf7gir3jE6DxYcZx+ut
 hr5uZf8KrC8XbMs33Ys7jymgg+5+A7CAbuAC2XQ+6AoiTIBEw3T5rbmJggxG6ZG1yiWs
 Rj14b3+cirhPXbXgNUskwJWwIsoxOOQ236du11vCbvqNLhgXdqxqgGioXHnR72sHoSOW
 SWaS5mtVU2Qi8ih1/d35+8vQ+I8qS4YfJ1EGFHhY9ue3dD9YMSRP7DzuzYzHn5QvIGP1
 ktaw==
X-Gm-Message-State: AOAM53080GxErFXsuMeqwja3ZvE8EAB8BJg1ry/eNdwEsNccpFjLyOJi
 MeMUteBuEDJgQ1bvijwkVgPmMFs2vEIsKg==
X-Google-Smtp-Source: ABdhPJy4dHAT604MoCIe4Uk9f4LkQMWMG3gqnhqu2rwnAqeOg+nz/DkG02oCFmjTMkKZbIOZsZxW/Q==
X-Received: by 2002:a17:902:8bcc:: with SMTP id
 r12mr539052plo.314.1597372882332; 
 Thu, 13 Aug 2020 19:41:22 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id y10sm7200316pff.177.2020.08.13.19.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 19:41:21 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 06/19] drm/msm/gpu: add dev_to_gpu() helper
Date: Thu, 13 Aug 2020 19:41:01 -0700
Message-Id: <20200814024114.1177553-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200810222657.1841322-1-jcrouse@codeaurora.org>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 Sharat Masetty <smasetty@codeaurora.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In a later patch, the drvdata will not directly be 'struct msm_gpu *',
so add a helper to reduce the churn.

Signed-off-by: Rob Clark <robdclark@chromium.org>
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
