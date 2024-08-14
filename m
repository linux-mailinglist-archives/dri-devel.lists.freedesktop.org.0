Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 136A395184E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 12:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A5E10E27C;
	Wed, 14 Aug 2024 10:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="W8bAdbSy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C41C10E27A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 10:06:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05A91240007;
 Wed, 14 Aug 2024 10:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723630005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=87g0M6ZkmmYQQmzMtdqvd4ET66nRxVANFyNtJSg2Umo=;
 b=W8bAdbSyMvBv9KLU0Ob5OOUMQi8VUznxq5qgV0p2EpF0NRx5kDiwZ3GfOylHk/oO0BYryX
 neYH0/F3cZP6NVR03QAkMFL3F8e7EYpJ1sPowh3Q8v5ez3HDgHw37iJVugjoSLGV403W5u
 BHFJFmz6nZc14pT1Kmfu5PIdL5O9kwwQyJUHgLbHT2rsqQhatZVzl1HQLwtBfanIOJCvMh
 2S6UMqsuFaMyd1F5g4X1FiXlJBVjL8KxxMw4knPVPnXI6UxOFj2aEyOc+81zkwMGWuB/dl
 jKIfT/n1zfMXwhKQIJreSWv9d/dLvloRlmZBh8fGd3CNZgQ94QfJx1HVFR2qrg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 12:06:34 +0200
Subject: [PATCH RFC 1/4] drm/vkms: Switch to managed for connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-google-vkms-managed-v1-1-7ab8b8921103@bootlin.com>
References: <20240814-google-vkms-managed-v1-0-7ab8b8921103@bootlin.com>
In-Reply-To: <20240814-google-vkms-managed-v1-0-7ab8b8921103@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3314;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=7l9F+GjR2AMJA+FyA16K/exYwFNddc+C870KBH/L+Gc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvIGzpWkYdOXlSWres+b+S9l+1mlpSd1TOWQhu
 WQPlhj9lmKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZryBswAKCRAgrS7GWxAs
 4q0fEACi+01RkYzF+A2z7xtimM3n3U7Yv729EsDGV3UYl8vYip6U9YYLkcWop+AcMP02/Y/5O3c
 yG7p2QtJCv1JbSDkTgmU/7EFN2jg9lHu8beFLUD3sZg1XdL+tmTGa+p6RYV+7UyNocAl4Ujdg1Z
 XoLpm0GpF73k4SF4LypGphwsfxpRyIv/Pu97VLGWw0sa7op2ZyX2LYB7nCAiB1G4swQX8CU8UrF
 tMwGKvz8ujB03VPh7IvTvHloE4ktIBVbHGGvfefpTIEEHze02gLCcNehIZqFhpfBhqqWcKWyWsN
 Tzx22SYriwxeULpKfEvB7G0S5P6W+D4gUj08v7KGt6xFXRbX3jDz8RxUATlBqMhPUEKySBnN62c
 FppvBcEEMvqYPtC+ROQEOTcMNrOqE1yLzt/jCEmkYesID1ZlbKyHGqnocqtnhebg2u5pZPD4Rqf
 90Ch++hPUTjZlDLElIkXNufIS0Q8LtqqBA5QMtj2H3wV+OIvIy+Ai4kMF49955m87szEsVySNuR
 kf62SRIwVxJkBOwIg5mHyFoxDhXwbLktRYKJ8JLtVe7brfDLscVH1RpLPI+6BbvYswOqMhx2gd3
 f2ZgtrRQ6Ys4uALXh3CWhIvV10Lx3iOXCKzVx+64Qx0+olAwNWzjv9iIAQVwxpcfsi1Yel8LcTq
 5PTrHkAMxlnSQzw==
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
 drivers/gpu/drm/vkms/vkms_drv.h    |  1 -
 drivers/gpu/drm/vkms/vkms_output.c | 22 ++++++++++------------
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index f74a5c2045f9..cea7b2640c5d 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -43,7 +43,6 @@
 struct vkms_output {
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
-	struct drm_connector connector;
 	struct drm_writeback_connector wb_connector;
 	struct hrtimer vblank_hrtimer;
 	ktime_t period_ns;
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 20073a00b200..4767838c3a73 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -3,6 +3,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_managed.h>
 
 #include "vkms_writeback.h"
 #include "vkms_plane.h"
@@ -10,7 +11,6 @@
 
 static const struct drm_connector_funcs vkms_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -54,7 +54,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
 {
 	struct vkms_output *output = &vkmsdev->output;
 	struct drm_device *dev = &vkmsdev->drm;
-	struct drm_connector *connector = &output->connector;
+	struct drm_connector *connector;
 	struct drm_encoder *encoder = &output->encoder;
 	struct drm_crtc *crtc = &output->crtc;
 	struct vkms_plane *primary, *cursor = NULL;
@@ -90,11 +90,15 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
 	if (ret)
 		return ret;
 
-	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
-				 DRM_MODE_CONNECTOR_VIRTUAL);
+	connector = drmm_kzalloc(&vkmsdev->drm, sizeof(*connector), GFP_KERNEL);
+	if (!connector)
+		return -ENOMEM;
+
+	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
+				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to init connector\n");
-		goto err_connector;
+		return ret;
 	}
 
 	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
@@ -103,7 +107,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
 			       DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to init encoder\n");
-		goto err_encoder;
+		return ret;
 	}
 	/*
 	 * This is an hardcoded value to select crtc for the encoder.
@@ -130,11 +134,5 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
 err_attach:
 	drm_encoder_cleanup(encoder);
 
-err_encoder:
-	drm_connector_cleanup(connector);
-
-err_connector:
-	drm_crtc_cleanup(crtc);
-
 	return ret;
 }

-- 
2.44.2

