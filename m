Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B818461B5
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 21:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D572010E9DA;
	Thu,  1 Feb 2024 20:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aMWoaAVN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A0010E9DA
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 20:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706817705; x=1738353705;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Eogk3XjgcRHFKVfwFBmgrv6XFe+ww9n/tWDnoLocj6o=;
 b=aMWoaAVNAntfOj3RnI5ZjlL4B3L43t2v3HSeyd4bbNPu4l0KQZHZjbjP
 Kwfl/ieleFPFCOTpopx0gwJOJ9Vz+2432BWjHiq3/jd3zRrSBvlNGD27J
 8vUO+13YcfhTOqzckz1gmfOqkZeV1jdzP2RgGryZIB6Gvf8Jngky6wVOg
 CSMSXyeTQ6WbgNTBQJUysoyCBSq/+UBFnFY98QWo9/z1UJihpUXPFvOkk
 sqniaBk+8vnVB3JkZ6aCf6SxhyxhBKhK8hdIo9IFO04Mj8zY+DHy2nPwi
 ooHF47E7BwAL7Lmp3Pn95T3bdJjEx91dZq2nf9WtWjbBcp90GuMkrgSNl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="435148106"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="435148106"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 12:01:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="1120050426"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="1120050426"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2024 12:01:42 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id C5F0CB84; Thu,  1 Feb 2024 17:15:42 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Flavio Suligoi <f.suligoi@asem.it>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: [PATCH v2 1/3] backlight: mp3309c: Make use of device properties
Date: Thu,  1 Feb 2024 17:14:13 +0200
Message-ID: <20240201151537.367218-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20240201151537.367218-1-andriy.shevchenko@linux.intel.com>
References: <20240201151537.367218-1-andriy.shevchenko@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the module to be property provider agnostic and allow
it to be used on non-OF platforms.

Add mod_devicetable.h include.

Tested-by: Flavio Suligoi <f.suligoi@asem.it>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/backlight/mp3309c.c | 44 +++++++++++++------------------
 1 file changed, 18 insertions(+), 26 deletions(-)

diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/mp3309c.c
index 34d71259fac1..762bd738c903 100644
--- a/drivers/video/backlight/mp3309c.c
+++ b/drivers/video/backlight/mp3309c.c
@@ -15,6 +15,8 @@
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
+#include <linux/property.h>
 #include <linux/pwm.h>
 #include <linux/regmap.h>
 
@@ -199,18 +201,15 @@ static const struct backlight_ops mp3309c_bl_ops = {
 	.update_status = mp3309c_bl_update_status,
 };
 
-static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
-				 struct mp3309c_platform_data *pdata)
+static int mp3309c_parse_fwnode(struct mp3309c_chip *chip,
+				struct mp3309c_platform_data *pdata)
 {
-	struct device_node *node = chip->dev->of_node;
-	struct property *prop_pwms;
-	struct property *prop_levels = NULL;
-	int length = 0;
 	int ret, i;
 	unsigned int num_levels, tmp_value;
+	struct device *dev = chip->dev;
 
-	if (!node) {
-		dev_err(chip->dev, "failed to get DT node\n");
+	if (!dev_fwnode(dev)) {
+		dev_err(dev, "failed to get firmware node\n");
 		return -ENODEV;
 	}
 
@@ -224,8 +223,7 @@ static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
 	 * found in the backlight node, the mode switches to PWM mode.
 	 */
 	pdata->dimming_mode = DIMMING_ANALOG_I2C;
-	prop_pwms = of_find_property(node, "pwms", &length);
-	if (prop_pwms) {
+	if (device_property_present(dev, "pwms")) {
 		chip->pwmd = devm_pwm_get(chip->dev, NULL);
 		if (IS_ERR(chip->pwmd))
 			return dev_err_probe(chip->dev, PTR_ERR(chip->pwmd),
@@ -257,11 +255,9 @@ static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
 		/*
 		 * PWM control mode: check for brightness level in DT
 		 */
-		prop_levels = of_find_property(node, "brightness-levels",
-					       &length);
-		if (prop_levels) {
+		if (device_property_present(dev, "brightness-levels")) {
 			/* Read brightness levels from DT */
-			num_levels = length / sizeof(u32);
+			num_levels = device_property_count_u32(dev, "brightness-levels");
 			if (num_levels < 2)
 				return -EINVAL;
 		} else {
@@ -275,10 +271,9 @@ static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
 				     sizeof(*pdata->levels), GFP_KERNEL);
 	if (!pdata->levels)
 		return -ENOMEM;
-	if (prop_levels) {
-		ret = of_property_read_u32_array(node, "brightness-levels",
-						 pdata->levels,
-						 num_levels);
+	if (device_property_present(dev, "brightness-levels")) {
+		ret = device_property_read_u32_array(dev, "brightness-levels",
+						     pdata->levels, num_levels);
 		if (ret < 0)
 			return ret;
 	} else {
@@ -288,8 +283,7 @@ static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
 
 	pdata->max_brightness = num_levels - 1;
 
-	ret = of_property_read_u32(node, "default-brightness",
-				   &pdata->default_brightness);
+	ret = device_property_read_u32(dev, "default-brightness", &pdata->default_brightness);
 	if (ret)
 		pdata->default_brightness = pdata->max_brightness;
 	if (pdata->default_brightness > pdata->max_brightness) {
@@ -310,8 +304,8 @@ static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
 	 * If missing, the default value for OVP is 35.5V
 	 */
 	pdata->over_voltage_protection = REG_I2C_1_OVP1;
-	if (!of_property_read_u32(node, "mps,overvoltage-protection-microvolt",
-				  &tmp_value)) {
+	ret = device_property_read_u32(dev, "mps,overvoltage-protection-microvolt", &tmp_value);
+	if (!ret) {
 		switch (tmp_value) {
 		case 13500000:
 			pdata->over_voltage_protection = 0x00;
@@ -328,9 +322,7 @@ static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
 	}
 
 	/* Synchronous (default) and non-synchronous mode */
-	pdata->sync_mode = true;
-	if (of_property_read_bool(node, "mps,no-sync-mode"))
-		pdata->sync_mode = false;
+	pdata->sync_mode = !device_property_read_bool(dev, "mps,no-sync-mode");
 
 	return 0;
 }
@@ -366,7 +358,7 @@ static int mp3309c_probe(struct i2c_client *client)
 		if (!pdata)
 			return -ENOMEM;
 
-		ret = pm3309c_parse_dt_node(chip, pdata);
+		ret = mp3309c_parse_fwnode(chip, pdata);
 		if (ret)
 			return ret;
 	}
-- 
2.43.0.rc1.1.gbec44491f096

