Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A1C3ADE07
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jun 2021 13:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4E96E103;
	Sun, 20 Jun 2021 11:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11376E103
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jun 2021 11:05:23 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id i34so6094996pgl.9
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jun 2021 04:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eT3lZU58x4O0PBOXBHBGgXO2NKrB2uxcocZvQ1AgWcw=;
 b=HkHaepvhx5LaNpYHCR+btPAQXEFwMFgoL+9TZlJhvlIi6DT/k+fyZhmi19MliLFjL+
 f/A2eU52sFNMb7MOSF54TryXa5ulBTNVYJwVWwUG35Di0Cuv4gCXHBCrFnXm0wDZ//9o
 QNBVFPD67fG3H9tlmalwyuxt0DBiHetKwz37cDjQItd6Pa6WbNaRqVfRRzo0Z6Et0sQs
 /qkJQWWplK2xnXGYxK0StoNADhk8JHMfj/mQ802cKHXxRK5SzouCcWEmsthfmAYGpD7w
 MtFVOlavW2uPZsVEjoG9qXaECdNmSWKULHgJDziWa8R0+SRMGPqeqrxwBXLnJkQ0/P/6
 c8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eT3lZU58x4O0PBOXBHBGgXO2NKrB2uxcocZvQ1AgWcw=;
 b=hR6/xQfppRp67htM5QjlSqdGc6DIXIJP5SK3xvTVkzD6Zw2mF8msVkkZABnpBR5rwQ
 6BUYKFjftWphFbmznwSySCEd3AKCZA/WdFsgpLuzIhfIBsHSIM7gLBCU7QEVFqu5IDgO
 Y7tfcA0OJaOVDMzXQ+w+AtSpQzjW+GehL1OM81NJhrvbdmFX8Lt9cqnffFIHFb5PG3Vx
 Q/5nAxYtE0LtcxTnRtWmaJD1Yb8mYSa1hy2qadjrh5IbsIM5qD6zzCr6QoIC6GeQ/ack
 dDmNzgwL+3wI/Zbk4697S1P9llqqgJub7Yigwl+xNXjHa+iXO7Jj1QguYBRUiPSES8m2
 4QIw==
X-Gm-Message-State: AOAM532ll8offQmXTU3gtfxGdbt6Ae4NWrLGHEFAXb/jm8weWueutqC/
 PLo4/oRCNaML/C1NcLWS/pQ=
X-Google-Smtp-Source: ABdhPJy/CVyTTr8Ls0f1te3fs3v46yeELeSPfaV4xOjfygTP7P8jQ7HUv1bcAsPlnbNvwnJ+tj5+FA==
X-Received: by 2002:a63:530a:: with SMTP id h10mr18971987pgb.98.1624187123496; 
 Sun, 20 Jun 2021 04:05:23 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id h22sm2644876pfc.21.2021.06.20.04.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 04:05:23 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v3 2/2] drm: protect drm_master pointers in drm_lease.c
Date: Sun, 20 Jun 2021 19:03:27 +0800
Message-Id: <20210620110327.4964-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620110327.4964-1-desmondcheongzx@gmail.com>
References: <20210620110327.4964-1-desmondcheongzx@gmail.com>
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
Cc: gregkh@linuxfoundation.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 skhan@linuxfoundation.org, Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, direct copies of drm_file->master pointers should be
protected by drm_device.master_mutex when being dereferenced. This is
because drm_file->master is not invariant for the lifetime of
drm_file. If drm_file is not the creator of master, then
drm_file->is_master is false, and a call to drm_setmaster_ioctl will
invoke drm_new_set_master, which then allocates a new master for
drm_file and puts the old master.

Thus, without holding drm_device.master_mutex, the old value of
drm_file->master could be freed while it is being used by another
concurrent process.

In drm_lease.c, there are multiple instances where drm_file->master is
accessed and dereferenced while drm_device.master_mutex is not
held. This makes drm_lease.c vulnerable to use-after-free bugs.

