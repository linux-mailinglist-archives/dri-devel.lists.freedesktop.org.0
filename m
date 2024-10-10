Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2519F998E6B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 19:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87D710E99E;
	Thu, 10 Oct 2024 17:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="O0c+ilKA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F12110E983
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 17:39:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64E3F60008;
 Thu, 10 Oct 2024 17:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728581950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PipLqVj5xkPyoetI+WW+1rh6cTZU8H1AKdi1jQjRa5M=;
 b=O0c+ilKAYO2EoXB1uSLrU/N3TfLGIVCeIHqsiZOFnhpSvzvj1GTfBE4DuBG0Q1SX1vXuEb
 EhZPtRKn9a1bgw2WQ8CFtFfp2nUK7GaomWUKHX5c1da7Y8mAxJhRCHzy/cc8HD4SYV00Uq
 umZqCmM/DeMTQTlCZjyc2cbvAXQlVapFH22yOiIDpgjuRZVLBBkcT4wLIc8f5LImFTjzem
 iYOqbR+DxmP2zx00M9V44Bg1OikZlU6iu/Cx71d+WREgJmHEFPG6H010mgSR6h5Iggw4jb
 cGP1z3rXvAjUtPtisuPgnUDdiIhJOxmKvdxdvJRSARs2ZcbPfOqLDt6DBJ0GZQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 10 Oct 2024 19:39:03 +0200
Subject: [PATCH v4 1/5] drm/vkms: Switch to managed for connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-google-vkms-managed-v4-1-ed04a62ad2e3@bootlin.com>
References: <20241010-google-vkms-managed-v4-0-ed04a62ad2e3@bootlin.com>
In-Reply-To: <20241010-google-vkms-managed-v4-0-ed04a62ad2e3@bootlin.com>
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
 20241010-vkms-remove-index-v2-1-6b8d6cfd5a15@bootlin.com
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2372;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=yGT7SN06dK+D20p7SLaCpw1NfHZP91hoKUuigEH3q/E=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnCBE6tqLjj+hV77ppmvzkLCGJ9MGEV00I36IHd
 JTVOpsiIKWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZwgROgAKCRAgrS7GWxAs
 4mhYEAC4BNUA2uE9CRw4E6NhdyIzgoE8pbSNx0a2/8CWVs+PwFq7xFfhLiYbie5lzQoqCG7MZhd
 qyuCzlu3nI1S8UvqCna17vnWI4Mb8NApJC5HF6/7QUb1M/apzMaez/BxAocBB5e6F/PS6XsXkvs
 VJWE9wkdznY3YazzQrQzKQariO7TFZhqmvHSQlaelNz9M/PFXj2UfUJd9W7BinUbvxhnZkyOeQl
 gVRPTctHYbKecPBBCgab4tNHUcYBW/LP914KhetGUJcXkO/7dRel4VFOUfJQVEaKBxeFtWjFu9R
 bhONIHzuheAHcxv4GEFUjiqdnAm5xIA0u5nl9w378zOxM/fNBkyr++cf58yrluqevg0AB1ugNIr
 8USzW+/n30jU8wpaaTGs2nNH/McCerTB/EX2rNffIhKUDY8phMgH51elPD5rXgX00lQVdDVM8i4
 2ykZQlK6SD6VbC8DmXgPmyIYuf8uFQzp+EEzmo2Uv3LwBcSty5M56e+RVS0OJH0QN2LPMfutnq5
 LzX+IZKrPakAYMv9SPf+i5NDS0HeLS+TNyTRAbeR//OfL3vNah/Oaig2/8ZXW5AgDSuqu+hjBqr
 5LjnyACYMjsbA4srYBevPj7YTQWNVRnsv4HWIqTE6D1IsNZqMWmtGr7YaA0kyEegXjwF5/gj+3b
 tWcYzLwrh/wDrvA==
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
 drivers/gpu/drm/vkms/vkms_output.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 5128aa3b2eb6..8f7a05b73e1d 100644
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
@@ -70,17 +70,17 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 			if (IS_ERR(overlay)) {
 				DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
 				ret = PTR_ERR(overlay);
-				goto err_crtc;
+				goto err_connector;
 			}
 			overlay->base.possible_crtcs = drm_crtc_mask(crtc);
 		}
 	}
 
-	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
-				 DRM_MODE_CONNECTOR_VIRTUAL);
+	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
+				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to init connector\n");
-		goto err_crtc;
+		goto err_connector;
 	}
 
 	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
@@ -89,7 +89,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 			       DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to init encoder\n");
-		goto err_encoder;
+		return ret;
 	}
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
@@ -111,12 +111,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 
 err_attach:
 	drm_encoder_cleanup(encoder);
-
-err_encoder:
-	drm_connector_cleanup(connector);
-
-err_crtc:
+err_connector:
 	drm_crtc_cleanup(crtc);
-
 	return ret;
 }

-- 
2.46.2

