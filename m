Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E403EB316
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 11:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E366E593;
	Fri, 13 Aug 2021 09:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0517A6E591;
 Fri, 13 Aug 2021 09:02:35 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 m24-20020a17090a7f98b0290178b1a81700so15056937pjl.4; 
 Fri, 13 Aug 2021 02:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=04T+pSmf8Sc1mQDYIQthhL1P93R52OOw6AifKE+EAkU=;
 b=H//dlm5II/Chm2lrXCvkXza84rqMovUPwYmH5L3ACVOWeP9V6430fv/cDdzi0WrSX9
 yUkOpgLdgtmhVoHJUUCqRw5kYAVrxy5mEk0RnB/hJyNOL/xGDQEEHNgRTVj5B94Se4gD
 byN0e2F/Mxz/VZ0/O3mmpmZwNvPxr3OeCK7o5gfdZ68W1/siM13UXOLjUNQMkl/3sXMe
 XbbHVqp7LjmlF3yfewEdRDXrYc+8KEk2gmDdTD0/ZMZFmZX86CeRTCf1eNHOOaAsmWxk
 /b4M/Cf/DuMh8bu5Tffwz7gsRez/S3T2aiGiOVuwoQXz7or/y1NWy/L/PaFqV85JMfhg
 M/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=04T+pSmf8Sc1mQDYIQthhL1P93R52OOw6AifKE+EAkU=;
 b=SLArTVwpcXHK2dcrbvZk4en6A6S5qpSkxbIUZy2EkyB1hrwgrZOMOCSgEIQFdiWreg
 QweyW8trPeX/x2EK5qdVYxA0gEA0L0/Bivz+3rRHAzdnQkKAn04a5CzUTx81Kt7FDdnR
 2lEoqo14dy+UYj5+OPBWaqTmDYezUviqftvJGoVuGQ0yxfsXyGuXCJzvThNbSp8I/cTK
 +BcSdbTgPB6cQ9UeQ6ltMW+oiNQz/KKUP0k4r71omjYH01ETfBBIk1XWuISx2+85o3Hg
 xjDJtKSNWkshsOCmpjfYljLfGKeEXzVlEnNRfDUo2ukv3ot403NzuLxFMojB6/56AOU7
 8YNA==
X-Gm-Message-State: AOAM533v/8DO6dU+ZnvhU886QVHrPBmciW1QghSvjZojTOGB0BfrJOls
 1usg66IEaRdDzFwuD5cPQgU=
X-Google-Smtp-Source: ABdhPJx8YGtccGjlkoyeU0RMzV36aBwuXksPfsdxZXQ0fntiKGi0CNmVdkcru5SAlkgTxynACMrGMg==
X-Received: by 2002:a17:90a:428f:: with SMTP id
 p15mr1690234pjg.75.1628845355540; 
 Fri, 13 Aug 2021 02:02:35 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id 31sm1818428pgy.26.2021.08.13.02.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 02:02:35 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 intel-gfx@lists.freedesktop.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 1/2] drm: avoid races with modesetting rights
Date: Fri, 13 Aug 2021 16:54:49 +0800
Message-Id: <20210813085450.32494-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210813085450.32494-1-desmondcheongzx@gmail.com>
References: <20210813085450.32494-1-desmondcheongzx@gmail.com>
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

In drm_client_modeset.c and drm_fb_helper.c,
drm_master_internal_{acquire,release} are used to avoid races with DRM
userspace. These functions hold onto drm_device.master_mutex while
committing, and bail if there's already a master.

However, ioctls can still race between themselves. A
time-of-check-to-time-of-use error can occur if an ioctl that changes
the modeset has its rights revoked after it validates its permissions,
but before it completes.

There are three ioctls that can affect modesetting permissions:

- DROP_MASTER ioctl removes rights for a master and its leases

- REVOKE_LEASE ioctl revokes rights for a specific lease

- SET_MASTER ioctl sets the device master if the master role hasn't
been acquired yet

All these races can be avoided by introducing an SRCU that acts as a
barrier for ioctls that can change modesetting permissions. Processes
that perform modesetting should hold a read lock on the new
drm_device.master_barrier_srcu, and ioctls that change these
permissions should call synchronize_srcu before returning.

