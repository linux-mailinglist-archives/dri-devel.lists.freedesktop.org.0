Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B44AE951675
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 10:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8992010E418;
	Wed, 14 Aug 2024 08:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="aMPF8Iqd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A2C010E410
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 08:19:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFF6FC0004;
 Wed, 14 Aug 2024 08:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723623589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1bQW4w2sqK2bHnvmD4jLbo5BQQSO4DNCwJ4IoRox5zE=;
 b=aMPF8IqdYCWqFKcc4+pX5obOXr3ZmBA/OAxDA4LQWdOVwvQpTxP8K1tkZOQZwByxneueZp
 QkZdlxe536LyzIOLThMwmAUnNsNYn7BKqiw0a4+6ZJKELHg4KS5zg9b0RMDqN0xFthcC9c
 ScYOujjq42byXzL0Rs/HDKd4C131sw+bjtUHbLcoG10Ceq6++iIZUIacBsKceWCc4UsmUc
 2oGqR/zuIX7yZmP3dnhCqeAehABX6A2ZVO7/8Ev3wjha4NQXfUwmyYpw+y4ISUnPjF0q1T
 17VuXmhQ6mydWvumhQPd6kiI7SQTJNmsJTFTPzglr/f2qkrjZ5xj/0uzHUoYjQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 10:19:36 +0200
Subject: [PATCH v2 3/8] drm/vkms: Add support for ARGB16161616 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-b4-new-color-formats-v2-3-8b3499cfe90e@bootlin.com>
References: <20240814-b4-new-color-formats-v2-0-8b3499cfe90e@bootlin.com>
In-Reply-To: <20240814-b4-new-color-formats-v2-0-8b3499cfe90e@bootlin.com>
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
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 20240809-yuv-v10-0-1a7c764166f7@bootlin.com
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2312;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=U8nQOSe6mzeM/r34Hu9pqa7sb6HD4D0ZQFRXh+EiNmY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvGieA3Ipv89pfkoRjeeZqCGXtL9ep99nU5qiU
 MIx8L8Xws2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrxongAKCRAgrS7GWxAs
 4oOTD/4trJka3DwIkcfr0vmGkAt32XYzAGxEM/bqz+X2ADeW30QnAOdBr8M4LPSfqPTDIQZXOul
 BWx/6RK0TbGaMrWl6mDfXWu/ZI1tXXrWD5dq+Jh1Rl1sBc0WrscKTXgQ+pO/I6HUcdyDE8X3dbx
 aHLLv4Was0F3MRHRrNDX+NIQn/EVfoN7Q5A4vKB9PToQ5rJMEXBex7Jxjupi2WXwSrMIrrPxkBx
 HL22SfK6AW9aVjvH8tk4Ou1LPov5DpvQWCIUD8RLzrStUGu2NRHW6yhvR6y69BMvBmXyMQu7ZT+
 eGAq5AsFHiJHDSLgtj9o+XfSanec2UOGEfeO+pVumXOXpLNbfVBRRORVNAtIK5Ro9aUSXSsziPB
 4SfGyMPGX+tb/n5wkRDl5BMlBZmoJKUMvpM0dSdlx5e9jA9YxsT774rbcq/nZ82DlUAjcpS0/Hl
 rdtRg9l15JW4EH2KamrOnsuNznVa7I7RHmpsLzzBeknHtIsqP5MZ34CGNCkurkh5b18sIZMwPf9
 2SbxCvQlXmPZQx3ZN3xZ2i+RWAq1RFVgH5/0Bh4xLOIXq9Vo1Ypldc0IM/tcmucvOWvQIg3iBMp
 Tb+6J6OFC2dk7g2Yoyj0ptdPP+yf7VxyYxbwMIP+1wmamjSqHJ4vpb6TfqSD7g/Nl4p0nIcV1ES
 VrdqIza5hs5YbQA==
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
 drivers/gpu/drm/vkms/vkms_formats.c | 11 ++++++++---
 drivers/gpu/drm/vkms/vkms_plane.c   |  2 ++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 894c83c31f97..691fd8275f14 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -439,9 +439,10 @@ READ_LINE_ARGB8888(ABGR8888_read_line, px, px[3], px[0], px[1], px[2])
 READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
 READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
 
-
-READ_LINE_16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0]);
-READ_LINE_16161616(XRGB16161616_read_line, px, 0xFFFF, px[2], px[1], px[0]);
+READ_LINE_16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
+READ_LINE_16161616(ABGR16161616_read_line, px, px[3], px[0], px[1], px[2])
+READ_LINE_16161616(XRGB16161616_read_line, px, 0xFFFF, px[2], px[1], px[0])
+READ_LINE_16161616(XBGR16161616_read_line, px, 0xFFFF, px[0], px[1], px[2])
 
 READ_LINE(RGB565_read_line, px, __le16, argb_u16_from_RGB565, px)
 
@@ -657,8 +658,12 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
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
2.44.2

