Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1497BA17FFC
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 15:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315FA10E5D6;
	Tue, 21 Jan 2025 14:38:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mUQTOTkk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F7010E1F6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 14:38:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 58E29C0006;
 Tue, 21 Jan 2025 14:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737470280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C1hkXxAV2soqDPWmw1hIUWOl55m0yvR5CbonYKd+i24=;
 b=mUQTOTkkozBZjGCY5w6hea7pqIYwFrlsCidrG38FeU3EiTbYZSlqoChwVPqybE5Jc9p7tX
 bOzOGWzH77DKoC4d7iEUDR8HK3bIR+8AAkjS47OTHnf2xQQppHYfGsF99KOcsxUtnQZjz+
 9gNOlUm9n+eyAWMlQUa4QaVJ0DHvi2zEVoMfyADZO/8HlYs/xVWh4Hy7rdKjDUeMmNqcjr
 VjViOwYn6x3BQwO4vup9TgP6+0bwBaKKN+amiHyeAZp/0YsrPvGhnhkor30MTAp8uv8dnf
 09QuVh+k2uuF5iM9F+5+3g7K8KyzacK86LwJlCAsOwUs1CSRIDhj7iL8jNnBNA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 15:34:46 +0100
Subject: [PATCH RFC v3 02/14] drm/vkms: Cleanup configuration field on
 device destroy
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-google-config-fs-v3-2-8154a6945142@bootlin.com>
References: <20250121-google-config-fs-v3-0-8154a6945142@bootlin.com>
In-Reply-To: <20250121-google-config-fs-v3-0-8154a6945142@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: jose.exposito89@gmail.com, dri-devel@lists.freedesktop.org, 
 arthurgrillo@riseup.net, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2931;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=XjPMbvB49qIxULw8XBaRu5LGzihS7dS+8w0mN+Lh+9M=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj7FAES1qSrK6ELwsn62aRK+NEi7esKLOV8lFn
 2KFHOFc3rqJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4+xQAAKCRAgrS7GWxAs
 4kO0EACwhQZIyOf29w1G18PcA+1aS5bdademqeGVxJ4gNM+CggAf7khqSfexcNuTHU97Tv/NeTq
 8PHYl6Jqo+3Bjk3qzkdz7LnuK+hlGmwEUkTNqjMSZqdK1hU6+3vS+tFAuwGZ4cVT/7jcNhI1w4D
 HHiiyNtKVrDF6xgpuy/+o8VVOSAWGGqvLvFdoNTo5JLpnpCD5bmmKdkVl913WwuQ52gzay8FVO3
 ujRdSaeZbsI09hYowA1+2wI3Oh0iYiWy9kysosa7g9O3uUfQBrbSROGhIlhxr0POaJbOGBW3VTK
 QYJ141+YOExPXn1EW8HjxcTfSIMX3X2+nOLZQj6yZcbn5wZWC0+6PIorHs9EOzU3YwPyHMcmvpe
 aePXg+TBEGmf22Vuj+L2DOr9Jzvurypb2wMob6j4p8DfSdsK0X/QijQcQFHQivz3F3xENiJkXu9
 GIek3VWZi0Yh/JDbHE6n99mIK5NyWIR3vCwT3qVrsZyqcNIGcyuWQ9S6lREWAT6IzTn7opfNKf3
 sVYVKhRKfLyTNUV/e0EFCpwFfMIIeU3DE3eGeunuMGjGPpyYZzpW/pk0D2P3E3Gf8KgdQUHNf1j
 PM4qF3oxB+TgQgkdv5st9w2KtSpLxeCFLPnnTRkrQ7g9Hmnn8I7b/WRcWsfzOMQ8oqc/5cl6kv3
 MchrAisJBQ8VLAA==
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

To avoid having dangling pointers in struct vkms_config, remove all of
them when the device is destroyed.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h |  3 ++-
 drivers/gpu/drm/vkms/vkms_drv.c    |  2 +-
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index a20644031ce923fad98d486a8bb2ec7859038dcd..8ac9cd52cc00f7c317f2514a73c3d2f3908b085b 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -167,6 +167,29 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *v
 	return vkms_config_connector;
 }
 
+void vkms_config_disconnect_dev(struct vkms_config *vkms_config)
+{
+	struct vkms_config_connector *connector, *tmp_connector;
+	struct vkms_config_encoder *encoder, *tmp_encoder;
+	struct vkms_config_plane *plane, *tmp_plane;
+	struct vkms_config_crtc *crtc, *tmp_crtc;
+
+	vkms_config->dev = NULL;
+
+	list_for_each_entry_safe(connector, tmp_connector, &vkms_config->connectors, link) {
+		connector->connector = NULL;
+	}
+	list_for_each_entry_safe(encoder, tmp_encoder, &vkms_config->encoders, link) {
+		encoder->encoder = NULL;
+	}
+	list_for_each_entry_safe(plane, tmp_plane, &vkms_config->planes, link) {
+		plane->plane = NULL;
+	}
+	list_for_each_entry_safe(crtc, tmp_crtc, &vkms_config->crtcs, link) {
+		crtc->output = NULL;
+	}
+}
+
 void vkms_config_connector_update_status(struct vkms_config_connector *vkms_config_connector,
 					 enum drm_connector_status status)
 {
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 23f420291cfc0044ccb2be90688d021aab10c1c0..2e5d2aa34a4f039c738cb9ac5642f3c75df36ba7 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -109,10 +109,11 @@ struct vkms_config_connector {
 	char edid_blob[PAGE_SIZE];
 	int edid_blob_len;
 
-	/* Internal usage */
+	/* Set only when the device is enabled */
 	struct drm_connector *connector;
 };
 
+void vkms_config_disconnect_dev(struct vkms_config *vkms_config);
 void vkms_config_connector_update_status(struct vkms_config_connector *vkms_config_connector,
 					 enum drm_connector_status status);
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 5f1958d59cc4c3102352599eee7a8e139fbb899c..afbd1fbe00d469bea8367096a3aa0ed07b66ed1a 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -240,7 +240,7 @@ void vkms_destroy(struct vkms_config *config)
 	devres_release_group(&pdev->dev, NULL);
 	platform_device_unregister(pdev);
 
-	config->dev = NULL;
+	vkms_config_disconnect_dev(config);
 }
 
 static void __exit vkms_exit(void)

-- 
2.47.1