This ensures that any process that might have seen old permissions are
flushed out before DROP_MASTER/REVOKE_LEASE/SET_MASTER ioctls return
to userspace.

Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c           | 17 ++++++++++++++---
 drivers/gpu/drm/drm_client_modeset.c | 10 ++++++----
 drivers/gpu/drm/drm_drv.c            |  2 ++
 drivers/gpu/drm/drm_fb_helper.c      | 20 ++++++++++++--------
 drivers/gpu/drm/drm_internal.h       |  5 +++--
 drivers/gpu/drm/drm_ioctl.c          | 25 +++++++++++++++++++++----
 include/drm/drm_device.h             | 11 +++++++++++
 include/drm/drm_ioctl.h              |  7 +++++++
 8 files changed, 76 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 60a6b21474b1..004506608e76 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -29,6 +29,7 @@
  */
 
 #include <linux/slab.h>
+#include <linux/srcu.h>
 
 #include <drm/drm_auth.h>
 #include <drm/drm_drv.h>
@@ -448,21 +449,31 @@ void drm_master_put(struct drm_master **master)
 EXPORT_SYMBOL(drm_master_put);
 
 /* Used by drm_client and drm_fb_helper */
-bool drm_master_internal_acquire(struct drm_device *dev)
+bool drm_master_internal_acquire(struct drm_device *dev, int *idx)
 {
+	*idx = srcu_read_lock(&dev->master_barrier_srcu);
+
 	mutex_lock(&dev->master_mutex);
 	if (dev->master) {
 		mutex_unlock(&dev->master_mutex);
+		srcu_read_unlock(&dev->master_barrier_srcu, *idx);
 		return false;
 	}
+	mutex_unlock(&dev->master_mutex);
 
 	return true;
 }
 EXPORT_SYMBOL(drm_master_internal_acquire);
 
 /* Used by drm_client and drm_fb_helper */
-void drm_master_internal_release(struct drm_device *dev)
+void drm_master_internal_release(struct drm_device *dev, int idx)
 {
-	mutex_unlock(&dev->master_mutex);
+	srcu_read_unlock(&dev->master_barrier_srcu, idx);
 }
 EXPORT_SYMBOL(drm_master_internal_release);
+
+/* Used by drm_ioctl */
+void drm_master_flush(struct drm_device *dev)
+{
+	synchronize_srcu(&dev->master_barrier_srcu);
+}
diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index ced09c7c06f9..9885f36f71b7 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -1165,13 +1165,14 @@ int drm_client_modeset_commit(struct drm_client_dev *client)
 {
 	struct drm_device *dev = client->dev;
 	int ret;
+	int idx;
 
-	if (!drm_master_internal_acquire(dev))
+	if (!drm_master_internal_acquire(dev, &idx))
 		return -EBUSY;
 
 	ret = drm_client_modeset_commit_locked(client);
 
-	drm_master_internal_release(dev);
+	drm_master_internal_release(dev, idx);
 
 	return ret;
 }
@@ -1215,8 +1216,9 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode)
 {
 	struct drm_device *dev = client->dev;
 	int ret = 0;
+	int idx;
 
-	if (!drm_master_internal_acquire(dev))
+	if (!drm_master_internal_acquire(dev, &idx))
 		return -EBUSY;
 
 	mutex_lock(&client->modeset_mutex);
@@ -1226,7 +1228,7 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode)
 		drm_client_modeset_dpms_legacy(client, mode);
 	mutex_unlock(&client->modeset_mutex);
 
-	drm_master_internal_release(dev);
+	drm_master_internal_release(dev, idx);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 7a5097467ba5..c313f0674db3 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -574,6 +574,7 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
 	mutex_destroy(&dev->clientlist_mutex);
 	mutex_destroy(&dev->filelist_mutex);
 	mutex_destroy(&dev->struct_mutex);
+	cleanup_srcu_struct(&dev->master_barrier_srcu);
 	drm_legacy_destroy_members(dev);
 }
 
