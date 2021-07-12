Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3933C432F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 06:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDE889BD4;
	Mon, 12 Jul 2021 04:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D867A89BD4;
 Mon, 12 Jul 2021 04:36:18 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 i16-20020a17090acf90b02901736d9d2218so4800775pju.1; 
 Sun, 11 Jul 2021 21:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O+BhDSDa8a6VSiPpoweqCmWLRJoKkcr07kGDOlc6cDQ=;
 b=tJP61n3eKymsVwi7oalCf4eL5CGbTM5euNT0mEsaDGks4oc6iKJnfkIFkFSZWzbptn
 5yjaDwHwhGxiQ5v/xWU6QW6wlRP3AXzqeiMu/PLr5gwMb/LnPU3V7XeZL+2zAUKH3LnM
 W1E12dKRGwzxymL/6vCQ5Ya3CgzYIiRMIbl/U+Hi9L/wvi7JNm8YA8f8agTX5fKczJVj
 XMmsIVwhiA9CUgWKCrz5Z8bJM55h4PSmOSVebzB+OTiopoqEbAktAvrjHbKKCdsXLcfG
 ay+v0EMmjy/xTL5UxkpS6LH/QQKUWoJRVk06hiLVqrulLoQBLf1mNzvbkujwqoWe2Jn1
 fYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O+BhDSDa8a6VSiPpoweqCmWLRJoKkcr07kGDOlc6cDQ=;
 b=KfAtWQd2GiVxFdGuPDL3f7WG7Dh2JKaMVRH94YFiq1On4PK9el10PGmJnDSc4T3WEh
 FMcxREBbeaV5VaM//nlCYyZBFyTRRM6MAXvmzavmauuIiJloI2HMOeDS85j20dIY0swz
 mwHXZ1dlUaaZmM4MZieWsYfLLLyyQySjyJAqkWBWjwoN3LOxmdg+tXhuZ2zpaeCE0yAg
 BMq7WdwYPsi79n547qJ67igcrNjTyRbAn66xgqtS46FeFckqRNGM1FxfhgNjo9+mU6Zl
 nbKo0KtruUNSzC2FkauWx8FyVxEZy1n0B2/cykjdCVzF9j17AaPte9tnXdalT88FbBPe
 eDQA==
X-Gm-Message-State: AOAM531Lf+lZD5iNJNzrt8t7Ufahm/Ry+IAKpad4ADKA3o0G8NIbs+Oi
 4jSEYslacpTncs7Xisnn5QI=
X-Google-Smtp-Source: ABdhPJx6GmwVqlWs06Z5kgSK1WZQvc3WPG2YwBZ2yL67QsegwDOtb3jcpA9v14ODt+nTQcPeSxUVUQ==
X-Received: by 2002:a17:902:bf45:b029:129:8147:3a93 with SMTP id
 u5-20020a170902bf45b029012981473a93mr35405154pls.84.1626064578481; 
 Sun, 11 Jul 2021 21:36:18 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id n3sm14242764pfn.216.2021.07.11.21.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 21:36:18 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v8 5/5] drm: protect drm_master pointers in drm_lease.c
Date: Mon, 12 Jul 2021 12:35:08 +0800
Message-Id: <20210712043508.11584-6-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712043508.11584-1-desmondcheongzx@gmail.com>
References: <20210712043508.11584-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, gregkh@linuxfoundation.org,
 intel-gfx@lists.freedesktop.org, emil.l.velikov@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_file->master pointers should be protected by
drm_device.master_mutex or drm_file.master_lookup_lock when being
dereferenced.

However, in drm_lease.c, there are multiple instances where
drm_file->master is accessed and dereferenced while neither lock is
held. This makes drm_lease.c vulnerable to use-after-free bugs.

We address this issue in 2 ways:

1. Add a new drm_file_get_master() function that calls drm_master_get
on drm_file->master while holding on to
drm_file.master_lookup_lock. Since drm_master_get increments the
reference count of master, this prevents master from being freed until
we unreference it with drm_master_put.

2. In each case where drm_file->master is directly accessed and
eventually dereferenced in drm_lease.c, we wrap the access in a call
to the new drm_file_get_master function, then unreference the master
pointer once we are done using it.

Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/drm_auth.c  | 25 ++++++++++++
 drivers/gpu/drm/drm_lease.c | 81 ++++++++++++++++++++++++++++---------
 include/drm/drm_auth.h      |  1 +
 include/drm/drm_file.h      |  6 +++
 4 files changed, 93 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 30a239901b36..f00354bec3fb 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -389,6 +389,31 @@ struct drm_master *drm_master_get(struct drm_master *master)
 }
 EXPORT_SYMBOL(drm_master_get);
 
