Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC209932AE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 18:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0ABD10E3D6;
	Mon,  7 Oct 2024 16:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="R9/EeZDD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B555D10E3D3
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 16:11:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E87A40011;
 Mon,  7 Oct 2024 16:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728317459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LZZXCAOt96HKPNadssGl+s0w7QDIgwJlOE/lg2YiDu4=;
 b=R9/EeZDDkukVZkkpMvN4WzCA52L3uu5TosmVs2Hq9zDio6+YkZ9D3dLXzwas+C7jBLX9vc
 OI0sApd/5ipfXGRb5L1BKGHeobr5B9VFT5Rgj9cRh5q5WPaFfQPvwBuGnynj8ZOxDA8Ck5
 FOgfa9peAVbUzFLcvSRJpij3elKqNMxw6jQ7pqqCyOGe+HzyqbiHkcPgJ+VQVb1UphfhnO
 fdIEZrzRHMD9MFhMhBjFhZQ5ZTic9tY/yOZXvtVql+j9IPQQ4VK8gAjh/YkwsgAbfmyG6S
 C+Hz9l0Al2Fyw8vqNZbSwnsiwdnhUwo6jBmltCcKTViR0iuO3j5pkH6xVNfr/g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 07 Oct 2024 18:10:45 +0200
Subject: [PATCH v12 11/15] drm/vkms: Add range and encoding properties to
 the plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241007-yuv-v12-11-01c1ada6fec8@bootlin.com>
References: <20241007-yuv-v12-0-01c1ada6fec8@bootlin.com>
In-Reply-To: <20241007-yuv-v12-0-01c1ada6fec8@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, Simona Vetter <simona@ffwll.ch>, 
 rdunlap@infradead.org, arthurgrillo@riseup.net, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1253;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=VB/TChUFVIfTCJz1NYTIIebS+nzvAngxAg3Yry+8p1o=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnBAgDePR8EiFnnXUpBJ1MaJbk136pHLXy63awa
 mjQm8LrWmWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZwQIAwAKCRAgrS7GWxAs
 4lOtEADXdMkwzFU6SwIvoYVYrwUpCX5m0QEmypLUJsQNrR/XY1gYIpylS/4ofI2CoaGkFVYJyP6
 CMOfZDNBh3xvvECoxYFyctUKoDLj9lYqNMUvjCVuqV6Da0HbRUzHEuDyqZlv2PJXBeaf3GT797c
 efML4RfFA/7QqXDtbpBHlqrAx1oXWUSxmZUwTkJhlvtP3tLdmA+RogpNVG8Bf5q61218dJ+H5KK
 bEQgOaOzijWSbSvddUwj9SECa6z6wLmxF8lUQa5NHsK93GFYMJGYD+5IAcXnyuAiPXCO9b6EQ5n
 H0M7nmsiGeEkuu5PHIC0Z69PEWih7HOrEjDWO6g0NdxMfxWYMh/P2BU1PJXbHKbG6/vv8YK70bb
 bmxLGLJjhPhrsjCLeQb+FI/lguNSsVEfe11p9jy913dmbnduzejB2j5v1TF+BT3XRfCpA9SEJ+W
 h+pojaMbh8LbkghWAOGoBYexVBi5YNAgRYX3Xo2VWxK+iEvLz3CtnVMRtLmboptm6FbT1jaOELQ
 myXs4cHA5Wu7RDESpkCMAUW3IoIXWojzf/gGvI8xXDkQHNl0/bHNaaqm7B19p+hn6gzmUQHdUoX
 QohiOFSfeywZrBpyQ5xe77+UkSPBIoDP9CcXz2iG15DnfipoSFzFTWnIk6RbWsd9yshOfJzQ6jc
 y0vwTh7cfj35xPg==
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

From: Arthur Grillo <arthurgrillo@riseup.net>

Now that the driver internally handles these quantization ranges and YUV
encoding matrices, expose the UAPI for setting them.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
[Louis Chauvet: retained only relevant parts, updated the commit message]
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_plane.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index d4e375913122..8f764a108b00 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -218,5 +218,14 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
 					   DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
 
+	drm_plane_create_color_properties(&plane->base,
+					  BIT(DRM_COLOR_YCBCR_BT601) |
+					  BIT(DRM_COLOR_YCBCR_BT709) |
+					  BIT(DRM_COLOR_YCBCR_BT2020),
+					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+					  DRM_COLOR_YCBCR_BT601,
+					  DRM_COLOR_YCBCR_FULL_RANGE);
+
 	return plane;
 }

-- 
2.46.2

