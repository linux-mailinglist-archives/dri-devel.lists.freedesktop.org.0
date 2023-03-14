Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 183696B9193
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 12:26:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F188410E0D2;
	Tue, 14 Mar 2023 11:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 534 seconds by postgrey-1.36 at gabe;
 Tue, 14 Mar 2023 11:26:31 UTC
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61A610E0D2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 11:26:31 +0000 (UTC)
Received: from fabio-Precision-3551.. (unknown
 [IPv6:2804:14c:485:4b69:d086:7d15:2ce3:1a1b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: festevam@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 84D16861C5;
 Tue, 14 Mar 2023 12:17:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1678792659;
 bh=5UVq9kWaDSvkl4Rfih2050+zoQO8g2q290YPZ7fsYME=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p8zxERBlTl6EmELJFG3+3NTNt64GsbVFwAGSB1AwaSC8vCWbffiPnTxxqB0UOBSrO
 EytfrsQaDut3BNujxc+ImPBrhiMgmW0/sHYf8V13HNaabMyim9Faspi271jeAuun34
 eH6ilSOtiXXpF/T0bWNCBYWHanBkWi9rQ7bmK0XzKLD+xN7Htgm1qM1Imwki+vjIsL
 bTuAP++WCZud8uv/ts7B7hmDXgHHNYQYlzhm41IhGv1SJV1uXY/qZvEVifCCVv/iXv
 7nKq8GzmqAOOAJP7VMqGK5tAVWH4/cHDQh8JIqSMMBzuSx7SxVFY22ofcMH0ahVyqL
 7RyJNHaXaO0Ig==
From: Fabio Estevam <festevam@denx.de>
To: neil.armstrong@linaro.org
Subject: [PATCH 2/2] drm/panel: seiko-43wvf1g: Add the 'enable-gpios' property
Date: Tue, 14 Mar 2023 08:17:24 -0300
Message-Id: <20230314111724.1520178-2-festevam@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230314111724.1520178-1-festevam@denx.de>
References: <20230314111724.1520178-1-festevam@denx.de>
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
Cc: devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org, CPHEALY@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sometimes a GPIO is needed to turn on/off the display.

Add support for this usecase by introducing the optional 'enable-gpios'
property.

Tested on a imx53qsb board.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
index 76160e5d43bd..c250ca36a5b3 100644
--- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
+++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -48,6 +49,7 @@ struct seiko_panel {
 	const struct seiko_panel_desc *desc;
 	struct regulator *dvdd;
 	struct regulator *avdd;
+	struct gpio_desc *enable_gpio;
 };
 
 static inline struct seiko_panel *to_seiko_panel(struct drm_panel *panel)
@@ -139,6 +141,8 @@ static int seiko_panel_unprepare(struct drm_panel *panel)
 	if (!p->prepared)
 		return 0;
 
+	gpiod_set_value_cansleep(p->enable_gpio, 0);
+
 	regulator_disable(p->avdd);
 
 	/* Add a 100ms delay as per the panel datasheet */
@@ -174,6 +178,8 @@ static int seiko_panel_prepare(struct drm_panel *panel)
 		goto disable_dvdd;
 	}
 
+	gpiod_set_value_cansleep(p->enable_gpio, 1);
+
 	p->prepared = true;
 
 	return 0;
@@ -252,6 +258,12 @@ static int seiko_panel_probe(struct device *dev,
 	if (IS_ERR(panel->avdd))
 		return PTR_ERR(panel->avdd);
 
+	panel->enable_gpio = devm_gpiod_get_optional(dev, "enable",
+						     GPIOD_OUT_LOW);
+	if (IS_ERR(panel->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(panel->enable_gpio),
+				     "failed to request GPIO\n");
+
 	drm_panel_init(&panel->base, dev, &seiko_panel_funcs,
 		       DRM_MODE_CONNECTOR_DPI);
 
-- 
2.34.1

