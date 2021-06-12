Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEA03A4EF7
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jun 2021 14:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5536E155;
	Sat, 12 Jun 2021 12:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF49B6E155
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jun 2021 12:55:27 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 o10-20020a17090aac0ab029016e92770073so1587698pjq.5
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jun 2021 05:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nQJNvC0cAKTeg5SRFZGSagvT9lerRL50Fx94UG7pLiw=;
 b=qA0KKyEIbotJKL/dGlxzMFmRSmXmgsectB/fRJytpBmxe1OM4I3g/+2nKzAvaNrKRr
 OUNws/XNlXwbxZI4L/Qj7+YqsU7TStsEDNWGJG23zjA9syOUDktxhjia3BZ3mXoni/rk
 WUbwbKl72IVi56al8yTXbFvb0OdTNGuvLuvl5RlsZ0PYLFItku7JYkWSa61jv/ObxMlA
 vCWdV/6OjKxFvri1wuJNFMJYckDc0g9i5hJorhevgz0vmrZ6QgQrnWwM8pUXvSWizIxD
 OAO75qZ4ejR8BjEmHnIk1HGObqT1i/ZSBycxVFcKX6hWVZv0I0snmRFipOMEYoYbmAnP
 oYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nQJNvC0cAKTeg5SRFZGSagvT9lerRL50Fx94UG7pLiw=;
 b=GbFp5qdVkfgRIuaUFzSNpFbr6DMWWXuxp8MoQDOZsCGe2JKmz2G+m1kybUUWUcM9Er
 Y9S5CAQemQPk4GrCTC3k0r3d/K9eAS5H9UiHaou+YGt0QrPdb9Bb3AgCMBAfUadyRup2
 EHExWJEYfLkVNk07pGiCA1oeeEI1XjxoiNieRzh6FJaKY+3w5HsKb/bJu+PBTphhfezY
 EAP7TOCf2Vm5qmQ/ENQRagp7DwNuDlkfuUNhPFawnKbcMnRqgdYoW7Au403BvfyMD1/j
 4sDUO5dRkz7legmOOY27PFpOwYFRKtQ6BGmk1XzC4UIRzq/KRAwRmf+0ajwFb/FXCDlV
 zVCA==
X-Gm-Message-State: AOAM533OCk9+h2M/Hg8gxgh0RHt/FkbNuSWVJXkQUEFPOACV0KRmbIQ0
 uCBZKjeXrrZNtz7y//W0PYY=
X-Google-Smtp-Source: ABdhPJwLgN7avHMxCSmhwsRVblOyO//5Leb+8ljkJomsOW+4gH5DKdVtMX6h4dzK/8IwPU0S/CpwdA==
X-Received: by 2002:a17:902:c407:b029:106:302e:534 with SMTP id
 k7-20020a170902c407b0290106302e0534mr8296862plk.17.1623502527512; 
 Sat, 12 Jun 2021 05:55:27 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id c7sm8015498pgh.72.2021.06.12.05.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jun 2021 05:55:27 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 2/2] drm: Protect drm_master pointers in drm_lease.c
Date: Sat, 12 Jun 2021 20:54:26 +0800
Message-Id: <20210612125426.6451-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210612125426.6451-1-desmondcheongzx@gmail.com>
References: <20210612125426.6451-1-desmondcheongzx@gmail.com>
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 skhan@linuxfoundation.org, Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch ensures that the device's master mutex is acquired before
accessing pointers to struct drm_master that are subsequently
dereferenced. Without the mutex, the struct drm_master may be freed
concurrently by another process calling drm_setmaster_ioctl(). This
could then lead to use-after-free errors.

Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_lease.c | 58 +++++++++++++++++++++++++++----------
 1 file changed, 43 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index da4f085fc09e..f2422f1c4915 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -107,10 +107,16 @@ static bool _drm_has_leased(struct drm_master *master, int id)
  */
 bool _drm_lease_held(struct drm_file *file_priv, int id)
 {
+	bool ret;
+
 	if (!file_priv || !file_priv->master)
 		return true;
 
-	return _drm_lease_held_master(file_priv->master, id);
+	mutex_lock(&file_priv->master->dev->master_mutex);
+	ret = _drm_lease_held_master(file_priv->master, id);
+	mutex_unlock(&file_priv->master->dev->master_mutex);
+
+	return ret;
 }
 
 /**
@@ -132,10 +138,12 @@ bool drm_lease_held(struct drm_file *file_priv, int id)
 	if (!file_priv || !file_priv->master || !file_priv->master->lessor)
 		return true;
 
+	mutex_lock(&file_priv->master->dev->master_mutex);
 	master = file_priv->master;
 	mutex_lock(&master->dev->mode_config.idr_mutex);
 	ret = _drm_lease_held_master(master, id);
 	mutex_unlock(&master->dev->mode_config.idr_mutex);
+	mutex_unlock(&file_priv->master->dev->master_mutex);
 	return ret;
 }
 
@@ -158,6 +166,7 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
 	if (!file_priv || !file_priv->master || !file_priv->master->lessor)
 		return crtcs_in;
 
+	mutex_lock(&file_priv->master->dev->master_mutex);
 	master = file_priv->master;
 	dev = master->dev;
 
@@ -177,6 +186,7 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
 		count_in++;
 	}
 	mutex_unlock(&master->dev->mode_config.idr_mutex);
+	mutex_unlock(&file_priv->master->dev->master_mutex);
 	return crtcs_out;
 }
 
@@ -490,7 +500,7 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 	size_t object_count;
 	int ret = 0;
 	struct idr leases;
-	struct drm_master *lessor = lessor_priv->master;
+	struct drm_master *lessor;
 	struct drm_master *lessee = NULL;
 	struct file *lessee_file = NULL;
 	struct file *lessor_file = lessor_priv->filp;
@@ -502,12 +512,6 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
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
@@ -519,12 +523,23 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 		return -EINVAL;
 	}
 
+	mutex_lock(&dev->master_mutex);
+	lessor = lessor_priv->master;
+	/* Do not allow sub-leases */
+	if (lessor->lessor) {
+		DRM_DEBUG_LEASE("recursive leasing not allowed\n");
+		ret = -EINVAL;
+		goto unlock;
+	}
+
 	object_count = cl->object_count;
 
 	object_ids = memdup_user(u64_to_user_ptr(cl->object_ids),
 			array_size(object_count, sizeof(__u32)));
