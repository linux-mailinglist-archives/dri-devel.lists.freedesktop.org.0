Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D683EFDF3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 09:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAABB6E466;
	Wed, 18 Aug 2021 07:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BE16E466;
 Wed, 18 Aug 2021 07:41:07 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id oa17so2096291pjb.1;
 Wed, 18 Aug 2021 00:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Td5IT84kD11FPUxNYUS6Oyl4lwC2ctkXHc9p/8Xg9M0=;
 b=MEqIpICkqrWAyx7fYo/wvj5ggF53ry4IYmm/FNnGY/0M/4tiPQEAIbOZVU/PA6rLVu
 J1BTvcitsqDd+lERsoIjUTHivRUqKO2XeHepBfvY5hzADApW9fbEH4EhIZWiQMNa7iPX
 YCI45PBkkWchVyOEvEEysnqRO5IeD6XG2B5vtYf/9T1HnBdXVtu/39VEI8ouc6acN9KX
 RWCHmtcCTmS0cXDaBRQjq55t5unFfsc0m+soSeu9E2q3JKthDNGcPsMhE+up+2TXmQWN
 NZY5uG2KK198NWwX4rMSPRRTDatqi+os+lYEVeVtDul0EZeMWVvpA2pkOS/0V9XuaR76
 9K5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Td5IT84kD11FPUxNYUS6Oyl4lwC2ctkXHc9p/8Xg9M0=;
 b=nISWdZIZFSvPjF7p5RZ1JApHilbIqE6WwtoeAz0rPOBMiX/9bxBMAE3fqFjw1lpGaS
 Abq3ZtwEYMpMTngzXUubjvv2rXjKSdpZBNwmOnlLYTb9Mf1eVNXWD/fpSrTOaocz3Jpq
 +N6PgD301b7pHDcZbyJGdxX8HfjMp2or7R3I/wbx+CO3SNWdARNXPzZqSEJ3zudubagD
 6sfKeAUFvKMqHvQCFVbt0YtN+3+56M5dizbfX+MsqWyLZEEm/39GreLQPvfuzlQiVExh
 MeUTMlAtkHDVde9jdsm4XVQIgq8NW4eZPbbQRb6FEkD0/A33tg4gsexL47D0V5Hj782C
 SKjw==
X-Gm-Message-State: AOAM530nSsa2M1wAeF6+hF1RqfNGJELkoQEDnS6yXc3H/tSP1U0J0ZX/
 NQ1o6HN7eP/25oqOd+FDo1I=
X-Google-Smtp-Source: ABdhPJyBwAf13yrWenzT9X+EmtsJ05MR9xoj0H0YyvgJFroZ3oeRMI8WhMuXfRjXhPjFyZvZf2GWfg==
X-Received: by 2002:a17:902:e0cb:b029:12d:2af1:37d0 with SMTP id
 e11-20020a170902e0cbb029012d2af137d0mr6284416pla.78.1629272467316; 
 Wed, 18 Aug 2021 00:41:07 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id u3sm3886729pjr.2.2021.08.18.00.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 00:41:06 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com, axboe@kernel.dk, oleg@redhat.com,
 tglx@linutronix.de, dvyukov@google.com, walter-zh.wu@mediatek.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v3 6/9] drm: convert drm_device.master_mutex into a rwsem
Date: Wed, 18 Aug 2021 15:38:21 +0800
Message-Id: <20210818073824.1560124-7-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
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

drm_device.master_mutex currently protects the following:
- drm_device.master
- drm_file.master
- drm_file.was_master
- drm_file.is_master

These attributes determine modesetting permissions for drm devices,
and there is a clear separation between functions that read or change
the permissions. Hence, convert master_mutex into a rwsem to enable
concurrent readers.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c    | 27 ++++++++++++++-------------
 drivers/gpu/drm/drm_debugfs.c |  4 ++--
 drivers/gpu/drm/drm_drv.c     |  3 +--
 drivers/gpu/drm/drm_ioctl.c   |  4 ++--
 include/drm/drm_device.h      | 11 +++++++----
 include/drm/drm_file.h        | 12 ++++++------
 6 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 0acb444fbbac..b65681ff42fc 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -64,7 +64,7 @@
 static bool drm_is_current_master_locked(struct drm_file *fpriv)
 {
 	lockdep_assert_once(lockdep_is_held(&fpriv->minor->dev->master_lookup_lock) ||
-			    lockdep_is_held(&fpriv->minor->dev->master_mutex));
+			    lockdep_is_held(&fpriv->minor->dev->master_rwsem));
 
 	return (fpriv->is_master && fpriv->master &&
 		drm_lease_owner(fpriv->master) == fpriv->minor->dev->master);
