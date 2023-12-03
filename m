Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D8D802017
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 01:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8354E10E24C;
	Sun,  3 Dec 2023 00:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4375D10E24D
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 00:32:08 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50bd928b13cso2617195e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 16:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701563526; x=1702168326; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0C9JIY3GCJCSUXtT2mszaRF/C74fxdUxFphdfFtUxjQ=;
 b=eky1O2uRW3Spkm1vS80YrDxlW48RtKvuGYZ6oPe56A21WWKpFKoA/xDFFB/OhA9Vw2
 W7ehc0RuXWgyzBunAPCmzuf1PDSFGdpVQbuekP50jUzYq+Zyu4iujIbDA/pmpsMlDvUz
 JqebR8mWy6dkFcJLXIO505chVa+6+r5ZJKCMjuESA29iZnaoXliROyNei/GRuUJkuNYe
 t+Wm3EqE4CetDWFFNVJUMTewXkZbDGkfpnbdfp+aDt0fLAxCD73WdQfqEiSUiWQuBx6t
 bEKU6lr//ISZaNOJJq7WIW1cVIPKytbJFsy9rVWJUehbmHJUKawtpHj33VxUCHwtllxu
 mSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701563526; x=1702168326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0C9JIY3GCJCSUXtT2mszaRF/C74fxdUxFphdfFtUxjQ=;
 b=Nc0xFyM6ES9IrJvLjeUxRFUemhVYi5j1BjPD3nv1djpUyd40fVmKb8ep/CPJknDo/Q
 W1jRNHwMGePt4I6t6B2YWPiEaiAkuqc/DF3pbApiUNUq5rWewGOmg2VZaY/NpRBf7hgY
 tnsG+v/0YK5qrbd6ZTFwDiVzvoqmJJzuSTAd3XwkkXfhZeyAXqOciCfMRapRf75Ad4t7
 drKHqEUcfDSwolkFT/Ja6b08L8XrUoy/PuWCQZfnfHJslTuvGaiDxs6nDLs/peYpQ7sS
 U4sDjZQUUdHjVWuP1OXkhEeuyGxy84mbmdbFpwC8b2sw70age1xu0/SGgym+o3XHh+oH
 +PnQ==
X-Gm-Message-State: AOJu0YxuA1qBetgoKk7gjXWb2BBAX7TojVOylydcJ4IX4bVL8ITBfGDh
 yQvi9qQjKr/+9ZNXFPvPkO/LyQ==
X-Google-Smtp-Source: AGHT+IHZY5lfzqNBQ2sQQka0ULP8B/jhtDVtHjo4ZC3ymr6KOGt1SoLOCi/yWR+HkNAzq6rwseUwgw==
X-Received: by 2002:a05:6512:398e:b0:50b:e5a9:a467 with SMTP id
 j14-20020a056512398e00b0050be5a9a467mr939319lfu.88.1701563526621; 
 Sat, 02 Dec 2023 16:32:06 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i7-20020ac25b47000000b0050ba4a26fccsm422408lfp.117.2023.12.02.16.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 16:32:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [RFT PATCH v2 2/4] drm/msm/dpu: enable writeback on SC8108X
Date: Sun,  3 Dec 2023 03:32:01 +0300
Message-Id: <20231203003203.1293087-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
References: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
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
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 9ffc8804a6fc..d4b531752ec2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -34,6 +34,7 @@ static const struct dpu_mdp_cfg sc8180x_mdp = {
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 	},
 };
 
@@ -298,6 +299,21 @@ static const struct dpu_dsc_cfg sc8180x_dsc[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sc8180x_wb[] = {
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
 static const struct dpu_intf_cfg sc8180x_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -411,6 +427,8 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
 	.pingpong = sc8180x_pp,
 	.merge_3d_count = ARRAY_SIZE(sc8180x_merge_3d),
 	.merge_3d = sc8180x_merge_3d,
+	.wb_count = ARRAY_SIZE(sc8180x_wb),
+	.wb = sc8180x_wb,
 	.intf_count = ARRAY_SIZE(sc8180x_intf),
 	.intf = sc8180x_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.2

