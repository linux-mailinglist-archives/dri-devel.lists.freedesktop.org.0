Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1EC951853
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 12:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F43410E29C;
	Wed, 14 Aug 2024 10:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PaI6ySCk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC8510E27A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 10:06:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8E94240002;
 Wed, 14 Aug 2024 10:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723630006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fttNKQGPbUwSF9BG5K39AeZmnZZJyYqnKRHMDtWuGnI=;
 b=PaI6ySCkUQ1XQo+yPbxYwQqsfIjXqlUJ/MSqcuDTFj0vyRAGt/4H0VDSFD+P3ByhwlORB0
 WnQjNQRAXH9wNiRUQj/61dz7wmgC08f+vFygGcdWhxmVZDxkqutAo0IPad+025RY9QUV+N
 uAm8vHghBkAINR9e4epMXMumttfkLZN60tt3rAmuZa5YM+my+wfokUHYa6JK2A3r2O/+Bx
 ZNqg3XBjcNkNhPOSdZUm8F92JJki90I2SWvh/jjcEeZRwJuPWB0l7YWxe1OMjgTBk1vEKO
 DxQY0ZteY3Gv2wp/bqmue+dc0+6fGLf5c6TIdspf/SchmvOC71VRkOA/TcSwuA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 12:06:35 +0200
Subject: [PATCH RFC 2/4] drm/vkms: Switch to managed for encoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-google-vkms-managed-v1-2-7ab8b8921103@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2956;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=+Jyk2eUD6perkmgLy3xL+6KheoendQENPyVEwQZ5FMo=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvIGzTZ1LWiqeOO2oyj8l0Yr+fWA/ngVV5QUTO
 NXVtUzvf42JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZryBswAKCRAgrS7GWxAs
 4rRUEADC78cD0i68D45js+dABIkT+M7Z0sGJZd2fgIJR+1yfcZ3Pbz2xZAbXpMVxI05/XjUGii3
 fzgm1uf99LlWmjerM6Cm//vt5r4K2YqRg643454AK1dbB/TgMTcAucUu9pAZRiSnlztJkPeCMWq
 HAJIO+G4Dw9crkQ9vPh2F419zzj5/01DWgPyySe9oLx3YWJ6MNUTH/GtbE49mJAh8eCYAV/QSEC
 cT3rdkQktcZqyWP1+1PsRTT/5qbkmKdFkDjKXEgejsbUSlsLWYXfPMU+3xxseH5a8uYoOyoht4f
 m3jIWrUZETQ+Sk8FdDSJ03k0Na6/Y0e56YQ8XBg2dubm3RQaqGXELwXcg5w/WLtTdNxMA0y2FIC
 kv0p4LyXw7ACRp09rrhh1bdU6/JqC6R7+qBZ2vkkI5DKI5B/XLyaZ2bKSzmndlWIUk25BW7qnxH
 8kTZ+Ne5aHKye4y0S8gzP4+tP5xFKV0x8/MBGNaMG0a5lFVQ9MlqOsaq30hcIFTDBonH4uBB06B
 6OEQh5HqllaNaerm+FdLhUfkZzFpWtF/cUDC0GrcVn7toakgAZe9QL2V/JbXAKbPxSAtVk4cTWH
 91WRB0zRBPrAaIyV7xZuRxzNevkJU++tnync+qmEyHEMxDdIl7r9Cr9pFIiLO/chFQ/BMkHrc3V
 iUyrTjAjQz6fsqQ==
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

The current VKMS driver uses non-managed function to create encoders. It
is not an issue yet, but in order to support multiple devices easly,
convert this code to use drm and device managed helpers.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h    |  1 -
 drivers/gpu/drm/vkms/vkms_output.c | 21 +++++++++------------
 2 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index cea7b2640c5d..2c9d1f20ce84 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -42,7 +42,6 @@
  */
 struct vkms_output {
 	struct drm_crtc crtc;
-	struct drm_encoder encoder;
 	struct drm_writeback_connector wb_connector;
 	struct hrtimer vblank_hrtimer;
 	ktime_t period_ns;
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 4767838c3a73..cb8507917b5f 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -16,9 +16,7 @@ static const struct drm_connector_funcs vkms_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static const struct drm_encoder_funcs vkms_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
+static const struct drm_encoder_funcs vkms_encoder_funcs = {};
 
 static int vkms_conn_get_modes(struct drm_connector *connector)
 {
@@ -55,7 +53,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
 	struct vkms_output *output = &vkmsdev->output;
 	struct drm_device *dev = &vkmsdev->drm;
 	struct drm_connector *connector;
-	struct drm_encoder *encoder = &output->encoder;
+	struct drm_encoder *encoder;
 	struct drm_crtc *crtc = &output->crtc;
 	struct vkms_plane *primary, *cursor = NULL;
 	int ret;
@@ -103,8 +101,12 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
 
 	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
 
-	ret = drm_encoder_init(dev, encoder, &vkms_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	encoder = drmm_kzalloc(&vkmsdev->drm, sizeof(*encoder), GFP_KERNEL);
+	if (!encoder)
+		return -ENOMEM;
+
+	ret = drmm_encoder_init(dev, encoder, &vkms_encoder_funcs,
+				DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to init encoder\n");
 		return ret;
@@ -118,7 +120,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
 		DRM_ERROR("Failed to attach connector to encoder\n");
-		goto err_attach;
+		return ret;
 	}
 
 	if (vkmsdev->config->writeback) {
@@ -130,9 +132,4 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
 	drm_mode_config_reset(dev);
 
 	return 0;
-
-err_attach:
-	drm_encoder_cleanup(encoder);
-
-	return ret;
 }

-- 
2.44.2

