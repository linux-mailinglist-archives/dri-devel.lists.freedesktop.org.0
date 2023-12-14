Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4DF813B08
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 20:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC2F10E2ED;
	Thu, 14 Dec 2023 19:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03C110E267
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 19:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702583524; x=1734119524;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nWgBKkqOPVZ1btEabLpBwS/CVWtFEFO8tlhGUqIl0x8=;
 b=NvcwAv5NdFJtwo/306WSTxaTnvM14Xo1oGVCsqFqhWX8PQRycgi9Jku/
 b4EBnnYQN71drRcahKPGZ83Tg2OgbIR13RTt2NRKWserjaxsf1ZoTOeQ2
 ly48egYH8s8WE7fg3xbDwXhljOoMx0YCE2XMcCjexuCPDD8gdVOmryCl+
 p1YHtlqMCByZ9zRpN8yLsc1ZJrMXUXCH5f75aXhP9g4NpO1F2BvA9Mbsd
 qedDyaWo3rG7/W8OsybGILjr1ky6DQn/fRKc5mKHucmy5BqkQlCmBWluA
 WqIM6vouiDCVuQhbZdJNCPiJ7EkXLIzhXZhJzHXc8UmOc3GjGVX6tziv2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="394047220"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="394047220"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 11:52:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="778006682"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="778006682"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga007.fm.intel.com with ESMTP; 14 Dec 2023 11:52:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 8540F44F; Thu, 14 Dec 2023 21:51:59 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Flavio Suligoi <f.suligoi@asem.it>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] backlight: mp3309c: Utilise temporary variable for
 struct device
Date: Thu, 14 Dec 2023 21:51:14 +0200
Message-ID: <20231214195158.1335727-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231214195158.1335727-1-andriy.shevchenko@linux.intel.com>
References: <20231214195158.1335727-1-andriy.shevchenko@linux.intel.com>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee@kernel.org>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have a temporary variable to keep pointer to struct device.
Utilise it where it makes sense.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/backlight/mp3309c.c | 38 +++++++++++++------------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/mp3309c.c
index d9b08f191999..57eb1bcc054d 100644
--- a/drivers/video/backlight/mp3309c.c
+++ b/drivers/video/backlight/mp3309c.c
@@ -224,10 +224,9 @@ static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
 	 */
 	pdata->dimming_mode = DIMMING_ANALOG_I2C;
 	if (device_property_present(dev, "pwms")) {
-		chip->pwmd = devm_pwm_get(chip->dev, NULL);
+		chip->pwmd = devm_pwm_get(dev, NULL);
 		if (IS_ERR(chip->pwmd))
-			return dev_err_probe(chip->dev, PTR_ERR(chip->pwmd),
-					     "error getting pwm data\n");
+			return dev_err_probe(dev, PTR_ERR(chip->pwmd), "error getting pwm data\n");
 		pdata->dimming_mode = DIMMING_PWM;
 		pwm_apply_args(chip->pwmd);
 	}
@@ -245,11 +244,9 @@ static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
 		num_levels = ANALOG_I2C_NUM_LEVELS;
 
 		/* Enable GPIO used in I2C dimming mode only */
-		chip->enable_gpio = devm_gpiod_get(chip->dev, "enable",
-						   GPIOD_OUT_HIGH);
+		chip->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
 		if (IS_ERR(chip->enable_gpio))
-			return dev_err_probe(chip->dev,
-					     PTR_ERR(chip->enable_gpio),
+			return dev_err_probe(dev, PTR_ERR(chip->enable_gpio),
 					     "error getting enable gpio\n");
 	} else {
 		/*
@@ -267,8 +264,7 @@ static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
 	}
 
 	/* Fill brightness levels array */
-	pdata->levels = devm_kcalloc(chip->dev, num_levels,
-				     sizeof(*pdata->levels), GFP_KERNEL);
+	pdata->levels = devm_kcalloc(dev, num_levels, sizeof(*pdata->levels), GFP_KERNEL);
 	if (!pdata->levels)
 		return -ENOMEM;
 	if (device_property_present(dev, "brightness-levels")) {
@@ -287,8 +283,7 @@ static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
 	if (ret)
 		pdata->default_brightness = pdata->max_brightness;
 	if (pdata->default_brightness > pdata->max_brightness) {
-		dev_err(chip->dev,
-			"default brightness exceeds max brightness\n");
+		dev_err(dev, "default brightness exceeds max brightness\n");
 		pdata->default_brightness = pdata->max_brightness;
 	}
 
@@ -329,32 +324,33 @@ static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
 
 static int mp3309c_probe(struct i2c_client *client)
 {
-	struct mp3309c_platform_data *pdata = dev_get_platdata(&client->dev);
+	struct device *dev = &client->dev;
+	struct mp3309c_platform_data *pdata = dev_get_platdata(dev);
 	struct mp3309c_chip *chip;
 	struct backlight_properties props;
 	struct pwm_state pwmstate;
 	int ret;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
-		dev_err(&client->dev, "failed to check i2c functionality\n");
+		dev_err(dev, "failed to check i2c functionality\n");
 		return -EOPNOTSUPP;
 	}
 
-	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
-	chip->dev = &client->dev;
+	chip->dev = dev;
 
 	chip->regmap = devm_regmap_init_i2c(client, &mp3309c_regmap);
 	if (IS_ERR(chip->regmap))
-		return dev_err_probe(&client->dev, PTR_ERR(chip->regmap),
+		return dev_err_probe(dev, PTR_ERR(chip->regmap),
 				     "failed to allocate register map\n");
 
 	i2c_set_clientdata(client, chip);
 
 	if (!pdata) {
-		pdata = devm_kzalloc(chip->dev, sizeof(*pdata), GFP_KERNEL);
+		pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 		if (!pdata)
 			return -ENOMEM;
 
@@ -371,11 +367,10 @@ static int mp3309c_probe(struct i2c_client *client)
 	props.type = BACKLIGHT_RAW;
 	props.power = FB_BLANK_UNBLANK;
 	props.fb_blank = FB_BLANK_UNBLANK;
-	chip->bl = devm_backlight_device_register(chip->dev, "mp3309c",
-						  chip->dev, chip,
+	chip->bl = devm_backlight_device_register(dev, "mp3309c", dev, chip,
 						  &mp3309c_bl_ops, &props);
 	if (IS_ERR(chip->bl))
-		return dev_err_probe(chip->dev, PTR_ERR(chip->bl),
+		return dev_err_probe(dev, PTR_ERR(chip->bl),
 				     "error registering backlight device\n");
 
 	/* In PWM dimming mode, enable pwm device */
@@ -387,8 +382,7 @@ static int mp3309c_probe(struct i2c_client *client)
 		pwmstate.enabled = true;
 		ret = pwm_apply_state(chip->pwmd, &pwmstate);
 		if (ret)
-			return dev_err_probe(chip->dev, ret,
-					     "error setting pwm device\n");
+			return dev_err_probe(dev, ret, "error setting pwm device\n");
 	}
 
 	chip->pdata->status = FIRST_POWER_ON;
-- 
2.43.0.rc1.1.gbec44491f096

