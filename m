Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3308BB617
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C7A1132A6;
	Fri,  3 May 2024 21:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="AXbpv7nl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D346112A4E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:38:11 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1ecc23e6c9dso733155ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772290; x=1715377090;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xmnOhTLenfwPbkZ+9fOpNpevbnj0AgHZgHCpxDLbWgM=;
 b=AXbpv7nlV7Ls92WikX+eURe9nPg/LFWyobndMTgUi+gPTMZZorGrPSBquiWIGTwNcw
 QwwVx9RLM/JQWJMzI3mswHiBc3t/1bsMZ8i3CU070zZLwe+KUsPxKOPag3K+MtKyZCuE
 EKiieVgVQ8xiH9b/VxGGQOvKSboQyp2sVDEbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772290; x=1715377090;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xmnOhTLenfwPbkZ+9fOpNpevbnj0AgHZgHCpxDLbWgM=;
 b=D35Hpxu25T5t/wKCAfG61X/Pj/iNjWKCnmENniI1WlzyeYwrjYMZowSaMF5Oie9DCA
 xAwAyRF2QBB8vI1LFHmmhQaA9FlWPQHfLNClg+Bjcj73ppPwHVUp+wpKUoNpa+eCP4MQ
 RuHHi6z0SZC8WWMt55+MTszvywISicc6bGQpFBdFotOFKfmK/niA15Zkh7e0dhyD99gO
 NkhOBMZExUpH1CHDvrqo1f+nCH1zSlhUKF0hKhuvK/9UrujPEU1qBJKKLX++v5PFOhYn
 ICcmkDN5NWzbcqvL7HxQ3Q7qE1GFT6DSS/jBL/gA23kKmDQ0HZzJ2pSg/x+QiRF+sUa6
 kFkg==
X-Gm-Message-State: AOJu0YyaghuKHoXmtkZQwPj7qlvmk8GgxCmohXSdR4YaVWR4uazs7c5p
 OkH7AwBBeaE8ONgKTgcgalGu5Mmis2ReTpc/wkwH3/Ao60KIaERLaPoOXek2eO8fSdUDPE85+G/
 X9Q==
X-Google-Smtp-Source: AGHT+IGBGVcpKQhnQ/va5QMpwiScWawVFF//2NM+v5dTbUM+lAsV+J43k0O4T3CyMAnt3mgiK6JpMQ==
X-Received: by 2002:a17:903:234b:b0:1e2:b13f:bd64 with SMTP id
 c11-20020a170903234b00b001e2b13fbd64mr5192227plh.0.1714772289909; 
 Fri, 03 May 2024 14:38:09 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:38:09 -0700 (PDT)
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
Subject: [RFT PATCH v2 45/48] drm/panel: raydium-rm67191: Don't call
 unprepare+disable at shutdown
Date: Fri,  3 May 2024 14:33:26 -0700
Message-ID: <20240503143327.RFT.v2.45.Id14188f1a8af7d524751c27c343a5b583ff5361f@changeid>
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

It's the responsibility of a correctly written DRM modeset driver to
call drm_atomic_helper_shutdown() at shutdown time and that should be
disabling / unpreparing the panel if needed. Panel drivers shouldn't
be calling these functions themselves.

A recent effort was made to fix as many DRM modeset drivers as
possible [1] [2] [3] and most drivers are fixed now.

A grep through mainline for compatible strings used by this driver
indicates that it is used by IMX boards. The IMX driver appears to be
correctly calling drm_atomic_helper_shutdown() so we can remove the
calls.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Cc: Robert Chiras <robert.chiras@nxp.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-raydium-rm67191.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67191.c b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
index fa9bf89d3bb5..b2029e035635 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm67191.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
@@ -612,14 +612,6 @@ static void rad_panel_remove(struct mipi_dsi_device *dsi)
 	drm_panel_remove(&rad->panel);
 }
 
-static void rad_panel_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct rad_panel *rad = mipi_dsi_get_drvdata(dsi);
-
-	drm_panel_disable(&rad->panel);
-	drm_panel_unprepare(&rad->panel);
-}
-
 static const struct of_device_id rad_of_match[] = {
 	{ .compatible = "raydium,rm67191", },
 	{ /* sentinel */ }
@@ -633,7 +625,6 @@ static struct mipi_dsi_driver rad_panel_driver = {
 	},
 	.probe = rad_panel_probe,
 	.remove = rad_panel_remove,
-	.shutdown = rad_panel_shutdown,
 };
 module_mipi_dsi_driver(rad_panel_driver);
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

