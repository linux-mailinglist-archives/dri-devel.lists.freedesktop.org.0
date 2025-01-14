Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCDCA10880
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 15:06:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A866210E340;
	Tue, 14 Jan 2025 14:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="cJQjJKSQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2762 seconds by postgrey-1.36 at gabe;
 Tue, 14 Jan 2025 14:06:03 UTC
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6570A10E339
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 14:06:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27CECC0008;
 Tue, 14 Jan 2025 14:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736863561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VIFyceN+CaL84qPcfLeI60AzvNAanuLMn9nl8UfY3Q8=;
 b=cJQjJKSQGLXiTpUSdEsKhwpHl+nqZf0V2+Jp/+5AGSM2Zm9oNoKjiLafKqFSTtzq4NAd6C
 IqWTtrXoR3LAKl6aIDwtQmZyotpzvM2YgUlfDMFyxecOg+5Kt0ws/TlE3lV+qkge/yzIMr
 s82x/zcDJN5omwo+4UW/wpmjc4IHmSr2zSCy4ew+lzY/Ox4+trXza3ABNxSEe130g8qknv
 yGMKYax/yQ6baRHc145DigPHN1hiCfxGWCbffROqK1tnbh6qr0E0isPnGZ5OCvoeZOcCEk
 ypo5bCL5U9iklkfDedOB5h6KSENf9OBdK+TaT4TUfdt1zJfi1YIa1a83NONWiA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 14 Jan 2025 15:05:43 +0100
Subject: [PATCH v8 1/8] drm/vkms: Switch to managed for connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250114-google-vkms-managed-v8-1-da4254aa3dd5@bootlin.com>
References: <20250114-google-vkms-managed-v8-0-da4254aa3dd5@bootlin.com>
In-Reply-To: <20250114-google-vkms-managed-v8-0-da4254aa3dd5@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2177;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Ikfs4El5UlPszjJQz91MwJjpJTqwatW3fllItNIh9jY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnhm9D++/e5JO4omB5y5NFlluOb6ziavq+Ogdr1
 z1AaAq8+CeJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4ZvQwAKCRAgrS7GWxAs
 4lpjD/926OYE8ZRj53I16GBaKWY7ySYytB25fhD6i050CQseGz/wQ/1Zf94m/N+iQEcsXPvkljr
 xsmggEHPCIMmtZ49S+/3NPKwcoumI9FihMZKoSXKTX4NbEy+kGNTM0GEjaYVmQfsOe6RlHQhg92
 IhlQymzal+kd1AVRuEdkR5Ex0XZTnLaZTjhpGEfatSbcAUvmbKtsBFEbT5dsVsr9MZadUH0jdkY
 ctIbyPv47VjO/0EZWHK5wAz+aPWZWYQUtCIWFX9lVyphT+vxRHnapHzdH7Ewa8iXF4I1USu7JxH
 sU/V8bftRrjuVPnE+/gP1daQi3MdUSsbrZNhLBE4+6au4oiTHkOhwzi369x82y3yntwiaKDJ6ZN
 i7VPxtYca54hYv3hLNjGdfU4UkHrgYhTVc0TidwYduY26MOXpiog16JNhdks/yrDDkGe1Rti82P
 1X/YUw+Ofi42K2X4CMzAWPqcwJ7CweSW565biP/d1yEXQv3PanhSri2uZ9sNr45ReWVLKkCmIcB
 BTBOLXPPNdkXRuxvT/KMZ6zbEHLhdKaB8IkyDKZrBzk95JpRWl8SsL5stc9Si/WRjf1ujohX+ba
 fDrZA1PX3pmk2Efy09WRb1aPlm0/JF3C4vL2W/m/VgHVqYUeLB2L6sYkK/4lJxK+SiA8WGU+VYH
 d1eZF2ojR+wEdNg==
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

