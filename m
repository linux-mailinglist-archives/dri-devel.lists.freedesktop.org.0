Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E544845B49
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 16:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AB210F0E5;
	Thu,  1 Feb 2024 15:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nvwjmWx9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C55E10EFD6
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 15:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706800909; x=1738336909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WQWD/KmFc0zx5MOPqiRy9ksCicyxu+6xfyIr/wR/bkY=;
 b=nvwjmWx9PGRKI1zvShK8l1eXlj5P0OPZmO4PZWQRcR2iGOK9yX2W6m8d
 w0ReZGcaulfKfcDKLcusKfhZ9I1bvme3TZRsYYZJXziOABb/xh0lUC3e+
 hR/2rX5GQfoFwn5PxmS019XtEjRe/s+zBNGN2UEbuKYNwtBwDzS5IR807
 yrJffSEn36JaI8YiWy4kfZcPvKDNIjBlbPfh4I6Zx4sm54fq8Nm+9gJR8
 8A9VhLsd4HqTq07kB63JJj039aAvz9/S1KlRaKuJWXxbdfTlZogr+X96O
 KRHUgtgG3+0q0MBK+qektJl/3ErF6ZiZDFyJdj0SJtyriez2iH93NG9J8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="402762435"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="402762435"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 07:21:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="788953700"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="788953700"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga002.jf.intel.com with ESMTP; 01 Feb 2024 07:21:41 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id D646EC07; Thu,  1 Feb 2024 17:15:42 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Flavio Suligoi <f.suligoi@asem.it>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: [PATCH v2 2/3] backlight: mp3309c: use dev_err_probe() instead of
 dev_err()
Date: Thu,  1 Feb 2024 17:14:14 +0200
Message-ID: <20240201151537.367218-3-andriy.shevchenko@linux.intel.com>
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

Replace dev_err() with dev_err_probe().

This helps in simplifing code and standardizing the error output.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/backlight/mp3309c.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/mp3309c.c
index 762bd738c903..2d6bd1a180b3 100644
--- a/drivers/video/backlight/mp3309c.c
+++ b/drivers/video/backlight/mp3309c.c
@@ -208,10 +208,8 @@ static int mp3309c_parse_fwnode(struct mp3309c_chip *chip,
 	unsigned int num_levels, tmp_value;
 	struct device *dev = chip->dev;
 
-	if (!dev_fwnode(dev)) {
-		dev_err(dev, "failed to get firmware node\n");
-		return -ENODEV;
-	}
+	if (!dev_fwnode(dev))
+		return dev_err_probe(dev, -ENODEV, "failed to get firmware node\n");
 
 	/*
 	 * Dimming mode: the MP3309C provides two dimming control mode:
@@ -287,8 +285,7 @@ static int mp3309c_parse_fwnode(struct mp3309c_chip *chip,
 	if (ret)
 		pdata->default_brightness = pdata->max_brightness;
 	if (pdata->default_brightness > pdata->max_brightness) {
-		dev_err(chip->dev,
-			"default brightness exceeds max brightness\n");
+		dev_err_probe(dev, -ERANGE, "default brightness exceeds max brightness\n");
 		pdata->default_brightness = pdata->max_brightness;
 	}
 
@@ -329,16 +326,15 @@ static int mp3309c_parse_fwnode(struct mp3309c_chip *chip,
 
 static int mp3309c_probe(struct i2c_client *client)
 {
-	struct mp3309c_platform_data *pdata = dev_get_platdata(&client->dev);
+	struct device *dev = &client->dev;
+	struct mp3309c_platform_data *pdata = dev_get_platdata(dev);
 	struct mp3309c_chip *chip;
 	struct backlight_properties props;
 	struct pwm_state pwmstate;
 	int ret;
 
-	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
-		dev_err(&client->dev, "failed to check i2c functionality\n");
-		return -EOPNOTSUPP;
-	}
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+		return dev_err_probe(dev, -EOPNOTSUPP, "failed to check i2c functionality\n");
 
 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
-- 
2.43.0.rc1.1.gbec44491f096

