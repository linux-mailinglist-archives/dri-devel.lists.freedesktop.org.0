Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85915650B34
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 13:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7387010E23E;
	Mon, 19 Dec 2022 12:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF1810E294
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 12:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Iz92n6UJln7DTuF5t0ffnSc+TWSEKoE8Rvy+u+5H0c4=; b=OH6UPsMYNOIDhEaiWzDI1AbREv
 ALmhAlInAJt2irax9H141erCuM/vEVh25GU7MCoXW/hgPTgQBR4q2xw5aaxzz6sb0s5CYYl6JqUJ8
 dztu4Wa08IShoZ1HEfNVCUlpahyTNhkg15s1jlOL1LDqRHvGHRTWF9SU3uQn+YlY/1B5uPok8w267
 CSGWIH7RS2HRZnIRIBqkzj/M+MNHTu8LGOPQqBqTyEARsxEAK6IAI8DSfhcjje/4EdNu/18tZo0vs
 xQjbywVYq2LBTnnsI8Ddu9BVzYP0ggJ2UHeJ88FuhL1lKdyua98UN/aFW55yXT9m85z5sPTiFYoDK
 i5mtX8TQ==;
Received: from [177.34.169.227] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1p7Ev7-006HsS-K6; Mon, 19 Dec 2022 13:07:02 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v4 3/7] drm/debugfs: create debugfs late register functions
Date: Mon, 19 Dec 2022 09:06:17 -0300
Message-Id: <20221219120621.15086-4-mcanal@igalia.com>
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

Although the device-centered debugfs functions can track requests for
the addition of DRM debugfs files at any time and have them added all
at once during drm_dev_register(), they are not able to create debugfs
files for modeset components, as they are registered after the primary
and the render drm_minor are registered.

So, create a drm_debugfs_late_register() function, which is responsible
for dealing with the creation of all the debugfs files for modeset
components at once. Therefore, the functions drm_debugfs_add_file()
and drm_debugfs_add_files() can be used in late_register hooks.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/drm_debugfs.c     | 14 ++++++++++++++
 drivers/gpu/drm/drm_internal.h    |  5 +++++
 drivers/gpu/drm/drm_mode_config.c |  2 ++
 3 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index d9d3ed7acc80..51e3772e2e2b 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -254,6 +254,20 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 	return 0;
 }
 
+void drm_debugfs_late_register(struct drm_device *dev)
+{
+	struct drm_minor *minor = dev->primary;
+	struct drm_debugfs_entry *entry, *tmp;
+
+	if (minor == NULL)
+		return;
+
+	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
+		debugfs_create_file(entry->file.name, S_IFREG | S_IRUGO,
+				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
+		list_del(&entry->list);
+	}
+}
 
 int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
 			     struct drm_minor *minor)
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 5ea5e260118c..ed2103ee272c 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -186,6 +186,7 @@ int drm_gem_dumb_destroy(struct drm_file *file, struct drm_device *dev,
 int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 		     struct dentry *root);
 void drm_debugfs_cleanup(struct drm_minor *minor);
+void drm_debugfs_late_register(struct drm_device *dev);
 void drm_debugfs_connector_add(struct drm_connector *connector);
 void drm_debugfs_connector_remove(struct drm_connector *connector);
 void drm_debugfs_crtc_add(struct drm_crtc *crtc);
@@ -202,6 +203,10 @@ static inline void drm_debugfs_cleanup(struct drm_minor *minor)
 {
 }
 
+static inline void drm_debugfs_late_register(struct drm_device *dev)
+{
+}
+
 static inline void drm_debugfs_connector_add(struct drm_connector *connector)
 {
 }
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 8525ef851540..87eb591fe9b5 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -54,6 +54,8 @@ int drm_modeset_register_all(struct drm_device *dev)
 	if (ret)
 		goto err_connector;
 
+	drm_debugfs_late_register(dev);
+
 	return 0;
 
 err_connector:
-- 
2.38.1

