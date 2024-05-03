Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB168BB616
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE7B1132AA;
	Fri,  3 May 2024 21:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="aLNY1vX+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CD71132AA
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:38:08 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1ec4b2400b6so940625ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772288; x=1715377088;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BIFkEzqD+TIhqStDpaYlErlu7+fCFfSMn8LHhnvMED8=;
 b=aLNY1vX+3Ct1FpYW9zdIT6ElTM6ycRtoXRtX46hiXwi2/2e3sMhv2MTFaazCKgCKoz
 gdKC2eoRNFbIikN2tIESNwmEWvQyYuP4L05mWD16IvSz1uNxErRrsDoqzqecu2x27Lgj
 hWOiUy6AXq4AmfRzTU/6BX+T7w9JlOG4h5zKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772288; x=1715377088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BIFkEzqD+TIhqStDpaYlErlu7+fCFfSMn8LHhnvMED8=;
 b=RYzHB7i6i/qVqPIqDms4nNo8/EpSmID7nzJCINrCDyImwEK653WkyeAz6Z2nlqxJ1v
 4TDZpYXeULVCdgdPX5kiTcYMbqPUw04ijlHHcHIxeAm/IdgvCHLZ2xolu/8+7/uYiFA0
 sHlpgD8N1H0CRjOUthI1/0AzV88IHNZFVfTW9Sx2QXdTIYB4ygWL1hzRYKu/dRQUmvMi
 2HwTTuTZ0eLH8Xs9i/8r71174lLMIDr9c2uQw6LCx6iqzTV1QCcSgD2K6+hbhxgqeWia
 iC20yRljqNz+CNmSLlzx/16kYtOzkmxLCbLZu67u5QGxWVTjnleVgZGZ6oxbfMH6rmi9
 bonA==
X-Gm-Message-State: AOJu0Yzr81yagVaWlu3Fzc7k/Ds7SC/WHUNFgrI+KYiOblO3qhPoXOSF
 xrq+mobZ+JFGPzTm5gcX1fAWUsQiCuFuKLgW47892i5tKCKQ9TZJmi2hneGaeSApiS1s2t8IKC2
 cEg==
X-Google-Smtp-Source: AGHT+IEppDICkxPotojV6v+5Nxi2QTdXAAGWwbdKCVuRTx7nnbpoKjn0h1KLaB5gimMRVhmWkqxAGw==
X-Received: by 2002:a17:902:e943:b0:1eb:7aeb:54f3 with SMTP id
 b3-20020a170902e94300b001eb7aeb54f3mr5417928pll.36.1714772287701; 
 Fri, 03 May 2024 14:38:07 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:38:07 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Robert Chiras <robert.chiras@nxp.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 44/48] drm/panel: raydium-rm67191: Stop tracking enabled
Date: Fri,  3 May 2024 14:33:25 -0700
Message-ID: <20240503143327.RFT.v2.44.I20f82e9dd1597a14ae37a64c6b8275add60fbdb1@changeid>
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

The conversion of the rm67191 panel driver follows many of the other
panel drivers but has a few differences that need to be called out.

Like in commit 1e0465eb16a4 ("drm/panel: otm8009a: Don't double check
prepared/enabled"), this panel also uses the "prepared" flag to
prevent the backlight functions from running when the panel is powered
off. This is probably not the safest thing to do but the old behavior
was preserved. See the discussion in the otm8009a patch. Because of
this, I've left the driver tracking "prepared" but removed its
tracking of "enabled".

NOTE: as part of this, transition the panel's direct calls to its
disable/unprepare functions in shutdown to call through DRM panel.

Cc: Robert Chiras <robert.chiras@nxp.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-raydium-rm67191.c | 21 ++-----------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67191.c b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
index dbb1ed4efbed..fa9bf89d3bb5 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm67191.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
@@ -205,7 +205,6 @@ struct rad_panel {
 	unsigned int num_supplies;
 
 	bool prepared;
-	bool enabled;
 };
 
 static const struct drm_display_mode default_mode = {
@@ -267,9 +266,6 @@ static int rad_panel_prepare(struct drm_panel *panel)
 	struct rad_panel *rad = to_rad_panel(panel);
 	int ret;
 
-	if (rad->prepared)
-		return 0;
-
 	ret = regulator_bulk_enable(rad->num_supplies, rad->supplies);
 	if (ret)
 		return ret;
@@ -291,9 +287,6 @@ static int rad_panel_unprepare(struct drm_panel *panel)
 	struct rad_panel *rad = to_rad_panel(panel);
 	int ret;
 
-	if (!rad->prepared)
-		return 0;
-
 	/*
 	 * Right after asserting the reset, we need to release it, so that the
 	 * touch driver can have an active connection with the touch controller
@@ -322,9 +315,6 @@ static int rad_panel_enable(struct drm_panel *panel)
 	int color_format = color_format_from_dsi_format(dsi->format);
 	int ret;
 
-	if (rad->enabled)
-		return 0;
-
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
 	ret = rad_panel_push_cmd_list(dsi);
@@ -389,8 +379,6 @@ static int rad_panel_enable(struct drm_panel *panel)
 
 	backlight_enable(rad->backlight);
 
-	rad->enabled = true;
-
 	return 0;
 
 fail:
@@ -406,9 +394,6 @@ static int rad_panel_disable(struct drm_panel *panel)
 	struct device *dev = &dsi->dev;
 	int ret;
 
-	if (!rad->enabled)
-		return 0;
-
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
 	backlight_disable(rad->backlight);
@@ -429,8 +414,6 @@ static int rad_panel_disable(struct drm_panel *panel)
 		return ret;
 	}
 
-	rad->enabled = false;
-
 	return 0;
 }
 
@@ -633,8 +616,8 @@ static void rad_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct rad_panel *rad = mipi_dsi_get_drvdata(dsi);
 
-	rad_panel_disable(&rad->panel);
-	rad_panel_unprepare(&rad->panel);
+	drm_panel_disable(&rad->panel);
+	drm_panel_unprepare(&rad->panel);
 }
 
 static const struct of_device_id rad_of_match[] = {
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

