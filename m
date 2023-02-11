Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B871E692D37
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 03:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD67E10EE89;
	Sat, 11 Feb 2023 02:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C275010EE7E
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:34 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id jg8so20204394ejc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FUDnRjjCH+4nn9t3WZlo8YHD5w9KBdJX4NeSUXT7tZk=;
 b=uUvmV0A/34JnZO8w+xe3ztwKVppo67xktt4PI2HYEXiDMHo4oXDxyftvB6QmWM5XIr
 vzojkzHwUeE6IbUaattOcHiE2wvrlhdSC/HK0kthF4CMl8PiYZhBZiM/Ot5QeTArzvCa
 nEuKYpSF6OaWBKvG/hTPOwAELI9S/JkjwID/vGs+SFEk1BrpKv5g5zmUh90W7GhihAuE
 XvkBWXxhwiwqGGedEBd9ZX1qabh6sFpbxB+2ZXWS4YdKFd6QjL0dO7VbQxjX8wicyMki
 cCky6nwYWFpzUdHU8jKo6oCPFgwECyorYQoXYY+zhAH1/eQjh+YtaHrGeVgOLIBVWgOx
 RAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FUDnRjjCH+4nn9t3WZlo8YHD5w9KBdJX4NeSUXT7tZk=;
 b=D71ZDnG3CI1ou37GvcUn+eY60t7KwPoxo+Iw+dzfNJpDTyKHlHYMzI0tcsKk2XE0d1
 XpXtMy4P1VO80W4lv91j2OPjjfUrvK3pEeNT3xyWrL0FuADYz8Mip3nBVlx8O4AEYcUn
 txboDe2njYYm58qQcggzKk5RM0rAdevr3K5Sro2jSvEc9doiGxrKEz4/tQ3RTTeq29eS
 5inV8Ar6LGCtGqSxf6ixQSTpXGJ9zwXUA/jqw64FsrD6BztNfLvEuR9iERU3ZxP3veg7
 jEOihBju3giqNMnIffJaUYVX7t1Eifq5XbMgZcH7GLrvA2wc12QBx95WbMRYxejo2+M1
 xQvw==
X-Gm-Message-State: AO0yUKX2bRph2NgwgrQhavo/QV/GW1GBTGITBfkncOtBZoVz6NLfQ6qf
 Poe+QEVz8vZRkPJflW6lqIzxuQ==
X-Google-Smtp-Source: AK7set9jGqWMmTJCwKyi9Io2Dj7/BfdWvLO7WzbHZ9MH79R67dAPGWv1oxcWlJhCramsnnQMDj8IYw==
X-Received: by 2002:a17:906:3792:b0:88d:5081:e9f8 with SMTP id
 n18-20020a170906379200b0088d5081e9f8mr17236069ejc.15.1676081494311; 
 Fri, 10 Feb 2023 18:11:34 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 37/43] drm/msm/dpu: inline IRQ_n_MASK defines
Date: Sat, 11 Feb 2023 04:10:47 +0200
Message-Id: <20230211021053.1078648-38-dmitry.baryshkov@linaro.org>
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

