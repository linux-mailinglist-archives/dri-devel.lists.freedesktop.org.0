Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E199D62E7
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78AB510EC35;
	Fri, 22 Nov 2024 17:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="O1n8CCps";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434C410EC1D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:20:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36CD31C0008;
 Fri, 22 Nov 2024 17:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732296030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aD7eOqd1AXVZgfGyfB+5KKxVBcCNLMv/mDAuDrDv5h4=;
 b=O1n8CCpspFjFEfbeszeFVOt7deQ9wVN6r06KBWJrys7m3VYBYXjk4TQxNd5v15h6o5WigE
 PyNkTflMwbnr+/u2UCxQBiJ78JxfpgroWPxMXNa756JOiwlm+iWxnz1DtSo7cbM0fg/t2j
 h1A7OGMigzeqC/+kFCqgVhvMKAwdq8SR2NKVMrCiaxvQn1vTzjohxnIDzUXbVC7o9lwy2U
 UwTh4PS86EoZLyh4+2Io3RaJKbtL4hT2g4xuZbPfCYIWxg5a13j+/D/JYBdKAn0aJSJGp2
 CGTJchiTxC6wbSMhhxgXHYSm6nq+20QJSZ2VYZSzHIjF9lART+GiY3ENv/kXgQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 18:20:14 +0100
Subject: [PATCH RFC v2 10/18] drm/vkms: Introduce config for encoder name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-google-remove-crtc-index-from-parameter-v2-10-81540742535a@bootlin.com>
References: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
In-Reply-To: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: arthurgrillo@riseup.net, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3130;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=lAxbX9FjGzHOgfioqpWzaGxl1qtPSft9cB6C9sfd15M=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQL1PdSWoGQkRuiGt7ExxbhNNACbrFuqmzTbzb
 lHdX7lFlhiJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0C9TwAKCRAgrS7GWxAs
 4g5LEACLYTUvph7FwFv95+ygxrr2rhQFgG0hKnQBJ4Tnx08RnOJyN58EnMkusHgWybjjj72/WSX
 Sdw5fDQgpawnaeQyRUeOtzdZBs6PXpWgsgzC+xwWvEa9M4siTiW65A9xg7+C5MRmCRRkPNxWCTn
 bMp6l1Wge44spaioLYBKRT2IF4Fshl9Lc49NbxsOS/hV3MfksLLvFmzQ9cLa40zE+vcf5YsI6gp
 C4VE/wUHRZUEeKSI7Jt+eAaDAmN59+viC6wztVMuyWK9P3cHXnMYtCO7xZEccLupN+HdLow7HoT
 9bDYfuCsDOip3167BveUCPbvO/mJHQbxnQqKQCcpokH6JD9v+zRyrAenEP8Ob4ImatfRHfG850t
 QkFw+/yOzmjUhC7HNt30ml9OdBng6H/Zzi6zCdP1t1m5sGyrjjoUEVNjFp7AATNGc88DdrW997v
 ZEBJFdGPxDShidfCnuFgtGfjx6luuHpN34EnBYArbA5COYnuPBRlF2S8zDcD5PTpVaBWXtENrD6
 WXQaw/nBDVjQfXIqSMAbyhxD2W+N3Ifh2w1Sf5ex3eR5b3a+iOFMFbvQYGRzOsAWRF3cf28jc7N
 JT5fEey9pvFDSr4GolWNmIBj4gBa5zt+ctsSKjOeP3Rk1UUvIKOulP+jpxAYuI0C3kxeE6MVdlA
 59UnnhL7nsx+iAw==
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

As an encoder will be a directory in ConfigFS, add the configuration for
encoder name so we will be able to reflect the configfs directory name in
the drm name.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 6 ++++++
 drivers/gpu/drm/vkms/vkms_config.h | 2 ++
 drivers/gpu/drm/vkms/vkms_output.c | 2 +-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index e44ed904cefb97b8b6ab8fc27623e315397e0106..a2539fb56b602569b75748fdf9c4784f104b0bff 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -41,6 +41,10 @@ struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable
 	encoder = vkms_config_create_encoder(vkms_config);
 	if (!encoder)
 		goto err_alloc;
+	encoder->name = kzalloc(sizeof("Main Encoder"), GFP_KERNEL);
+	if (!encoder->name)
+		goto err_alloc;
+	sprintf(encoder->name, "Main Encoder");
 
 	if (vkms_config_encoder_attach_crtc(encoder, crtc))
 		goto err_alloc;
@@ -238,6 +242,7 @@ void vkms_config_delete_encoder(struct vkms_config_encoder *vkms_config_encoder,
 		}
 	}
 
+	kfree(vkms_config_encoder->name);
 	kfree(vkms_config_encoder);
 }
 
@@ -403,6 +408,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
 
 	list_for_each_entry(config_encoder, &vkmsdev->config->encoders, link) {
 		seq_puts(m, "encoder:\n");
+		seq_printf(m, "\tname: %s\n", config_encoder->name);
 	}
 
 	list_for_each_entry(config_crtc, &vkmsdev->config->crtcs, link) {
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 8f247fc09373fb2c8145e83be05c6afec1ffac1c..4223edd94ec270915dd658c0b5efd489554d33a5 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -50,6 +50,7 @@ struct vkms_config_crtc {
  * struct vkms_config_encoder
  *
  * @link: Link to the others encoders
+ * @name: Name of the encoder
  * @possible_crtcs: List of CRTC that can be used with this encoder
  * @encoder: Internal usage. This pointer should never be considered as valid. It can be used to
  *         store a temporary reference to a vkms encoder during device creation. This pointer is
@@ -58,6 +59,7 @@ struct vkms_config_crtc {
 struct vkms_config_encoder {
 	struct list_head link;
 
+	char *name;
 	struct xarray possible_crtcs;
 
 	/* Internal usage */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 03498a20d78dd8a66f9fc66b360c5ea57fc48d88..6277ad72fdd476d1eff52ad037389bdb1a254f5e 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -92,7 +92,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		if (!config_encoder->encoder)
 			return -ENOMEM;
 		ret = drmm_encoder_init(dev, config_encoder->encoder, NULL,
-					DRM_MODE_ENCODER_VIRTUAL, NULL);
+					DRM_MODE_ENCODER_VIRTUAL, config_encoder->name);
 		if (ret) {
 			DRM_ERROR("Failed to init encoder\n");
 			return ret;

-- 
2.47.0

