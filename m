Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0388BB608
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35CC112A0E;
	Fri,  3 May 2024 21:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="m/EtyHku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9346F112A0E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:41 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1ecc23e6c9dso730565ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772260; x=1715377060;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O/Sm++Egsx8q7rlUkwUyB5q6Cu7fnuL8sFgKBvzduqs=;
 b=m/EtyHku5+kq6rVlmQfD4vlgQItHTwXNzQ/x9RtPJsMHxvSO1PgLKDsHjw55otHlLM
 KIGT2eEDDIk6Xqh3XAmw0RmKJUyjHbeaMcyEgcLvPFEjy4M3cmW9xOnUxOOS9mF1g5+D
 lCVn+eJoR+w3YDYvNcCNO6vA1E4EaKIpww8R8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772260; x=1715377060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O/Sm++Egsx8q7rlUkwUyB5q6Cu7fnuL8sFgKBvzduqs=;
 b=l4Tl2cetMve0iaSTRlnoZUprj6QqaU9Y8L2JYAuDmb4OZElgbJEqc+01QILruif0FE
 5M9tVPtnqypto9M+8VJvMwCmC+WtHRVBzFprpypZA85spxyNeWLsjIt5/654HEpnwfwJ
 AQ2cMTcSEMMibi0vvgRRim+noFmWfQZlFXUsYa6qN8xwgcjp9XwNNLiN51MMPVaNMXFw
 azBdxH0TPV05uRWszyyyMkkoAmi0K5z0sLadIGr0EXdyEP26mHxI8QoB+LtK6kHbngik
 aVLNtvJkkOTXL4900LopEansSDYUHySs8EjZsFI5LkeDb17UtoiV/DQhGGvakqf97bh/
 +BAg==
X-Gm-Message-State: AOJu0YzHspZzHkAgX5zqg2hcAIf9b4aa/nR0r/6QFeDFpj1g2HMxFft9
 SpHjQjmKXw3+UmjwfPfn/mUixCbi3w4ITAGhiC+Xe6vzZ2bi2l/PPmvfNS5SrnEWrPdFWzJXGFG
 Qpg==
X-Google-Smtp-Source: AGHT+IGCLyeRka7bEbj1rtJf7J0U2tyRPC1SfBgt3k9U7tPl56QaTyO/M7OMcuQw3XwRdMK87YcijA==
X-Received: by 2002:a17:902:cec2:b0:1e4:47bf:6926 with SMTP id
 d2-20020a170902cec200b001e447bf6926mr5145949plg.4.1714772260615; 
 Fri, 03 May 2024 14:37:40 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:39 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Vinay Simha BN <simhavcs@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 32/48] drm/panel: jdi-lt070me05000: Stop tracking
 prepared/enabled
Date: Fri,  3 May 2024 14:33:13 -0700
Message-ID: <20240503143327.RFT.v2.32.I2e991044def6644c18ad8d7d686f4f3006f278de@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
References: <20240503213441.177109-1-dianders@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As talked about in commit d2aacaf07395 ("drm/panel: Check for already
prepared/enabled in drm_panel"), we want to remove needless code from
panel drivers that was storing and double-checking the
prepared/enabled state. Even if someone was relying on the
double-check before, that double-check is now in the core and not
needed in individual drivers.

NOTE: as part of this, transition the panel's direct calls to its
disable function in shutdown/remove to call through DRM panel.

Cc: Vinay Simha BN <simhavcs@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Note: since we are able to identify that this panel only appears to be
used on Qualcomm boards and we have to touch the shutdown/remove path
in this patch anyway, we could possibly squash this with the next
patch that removes the disable call in shutdown/remove. For now I'm
keeping them separate just to keep the concepts separate.

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 .../gpu/drm/panel/panel-jdi-lt070me05000.c    | 27 ++-----------------
 1 file changed, 2 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
index f9a69f347068..4ddddee6fa1e 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
@@ -37,9 +37,6 @@ struct jdi_panel {
 	struct gpio_desc *dcdc_en_gpio;
 	struct backlight_device *backlight;
 
-	bool prepared;
-	bool enabled;
-
 	const struct drm_display_mode *mode;
 };
 
@@ -176,13 +173,8 @@ static int jdi_panel_disable(struct drm_panel *panel)
 {
 	struct jdi_panel *jdi = to_jdi_panel(panel);
 
-	if (!jdi->enabled)
-		return 0;
-
 	backlight_disable(jdi->backlight);
 
-	jdi->enabled = false;
-
 	return 0;
 }
 
@@ -192,9 +184,6 @@ static int jdi_panel_unprepare(struct drm_panel *panel)
 	struct device *dev = &jdi->dsi->dev;
 	int ret;
 
-	if (!jdi->prepared)
-		return 0;
-
 	jdi_panel_off(jdi);
 
 	ret = regulator_bulk_disable(ARRAY_SIZE(jdi->supplies), jdi->supplies);
@@ -207,8 +196,6 @@ static int jdi_panel_unprepare(struct drm_panel *panel)
 
 	gpiod_set_value(jdi->dcdc_en_gpio, 0);
 
-	jdi->prepared = false;
-
 	return 0;
 }
 
@@ -218,9 +205,6 @@ static int jdi_panel_prepare(struct drm_panel *panel)
 	struct device *dev = &jdi->dsi->dev;
 	int ret;
 
-	if (jdi->prepared)
-		return 0;
-
 	ret = regulator_bulk_enable(ARRAY_SIZE(jdi->supplies), jdi->supplies);
 	if (ret < 0) {
 		dev_err(dev, "regulator enable failed, %d\n", ret);
@@ -250,8 +234,6 @@ static int jdi_panel_prepare(struct drm_panel *panel)
 		goto poweroff;
 	}
 
-	jdi->prepared = true;
-
 	return 0;
 
 poweroff:
@@ -272,13 +254,8 @@ static int jdi_panel_enable(struct drm_panel *panel)
 {
 	struct jdi_panel *jdi = to_jdi_panel(panel);
 
-	if (jdi->enabled)
-		return 0;
-
 	backlight_enable(jdi->backlight);
 
-	jdi->enabled = true;
-
 	return 0;
 }
 
@@ -475,7 +452,7 @@ static void jdi_panel_remove(struct mipi_dsi_device *dsi)
 	struct jdi_panel *jdi = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	ret = jdi_panel_disable(&jdi->base);
+	ret = drm_panel_disable(&jdi->base);
 	if (ret < 0)
 		dev_err(&dsi->dev, "failed to disable panel: %d\n", ret);
 
@@ -491,7 +468,7 @@ static void jdi_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct jdi_panel *jdi = mipi_dsi_get_drvdata(dsi);
 
-	jdi_panel_disable(&jdi->base);
+	drm_panel_disable(&jdi->base);
 }
 
 static struct mipi_dsi_driver jdi_panel_driver = {
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

