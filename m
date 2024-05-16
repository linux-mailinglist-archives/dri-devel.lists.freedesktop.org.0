Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D769B8C7768
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 15:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC94410E107;
	Thu, 16 May 2024 13:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="pNftCPQq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5546410E107
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 13:18:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7233E60002;
 Thu, 16 May 2024 13:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715865514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MrS8b39rxDfx4oFYW2S/d2LnfHxde+rqsW+6XOgTsco=;
 b=pNftCPQqP1awGmnbstlU4DBekkFnYGGJX4eQo4moAulGT9IEZ3+zKZqfcaQTelHwi0KsMW
 Kq7HlJ4hOgjgQFC1uETzmgb6oMo6kQZJ4Bupmw8o0KFP9QkRFgLrUJEujd8imEkSTe0YOT
 HWAJ+ZnEerm3SAeb5vRmCsWuWBZRpgHJvGixgODkOhF3V91VdatIgkod6FbHcPcJ8beQD0
 R2qkAPNYjXliq8GyfAYZs2zjJbYLgTb/LoWT+95p87pQfuz7P8o/+4qa/5vBDaYhEX7hxt
 ITOWb+5inqTZs+VaqagW0NakMXANfAGNUjulzug9UaEqVeATcpFrQDMjanPfwg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 16 May 2024 15:18:21 +0200
Subject: [PATCH 5/5] drm/vkms: Add support for RGB888 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240516-b4-new-color-formats-v1-5-74cf9fe07317@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1936;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=/vrxMtadDQYtqI4w4rk5sueAQ3y7eapu4/8W4sRdUvQ=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmRgef1emOyzGd/IpJLMvz4AbwKcC66NGrRXEYu
 fm92wBcRNCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZkYHnwAKCRAgrS7GWxAs
 4pHgD/9sniUJ7rD+ib4ar88c6BG1CbRJPURj6hQsJe6PoC2U89A8L5a5LP2WvC+nZoVV10o8uIP
 mw9Da72ZgX4lv7TYhypzYTZd0fZ/geoto3+VbH2tumKEqmDqt9NeaTJbalrSp1bKt9F25IbYv2B
 AW6xYtLZXK7b6+QxpgR+/3z1Y575yJZqifkl/aL+tS2s+F5nynMnFT0bwfNySAhKDk27zmJB99v
 3oYbEww9IgqW8QBnqmJz/cWHcTLidA5mvy9dlZgoD9GelFGlQHFmrFXCGwSIujYUNAzlNvP0sna
 /Z7ZaTUR6El4PwzvYfIKgdnIYKXo7aGg2mU8Jj4Kx+w/4bCbuVZe3k+r8ZuA3yNJu/ZqOkS/2U8
 7ECns5imI6lLC7b42LJRZqgpC7bULaSsp/uvV8n0czNmst4TySs87wlxUQKnqgaSx+14ntgoRXz
 yliUKFIyRrLnNphIjRT7fBC+0hBWh04nDXY+lFuw41K2C76rOmVqUgdcmrg0H1DK4pQKyruoUoB
 uv4HPcxsQC3jGFDSfFAtYekwXbLcDL+vgYH1XN/WxHITdgl6CT1Tl0vLQdP120Raeqg08x3/lIV
 PpZ59a8AkbBDaaf1oGmkK3FNOxxXXzwRCTC34aR2umd9JppRB+rqAbupsj243TvlEkW7Be6YW6X
 KIPpvsKCQ3pAxsg==
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

Add the support for:
- RGB888
- BGR888

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 7 +++++++
 drivers/gpu/drm/vkms/vkms_plane.c   | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 4d7af36aa28a..6e651f7e6997 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -472,6 +472,9 @@ READ_LINE_ARGB8888(ABGR8888_read_line, px, px[3], px[0], px[1], px[2])
 READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
 READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
 
+READ_LINE_ARGB8888(RGB888_read_line, px, 255, px[2], px[1], px[0])
+READ_LINE_ARGB8888(BGR888_read_line, px, 255, px[0], px[1], px[2])
+
 READ_LINE_16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0]);
 READ_LINE_16161616(ABGR16161616_read_line, px, px[3], px[0], px[1], px[2]);
 READ_LINE_16161616(XRGB16161616_read_line, px, 0xFFFF, px[2], px[1], px[0]);
@@ -701,6 +704,10 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 		return &RGBX8888_read_line;
 	case DRM_FORMAT_BGRX8888:
 		return &BGRX8888_read_line;
+	case DRM_FORMAT_RGB888:
+		return RGB888_read_line;
+	case DRM_FORMAT_BGR888:
+		return BGR888_read_line;
 	case DRM_FORMAT_ARGB16161616:
 		return &ARGB16161616_read_line;
 	case DRM_FORMAT_ABGR16161616:
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index a243a706459f..0fa589abc53a 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -21,6 +21,8 @@ static const u32 vkms_formats[] = {
 	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_RGBX8888,
 	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
 	DRM_FORMAT_XRGB16161616,
 	DRM_FORMAT_XBGR16161616,
 	DRM_FORMAT_ARGB16161616,

-- 
2.43.2