@@ -175,7 +175,7 @@ static int drm_new_set_master(struct drm_device *dev, struct drm_file *fpriv)
 	struct drm_master *old_master;
 	struct drm_master *new_master;
 
-	lockdep_assert_held_once(&dev->master_mutex);
+	lockdep_assert_held_once(&dev->master_rwsem);
 
 	WARN_ON(fpriv->is_master);
 	old_master = fpriv->master;
@@ -257,7 +257,7 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
 {
 	int ret;
 
-	mutex_lock(&dev->master_mutex);
+	down_write(&dev->master_rwsem);
 
 	ret = drm_master_check_perm(dev, file_priv);
 	if (ret)
@@ -289,7 +289,7 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
 
 	drm_set_master(dev, file_priv, false);
 out_unlock:
-	mutex_unlock(&dev->master_mutex);
+	up_write(&dev->master_rwsem);
 	return ret;
 }
 
@@ -306,7 +306,7 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
 {
 	int ret;
 
-	mutex_lock(&dev->master_mutex);
+	down_write(&dev->master_rwsem);
 
 	ret = drm_master_check_perm(dev, file_priv);
 	if (ret)
@@ -329,8 +329,9 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
 	}
 
 	drm_drop_master(dev, file_priv);
+
 out_unlock:
-	mutex_unlock(&dev->master_mutex);
+	up_write(&dev->master_rwsem);
 	return ret;
 }
 
@@ -342,7 +343,7 @@ int drm_master_open(struct drm_file *file_priv)
 	/* if there is no current master make this fd it, but do not create
 	 * any master object for render clients
 	 */
-	mutex_lock(&dev->master_mutex);
+	down_write(&dev->master_rwsem);
 	if (!dev->master) {
 		ret = drm_new_set_master(dev, file_priv);
 	} else {
@@ -350,7 +351,7 @@ int drm_master_open(struct drm_file *file_priv)
 		file_priv->master = drm_master_get(dev->master);
 		spin_unlock(&dev->master_lookup_lock);
 	}
-	mutex_unlock(&dev->master_mutex);
+	up_write(&dev->master_rwsem);
 
 	return ret;
 }
@@ -360,7 +361,7 @@ void drm_master_release(struct drm_file *file_priv)
 	struct drm_device *dev = file_priv->minor->dev;
 	struct drm_master *master;
 
-	mutex_lock(&dev->master_mutex);
+	down_write(&dev->master_rwsem);
 	master = file_priv->master;
 
 	if (!master)
@@ -393,7 +394,7 @@ void drm_master_release(struct drm_file *file_priv)
 		spin_unlock(&dev->master_lookup_lock);
 	}
 unlock:
