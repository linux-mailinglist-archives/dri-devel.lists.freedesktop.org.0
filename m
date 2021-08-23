Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F61B3F4F3A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 19:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AAA26E098;
	Mon, 23 Aug 2021 17:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12EE66E098;
 Mon, 23 Aug 2021 17:15:48 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 28-20020a17090a031cb0290178dcd8a4d1so354217pje.0; 
 Mon, 23 Aug 2021 10:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CdghZpU/IFDZvN5I3/y7/a/xtgVOyRJ35c5/RV+v4JY=;
 b=mVsjlqYdzeDLyBD0PWUsN65UBIYuGXzoWgzPNxLnqRaNuX7LFuk+RxHds6S+4sIvhx
 s997V11GbCqL8laqi+0vmBZI0k7LGuFqm1W3iCm/O3A79IGVPAK6Zh2KARvT6TlPbpUi
 n2q9EGeBEtuVU5GxCk4j8tyBLnJ9Ah20qbcoxOEbMRLd7AuFIl4obOuu15h92q4hi7mj
 RFYnD4ys5li8ph0idHRldYJI63a6r1bM+UD2t978QdH/7bDr3bp79QGt381o2cysUOO5
 vQ6upvLZZDBIYGd2kDbsbJZSCSI7s4q83j49Cqra0l+BtltlWg+gTP2x/zvNEsK589jI
 1eFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CdghZpU/IFDZvN5I3/y7/a/xtgVOyRJ35c5/RV+v4JY=;
 b=WbLvqlu3qH0ZrDKSvY0sBkt5Ga1QsIAfjkbAR3jCLFrOMoQsR7exw/HFQxERkQ8sHm
 Wy4xdolYAyRH3qQFTm+7N6Xbv2gbBurAcBMv98MOyKGlxMGRQBhYWACJX4k9IJFnDkoU
 BohykL7vTDEgZDPq60//EjmSymB7AMqoCJrIgXVcptRoqvc8ZP3NCXF/E++zikFSpLIS
 rJkmmdwPqG5yxxH0mPk5WjERP0ztvW2U6WOha18cIzDpos9d6I1LwApZqBSU8ntF9ONM
 DZArZLe6Em3WsCugX8naQ3ru8wic3CsVPXHxX2BYthckgS+MHq94ND0sBAbHfj9ffDlQ
 rWvw==
X-Gm-Message-State: AOAM530TJoqmXNvLuobg7Y7OeZgnliptUS44nyNeEptFbBrVXQLOxoQ1
 XyiHmJf/rqTcvuK4vVNxreY=
X-Google-Smtp-Source: ABdhPJym8/kr10k6SS6CXqcSfaEbWEMxvZA2Ay+uj8o8TFJ/2iQggZFVs+WYnnWXOldqaYwU9M6sTg==
X-Received: by 2002:a17:902:8c81:b029:12c:ee37:3f58 with SMTP id
 t1-20020a1709028c81b029012cee373f58mr29374647plo.45.1629738947651; 
 Mon, 23 Aug 2021 10:15:47 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id q4sm14290830pjd.52.2021.08.23.10.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 10:15:47 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v5 6/6] drm: remove drm_file.master_lookup_lock
