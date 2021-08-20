Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B77E53F29D4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 12:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83236EA56;
	Fri, 20 Aug 2021 10:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7B26EA56;
 Fri, 20 Aug 2021 10:03:56 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 oc2-20020a17090b1c0200b00179e56772d6so3545610pjb.4; 
 Fri, 20 Aug 2021 03:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rtuBBmsJ+FZGp2Lavog/mblfNKKX32jG6r2O7uMrLj0=;
 b=sqa2tZnV8yLWrY3QUJ+tPW62mHKJ9j4HfM4GM7obFJpnuU02Mi1eQhJTgQGwB26nXI
 +nz5FlHxdJ241WEjNAGo5ww489+7YnL67NAvz2DwO4OvBpmNULfGY2dcplrF/6b1B8gI
 uoATN4TnmdXTtrLnAm9X9JB2rBVrKV444mrWIy2r2wl+vqYNCXmYarF30jZIayU/P7uZ
 c6JsqaYwU3xr5jFh/4PMiX0WZB09Z0lOTvmXmn/XsPhbwPeenzxYGOKUa8GdqXIO9T/k
 ISCTXdtTIWCzLNUNUaIc3Zb1AXvuma/XPnX5+bnqvXKOJA3c9zdpDvIOFzU7jByPRM6I
 z3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rtuBBmsJ+FZGp2Lavog/mblfNKKX32jG6r2O7uMrLj0=;
 b=pTXtHeO3fZAIZBtlMXsZ/wYVpaquybUiypzv856Iz4vpaV6Dia+dpmsrUy13N8Opdg
 Z4RnPx2U7hU5UXaKC/5QwUbZIlupaDzsIO/S7JBqalHMhC4jeFjnVRaPGiQYJD8DdCcp
 lv6P2Y4d6bK83penNWo+XewnHdNQLSvVK0kWRaBx+ovPDNSPEa9+x23gyz8bT/rhp31D
 XZndhPN7OIu5UnioqY1/QmooPVSoE9Gp40VCgxoZ8a+NG9IYZnL4iK3iU4BqS5RHK/Vq
 L+AOJFK+h6OccFvNhcdMYnJ6IOrHo033WfJJbR0ITw0vc9aNQqsNfW560cMavVPI6hVD
 E5tw==
X-Gm-Message-State: AOAM531rXlSPTtNBBXZKCKT7fsa95fyAz3AS87cs+WlPjmsz/hP/lV5U
 +Ev3rgc+iYvM8LJ1JBaSHBgxhqo7T7POaYHXySY=
X-Google-Smtp-Source: ABdhPJw1XIqaOGNzutcRzZ3ynEUDwyBhmsMVQ5kHXJ6JNNF3jWQL3U6m21C95u+DLR9RCdJeGMVNmw==
X-Received: by 2002:a17:90a:ea87:: with SMTP id
 h7mr3840745pjz.198.1629453836357; 
 Fri, 20 Aug 2021 03:03:56 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id i8sm6503876pfo.117.2021.08.20.03.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 03:03:55 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v4 4/5] drm: avoid races with modesetting rights
Date: Fri, 20 Aug 2021 18:02:50 +0800
Message-Id: <20210820100251.448346-5-desmondcheongzx@gmail.com>
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

In drm_client_modeset.c and drm_fb_helper.c,
drm_master_internal_{acquire,release} are used to avoid races with DRM
userspace. These functions hold onto drm_device.master_rwsem while
committing, and bail if there's already a master.

However, there are other places where modesetting rights can race. A
time-of-check-to-time-of-use error can occur if an ioctl that changes
the modeset has its rights revoked after it validates its permissions,
but before it completes.

There are four places where modesetting permissions can change:

- DROP_MASTER ioctl removes rights for a master and its leases

- REVOKE_LEASE ioctl revokes rights for a specific lease

- SET_MASTER ioctl sets the device master if the master role hasn't
been acquired yet

- drm_open which can create a new master for a device if one does not
currently exist

These races can be avoided using drm_device.master_rwsem: users that
perform modesetting should hold a read lock on the new
drm_device.master_rwsem, and users that change these permissions
should hold a write lock.

