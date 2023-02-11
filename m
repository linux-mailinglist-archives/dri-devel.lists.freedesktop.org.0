Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD48692D27
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 03:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF40210EE77;
	Sat, 11 Feb 2023 02:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544F910EE76
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:27 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id gr7so20208046ejb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TdCawdoH1tVglYFJedB/pG7IX3czBeCM9mOxal/jv70=;
 b=KF1oKw+ftHlORARWLhy2Qh2soQHC3cgHBI7wHXqmT4/F752yN89naN531C/W8NcvfQ
 xN9nucQSL1VOfocf8PgrYFRcPgzacS61Xxd+gErlF9BHrq0GoiZVvy1M7MpyE/qGyXuV
 r789i0RNILzQSg1TZkOTJvxLGSLHxSYPWcq8rix4k2l1ClSK6MzS3dvsY9nlPLDtmrv0
 U8pdYSLLxQ5tts8WuniSXl03vmJ6rcX84a1MnExNm9ex1iKMc+Oagci+gUmiPUY4L4MK
 H0vSvXdySOKK7EbmiYGmOf4O1UL3TKQ8X9XTczkfukM7p8KB9c8gubykqdJp3l74XEdN
 YU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TdCawdoH1tVglYFJedB/pG7IX3czBeCM9mOxal/jv70=;
 b=QMQl7m5nnVmjuZoyFB10N6UiyptDsZZmAauU1sOb/DgUyiQgiSbFRNcBWzj3xs51B+
 eSZIB6mKMZsnhCEGAGiyHprccpyvBCPerX64QoZMW1vjh6C1rQXgzX9GAct8NImEE1WI
 uhGRny5Ch2WLYN7MRRjp+H0R5TaF3m9rK7ElPqeruPM3k7i2gs8YcnH7ZiY6eSVOP2Y4
 snKc9T3oqLwpnMcB4j3XF7X0wEwc2ahHSol0ls2yKqm4Qz7pDVV9RkS7x2lpY3GjSLsL
 lhp1AvLGZGhA5d+tR2NvgFI+oqGTEaVUiNmSJvVsOb9MBWDeH7bKlnYczBgEF1496oZk
 BbEA==
X-Gm-Message-State: AO0yUKUWQFBlzQs0PmvRfgNEWRI7ALdn6/h5F0yGnyckE7vI4B33dh5z
 +Lf3uvZrA0/mKnBaTvZ9h/Jy7g==
X-Google-Smtp-Source: AK7set/BZGUtEHftXHHtuwYNRDzf6P4FOhjL/Ck8ZgM8HjYX4WbeYgCumrSeITkD2Pofb7XbvDWB4w==
X-Received: by 2002:a17:906:6a04:b0:8ae:f258:1103 with SMTP id
 qw4-20020a1709066a0400b008aef2581103mr15509924ejc.26.1676081486929; 
 Fri, 10 Feb 2023 18:11:26 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 30/43] drm/msm/dpu: drop duplicate vig_sblk instances
Date: Sat, 11 Feb 2023 04:10:40 +0200
Message-Id: <20230211021053.1078648-31-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
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

After fixing scaler version we are sure that sm8450 and sc8280xp vig
sblk's are duplicates of sm8250_vig_sblk and thus can be dropped.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  8 ++++----
 .../drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 18 ------------------
 3 files changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 7b0dac12895e..8cb3189f8875 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -84,13 +84,13 @@ static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
 
 static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
-		 sc8280xp_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+		 sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
 	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK,
-		 sc8280xp_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
+		 sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
 	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK,
-		 sc8280xp_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
+		 sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
 	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK,
-		 sc8280xp_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
+		 sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
 	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
 		 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
 	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_SDM845_MASK,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 432f47d1e33c..d47171ef3979 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -84,13 +84,13 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
 
 static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
-		sm8450_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+		sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
 	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK,
-		sm8450_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
+		sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
 	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK,
-		sm8450_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
+		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
 	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK,
-		sm8450_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
+		sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
 	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
 	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_SDM845_MASK,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index e0e45557e7bc..0d637eaf1e02 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -414,15 +414,6 @@ static const struct dpu_sspp_sub_blks sm8250_vig_sblk_2 =
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
 				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
 
-static const struct dpu_sspp_sub_blks sm8450_vig_sblk_0 =
-				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
-static const struct dpu_sspp_sub_blks sm8450_vig_sblk_1 =
-				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED4);
-static const struct dpu_sspp_sub_blks sm8450_vig_sblk_2 =
-				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED4);
-static const struct dpu_sspp_sub_blks sm8450_vig_sblk_3 =
-				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
-
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
 				_VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
@@ -434,15 +425,6 @@ static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
 
-static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_0 =
-				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
-static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_1 =
-				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED4);
-static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_2 =
-				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED4);
-static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_3 =
-				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
-
 #define _VIG_SBLK_NOSCALE(num, sdma_pri) \
 	{ \
 	.maxdwnscale = SSPP_UNITY_SCALE, \
-- 
2.39.1