+/**
+ * drm_file_get_master - reference &drm_file.master of @file_priv
+ * @file_priv: DRM file private
+ *
+ * Increments the reference count of @file_priv's &drm_file.master and returns
+ * the &drm_file.master. If @file_priv has no &drm_file.master, returns NULL.
+ *
+ * Master pointers returned from this function should be unreferenced using
+ * drm_master_put().
+ */
+struct drm_master *drm_file_get_master(struct drm_file *file_priv)
+{
+	struct drm_master *master = NULL;
+
+	spin_lock(&file_priv->master_lookup_lock);
+	if (!file_priv->master)
+		goto unlock;
+	master = drm_master_get(file_priv->master);
+
+unlock:
+	spin_unlock(&file_priv->master_lookup_lock);
+	return master;
+}
+EXPORT_SYMBOL(drm_file_get_master);
+
 static void drm_master_destroy(struct kref *kref)
 {
 	struct drm_master *master = container_of(kref, struct drm_master, refcount);
diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index 00fb433bcef1..92eac73d9001 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -106,10 +106,19 @@ static bool _drm_has_leased(struct drm_master *master, int id)
  */
 bool _drm_lease_held(struct drm_file *file_priv, int id)
 {
-	if (!file_priv || !file_priv->master)
+	bool ret;
+	struct drm_master *master;
+
+	if (!file_priv)
 		return true;
 
-	return _drm_lease_held_master(file_priv->master, id);
+	master = drm_file_get_master(file_priv);
+	if (!master)
+		return true;
+	ret = _drm_lease_held_master(master, id);
+	drm_master_put(&master);
+
+	return ret;
 }
 
 /**
@@ -128,13 +137,22 @@ bool drm_lease_held(struct drm_file *file_priv, int id)
 	struct drm_master *master;
 	bool ret;
 
-	if (!file_priv || !file_priv->master || !file_priv->master->lessor)
+	if (!file_priv)
 		return true;
 
-	master = file_priv->master;
+	master = drm_file_get_master(file_priv);
+	if (!master)
+		return true;
+	if (!master->lessor) {
+		ret = true;
+		goto out;
+	}
 	mutex_lock(&master->dev->mode_config.idr_mutex);
 	ret = _drm_lease_held_master(master, id);
 	mutex_unlock(&master->dev->mode_config.idr_mutex);
+
+out:
+	drm_master_put(&master);
 	return ret;
 }
 
@@ -154,10 +172,16 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
 	int count_in, count_out;
 	uint32_t crtcs_out = 0;
 
-	if (!file_priv || !file_priv->master || !file_priv->master->lessor)
+	if (!file_priv)
 		return crtcs_in;
 
-	master = file_priv->master;
+	master = drm_file_get_master(file_priv);
+	if (!master)
+		return crtcs_in;
+	if (!master->lessor) {
+		crtcs_out = crtcs_in;
+		goto out;
+	}
 	dev = master->dev;
 
 	count_in = count_out = 0;
@@ -176,6 +200,9 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
 		count_in++;
 	}
 	mutex_unlock(&master->dev->mode_config.idr_mutex);
+
+out:
+	drm_master_put(&master);
 	return crtcs_out;
 }
 
@@ -489,7 +516,7 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 	size_t object_count;
 	int ret = 0;
 	struct idr leases;
-	struct drm_master *lessor = lessor_priv->master;
+	struct drm_master *lessor;
 	struct drm_master *lessee = NULL;
 	struct file *lessee_file = NULL;
 	struct file *lessor_file = lessor_priv->filp;
@@ -501,12 +528,6 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
-	/* Do not allow sub-leases */
-	if (lessor->lessor) {
-		DRM_DEBUG_LEASE("recursive leasing not allowed\n");
-		return -EINVAL;
-	}
-
 	/* need some objects */
 	if (cl->object_count == 0) {
 		DRM_DEBUG_LEASE("no objects in lease\n");
@@ -518,12 +539,22 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 		return -EINVAL;
 	}
 
+	lessor = drm_file_get_master(lessor_priv);
+	/* Do not allow sub-leases */
+	if (lessor->lessor) {
+		DRM_DEBUG_LEASE("recursive leasing not allowed\n");
+		ret = -EINVAL;
+		goto out_lessor;
+	}
+
 	object_count = cl->object_count;
 
 	object_ids = memdup_user(u64_to_user_ptr(cl->object_ids),
 			array_size(object_count, sizeof(__u32)));
-	if (IS_ERR(object_ids))
-		return PTR_ERR(object_ids);
+	if (IS_ERR(object_ids)) {
+		ret = PTR_ERR(object_ids);
+		goto out_lessor;
+	}
 
 	idr_init(&leases);
 
@@ -534,14 +565,15 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 	if (ret) {
 		DRM_DEBUG_LEASE("lease object lookup failed: %i\n", ret);
 		idr_destroy(&leases);
-		return ret;
+		goto out_lessor;
 	}
 
 	/* Allocate a file descriptor for the lease */
 	fd = get_unused_fd_flags(cl->flags & (O_CLOEXEC | O_NONBLOCK));
 	if (fd < 0) {
 		idr_destroy(&leases);
-		return fd;
+		ret = fd;
+		goto out_lessor;
 	}
 
 	DRM_DEBUG_LEASE("Creating lease\n");
@@ -577,6 +609,7 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 	/* Hook up the fd */
 	fd_install(fd, lessee_file);
 
+	drm_master_put(&lessor);
 	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl succeeded\n");
 	return 0;
 
@@ -586,6 +619,8 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 out_leases:
 	put_unused_fd(fd);
 
+out_lessor:
+	drm_master_put(&lessor);
 	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl failed: %d\n", ret);
 	return ret;
 }
