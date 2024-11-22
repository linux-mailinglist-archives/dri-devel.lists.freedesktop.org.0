Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B582D9D6202
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 17:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4FC10EBFF;
	Fri, 22 Nov 2024 16:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="FunLCrRV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F7110EBF8
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 16:19:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 539686000B;
 Fri, 22 Nov 2024 16:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732292349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MkFP2awiNhVE1SbicVB5Ya1gxVAKEjnrfHxgO70L7sM=;
 b=FunLCrRVY2b3jvn54EHv3FHXebghYZG0RKEaBYmIYapDUx+SoDzsULp9BC/Dc78bleWBZt
 kadeaBAkaPyb6853Qr68l+A25H/f9pKX4o5gdnIt+Nf1x+ut1tWL6de+UICSifcuRdS2DN
 g39Ue14fOgW0xMd6ZQbR6glqPuE1vYOGzhl8nvNDC6XzC5fRtrVSte5/Cvc+X92q6yFncI
 gUOYXvZz4uTC06jHYkO0cwv8VqNyr2ewhhr4JaVQX92gA46X0+AVPOvS2VkUG0WmMNzSP4
 C5+2LhUQcDFf4lbshx44aNln4Y8ltgc6AIZmxBp0YSqnlGJPVrfmxhkFR2vn2g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 17:19:03 +0100
Subject: [PATCH v3 3/8] drm/vkms: Add support for ARGB16161616 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-b4-new-color-formats-v3-3-23f7776197c9@bootlin.com>
References: <20241122-b4-new-color-formats-v3-0-23f7776197c9@bootlin.com>
In-Reply-To: <20241122-b4-new-color-formats-v3-0-23f7776197c9@bootlin.com>
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
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2200;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=P5nW6CStss6XBXJFB4mg63UIwOzvzkPZvmY9VNXeEMU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQK72SKwWS6t/hvcDxOfnDTmQbN0sxqCu3Ra1M
 pHMChROovuJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0Cu9gAKCRAgrS7GWxAs
 4oeIEACBGWAC1xr5fq6T0d2MtpKpPqxqOU4jlC0Xg5p+CdQqzx38roaFuO9cXVegMwpgRuYWzsv
 heOp6IpNLjF8KZcUAzb2uhHYV/tdJcHOoWLxQK9fQjuTU5XDfbwWqbU/A3SZrrII18dYzShZudq
 +7T7BhuuE2J9Ns1MYpNyQTdq4PTeFthY5J/j4yjO32zYncl0AI6zE1y6j37LiB4amd63+PyMCh7
 G0LeIuNW1goUrgXJUaXKUtUPQeOgRexkGU12tSWy0hlA2vs4pq0RAYmyEAvqzlL/eth1FMQLKG/
 e9Lb3jbUyZcDfqzuQfJK3KyX+o94/PoUAxK87ZWFY4rmIeTWISl1CVbrgl7O5wWLfJEpvZSwg+2
 n1B9HrH2tSf9XFIHxuL5Qjy38APME/HuYhAAqBQ3qfYQc9RFeepNJaZEFk7+qyrQlVGvgR0Yir2
 w+nKPyzmKn6FIDM+nXQ2HCHILJq1T0qKZaMwNK0UvhDpjl5E12hmyMdZ3gshG+4VWicZTsIm7d0
 HppAIsJxdoOmxhOy4BrhlSPgkWcSHqwahz2xz3lvZD8IJwgLkWEka6HznFdBZaGywfObNIIVLkI
 HVVnF/4a4tCp66yHJuAcq8uLJ+DviglGRyhNrL25GptuZQD4auEKwO8Mru4vEDL9BFmNR6f2XjK
 60OLQOsnZX8wdDw==
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
 drivers/gpu/drm/vkms/vkms_formats.c | 6 ++++++
 drivers/gpu/drm/vkms/vkms_plane.c   | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 520298fc74a1e24cded8d192efbaa84041e6339d..1f12607c9009643c5749611a5001ece2b775e099 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -442,7 +442,9 @@ READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
 READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
 
 READ_LINE_le16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
+READ_LINE_le16161616(ABGR16161616_read_line, px, px[3], px[0], px[1], px[2])
 READ_LINE_le16161616(XRGB16161616_read_line, px, cpu_to_le16(0xFFFF), px[2], px[1], px[0])
+READ_LINE_le16161616(XBGR16161616_read_line, px, cpu_to_le16(0xFFFF), px[0], px[1], px[2])
 
 READ_LINE(RGB565_read_line, px, __le16, argb_u16_from_RGB565, px)
 
@@ -658,8 +660,12 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
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
index b7f498944c506631f9eb237bf56000bae4f86a1c..505847ec850855ee5c047985b0811416ff94e51f 100644
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
2.47.0

