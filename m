Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A5825E9F6
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 22:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B90D6E260;
	Sat,  5 Sep 2020 20:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F218F6E260;
 Sat,  5 Sep 2020 20:04:10 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id s2so4570656pjr.4;
 Sat, 05 Sep 2020 13:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eBuEDGfYTy5PPn1RDxCycEVRZJaKkkv9eSmYF9/QNHA=;
 b=rBj7GWccfosFE5ZBxHIGrVT0r+K4byI3/hnMfzfkdhsP6dHgrnWuatoE2Hcu7egNBN
 h48KLqcTSVasryom6dH1s1FsCm7iVkSfNO5vxZ24cjYQukx8Rpw0AhWlHnw5qtymJCDK
 xyhsJ63y+KWEcozt1vkTgde5z8ha20eAV2xWI/GdqdGcD26kwh2Dzmv3NL4uxcU3OA9X
 BzEcSbi/GINB8iau0JS5h8q+00AELGfirlHFP6u6q0FJORf1fToSiXMSROk0DoLPblam
 zCpkMoPjbkHSs3rSmkVoM/8nn1REWd32/nW7NKiY1NEuTnI13gcJ8L6WnEsegmWrQQTE
 7FVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eBuEDGfYTy5PPn1RDxCycEVRZJaKkkv9eSmYF9/QNHA=;
 b=ZDxDKlnDS32WYZrvBEv6FeBdg8LZtwOGnF73OsrTEg1a1Gn7L+DoSSG7Hv014+5Y9I
 0O7s5rsW2QYFcUAqRXwm39veEJXcI5pJSYePMkPw5hB9VqQCafDfeEGNwF4mP8DPhvrG
 shqwd1uZhuxNt9DTI6mAoyOgl1lO95NZYV04wZ0QDNylcPs/mBX8cnWBZAjz2HD0EiLw
 yJMhoaWSpHSecdN2voogncvB/QOLhPJWCmnfL26Ntwk6EVMG7eDDldOJDySlC+d5NOJu
 +BQ7ds29+6e4mi+L4P785uOp/ADDoynGvwbS8XMf17z9l0t0bv8tYDKBXfWSKJettmHT
 ffMg==
X-Gm-Message-State: AOAM5326Z55AgA1yVHZJWBOdhWYduMFiyGgrMVqUsAnqb2HOHT9/DNqY
 wPqS0O6GxpupaQ2XZ8XiVpQ=
X-Google-Smtp-Source: ABdhPJzbfLaU/Mp1zLSe6ZuOihRa4QPrTK7zg3slAeaOAvr6/R99b+0gyQAeENp1hLMOVDs8q3JHEw==
X-Received: by 2002:a17:90a:e545:: with SMTP id
 ei5mr5624951pjb.45.1599336250560; 
 Sat, 05 Sep 2020 13:04:10 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 u3sm8034863pjn.29.2020.09.05.13.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 13:04:09 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v17 04/20] drm/msm: Set adreno_smmu as gpu's drvdata
Date: Sat,  5 Sep 2020 13:04:10 -0700
Message-Id: <20200905200454.240929-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200905200454.240929-1-robdclark@gmail.com>
References: <20200905200454.240929-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
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
index 4c67aedc5c33..144dd63e747e 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -892,7 +892,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		gpu->gpu_cx = NULL;
 
 	gpu->pdev = pdev;
-	platform_set_drvdata(pdev, gpu);
+	platform_set_drvdata(pdev, &gpu->adreno_smmu);
 
 	msm_devfreq_init(gpu);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index da1ae2263047..1f65aec57a8f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -7,6 +7,7 @@
 #ifndef __MSM_GPU_H__
 #define __MSM_GPU_H__
 
+#include <linux/adreno-smmu-priv.h>
 #include <linux/clk.h>
 #include <linux/interconnect.h>
 #include <linux/pm_opp.h>
@@ -74,6 +75,8 @@ struct msm_gpu {
 	struct platform_device *pdev;
 	const struct msm_gpu_funcs *funcs;
 
+	struct adreno_smmu_priv adreno_smmu;
+
 	/* performance counters (hw & sw): */
 	spinlock_t perf_lock;
 	bool perfcntr_active;
@@ -146,7 +149,8 @@ struct msm_gpu {
 
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
