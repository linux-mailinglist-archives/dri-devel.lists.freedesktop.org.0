Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B3174BADD
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 03:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF67810E64E;
	Sat,  8 Jul 2023 01:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C44710E634
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 01:04:18 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b6fdaf6eefso38893231fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 18:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688778256; x=1691370256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GukvfKi0z1TWMkDJRh+yHJNASBJC4YdRHfEpFVGMNoI=;
 b=pJTxxLuJBkdwMx7m5SaRQwZoFgOWie7cpKViZlw486T0Fqt0KJAzJtj8Mez+KG1Nok
 WpR7fT64521Fxjn3L+LUid2ayJpIvPDiimN2rpavZw6q+OX85n1KR5iGe9xwSBcn0ICT
 tsdj3Z7UDq4J0qibeWE17AlH6kYhXr9vED1qoxei83S2WMb/xGDhA9YIHkKxmaslmlO4
 JY9jm8yYPsuyUHlYFlECMMBHcmoMIQs0X9/xYTqYqk0vzv7fPgQeH9Ge6uCAilWD/jBI
 3ehul0bKh1/X5i2q5MqCdK60zHWu0cGoFX6pruSisB8rytQf7z0t2jiWghH0XtsUZIjr
 S0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688778256; x=1691370256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GukvfKi0z1TWMkDJRh+yHJNASBJC4YdRHfEpFVGMNoI=;
 b=dIi90Gdwii8n09PIuvGhAu7ywd46146DAieE9iFyQMergVVIkJqmTXpCfJp+k7SYEO
 K4PG77YA16hTvm/ZjpuagPUQUKZK9IJbNdVSuAIQjbJQmH2XdVjKN52EG0KWuCC71UQc
 WJBWV14Dvm1mCI5TpE+Z4WvwuN7i9NdpmW+2lb4sRVelWKInt+G9QgEYMlx9jNyei1vQ
 jGBEWR7no2ea8ftWkIhP/WNBbgCHFmAdxbgWpG1WEHEfSXJIliUwtSHWb5Ar22RAlsMI
 gNu1E4L9UjcbSupuU9HjD5QMKaHiESrF0xa1+YAGtxj0f5jWM+07zJ5fuzr+EuWbWylg
 ePnA==
X-Gm-Message-State: ABy/qLaHDD9qOGHkSHzgzwMuy7CrcntVSe8fUHYus+ivoYFSRcLdCN5l
 RCW7nuchzvbscxfPO/nvYXxmMA==
X-Google-Smtp-Source: APBJJlGifSSWCJjyYxl9z+L9go9UKBwvPFokGUOjiaC/BkzBKidtMrn26t73T2+HfmOceLXaDFCGtA==
X-Received: by 2002:a2e:8750:0:b0:2b6:9f1e:12bf with SMTP id
 q16-20020a2e8750000000b002b69f1e12bfmr4960295ljj.1.1688778256413; 
 Fri, 07 Jul 2023 18:04:16 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 18:04:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 11/17] drm/msm/mdp4: use bulk regulators API for LCDC encoder
Date: Sat,  8 Jul 2023 04:04:01 +0300
Message-Id: <20230708010407.3871346-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
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

Switch mdp4_lcdc_encoder to using regulator_bulk_* API instead of
enumerating regulators by hand.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c | 51 ++++++-------------
 1 file changed, 15 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
index 10eb3e5b218e..67c118bb30ca 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
@@ -18,7 +18,7 @@ struct mdp4_lcdc_encoder {
 	struct drm_panel *panel;
 	struct clk *lcdc_clk;
 	unsigned long int pixclock;
-	struct regulator *regs[3];
+	struct regulator_bulk_data regs[3];
 	bool enabled;
 	uint32_t bsc;
 };
