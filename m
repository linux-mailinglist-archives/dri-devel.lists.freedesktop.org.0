Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2961D74F112
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 16:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1EB10E3A8;
	Tue, 11 Jul 2023 14:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780DB10E3A7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 14:04:26 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-991fe70f21bso725348366b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 07:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689084265; x=1691676265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=scOcy9OReMpJccTOKJ2glwxe6PYB1nNXFBKEXXhaSzo=;
 b=YJtuKeMpoOJPv7PszSP1i5/eFuQ0rEvTonlJf49mS3qkfvc/LioL6r/qAPqqcbmemz
 nuQQ9+YNtnjXFeAZa3MGFcAm37MnffSgtcEdieVa4rS0yy3GNYGHnnf8dwk6capJGDhP
 j0q/stHwn4WkLD6jtVjg2j8gMzHRc5H7Pmie6utenDS07T1P7NuYEwYKG3dwc8v7i4/6
 FlWwai1axETkccqxBywbUAe2jjRf6fS14ynNqaSrnVS8IE3uJXbdvqsBjmJfGVlTe7kx
 q183upBGmbDk5VTFunrlLKD8GYsVg+4dmjT3Ql+dMtSnZ4RBuGe8Cq5r4k6y22d5+d/M
 iv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689084265; x=1691676265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=scOcy9OReMpJccTOKJ2glwxe6PYB1nNXFBKEXXhaSzo=;
 b=a0q9IMjpNu14B8/AzOpqWEQ61p7rpGqTyLjFS4WgA1cVKPZcRbutdHN0huDDTmnZJj
 BhIeVOOa+QGUi7LCax9+uBwrJhrtsr4YbV0AH6k3f5zcyYOtPpYhkK2xBbkIV3ORaBjl
 jzZWyyW1H9AItUSEHKug5/SF0nwSoPnCzu5SSpQFdiacsCp27VT4x8+2edBZotLs6tJK
 k712yIJQbt++a/LEEfNGs17tIAmc+ZIKsCfcyLDCdD/JnHWaGoTm/9DuhUq5CAgjTLSc
 62CDO+ktMF8OzAukI36QbapNuFjNisozKyarF/5PG2r3r7lyFNp40UAdotcpc+fp6DzJ
 GgvA==
X-Gm-Message-State: ABy/qLYwA23aMVSm06y9kkIxUUXkFeRIgZfIzkhYyx7Yh7BAz6fuidcM
 tiPuF8Bf+RRTKcct5gFPqeI=
X-Google-Smtp-Source: APBJJlHq+F8MgYRHAeIx0gwMGjyCYuMzfw9sFHN/pdM2i0YceBr/im7HAsZTSAbZ1PpxQaeVTvEE2w==
X-Received: by 2002:a17:906:74cb:b0:993:d955:1280 with SMTP id
 z11-20020a17090674cb00b00993d9551280mr14585366ejl.12.1689084264771; 
 Tue, 11 Jul 2023 07:04:24 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:154b:c600:dcae:ab99:6259:7e2b])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a170906505200b00989257be620sm1199006ejk.200.2023.07.11.07.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 07:04:24 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ogabbay@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/debugfs: rework drm_debugfs_create_files
 implementation
Date: Tue, 11 Jul 2023 16:04:18 +0200
Message-Id: <20230711140418.3059-6-christian.koenig@amd.com>
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

Use managed memory allocation for this. That allows us to not keep
track of all the files any more.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/accel/drm_accel.c      |  2 -
 drivers/gpu/drm/drm_debugfs.c  | 75 +++++++++-------------------------
 drivers/gpu/drm/drm_drv.c      |  2 -
 drivers/gpu/drm/drm_internal.h |  5 ---
 drivers/gpu/drm/tegra/dc.c     |  9 +++-
 drivers/gpu/drm/tegra/dsi.c    |  1 +
 drivers/gpu/drm/tegra/hdmi.c   |  3 +-
 drivers/gpu/drm/tegra/sor.c    |  1 +
 include/drm/drm_debugfs.h      |  4 +-
 include/drm/drm_file.h         |  4 --
 10 files changed, 34 insertions(+), 72 deletions(-)

diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
index 82c5fcbbc164..02ccf6520d27 100644
--- a/drivers/accel/drm_accel.c
+++ b/drivers/accel/drm_accel.c
@@ -100,8 +100,6 @@ void accel_debugfs_register(struct drm_device *dev)
 {
 	struct drm_minor *minor = dev->accel;
 
-	INIT_LIST_HEAD(&minor->debugfs_list);
-	mutex_init(&minor->debugfs_lock);
 	minor->debugfs_root = dev->debugfs_root;
 
 	drm_debugfs_create_files(accel_debugfs_list, ACCEL_DEBUGFS_ENTRIES,
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index d723143852e3..7aea06cb6be9 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -208,7 +208,7 @@ void drm_debugfs_create_files(const struct drm_info_list *files, int count,
 		if (features && !drm_core_check_all_features(dev, features))
 			continue;
 
-		tmp = kmalloc(sizeof(struct drm_info_node), GFP_KERNEL);
+		tmp = drmm_kzalloc(dev, sizeof(*tmp), GFP_KERNEL);
 		if (tmp == NULL)
 			continue;
 
@@ -217,14 +217,28 @@ void drm_debugfs_create_files(const struct drm_info_list *files, int count,
 						0444, root, tmp,
 						&drm_debugfs_fops);
 		tmp->info_ent = &files[i];
-
-		mutex_lock(&minor->debugfs_lock);
-		list_add(&tmp->list, &minor->debugfs_list);
-		mutex_unlock(&minor->debugfs_lock);
 	}
 }
 EXPORT_SYMBOL(drm_debugfs_create_files);
 
+int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
+			     struct dentry *root, struct drm_minor *minor)
+{
+	int i;
+
+	for (i = 0; i < count; i++) {
+		struct dentry *dent = debugfs_lookup(files[i].name, root);
+
+		if (!dent)
+			continue;
+
+		drmm_kfree(minor->dev, d_inode(dent)->i_private);
+		debugfs_remove(dent);
+	}
+	return 0;
+}
+EXPORT_SYMBOL(drm_debugfs_remove_files);
+
 /**
  * drm_debugfs_dev_init - create debugfs directory for the device
  * @dev: the device which we want to create the directory for
@@ -267,11 +281,8 @@ int drm_debugfs_register(struct drm_minor *minor, int minor_id,
 	struct drm_device *dev = minor->dev;
 	char name[64];
 
-	INIT_LIST_HEAD(&minor->debugfs_list);
-	mutex_init(&minor->debugfs_lock);
 	sprintf(name, "%d", minor_id);
-	minor->debugfs_symlink = debugfs_create_symlink(name, root,
-							dev->unique);
+	debugfs_create_symlink(name, root, dev->unique);
 
 	/* TODO: Only for compatibility with drivers */
 	minor->debugfs_root = dev->debugfs_root;
@@ -282,52 +293,6 @@ int drm_debugfs_register(struct drm_minor *minor, int minor_id,
 	return 0;
 }
 
-int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
-			     struct drm_minor *minor)
-{
-	struct list_head *pos, *q;
-	struct drm_info_node *tmp;
-	int i;
-
-	mutex_lock(&minor->debugfs_lock);
-	for (i = 0; i < count; i++) {
-		list_for_each_safe(pos, q, &minor->debugfs_list) {
-			tmp = list_entry(pos, struct drm_info_node, list);
-			if (tmp->info_ent == &files[i]) {
-				debugfs_remove(tmp->dent);
-				list_del(pos);
-				kfree(tmp);
-			}
-		}
-	}
-	mutex_unlock(&minor->debugfs_lock);
-	return 0;
-}
-EXPORT_SYMBOL(drm_debugfs_remove_files);
-
-static void drm_debugfs_remove_all_files(struct drm_minor *minor)
-{
-	struct drm_info_node *node, *tmp;
-
-	mutex_lock(&minor->debugfs_lock);
-	list_for_each_entry_safe(node, tmp, &minor->debugfs_list, list) {
-		debugfs_remove(node->dent);
-		list_del(&node->list);
-		kfree(node);
-	}
-	mutex_unlock(&minor->debugfs_lock);
-}
-
-void drm_debugfs_cleanup(struct drm_minor *minor)
-{
-	if (!minor->debugfs_symlink)
-		return;
-
-	drm_debugfs_remove_all_files(minor);
-	debugfs_remove(minor->debugfs_symlink);
-	minor->debugfs_symlink = NULL;
-}
-
 /**
  * drm_debugfs_add_file - Add a given file to the DRM device debugfs file list
  * @dev: drm device for the ioctl
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 521d3d75a585..3d5eaea12922 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -198,7 +198,6 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
 	return 0;
 
 err_debugfs:
-	drm_debugfs_cleanup(minor);
 	return ret;
 }
 
@@ -222,7 +221,6 @@ static void drm_minor_unregister(struct drm_device *dev, unsigned int type)
 
 	device_del(minor->kdev);
 	dev_set_drvdata(minor->kdev, NULL); /* safety belt */
