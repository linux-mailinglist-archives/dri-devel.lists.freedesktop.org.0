Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D103FC378
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 09:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8857A89E5F;
	Tue, 31 Aug 2021 07:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E7089E5F;
 Tue, 31 Aug 2021 07:25:56 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so1305157pjc.3; 
 Tue, 31 Aug 2021 00:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SrrV3clumIwMrnsDunPCSljyK6+I7diizgnIMV5VDGM=;
 b=D4Uczj5ScpNKrJc2Y6vF1YPgkC+QRmy1Lv0ltH1JckfUAHsuIJWIxJpkh2L8SsiJ64
 hjMuPVqUafy/ebyVLdcsvRAp5Qnreo8eWUBy5IDRrnG1/3+UTrVMheVSoWbi+roIQVj8
 yq2JpQPV/EEiCfdoyR5o3Oqe/ylclUPgep/W1bl2+fm9F3dkmfgRhmyUtmFTkhFFg+OC
 r+OWKESZFBqJPMGKZMAIb5N0Z5mpiZgZpv9r2vPUzT6r6dxeh11uDgksd8CtFLfjsBPA
 Egn31ZHbxhSnWGwI9JsDGWFMO2glYjsHi/m5JcIuTd6GdhRoUADTbsHv5QZaTrVXWZf7
 TeNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SrrV3clumIwMrnsDunPCSljyK6+I7diizgnIMV5VDGM=;
 b=GBgPsn6ukdcH6/LNITWExt7j9z8pto/vWdI2hKPKmFyHoQvOFUsr/ZK19Xf6p/6aJb
 kZ7ohGPQiQnLPIzHWHOdk1nDDe6lKDcQQ/zvfaQ3YcelJgy1MuR3ifDOzCpWzbDC4AGJ
 qXh3nkFA44guZdY4vZYzT2gwiMxJv66nu8WQFmmy4G3773PkJNYphLz7OseE60eeQ4Jv
 xo3LMP6MFh2XisFNc/68Y7EHZG2agy3z+h704y0yrw4t8qm7o7egirx0J1JII/MSYf2O
 NS0DwnK3qf5msMYukVrdREvkOSR4nyap4MqozbtT9au4HSmBwLQZ4sAfHTd5Uu/OYg/Q
 gpQA==
X-Gm-Message-State: AOAM530tLFxH2HlwKi8aTCuj2daV714MkeoocnUEFQgfqcyBDKpw3EN7
 OvTZ86SpO+AMsaP2eJNHcmo=
X-Google-Smtp-Source: ABdhPJx6BRnSMBYnfZwO2vU0ugdP71fbA/c8IXcsv4fhMgZvTRVKDTzBrOOTXreNdkilLdMY8+POLw==
X-Received: by 2002:a17:90a:cf81:: with SMTP id
 i1mr3731701pju.76.1630394755924; 
 Tue, 31 Aug 2021 00:25:55 -0700 (PDT)
Received: from sanitydock.wifi-cloud.jp ([210.160.217.69])
 by smtp.gmail.com with ESMTPSA id m11sm1720724pjn.2.2021.08.31.00.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 00:25:55 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v10 4/4] drm: avoid races with modesetting rights
Date: Tue, 31 Aug 2021 15:25:01 +0800
Message-Id: <20210831072501.184211-5-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831072501.184211-1-desmondcheongzx@gmail.com>
References: <20210831072501.184211-1-desmondcheongzx@gmail.com>
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
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_auth.c  |  4 ++++
 drivers/gpu/drm/drm_ioctl.c | 20 +++++++++++++++-----
 drivers/gpu/drm/drm_lease.c | 35 ++++++++++++++++++++++++-----------
 include/drm/drm_device.h    |  6 ++++++
 4 files changed, 49 insertions(+), 16 deletions(-)

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
index fe9c4c0264a9..f6a8aa6c53b3 100644
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
 
 #define DRM_CORE_IOCTL_COUNT	ARRAY_SIZE(drm_ioctls)
@@ -779,6 +784,9 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
 	if (locked_ioctl)
 		mutex_lock(&drm_global_mutex);
 
+	if (unlikely(flags & DRM_MASTER))
+		down_read(&dev->master_rwsem);
+
 	retcode = drm_ioctl_permit(flags, file_priv);
 	if (unlikely(retcode))
 		goto out;
@@ -786,6 +794,8 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
 	retcode = func(dev, kdata, file_priv);
 
 out:
+	if (unlikely(flags & DRM_MASTER))
+		up_read(&dev->master_rwsem);
 	if (locked_ioctl)
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
index 142fb2f6e74d..5504f9192408 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -151,6 +151,12 @@ struct drm_device {
 	 * Lock for &drm_device.master, &drm_file.was_master,
 	 * &drm_file.is_master, &drm_file.master, &drm_master.unique,
 	 * &drm_master.unique_len, and &drm_master.magic_map.
+	 *
+	 * Additionally, synchronizes access rights to exclusive resources like
+	 * modesetting access between multiple users. For example, users that
+	 * can change the modeset or display state must hold a read lock on
+	 * @master_rwsem, and users that change modesetting rights should hold
+	 * a write lock.
 	 */
 	struct rw_semaphore master_rwsem;
 
-- 
2.25.1

