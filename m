Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8C6650B35
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 13:08:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A31D10E28E;
	Mon, 19 Dec 2022 12:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CB110E234
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 12:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XLI4Q5BF1S4Y7/1I9tMeZIh/hDmMgqL/1tXLD7cwxp4=; b=IIZ+0am/AGpSBN/8WsZv+nY15m
 D6nCIeDL2TtuT0vFmnyOAG7RhDcFQUjUeX449QizsXNwnPMntNZRfwg/9Y3+gMwGGrj8OvDeBjtOW
 yjMEqoPrpu2J8GuZmee8B5+OY31HWWgFx3O+Q6H9WqnFzZPCD+fbsZcgOV26XaWykaAKXU+xoZ0iw
 DpJdQOBZUxjzllBGi7EkAH9X7pNaEc2/Odztg5PR2oNB8Q37Na4tX4g0/8BfQfM/41SdF1cc2KwZZ
 sBjmi+pX7uQqmALGQODebJ4tAygmx8fjxNokdwRkYBwIlBF3FArEag3da+2hAVs/kSp2zMCEESfpH
 AVK/Ac2A==;
Received: from [177.34.169.227] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1p7EvO-006HsS-GX; Mon, 19 Dec 2022 13:07:19 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v4 6/7] drm/vkms: use new debugfs device-centered functions
Date: Mon, 19 Dec 2022 09:06:20 -0300
Message-Id: <20221219120621.15086-7-mcanal@igalia.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219120621.15086-1-mcanal@igalia.com>
References: <20221219120621.15086-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Emma Anholt <emma@anholt.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wambui Karuga <wambui@karuga.org>, Melissa Wen <mwen@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the use of drm_debugfs_create_files() with the new
drm_debugfs_add_files() function, which centers the debugfs files
management on the drm_device instead of drm_minor. Moreover, remove the
debugfs_init hook and add the debugfs files directly on vkms_create(),
before drm_dev_register().

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 69346906ec81..6d3a2d57d992 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -92,8 +92,8 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
 
 static int vkms_config_show(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
 
 	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
@@ -103,24 +103,16 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	return 0;
 }
 
-static const struct drm_info_list vkms_config_debugfs_list[] = {
+static const struct drm_debugfs_info vkms_config_debugfs_list[] = {
 	{ "vkms_config", vkms_config_show, 0 },
 };
 
-static void vkms_config_debugfs_init(struct drm_minor *minor)
-{
-	drm_debugfs_create_files(vkms_config_debugfs_list, ARRAY_SIZE(vkms_config_debugfs_list),
-				 minor->debugfs_root, minor);
-}
-
 static const struct drm_driver vkms_driver = {
 	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
 	.release		= vkms_release,
 	.fops			= &vkms_driver_fops,
 	DRM_GEM_SHMEM_DRIVER_OPS,
 
-	.debugfs_init           = vkms_config_debugfs_init,
-
 	.name			= DRIVER_NAME,
 	.desc			= DRIVER_DESC,
 	.date			= DRIVER_DATE,
@@ -202,6 +194,9 @@ static int vkms_create(struct vkms_config *config)
 	if (ret)
 		goto out_devres;
 
+	drm_debugfs_add_files(&vkms_device->drm, vkms_config_debugfs_list,
+			      ARRAY_SIZE(vkms_config_debugfs_list));
+
 	ret = drm_dev_register(&vkms_device->drm, 0);
 	if (ret)
 		goto out_devres;
-- 
2.38.1

