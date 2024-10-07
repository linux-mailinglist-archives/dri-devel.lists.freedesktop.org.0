Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE769933B8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 18:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6A310E3E2;
	Mon,  7 Oct 2024 16:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ERjIjuH5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E848610E3DD
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 16:46:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A29A24000A;
 Mon,  7 Oct 2024 16:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728319587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NUZtJbmneGZ+YDYKXPZlJ4H5daa7MYGpaeYcet1yA+4=;
 b=ERjIjuH5kcpOrHg1MTdA66XBy+TseV6GZ6uvCl2j3JBeJo6OJ+zywCV8P4Uosmj55MExsu
 4IDy0v0oKnmeQMNTnfzzFxdW6isLctvguOCXcysEwTpqhyLOaqSnp+IpHyw7JcVTciDuBv
 s5lxP8+H/TlCuG11Kx/MSmNPBrvBicaAGGHecyJTKDr1Zl1a54/IYeXg67VNq7MTrae8cf
 OpWRP50nYAQtrTNhw1YsIw6UXYJsDA/zyZJeBOJA8K5e1QLWYp4VylAISOUqf8WDRMhdLX
 Mf00eHnWMW8NU0AMrdjyehlOAV0O1Xxvvj6ykV46ITsicqWVB8hAf4qzg/cA6w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 07 Oct 2024 18:46:10 +0200
Subject: [PATCH RESEND v2 5/8] drm/vkms: Add support for RGB888 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241007-b4-new-color-formats-v2-5-d47da50d4674@bootlin.com>
References: <20241007-b4-new-color-formats-v2-0-d47da50d4674@bootlin.com>
In-Reply-To: <20241007-b4-new-color-formats-v2-0-d47da50d4674@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 20241007-yuv-v12-0-01c1ada6fec8@bootlin.com
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1933;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ejUk7GS/wHj27mDvtIilIsC3ld6QfwwuT6b3J+l/QQU=;
 b=kA0DAAgBIK0uxlsQLOIByyZiAGcEEFygqa2gVvD5i+nmBNcpxWN/U03jKrNmhXVHpTSf19r72
 okCMwQAAQgAHRYhBE+PuD++eDwxDFBZBCCtLsZbECziBQJnBBBcAAoJECCtLsZbECziChcQAL7w
 8HuxKW9q2+67I8twrwe1h6QjV3qnWmcFrUK0CASynJmlxBwJz5b8SoazK0CYMySXYmIFrq/njHz
 k2QlZc7gmIoaS//6z2qHrD7eGFD++3Ycc2wikRxOpeWRI21lrXMPkUnotL+u/EvHi6YJa7aHFWC
 wHWR1cpbRmtwjtQcE7GAbGwi5qzY0w1Ho9nHh6srt80LFZ7J7vWovJn7LdnxnJ/sq3Eq06DitbI
 lAiLhzJPNyUy5Hz69F6xWSGtAtdmvIgN5JSE7at+97me/pDTYTT3DeeaK3MVhJSqp7fwhAzzTuE
 9RANWHUKVkhtEaHmkeUYC4Yk7V7NJ56NcGSXa1ipMXNyqs3BhY2EEt0OybiNFsnexI06J0d5jt3
 PqgKvS1xmsYMr80v0qYeuV4lNAS5oQqrK0L0MlGeEbrngdG/LD6pxRCFK83fGD+MR6LA0RiCJ0R
 SxzIdoRJQqZ+SgTmx/NC2if6e89vj7SZ0tFUuhO75yk2cGwhqWWnHJbhkgGT5AFnmsgV5L2ow2U
 SI1LArOfS4RxRh4p6nxx13E+Zmk0VIqakho1oqBFmI3tFsk8sjn0p88UbqJxjgvOVOaB6n/EeAr
 kGyZWiousOy2E4TLNmy4DJczrP3CYySnmfH8B1Qn85AF70AoyAdnAFTTvpdyBEZzBFxaysOx/fP
 5L0Gt
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
index e34bea5da752..2376ea8661ac 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -461,6 +461,9 @@ READ_LINE_ARGB8888(ABGR8888_read_line, px, px[3], px[0], px[1], px[2])
 READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
 READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
 
+READ_LINE_ARGB8888(RGB888_read_line, px, 255, px[2], px[1], px[0])
+READ_LINE_ARGB8888(BGR888_read_line, px, 255, px[0], px[1], px[2])
+
 READ_LINE_16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
 READ_LINE_16161616(ABGR16161616_read_line, px, px[3], px[0], px[1], px[2])
 READ_LINE_16161616(XRGB16161616_read_line, px, 0xFFFF, px[2], px[1], px[0])
@@ -679,6 +682,10 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
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
2.46.2

