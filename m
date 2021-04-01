Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 960B6350BD4
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 03:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FF16EC02;
	Thu,  1 Apr 2021 01:24:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F359B6EC04;
 Thu,  1 Apr 2021 01:24:01 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id f10so515942pgl.9;
 Wed, 31 Mar 2021 18:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fGfGkmhp22pkYTJRrIioz7GfrVDeWNxUW06coF93oF8=;
 b=pdz96AHrVN7q6ETrqryWB+k56bbPD/as5HNLsouY5TaZmlmJd5W3tN4cgfEOzW2A9X
 A0sVenhvChrs/zAfIQYRcCprcd7ZyC364OlLd9e7szhiyZj5ylXZTjDiDz0CHxYpEF31
 y6zTbvcQ8Kp9bEPTg9fj59g1KNnr8sf/BwOv5fMMvNSDS3oHvMm6XjRbLJfrgKShLflv
 HQXvJ+fqz+iuyU6NvF82EnzPG6BzOzLjBI28xsPBJ0+hr9EUonTcig/hYsGvWOHPf9+Y
 hgOhvOa7yvqDoOXAskScwwBgrC2x9IA0seGjCyWUTi9M1UNRq22wlycwWEzWgO65Mjkh
 OKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fGfGkmhp22pkYTJRrIioz7GfrVDeWNxUW06coF93oF8=;
 b=KsBytEdQZU4zNK1dHxDERxtXDW2JAOIPSB4FeZm4L+8W9y+288XCsX4IX6WcWS753U
 dX4UnHJ0Z7na5lFo5AZZEjsL/YKNH7ax1mkDJPVnpVkyasi+d4cxWXRhqEScdyOgG/Y0
 QGymWeKbUvz9KGrBVXYeF9A+HxNhSt1H+0hUclaW3cc3uKFbAV9eVFwkKDx+hrF4ozvy
 rg4I2/x4WYNuofMubEm1PZ3pMYvaaIAvqrlPynkxoN3HAB7VmZ1Nyu6QegVQyC9DY16P
 hDsiXF4fa/KhQ/Q2zFu9VPT2QZFoksHv3+RMsfjHHEP78/BKNv8PxLMqnk4vb0U9oq9n
 seRg==
X-Gm-Message-State: AOAM533BVgr+PGn9f6jEAeAj2Fi0luYqYKbwhEtYgzeJjlLNBj0PDENI
 VTqOz9Wl3AO/mwrBC/C5VxDVMis3IAfjAg==
X-Google-Smtp-Source: ABdhPJyHXwK1UELEHZNEotzQEmoUU1H/IwDmOuzn96iGF2W5gDZiflIyn82tcuTuJvlLpG0XR5dN+w==
X-Received: by 2002:a63:1a47:: with SMTP id a7mr5439216pgm.437.1617240241017; 
 Wed, 31 Mar 2021 18:24:01 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id r6sm3457170pgp.64.2021.03.31.18.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 18:23:59 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/msm: Fix debugfs deadlock
Date: Wed, 31 Mar 2021 18:27:20 -0700
Message-Id: <20210401012722.527712-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401012722.527712-1-robdclark@gmail.com>
References: <20210331221630.488498-1-robdclark@gmail.com>
 <20210401012722.527712-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "Kristian H. Kristensen" <hoegsberg@google.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In normal cases the gem obj lock is acquired first before mm_lock.  The
exception is iterating the various object lists.  In the shrinker path,
deadlock is avoided by using msm_gem_trylock() and skipping over objects
that cannot be locked.  But for debugfs the straightforward thing is to
split things out into a separate list of all objects protected by it's
own lock.

