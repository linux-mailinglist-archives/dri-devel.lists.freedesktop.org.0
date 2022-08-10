Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2C858E5BB
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 05:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90EDA19B3;
	Wed, 10 Aug 2022 03:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D5ED1AF4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 03:47:41 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id h125so16278794oif.8
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug 2022 20:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=YFwrR3MMUAqfzQikQP3XEeQMTFs7soeKt3WpRi+SfIg=;
 b=WmldLYpvZ+KC3FxiJhV1pJ0FaGe1oyA7Uo9MV1NFHmpATqjeF7yJpXHp1fqJhZMRO8
 0HrRmDEEtuQUCq4pICzWi/8B+i7V5UE5h/QPblmoo4OCV6+r/NoRgUCeimMbCHB1A4fo
 oaNxyiuAcim6ysscbmmZgoWgETkkvJ5TBpsRW7VfB/pdMM5DlTIuG/EmsxhWloX02Gr4
 KvMFGzjc4bFDieQ3Yv4CGec871EouRhoA+tek4MNiQxGVO8YUhhsiNJy74MFxDcxLJQV
 rOh4qzyW2IIRKMIBZ1WJ+vpA51hyox9UTWU6hTSO14Q5wY1QNOxqf3hmVdYi1yGXdS7U
 qlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=YFwrR3MMUAqfzQikQP3XEeQMTFs7soeKt3WpRi+SfIg=;
 b=cWzG+orPqnLjGxzXkOCYK5pJieM3vLfjd09WIes7YkAZkEvx0OO/xBZxOwuXqJ/QOb
 crU5bdPDOBgUilO9LrL+3nb7QZSUJFbzvo8PkzYBllOJrPfxqjRwbl9luUaK1sWEyQ9l
 Y6XUOcQfUX1V/iE30vFp34GfMCiyDUb1e+qg1fZp34rps5M2YLwvAWIMhAl942fPz6tS
 a9epsy3b648Hw786WiibVx75vwdnI+39clJ78bpq6lnVgh9pXvSV4C02XxlXQSS/67nE
 k7KC1Jyc4HhkYC96RSAiUimJH84T3jwl8S+h6l0vn4hS7mqpCQ/gPNOUOQg8k47z6fYc
 qDwg==
X-Gm-Message-State: ACgBeo1Khh8XWJO1w5JHZtO9mK6m/h1/5iIZxl8063ojBfgdRm/Pi0Va
 bDA/kmAWo5dMjT6ZIlxdqDEv1w==
X-Google-Smtp-Source: AA6agR65C9l72emAawI4jltXzXisVixzgqgpZwuhHwyvg8N9cV+oMnVY90M78bAL5MttFpFWh4zuFg==
X-Received: by 2002:a05:6808:148f:b0:33a:d2ea:ace9 with SMTP id
 e15-20020a056808148f00b0033ad2eaace9mr661457oiw.186.1660103259426; 
 Tue, 09 Aug 2022 20:47:39 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 n2-20020a4ae742000000b00444f26822e5sm454337oov.10.2022.08.09.20.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 20:47:38 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: [PATCH 3/7] drm/msm/dp: Add DP and EDP compatibles for SC8280XP
Date: Tue,  9 Aug 2022 20:50:09 -0700
Message-Id: <20220810035013.3582848-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
References: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SC8280XP platform has four DisplayPort controllers, per MDSS
instance, all with widebus support.

The first two are defined to be DisplayPort only, while the latter pair
(of each instance) can be either DisplayPort or Embedded DisplayPort.
The two sets are tied to the possible compatibels.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h       |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 2d9bbc335786..e4a83c2cd972 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -145,6 +145,26 @@ static const struct msm_dp_desc sc8180x_dp_descs[] = {
 	{}
 };
 
+static const struct msm_dp_desc sc8280xp_dp_descs[] = {
+	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
+	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
+	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
+	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
+	{ .io_start = 0x22090000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
+	{ .io_start = 0x22098000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
+	{ .io_start = 0x2209a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
+	{ .io_start = 0x220a0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
+	{}
+};
+
+static const struct msm_dp_desc sc8280xp_edp_descs[] = {
+	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
+	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
+	{ .io_start = 0x2209a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
+	{ .io_start = 0x220a0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
+	{}
+};
+
 static const struct msm_dp_desc sm8350_dp_descs[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
 	{}
@@ -156,6 +176,8 @@ static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_descs },
 	{ .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_descs },
 	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_descs },
+	{ .compatible = "qcom,sc8280xp-dp", .data = &sc8280xp_dp_descs },
+	{ .compatible = "qcom,sc8280xp-edp", .data = &sc8280xp_edp_descs },
 	{ .compatible = "qcom,sm8350-dp", .data = &sm8350_dp_descs },
 	{}
 };
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index b3689a2d27d7..5978c6e26a1e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -55,6 +55,7 @@ enum msm_dp_controller {
 	MSM_DP_CONTROLLER_0,
 	MSM_DP_CONTROLLER_1,
 	MSM_DP_CONTROLLER_2,
+	MSM_DP_CONTROLLER_3,
 	MSM_DP_CONTROLLER_COUNT,
 };
 
-- 
2.35.1

