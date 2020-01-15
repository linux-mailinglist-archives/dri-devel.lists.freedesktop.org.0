Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5761013C174
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 13:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94DC6E9AF;
	Wed, 15 Jan 2020 12:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47366E9AF
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 12:46:00 +0000 (UTC)
Received: from ramsan ([84.195.182.253]) by michel.telenet-ops.be with bizsmtp
 id qclq2100M5USYZQ06clqYB; Wed, 15 Jan 2020 13:45:58 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iri3S-0003z9-68; Wed, 15 Jan 2020 13:45:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iri3S-00012k-4a; Wed, 15 Jan 2020 13:45:50 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 David Lechner <david@lechnology.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 5/5] drm: tiny: st7735r: Add support for Okaya RH128128T
Date: Wed, 15 Jan 2020 13:45:48 +0100
Message-Id: <20200115124548.3951-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115124548.3951-1-geert+renesas@glider.be>
References: <20200115124548.3951-1-geert+renesas@glider.be>
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the Okaya RH128128T display to the st7735r driver on
DT-enabled systems.

The RH128128T is a 128x128 1.44" TFT display driven by a Sitronix
ST7715R TFT Controller/Driver.  The latter is very similar to the
ST7735R, and can be handled by the existing st7735r driver.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Split in two patches,
  - Update Kconfig help text,
  - Improve file comment header.
---
 drivers/gpu/drm/tiny/Kconfig   | 8 +++++---
 drivers/gpu/drm/tiny/st7735r.c | 9 ++++++++-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index a46ac284dd5e9211..a8664211123e7025 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -85,14 +85,16 @@ config TINYDRM_ST7586
 	  If M is selected the module will be called st7586.
 
 config TINYDRM_ST7735R
-	tristate "DRM support for Sitronix ST7735R display panels"
+	tristate "DRM support for Sitronix ST7715R/ST7735R display panels"
 	depends on DRM && SPI
 	select DRM_KMS_HELPER
 	select DRM_KMS_CMA_HELPER
 	select DRM_MIPI_DBI
 	select BACKLIGHT_CLASS_DEVICE
 	help
-	  DRM driver Sitronix ST7735R with one of the following LCDs:
-	  * JD-T18003-T01 1.8" 128x160 TFT
+	  DRM driver for Sitronix ST7715R/ST7735R with one of the following
+	  LCDs:
+	  * Jianda JD-T18003-T01 1.8" 128x160 TFT
+	  * Okaya RH128128T 1.44" 128x128 TFT
 
 	  If M is selected the module will be called st7735r.
diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735r.c
index a838f237c8d82e3d..32574f1b60716390 100644
--- a/drivers/gpu/drm/tiny/st7735r.c
+++ b/drivers/gpu/drm/tiny/st7735r.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * DRM driver for Sitronix ST7735R panels
+ * DRM driver for display panels connected to a Sitronix ST7715R or ST7735R
+ * display controller in SPI mode.
  *
  * Copyright 2017 David Lechner <david@lechnology.com>
  * Copyright (C) 2019 Glider bvba
@@ -144,6 +145,11 @@ static const struct st7735r_cfg jd_t18003_t01_cfg = {
 	.write_only	= true,
 };
 
+static const struct st7735r_cfg rh128128t_cfg = {
+	.mode		= { DRM_SIMPLE_MODE(128, 128, 25, 26) },
+	.left_offset	= 2,
+	.top_offset	= 3,
+	.rgb		= true,
 };
 
 DEFINE_DRM_GEM_CMA_FOPS(st7735r_fops);
@@ -163,6 +169,7 @@ static struct drm_driver st7735r_driver = {
 
 static const struct of_device_id st7735r_of_match[] = {
 	{ .compatible = "jianda,jd-t18003-t01", .data = &jd_t18003_t01_cfg },
+	{ .compatible = "okaya,rh128128t", .data = &rh128128t_cfg },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, st7735r_of_match);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
