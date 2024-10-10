Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D025F998E6F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 19:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4035710E984;
	Thu, 10 Oct 2024 17:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZrAk3ji+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF31D10E9A0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 17:39:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B57F6000A;
 Thu, 10 Oct 2024 17:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728581952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PdDg8pgo6hxWE8qqCsve/ZQum9OXZmVcmDbzpy+h8Pg=;
 b=ZrAk3ji+jOXeFc3tXSg3rJJgXDgGWzmbaB4fvjO8VMgTE2NSoU0bM5v0YZ8Kesc2gHZF6n
 GK1ZzLpGurlcEpMFEOVH7gSikB7cilX9IPWlPa3gpxXpWvcLUyrF1JMH0+AoRCHOdD36En
 HTe8Yd1ugM58/Qhj2X3W4umfUbUX2cN229B7QNSbm+gBkPeU9DbV5WI2U3hWB0tfxNG9Ix
 z8j6KhdZ1ESHA8wrENDP0Tu7LYpuVjytSMnKUxbsnQFoflOCItvLVMKLpblc5l82E5lKS8
 oSVlUOOp/DxcyCclJtbodCwitwUDq+jb0TZAi6rHDq2gU0gAPGZsyTlgamAsGQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 10 Oct 2024 19:39:05 +0200
Subject: [PATCH v4 3/5] drm/vkms: Switch to managed for crtc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-google-vkms-managed-v4-3-ed04a62ad2e3@bootlin.com>
References: <20241010-google-vkms-managed-v4-0-ed04a62ad2e3@bootlin.com>
In-Reply-To: <20241010-google-vkms-managed-v4-0-ed04a62ad2e3@bootlin.com>
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
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 20241010-vkms-remove-index-v2-1-6b8d6cfd5a15@bootlin.com
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2642;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=PQ87QRrHXXBxQiWqyj4h93dY9Re2kRrb505r5//jqMg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnCBE6rkwcXhC0wI4yvPydsQ7G04/qbmhQNnmDa
 aJkIqgfSSyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZwgROgAKCRAgrS7GWxAs
 4k2FEADVySM/u59SKXvJ/mNkpg1otkqm1srqB1zrYRlxmAZwe2SoemXQMC7apI55CTX01W7aUvt
 nY/ZqXCjvEI/+1Ayk9Q00OsCGDY+GhpPl18TmFWwYg7iCEbZuWmnuekIuE50mb8EN4zITuJHqss
 HqNXfPJcDVd5B66pvsKkywy1MQdnHi8UvBrU609jpWBKcQlW7DSicIxBiwybhe/oSFQkANYMBlR
 6X31IBsqbaUlCbvOBfNFeNK4OnH57lJWSLZnyR1FqrUJhj/WyKtxSQhl0XbjP3xxeG4NaPUUk2G
 jiUg9YNe9qoXsCBGo773zNpqvhlRzIQcZUz92TMmst3Uw75NUdr8OXMI3VetIYXe8F2mR42C+FH
 Kqqk0/t6mutFcN70uxxDncWu3xUFC5+ycHhSkjVoEzyej8IJ445+IDFUeQJCIeO0lG4Q9xWPwb2
 d0b4tCF0Goo8NORQCx2SQb0o5Rv5sb4cTX6gv7eR9fK6PmQPBujQLFSZ/fCylKiOr8hkbczmG8V
 vWHgita0ApMpzxuQP8ce2kktAYRaNVMw/+m9w0N1jPYV+fkvG3Fjr9AXgptfBqLcn31Ru8llwT2
 tHrP0f0kDtiOghx6UzKit6DNDg4tbqwmW/b8/EV3h4NOekjwjWWvSsJxF9dOiRmPBHpqctLg7R4
 svcQao/vqc0GgEQ==
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
index a40295c18b48..877877dc0af1 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -6,6 +6,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_managed.h>
 
 #include "vkms_drv.h"
 
@@ -274,6 +275,14 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
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
@@ -304,5 +313,10 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
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
index 0f6805b9fe7b..eede3b8c70ef 100644
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
@@ -110,7 +102,6 @@ static const struct drm_debugfs_info vkms_config_debugfs_list[] = {
 
 static const struct drm_driver vkms_driver = {
 	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
-	.release		= vkms_release,
 	.fops			= &vkms_driver_fops,
 	DRM_GEM_SHMEM_DRIVER_OPS,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,

-- 
2.46.2

