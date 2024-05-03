Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A18B98BB5EE
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9250112E33;
	Fri,  3 May 2024 21:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="dLJ6Mnyf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FBD112E33
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:36:54 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1ed0abbf706so1068175ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772213; x=1715377013;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fIbC9LrwuAAq79Jeay6jAxq6GRcu3tw3vRcfcGuhdCM=;
 b=dLJ6Mnyfmys2BL8O0VBKqUW9UCK2zxzDsLEDllWi+bLYq8QqIGXSK8Q8CbTs866sZ4
 I8Bx5aXLP/YpSsVLP99CIEU3jWj2XPtLew3k3BxlVXVAVjjm6/j98WY3UFJ/tIlp7GvW
 QbjHhiPMOnIn1JXV2UJPghqXlFJYBX8pzdVFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772213; x=1715377013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fIbC9LrwuAAq79Jeay6jAxq6GRcu3tw3vRcfcGuhdCM=;
 b=EDgEeLzCM+XjxavqgNYNdatj40Ey0BoRmp29pQm/ESQDU+flWnhFmrc6KWcZ+ebCny
 ZFETUgl8RHycWou8qLKRAePspMk6h8sAzmjR7tWE341NPZD2fGPS/2CH4zSfGDmWFbYr
 YGkvjKHQTHg84+ICMC7+epvwA4p3TTsqJHJZ0DFaXsF1zvhgLOY5aobf2FD6j26xybt2
 OHLKtaRhjbVg3a3PWvyX10Nd/WxArAYuMXonHV9SsUMpAoXA+8sxe+TWE9cSE+bvR7nN
 qNZ6DJ0cE/g0VQcy3d7i3/E7G7NgUnwAeIgYWVErOTR3I9ZxP4/D0u6dFC0ifTn3XaSS
 M76Q==
X-Gm-Message-State: AOJu0YwEFnkuebMeSEQvXUvQKwJbBCUiZS9JbcE891PIpOSpaGI+SCaj
 KMpZykNje1gsAs0gQUNCb3zasanuoCEY+bIWLKPBLQBgGNh83rI1/PvYpoTD9oTvOASPJ/SP5hX
 LSA==
X-Google-Smtp-Source: AGHT+IEJVtpxW/vIwHLrsnoyEyV1IoA8JCw5mhGllbU5SBDs6pbVC07r9dJwje7IMXdKxtbI6jQipw==
X-Received: by 2002:a17:902:9f98:b0:1eb:6468:7fc3 with SMTP id
 g24-20020a1709029f9800b001eb64687fc3mr3513255plq.62.1714772213125; 
 Fri, 03 May 2024 14:36:53 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:36:52 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Brian Norris <briannorris@chromium.org>, Chris Zhong <zyw@rock-chips.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 12/48] drm/panel: kingdisplay-kd097d04: Stop tracking
 prepared/enabled
Date: Fri,  3 May 2024 14:32:53 -0700
Message-ID: <20240503143327.RFT.v2.12.I711d07c4f4738df199697fd534c452cdfa46a21f@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
References: <20240503213441.177109-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Cc: Brian Norris <briannorris@chromium.org>
Cc: Chris Zhong <zyw@rock-chips.com>
Cc: Nickey Yang <nickey.yang@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 .../drm/panel/panel-kingdisplay-kd097d04.c    | 31 -------------------
 1 file changed, 31 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
index 17f8d80cf2b3..88d775e000d4 100644
--- a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
+++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
@@ -23,9 +23,6 @@ struct kingdisplay_panel {
 
 	struct regulator *supply;
 	struct gpio_desc *enable_gpio;
-
-	bool prepared;
-	bool enabled;
 };
 
 struct kingdisplay_panel_cmd {
@@ -185,15 +182,10 @@ static int kingdisplay_panel_disable(struct drm_panel *panel)
 	struct kingdisplay_panel *kingdisplay = to_kingdisplay_panel(panel);
 	int err;
 
-	if (!kingdisplay->enabled)
-		return 0;
-
 	err = mipi_dsi_dcs_set_display_off(kingdisplay->link);
 	if (err < 0)
 		dev_err(panel->dev, "failed to set display off: %d\n", err);
 
-	kingdisplay->enabled = false;
-
 	return 0;
 }
 
@@ -202,9 +194,6 @@ static int kingdisplay_panel_unprepare(struct drm_panel *panel)
 	struct kingdisplay_panel *kingdisplay = to_kingdisplay_panel(panel);
 	int err;
 
-	if (!kingdisplay->prepared)
-		return 0;
-
 	err = mipi_dsi_dcs_enter_sleep_mode(kingdisplay->link);
 	if (err < 0) {
 		dev_err(panel->dev, "failed to enter sleep mode: %d\n", err);
@@ -220,8 +209,6 @@ static int kingdisplay_panel_unprepare(struct drm_panel *panel)
 	if (err < 0)
 		return err;
 
-	kingdisplay->prepared = false;
-
 	return 0;
 }
 
@@ -231,9 +218,6 @@ static int kingdisplay_panel_prepare(struct drm_panel *panel)
 	int err, regulator_err;
 	unsigned int i;
 
-	if (kingdisplay->prepared)
-		return 0;
-
 	gpiod_set_value_cansleep(kingdisplay->enable_gpio, 0);
 
 	err = regulator_enable(kingdisplay->supply);
@@ -275,8 +259,6 @@ static int kingdisplay_panel_prepare(struct drm_panel *panel)
 	/* T7: 10ms */
 	usleep_range(10000, 11000);
 
-	kingdisplay->prepared = true;
-
 	return 0;
 
 poweroff:
@@ -289,18 +271,6 @@ static int kingdisplay_panel_prepare(struct drm_panel *panel)
 	return err;
 }
 
-static int kingdisplay_panel_enable(struct drm_panel *panel)
-{
-	struct kingdisplay_panel *kingdisplay = to_kingdisplay_panel(panel);
-
-	if (kingdisplay->enabled)
-		return 0;
-
-	kingdisplay->enabled = true;
-
-	return 0;
-}
-
 static const struct drm_display_mode default_mode = {
 	.clock = 229000,
 	.hdisplay = 1536,
@@ -341,7 +311,6 @@ static const struct drm_panel_funcs kingdisplay_panel_funcs = {
 	.disable = kingdisplay_panel_disable,
 	.unprepare = kingdisplay_panel_unprepare,
 	.prepare = kingdisplay_panel_prepare,
-	.enable = kingdisplay_panel_enable,
 	.get_modes = kingdisplay_panel_get_modes,
 };
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

