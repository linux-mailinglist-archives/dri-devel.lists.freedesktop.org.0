Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3022E7218A3
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 18:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D78C10E16D;
	Sun,  4 Jun 2023 16:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E9610E15D
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 16:28:06 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f611ac39c5so2976459e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jun 2023 09:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685896084; x=1688488084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oNULruN3aRzxtXFBFAkxasq5H/434iooJY8eRnsPq70=;
 b=eU6b/zsN8LZBGKqbzNcSZ60q5RjeD2ZmP8eePYmt6yaA17jyVpOkvOeU50MX6dNpG+
 39AHYPotFJSAqlcdQWCJHFtfOIIwAx05ku0NivTFemsiPESm9HjizYocFKt3Zc/5VMmV
 nBq8fYLt5oW89ZEDeXT2v+v/RH+7j/lKpGNHTxMMrATelBNPkdG9fuSoMU9ArUJdqJse
 rIWQYJgmq4xp8KEb8nK6QF7U/Wu1mSTJCbQU6ZRBs5ozSEphNKrdxW8ENgq/YWPsRkSP
 5hPaFDnklSZ8l60C+4XhDuueda5qUmcf+lQ4+K2fLZD/R2xGANls5dJF71gHCdd4EvgR
 XwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685896084; x=1688488084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oNULruN3aRzxtXFBFAkxasq5H/434iooJY8eRnsPq70=;
 b=im0PBObXWKBg/5Ertm2sckASBugTEAQikWT7WKiEdeupcQ6/ZEqlbbzdHFeNPcIWAr
 6yanghrMu557BqqQWISsCEaAbd6ohPs0r8FIWnNJS9sUK9Qb0gEZTgPeoQJwCPYN5fyI
 hL2qxC9Cfo6GzZLR+hOyM2gW80hluJrmJvYnImpix8ltz9FRXHOKGUCObLLvZJ2gRbHL
 o8ZhXeEtaWY5Wtpvmasi56y0WZBK46YZgdkW4xVVj9T8ZFmgb0hHHmLvNPz7qP9GjNNJ
 QiNr5rCALu9I4+02d9/xgoxLbGkTseCf1N/dxRpUZ2teJbypLvk+rB2qP/hic/GUKlzz
 fOpA==
X-Gm-Message-State: AC+VfDxipdDiTxZnM7E+dcKnxp0TR2Lp5K82cF8leM8+0cDqbsAwiDPe
 oHuQyfubWFM0dXgmC/4cFivmSg==
X-Google-Smtp-Source: ACHHUZ4kL8YlOVYraqRC4RE4EiJZNh3xQvRYBNilNuN2FQE71Szewr/rVGnrv6NaSWnfQzZ3qSSfiQ==
X-Received: by 2002:ac2:4193:0:b0:4e8:5e39:6234 with SMTP id
 z19-20020ac24193000000b004e85e396234mr3506159lfh.16.1685896084316; 
 Sun, 04 Jun 2023 09:28:04 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 g14-20020a19ee0e000000b004f61a57797esm537975lfb.69.2023.06.04.09.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 09:28:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 4/8] drm/msm/dpu: split PP_BLK_NO_TE from PP_BLK
Date: Sun,  4 Jun 2023 19:27:56 +0300
Message-Id: <20230604162800.1048327-5-dmitry.baryshkov@linaro.org>
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

Simplify PINGPONG blocks setup: add new PP_BLK_NO_TE, which does not set
RDPTR irq index. Also make sure that DPU_PINGPONG_TE is set for all
TE-enabled PINGPONG blocks by setting it explicitly in PP_BLK.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 30 ++++++++-----------
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 30 ++++++++-----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 14 +++++++--
 3 files changed, 36 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index b5f751354267..d9a3432d4c13 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -128,24 +128,18 @@ static const struct dpu_dspp_cfg sm8150_dspp[] = {
 };
 
 static const struct dpu_pingpong_cfg sm8150_pp[] = {
-	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-			-1),
-	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-			-1),
-	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-			-1),
-	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-			-1),
-	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
-			-1),
-	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
-			-1),
+	PP_BLK_NO_TE("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8)),
+	PP_BLK_NO_TE("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9)),
+	PP_BLK_NO_TE("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10)),
+	PP_BLK_NO_TE("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11)),
+	PP_BLK_NO_TE("pingpong_4", PINGPONG_4, 0x72000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30)),
+	PP_BLK_NO_TE("pingpong_5", PINGPONG_5, 0x72800, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31)),
 };
 
 static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 8ed2b263c5ea..60e82356f2f0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -127,24 +127,18 @@ static const struct dpu_dspp_cfg sc8180x_dspp[] = {
 };
 
 static const struct dpu_pingpong_cfg sc8180x_pp[] = {
-	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-			-1),
-	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-			-1),
-	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-			-1),
-	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-			-1),
-	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
-			-1),
-	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
-			-1),
+	PP_BLK_NO_TE("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8)),
+	PP_BLK_NO_TE("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9)),
+	PP_BLK_NO_TE("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10)),
+	PP_BLK_NO_TE("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11)),
+	PP_BLK_NO_TE("pingpong_4", PINGPONG_4, 0x72000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30)),
+	PP_BLK_NO_TE("pingpong_5", PINGPONG_5, 0x72800, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31)),
 };
 
 static const struct dpu_merge_3d_cfg sc8180x_merge_3d[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 9a0a8688848e..42f8c12c91a2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -76,7 +76,7 @@
 	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
 
 #define PINGPONG_SDM845_MASK \
-	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_TE) | BIT(DPU_PINGPONG_DSC))
+	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define PINGPONG_SDM845_TE2_MASK \
 	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
@@ -491,7 +491,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	.intr_done = _done, \
 	.intr_rdptr = -1, \
 	}
-#define PP_BLK(_name, _id, _base, _features, _merge_3d, _sblk, _done, _rdptr) \
+#define PP_BLK_NO_TE(_name, _id, _base, _features, _merge_3d, _sblk, _done) \
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = 0xd4, \
@@ -499,6 +499,16 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	.merge_3d = _merge_3d, \
 	.sblk = &_sblk, \
 	.intr_done = _done, \
+	.intr_rdptr = -1, \
+	}
+#define PP_BLK(_name, _id, _base, _features, _merge_3d, _sblk, _done, _rdptr) \
+	{\
+	.name = _name, .id = _id, \
+	.base = _base, .len = 0xd4, \
+	.features = _features | BIT(DPU_PINGPONG_TE), \
+	.merge_3d = _merge_3d, \
+	.sblk = &_sblk, \
+	.intr_done = _done, \
 	.intr_rdptr = _rdptr, \
 	}
 
-- 
2.39.2

