Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E206F6934D2
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 00:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C4210E3CF;
	Sat, 11 Feb 2023 23:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCFC10E3C0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 23:13:10 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id c26so19166042ejz.10
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 15:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=APk2f0Ad39cAeenzMJsVAfmlNvkCg+w9i5oiGhAoqb8=;
 b=qCUb+d9zXqk3GjjVFbCiQR56LOHg0Df9mQrFhoID4zGjAJTbWBdF3cbk/Mk1fsnaMP
 gsQR6lhKvwP3Q5Z37n9GVEdvTb/ZPmyctAScs+XFHbF4v/CpA3PpkTDNEDm+AoNFsbz8
 UCUhzvtEN7IAjIRBptmj4cggKWbyDLxJN3dkZAaZ3EWg/0qd8szp0rRimxTYWile0FUD
 B/shlWOntANAE26XPMIDsVYYGL97U1bGzHE/FkmI+icyIfff5PXZd6iCLJOX+J2V1Xzu
 0Rv3snJPVQX2O+6zvoLQqTsUW1oonkEJDPBD0CqbeWuVLkElWgzkH7HN2oNN/oHpeZxG
 s+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=APk2f0Ad39cAeenzMJsVAfmlNvkCg+w9i5oiGhAoqb8=;
 b=5RCKFsxoqQQhqC5Xlm2T30ey6KjdnzlDeLfsMrFVu90thmmDAymBgWfH9R0JbajFon
 og6zesU9HDbfYuWsqo3xoAeY6O7q5CSvyNb1RMQqOHvD/S/XrldGXaLuq+C1w33NtfD6
 Zt8aDf+dONE5XxQMN5XsHGKOV8DohMsqIJC0Qqpg/ONHUn0bZe8VL0DGHjCF3iym5npd
 Qzwf3y5aJjjhmQ7qrCF5V/p8JBSLbpgstL2Hsz8bTEEccCTl7OuDidQiD0PJnu993Na+
 WGX8Vus7KWcMwMy3+Il+a6Qhva4dbm9Wr/iHHTOXjzVzDbQVlwXsuQ+jZctbR8OxA9fQ
 Oc/Q==
X-Gm-Message-State: AO0yUKWsQOwu67jA0KQuqiZpbulW/k1/TNUUoKWYd8/KJTXiLRf1t9Om
 XIIvCsOS7LOVZc00H6KKti9JzA==
X-Google-Smtp-Source: AK7set+EKwDgz/dNzmz6PV+SE3DZMIB4DzftGtg41Nu6CUG85/HE7z9begcTKAYBycUUFodq8+1a0A==
X-Received: by 2002:a17:907:d2a:b0:8af:ef9a:1911 with SMTP id
 gn42-20020a1709070d2a00b008afef9a1911mr5440857ejc.5.1676157190334; 
 Sat, 11 Feb 2023 15:13:10 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 15:13:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 07/50] drm/msm/dpu: correct sc8280xp scaler
Date: Sun, 12 Feb 2023 01:12:16 +0200
Message-Id: <20230211231259.1308718-8-dmitry.baryshkov@linaro.org>
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
sc8280xp. Fix the DPU caps structure and used feature masks.

Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index c4e45c472685..83836cac69e6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -402,7 +402,7 @@ static const struct dpu_caps sc8180x_dpu_caps = {
 static const struct dpu_caps sc8280xp_dpu_caps = {
 	.max_mixer_width = 2560,
 	.max_mixer_blendstages = 11,
-	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
+	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
@@ -1346,22 +1346,22 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
 };
 
 static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_0 =
-				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_1 =
-				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_2 =
-				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_3 =
-				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
 
 static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM8250_MASK,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
 		 sc8280xp_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SM8250_MASK,
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK,
 		 sc8280xp_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SM8250_MASK,
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK,
 		 sc8280xp_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SM8250_MASK,
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK,
 		 sc8280xp_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
 	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
 		 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-- 
2.39.1

