Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D9B735F1C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 23:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049CC10E163;
	Mon, 19 Jun 2023 21:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF8B10E15A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 21:25:29 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f849a0e371so5072061e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 14:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687209927; x=1689801927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cC4nYfH+Q6xLbDuuOc8V7muqghbOoBl+TyFMKJBxodc=;
 b=nGuO4h6isD4tc+NYX9WaeRMiLF8D9uxlFXMbv2WdChdSJ+AbbSijiXbU8ysmFy8tHH
 hlk6TciYlkz60MBGCyPYjUhXAkKPqPxUU0I14C7b9VZoA9M7Mx/UM/oDmuIkXrOdm3kt
 cRldykrZBeZ1TD7gOYgCr5rw3T/ZBz1MKTHMmraLxGWieB0yzgRVrKsjN/bTFaynNBXH
 weoQVhwxqbGxwifWYFn4Jzv9KAP+w0eqxqwHnBNGgg/nr7TWyQjTVbVGighNug8Q+dWW
 4yny8nJNskjTP3MHdwjMW5xm8oRwjo164mQf5OZl84Nia0TT/Qj6MUg4QhsDz3ys96NA
 Rx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687209927; x=1689801927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cC4nYfH+Q6xLbDuuOc8V7muqghbOoBl+TyFMKJBxodc=;
 b=P2/0rmYXB5lEdP4C+3De9L9N4v0SR9Yu27tzLaeTBAQFPMZWpRxhQuVUqsb9W5sBpQ
 838AINorgWdEEUdgBIWmh1fW0wfwvg4i4iGrwAxC+nSZ581ufWhGd8IVldObmRSk1ETw
 FeSHMzlkBoD5SGTTLgM6VtSiu6SDMinyvL1Pl8yeYgvnpbEIDRHDUmFlPaJulj2Tvp4U
 cn1bfn6raJIJIIZbqUVvWQVYWUPVsQf63ASLjfxKhMcXL+KbUYJRk5K/iGeppIXk6DqT
 OVI8qxnPSpqvd9pRuJkbhBe/1RYgdi6AgzgFAuG639r+q8Lb25YG2IiC0kWtRIpQ2TvF
 cZxw==
X-Gm-Message-State: AC+VfDw3e3sRZhYnqyPEaApM/CXDNVwK32DcpWPAL4aAuNJGKU028fyk
 x75lM6usnLv5TLVrHRchhtroOg==
X-Google-Smtp-Source: ACHHUZ6FRz7L3pi6Vc+Wshia6pqnmb4GVjbzqOlN6xqFw0RWwJDeAP+hhHJyP4oiL8T9f5NQAt3/nA==
X-Received: by 2002:a19:650f:0:b0:4f8:69ae:2cb1 with SMTP id
 z15-20020a19650f000000b004f869ae2cb1mr2744727lfb.55.1687209927119; 
 Mon, 19 Jun 2023 14:25:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j12-20020ac253ac000000b004f611dd9935sm84864lfh.152.2023.06.19.14.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 14:25:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 07/19] drm/msm/dpu: drop zero features from dpu_mdp_cfg data
Date: Tue, 20 Jun 2023 00:25:07 +0300
Message-Id: <20230619212519.875673-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop useless zero assignments to the dpu_mdp_cfg::features field.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h  | 1 -
 7 files changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index ab1820f1ac54..e321cc0a80ee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -28,7 +28,6 @@ static const struct dpu_ubwc_cfg sm8250_ubwc_cfg = {
 static const struct dpu_mdp_cfg sm8250_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = 0,
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 2df9a00728c0..1919ee487e68 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -25,7 +25,6 @@ static const struct dpu_ubwc_cfg sc7180_ubwc_cfg = {
 static const struct dpu_mdp_cfg sc7180_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = 0,
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 1982654e74a0..0252fe9590e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -26,7 +26,6 @@ static const struct dpu_ubwc_cfg sm6115_ubwc_cfg = {
 static const struct dpu_mdp_cfg sm6115_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = 0,
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index ac237c3197cf..3c2083760294 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -28,7 +28,6 @@ static const struct dpu_ubwc_cfg sm6350_ubwc_cfg = {
 static const struct dpu_mdp_cfg sm6350_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = 0,
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 24c4536e7981..54cc6ad8ee36 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -23,7 +23,6 @@ static const struct dpu_ubwc_cfg qcm2290_ubwc_cfg = {
 static const struct dpu_mdp_cfg qcm2290_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = 0,
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 099b74be3fd2..f0f6f2d801b4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -27,7 +27,6 @@ static const struct dpu_ubwc_cfg sm6375_ubwc_cfg = {
 static const struct dpu_mdp_cfg sm6375_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = 0,
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 7db3a6969189..318bed612da5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -27,7 +27,6 @@ static const struct dpu_ubwc_cfg sm8350_ubwc_cfg = {
 static const struct dpu_mdp_cfg sm8350_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = 0,
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
-- 
2.39.2