IRQ masks are rarely shared between different DPU revisions. Inline them
to the dpu_mdss_cfg intances and drop them from the dpu_hw_catalog.c

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  9 ++-
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 10 ++-
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 10 ++-
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 12 ++-
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  9 ++-
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  6 +-
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  6 +-
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  6 +-
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  8 +-
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 +-
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 13 +++-
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  8 +-
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  8 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 73 -------------------
 14 files changed, 99 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index b1000b00406e..a4012338ffd2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -198,7 +198,14 @@ static const struct dpu_mdss_cfg msm8998_dpu_cfg = {
 	.vbif = msm8998_vbif,
 	.reg_dma_count = 0,
 	.perf = &msm8998_perf_data,
-	.mdss_irqs = IRQ_SM8250_MASK,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF0_INTR) | \
+		     BIT(MDP_INTF1_INTR) | \
+		     BIT(MDP_INTF2_INTR) | \
+		     BIT(MDP_INTF3_INTR) | \
+		     BIT(MDP_INTF4_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index cca9f58ec95c..7c932dce515a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -197,7 +197,15 @@ static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
 	.reg_dma_count = 1,
 	.dma_cfg = &sdm845_regdma,
 	.perf = &sdm845_perf_data,
-	.mdss_irqs = IRQ_SDM845_MASK,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF0_INTR) | \
+		     BIT(MDP_INTF1_INTR) | \
+		     BIT(MDP_INTF2_INTR) | \
+		     BIT(MDP_INTF3_INTR) | \
+		     BIT(MDP_AD4_0_INTR) | \
+		     BIT(MDP_AD4_1_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 5f2f0b10281d..53eb35751a9c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -83,7 +83,15 @@ static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
 	.reg_dma_count = 1,
 	.dma_cfg = &sm8150_regdma,
 	.perf = &sm8150_perf_data,
-	.mdss_irqs = IRQ_SDM845_MASK,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF0_INTR) | \
+		     BIT(MDP_INTF1_INTR) | \
+		     BIT(MDP_INTF2_INTR) | \
+		     BIT(MDP_INTF3_INTR) | \
+		     BIT(MDP_AD4_0_INTR) | \
+		     BIT(MDP_AD4_1_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index ee4a1c615799..a281a1ebc6c3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -75,7 +75,17 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
 	.reg_dma_count = 1,
 	.dma_cfg = &sm8150_regdma,
 	.perf = &sc8180x_perf_data,
-	.mdss_irqs = IRQ_SC8180X_MASK,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF0_INTR) | \
+		     BIT(MDP_INTF1_INTR) | \
+		     BIT(MDP_INTF2_INTR) | \
+		     BIT(MDP_INTF3_INTR) | \
+		     BIT(MDP_INTF4_INTR) | \
+		     BIT(MDP_INTF5_INTR) | \
+		     BIT(MDP_AD4_0_INTR) | \
+		     BIT(MDP_AD4_1_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 059461d641de..995201cbeb72 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -231,7 +231,14 @@ static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
 	.reg_dma_count = 1,
 	.dma_cfg = &sm8250_regdma,
 	.perf = &sm8250_perf_data,
-	.mdss_irqs = IRQ_SM8250_MASK,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF0_INTR) | \
+		     BIT(MDP_INTF1_INTR) | \
+		     BIT(MDP_INTF2_INTR) | \
+		     BIT(MDP_INTF3_INTR) | \
+		     BIT(MDP_INTF4_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 6184d82fd9f1..2233a081e0ff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -142,7 +142,11 @@ static const struct dpu_mdss_cfg sc7180_dpu_cfg = {
 	.reg_dma_count = 1,
 	.dma_cfg = &sdm845_regdma,
 	.perf = &sc7180_perf_data,
-	.mdss_irqs = IRQ_SC7180_MASK,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF0_INTR) | \
+		     BIT(MDP_INTF1_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index d296bba07192..7c047ef222f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -82,7 +82,11 @@ static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sm6115_perf_data,
-	.mdss_irqs = IRQ_SC7180_MASK,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF0_INTR) | \
+		     BIT(MDP_INTF1_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index e5e48b731fb1..ad2c63b4fa38 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -72,7 +72,11 @@ static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &qcm2290_perf_data,
-	.mdss_irqs = IRQ_SC7180_MASK,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF0_INTR) | \
+		     BIT(MDP_INTF1_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index f9f22cc96238..9e4cfa800a22 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -214,7 +214,13 @@ static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
 	.reg_dma_count = 1,
 	.dma_cfg = &sm8350_regdma,
 	.perf = &sm8350_perf_data,
-	.mdss_irqs = IRQ_SM8350_MASK,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF0_7xxx_INTR) | \
+		     BIT(MDP_INTF1_7xxx_INTR) | \
+		     BIT(MDP_INTF2_7xxx_INTR) | \
+		     BIT(MDP_INTF3_7xxx_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index b511e04347ea..aa0c1e5413e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -148,7 +148,12 @@ static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sc7280_perf_data,
-	.mdss_irqs = IRQ_SC7280_MASK,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF0_7xxx_INTR) | \
+		     BIT(MDP_INTF1_7xxx_INTR) | \
+		     BIT(MDP_INTF5_7xxx_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index ef9b53a9f9b5..d6e77a052819 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -100,7 +100,18 @@ static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
 	.reg_dma_count = 1,
 	.dma_cfg = &sc8280xp_regdma,
 	.perf = &sc8280xp_perf_data,
-	.mdss_irqs = IRQ_SC8280XP_MASK,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF0_7xxx_INTR) | \
+		     BIT(MDP_INTF1_7xxx_INTR) | \
+		     BIT(MDP_INTF2_7xxx_INTR) | \
+		     BIT(MDP_INTF3_7xxx_INTR) | \
+		     BIT(MDP_INTF4_7xxx_INTR) | \
+		     BIT(MDP_INTF5_7xxx_INTR) | \
+		     BIT(MDP_INTF6_7xxx_INTR) | \
+		     BIT(MDP_INTF7_7xxx_INTR) | \
+		     BIT(MDP_INTF8_7xxx_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 08bb0c032f5e..100f9075a4c6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -111,7 +111,13 @@ static const struct dpu_mdss_cfg sm8450_dpu_cfg = {
 	.reg_dma_count = 1,
 	.dma_cfg = &sm8450_regdma,
 	.perf = &sm8450_perf_data,
-	.mdss_irqs = IRQ_SM8450_MASK,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF0_7xxx_INTR) | \
+		     BIT(MDP_INTF1_7xxx_INTR) | \
+		     BIT(MDP_INTF2_7xxx_INTR) | \
+		     BIT(MDP_INTF3_7xxx_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 8a81ce0cc0ec..a900b2732ead 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -197,7 +197,13 @@ static const struct dpu_mdss_cfg sm8550_dpu_cfg = {
 	.reg_dma_count = 1,
 	.dma_cfg = &sm8450_regdma,
 	.perf = &sm8450_perf_data,
-	.mdss_irqs = IRQ_SM8450_MASK,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF0_7xxx_INTR) | \
+		     BIT(MDP_INTF1_7xxx_INTR) | \
+		     BIT(MDP_INTF2_7xxx_INTR) | \
+		     BIT(MDP_INTF3_7xxx_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 6f66328f96b9..c1326c5ca7bf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -86,79 +86,6 @@
 
 #define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
 
-#define IRQ_SDM845_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
-			 BIT(MDP_SSPP_TOP0_INTR2) | \
-			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-			 BIT(MDP_INTF0_INTR) | \
-			 BIT(MDP_INTF1_INTR) | \
-			 BIT(MDP_INTF2_INTR) | \
-			 BIT(MDP_INTF3_INTR) | \
-			 BIT(MDP_AD4_0_INTR) | \
-			 BIT(MDP_AD4_1_INTR))
-
-#define IRQ_SC7180_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
-			 BIT(MDP_SSPP_TOP0_INTR2) | \
-			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-			 BIT(MDP_INTF0_INTR) | \
-			 BIT(MDP_INTF1_INTR))
-
-#define IRQ_SC7280_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
-			 BIT(MDP_SSPP_TOP0_INTR2) | \
-			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-			 BIT(MDP_INTF0_7xxx_INTR) | \
-			 BIT(MDP_INTF1_7xxx_INTR) | \
-			 BIT(MDP_INTF5_7xxx_INTR))
-
-#define IRQ_SM8250_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
-			 BIT(MDP_SSPP_TOP0_INTR2) | \
-			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-			 BIT(MDP_INTF0_INTR) | \
-			 BIT(MDP_INTF1_INTR) | \
-			 BIT(MDP_INTF2_INTR) | \
-			 BIT(MDP_INTF3_INTR) | \
-			 BIT(MDP_INTF4_INTR))
-
-#define IRQ_SM8350_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
-			 BIT(MDP_SSPP_TOP0_INTR2) | \
-			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-			 BIT(MDP_INTF0_7xxx_INTR) | \
-			 BIT(MDP_INTF1_7xxx_INTR) | \
-			 BIT(MDP_INTF2_7xxx_INTR) | \
-			 BIT(MDP_INTF3_7xxx_INTR))
-
-#define IRQ_SC8180X_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
-			  BIT(MDP_SSPP_TOP0_INTR2) | \
-			  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-			  BIT(MDP_INTF0_INTR) | \
-			  BIT(MDP_INTF1_INTR) | \
-			  BIT(MDP_INTF2_INTR) | \
-			  BIT(MDP_INTF3_INTR) | \
-			  BIT(MDP_INTF4_INTR) | \
-			  BIT(MDP_INTF5_INTR) | \
-			  BIT(MDP_AD4_0_INTR) | \
-			  BIT(MDP_AD4_1_INTR))
-
-#define IRQ_SC8280XP_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
-			   BIT(MDP_SSPP_TOP0_INTR2) | \
-			   BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-			   BIT(MDP_INTF0_7xxx_INTR) | \
-			   BIT(MDP_INTF1_7xxx_INTR) | \
-			   BIT(MDP_INTF2_7xxx_INTR) | \
-			   BIT(MDP_INTF3_7xxx_INTR) | \
-			   BIT(MDP_INTF4_7xxx_INTR) | \
-			   BIT(MDP_INTF5_7xxx_INTR) | \
-			   BIT(MDP_INTF6_7xxx_INTR) | \
-			   BIT(MDP_INTF7_7xxx_INTR) | \
-			   BIT(MDP_INTF8_7xxx_INTR))
-
-#define IRQ_SM8450_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
-			 BIT(MDP_SSPP_TOP0_INTR2) | \
-			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-			 BIT(MDP_INTF0_7xxx_INTR) | \
-			 BIT(MDP_INTF1_7xxx_INTR) | \
-			 BIT(MDP_INTF2_7xxx_INTR) | \
-			 BIT(MDP_INTF3_7xxx_INTR))
-
 #define WB_SM8250_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
 			 BIT(DPU_WB_YUV_CONFIG) | \
-- 
2.39.1

