Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 987A36BC8E2
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 09:21:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B8B10EC77;
	Thu, 16 Mar 2023 08:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D535710EC6B;
 Thu, 16 Mar 2023 08:20:45 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id x13so4365768edd.1;
 Thu, 16 Mar 2023 01:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678954844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=M+/1s+LZn/IcuVL7ADO30Ofjdh3IStsD+7GUn5XCo7Q=;
 b=cFQ1UDB0UJ6yUPLuYG9V66T3TusWqWwwhq8lERpIjtVjR+DLLBXx5SH5cl61ixqBcx
 BksVi8amixHU8Dn+G4tzdBwnJXqYfsPT4vPymwo9jXxPyefCTlVQrIEVdof6+2nPBAL+
 YfKoMhc+mJBZyCPupImgyDgGOaRCN159jEXskVTnsPSQmAz+z1AVEbYNj11U+P1DMqdk
 QFvBFFlNMM6SKVSBG1PL3QgfUEYgLCFUesm5DpFUlswt69WlwbKzppJjF9vrF4RJZWHM
 PmWBztKnYceFGHzp0dAlh+y9n+ahAez51ZrO50QalvG0fGZ62GVOPjsrYTEy08D5/z7D
 ysBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678954844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M+/1s+LZn/IcuVL7ADO30Ofjdh3IStsD+7GUn5XCo7Q=;
 b=XDB9Y8Dc3yXidMmGDcZ/kVXXkRM7i/MP4KHRt2nbv3n+YwftVF6hwVJNiU5JEwikv8
 NtriYIHu1IZiD7MSiIMXWJf02ZIty/8JgKpNaCpJETcUooXLD3XIgkUwfWJ0MPVbqT0n
 d4fczgxb20LUd5zBuGwtUIRw0YMXXwBSbPnfS+VlWnsjWwWeQ/O+qWLu3jf5y8G+9rsO
 ph1c5Sg2WEn7hr3hsuqLBMpR9iFXmyR3AxjGO5DgavFyopoXehjoQ1ORTL5jUZRes3xf
 9VDQm//C8FTmO4tK0OlkLdpjGBMFfTK7YzoMiaJAtgFeVoRC5IUq7G0A13puQPz7ARmx
 u7MQ==
X-Gm-Message-State: AO0yUKU/RMYDyZdm7SzRT4uorKbfo7KdP7W9gw8bU1PgNL6QKOAIpat8
 SsvjWyYrE3oAPp9AEqRDaMs=
X-Google-Smtp-Source: AK7set9VzZT1auovaexi8rEYxoWvqge6BfhAsvf8n0WpxoBqIlkH4TCCcp2G5FBWuJcPkUNMmLu5bQ==
X-Received: by 2002:a17:906:fa15:b0:92b:a3fe:53ca with SMTP id
 lo21-20020a170906fa1500b0092ba3fe53camr9062127ejb.30.1678954844214; 
 Thu, 16 Mar 2023 01:20:44 -0700 (PDT)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 ja19-20020a170907989300b008cf8c6f5c43sm3519895ejc.83.2023.03.16.01.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 01:20:43 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: mcanal@igalia.com, stanislaw.gruszka@linux.intel.com, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 mwen@igalia.com, maxime@cerno.tech, wambui.karugax@gmail.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/7] drm/debugfs: remove dev->debugfs_list and debugfs_mutex v2
Date: Thu, 16 Mar 2023 09:20:33 +0100
Message-Id: <20230316082035.567520-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230316082035.567520-1-christian.koenig@amd.com>
References: <20230316082035.567520-1-christian.koenig@amd.com>
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
index 88ea6a54f5b0..253828133c8c 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -245,7 +245,6 @@ int drm_debugfs_register(struct drm_minor *minor, int minor_id,
 			 struct dentry *root)
 {
 	struct drm_device *dev = minor->dev;
-	struct drm_debugfs_entry *entry, *tmp;
 	char name[64];
 
 	INIT_LIST_HEAD(&minor->debugfs_list);
@@ -260,30 +259,9 @@ int drm_debugfs_register(struct drm_minor *minor, int minor_id,
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
@@ -353,9 +331,8 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
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
index 05b831f9fe71..f928b4490ece 100644
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
index 608b9c581726..c7f967c0f152 100644
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
@@ -206,10 +205,6 @@ static inline void drm_debugfs_cleanup(struct drm_minor *minor)
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

