Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAABE9D6201
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 17:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FD110EBFD;
	Fri, 22 Nov 2024 16:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TSDSVm13";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BDE10EBF9
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 16:19:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F90360009;
 Fri, 22 Nov 2024 16:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732292351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hxHofKZoem7NTwx2e51YaIJsnuWipPm4SrZGnIVNA8c=;
 b=TSDSVm134r4O/GcPCqhjTraNZ/Hv9z/h5WYY8Y3O4XYz+dPPB0+0sjyt4QYSCISl35KkSH
 zXctHq3wg3n7+5b+mwHuLMrDZ9ydlJfExO9rzqURrvqiTmzRKF3vDMWsDRvs13m+tMlfC/
 bOp90pEA9DFJOn93aPGeOhp+OCYt0OdsrmdGKF/rfcm8PD7fbErA2sVkKOFa/mtLjrdjaM
 YN4MSdlESjkE1jkqOa8cj2p39gisLjNw4XOtGCacHPzwQ8yIwK/BU673+zFj1ssD88LOJv
 itygsMCVZczfmDvw/CqrVwF6M/tj3tqOSDmt+AQKJKQ45Ik5ySsDFr9kHOH+aw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 17:19:05 +0100
Subject: [PATCH v3 5/8] drm/vkms: Add support for RGB888 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-b4-new-color-formats-v3-5-23f7776197c9@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=0QgKkVDHdfn4g/sZ9Ryhe8fOiTwNEjOz77ipz3qqPqQ=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQK73nQd8g2Uaa6WRCrf0T8UsTYQ3snrQRhVwG
 lWwD0HmrUaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0Cu9wAKCRAgrS7GWxAs
 4mbGEACOcewvrgjp33AeKzYqCsW4WeHqG2cr1ZCK8dCS5HvTlN6eN9+4axKkyKXF5yyIuZYn5Ue
 OSSzsRypXv4/+8nr1N38LHcw2hZ6t0rMK6prmRvJKgAjlDNtPKUjpCRVK2jpnh+uOMl/uxwADoS
 jGsvLfw221rYo/xufcI5Vpnwych3M5kHmkXeEhqwgROOuQDS1EFNJuV01H7HS/9k2WC+OSPaTKh
 c3OppPVXVu3WTIskaEkB9DrA7QDvbq5j5ItM+CNXDJKGrkcSH0Is0zpRz0nyckhSg0xMt0fYzlw
 wmHkB+yulsGoaqwX6RKCXRXlz8SaBG4N0zonlfhmH6s3ry7FoOujakwZaYsdrGkXsUE6UY8VSB+
 dmCa+tQQqaGX4Stiib5pXwOJuvyMCVCUvar1/ALd/prfA9OO/rLAQxEU9orufGTLqMTSB9vskM0
 LrxWeEVabtR8ynnlzyNV30diZpCKOyr1QJ8Lb8RhzRR4XUx9+Sw1N9WB9UmvipV+cHUSgkFo//i
 KvVtUXxZ7dmO6MDhVUBEYNpCpaD3TA7TuKN042MufXZYy3MAoj6aitgY+B6RuAoQv1WMbeBqKfR
 tvHAPqW6ry3BfFRVlCjSuf0/z0F9mcl6poWeLwIdR25Ku0dlPEbHcQCLwJlq5jXF+AiFATxDBqc
 wNEcn8WrGbRpbzA==
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
index 7af6c5c048d5c482f47e4bd7954b765bc2d13b9d..f73d3de33807644a7f7294a4dc8b9de2bec6e427 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -461,6 +461,9 @@ READ_LINE_ARGB8888(ABGR8888_read_line, px, px[3], px[0], px[1], px[2])
 READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
 READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
 
+READ_LINE_ARGB8888(RGB888_read_line, px, 0xFF, px[2], px[1], px[0])
+READ_LINE_ARGB8888(BGR888_read_line, px, 0xFF, px[0], px[1], px[2])
+
 READ_LINE_le16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
 READ_LINE_le16161616(ABGR16161616_read_line, px, px[3], px[0], px[1], px[2])
 READ_LINE_le16161616(XRGB16161616_read_line, px, cpu_to_le16(0xFFFF), px[2], px[1], px[0])
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
index d3783a8f84c203dcf772ccf84dc32a6ddd4fc573..e82b60fcda4bc2f2337e9c1e65515548ee06c9ed 100644
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
2.47.0

