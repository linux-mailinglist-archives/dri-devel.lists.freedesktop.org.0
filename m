Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37176976A75
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 15:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B8210EB7A;
	Thu, 12 Sep 2024 13:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="kly6+zF9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0011710E00A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 13:25:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F193540008;
 Thu, 12 Sep 2024 13:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1726147520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jHUlHTbWDx2+CDiUKbnK1f55570D9EJQ2eAZEAhIJoU=;
 b=kly6+zF90KYgRQbIoWRDniYYV0LzGH//6fKiJHjcRIMxE3IzzwyNOnLgSt/XQT8Kr7EU2u
 5jMhDAbEuFhhhB2Hqte6R2DV29k0phpNHguw5i63wogXZUbDNiteU8yVKtaDrCX/M8q2Vv
 racceRBwAr1v/gKI64Eh9k5g9/Ou0a0hM6UaY9E+MB72VXhYQ0eFooVVVNePavjxQa3rye
 VQT/fy0/qbYdSXs40OA99BmamP52vLVXA6rMan0CXoB76Wbl+3uoH7ud+41iqsAvkCnzrZ
 H1NdmIKvrSI4hYujOi2Z8a9ft6oTYPdw3nxiSxFDOzxwH9J132snYkuKPiJWxw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 12 Sep 2024 15:25:16 +0200
Subject: [PATCH v3 3/4] drm/vkms: Switch to managed for crtc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-google-vkms-managed-v3-3-7708d6ad262d@bootlin.com>
References: <20240912-google-vkms-managed-v3-0-7708d6ad262d@bootlin.com>
In-Reply-To: <20240912-google-vkms-managed-v3-0-7708d6ad262d@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2726;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Wz5xV9ppwUXESjrOq0r7h7WjvQ6z2QMJPsfZHBp14W4=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBm4uu8NHGz3GXdoQCk4tGqrkN/oVHXvfrtKeBjQ
 BdHnATj/eWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZuLrvAAKCRAgrS7GWxAs
 4rLsEACIA5/nrrQ5DoWXFEv0ncatq0EzNyKKtePfTgVlVYclD45bH04vUoxNNbUuaER2qpUQC0X
 712GDZqUIWDdM58eIjm7bixZgPuwetmR+Hnv2IDolO3WxatPFDUDMoadymiLB34SOfLdigIFsIX
 bYH5pWrJYuEjTtBd1WMT/nTMWmhrBY3bD8Yfp9KmqidC/u4SpvyemqXVNAtyLeeud3j91LR5qcD
 Oou30zr9m97UJIQvsTAWiQMqt5BWI1r5/+eSsuPEXps8hAMS8FicILgxxwP/N4shpO+uR7ZZ0Vr
 CCfGdVL1TB+lWdewYVsvf/zmtgN1P3VGOidQj5UeIaHzUghVOmaUAKBOgo7h/fONR67jGjZPHt5
 7f5/ERYXEqa+VHWUbS8da6kGG+nUAnPboCEh3yL59A79B0peBngX7/fi+RrwGdHZ2Ht1MlhgE3G
 5BzyZ1K7CiFNmLc8wofo6DT+NNIBcX/xdlyKRTmlnlrmhcUFvoU1MPavsiCVMwfTX98tNSLzUWX
 gvj175t0y2FK2WDuN2Z/hbJ9nK94q1PhhTtFJhXpbOFnSieecfMnjH6zr88ky2yqiUnrtRUBXAz
 yLaUE4H2D/Ss4EwLXS7p/Lk9hnZJiNcDDwXihuH/T973dSqpEycRD/1O3p8aF5deYyzmhhvHn5+
 scn+k8qS+O9NeHA==
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
index 40b4d084e3ceef9e1e24b7338efdd9253afee8d6..821b9ac746083630116e05c1cf8e3dc2424ac66a 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -6,6 +6,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_managed.h>
 
 #include "vkms_drv.h"
 
@@ -272,6 +273,14 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
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
@@ -297,5 +306,10 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
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
index 1226a790bece7e197ab200f9fab68ee3dbaf340f..f6c2acb57f21bde5282682f090f48867ba3615c5 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -53,14 +53,6 @@ MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
 
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
 

-- 
2.44.2