To avoid deadlocks with master_rwsem, for ioctls that need to check
for modesetting permissions, but also need to hold a write lock on
master_rwsem to protect some other attribute (or recurses to some
function that holds a write lock, like drm_mode_create_lease_ioctl
which eventually calls drm_master_open), we remove the DRM_MASTER flag
and push the master_rwsem lock and permissions check into the ioctl.

Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c  |  4 ++++
 drivers/gpu/drm/drm_ioctl.c | 20 +++++++++++++++-----
 drivers/gpu/drm/drm_lease.c | 35 ++++++++++++++++++++++++-----------
 include/drm/drm_device.h    |  5 +++++
 4 files changed, 48 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 73ade0513ccb..65065f7e1499 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -120,6 +120,10 @@ int drm_authmagic(struct drm_device *dev, void *data,
 	DRM_DEBUG("%u\n", auth->magic);
 
 	down_write(&dev->master_rwsem);
+	if (unlikely(!drm_is_current_master(file_priv))) {
+		up_write(&dev->master_rwsem);
+		return -EACCES;
+	}
 	file = idr_find(&file_priv->master->magic_map, auth->magic);
 	if (file) {
 		file->authenticated = 1;
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 158629d88319..8bea39ffc5c0 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -386,6 +386,10 @@ static int drm_setversion(struct drm_device *dev, void *data, struct drm_file *f
 	int if_version, retcode = 0;
 
 	down_write(&dev->master_rwsem);
+	if (unlikely(!drm_is_current_master(file_priv))) {
+		retcode = -EACCES;
+		goto unlock;
+	}
 	if (sv->drm_di_major != -1) {
 		if (sv->drm_di_major != DRM_IF_MAJOR ||
 		    sv->drm_di_minor < 0 || sv->drm_di_minor > DRM_IF_MINOR) {
@@ -420,8 +424,9 @@ static int drm_setversion(struct drm_device *dev, void *data, struct drm_file *f
 	sv->drm_di_minor = DRM_IF_MINOR;
 	sv->drm_dd_major = dev->driver->major;
 	sv->drm_dd_minor = dev->driver->minor;
-	up_write(&dev->master_rwsem);
 
+unlock:
+	up_write(&dev->master_rwsem);
 	return retcode;
 }
 
@@ -574,12 +579,12 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
 	DRM_IOCTL_DEF(DRM_IOCTL_GET_STATS, drm_getstats, 0),
 	DRM_IOCTL_DEF(DRM_IOCTL_GET_CAP, drm_getcap, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF(DRM_IOCTL_SET_CLIENT_CAP, drm_setclientcap, 0),
-	DRM_IOCTL_DEF(DRM_IOCTL_SET_VERSION, drm_setversion, DRM_MASTER),
+	DRM_IOCTL_DEF(DRM_IOCTL_SET_VERSION, drm_setversion, 0),
 
 	DRM_IOCTL_DEF(DRM_IOCTL_SET_UNIQUE, drm_invalid_op, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
 	DRM_IOCTL_DEF(DRM_IOCTL_BLOCK, drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
 	DRM_IOCTL_DEF(DRM_IOCTL_UNBLOCK, drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-	DRM_IOCTL_DEF(DRM_IOCTL_AUTH_MAGIC, drm_authmagic, DRM_MASTER),
+	DRM_IOCTL_DEF(DRM_IOCTL_AUTH_MAGIC, drm_authmagic, 0),
 
 	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_ADD_MAP, drm_legacy_addmap_ioctl, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
 	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_RM_MAP, drm_legacy_rmmap_ioctl, DRM_AUTH),
@@ -706,10 +711,10 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
 		      DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF(DRM_IOCTL_CRTC_GET_SEQUENCE, drm_crtc_get_sequence_ioctl, 0),
 	DRM_IOCTL_DEF(DRM_IOCTL_CRTC_QUEUE_SEQUENCE, drm_crtc_queue_sequence_ioctl, 0),
-	DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_LEASE, drm_mode_create_lease_ioctl, DRM_MASTER),
+	DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_LEASE, drm_mode_create_lease_ioctl, 0),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_LIST_LESSEES, drm_mode_list_lessees_ioctl, DRM_MASTER),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GET_LEASE, drm_mode_get_lease_ioctl, DRM_MASTER),
-	DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, drm_mode_revoke_lease_ioctl, DRM_MASTER),
+	DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, drm_mode_revoke_lease_ioctl, 0),
 };
 
 #define DRM_CORE_IOCTL_COUNT	ARRAY_SIZE( drm_ioctls )
@@ -776,6 +781,9 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
 	if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)) && !(flags & DRM_UNLOCKED))
 		mutex_lock(&drm_global_mutex);
 
