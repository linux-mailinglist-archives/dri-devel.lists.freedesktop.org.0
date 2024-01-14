Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E31582D12F
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jan 2024 16:28:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9924510E19A;
	Sun, 14 Jan 2024 15:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A2A10E19A
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jan 2024 15:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705246086; x=1736782086;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KtcwDtLKAtATSufVVVCnn6c5MCnYP7WhV++Dk6UXa9k=;
 b=ckinumpFhwxTkOislgLJFJ1+mMh68+xH7M8mGamlAvDpBRxit4sznmPi
 X+PX8+Ds5QkAL1EL9QbcnDzOfZU1pj0YhtygLvOQQo6BSrO12q9ZFtppF
 3k3Ufm7Pmj6woIGZP12C5Wmq1ivS9/vnXXOsZwSKppnvOp0f1kQZGRHbD
 KSG3eZ7gr6CSCk+Xn1KYvBWvxoyvHF76mW2Tz4T45SEjmAptYZpVok9r/
 6Nw7DXeFMSZ9/68+VoQttEiSWqHlHasd/KcYv8NhLTtUCcToBpqHKEdPt
 OcmxyFyH/MeJGFPu5xz7DHpOK2KJmMYFQ7faC6VjJjukCExD+zZDrI5ju w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="12835870"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; d="scan'208";a="12835870"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2024 07:28:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="1030429355"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; d="scan'208";a="1030429355"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga006.fm.intel.com with ESMTP; 14 Jan 2024 07:28:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 47AC83EA; Sun, 14 Jan 2024 17:28:02 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/4] backlight: hx8357: Make use of dev_err_probe()
Date: Sun, 14 Jan 2024 17:25:10 +0200
Message-ID: <20240114152759.1040563-4-andriy.shevchenko@linux.intel.com>
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

Simplify the error handling in probe function by switching from
dev_err() to dev_err_probe().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/backlight/hx8357.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/video/backlight/hx8357.c b/drivers/video/backlight/hx8357.c
index 8709d9141cfb..fbe02fd73272 100644
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
 
 	ret = init(lcdev);
-	if (ret) {
-		dev_err(&spi->dev, "Couldn't initialize panel\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Couldn't initialize panel\n");
 
 	dev_info(&spi->dev, "Panel probed\n");
 
-- 
2.43.0.rc1.1.gbec44491f096