Date: Tue, 24 Aug 2021 01:14:37 +0800
Message-Id: <20210823171437.829404-7-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823171437.829404-1-desmondcheongzx@gmail.com>
References: <20210823171437.829404-1-desmondcheongzx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Previously, master_lookup_lock was introduced in
commit 0b0860a3cf5e ("drm: serialize drm_file.master with a new
spinlock") to serialize accesses to drm_file.master. This then allowed
us to write drm_file_get_master in commit 56f0729a510f ("drm: protect
drm_master pointers in drm_lease.c").

The rationale behind introducing a new spinlock at the time was that
the other lock that could have been used (drm_device.master_mutex) was
the outermost lock, so embedding calls to drm_file_get_master and
drm_is_current_master in various functions easily caused us to invert
the lock hierarchy.

Following the conversion of master_mutex into a rwsem, and its use to
plug races with modesetting rights, we've untangled some lock
hierarchies and removed the need for using drm_file_get_master and the
unlocked version of drm_is_current_master in multiple places.

Additionally, a previous patch fixed other remaining inversions
involving master_rwsem and modeset_mutex.

Hence, we can take this opportunity to clean up the locking design by
replacing master_lookup_lock with drm_device.master_rwsem.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c     | 19 +++++++------------
 drivers/gpu/drm/drm_file.c     |  1 -
 drivers/gpu/drm/drm_internal.h |  1 +
 drivers/gpu/drm/drm_ioctl.c    |  4 ++--
 drivers/gpu/drm/drm_lease.c    | 18 ++++++++----------
 include/drm/drm_file.h         |  9 +--------
 6 files changed, 19 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index f2b2f197052a..232416119407 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -61,10 +61,9 @@
  * trusted clients.
  */
 
-static bool drm_is_current_master_locked(struct drm_file *fpriv)
+bool drm_is_current_master_locked(struct drm_file *fpriv)
 {
-	lockdep_assert_once(lockdep_is_held(&fpriv->master_lookup_lock) ||
-			    lockdep_is_held(&fpriv->minor->dev->master_rwsem));
+	lockdep_assert_held_once(&fpriv->minor->dev->master_rwsem);
 
 	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
 }
@@ -83,9 +82,9 @@ bool drm_is_current_master(struct drm_file *fpriv)
 {
 	bool ret;
 
-	spin_lock(&fpriv->master_lookup_lock);
+	down_read(&fpriv->minor->dev->master_rwsem);
 	ret = drm_is_current_master_locked(fpriv);
-	spin_unlock(&fpriv->master_lookup_lock);
+	up_read(&fpriv->minor->dev->master_rwsem);
 
 	return ret;
 }
@@ -120,7 +119,7 @@ int drm_authmagic(struct drm_device *dev, void *data,
 	DRM_DEBUG("%u\n", auth->magic);
 
 	down_write(&dev->master_rwsem);
-	if (unlikely(!drm_is_current_master(file_priv))) {
+	if (unlikely(!drm_is_current_master_locked(file_priv))) {
 		up_write(&dev->master_rwsem);
 		return -EACCES;
 	}
@@ -178,9 +177,7 @@ static int drm_new_set_master(struct drm_device *dev, struct drm_file *fpriv)
 	new_master = drm_master_create(dev);
 	if (!new_master)
 		return -ENOMEM;
-	spin_lock(&fpriv->master_lookup_lock);
 	fpriv->master = new_master;
-	spin_unlock(&fpriv->master_lookup_lock);
 
 	fpriv->is_master = 1;
 	fpriv->authenticated = 1;
@@ -343,9 +340,7 @@ int drm_master_open(struct drm_file *file_priv)
 	if (!dev->master) {
 		ret = drm_new_set_master(dev, file_priv);
 	} else {
-		spin_lock(&file_priv->master_lookup_lock);
 		file_priv->master = drm_master_get(dev->master);
-		spin_unlock(&file_priv->master_lookup_lock);
 	}
 	up_write(&dev->master_rwsem);
 
@@ -413,13 +408,13 @@ struct drm_master *drm_file_get_master(struct drm_file *file_priv)
 	if (!file_priv)
 		return NULL;
 
-	spin_lock(&file_priv->master_lookup_lock);
+	down_read(&file_priv->minor->dev->master_rwsem);
 	if (!file_priv->master)
 		goto unlock;
 	master = drm_master_get(file_priv->master);
 
 unlock:
-	spin_unlock(&file_priv->master_lookup_lock);
+	up_read(&file_priv->minor->dev->master_rwsem);
 	return master;
 }
 EXPORT_SYMBOL(drm_file_get_master);
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 90b62f360da1..8c846e0179d7 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -176,7 +176,6 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 	init_waitqueue_head(&file->event_wait);
 	file->event_space = 4096; /* set aside 4k for event buffer */
 
-	spin_lock_init(&file->master_lookup_lock);
 	mutex_init(&file->event_read_lock);
 
 	if (drm_core_check_feature(dev, DRIVER_GEM))
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 17f3548c8ed2..5d421f749a17 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -132,6 +132,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
 				  struct drm_file *filp);
 
 /* drm_auth.c */
+bool drm_is_current_master_locked(struct drm_file *fpriv);
 int drm_getmagic(struct drm_device *dev, void *data,
 		 struct drm_file *file_priv);
 int drm_authmagic(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 8bea39ffc5c0..c728437466c3 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -386,7 +386,7 @@ static int drm_setversion(struct drm_device *dev, void *data, struct drm_file *f
 	int if_version, retcode = 0;
 
 	down_write(&dev->master_rwsem);
-	if (unlikely(!drm_is_current_master(file_priv))) {
+	if (unlikely(!drm_is_current_master_locked(file_priv))) {
 		retcode = -EACCES;
 		goto unlock;
 	}
@@ -540,7 +540,7 @@ static int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
 
 	/* MASTER is only for master or control clients */
 	if (unlikely((flags & DRM_MASTER) &&
-		     !drm_is_current_master(file_priv)))
+		     !drm_is_current_master_locked(file_priv)))
 		return -EACCES;
 
 	/* Render clients must be explicitly allowed */
diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index 4d434ee6730d..fe6286072d30 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -489,12 +489,12 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 		return PTR_ERR(lessee_file);
 
 	down_read(&dev->master_rwsem);
-	if (unlikely(!drm_is_current_master(lessor_priv))) {
+	if (unlikely(!drm_is_current_master_locked(lessor_priv))) {
 		ret = -EACCES;
 		goto out_file;
 	}
 
-	lessor = drm_file_get_master(lessor_priv);
+	lessor = lessor_priv->master;
 	/* Do not allow sub-leases */
 	if (lessor->lessor) {
 		DRM_DEBUG_LEASE("recursive leasing not allowed\n");
@@ -556,7 +556,6 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 	/* Hook up the fd */
 	fd_install(fd, lessee_file);
 
-	drm_master_put(&lessor);
 	up_read(&dev->master_rwsem);
 	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl succeeded\n");
 	return 0;
@@ -591,7 +590,8 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
-	lessor = drm_file_get_master(lessor_priv);
+	lockdep_assert_held_once(&dev->master_rwsem);
+	lessor = lessor_priv->master;
 	DRM_DEBUG_LEASE("List lessees for %d\n", lessor->lessee_id);
 
 	mutex_lock(&dev->mode_config.idr_mutex);
@@ -615,7 +615,6 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
 		arg->count_lessees = count;
 
 	mutex_unlock(&dev->mode_config.idr_mutex);
-	drm_master_put(&lessor);
 
 	return ret;
 }
@@ -641,7 +640,8 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
-	lessee = drm_file_get_master(lessee_priv);
+	lockdep_assert_held_once(&dev->master_rwsem);
+	lessee = lessee_priv->master;
 	DRM_DEBUG_LEASE("get lease for %d\n", lessee->lessee_id);
 
 	mutex_lock(&dev->mode_config.idr_mutex);
@@ -669,7 +669,6 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
 		arg->count_objects = count;
 
 	mutex_unlock(&dev->mode_config.idr_mutex);
-	drm_master_put(&lessee);
 
 	return ret;
 }
@@ -694,11 +693,11 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
 		return -EOPNOTSUPP;
 
 	down_write(&dev->master_rwsem);
-	if (unlikely(!drm_is_current_master(lessor_priv))) {
+	if (unlikely(!drm_is_current_master_locked(lessor_priv))) {
 		ret = -EACCES;
 		goto unlock;
 	}
-	lessor = drm_file_get_master(lessor_priv);
+	lessor = lessor_priv->master;
 	mutex_lock(&dev->mode_config.idr_mutex);
 
 	lessee = _drm_find_lessee(lessor, arg->lessee_id);
@@ -719,7 +718,6 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
 
 fail:
 	mutex_unlock(&dev->mode_config.idr_mutex);
-	drm_master_put(&lessor);
 
 unlock:
 	up_write(&dev->master_rwsem);
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index d12bb2ba7814..e2d49fe3e32d 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -227,16 +227,12 @@ struct drm_file {
 	 * @master:
 	 *
 	 * Master this node is currently associated with. Protected by struct
-	 * &drm_device.master_rwsem, and serialized by @master_lookup_lock.
+	 * &drm_device.master_rwsem.
 	 *
 	 * Only relevant if drm_is_primary_client() returns true. Note that
 	 * this only matches &drm_device.master if the master is the currently
 	 * active one.
 	 *
-	 * To update @master, both &drm_device.master_rwsem and
-	 * @master_lookup_lock need to be held, therefore holding either of
-	 * them is safe and enough for the read side.
-	 *
 	 * When dereferencing this pointer, either hold struct
 	 * &drm_device.master_rwsem for the duration of the pointer's use, or
 	 * use drm_file_get_master() if struct &drm_device.master_rwsem is not
@@ -248,9 +244,6 @@ struct drm_file {
 	 */
 	struct drm_master *master;
 
-	/** @master_lock: Serializes @master. */
-	spinlock_t master_lookup_lock;
-
 	/** @pid: Process that opened this file. */
 	struct pid *pid;
 
-- 
2.25.1