Fixes: d984457b31c4 ("drm/msm: Add priv->mm_lock to protect active/inactive lists")
Signed-off-by: Rob Clark <robdclark@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 14 +++-----------
 drivers/gpu/drm/msm/msm_drv.c     |  3 +++
 drivers/gpu/drm/msm/msm_drv.h     |  9 ++++++++-
 drivers/gpu/drm/msm/msm_gem.c     | 14 +++++++++++++-
 drivers/gpu/drm/msm/msm_gem.h     | 10 ++++++++--
 5 files changed, 35 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 85ad0babc326..d611cc8e54a4 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -111,23 +111,15 @@ static const struct file_operations msm_gpu_fops = {
 static int msm_gem_show(struct drm_device *dev, struct seq_file *m)
 {
 	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_gpu *gpu = priv->gpu;
 	int ret;
 
-	ret = mutex_lock_interruptible(&priv->mm_lock);
+	ret = mutex_lock_interruptible(&priv->obj_lock);
 	if (ret)
 		return ret;
 
-	if (gpu) {
-		seq_printf(m, "Active Objects (%s):\n", gpu->name);
-		msm_gem_describe_objects(&gpu->active_list, m);
-	}
-
-	seq_printf(m, "Inactive Objects:\n");
-	msm_gem_describe_objects(&priv->inactive_dontneed, m);
-	msm_gem_describe_objects(&priv->inactive_willneed, m);
+	msm_gem_describe_objects(&priv->objects, m);
 
-	mutex_unlock(&priv->mm_lock);
+	mutex_unlock(&priv->obj_lock);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 3462b0ea14c6..1ef1cd0cc714 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -474,6 +474,9 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 	priv->wq = alloc_ordered_workqueue("msm", 0);
 
+	INIT_LIST_HEAD(&priv->objects);
+	mutex_init(&priv->obj_lock);
+
 	INIT_LIST_HEAD(&priv->inactive_willneed);
 	INIT_LIST_HEAD(&priv->inactive_dontneed);
 	INIT_LIST_HEAD(&priv->inactive_purged);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 503168817e24..c84e6f84cb6d 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -174,7 +174,14 @@ struct msm_drm_private {
 	struct msm_rd_state *hangrd;   /* debugfs to dump hanging submits */
 	struct msm_perf_state *perf;
 
-	/*
+	/**
+	 * List of all GEM objects (mainly for debugfs, protected by obj_lock
+	 * (acquire before per GEM object lock)
+	 */
+	struct list_head objects;
+	struct mutex obj_lock;
+
+	/**
 	 * Lists of inactive GEM objects.  Every bo is either in one of the
 	 * inactive lists (depending on whether or not it is shrinkable) or
 	 * gpu->active_list (for the gpu it is active on[1])
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index bec01bb48fce..7ca30e362222 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -961,7 +961,7 @@ void msm_gem_describe_objects(struct list_head *list, struct seq_file *m)
 	size_t size = 0;
 
 	seq_puts(m, "   flags       id ref  offset   kaddr            size     madv      name\n");
-	list_for_each_entry(msm_obj, list, mm_list) {
+	list_for_each_entry(msm_obj, list, node) {
 		struct drm_gem_object *obj = &msm_obj->base;
 		seq_puts(m, "   ");
 		msm_gem_describe(obj, m);
@@ -980,6 +980,10 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 	struct drm_device *dev = obj->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 
+	mutex_lock(&priv->obj_lock);
+	list_del(&msm_obj->node);
+	mutex_unlock(&priv->obj_lock);
+
 	mutex_lock(&priv->mm_lock);
 	if (msm_obj->dontneed)
 		mark_unpurgable(msm_obj);
@@ -1170,6 +1174,10 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 	list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
 	mutex_unlock(&priv->mm_lock);
 
+	mutex_lock(&priv->obj_lock);
+	list_add_tail(&msm_obj->node, &priv->objects);
+	mutex_unlock(&priv->obj_lock);
+
 	return obj;
 
 fail:
@@ -1240,6 +1248,10 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
 	mutex_unlock(&priv->mm_lock);
 
+	mutex_lock(&priv->obj_lock);
+	list_add_tail(&msm_obj->node, &priv->objects);
+	mutex_unlock(&priv->obj_lock);
+
 	return obj;
 
 fail:
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 13aabfe92dac..e6b28edb1db9 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -60,10 +60,16 @@ struct msm_gem_object {
 	 */
 	uint8_t vmap_count;
 
+	/**
+	 * Node in list of all objects (mainly for debugfs, protected by
+	 * priv->obj_lock
+	 */
+	struct list_head node;
+
 	/**
 	 * An object is either:
-	 *  inactive - on priv->inactive_dontneed/willneed/purged depending
-	 *     on status
+	 *  inactive - on priv->inactive_dontneed or priv->inactive_willneed
+	 *     (depending on purgability status)
 	 *  active   - on one one of the gpu's active_list..  well, at
 	 *     least for now we don't have (I don't think) hw sync between
 	 *     2d and 3d one devices which have both, meaning we need to
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
