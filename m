Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C629691D1
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 05:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB1010E3C7;
	Tue,  3 Sep 2024 03:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I4cwvTKm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155E310E3C7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 03:22:58 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2f4f5dbd93bso46364821fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 20:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725333776; x=1725938576; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DLPumKfNMzy40ki1pODOGiA/OM1zrRJ9SLI3z8CxSzQ=;
 b=I4cwvTKmPipCoRw0aElZ5jouJRpfFm2n8bGYfYpSiOncafXdScufNapz7bbG35y+z9
 nXUEgoF29J16VXkANWsfi19iM6cI7v01fkrhpVdwbBN4Uokl5ad3tGb2pvgLWLYDFs6Z
 gTcndP/gGTikNFKXhv8e4R0abKHQkXXeZ/c22vRI5pMYI+4dVOe9IUW9Mgivr+ZZlqf7
 aJ7KN5CWhM94XxML1SGfROhc4/W2EzD4kCajMfqirTErvB2ucGIfWPtPw+5Jfu4LEm8I
 Oqwpajey5daMf8S55F30OWOGjx1m64FpE7aTkrUDgC13tjH/NEGW3TE+WfgB4E3JMX7z
 5Ccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725333776; x=1725938576;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DLPumKfNMzy40ki1pODOGiA/OM1zrRJ9SLI3z8CxSzQ=;
 b=SuLy2QR2lmrEz+0RJPnwc5iPZlebjPlEp27DKiSFbvMaiczl+sg/DoYgkr4nqmUMji
 dkGPmSufsKNm6Q+HcAMM2tVTDBox/5AWb6kt889Aqbp4mj4NAgmpOmHxKt396zTal0r+
 OjNDY5ASFLCvRQRa5f37984U4IqauUtzggMIKEXT38sdgMur749t7UhMr9EaosvMn8h4
 VLFpgjhAVy7iD0rBXv5SdhWl91/ggme4ARHCEKRxkagz+0PN4remmKVAjuaicnVsuuaB
 HeJ6e1r0FhpYpF1lzmK50+k4mmOQPlODdM0ycOLKbWVUas5PGNWFSXp7wLfqVfu1O177
 0j1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN0zJ2h7P8vG7OM3ykmE2wt33MLUKe78L+sJaTSl8pRptEy2YAikG8oQbarGvabvGmJqxCocKnLeQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrG5pJNMHQUxizLDJlvipbvL5LlQiODRUpPsqLpLvLanuLNRWU
 IbtJUNWGLByHYoj9jKlvkL/wwVHrTfL7OS0+GLeQvmTxS9fRrm0GSkQMXzWRvnQ5ZA3pUIy43qp
 i
X-Google-Smtp-Source: AGHT+IG0sKGN/OowENUG6XG9IvnoEeQCptU+0hN5SsynWKdu9pKOtRwcENXe/ilSFBmpExoHI+KlaA==
X-Received: by 2002:a05:651c:1507:b0:2f5:150e:6016 with SMTP id
 38308e7fff4ca-2f636a131a7mr33251531fa.15.1725333775113; 
 Mon, 02 Sep 2024 20:22:55 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 20:22:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:45 +0300
Subject: [PATCH v6 02/15] drm/msm/dpu: move CRTC resource assignment to
 dpu_encoder_virt_atomic_check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-2-617e1ecc4b7a@linaro.org>
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
In-Reply-To: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5688;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2vCXlDjK3FXsP1DkPggf0crfd1rUXHBaU/gngKtPFWo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1oEKiq6BciEjU4950Ou6QaW31DAtla76BdMPK
 rE3+NPcZNqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtaBCgAKCRCLPIo+Aiko
 1fc/CACkTLf1bxkklqBWZ1gejOd5ylWR2hAYKjVI1qdg6KHI3mjnhg56E4XWgbQzJiWm9+SyzLG
 UPcRZV1ri6tuTc8kA9gEKYzYvdiOrBM085ktHFVWv1L5qEG03bHn+OPXAVE7KoVH8rB6txDjrC7
 gABq1JATOZVs+B3j7C6AkHz9ITG4/EFFlm/bC2soXwVoc/HJnNbtoX8zHSTjYIv5+I3hqP7mecC
 YcL4kImo7ZulAvVr/fsb62pQbUMEQHYLSY402u6ZqvU8gh84emX7wOu2VeWM8Tao6Mn9Rsr7/Nt
 b4UhEOoTMuYA4uayEBlShzHifDEfjr14A0n/znbtMcd0d9VZ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Historically CRTC resources (LMs and CTLs) were assigned in
dpu_crtc_atomic_begin(). The commit 9222cdd27e82 ("drm/msm/dpu: move hw
resource tracking to crtc state") simply moved resources to
struct dpu_crtc_state, without changing the code sequence. Later on the
commit b107603b4ad0 ("drm/msm/dpu: map mixer/ctl hw blocks in encoder
modeset") rearanged the code, but still kept the cstate->num_mixers
assignment to happen during commit phase. This makes dpu_crtc_state
inconsistent between consequent atomic_check() calls.

Move CRTC resource assignment to happen at the end of
dpu_encoder_virt_atomic_check().

Fixes: b107603b4ad0 ("drm/msm/dpu: map mixer/ctl hw blocks in encoder modeset")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  3 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 59 +++++++++++++++++++----------
 2 files changed, 38 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 4c1be2f0555f..e81feb0d67f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1091,9 +1091,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 
 	dpu_core_perf_crtc_update(crtc, 0);
 
-	memset(cstate->mixers, 0, sizeof(cstate->mixers));
-	cstate->num_mixers = 0;
-
 	/* disable clk & bw control until clk & bw properties are set */
 	cstate->bw_control = false;
 	cstate->bw_split_vote = false;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 949ebda2fa82..bd3698bf0cf7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -624,6 +624,40 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	return topology;
 }
 
+static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
+					      struct drm_encoder *drm_enc,
+					      struct dpu_global_state *global_state,
+					      struct drm_crtc_state *crtc_state)
+{
+	struct dpu_crtc_state *cstate;
+	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC];
+	int num_lm, num_ctl, num_dspp, i;
+
+	cstate = to_dpu_crtc_state(crtc_state);
+
+	memset(cstate->mixers, 0, sizeof(cstate->mixers));
+
+	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
+	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+		drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
+	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+		drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
+		ARRAY_SIZE(hw_dspp));
+
+	for (i = 0; i < num_lm; i++) {
+		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
+
+		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
+		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
+		cstate->mixers[i].hw_dspp = i < num_dspp ? to_dpu_hw_dspp(hw_dspp[i]) : NULL;
+	}
+
+	cstate->num_mixers = num_lm;
+}
+
 static int dpu_encoder_virt_atomic_check(
 		struct drm_encoder *drm_enc,
 		struct drm_crtc_state *crtc_state,
@@ -692,6 +726,9 @@ static int dpu_encoder_virt_atomic_check(
 		if (!crtc_state->active_changed || crtc_state->enable)
 			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
 					drm_enc, crtc_state, topology);
+		if (!ret)
+			dpu_encoder_assign_crtc_resources(dpu_kms, drm_enc,
+							  global_state, crtc_state);
 	}
 
 	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
@@ -1093,14 +1130,11 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
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
+	int num_ctl, num_pp, num_dsc;
 	unsigned int dsc_mask = 0;
 	int i;
 
@@ -1129,11 +1163,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		ARRAY_SIZE(hw_pp));
 	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
-	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
-	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
-		ARRAY_SIZE(hw_dspp));
 
 	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
 		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
@@ -1159,18 +1188,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
 	}
 
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
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 

-- 
2.39.2

