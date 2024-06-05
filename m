Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8AA8FC087
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 02:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEEA10E657;
	Wed,  5 Jun 2024 00:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="YugFNowv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957EF10E644
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 00:25:02 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1f62fae8c3cso46592145ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 17:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717547101; x=1718151901;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9KycAHbM1YaBsC19utL2dTXUooV8ldiwTH4nNPolNGA=;
 b=YugFNowvAxUTF7LvyAEX2JJoSN9QUCa5hEVRugRCpfr6kAFOm143vMwoNlhh9soa8z
 uVo2aJml4qvO2G/vGjVVJ52jHxDxQQ7qmZnI8c2MfGPTrUFds0CVFQEYlqslT9g6TA+m
 83D6+bxk7Cj1cl259YCXDgH4JK03q3WsIFE2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717547101; x=1718151901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9KycAHbM1YaBsC19utL2dTXUooV8ldiwTH4nNPolNGA=;
 b=nJxDDYL6Xcv6tr9+HHnI+uaxGhOgCShiTDDA9DHzzJmbUpc6pPcI6PfRcEUafQA4r0
 VGPCVE6jqe2WL9KMx6g0dxoWfdulrc4ff4ru6W9B2/7OUhTumiUimDpGhWE1MqNh+DMA
 pK64195/vwQYNlfDoOGx78tjqkG2/qEbzkZfvxXRtRxAugFDAKCTP1CpA1xHWARmjezD
 XuR5DmSOB+fFR7j6uIljeySmQpEUMmFvGxf0EPNcUkfbfBwymwHa8YG+8Tx8RQEQJ5d6
 kIxi3WP4v6RyKCrehRdgVnd/Oh0ZUTM0bkXTY/00THY6snU9pNQGVLmSd/Zd+ASmONlV
 mYeg==
X-Gm-Message-State: AOJu0YyXU+evAlYJmqbOZD8irOvl9HNTUxuiiDYwYPGt+XkgLiTgHYSI
 F7pCRYoF+T5geFw37pkoKZ0mLZMP9LFpcr53OhKEYqGGslK9Y82pBN2RyZp9ijq7IykbSQ1GHAM
 =
X-Google-Smtp-Source: AGHT+IGS08PCmE1Z7uwVEhya3rKGJf5usM/7rzf00Dp5D3r9ukR+JKiJgZjVJN3F4E95srjcIWbunA==
X-Received: by 2002:a17:902:ccd2:b0:1f6:6a94:76be with SMTP id
 d9443c01a7336-1f6a5a6be45mr14458485ad.46.1717547100710; 
 Tue, 04 Jun 2024 17:25:00 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:3609:ff79:4625:8a71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 17:24:59 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Robert Chiras <robert.chiras@nxp.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 21/24] drm/panel: raydium-rm67191: Stop tracking enabled
Date: Tue,  4 Jun 2024 17:23:07 -0700
Message-ID: <20240604172305.v3.21.I20f82e9dd1597a14ae37a64c6b8275add60fbdb1@changeid>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240605002401.2848541-1-dianders@chromium.org>
References: <20240605002401.2848541-1-dianders@chromium.org>
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
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

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
2.45.1.288.g0e0cd299f1-goog

