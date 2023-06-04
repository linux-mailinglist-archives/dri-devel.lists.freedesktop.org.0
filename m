Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2627B7219F7
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 22:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB1210E1E8;
	Sun,  4 Jun 2023 20:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B5E10E18A
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 20:35:57 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f6148f9679so2883894e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jun 2023 13:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685910957; x=1688502957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pgF29by2cX+xVh67NQRQCW8xUhS6ue0+V88q6lvLAK0=;
 b=ryzQKtmBvaP+jNevXTcSucgI8XjR3u/JwT1lDcOXkHD57B1+MhAgm/CBvpPBqcyRas
 CEJ7dKBP5vrBPOfG85TAoCOVij9XwhbtNRlhpQKQOUJxEd+q3YLcXdPiPssZkzNwG6Jz
 22mir+r0vRG1BuOUT+hnwnLEJNb+3aRxpeRGVC90gfED/8kbfItb5vk1Bb+JaDcxBo4U
 buLBRHGPjwgjQGlQUt7uXM9o+Umy5cWyaQaLosdeChfEKkUAetvPN3A9LY3XQ+4giskY
 nrg9Dr9acqQcAPTm3q8cjv4bfjaYGfa3Gzz0cfZw6p5QSiaGQJhv0AoMfoR4tjEOPabq
 kd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685910957; x=1688502957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pgF29by2cX+xVh67NQRQCW8xUhS6ue0+V88q6lvLAK0=;
 b=U9CIyfoB/oOViLue/3/DBuyXk/K6H7hnxM5R9hW5Ho2Bi591LeFWa9jQ2NLrrtx5oz
 gg/XJ1s9wnD0C39MNjgBSQSu7zLlKszrZJ9eT3LIQY/Z5K7DyzdbzBOngRVbgP/hh/ys
 wYTnpuGTDevfg3ZEQxJFtjQnLcZDsKZxD3JLaDIoCsubmWsOEILH3P+1lEv1SRdO9kyA
 yLAMLsphNv8AHCa3xxSc5k/Y+tIvAal2S+UpcOmk5ZujHlPlH9se1kqa1cDJhb5omEkT
 vPIHeMM7rI0Y1o+BVuGn0EdfVQIIo1oMHdFI7+nBnhY5GFwPHsPeXIn5kXk3O2n8bzUA
 NA4g==
X-Gm-Message-State: AC+VfDzEmVrGw/+0snkZtKWgeetAtn4ayFC7pKGdbGRpqxY5Ak/KaTKC
 Q0WcJUNedD4QdEzV2DujrVelaw==
X-Google-Smtp-Source: ACHHUZ4iJHEjL5CYMphetkyMeOZ/TkMqMKi9QrR3WJgYLZi+BwYyVt9s7wGvkj+EJLIn6urgGx7RZQ==
X-Received: by 2002:a05:6512:3882:b0:4f2:5d38:2c37 with SMTP id
 n2-20020a056512388200b004f25d382c37mr4977659lft.15.1685910957190; 
 Sun, 04 Jun 2023 13:35:57 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a19-20020a19f813000000b004f2794dcb4asm875822lff.255.2023.06.04.13.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 13:35:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 22/22] drm/msm/dpu: move DPU_PINGPONG_DSC to
 PINGPONG_SDM845_MASK
Date: Sun,  4 Jun 2023 23:35:32 +0300
Message-Id: <20230604203532.1094249-23-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
References: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
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

Move BIT(DPU_PINGPONG_DSC) back to PINGPONG_SDM845_MASK, we do not have
to be that explicit anymore.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 21744d2b3fe0..82c098725112 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -204,7 +204,7 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SDM845_TE2_MASK | BIT(DPU_PINGPONG_TE),
+		.features = PINGPONG_SDM845_TE2_MASK,
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
@@ -212,7 +212,7 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
 	{
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_SDM845_TE2_MASK | BIT(DPU_PINGPONG_TE),
+		.features = PINGPONG_SDM845_TE2_MASK,
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
@@ -220,7 +220,7 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
 	{
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
-		.features = PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE),
+		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),
@@ -228,7 +228,7 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
 	{
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
-		.features = PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE),
+		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index a0b3bdf2e450..a53881669206 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -200,7 +200,7 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SDM845_TE2_MASK | BIT(DPU_PINGPONG_TE),
+		.features = PINGPONG_SDM845_TE2_MASK,
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
@@ -208,7 +208,7 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 	{
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_SDM845_TE2_MASK | BIT(DPU_PINGPONG_TE),
+		.features = PINGPONG_SDM845_TE2_MASK,
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
@@ -216,7 +216,7 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 	{
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
-		.features = PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE),
+		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),
@@ -224,7 +224,7 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 	{
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
-		.features = PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE),
+		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 206ff71227cb..6088164dc306 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -76,7 +76,7 @@
 	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
 
 #define PINGPONG_SDM845_MASK \
-	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
+	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_TE) | BIT(DPU_PINGPONG_DSC))
 
 #define PINGPONG_SDM845_TE2_MASK \
 	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
-- 
2.39.2

