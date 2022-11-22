Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C152D634447
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 20:05:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0039810E451;
	Tue, 22 Nov 2022 19:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C45A10E44B
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 19:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EmO+2txS2Rw2EGmvyQ6jdYDwA9k7pvkoNCsuuvmDJUY=; b=R9uWeJGj5YusbBL8SwVTfZtiBf
 npfPEoKZunMPychmq/ToR6zWHneq31k26Db7iA/aYbiHOQRodtRl54GudT5/apEKGUcXCzJHHD2EV
 J+BwOcUkGVZtBDj8mS5EE43mi/AVgkeWVee8S3ohpW0bfWToYHZ2caVKcpGClJ9WoLwE4Qu4UxVVh
 YyFkXMoo+OWOCZi4+UIFykNCYPD6V+eV7ChpocjVsBBsSh98SE0o/mlA6XStX/iAjcBftVeYNuYQV
 ixYLZW0vItlbZbj9Jgd3dnrMQIM85VMbGwpVUxI+dlLDT9A3kVk26wuc6JEIyw8WbZYq70YOU5MI4
 7cCCjI1w==;
Received: from [177.34.169.227] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oxYZs-007AP3-PJ; Tue, 22 Nov 2022 20:05:05 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>
Subject: [PATCH 5/6] drm/vkms: use new debugfs device-centered functions
Date: Tue, 22 Nov 2022 16:03:13 -0300
Message-Id: <20221122190314.185015-6-mcanal@igalia.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122190314.185015-1-mcanal@igalia.com>
References: <20221122190314.185015-1-mcanal@igalia.com>
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
management on the drm_device instead of drm_minor.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 293dbca50c31..15e7e270fba2 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -91,8 +91,8 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
 
 static int vkms_config_show(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
 
 	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
@@ -102,14 +102,14 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	return 0;
 }
 
-static const struct drm_info_list vkms_config_debugfs_list[] = {
+static const struct drm_debugfs_info vkms_config_debugfs_list[] = {
 	{ "vkms_config", vkms_config_show, 0 },
 };
 
 static void vkms_config_debugfs_init(struct drm_minor *minor)
 {
-	drm_debugfs_create_files(vkms_config_debugfs_list, ARRAY_SIZE(vkms_config_debugfs_list),
-				 minor->debugfs_root, minor);
+	drm_debugfs_add_files(minor->dev, vkms_config_debugfs_list,
+			      ARRAY_SIZE(vkms_config_debugfs_list));
 }
 
 static const struct drm_driver vkms_driver = {
-- 
2.38.1

