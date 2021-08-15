Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA533ECA01
	for <lists+dri-devel@lfdr.de>; Sun, 15 Aug 2021 17:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3301089CB8;
	Sun, 15 Aug 2021 15:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26F789CB8;
 Sun, 15 Aug 2021 15:39:33 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 om1-20020a17090b3a8100b0017941c44ce4so10202535pjb.3; 
 Sun, 15 Aug 2021 08:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RD4EKy+qg0AFJuVfiR8oMlwQQic3pIIax2rAsiuDu2c=;
 b=AHIh1UpJR6htVrN22abydF4FwG1tpPQy/arM6P6yMcyZ+ighYlTYVBL/f5yT5DureF
 s1fPzDl36Yzec7h5Ds+a96/SORsPEb2Zugy4oho4g3pMz22oLD+QTlAta/TaCFoODLZR
 GzbR2ltnglGdkpbUsKa/C1FzM4CZDhJcI6R/GjaoTjKRCpTGFonoQf39y0k5Yx353pnj
 dAq8PB0LV1rcVZ3Taor6ipNjGfwAW/OqvT1Ro2+WCcae9TSksUa0VdqVYGAUUMa2Pfjs
 uyNjzPbpsMOaNHT3/hnvJ6rRL4mQHWDfGvFdkBcVyPUuXVpZl6XF3Vf3/cVYMFW4YWJL
 gHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RD4EKy+qg0AFJuVfiR8oMlwQQic3pIIax2rAsiuDu2c=;
 b=LM67NKP8ULKvLDNpiJ75bKRNoYmu2lao4Xpfe/HN/MZmeUqOaPx3EQ/cJdSCHdIzR+
 +KAl7LwZbsykzA6Ze4MTJhybphTRM6oO93bMievnnhkj8A/HGqKTWh9/VCROTwMr0/3S
 zaOMVZXIGj+wNzKTdgBncGOLC0cWBruMfqWkIfQDOWS3baQk1btlrdmCGTTNhdOdrHDL
 R35+StLwB3+9m9gmJ8gvwuSvax+KXilCdwRq9ahx7a20MYX8OcSHAD9IRYKVHUQ2YYDY
 kUq1BNy1A5ytiHggYodsnDdtVTyFFHbEcW6xW0XOmNrqn+1QbtR1EInqiDHz73lxzGt4
 AQMA==
X-Gm-Message-State: AOAM532P0kv/c/+CmtRiMJPPwgFp5m/2eLplzeRtoztvTqcK1MW9Y5nD
 fIR10iSmw9+Y8KZcvgykS6M=
X-Google-Smtp-Source: ABdhPJwomJrsfXCPrvMFNkV36DECIPWZz4z1iN+Nxfzz9RzHNsf8uWkTFmmURm5YowCv8uWUsZfwrQ==
X-Received: by 2002:aa7:870e:0:b029:3c2:f599:b7fb with SMTP id
 b14-20020aa7870e0000b02903c2f599b7fbmr11981839pfo.71.1629041973236; 
 Sun, 15 Aug 2021 08:39:33 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id r8sm10024620pgp.30.2021.08.15.08.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Aug 2021 08:39:32 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v2] drm: avoid races with modesetting rights
Date: Sun, 15 Aug 2021 23:37:40 +0800
Message-Id: <20210815153740.195330-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
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

These races can be avoided by flushing all users that might have seen
old modesetting permissions before returning to userspace.

We do this using rwsem: users that perform modesetting should hold a
read lock on the new drm_device.master_rwsem, and users that change
these permissions should flush these readers before returning to
userspace.

Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---

Hi,

I opted to leave the drm_master_unlock_and_flush helper out of this
patch, but happy to add it in if it'd be useful. Imo, when comparing it
with a mutex_unlock followed by drm_master_flush, it didn't add clarity.
And since we don't always hold the drm_device.master_mutex before
flushing (such as in drm_mode_revoke_lease_ioctl), perhaps it's better
to stick with one method to flush readers with drm_master_flush.

v1 -> v2 (suggested by Daniel Vetter):
- Address an additional race when drm_open runs.
- Switch from SRCU to rwsem to synchronise readers and writers.
- Implement drm_master_flush with task_work so that flushes can be
queued to run before returning to userspace without creating a new
DRM_MASTER_FLUSH ioctl flag.

Best wishes,
Desmond

 drivers/gpu/drm/drm_auth.c  | 45 ++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/drm_drv.c   |  1 +
 drivers/gpu/drm/drm_ioctl.c |  9 +++++++-
 drivers/gpu/drm/drm_lease.c |  1 +
 include/drm/drm_auth.h      |  1 +
 include/drm/drm_device.h    | 18 +++++++++++++++
 6 files changed, 73 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 60a6b21474b1..175bc4d1e4b4 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -29,6 +29,7 @@
  */
 
 #include <linux/slab.h>
+#include <linux/task_work.h>
 
 #include <drm/drm_auth.h>
 #include <drm/drm_drv.h>
@@ -282,6 +283,7 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
 	drm_set_master(dev, file_priv, false);
 out_unlock:
 	mutex_unlock(&dev->master_mutex);
+	drm_master_flush(dev);
 	return ret;
 }
 
@@ -321,8 +323,10 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
 	}
 
 	drm_drop_master(dev, file_priv);
+
 out_unlock:
 	mutex_unlock(&dev->master_mutex);
+	drm_master_flush(dev);
 	return ret;
 }
 
