Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0523BC8B3BF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 18:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1FF10E6CF;
	Wed, 26 Nov 2025 17:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="EHHfyEiD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7918D10E6C9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 17:37:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 802F5C16A0D;
 Wed, 26 Nov 2025 17:37:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4885960721;
 Wed, 26 Nov 2025 17:37:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A8F90102F1D8D; Wed, 26 Nov 2025 18:37:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1764178653; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=gtwGPUSYrT3C7fb4DdUoNkStAAhzJrloynTtI6PT9qQ=;
 b=EHHfyEiD/ZIiNwX6xnOOl5d1kgfFcBablmaVmdt4fytDu5PczzIEB1L9aCqASmjiZJ+FEd
 gL07rp6pvw0o6AjNqJyZmVzpse5QceVPJeSYclGXijdSr3DwUrmKKlqLBbyvcx/UD32K1c
 3tAbk1wMLcyfOc/jLD/KSos0DD/kVmjpao+JQKJQeqaFDISYfBYheHtj5/j+aLrSQy7O/K
 3GW7Vki5caC1p0B2tQ4HOgx30Zdpyau4Mz3flOYBf7L5yvHHIyNFacoJkorc6S5LKqLUYw
 XTOX4/g/4PVIUYSmuIQmnZ3Q+4X/aFi2zmL9zCdGggwohV7gp8sfzSdBBYSh/g==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Wed, 26 Nov 2025 18:35:59 +0100
Subject: [PATCH 17/21] drm/bridge: tda998x: Remove component support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-feature_tilcdc-v1-17-49b9ef2e3aa0@bootlin.com>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
In-Reply-To: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
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

The tilcdc driver no longer uses the component framework to bind the
tda998x bridge driver. The component bind/unbind operations and the
encoder initialization code are now dead code and can be safely removed.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/bridge/tda998x_drv.c | 69 +-----------------------------------
 1 file changed, 1 insertion(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tda998x_drv.c b/drivers/gpu/drm/bridge/tda998x_drv.c
index e636459d91857..865285ba2bd8c 100644
--- a/drivers/gpu/drm/bridge/tda998x_drv.c
+++ b/drivers/gpu/drm/bridge/tda998x_drv.c
@@ -4,7 +4,6 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
-#include <linux/component.h>
 #include <linux/gpio/consumer.h>
 #include <linux/hdmi.h>
 #include <linux/i2c.h>
@@ -1963,85 +1962,19 @@ static int tda998x_create(struct device *dev)
 	return ret;
 }
 
-/* DRM encoder functions */
-
-static int tda998x_encoder_init(struct device *dev, struct drm_device *drm)
-{
-	struct tda998x_priv *priv = dev_get_drvdata(dev);
-	u32 crtcs = 0;
-	int ret;
-
-	if (dev->of_node)
-		crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
-
-	/* If no CRTCs were found, fall back to our old behaviour */
-	if (crtcs == 0) {
-		dev_warn(dev, "Falling back to first CRTC\n");
-		crtcs = 1 << 0;
-	}
-
-	priv->encoder.possible_crtcs = crtcs;
-
-	ret = drm_simple_encoder_init(drm, &priv->encoder,
-				      DRM_MODE_ENCODER_TMDS);
-	if (ret)
-		goto err_encoder;
-
-	ret = drm_bridge_attach(&priv->encoder, &priv->bridge, NULL, 0);
-	if (ret)
-		goto err_bridge;
-
-	return 0;
-
-err_bridge:
-	drm_encoder_cleanup(&priv->encoder);
-err_encoder:
-	return ret;
-}
-
-static int tda998x_bind(struct device *dev, struct device *master, void *data)
-{
-	struct drm_device *drm = data;
-
-	return tda998x_encoder_init(dev, drm);
-}
-
-static void tda998x_unbind(struct device *dev, struct device *master,
-			   void *data)
-{
-	struct tda998x_priv *priv = dev_get_drvdata(dev);
-
-	drm_encoder_cleanup(&priv->encoder);
-}
-
-static const struct component_ops tda998x_ops = {
-	.bind = tda998x_bind,
-	.unbind = tda998x_unbind,
-};
-
 static int
 tda998x_probe(struct i2c_client *client)
 {
-	int ret;
-
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		dev_warn(&client->dev, "adapter does not support I2C\n");
 		return -EIO;
 	}
 
-	ret = tda998x_create(&client->dev);
-	if (ret)
-		return ret;
-
-	ret = component_add(&client->dev, &tda998x_ops);
-	if (ret)
-		tda998x_destroy(&client->dev);
-	return ret;
+	return tda998x_create(&client->dev);
 }
 
 static void tda998x_remove(struct i2c_client *client)
 {
-	component_del(&client->dev, &tda998x_ops);
 	tda998x_destroy(&client->dev);
 }
 

-- 
2.43.0

