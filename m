Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A62A7BE798
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 19:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C038C10E29D;
	Mon,  9 Oct 2023 17:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCD210E28B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 17:18:05 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c00e1d4c08so60466751fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 10:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696871884; x=1697476684; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CEblOIocXlow3cb9XQyMsSKR9zDBhqpUmKljUztzkSU=;
 b=QltQiY34VaFMNgesPhftD4xlPCX0DJzmb1hfTHnqR6wst7mcUjIVZcRESPqLpMdSF9
 GHcLLLezU5mFDOe0BFgAUpzqQnBfkXf+0CVnlMZX/ChpDkrBetNCsObzYS+vGcpYQmt2
 efoRtNAlZ7R3tf+HGi/cccX9V9/0zFGdBmzT5e4FGCT906Ke7K9SSm4piN5p0MGFtbMm
 LjK+g4mG7HzApCIeUhtwkX/1fgM3NmBiI5xJ0OsUPCNMgJXbyltwzP+pn4ejoOx5gabk
 y8137L6TyZSCFtGCccQAxrXreo3ueA47t6CvwTMVYW+q7mA9uP2wl0P4OBwnuL42x6pI
 Zxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696871884; x=1697476684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CEblOIocXlow3cb9XQyMsSKR9zDBhqpUmKljUztzkSU=;
 b=KAnlujlVgR+VMZo7bM4TuXL+P27I/R5tqnXp5Bhy1hCzpNRWVdkK9msxLohuxEnZVA
 hJO1TjJzVKanlSemCAPexn8RGk6vtAaotv50tuj9T8TVe1q//4NIiCF+e5fTYvMnK8Vi
 RuTXr/wqU9c4/yBeFVcVnW3RUcj+mNEwPbLGKD4jz393K+CKWlCR9EuFPX+d4TvGppN2
 yLsNzZH4hFi2RLuJXJ0vUXrg97kWxPKRXka8aqD7iJSdbhCmaiAAp7pS+IS4HekWzl3e
 2d7nkWhGShZVy45h2S1Ko08zWLS0M0gJ3iHrw9Gap5Ndn5kF6+WGnkXyG5+LNzzrcA+u
 /4kA==
X-Gm-Message-State: AOJu0YzLLtvxn69Mz1qLDT9xb5VhEZ0mpAZ3uBqhf24AE/vrYaCTBZ4h
 xaYBfDh401JIo4vs6BQYVxc/GA==
X-Google-Smtp-Source: AGHT+IG4RdCPzZlKt6l4Watu6D2W7vlq+2/tsr/8tE/NcaZWsglRlppVXo11VIt0pfqpBekhWpNfEA==
X-Received: by 2002:a05:651c:87:b0:2c0:a2:77d7 with SMTP id
 7-20020a05651c008700b002c000a277d7mr13038278ljq.24.1696871884288; 
 Mon, 09 Oct 2023 10:18:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a2e7412000000b002bcd2653872sm2088284ljc.30.2023.10.09.10.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 10:18:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [RFT PATCH 4/4] drm/msm/dpu: enable writeback on SM6350
Date: Mon,  9 Oct 2023 20:18:00 +0300
Message-Id: <20231009171800.2691247-5-dmitry.baryshkov@linaro.org>
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
 .../drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index cf5db6f296bd..206ee16acb86 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -27,6 +27,7 @@ static const struct dpu_mdp_cfg sm6350_mdp = {
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
 };
@@ -148,6 +149,21 @@ static const struct dpu_dsc_cfg sm6350_dsc[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sm6350_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 1920,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
 static const struct dpu_intf_cfg sm6350_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -222,6 +238,8 @@ const struct dpu_mdss_cfg dpu_sm6350_cfg = {
 	.dsc = sm6350_dsc,
 	.pingpong_count = ARRAY_SIZE(sm6350_pp),
 	.pingpong = sm6350_pp,
+	.wb_count = ARRAY_SIZE(sm6350_wb),
+	.wb = sm6350_wb,
 	.intf_count = ARRAY_SIZE(sm6350_intf),
 	.intf = sm6350_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.2

