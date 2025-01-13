Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD92A0BE5C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 18:09:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AAF110E74F;
	Mon, 13 Jan 2025 17:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PJjZv+Eb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5441C10E74E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 17:09:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1C911C0003;
 Mon, 13 Jan 2025 17:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736788153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uXVFlt/M2yXMzY5/qRvMCWmbv0QIUsPFjlivd4tltRM=;
 b=PJjZv+Eb8W1tJBHEPxD+m/XEoPs75PNmuAG87g8/gqFtUoB6jlaW8uzL893R5I5EPauZs0
 O+D/V+E3gwH6jodaE8903DKImVDJuKNusG+vGUiAsj+0fdqvTOc5XMXkKLdmaVZEAKN3mC
 iWxUAw9t65dQxeMSumLUQPdi+IEfmYxZcFXPUXkotYgvVZtcf3cxAJklHT/u6ZJOO7Vo+e
 4fDVTxu5s19Yor3h8BaBokqd2z6HXXQbL4X1LUrOFYpvZ0wLg5e809GPRHmURB3dILObXG
 yOLGAb7Gxm+Me/QTGsNJD91RQ8ovBHfwNb5MHkx5bE2r3CSM+JMdoVqjxbF9Mg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 13 Jan 2025 18:09:02 +0100
Subject: [PATCH v7 1/7] drm/vkms: Switch to managed for connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250113-google-vkms-managed-v7-1-4f81d1893e0b@bootlin.com>
References: <20250113-google-vkms-managed-v7-0-4f81d1893e0b@bootlin.com>
In-Reply-To: <20250113-google-vkms-managed-v7-0-4f81d1893e0b@bootlin.com>
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
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnhUizQl/mOY/AO/jMehsdVtETy1MsDHAxFLywe
 VMzv6wU0cmJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4VIswAKCRAgrS7GWxAs
 4s3EEADVXWBVF6GQyGTcsckxwCPrbTng+ZdkUxF9VmouXauOrcj0wQOK71cuTzp76NmnIFgZo57
 NvHs9e5E88Gvnd5YkTGh1jf+BzDDyVJ6EKqEmTcYGIMBzsuGDdmc3K/kTBVb3GEAxb64iJF52OC
 UkPNBntnBOXcTAHyA4qkKTPX6tMD9g6hO2xeG3IHHNubp7nlWemVh+aoNpj4nsMAe250FUqaqpE
 i1Y35QqKMdupBpIxQcTc84R+6jR7Nw5TICAX4KI95iiZ5gSzx49LY679NZ1P0/d9EyFvuRhN9Ww
 UflWEIPQoyfsmW2YbVRFL2/cUR33VB+hbNnwXmuIOClTCX9HRY7wwMYwoc3OSBT8A3uOvJGxWDE
 yCQ7rwrjps41lK841VMJLFNdkzO0eYDEtFETaMGCUFM8GqShOIUPUE8jVPyq0gTslcOV8lViEQz
 QDU5vCW/skjTfvgN0PfJ838oUj3VD6RnCtP0fe5u1Es5Gl7B9nQNlUf9yDVBk01GIJ5pcvwlVTY
 bSEtV8cHU/v2BV9tIdq1r8x9Ik72AW8EmKHVL5N8AR9WwErnCBeIzgrs9Ai8aOE1ZOsgOfp6NHX
 MlvR6UcQd6xJNgeN3hswsCHDsAGmrGXggDtteSN02OPvnKW5bS7g8N06SG1mwogqpqrNgQpSgUU
 r+9bZrejjTbqr/Q==
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

