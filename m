Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF3A370999
	for <lists+dri-devel@lfdr.de>; Sun,  2 May 2021 03:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE84A6E049;
	Sun,  2 May 2021 01:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFEF6E049
 for <dri-devel@lists.freedesktop.org>; Sun,  2 May 2021 01:43:03 +0000 (UTC)
Received: from mail-03.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail-41103.protonmail.ch (Postfix) with ESMTPS id 4FXplT2nkXz4wyTW
 for <dri-devel@lists.freedesktop.org>; Sun,  2 May 2021 01:43:01 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (1024-bit key) header.d=connolly.tech header.i=@connolly.tech
 header.b="a29YV91Y"
Date: Sun, 02 May 2021 01:42:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1619919776;
 bh=Kl3Jo+OZEZzf10VJacbXDH3A1fF+G/d1ql1pz/OtWqI=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=a29YV91YarPuYd+ZgiO2zQf9fSlWHiDHo8E62fQRNqW4dxw2rUuwV3k27xSeHIJun
 fzVc8h5St4JjOlfqwfIbENSdGZft1O38P3GF9j4iUd65wI8WX/m5R7CxQpp7CTxILR
 acqjI8EZtPl8usqMEeAjOf2ksUxdHtP7JYiAtLlM=
To: caleb@connolly.tech, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
From: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 2/4] drm: panel: sofef00: remove reset GPIO handling
Message-ID: <20210502014146.85642-3-caleb@connolly.tech>
In-Reply-To: <20210502014146.85642-1-caleb@connolly.tech>
References: <20210502014146.85642-1-caleb@connolly.tech>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Caleb Connolly <caleb@connolly.tech>
Cc: linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Resetting the panel on fajita causes it to never come back, we aren't
quite sure why this is so for now lets remove reset handling as it is
effectively broken. It is also not needed on enchilada.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 26 +++----------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 8cb1853574bb..cfc8b2a19742 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -23,7 +23,6 @@ struct sofef00_panel {
 	struct drm_panel panel;
 	struct mipi_dsi_device *dsi;
 	struct regulator *supply;
-	struct gpio_desc *reset_gpio;
 	const struct drm_display_mode *mode;
 	bool prepared;
 };
@@ -42,16 +41,6 @@ struct sofef00_panel *to_sofef00_panel(struct drm_panel *panel)
 			return ret;					\
 	} while (0)
 
-static void sofef00_panel_reset(struct sofef00_panel *ctx)
-{
-	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
-	usleep_range(5000, 6000);
-	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
-	usleep_range(2000, 3000);
-	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
-	usleep_range(12000, 13000);
-}
-
 static int sofef00_panel_on(struct sofef00_panel *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
@@ -132,12 +121,9 @@ static int sofef00_panel_prepare(struct drm_panel *panel)
 		return ret;
 	}
 
-	sofef00_panel_reset(ctx);
-
 	ret = sofef00_panel_on(ctx);
 	if (ret < 0) {
 		dev_err(dev, "Failed to initialize panel: %d\n", ret);
-		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 		return ret;
 	}
 
@@ -155,8 +141,11 @@ static int sofef00_panel_unprepare(struct drm_panel *panel)
 		return 0;
 
 	ret = sofef00_panel_off(ctx);
-	if (ret < 0)
+
+	if (ret < 0) {
 		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+		return ret;
+	}
 
 	regulator_disable(ctx->supply);
 
@@ -276,13 +265,6 @@ static int sofef00_panel_probe(struct mipi_dsi_device *dsi)
 		return ret;
 	}
 
-	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(ctx->reset_gpio)) {
-		ret = PTR_ERR(ctx->reset_gpio);
-		dev_warn(dev, "Failed to get reset-gpios: %d\n", ret);
-		return ret;
-	}
-
 	ctx->dsi = dsi;
 	mipi_dsi_set_drvdata(dsi, ctx);
 
-- 
2.30.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
