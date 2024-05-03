Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3869E8BB60B
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C882113296;
	Fri,  3 May 2024 21:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="PhUWoEw4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1054113296
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:47 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1ec69e3dbe5so1228315ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772267; x=1715377067;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JIn+sWO9dEDf1DvG5c+RzmcIdDo8LI3xPQg/VI7zljA=;
 b=PhUWoEw4ArnQEIEyZ/yWwkrGB0w/8cL2SLgDWpfapVb4Gm21KM9hgfJ+pwkgeIdga9
 UJjJkiUrVMfKD8RurUM4nf65Kp3UZzB/6Wnchl4toJcSfWfLlngAhqpAUX/Jx32moW7f
 N8fU8x1W5yMI2RZLChQshs2lF3HXcc97o64Tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772267; x=1715377067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JIn+sWO9dEDf1DvG5c+RzmcIdDo8LI3xPQg/VI7zljA=;
 b=P9+CNUluyaMrw7dvzET4iUu7QCmwakTqq9jertbKGsZCH65OEsgYaY134ZM+aUdMUG
 KNJFbaR9tTOlGgwGXVYVFTdVe7MmeQQZZIs8Ub8CEcPltxLKcAnRXKayZU6CBh+iHzDw
 gHFWTHWoBKnt2qqv0TXQKHTmURFLki5xhO737uAFKcNt7wM0btMY4swLQKrFzKs5p4aF
 ESPWUwKrhDnJSYmcV2n2G29U3v8DjNV+WF6ADdAMOGEdNT0D6L1fYh3xvx07F7JaBymI
 dlEM4IzrxQzuXf+H6t0uuT54S9iKPbPh1nFMPWa5VQbFs05VO93We76qz7rccirBxhHW
 /s1g==
X-Gm-Message-State: AOJu0YzMhfZizY9bGG1EWH9R8UhdJVQu3eUmgmNmbxCGIhsbv94++4yk
 trZKPYO0VgLLt3DOnwA1+yhZugNp5GE2riVvc1iJ1/TACloYWBHP9v6xQ7QlTQ4WYgl+8CWmZX5
 QxQ==
X-Google-Smtp-Source: AGHT+IFgOtsvmnCpgD9YCuirDNOd6sEAldzPJUUEeKJ2LJEqLasuF33MZxCdPNTGTti/0Ofhqu2Ztw==
X-Received: by 2002:a17:902:f54c:b0:1eb:5b59:fab9 with SMTP id
 h12-20020a170902f54c00b001eb5b59fab9mr5096772plf.53.1714772266832; 
 Fri, 03 May 2024 14:37:46 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:46 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 35/48] drm/panel: panasonic-vvx10f034n00: Don't call
 disable at shutdown/remove
Date: Fri,  3 May 2024 14:33:16 -0700
Message-ID: <20240503143327.RFT.v2.35.I1562c864ee35a9c166765488c95104b7e4e562da@changeid>
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

Cc: Werner Johansson <werner.johansson@sonymobile.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
index 822ca2f971eb..d1c5c9bc3c56 100644
--- a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
+++ b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
@@ -222,10 +222,6 @@ static void wuxga_nt_panel_remove(struct mipi_dsi_device *dsi)
 	struct wuxga_nt_panel *wuxga_nt = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	ret = drm_panel_disable(&wuxga_nt->base);
-	if (ret < 0)
-		dev_err(&dsi->dev, "failed to disable panel: %d\n", ret);
-
 	ret = mipi_dsi_detach(dsi);
 	if (ret < 0)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
@@ -233,13 +229,6 @@ static void wuxga_nt_panel_remove(struct mipi_dsi_device *dsi)
 	wuxga_nt_panel_del(wuxga_nt);
 }
 
-static void wuxga_nt_panel_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct wuxga_nt_panel *wuxga_nt = mipi_dsi_get_drvdata(dsi);
-
-	drm_panel_disable(&wuxga_nt->base);
-}
-
 static struct mipi_dsi_driver wuxga_nt_panel_driver = {
 	.driver = {
 		.name = "panel-panasonic-vvx10f034n00",
@@ -247,7 +236,6 @@ static struct mipi_dsi_driver wuxga_nt_panel_driver = {
 	},
 	.probe = wuxga_nt_panel_probe,
 	.remove = wuxga_nt_panel_remove,
-	.shutdown = wuxga_nt_panel_shutdown,
 };
 module_mipi_dsi_driver(wuxga_nt_panel_driver);
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

