Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A43B9B8227
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 19:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEB510E8FE;
	Thu, 31 Oct 2024 18:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jlRIbD0k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB78E10E8FE
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 18:06:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2FA0220008;
 Thu, 31 Oct 2024 18:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730397972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LZZXCAOt96HKPNadssGl+s0w7QDIgwJlOE/lg2YiDu4=;
 b=jlRIbD0kwP6r8oFTiga7Pr8I3OkMIKAE1XLHqvFA+2nnFUPAmrRrcejX0mObsFkWc9xrjZ
 Z1VAGUo9qngDwZq0d2SGfY/PYPe86/UQzeIGdoCRNHp6SYaWa1HlTnINGVSpFmnqF0os9F
 j/TGAkZygsAXr4IQ2dDcJYlDGjWpWgzYO8r8LBjrTetUoephf2C9eElDQ0iR8IiWkcCy90
 4CWmtxVRQaTTsiSy8OtL9y2xSoSJQlGYtps/Z9SHRb1HdEzK5uJ/8Zh3eepgQy06ZrVm8l
 FGcNHGXgDyhbNUzsmh6kkDQxY7o/06TPVghdl2Uurq9ricpCL5BkfJMA5WYigw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 31 Oct 2024 19:06:02 +0100
Subject: [PATCH v13 2/7] drm/vkms: Add range and encoding properties to the
 plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-yuv-v13-2-c67a337301ae@bootlin.com>
References: <20241031-yuv-v13-0-c67a337301ae@bootlin.com>
In-Reply-To: <20241031-yuv-v13-0-c67a337301ae@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, pekka.paalanen@haloniitty.fi, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 20241031-yuv-v13-0-bd5463126faa@bootlin.com, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1253;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=VB/TChUFVIfTCJz1NYTIIebS+nzvAngxAg3Yry+8p1o=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnI8cNBzYvzdbEW+ukdVx3vI8o0dy2hxpvtBt5b
 acKMa2/GD6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZyPHDQAKCRAgrS7GWxAs
 4hkpD/47cr62P6N7DyPlN+SqvwNwKOTNrofNbtuz+ngN43gdpj8q6M7zynzIqIXO0GL2DnKLUcW
 q34/iKYIkZ4B+yVVzsMIQw3l/g2CTRGXNgORU9RGxKnZSz+/B8DcPl2NrDVy1wjhb9NIUQ3E3b2
 G7mJBYpqqfR5qgiiu6ca6cZKIuTkMgx9khImtBEtnu+3k8/wRPCk7F3iwfFNSufNDhSz6qq2vNe
 XHPkHBaTv3MtmSOCpQ405klhswJepoK0Avr45uH0dRuOz0tC5NritQJI8tQWMEBVLHDkWIoQsj6
 YNsd4Xd8miAvRU2qkxnrDc5iVIKQ0sftnrAGzqNUzokAQU2fI9H9TxApV9Pz4ypwAiWj/fuege+
 uvEQbOReFlkS+0ZvLj4Q/aO7lFa9BYa+2tsA8PgS2tEh0nG5XBrSBSJ0xTI8ctMTf9YfMAFaxqY
 ZQDDKNCHf+bgtNJhC+Nqff/xABanfbJjO2wTL0Y+Eddzvcpt5/I1qmOnUDx554iwEdOix6oTeeJ
 9OBltfdOlir+6J9dPYE8inlauXjtHCVpAzc9CEbfXDlkiSzVYS8qceoZjjwMtVUsISg6gGdP0zq
 IbnDRo5QfiiyRep7rDk9n37lOafnDlCJ4VVTbA16F5w4BuXJYKB3gYTQRHOtymYi34qf6il5v7o
 Lq0+iUX8jPZ3Rpw==
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

