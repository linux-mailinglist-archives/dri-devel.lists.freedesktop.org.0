Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A713B870576
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 16:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075A31122AC;
	Mon,  4 Mar 2024 15:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TlcsieNk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721DB11205E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 15:29:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3540A1C0010;
 Mon,  4 Mar 2024 15:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709566172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=26jfrCIS+JUx4NErVJifAR1jnrL2bLpCNnl9zevyG7E=;
 b=TlcsieNkAKVFD19DF8gNUqZZYrv3I8hzwSXVbo+CbM9BHBMeA2/5wD8YnKfhWvXv597Nro
 RY3VzSwNJBS8UMkoBi8JGoJvu4iENP7udsOZywqu82ZFa7LBwBLE0QGP+CwPgrZJtHXqxp
 BNx+5NDKtsxunj1GfINU+O71d+yiR263jiN1MNd1qfLrAZTsToi93UHpQl3JIoeGchKbhg
 bf21qE3YtoZkAI+oBkPIDqDlcbncLw4jDBiqUTN1AOcBd74r7uaScTpU0E97gHLpFnaNip
 E1n00vZQrZZzO+PbO3e6qM4ZYnerw0cHj9iClY6WY8pYgUm8lBtj7ld6G87nNA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 04 Mar 2024 16:28:17 +0100
Subject: [PATCH v4 12/14] drm/vkms: Add range and encoding properties to
 the plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-yuv-v4-12-76beac8e9793@bootlin.com>
References: <20240304-yuv-v4-0-76beac8e9793@bootlin.com>
In-Reply-To: <20240304-yuv-v4-0-76beac8e9793@bootlin.com>
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
 bh=Cnbjjk3lDbLwEuT/PRDsmPkqIyFjzRh3yTX0NhmzJqo=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl5ejMXZrje6UM/C+p7h5+cW+P2NbkwUYAEBIyxQsi
 FyLQEMGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZeXozAAKCRAgrS7GWxAs4iCTD/
 9TRgvNYIht1ieF035Yxk5hgxRJjWNAtpZojSWqH1NfhyABwXVy3Pu6aEAy+voqlrx46umtKIwjbqGe
 WAp4YdgEEoc3y4HBvkk8/AxwbIHCKPKUn/cBuLh+Oerkk8Wo+oh+V741ie7YlOJt7WG12QTeJlBJRU
 Ff+J2Y2v+Mf7QWh+xIHqlb/VmyYxnWSwNVqAJdtc/lvzPBTi+VzEqWAE4GJ/7zKgwLPw5aZlQ7ZAfW
 uLcSOjHGZBF9PDPyC3myovy/BDKpf+gQd7IJSteRNsJJSX0Kgd5qyCIdOxq95nF+R43Dx6q+tS2jRN
 9XRXGLzdgyVv+TGQfhYBL7umwwmuaJMCgNeOVrvUxe4UP+C0IGrnRpY0yjxhFAQ5Gq1VGwDxKoHBcN
 uzYNo6DBAYkqoO7xCPcwh5W9w6fE+l1yAgu/uQm800FvOEP1XBdhBvYenWA0lutozTlZPkpxvdwXik
 Gw8kEFWbBKdkNvMr+yACQIKBqwgtfa+pGZeRz++klBSSU8mm19xdklVXvavmEwVRuOKDJHpv6uHvv2
 ErsWkFUAY3sBVKxpbWPtRddvU+ha1bKEP0xRUUzx0bWSl+jJ36O/kVyCmiWo/2/k5+qqhlXEy1+8Sv
 QmbNLXEPSC+xdVVSDaRYImqZYb6PR96+uRf2kafsW1HJYL1IaGmyrMjG1FJw==
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
index 93d0a39fa8c5..4bda9ab6e2a4 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -223,5 +223,14 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
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