+	if (unlikely(flags & DRM_MASTER))
+		down_read(&dev->master_rwsem);
+
 	retcode = drm_ioctl_permit(flags, file_priv);
 	if (unlikely(retcode))
 		goto out;
@@ -783,6 +791,8 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
 	retcode = func(dev, kdata, file_priv);
 
 out:
+	if (unlikely(flags & DRM_MASTER))
+		up_read(&dev->master_rwsem);
 	if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)) && !(flags & DRM_UNLOCKED))
 		mutex_unlock(&drm_global_mutex);
 	return retcode;
diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index dee4f24a1808..bed6f7636cbe 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -500,6 +500,18 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 		return -EINVAL;
 	}
 
+	/* Clone the lessor file to create a new file for us */
+	DRM_DEBUG_LEASE("Allocating lease file\n");
+	lessee_file = file_clone_open(lessor_file);
+	if (IS_ERR(lessee_file))
+		return PTR_ERR(lessee_file);
+
+	down_read(&dev->master_rwsem);
+	if (unlikely(!drm_is_current_master(lessor_priv))) {
+		ret = -EACCES;
+		goto out_file;
+	}
+
 	lessor = drm_file_get_master(lessor_priv);
 	/* Do not allow sub-leases */
 	if (lessor->lessor) {
@@ -547,14 +559,6 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 		goto out_leases;
 	}
 
-	/* Clone the lessor file to create a new file for us */
-	DRM_DEBUG_LEASE("Allocating lease file\n");
-	lessee_file = file_clone_open(lessor_file);
-	if (IS_ERR(lessee_file)) {
-		ret = PTR_ERR(lessee_file);
-		goto out_lessee;
-	}
-
 	lessee_priv = lessee_file->private_data;
 	/* Change the file to a master one */
 	drm_master_put(&lessee_priv->master);
@@ -571,17 +575,19 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 	fd_install(fd, lessee_file);
 
 	drm_master_put(&lessor);
+	up_read(&dev->master_rwsem);
 	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl succeeded\n");
 	return 0;
 
-out_lessee:
-	drm_master_put(&lessee);
-
 out_leases:
 	put_unused_fd(fd);
 
 out_lessor:
 	drm_master_put(&lessor);
+
+out_file:
+	up_read(&dev->master_rwsem);
+	fput(lessee_file);
 	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl failed: %d\n", ret);
 	return ret;
 }
@@ -705,6 +711,11 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
+	down_write(&dev->master_rwsem);
+	if (unlikely(!drm_is_current_master(lessor_priv))) {
+		ret = -EACCES;
+		goto unlock;
+	}
 	lessor = drm_file_get_master(lessor_priv);
 	mutex_lock(&dev->mode_config.idr_mutex);
 
@@ -728,5 +739,7 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
 	mutex_unlock(&dev->mode_config.idr_mutex);
 	drm_master_put(&lessor);
 
+unlock:
+	up_write(&dev->master_rwsem);
 	return ret;
 }
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 142fb2f6e74d..7d32bb69e6db 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -151,6 +151,11 @@ struct drm_device {
 	 * Lock for &drm_device.master, &drm_file.was_master,
 	 * &drm_file.is_master, &drm_file.master, &drm_master.unique,
 	 * &drm_master.unique_len, and &drm_master.magic_map.
+	 *
+	 * Additionally, synchronizes modesetting rights between multiple users.
+	 * Users that can change the modeset or display state must hold a read
+	 * lock on @master_rwsem, and users that change modesetting rights
+	 * should hold a write lock.
 	 */
 	struct rw_semaphore master_rwsem;
 
-- 
2.25.1

