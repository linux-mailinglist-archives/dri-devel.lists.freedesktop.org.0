Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3344672189D
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 18:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9838D10E157;
	Sun,  4 Jun 2023 16:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD7E10E155
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 16:28:03 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f620583bc2so996242e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jun 2023 09:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685896082; x=1688488082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3wyOn6cT+1PaYBBEcqtxVjK3HjCB93rQCAeQu98Q2S8=;
 b=qurWPFWT3sX94s3V2XWKJTzmY/Iu5+xVjkTQGiUHorvbTLphrlWnm8im8b5SPJECdy
 2IZ6EIHPvjEXKzrH08aJonWvu0gyU1GIz7O0e/sZn36dQqbyAq2YRdz2sxtELKRgJDqi
 mfM4aHe+4DVQl5tbLQyx4z0d9tQTjZfbuvZiRffBCUQTupQxIM+Z94+0uhAfrRczO3Z6
 mU7RBulFaSRGTQGndKaSCEFZZ0K/Yz7GRRhFG2g5LcOMOdChQT6/ZP6U9iVQXOX0Xqrj
 Nt1hrFqLh8sBLgV7wsDNSVMgq8roHS8q1nk2KNnXSBw52/9dAZGDyW2hcmYpZVG30UIS
 DSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685896082; x=1688488082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3wyOn6cT+1PaYBBEcqtxVjK3HjCB93rQCAeQu98Q2S8=;
 b=Hyk+rlNOOANHnTdNLqqt00Ig0yX3uyKr8PYCOzLOkKuzTHM3UTbi8qYpz9tuBNMU9l
 qBYMEocOpW1qMGytUBIsegeG98dArZ0sg2EhylzICVfOh7sXqjNTFX3gXozp1D3a6tQA
 TdieJ7Es3i5SFum3+TGGGpDG+n+dbL2PKLMSbUzlqf+UUl2mUGwyXlmOaJ0Jm/F+bRk0
 MLcs0v2nQC3hxZJScU02CP83dH/pmoT3jgEn0rDOUeh1sbHMEq7c3yN9h6xStnTa72L3
 HZYN8UDkStZpSQIPzSo3VhToBsqQIiwEqfgw9mHaZdQ7b0k0zmyrG90PaZu0BdC/KT8Q
 /mhQ==
X-Gm-Message-State: AC+VfDz+ryVyAqgzoq5bBEf4Tzt9ZESiCYak6DeAyOcY1ZbOaD1Cub/Z
 BoF8Uuwh3881v6oD9w4++RSnuA==
X-Google-Smtp-Source: ACHHUZ5jFOuoUIrgfRqj0R6hN9H2a37y+A2gGk7emL4lZCxVoOBxfrBirKYe2IR7VCpiTeVaMcY2xA==
X-Received: by 2002:a19:ac0b:0:b0:4f4:cebe:a7aa with SMTP id
 g11-20020a19ac0b000000b004f4cebea7aamr4036507lfc.39.1685896082021; 
 Sun, 04 Jun 2023 09:28:02 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 g14-20020a19ee0e000000b004f61a57797esm537975lfb.69.2023.06.04.09.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 09:28:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 1/8] drm/msm/dpu: fix sc7280 and sc7180 PINGPONG done
 interrupts
Date: Sun,  4 Jun 2023 19:27:53 +0300
Message-Id: <20230604162800.1048327-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604162800.1048327-1-dmitry.baryshkov@linaro.org>
References: <20230604162800.1048327-1-dmitry.baryshkov@linaro.org>
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

During IRQ conversion we have lost the PP_DONE interrupts for sc7280
platform. This was left unnoticed, because this interrupt is only used
for CMD outputs and probably no sc7[12]80 systems use DSI CMD panels.

Fixes: 667e9985ee24 ("drm/msm/dpu: replace IRQ lookup with the data in hw catalog")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  8 ++++++--
 .../drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 16 ++++++++++++----
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 0b05da2592c0..67566b07195a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -80,8 +80,12 @@ static const struct dpu_dspp_cfg sc7180_dspp[] = {
 };
 
 static const struct dpu_pingpong_cfg sc7180_pp[] = {
-	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk, -1, -1),
-	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk, -1, -1),
+	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+			-1),
+	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
+			-1),
 };
 
 static const struct dpu_intf_cfg sc7180_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 5d894cbb0a62..297eb5ea1865 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -88,10 +88,18 @@ static const struct dpu_dspp_cfg sc7280_dspp[] = {
 };
 
 static const struct dpu_pingpong_cfg sc7280_pp[] = {
-	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x69000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK_DITHER("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
+	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x69000, 0, sc7280_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+			-1),
+	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
+			-1),
+	PP_BLK_DITHER("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
+			-1),
+	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
+			-1),
 };
 
 static const struct dpu_wb_cfg sc7280_wb[] = {
-- 
2.39.2

