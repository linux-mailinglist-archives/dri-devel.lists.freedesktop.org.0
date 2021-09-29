Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F29D941CC6D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 21:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E246E88A;
	Wed, 29 Sep 2021 19:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav22.altibox.net (asav22.altibox.net [109.247.116.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5CA6E209
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 19:12:17 +0000 (UTC)
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net
 [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav22.altibox.net (Postfix) with ESMTPSA id 6EFBE20A91;
 Wed, 29 Sep 2021 21:12:14 +0200 (CEST)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Cc: peter@stuge.se,
	=?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v3 6/6] drm/gud: Add GUD_PIXEL_FORMAT_RGB888
Date: Wed, 29 Sep 2021 21:12:01 +0200
Message-Id: <20210929191201.34456-7-noralf@tronnes.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210929191201.34456-1-noralf@tronnes.org>
References: <20210929191201.34456-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=NPX7BXyg c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8
 a=uAXMNBUqk6NMOdUcLzQA:9 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
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

Add support for the RGB888 pixel format.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/gud/gud_drv.c      | 2 ++
 drivers/gpu/drm/gud/gud_internal.h | 4 ++++
 drivers/gpu/drm/gud/gud_pipe.c     | 2 ++
 include/drm/gud.h                  | 1 +
 4 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index e571ad10a12b..3f9d4b9a1e3d 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -528,6 +528,8 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		case GUD_DRM_FORMAT_XRGB1111:
 			fallthrough;
 		case DRM_FORMAT_RGB332:
+			fallthrough;
+		case DRM_FORMAT_RGB888:
 			if (!xrgb8888_emulation_format)
 				xrgb8888_emulation_format = info;
 			break;
diff --git a/drivers/gpu/drm/gud/gud_internal.h b/drivers/gpu/drm/gud/gud_internal.h
index 249e02d1f5ed..e351a1f1420d 100644
--- a/drivers/gpu/drm/gud/gud_internal.h
+++ b/drivers/gpu/drm/gud/gud_internal.h
@@ -88,6 +88,8 @@ static inline u8 gud_from_fourcc(u32 fourcc)
 		return GUD_PIXEL_FORMAT_RGB332;
 	case DRM_FORMAT_RGB565:
 		return GUD_PIXEL_FORMAT_RGB565;
+	case DRM_FORMAT_RGB888:
+		return GUD_PIXEL_FORMAT_RGB888;
 	case DRM_FORMAT_XRGB8888:
 		return GUD_PIXEL_FORMAT_XRGB8888;
 	case DRM_FORMAT_ARGB8888:
@@ -110,6 +112,8 @@ static inline u32 gud_to_fourcc(u8 format)
 		return DRM_FORMAT_RGB332;
 	case GUD_PIXEL_FORMAT_RGB565:
 		return DRM_FORMAT_RGB565;
+	case GUD_PIXEL_FORMAT_RGB888:
+		return DRM_FORMAT_RGB888;
 	case GUD_PIXEL_FORMAT_XRGB8888:
 		return DRM_FORMAT_XRGB8888;
 	case GUD_PIXEL_FORMAT_ARGB8888:
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 868a0b8a1f3e..daf75c178c2b 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -195,6 +195,8 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 			drm_fb_xrgb8888_to_rgb332(buf, vaddr, fb, rect);
 		} else if (format->format == DRM_FORMAT_RGB565) {
 			drm_fb_xrgb8888_to_rgb565(buf, vaddr, fb, rect, gud_is_big_endian());
+		} else if (format->format == DRM_FORMAT_RGB888) {
+			drm_fb_xrgb8888_to_rgb888(buf, vaddr, fb, rect);
 		} else {
 			len = gud_xrgb8888_to_color(buf, format, vaddr, fb, rect);
 		}
diff --git a/include/drm/gud.h b/include/drm/gud.h
index 4118dce2fcec..c52a8ba4ae4e 100644
--- a/include/drm/gud.h
+++ b/include/drm/gud.h
@@ -251,6 +251,7 @@ struct gud_state_req {
   #define GUD_PIXEL_FORMAT_XRGB1111		0x20
   #define GUD_PIXEL_FORMAT_RGB332		0x30
   #define GUD_PIXEL_FORMAT_RGB565		0x40
+  #define GUD_PIXEL_FORMAT_RGB888		0x50
   #define GUD_PIXEL_FORMAT_XRGB8888		0x80
   #define GUD_PIXEL_FORMAT_ARGB8888		0x81
 
-- 
2.32.0

