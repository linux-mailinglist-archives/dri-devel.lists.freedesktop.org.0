Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 118DA95167B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 10:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A66110E424;
	Wed, 14 Aug 2024 08:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="d8pyUrR6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A431910E41F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 08:19:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 573E2C0005;
 Wed, 14 Aug 2024 08:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723623591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jwwNkXRY6lmEOrw+igTtyBvP0kqQ2nuCn+F4aNEGdA0=;
 b=d8pyUrR6PvMudhd//6Tee3KDrZG3EWCRfU/fxIlCsU7dPz1Ac7MgI3a4NreTU+OTdENhXe
 e1O4HREcqIodD1CeGIAwVJ7eGw5qR2MqiVDZ/EJ9l1ghc5j0wpkVUbqHu0jlb2f6WhX3y1
 wEjvsC59RHDU/9WnJs98Io+NuBOJBuNOwxV/ZOtHuEtqO5UyJCqhD0ObuftTVgoQsYlZH4
 HFFRveqU0VERF1qKic2K8NZkCJkUUcvZC7v2Qmijgp6pDzH9fPy709OMwc9fMt1d12NolZ
 TxL8Np1skak2jOTiAAz71xybdyexLAGAfHL2FACvk2VTQRMkVL02Fh4IKu4z5A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 10:19:38 +0200
Subject: [PATCH v2 5/8] drm/vkms: Add support for RGB888 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-b4-new-color-formats-v2-5-8b3499cfe90e@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1933;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=7ArWQ6zmluvsBt86X5iI6qfLzvj8UuOSAivLRhVa7ME=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvGifl9B5RmcfASNaIaQhRARs3R1E5LCSYIVw3
 PkLczYF4TOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrxonwAKCRAgrS7GWxAs
 4o1oD/9rd4sBtqP8VEkWITf/LVIPQw8iSTTL0cEaUm5yoJEq/CF5p7cZXpiry11y1CqQdX653jt
 ht53CLOnESvWSm5K00NuteMEtqQkCxyu/Zr6GXlxBwf01xVIJ/jI7bSL3jkyN5sBQ2DyEgfc/On
 AwvUwGyOHFeElBeVfYj1jTj1tYBXFvnvpxMXuT7GOa1x351S4BzDQg2wYyXqC0KpHGUmRU4uAIb
 mfW69IvEnBtYAXDE5nYTupaYe1JxaopO7ENqhZhS7vQuQW8A1eyuGC1x3+qEw/ZNe5dEEBc/jVz
 W9bZ8AxtDxao5q4hjrHxtD76/sLtEmHHAy+vZ/W9XRiTcgK668XFzTEV5iSoMldPI+WMNjnlH3O
 0I3lf7HzH6XQS2n+OTNnJANqwUBuGvJ33tYIKY3aVL3TzViwblayzIypa8wRGNOxMoWpMWw3EPB
 rs6pZ+5kzYcRvrm8UrB1U1RSPmcrQlZen3M/4VvvNI/7+fSBlZVsd5Kc3/4RXoV+ipAI1tfS14B
 Jrc/Zht6xfNUD70y20DwjgIN5bSEkYuTlhXWKRIIq6ZG3ytmyeUbPsQsZOONq/UEt0+WYjiPI3h
 c5Nm9fWlRV37EHMd9K4HyOWvmxUcO42OIlFC8jIxigsuxBu9Fw7X1YyI3ETXr5RbGO2HSzowDw8
 45GiXmDBcA8fOfA==
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
index 76cefd301b4a..b7c378552340 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -459,6 +459,9 @@ READ_LINE_ARGB8888(ABGR8888_read_line, px, px[3], px[0], px[1], px[2])
 READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
 READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
 
+READ_LINE_ARGB8888(RGB888_read_line, px, 255, px[2], px[1], px[0])
+READ_LINE_ARGB8888(BGR888_read_line, px, 255, px[0], px[1], px[2])
+
 READ_LINE_16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
 READ_LINE_16161616(ABGR16161616_read_line, px, px[3], px[0], px[1], px[2])
 READ_LINE_16161616(XRGB16161616_read_line, px, 0xFFFF, px[2], px[1], px[0])
@@ -677,6 +680,10 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
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
2.44.2

