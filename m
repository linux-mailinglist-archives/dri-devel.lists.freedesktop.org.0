Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC306402821
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 13:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB9889F5B;
	Tue,  7 Sep 2021 11:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E0289733
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 11:58:08 +0000 (UTC)
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net
 [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id 0897E80053;
 Tue,  7 Sep 2021 13:58:07 +0200 (CEST)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Cc: peter@stuge.se, linus.walleij@linaro.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v2 4/7] drm/gud: Add GUD_PIXEL_FORMAT_R8
Date: Tue,  7 Sep 2021 13:57:49 +0200
Message-Id: <20210907115752.6181-5-noralf@tronnes.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907115752.6181-1-noralf@tronnes.org>
References: <20210907115752.6181-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=EbzmvsuC c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8
 a=8akw2Lq4Ih2G6NqqFAUA:9 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
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

Add support for 8-bit greyscale format.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/gud/gud_drv.c      | 2 ++
 drivers/gpu/drm/gud/gud_internal.h | 4 ++++
 drivers/gpu/drm/gud/gud_pipe.c     | 2 ++
 include/drm/gud.h                  | 4 ++--
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index eb4e08846da4..a8d76c76e868 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -523,6 +523,8 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		switch (format) {
 		case GUD_DRM_FORMAT_R1:
 			fallthrough;
+		case DRM_FORMAT_R8:
+			fallthrough;
 		case GUD_DRM_FORMAT_XRGB1111:
 			if (!xrgb8888_emulation_format)
 				xrgb8888_emulation_format = info;
diff --git a/drivers/gpu/drm/gud/gud_internal.h b/drivers/gpu/drm/gud/gud_internal.h
index 2a388e27d5d7..8499e713dbbc 100644
--- a/drivers/gpu/drm/gud/gud_internal.h
+++ b/drivers/gpu/drm/gud/gud_internal.h
@@ -80,6 +80,8 @@ static inline u8 gud_from_fourcc(u32 fourcc)
 	switch (fourcc) {
 	case GUD_DRM_FORMAT_R1:
 		return GUD_PIXEL_FORMAT_R1;
+	case DRM_FORMAT_R8:
+		return GUD_PIXEL_FORMAT_R8;
 	case GUD_DRM_FORMAT_XRGB1111:
 		return GUD_PIXEL_FORMAT_XRGB1111;
 	case DRM_FORMAT_RGB565:
@@ -98,6 +100,8 @@ static inline u32 gud_to_fourcc(u8 format)
 	switch (format) {
 	case GUD_PIXEL_FORMAT_R1:
 		return GUD_DRM_FORMAT_R1;
+	case GUD_PIXEL_FORMAT_R8:
+		return DRM_FORMAT_R8;
 	case GUD_PIXEL_FORMAT_XRGB1111:
 		return GUD_DRM_FORMAT_XRGB1111;
 	case GUD_PIXEL_FORMAT_RGB565:
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index b9b0e435ea0f..be4f95b2d59c 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -189,6 +189,8 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 				ret = -ENOMEM;
 				goto end_cpu_access;
 			}
+		} else if (format->format == DRM_FORMAT_R8) {
+			drm_fb_xrgb8888_to_gray8(buf, vaddr, fb, rect);
 		} else if (format->format == DRM_FORMAT_RGB565) {
 			drm_fb_xrgb8888_to_rgb565(buf, vaddr, fb, rect, gud_is_big_endian());
 		} else {
diff --git a/include/drm/gud.h b/include/drm/gud.h
index 0b46b54fe56e..1dc781009e62 100644
--- a/include/drm/gud.h
+++ b/include/drm/gud.h
@@ -246,8 +246,8 @@ struct gud_state_req {
 /* Get supported pixel formats as a byte array of GUD_PIXEL_FORMAT_* */
 #define GUD_REQ_GET_FORMATS				0x40
   #define GUD_FORMATS_MAX_NUM			32
-  /* R1 is a 1-bit monochrome transfer format presented to userspace as XRGB8888 */
-  #define GUD_PIXEL_FORMAT_R1			0x01
+  #define GUD_PIXEL_FORMAT_R1			0x01 /* 1-bit monochrome */
+  #define GUD_PIXEL_FORMAT_R8			0x08 /* 8-bit greyscale */
   #define GUD_PIXEL_FORMAT_XRGB1111		0x20
   #define GUD_PIXEL_FORMAT_RGB565		0x40
   #define GUD_PIXEL_FORMAT_XRGB8888		0x80
-- 
2.32.0

