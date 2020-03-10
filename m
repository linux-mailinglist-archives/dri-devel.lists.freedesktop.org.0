Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28010180C81
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCD56E90D;
	Tue, 10 Mar 2020 23:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B7D6E2E2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 13:32:09 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p2so15089307wrw.7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 06:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AwwrCpJJN77zM77SbkDGUuHYvYg7rqeDy4N6zR+WgEI=;
 b=jk0A5/IebVZglpAYFFlUy843DnPN1be3LQ6z/aHJvyhSRIdqMMwJnf5E3/7SYiHdTd
 uzMP0wtkDa7HGgmsFBcvV82GlGEUTlwLFReY0u9Wb34T8kSt7YHhy8DUgGMhdooJqOMH
 wRP6r2wLDgfz7C2Ed5WsVfQxP7f2DRKv1+L0CxC51WPsWgmdXt2/WMSPqd4taJ8wKHpf
 4pf+c8y8I1Md1HeILP5JoQaiN5c6Ztl+zeAyzy19KofAFj2NNdH9Gld6kFoFx38+CmXR
 ptDZRiMMw4ALCWvhiDWWMKR3MwLY8ORmhUDzNsS8RPnrduAYcOJ84mYZOF1AgX/Y6+pk
 VhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AwwrCpJJN77zM77SbkDGUuHYvYg7rqeDy4N6zR+WgEI=;
 b=qt0CCj5JbXT1aAK58dfK8+uQv1EQ65H/1hhERHtt1/ua6CllP8YxE3YK4UCD49f08j
 t91bz7NxQ5XOq3637q4ckcSA71Y5MN/eshKUOueG5Tum76vhzmiZAxnPi1bvfEYqdN8v
 01QEXfXdhg2aDVX5FfDaWs11kwYOmbdqHmMDcB0cHIm5kbLpOBV7uj7CitM4bf42vboY
 IfEgiUUYTNWOUihNlO9D9DoXJF0EEcAp7CCwY+K0OGQKv8sj+NcYndz6nMdU6/NsEQ1t
 qVExm6Fd42RyCP40DtLs3Au5rDPIMzCuP+Xs//pmEbNrVcVjxNxa2qKfNqjq5XbtCvEy
 v+LA==
X-Gm-Message-State: ANhLgQ3uk/7NzyQ+7NpQt5JvPz8W+7QTArAZElImVBPlt3NIIz2HHWs7
 YS55Q8PkFMSbt3nXf0c/U1A=
X-Google-Smtp-Source: ADFU+vt0XerfApImofidQNBRU6BqvoH/lgoUFVpyyUBZe1G5BorEVx5BYo26sH6tSLijvh/MdZEeGA==
X-Received: by 2002:adf:e74e:: with SMTP id c14mr28703351wrn.128.1583847127901; 
 Tue, 10 Mar 2020 06:32:07 -0700 (PDT)
Received: from localhost.localdomain ([197.248.222.210])
 by smtp.googlemail.com with ESMTPSA id o7sm14047141wrx.60.2020.03.10.06.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 06:32:07 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 16/17] drm/debugfs: remove checks for return value of
 drm_debugfs functions.
Date: Tue, 10 Mar 2020 16:31:20 +0300
Message-Id: <20200310133121.27913-17-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310133121.27913-1-wambui.karugax@gmail.com>
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Mar 2020 23:36:13 +0000
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since 987d65d01356 (drm: debugfs: make drm_debugfs_create_files() never
fail), there is no need to check the return value of
drm_debugfs_create_files(). Therefore, remove remove unnecessary checks
and error handling statement blocks for its return value.

These changes also enable changing drm_debugfs_create_files() to return
void.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/drm_debugfs.c | 33 +++++++--------------------------
 include/drm/drm_debugfs.h     | 16 +++++++---------
 2 files changed, 14 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 4e673d318503..e13f21642f88 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -172,8 +172,8 @@ static const struct file_operations drm_debugfs_fops = {
  * &struct drm_info_list in the given root directory. These files will be removed
  * automatically on drm_debugfs_cleanup().
  */
-int drm_debugfs_create_files(const struct drm_info_list *files, int count,
-			     struct dentry *root, struct drm_minor *minor)
+void drm_debugfs_create_files(const struct drm_info_list *files, int count,
+			      struct dentry *root, struct drm_minor *minor)
 {
 	struct drm_device *dev = minor->dev;
 	struct drm_info_node *tmp;
@@ -199,7 +199,6 @@ int drm_debugfs_create_files(const struct drm_info_list *files, int count,
 		list_add(&tmp->list, &minor->debugfs_list);
 		mutex_unlock(&minor->debugfs_lock);
 	}
-	return 0;
 }
 EXPORT_SYMBOL(drm_debugfs_create_files);
 
@@ -215,35 +214,17 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 	sprintf(name, "%d", minor_id);
 	minor->debugfs_root = debugfs_create_dir(name, root);
 
-	ret = drm_debugfs_create_files(drm_debugfs_list, DRM_DEBUGFS_ENTRIES,
-				       minor->debugfs_root, minor);
-	if (ret) {
-		debugfs_remove(minor->debugfs_root);
-		minor->debugfs_root = NULL;
-		DRM_ERROR("Failed to create core drm debugfs files\n");
-		return ret;
-	}
+	drm_debugfs_create_files(drm_debugfs_list, DRM_DEBUGFS_ENTRIES,
+				 minor->debugfs_root, minor);
 
 	if (drm_drv_uses_atomic_modeset(dev)) {
-		ret = drm_atomic_debugfs_init(minor);
-		if (ret) {
-			DRM_ERROR("Failed to create atomic debugfs files\n");
-			return ret;
-		}
+		drm_atomic_debugfs_init(minor);
 	}
 
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
-		ret = drm_framebuffer_debugfs_init(minor);
-		if (ret) {
-			DRM_ERROR("Failed to create framebuffer debugfs file\n");
-			return ret;
-		}
+		drm_framebuffer_debugfs_init(minor);
 
-		ret = drm_client_debugfs_init(minor);
-		if (ret) {
-			DRM_ERROR("Failed to create client debugfs file\n");
-			return ret;
-		}
+		drm_client_debugfs_init(minor);
 	}
 
 	if (dev->driver->debugfs_init) {
diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
index 7501e323d383..2188dc83957f 100644
--- a/include/drm/drm_debugfs.h
+++ b/include/drm/drm_debugfs.h
@@ -80,18 +80,16 @@ struct drm_info_node {
 };
 
 #if defined(CONFIG_DEBUG_FS)
-int drm_debugfs_create_files(const struct drm_info_list *files,
-			     int count, struct dentry *root,
-			     struct drm_minor *minor);
+void drm_debugfs_create_files(const struct drm_info_list *files,
+			      int count, struct dentry *root,
+			      struct drm_minor *minor);
 int drm_debugfs_remove_files(const struct drm_info_list *files,
 			     int count, struct drm_minor *minor);
 #else
-static inline int drm_debugfs_create_files(const struct drm_info_list *files,
-					   int count, struct dentry *root,
-					   struct drm_minor *minor)
-{
-	return 0;
-}
+static inline void drm_debugfs_create_files(const struct drm_info_list *files,
+					    int count, struct dentry *root,
+					    struct drm_minor *minor)
+{}
 
 static inline int drm_debugfs_remove_files(const struct drm_info_list *files,
 					   int count, struct drm_minor *minor)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
