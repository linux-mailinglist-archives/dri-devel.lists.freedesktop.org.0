Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FEBA17C60
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614B310E56A;
	Tue, 21 Jan 2025 10:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NIgS5wJf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0A810E562
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:55:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A6024000C;
 Tue, 21 Jan 2025 10:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737456941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hpHf/dwE0ZFFls51Bfsr0/QR2MdI2uzLK7K8SI5Chk0=;
 b=NIgS5wJf8+4ka0S7w5XSrbZf+5/e8dD+ZmeVw/4Ofz5Fq8AE3MB22jsRb6gmxCzstYj5Tu
 /og+wJSfUwGCn91NZHF+M6vMobtV+V0oQW/WxWZzXrx/ii1qr3s57mTlculvHfOtPvvvsT
 qEhrNHECXiCxLXG+IVKGraFyriO9BGmJ6X1sp7fTLIzF7ibHj5yYm6RjqJ0lC+ahTNfxPw
 LTxHfiJoC9s1PZVJGmkUhQr3/SRc7dsb1rIARhpp3gdKhfRca7DWThFHg12D4nPuNeO6Ws
 z8sLBDiTsT6G/vh6681TptM/Hzf1xC8WAPFyqbD3vGR1rNBNzQ6UXzVAkeOhqw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 11:55:32 +0100
Subject: [PATCH v3 08/16] drm/vkms: Introduce config for encoder name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-google-remove-crtc-index-from-parameter-v3-8-cac00a3c3544@bootlin.com>
References: <20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com>
In-Reply-To: <20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com>
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
 bh=hBqs3tcNYjsGtdjYrUbEjbluYX3zYTivRwT1laGCLWs=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj30iwWiCWpiA7IotEeVHBG+4ErUzPTXa0GFOI
 vDNbU5XmFCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ499IgAKCRAgrS7GWxAs
 4nZyD/0fD///+Rp86wfp90OOJwepFumkX6T0mcTez8UYlyxQBCjLDImP12ivDJJIBz5omzKk1G2
 MOdgl388XUkKm2k1qINmZic8rDb9pCsua/Gm7Hs6k+Hcjt452wgAd9aZcN/sMmhgCI+R+u+rBqZ
 LYydIDbZHhu+drz1OZiioe/ZpIXY1RKpEXLy4+5x0hIIwUhiOChcES0ye16uhu3kSSaj9aInssl
 fb/e93+Nx/wvNEgB4/mrIixMOAcNkt95kc8GUHJv0afro1mcxHQazcHFHa09mEud/LIe9rTzs6e
 JLnf+l715rtmYs/ZYWiMNPSXG0GPqN4DSnGIfuf0T3gv+e+Is7arXz95zpnApIneu6gudm5GEVn
 jRjkGn28mVwGnAUfuZnE3qKMjsMAdumRbJy+XHntGrV1bcJSQXBV8akDnvOha0JYrDGnm4tNko4
 pFrtshAOnSNSQAbrJxz2ViMP+/OHeLw4v388aBB5EAn7cyL2SWieTKLEtnXGVGAisArg1jk+mmm
 XXCvJhRgZj/nSO/+oar262oF5nsNF0eS3Cdj4cU5ONFL+d/LzlEDPQl30zMrh82ciz33r17mxcL
 F/cLUBxke3ZipYKdBEr/yQmq6bFqhJmwqQ5EnB5kiva9NSPjCBn3B2n3OpmR4sk+9Q6aNs7Abg3
 sfy2xdWhQZKUBjg==
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
index 314d252aa9b6ed1772c8ef597bd9c6b08145723e..8c88af745eb208a52f58fbf5def3f16c29d31063 100644
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
@@ -231,6 +235,7 @@ void vkms_config_delete_encoder(struct vkms_config_encoder *vkms_config_encoder,
 		}
 	}
 
+	kfree(vkms_config_encoder->name);
 	kfree(vkms_config_encoder);
 }
 
@@ -376,6 +381,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
 
 	list_for_each_entry(config_encoder, &vkmsdev->config->encoders, link) {
 		seq_puts(m, "encoder:\n");
+		seq_printf(m, "\tname: %s\n", config_encoder->name);
 	}
 
 	list_for_each_entry(config_crtc, &vkmsdev->config->crtcs, link) {
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 90ced83f5eb6dae5ccc14c37169606d833ba355a..874d631f8895c47eca6eba8bfe20b56b88966b67 100644
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
index dab949c983a5991696baf937f948c0f78710d6e1..fd641fa750f20b1a95994acc2778a74942125fd9 100644
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
2.47.1

