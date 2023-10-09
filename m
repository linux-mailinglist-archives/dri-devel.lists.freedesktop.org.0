Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B817BE793
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 19:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9600310E28B;
	Mon,  9 Oct 2023 17:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05D810E291
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 17:18:03 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c008042211so57258371fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 10:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696871882; x=1697476682; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iqf751KKQfxwldVh3O4+QqYv6/dvoeaMh1iiCq2kv80=;
 b=Id0jw3e6rgkEMZAKMROThqp1hEkqv81oeVhXDHHkXVpR1jkRKBf5PwOuxOSCyRIYX5
 FJK1GADoGN5PMF4k+AlHv4pHquNDET7AnMu34WJ8a4wX5kzsYKnV62y8NWkOyb3wouC1
 VUGRHBq/uZ+CYI0Q/kZaq0ETfiGPMIa+dO9qbZnuTnKxmQ1g7/fb25j2pW4+ptmnnn8Z
 ssHDU/6g3ZPg3bhydHdSKr9CCGpbAeepDpAO8xwdO7T4KVkx+PafL6LzdMJXVQ29LrbK
 Lh0Pctn2shva8f53cbiZxchtBcOjTgMkCmDZt0oFvr//JVG2SPoH/Gw3LV65gOLC2XXx
 zPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696871882; x=1697476682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iqf751KKQfxwldVh3O4+QqYv6/dvoeaMh1iiCq2kv80=;
 b=h3che+1W2ZzXFnFc+dMgromzJTGigXdjeR4Xh8Ba8IDP4nU5Q8PcTi6esxjVm7ZAUx
 izlZ/ELtltKN7laVXW1MYFxyCRCUK4LCdPnscE1agRP+G+BiDg/n2vKr0LK/m50CfLmf
 3dVgUmZndM3COcH/vz6q1JclpCJx2LHmSRcLThZiUIhrxVsR39ofhvLJsgOSkWMMZyAy
 nccb1MNvW/zB0UO2+gPmuqPxLfMm2wUObZVchLowGpklxPTMQkfnOdX3XbjKGtg8EQ8R
 FNvvrwlAYmeSTvY3sdrHUUDx7IS0LrnzQDvido05DLq/cNwcjwSVvX3QkCngcRpwWG8e
 jXSw==
X-Gm-Message-State: AOJu0YwCBlLWmJ5yTQqyhesC/7sIUmPtk1e8lwtDmID4JhSQPoqSIBwV
 EVlyTLxN9qUG3tEt/Lf131/iVw==
X-Google-Smtp-Source: AGHT+IEzTQpRmQ5AlYjb8eVMR+MpL/UW6yD7a6TxSauWCKs8l58SzgMyy/RyM9pU/T8I8AqqipGdOQ==
X-Received: by 2002:a2e:8e98:0:b0:2bf:f32a:1f68 with SMTP id
 z24-20020a2e8e98000000b002bff32a1f68mr14690515ljk.19.1696871881909; 
 Mon, 09 Oct 2023 10:18:01 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a2e7412000000b002bcd2653872sm2088284ljc.30.2023.10.09.10.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 10:18:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [RFT PATCH 1/4] drm/msm/dpu: enable writeback on SM8150
Date: Mon,  9 Oct 2023 20:17:57 +0300
Message-Id: <20231009171800.2691247-2-dmitry.baryshkov@linaro.org>
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
 .../drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 99acaf917e43..b641e67f6afe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -34,6 +34,7 @@ static const struct dpu_mdp_cfg sm8150_mdp = {
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
 	},
 };
 
@@ -297,6 +298,21 @@ static const struct dpu_dsc_cfg sm8150_dsc[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sm8150_wb[] = {
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
 static const struct dpu_intf_cfg sm8150_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -393,6 +409,8 @@ const struct dpu_mdss_cfg dpu_sm8150_cfg = {
 	.pingpong = sm8150_pp,
 	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
 	.merge_3d = sm8150_merge_3d,
+	.wb_count = ARRAY_SIZE(sm8150_wb),
+	.wb = sm8150_wb,
 	.intf_count = ARRAY_SIZE(sm8150_intf),
 	.intf = sm8150_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.2

