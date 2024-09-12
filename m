Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A685976A71
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 15:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4E310EB6E;
	Thu, 12 Sep 2024 13:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CDPxMND5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6853610EB6E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 13:25:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C4DB4000E;
 Thu, 12 Sep 2024 13:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1726147519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g34sFbJmZ8FTG/UCaYFEJPYIDmiuCfsWD/gVjbMaAdU=;
 b=CDPxMND5j0TvekZ7GfQb6Q4eErc9oQOrKXBMi5VzM/nUFPkNvszOHgroEjeaeXKnRljvum
 gliUHLfJFJv25uBKyXu3VhLovVOVFU1mqU8C+SjABaZdH+P2KyC75JnUSMup8WjAsTtl5g
 Fi06l5V5mc2s+xB+SplE1VbCblfkbMgwgbMKNYsh2eR2Su430qE9prZeb+hAcUTBpIwDJ9
 u/Cz1ArUw255ldp+H7NZUFCQpYYjPsBksNdvn/ubwhBpLLfj5GGzIVlY82bkeIxVd7Jnhp
 wRtfSVGaZvvVigDQ47YuqnDmfC4N2Ho7wladFa+rJuMBvDAXCYAimCqVyf6mSw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 12 Sep 2024 15:25:14 +0200
Subject: [PATCH v3 1/4] drm/vkms: Switch to managed for connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-google-vkms-managed-v3-1-7708d6ad262d@bootlin.com>
References: <20240912-google-vkms-managed-v3-0-7708d6ad262d@bootlin.com>
In-Reply-To: <20240912-google-vkms-managed-v3-0-7708d6ad262d@bootlin.com>
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
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2084;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=tR2Pek6p+Z1Y/CCm8gFsRbPMfMtJuv7bIWglOMvOdFY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBm4uu8q0Cm3Vmu3KFO5KNH6YiN/uDaU+NLuFMQc
 NUoLZjbQTCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZuLrvAAKCRAgrS7GWxAs
 4j3RD/wML80ppF2mUtV6BVZUfH2mypdVpWRaTp5b/JqWTEolEgkZV0LbwOwtv/PWEK3UU32fF5J
 5rrUB+YTUUBS5fopmSyuAn7opZJd/2fJB3hdjbQkT6953w33W/1eXloXVPj/Xn7tKQUzWW562EK
 ggYuwvQyd0H6VbxNC9aiHI4/OEopWmu8KgiL9lM5Pk/S5v57jNo+E7TQN5zGkWL5rLZKWTZMHzs
 oFlkY1zTrjJRtJxI2pEeLfmPkQvCFm7hEX3wKaXF7CZpbSS0MiosC1AUcRp8sw80zmZFBmxIhXc
 jqS8zzEuxuxTykQ0QG2hjtGTPKkadLM+VatZokFrx3yJNg79+vIFdFIA75Auw0rZNU8t0s97MYT
 OF9uecZRmTYKyMcr4Wzothk5HeCjozFLELP+SWyme+KbQZWtDwb5ZqM/HGtWrM8MBmvn7D2t5RD
 SK9Q0fFnWFmvULwqM7fxVPYk/nn9TjXOXS6VdaXs1IX0y4lYow38mxRR8tGJXhIwmDqXcLKTEg4
 gZqC+dha2m52bX7qSWpbaesXnIFm4wN/HtFxP+Pm9Ty/oiQUfDA45pgxb2ueC9Jfi8dk2bDLL61
 8EWQZ6ymBwHKfCvYnJ+kl5TAb4hUI7BcV9ueSYNtlBnhA4Uz1m53se+5N4KzZ07taUfltpm+g0V
 3yRS5euMZ/qeARA==
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

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_output.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index a6a942b4f84f0caffe1e9e1523edb262e1b7bcfb..1a445a4ff6ffb023a1c1ef7e141c771277146251 100644
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
@@ -66,8 +66,8 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		}
 	}
 
-	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
-				 DRM_MODE_CONNECTOR_VIRTUAL);
+	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
+				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to init connector\n");
 		goto err_connector;
@@ -79,7 +79,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 			       DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to init encoder\n");
-		goto err_encoder;
+		return ret;
 	}
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
@@ -101,12 +101,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 
 err_attach:
 	drm_encoder_cleanup(encoder);
-
-err_encoder:
-	drm_connector_cleanup(connector);
-
 err_connector:
 	drm_crtc_cleanup(crtc);
-
 	return ret;
 }

-- 
2.44.2

