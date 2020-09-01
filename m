Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E70A259A08
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 18:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50FBE6E89D;
	Tue,  1 Sep 2020 16:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C446E8A5;
 Tue,  1 Sep 2020 16:46:33 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id v196so449922pfc.1;
 Tue, 01 Sep 2020 09:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9GY8MTV08PrdHUp+EWWyNucwylbtR4J8MJ49qiKRTr8=;
 b=diYFxRQBFCAYzBMr1oUdzb90W8KPNy1WuyBKtljKjHAsRM6NJtOgedMjx4M0bbCDQg
 1NokvIoSeI5QQcdk6vTojUxuiMokN3r33V1FHU8uVaQ14ufEsfsb3Nvx1iVIBAexr9H/
 283ozm+4h7ZptZESKcLhyBqrLn89MnSBsD9w0mibZJZ7q0oEdNm6nJpnsenZRJHEuHPY
 Bz+lAcKZMBzXfwiFf0M2NtgabZxm4VoIyDyGNYia6T7GB7gtM49q9T0bxdundFLyn1Iu
 ouTkPBFotIrezZ9aXt71kBbK+tYVdLk09S967qZQ4Emfr+8HXiXcg5A2UTZMlWa/dxCX
 hHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9GY8MTV08PrdHUp+EWWyNucwylbtR4J8MJ49qiKRTr8=;
 b=EH9vTn3uTJNYoelEH75QFfM71o2kB9NtTYqLtHwjc3p5INA4UhLAtRi5tflFqqNOGb
 alN54iSKB9sdtMcodnIAs7P6yVTYC7ue8e0b4BFlCH4ZfMRmz++sEZmHV+hM3hgDzd8i
 1xJBNpBeT5CXPVwNg6HtCUqC2I5TnzEBZYwUgv2C6ku5QJjqZKYQl3+DoFMW0aKkAGD5
 MtGspBGI8967OJSKSm+ZC0x0BueXICiShpEXFTiKF5pla8W4pUpfO9iNtOFxBPTF/vr8
 wJ1WSe/w8KH1VMe1Z91AQVMyjaqyerdBbQVa71+gSnTa2E8PMmZdC45jtMzQYjc0U8hQ
 3WOA==
X-Gm-Message-State: AOAM530vPhmcp6Rdj4MWzJueKkUz+DvghCy/Hl0KDi1NkfyXdGgWacCW
 m41M9RVwYR7IKDIHgijrUDQlBNuOvh16YjoC
X-Google-Smtp-Source: ABdhPJxkErnGII/ajapuRB93tieR8/YaguR9xdhO4M2IHzqSfAfV4/ovlSOHBb+EyThZc7WuL4iTfA==
X-Received: by 2002:a63:2043:: with SMTP id r3mr2258427pgm.289.1598978792128; 
 Tue, 01 Sep 2020 09:46:32 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id s187sm79986pfc.134.2020.09.01.09.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 09:46:31 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v16 04/20] drm/msm: Set adreno_smmu as gpu's drvdata
Date: Tue,  1 Sep 2020 09:46:21 -0700
Message-Id: <20200901164707.2645413-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901164707.2645413-1-robdclark@gmail.com>
References: <20200901164707.2645413-1-robdclark@gmail.com>
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
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This will be populated by adreno-smmu, to provide a way for coordinating
enabling/disabling TTBR0 translation.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 2 --
 drivers/gpu/drm/msm/msm_gpu.c              | 2 +-
 drivers/gpu/drm/msm/msm_gpu.h              | 6 +++++-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 26664e1b30c0..58e03b20e1c7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -417,8 +417,6 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(gpu);
 	}
 
-	dev_set_drvdata(dev, gpu);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 6aa9e04e52e7..806eb0957280 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -892,7 +892,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		gpu->gpu_cx = NULL;
 
 	gpu->pdev = pdev;
-	platform_set_drvdata(pdev, gpu);
+	platform_set_drvdata(pdev, &gpu->adreno_smmu);
 
 	msm_devfreq_init(gpu);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 8bda7beaed4b..f91b141add75 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -7,6 +7,7 @@
 #ifndef __MSM_GPU_H__
 #define __MSM_GPU_H__
 
+#include <linux/adreno-smmu-priv.h>
 #include <linux/clk.h>
 #include <linux/interconnect.h>
 #include <linux/pm_opp.h>
@@ -73,6 +74,8 @@ struct msm_gpu {
 	struct platform_device *pdev;
 	const struct msm_gpu_funcs *funcs;
 
+	struct adreno_smmu_priv adreno_smmu;
+
 	/* performance counters (hw & sw): */
 	spinlock_t perf_lock;
 	bool perfcntr_active;
@@ -143,7 +146,8 @@ struct msm_gpu {
 
 static inline struct msm_gpu *dev_to_gpu(struct device *dev)
 {
-	return dev_get_drvdata(dev);
+	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(dev);
+	return container_of(adreno_smmu, struct msm_gpu, adreno_smmu);
 }
 
 /* It turns out that all targets use the same ringbuffer size */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
