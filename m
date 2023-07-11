Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F8174F111
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 16:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98CB410E3A7;
	Tue, 11 Jul 2023 14:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B7910E3A7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 14:04:26 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b6ff1a637bso91328331fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 07:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689084264; x=1691676264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5E6mGr7l1sCsaZiG34OLuqWu6zuEDz7WVl0t1ckurV8=;
 b=Ri6S/ucGtUd6VJKDiPBE49zckhFOOezfvY2celwDJ9XcRcmG3WSt7e3fdrDVNtIyFk
 ztoXwi35M1NhlxsliTIkiGYJ0HQIltEefOo2+JphZOhjyeRPx2uiwWFkDlglgSICEJ51
 NbJe0aCHUtyGLh+Vbbq2PmSnbQr4Pi28UEEiEZITLce+JPPXDgo3y+aAwyGHbKbnJRTb
 o8QOpkd9YsmekNYU6++YjX2srHGRNmXrzkbLj5BcDBzktZ+oBsBonMlz1h4m9Iajyz/U
 GEdHjz7iDxW9+G+pLRnm9nq6Y8WlnL29Y/u/zGGgFUcmHx7F+2h/KU8m/sY5FimcXINQ
 r/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689084264; x=1691676264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5E6mGr7l1sCsaZiG34OLuqWu6zuEDz7WVl0t1ckurV8=;
 b=PxRL4AIuT274yLRZ0tbwNjbv3GsgqgD2a6ylGU9ZnaneSnYJbIuO3aAsSqmkIApB1s
 vk7s0X2e3HlhYQX3B6uh0ukGyMXWqYGDD475MKBVofw5gsBNAeffAOP6mCGtgjIarXoL
 0OsdUMDOfYMJH/EstV5w5VNUpki/E6aUpgw4zIN0IH+z/YrYbQJev0ytImfzmwIvZTf0
 ktxfPhaPg1oy6oFZVK4yWjib8s0nrXk9NxnE5j0q7VAORcOnG8JQ8wfYz3Z0/FYSFgQO
 +HtjdEVSPeR07qzOciljK+0FE7wlUSKsuJe60+lj/jhQrFpHUgs9UxOQdS+Tg+zlWJTL
 wsmQ==
X-Gm-Message-State: ABy/qLaoSLEnfB8C5o0AxWiv/RCg5K0O8N+Mi5OUb9wHO3pNZ1UnmQKg
 cpIN595nE1uEASSrNnSsVwQ=
X-Google-Smtp-Source: APBJJlH6DoE3IfyADgkj4rIChHcovHMKP+UX2DV5xGjVZ4zLDv9zzk2rTZEjI8nOUd83t0187ZbOKw==
X-Received: by 2002:a2e:8611:0:b0:2b6:daa3:f0af with SMTP id
 a17-20020a2e8611000000b002b6daa3f0afmr14101608lji.25.1689084264115; 
 Tue, 11 Jul 2023 07:04:24 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:154b:c600:dcae:ab99:6259:7e2b])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a170906505200b00989257be620sm1199006ejk.200.2023.07.11.07.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 07:04:23 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ogabbay@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/debugfs: remove dev->debugfs_list and debugfs_mutex v2
Date: Tue, 11 Jul 2023 16:04:17 +0200
Message-Id: <20230711140418.3059-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711140418.3059-1-christian.koenig@amd.com>
References: <20230711140418.3059-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mutex was completely pointless in the first place since any
parallel adding of files to this list would result in random
behavior since the list is filled and consumed multiple times.

Completely drop that approach and just create the files directly but
return -ENODEV while opening the file when the minors are not
registered yet.

