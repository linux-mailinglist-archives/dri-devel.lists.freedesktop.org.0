Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FB68C7777
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 15:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D97810ED10;
	Thu, 16 May 2024 13:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Z+ELg8JU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2317410ED10
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 13:20:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22C8E1C0003;
 Thu, 16 May 2024 13:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715865612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gxsky9In9MMh/e1w5QTvAWtdGDRX6UThnRqmblTzJ18=;
 b=Z+ELg8JUhcl0r9jzdSzkiJrO+6Wea7A1CE1GDFSgg6pV0od+aA/OadiO6L16C4M5S4jPcJ
 KeABzRoWSyn0ECqTLayKaVgUXu/MXpgKBtLxapYAJ4z/xS7oWLrPvuKGdHEdJB3KZKOrhy
 lfgOZs8NU8/mUAUGgAbXq6/FU49hUwACV38/tnQM6Qg6q+fd5GmyTNU63fFKSNf8qAzOmL
 NM9CsvR0EQUmfiiFMz17+XiG2wVC8BQH7oenKqa380IgoACucr0noTrjqASU2SOmakL+Ad
 A75Dxlb/C+6xNeBGAU8PDsaa+GyIDZCOP56LUKprrikjq+AxFd2MMhUieZnbZQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 16 May 2024 15:20:07 +0200
Subject: [PATCH 3/3] drm/vkms: Add support for XRGB2101010
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240516-writeback_line_by_line-v1-3-7b2e3bf9f1c9@bootlin.com>
References: <20240516-writeback_line_by_line-v1-0-7b2e3bf9f1c9@bootlin.com>
In-Reply-To: <20240516-writeback_line_by_line-v1-0-7b2e3bf9f1c9@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2232;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=1OJ19Pl47nRtdHCzGqcZtNX9EYkZYfEVLt9EdjsyHOI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmRggHCQK7xwYqKIIeeA0rVmlaVziGdYQOydOcA
 acReLtoUVOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZkYIBwAKCRAgrS7GWxAs
 4lhOD/0Z3LDnJlwTF1nleuo7YXbCMUURCN8v3uFz4goGOoWXD40S2ebgWzUMZ/UlG/Z+NQjf/PD
 z2PgAunHRR1YtWBAjYLVe+5y0JG7BvcEzwEwO1IOLfik+yMQ5KSz1uGjGx1xVCG7I6ptYxMeRXU
 YeKoxs7aXkcZaQOWRpA9m/u/4pcF5belsn21W7mtq+KuOADpcPQ7aT58osDJAHSjyJFp7THD6h+
 EVO75UXYPza561UDcN2ZTTO6+Cp4ZF2KaqmQEMbo1AWuxvPkVxTeY0iz9cnGPuVOYjsm8dXC2si
 gjUTcfb8EdtditlCJQWZxVukITRR96SoY464F/NOy0Z7gzksY+5Szn/Zy12HRIW5DVoAhP/K3GK
 t7TW77RkJuWvTnoH6xTO1kUon782rI6da2dd3cKiomR6HVkzRwv59nTwd6AOZjKP8JWImiUp8Hn
 WS8wn/qBFgEKfJNB5RuGD26P9h0CfKmllT//R8Y6QVLLfv2GhZ6EGj8oCFOyhWRAmVZ+jBUq0DI
 Hf+NucgHuEkvxG5NvPhNQE+hwCJhS6yw2ByoUoKJpR9wzviDDzlswJVXwxqEBilnYdWxVoMcGa4
 lEE1LhVyfTzNnIoYH1GkAn0kf/CkAqSyuCRhQXp762rnCYQZSO9FUivTOsf+xiEzz6t6vDc3Y39
 q8KTiL51bBkGPng==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

Thanks to the WRITE_LINE macro, adding the format XRGB210101010 is trivial.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c   | 12 ++++++++++++
 drivers/gpu/drm/vkms/vkms_writeback.c |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 51b1c04e6781..92f1b2f5a8dd 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -642,6 +642,14 @@ static void argb_u16_to_RGB565(u8 *out_pixel, const struct pixel_argb_u16 *in_pi
 	*pixel = cpu_to_le16(r << 11 | g << 5 | b);
 }
 
+static void argb_u16_to_XRGB2101010(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
+{
+	out_pixel[0] = (u8)(in_pixel->b & 0xFF);
+	out_pixel[1] = (u8)((in_pixel->b >> 8) & 0x03) | (u8)((in_pixel->g << 2) & 0xFC);
+	out_pixel[2] = (u8)((in_pixel->g >> 6) & 0x0F) | (u8)((in_pixel->r << 4) & 0xF0);
+	out_pixel[3] = (u8)((in_pixel->r >> 4) & 0x3F);
+}
+
 /**
  * WRITE_LINE() - Generic generator for write_line functions
  *
@@ -688,6 +696,8 @@ WRITE_LINE(XRGB16161616_write_line, argb_u16_to_XRGB16161616)
 
 WRITE_LINE(RGB565_write_line, argb_u16_to_RGB565)
 
+WRITE_LINE(XRGB2101010_write_line, argb_u16_to_XRGB2101010)
+
 /**
  * argb_u16_to_nothing() - pixel_write callback with no effect
  *
@@ -979,6 +989,8 @@ pixel_write_line_t get_pixel_write_line_function(u32 format)
 		return &XRGB16161616_write_line;
 	case DRM_FORMAT_RGB565:
 		return &RGB565_write_line;
+	case DRM_FORMAT_XRGB2101010:
+		return &XRGB2101010_write_line;
 	default:
 		/*
 		 * This is a bug in vkms_writeback_atomic_check. All the supported
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 53bddcf33eab..c86020ef667a 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -21,7 +21,7 @@ static const u32 vkms_wb_formats[] = {
 	DRM_FORMAT_XRGB16161616,
 	DRM_FORMAT_ARGB16161616,
 	DRM_FORMAT_RGB565,
-	DRM_FORMAT_YUV422
+	DRM_FORMAT_XRGB2101010,
 };
 
 static const struct drm_connector_funcs vkms_wb_connector_funcs = {

-- 
2.43.2