@@ -608,7 +643,7 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
 	struct drm_mode_list_lessees *arg = data;
 	__u32 __user *lessee_ids = (__u32 __user *) (uintptr_t) (arg->lessees_ptr);
 	__u32 count_lessees = arg->count_lessees;
-	struct drm_master *lessor = lessor_priv->master, *lessee;
+	struct drm_master *lessor, *lessee;
 	int count;
 	int ret = 0;
 
@@ -619,6 +654,7 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
+	lessor = drm_file_get_master(lessor_priv);
 	DRM_DEBUG_LEASE("List lessees for %d\n", lessor->lessee_id);
 
 	mutex_lock(&dev->mode_config.idr_mutex);
@@ -642,6 +678,7 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
 		arg->count_lessees = count;
 
 	mutex_unlock(&dev->mode_config.idr_mutex);
+	drm_master_put(&lessor);
 
 	return ret;
 }
@@ -661,7 +698,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
 	struct drm_mode_get_lease *arg = data;
 	__u32 __user *object_ids = (__u32 __user *) (uintptr_t) (arg->objects_ptr);
 	__u32 count_objects = arg->count_objects;
-	struct drm_master *lessee = lessee_priv->master;
+	struct drm_master *lessee;
 	struct idr *object_idr;
 	int count;
 	void *entry;
@@ -675,6 +712,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
+	lessee = drm_file_get_master(lessee_priv);
 	DRM_DEBUG_LEASE("get lease for %d\n", lessee->lessee_id);
 
 	mutex_lock(&dev->mode_config.idr_mutex);
@@ -702,6 +740,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
 		arg->count_objects = count;
 
 	mutex_unlock(&dev->mode_config.idr_mutex);
+	drm_master_put(&lessee);
 
 	return ret;
 }
@@ -720,7 +759,7 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
 				void *data, struct drm_file *lessor_priv)
 {
 	struct drm_mode_revoke_lease *arg = data;
-	struct drm_master *lessor = lessor_priv->master;
+	struct drm_master *lessor;
 	struct drm_master *lessee;
 	int ret = 0;
 
@@ -730,6 +769,7 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
+	lessor = drm_file_get_master(lessor_priv);
 	mutex_lock(&dev->mode_config.idr_mutex);
 
 	lessee = _drm_find_lessee(lessor, arg->lessee_id);
@@ -750,6 +790,7 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
 
 fail:
 	mutex_unlock(&dev->mode_config.idr_mutex);
+	drm_master_put(&lessor);
 
 	return ret;
 }
diff --git a/include/drm/drm_auth.h b/include/drm/drm_auth.h
index 6bf8b2b78991..f99d3417f304 100644
--- a/include/drm/drm_auth.h
+++ b/include/drm/drm_auth.h
@@ -107,6 +107,7 @@ struct drm_master {
 };
 
 struct drm_master *drm_master_get(struct drm_master *master);
+struct drm_master *drm_file_get_master(struct drm_file *file_priv);
 void drm_master_put(struct drm_master **master);
 bool drm_is_current_master(struct drm_file *fpriv);
 
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 9b82988e3427..726cfe0ff5f5 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -233,6 +233,12 @@ struct drm_file {
 	 * this only matches &drm_device.master if the master is the currently
 	 * active one.
 	 *
+	 * When dereferencing this pointer, either hold struct
+	 * &drm_device.master_mutex for the duration of the pointer's use, or
+	 * use drm_file_get_master() if struct &drm_device.master_mutex is not
+	 * currently held and there is no other need to hold it. This prevents
+	 * @master from being freed during use.
+	 *
 	 * See also @authentication and @is_master and the :ref:`section on
 	 * primary nodes and authentication <drm_primary_node>`.
 	 */
-- 
2.25.1

