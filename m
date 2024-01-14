Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C027A82D0F4
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jan 2024 15:39:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E5410E0F3;
	Sun, 14 Jan 2024 14:39:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB93710E0F3
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jan 2024 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705243169; x=1736779169;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LjxdR67V7tYCeQiHxVhdjSjgVoL8PIzrrKcwukyWZSQ=;
 b=bHiVIyaxqn5zchZJRwUil3pdPQDQkc4yCB90AZmib0pnwh4D68yC8YJ5
 uCtFqEcRkAw2BFjsyFXu8E93UrShpi+SGuJo48yGnG74gfha8uj1fiJx7
 +gO/6fFwodzUyA4WPVOu9EYsiirYlLSPfk4tRGVzqeKK/N0K1eqrVBIVN
 XEDEwlTalymAMHo4hz4qrN2jpC6FUU1bCF72chIELVb5cuVET5JFXnZdW
 PTDT+Wp0c4EEOBzvc68tVy45jqPwo8cr5AvHFaYRrXzrL0Mi+s8ezgeV6
 ZfGQ8/pLP3hguuCSpLVbioyI9I02LmCrinM9H9TTn5vprLZs88jICi9Qr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="465845315"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; d="scan'208";a="465845315"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2024 06:39:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="1114692658"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; d="scan'208";a="1114692658"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga005.fm.intel.com with ESMTP; 14 Jan 2024 06:39:26 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 839D72AC; Sun, 14 Jan 2024 16:39:25 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] backlight: hx8357: Fix potential NULL pointer
 dereference
Date: Sun, 14 Jan 2024 16:39:21 +0200
Message-ID: <20240114143921.550736-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
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
 Helge Deller <deller@gmx.de>, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "im" pins are optional. Add missing check in the hx8357_probe().

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/642e1230-3358-4006-a17f-3f297897ae74@moroto.mountain
Fixes: 7d84a63a39b7 ("backlight: hx8357: Convert to agnostic GPIO API")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/backlight/hx8357.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/hx8357.c b/drivers/video/backlight/hx8357.c
index d7298376cf74..bf18337ff0c2 100644
--- a/drivers/video/backlight/hx8357.c
+++ b/drivers/video/backlight/hx8357.c
@@ -609,11 +609,13 @@ static int hx8357_probe(struct spi_device *spi)
 	lcd->im_pins = devm_gpiod_get_array_optional(dev, "im", GPIOD_OUT_LOW);
 	if (IS_ERR(lcd->im_pins))
 		return dev_err_probe(dev, PTR_ERR(lcd->im_pins), "failed to request im GPIOs\n");
-	if (lcd->im_pins->ndescs < HX8357_NUM_IM_PINS)
-		return dev_err_probe(dev, -EINVAL, "not enough im GPIOs\n");
+	if (lcd->im_pins) {
+		if (lcd->im_pins->ndescs < HX8357_NUM_IM_PINS)
+			return dev_err_probe(dev, -EINVAL, "not enough im GPIOs\n");
 
-	for (i = 0; i < HX8357_NUM_IM_PINS; i++)
-		gpiod_set_consumer_name(lcd->im_pins->desc[i], "im_pins");
+		for (i = 0; i < HX8357_NUM_IM_PINS; i++)
+			gpiod_set_consumer_name(lcd->im_pins->desc[i], "im_pins");
+	}
 
 	lcdev = devm_lcd_device_register(&spi->dev, "mxsfb", &spi->dev, lcd,
 					&hx8357_ops);
-- 
2.43.0.rc1.1.gbec44491f096