-	mutex_unlock(&dev->master_mutex);
+	up_write(&dev->master_rwsem);
 }
 
 /**
@@ -468,9 +469,9 @@ EXPORT_SYMBOL(drm_master_put);
 /* Used by drm_client and drm_fb_helper */
 bool drm_master_internal_acquire(struct drm_device *dev)
 {
-	mutex_lock(&dev->master_mutex);
+	down_read(&dev->master_rwsem);
 	if (dev->master) {
-		mutex_unlock(&dev->master_mutex);
+		up_read(&dev->master_rwsem);
 		return false;
 	}
 
@@ -481,6 +482,6 @@ EXPORT_SYMBOL(drm_master_internal_acquire);
 /* Used by drm_client and drm_fb_helper */
 void drm_master_internal_release(struct drm_device *dev)
 {
-	mutex_unlock(&dev->master_mutex);
+	up_read(&dev->master_rwsem);
 }
 EXPORT_SYMBOL(drm_master_internal_release);
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index b0a826489488..b34c9c263188 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -55,7 +55,7 @@ static int drm_name_info(struct seq_file *m, void *data)
 	struct drm_device *dev = minor->dev;
 	struct drm_master *master;
 
-	mutex_lock(&dev->master_mutex);
+	down_read(&dev->master_rwsem);
 	master = dev->master;
 	seq_printf(m, "%s", dev->driver->name);
 	if (dev->dev)
@@ -65,7 +65,7 @@ static int drm_name_info(struct seq_file *m, void *data)
 	if (dev->unique)
 		seq_printf(m, " unique=%s", dev->unique);
 	seq_printf(m, "\n");
-	mutex_unlock(&dev->master_mutex);
+	up_read(&dev->master_rwsem);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 218c16f11c80..d61079ae6259 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -570,7 +570,6 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
 	/* Prevent use-after-free in drm_managed_release when debugging is
 	 * enabled. Slightly awkward, but can't really be helped. */
 	dev->dev = NULL;
-	mutex_destroy(&dev->master_mutex);
 	mutex_destroy(&dev->clientlist_mutex);
 	mutex_destroy(&dev->filelist_mutex);
 	mutex_destroy(&dev->struct_mutex);
@@ -611,7 +610,7 @@ static int drm_dev_init(struct drm_device *dev,
 	mutex_init(&dev->struct_mutex);
 	mutex_init(&dev->filelist_mutex);
 	mutex_init(&dev->clientlist_mutex);
-	mutex_init(&dev->master_mutex);
+	init_rwsem(&dev->master_rwsem);
 	spin_lock_init(&dev->master_lookup_lock);
 
 	ret = drmm_add_action(dev, drm_dev_init_release, NULL);
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index e5c3845b6e62..880fc565d599 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -390,7 +390,7 @@ static int drm_setversion(struct drm_device *dev, void *data, struct drm_file *f
 	struct drm_set_version *sv = data;
 	int if_version, retcode = 0;
 
-	mutex_lock(&dev->master_mutex);
+	down_read(&dev->master_rwsem);
 	if (sv->drm_di_major != -1) {
 		if (sv->drm_di_major != DRM_IF_MAJOR ||
 		    sv->drm_di_minor < 0 || sv->drm_di_minor > DRM_IF_MINOR) {
@@ -427,7 +427,7 @@ static int drm_setversion(struct drm_device *dev, void *data, struct drm_file *f
 	sv->drm_di_minor = DRM_IF_MINOR;
 	sv->drm_dd_major = dev->driver->major;
 	sv->drm_dd_minor = dev->driver->minor;
-	mutex_unlock(&dev->master_mutex);
+	up_read(&dev->master_rwsem);
 
 	return retcode;
 }
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index cf5d15aeb25f..f1ae4570a20a 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -107,7 +107,7 @@ struct drm_device {
 	 * @master:
 	 *
 	 * Currently active master for this device.
-	 * Protected by &master_mutex
+	 * Protected by &master_rwsem
 	 */
 	struct drm_master *master;
 
@@ -146,11 +146,14 @@ struct drm_device {
 	struct mutex struct_mutex;
 
 	/**
-	 * @master_mutex:
+	 * @master_rwsem:
 	 *
-	 * Lock for &drm_minor.master and &drm_file.is_master
+	 * Synchronizes modesetting rights between multiple users. Users that
+	 * can change the modeset or display state must hold a read lock on
+	 * @master_rwsem, and users that change modesetting rights should hold
+	 * a write lock.
 	 */
-	struct mutex master_mutex;
+	struct rw_semaphore master_rwsem;
 
 	/**
 	 * @master_lookup_lock:
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 0536e9612a46..ce213ac23c38 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -205,7 +205,7 @@ struct drm_file {
 	 * @was_master:
 	 *
 	 * This client has or had, master capability. Protected by struct
-	 * &drm_device.master_mutex.
+	 * &drm_device.master_rwsem.
 	 *
 	 * This is used to ensure that CAP_SYS_ADMIN is not enforced, if the
 	 * client is or was master in the past.
@@ -216,7 +216,7 @@ struct drm_file {
 	 * @is_master:
 	 *
 	 * This client is the creator of @master. Protected by struct
-	 * &drm_device.master_mutex.
+	 * &drm_device.master_rwsem.
 	 *
 	 * See also the :ref:`section on primary nodes and authentication
 	 * <drm_primary_node>`.
@@ -227,20 +227,20 @@ struct drm_file {
 	 * @master:
 	 *
 	 * Master this node is currently associated with. Protected by struct
-	 * &drm_device.master_mutex, and serialized by
+	 * &drm_device.master_rwsem, and serialized by
 	 * &drm_device.master_lookup_lock.
 	 *
 	 * Only relevant if drm_is_primary_client() returns true. Note that
 	 * this only matches &drm_device.master if the master is the currently
 	 * active one.
 	 *
-	 * To update @master, both &drm_device.master_mutex and
+	 * To update @master, both &drm_device.master_rwsem and
 	 * &drm_device.master_lookup_lock need to be held, therefore holding
 	 * either of them is safe and enough for the read side.
 	 *
 	 * When dereferencing this pointer, either hold struct
-	 * &drm_device.master_mutex for the duration of the pointer's use, or
-	 * use drm_file_get_master() if struct &drm_device.master_mutex is not
+	 * &drm_device.master_rwsem for the duration of the pointer's use, or
+	 * use drm_file_get_master() if struct &drm_device.master_rwsem is not
 	 * currently held and there is no other need to hold it. This prevents
 	 * @master from being freed during use.
 	 *
-- 
2.25.1

