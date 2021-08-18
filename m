Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EED3EFDF1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 09:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5576E461;
	Wed, 18 Aug 2021 07:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936CD6E461;
 Wed, 18 Aug 2021 07:40:59 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id n12so1277895plf.4;
 Wed, 18 Aug 2021 00:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QEHuccOxvqNtSxSgci59cP9jo3dJUSb2vZvhFR8kmBM=;
 b=kyrTRnECEHbET1U8ahqUBcDC2k+PuuaNd2ZFISYrMAgnQWFXBkgRULnxtJd3D4A0Qk
 sv6Dy6gL1tZXoZf95+l5ZqMuBedFp7tD2JJ9vpU9tJZmG80Ru6fRUUErQa00tQF7JXal
 q4nkcdIu7vZAVlo48jb1ep26SNhQpD49gwhKdP9DhDK71KDMigl0pXVj+xgph1iYTpCV
 GEdyfy7nD9jCd6cWDxnfHI1Pl3E996Z52giWcXylPXYNY8AzLtKn/qEwWl6u46KGiJ2f
 tXSdXtqI2+YMaHhJ9XwkIBJrMaTN/Tr85hDUyG0oe6NBmufq+MqHUnY8beTAAQ7dkVvb
 zMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QEHuccOxvqNtSxSgci59cP9jo3dJUSb2vZvhFR8kmBM=;
 b=KpS4gd/x26OSanW5TmWHFh8Kabvu7Bbtui7KWwdDkyHjscgozB4VbmLuxHrUTdSd8d
 dPV6q4yJl/1surYFeDEpCiOXtfndoN1EGwVzAzoCCuUtdByGXnpdBoHbWLuqbuANAda2
 86RjbyFrxeFUgDVmVNyn9AZLnLf8ibU8/r9TDpJU0mQgM7QFcLCV0X+YYYmOee6KAnXs
 e3+kv5taf0VLdrnWHJbK5//eD2F8JFmkmfQYaKlpMFV+K0cDaPew2u3uoc6qBOl5GwD7
 QrHIrg0xR8YKlbuh01FrqH6NSUrFUI46I+xkBI4aJfdcrqIMOxY73J4VZQVNBLNjC9xl
 9xmw==
X-Gm-Message-State: AOAM5310FWvncSkhHLNtMXwdo7JvYSyk2UgAXUxOF3zgjLgHQWBCk102
 54qe7MHw0Uce3r3roZ8Y0Yw=
X-Google-Smtp-Source: ABdhPJxoBfNvfFHKP3I6P1QO1863L8cr1aqR7zIgRwfSUR+ThNMh9rENh0OPTK/qPRiwQJIg/iQTmg==
X-Received: by 2002:a17:90a:bf85:: with SMTP id
 d5mr8198209pjs.210.1629272459270; 
 Wed, 18 Aug 2021 00:40:59 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id u3sm3886729pjr.2.2021.08.18.00.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 00:40:58 -0700 (PDT)
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
Subject: [PATCH v3 5/9] drm: protect magic_map,
 unique{_len} with master_lookup_lock
Date: Wed, 18 Aug 2021 15:38:20 +0800
Message-Id: <20210818073824.1560124-6-desmondcheongzx@gmail.com>
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

Currently, drm_device.master_mutex is used to serialize writes to the
drm_master.magic_map idr and to protect drm_master.unique{_len}.

In preparation for converting drm_device.master_mutex into an outer
rwsem that might be read locked before entering some of these
functions, we can instead serialize access to drm_master.magic_map and
drm_master.unique{_len} using drm_device.master_lookup_lock which is
an inner lock.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c  | 12 +++++++-----
 drivers/gpu/drm/drm_ioctl.c | 10 ++++++----
 include/drm/drm_auth.h      |  6 +++---
 include/drm/drm_device.h    |  7 ++++++-
 4 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index b7230604496b..0acb444fbbac 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -98,10 +98,10 @@ int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
 	struct drm_master *master;
 	int ret = 0;
 
-	mutex_lock(&dev->master_mutex);
+	spin_lock(&dev->master_lookup_lock);
 	master = file_priv->master;
 	if (!master) {
-		mutex_unlock(&dev->master_mutex);
+		spin_unlock(&dev->master_lookup_lock);
 		return -EINVAL;
 	}
 
