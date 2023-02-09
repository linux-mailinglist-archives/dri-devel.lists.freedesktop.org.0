Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E156A690202
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 09:18:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0FF10E936;
	Thu,  9 Feb 2023 08:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4268F10E92F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 08:18:45 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id ba1so931306wrb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 00:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zEBaHco3UdEFBOFDlUksoEPN89IiXwklvut5n7PqlrM=;
 b=PEiQwBekEuZ3rc6ijTrijux3wu34YRhgR8SEhaC6O8PWgxXo8EacNeTFMmjpULQSpX
 GkmKwsZp1SaFCHRnG8NPM72LL3Z9zG9T18n7BMfxEWZxqtvoORc6Wa1kb7aEalemEkCX
 J6ky4iVarMhMeSics5eczusVbOIj9tiEAndGNhJDM/ZSHQV/Bk8+fwrQhlJsUHmvWCdC
 oFlHC/fVkDTb2fq90xiTACZHsHvXz+N0Xzs34UyMsWtRA65IUzFYD2OMdBhDX3rAqjrt
 3FbBMmH66R8SGMIov71JX3oYekAlCbHCUwoWilkIkh+nKUvBByfSVbtPStC6x8qXmj4g
 G12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zEBaHco3UdEFBOFDlUksoEPN89IiXwklvut5n7PqlrM=;
 b=hXW3aIu7WyE/w70ROzjiuggTkB7tYElxcslUyfitITYY55fegm+ttgZdw5UBYasRab
 wJh3Vst28K4xy9egGwHWUP3FPBYqa0phwDMV8MEnsGkjllaRVpPEpNzzsZPz2SHjPicK
 WEAzdPJg25qszXRlQhaEWrNxQdeNR1t+6M4pEFLC+pfoPaG1Sjhiw7ksvdSiMyX0d46H
 ABQFRYt1AxErqtljaESUjxW1upUklu8zrXLiurVqvHfoalwKhdjlOL93fG3/mewU/TKN
 Zv6DtRk/XpkZ+8ZNnNwJNLzDqubHxNzDjrG4Y11t7Qwkacw9ja+nem1BXrf2C+KSA6A5
 BqPw==
X-Gm-Message-State: AO0yUKVklsciJX4Uxt8QVVZXISXVcJq1gjTwAf4tTNFpWR+o8pQIQi/o
 +oLvEy4srnpZ6p0oGz42/BY=
X-Google-Smtp-Source: AK7set8QKTMyL1BvVrVMsqUGVx7B5zZUh0Sjgv+ZI7mfOgyVCzGV2H92R92DWfiXadq4aDSiELOs5g==
X-Received: by 2002:a5d:58c3:0:b0:2c4:1ea:4b94 with SMTP id
 o3-20020a5d58c3000000b002c401ea4b94mr5151705wrf.69.1675930723630; 
 Thu, 09 Feb 2023 00:18:43 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 n10-20020adffe0a000000b002c3ec35f360sm602056wrr.56.2023.02.09.00.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 00:18:43 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch, wambui.karugax@gmail.com, mcanal@igalia.com,
 maxime@cerno.tech, mwen@igalia.com, mairacanal@riseup.net
Subject: [PATCH 2/3] drm/debugfs: split registration into dev and minor
Date: Thu,  9 Feb 2023 09:18:37 +0100
Message-Id: <20230209081838.45273-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209081838.45273-1-christian.koenig@amd.com>
References: <20230209081838.45273-1-christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The different subsystems should probably only register their debugfs
files once.

This temporary removes the common files from the render node directory.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_atomic.c        |  4 ++--
 drivers/gpu/drm/drm_client.c        |  4 ++--
 drivers/gpu/drm/drm_crtc_internal.h |  2 +-
 drivers/gpu/drm/drm_debugfs.c       | 24 ++++++++++++------------
 drivers/gpu/drm/drm_drv.c           |  4 +++-
 drivers/gpu/drm/drm_framebuffer.c   |  4 ++--
 drivers/gpu/drm/drm_internal.h      |  5 +++--
 include/drm/drm_client.h            |  2 +-
 8 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 5457c02ca1ab..ae6ec1dd162a 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1770,9 +1770,9 @@ static const struct drm_debugfs_info drm_atomic_debugfs_list[] = {
 	{"state", drm_state_info, 0},
 };
 
