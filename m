Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A652382D134
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jan 2024 16:28:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA8910E1A4;
	Sun, 14 Jan 2024 15:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F7610E19A
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jan 2024 15:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705246086; x=1736782086;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HHwu/+ttKG6+gQ16tPnQoTnLOBcKuPt3xGBj8B08rW8=;
 b=bdal4+9Or/QCw79ZhjVqKKzYuMeaGhBB7/5FZthXJ8aHHINXxWAMROl6
 U8G8I7a39236HUgpXrF4/2tJfDqy6yFarUzx/ZWgt1E4y9Z6dGbUP5wdY
 AxEnCie75Fc69YmuZ2CGk9PsznqG9jiXBqJOvRHjTTXuuJ8xK9MLQuaGE
 XdE66igQXJeIL4dGaF+fmW6G7lU3PZniafDEV/AJKkVEKJEsx7TnlvcIV
 XMoMh3d/oVgxe4Uk4cF061upfln6Inoojlsw+lxjhjQn9qLvv6Jj7FqPj
 4XWKlyNFCggaVbUSqr1/Cp2yKSYb6Z069edCEQqjvySxz1eby6TOr81Gr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="6829683"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="6829683"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2024 07:28:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="956601547"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; d="scan'208";a="956601547"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga005.jf.intel.com with ESMTP; 14 Jan 2024 07:28:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 4D3D039B; Sun, 14 Jan 2024 17:28:02 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/4] backlight: hx8357: Utilise temporary variable for
 struct device
Date: Sun, 14 Jan 2024 17:25:11 +0200
Message-ID: <20240114152759.1040563-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20240114152759.1040563-1-andriy.shevchenko@linux.intel.com>
References: <20240114152759.1040563-1-andriy.shevchenko@linux.intel.com>
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
Utilise it inside the ->probe() implementation.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/backlight/hx8357.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/hx8357.c b/drivers/video/backlight/hx8357.c
index fbe02fd73272..e4dc76f25f8e 100644
--- a/drivers/video/backlight/hx8357.c
+++ b/drivers/video/backlight/hx8357.c
@@ -574,7 +574,7 @@ static int hx8357_probe(struct spi_device *spi)
 	hx8357_init init;
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

