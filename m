Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD407770A75
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 23:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814D510E14C;
	Fri,  4 Aug 2023 21:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC12510E12F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 21:07:29 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-686c06b806cso1882650b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 14:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1691183248; x=1691788048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SrsSjqZ7OVl1AWfIXsg4vL7ZkYMxPl18iDNJrqzoz4k=;
 b=igZkBXcHHS/NmtYnn82Gu31zizwN7sk/X1c4RXzpaeTXixkHYqPgzx5DzIgAZExffK
 mICfP6MOntNN+49lbOrNo9rMHa67le2kkx350dw0aTzJ/t0z66RTi8tWKsQ5xvmOt7Cb
 aT3W7ufFoCZ/s9dfIdRqpOo6DBhQXgaZ5Be9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691183248; x=1691788048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SrsSjqZ7OVl1AWfIXsg4vL7ZkYMxPl18iDNJrqzoz4k=;
 b=BMZhneF+bhOuDSlwfeu8XPpa53YLCCnVdhV4ldoHexmjGxQYzYONNb2fWXRC0EmxMW
 KvCzGnMnQSCIpv6yYw/LEnUJRDHa3vJIEtglCHBiLS2eVIg4PovUvqksma8Lq04P941f
 DsS/rTgst4msMgtTW5XAgrqA7hZMd4m+F/ubgMMfoxOzkOmzEIDrjEi5qZSpbfhfHvXe
 6XGQmWapV7dhh/+pJiXc1FBIjh0r+zf/kVokVyJDLJB3Q9ejfpKMJ/QUApWFO6+Dj8H8
 kFvTHPoAjpt2ZV369/RcWJwkSDyxiqKrJEdEclKebx7zcLN3ya0ZawDHsBeZrUAntgSA
 M9mA==
X-Gm-Message-State: AOJu0YzDSZj6/kdol2S4GwRT4gllbho2KvxW/ysJMnjx6pMxgJG4rbcS
 ujlppX8G0BgukGehTu0aPkbGAM0PjfrDcfMpBGVfawHJ
X-Google-Smtp-Source: AGHT+IEcK7W1PDCytR6pAUX1xURN5daOQuXk47xXgJ9839il1wgV/d4dk8Z2A8ZZyb0W6m409c8NtQ==
X-Received: by 2002:a05:6a00:1798:b0:666:b254:1c9c with SMTP id
 s24-20020a056a00179800b00666b2541c9cmr3339506pfg.27.1691183248705; 
 Fri, 04 Aug 2023 14:07:28 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:e186:e5d2:e60:bad3])
 by smtp.gmail.com with ESMTPSA id
 n22-20020aa78a56000000b0068664ace38asm2037584pfa.19.2023.08.04.14.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 14:07:27 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFC PATCH 07/10] drm/panel: st7703: Don't store+check prepared
Date: Fri,  4 Aug 2023 14:06:10 -0700
Message-ID: <20230804140605.RFC.7.Ifc436b262d72f1a33ddef10adfd7578d4acb60d8@changeid>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
In-Reply-To: <20230804210644.1862287-1-dianders@chromium.org>
References: <20230804210644.1862287-1-dianders@chromium.org>
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
Cc: Ondrej Jirman <megous@megous.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Purism Kernel Team <kernel@puri.sm>, Sam Ravnborg <sam@ravnborg.org>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As talked about in commit d2aacaf07395 ("drm/panel: Check for already
prepared/enabled in drm_panel"), we want to remove needless code from
panel drivers that was storing and double-checking the
prepared/enabled state. Even if someone was relying on the
double-check before, that double-check is now in the core and not
needed in individual drivers.

For the st7703 panel driver this is fairly straightforward. Like with
many other panels, we need to use the new drm_panel_helper_shutdown()
function to make sure that remove() and shutdown() don't try to
disable/unprepare a panel that hasn't been prepared/enabled. One thing
that is a little different for st7703 is that it has a special
"allpixelson" debugfs file. When this file is written the driver hacks
a disable/unprepare and then a prepare/enable to try to reset the
panel. This debugfs file didn't appear to be particularly safe to use
even before this patch since it would cause a disabled/unprepared
panel to become prepared/enabled. It is nominally even less safe after
this patch since calling it on a panel that wasn't prepared/enabled
will now likely cause a regulator underflow message. If this matters
to anyone, it could be fixed in a future patch.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 20 ++-----------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index 6a3945639535..dde903e803d1 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -22,6 +22,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_panel_helper.h>
 
 #define DRV_NAME "panel-sitronix-st7703"
 
@@ -58,7 +59,6 @@ struct st7703 {
 	struct gpio_desc *reset_gpio;
 	struct regulator *vcc;
 	struct regulator *iovcc;
-	bool prepared;
 
 	struct dentry *debugfs;
 	const struct st7703_panel_desc *desc;
@@ -486,13 +486,9 @@ static int st7703_unprepare(struct drm_panel *panel)
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
@@ -502,9 +498,6 @@ static int st7703_prepare(struct drm_panel *panel)
 	struct st7703 *ctx = panel_to_st7703(panel);
 	int ret;
 
-	if (ctx->prepared)
-		return 0;
-
 	dev_dbg(ctx->dev, "Resetting the panel\n");
 	ret = regulator_enable(ctx->vcc);
 	if (ret < 0) {
@@ -522,8 +515,6 @@ static int st7703_prepare(struct drm_panel *panel)
 	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
 	msleep(20);
 
-	ctx->prepared = true;
-
 	return 0;
 
 disable_vcc:
@@ -665,15 +656,8 @@ static int st7703_probe(struct mipi_dsi_device *dsi)
 static void st7703_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct st7703 *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
 
-	ret = drm_panel_unprepare(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to unprepare panel: %d\n", ret);
-
-	ret = drm_panel_disable(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to disable panel: %d\n", ret);
+	drm_panel_helper_shutdown(&ctx->panel);
 }
 
 static void st7703_remove(struct mipi_dsi_device *dsi)
-- 
2.41.0.585.gd2178a4bd4-goog

