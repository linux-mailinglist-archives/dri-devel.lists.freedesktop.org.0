Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 601296A00D9
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 02:48:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F8A10EAD1;
	Thu, 23 Feb 2023 01:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CDF10EAB8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 01:47:45 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id m7so12385350lfj.8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 17:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=E5+yg0/0krNLTPpeG4iJfNpIusLghNH594MfKs2+GeE=;
 b=VusN6O7fjZqkg7WocbO4LW1a6CgMRWyVk0/9MiIMeJM3pS/DJ0CZmV2ikyH9jMbKM+
 M3rKWTiVqtzKfIN5yaFpFeFjp7htcoafd+H7ahCAxEGSB+R9Xtvwa4W30prplbmiIKO3
 h8YfiW6WIPe229IijvvvnL8mmYhzWiYvybCCamaU8D0oUUwJCbTxVh+oQs+fmpLFUGNC
 m2h5eX4/N7BvcIZPdc1aqXIJB8jn0lAzxSP22PwAo6PoDay/LufuRsfNhkyKdHUNf5Cb
 4imN4KAxjDVvNO8BhL9D88BKfecRKEEvDmg8U7qkEUafxeflOWPWGDT5tA4E9Nmbzfp/
 x0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E5+yg0/0krNLTPpeG4iJfNpIusLghNH594MfKs2+GeE=;
 b=pdT7dDTrAGPLnXh9gqniu9s9syLvZili6uDzlaTAEry+EpBkN4cXQYPMQgpjtBGs1t
 MPZXe8htJRhxkHHHP9Vuo9h8+iUI/ohVDJxuM7vi5AND1txolBQ6LyK94+CJQFB6q00R
 2JqBqf/O04r8XKAk8QkhKA63sfjvNiXjBQN3uJWCo/UCh4NBVT8p4aj35aF6gmQCov4J
 vz1GDs+JCqVNC2n41slJbCjV3f0uaxeImiyqiK294dpPldBQt36Vtp1Oy1DdhYuXnyql
 dbtHz3b27R5riL4ZWb1AgwE7nWIY3+fH43tQ8JX6jyMZXRdxI7QejzTJfWihO6O++9Ev
 kPFg==
X-Gm-Message-State: AO0yUKWQWJryJqhTDqQFLL4HpB3Rf/rnp9H2dwGqdz4Krh1o8lKfeZ8z
 +V3E3HWtqIlRYcGsm9s+6xVON4xmRyZeu9e9
X-Google-Smtp-Source: AK7set/jwh4+qXjurf2yt/eMc2UNv+XASCYrUdC1nJoIhQj9W7Cq93cKl0LD7sGMMsbR/itIq38QQA==
X-Received: by 2002:ac2:5ecc:0:b0:4cc:725d:9d3d with SMTP id
 d12-20020ac25ecc000000b004cc725d9d3dmr3680183lfq.54.1677116863423; 
 Wed, 22 Feb 2023 17:47:43 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 12-20020ac2482c000000b004dc807b904bsm427376lft.120.2023.02.22.17.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 17:47:43 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 23 Feb 2023 02:47:39 +0100
Subject: [PATCH v2 3/6] drm/msm/a2xx: Implement .gpu_busy
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-opp-v2-3-24ed24cd7358@linaro.org>
References: <20230223-topic-opp-v2-0-24ed24cd7358@linaro.org>
In-Reply-To: <20230223-topic-opp-v2-0-24ed24cd7358@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677116858; l=2023;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=o2IJoNBHAOSR6oYp4+Uz08OuccC4IUsqkONjhNT3F0Q=;
 b=s5/hbhoiSbqwQp+Bkv9gVx0WwGsnEjR+kvSlH359RLCiLjLo6w9Ek4Y4RWaXdFQy9iukWvt19fpG
 zU+0c93AADckr0oItDowSnXRKpk58/ORvjCDnY3rxbK1odDVmjDT
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement gpu_busy based on the downstream msm-3.4 code [1]. This
allows us to use devfreq on this old old old hardware!

[1] https://github.com/LineageOS/android_kernel_sony_apq8064/blob/lineage-16.0/drivers/gpu/msm/adreno_a2xx.c#L1975

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index c67089a7ebc1..6f9876b37db5 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -481,6 +481,29 @@ a2xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
 	return aspace;
 }
 
+/* While the precise size of this field is unknown, it holds at least these three values.. */
+static u64 a2xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
+{
+	u64 busy_cycles;
+
+	/* Freeze the counter */
+	gpu_write(gpu, REG_A2XX_CP_PERFMON_CNTL, PERF_STATE_FREEZE);
+
+	busy_cycles = gpu_read64(gpu, REG_A2XX_RBBM_PERFCOUNTER1_LO);
+
+	/* Reset the counter */
+	gpu_write(gpu, REG_A2XX_CP_PERFMON_CNTL, PERF_STATE_RESET);
+
+	/* Re-enable the performance monitors */
+	gpu_rmw(gpu, REG_A2XX_RBBM_PM_OVERRIDE2, BIT(6), BIT(6));
+	gpu_write(gpu, REG_A2XX_RBBM_PERFCOUNTER1_SELECT, 1);
+	gpu_write(gpu, REG_A2XX_CP_PERFMON_CNTL, PERF_STATE_ENABLE);
+
+	*out_sample_rate = clk_get_rate(gpu->core_clk);
+
+	return busy_cycles;
+}
+
 static u32 a2xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 {
 	ring->memptrs->rptr = gpu_read(gpu, REG_AXXX_CP_RB_RPTR);
@@ -502,6 +525,7 @@ static const struct adreno_gpu_funcs funcs = {
 #if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
 		.show = adreno_show,
 #endif
+		.gpu_busy = a2xx_gpu_busy,
 		.gpu_state_get = a2xx_gpu_state_get,
 		.gpu_state_put = adreno_gpu_state_put,
 		.create_address_space = a2xx_create_address_space,

-- 
2.39.2

