Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCEB8BB5EF
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888AA112EA2;
	Fri,  3 May 2024 21:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="e6B1xBL4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FA4112EA2
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:36:56 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1ec69e3dbe5so1223375ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772216; x=1715377016;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vb3TgP/wCNf81D+aV3nRlzqlLyhQoFFUaND2nsUQhqU=;
 b=e6B1xBL4eHGDJq3sXiII13XDvRBBpqdt2qrL5LtZm5SJnr9HkR0jrDrEirtmuUkLlf
 8Vdlo1JFRhyjRPfGzQlzn8pLljI9kSaC6xOo0j9ZXKAFH8r0M3dvxwKC+ZAPRjrzoHho
 HZVs0miXx67xJfFry+qB8x1uYyiocKmYEBM30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772216; x=1715377016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vb3TgP/wCNf81D+aV3nRlzqlLyhQoFFUaND2nsUQhqU=;
 b=QkkupHIKrar2EDRZmJHSKJKIdpinD0i+GejLwD6pE7p+Sj8DeDk8Wzv3oTifPyFKr2
 zzyLlcARqykB5YhGiVjOmBnXiMPyFJn19e4oYHo6lClxOfle3Qm0TRVkYzMiF74wJSdg
 F1SrnlWfV6GE696zhKz9b73iZMl3mGQ3Zkf+cOaKAZqbCFFgpbwduqHNr0CgJX7aL+SC
 0OOwZch/v2Lz0oPt/Gx77IOHevpq5a5R5lYc9rVr3QM2jHxXBxKXwQWOUuhP5bP0wonl
 GX2NFAYc5RX6beGUkEDNw/KvovMQMZdj3udjMyzRJ3oDY3w+XlZjTydan7bToGJGHEl8
 lNBw==
X-Gm-Message-State: AOJu0YyFpjDfk4ni/c3UAoGN9UtbdNtJ+fjg+wjX39ogk+Cv7pogXoah
 7qomf8HWrhu28hizGxpQ7M04qegCEC+3sMxNtl2PwEUfKceSwbFmc90ekvaNy7WiUyW3o6PsztT
 l0Q==
X-Google-Smtp-Source: AGHT+IFNtgQI4tL4b59ZXyBnIDIYmn8Ia9hPYK7earn8DOm88NvX2c1QDLLSGNTvuzAvGjP8xynfPQ==
X-Received: by 2002:a17:903:2306:b0:1eb:1af8:309f with SMTP id
 d6-20020a170903230600b001eb1af8309fmr5572876plh.4.1714772215701; 
 Fri, 03 May 2024 14:36:55 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:36:54 -0700 (PDT)
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
Subject: [RFT PATCH v2 13/48] drm/panel: kingdisplay-kd097d04: Don't call
 unprepare+disable at shutdown/remove
Date: Fri,  3 May 2024 14:32:54 -0700
Message-ID: <20240503143327.RFT.v2.13.I6c7c84b1560dd374f6e7e8dc50f419a870d31d31@changeid>
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

It's the responsibility of a correctly written DRM modeset driver to
call drm_atomic_helper_shutdown() at shutdown time and that should be
disabling / unpreparing the panel if needed. Panel drivers shouldn't
be calling these functions themselves.

A recent effort was made to fix as many DRM modeset drivers as
possible [1] [2] [3] and most drivers are fixed now.

A grep through mainline for compatible strings used by this driver
indicates that it is used by Rockchip boards. The Rockchip driver
appear to be correctly calling drm_atomic_helper_shutdown() so we can
remove the calls.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Cc: Brian Norris <briannorris@chromium.org>
Cc: Chris Zhong <zyw@rock-chips.com>
Cc: Nickey Yang <nickey.yang@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 .../gpu/drm/panel/panel-kingdisplay-kd097d04.c  | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
index 88d775e000d4..d6b912277196 100644
--- a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
+++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
@@ -389,14 +389,6 @@ static void kingdisplay_panel_remove(struct mipi_dsi_device *dsi)
 	struct kingdisplay_panel *kingdisplay = mipi_dsi_get_drvdata(dsi);
 	int err;
 
-	err = drm_panel_unprepare(&kingdisplay->base);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to unprepare panel: %d\n", err);
-
-	err = drm_panel_disable(&kingdisplay->base);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
-
 	err = mipi_dsi_detach(dsi);
 	if (err < 0)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
@@ -404,14 +396,6 @@ static void kingdisplay_panel_remove(struct mipi_dsi_device *dsi)
 	kingdisplay_panel_del(kingdisplay);
 }
 
-static void kingdisplay_panel_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct kingdisplay_panel *kingdisplay = mipi_dsi_get_drvdata(dsi);
-
-	drm_panel_unprepare(&kingdisplay->base);
-	drm_panel_disable(&kingdisplay->base);
-}
-
 static struct mipi_dsi_driver kingdisplay_panel_driver = {
 	.driver = {
 		.name = "panel-kingdisplay-kd097d04",
@@ -419,7 +403,6 @@ static struct mipi_dsi_driver kingdisplay_panel_driver = {
 	},
 	.probe = kingdisplay_panel_probe,
 	.remove = kingdisplay_panel_remove,
-	.shutdown = kingdisplay_panel_shutdown,
 };
 module_mipi_dsi_driver(kingdisplay_panel_driver);
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

