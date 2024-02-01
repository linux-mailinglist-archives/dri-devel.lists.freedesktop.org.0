Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 788F9845ADF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 16:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E2D10EEF9;
	Thu,  1 Feb 2024 15:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kgws7JnP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1642910EEFC
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 15:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706800008; x=1738336008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=owxSNrvDkg3gD50cec2iQ+m3WCWKt4TbmkW4j3XR5ow=;
 b=kgws7JnPe/RF+UQBRMtWjf4HKrCKq1Rl5r2IuGzgeYc20dcTQtvNF0N5
 N5NoKdfofY1/ifcFrCTbqX5pQAOcic8NetLqkhBJZEXGzpFHrbHqgHPv5
 qpUPrRUppLpQB4O4OrdTvcStcJj8oYCAAQV87pkSzF9yhkdP9lLNNYMr9
 hQ04Cm0MgzUS014mf9QgSazVIzYszz+qjFfuf8Lev8vGA+WDVhp01Aq0/
 K3TawIWYc58WCyAgDK9H5WZb4RCuplVVfVcpJtCS9FLC1vptyQ3cymaDE
 +vHEYPFNz2Dx+hBHMqqCcmv54w178Er7v8LrG9puTvTataOQOlvtnyw83 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="403525486"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="403525486"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 07:06:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="859168148"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="859168148"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga004.fm.intel.com with ESMTP; 01 Feb 2024 07:06:41 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 19175BA3; Thu,  1 Feb 2024 16:49:53 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH v2 4/4] backlight: hx8357: Utilise temporary variable for
 struct device
Date: Thu,  1 Feb 2024 16:47:45 +0200
Message-ID: <20240201144951.294215-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20240201144951.294215-1-andriy.shevchenko@linux.intel.com>
References: <20240201144951.294215-1-andriy.shevchenko@linux.intel.com>
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
Utilise it inside the ->probe() implementation.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/backlight/hx8357.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/hx8357.c b/drivers/video/backlight/hx8357.c
index 70a62755805a..339d9128fbde 100644
--- a/drivers/video/backlight/hx8357.c
+++ b/drivers/video/backlight/hx8357.c
@@ -574,7 +574,7 @@ static int hx8357_probe(struct spi_device *spi)
 	hx8357_init_fn init_fn;
 	int i, ret;
 
-	lcd = devm_kzalloc(&spi->dev, sizeof(*lcd), GFP_KERNEL);
+	lcd = devm_kzalloc(dev, sizeof(*lcd), GFP_KERNEL);
 	if (!lcd)
 		return -ENOMEM;
 
@@ -604,8 +604,7 @@ static int hx8357_probe(struct spi_device *spi)
 			gpiod_set_consumer_name(lcd->im_pins->desc[i], "im_pins");
 	}
 
-	lcdev = devm_lcd_device_register(&spi->dev, "mxsfb", &spi->dev, lcd,
-					&hx8357_ops);
+	lcdev = devm_lcd_device_register(dev, "mxsfb", dev, lcd, &hx8357_ops);
 	if (IS_ERR(lcdev)) {
 		ret = PTR_ERR(lcdev);
 		return ret;
@@ -618,7 +617,7 @@ static int hx8357_probe(struct spi_device *spi)
 	if (ret)
 		return dev_err_probe(dev, ret, "Couldn't initialize panel\n");
 
-	dev_info(&spi->dev, "Panel probed\n");
+	dev_info(dev, "Panel probed\n");
 
 	return 0;
 }
-- 
2.43.0.rc1.1.gbec44491f096