-	if (IS_ERR(object_ids))
-		return PTR_ERR(object_ids);
+	if (IS_ERR(object_ids)) {
+		ret = PTR_ERR(object_ids);
+		goto unlock;
+	}
 
 	idr_init(&leases);
 
@@ -535,14 +550,15 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 	if (ret) {
 		DRM_DEBUG_LEASE("lease object lookup failed: %i\n", ret);
 		idr_destroy(&leases);
-		return ret;
+		goto unlock;
 	}
 
 	/* Allocate a file descriptor for the lease */
 	fd = get_unused_fd_flags(cl->flags & (O_CLOEXEC | O_NONBLOCK));
 	if (fd < 0) {
 		idr_destroy(&leases);
-		return fd;
+		ret = fd;
+		goto unlock;
 	}
 
 	DRM_DEBUG_LEASE("Creating lease\n");
@@ -578,6 +594,7 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 	/* Hook up the fd */
 	fd_install(fd, lessee_file);
 
+	mutex_unlock(&dev->master_mutex);
 	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl succeeded\n");
 	return 0;
 
@@ -587,6 +604,8 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 out_leases:
 	put_unused_fd(fd);
 
+unlock:
+	mutex_unlock(&dev->master_mutex);
 	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl failed: %d\n", ret);
 	return ret;
 }
@@ -609,7 +628,7 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
 	struct drm_mode_list_lessees *arg = data;
 	__u32 __user *lessee_ids = (__u32 __user *) (uintptr_t) (arg->lessees_ptr);
 	__u32 count_lessees = arg->count_lessees;
-	struct drm_master *lessor = lessor_priv->master, *lessee;
+	struct drm_master *lessor, *lessee;
 	int count;
 	int ret = 0;
 
@@ -620,6 +639,8 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
+	mutex_lock(&dev->master_mutex);
+	lessor = lessor_priv->master;
 	DRM_DEBUG_LEASE("List lessees for %d\n", lessor->lessee_id);
 
 	mutex_lock(&dev->mode_config.idr_mutex);
@@ -643,6 +664,7 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
 		arg->count_lessees = count;
 
 	mutex_unlock(&dev->mode_config.idr_mutex);
+	mutex_unlock(&dev->master_mutex);
 
 	return ret;
 }
@@ -662,7 +684,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
 	struct drm_mode_get_lease *arg = data;
 	__u32 __user *object_ids = (__u32 __user *) (uintptr_t) (arg->objects_ptr);
 	__u32 count_objects = arg->count_objects;
-	struct drm_master *lessee = lessee_priv->master;
+	struct drm_master *lessee;
 	struct idr *object_idr;
 	int count;
 	void *entry;
@@ -678,8 +700,10 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
 
 	DRM_DEBUG_LEASE("get lease for %d\n", lessee->lessee_id);
 
+	mutex_lock(&dev->master_mutex);
 	mutex_lock(&dev->mode_config.idr_mutex);
 
+	lessee = lessee_priv->master;
 	if (lessee->lessor == NULL)
 		/* owner can use all objects */
 		object_idr = &lessee->dev->mode_config.object_idr;
@@ -703,6 +727,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
 		arg->count_objects = count;
 
 	mutex_unlock(&dev->mode_config.idr_mutex);
+	mutex_unlock(&dev->master_mutex);
 
 	return ret;
 }
@@ -721,7 +746,7 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
 				void *data, struct drm_file *lessor_priv)
 {
 	struct drm_mode_revoke_lease *arg = data;
-	struct drm_master *lessor = lessor_priv->master;
+	struct drm_master *lessor;
 	struct drm_master *lessee;
 	int ret = 0;
 
@@ -731,8 +756,10 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
+	mutex_lock(&dev->master_mutex);
 	mutex_lock(&dev->mode_config.idr_mutex);
 
+	lessor = lessor_priv->master;
 	lessee = _drm_find_lessee(lessor, arg->lessee_id);
 
 	/* No such lessee */
@@ -751,6 +778,7 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
 
 fail:
 	mutex_unlock(&dev->mode_config.idr_mutex);
+	mutex_unlock(&dev->master_mutex);
 
 	return ret;
 }
-- 
2.25.1

