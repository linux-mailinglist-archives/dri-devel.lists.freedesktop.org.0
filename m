Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E690F8BB614
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3758C1132A2;
	Fri,  3 May 2024 21:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Z9MNlIBP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4B51132A9
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:38:02 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1ec69e3dbe5so1229565ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772281; x=1715377081;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LOvFNgXxe6qEzRRoKPzkEzJ39gwB1A9FbXbUkRknuEw=;
 b=Z9MNlIBPOKtT7j5m9FaX9FMjecv/gZ67iwsNbQ/Kv3DffKMDNBuq2cBaGt8wM/Jnxy
 Xlg5O6Lw8rm8WNksV1/Tgq4JV34xOGQ22Jv1uORAY5/ZLJRKX+ZZrTiwMJhwQCc/2TMC
 Kl8nKEjPeEAIUhR6lvUSB1rj8duOPrpnQ5vIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772281; x=1715377081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LOvFNgXxe6qEzRRoKPzkEzJ39gwB1A9FbXbUkRknuEw=;
 b=BZkC66I8D0kWSyft71m0ZDPotECCMOAemic1ujQLV13mxrot9A1MG/WEl0Sxn/kqZv
 xAcX/SjqAoEatI5DqC+9VTDo02nEKGrR1gTTvfTelXGRfI0uGhGmj1FAjCDlOvUK7yB1
 Mqj/18iAWFNgP0INuDcN836Q3OABA6bfYlK1e6HIzTONxcWBYsqUno9n2qWQADrIvg8I
 DPDA3TZ4ogM80REHUbcg66XQ4Z1YbWnfEUTJZE6AfK0z4GzdcvhcOvAIuwIHx2LQpmpo
 Uyy6SVEAK0UVKRRleBRlXZmsSLBztDK/lGlB5ULKebOhyPYEnFvLqWV/hYVTzKo8CA1l
 qDhQ==
X-Gm-Message-State: AOJu0YxnIaBD90uH/CogjZGL+WLAK6S8RvE4rJ2SrMVaIge2L/cTHu96
 tW+3fhxLFJYlEZdVrckWSBtCwa5B2nBGu6oDugu4PFk9VRjvAe8GVSlALgGNOq1EgQIVwkC9oGK
 x0g==
X-Google-Smtp-Source: AGHT+IHrBPFGeCVyz9PhiRgLD7O2XHD+TE0AOUrKe6M9eH4/MHjdlKw55SmMJ/LL6GSiVhzwWHgbFw==
X-Received: by 2002:a17:902:f70b:b0:1ec:ad62:fe87 with SMTP id
 h11-20020a170902f70b00b001ecad62fe87mr4441606plo.56.1714772281144; 
 Fri, 03 May 2024 14:38:01 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:38:00 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>,
 Frank Oltmanns <frank@oltmanns.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Purism Kernel Team <kernel@puri.sm>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 42/48] drm/panel: sitronix-st7703: Stop tracking
 prepared
Date: Fri,  3 May 2024 14:33:23 -0700
Message-ID: <20240503143327.RFT.v2.42.Ifc436b262d72f1a33ddef10adfd7578d4acb60d8@changeid>
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

One thing to note for st7703 is that it has a special "allpixelson"
debugfs file. When this file is written the driver hacks a
disable/unprepare and then a prepare/enable to try to reset the
panel. Potentially that might have been relying on the old booleans we
removed. It'll still "work" because of the checks in the core but it
deserves a comment. This debugfs file didn't appear to be particularly
safe to use even before this patch since it would cause a
disabled/unprepared panel to become prepared/enabled.

Cc: "Guido Günther" <agx@sigxcpu.org>
Cc: "Ondřej Jirman" <megi@xff.cz>
Cc: Chris Morgan <macromorgan@hotmail.com>
Cc: Frank Oltmanns <frank@oltmanns.dev>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index 7d8302cca091..6b2d940640ca 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -58,7 +58,6 @@ struct st7703 {
 	struct gpio_desc *reset_gpio;
 	struct regulator *vcc;
 	struct regulator *iovcc;
-	bool prepared;
 
 	struct dentry *debugfs;
 	const struct st7703_panel_desc *desc;
@@ -752,13 +751,9 @@ static int st7703_unprepare(struct drm_panel *panel)
 {
 	struct st7703 *ctx = panel_to_st7703(panel);
 
-	if (!ctx->prepared)
-		return 0;
-
 	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 	regulator_disable(ctx->iovcc);
 	regulator_disable(ctx->vcc);
-	ctx->prepared = false;
 
 	return 0;
 }
@@ -768,9 +763,6 @@ static int st7703_prepare(struct drm_panel *panel)
 	struct st7703 *ctx = panel_to_st7703(panel);
 	int ret;
 
-	if (ctx->prepared)
-		return 0;
-
 	dev_dbg(ctx->dev, "Resetting the panel\n");
 	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 
@@ -793,8 +785,6 @@ static int st7703_prepare(struct drm_panel *panel)
 	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
 	usleep_range(15000, 20000);
 
-	ctx->prepared = true;
-
 	return 0;
 }
 
@@ -854,7 +844,13 @@ static int allpixelson_set(void *data, u64 val)
 	dev_dbg(ctx->dev, "Setting all pixels on\n");
 	mipi_dsi_generic_write_seq(dsi, ST7703_CMD_ALL_PIXEL_ON);
 	msleep(val * 1000);
-	/* Reset the panel to get video back */
+
+	/*
+	 * Reset the panel to get video back. NOTE: This isn't a
+	 * particularly safe thing to do in general because it assumes
+	 * that the screen was on to begin with, but this is just a
+	 * debugfs file so it's not a huge deal.
+	 */
 	drm_panel_disable(&ctx->panel);
 	drm_panel_unprepare(&ctx->panel);
 	drm_panel_prepare(&ctx->panel);
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

