Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CB49D625C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 17:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C017110EC17;
	Fri, 22 Nov 2024 16:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="c8g+aKhk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F65F10EC0D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 16:35:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28AC2E0004;
 Fri, 22 Nov 2024 16:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732293313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Saatg+Kt9CY/Nw+l2VbJ9P3jgV0lrIBz0cECqUwIKPI=;
 b=c8g+aKhkyXEC6ERSbP0XXyyro+tCh6N1w3pPFohWKfw449yMjmLzg9Mu84djCxcmtvZC/q
 DZMBBW5FwJn740keY4VrkKizp0rfIrsI/awoGGDz3T4c55eJ67A4FIH+Sf6JnbWUFt7KCp
 pM8jx7bO0JazqFMnSj8iH/0EFCqtzadBISgRM/SIL9Dlolwkcie3R/26a7pvOOdTnbhtk1
 6VpAPJ0UIGWALAqqMuy7SwTIqBZsktd2RJmE0Ri71+gj1gndg2UjuPuoRSNJHtwof1y30U
 +jD6+fubsE4e2t/86uEc0KencsXOPALLT+zfOH+LVwx+MZwetgyNLtNLQka06A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 17:35:09 +0100
Subject: [PATCH v2 1/4] drm/vkms: Switch to dynamic allocation for
 connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-b4-vkms-allocated-v2-1-ff7bddbf0bfb@bootlin.com>
References: <20241122-b4-vkms-allocated-v2-0-ff7bddbf0bfb@bootlin.com>
In-Reply-To: <20241122-b4-vkms-allocated-v2-0-ff7bddbf0bfb@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2003;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=+4lvrIye4ET+VE6WPe9UM6/x4v+7EymafhvvpaW3ys0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQLK+eS8mKIwSrSe6Iv+WAcyJyRpFnBNb4AfD0
 1go24UKFPOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0CyvgAKCRAgrS7GWxAs
 4vsqD/47S8zfsrCwhqoJo9+iFBIH2i52S9krESloQKmJXWjtVAyyHsSSketYig+UgCqio7wSrff
 qS0v53LerlgKMsBEBGZ+3aqbN322yFwDKj3YlYxurlId5XohyNZM17l6Dm+DnhUFAvVqKe+Gidn
 7vuF0fYUeLFXY5JdlZQSI+YP8JH17rF+RO+75tuJSgtcI7kNGb3kKpmADTpod8DK2IoTkKwW133
 YuFNygyq/DxoQnLL2ZtNFab2/8XgiEkFRKDjF01uwoQAsEPb54o5LOyINzzfoUDjI2jVNC0K46o
 M3L9q7/nutsax/sRj6ZbxSABdD8rEU6ltnvIwfvHUpuuaJiaMKwxjAa7kzmKMcLZ1PIQpBOvsdq
 /OlbE7LB2aIk1NAa5CKIw592LnYIChdoHYrO0O2Ua4JipTNmTq9Zv5fj4XzDKHBfO5csFNoytzO
 FFhlY6C0CIqZuWqA4ee9iphH720pAOosk1eMSjunUzlWZA5HvPGGviALrfoZofHBx6b1T7/B04w
 bQhSHJnDDEbwfxaxGhPT3qrfi6UZoZ+7n7WOxKpBQHtTUlqxzGaWLzmV6v+6504W/NfAC9FThF6
 uAM8/Q9uhjMglM/rsiYRbTshcMctVcBE4R8Nrh+zSdPdEIlOI5kvmxmbPKViKKFDliRzUmnePgr
 INSFslcD4OBdECQ==
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

A specific allocation for the connector is not strictly necessary
at this point, but in order to implement dynamic configuration of
VKMS (configFS), it will be easier to have one allocation per
connector.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h    | 1 -
 drivers/gpu/drm/vkms/vkms_output.c | 8 +++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 00541eff3d1b0aa4b374fb94c8fe34932df31509..820e7899cb049b45d8bdbe5a0dc7be08eee6db69 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -177,7 +177,6 @@ struct vkms_crtc_state {
 struct vkms_output {
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
-	struct drm_connector connector;
 	struct drm_writeback_connector wb_connector;
 	struct hrtimer vblank_hrtimer;
 	ktime_t period_ns;
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index ab9affa75b66ce9f00fe025052439405206144ec..ec3545730ef79af0db51d8ec605b9cdfff52c2a3 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -32,7 +32,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 {
 	struct vkms_output *output = &vkmsdev->output;
 	struct drm_device *dev = &vkmsdev->drm;
-	struct drm_connector *connector = &output->connector;
+	struct drm_connector *connector;
 	struct drm_encoder *encoder = &output->encoder;
 	struct drm_crtc *crtc = &output->crtc;
 	struct vkms_plane *primary, *overlay, *cursor = NULL;
@@ -71,6 +71,12 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		}
 	}
 
+	connector = drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
+	if (!connector) {
+		DRM_ERROR("Failed to allocate connector\n");
+		return -ENOMEM;
+	}
+
 	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
 				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
 	if (ret) {

-- 
2.47.0

