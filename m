Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E3E8C3C80
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 09:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8F010E4D1;
	Mon, 13 May 2024 07:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Hf/aZe5h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D55F10E4C3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 07:50:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6CF3D2000B;
 Mon, 13 May 2024 07:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715586655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Rm+coOfyuVkQO9evbSIShb9ufh/OnsJJk+xovmjQ24=;
 b=Hf/aZe5hL3EQ4+kgN8xM+O0eN7qmURT14NlpMkuOFlzsW7Tl+FnV2zlZsz1EPuGJkEmM1O
 98W7SoRp+S8+7Ixexx4qcyzQKn42bEuM12MfJKfdG0teU0RkAb6qd25/TKVwkVgrLTgJ1O
 m9bwJdEFO97iCpHNr6byubN+liV+KVmVYkmIP7bTZL4Mj7lyKuF0YKDLMr2GQ9pqMyNTuf
 o2J20QL9zGVu9LSX01otlwJanwWG/6+X9mx3DaytLadz2rDeF/9DNpsIuMK84L62cRxUiG
 6sIkBSy+bvFTeAhSafcj9E314CLHo5bdp2h0Y4GqNHGen8QBsBDTH+uVhcVfbg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 13 May 2024 09:50:34 +0200
Subject: [PATCH v7 13/17] drm/vkms: Add range and encoding properties to
 the plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240513-yuv-v7-13-380e9ffec502@bootlin.com>
References: <20240513-yuv-v7-0-380e9ffec502@bootlin.com>
In-Reply-To: <20240513-yuv-v7-0-380e9ffec502@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1253;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=5x6LmxTgmFsdwCLT6+4+DnviNaQ8VRiCYQVGWxE2tsU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmQcZEu29XlTjUhTejDx76AyzVimAYORh5Fhh8a
 F5pfj3zxJSJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZkHGRAAKCRAgrS7GWxAs
 4pajEACV3ZTBEg6tNVSeAgbW0wUJuEHIvejG0md6H6lu2VED4LhfmyW3SQd2qK/7K3T+D6xPH9K
 bBkAo2nebhW03x+9Az6w8ON7wGRyNDZjkPadapJDauOr4hKt+0q8lQyqcCiEGQgUUkZNdGJDckH
 x6WoNNq94dC+SCB80i1cppe8Hqwf5qtsI93Evy8SLA7w3mMmi0nATq3ZhfWswOKvE/FbVnDkZAS
 Bt85vB3BwfQ0WED8FmjkNXd5JdmW7JTMkk3ZQzQX5E51vZr9eAafQAcwdYPKbpZMZmcJBF4mJgX
 u6HmMIhMcQsSAnovkQcDCJ+KOA46NMS3QMzWjCjcOAeCWEk3ommOiiDMGZ1k0aAQfYDinJOKD5X
 BRyAH6Gahjg56vVy5uQTwDz9jXkCLbautxeOCs/e9JYhzVW3Lg8iKtwUQbDphix87P08Pvf+U4C
 h0w2DVD5cCxxQq8+Akbmk792dGb1Q1NBiAIIhb7eUWERnpH8v2+eJNeHy3Fy/SsYB9yS6lQIn4K
 Y2YzjfxAU5T8iVtl/zOIHn8mnY10XLUJ+hpQWMFcQjmSK1hqVwU+59nPNG1TtCCyNNbv63QHUr7
 9/7qZIS59VK9xjocAKGTCtSGQ57hj3xwArMhMoXi0usWGFO7E13VBe/lY5ApNVz95bCQU+2GPWI
 6M41EbUpRp0f+CA==
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
2.43.2