@@ -612,6 +613,7 @@ static int drm_dev_init(struct drm_device *dev,
 	mutex_init(&dev->filelist_mutex);
 	mutex_init(&dev->clientlist_mutex);
 	mutex_init(&dev->master_mutex);
+	init_srcu_struct(&dev->master_barrier_srcu);
 
 	ret = drmm_add_action(dev, drm_dev_init_release, NULL);
 	if (ret)
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 3ab078321045..0d594bc15f18 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1116,13 +1116,14 @@ int drm_fb_helper_setcmap(struct fb_cmap *cmap, struct fb_info *info)
 	struct drm_fb_helper *fb_helper = info->par;
 	struct drm_device *dev = fb_helper->dev;
 	int ret;
+	int idx;
 
 	if (oops_in_progress)
 		return -EBUSY;
 
 	mutex_lock(&fb_helper->lock);
 
-	if (!drm_master_internal_acquire(dev)) {
+	if (!drm_master_internal_acquire(dev, &idx)) {
 		ret = -EBUSY;
 		goto unlock;
 	}
@@ -1136,7 +1137,7 @@ int drm_fb_helper_setcmap(struct fb_cmap *cmap, struct fb_info *info)
 		ret = setcmap_legacy(cmap, info);
 	mutex_unlock(&fb_helper->client.modeset_mutex);
 
-	drm_master_internal_release(dev);
+	drm_master_internal_release(dev, idx);
 unlock:
 	mutex_unlock(&fb_helper->lock);
 
@@ -1160,9 +1161,10 @@ int drm_fb_helper_ioctl(struct fb_info *info, unsigned int cmd,
 	struct drm_device *dev = fb_helper->dev;
 	struct drm_crtc *crtc;
 	int ret = 0;
+	int idx;
 
 	mutex_lock(&fb_helper->lock);
-	if (!drm_master_internal_acquire(dev)) {
+	if (!drm_master_internal_acquire(dev, &idx)) {
 		ret = -EBUSY;
 		goto unlock;
 	}
@@ -1204,7 +1206,7 @@ int drm_fb_helper_ioctl(struct fb_info *info, unsigned int cmd,
 		ret = -ENOTTY;
 	}
 
-	drm_master_internal_release(dev);
+	drm_master_internal_release(dev, idx);
 unlock:
 	mutex_unlock(&fb_helper->lock);
 	return ret;
@@ -1474,12 +1476,13 @@ int drm_fb_helper_pan_display(struct fb_var_screeninfo *var,
 	struct drm_fb_helper *fb_helper = info->par;
 	struct drm_device *dev = fb_helper->dev;
 	int ret;
+	int idx;
 
 	if (oops_in_progress)
 		return -EBUSY;
 
 	mutex_lock(&fb_helper->lock);
-	if (!drm_master_internal_acquire(dev)) {
+	if (!drm_master_internal_acquire(dev, &idx)) {
 		ret = -EBUSY;
 		goto unlock;
 	}
@@ -1489,7 +1492,7 @@ int drm_fb_helper_pan_display(struct fb_var_screeninfo *var,
 	else
 		ret = pan_display_legacy(var, info);
 
-	drm_master_internal_release(dev);
+	drm_master_internal_release(dev, idx);
 unlock:
 	mutex_unlock(&fb_helper->lock);
 
@@ -1948,6 +1951,7 @@ EXPORT_SYMBOL(drm_fb_helper_initial_config);
 int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
 {
 	int err = 0;
+	int idx;
 
 	if (!drm_fbdev_emulation || !fb_helper)
 		return 0;
@@ -1959,13 +1963,13 @@ int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
 		return err;
 	}
 
-	if (!fb_helper->fb || !drm_master_internal_acquire(fb_helper->dev)) {
+	if (!fb_helper->fb || !drm_master_internal_acquire(fb_helper->dev, &idx)) {
 		fb_helper->delayed_hotplug = true;
 		mutex_unlock(&fb_helper->lock);
 		return err;
 	}
 
-	drm_master_internal_release(fb_helper->dev);
+	drm_master_internal_release(fb_helper->dev, idx);
 
 	drm_dbg_kms(fb_helper->dev, "\n");
 
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 17f3548c8ed2..578fd2769913 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -142,8 +142,9 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
 			 struct drm_file *file_priv);
 int drm_master_open(struct drm_file *file_priv);
 void drm_master_release(struct drm_file *file_priv);
-bool drm_master_internal_acquire(struct drm_device *dev);
-void drm_master_internal_release(struct drm_device *dev);
+bool drm_master_internal_acquire(struct drm_device *dev, int *idx);
+void drm_master_internal_release(struct drm_device *dev, int idx);
+void drm_master_flush(struct drm_device *dev);
 
 /* drm_sysfs.c */
 extern struct class *drm_class;
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index be4a52dc4d6f..eb4ec3fab7d1 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -600,8 +600,10 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
 	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_SET_SAREA_CTX, drm_legacy_setsareactx, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
 	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_GET_SAREA_CTX, drm_legacy_getsareactx, DRM_AUTH),
 
-	DRM_IOCTL_DEF(DRM_IOCTL_SET_MASTER, drm_setmaster_ioctl, 0),
-	DRM_IOCTL_DEF(DRM_IOCTL_DROP_MASTER, drm_dropmaster_ioctl, 0),
+	DRM_IOCTL_DEF(DRM_IOCTL_SET_MASTER, drm_setmaster_ioctl,
+		      DRM_MASTER_FLUSH),
+	DRM_IOCTL_DEF(DRM_IOCTL_DROP_MASTER, drm_dropmaster_ioctl,
+		      DRM_MASTER_FLUSH),
 
 	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_ADD_CTX, drm_legacy_addctx, DRM_AUTH|DRM_ROOT_ONLY),
 	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_RM_CTX, drm_legacy_rmctx, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
@@ -722,7 +724,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_LEASE, drm_mode_create_lease_ioctl, DRM_MASTER),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_LIST_LESSEES, drm_mode_list_lessees_ioctl, DRM_MASTER),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GET_LEASE, drm_mode_get_lease_ioctl, DRM_MASTER),
-	DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, drm_mode_revoke_lease_ioctl, DRM_MASTER),
+	DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, drm_mode_revoke_lease_ioctl,
+		      DRM_MASTER | DRM_MASTER_FLUSH),
 };
 
 #define DRM_CORE_IOCTL_COUNT	ARRAY_SIZE( drm_ioctls )
