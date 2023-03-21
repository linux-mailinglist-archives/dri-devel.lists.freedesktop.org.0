Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8537B6C274A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 02:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F8C10E6C1;
	Tue, 21 Mar 2023 01:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC6510E6C3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 01:18:30 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id h25so5561523lfv.6
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 18:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679361508;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C0ShU0VoJuNaKygLaJG1lCz4q0jlhQ8mz6XNRmWcdJs=;
 b=UI5Ui7wIUM7KtMV4pcooX6Nn/8MkGfdhXRxKsQ/k3AePUCwncAf/AwCNyKfeTeM6/g
 E/JIuhFwkJ/rgtoakBIl1E0c/rLsGzykagu4tEJMBljxXYkdjikkMMfq0fTT625tWxiR
 iLPA5AuTcS3DbBDPV6ZhsTF3FCrWEav+U+X6fvanp6D/Ympw/cT/7zLIubM+bGlTAr4u
 9kp7WrM9hHOArJ7R56wiRaDxdB3AwMiVoRtqg5UGsTOoJCv7OlilwadkK284cVkYfxdJ
 HgPooFcRvHVovMM89YccsTlsnarAmZv2Wmm81qEvXBoVmmXzqHdsjy+rqzjk8FQMNWeK
 NWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679361508;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C0ShU0VoJuNaKygLaJG1lCz4q0jlhQ8mz6XNRmWcdJs=;
 b=BkZMs26fpCDT5FcwuKsIhMjz3/oH9rCkzco+Q+4G9DhWlaJHXaiYT/6RP0DXaAI8d1
 ZELKmlEzT1rjBF17gAZ83A+zcWkNDKq7SsXjTxhIWdoiU404qGZKWVt1SJZyaeVilW/C
 tCXo8LTfKL1IqXEizG91D3sGXX/EFfFhh0UzbPMZhDuKJ3JQDEfcmO9ZwM3Z1TDLJdoJ
 5AbIPcDquq8l5PuayguhTh0ONn1xfjZzPTWfiJGqb7emi9skwYXzXoTz2kueLyhHkUBC
 qqOGyUAYBtnizsA3ixyldJP3FpfFuosDqRFdEE2NmVkTNsJSWLQq6/QJ/z11hvmR6d7X
 H3/Q==
X-Gm-Message-State: AO0yUKVVHpUw4F9ePxylfVZc8zEID/Sx7KcYPSgWOX/jg7vXZoq3bHuW
 TcptXpUpmHOxfUyDiqVGhF8SAg==
X-Google-Smtp-Source: AK7set+qhT3VjPfVMqjX4XLHYsAFppTsFoCQcM9asYTAdkeMztSusgLS5MmLSoqvzQVakb5gi/AU7g==
X-Received: by 2002:ac2:5151:0:b0:4ea:e640:2a58 with SMTP id
 q17-20020ac25151000000b004eae6402a58mr335231lfd.42.1679361508504; 
 Mon, 20 Mar 2023 18:18:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c18-20020ac25312000000b004eaec70c68esm46863lfh.294.2023.03.20.18.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 18:18:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [RFC PATCH v2 08/13] drm/msm/dpu: fill CRTC resources in dpu_crtc.c
Date: Tue, 21 Mar 2023 04:18:16 +0300
Message-Id: <20230321011821.635977-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Stop poking into CRTC state from dpu_encoder.c, fill CRTC HW resources
from dpu_crtc_assign_resources().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 27 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 24 ++----------------
 2 files changed, 29 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 77226de54363..8ef191fd002d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1177,6 +1177,7 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
 }
 
 #define MAX_HDISPLAY_SPLIT 1080
+#define MAX_CHANNELS_PER_CRTC 2
 
 static struct msm_display_topology dpu_crtc_get_topology(
 			struct drm_crtc *crtc,
@@ -1219,9 +1220,14 @@ static struct msm_display_topology dpu_crtc_get_topology(
 
 static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
 {
+	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_CRTC];
+	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_CRTC];
+	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_CRTC];
+	int i, num_lm, num_ctl, num_dspp;
 	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 	struct dpu_global_state *global_state;
 	struct msm_display_topology topology;
+	struct dpu_crtc_state *cstate;
 	int ret;
 
 	/*
@@ -1243,6 +1249,27 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_stat
 	if (ret)
 		return ret;
 
+	cstate = to_dpu_crtc_state(crtc_state);
+
+	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+		crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
+	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+		crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
+	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+		crtc, DPU_HW_BLK_DSPP, hw_dspp,
+		ARRAY_SIZE(hw_dspp));
+
+	for (i = 0; i < num_lm; i++) {
+		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
+
+		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
+		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
+		if (i < num_dspp)
+			cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
+	}
+
+	cstate->num_mixers = num_lm;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 204360485b81..068d4e47eaa9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -934,14 +934,11 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_encoder_virt *dpu_enc;
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms;
-	struct dpu_crtc_state *cstate;
 	struct dpu_global_state *global_state;
 	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
-	int num_lm, num_ctl, num_pp, num_dsc;
+	int num_pp, num_dsc;
 	unsigned int dsc_mask = 0;
 	int i;
 
@@ -968,13 +965,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
 		ARRAY_SIZE(hw_pp));
-	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
-	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
 	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->crtc, DPU_HW_BLK_DSPP, hw_dspp,
-		ARRAY_SIZE(hw_dspp));
+		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
 
 	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
 		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
@@ -992,18 +984,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 
 	dpu_enc->dsc_mask = dsc_mask;
 
-	cstate = to_dpu_crtc_state(crtc_state);
-
-	for (i = 0; i < num_lm; i++) {
-		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
-
-		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
-		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
-		cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
-	}
-
-	cstate->num_mixers = num_lm;
-
 	dpu_enc->connector = conn_state->connector;
 
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-- 
2.30.2

