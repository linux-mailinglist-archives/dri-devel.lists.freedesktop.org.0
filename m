Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A17E73234D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 01:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9923F10E576;
	Thu, 15 Jun 2023 23:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A37710E575
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 23:21:32 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f62b512fe2so11627359e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 16:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686871290; x=1689463290;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cWBWjSF1nxb4y2V3Mv+crQrjFgIo/GaLCfzRkH/TfkU=;
 b=QVZvniBWsJ8h+OenYCRnew/fLXwpZpO80jAhjXA7MXEUE/ZzSR+yMw4R5zSIcSbjR+
 W6h/FC0YXKdMFEUk+W+ojWh0KIAZwk6ldV4h7WMSY5BvSCZTVYlsDi0aQ9+LbfFs1o2K
 blXy22YZFwOcu/EWVhyVDz0oodfxks6FYTJZaRgs4GhnJdbIY0VEGL5y8G1q0yeLUrnz
 p7S/MJlTyHXC9R0ucPi8qC498tpjzeqcbwp9wQctO5LkIWWjrRfhPQPBleLhPuVnK5eV
 fjmFjHKhVW/7wxWcm5WyP3tPsN8Ia3GwbuAvEW9tHa9lVPRyofbMKtr0a3HHdJC6Gymq
 vLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686871290; x=1689463290;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cWBWjSF1nxb4y2V3Mv+crQrjFgIo/GaLCfzRkH/TfkU=;
 b=ZorpLsQg7yVOPNxtTQ7O61p3f1HHSbF+iURUP/j/4Wzc40r8SzRF4iCK1DPg8/RN7A
 UPqWK1nJ6uhrprmagNpIiYLdlEcwqOgnS1u9X0q4dophYzna0SOzmdKH/f/ABLHEQHFF
 Qy5Z3i28oQaSTFOLhj5bg7hKqrbPagq0MmtkUmWMMPM/dcmJXhzWIYhgIDqTPsIWW+GK
 Kgkzb4wdChuJ1kR3p2O5rZ3METyIM3fDO4xW99KukNvxzAfVExJO3xKSdE+MSpfxb4Rs
 rIDGjQIoE9bdLfKprUpve4DkWX6Az7vPzP0bGfz5oZKfe2HKUFwYVGz1BsuDEaCo+Bmn
 VqDg==
X-Gm-Message-State: AC+VfDzJWPH6hs1CCwJm0QZgtMuyO66OakK2JtXWcNVN51fePIlKjiz7
 cd3lZx7sKC8J0ctSryGIMuCrmw==
X-Google-Smtp-Source: ACHHUZ7QNw8GxO27TLJN76WVDNXmdi40/BDzJLma3CCK4sCvQG+sDQyDejq9JeWLtVh22hvAlvrOow==
X-Received: by 2002:a19:711c:0:b0:4f6:3000:4d5a with SMTP id
 m28-20020a19711c000000b004f630004d5amr68373lfc.38.1686871290719; 
 Thu, 15 Jun 2023 16:21:30 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a056512041900b004f24ee39661sm2744852lfk.137.2023.06.15.16.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 16:21:30 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 16 Jun 2023 01:20:49 +0200
Subject: [PATCH v9 08/20] drm/msm/a6xx: Add a helper for software-resetting
 the GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v9-8-890d8f470c8b@linaro.org>
References: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686871277; l=2561;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=+qs1naLo5mMLIb06LDrZUW3mvvjoeZYSPQxSiYbvaL4=;
 b=hePXBLkkz1Ku4+iP0379WgmcuORZblLksSBkEmpkEPT3q5TpvmWGcT39az9jXcbBY8XGdkpeA
 4tnNZzcPdSEBQSadfv5Z1vDy8YZzaffSfOBtB6b3QsoCbrLR8cKBUFc
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
a readback+delay sequence to ensure that the reset is never deasserted
too quickly due to e.g. OoO execution going crazy.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  3 +--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 6402544f6849..906bed49f27d 100644
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
index d5bd008c2947..b627be3f6360 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1742,6 +1742,18 @@ void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_
 	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
 }
 
+void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert)
+{
+	gpu_write(gpu, REG_A6XX_RBBM_SW_RESET_CMD, assert);
+	/* Perform a bogus read and add a brief delay to ensure ordering. */
+	gpu_read(gpu, REG_A6XX_RBBM_SW_RESET_CMD);
+	udelay(1);
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
2.41.0