@@ -271,12 +271,10 @@ static void mdp4_lcdc_encoder_mode_set(struct drm_encoder *encoder,
 
 static void mdp4_lcdc_encoder_disable(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
 	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
 			to_mdp4_lcdc_encoder(encoder);
 	struct mdp4_kms *mdp4_kms = get_kms(encoder);
 	struct drm_panel *panel;
-	int i, ret;
 
 	if (WARN_ON(!mdp4_lcdc_encoder->enabled))
 		return;
@@ -301,11 +299,8 @@ static void mdp4_lcdc_encoder_disable(struct drm_encoder *encoder)
 
 	clk_disable_unprepare(mdp4_lcdc_encoder->lcdc_clk);
 
-	for (i = 0; i < ARRAY_SIZE(mdp4_lcdc_encoder->regs); i++) {
-		ret = regulator_disable(mdp4_lcdc_encoder->regs[i]);
-		if (ret)
-			DRM_DEV_ERROR(dev->dev, "failed to disable regulator: %d\n", ret);
-	}
+	regulator_bulk_disable(ARRAY_SIZE(mdp4_lcdc_encoder->regs),
+			       mdp4_lcdc_encoder->regs);
 
 	mdp4_lcdc_encoder->enabled = false;
 }
@@ -319,7 +314,7 @@ static void mdp4_lcdc_encoder_enable(struct drm_encoder *encoder)
 	struct mdp4_kms *mdp4_kms = get_kms(encoder);
 	struct drm_panel *panel;
 	uint32_t config;
-	int i, ret;
+	int ret;
 
 	if (WARN_ON(mdp4_lcdc_encoder->enabled))
 		return;
@@ -339,11 +334,10 @@ static void mdp4_lcdc_encoder_enable(struct drm_encoder *encoder)
 	mdp4_crtc_set_config(encoder->crtc, config);
 	mdp4_crtc_set_intf(encoder->crtc, INTF_LCDC_DTV, 0);
 
-	for (i = 0; i < ARRAY_SIZE(mdp4_lcdc_encoder->regs); i++) {
-		ret = regulator_enable(mdp4_lcdc_encoder->regs[i]);
-		if (ret)
-			DRM_DEV_ERROR(dev->dev, "failed to enable regulator: %d\n", ret);
-	}
+	ret = regulator_bulk_enable(ARRAY_SIZE(mdp4_lcdc_encoder->regs),
+				    mdp4_lcdc_encoder->regs);
+	if (ret)
+		DRM_DEV_ERROR(dev->dev, "failed to enable regulators: %d\n", ret);
 
 	DBG("setting lcdc_clk=%lu", pc);
 	ret = clk_set_rate(mdp4_lcdc_encoder->lcdc_clk, pc);
@@ -385,7 +379,6 @@ struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 {
 	struct drm_encoder *encoder = NULL;
 	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder;
-	struct regulator *reg;
 	int ret;
 
 	mdp4_lcdc_encoder = kzalloc(sizeof(*mdp4_lcdc_encoder), GFP_KERNEL);
@@ -411,29 +404,15 @@ struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 	}
 
 	/* TODO: different regulators in other cases? */
-	reg = devm_regulator_get(dev->dev, "lvds-vccs-3p3v");
-	if (IS_ERR(reg)) {
-		ret = PTR_ERR(reg);
-		DRM_DEV_ERROR(dev->dev, "failed to get lvds-vccs-3p3v: %d\n", ret);
-		goto fail;
-	}
-	mdp4_lcdc_encoder->regs[0] = reg;
-
-	reg = devm_regulator_get(dev->dev, "lvds-pll-vdda");
-	if (IS_ERR(reg)) {
-		ret = PTR_ERR(reg);
-		DRM_DEV_ERROR(dev->dev, "failed to get lvds-pll-vdda: %d\n", ret);
-		goto fail;
-	}
-	mdp4_lcdc_encoder->regs[1] = reg;
+	mdp4_lcdc_encoder->regs[0].supply = "lvds-vccs-3p3v";
+	mdp4_lcdc_encoder->regs[1].supply = "lvds-vccs-3p3v";
+	mdp4_lcdc_encoder->regs[2].supply = "lvds-vdda";
 
-	reg = devm_regulator_get(dev->dev, "lvds-vdda");
-	if (IS_ERR(reg)) {
-		ret = PTR_ERR(reg);
-		DRM_DEV_ERROR(dev->dev, "failed to get lvds-vdda: %d\n", ret);
+	ret = devm_regulator_bulk_get(dev->dev,
+				      ARRAY_SIZE(mdp4_lcdc_encoder->regs),
+				      mdp4_lcdc_encoder->regs);
+	if (ret)
 		goto fail;
-	}
-	mdp4_lcdc_encoder->regs[2] = reg;
 
 	return encoder;
 
-- 
2.39.2