v2: rebase on debugfs directory rework, limit access before minors are
    registered.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_debugfs.c     | 27 ++-------------------------
 drivers/gpu/drm/drm_drv.c         |  3 ---
 drivers/gpu/drm/drm_internal.h    |  5 -----
 drivers/gpu/drm/drm_mode_config.c |  2 --
 include/drm/drm_device.h          | 15 ---------------
 5 files changed, 2 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 65b6e0aae96e..d723143852e3 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -265,7 +265,6 @@ int drm_debugfs_register(struct drm_minor *minor, int minor_id,
 			 struct dentry *root)
 {
 	struct drm_device *dev = minor->dev;
-	struct drm_debugfs_entry *entry, *tmp;
 	char name[64];
 
 	INIT_LIST_HEAD(&minor->debugfs_list);
@@ -280,30 +279,9 @@ int drm_debugfs_register(struct drm_minor *minor, int minor_id,
 	if (dev->driver->debugfs_init && dev->render != minor)
 		dev->driver->debugfs_init(minor);
 
-	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
-		debugfs_create_file(entry->file.name, 0444,
-				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
-		list_del(&entry->list);
-	}
-
 	return 0;
 }
 
-void drm_debugfs_late_register(struct drm_device *dev)
-{
-	struct drm_minor *minor = dev->primary;
-	struct drm_debugfs_entry *entry, *tmp;
-
-	if (!minor)
-		return;
-
-	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
-		debugfs_create_file(entry->file.name, 0444,
-				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
-		list_del(&entry->list);
-	}
-}
-
 int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
 			     struct drm_minor *minor)
 {
@@ -373,9 +351,8 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
 	entry->file.data = data;
 	entry->dev = dev;
 
-	mutex_lock(&dev->debugfs_mutex);
-	list_add(&entry->list, &dev->debugfs_list);
-	mutex_unlock(&dev->debugfs_mutex);
+	debugfs_create_file(name, 0444, dev->debugfs_root, entry,
+			    &drm_debugfs_entry_fops);
 }
 EXPORT_SYMBOL(drm_debugfs_add_file);
 
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 25cbe02550e6..521d3d75a585 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -597,7 +597,6 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
 	mutex_destroy(&dev->clientlist_mutex);
 	mutex_destroy(&dev->filelist_mutex);
 	mutex_destroy(&dev->struct_mutex);
-	mutex_destroy(&dev->debugfs_mutex);
 	drm_legacy_destroy_members(dev);
 }
 
@@ -638,14 +637,12 @@ static int drm_dev_init(struct drm_device *dev,
 	INIT_LIST_HEAD(&dev->filelist_internal);
 	INIT_LIST_HEAD(&dev->clientlist);
 	INIT_LIST_HEAD(&dev->vblank_event_list);
-	INIT_LIST_HEAD(&dev->debugfs_list);
 
 	spin_lock_init(&dev->event_lock);
 	mutex_init(&dev->struct_mutex);
 	mutex_init(&dev->filelist_mutex);
 	mutex_init(&dev->clientlist_mutex);
 	mutex_init(&dev->master_mutex);
-	mutex_init(&dev->debugfs_mutex);
 
 	ret = drmm_add_action_or_reset(dev, drm_dev_init_release, NULL);
 	if (ret)
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index bf4a4f24bd4c..5a98fd1613ee 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -185,7 +185,6 @@ void drm_debugfs_dev_register(struct drm_device *dev);
 int drm_debugfs_register(struct drm_minor *minor, int minor_id,
 			 struct dentry *root);
 void drm_debugfs_cleanup(struct drm_minor *minor);
-void drm_debugfs_late_register(struct drm_device *dev);
 void drm_debugfs_connector_add(struct drm_connector *connector);
 void drm_debugfs_connector_remove(struct drm_connector *connector);
 void drm_debugfs_crtc_add(struct drm_crtc *crtc);
@@ -210,10 +209,6 @@ static inline void drm_debugfs_cleanup(struct drm_minor *minor)
 {
 }
 
-static inline void drm_debugfs_late_register(struct drm_device *dev)
-{
-}
-
 static inline void drm_debugfs_connector_add(struct drm_connector *connector)
 {
 }
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 87eb591fe9b5..8525ef851540 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -54,8 +54,6 @@ int drm_modeset_register_all(struct drm_device *dev)
 	if (ret)
 		goto err_connector;
 
-	drm_debugfs_late_register(dev);
-
 	return 0;
 
 err_connector:
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 3cf12b14232d..c490977ee250 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -318,21 +318,6 @@ struct drm_device {
 	 */
 	struct dentry *debugfs_root;
 
-	/**
-	 * @debugfs_mutex:
-	 *
-	 * Protects &debugfs_list access.
-	 */
-	struct mutex debugfs_mutex;
-
-	/**
-	 * @debugfs_list:
-	 *
-	 * List of debugfs files to be created by the DRM device. The files
-	 * must be added during drm_dev_register().
-	 */
-	struct list_head debugfs_list;
-
 	/* Everything below here is for legacy driver, never use! */
 	/* private: */
 #if IS_ENABLED(CONFIG_DRM_LEGACY)
-- 
2.34.1

