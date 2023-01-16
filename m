Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BE366B659
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 04:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1A710E14D;
	Mon, 16 Jan 2023 03:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADF310E14A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 03:44:38 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id bp15so40945964lfb.13
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jan 2023 19:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bpZugCp0iqPjSJZH6BP8uqG8YkG5mOk4bwsPsZ6EI0w=;
 b=x9tGvIQEZIN9acMaoW7tv3Peke+BJR0KHL+y3BiOwyTEqhA3ITpmrUM+byz9r6aLk1
 vCUSlNb2FFER4Qp5kRJArM3jANFgx4t+0wisQZgIWev8HPdpe3eOvXK1qu2azGkM8ZJB
 Xazki5AEl4AZG7nZZJQe6vGNTDnOug2ZjnuYJIRF/kni938+oEQODIzBRaFaIvg2htpT
 Lg8cLR5UearQ90a6GtOWSpA9lAf3xE4zXxOktl3S+xPQ2jt+9tRCYmNBeHpteql5VHrT
 h3ZBvN2PBncMlmm5Phbjc2Rb9o1ZJAZGvXwqgl/OXbi0qA0tUfUmOjKMVjTwl2mLpQ34
 Lejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bpZugCp0iqPjSJZH6BP8uqG8YkG5mOk4bwsPsZ6EI0w=;
 b=M++IsyifuXIzxStFsqV8dRSux2fx9nQWDVah4A5WMUXk9W7aughkIRA04RXuPSzNWT
 txyR31wRJ2Q6Fa8/nxXK9NLSkQzCmG766GI9P6jf+EgQJc/zIJuZlASXeJ1h5O4lYOP2
 A0/c565EBP0IVMO7UOXm2jvUhD2S/D0lYVngipKr9KLBp3E1f5x9Yoi/7/1jMm/mxQep
 sXALVMmu7gsPScKnozLArcseee4YIN4DuBsPWdqF7sNjXjORAoeN/al9cbRVVCcZ83b3
 gsdp9WCOQ1mJtVUix2ZjMFPxMdbaBuMCLrpyLwNVE0O0jkw9elFDIM+NOfma2m8jcOtx
 zdCg==
X-Gm-Message-State: AFqh2kozcdcYZHKilVwUpun7RoTSs1T8ijOe+0zZpPmmcdRd1P3r8MmK
 uMJ9xg5pOYSSrKxP0ePeJY7Png==
X-Google-Smtp-Source: AMrXdXuLG/9P1ouZcz3jM7pieQCq5MfUNroufXuppRXLeyNSqLrUQQRuLl3H3pz9NZwtp3B+x8z6rg==
X-Received: by 2002:a05:6512:2985:b0:4a4:68b9:1a0a with SMTP id
 du5-20020a056512298500b004a468b91a0amr24025377lfb.50.1673840676936; 
 Sun, 15 Jan 2023 19:44:36 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w14-20020a05651203ce00b004cb43c9bf9asm4869494lfp.208.2023.01.15.19.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 19:44:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/dpu: enable sourcesplit for sc7180/sc7280
Date: Mon, 16 Jan 2023 05:44:35 +0200
Message-Id: <20230116034435.569512-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

According to the vendor dts files, both sc7180 and sc7280 support the
source split mode (using two LMs for a single output). Change these two
platforms to use MIXER_SDM845_MASK, which includes
DPU_MIXER_SOURCESPLIT. Rename MIXER_SC7180_MASK to MIXER_QCM2290_MASK,
since this platform doesn't seem to support source split mode.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 22ad996e9014..835d6d2c4115 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -56,7 +56,7 @@
 #define MIXER_SDM845_MASK \
 	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
 
-#define MIXER_SC7180_MASK \
+#define MIXER_QCM2290_MASK \
 	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
 
 #define PINGPONG_SDM845_MASK BIT(DPU_PINGPONG_DITHER)
@@ -1464,9 +1464,9 @@ static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
 };
 
 static const struct dpu_lm_cfg sc7180_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SC7180_MASK,
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
 		&sc7180_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SC7180_MASK,
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
 		&sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
 };
 
@@ -1499,11 +1499,11 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 };
 
 static const struct dpu_lm_cfg sc7280_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SC7180_MASK,
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
 		&sc7180_lm_sblk, PINGPONG_0, 0, DSPP_0),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SC7180_MASK,
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
 		&sc7180_lm_sblk, PINGPONG_2, LM_3, 0),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SC7180_MASK,
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
 		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
 };
 
@@ -1518,7 +1518,7 @@ static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
 };
 
 static const struct dpu_lm_cfg qcm2290_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SC7180_MASK,
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_QCM2290_MASK,
 		&qcm2290_lm_sblk, PINGPONG_0, 0, DSPP_0),
 };
 
-- 
2.39.0

