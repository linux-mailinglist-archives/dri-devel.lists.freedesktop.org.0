Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E8A9D634B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768D910EC40;
	Fri, 22 Nov 2024 17:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="AR9XbNNA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A51410E1DD
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:38:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64108C0009;
 Fri, 22 Nov 2024 17:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732297138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+JIvAjvsKfMMqoQ/DDIqtqiqCN3QonaGjVg5xDbExiM=;
 b=AR9XbNNAtUhmpdCYZ54mayzqLmtJMIZePEkoc1rBwJf8z/by16E6N1+p5vvPLV6AuSKWEi
 FJi+WUIVieWD74xhipWK1/p2Ef9LuV1457BT3FU62WHPThCpdt/i63J9Zf4bM1axNrzYIc
 y6Esx8D1fXXkxpqsdrHF9r2eA6fenFqmeClZQiThQhjfYqBd29fAWM7Xefw00oWZvW8fzj
 Le2ofrvZpUMOFrWbFG+IGeQvfZxjK4KaswT/BYsRfP6M12iSlFZU8xtdl1XM0Oc9Dbx3L+
 vySwCHE4AOg+tlweXINBIQxxyMhblJuLezcQ5R3IK4ddmUaubJOS+vsOzhmqBA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 18:38:28 +0100
Subject: [PATCH RFC v2 02/16] drm/vkms: Cleanup configuration field on
 device destroy
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-google-config-fs-v2-2-4b7e6f183320@bootlin.com>
References: <20241122-google-config-fs-v2-0-4b7e6f183320@bootlin.com>
In-Reply-To: <20241122-google-config-fs-v2-0-4b7e6f183320@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2929;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=qkqGvXdE+RYqqpCJhtuKm5uZqampj5EK592AfaLuMxY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQMGpqhTRcF3pCxMiUMLvZ4SK62LF7gVbIsWcq
 GVik7bwlK2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0DBqQAKCRAgrS7GWxAs
 4oSyEACH2huQsRPxrNntm4efoX6jA9LzcdBB3qe4XV2avjFhSjZCyHKKYHidnBZm+gHE5sm5+xi
 0HlvVZbPYCE7dbfL/nAXvbdbCj9PtYGT6w79eyeCMYmsnos3D9EPyi+dBTpAbUzAw5HLgLyeTCP
 SEdm7wkboOGvtRlmLz0hFJQcP+/SOIKD2tTjbbe6+ucO5HtwejSmudD4nahWexcAVD2PNsTOknS
 e2AWW73DftMkGpTWepyFXZZ5hMS1Jcd0WPdWJcjDqNrE2rKNGSipE8wPsVFHHR+uq6eKtk02WPa
 AiPtMLGTqx93yOBNnCdIwEMPsq1BkfCbBtevtkFk6eXgv2W/U4s7wH/7FBmyCvNOQFWX/UxmkiC
 fGYcMvdi6NQ0mDogecj+RcuHcsLHrgb0f4m0VpQmCdH/zstsszwu7YyJOylSCrsTH1hNE+3oYhg
 ifqkP8oeM8rPNpTzCcnAN9PF3hFrXHmGpfmu6Sh6DcmhkIst4/n7E4MmeNoGK3Oo35OGTBKuUN/
 kLMhA32Tfv26kZAlJ7iQorQRe690yYsVAf8ZvE9PnYIi7NKhLPOlDtQPCRBhH/T0U5HvLRY4s88
 Ay3zRD4rlIvLQVIaO4QmDIRSpgGTODSs4d2nKVKFQV4tOk7CUMf8ZRgnfm9Ef9wgDFS+1ME3+PK
 zL9HsGX4dkhKQBw==
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
index 26280ad223208a978c44ef9c6c6eaadf1756818d..9a461a0481c2a20d6d48f1aa9649843ad1b7d13d 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -204,6 +204,29 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *v
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
+		crtc->crtc = NULL;
+	}
+}
+
 void vkms_config_connector_update_status(struct vkms_config_connector *vkms_config_connector,
 					 enum drm_connector_status status)
 {
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index c6fe0573abd899e4b44b5ad390ff72e12664973f..529d9c99f3c406d49dc7f3689a84c3dd775399a9 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -117,10 +117,11 @@ struct vkms_config_connector {
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
index 2db393f5782eb26a5aa469a4774b2e19c886ee7e..8ffbd5fc65350ba03f870726b669d189f62bad6f 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -242,7 +242,7 @@ void vkms_destroy(struct vkms_config *config)
 	devres_release_group(&pdev->dev, NULL);
 	platform_device_unregister(pdev);
 
-	config->dev = NULL;
+	vkms_config_disconnect_dev(config);
 }
 
 static void __exit vkms_exit(void)

-- 
2.47.0

