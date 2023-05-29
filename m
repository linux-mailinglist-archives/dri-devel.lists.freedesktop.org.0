Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481EF714AD6
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 15:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717CD10E2A9;
	Mon, 29 May 2023 13:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C549F10E2A3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 13:52:35 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso3574366e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 06:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685368355; x=1687960355;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1wFIIbEoxPLhpitFzIB7VWk7qAiJQapqN1VZ4+ZRTRI=;
 b=tJFZkGE+7K3cO4bTU2J0U0tPAkHpBMlsjrFXVKtem/gV7E/xLJGiLiradl9efECbS8
 a/qHxL9Aoplc9sKCfO07aeRfUuab+TPHMKIh+x4qA9bWzl0R/SXUTK0uqfRjkrepFd5d
 J3wBhENOWveg0ew96zH95NosFLsHbSNbdDHtoYP8CLVfo3wvGpIdi6d/wRbv6LVFtZnA
 /D9cUO/5qEitqDn3JU4ASjOpkpmgx27BbATZTb0++TKCmFTDJzhFW37hss8x7qwRGdNV
 bVr0HWxqAgp0dfQi0ILyUUD7jHJAWU9FwH013MmuWU5PgWSCGa7HTXEsSlNa+6gSzxGV
 mDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685368355; x=1687960355;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1wFIIbEoxPLhpitFzIB7VWk7qAiJQapqN1VZ4+ZRTRI=;
 b=BqG2hrzh/ZvfDiv+j+uGAilTVe6eZXqvbWIusug75Nn7ZFgGKCPPfyhcXiJ+0tNsaS
 Toebg2G5Wi+7GLncGXxg9o/gytLFT3gX4HsM/L9O55yHQ+xfOcaLfSoBMbmCAK+v2cxl
 DKl9HJ9Mb4F34FFAoUfRjVJc4xZeQdqYmMPVmi2evf3A7sTX4mrDei8a7ybpHvmp+/B5
 7qBvgBI7X1EsmM8NmfsFPlAqg8Cxe9vjxnwG6m+aS9NpPqTVUGK7z7/teVCb/mRP2ql3
 a1X9tT5yqnWrSZGlbfX3Wev7NizOuSdpw1k6JPam+rt/+4a57Pu15RqklMeQxLSKqmgh
 hr7w==
X-Gm-Message-State: AC+VfDx74rcxaGxhckc0rjg99V9AExxo+CelV9Ws9uuFqqfcwvbyfj8x
 rpu4+8fbYsmBGlyPMvxEGstELA==
X-Google-Smtp-Source: ACHHUZ52UYRz6PdcRbweestohp2Un+CXhq2+nijsIOg5qgQMZI3fkls5VrLbssLD9Q2ZQkwN1N2alQ==
X-Received: by 2002:a19:f014:0:b0:4f3:8196:80c8 with SMTP id
 p20-20020a19f014000000b004f3819680c8mr2992126lfc.1.1685368355333; 
 Mon, 29 May 2023 06:52:35 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
 by smtp.gmail.com with ESMTPSA id
 c16-20020ac25310000000b004f2532cfbc1sm4700lfh.81.2023.05.29.06.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 06:52:35 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 29 May 2023 15:52:26 +0200
Subject: [PATCH v8 07/18] drm/msm/a6xx: Add a helper for software-resetting
 the GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v8-7-69c68206609e@linaro.org>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685368343; l=2525;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=mi/m4Oey75vF6uy9TLg2BuEnAAWYnXoWrcm53l1hJFY=;
 b=enRRVhClSkzGNyALCbuTLrsRhyxRtr6M5+NIOUmVyvTekRXXLNLpVv3mhrelTdgzg7baIKMlI
 E+Yn8f2qd0+B+zdudaBL8M3bwxbhoLDu2i8Do+Ity1YTSSu8q0yoyj+
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce a6xx_gpu_sw_reset() in preparation for adding GMU wrapper
GPUs and reuse it in a6xx_gmu_force_off().

This helper, contrary to the original usage in GMU code paths, adds
a write memory barrier which together with the necessary delay should
ensure that the reset is never deasserted too quickly due to e.g. OoO
execution going crazy.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  3 +--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 +++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index b86be123ecd0..5ba8cba69383 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -899,8 +899,7 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
 
 	/* Reset GPU core blocks */
-	gpu_write(gpu, REG_A6XX_RBBM_SW_RESET_CMD, 1);
-	udelay(100);
+	a6xx_gpu_sw_reset(gpu, true);
 }
 
 static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e3ac3f045665..083ccb5bcb4e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1634,6 +1634,17 @@ void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_
 	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
 }
 
+void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert)
+{
+	gpu_write(gpu, REG_A6XX_RBBM_SW_RESET_CMD, assert);
+	/* Add a barrier to avoid bad surprises */
+	mb();
+
+	/* The reset line needs to be asserted for at least 100 us */
+	if (assert)
+		udelay(100);
+}
+
 static int a6xx_pm_resume(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 9580def06d45..aa70390ee1c6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -89,5 +89,6 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu);
 int a6xx_gpu_state_put(struct msm_gpu_state *state);
 
 void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
+void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert);
 
 #endif /* __A6XX_GPU_H__ */

-- 
2.40.1