We address this issue as follows:

1. Clarify in the kerneldoc that drm_file->master is protected by
drm_device.master_mutex.

2. Add a new drm_file_get_master() function that calls drm_master_get
on drm_file->master while holding on to drm_device.master_mutex. Since
drm_master_get increments the reference count of master, this
prevents master from being freed until we unreference it with
drm_master_put.

3. In each case where drm_file->master is directly accessed and
eventually dereferenced in drm_lease.c, we wrap the access in a call
to the new drm_file_get_master function, then unreference the master
pointer once we are done using it.

Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c  | 22 ++++++++++++++
 drivers/gpu/drm/drm_lease.c | 57 ++++++++++++++++++++++++++-----------
 include/drm/drm_auth.h      |  1 +
 include/drm/drm_file.h      | 15 ++++++++--
 4 files changed, 75 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 86d4b72e95cb..0c64a77c67a6 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -384,6 +384,28 @@ struct drm_master *drm_master_get(struct drm_master *master)
 }
 EXPORT_SYMBOL(drm_master_get);
 
+/**
+ * drm_file_get_master - reference @file_priv->master
+ * @file_priv: DRM file private
+ *
+ * Increments the reference count of @file_priv->master and returns
+ * @file_priv->master.
+ *
+ * Master pointers returned from this function should be unreferenced using
+ * drm_master_put().
+ */
+struct drm_master *drm_file_get_master(struct drm_file *file_priv)
+{
+	struct drm_master *master;
+
+	mutex_lock(&file_priv->master->dev->master_mutex);
+	master = drm_master_get(file_priv->master);
+	mutex_unlock(&file_priv->master->dev->master_mutex);
+
+	return master;
+}
+EXPORT_SYMBOL(drm_file_get_master);
+
 static void drm_master_destroy(struct kref *kref)
 {
 	struct drm_master *master = container_of(kref, struct drm_master, refcount);
diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index da4f085fc09e..65eab82f8acc 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -107,10 +107,17 @@ static bool _drm_has_leased(struct drm_master *master, int id)
  */
 bool _drm_lease_held(struct drm_file *file_priv, int id)
 {
+	bool ret;
+	struct drm_master *master;
+
 	if (!file_priv || !file_priv->master)
 		return true;
 
-	return _drm_lease_held_master(file_priv->master, id);
+	master = drm_file_get_master(file_priv);
+	ret = _drm_lease_held_master(master, id);
+	drm_master_put(&master);
+
+	return ret;
 }
 
 /**
@@ -132,10 +139,11 @@ bool drm_lease_held(struct drm_file *file_priv, int id)
 	if (!file_priv || !file_priv->master || !file_priv->master->lessor)
 		return true;
 
-	master = file_priv->master;
+	master = drm_file_get_master(file_priv);
 	mutex_lock(&master->dev->mode_config.idr_mutex);
 	ret = _drm_lease_held_master(master, id);
 	mutex_unlock(&master->dev->mode_config.idr_mutex);
+	drm_master_put(&master);
 	return ret;
 }
 
@@ -158,7 +166,7 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
 	if (!file_priv || !file_priv->master || !file_priv->master->lessor)
 		return crtcs_in;
 
-	master = file_priv->master;
+	master = drm_file_get_master(file_priv);
 	dev = master->dev;
 
 	count_in = count_out = 0;
@@ -177,6 +185,7 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
 		count_in++;
 	}
 	mutex_unlock(&master->dev->mode_config.idr_mutex);
+	drm_master_put(&master);
 	return crtcs_out;
 }
 
@@ -490,7 +499,7 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 	size_t object_count;
 	int ret = 0;
 	struct idr leases;
-	struct drm_master *lessor = lessor_priv->master;
+	struct drm_master *lessor;
 	struct drm_master *lessee = NULL;
 	struct file *lessee_file = NULL;
 	struct file *lessor_file = lessor_priv->filp;
@@ -502,12 +511,6 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
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
@@ -519,12 +522,22 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
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
 
@@ -535,14 +548,15 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
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
@@ -578,6 +592,7 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 	/* Hook up the fd */
 	fd_install(fd, lessee_file);
 
+	drm_master_put(&lessor);
 	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl succeeded\n");
 	return 0;
 
@@ -587,6 +602,8 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 out_leases:
 	put_unused_fd(fd);
 
+out_lessor:
+	drm_master_put(&lessor);
 	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl failed: %d\n", ret);
 	return ret;
 }
