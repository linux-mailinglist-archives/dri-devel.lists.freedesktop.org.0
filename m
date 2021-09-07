Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F051640281D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 13:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB0789DC7;
	Tue,  7 Sep 2021 11:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306DB89E15
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 11:58:10 +0000 (UTC)
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net
 [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id 754E48006B;
 Tue,  7 Sep 2021 13:58:07 +0200 (CEST)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Cc: peter@stuge.se, linus.walleij@linaro.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v2 7/7] drm/gud: Add module parameter to control emulation:
 xrgb8888
Date: Tue,  7 Sep 2021 13:57:52 +0200
Message-Id: <20210907115752.6181-8-noralf@tronnes.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907115752.6181-1-noralf@tronnes.org>
References: <20210907115752.6181-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=EbzmvsuC c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=aR16PxjQAAAA:8 a=SJz97ENfAAAA:8
 a=DmnpHc4pua4SWowHEBAA:9 a=QEXdDO2ut3YA:10 a=zbFvvTOBjyH4ze5LlUjX:22
 a=vFet0B0WnEQeilDPIY6i:22
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

For devices that don't support XRGB8888 give the user the ability to
choose what's most important: Color depth or frames per second.

Add an 'xrgb8888' module parameter to override the emulation format.

Assume the user wants full control if xrgb8888 is set and don't set
DRM_CAP_DUMB_PREFERRED_DEPTH if RGB565 is supported (AFAIK only X.org
supports this).

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/gud/gud_drv.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 3f9d4b9a1e3d..60d27ee5ddbd 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -30,6 +30,10 @@
 
 #include "gud_internal.h"
 
+static int gud_xrgb8888;
+module_param_named(xrgb8888, gud_xrgb8888, int, 0644);
+MODULE_PARM_DESC(xrgb8888, "XRGB8888 emulation format: GUD_PIXEL_FORMAT_* value, 0=auto, -1=disable [default=auto]");
+
 /* Only used internally */
 static const struct drm_format_info gud_drm_format_r1 = {
 	.format = GUD_DRM_FORMAT_R1,
@@ -530,12 +534,12 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		case DRM_FORMAT_RGB332:
 			fallthrough;
 		case DRM_FORMAT_RGB888:
-			if (!xrgb8888_emulation_format)
+			if (!gud_xrgb8888 && !xrgb8888_emulation_format)
 				xrgb8888_emulation_format = info;
 			break;
 		case DRM_FORMAT_RGB565:
 			rgb565_supported = true;
-			if (!xrgb8888_emulation_format)
+			if (!gud_xrgb8888 && !xrgb8888_emulation_format)
 				xrgb8888_emulation_format = info;
 			break;
 		case DRM_FORMAT_XRGB8888:
@@ -543,6 +547,9 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 			break;
 		}
 
+		if (gud_xrgb8888 == formats_dev[i])
+			xrgb8888_emulation_format = info;
+
 		fmt_buf_size = drm_format_info_min_pitch(info, 0, drm->mode_config.max_width) *
 			       drm->mode_config.max_height;
 		max_buffer_size = max(max_buffer_size, fmt_buf_size);
@@ -559,7 +566,7 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	}
 
 	/* Prefer speed over color depth */
-	if (rgb565_supported)
+	if (!gud_xrgb8888 && rgb565_supported)
 		drm->mode_config.preferred_depth = 16;
 
 	if (!xrgb8888_supported && xrgb8888_emulation_format) {
-- 
2.32.0

