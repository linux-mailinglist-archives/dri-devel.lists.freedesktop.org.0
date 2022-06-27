Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5551E55BB33
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 18:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC4C10E6A1;
	Mon, 27 Jun 2022 16:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E56710E590
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 16:54:16 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id x3so17721480lfd.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 09:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sb3k59JCSBUMXZbamAYmyTO7aoqJwmjb8uQud/mKblY=;
 b=vFZU0OFvS1K2DlH9hzvum8NS33IxACslnIwDv4kzg3Dex+y/9iHXmAv3kUxDwx3ZJY
 OKtnxH2Ry4MT5cjEM2zRQscxEBOkFedcQw1/hSoiHkZmruAYArgvPy/JdQHzspXvuqI1
 TpFzhCodzeXAmlGbnl4QN9QmI/jz9umenHbwmP77k6+I4z44tSAseM3xgMBOxPpvuojL
 Z+k7v8fV8QyfL9BCFq/k57iivg/iwdtpD48w2Hblyg17mZnqipvJjv7Ickr+1j3jZku0
 QAktubsyPsABRm3zD9cWp1OnujLUJbqDVHQKRfvX2u9HN6Swg8onIslrd6fnKLO0lRW3
 SK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sb3k59JCSBUMXZbamAYmyTO7aoqJwmjb8uQud/mKblY=;
 b=d5dAUiTJoJell38+pkmdZ/4GwPM9pRT1xhY7HWwgc36XosIwsj6uVV0T+EvWmwP61s
 6Hz4xAYah+vNh3lqN4w0kfvaN9D7a2B4omwbwlnwcIylY+rOqJOl947CQUUAsb5a+po8
 x/dbnDAzl8+384IpqWcUxbc/APXA6L2H3jqIlz5yyfZ6udP50m/WdjdwtSUSb9IECkVi
 BAQWyBdS3rFChZfuvcVNPFXr/aaO8V97hCtvsBo2JOKYpOUj1W+aqjX2bpDf5WonlhT4
 +RriySYlN/4GdYjc7O7UJKw+pftFjg26kujzanO+1jw+1bI7bQ4MZIrmBAvcJkykYxHV
 TqzQ==
X-Gm-Message-State: AJIora/x8euXpY3KEhG3arGdmzjTrIBLLY5ErbyMJ5eacG6moAtNBgW+
 lvQROgIB4C7iXWNucLH/yZsV4A==
X-Google-Smtp-Source: AGRyM1uY95jAClQqcZtuObNVNt0GA8FWexab+pJ671Nf0ttJH9A/w1qHC47bDIk+4eGfxO+eIGemHQ==
X-Received: by 2002:a19:8c04:0:b0:47f:65b7:bf11 with SMTP id
 o4-20020a198c04000000b0047f65b7bf11mr9100950lfd.630.1656348854388; 
 Mon, 27 Jun 2022 09:54:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 e18-20020ac25472000000b0047fa941066bsm1867451lfn.96.2022.06.27.09.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 09:54:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/dp: use ARRAY_SIZE for calculating num_descs
Date: Mon, 27 Jun 2022 19:54:13 +0300
Message-Id: <20220627165413.657142-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If for some reason the msm_dp_config::descs array starts from non-zero
index or contains the hole, setting the msm_dp_config::num_descs might
be not that obvious and error-prone. Use ARRAY_SIZE to set this field
rather than encoding the value manually.

Reported-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 46 +++++++++++++++++------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index f87fa3ba1e25..6fed738a9467 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -131,35 +131,43 @@ struct msm_dp_config {
 	size_t num_descs;
 };
 
+static const struct msm_dp_desc sc7180_dp_descs[] = {
+	[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+};
+
 static const struct msm_dp_config sc7180_dp_cfg = {
-	.descs = (const struct msm_dp_desc[]) {
-		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
-	},
-	.num_descs = 1,
+	.descs = sc7180_dp_descs,
+	.num_descs = ARRAY_SIZE(sc7180_dp_descs),
+};
+
+static const struct msm_dp_desc sc7280_dp_descs[] = {
+	[MSM_DP_CONTROLLER_0] =	{ .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
+	[MSM_DP_CONTROLLER_1] =	{ .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
 };
 
 static const struct msm_dp_config sc7280_dp_cfg = {
-	.descs = (const struct msm_dp_desc[]) {
-		[MSM_DP_CONTROLLER_0] =	{ .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
-		[MSM_DP_CONTROLLER_1] =	{ .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
-	},
-	.num_descs = 2,
+	.descs = sc7280_dp_descs,
+	.num_descs = ARRAY_SIZE(sc7280_dp_descs),
+};
+
+static const struct msm_dp_desc sc8180x_dp_descs[] = {
+	[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+	[MSM_DP_CONTROLLER_1] = { .io_start = 0x0ae98000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+	[MSM_DP_CONTROLLER_2] = { .io_start = 0x0ae9a000, .connector_type = DRM_MODE_CONNECTOR_eDP },
 };
 
 static const struct msm_dp_config sc8180x_dp_cfg = {
-	.descs = (const struct msm_dp_desc[]) {
-		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
-		[MSM_DP_CONTROLLER_1] = { .io_start = 0x0ae98000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
-		[MSM_DP_CONTROLLER_2] = { .io_start = 0x0ae9a000, .connector_type = DRM_MODE_CONNECTOR_eDP },
-	},
-	.num_descs = 3,
+	.descs = sc8180x_dp_descs,
+	.num_descs = ARRAY_SIZE(sc8180x_dp_descs),
+};
+
+static const struct msm_dp_desc sm8350_dp_descs[] = {
+	[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
 };
 
 static const struct msm_dp_config sm8350_dp_cfg = {
-	.descs = (const struct msm_dp_desc[]) {
-		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
-	},
-	.num_descs = 1,
+	.descs = sm8350_dp_descs,
+	.num_descs = ARRAY_SIZE(sm8350_dp_descs),
 };
 
 static const struct of_device_id dp_dt_match[] = {
-- 
2.35.1

