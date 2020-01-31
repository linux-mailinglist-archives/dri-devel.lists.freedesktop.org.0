Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D16F315024E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 09:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70ED06EB42;
	Mon,  3 Feb 2020 08:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA1B6E9FF
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 20:51:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 12:51:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,387,1574150400"; d="scan'208";a="223714866"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga007.fm.intel.com with ESMTP; 31 Jan 2020 12:51:01 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 9013910E; Fri, 31 Jan 2020 22:50:59 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: 
Subject: [PATCH v2 1/4] drm/tiny/repaper: Make driver OF-independent
Date: Fri, 31 Jan 2020 22:49:22 +0200
Message-Id: <20200131204923.48928-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
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
Content-Type: multipart/mixed; boundary="===============1136364712=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1136364712==
Content-Transfer-Encoding: 8bit

There is one OF call in the driver that limits its area of use.
Replace it to generic device_get_match_data() and get rid of OF dependency.

While here, cast SPI driver data to certain enumerator type.

Cc: Noralf Trønnes <noralf@tronnes.org>
Cc: dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Lechner <david@lechnology.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
v2: Replace cryptic macro with comment, add Rb tag (Sam)
 drivers/gpu/drm/tiny/repaper.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 76d179200775..e52a19ffd7c0 100644
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
+	/* 0 is reserved to avoid clashing with NULL */
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


--===============1136364712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1136364712==--