@@ -609,7 +626,7 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
 	struct drm_mode_list_lessees *arg = data;
 	__u32 __user *lessee_ids = (__u32 __user *) (uintptr_t) (arg->lessees_ptr);
 	__u32 count_lessees = arg->count_lessees;
-	struct drm_master *lessor = lessor_priv->master, *lessee;
+	struct drm_master *lessor, *lessee;
 	int count;
 	int ret = 0;
 
@@ -620,6 +637,7 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
+	lessor = drm_file_get_master(lessor_priv);
 	DRM_DEBUG_LEASE("List lessees for %d\n", lessor->lessee_id);
 
 	mutex_lock(&dev->mode_config.idr_mutex);
@@ -643,6 +661,7 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
 		arg->count_lessees = count;
 
 	mutex_unlock(&dev->mode_config.idr_mutex);
+	drm_master_put(&lessor);
 
 	return ret;
 }
@@ -662,7 +681,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
 	struct drm_mode_get_lease *arg = data;
 	__u32 __user *object_ids = (__u32 __user *) (uintptr_t) (arg->objects_ptr);
 	__u32 count_objects = arg->count_objects;
-	struct drm_master *lessee = lessee_priv->master;
+	struct drm_master *lessee;
 	struct idr *object_idr;
 	int count;
 	void *entry;
@@ -676,6 +695,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
+	lessee = drm_file_get_master(lessee_priv);
 	DRM_DEBUG_LEASE("get lease for %d\n", lessee->lessee_id);
 
 	mutex_lock(&dev->mode_config.idr_mutex);
@@ -703,6 +723,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
 		arg->count_objects = count;
 
 	mutex_unlock(&dev->mode_config.idr_mutex);
+	drm_master_put(&lessee);
 
 	return ret;
 }
@@ -721,7 +742,7 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
 				void *data, struct drm_file *lessor_priv)
 {
 	struct drm_mode_revoke_lease *arg = data;
-	struct drm_master *lessor = lessor_priv->master;
+	struct drm_master *lessor;
 	struct drm_master *lessee;
 	int ret = 0;
 
@@ -731,6 +752,7 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
+	lessor = drm_file_get_master(lessor_priv);
 	mutex_lock(&dev->mode_config.idr_mutex);
 
 	lessee = _drm_find_lessee(lessor, arg->lessee_id);
@@ -751,6 +773,7 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
 
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
index b81b3bfb08c8..e9931fca4ab7 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -226,9 +226,18 @@ struct drm_file {
 	/**
 	 * @master:
 	 *
-	 * Master this node is currently associated with. Only relevant if
-	 * drm_is_primary_client() returns true. Note that this only
-	 * matches &drm_device.master if the master is the currently active one.
+	 * Master this node is currently associated with. Protected by struct
+	 * &drm_device.master_mutex.
+	 *
+	 * Only relevant if drm_is_primary_client() returns true. Note that
+	 * this only matches &drm_device.master if the master is the currently
+	 * active one.
+	 *
+	 * When obtaining a copy of this pointer, it is recommended to either
+	 * hold struct &drm_device.master_mutex for the duration of the
+	 * pointer's use, or to use drm_file_get_master() if struct
+	 * &drm_device.master_mutex is not currently held and there is no other
+	 * need to hold it. This prevents @master from being freed during use.
 	 *
 	 * See also @authentication and @is_master and the :ref:`section on
 	 * primary nodes and authentication <drm_primary_node>`.
-- 
2.25.1

