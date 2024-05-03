Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1A88BB604
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B466D112A0A;
	Fri,  3 May 2024 21:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ev1E4bbM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8452112A0A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:34 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1ecff927a45so1153715ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772253; x=1715377053;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j0ij9ytrBMTlh/tBwBQfGeyqwsUC3qnXNREpsQEX2pQ=;
 b=ev1E4bbMrijdHKf3nB6OnpMx1jpkAMW1OuBdskjIEvdGD7Pi3F49GyewM0WIk0VL67
 TMPkUHJig8GXM8e3LeJ/KdsXBjAktDZbq8gIjbfWUfJ8sEyWqbECh9Td8l57ruSTjaYa
 K4aQVU9o2uS/DXaZZ+F5mBMtEah0UcJD/IAMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772253; x=1715377053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j0ij9ytrBMTlh/tBwBQfGeyqwsUC3qnXNREpsQEX2pQ=;
 b=DcWOw/88X6wklK8JQoD2ua3ip0ZdeNl1wQlZYch/c7V5HpRPRhfCFjVJSu0pXvdoGm
 p3KxZmK3dFrO+9bumRE1JcBAiuD1NmMSthTXZCJjAGbfCuf78ffoZDfRni1fu4/TGzuI
 10eeHeihkk7DZeV6FPUfr1afohM89WoejSqZDSrx+03psGNiSeo3pIk7P0k7jEmvCq8n
 dzloTsdH9glPHr7NSgAsGyC+fx1+6N0iHNf3qigJRfkXFR+8GWUot68vrVRLb0tgK+eX
 bLDn41K1rHXS5pjYJHLmHw9tUFyW/i9xXEjr6Hx+xrEfJNcaQmexlhw2atLbY80q7y7b
 8wBg==
X-Gm-Message-State: AOJu0YyfiJd4KTgYj07375efJ1iyDwKq02Dcm+fAjTUIOU3wfkUbaEFg
 8f2sKFwPUqsLNYpzWkO4RNTcfziGj9KsdDR+GAI1pcqI5GafeLVY87epP9IJBjeNTiMgX6jzd9J
 iIA==
X-Google-Smtp-Source: AGHT+IGZhFFrirxel2mH4hhJVW+YPU9/55QLc4j01+5DJlTA0WMSbmDxlLpFOw990mv8yfllPRRAHg==
X-Received: by 2002:a17:902:ef8b:b0:1e2:c554:a93c with SMTP id
 iz11-20020a170902ef8b00b001e2c554a93cmr2868203plb.29.1714772253398; 
 Fri, 03 May 2024 14:37:33 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:32 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 29/48] drm/panel: tdo-tl070wsh30: Don't call
 unprepare+disable at shutdown/remove
Date: Fri,  3 May 2024 14:33:10 -0700
Message-ID: <20240503143327.RFT.v2.29.I46ff4e28c260bcd8e81205debd0994e76fd8aeac@changeid>
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

Unfortunately, grepping mainline for this panel's compatible string
shows no hits, so we can't be 100% sure if the DRM modeset driver used
with this panel has been fixed. If it is found that the DRM modeset
driver hasn't been fixed then this patch could be temporarily reverted
until it is.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c b/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
index 36f27c664b69..227f97f9b136 100644
--- a/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
+++ b/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
@@ -208,16 +208,6 @@ static void tdo_tl070wsh30_panel_remove(struct mipi_dsi_device *dsi)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
 
 	drm_panel_remove(&tdo_tl070wsh30->base);
-	drm_panel_disable(&tdo_tl070wsh30->base);
-	drm_panel_unprepare(&tdo_tl070wsh30->base);
-}
-
-static void tdo_tl070wsh30_panel_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct tdo_tl070wsh30_panel *tdo_tl070wsh30 = mipi_dsi_get_drvdata(dsi);
-
-	drm_panel_disable(&tdo_tl070wsh30->base);
-	drm_panel_unprepare(&tdo_tl070wsh30->base);
 }
 
 static struct mipi_dsi_driver tdo_tl070wsh30_panel_driver = {
@@ -227,7 +217,6 @@ static struct mipi_dsi_driver tdo_tl070wsh30_panel_driver = {
 	},
 	.probe = tdo_tl070wsh30_panel_probe,
 	.remove = tdo_tl070wsh30_panel_remove,
-	.shutdown = tdo_tl070wsh30_panel_shutdown,
 };
 module_mipi_dsi_driver(tdo_tl070wsh30_panel_driver);
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

