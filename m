Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA33A8C7765
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 15:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A733810E1BC;
	Thu, 16 May 2024 13:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="C7B1htAo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51EE10E107
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 13:18:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5C6760005;
 Thu, 16 May 2024 13:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715865509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HLHZM9ZEhw6N1E74N1Nghx7nW+1xKLp7LJosjk775lc=;
 b=C7B1htAoEhuuZ6LrleXEcUGtVZka/7PAUqMvl/rv4Np7mC13VKNZmCWKIMzQj232dDanw3
 v2XILhlzSveCCX7OvJBGVvZU24TqJDwjHIpJgEZFj+MpvT9smMMxnwZtPF1/Y0D86gJvrL
 PGEN+hvyqUW4ODc7XrB1R3FlZf4wbK65vG0IA8A6fApdRrvtDdEB8w9rDynOoPUSyKO7jO
 PemtsEOLI2CIBj2ttcT5yZx89kxhj9Qqucum+pLEAxwBLVDEwWhqn1QAMsweLL40Adqmft
 LND+Jw2MwDvE/9UksdikFLsG73RicwoLijhEzdwhD0AvG8eJYqwnRawzSp0dmQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 16 May 2024 15:18:18 +0200
Subject: [PATCH 2/5] drm/vkms: Add support for ARGB8888 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240516-b4-new-color-formats-v1-2-74cf9fe07317@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2595;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Bz+7xOk7+Ss37CG2k9sDLkcuE9hiXcLFPLpoYZI/go0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmRgefLK1GgMQ4QN4HIniJu7MnEMzqonOYp2bWo
 8Ckp0RAzTiJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZkYHnwAKCRAgrS7GWxAs
 4n7oEAC4hNCKxCXI52Li1iB3UsGZEbAbE9mOWwrMa5tO49DIKJSVP4A1LhAmpShpRG35pBwNOWX
 Vt/6EQoL7Swf3Dw+nUOeiPpDXJniVzFCRisicQtn68ehgJjGqc2NuVVT7q/eVlJIvq8BmSW0PMv
 xDiRlQJxfrWctTIXZ/c7nKl6bB5G8G3q4qzH9Rb0VNrmif68nCbsimBIG0kLW6WtcydnEJt47xX
 BYRJnBSHpbMYmLwbwXSAhJ50YTDIcCPaENet1IedPKgfRNhoCXmjvWIyHr2RlWop3IQdXGgB5Zu
 F15u9xWURkA6pDqGlJfUZdO6eCLhUwsclgugKLxinwiiP5ppqqd0sII3BxSXt+uG8o8p3CN8LpF
 XbmhzXyE13/s0ZF/uUNGp9Krqbe1OyBCm32q6eHcOkVFFcTDZ2d8kIZAZNvygFv9R3D/JLCTd3A
 afgsjR544hbtQImKAMA7Q2657vacMEvIveZckC5NowVzHQKeIJydO0c6VGUCTGakssrWqvTqzzL
 +FA/MAzLXUoq6zY1tZ7och3gx4cdthVwFnKmE10AcuLquiVG0A4JcPNqEDmVmf1aH+gfJutmkAk
 KmeFBdgDuPzcxtTv2yGGYvUyLkSKp+BgWTvDYm183A3oSF2Ywg1TrR2amo348rqTxS4Hsq6TNj9
 8RbC36CkRlC1XVA==
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

The formats XRGB8888 and ARGB8888 were already supported.
Add the support for:
- XBGR8888
- RGBX8888
- BGRX8888
- ABGR8888
- RGBA8888
- BGRA8888

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 18 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c   |  6 ++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index d26707cff86e..54fe03c2616d 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -443,8 +443,14 @@ static void R4_read_line(const struct vkms_plane_state *plane, int x_start,
 
 
 READ_LINE_ARGB8888(XRGB8888_read_line, px, 255, px[2], px[1], px[0])
+READ_LINE_ARGB8888(XBGR8888_read_line, px, 255, px[0], px[1], px[2])
+READ_LINE_ARGB8888(RGBX8888_read_line, px, 255, px[3], px[2], px[1])
+READ_LINE_ARGB8888(BGRX8888_read_line, px, 255, px[1], px[2], px[3])
 
 READ_LINE_ARGB8888(ARGB8888_read_line, px, px[3], px[2], px[1], px[0])
+READ_LINE_ARGB8888(ABGR8888_read_line, px, px[3], px[0], px[1], px[2])
+READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
+READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
 
 
 READ_LINE_16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0]);
@@ -659,8 +665,20 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 	switch (format) {
 	case DRM_FORMAT_ARGB8888:
 		return &ARGB8888_read_line;
+	case DRM_FORMAT_ABGR8888:
+		return &ABGR8888_read_line;
+	case DRM_FORMAT_BGRA8888:
+		return &BGRA8888_read_line;
+	case DRM_FORMAT_RGBA8888:
+		return &RGBA8888_read_line;
 	case DRM_FORMAT_XRGB8888:
 		return &XRGB8888_read_line;
+	case DRM_FORMAT_XBGR8888:
+		return &XBGR8888_read_line;
+	case DRM_FORMAT_RGBX8888:
+		return &RGBX8888_read_line;
+	case DRM_FORMAT_BGRX8888:
+		return &BGRX8888_read_line;
 	case DRM_FORMAT_ARGB16161616:
 		return &ARGB16161616_read_line;
 	case DRM_FORMAT_XRGB16161616:
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 67f891e7ac58..941a6e92a040 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -14,7 +14,13 @@
 
 static const u32 vkms_formats[] = {
 	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_RGBA8888,
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRX8888,
 	DRM_FORMAT_XRGB16161616,
 	DRM_FORMAT_ARGB16161616,
 	DRM_FORMAT_RGB565,

-- 
2.43.2

