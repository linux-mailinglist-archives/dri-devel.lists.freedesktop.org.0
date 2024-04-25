Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 716148B240A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 16:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984AA11A4A6;
	Thu, 25 Apr 2024 14:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aUk8p6uN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E963711A4A7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 14:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714055232; x=1745591232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yCTUM4VsZP0XLCbKY2nqBkSXSRXgEYSN4aDZAwo5Ukk=;
 b=aUk8p6uNGVnWvjaAqga0S5kioG1/JbNdq+F743C0WFdO+3GFYr4z/hyc
 Qv+xYcbS4IVzOYE0YkKE5gkry9MpnfXqRn+S+t85PFTUD8l6oCP4YktjS
 ceBaV+oGM1i1rix78Io5okhH/n5FpKmC06uEimVj/WWcFdUOQ4IRJw/Qq
 o6LtkvKdTZ78ioQZVyqyqjtitk2NTRHCkUXW2niFOTJiY7uAE2q3m3OGc
 KAAHoOA0nltaaVA6Y0zfISLod8Z2BoYivFHpYU2mKKvnyaj1fqwy6S8Mo
 gupSMaPGeJPMLfCyT7jzLeEooxriFu0sqhUlqSp4EBzjEctYfXwVzotOw g==;
X-CSE-ConnectionGUID: +0LKAg28SgGYetd9vWwfIQ==
X-CSE-MsgGUID: kRjPJ1hESDKVfm6dVG2kYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="10281355"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="10281355"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 07:27:11 -0700
X-CSE-ConnectionGUID: TtSjRNFfSuaq2PIeMrhhNA==
X-CSE-MsgGUID: QIpqLtBDQr+fLUQUN0w7mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="29555176"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa003.fm.intel.com with ESMTP; 25 Apr 2024 07:27:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 0BCD3F4; Thu, 25 Apr 2024 17:27:06 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 1/3] drm/panel: ili9341: Correct use of device property APIs
Date: Thu, 25 Apr 2024 17:26:17 +0300
Message-ID: <20240425142706.2440113-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240425142706.2440113-1-andriy.shevchenko@linux.intel.com>
References: <20240425142706.2440113-1-andriy.shevchenko@linux.intel.com>
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

It seems driver missed the point of proper use of device property APIs.
Correct this by updating headers and calls respectively.

Fixes: 5a04227326b0 ("drm/panel: Add ilitek ili9341 panel driver")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/panel/Kconfig                | 2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index e54f6f5604ed..2d4515555820 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -177,7 +177,7 @@ config DRM_PANEL_ILITEK_IL9322
 
 config DRM_PANEL_ILITEK_ILI9341
 	tristate "Ilitek ILI9341 240x320 QVGA panels"
-	depends on OF && SPI
+	depends on SPI
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	depends on BACKLIGHT_CLASS_DEVICE
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
index 3574681891e8..7584ddb0e441 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
@@ -22,8 +22,9 @@
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
 
@@ -691,7 +692,7 @@ static int ili9341_dpi_probe(struct spi_device *spi, struct gpio_desc *dc,
 	 * Every new incarnation of this display must have a unique
 	 * data entry for the system in this driver.
 	 */
-	ili->conf = of_device_get_match_data(dev);
+	ili->conf = device_get_match_data(dev);
 	if (!ili->conf) {
 		dev_err(dev, "missing device configuration\n");
 		return -ENODEV;
-- 
2.43.0.rc1.1336.g36b5255a03ac

