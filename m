Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 591F4951679
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 10:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D183410E423;
	Wed, 14 Aug 2024 08:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="pRLqf4j+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D66010E41F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 08:19:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE332C0008;
 Wed, 14 Aug 2024 08:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723623594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/zuFuAELsFfeHuKjmDwBJ7LuklizkVl2A5HyoJYo+hw=;
 b=pRLqf4j+Dr7oPP8PJPbGgRpdPi9JT732Y4anVTfA+HB27lympxMn5FS5J8BUzI7lORFLAY
 9TA1/LWSuzPZdIdWz2QZ8mVYKSlrKEwimIUqG0pkCvUf1flFR7zX9jh/4nwk1GBmNPZKw0
 1zUCmNFL6n/aODl2nkUBgikDsLOsZhN7sg7UhKyE2x29yeGwg1qPNX/p3x5Un/RyCO3Wtg
 4pOaUA9DwaHh3oAKNzFd/ZxAOgG4ZpwWfgknYncbGQI1IZyLFtkTA+MzB0qrDVvE0c0reK
 L5jmin5QNWmWzwVvSmeb6F5Rmyy5b3kapbObVpF8izspiLjDT49/0PpnT83E8Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 10:19:41 +0200
Subject: [PATCH v2 8/8] drm/vkms: Add P01* formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-b4-new-color-formats-v2-8-8b3499cfe90e@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1885;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=TMTnR4P98mlZAZ+WK5vWeKSerKkdvqWXG9xVfF8Pg2U=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvGif7IJe69h1cW5j6EMURpnNlQxaewd5nu+J3
 uhS/QjHeuuJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrxonwAKCRAgrS7GWxAs
 4kJiD/oDGFmw1++hs7b8As2dRYG7+HSel6E/jMXOEPE6q0uNmun3A0rOrvPDf6S8YrchrSsUtaX
 pdani5UYLpURqTbm41kZZ5umPMk7FE7VWLdQkzz/pzhhTm8MweupC62ydiRYAuqxtoAlCrIDYHh
 W0oVvsZNvtMTHqA1iKBd4JMBycYGvV1niicBasB0JQlQzWZTVBY4a5a8R6isnqvjaTDCR94DxDZ
 77AnbALvSUHJqoAaLxdDRaL+J3zA5KcDQ3Pi26baiM4RBo1QxLpqSXj05O6Gq54+U4yNxlbd94E
 geayKBzFRa0ZBkFqjPHpOsX4Dg4uYJJ3TgHLydJJtTwnX/50qWyzIjmgQOFE0p+99N1Evxg+1Ba
 LDXFfCfiz9iz67fUHJl0/7rU/FMbIc5ERcbwzYhLvn1tH73FwHGsqaeW23xtzKuGQr03zE7hZhE
 U0meepjVM54uMn2angftJYbQrRx1ycK1Zd5zD7RXRXuRbrSNysV1GIPFl6686OUf4s8FCt3W/Rb
 z8AVdy8D+bHfHElFCW/SqEcbTU7Yze0m1IXSN4x8mO6Yc6YxhrH7QcnYeIUSixhmuJVst/iS9hp
 4lyvp+f7cvk44VbmF889L5R9EfQFP/1hnlH37BsnZeBhGczFwHEue5Fiy5t0HjJgsFgdwaeK6RO
 uLfoyDE7X3csQ6w==
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

The formats NV 12/16/24/21/61/42 were already supported.
Add support for:
- P010
- P012
- P016

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 7 ++++++-
 drivers/gpu/drm/vkms/vkms_plane.c   | 3 +++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 129672a555ce..d1abfb1c3e3c 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -533,7 +533,8 @@ static void function_name(const struct vkms_plane_state *plane, int x_start,			\
 
 READ_LINE_YUV_SEMIPLANAR(YUV888_semiplanar_read_line, y, uv, u8, u8, argb_u16_from_yuv161616,
 			 y[0] * 257, uv[0] * 257, uv[1] * 257)
-
+READ_LINE_YUV_SEMIPLANAR(YUV161616_semiplanar_read_line, y, uv, u16, u16, argb_u16_from_yuv161616,
+			 y[0], uv[0], uv[1])
 /*
  * This callback can be used for YUV format where each color component is
  * stored in a different plane (often called planar formats). It will
@@ -726,6 +727,10 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 	case DRM_FORMAT_NV61:
 	case DRM_FORMAT_NV42:
 		return &YUV888_semiplanar_read_line;
+	case DRM_FORMAT_P010:
+	case DRM_FORMAT_P012:
+	case DRM_FORMAT_P016:
+		return &YUV161616_semiplanar_read_line;
 	case DRM_FORMAT_YUV420:
 	case DRM_FORMAT_YUV422:
 	case DRM_FORMAT_YUV444:
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 0fa589abc53a..03716616f819 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -41,6 +41,9 @@ static const u32 vkms_formats[] = {
 	DRM_FORMAT_YVU420,
 	DRM_FORMAT_YVU422,
 	DRM_FORMAT_YVU444,
+	DRM_FORMAT_P010,
+	DRM_FORMAT_P012,
+	DRM_FORMAT_P016,
 	DRM_FORMAT_R1,
 	DRM_FORMAT_R2,
 	DRM_FORMAT_R4,

-- 
2.44.2