@@ -781,13 +784,17 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
 	struct drm_file *file_priv = file->private_data;
 	struct drm_device *dev = file_priv->minor->dev;
 	int retcode;
+	int idx;
 
 	if (drm_dev_is_unplugged(dev))
 		return -ENODEV;
 
+	if (unlikely(flags & DRM_MASTER))
+		idx = srcu_read_lock(&dev->master_barrier_srcu);
+
 	retcode = drm_ioctl_permit(flags, file_priv);
 	if (unlikely(retcode))
-		return retcode;
+		goto release_master;
 
 	/* Enforce sane locking for modern driver ioctls. */
 	if (likely(!drm_core_check_feature(dev, DRIVER_LEGACY)) ||
@@ -798,6 +805,16 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
 		retcode = func(dev, kdata, file_priv);
 		mutex_unlock(&drm_global_mutex);
 	}
+
+release_master:
+	if (unlikely(flags & DRM_MASTER))
+		srcu_read_unlock(&dev->master_barrier_srcu, idx);
+	/* After flushing, processes are guaranteed to see the new master/lease
+	 * permissions, and any process which might have seen the old
+	 * permissions is guaranteed to have finished.
+	 */
+	if (unlikely(flags & DRM_MASTER_FLUSH))
+		drm_master_flush(dev);
 	return retcode;
 }
 EXPORT_SYMBOL(drm_ioctl_kernel);
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 604b1d1b2d72..0ac5fdb375f8 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -111,6 +111,17 @@ struct drm_device {
 	 */
 	struct drm_master *master;
 
+	/**
+	 * @master_barrier_srcu:
+	 *
+	 * Used to synchronize modesetting rights between multiple users. Users
+	 * that can change the modeset or display state must hold an
+	 * srcu_read_lock() on @master_barrier_srcu, and ioctls that can change
+	 * modesetting rights should call synchronize_srcu() before returning
+	 * to userspace.
+	 */
+	struct srcu_struct master_barrier_srcu;
+
 	/**
 	 * @driver_features: per-device driver features
 	 *
diff --git a/include/drm/drm_ioctl.h b/include/drm/drm_ioctl.h
index afb27cb6a7bd..13a68cdcea36 100644
--- a/include/drm/drm_ioctl.h
+++ b/include/drm/drm_ioctl.h
@@ -130,6 +130,13 @@ enum drm_ioctl_flags {
 	 * not set DRM_AUTH because they do not require authentication.
 	 */
 	DRM_RENDER_ALLOW	= BIT(5),
+	/**
+	 * @DRM_MASTER_FLUSH:
+	 *
+	 * This must be set for any ioctl which can change the modesetting
+	 * permissions for DRM users.
+	 */
+	DRM_MASTER_FLUSH	= BIT(6),
 };
 
 /**
-- 
2.25.1

