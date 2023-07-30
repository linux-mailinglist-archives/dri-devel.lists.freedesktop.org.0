Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DA276832A
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 03:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FD010E24C;
	Sun, 30 Jul 2023 01:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECBD210E23E
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 01:19:25 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-99b9421aaebso472139766b.2
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 18:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690679964; x=1691284764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B8os/TMAEnvf6K9BQCQyps63gRao5zmV5qOLXNQ+yl0=;
 b=jsmX4rnG/K5ErrJaNDiboodld+ZIFWkNtup8qs2uFG1WK+inpoPmh03NH7XVdgkr/4
 Hw5gZe8xTkbFJecE87DYFCU6fUO8ZJLIQk6LdGz7oaTRJ66TfrosI/MkLea63t0i8gUw
 Bv4Lv6LtQfp8SRBwFD5nTOd+ylMx954GGk9K4vJswISk8XfeJhNGHxmg6LHzlcjdmScA
 Lh9bWZyp0NJ/aSFSCsz7bxMUSSkh2nxlJ8bInwV6nHzwbNQG1Mq7y5CL6CMoxJe5efhh
 KEnuz3sPgNl2F3nMsdrA7hWWMcn+/+hRyGRDelHgHAhEVPsFW43Ge4pYNV5j6icf45k+
 HeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690679964; x=1691284764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B8os/TMAEnvf6K9BQCQyps63gRao5zmV5qOLXNQ+yl0=;
 b=AVo/FrBsHFw9OPbtRXn0XmVu8X69UhJVmmCuzRav5v11nAHKXjdkOXABbpgmpUPAcV
 5/P+JHKzIFcFjqC7mfxpvmxiY6ULmGsqe5LmVQm/BJj0yCqGbKLOaprGpJwemZcSLr3+
 VMPAK8lYvcO1QN8FRAuN32TBRJIzzae7DcOixhxUb0yjSqL3LVeErFbypAJZj/kAAmTZ
 LwLnI7XxMgAOQLQYgM6xyLb67Te9xKyPnufFl+N7DrTnZQw4nQ6BoOLI9GbpLJadz6T/
 JA2HwGu45jgTlE/gy7k5RMzl9BV5HwA5nF1O1fJRe99GB3kpRAQZC86ltHDS/4DZIib/
 M1Mw==
X-Gm-Message-State: ABy/qLZakVf42ASorwtwQHZtV+mWJBpoNjaRzKv2pprtIjeP1+v2bkMJ
 ZdIdKhhnd+DkzLzzwTvje3B9VQ==
X-Google-Smtp-Source: APBJJlGc6305yw1LBRkZHXvp14RrtUiVrieVuP977kY1KN8+GcRs9VpVme5jFiCEYuxMHLFDBecIpw==
X-Received: by 2002:a17:906:3092:b0:991:e7c3:5712 with SMTP id
 18-20020a170906309200b00991e7c35712mr2925950ejv.30.1690679964409; 
 Sat, 29 Jul 2023 18:19:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 rk21-20020a170907215500b00992ea405a79sm3915835ejb.166.2023.07.29.18.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 18:19:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 01/13] drm/msm/dpu: cleanup dpu_kms_hw_init error path
Date: Sun, 30 Jul 2023 04:19:08 +0300
Message-Id: <20230730011920.354575-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
References: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
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

It was noticed that dpu_kms_hw_init()'s error path contains several
labels which point to the same code path. Replace all of them with a
single label.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 31782a6d821f..77a79bc42492 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1077,7 +1077,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	if (!dpu_kms->catalog) {
 		DPU_ERROR("device config not known!\n");
 		rc = -EINVAL;
-		goto power_error;
+		goto err_pm_put;
 	}
 
 	/*
@@ -1087,13 +1087,13 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	rc = _dpu_kms_mmu_init(dpu_kms);
 	if (rc) {
 		DPU_ERROR("dpu_kms_mmu_init failed: %d\n", rc);
-		goto power_error;
+		goto err_pm_put;
 	}
 
 	rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mmio);
 	if (rc) {
 		DPU_ERROR("rm init failed: %d\n", rc);
-		goto power_error;
+		goto err_pm_put;
 	}
 
 	dpu_kms->rm_init = true;
@@ -1105,7 +1105,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		rc = PTR_ERR(dpu_kms->hw_mdp);
 		DPU_ERROR("failed to get hw_mdp: %d\n", rc);
 		dpu_kms->hw_mdp = NULL;
-		goto power_error;
+		goto err_pm_put;
 	}
 
 	for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
@@ -1116,7 +1116,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed to init vbif %d: %d\n", vbif->id, rc);
-			goto power_error;
+			goto err_pm_put;
 		}
 
 		dpu_kms->hw_vbif[vbif->id] = hw;
@@ -1132,7 +1132,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf, max_core_clk_rate);
 	if (rc) {
 		DPU_ERROR("failed to init perf %d\n", rc);
-		goto perf_err;
+		goto err_pm_put;
 	}
 
 	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
@@ -1140,7 +1140,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		rc = PTR_ERR(dpu_kms->hw_intr);
 		DPU_ERROR("hw_intr init failed: %d\n", rc);
 		dpu_kms->hw_intr = NULL;
-		goto hw_intr_init_err;
+		goto err_pm_put;
 	}
 
 	dev->mode_config.min_width = 0;
@@ -1165,7 +1165,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	rc = _dpu_kms_drm_obj_init(dpu_kms);
 	if (rc) {
 		DPU_ERROR("modeset init failed: %d\n", rc);
-		goto drm_obj_init_err;
+		goto err_pm_put;
 	}
 
 	dpu_vbif_init_memtypes(dpu_kms);
@@ -1174,10 +1174,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	return 0;
 
-drm_obj_init_err:
-hw_intr_init_err:
-perf_err:
-power_error:
+err_pm_put:
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 error:
 	_dpu_kms_hw_destroy(dpu_kms);
-- 
2.39.2

