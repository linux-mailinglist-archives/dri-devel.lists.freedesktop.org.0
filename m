Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5093946173
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 18:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC3210E1B5;
	Fri,  2 Aug 2024 16:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hnm1Kma+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B3810E1B5
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 16:10:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BAD861C0011;
 Fri,  2 Aug 2024 16:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1722615022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k1N2wKhCx93t2SWK5sURoLWP8YIYqRV+8fF3gnv/nic=;
 b=hnm1Kma+n+xHs9ffDaT0cIAahgY+9OAQRH4Sde5hID4SBNMPAID8Nz911iKt0j2Wq3odWy
 rY0UMNK6Ws8rGQ+6pf1Zux4pzWhesO6k87zdwqfp1pKARrAjoEHtTONXX9HnK0LH8svjjK
 /2tVQsVwDyrGs09o5BwWB8D5xraLBjwdvWC7lNcwq6qb1jjUiM8CgCQDn3FJbXwcYL+Yl9
 R++2ILsSZVM7H4YPAK5KOwNjTwnx5sbfvCTPA1uqEsAH25p5omBwUen/lukSoQz2SYz6pP
 lgizX0qvEjOULWv/o78LrYnxCGqKJu6SPGPCrp/YBsnZ6zR2DayFIBmcojMrNA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 02 Aug 2024 18:09:58 +0200
Subject: [PATCH v9 13/17] drm/vkms: Add range and encoding properties to
 the plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240802-yuv-v9-13-08a706669e16@bootlin.com>
References: <20240802-yuv-v9-0-08a706669e16@bootlin.com>
In-Reply-To: <20240802-yuv-v9-0-08a706669e16@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 rdunlap@infradead.org, arthurgrillo@riseup.net, 
 pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1253;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=lX/b6aaWAzynVQwgJ4uAbWlqpIRVGyKzYZlNlczj/Es=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmrQTbBw8f7J2ngkcfe8tHUs/QKb87oU2gjhYRw
 ujy6yBguSSJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZq0E2wAKCRAgrS7GWxAs
 4h5TEACsxQ50W+O6ti95R+7k4fGkPhRytLq/ji8zlMwoKjORpAZMrhMsQxmy9mNvg6/Dca+z6sj
 GsbWTI9+016xs/NSlXyDWeqbF7yTdzY1sAhFbRGgvA8pH5p4SJybLIN/XcbnwEzNwFZjeBQfDhJ
 qC7fL/e+bSQPzKjtLMfixVHift5fz+6re9XY4KmFBbvTQjQMtO2+0Y2KorJde+zgjAe5TtsYwF9
 N5HaiYdU3MIx0KW5BfVi5bHoQTfGJPH7Rf1vDti9XeQuUoR3hNwsd6J45/kR/N2IYBNnf+x17wz
 FmomV2h2rHMpt90zEN11YhN6aN/b+SLGetZAF4710wM6/g6CWcfTIXHqvqCU16TzEXHsDRUOx6v
 q+8GZeUwscJ2ArFx8+J7SNmZEK7MnvyHlfj/2K24OD7z4Zv2U667yKLQQVj+2qxwwIsNFiqHHVw
 w/BaIBHqNvyxMoBzN9HA8odSbNXTFhz0Di/+5/3hJ7uuuiS2LxCMq12UE6/yPkASdiN7lqXc8F+
 HxE1rWP6C6OJyWE2lsyWdHsPmvZauxWWLLUQhNX/0fLPTxEwDgCgUtfuZLoUVMS+ptIHctkyp+M
 vjZwzO7Q64k2zd46ZD1mTxRn9VBBvhBPGCDdJig1kOu9VUq1B3rgapT+v6QbxVECOd0a8Gwu/ta
 Tx7Ctab0sL74vuA==
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
2.44.2

