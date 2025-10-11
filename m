Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 273B7BCF8C8
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FC010E30A;
	Sat, 11 Oct 2025 17:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="wZaPXCyt";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="s3Dk/z9I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C5910E30A
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:03:13 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ckVL82gQZz9sm3;
 Sat, 11 Oct 2025 19:03:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FcmxGZfVXlAxAmbZndHwXiE2+MRphh16xcBVRBH91MQ=;
 b=wZaPXCytsM0gkA7hR0Lx4WtNd2DymKkEszSVVhPx5dd0Ybta6FZZvwc1c9VRN4aiKm4YME
 ihGZL67JmP1gDm7ICM1xfFHM60bwh3NxgzTsJfZ2rWSCgAf+fTI17O/2xZhoA0Yiq527HD
 a/ABfzvm4gycxL+G/ndE3IN6v/lUg8hikQsOYykRzRMnsMzDLvnj4maMM8iZpw/MGffdCX
 r2VbzDGHmpFKjONI0MnvI56zybYov2Vt4vc6T0he1M907t3tNd7bru5GksidSfiHPQYhWg
 +gHK5d+ECdTBkBdGmAJm0IlTIckAOb48smwFXw0Kxa23vOo6ipxl9cltvEu+5w==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FcmxGZfVXlAxAmbZndHwXiE2+MRphh16xcBVRBH91MQ=;
 b=s3Dk/z9ISBuqX1fq5gFMYVQfXUR/4Qp/dyy9SSFlGzvPHPG0MB/jhvfHHdSBmjsux0mipm
 Zpip2yHNZfBo1QZLAWBlwASXd1cpiZbH52FhoDeeNgXk3tTtrE51HA14VdYN7pzOITCNG+
 pzRUkfqpFbE3A4cT1S2Q0mQ3GEplOiKBgqR7c+gD/JK+sMAOH5cky50/BsXU2r31FJBMjw
 TrJvfi3/O6bedwkQ7hlkgrrYnGKlRByh3teuJE5ULRYzlMsIyeEEHRFpktFkUIqx7eGoli
 lxr+ZfYBjRttgN6aWdU/7SOT2MVEmoae38mFGls/gtNfF1iAtPX1K+SYrw3l+w==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH 07/39] drm/imx: dc: cf: Pass struct dc_subdev_info via OF
 match data
Date: Sat, 11 Oct 2025 18:51:22 +0200
Message-ID: <20251011170213.128907-8-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: r3mc7ja9o8w6zpoyn4yuogbufr6b17ok
X-MBO-RS-ID: 5d6088cbaac08c1efdd
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

Pass the struct dc_subdev_info as OF match data into the driver,
so the driver can use the match data to correct map addresses to
IDs. This is a preparatory patch for i.MX95 addition. No functional
change.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 drivers/gpu/drm/imx/dc/dc-cf.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-cf.c b/drivers/gpu/drm/imx/dc/dc-cf.c
index 6cb83182a3668..1d3602c5d4230 100644
--- a/drivers/gpu/drm/imx/dc/dc-cf.c
+++ b/drivers/gpu/drm/imx/dc/dc-cf.c
@@ -10,6 +10,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #include "dc-drv.h"
@@ -24,7 +25,13 @@
 #define CONSTANTCOLOR		0x10
 #define  BLUE(x)		FIELD_PREP(GENMASK(15, 8), (x))
 
-static const struct dc_subdev_info dc_cf_info[] = {
+struct dc_cf_subdev_match_data {
+	enum dc_link_id			link_cf4;
+	enum dc_link_id			link_cf5;
+	const struct dc_subdev_info	*info;
+};
+
+static const struct dc_subdev_info dc_cf_info_imx8qxp[] = {
 	{ .reg_start = 0x56180960, .id = 0, },
 	{ .reg_start = 0x561809e0, .id = 1, },
 	{ .reg_start = 0x561809a0, .id = 4, },
@@ -32,6 +39,12 @@ static const struct dc_subdev_info dc_cf_info[] = {
 	{ /* sentinel */ },
 };
 
+static const struct dc_cf_subdev_match_data dc_cf_match_data_imx8qxp = {
+	.link_cf4 = LINK_ID_CONSTFRAME4_MX8QXP,
+	.link_cf5 = LINK_ID_CONSTFRAME5_MX8QXP,
+	.info = dc_cf_info_imx8qxp,
+};
+
 static const struct regmap_range dc_cf_regmap_ranges[] = {
 	regmap_reg_range(STATICCONTROL, CONSTANTCOLOR),
 };
@@ -85,6 +98,8 @@ void dc_cf_init(struct dc_cf *cf)
 
 static int dc_cf_bind(struct device *dev, struct device *master, void *data)
 {
+	const struct dc_cf_subdev_match_data *dc_cf_match_data = device_get_match_data(dev);
+	const struct dc_subdev_info *dc_cf_info = dc_cf_match_data->info;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dc_drm_device *dc_drm = data;
 	struct resource *res_pec;
@@ -123,11 +138,11 @@ static int dc_cf_bind(struct device *dev, struct device *master, void *data)
 		dc_drm->cf_cont[1] = cf;
 		break;
 	case 4:
-		cf->link = LINK_ID_CONSTFRAME4_MX8QXP;
+		cf->link = dc_cf_match_data->link_cf4;
 		dc_drm->cf_safe[0] = cf;
 		break;
 	case 5:
-		cf->link = LINK_ID_CONSTFRAME5_MX8QXP;
+		cf->link = dc_cf_match_data->link_cf5;
 		dc_drm->cf_safe[1] = cf;
 		break;
 	}
@@ -157,7 +172,7 @@ static void dc_cf_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id dc_cf_dt_ids[] = {
-	{ .compatible = "fsl,imx8qxp-dc-constframe" },
+	{ .compatible = "fsl,imx8qxp-dc-constframe", .data = &dc_cf_match_data_imx8qxp },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dc_cf_dt_ids);
-- 
2.51.0

