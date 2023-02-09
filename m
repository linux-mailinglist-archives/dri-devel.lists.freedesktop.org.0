Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 081F8690206
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 09:18:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A55B10E944;
	Thu,  9 Feb 2023 08:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E68D10E936
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 08:18:46 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h16so898896wrz.12
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 00:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NOtI2HKpzbpdAoapug+id9Mkg3MTgOUSvAB/EfkYBu0=;
 b=fMmptcW869FvfzMe6N0eDnUbrd0+XS6pttxsYOqiUKxq3jFWH3Wn3n0fFE2Fma18dY
 fOCUppFoxUrBxhL1nGt24pv2YAFOkCrPhw+2+VNHICQ5aahSCD3WavBBqG6XbfeqB+cF
 Upcn0g+uqCEzbRkUkpYczaUdIp8/iYsBJDxtEmrSiEHS+IwT1gKGDAejmpdcnKz8xmip
 JwEEB84IVQ59a0olStZ1wkSdYtnCZ+temym2JD1xN6Dur1v5C3GsgWNLAWaGehutWzLk
 IAbG2D+h6tZrGVovzW/RimQTet6z8UjX8x7IPmSF7Mhf9Cx8l/KaLAHz57SZ0HxaBzjJ
 KuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NOtI2HKpzbpdAoapug+id9Mkg3MTgOUSvAB/EfkYBu0=;
 b=MehZXj74DE0B1p1diQUkF0IwuSggoR8Vzq2hxQovtCp7PBgRNvN1KsC2/PbKBHslOL
 CevS/aJd68qJfrnRwxalyJyLeGDlnpl0QpRzxYt6LUzNnnpHZKcxeMlvmFFkZng/vOMP
 5DJ+PXl9wAGMVE14jLYNr2LKHQyjkJkY2YlmyrEAnoUPGoc9CkORnNr56KNoXaBl95AV
 cNHIIuAAO4unlQ01WuBTLG++aRQlKUP45OGUp2313L3z9roxEW/rk9Y8oQspWfRb9SZa
 p2rF+Cvflvzf8ykmGKEj3HHpZoSdGuM8hkwS4Ncrit1M3ADizeWeungnAAIfAln+j8MT
 sQmQ==
X-Gm-Message-State: AO0yUKUqi5iJQZwD0MkQfOctX8IRaMXe0iiZU0vz67fi6oE7oS33GK4n
 Yk+8PjTgg159gzN24CFVpyw=
X-Google-Smtp-Source: AK7set9i/bATXxvmvfUGHD9M3iFxXBF7JER/x76vBMqIpFwBb8k/dGBo7Fb/uX2YZb0fnERgvpHv4A==
X-Received: by 2002:adf:f212:0:b0:2c3:f250:f217 with SMTP id
 p18-20020adff212000000b002c3f250f217mr10365657wro.1.1675930724846; 
 Thu, 09 Feb 2023 00:18:44 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 n10-20020adffe0a000000b002c3ec35f360sm602056wrr.56.2023.02.09.00.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 00:18:44 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch, wambui.karugax@gmail.com, mcanal@igalia.com,
 maxime@cerno.tech, mwen@igalia.com, mairacanal@riseup.net
Subject: [PATCH 3/3] drm/debugfs: remove dev->debugfs_list and debugfs_mutex
Date: Thu,  9 Feb 2023 09:18:38 +0100
Message-Id: <20230209081838.45273-4-christian.koenig@amd.com>
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

The mutex was completely pointless in the first place since any
parallel adding of files to this list would result in random
behavior since the list is filled and consumed multiple times.

Completely drop that approach and just create the files directly.

This also re-adds the debugfs files to the render node directory and
removes drm_debugfs_late_register().

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_debugfs.c     | 32 +++++++------------------------
 drivers/gpu/drm/drm_drv.c         |  3 ---
 drivers/gpu/drm/drm_internal.h    |  5 -----
 drivers/gpu/drm/drm_mode_config.c |  2 --
 include/drm/drm_device.h          | 15 ---------------
 5 files changed, 7 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 558e3a7271a5..a40288e67264 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -246,31 +246,9 @@ void drm_debugfs_dev_register(struct drm_device *dev)
 void drm_debugfs_minor_register(struct drm_minor *minor)
 {
 	struct drm_device *dev = minor->dev;
-	struct drm_debugfs_entry *entry, *tmp;
 
 	if (dev->driver->debugfs_init)
 		dev->driver->debugfs_init(minor);
-
-	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
-		debugfs_create_file(entry->file.name, 0444,
-				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
-		list_del(&entry->list);
-	}
-}
-
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
 }
 
 int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
@@ -343,9 +321,13 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
 	entry->file.data = data;
 	entry->dev = dev;
 
-	mutex_lock(&dev->debugfs_mutex);
-	list_add(&entry->list, &dev->debugfs_list);
-	mutex_unlock(&dev->debugfs_mutex);
+	debugfs_create_file(name, 0444, dev->primary->debugfs_root, entry,
+			    &drm_debugfs_entry_fops);
+
+	/* TODO: This should probably only be a symlink */
+	if (dev->render)
+		debugfs_create_file(name, 0444, dev->render->debugfs_root,
+				    entry, &drm_debugfs_entry_fops);
 }
 EXPORT_SYMBOL(drm_debugfs_add_file);
 
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 2cbe028e548c..e7b88b65866c 100644
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
index 5ff7bf88f162..e215d00ba65c 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -188,7 +188,6 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 void drm_debugfs_dev_register(struct drm_device *dev);
 void drm_debugfs_minor_register(struct drm_minor *minor);
 void drm_debugfs_cleanup(struct drm_minor *minor);
-void drm_debugfs_late_register(struct drm_device *dev);
 void drm_debugfs_connector_add(struct drm_connector *connector);
 void drm_debugfs_connector_remove(struct drm_connector *connector);
 void drm_debugfs_crtc_add(struct drm_crtc *crtc);
@@ -205,10 +204,6 @@ static inline void drm_debugfs_cleanup(struct drm_minor *minor)
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
index 7cf4afae2e79..900ad7478dd8 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -311,21 +311,6 @@ struct drm_device {
 	 */
 	struct drm_fb_helper *fb_helper;
 
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