-void drm_atomic_debugfs_init(struct drm_minor *minor)
+void drm_atomic_debugfs_init(struct drm_device *dev)
 {
-	drm_debugfs_add_files(minor->dev, drm_atomic_debugfs_list,
+	drm_debugfs_add_files(dev, drm_atomic_debugfs_list,
 			      ARRAY_SIZE(drm_atomic_debugfs_list));
 }
 #endif
diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 009e7b10455c..847acf0ef570 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -507,9 +507,9 @@ static const struct drm_debugfs_info drm_client_debugfs_list[] = {
 	{ "internal_clients", drm_client_debugfs_internal_clients, 0 },
 };
 
-void drm_client_debugfs_init(struct drm_minor *minor)
+void drm_client_debugfs_init(struct drm_device *dev)
 {
-	drm_debugfs_add_files(minor->dev, drm_client_debugfs_list,
+	drm_debugfs_add_files(dev, drm_client_debugfs_list,
 			      ARRAY_SIZE(drm_client_debugfs_list));
 }
 #endif
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 501a10edd0e1..8556c3b3ff88 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -232,7 +232,7 @@ int drm_mode_dirtyfb_ioctl(struct drm_device *dev,
 /* drm_atomic.c */
 #ifdef CONFIG_DEBUG_FS
 struct drm_minor;
-void drm_atomic_debugfs_init(struct drm_minor *minor);
+void drm_atomic_debugfs_init(struct drm_device *dev);
 #endif
 
 int __drm_atomic_helper_disable_plane(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 2724cac03509..558e3a7271a5 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -231,22 +231,22 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 	return 0;
 }
 
-void drm_debugfs_register(struct drm_minor *minor)
+void drm_debugfs_dev_register(struct drm_device *dev)
 {
-	struct drm_device *dev = minor->dev;
-	struct drm_debugfs_entry *entry, *tmp;
-
-	drm_debugfs_add_files(minor->dev, drm_debugfs_list, DRM_DEBUGFS_ENTRIES);
-
-	if (drm_drv_uses_atomic_modeset(dev)) {
-		drm_atomic_debugfs_init(minor);
-	}
+	drm_debugfs_add_files(dev, drm_debugfs_list, DRM_DEBUGFS_ENTRIES);
 
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
-		drm_framebuffer_debugfs_init(minor);
-
-		drm_client_debugfs_init(minor);
+		drm_framebuffer_debugfs_init(dev);
+		drm_client_debugfs_init(dev);
 	}
+	if (drm_drv_uses_atomic_modeset(dev))
+		drm_atomic_debugfs_init(dev);
+}
+
+void drm_debugfs_minor_register(struct drm_minor *minor)
+{
+	struct drm_device *dev = minor->dev;
+	struct drm_debugfs_entry *entry, *tmp;
 
 	if (dev->driver->debugfs_init)
 		dev->driver->debugfs_init(minor);
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 88ce22c04672..2cbe028e548c 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -179,7 +179,7 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
 	if (minor->type == DRM_MINOR_ACCEL)
 		accel_debugfs_init(minor, minor->index);
 	else
-		drm_debugfs_register(minor);
+		drm_debugfs_minor_register(minor);
 
 	ret = device_add(minor->kdev);
 	if (ret)
@@ -913,6 +913,8 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 	if (drm_dev_needs_global_mutex(dev))
 		mutex_lock(&drm_global_mutex);
 
+	drm_debugfs_dev_register(dev);
+
 	ret = drm_minor_register(dev, DRM_MINOR_RENDER);
 	if (ret)
 		goto err_minors;
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index aff3746dedfb..ba51deb6d042 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -1222,9 +1222,9 @@ static const struct drm_debugfs_info drm_framebuffer_debugfs_list[] = {
 	{ "framebuffer", drm_framebuffer_info, 0 },
 };
 
-void drm_framebuffer_debugfs_init(struct drm_minor *minor)
+void drm_framebuffer_debugfs_init(struct drm_device *dev)
 {
-	drm_debugfs_add_files(minor->dev, drm_framebuffer_debugfs_list,
+	drm_debugfs_add_files(dev, drm_framebuffer_debugfs_list,
 			      ARRAY_SIZE(drm_framebuffer_debugfs_list));
 }
 #endif
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 332fb65a935a..5ff7bf88f162 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -185,7 +185,8 @@ int drm_gem_dumb_destroy(struct drm_file *file, struct drm_device *dev,
 #if defined(CONFIG_DEBUG_FS)
 int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 		     struct dentry *root);
-void drm_debugfs_register(struct drm_minor *minor);
+void drm_debugfs_dev_register(struct drm_device *dev);
+void drm_debugfs_minor_register(struct drm_minor *minor);
 void drm_debugfs_cleanup(struct drm_minor *minor);
 void drm_debugfs_late_register(struct drm_device *dev);
 void drm_debugfs_connector_add(struct drm_connector *connector);
@@ -261,4 +262,4 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 /* drm_framebuffer.c */
 void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
 				const struct drm_framebuffer *fb);
-void drm_framebuffer_debugfs_init(struct drm_minor *minor);
+void drm_framebuffer_debugfs_init(struct drm_device *dev);
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index 39482527a775..507d132cf494 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -200,6 +200,6 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode);
 	drm_for_each_connector_iter(connector, iter) \
 		if (connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
 
-void drm_client_debugfs_init(struct drm_minor *minor);
+void drm_client_debugfs_init(struct drm_device *dev);
 
 #endif
-- 
2.34.1

