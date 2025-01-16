Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 022DDA14130
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 18:50:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0AFC10E9FC;
	Thu, 16 Jan 2025 17:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gbssYxU4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3046610E9E8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 17:50:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76DD260008;
 Thu, 16 Jan 2025 17:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737049823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9TkYCxm07/sojZ6c0cYCTwDxnVY/JIB1azIs9OmWVIE=;
 b=gbssYxU4JEjnETPuGjxzxVpOd0hq9g1cC/z6Z0lk4rh/i+huCVFjBFyF8QHh2nsme9s096
 H59RDnBeYnKxfA6Xavf2AmCCKbJgb7+lGFZvkb0M8FIgl/ZpsPT1biD51FG68xyFVMQ+GS
 dK16ijZP91Hsw3atb8CAq++xKaBRlf8cHL1h8PjqdyINs85vx8hpPa+loV/2puAr/VXWKU
 chCPA/jeUAULdirY8BaDeBqkuPtRb43HnCUwrl6tYpEgrWHOWysnEWUYRvMxWgjYCZGTpt
 ToUV8bSAVKIiB0BmIssi201gYi1jhotX7lAvHms6lh0aFOp+973BB3mJVz5dFQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 16 Jan 2025 18:47:13 +0100
Subject: [PATCH v9 1/8] drm/vkms: Switch to managed for connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250116-google-vkms-managed-v9-1-3e4ae1bd05a0@bootlin.com>
References: <20250116-google-vkms-managed-v9-0-3e4ae1bd05a0@bootlin.com>
In-Reply-To: <20250116-google-vkms-managed-v9-0-3e4ae1bd05a0@bootlin.com>
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
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2235;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=PM67s+sGkYYKTtwGFSTV4ufzHXK8LBbKU9A9EcZIpMg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBniUbaRJSkjw8EO7dKiVIhW64oKKfoeRftHC5d5
 lOzzzcaUq6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4lG2gAKCRAgrS7GWxAs
 4gabD/wNTz4d6trDaV2D2BHNNNa41OAsa4z9ZAF7c6B3ToNuP9rSfksLPLBS2rhVzriksQCdDiV
 jx/JELUEPREA1tLBiIonwaspvaXN8CC/FZj70oMx7FmKP/ACeOKsrPvhegZ/Vz7Mo04Gm9c6HRZ
 q18BVWVXAhQaSsn6Cxvq/UE6njaWTjJOXXzB/UfyklSH34lzJC2ndxbP7lMDS1Rs4GNt4U6lTpv
 7UlivIpOFfKHknxq3DeS2mnYnPWt0C/uZNhYmLK1aP3jn4m9m8Dngv0UnRB/z3W91l3jAZgUXO9
 c21WXdrqWBeGLT2gGmXpc68+8R/OrsUii2JFmd0pFY2/DBY6cFLhnbx8AtaRappcy3efuCdN4DC
 RbnYVLZf9RrYIHQxXNwbr31D66TnzCA8j7L87QmnGkEuYhOMFJFm3BqI/CadcV3V1DCLMkMBtwf
 /WciLX/nzO8l52986BbfGbjCQJbLSxI6fxMZ6tB9Jsen4s64kKOK4btiI5ateGpevHfvyRUm/k3
 a3eBJ+cy4Z0Kf5TZXPmmgCbB/7E/hwXFuy+UD4yFV4aaautTrYonGk+4uLdHFL03265PwUe7a/q
 krxhF4DQz7I0FxuEALXpA/SsNxfq+R3uRyTGROwDU7n59aHXIudgTga17T5zvsDeNBL9funjc6m
 IgKIAOiENA4pEnw==
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
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: José Expósito <jose.exposito89@gmail.com>
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

