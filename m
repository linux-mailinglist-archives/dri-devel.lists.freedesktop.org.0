Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C794C78C2E5
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 13:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7E210E213;
	Tue, 29 Aug 2023 11:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AC210E208
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 11:01:22 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2bbbda48904so63925921fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 04:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693306881; x=1693911681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=i1oK4e+U8y7KWzLi+wTdhv+UD/YbPDLmQluK2zJmg+o=;
 b=CzmFTSPTKEgQR72UulI0zPRQ5CTjE6tAqiVsAxZkXkhPvIU0HsHlMU3PXHAS93aKkW
 zQWFlDpLrutCoXlTtePURoavnbDnoy1wG/Kv/ghhYd7bNC7ZJbMfSArsH2cCt2MI/cW/
 iKDAKnUkXrpDIrkNnHvvRRynd7SK2oIWhXSjKxQeya6uQIuUi/Jd5AJFVim1wXjdH0FZ
 XZ+h3eO9M2uxw34WxIOqCuQf6qp1P0GcRK0C2ZX4G199A8dtufwGK1PegUpHYCyCDjuB
 wgpZ7j/kSTQL8wgRDEUOuCQQHP0YVB2LLwSBBseG0189ZQ54+KQou3nIPgS+iBDi5Kuq
 PSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693306881; x=1693911681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i1oK4e+U8y7KWzLi+wTdhv+UD/YbPDLmQluK2zJmg+o=;
 b=XAjub5QtTUhS3LgKwE6vShpKumRnvVlo9zoFNPwGqJ/aXx65tEcI+knY78PfleAwWN
 MJ/MdFXSoJsCsgVo9Skhaadp0su8YQXM92dPC6+MtloQy5ISwSGMDeJ3E/PxQCfXwdQL
 P3KURMql52SCKSY0D6oHZ/N4lrt/5WLJaZPXhdCQnV7Zg7QmnFzNtn0njkmuaShPGUD0
 nklZx2FBudsplsi6MYNorlKhgJdwXLUsMm859lFzOXDAJwSKHBjSk0woztIalrJ7ghE9
 Lm6wGh1MyeU9X22AxMYk53FyRrd78fFxNA9ZPD8pJw+tD8vBWta48pUq1m5HEPhom1Zk
 wfmQ==
X-Gm-Message-State: AOJu0YzMuO6elounOnUXIhv9aCSDBmW6INiB5OWgKFGUIOoF2Spexo3V
 otKF1g2Z8yEdLaMhB8V5HPY=
X-Google-Smtp-Source: AGHT+IFUTcAhUqDqmz8gA06zTcE670yyAUCS68KW2+YYD8ys2nrRcumJBgiPNZfeEtCh7MdmikO6nQ==
X-Received: by 2002:a2e:b0d8:0:b0:2bc:f5a0:cc25 with SMTP id
 g24-20020a2eb0d8000000b002bcf5a0cc25mr8272961ljl.2.1693306881171; 
 Tue, 29 Aug 2023 04:01:21 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:158b:d500:cd84:8e32:621d:b36b])
 by smtp.gmail.com with ESMTPSA id
 i27-20020a1709063c5b00b009928b4e3b9fsm5805885ejg.114.2023.08.29.04.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 04:01:20 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ogabbay@kernel.org,
	ttayar@habana.ai,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/debugfs: rework drm_debugfs_create_files
 implementation v2
Date: Tue, 29 Aug 2023 13:01:15 +0200
Message-Id: <20230829110115.3442-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230829110115.3442-1-christian.koenig@amd.com>
References: <20230829110115.3442-1-christian.koenig@amd.com>
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

v2: keep drm_debugfs_cleanup(), but rename to drm_debugfs_unregister(),
    we still need to cleanup the symlink

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/accel/drm_accel.c      |  2 -
 drivers/gpu/drm/drm_debugfs.c  | 70 ++++++++++------------------------
 drivers/gpu/drm/drm_drv.c      |  4 +-
 drivers/gpu/drm/drm_internal.h |  4 +-
 drivers/gpu/drm/tegra/dc.c     |  9 ++++-
 drivers/gpu/drm/tegra/dsi.c    |  1 +
 drivers/gpu/drm/tegra/hdmi.c   |  3 +-
 drivers/gpu/drm/tegra/sor.c    |  1 +
 include/drm/drm_debugfs.h      |  4 +-
 include/drm/drm_file.h         |  3 --
 10 files changed, 39 insertions(+), 62 deletions(-)

diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
index 8ba3db2ec5bb..94b4ac12cf24 100644
--- a/drivers/accel/drm_accel.c
+++ b/drivers/accel/drm_accel.c
@@ -99,8 +99,6 @@ void accel_debugfs_register(struct drm_device *dev)
 {
 	struct drm_minor *minor = dev->accel;
 
-	INIT_LIST_HEAD(&minor->debugfs_list);
-	mutex_init(&minor->debugfs_lock);
 	minor->debugfs_root = dev->debugfs_root;
 
 	drm_debugfs_create_files(accel_debugfs_list, ACCEL_DEBUGFS_ENTRIES,
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index d0c6492d5de1..34c7d1a580e3 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -234,7 +234,7 @@ EXPORT_SYMBOL(drm_debugfs_gpuva_info);
  *
  * Create a given set of debugfs files represented by an array of
  * &struct drm_info_list in the given root directory. These files will be removed
- * automatically on drm_debugfs_cleanup().
+ * automatically on drm_debugfs_dev_fini().
  */
 void drm_debugfs_create_files(const struct drm_info_list *files, int count,
 			      struct dentry *root, struct drm_minor *minor)
@@ -249,7 +249,7 @@ void drm_debugfs_create_files(const struct drm_info_list *files, int count,
 		if (features && !drm_core_check_all_features(dev, features))
 			continue;
 
-		tmp = kmalloc(sizeof(struct drm_info_node), GFP_KERNEL);
+		tmp = drmm_kzalloc(dev, sizeof(*tmp), GFP_KERNEL);
 		if (tmp == NULL)
 			continue;
 
@@ -258,14 +258,28 @@ void drm_debugfs_create_files(const struct drm_info_list *files, int count,
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
@@ -310,8 +324,6 @@ int drm_debugfs_register(struct drm_minor *minor, int minor_id,
 	struct drm_device *dev = minor->dev;
 	char name[64];
 
-	INIT_LIST_HEAD(&minor->debugfs_list);
-	mutex_init(&minor->debugfs_lock);
 	sprintf(name, "%d", minor_id);
 	minor->debugfs_symlink = debugfs_create_symlink(name, root,
 							dev->unique);
@@ -325,48 +337,8 @@ int drm_debugfs_register(struct drm_minor *minor, int minor_id,
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
+void drm_debugfs_unregister(struct drm_minor *minor)
 {
-	if (!minor->debugfs_symlink)
-		return;
-
-	drm_debugfs_remove_all_files(minor);
 	debugfs_remove(minor->debugfs_symlink);
 	minor->debugfs_symlink = NULL;
 }
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 45053f3371ca..535f16e7882e 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -198,7 +198,7 @@ static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
 	return 0;
 
 err_debugfs:
-	drm_debugfs_cleanup(minor);
+	drm_debugfs_unregister(minor);
 	return ret;
 }
 
@@ -222,7 +222,7 @@ static void drm_minor_unregister(struct drm_device *dev, enum drm_minor_type typ
 
 	device_del(minor->kdev);
 	dev_set_drvdata(minor->kdev, NULL); /* safety belt */
-	drm_debugfs_cleanup(minor);
+	drm_debugfs_unregister(minor);
 }
 
 /*
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index ec8a1e9c19e8..ab9a472f4a47 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -184,7 +184,7 @@ void drm_debugfs_dev_fini(struct drm_device *dev);
 void drm_debugfs_dev_register(struct drm_device *dev);
 int drm_debugfs_register(struct drm_minor *minor, int minor_id,
 			 struct dentry *root);
-void drm_debugfs_cleanup(struct drm_minor *minor);
+void drm_debugfs_unregister(struct drm_minor *minor);
 void drm_debugfs_connector_add(struct drm_connector *connector);
 void drm_debugfs_connector_remove(struct drm_connector *connector);
 void drm_debugfs_crtc_add(struct drm_crtc *crtc);
@@ -205,7 +205,7 @@ static inline int drm_debugfs_register(struct drm_minor *minor, int minor_id,
 	return 0;
 }
 
-static inline void drm_debugfs_cleanup(struct drm_minor *minor)
+static inline void drm_debugfs_unregister(struct drm_minor *minor)
 {
 }
 
diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 13b182ab905f..be61c9d1a4f0 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1746,8 +1746,15 @@ static void tegra_dc_early_unregister(struct drm_crtc *crtc)
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
index 80c760986d9e..0ba3ca3ac509 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1116,7 +1116,8 @@ static void tegra_hdmi_early_unregister(struct drm_connector *connector)
 	unsigned int count = ARRAY_SIZE(debugfs_files);
 	struct tegra_hdmi *hdmi = to_hdmi(output);
 
-	drm_debugfs_remove_files(hdmi->debugfs_files, count, minor);
+	drm_debugfs_remove_files(hdmi->debugfs_files, count,
+				 connector->debugfs_entry, minor);
 	kfree(hdmi->debugfs_files);
 	hdmi->debugfs_files = NULL;
 }
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 61b437a84806..d5a3d3f4fece 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -1708,6 +1708,7 @@ static void tegra_sor_early_unregister(struct drm_connector *connector)
 	struct tegra_sor *sor = to_sor(output);
 
 	drm_debugfs_remove_files(sor->debugfs_files, count,
+				 connector->debugfs_entry,
 				 connector->dev->primary);
 	kfree(sor->debugfs_files);
 	sor->debugfs_files = NULL;
diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
index cb2c1956a214..7213ce15e4ff 100644
--- a/include/drm/drm_debugfs.h
+++ b/include/drm/drm_debugfs.h
@@ -142,8 +142,8 @@ struct drm_debugfs_entry {
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
index 12930a08368c..489cc3758a82 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -81,9 +81,6 @@ struct drm_minor {
 
 	struct dentry *debugfs_symlink;
 	struct dentry *debugfs_root;
-
-	struct list_head debugfs_list;
-	struct mutex debugfs_lock; /* Protects debugfs_list. */
 };
 
 /**
-- 
2.34.1

