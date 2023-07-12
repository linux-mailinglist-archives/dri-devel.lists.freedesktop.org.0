Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCDA751360
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 00:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F09D10E5F2;
	Wed, 12 Jul 2023 22:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2978A10E5E1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 22:11:51 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b703d7ed3aso124756441fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 15:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689199909; x=1689804709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gWwNSVsmh1bG+GHUN/mVATtu1UgwWBFt1a+c6iz+eLk=;
 b=aSC8OmNhmNYBmv27p0LBeT//vmWVquIGlNLAo9DVDuyMUpao3hRhtVbkxLwaIgYjIf
 9aN/oFL5YGvo0ML548i7zQra6CVrmrnum5pOjjRsSmwtNNnQa7HlhPCqJd2yc9kI3UUP
 J7o61wgvilevHxjd+wd7HPUaSOVr/VXtmc523hiOo02VhOFoGTwaFX2phF/zxoQmJTZA
 t52oDhjY7fdXKoTx5IWX/cSx7iSnJc9axn2DlKN3dxp9OmQvCSkO5ttteZ8rC2ZYnBdc
 CzfYvbEhRAypUVi58iA9BkVyGLjO/Ortm/lbrqm6RrmfnNHZ/xM23QtKyoA3vBWPvLVq
 oTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689199909; x=1689804709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gWwNSVsmh1bG+GHUN/mVATtu1UgwWBFt1a+c6iz+eLk=;
 b=JHuE6HjK+ld55CmcBUllCG1DLuQHTl/2Zc1TqIB99RW7aIuVPwYfi6devCkXaUQcKh
 cRaydB2YNhPMzFwKIxkCasOQFi6RWJIlmFGeh01m9iyMPSwb5NWjlPXTRHdUIt2c/NsP
 zCD7cd5mLGM9l3iNletabDxd85O/mPPmHk5fJnFfGGFOd2dC23IZdh8J+FBATOv5GhV4
 LLT1EREedwJPoxQZNRVHbKBi2nFvaEOyYtbTxxLdnARVzUd4zVtdFwgFJdkRB7YkuOpY
 yc/MmJQt54BRLT5kwVoPnuNqYJApu5xD1pCyEfKVOFMPjGuRlgfYgtBniOOu6TEdEghW
 jYNA==
X-Gm-Message-State: ABy/qLaF4XFUFY8Q0tNwvF+G2a00l3Py5ZP9DJcqa7njYeG9ck3tXo+X
 ylJpeGAyThEHUaTDQpLmadixDQ==
X-Google-Smtp-Source: APBJJlGE6umXBMHF2GTMhqi3lKCFZW01eI3qr0kPway+oAWpXZmXrZFIpTBWl8K7REtfJgAIu1eD/w==
X-Received: by 2002:a05:6512:34cf:b0:4f9:69af:9857 with SMTP id
 w15-20020a05651234cf00b004f969af9857mr15813885lfr.51.1689199909151; 
 Wed, 12 Jul 2023 15:11:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q16-20020ac25290000000b004f62fdf61fdsm856193lfm.204.2023.07.12.15.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 15:11:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 11/11] drm/msm/dpu: drop dpu_core_perf_destroy()
Date: Thu, 13 Jul 2023 01:11:39 +0300
Message-Id: <20230712221139.313729-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
References: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 10 ----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  1 -
 3 files changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 16a4d6c67f4d..31813a322afd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -486,16 +486,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
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

