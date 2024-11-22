Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE879D62DF
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:20:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7329C10EC2E;
	Fri, 22 Nov 2024 17:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="guAscFtj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B65510EC1D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:20:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26CB11C000C;
 Fri, 22 Nov 2024 17:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732296030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FPjoDbbnyRr8NB8CQTYsw04Lz1RI3/dvKXG1g5TXNeU=;
 b=guAscFtjUM5GWTCaMvjH05hO+2BPd06hoQ3+8ckboIHNlY2LvEyzyKH7C3+0NDzAQ9/zCt
 uLD4gLQmo1HcSODPFcZDsVavZ1NxeGhBCGr5wNGv4gfw2x44k4JTcoS/n9CLWmNwiZsdxg
 ajK0L6ON9e2ABBdnRB0tazulxjak8BoAZ6snqWRHouXQ4SriP0dtXrn9P+8yFwvXh6Co60
 AU2Kml+rrJZwxeargv6oHabLKpG3PNpWuz4fipuVJTfy23Fy4kQUKgOysh1rXcuMfKjtms
 CUNM/RS3fjMXSfT4mdrlFb8tJcz4HtyzOgPt2LJtb39wWDC15cXBBh0ghWkmuw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 18:20:15 +0100
Subject: [PATCH RFC v2 11/18] drm/vkms: Introduce config for CRTC name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-google-remove-crtc-index-from-parameter-v2-11-81540742535a@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2727;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=XPH7g+AmIjMlHLLHQSbiTuo8nFUzQItzE3jlEy5xM9M=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQL1PdImx4wMcOGyY7gXf+uKLYlrrpEEym4oWq
 P349JzMu6OJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0C9TwAKCRAgrS7GWxAs
 4rmBEACowjbfGf2hpsh6W6gtRuxg7jRi9OFoNB49utSwzHIu9NQeCdubJ5A+j9lDEPoGxEA/0Zv
 NIhMzd/6pY5OZeTZs0LkDFV/QzsmbRkcEoy9yr2emPy3xgcYEEoCjK3R2Mtv1UXt68O2S7RwaYe
 YlOkB51CjGzLY0s9eEFFQNKEE0TsGGymiLRxwqJ2XfDlC5yOmpCh901ZJ515S3nEsM0pEimMuj/
 c1m43ptqyLLng0ekpSHN+GgW7jcp+/BBEz+FOrNxmw7/269Xjxcj3Bt1O01ZEAxKyfHOt/Z7tq9
 DLtqZb9TJDaRRqJbGJyuwVDuvjOEoo32e4i3K8puhF4iL7T3IXQ9rOFNR73J0JvmeLLZrvezxXM
 cbqMP5LqfJ9QYQ0gOle46mP15NUb2OA8aE7rDzFxdh2yXlMJn6Dp5HR4AV3rWAVr62zrkAOsqD2
 ne9nQ2Si/iTvD26SP1UZh7qteb9L866opG8eysqtSlqiYnqLl//w1BislyXhDQPXQXkW/AHnz7+
 M6KIdEVqB142N7yb2VJBJlu56Pzo7lA9pN3zkEOZ5pRFSm2jo90zXG6Hp674qGj7Y3SJyUsvJwv
 20XTQQL22fYZ6XvREZBS1eiD5w4OSatuDigDnUpnWA1TybGG0Us9y91v6aF+BQ56/VtGhAd3xU+
 VClVQRKcvHk0OIA==
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

As a CRTC will be a directory in ConfigFS, add the name configuration for
CRTC name so we will be able to reflect the configfs directory name in the
drm name.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 5 +++++
 drivers/gpu/drm/vkms/vkms_config.h | 2 ++
 drivers/gpu/drm/vkms/vkms_crtc.c   | 2 +-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index a2539fb56b602569b75748fdf9c4784f104b0bff..3252f657ce515c0193a8c0e709bfe861feba0aca 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -37,6 +37,10 @@ struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable
 	if (!crtc)
 		goto err_alloc;
 	crtc->writeback = enable_writeback;
+	crtc->name = kzalloc(sizeof("Main CRTC"), GFP_KERNEL);
+	if (!crtc->name)
+		goto err_alloc;
+	sprintf(crtc->name, "Main CRTC");
 
 	encoder = vkms_config_create_encoder(vkms_config);
 	if (!encoder)
@@ -219,6 +223,7 @@ void vkms_config_delete_crtc(struct vkms_config_crtc *vkms_config_crtc,
 		}
 	}
 
+	kfree(vkms_config_crtc->name);
 	kfree(vkms_config_crtc);
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 4223edd94ec270915dd658c0b5efd489554d33a5..4a4c16dea7855cf36060986ef247be698974fafc 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -29,6 +29,7 @@ struct vkms_config {
  * struct vkms_config_crtc
  *
  * @link: Link to the others CRTCs
+ * @name: Name of the CRTC
  * @possible_planes: List of planes that can be used with this CRTC
  * @possible_encoders: List of encoders that can be used with this CRTC
  * @crtc: Internal usage. This pointer should never be considered as valid. It can be used to
@@ -38,6 +39,7 @@ struct vkms_config {
 struct vkms_config_crtc {
 	struct list_head link;
 
+	char *name;
 	bool writeback;
 	struct xarray possible_planes;
 	struct xarray possible_encoders;
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 3825fba57c012f84cbe67114e053dcd7fcfa283d..25a3d97a362afd0d40f3e023d9cce985d447a880 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -292,7 +292,7 @@ struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkms_device,
 
 	vkms_crtc = drmm_crtc_alloc_with_planes(dev, struct vkms_crtc, base,
 						primary, cursor,
-						&vkms_crtc_funcs, NULL);
+						&vkms_crtc_funcs, config->name);
 	if (IS_ERR(vkms_crtc)) {
 		DRM_DEV_ERROR(dev->dev, "Failed to init CRTC\n");
 		return vkms_crtc;

-- 
2.47.0

