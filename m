Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D5870A7CD
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 14:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692C610E170;
	Sat, 20 May 2023 12:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C0510E16F
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 12:20:01 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2af30d10d8fso1779511fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 05:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684585199; x=1687177199;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1wFIIbEoxPLhpitFzIB7VWk7qAiJQapqN1VZ4+ZRTRI=;
 b=C+KG0gmGqsOgsOugIiyb/PsDw8m8EZaSlRtwvAIvbgmowHTS8VyD8BXjouv+hdJzQN
 IIFCEA9f4dpyvlbIkiytdxzm6+I0KkDKrrSP+p2/WRbPEGLWRP29rgvAXAT/smAbL7DM
 g9KEPg7tsM6a6DfXGUmXxDpzhLulFTPSuwSRN+0q9y8qrxf2cE1OjcQoTZz68voPqK4L
 lM8IY4X6bQg6kMpoHa5rjfbddLhY53+4h52vCNzi2qXTxE7/mqhU3yK1lQTPe+8R1+jl
 lvqyYb2j6CnxFWF1DDv0LI7moKhrVe1t7qyKsnMjFTbayAshlozdV0AMyO2NpbNqyFHz
 Qgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684585199; x=1687177199;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1wFIIbEoxPLhpitFzIB7VWk7qAiJQapqN1VZ4+ZRTRI=;
 b=cUFuxy0x4GopHtpHm2jex9giuwnxmPu1SyjURHkKbcB6nYt8yRj44gky/FvgB5g5XP
 GM2HYk1ySmtUZrpddDFx4kJZG0o8vMkVngfC9gEX4vsxoTSkaY2wi2MlyN/1Vux3J7tt
 PS0zrQCsGdFLYm32S8rSEB24LtCskt9tey8soS/ldp3LBG06ARvcK6I6iYza6tP2eJ0x
 eXRzUNIXv7mSinFRBK/Mc6vpDXfJxGe+xD1MV3Kxt4Psgv0/ehh+aBnu7YGbM5htiPVZ
 Md8NQOmuZksbqPyPGQ1d8Niv9TnCrtxW2uTCuPCfmKcSYFttI9Ra5ghDMHewOPWTrX4V
 lRTA==
X-Gm-Message-State: AC+VfDyTd55XREqvnRc3KixdfA/HKDvMpvOb3IfUjMk2FrgqDumE/zJ9
 Dpm+JN+U4cXAsFTYrj92byOteg==
X-Google-Smtp-Source: ACHHUZ686/APJwZF5d+ymeBfPVUJgO+udiA3oGWy50c+kqETtFbX5nhUCowpYdgHwWUe8gZseyu5EQ==
X-Received: by 2002:ac2:4a7a:0:b0:4ed:b048:b98a with SMTP id
 q26-20020ac24a7a000000b004edb048b98amr1801618lfp.6.1684585198901; 
 Sat, 20 May 2023 05:19:58 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 y6-20020ac24466000000b004f37bd02a89sm244766lfl.287.2023.05.20.05.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 05:19:58 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 20 May 2023 14:19:47 +0200
Subject: [PATCH v7 07/18] drm/msm/a6xx: Add a helper for software-resetting
 the GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v7-7-ecc7aab83556@linaro.org>
References: <20230223-topic-gmuwrapper-v7-0-ecc7aab83556@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v7-0-ecc7aab83556@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684585186; l=2525;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=mi/m4Oey75vF6uy9TLg2BuEnAAWYnXoWrcm53l1hJFY=;
 b=5ywVdFZzedX6RurJaylG6kigzNdrQo8yQnTLcVo+RubeyxkfhsUtzGzRh1qh5fRNMuUrbK8cM
 Hq+/6wtKodQDs8O0oo5Fp9/iXQAIDqpFVYbp+xOuXlHKapoHeKdeupz
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

