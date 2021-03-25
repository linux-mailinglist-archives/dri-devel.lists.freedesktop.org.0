Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FF0348655
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 02:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FF46EB04;
	Thu, 25 Mar 2021 01:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E996EB03;
 Thu, 25 Mar 2021 01:20:45 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id l3so316960pfc.7;
 Wed, 24 Mar 2021 18:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sa9rRO43y1B+/upjtWDeuqkMJ0Hr4TpHsHjlP2Qs1RM=;
 b=OYKe8fJM3o7gVtlVc70JmMSa5jnG/WHxJjuOzmSjN5bLrU6MhDs63YIEQHg/Y1X/ja
 WF5qqo2d7LhI1gBd0mWoSD7meICB8ueXBaHXsagciFHt55dnAW0kDb6g8RXh0QJ+NJRY
 GXY5hIF83xSmII8sAGN5Q1wpnhOfFl2AL23ey2KFefwGreplS6aspiwP72AtOMq9Cyi+
 osQ0BQ5hk31OCYbQAbQDxxFlz23U+URSQgL4pTqEkFfGFr72Tkf544zdOC38wyvJdnEh
 WBDSVfBvHSs9FXG8zW1+VtMO6QNysX4B9PkDHcSBFOqO51ZgPTdZL4hi/PDitD8ijlj1
 GRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sa9rRO43y1B+/upjtWDeuqkMJ0Hr4TpHsHjlP2Qs1RM=;
 b=B+0v+DA/rbN62FMqrrzfZCH0yZNhGsXYjKXqW897G0uoJ0n8m8RpU5q4II2NVytZV2
 JGM7CP9eDkt7HYtdoxDN6gxnBVnX+490mcRZ2S5GBU5b9OfpdulGYYbjaAceu3kwLlrb
 dFFtqIjswAJ6fciKEihLTYgAhUgDXNkW1QvlgLbbbUGNnFPyFtbD9q4QV3ZISkmQyEYz
 IaKjUJB2xVH9d+h7cOaGjZDsP5YMwJYFavNjrG4rcsdTXSm5v/BI6zw+Ey+CXIgXOpb1
 1rgAP8uLqsoS4i8JUKimmqhuTtD8ZilZff+6RNOZqFtBMt57OJTy/VeyyoOEDmb00hpP
 OqcQ==
X-Gm-Message-State: AOAM533iAWW/V/b4T7Uq3uU9GUDhMFFm3pxqfnFVk9k9lv62xMOCrG02
 RBV1Nz2RLopM3+xWxhSB360nyV05oIM=
X-Google-Smtp-Source: ABdhPJwlvOpwfxlO1r3DymaRU532rmUPOXvwLwIDzeuogggJ73XJeQiliaTpUYUf8+v37mov4tt9jA==
X-Received: by 2002:a63:ea01:: with SMTP id c1mr5553114pgi.236.1616635244929; 
 Wed, 24 Mar 2021 18:20:44 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id w23sm3283150pgm.64.2021.03.24.18.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 18:20:43 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm: Fix a5xx/a6xx timestamps
Date: Wed, 24 Mar 2021 18:23:52 -0700
Message-Id: <20210325012358.1759770-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210325012358.1759770-1-robdclark@gmail.com>
References: <20210325012358.1759770-1-robdclark@gmail.com>
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Sharat Masetty <smasetty@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

They were reading a counter that was configured to ALWAYS_COUNT (ie.
cycles that the GPU is doing something) rather than ALWAYS_ON.  This
isn't the thing that userspace is looking for.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index a5af223eaf50..bb82fcd9df81 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1241,8 +1241,8 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 
 static int a5xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 {
-	*value = gpu_read64(gpu, REG_A5XX_RBBM_PERFCTR_CP_0_LO,
-		REG_A5XX_RBBM_PERFCTR_CP_0_HI);
+	*value = gpu_read64(gpu, REG_A5XX_RBBM_ALWAYSON_COUNTER_LO,
+		REG_A5XX_RBBM_ALWAYSON_COUNTER_HI);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 130661898546..59718c304488 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1173,8 +1173,8 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 	/* Force the GPU power on so we can read this register */
 	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
 
-	*value = gpu_read64(gpu, REG_A6XX_RBBM_PERFCTR_CP_0_LO,
-		REG_A6XX_RBBM_PERFCTR_CP_0_HI);
+	*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER_LO,
+		REG_A6XX_CP_ALWAYS_ON_COUNTER_HI);
 
 	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
 	return 0;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
