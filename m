Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 901AA7218A0
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 18:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BADC10E163;
	Sun,  4 Jun 2023 16:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDD310E15C
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 16:28:05 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f624daccd1so600568e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jun 2023 09:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685896083; x=1688488083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QknxromTxn6EfEwl61zR7bUX62pj5qY3N+wThxEHGpU=;
 b=E8Qdcws3YERcdr+2WuchjJcCn6Pe/hlG5jhkjQR6e5dLNSzs7SVTwyL/VYmMw0+KsT
 rWAmRTmaITiQZiB1vO+2v6P2BOKWv2Zd8tk8VSnKAkLjbV7emGzxEkdUKhBFFBDV7CrZ
 jy/VPUJN+q+NMelu1iJIkTvf4Hyacu497Yip/a2fV0cKXKHa1vIHBgO9pt31zb9bOYmP
 Sqq4pwx+armCRhH+v5cd2JnqOOebnF03adTmgkMUPbSzKClnkJzKMUB0uNciEvr+hEJE
 Tl2bdpvjxG8hiQzaobOiEtYFxjmKpItY0QyfSeoPs1pIqVz9K5g/P9IbK6ZsqawlMcx7
 PGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685896083; x=1688488083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QknxromTxn6EfEwl61zR7bUX62pj5qY3N+wThxEHGpU=;
 b=RtQyprZ9DhcAeYVPqppP90Jmrq2zmBYo3DVM/gyvO5HEbKsg6HJuIn5JDMpGIv5NBQ
 hUXX98gZe3yMYi6DKz6FmB/te5uJ6mAKnTyxKi3S2IGyfFDJ8nayRtoxYao/C7vy6gse
 D1uzd4Cr7iyjcTvmWGJsbVj3Y2BGnf9m6optKPUty1fhXnixQ8JH+JHR5iCwJT07NqEZ
 gU86OZPidYseQkkEgGvFq152bB0te7+K5DD36v3uXemJKA8j5aDDXJilKMPJchxzhMe0
 dzpUKjtiwzRuF0x44WCp8MwSiAux6F93yC9vPhb+Sag1/QPXPHkTeZ3fA4YCAm3CK1Yf
 wA2Q==
X-Gm-Message-State: AC+VfDyaRMqkULXJMXFB4SdoMutCdXGVKP++32Dok8L8wIs/OCM7d5Uc
 HmAvKhFUccjjELXZWPu7pkyGnA==
X-Google-Smtp-Source: ACHHUZ60Wl/AtyxIgoxR0KBZW8Xy0NgOsWcUzSsEI5+FuHYuDtW/vO1M6UzyH5hQwqXfgy40cfUmZQ==
X-Received: by 2002:ac2:4c87:0:b0:4cc:96f8:f9c6 with SMTP id
 d7-20020ac24c87000000b004cc96f8f9c6mr4403993lfl.5.1685896083600; 
 Sun, 04 Jun 2023 09:28:03 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 g14-20020a19ee0e000000b004f61a57797esm537975lfb.69.2023.06.04.09.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 09:28:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 3/8] drm/msm/dpu: don't pass intr_rdptr to PP_BLK_DITHER
Date: Sun,  4 Jun 2023 19:27:55 +0300
Message-Id: <20230604162800.1048327-4-dmitry.baryshkov@linaro.org>
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

