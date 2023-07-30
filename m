Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2DE768315
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 03:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD2110E24B;
	Sun, 30 Jul 2023 01:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73D010E23C
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 01:01:12 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f95bf5c493so5428477e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 18:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690678871; x=1691283671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HNep56ndTF+1OTRgtfGeSepaCmPgtbT3lMXHlS78A54=;
 b=VP7F69K1wmhrC08b/bwOjgX/Ozq71vZdTK4xi2z3if8ZCsOVtNbz05tjLes7EZXp75
 s4AkQZ2qQX3OyGMzkAXYXz1JUEh0mPxKFsyiMLle3esPH5ZNJykpNdixZaL7N1oOFEP4
 DtBzmgbvJqah+F3oT6qpAIZoxUEx1FKuSfSxpBEgRM1kTkMPNj/g1Bvkc4tede49e6JD
 1tVFav++zBwtaHDtUDRkaLO1OljHUfALqKMN2FnRwc5IMUzLJrzvTURtER8IsnamvQdJ
 3oQwC/Dvs71jh5AQZr9Bes8er7pSIB8Yt7BFAexphIEQx4kbU7vGG70dmU9NjYR2WWaM
 KspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690678871; x=1691283671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HNep56ndTF+1OTRgtfGeSepaCmPgtbT3lMXHlS78A54=;
 b=brLqRh2xxSBIhWIgGLystS6GVeSRFIlNb3sGHqsUyQKjjIM5bnpGAQd8d70m0RA1DL
 hhPTjAmusa/ZZsFoGnHJzzbC0hloM5m+8QzW+BWeTMNHTlh+TExntr2OO7VvxQRgskvU
 MDtZeuwQAd9pnI3Ty8g4c2wEW64nEq8NvdazDJTx9lxqFNcVWHKmwSH/6Po03GVbI/8A
 GozFwG1igbrtIJZQRpAKVlrh/hiD+zge+OgJJlcdF832taGUiL8vcllgvpv9lHxSZ6P0
 wdXPtqIllbv2bQMUQab+GM+bjdlHQZniyd7fyfNuSmD6sLYyWdwBxaewSMHe+y9xKFdP
 6kqA==
X-Gm-Message-State: ABy/qLYt8YAFGRZ3DHGyduq87lU8u3zRLg5k2KMkhyp3MuFXqMuAIUr5
 NVLHyK7ekppl9d50kWHx9XKjOg==
X-Google-Smtp-Source: APBJJlF2di7vRrBf7NR30qpA4Hxn2ld2JHpvwAIilpyc0cljWhqRV1FHPsQ5pqn3ktry1DW2aw5Ltg==
X-Received: by 2002:a2e:8197:0:b0:2b6:f1d5:619 with SMTP id
 e23-20020a2e8197000000b002b6f1d50619mr4367771ljg.14.1690678871076; 
 Sat, 29 Jul 2023 18:01:11 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 22-20020a05651c009600b002b9e501a6acsm169898ljq.3.2023.07.29.18.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 18:01:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v5 10/10] drm/msm/dpu: drop dpu_core_perf_destroy()
Date: Sun, 30 Jul 2023 04:01:02 +0300
Message-Id: <20230730010102.350713-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
References: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function does nothing, just clears one struct field. Drop it now.

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 10 ----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  1 -
 3 files changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 665b7b21a817..0b54a659a940 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -481,16 +481,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 }
 #endif
 
-void dpu_core_perf_destroy(struct dpu_core_perf *perf)
-{
-	if (!perf) {
-		DPU_ERROR("invalid parameters\n");
-		return;
-	}
-
-	perf->max_core_clk_rate = 0;
-}
-
 int dpu_core_perf_init(struct dpu_core_perf *perf,
 		const struct dpu_perf_cfg *perf_cfg,
 		unsigned long max_core_clk_rate)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index 8cc55752db5e..4186977390bd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -78,12 +78,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
  */
 void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc);
 
-/**
- * dpu_core_perf_destroy - destroy the given core performance context
- * @perf: Pointer to core performance context
- */
-void dpu_core_perf_destroy(struct dpu_core_perf *perf);
-
 /**
  * dpu_core_perf_init - initialize the given core performance context
  * @perf: Pointer to core performance context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 5bfea4868e43..76ba86d3e436 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1212,7 +1212,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	return 0;
 
 drm_obj_init_err:
-	dpu_core_perf_destroy(&dpu_kms->perf);
 hw_intr_init_err:
 perf_err:
 power_error:
-- 
2.39.2

