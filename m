Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 210DB96068E
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 12:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC36610E133;
	Tue, 27 Aug 2024 10:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="iNQMO4rP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45FF10E133
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 10:01:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B48891C0010;
 Tue, 27 Aug 2024 10:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724752914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=udjlBWpBAoHgcvxq2FWPI0e0+WGK0V/eXeydXau3BLE=;
 b=iNQMO4rPmhWpbZ2czv7N+SZ9vEmWWw3K5NKL8jz3tKkaYlCUW7SHQN8lnsnhYq6A4zddbY
 0E/xHgu68Rx/Va0CXrVvugEuU41PvhxaCxeLlg/8JYt/rObTq4pHVHAUHiR8PzsMt8I3VF
 sZgFYGj+Rbi57UKUB31yr5sy2ywtSAquMrNM2Veuhl/uAAN84NZI6jZssGasl/fcvTErZ+
 nwI7Utmt6Ow+Z4lJYyb34PtdtOQNFLZp9DQu26iaL5PfpPJNV3b/2tr8uMrr+iewhLfk5Y
 HZrEoUHKhE6KN5kYDoeRGn0S/5EVuzNGZZnZ8jf5jl9HbzsxSCn+2COc6fgPTQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 27 Aug 2024 11:57:36 +0200
Subject: [PATCH v2 1/6] drm/vkms: Switch to managed for connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-google-vkms-managed-v2-1-f41104553aeb@bootlin.com>
References: <20240827-google-vkms-managed-v2-0-f41104553aeb@bootlin.com>
In-Reply-To: <20240827-google-vkms-managed-v2-0-f41104553aeb@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3176;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=W99THVqBFNss3oEOGdwAJKCTqWPosBK54HEsLK2bqEE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmzaQOLZuf9vXRrfntkM0wA3KlX4Nd0aP7AtuC6
 c/2o/80pMCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZs2kDgAKCRAgrS7GWxAs
 4rzdD/458Vuz+7NzBObxe/IKrJppUiYa+qkvIC+MWFWUc8SJccX24a0awNgXZBKN8aasNQX5HLf
 2po3mKI1qlwwYUAG7kST7QvZc4x4lvMnci+AXrOF5+Q2G2hATcfnIOrg0PZaeE46Vvxtwhjz/EY
 DEPZV9wkxyl5wp3frq21g0DobV17A7//w9tFBtjUcyk28J13IZQh5nxMvwXxBTOKcPuoNuC/bjI
 /DjKFX2CironzBrdgcaaizDmqPJP8B+LksOqUSWO4EXAUxHzSgjR+lgNF/f1DiYo2Kgz/SUL7so
 c0rF/RXawc06hwma7GkIE4Duj/bCdF25m8o7RSBDnVunNRHHZNKvifc0wTMT+Ehldrx4aHt/9NG
 VKcOL2dgvD2I0XLZcGo7JmrfHbiPM3GVFLh1LKap9tD0Dcwslj9nP0nYX5QwgOupGtqM3mDP+6j
 Q01y6q9mM3qnyKBGRXZKtO4YldFAxlYRnPC8mvwkXtWSRj9qsy8cZyjqKcPAju26k333IUyWeG0
 JemBDV+EpyQ+JHxFEsHxwMZ4mC1Fe1HIie1FyZ5XOa79iiTSFkDAMZ5Bh9gSLI3kytU+BPCKK2q
 Ay9fE88ruq8TvL2WZOMpsS9DjLolipyy2FatQA4wa26tja7Iu7CR5NZ8LiFJtNarOc9i7il0i4q
 N8qaMxtOg+eVd7g==
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
 drivers/gpu/drm/vkms/vkms_output.c | 22 ++++++++++++----------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 5e46ea5b96dc..9a3c6c34d1f6 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -99,7 +99,6 @@ struct vkms_crtc_state {
 struct vkms_output {
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
-	struct drm_connector connector;
 	struct drm_writeback_connector wb_connector;
 	struct hrtimer vblank_hrtimer;
 	ktime_t period_ns;
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 5ce70dd946aa..4fe6b88e8081 100644
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
@@ -50,7 +50,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 {
 	struct vkms_output *output = &vkmsdev->output;
 	struct drm_device *dev = &vkmsdev->drm;
-	struct drm_connector *connector = &output->connector;
+	struct drm_connector *connector;
 	struct drm_encoder *encoder = &output->encoder;
 	struct drm_crtc *crtc = &output->crtc;
 	struct vkms_plane *primary, *cursor = NULL;
@@ -80,8 +80,15 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	if (ret)
 		return ret;
 
-	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
-				 DRM_MODE_CONNECTOR_VIRTUAL);
+	connector = drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
+	if (!connector) {
+		DRM_ERROR("Failed to allocate connector\n");
+		ret = -ENOMEM;
+		goto err_connector;
+	}
+
+	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
+				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to init connector\n");
 		goto err_connector;
@@ -93,7 +100,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 			       DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to init encoder\n");
-		goto err_encoder;
+		return ret;
 	}
 	encoder->possible_crtcs = 1;
 
@@ -115,12 +122,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 
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

