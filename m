Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DB4861090
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 12:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2371810EBE0;
	Fri, 23 Feb 2024 11:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="HtFNrbhf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB2D10E0C5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 11:37:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27C7C40003;
 Fri, 23 Feb 2024 11:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1708688269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hFcELKdEH2CqVcdv8HdPB42K6t4+ILioqNSm5RowIZQ=;
 b=HtFNrbhfDTpPlBwtHxSzSJxfEuq60WAuKXwJdaBo4hgsGgF9pVnGIs4W6S/CCfKmRkX3sr
 T7Oy1/0CvQKzqaJd+qmXeCT1CLwsV445vJjMNlaVUEjI++41G6V9EN/Cn1Ojqd4nxXIB0q
 v3roSWFKsqAwDU2izoNYqK914PrP4QvxsIdng2QzwHqZp2G4gkk8rBGUOShtdXuuGwz98A
 5pfULL3Ug8pViDa9o0i4ZrxsCnOIBV310u0UNT6RTXEutJ4j+BUd0HU3FwxepJiUMLzDLg
 8VAbt5o/ZFlbTDA26x2BK+qdI6pRaxLRsS9pgbVM2JuEQvQ9ITu+06VEiO/vaQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 23 Feb 2024 12:37:27 +0100
Subject: [PATCH v2 7/9] drm/vkms: Add range and encoding properties to
 pixel_read function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240223-yuv-v2-7-aa6be2827bb7@bootlin.com>
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
In-Reply-To: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net, 
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=vFKwJ9LvmL6TH9o/eb/NeXNgMqZMacWZ1OBVcb0LDIk=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl2IOFEKpQWR6TBGduFZetzzNzHuB0JsIH2jSYFHsu
 mR2gtDqJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZdiDhQAKCRAgrS7GWxAs4t1WD/
 4m2QsP5UU2cuakyMhmNFSmNzFkI9oUIHva7vKKVeTCVGzIyFx7qkJsa2LztVpJU+YY4X3dOFf0P7fq
 E5sdSreH46Md9PH894Ylu0e1GRUdOwslCKi9ws9tWQhg/R9fOfkUe2ldJ4Kdf+Z2zwjxP9Df98VNHx
 dIqJbVXy8/nrxS4OhfrbExGTttViu1E5+POdQGUvytHhF/uGfK8E1yvq0pr1R/N6wKIsJf4Wr+a87h
 Riur741OnNdH4sY5SOdLVrxvQy/rDjZm5BMzb19Yy53GAHp8a/LyNMlgl19LickQMT1Dhv1ORi1/dg
 ND/qQnuf2rlXrOXfukGp2TsnfofMxrNmlNB9gqti5LY7jS7XmSB1BKCyKGaxjYJ8psj8BtZ8i2eRZS
 gdztDTq5b2A14qtGfw+myJiR3EqTOtOZZ2i1iwdVvzTix0CzolL2BvXLRQGtSQ7tbftVrBJpeZgspU
 lkRHWAZy9VWIhgGCWQVIiicah6F2BGuYePSW3Bg7iRjHZl8s/KopaD5OzTrLOWuPMa5S13vLmJtMfJ
 sa48mt/o5WqikFBwGUTVcpc9J6QVEsiyKUPGLdfAKjWUYc9edxstCuL2bXgjUegLUOTyi7MGxMuS/g
 7hNGx4kTABgx7EceXKcHRMRLLRS3bAl4NDoKqo2/cFRvyzyyX2q1DE+bwF1A==
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

Create range and encoding properties. This should be noop, as none of
the conversion functions need those properties.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
[Louis Chauvet: retained only relevant parts]
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_plane.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 427ca67c60ce..95dfde297377 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -228,5 +228,14 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
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
2.43.0

