Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15965960693
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 12:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA0110E2C9;
	Tue, 27 Aug 2024 10:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="FjX0fvnt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C0D10E133
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 10:01:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6F761C0005;
 Tue, 27 Aug 2024 10:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724752915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cLpzZikRAqTA1AgFL9mPE5QtLpuXTGeDfy/jMnIuw64=;
 b=FjX0fvntQgDahP26SR8gjVd42xgLvnQ8DsjWD6u/wmDfUvdRi7fPfpij3CzYsArNUgysuK
 mt2FA+ccXy5uzyLTAbqrtukkLlz/+ZD+qVYwVE/erBXkzwIga2hI/0b3oWjaW5WVnyrRW/
 kAkChvg10h1HubMgyw8bc7Htu1TTZ5E21p8udRDoYnDjW8JchDSBqAmZR16kPDiBhp3Sx1
 TR9zqmm6hSRpFRQOTq9vE9/xGdJUV8EAEn8RlfBRU/i2N7/+8uUzxLmXRepkNGKDMk96Qu
 O66ZWEZQGUOE2vFnJwXQKm8Zko4abrT6R+AsqD1jHcehKEmnSNChbpARNYv1wg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 27 Aug 2024 11:57:37 +0200
Subject: [PATCH v2 2/6] drm/vkms: Switch to managed for encoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-google-vkms-managed-v2-2-f41104553aeb@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2908;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=675tGI9t4siyekAGAqTdIzTYThmUt23EspEKi2jqEUw=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmzaQPxh3W6g4AWc2LFokZazuLTgBmg1bYlS+Ko
 v5T3sq4YrOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZs2kDwAKCRAgrS7GWxAs
 4uiYEACB/OXTMAKcYDyZjpKrC6FIWGqvtuGYe0kXaCjLSbrkHA7HznuMNLYaY8z0yfNfU0874fz
 Wb5w46Ezg2kP16PYnom7EG2H+fdsuUWdQXGvouML/1QNFvk+FTh1Wh/1dRLTFN4XGvOkL4H0Gi4
 ha/x/an9EUIbmGwtmIMfwcVzGrsLbkpmjussTI9o7/FEtRHEnUaBr4h5/Gb8rS4CqJOSWD28T0J
 jZZPDhFcxgRVLqVk4yqS2GYeePnfVw3+hL1QYtgDA8ATwqO/53U4SgQOD1iAJzSaQI+aAV123p9
 8EYXWS+h7OIYYNk/70lpkmn/8weKY9CbWsOvow2GIXusv91w/zXNdtNOPHu/ZceswjAECquT+4V
 +CH084GoyDtYWxdZp+mz1Z+1QlgTxmLcX8Irf8ejZyfOM9PwGZoxQ8DTIxfyP26TKHQa8/eniwa
 5VkkA3d8pTse4r0dOJCuVzJ7tVGorZa4j00agSZlOLHXj3ZfAsNOuJZlJrEZNEOeAyBNllXpmv4
 kqpM3KnxFsD0qhGhPvioz3WvrqTMrN0zM71nli1Bwell6+GuJp0sUDQG+1eAkLxu+ZUj6EoPXoW
 Fyx05511zL8P2WCKto23+8iI4Dq+iiLIs9ekHQyDO1tWJ/Y0tiqkpumDwPPP1ylIrPj3ZXuTeUu
 Wiqfi/3gxKpbmZw==
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
is not an issue yet, but in order to support multiple devices easily,
convert this code to use drm and device managed helpers.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h    |  1 -
 drivers/gpu/drm/vkms/vkms_output.c | 22 +++++++++++-----------
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 9a3c6c34d1f6..101993378b49 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -98,7 +98,6 @@ struct vkms_crtc_state {
 
 struct vkms_output {
 	struct drm_crtc crtc;
-	struct drm_encoder encoder;
 	struct drm_writeback_connector wb_connector;
 	struct hrtimer vblank_hrtimer;
 	ktime_t period_ns;
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 4fe6b88e8081..bbec7c14229c 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -13,10 +13,6 @@ static const struct drm_connector_funcs vkms_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static const struct drm_encoder_funcs vkms_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static int vkms_conn_get_modes(struct drm_connector *connector)
 {
 	int count;
@@ -51,7 +47,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	struct vkms_output *output = &vkmsdev->output;
 	struct drm_device *dev = &vkmsdev->drm;
 	struct drm_connector *connector;
-	struct drm_encoder *encoder = &output->encoder;
+	struct drm_encoder *encoder;
 	struct drm_crtc *crtc = &output->crtc;
 	struct vkms_plane *primary, *cursor = NULL;
 	int ret;
@@ -96,18 +92,24 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 
 	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
 
-	ret = drm_encoder_init(dev, encoder, &vkms_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	encoder = drmm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
+	if (!encoder) {
+		DRM_ERROR("Failed to allocate encoder\n");
+		ret = -ENOMEM;
+		goto err_connector;
+	}
+
+	ret = drmm_encoder_init(dev, encoder, NULL, DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to init encoder\n");
-		return ret;
+		goto err_connector;
 	}
 	encoder->possible_crtcs = 1;
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
 		DRM_ERROR("Failed to attach connector to encoder\n");
-		goto err_attach;
+		return ret;
 	}
 
 	if (vkmsdev->config->writeback) {
@@ -120,8 +122,6 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 
 	return 0;
 
-err_attach:
-	drm_encoder_cleanup(encoder);
 err_connector:
 	drm_crtc_cleanup(crtc);
 	return ret;

-- 
2.44.2