@@ -344,6 +348,8 @@ int drm_master_open(struct drm_file *file_priv)
 	}
 	mutex_unlock(&dev->master_mutex);
 
+	drm_master_flush(dev);
+
 	return ret;
 }
 
@@ -450,11 +456,15 @@ EXPORT_SYMBOL(drm_master_put);
 /* Used by drm_client and drm_fb_helper */
 bool drm_master_internal_acquire(struct drm_device *dev)
 {
+	down_read(&dev->master_rwsem);
+
 	mutex_lock(&dev->master_mutex);
 	if (dev->master) {
 		mutex_unlock(&dev->master_mutex);
+		up_read(&dev->master_rwsem);
 		return false;
 	}
+	mutex_unlock(&dev->master_mutex);
 
 	return true;
 }
@@ -463,6 +473,39 @@ EXPORT_SYMBOL(drm_master_internal_acquire);
 /* Used by drm_client and drm_fb_helper */
 void drm_master_internal_release(struct drm_device *dev)
 {
-	mutex_unlock(&dev->master_mutex);
+	up_read(&dev->master_rwsem);
 }
 EXPORT_SYMBOL(drm_master_internal_release);
+
+/* After flushing, all readers that might have seen old master/lease
+ * permissions are guaranteed to have completed.
+ */
+void master_flush(struct callback_head *cb)
+{
+	struct drm_device *dev = container_of(cb, struct drm_device,
+					      master_flush_work);
+
+	down_write(&dev->master_rwsem);
+	up_write(&dev->master_rwsem);
+}
+
+/**
+ * drm_master_flush - queues work to flush readers of master/lease permissions
+ * before returning to userspace
+ * @dev: DRM device
+ *
+ * Queues up work to flush all readers of master/lease permissions. This work
+ * is run before this task returns to user mode. Calling this function when a
+ * task changes modesetting rights ensures that other processes that perform
+ * modesetting do not race with userspace.
+ */
+void drm_master_flush(struct drm_device *dev)
+{
+	init_task_work(&dev->master_flush_work, master_flush);
+	task_work_add(current, &dev->master_flush_work, TWA_RESUME);
+	/* If task_work_add fails, then the task is exiting. In this case, it
+	 * doesn't matter if master_flush is run, so we don't need an
+	 * alternative mechanism for flushing.
+	 */
+}
+EXPORT_SYMBOL(drm_master_flush);
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 7a5097467ba5..10f7e256f999 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -612,6 +612,7 @@ static int drm_dev_init(struct drm_device *dev,
 	mutex_init(&dev->filelist_mutex);
 	mutex_init(&dev->clientlist_mutex);
 	mutex_init(&dev->master_mutex);
+	init_rwsem(&dev->master_rwsem);
 
 	ret = drmm_add_action(dev, drm_dev_init_release, NULL);
 	if (ret)
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index be4a52dc4d6f..b6e05adecb42 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -785,9 +785,12 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
 	if (drm_dev_is_unplugged(dev))
 		return -ENODEV;
 
+	if (unlikely(flags & DRM_MASTER))
+		down_read(&dev->master_rwsem);
+
 	retcode = drm_ioctl_permit(flags, file_priv);
 	if (unlikely(retcode))
-		return retcode;
+		goto release_master;
 
 	/* Enforce sane locking for modern driver ioctls. */
 	if (likely(!drm_core_check_feature(dev, DRIVER_LEGACY)) ||
@@ -798,6 +801,10 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
 		retcode = func(dev, kdata, file_priv);
 		mutex_unlock(&drm_global_mutex);
 	}
+
+release_master:
+	if (unlikely(flags & DRM_MASTER))
+		up_read(&dev->master_rwsem);
 	return retcode;
 }
 EXPORT_SYMBOL(drm_ioctl_kernel);
diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index dee4f24a1808..983701198ffd 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -723,6 +723,7 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
 	}
 
 	_drm_lease_revoke(lessee);
+	drm_master_flush(dev);
 
 fail:
 	mutex_unlock(&dev->mode_config.idr_mutex);
diff --git a/include/drm/drm_auth.h b/include/drm/drm_auth.h
index ba248ca8866f..eda3672df6c3 100644
--- a/include/drm/drm_auth.h
+++ b/include/drm/drm_auth.h
@@ -155,6 +155,7 @@ struct drm_master *drm_master_get(struct drm_master *master);
 struct drm_master *drm_file_get_master(struct drm_file *file_priv);
 void drm_master_put(struct drm_master **master);
 bool drm_is_current_master(struct drm_file *fpriv);
+void drm_master_flush(struct drm_device *dev);
 
 struct drm_master *drm_master_create(struct drm_device *dev);
 
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 604b1d1b2d72..eeb58e164788 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -111,6 +111,24 @@ struct drm_device {
 	 */
 	struct drm_master *master;
 
+	/**
+	 * @master_rwsem:
+	 *
+	 * Synchronizes modesetting rights between multiple users. Users that
+	 * can change the modeset or display state must hold a read lock on
+	 * @master_rwsem, and users that change modesetting rights should flush
+	 * readers before returning to userspace using drm_master_flush().
+	 */
+	struct rw_semaphore master_rwsem;
+
+	/**
+	 * @master_flush_work:
+	 *
+	 * Callback structure used internally to queue work to flush readers of
+	 * master/lease permissions.
+	 */
+	struct callback_head master_flush_work;
+
 	/**
 	 * @driver_features: per-device driver features
 	 *
-- 
2.25.1

