Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D420D8BB5F6
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072D211328E;
	Fri,  3 May 2024 21:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Vltl9Aaz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3657D112A08
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:06 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1e5715a9ebdso1040965ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772225; x=1715377025;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OurSfwTANRkudP5WoG3OHb0cRgGIUvtMPN3apL/0E6k=;
 b=Vltl9AazbsDnC3aCH1gAoXbVw5wLU3luwB7d+/n0WKK7WcdWKCFMqukK77bF5p0Thm
 XhNaYmGOk4f9ezXl8SuIqKCSFzc0iGQ3NPuB/KcueAmpjQ4gD4y2TCa93NV6cj3JNwV5
 NjdfWhR/wdvnZfw8Cdhz7Urc/bjj3pw+iLa28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772225; x=1715377025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OurSfwTANRkudP5WoG3OHb0cRgGIUvtMPN3apL/0E6k=;
 b=R2sLCPzFDyrM3/7QfwEYtD/Yw9M06246270WYUSYE6AtrEZNQW3cx2GwT/FqOChobU
 OMYc6HyiRg3HuxrOH07D8E6FEbe+TOO2J0dP2gfuOEKDZS1aPFUjzC1U0LpcIY30G+An
 pAmAv6SlpaDRSnJqoZXI/qLjASlC/ni1+WSmiBAO2wcK8iLUuQ6+QpXO28J4X4mVNTso
 5st88cYYUT0ishwiPtA5IcbZkcFDdURbZHeQqhMOEyf0yKcUx3xCzRp4EXWJ9dUqWSqZ
 +YmXYRvLQ0+bv+yIGzBQzJkKUOXksYQAjzL1nT9vVsdwmL6forJ7k3ZPbP1MZOK54xn2
 FhiQ==
X-Gm-Message-State: AOJu0YxEaeNEDKBelFKOirJ/N4AVD1XHmSq5e29sar0S2EaKti5W+aZS
 h16fa5/fEx8XETB6usc1QvplRs8lGVU8xSOHCNjpi5MSj0eC8xmozxD7/TSd/jUU4E02dGNe6VX
 YIA==
X-Google-Smtp-Source: AGHT+IH9vby0Or/VZX1bepw3qRTBDCpHhFvXpQCEjgbtETO8XlYEb0zz4N/sIP1EkhPbEGMjNfnqIA==
X-Received: by 2002:a17:902:e802:b0:1e6:40f1:9357 with SMTP id
 u2-20020a170902e80200b001e640f19357mr4411172plg.8.1714772225244; 
 Fri, 03 May 2024 14:37:05 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:04 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 17/48] drm/panel: ltk500hd1829: Don't call
 unprepare+disable at shutdown/remove
Date: Fri,  3 May 2024 14:32:58 -0700
Message-ID: <20240503143327.RFT.v2.17.If3edcf846f754b425959980039372a9fd1599ecc@changeid>
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

Unfortunately, grepping mainline for this panel's compatible string
shows no hits, so we can't be 100% sure if the DRM modeset driver used
with this panel has been fixed. If it is found that the DRM modeset
driver hasn't been fixed then this patch could be temporarily reverted
until it is.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Cc: "Heiko Stübner" <heiko@sntech.de>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 .../gpu/drm/panel/panel-leadtek-ltk500hd1829.c  | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
index ef27cab08f1d..6b18cf00fd4a 100644
--- a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
@@ -662,27 +662,11 @@ static int ltk500hd1829_probe(struct mipi_dsi_device *dsi)
 	return 0;
 }
 
-static void ltk500hd1829_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct ltk500hd1829 *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = drm_panel_unprepare(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to unprepare panel: %d\n", ret);
-
-	ret = drm_panel_disable(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to disable panel: %d\n", ret);
-}
-
 static void ltk500hd1829_remove(struct mipi_dsi_device *dsi)
 {
 	struct ltk500hd1829 *ctx = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	ltk500hd1829_shutdown(dsi);
-
 	ret = mipi_dsi_detach(dsi);
 	if (ret < 0)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
@@ -710,7 +694,6 @@ static struct mipi_dsi_driver ltk500hd1829_driver = {
 	},
 	.probe = ltk500hd1829_probe,
 	.remove = ltk500hd1829_remove,
-	.shutdown = ltk500hd1829_shutdown,
 };
 module_mipi_dsi_driver(ltk500hd1829_driver);
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

