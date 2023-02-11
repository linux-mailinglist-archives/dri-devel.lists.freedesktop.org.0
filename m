Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9CA6934E0
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 00:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A051010E3D5;
	Sat, 11 Feb 2023 23:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2716C10E3C5
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 23:13:14 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id dr8so23872862ejc.12
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 15:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ngDP+i4GOzJ01Ww3pPz8WgeyYemRz8aC231GGb1QAEM=;
 b=sh5nfMrm/3XqGLUin7Az4IV8djjrzT9i0opPIQEsyqHPxbqUYE7yc0VT0kCwa8uFih
 tl/R6/sYHDtLmqRgXxNUAm+a0AU+K1zifhdxCtAQ8PBKI5CJ5Z+2So9cuisGoV2gbKJg
 gfYGLsaH5ZnoHDRSX73CWwYI/ek12RCoUl/p3sodFcGhEd1uCXw3q3zxo6hYlQr4AOIr
 snPxaJLqSItsl8Cz8oKH+GRzv9Po1eZ1e36tq7NOyiwPcH5Jyi3VjnvihPORi4roHRHK
 isb7VIHhE872qamxlRrML5+AjGRK0v++VHKHy7WLH0SD/ggtovfEDEU1ra4twY+tf/by
 tj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ngDP+i4GOzJ01Ww3pPz8WgeyYemRz8aC231GGb1QAEM=;
 b=CxcaRXyqpJMCUjucdexOKHvefaAKCrmyikfKnGvCKxOH4IxkqaxQkSAAsrW0CoxrLS
 aBUeCWP6gMejMd9meyqVdTbitMpmDJm6oRU+txzyEXvg3aSayRApzp506lHSvUoOMn0F
 SkDxgSWB79unAPsme+5pqO/8pj3Oiua5XFkvAfrn74r4C6uNrC0MYb7pMiohWRKVDhA/
 lgMmJmolKQtklaqncLf3BNW9MazaRbIvJWWUmFQrj487ttjQDSPnUxRdOAdbYvMf8RCp
 fDVKHsq5CWjxr44RbMoiOCBv4ayiHRudw4KU2MALQEtLhdyDuW5S3cEhmXBN7p8PZvit
 JFtA==
X-Gm-Message-State: AO0yUKV+Dn47HsnOUqzRZqtHUgyhfPXMjSjd9SFki2KO2kMWkGuQWzN/
 aN1t0ziomoqVUbOPAsY4xH87Xg==
X-Google-Smtp-Source: AK7set/BUFeaFRJ0tCC344HE7VMFEhIArmbuJOfU/WZlT9rdNc+bf2i4W1ICmzgav3hAJ0EzAnqt1g==
X-Received: by 2002:a17:907:6090:b0:8ae:3380:ff56 with SMTP id
 ht16-20020a170907609000b008ae3380ff56mr17492518ejc.63.1676157192626; 
 Sat, 11 Feb 2023 15:13:12 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 15:13:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 09/50] drm/msm/dpu: correct sm8250 and sm8350 scaler
Date: Sun, 12 Feb 2023 01:12:18 +0200
Message-Id: <20230211231259.1308718-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
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

QSEED4 is a newer variant of QSEED3LITE, which should be used on
sm8250 and sm8350. Fix the DPU caps structure and used feature masks.

Fixes: d21fc5dfc3df ("drm/msm/dpu1: add support for qseed3lite used on sm8250")
Fixes: 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 4f6555c04256..360ca7b5e507 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -416,7 +416,7 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
 static const struct dpu_caps sm8250_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
-	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
+	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
@@ -430,7 +430,7 @@ static const struct dpu_caps sm8250_dpu_caps = {
 static const struct dpu_caps sm8350_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
-	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
+	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
@@ -1245,22 +1245,22 @@ static const struct dpu_sspp_cfg sm6115_sspp[] = {
 };
 
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
-				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_1 =
-				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_2 =
-				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
-				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
 
 static const struct dpu_sspp_cfg sm8250_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM8250_MASK,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
 		sm8250_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SM8250_MASK,
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK,
 		sm8250_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SM8250_MASK,
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK,
 		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SM8250_MASK,
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK,
 		sm8250_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
 	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-- 
2.39.1

