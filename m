Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE4B87ADEF
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:45:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A3810F81F;
	Wed, 13 Mar 2024 17:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="SeJaOX7n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9C410F7F7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:45:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 591544000C;
 Wed, 13 Mar 2024 17:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1710351939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HGht90527wTlRNy6SY5xIteQweC9dJDueCATJTo/DTY=;
 b=SeJaOX7n6doU+eefHX7cVezfOdU1JJCLw0gKn17svzaauJd1hPiZ4FZuKeI5T/64yHJgv3
 H//8p2QGtw/FiNo/vrIDuOYGfodKgQL/nMeehr+Uam7OYU2mIgeYj/yCAIGPNFz7NmFEEd
 jhKVDGtrkcKjbx6gMSMH6oc8qrByOWZdQ9UD3SwvqjEapusXTsOaThFZnwgVWxUjhUt275
 SzMbLjLRhWasXkCV1tE5iQ1OfnWFsr+me08qrQMMYVDNPoy5apKDDRM6sKrYdwj2WK+a7d
 goUArI/ETkMaF5fXLU/hD4RDbQAYO2mQoscdnmBZ06YTgW2XFrQW9JvffzOztA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 13 Mar 2024 18:45:06 +0100
Subject: [PATCH v5 12/16] drm/vkms: Add range and encoding properties to
 the plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-yuv-v5-12-e610cbd03f52@bootlin.com>
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
In-Reply-To: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net, 
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1196;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=6BLB7fPlNtj8wcSXI7NyfW833syTdxfhkEAKw4gWOys=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl8eY0kDZ4PGG0/Q6LPMiTDAw3lAupi3pDIHSzJQz9
 PApOGKeJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZfHmNAAKCRAgrS7GWxAs4pfVEA
 DRV22TaZl1roNuVVHsfj+Bth6rfCVXeGHm/xKG3ZE0sFvFotdnUNph4WAxPIWEr7uSB5edl8ENW7FM
 KN3vY92Gg0IImK4kf8Ic1PLzoNphjEzoCdW4KKMYSpEDwAXwmR830Zj72/6HjcSPr7z2gmj3GZLskx
 D63BJicemRyNf3tqjPjjj1gVzh7ElHkrE9F/GtMlUHxRrE8grX/Ou8E9FdqoPisIoXjbp0KMT21zTH
 +GiFhVC032j7Mlj2c7PiVvzs8hm1u0unfnnh5e3l5Wxk3h4jEZK1lPyMO5yOnlbC1QnO0kL//UJT0v
 l7/SDE87x2SkFgAOzNxRGpQ6dqIBelt+JoSQjEE2HVy8J9uyuTo0aImTpdZ68PYIEihBX3vO4bnkZK
 GrcBybVZApfk5TdIJV1h2hZPOyHwTQOAkPLdcEqgHWRy3r0Ir6bFf8Gs3wfiNb+OxWz8IqIos9d1k8
 OjAxFv5CveSzJh1JTPusxkLGRYAyHW4U+KetUPOD8/+ecC5O/OXpmi4TNVEw9ctQIt3Q63BD8XJ8st
 NUwsBJuTUwZKwLDdLi8vs8nPhvPSjxojrFmXZl21gtgGLJ82SJ//7ZQ6E3tCtT1QKyrfx2LMtZZrA9
 ChgDxZeOmIP40qSyeWLQXRwDTo14Nd4+y3KgPRHC3e9iThAb6sl6FsdIZlMg==
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
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_plane.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 987dd2b686a8..e21cc92cf497 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -224,5 +224,14 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
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

