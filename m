Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D62B53F29D9
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 12:04:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70AE86EA59;
	Fri, 20 Aug 2021 10:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D929F6EA59;
 Fri, 20 Aug 2021 10:04:11 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id y11so8140711pfl.13;
 Fri, 20 Aug 2021 03:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IQlvBkbHoE6VjG5h7OnRKFlujqQZ6kkyKxuuF0W7QEM=;
 b=MLxHIq0VSG1qtC0F8Du3D90rFr3rqBAbOdvnSPuucm9s43ONOmxmeK71vc6WFnCT+7
 0g346ukLSWPCJDng7wmQaTZ6aaTw3oHvu/2OSyyUHeNjmh7LDb3aYX7KB9+4+DznFVlZ
 XINMDFLFhWkXUjSkJh9f6gl+IHJlSdjfY9UsdtiMeYoBmKJDr+YShygl3DRlmWGIvY70
 0N6f893Raw2wYYnfRohjTWcrcBlWv8BlK0gaFfF+W8cG51F6Y4BeyVo7C+Q7eU7ev0cx
 mltzTLaqZQmsjWtCBiWME/gvsN8858aHYocfdL7IkPXQ34SZ4SRBhbj+MHDZtqw3CcEE
 SI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IQlvBkbHoE6VjG5h7OnRKFlujqQZ6kkyKxuuF0W7QEM=;
 b=QxqytdRXo2ZPsReYLoM+882DYVuEUvw95DcR0epKLD+G3/nuio48c9ZAt8j+9X49pc
 aoRs2PaZzUSHO6B4l0TO7jtOqTj7zr6Pi+CMYbPqXO/yFuERg/GiO+OZIbczIdSRV4V3
 dmL22K9RXrhJ5+iggb66dsJCmuuD7IPM6HcibCWx5pbUYSxS4nfwYQfvQ2/RgVzxs4vU
 l3cR5oRve11XHNx8ql3MxSbFs09pnM9kNcwXQsxsQ84HfHDPOyYXimrPndf9ph7CYOWG
 nXOGeOwXSaYfof/5Efjg76BC4xOhKrQz+1cp/QKszUVNYj/2fGcBQT7rl1//eVSrfaox
 hgnQ==
X-Gm-Message-State: AOAM531BsUF4r6B0iAkEy4SYqXlLaCu2UHFvX1AhCH2MrMlMhVZOhmnH
 lRv554E8Dpur6WYztj3Mkj4=
X-Google-Smtp-Source: ABdhPJzoFSLgiUB5mNA7phjx+ZzoS34TLFcb1gd7a2LVW+j7asWrrp7u8tVK3VtvUxquuyaVzXzLqg==
X-Received: by 2002:a65:62d1:: with SMTP id m17mr18029421pgv.370.1629453851440; 
 Fri, 20 Aug 2021 03:04:11 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id i8sm6503876pfo.117.2021.08.20.03.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 03:04:11 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v4 5/5] drm: remove drm_file.master_lookup_lock
Date: Fri, 20 Aug 2021 18:02:51 +0800
Message-Id: <20210820100251.448346-6-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820100251.448346-1-desmondcheongzx@gmail.com>
References: <20210820100251.448346-1-desmondcheongzx@gmail.com>
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
the outermost lock, so embedding calls to drm_file_get_master in
various functions easily caused us to invert the lock hierarchy. For
example, we would invert the master_mutex --> mode_config.idr_mutex
hierarchy.

Following the conversion of master_mutex into a rwsem, and its use to
plug races with modesetting rights, we've untangled some lock
hierarchies and removed the need for using drm_file_get_master and the
unlocked version of drm_is_current_master in multiple places.

Hence, we can take this opportunity to clean up the locking design. To
do so, we rewrite drm_file_get_master and drm_is_current_master to use
master_rwsem, clean up their uses, fix remaining inversions (such as
with _drm_lease_held master grabbing master_rwsem while holding onto
mode_config.idr_mutex), then remove master_lookup_lock.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c        | 19 ++++++----------
 drivers/gpu/drm/drm_file.c        |  1 -
 drivers/gpu/drm/drm_internal.h    |  1 +
 drivers/gpu/drm/drm_ioctl.c       |  4 ++--
 drivers/gpu/drm/drm_lease.c       | 38 ++++++++-----------------------
 drivers/gpu/drm/drm_mode_object.c | 14 +++++++++---
 include/drm/drm_file.h            |  9 +-------
 include/drm/drm_lease.h           |  2 +-
 8 files changed, 32 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 65065f7e1499..ff720f67eacb 100644
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
 
@@ -410,13 +405,13 @@ struct drm_master *drm_file_get_master(struct drm_file *file_priv)
 {
 	struct drm_master *master = NULL;
 
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
index bed6f7636cbe..c515d40f32c0 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -85,7 +85,7 @@ _drm_find_lessee(struct drm_master *master, int lessee_id)
 	return idr_find(&drm_lease_owner(master)->lessee_idr, lessee_id);
 }
 
