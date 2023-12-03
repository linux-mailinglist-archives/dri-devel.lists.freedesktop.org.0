Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D2880200C
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 01:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A38E10E0BF;
	Sun,  3 Dec 2023 00:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B790F10E249
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 00:27:47 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50bc8a9503fso4585212e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 16:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701563266; x=1702168066; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ENcXyo3oZAHAuh9PGU9frNT54lZo45N4oHXWIm8z5V0=;
 b=DPFcXHxUyPBqIUy2kzzBdIMDxIM3/L8/+G+6D7IrvyYm7aROQu1wzvgLcRdjEiFWhL
 6h9P7He6CAULrU61DOQTbfwsa2hGGarHQGJjwg2VKQwY/q8lKv7ABArR7w666sj2/2f/
 R8YmoyWFEP/BXcGvRiv8jy13jzl3KEC4sDINac65zP7PFWdk3vcXFQ0u2UhR8NBg41uA
 NQ8sdfWPsHFqFIRFs50ppjZNYGsyAhpJEo1GJkr9xKpV/pTu6F1ZjhhH6d4lndt3nMbO
 a+3oeDiTU4yV5IhIhB9zmur/i9h0l1KyL/yQVc1kcIAzrPuYZyxjsL5poTSoIrjg6c51
 tJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701563266; x=1702168066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ENcXyo3oZAHAuh9PGU9frNT54lZo45N4oHXWIm8z5V0=;
 b=JfH23q3gLTVxtmGhRoiEu5knWKP7+W8WERGxL+JJMfgphHqAjb+QFaimNpFHOzOPMZ
 JfztJsmJxX0VRULZhgKRN6Fv3J+ksvg4/fIbnT6keVKi5i14d1graxLxHhIswQLj3wfD
 Twjs15SAr614gTi1gBXh53tH7wy4mWUJ/FVLn9LeqwpolR3TzAWRDixm2ziuO7H57gjp
 E8hen8AaXD6NF9zMLx3zV3tKSsuCCRKlzeLY32MerkqekcDKDP3mtKh/MYF7hADh161F
 O+UAihwR6L2bUF3y49G8ust5hT8vEr73GirquCbtuiydR1nCLzw7DKIOGogMMiiaz5eq
 3+oQ==
X-Gm-Message-State: AOJu0YwEbbA5Ahl5VhX/L8NR9JfEO+TScw47YcOy5sIlyFrZpLQrNe1m
 6ApitzJmuHGmrAOiZKUXhh90HA==
X-Google-Smtp-Source: AGHT+IEXF+0Xwsi/ENxGTcfrA+aAzvE7wKsHOb3v0hlzBTqqJGcvX5fXchQklqrENzatQzSg2giZiA==
X-Received: by 2002:a05:6512:ac3:b0:50b:e229:23b0 with SMTP id
 n3-20020a0565120ac300b0050be22923b0mr1151799lfu.94.1701563265776; 
 Sat, 02 Dec 2023 16:27:45 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a056512348d00b0050bca79a59bsm317231lfr.196.2023.12.02.16.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 16:27:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 1/3] drm/msm/dpu: enable writeback on SDM845
Date: Sun,  3 Dec 2023 03:27:41 +0300
Message-Id: <20231203002743.1291956-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203002743.1291956-1-dmitry.baryshkov@linaro.org>
References: <20231203002743.1291956-1-dmitry.baryshkov@linaro.org>
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
index 38ac0c1a134b..d44e00fd898d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -34,6 +34,7 @@ static const struct dpu_mdp_cfg sdm845_mdp = {
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
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
@@ -344,6 +360,8 @@ const struct dpu_mdss_cfg dpu_sdm845_cfg = {
 	.pingpong = sdm845_pp,
 	.dsc_count = ARRAY_SIZE(sdm845_dsc),
 	.dsc = sdm845_dsc,
+	.wb_count = ARRAY_SIZE(sdm845_wb),
+	.wb = sdm845_wb,
 	.intf_count = ARRAY_SIZE(sdm845_intf),
 	.intf = sdm845_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index a1aada630780..1b71fa3ebe73 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -105,14 +105,16 @@
 
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

