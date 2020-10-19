Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D6A292780
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 14:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14F86E95F;
	Mon, 19 Oct 2020 12:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546116E95F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 12:39:39 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09JCdXJo017303;
 Mon, 19 Oct 2020 07:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1603111173;
 bh=arKDrdf8UEKjyd63cRuI2E1qsiNW35jQzibdyvfghWU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=e89qMVWRX0PzvN/2SQR/aV7SlbsaInBJ2CTITkmLVBXcdPFDqPRkbFk/1xHoPIE03
 AuAaaMxuotwjDDtjNZ1hts6m0iTwybIfxM6rT4FTUxlIOx6E09VhQp6qDaObSnGAmS
 WwDHz6WBICw/wAqFuosV/D55Mq6J/uQDayLC/i5A=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09JCdXfd015231
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 19 Oct 2020 07:39:33 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 19
 Oct 2020 07:39:32 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 19 Oct 2020 07:39:32 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09JCdP8X060195;
 Mon, 19 Oct 2020 07:39:30 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda
 <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 2/2] drm/bridge: display-connector: add DP support
Date: Mon, 19 Oct 2020 15:39:04 +0300
Message-ID: <20201019123904.259146-3-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201019123904.259146-1-tomi.valkeinen@ti.com>
References: <20201019123904.259146-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Swapnil Kashinath Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DP support to display-connector driver. The driver will support HPD
via a GPIO and DP PWR.

DP PWR will be enabled at probe, which is not optimal, but I'm not sure
what would be a good place to enable and disable DP PWR. Perhaps
attach/detach, but I don't know if enabling HW is something that attach
is supposed to do.

In any case, I don't think there's much difference in power consumption
between the version in this patch and enabling the regulator later: if
the driver probes, supposedly it will attach very soon afterwards, and
we need to enable the DP PWR as soon as possible.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/bridge/display-connector.c | 46 +++++++++++++++++++++-
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index 4d278573cdb9..04362feccd75 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -11,6 +11,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
 
 #include <drm/drm_bridge.h>
 #include <drm/drm_edid.h>
@@ -20,6 +21,8 @@ struct display_connector {
 
 	struct gpio_desc	*hpd_gpio;
 	int			hpd_irq;
+
+	struct regulator	*dp_pwr;
 };
 
 static inline struct display_connector *
@@ -172,11 +175,12 @@ static int display_connector_probe(struct platform_device *pdev)
 	of_property_read_string(pdev->dev.of_node, "label", &label);
 
 	/*
-	 * Get the HPD GPIO for DVI and HDMI connectors. If the GPIO can provide
+	 * Get the HPD GPIO for DVI, HDMI and DP connectors. If the GPIO can provide
 	 * edge interrupts, register an interrupt handler.
 	 */
 	if (type == DRM_MODE_CONNECTOR_DVII ||
-	    type == DRM_MODE_CONNECTOR_HDMIA) {
+	    type == DRM_MODE_CONNECTOR_HDMIA ||
+	    type == DRM_MODE_CONNECTOR_DisplayPort) {
 		conn->hpd_gpio = devm_gpiod_get_optional(&pdev->dev, "hpd",
 							 GPIOD_IN);
 		if (IS_ERR(conn->hpd_gpio)) {
@@ -223,6 +227,38 @@ static int display_connector_probe(struct platform_device *pdev)
 		}
 	}
 
+	/* Get the DP PWR for DP connector */
+	if (type == DRM_MODE_CONNECTOR_DisplayPort) {
+		int r;
+
+		conn->dp_pwr = devm_regulator_get_optional(&pdev->dev, "dp-pwr");
+
+		if (IS_ERR(conn->dp_pwr)) {
+			r = PTR_ERR(conn->dp_pwr);
+
+			switch (r) {
+			case -ENODEV:
+				conn->dp_pwr = NULL;
+				break;
+
+			case -EPROBE_DEFER:
+				return -EPROBE_DEFER;
+
+			default:
+				dev_err(&pdev->dev, "failed to get DP PWR regulator: %d\n", r);
+				return r;
+			}
+		}
+
+		if (conn->dp_pwr) {
+			r = regulator_enable(conn->dp_pwr);
+			if (r) {
+				dev_err(&pdev->dev, "failed to enable DP PWR regulator: %d\n", r);
+				return r;
+			}
+		}
+	}
+
 	conn->bridge.funcs = &display_connector_bridge_funcs;
 	conn->bridge.of_node = pdev->dev.of_node;
 
@@ -251,6 +287,9 @@ static int display_connector_remove(struct platform_device *pdev)
 {
 	struct display_connector *conn = platform_get_drvdata(pdev);
 
+	if (conn->dp_pwr)
+		regulator_disable(conn->dp_pwr);
+
 	drm_bridge_remove(&conn->bridge);
 
 	if (!IS_ERR(conn->bridge.ddc))
@@ -275,6 +314,9 @@ static const struct of_device_id display_connector_match[] = {
 	}, {
 		.compatible = "vga-connector",
 		.data = (void *)DRM_MODE_CONNECTOR_VGA,
+	}, {
+		.compatible = "dp-connector",
+		.data = (void *)DRM_MODE_CONNECTOR_DisplayPort,
 	},
 	{},
 };
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
