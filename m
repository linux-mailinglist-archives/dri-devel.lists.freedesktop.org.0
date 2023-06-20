Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD86736086
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 02:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F46F10E231;
	Tue, 20 Jun 2023 00:09:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7184C10E160
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 00:08:57 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f766777605so5226601e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 17:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687219736; x=1689811736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N1f0epuyrcv1RU1D8RCL1bTxQUfmJgIbJdamZcHM4z8=;
 b=h6hlO0G9tD6bqU7iekDSCKAx9/wyz6s77b6sRDkLrpvqmOsu9az91XMbCqqk87UTo5
 C9gBF8CDox+iJUrLHpfp3xKhgPJb9hDlSD8+dpbx3T7/+daz/nZskjjso1sqy1oVotb5
 svLHoH+E5sw9CEopUkVkt9mwlh25Oj0+lCJ+ayokIfQwxDV8eUU0t3Kno2mxc7qakXLY
 sA4+qt9/XhfrOUwMwHLikijkeoiYa4CR9CJ/dvm1zqeUGIlZpbLd4DEJ0E7eE+kFYZyV
 WMgF3H9J8dvtUSF8cNKdLrl1af/B9PD+AuNQ/0NNtizHLGGDmNAhLDzygiAigsktvWD6
 P6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687219736; x=1689811736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N1f0epuyrcv1RU1D8RCL1bTxQUfmJgIbJdamZcHM4z8=;
 b=LDy1DwZL0oS23vydHa/1iOMlm8vYaYTWxXIerUzJqlPyGlhbXKr1wgMatLPMjDceHb
 e2PVNWQ80HXBFAtF62Chi3bW2CiMzOv0gEoD0HGSfonnDCeotArOB993MqAnDY0OS/0I
 bPa1r/1PfSNcM7f54IKIiMiVlG6d6UMui2QC3gcM1f79Zxk0Wser4EdRV8DJJdDaW89a
 fA1Zu0G7iF8KITFKenCkykELuOQGpLDhEop99/DKDN1/J8mnnz/rOb9sy8ejP02T2T7q
 wzoZuqVRU83D4sXjsFrBodhXiNaKI7LwTN3NsMlpVzQ6QV/ogP4RzdSEEB0XRds/Mp7K
 pZxw==
X-Gm-Message-State: AC+VfDyHvw4w84wxmHnUL/QVnnQIsKXeW94+HI7QF+C8kez5VY690U2F
 zcXE5z1vVpzWXQpnzN+r30s6zw==
X-Google-Smtp-Source: ACHHUZ5AngE0yN0H7zTFD5kCQVRdEsKWzyybqGju1ZIWmz4QWQcDoWXxmHGzfQcPG7SKy73OKHapTg==
X-Received: by 2002:a19:434b:0:b0:4f1:477c:f8a9 with SMTP id
 m11-20020a19434b000000b004f1477cf8a9mr5355270lfj.65.1687219735827; 
 Mon, 19 Jun 2023 17:08:55 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a056512020600b004f869e46fd4sm128815lfo.100.2023.06.19.17.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 17:08:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 7/8] drm/msm/dpu: drop dpu_core_perf_destroy()
Date: Tue, 20 Jun 2023 03:08:45 +0300
Message-Id: <20230620000846.946925-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function does nothing, just clears several data pointers. Drop it
now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 12 ------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  1 -
 3 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 78a7e3ea27a4..f779ad544347 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -394,18 +394,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
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
-	perf->core_clk = NULL;
-	perf->dev = NULL;
-}
-
 int dpu_core_perf_init(struct dpu_core_perf *perf,
 		struct drm_device *dev,
 		const struct dpu_perf_cfg *perf_cfg,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index e8a7916b6f71..e1198c104b5e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -69,12 +69,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
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
index 6e62606e32de..4439147d2c35 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1162,7 +1162,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	return 0;
 
 drm_obj_init_err:
-	dpu_core_perf_destroy(&dpu_kms->perf);
 hw_intr_init_err:
 perf_err:
 power_error:
-- 
2.39.2

