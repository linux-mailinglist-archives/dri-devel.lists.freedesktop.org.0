Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCB08C776A
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 15:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A2C10ECF7;
	Thu, 16 May 2024 13:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fCxgHYG1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3236710E107
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 13:18:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 968976000E;
 Thu, 16 May 2024 13:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715865510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vx9t+d+xMex2ioN1WTpmWd+/kN+q1C09EL0d7wxjZ4k=;
 b=fCxgHYG1dygL6ueJKKJN56gVjqp8TKyyyeBCdnIaPdQWADUurPsmtis68T8/gDRf4jNdy8
 7rL4tAZegrJWdX8Fbic7tm9jptky80owYdFZsOgeDSf4/VAYrBidwQBh5jNMUhxYNr4ayq
 oHKsOzy1WWspgULPFMOkACIm6G8XqJ9619ZSGF6DTDB3eEMs7Td++hUm1V9rlrnIqp+Ydh
 AEpGFG8Tf5V+MCP0GsVbxrRdOHRXJ+mxcRkP5P9DhAiFEJphumfpuVdjp3BoSGXu9KPPBL
 IHJJBPTNaquJL8xRA9YPDr2u4k/XS7s+mu4SgtBCYszJZu0+c61lkBDeYXFfnQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 16 May 2024 15:18:19 +0200
Subject: [PATCH 3/5] drm/vkms: Add support for ARGB16161616 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240516-b4-new-color-formats-v1-3-74cf9fe07317@bootlin.com>
References: <20240516-b4-new-color-formats-v1-0-74cf9fe07317@bootlin.com>
In-Reply-To: <20240516-b4-new-color-formats-v1-0-74cf9fe07317@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2148;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=5IfsKnI5XKfHej2TaJx8ofttFTvbQESKWNRUCYM4Rus=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmRgefF7k6Gb5WPbAEh8zZMhkeUPPMY1wQQjcqw
 S77aopCS/SJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZkYHnwAKCRAgrS7GWxAs
 4kmAEACd7vRpuKPf1Megwk67Wm8GePKaPZILvyzIf2YY9DY91ZuC0QRYAy4EK5k8SkSWvBB4PwA
 E5IWFgeWjJljW5UHQPRLuwtqGy4/t5CckKxdRw/Nm9+ymBbw0H24RiRMGgZf+i+itbBxrHCjByR
 w06MOtdQfPBB0gxalHPLeVX347ki7L5omQn7T5Bo3dO+Blv7fD50SkOztHMoFQtJ3VD3Nvu3RhO
 A6ruvmbynzCT+MO04IP8z+OX0ojJ0rRfe4LLiOAGozbRfeiJNd8I6jL/AUqVRdeJrhHs5Z06Wfh
 g4/9qMGS2PyfGF0yW4+LG+bgh7StlqmqX5BIwWQkI+HCAhOQ8WYvLCiJXdWjLQYksXkTsvwiP43
 Kn+evdQ3H5uJ2Aq2CwgFti1KSuyAy21GzpqO4JLWWxl02EN3IZAc2g8Typa7WXjU45MG9+8AXFi
 +hNQh13m0yNM9nhLdE5yI62FWsufXYD4WVuyAV134Fllvjrw5gzNJo4kx2tzWE80PFYUX03G0oH
 HlpeknjTlcbyAWRQe8EV68+sCx1LO68TI9DWgPPmT/PXnuXhUkHYkuyxkcHzHj63m24O6MMk8Yi
 TCzPbPK0ilCNVqTeYitArhSBmIzQ0HQDkwJ76ccaBtFUVL//2YIymiItmls/f3BTtictEQL+NIi
 Wsl107/fRd2UPnw==
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

The formats XRGB16161616 and ARGB16161616 were already supported.
Add the support for:
- ABGR16161616
- XBGR16161616

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 7 ++++++-
 drivers/gpu/drm/vkms/vkms_plane.c   | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 54fe03c2616d..e9cca5ae57bc 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -452,9 +452,10 @@ READ_LINE_ARGB8888(ABGR8888_read_line, px, px[3], px[0], px[1], px[2])
 READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
 READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
 
-
 READ_LINE_16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0]);
+READ_LINE_16161616(ABGR16161616_read_line, px, px[3], px[0], px[1], px[2]);
 READ_LINE_16161616(XRGB16161616_read_line, px, 0xFFFF, px[2], px[1], px[0]);
+READ_LINE_16161616(XBGR16161616_read_line, px, 0xFFFF, px[0], px[1], px[2]);
 
 READ_LINE(RGB565_read_line, px, u16, argb_u16_from_RGB565, px)
 
@@ -681,8 +682,12 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 		return &BGRX8888_read_line;
 	case DRM_FORMAT_ARGB16161616:
 		return &ARGB16161616_read_line;
+	case DRM_FORMAT_ABGR16161616:
+		return &ABGR16161616_read_line;
 	case DRM_FORMAT_XRGB16161616:
 		return &XRGB16161616_read_line;
+	case DRM_FORMAT_XBGR16161616:
+		return &XBGR16161616_read_line;
 	case DRM_FORMAT_RGB565:
 		return &RGB565_read_line;
 	case DRM_FORMAT_NV12:
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 941a6e92a040..1e971c7760d9 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -22,7 +22,9 @@ static const u32 vkms_formats[] = {
 	DRM_FORMAT_RGBX8888,
 	DRM_FORMAT_BGRX8888,
 	DRM_FORMAT_XRGB16161616,
+	DRM_FORMAT_XBGR16161616,
 	DRM_FORMAT_ARGB16161616,
+	DRM_FORMAT_ABGR16161616,
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_NV12,
 	DRM_FORMAT_NV16,

-- 
2.43.2

