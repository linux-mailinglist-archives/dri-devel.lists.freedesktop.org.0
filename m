Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8675A9D61FB
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 17:19:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A87010EBF9;
	Fri, 22 Nov 2024 16:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hsAQYWuq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB8610EBF1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 16:19:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BFBC60008;
 Fri, 22 Nov 2024 16:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732292348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yQHb2AQUZTKgO+ldjVa5ay9EUsJ/fVjYqsXQJEb7ICc=;
 b=hsAQYWuqHweJB/UIdhIRgSi3XInhJ58XaXUlMMAZous8mzhTAGJR8x+iUiam/eBFKDeOy0
 /cwkAD9RiCgvnG8etq0+6uPl7asr9Zb5/RoN/KkwizEKhSZ48AlPayujkSbwWLUp2DtDo1
 I6YYFcyH7AEex5i4JuY5/LGZGUkr21XXWwmys5nZERlJxSQcNGskrrsQre6tDTUAIGGEUM
 A50g3zNYhVMx3Dk1kXxwoTnqNUHkB+ofVXaWqz7B8x1+SKs8/kACI4CE/btz3Ka5+sX5uj
 FnvvfacrPSmuLZioSX1Bb2C8STlkuVeDujWpoi5HaYaHVgit2b5n2WprI1DJXQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 17:19:02 +0100
Subject: [PATCH v3 2/8] drm/vkms: Add support for ARGB8888 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-b4-new-color-formats-v3-2-23f7776197c9@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2802;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=gJNge0fDzpH4LyPjnilSlTnJcUnJayCSzW4JiJCQxPk=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQK72t+Iob3mJaTm9piaeXpkzVIGGytAhcjk9r
 rIJEe80Jm2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0Cu9gAKCRAgrS7GWxAs
 4olkEADXifTgmeQG7EMSKAmVn56M2Qz0MXBMHnFznerbrMXQxGgoX+rZqmgoQ20SsS0hVC+mSZD
 ge2Bj5lViU3uMAOn6E2H+NgNCf5+7TNYqcSdCzMF0XvCfENfqhhbgsg63+/8r5DLxCmbXEpMORk
 wACi8sZmS1wynFRIyNHDY0OcuHmS6YRUjxwj23IpspJi60yD4UdggAz0hITUyJOI0uMz8moXFGJ
 NyHJUCdmmT4KUJk3nBPyAbwhQyA8U64W8T+eWaVWRd3OSRoT3rahcfJ7KpG7VtJ/NzwWQCKbVgs
 hmGvNw7rdOakgDRXpg9gpHcctoCSwdS3OcFosNHNw1sNd4fGf/WFAgk7tVt/zE5u5pm5lCRfEm0
 Vx7/da+mjNZKq6MCdnTMUHEIIf9ZVvTUfGQ0WmHLa+tLKrIlstPtScV5GIkIFBEzslA+Dt0rLg0
 Bo5/vsX1eryP9M3YAkutbHNCTeB2UDzZbR9RNz+u6f2bC/zNd5uvYFsAP1L70LTL0CbVJDTkxYp
 zDXScrlH0ZWn0qKJCXO8dXH0GBOFukjfI+3DLAT9PYhByzHX9S0rvS6nWqsLz6X/ZpgsEDRvrnK
 1a45EAocZal83YvzwIumDGmUrscjQpsWEMDbP+Aon4pRxeo7f8bjNkf/kWl0NgJBsHxbIOhrXof
 jvv5TsUCXv21Mlw==
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
index 9c4aaca7853102b86dcfd8e39a8f70392d019aed..520298fc74a1e24cded8d192efbaa84041e6339d 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -432,8 +432,14 @@ static void R4_read_line(const struct vkms_plane_state *plane, int x_start,
 
 
 READ_LINE_ARGB8888(XRGB8888_read_line, px, 0xFF, px[2], px[1], px[0])
+READ_LINE_ARGB8888(XBGR8888_read_line, px, 0xFF, px[0], px[1], px[2])
+READ_LINE_ARGB8888(RGBX8888_read_line, px, 0xFF, px[3], px[2], px[1])
+READ_LINE_ARGB8888(BGRX8888_read_line, px, 0xFF, px[1], px[2], px[3])
 
 READ_LINE_ARGB8888(ARGB8888_read_line, px, px[3], px[2], px[1], px[0])
+READ_LINE_ARGB8888(ABGR8888_read_line, px, px[3], px[0], px[1], px[2])
+READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
+READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
 
 READ_LINE_le16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
 READ_LINE_le16161616(XRGB16161616_read_line, px, cpu_to_le16(0xFFFF), px[2], px[1], px[0])
@@ -636,8 +642,20 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
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
index 81941914af87fcefb180dc393f2ec311f1a1d3fa..b7f498944c506631f9eb237bf56000bae4f86a1c 100644
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
2.47.0

