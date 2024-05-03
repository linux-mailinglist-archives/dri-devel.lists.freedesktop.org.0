Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 585C18BB5F1
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD0F113290;
	Fri,  3 May 2024 21:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="U8ik875N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007F311328E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:36:59 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-5c6bd3100fcso75615a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772218; x=1715377018;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xn3kmqG9n+u6RTxNsaXpW9ople5vt6wNE5CodtGeIeA=;
 b=U8ik875NqGUjOnP5heUxRFWrJK1FJlCaz1LlfB0f7bysR25oMEOPM4jMP4Xg7qkywQ
 0iZa+7XicVnt6F4NLEOrs5gBjCxMpWzat0mdJ75iZmwrPMl4llMOzLhUjDS18caZP1NO
 7md5jPnFDloX15nmOcSkGga6ZSJsVaCoTE2Z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772218; x=1715377018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xn3kmqG9n+u6RTxNsaXpW9ople5vt6wNE5CodtGeIeA=;
 b=VBE/iwCLBGDSDwGIS6h0h0NAzpOlEROI3+XVSC3e993k0+4MmUf5UPoALyV0/1fbTb
 a+f85kLSozcM1vgtYi4FmQpawmxrNvLVyph2M34i+USkliEDvHDkc1zov/XsnSj9ZleT
 /ZXTQicf1TSvdYNh4DXreBX94ry8rshjmb4CWoSJo/ZXjKaK2cIJFcF5O6zTNwI/aoAr
 fCqgJgNlyd2w1GHtwGXogWoVgpYkTUFaRN37/qzH+hj7aAis+Nhrccol7o1rsUBosGje
 MbL1ppBb6g7UFCbWd4XsDsAzBvbV5oGKGnusD9+U+KDqQZd8e6jwZF3hl+0irm8yi3dk
 RrYw==
X-Gm-Message-State: AOJu0Yx9djeVum5kAjdFyN5j1LQXaEJHzxXft1GM/lh3RS3j9nKHivn1
 ZxDPqYmfxlEAS9CAnozw4DgKV5H2Sr5U+sW24M1+WofdlTFwFnbHl8428oJa6vcKlp24I05yOZO
 oBw==
X-Google-Smtp-Source: AGHT+IHU+zTKbiqkq2N+BAjsxHc3GvfIh424IhHaVXyvXNqc/r0rVspgmWUaRIVseSK1shOdJ8cBgw==
X-Received: by 2002:a17:90b:400b:b0:2b2:9b67:198a with SMTP id
 ie11-20020a17090b400b00b002b29b67198amr4603020pjb.34.1714772218223; 
 Fri, 03 May 2024 14:36:58 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:36:57 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 14/48] drm/panel: ltk050h3146w: Stop tracking prepared
Date: Fri,  3 May 2024 14:32:55 -0700
Message-ID: <20240503143327.RFT.v2.14.I264417152e65b4a2e374666010666fa1c2d973fc@changeid>
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

Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
index 1a26205701b5..5894bf30524a 100644
--- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
@@ -36,7 +36,6 @@ struct ltk050h3146w {
 	struct regulator *vci;
 	struct regulator *iovcc;
 	const struct ltk050h3146w_desc *panel_desc;
-	bool prepared;
 };
 
 static const struct ltk050h3146w_cmd page1_cmds[] = {
@@ -521,9 +520,6 @@ static int ltk050h3146w_unprepare(struct drm_panel *panel)
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	int ret;
 
-	if (!ctx->prepared)
-		return 0;
-
 	ret = mipi_dsi_dcs_set_display_off(dsi);
 	if (ret < 0) {
 		dev_err(ctx->dev, "failed to set display off: %d\n", ret);
@@ -539,8 +535,6 @@ static int ltk050h3146w_unprepare(struct drm_panel *panel)
 	regulator_disable(ctx->iovcc);
 	regulator_disable(ctx->vci);
 
-	ctx->prepared = false;
-
 	return 0;
 }
 
@@ -550,9 +544,6 @@ static int ltk050h3146w_prepare(struct drm_panel *panel)
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	int ret;
 
-	if (ctx->prepared)
-		return 0;
-
 	dev_dbg(ctx->dev, "Resetting the panel\n");
 	ret = regulator_enable(ctx->vci);
 	if (ret < 0) {
@@ -593,8 +584,6 @@ static int ltk050h3146w_prepare(struct drm_panel *panel)
 
 	msleep(50);
 
-	ctx->prepared = true;
-
 	return 0;
 
 disable_iovcc:
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

