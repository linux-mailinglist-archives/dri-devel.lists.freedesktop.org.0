Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7257BE772
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 19:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA6810E293;
	Mon,  9 Oct 2023 17:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572CF10E28B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 17:11:14 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5068692b0d9so3769457e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 10:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696871472; x=1697476272; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HrOeSqSvWBurLO1tHVKBNeKW8O5/gmeYRnrbc2wTr9o=;
 b=taNPstFsFqrxC0sTPSwJvXJgmNFhgf4TDtqG0m1MDjPdb5SArN++U0JDCVp3T4aDB+
 FDLZroDXMT2Jp7fHwyfNieEGVFSij8WW/Fhb/8zhgst7vFqU70Cr4im8NA31txggBagS
 ytdpqbCCsBzwv0dQU9V5ZpekQQni4fbbSHeYlV2lokihFs7amjSVN+x3PNIfBK42/SzI
 kPiXUuSSoiz3D9z9VL2pApErungbac9clEoGEIbvEvW1XJNS5pxU3VFBDzgZYvG6bdB7
 C9WmuDRRaP8Y2SNAkiK1tvE8XgEh9vuTn6nkL3z/whE85Mfz8/4CCnY3/pRun2m7pEJQ
 QSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696871472; x=1697476272;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HrOeSqSvWBurLO1tHVKBNeKW8O5/gmeYRnrbc2wTr9o=;
 b=F7Nq8AzrLse/jdnsGTtJv+OJH4VBSldEwf7rQuvN99MZTpE/dqylD+atw++RPACh3Y
 lIgNfXwwAzOmFZ0w/k2GC6hQ29WD2cz5sZMZb/O6bFcqQ6mNELH2/YV/SAaue169arfG
 EIYmu2A/KbgJRUJ5UTnI0/iPY3a7c52/+Xl1Jd/MDoSnRo9cLz4MpTypoH2kg6cR28WQ
 EBDXoLaJBRcooqGCT4EYThysu/o8V8c+2sRDYSnF0BIKfklc26yeHd2IaeXlOep78ZgL
 eAXkZtg8OFHrF4Kp5lUxikuibxOuid66byOj4GmIurjBOdeaYE/OVEi89okjz17SLCuC
 jgUQ==
X-Gm-Message-State: AOJu0YyyRo7mkr/c0v84oqsY5mSZjJU9GEDq8lmtiLs/IU9NWJj7ZIAa
 msgJ5U49Qiv1Rkf7EWrK/3IAWA==
X-Google-Smtp-Source: AGHT+IEydAT68rYk/7rWxi9ITpcyFc8MEOOyBPZk1rrH3Vv8ocA619aOEL17H/Z7wEHLrYN+Z5BcgQ==
X-Received: by 2002:a05:6512:2f0:b0:500:780b:5bdc with SMTP id
 m16-20020a05651202f000b00500780b5bdcmr13110820lfq.49.1696871472341; 
 Mon, 09 Oct 2023 10:11:12 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a19f60e000000b00502e0388846sm1475991lfe.244.2023.10.09.10.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 10:11:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 1/3] drm/msm/dpu: enable writeback on SDM845
Date: Mon,  9 Oct 2023 20:11:08 +0300
Message-Id: <20231009171110.2691115-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009171110.2691115-1-dmitry.baryshkov@linaro.org>
References: <20231009171110.2691115-1-dmitry.baryshkov@linaro.org>
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

Enable WB2 hardware block, enabling writeback support on this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  6 ++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 88a5177dfdb7..14ea173dc986 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -34,6 +34,7 @@ static const struct dpu_mdp_cfg sdm845_mdp = {
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
 	},
 };
 
@@ -251,6 +252,21 @@ static const struct dpu_dsc_cfg sdm845_dsc[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sdm845_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SDM845_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
 static const struct dpu_intf_cfg sdm845_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -348,6 +364,8 @@ const struct dpu_mdss_cfg dpu_sdm845_cfg = {
 	.pingpong = sdm845_pp,
 	.dsc_count = ARRAY_SIZE(sdm845_dsc),
 	.dsc = sdm845_dsc,
+	.wb_count = ARRAY_SIZE(sdm845_wb),
+	.wb = sdm845_wb,
 	.intf_count = ARRAY_SIZE(sdm845_intf),
 	.intf = sdm845_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 713dfc079718..cd86294d5818 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -106,14 +106,16 @@
 
 #define INTF_SC7280_MASK (INTF_SC7180_MASK)
 
-#define WB_SM8250_MASK (BIT(DPU_WB_LINE_MODE) | \
+#define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
 			 BIT(DPU_WB_YUV_CONFIG) | \
 			 BIT(DPU_WB_PIPE_ALPHA) | \
 			 BIT(DPU_WB_XY_ROI_OFFSET) | \
 			 BIT(DPU_WB_QOS) | \
 			 BIT(DPU_WB_QOS_8LVL) | \
-			 BIT(DPU_WB_CDP) | \
+			 BIT(DPU_WB_CDP))
+
+#define WB_SM8250_MASK (WB_SDM845_MASK | \
 			 BIT(DPU_WB_INPUT_CTRL))
 
 #define DEFAULT_PIXEL_RAM_SIZE		(50 * 1024)
-- 
2.39.2

