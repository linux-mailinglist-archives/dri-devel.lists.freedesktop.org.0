Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2529D6247
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 17:28:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AACFC10EC16;
	Fri, 22 Nov 2024 16:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="P3HKZDtA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F3810EC0F
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 16:28:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 759B1FF80D;
 Fri, 22 Nov 2024 16:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732292884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1+R80H/JRGfBTVoDp2ktoWF3096dmo8Cz+WCKV/JNeI=;
 b=P3HKZDtAeF3p73ttTBvl7KN37/DgmHEjydvoPZBobuDHBDecrd26TAWNVLTMxAgk71cDWy
 N2JRUuqE0VAcBdh3IJJG3ZsLW+0ojTFBSjJ7iTONVjRHkL3hIXEP+LvS8g5oGENqmaGwdz
 k81oMDRK1sv9zwWk9NHKKfAyHr+exKwapFyZfZTqgJMg4UzwI2Uk2XxnIgGFM1OIfwAg53
 hrZxiEcXngWM8Ujn/qqkEwA3IaUmmKJFyZ4Hss//cJzGwU6+q8RGT7tWPvGCHX2gGt6D3/
 EaOCghLG5jhACc3Jjm86bnkLK/B+dnPjzs+nfj8p/IRD9KuDS4xa3HXbn5gMJA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 17:27:58 +0100
Subject: [PATCH v5 3/5] drm/vkms: Switch to managed for crtc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-google-vkms-managed-v5-3-1ab60403e960@bootlin.com>
References: <20241122-google-vkms-managed-v5-0-1ab60403e960@bootlin.com>
In-Reply-To: <20241122-google-vkms-managed-v5-0-1ab60403e960@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2754;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=IeQtyAkoL+fPJOYGNUGaUHbisJKJpYsSLjkQcRf+0qY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQLEO7iec3QJLdf/6qBQy+AY+D3nvFCKHNjV66
 tOUMP8oH4KJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0CxDgAKCRAgrS7GWxAs
 4mt3EADBKFj4a+geowtri1oJYj52IoFc11iL+oCYV+m7llgPtlZm0TRcqn21AKU6KBLiwYyr2Ap
 ImnZA2LS0jq8YhbULBbstgaaS7cfIo7nL20mlxaK4NP7RUO/cjGGKh3iyks0PUuo8oEzUW5FuX/
 tiKVB5s6VDXsVa+rJrhZAM+NeFFblW3F1Lna1QsyoVF9FD6xpgowUs4VfFPK0hhqx+VKwwGEm+m
 VBsPApdT/x9XIeayK7UaMtoYEGckEChQl7j8Q6iuGZOlC3PP28KqMtY00XMAWsX4Y5RLGDGg4CP
 sxtbYaJ42FKC8BywcXiux+eLtl36lXhQzB9ZvTj0HtlszEmldNNM1WwtJyWHEJtmTBxhJBftacm
 U06rS4nxI9d2uCASJZ/oTrLS6NkkX/VMuA1GTcc47tG//ygBNXifuuaQOY7U2ZiYnIzAzivTAXB
 5PuIhHV4ENh22Umq17godTkyTy8698AJBF3wXChDe3coLCo0tCl2HXKuPIoOhyp7SGEFae/LXpQ
 brwzRXyVy2iSVaYtNzVsrAETd06+HhtzVha6rKCWBUsIAerw267+3sc62+qUnCnvWchPrOvxLWq
 gwqXMVAmho4aS2RMe5JF1WnbCurlXm1wyOvhRzE0kvygnXQvLtTwJ5UIWvcQo8EGeyt6WpTJGBb
 thH22oxbI2EDcyA==
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

The current VKMS driver uses managed function to create crtc, but
don't use it to properly clean the crtc workqueue. It is not an
issue yet, but in order to support multiple devices easily,
convert this code to use drm and device managed helpers.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 14 ++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.c  |  9 ---------
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 28a57ae109fcc05af3fe74f94518c462c09119e3..ace8d293f7da611110c1e117b6cf2f3c9e9b4381 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -6,6 +6,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_managed.h>
 
 #include "vkms_drv.h"
 
@@ -270,6 +271,14 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
 	.atomic_disable	= vkms_crtc_atomic_disable,
 };
 
+static void vkms_crtc_destroy_workqueue(struct drm_device *dev,
+					void *raw_vkms_out)
+{
+	struct vkms_output *vkms_out = raw_vkms_out;
+
+	destroy_workqueue(vkms_out->composer_workq);
+}
+
 int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 		   struct drm_plane *primary, struct drm_plane *cursor)
 {
@@ -300,5 +309,10 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 	if (!vkms_out->composer_workq)
 		return -ENOMEM;
 
+	ret = drmm_add_action_or_reset(dev, vkms_crtc_destroy_workqueue,
+				       vkms_out);
+	if (ret)
+		return ret;
+
 	return ret;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index fa3331f612e34e0a48cef34effc169dea46d77df..c54504e590a18ae8af07cc1cc48179c38c4e6c0f 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -54,14 +54,6 @@ MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
 
 DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
 
-static void vkms_release(struct drm_device *dev)
-{
-	struct vkms_device *vkms = drm_device_to_vkms_device(dev);
-
-	if (vkms->output.composer_workq)
-		destroy_workqueue(vkms->output.composer_workq);
-}
-
 static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
 {
 	struct drm_device *dev = old_state->dev;
@@ -109,7 +101,6 @@ static const struct drm_debugfs_info vkms_config_debugfs_list[] = {
 
 static const struct drm_driver vkms_driver = {
 	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
-	.release		= vkms_release,
 	.fops			= &vkms_driver_fops,
 	DRM_GEM_SHMEM_DRIVER_OPS,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,

-- 
2.47.0

