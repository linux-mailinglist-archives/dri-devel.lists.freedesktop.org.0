Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAB0145357
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 12:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD87E6F4A1;
	Wed, 22 Jan 2020 11:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47A56F49E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 10:54:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 02:54:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,349,1574150400"; d="scan'208";a="221203001"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga007.fm.intel.com with ESMTP; 22 Jan 2020 02:54:05 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 37ACA202; Wed, 22 Jan 2020 12:54:03 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, David Lechner <david@lechnology.com>
Subject: [PATCH v1 1/4] drm/tiny/repaper: Make driver OF-independent
Date: Wed, 22 Jan 2020 12:54:00 +0200
Message-Id: <20200122105403.30035-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Jan 2020 11:01:18 +0000
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is one OF call in the driver that limits its area of use.
Replace it to generic device_get_match_data() and get rid of OF dependency.

While here, cast SPI driver data to certain enumerator type.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/tiny/repaper.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 76d179200775..fd9e95ce3201 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -17,7 +17,7 @@
 #include <linux/dma-buf.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/property.h>
 #include <linux/sched/clock.h>
 #include <linux/spi/spi.h>
 #include <linux/thermal.h>
@@ -40,6 +40,7 @@
 #define REPAPER_RID_G2_COG_ID	0x12
 
 enum repaper_model {
+	EXXXXCSXXX = 0,
 	E1144CS021 = 1,
 	E1190CS021,
 	E2200CS021,
@@ -995,21 +996,21 @@ static int repaper_probe(struct spi_device *spi)
 {
 	const struct drm_display_mode *mode;
 	const struct spi_device_id *spi_id;
-	const struct of_device_id *match;
 	struct device *dev = &spi->dev;
 	enum repaper_model model;
 	const char *thermal_zone;
 	struct repaper_epd *epd;
 	size_t line_buffer_size;
 	struct drm_device *drm;
+	const void *match;
 	int ret;
 
-	match = of_match_device(repaper_of_match, dev);
+	match = device_get_match_data(dev);
 	if (match) {
-		model = (enum repaper_model)match->data;
+		model = (enum repaper_model)match;
 	} else {
 		spi_id = spi_get_device_id(spi);
-		model = spi_id->driver_data;
+		model = (enum repaper_model)spi_id->driver_data;
 	}
 
 	/* The SPI device is used to allocate dma memory */
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
