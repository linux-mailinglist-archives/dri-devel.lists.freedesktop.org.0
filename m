Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D31951674
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 10:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE4C10E410;
	Wed, 14 Aug 2024 08:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Bfp13Y4g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349AC10E410
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 08:19:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C25F8C000A;
 Wed, 14 Aug 2024 08:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723623587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FBWf54lXumZ+hhRHe3Mk0Bk6xMn84yJ+slIW6jLvcVE=;
 b=Bfp13Y4gmWOZpIY/pOiBq/9ZYw9xik1bz1wnQJuZwN7IAmxUYSFxZ8wx2P7RGmUhi2g+Wo
 MLfMDTSGHHToc4jwE5Rf3YaQcc7I3JL3dhEv0sqH8TcSP0nedOVpJCQjh18/Q8gkTmZg8P
 z9I1ktq+KKWvr+gNF/AX7Hw++0FzHpyh8JqaK+UYNt0enG8GNbKHXKu+bdZo9QAchqaXyj
 DFSxu1wccj4wFLIBVQLOtrlxsFg1w3A8qp7OKhWCRxx4oNWuxJnWY/uBlzdFxTgMyt3xvq
 sEvvLcHybuccOHwRMrnhti8yg6LpTgzOhxTKL/H6tZOEo+qzFua16qRLLxUm1g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 10:19:35 +0200
Subject: [PATCH v2 2/8] drm/vkms: Add support for ARGB8888 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-b4-new-color-formats-v2-2-8b3499cfe90e@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2595;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=tHOYCwndCrcrYZ2J3sSlvyKyS5INO3/s+AeO+x2ugxQ=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvGiezmnsdW2O+kYA7nkoemaW2L5qDmqBOQaD3
 9cNCzDVnf2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrxongAKCRAgrS7GWxAs
 4juuD/9TswEtuzCen3eUtDa9j5+pr0ZezfmHrtvWczfey3mHOkL/VnZi1gZ1mMNeCVllgwwgCOk
 JsjsVII2v5fjC2HfV6/7n1Y86hrq23cMf0muzGYmh83mipaE64T/VIffTMmZldxy41p6ObE9i0K
 iDGt44QopKdncR63CElehTtbqmfoEUCDkFv3ko468B8OeDV40df7oKBitirD1FQgBSbFWOzmQmN
 pPMvFYF6lK8lsBJ5Mjt2NY7SetHq+1vsf9HeihlMFHkkYZvLzgqCvlAAT9Bd01DkbhQJA1tH+U+
 qfhuTZDglyZKDyTRcB00Mv5z2Wi9svjZh7q8Zv2U+QRTgJ2+FjU3R65QjGgCbRlBPtpTQW8ogv9
 lnuivB7JicKJqRZyin3KrXSx+/70tUN+poFQX9Ff5KvbKuJyyjko7ga+tRTcV8g0UJqHmZAl1Hs
 ch/gfLoGc4Nre0RAFBhWIqT8kq1yw8BkJxfkedfYt0WeEJLMEEaEyKu6u1KGD17AlQecSc9xaO/
 kDCycqGYSvNxBeU83/lxbIMM+XRQNPRcdSRzyA2a8M2iccWzOnnO7oykVRyCVjk+mYHYSWU6ihK
 iRScHNhdGQ1zfuVH7dBuImR1SFJx8Emj9KleAEGQnrFv2AZ+vIEtGZRcYGGaQ927fNJ5eM2YXDx
 Kdq+ujnLy3LH5FQ==
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
index a03e07874b9f..894c83c31f97 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -430,8 +430,14 @@ static void R4_read_line(const struct vkms_plane_state *plane, int x_start,
 
 
 READ_LINE_ARGB8888(XRGB8888_read_line, px, 255, px[2], px[1], px[0])
+READ_LINE_ARGB8888(XBGR8888_read_line, px, 255, px[0], px[1], px[2])
+READ_LINE_ARGB8888(RGBX8888_read_line, px, 255, px[3], px[2], px[1])
+READ_LINE_ARGB8888(BGRX8888_read_line, px, 255, px[1], px[2], px[3])
 
 READ_LINE_ARGB8888(ARGB8888_read_line, px, px[3], px[2], px[1], px[0])
+READ_LINE_ARGB8888(ABGR8888_read_line, px, px[3], px[0], px[1], px[2])
+READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
+READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
 
 
 READ_LINE_16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0]);
@@ -635,8 +641,20 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
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
2.44.2