The dither-only PINGPONG blocks do not have the RDPTR interrupts. Stop
passing useless data to the macro and use it as a default.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 18 ++++++-----------
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  6 ++----
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  3 +--
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  3 +--
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 18 ++++++-----------
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    | 12 ++++-------
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 12 +++++------
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 20 ++++++-------------
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 20 ++++++-------------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  4 ++--
 10 files changed, 40 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 290fb33817a8..c308e9797dc6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -130,23 +130,17 @@ static const struct dpu_dspp_cfg sm8250_dspp[] = {
 
 static const struct dpu_pingpong_cfg sm8250_pp[] = {
 	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8)),
 	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9)),
 	PP_BLK_DITHER("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10)),
 	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11)),
 	PP_BLK_DITHER("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30)),
 	PP_BLK_DITHER("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31)),
 };
 
 static const struct dpu_merge_3d_cfg sm8250_merge_3d[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index ee4e2416e516..d92ce1fc8b9f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -81,11 +81,9 @@ static const struct dpu_dspp_cfg sc7180_dspp[] = {
 
 static const struct dpu_pingpong_cfg sc7180_pp[] = {
 	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8)),
 	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9)),
 };
 
 static const struct dpu_intf_cfg sc7180_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index bda47b4f0a82..99dfc6d4522d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -61,8 +61,7 @@ static const struct dpu_dspp_cfg sm6115_dspp[] = {
 
 static const struct dpu_pingpong_cfg sm6115_pp[] = {
 	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
-		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		-1),
+		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8)),
 };
 
 static const struct dpu_intf_cfg sm6115_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 5a366dee16be..aa0489898552 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -58,8 +58,7 @@ static const struct dpu_dspp_cfg qcm2290_dspp[] = {
 
 static const struct dpu_pingpong_cfg qcm2290_pp[] = {
 	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
-		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		-1),
+		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8)),
 };
 
 static const struct dpu_intf_cfg qcm2290_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 3c1b2c13398d..e1c7d3b77d2f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -128,23 +128,17 @@ static const struct dpu_dspp_cfg sm8350_dspp[] = {
 
 static const struct dpu_pingpong_cfg sm8350_pp[] = {
 	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8)),
 	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9)),
 	PP_BLK_DITHER("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10)),
 	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11)),
 	PP_BLK_DITHER("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30)),
 	PP_BLK_DITHER("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31)),
 };
 
 static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 297eb5ea1865..79310d5f158c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -89,17 +89,13 @@ static const struct dpu_dspp_cfg sc7280_dspp[] = {
 
 static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x69000, 0, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8)),
 	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9)),
 	PP_BLK_DITHER("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10)),
 	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11)),
 };
 
 static const struct dpu_wb_cfg sc7280_wb[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index c3f1ae000a21..33ce23cf729a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -123,17 +123,17 @@ static const struct dpu_dspp_cfg sc8280xp_dspp[] = {
 
 static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8), -1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8)),
 	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9), -1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9)),
 	PP_BLK_DITHER("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10), -1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10)),
 	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11), -1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11)),
 	PP_BLK_DITHER("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30), -1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30)),
 	PP_BLK_DITHER("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31)),
 };
 
 static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 86c2e68ebd2c..182e91bb7dda 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -129,28 +129,20 @@ static const struct dpu_dspp_cfg sm8450_dspp[] = {
 
 static const struct dpu_pingpong_cfg sm8450_pp[] = {
 	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8)),
 	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9)),
 	PP_BLK_DITHER("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10)),
 	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11)),
 	PP_BLK_DITHER("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30)),
 	PP_BLK_DITHER("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31)),
 	PP_BLK_DITHER("pingpong_6", PINGPONG_6, 0x65800, MERGE_3D_3, sc7280_pp_sblk,
-			-1,
 			-1),
 	PP_BLK_DITHER("pingpong_7", PINGPONG_7, 0x65c00, MERGE_3D_3, sc7280_pp_sblk,
-			-1,
 			-1),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 85dc34458b88..3d48d961977f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -133,28 +133,20 @@ static const struct dpu_dspp_cfg sm8550_dspp[] = {
 };
 static const struct dpu_pingpong_cfg sm8550_pp[] = {
 	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8)),
 	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9)),
 	PP_BLK_DITHER("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10)),
 	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11)),
 	PP_BLK_DITHER("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30)),
 	PP_BLK_DITHER("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
-			-1),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31)),
 	PP_BLK_DITHER("pingpong_6", PINGPONG_6, 0x66000, MERGE_3D_3, sc7280_pp_sblk,
-			-1,
 			-1),
 	PP_BLK_DITHER("pingpong_7", PINGPONG_7, 0x66400, MERGE_3D_3, sc7280_pp_sblk,
-			-1,
 			-1),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index f07eab738008..9a0a8688848e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -481,7 +481,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	.len = 0x20, .version = 0x20000},
 };
 
-#define PP_BLK_DITHER(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
+#define PP_BLK_DITHER(_name, _id, _base, _merge_3d, _sblk, _done) \
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = 0, \
@@ -489,7 +489,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	.merge_3d = _merge_3d, \
 	.sblk = &_sblk, \
 	.intr_done = _done, \
-	.intr_rdptr = _rdptr, \
+	.intr_rdptr = -1, \
 	}
 #define PP_BLK(_name, _id, _base, _features, _merge_3d, _sblk, _done, _rdptr) \
 	{\
-- 
2.39.2

