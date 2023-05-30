Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF1C716D84
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 21:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F9610E418;
	Tue, 30 May 2023 19:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDD210E417
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 19:28:22 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A75B4847C0;
 Tue, 30 May 2023 21:28:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1685474900;
 bh=omn0qPdvYx0kG7n/PZJIkC9DtWFUxvle4DwjJsxCz68=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HmYV0I7Mv576uiV8f+VBQoPpl0CSLG+wAZ7T+FjLMpaaG/VdkXaGgxzasDGTuLF45
 8DjJejxRCaUIY9dttblaTKsFfpzc1sD3aIs844UXZu2h5Jeq6IRKLdFSUw3oxu2q7+
 a7qRbPoPiHdEFRGJTR53fLGr0ZnB3+ayvYHOrcUxq1gyxbn67+/veU7K2bqP8iy7DC
 obibIQpyMrxarKwjRyQgx3CCUm4lICWyVu6rf21MM9qTLP98nWbMiSWzU03VBkHdVA
 SlS/faZAMiKKe7heOAG/4/qq4f8k1Y0Ghd2IqsoTDMEOV4XI0ogsoOPH23/oBe9rzh
 4rhijEa2+liyA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/bridge: tc358762: Add reset GPIO support
Date: Tue, 30 May 2023 21:28:05 +0200
Message-Id: <20230530192805.648646-2-marex@denx.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230530192805.648646-1-marex@denx.de>
References: <20230530192805.648646-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add reset GPIO support. The reset GPIO is cleared after supply regulator
was enabled, and set before supply regulator is disabled.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/tc358762.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 77f7f7f547570..5641395fd310e 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -11,6 +11,7 @@
  */
 
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of_graph.h>
@@ -63,6 +64,7 @@ struct tc358762 {
 	struct drm_bridge bridge;
 	struct regulator *regulator;
 	struct drm_bridge *panel_bridge;
+	struct gpio_desc *reset_gpio;
 	bool pre_enabled;
 	int error;
 };
@@ -138,6 +140,9 @@ static void tc358762_post_disable(struct drm_bridge *bridge)
 
 	ctx->pre_enabled = false;
 
+	if (ctx->reset_gpio)
+		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+
 	ret = regulator_disable(ctx->regulator);
 	if (ret < 0)
 		dev_err(ctx->dev, "error disabling regulators (%d)\n", ret);
@@ -152,6 +157,11 @@ static void tc358762_pre_enable(struct drm_bridge *bridge)
 	if (ret < 0)
 		dev_err(ctx->dev, "error enabling regulators (%d)\n", ret);
 
+	if (ctx->reset_gpio) {
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		usleep_range(5000, 10000);
+	}
+
 	ret = tc358762_init(ctx);
 	if (ret < 0)
 		dev_err(ctx->dev, "error initializing bridge (%d)\n", ret);
@@ -185,6 +195,11 @@ static int tc358762_parse_dt(struct tc358762 *ctx)
 
 	ctx->panel_bridge = panel_bridge;
 
+	/* Reset GPIO is optional */
+	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset_gpio))
+		return PTR_ERR(ctx->reset_gpio);
+
 	return 0;
 }
 
-- 
2.39.2

