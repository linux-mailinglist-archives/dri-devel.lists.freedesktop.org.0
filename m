Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C736A7BE797
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 19:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0AC10E291;
	Mon,  9 Oct 2023 17:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E4410E28B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 17:18:04 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2bff936e10fso69587421fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 10:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696871883; x=1697476683; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oNuBdgTqnLvsaFXnef7V2YyQGajnGwk3qDz3SFukOEs=;
 b=VytkyHge3c4WBJjjFKGrL7hC1vgomUAviV+KfGeQP4GqHbWS9iD2I9EMYmTYW4YVks
 tnfCUSftRngJFE6BgKm3C7EuL0E1KCArURLAUBp8FRYXQrKCdTVLWTtqoKzlbBaZ3ZeM
 GYwMgesf62iXKBA0DSxxm3n2q5fedd5R0G931AcH678yeXcfRMQuSOv1dO0N9Oki8H9t
 NuMuXgI334Mojlw8GjPa+OsnP4VixC28v13czDBCz3iohOLdfYaWLAU0UYuSCg2XrSTW
 luEUfI5MhwjydWKqjh7G2/M8LmvlSf3b0S/cyhc2hX1kpAgCnu/Uhr7lnVUacvZzEBy3
 wsxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696871883; x=1697476683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oNuBdgTqnLvsaFXnef7V2YyQGajnGwk3qDz3SFukOEs=;
 b=XFwLLfRp7AWKTZ1TsjLcl7M29NiFV/MrG5QHXkwgqe7LGYYSk/a4AdIwJZWTWOX0gV
 cfb0mWhQBtuksdianIxKZcFzJkzzEIEMluNPryOaQoZmBhArOP/MOlHUxnkmmGVA8sWa
 nBlqgKc4E+XsCeWGI5hs/IeqHA7H6f7Y4meFUJzPAn8A2xJ4en5zCzSYtdeO6hzUrr61
 tcwHEbligDYQw9fvW2N5advLHLqDOHppZv8PtraQhqUAl6GgpofuMHPn7r/fMEBRANNk
 TYTdREPEZpb1x/8dLtV8LUO2PHC7GjvHTE5qlLZjB1PylrOeb9tgYCT+tGgTYODCQqOq
 y4lA==
X-Gm-Message-State: AOJu0YwxCnVF55HIckNhSCjOF1bvkzLAZ2AculCMJKJxb1VjcUKTReA3
 UmKh7w3dB31X4V48B20sdrZ8Xw==
X-Google-Smtp-Source: AGHT+IFqUXB62QSOWQHg8DjJu6B8zTraugdCMY3Fw7pHyqr58gvCtWcGEMFyMnrJ1920E4eblAq6CQ==
X-Received: by 2002:a05:651c:1699:b0:2c1:6d1c:2cef with SMTP id
 bd25-20020a05651c169900b002c16d1c2cefmr10009637ljb.14.1696871882713; 
 Mon, 09 Oct 2023 10:18:02 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a2e7412000000b002bcd2653872sm2088284ljc.30.2023.10.09.10.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 10:18:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [RFT PATCH 2/4] drm/msm/dpu: enable writeback on SC8108X
Date: Mon,  9 Oct 2023 20:17:58 +0300
Message-Id: <20231009171800.2691247-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009171800.2691247-1-dmitry.baryshkov@linaro.org>
References: <20231009171800.2691247-1-dmitry.baryshkov@linaro.org>
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
index f3de21025ca7..1631a121e471 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -34,6 +34,7 @@ static const struct dpu_mdp_cfg sc8180x_mdp = {
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
 	},
 };
 
@@ -304,6 +305,21 @@ static const struct dpu_dsc_cfg sc8180x_dsc[] = {
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
@@ -420,6 +436,8 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
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

