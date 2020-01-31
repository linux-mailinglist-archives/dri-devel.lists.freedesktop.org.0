Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C3D150255
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 09:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9726EB4A;
	Mon,  3 Feb 2020 08:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B226E9FF
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 20:52:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 12:52:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,387,1574150400"; d="scan'208";a="230366410"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga003.jf.intel.com with ESMTP; 31 Jan 2020 12:52:35 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 4024710E; Fri, 31 Jan 2020 22:52:32 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: 
Subject: [PATCH v2 3/4] drm/tiny/st7735r: Make driver OF-independent
Date: Fri, 31 Jan 2020 22:49:26 +0200
Message-Id: <20200131204923.48928-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200131204923.48928-1-andriy.shevchenko@linux.intel.com>
References: <20200131204923.48928-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 03 Feb 2020 08:10:41 +0000
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
Cc: David Lechner <david@lechnology.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1162668266=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1162668266==
Content-Transfer-Encoding: 8bit

There is one OF call in the driver that limits its area of use.
Replace it to generic device_get_match_data() and get rid of OF dependency.

Cc: Noralf Trønnes <noralf@tronnes.org>
Cc: dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: David Lechner <david@lechnology.com>
---
v2: Add tag (David)
 drivers/gpu/drm/tiny/st7735r.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735r.c
index 32574f1b6071..a844cde6d14a 100644
--- a/drivers/gpu/drm/tiny/st7735r.c
+++ b/drivers/gpu/drm/tiny/st7735r.c
@@ -12,7 +12,6 @@
 #include <linux/dma-buf.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/property.h>
 #include <linux/spi/spi.h>
 #include <video/mipi_display.h>
@@ -192,7 +191,7 @@ static int st7735r_probe(struct spi_device *spi)
 	u32 rotation = 0;
 	int ret;
 
-	cfg = of_device_get_match_data(&spi->dev);
+	cfg = device_get_match_data(&spi->dev);
 	if (!cfg)
 		cfg = (void *)spi_get_device_id(spi)->driver_data;
 
-- 
2.24.1


--===============1162668266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1162668266==--