-	drm_debugfs_cleanup(minor);
 }
 
 /*
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 5a98fd1613ee..a8f20fd58b50 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -184,7 +184,6 @@ void drm_debugfs_dev_fini(struct drm_device *dev);
 void drm_debugfs_dev_register(struct drm_device *dev);
 int drm_debugfs_register(struct drm_minor *minor, int minor_id,
 			 struct dentry *root);
-void drm_debugfs_cleanup(struct drm_minor *minor);
 void drm_debugfs_connector_add(struct drm_connector *connector);
 void drm_debugfs_connector_remove(struct drm_connector *connector);
 void drm_debugfs_crtc_add(struct drm_crtc *crtc);
@@ -205,10 +204,6 @@ static inline int drm_debugfs_register(struct drm_minor *minor, int minor_id,
 	return 0;
 }
 
-static inline void drm_debugfs_cleanup(struct drm_minor *minor)
-{
-}
-
 static inline void drm_debugfs_connector_add(struct drm_connector *connector)
 {
 }
diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 6e78416e64b0..d7fdc63a6632 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1745,8 +1745,15 @@ static void tegra_dc_early_unregister(struct drm_crtc *crtc)
 	unsigned int count = ARRAY_SIZE(debugfs_files);
 	struct drm_minor *minor = crtc->dev->primary;
 	struct tegra_dc *dc = to_tegra_dc(crtc);
+	struct dentry *root;
+
+#ifdef CONFIG_DEBUG_FS
+	root = crtc->debugfs_entry;
+#else
+	root = NULL;
+#endif
 
-	drm_debugfs_remove_files(dc->debugfs_files, count, minor);
+	drm_debugfs_remove_files(dc->debugfs_files, count, root, minor);
 	kfree(dc->debugfs_files);
 	dc->debugfs_files = NULL;
 }
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index a9870c828374..fbfe92a816d4 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -256,6 +256,7 @@ static void tegra_dsi_early_unregister(struct drm_connector *connector)
 	struct tegra_dsi *dsi = to_dsi(output);
 
 	drm_debugfs_remove_files(dsi->debugfs_files, count,
+				 connector->debugfs_entry,
 				 connector->dev->primary);
 	kfree(dsi->debugfs_files);
 	dsi->debugfs_files = NULL;
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 6eac54ae1205..d953d0a0325a 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1114,7 +1114,8 @@ static void tegra_hdmi_early_unregister(struct drm_connector *connector)
 	unsigned int count = ARRAY_SIZE(debugfs_files);
 	struct tegra_hdmi *hdmi = to_hdmi(output);
 
-	drm_debugfs_remove_files(hdmi->debugfs_files, count, minor);
+	drm_debugfs_remove_files(hdmi->debugfs_files, count,
+				 connector->debugfs_entry, minor);
 	kfree(hdmi->debugfs_files);
 	hdmi->debugfs_files = NULL;
 }
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index fbb63d755496..b45c569e6a0b 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -1707,6 +1707,7 @@ static void tegra_sor_early_unregister(struct drm_connector *connector)
 	struct tegra_sor *sor = to_sor(output);
 
 	drm_debugfs_remove_files(sor->debugfs_files, count,
+				 connector->debugfs_entry,
 				 connector->dev->primary);
 	kfree(sor->debugfs_files);
 	sor->debugfs_files = NULL;
diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
index 7616f457ce70..84ee27dc2317 100644
--- a/include/drm/drm_debugfs.h
+++ b/include/drm/drm_debugfs.h
@@ -126,8 +126,8 @@ struct drm_debugfs_entry {
 void drm_debugfs_create_files(const struct drm_info_list *files,
 			      int count, struct dentry *root,
 			      struct drm_minor *minor);
-int drm_debugfs_remove_files(const struct drm_info_list *files,
-			     int count, struct drm_minor *minor);
+int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
+			     struct dentry *root, struct drm_minor *minor);
 
 void drm_debugfs_add_file(struct drm_device *dev, const char *name,
 			  int (*show)(struct seq_file*, void*), void *data);
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 016fb715b9b6..ccdc793a8264 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -79,11 +79,7 @@ struct drm_minor {
 	struct device *kdev;		/* Linux device */
 	struct drm_device *dev;
 
-	struct dentry *debugfs_symlink;
 	struct dentry *debugfs_root;
-
-	struct list_head debugfs_list;
-	struct mutex debugfs_lock; /* Protects debugfs_list. */
 };
 
 /**
-- 
2.34.1