-static int _drm_lease_held_master(struct drm_master *master, int id)
+bool _drm_lease_held_master(struct drm_master *master, int id)
 {
 	lockdep_assert_held(&master->dev->mode_config.idr_mutex);
 	if (master->lessor)
@@ -105,24 +105,6 @@ static bool _drm_has_leased(struct drm_master *master, int id)
 	return false;
 }
 
-/* Called with idr_mutex held */
-bool _drm_lease_held(struct drm_file *file_priv, int id)
-{
-	bool ret;
-	struct drm_master *master;
-
-	if (!file_priv)
-		return true;
-
-	master = drm_file_get_master(file_priv);
-	if (!master)
-		return true;
-	ret = _drm_lease_held_master(master, id);
-	drm_master_put(&master);
-
-	return ret;
-}
-
 bool drm_lease_held(struct drm_file *file_priv, int id)
 {
 	struct drm_master *master;
@@ -507,12 +489,12 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
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
@@ -574,7 +556,6 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 	/* Hook up the fd */
 	fd_install(fd, lessee_file);
 
-	drm_master_put(&lessor);
 	up_read(&dev->master_rwsem);
 	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl succeeded\n");
 	return 0;
@@ -609,7 +590,8 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
-	lessor = drm_file_get_master(lessor_priv);
+	lockdep_assert_held_once(&dev->master_rwsem);
+	lessor = lessor_priv->master;
 	DRM_DEBUG_LEASE("List lessees for %d\n", lessor->lessee_id);
 
 	mutex_lock(&dev->mode_config.idr_mutex);
@@ -633,7 +615,6 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
 		arg->count_lessees = count;
 
 	mutex_unlock(&dev->mode_config.idr_mutex);
-	drm_master_put(&lessor);
 
 	return ret;
 }
@@ -659,7 +640,8 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
-	lessee = drm_file_get_master(lessee_priv);
+	lockdep_assert_held_once(&dev->master_rwsem);
+	lessee = lessee_priv->master;
 	DRM_DEBUG_LEASE("get lease for %d\n", lessee->lessee_id);
 
 	mutex_lock(&dev->mode_config.idr_mutex);
@@ -687,7 +669,6 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
 		arg->count_objects = count;
 
 	mutex_unlock(&dev->mode_config.idr_mutex);
-	drm_master_put(&lessee);
 
 	return ret;
 }
@@ -712,11 +693,11 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
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
@@ -737,7 +718,6 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
 
 fail:
 	mutex_unlock(&dev->mode_config.idr_mutex);
-	drm_master_put(&lessor);
 
 unlock:
 	up_write(&dev->master_rwsem);
diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index 86d9e907c0b2..f15b81ea347a 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -29,6 +29,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_mode_object.h>
 #include <drm/drm_print.h>
+#include <drm/drm_auth.h>
 
 #include "drm_crtc_internal.h"
 
@@ -138,6 +139,10 @@ struct drm_mode_object *__drm_mode_object_find(struct drm_device *dev,
 					       uint32_t id, uint32_t type)
 {
 	struct drm_mode_object *obj = NULL;
+	struct drm_master *master = NULL;
+
+	if (file_priv)
+		master = drm_file_get_master(file_priv);
 
 	mutex_lock(&dev->mode_config.idr_mutex);
 	obj = idr_find(&dev->mode_config.object_idr, id);
@@ -146,15 +151,18 @@ struct drm_mode_object *__drm_mode_object_find(struct drm_device *dev,
 	if (obj && obj->id != id)
 		obj = NULL;
 
-	if (obj && drm_mode_object_lease_required(obj->type) &&
-	    !_drm_lease_held(file_priv, obj->id))
-		obj = NULL;
+	if (obj && drm_mode_object_lease_required(obj->type)) {
+		if (master && !_drm_lease_held_master(master, obj->id))
+			obj = NULL;
+	}
 
 	if (obj && obj->free_cb) {
 		if (!kref_get_unless_zero(&obj->refcount))
 			obj = NULL;
 	}
 	mutex_unlock(&dev->mode_config.idr_mutex);
+	if (master)
+		drm_master_put(&master);
 
 	return obj;
 }
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
 
diff --git a/include/drm/drm_lease.h b/include/drm/drm_lease.h
index 5c9ef6a2aeae..a5e47c54bfc3 100644
--- a/include/drm/drm_lease.h
+++ b/include/drm/drm_lease.h
@@ -16,7 +16,7 @@ void drm_lease_destroy(struct drm_master *lessee);
 
 bool drm_lease_held(struct drm_file *file_priv, int id);
 
-bool _drm_lease_held(struct drm_file *file_priv, int id);
+bool _drm_lease_held_master(struct drm_master *master, int id);
 
 void drm_lease_revoke(struct drm_master *master);
 
-- 
2.25.1

