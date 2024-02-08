Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC85284E7DC
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 19:43:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A10910EA08;
	Thu,  8 Feb 2024 18:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f50REISC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C246D10EA03
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 18:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707417801; x=1738953801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ksPh+SGOZxTsk3yoazHWC1sh6u7Hvs7YFo8izy4mpuk=;
 b=f50REISCgswQaoH4JRP7oaH0Qdzwtla/4AqEi1wKSryoTLykPpnC1pS4
 Da4JOcHLGZqYHmPFPd1SndrsQ/ANgFy2LlB9APS6jToGxpTwDTLBHScKq
 h5Eyc3MZVyvsaj1SMbITfI27QARaNqgHEtPKd8NdTD03kPeqERC6o6Git
 jrwfFskc+1H3HdtJp3kauTOiFsGNZBPngEXOVAQUoPnnVn0eeEJKQgymv
 WBdsCO7tNPJlQFFYiZRhBBgpvOZqIMulfvvjugLZ6S44mJc5Y8rcBe7VW
 EGg5Etz7kGRD4lfO89cjvCoCfcfcSRR1nf9oskPGOKIi3JbSDFQBKv/C+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1184684"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1184684"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 10:43:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="934213722"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="934213722"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 08 Feb 2024 10:43:17 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 46BB213C; Thu,  8 Feb 2024 20:43:16 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Daniel Thompson <daniel.thompson@linaro.org>,
 Flavio Suligoi <f.suligoi@asem.it>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH v3 3/3] backlight: mp3309c: Utilise temporary variable for
 struct device
Date: Thu,  8 Feb 2024 20:42:28 +0200
Message-ID: <20240208184313.2224579-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20240208184313.2224579-1-andriy.shevchenko@linux.intel.com>
References: <20240208184313.2224579-1-andriy.shevchenko@linux.intel.com>
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

We have a temporary variable to keep pointer to struct device.
Utilise it where it makes sense.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Tested-by: Flavio Suligoi <f.suligoi@asem.it>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/backlight/mp3309c.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/mp3309c.c
index 426e9f2356ad..708c053d492c 100644
--- a/drivers/video/backlight/mp3309c.c
+++ b/drivers/video/backlight/mp3309c.c
@@ -222,10 +222,9 @@ static int mp3309c_parse_fwnode(struct mp3309c_chip *chip,
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
@@ -243,11 +242,9 @@ static int mp3309c_parse_fwnode(struct mp3309c_chip *chip,
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
@@ -265,8 +262,7 @@ static int mp3309c_parse_fwnode(struct mp3309c_chip *chip,
 	}
 
 	/* Fill brightness levels array */
-	pdata->levels = devm_kcalloc(chip->dev, num_levels,
-				     sizeof(*pdata->levels), GFP_KERNEL);
+	pdata->levels = devm_kcalloc(dev, num_levels, sizeof(*pdata->levels), GFP_KERNEL);
 	if (!pdata->levels)
 		return -ENOMEM;
 	if (device_property_present(dev, "brightness-levels")) {
@@ -336,21 +332,21 @@ static int mp3309c_probe(struct i2c_client *client)
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return dev_err_probe(dev, -EOPNOTSUPP, "failed to check i2c functionality\n");
 
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
 
@@ -367,11 +363,10 @@ static int mp3309c_probe(struct i2c_client *client)
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
@@ -383,8 +378,7 @@ static int mp3309c_probe(struct i2c_client *client)
 		pwmstate.enabled = true;
 		ret = pwm_apply_might_sleep(chip->pwmd, &pwmstate);
 		if (ret)
-			return dev_err_probe(chip->dev, ret,
-					     "error setting pwm device\n");
+			return dev_err_probe(dev, ret, "error setting pwm device\n");
 	}
 
 	chip->pdata->status = FIRST_POWER_ON;
-- 
2.43.0.rc1.1.gbec44491f096

