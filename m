Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 204F97CB06C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 18:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D6D10E23A;
	Mon, 16 Oct 2023 16:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C7A10E237
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 16:54:10 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40566f8a093so47089985e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697475249; x=1698080049; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AhGTCeJTgvu597dzkwlQwgzYcEyeuUmDXvIZAq5l/4I=;
 b=eLjvQPMSZkwKOCJqZOdU6Td2KvwvFRv5mL3BWz0c1OND6gcbcepwz3RQu9XHfyXawv
 aFErhTg+9LD+XAJ2k7qcU1z7hKOwKo9xbzuKgdfGxZUUekGUHkwwK11/MVAwI4NVBX5M
 elv9PrTVk/Tq7atPuk3sNKFiarUoHtG1oqhjP12DlQa/gIupcPSAsp+oLGwBkC7MFlHO
 HO1YlYxVpjaAEDS0+0uUo8h+lghXLYrJyIOOMgmUZpkd5wGHMWayp1dHVpwBZdyFFV/8
 y2KSq/HReRv3QDBIc2okoXdfU3h0Onf5XxgTL17lDsn3v5s0AzdpYyLJ6ejL+/DR0H0Z
 EhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697475249; x=1698080049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AhGTCeJTgvu597dzkwlQwgzYcEyeuUmDXvIZAq5l/4I=;
 b=dtT6tCnZyEc+F1vWCKlQBuaT3n7lZz2mTadgU3l9JErGT3qQsCDcyV47ax0jsYcCCK
 yRWEOHEwlM/wCTQ5L3OhqyjDPHtGrON/qTLX+OC7tVnEL/PsNR0RMVnqFx80TX5t1kgm
 BbrClELC+7c7M+/WQgNsdHct0j8M5YW3OtHDusYdtRrTOEH1+yLJkaYcbARJSEWQz9+a
 0gskxGJwnEjVLEY5xV/90Yil7suL5o9jmkOSYGjZPQ1wcF/ob6DPySBc5/Rncc4vOg/Q
 EdqTYSUGWebJ7qDr57JMXF3RkQgPbLmv27L25oomaHezVN/CGpVty+4D4ocxDu6AOiVs
 rG6w==
X-Gm-Message-State: AOJu0YwJ6EAIRxS5j4A3agABsk1hz7bwt7MFi0e7vyyxkbSMAA/UhJ8u
 n1Fa4sPPvtxIwQg0Mdi6QRIYKQ==
X-Google-Smtp-Source: AGHT+IFMc1ydiV35u/i4xaIUD7bB3YsAkS433GNNfx1qmd94WFx7VWq0imHb4rjYzorutlJy9cRnjA==
X-Received: by 2002:a05:600c:4f49:b0:407:8b61:da70 with SMTP id
 m9-20020a05600c4f4900b004078b61da70mr784351wmq.9.1697475248812; 
 Mon, 16 Oct 2023 09:54:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([45.84.211.189])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a05600c45d300b0040648217f4fsm7638996wmo.39.2023.10.16.09.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 09:54:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [RFC PATCH 06/10] drm/bridge: tc358762: add support for manual DSI
 power control
Date: Mon, 16 Oct 2023 19:53:51 +0300
Message-ID: <20231016165355.1327217-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
References: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
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
Cc: Marek Vasut <marex@denx.de>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Start migrating tc358762 bridge to new manual DSI power control API. If
the tight power control is not available, default to the existing
pre_enable_prev_first flag.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/tc358762.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 7b9f05f95fd1..efb1da4487c9 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -72,6 +72,7 @@ struct tc358762 {
 	struct device *dev;
 	struct drm_bridge bridge;
 	struct regulator *regulator;
+	struct mipi_dsi_host *dsi_host;
 	struct drm_bridge *panel_bridge;
 	struct gpio_desc *reset_gpio;
 	struct drm_display_mode mode;
@@ -163,6 +164,8 @@ static void tc358762_post_disable(struct drm_bridge *bridge, struct drm_bridge_s
 
 	ctx->pre_enabled = false;
 
+	mipi_dsi_host_power_down(ctx->dsi_host);
+
 	if (ctx->reset_gpio)
 		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
 
@@ -185,6 +188,10 @@ static void tc358762_pre_enable(struct drm_bridge *bridge, struct drm_bridge_sta
 		usleep_range(5000, 10000);
 	}
 
+	ret = mipi_dsi_host_power_up(ctx->dsi_host);
+	if (ret < 0)
+		dev_err(ctx->dev, "error powering up the DSI host (%d)\n", ret);
+
 	ret = tc358762_init(ctx);
 	if (ret < 0)
 		dev_err(ctx->dev, "error initializing bridge (%d)\n", ret);
@@ -277,10 +284,16 @@ static int tc358762_probe(struct mipi_dsi_device *dsi)
 	if (ret < 0)
 		return ret;
 
+	ctx->dsi_host = dsi->host;
+
 	ctx->bridge.funcs = &tc358762_bridge_funcs;
 	ctx->bridge.type = DRM_MODE_CONNECTOR_DPI;
 	ctx->bridge.of_node = dev->of_node;
-	ctx->bridge.pre_enable_prev_first = true;
+
+	if (mipi_dsi_host_power_control_available(dsi->host))
+		dsi->mode_flags |= MIPI_DSI_MANUAL_POWERUP;
+	else
+		ctx->bridge.pre_enable_prev_first = true;
 
 	drm_bridge_add(&ctx->bridge);
 
-- 
2.42.0