@@ -112,7 +112,7 @@ int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
 			file_priv->magic = ret;
 	}
 	auth->magic = file_priv->magic;
-	mutex_unlock(&dev->master_mutex);
+	spin_unlock(&dev->master_lookup_lock);
 
 	DRM_DEBUG("%u\n", auth->magic);
 
@@ -127,13 +127,13 @@ int drm_authmagic(struct drm_device *dev, void *data,
 
 	DRM_DEBUG("%u\n", auth->magic);
 
-	mutex_lock(&dev->master_mutex);
+	spin_lock(&dev->master_lookup_lock);
 	file = idr_find(&file_priv->master->magic_map, auth->magic);
 	if (file) {
 		file->authenticated = 1;
 		idr_replace(&file_priv->master->magic_map, NULL, auth->magic);
 	}
-	mutex_unlock(&dev->master_mutex);
+	spin_unlock(&dev->master_lookup_lock);
 
 	return file ? 0 : -EINVAL;
 }
@@ -366,8 +366,10 @@ void drm_master_release(struct drm_file *file_priv)
 	if (!master)
 		goto unlock;
 
+	spin_lock(&dev->master_lookup_lock);
 	if (file_priv->magic)
 		idr_remove(&master->magic_map, file_priv->magic);
+	spin_unlock(&dev->master_lookup_lock);
 
 	if (!drm_is_current_master_locked(file_priv))
 		goto out;
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 4d029d3061d9..e5c3845b6e62 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -119,21 +119,21 @@ int drm_getunique(struct drm_device *dev, void *data,
 	struct drm_unique *u = data;
 	struct drm_master *master;
 
-	mutex_lock(&dev->master_mutex);
+	spin_lock(&dev->master_lookup_lock);
 	master = file_priv->master;
 	if (!master) {
-		mutex_unlock(&dev->master_mutex);
+		spin_unlock(&dev->master_lookup_lock);
 		return -EINVAL;
 	}
 
 	if (u->unique_len >= master->unique_len) {
 		if (copy_to_user(u->unique, master->unique, master->unique_len)) {
-			mutex_unlock(&dev->master_mutex);
+			spin_unlock(&dev->master_lookup_lock);
 			return -EFAULT;
 		}
 	}
 	u->unique_len = master->unique_len;
-	mutex_unlock(&dev->master_mutex);
+	spin_unlock(&dev->master_lookup_lock);
 
 	return 0;
 }
@@ -405,7 +405,9 @@ static int drm_setversion(struct drm_device *dev, void *data, struct drm_file *f
 			 * Version 1.1 includes tying of DRM to specific device
 			 * Version 1.4 has proper PCI domain support
 			 */
+			spin_lock(&dev->master_lookup_lock);
 			retcode = drm_set_busid(dev, file_priv);
+			spin_unlock(&dev->master_lookup_lock);
 			if (retcode)
 				goto done;
 		}
diff --git a/include/drm/drm_auth.h b/include/drm/drm_auth.h
index ba248ca8866f..f5be73153798 100644
--- a/include/drm/drm_auth.h
+++ b/include/drm/drm_auth.h
@@ -67,17 +67,17 @@ struct drm_master {
 	struct drm_device *dev;
 	/**
 	 * @unique: Unique identifier: e.g. busid. Protected by
-	 * &drm_device.master_mutex.
+	 * &drm_device.master_lookup_lock.
 	 */
 	char *unique;
 	/**
 	 * @unique_len: Length of unique field. Protected by
-	 * &drm_device.master_mutex.
+	 * &drm_device.master_lookup_lock.
 	 */
 	int unique_len;
 	/**
 	 * @magic_map: Map of used authentication tokens. Protected by
-	 * &drm_device.master_mutex.
+	 * &drm_device.master_lookup_lock.
 	 */
 	struct idr magic_map;
 	void *driver_priv;
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 506eb2784819..cf5d15aeb25f 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -152,7 +152,12 @@ struct drm_device {
 	 */
 	struct mutex master_mutex;
 
-	/** @master_lookup_lock: Serializes &drm_file.master. */
+	/**
+	 * @master_lookup_lock:
+	 *
+	 * Serializes &drm_file.master, &drm_master.magic_map,
+	 * &drm_master.unique, and &drm_master.unique_len.
+	 */
 	spinlock_t master_lookup_lock;
 
 	/**
-- 
2.25.1

