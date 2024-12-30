Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 830CA9FE9F9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 19:38:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5DB10E568;
	Mon, 30 Dec 2024 18:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PSITxTjr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF49E10E568
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 18:38:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 499DBE0004;
 Mon, 30 Dec 2024 18:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1735583864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uXVFlt/M2yXMzY5/qRvMCWmbv0QIUsPFjlivd4tltRM=;
 b=PSITxTjrK2kyLXd+ZVlKQjt5t3mxDVO3qEfjjS1nPK3RX+62fX/d52udYgCsSnxR1EnYGl
 A6kIOwc4QCQJNJLflJrefQXxTsz/zYSU1jpdaU9nfjmYFTsRR17BCD/9LaFVKQFtOQt3Z5
 TVvHtQPSfrX1MDPgzTSzGHvg5ypZSd3iwkltvKKugLSvpl087Rx2fp1k+R9ZcoYXKXO/G2
 P1JMlKnxk76pYUe3ftXQ6/HsyqshkzgdGRyDf5ejEOUpkVTiAUmsSeOKgjx1RCioR2j/Ti
 D5iveXN9BuZ0RumbfEaljL7GM3rdmMaeB/5G0YC9Ov/1+Ocw+2fQbnPTC/5FTA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 30 Dec 2024 19:37:31 +0100
Subject: [PATCH v6 1/8] drm/vkms: Switch to managed for connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241230-google-vkms-managed-v6-1-15c7d65cd63b@bootlin.com>
References: <20241230-google-vkms-managed-v6-0-15c7d65cd63b@bootlin.com>
In-Reply-To: <20241230-google-vkms-managed-v6-0-15c7d65cd63b@bootlin.com>
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
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2123;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=18DPeCWxOUuQwaVIAdaCjW1Z0dvcR+suDpSINITGFoE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBncuhwGyYTz4EEkDbvg6PkxCR5wN4KsBpqVNyh7
 kL/FYqwBguJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ3LocAAKCRAgrS7GWxAs
 4kS3EAC3yNnNrz1V4b+hLSZf3RceBUd32p2uRq6vF2R0eL9y3cICYNJS8IDHlrDU4asmSO+JWxH
 rgbzvrSRDaZNBdgzJfMUlXeqbwl+pR6lWi5lVLsHfq46E56MOa/VvLy3/va5zLDtRxJjc3ziN4d
 A9xIcfZTV6x/LZ6PInamv/ZwYx8lJ3ngKZvhINe8m3NI1Gd7B6oydhJk2ePb7HayVbE3FwpDVfh
 zn6M3JoeI/B5S61pm/I+DVkyksCvgUmOvhF7k3x2xj+yVEVlEblNS/pIctap4RRwV/bN+0ySFyh
 6xf5BzwlW/Ve34UfhI+f311n6hrDu2BPz0lMHPj2PUMDuiqeZRdtEgmgVYqPag70Guxmg74F4wH
 k6Oqz/w82ZZh83QA4HqSlVn3kQIE3c+LcB25dv97ggFA3CR+wacgISPMu23iGjnA0VuWWYJ2d0T
 6TgaJviejBwogAgzoV5rdKif1dG/wCglNQ06kILtHk+L11uFyKtvOBLjyg6wYQUJbTBpbvfpfiB
 HUSViZioDWINPZ05yxfwraf4kWihO254RrCraR4q2HoeG3yaaV/OQe1/QXXvFfyyzr+FhoUD5zr
 SMm7TWT1K5kBkHudn9Hz0DY7zZEMCRBYOKerX9En/fdMgIAhAPu85Hqn7PwJRJIVqxW5uqad2yE
 YhMXlwM+LqzxoiA==
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

The current VKMS driver uses non-managed function to create connectors. It
is not an issue yet, but in order to support multiple devices easily,
convert this code to use drm and device managed helpers.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_output.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 8f4bd5aef087b459d37d0cbbf90fe0145090917a..570823ecb28f589e6323036590ec05a2f633bc9b 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -3,11 +3,11 @@
 #include "vkms_drv.h"
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 
 static const struct drm_connector_funcs vkms_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -75,8 +75,8 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		}
 	}
 
-	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
-				 DRM_MODE_CONNECTOR_VIRTUAL);
+	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
+				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to init connector\n");
 		return ret;
@@ -88,7 +88,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 			       DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to init encoder\n");
-		goto err_encoder;
+		return ret;
 	}
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
@@ -110,9 +110,5 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 
 err_attach:
 	drm_encoder_cleanup(encoder);
-
-err_encoder:
-	drm_connector_cleanup(connector);
-
 	return ret;
 }

-- 
2.47.1

