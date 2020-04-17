Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1CD1ADC3B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 13:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045526EB9A;
	Fri, 17 Apr 2020 11:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6092F6EB99
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 11:33:41 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03HBXc8G039105;
 Fri, 17 Apr 2020 06:33:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1587123218;
 bh=B4svpTjbq2qHmr8DJw9LugXKpQ5dJfS4XwA8vW7yUes=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=dIv08+1eyLlGQnxbLUFZnUDZsoullYatL6FTvngK5E4m4JtK/4OboubXRAH58XVtQ
 Dw9wxq5EPO0El6a8nOOZVvD7yXcyGH+7WwBFjff/qCfcJ+o9elwQTzFZZ/0bjvSj07
 G7e9T17st7nt66myQ8GhYxmQZVtVeHLGrYnQCiU0=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03HBXcfA066382;
 Fri, 17 Apr 2020 06:33:38 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 17
 Apr 2020 06:33:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 17 Apr 2020 06:33:38 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03HBXSSn012787;
 Fri, 17 Apr 2020 06:33:36 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Lee Jones <lee.jones@linaro.org>, Daniel Thompson
 <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Bartlomiej
 Zolnierkiewicz <b.zolnierkie@samsung.com>,
 <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
Subject: [PATCH 5/5] backlight: led_bl: rewrite led_bl_parse_levels()
Date: Fri, 17 Apr 2020 14:33:12 +0300
Message-ID: <20200417113312.24340-5-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200417113312.24340-1-tomi.valkeinen@ti.com>
References: <20200417113312.24340-1-tomi.valkeinen@ti.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

led_bl_parse_levels() is rather difficult to follow. Rewrite it with a
more obvious code flow.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/video/backlight/led_bl.c | 63 ++++++++++++++++----------------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
index 021b5edd895c..7b3889035540 100644
--- a/drivers/video/backlight/led_bl.c
+++ b/drivers/video/backlight/led_bl.c
@@ -132,50 +132,51 @@ static int led_bl_parse_levels(struct device *dev,
 	int num_levels;
 	u32 value;
 	int ret;
+	int i;
+	u32 *levels;
 
 	if (!node)
 		return -ENODEV;
 
 	num_levels = of_property_count_u32_elems(node, "brightness-levels");
-	if (num_levels > 1) {
-		int i;
-		unsigned int db;
-		u32 *levels;
-
-		levels = devm_kzalloc(dev, sizeof(u32) * num_levels,
-				      GFP_KERNEL);
-		if (!levels)
-			return -ENOMEM;
-
-		ret = of_property_read_u32_array(node, "brightness-levels",
-						 levels,
-						 num_levels);
-		if (ret < 0)
-			return ret;
-
-		/*
-		 * Try to map actual LED brightness to backlight brightness
-		 * level
-		 */
-		db = priv->default_brightness;
+
+	if (num_levels < 0)
+		return 0;
+
+	if (num_levels == 0) {
+		dev_warn(dev, "No brightness-levels defined\n");
+		return -EINVAL;
+	}
+
+	levels = devm_kzalloc(dev, sizeof(u32) * num_levels,
+			      GFP_KERNEL);
+	if (!levels)
+		return -ENOMEM;
+
+	ret = of_property_read_u32_array(node, "brightness-levels",
+					 levels,
+					 num_levels);
+	if (ret < 0)
+		return ret;
+
+	priv->max_brightness = num_levels - 1;
+	priv->levels = levels;
+
+	ret = of_property_read_u32(node, "default-brightness-level", &value);
+	if (!ret) {
+		priv->default_brightness = min(value, priv->max_brightness);
+	} else {
+		/* Map LED default-brightness to backlight brightness level */
+		unsigned int db = priv->default_brightness;
+
 		for (i = 0 ; i < num_levels; i++) {
 			if ((i == 0 || db > levels[i - 1]) && db <= levels[i])
 				break;
 		}
 
 		priv->default_brightness = i < num_levels ? i : 0;
-		priv->max_brightness = num_levels - 1;
-		priv->levels = levels;
-	} else if (num_levels >= 0) {
-		dev_warn(dev, "Not enough levels defined\n");
 	}
 
-	ret = of_property_read_u32(node, "default-brightness-level", &value);
-	if (!ret && value <= priv->max_brightness)
-		priv->default_brightness = value;
-	else if (!ret  && value > priv->max_brightness)
-		dev_warn(dev, "Invalid default brightness. Ignoring it\n");
-
 	return 0;
 }
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
