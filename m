Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AE0714AC0
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 15:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6FD10E296;
	Mon, 29 May 2023 13:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DC310E296
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 13:52:32 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f3ba703b67so3526657e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 06:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685368351; x=1687960351;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ox41uPAx3lnO302Ry1Df1WPA2I0vwUL6Eka5WZ9+II8=;
 b=HjjCbA1IfVPklnX4hxxrr479tjGTHg03aPYbA8LjoLjynxFAIoy1254+uA6zs2GEsa
 Ng/Rk9cGdPncBQIoyVXEAfCfbqznsEQGn+2gojUxV8rBwLa9Oz7ebFYckH5recNqAdjG
 a4lbdd7kGFF2BVDzUayofSUUVgUI6OcC6yvy7xqJaBONnPyvA6nroooBpZkYsM1slWDY
 shj2NXr5SszJlMMPpeLYgNDaYRKyW65E5FujU+XxcpFES/VJ89qJbU1xXgxO1p338Ief
 8yQVGIZiJdNMQYcijN1WISgjtb1UUjWK7k735ppzRgxztzsBCOu1i+UkdgVrEioBQde+
 Hzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685368351; x=1687960351;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ox41uPAx3lnO302Ry1Df1WPA2I0vwUL6Eka5WZ9+II8=;
 b=jVlaITe4iXcOta8Ymx0tNY+Z3jkeBijXXYHHXFCNhKm9WIrwHgJ9VxVSnx7CMyWrl+
 a4Ss4DJ7YnK32NX4JS5fikCLP+6DQw9ROAEihf8R/Hugpg2Gv2DOdnd4p1Zj2ELay4gb
 qLqUc4mDCH3BLx8htrTekR7IvGBG2OXRuiPs/4Z4IFfyHFiwCcpyuUi29r6+GkGF4f3b
 7U/wf/BSuEpGyfbwHvnL0N655sXS3Dgf/z3L4ft1GL4BYBF9osOVbFA81LTKeiS1UJ+L
 /5+b+42i4XlGFCDClTixMphAUqBujeeBwEeYLeU7CgS+N9JPe3hwN3PcHeOzRXW3OpFn
 dRNg==
X-Gm-Message-State: AC+VfDxfTbGdJ35hnnRXFENrO97QB0rLjgNovwYVEdMfCYcPmyOkq4S8
 R9n5OkThVdig/Rwc4uyk9PgmNg==
X-Google-Smtp-Source: ACHHUZ4vk8LTno9K6vFTsGH2IPC+ZCybTCoUIpBBvQz3qqRJqqUUTyGGvWflVjF1p/neVA3yrS/NKg==
X-Received: by 2002:a05:6512:241:b0:4ef:f06e:eacf with SMTP id
 b1-20020a056512024100b004eff06eeacfmr3324513lfo.27.1685368351092; 
 Mon, 29 May 2023 06:52:31 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
 by smtp.gmail.com with ESMTPSA id
 c16-20020ac25310000000b004f2532cfbc1sm4700lfh.81.2023.05.29.06.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 06:52:30 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 29 May 2023 15:52:23 +0200
Subject: [PATCH v8 04/18] drm/msm/a6xx: Move force keepalive vote removal
 to a6xx_gmu_force_off()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v8-4-69c68206609e@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685368343; l=2072;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=WdDcDOyizy5IWwyMqltY5oqm/fsHIExj5zaeUB68hS4=;
 b=aBSvTQ5N+E1G5FcVBte5HyjyDhSx9dEGT5S8/XgIqhCakLKJD5Ck2zwhKKKgt07wHSnknGu9b
 7Rw2pv5mdrNAaU0rJUKpQsXXRqg8KFTAUdhhuSj3Z/kbRs+0dNbohMD
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

As pointed out by Akhil during the review process of GMU wrapper
introduction [1], it makes sense to move this write into the function
that's responsible for forcibly shutting the GMU off.

It is also very convenient to move this to GMU-specific code, so that
it does not have to be guarded by an if-condition to avoid calling it
on GMU wrapper targets.

Move the write to the aforementioned a6xx_gmu_force_off() to achieve
that. No effective functional change.

[1] https://lore.kernel.org/linux-arm-msm/20230501194022.GA18382@akhilpo-linux.qualcomm.com/
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 ++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 87babbb2a19f..9421716a2fe5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -912,6 +912,12 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct msm_gpu *gpu = &adreno_gpu->base;
 
+	/*
+	 * Turn off keep alive that might have been enabled by the hang
+	 * interrupt
+	 */
+	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
+
 	/* Flush all the queues */
 	a6xx_hfi_stop(gmu);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 9fb214f150dd..e34aa15156a4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1274,12 +1274,6 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	/* Halt SQE first */
 	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 3);
 
-	/*
-	 * Turn off keep alive that might have been enabled by the hang
-	 * interrupt
-	 */
-	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
-
 	pm_runtime_dont_use_autosuspend(&gpu->pdev->dev);
 
 	/* active_submit won't change until we make a submission */

-- 
2.40.1

