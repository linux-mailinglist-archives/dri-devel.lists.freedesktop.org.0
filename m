Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95325951D3D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 16:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 783B210E4AC;
	Wed, 14 Aug 2024 14:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="i+kmEQDo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D328A10E4AC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 14:36:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD3991C0008;
 Wed, 14 Aug 2024 14:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723646190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eF/g/e9xyf2rr4km0n8jSrkU5dfzWS16jpF7TN6tyR0=;
 b=i+kmEQDoTc5UcmhFyS/BGglA4SyL3EormN70z0AGzVYTJMMVe7j4PxnqsikIn6tzJPma2J
 ptBagwhWlbaliy+DPR/uiBUxXhs0TDr/rXM9uFA6JEJ75ByRZ10hSvp/HqewvrS0l/8l0/
 GaYRC6vg534VhV8LJAb6aOF27SEA+DnKrNQDfI2xEru33m5EDTfAKadQyw2pwmviBna6ON
 Ct3YxeO2mZWEMy5Bw4OdTjOKR5uV5BIU5w6UVlB+y6Ybv4QwLyzeWkqc+z9o+7fEmGD4GI
 Hp81XAYiqRvrsYbTdiT1yNYtV8LC7Ru+0gwDzoT5RwaFRuuIOnfh32SflMvViw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 16:36:23 +0200
Subject: [PATCH RFC 01/15] drm/vkms: Remove useles devres group
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-google-remove-crtc-index-from-parameter-v1-1-6e179abf9fd4@bootlin.com>
References: <20240814-google-remove-crtc-index-from-parameter-v1-0-6e179abf9fd4@bootlin.com>
In-Reply-To: <20240814-google-remove-crtc-index-from-parameter-v1-0-6e179abf9fd4@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2158;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=QLAjOjwHapYP9G4IFhnwtelvbUro7gbDDe4ixI5k8dA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvMDqaNNbQt4vZtJxwAG1VpPbZq4w8JjIi8Xkj
 utFmLTi+76JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrzA6gAKCRAgrS7GWxAs
 4rEyEADAM3Zuqga1gLTTIqu2xnxwAtMPs6sMRnWsHhnXd4novePYULsml77ZAacX3ar4FTEwVjP
 oE3Xb8DbSJeNe6G1bZ7Dm+zIgBbg8vzteM4W0MjDvXc3COrz9sOEwE/qev0m2YP9Yx304SYu2Ug
 nHM7Pcft8eDjMQmAzcLOAynYNOPJ6mZgTo6nfHnvLQ7rGDVIxAuHNSqSpiJ+Qdj6sGd6s0C+YWS
 vXaeJvL9MUsXi6Rdk004sCYFq6Op4DooRdKJkmMLst0qUd15ffRlftoJ5y6Dsaov2751gf+QrI6
 uAodQE/zloe4dRbtZM3TwcLeF+HJh6tTkcZKD64od/D5bWp4P6KdO1FCewTGBoaoihrBuSTBhSo
 bkiMrM5Z5do03orRDnFgDPrMbBO9Z3IdA+TufcGoZ3CFRQu5FkUohIVYUXssFY+2MJogtz8vTaZ
 MyZ7ubjJcy0k9g+Jg0McugpDmkcmyAKuQL9rEzFsx2YlU4B1QIZI1czmR0LOjKUDNf5QFhv2FM/
 ZouyewjgaNGLy9pX6XcRl8lLNE/w0yrwnEF4fgV/lor158KJBijfeOcCdph9/pH9PzEmgazvul9
 lcziSWUtohrd6j7lqlyUyfHgolJ0OFVa6VK3qLU+YGdzbICLuIbwj6ArKkLOeijGUKUC3yl8MBk
 oVvSOBnDMoIfJpQ==
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

As the driver now uses drm managed allocation, the devres group is not
needed anymore, so remove it.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index e79832e10f3c..7ac3ab7e16e5 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -297,16 +297,11 @@ static int vkms_create(struct vkms_config *config)
 	if (IS_ERR(pdev))
 		return PTR_ERR(pdev);
 
-	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
-		ret = -ENOMEM;
-		goto out_unregister;
-	}
-
 	vkms_device = devm_drm_dev_alloc(&pdev->dev, &vkms_driver,
 					 struct vkms_device, drm);
 	if (IS_ERR(vkms_device)) {
 		ret = PTR_ERR(vkms_device);
-		goto out_devres;
+		goto out_unregister;
 	}
 	vkms_device->platform = pdev;
 	vkms_device->config = config;
@@ -317,32 +312,30 @@ static int vkms_create(struct vkms_config *config)
 
 	if (ret) {
 		DRM_ERROR("Could not initialize DMA support\n");
-		goto out_devres;
+		goto out_unregister;
 	}
 
 	ret = drm_vblank_init(&vkms_device->drm, 1);
 	if (ret) {
 		DRM_ERROR("Failed to vblank\n");
-		goto out_devres;
+		goto out_unregister;
 	}
 
 	ret = vkms_modeset_init(vkms_device);
 	if (ret)
-		goto out_devres;
+		goto out_unregister;
 
 	drm_debugfs_add_files(&vkms_device->drm, vkms_config_debugfs_list,
 			      ARRAY_SIZE(vkms_config_debugfs_list));
 
 	ret = drm_dev_register(&vkms_device->drm, 0);
 	if (ret)
-		goto out_devres;
+		goto out_unregister;
 
 	drm_fbdev_shmem_setup(&vkms_device->drm, 0);
 
 	return 0;
 
-out_devres:
-	devres_release_group(&pdev->dev, NULL);
 out_unregister:
 	platform_device_unregister(pdev);
 	return ret;
@@ -383,7 +376,6 @@ static void vkms_destroy(struct vkms_config *config)
 
 	drm_dev_unregister(&config->dev->drm);
 	drm_atomic_helper_shutdown(&config->dev->drm);
-	devres_release_group(&pdev->dev, NULL);
 	platform_device_unregister(pdev);
 
 	config->dev = NULL;

-- 
2.44.2

