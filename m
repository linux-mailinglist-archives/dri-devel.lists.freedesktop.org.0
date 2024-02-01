Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1677845AE2
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 16:06:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5931510EEFC;
	Thu,  1 Feb 2024 15:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I8p3fpwc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351B010EEFB
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 15:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706800008; x=1738336008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/1j+vi+oEj44XXlvg/40fPSK2wRNZe9074gxBAtD/qk=;
 b=I8p3fpwcGb4nvXfIcautA2rhVHK34rc4PWqp6DQGmGYiBS2/05vVHxdP
 OYZdukDY3B9dJ3oJwyNbI/1m7AiqHPYjLw0mKwekNj3T/F7VW6eG5gZnW
 KRsKJ2LorUlwUcdtXeoULkcy92T/kVzgKrE9eenPUUPg5JcYAzjOxvIcO
 784sF45Ll2asmhTV65CLE5VemTdVT9joI1EjBQ7/QZ9G599Zw2cXohuHx
 rrqYrelumSTxev7Ytjz+Gf3RvUQQXVisml4kF0DwABScvUZMnU+9MT91F
 jQjptN/7Ps4CerD/xqq2844ngEoxfmGElqFaz2yHF9tcGVca/Q6e/woj/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="403525492"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="403525492"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 07:06:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="859168147"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="859168147"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga004.fm.intel.com with ESMTP; 01 Feb 2024 07:06:41 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 0E35EB84; Thu,  1 Feb 2024 16:49:53 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH v2 3/4] backlight: hx8357: Make use of dev_err_probe()
Date: Thu,  1 Feb 2024 16:47:44 +0200
Message-ID: <20240201144951.294215-4-andriy.shevchenko@linux.intel.com>
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

Simplify the error handling in probe function by switching from
dev_err() to dev_err_probe().

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/backlight/hx8357.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/video/backlight/hx8357.c b/drivers/video/backlight/hx8357.c
index 81d0984e9d8b..70a62755805a 100644
--- a/drivers/video/backlight/hx8357.c
+++ b/drivers/video/backlight/hx8357.c
@@ -579,10 +579,8 @@ static int hx8357_probe(struct spi_device *spi)
 		return -ENOMEM;
 
 	ret = spi_setup(spi);
-	if (ret < 0) {
-		dev_err(&spi->dev, "SPI setup failed.\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "SPI setup failed.\n");
 
 	lcd->spi = spi;
 
@@ -617,10 +615,8 @@ static int hx8357_probe(struct spi_device *spi)
 	hx8357_lcd_reset(lcdev);
 
 	ret = init_fn(lcdev);
-	if (ret) {
-		dev_err(&spi->dev, "Couldn't initialize panel\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Couldn't initialize panel\n");
 
 	dev_info(&spi->dev, "Panel probed\n");
 
-- 
2.43.0.rc1.1.gbec44491f096

