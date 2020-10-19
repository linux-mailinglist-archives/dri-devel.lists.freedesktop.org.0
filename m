Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA79B292FCE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 22:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2026EA97;
	Mon, 19 Oct 2020 20:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983E56EA97;
 Mon, 19 Oct 2020 20:45:59 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id bf6so427158plb.4;
 Mon, 19 Oct 2020 13:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ogL3L1B6WLttRDyzqm7bV7L40gSAtYDvVkLUv7bCtLk=;
 b=Tjjx5ZaTnnHcPaL205Ne9ekuoxSlQfz9bfxobD4lnx3/SAZshZHoHNw+eDAMvawBcx
 sY/xrpzeHyk5rb/oxn1o7dw6NgPfz3XOPEyPcvZGpr4ezxgcBu0TQp4fu5mJxysWnA/g
 99RlUq054UDyH8W44Td8qY2+BTE8eXnL+eNNvr5aZwnVc1cjbOaNbsu9KlzrOZfdrn9T
 FEkcQUhPUHDHU39nrVKGRV/isuST97VKGzTnBikFq9vIY8e+Vrct2LHrlcsXNgtZZZr2
 gfFWd8z0PyFTWKl21eL7DtXhglSNDAsUKdf5Hg5IlzPIRegveKy/FlogndOzQyFKDLAR
 vjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ogL3L1B6WLttRDyzqm7bV7L40gSAtYDvVkLUv7bCtLk=;
 b=LjDFUjjPBG3mKb/aCbRQXL856gkEn4kqspU7pDssWyl4EeySfAaRJa31N9s0Emmqr8
 oMygnblRoOItgdSIkmo74RdvOzUoKVFoadhIAP4prPuGNAgURSg9xPpzLsyWF9slFAio
 /LXS8xw0ygRigTrPHTBvnKjFbfyfBh5HCD2WY+cVgOXzFensExyJsLzrYgTRKiDbP8fo
 G5RSQtAFKrfU/Vf32Ht+tckVrYDbc8qMGynBmb/NXznUCRXy/CPd83iYjXtreJd76+B9
 ckKPiJCZWM0OGNGwoM0p5i30AVQx4ihevj8gngAq3QFccPfpGc0v+voFxrTGQ3+XyEyT
 iQZQ==
X-Gm-Message-State: AOAM531jucc1uOhJBaqOSzodDBuMuhyuzliw3UHOCKKUQvedLWNN6AH9
 RsjgBiCkmTnWzF5yyC9CWuLGHOtDIfbhYg==
X-Google-Smtp-Source: ABdhPJzG0upDSr8hJ7y8DP2B2HubyUea7HwnultSaTU4b4YovLjSDU/NeeKjCNZMmXBif8wm9GX/0A==
X-Received: by 2002:a17:90b:608:: with SMTP id gb8mr1238936pjb.6.1603140358622; 
 Mon, 19 Oct 2020 13:45:58 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 j138sm635258pfd.19.2020.10.19.13.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 13:45:57 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 13/23] drm/msm: Add priv->mm_lock to protect
 active/inactive lists
Date: Mon, 19 Oct 2020 13:46:14 -0700
Message-Id: <20201019204636.139997-14-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
References: <20201019204636.139997-1-robdclark@gmail.com>
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
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Rather than relying on the big dev->struct_mutex hammer, introduce a
more specific lock for protecting the bo lists.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_debugfs.c      |  7 +++++++
 drivers/gpu/drm/msm/msm_drv.c          |  7 +++++++
 drivers/gpu/drm/msm/msm_drv.h          | 13 +++++++++++-
 drivers/gpu/drm/msm/msm_gem.c          | 28 +++++++++++++++-----------
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 12 +++++++++++
 drivers/gpu/drm/msm/msm_gpu.h          |  5 ++++-
 6 files changed, 58 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index ee2e270f464c..64afbed89821 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -112,6 +112,11 @@ static int msm_gem_show(struct drm_device *dev, struct seq_file *m)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gpu *gpu = priv->gpu;
+	int ret;
+
+	ret = mutex_lock_interruptible(&priv->mm_lock);
+	if (ret)
+		return ret;
 
 	if (gpu) {
 		seq_printf(m, "Active Objects (%s):\n", gpu->name);
@@ -121,6 +126,8 @@ static int msm_gem_show(struct drm_device *dev, struct seq_file *m)
 	seq_printf(m, "Inactive Objects:\n");
 	msm_gem_describe_objects(&priv->inactive_list, m);
 
+	mutex_unlock(&priv->mm_lock);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 70bc4bb69edc..15c41786d018 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -7,6 +7,7 @@
 
 #include <linux/dma-mapping.h>
 #include <linux/kthread.h>
+#include <linux/sched/mm.h>
 #include <linux/uaccess.h>
 #include <uapi/linux/sched/types.h>
 
@@ -468,6 +469,12 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
 	init_llist_head(&priv->free_list);
 
 	INIT_LIST_HEAD(&priv->inactive_list);
+	mutex_init(&priv->mm_lock);
+
+	/* Teach lockdep about lock ordering wrt. shrinker: */
+	fs_reclaim_acquire(GFP_KERNEL);
+	might_lock(&priv->mm_lock);
+	fs_reclaim_release(GFP_KERNEL);
 
 	drm_mode_config_init(ddev);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 713a0ae28125..7431d68ea102 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -174,8 +174,19 @@ struct msm_drm_private {
 	struct msm_rd_state *hangrd;   /* debugfs to dump hanging submits */
 	struct msm_perf_state *perf;
 
-	/* list of GEM objects: */
+	/*
+	 * List of inactive GEM objects.  Every bo is either in the inactive_list
+	 * or gpu->active_list (for the gpu it is active on[1])
+	 *
+	 * These lists are protected by mm_lock.  If struct_mutex is involved, it
+	 * should be aquired prior to mm_lock.  One should *not* hold mm_lock in
+	 * get_pages()/vmap()/etc paths, as they can trigger the shrinker.
+	 *
+	 * [1] if someone ever added support for the old 2d cores, there could be
+	 *     more than one gpu object
+	 */
 	struct list_head inactive_list;
+	struct mutex mm_lock;
 
 	/* worker for delayed free of objects: */
 	struct work_struct free_work;
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 3dcb2ef4740f..092ed152999e 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -768,13 +768,17 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
 void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
+	struct msm_drm_private *priv = obj->dev->dev_private;
+
+	might_sleep();
 	WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED);
 
 	if (!atomic_fetch_inc(&msm_obj->active_count)) {
+		mutex_lock(&priv->mm_lock);
 		msm_obj->gpu = gpu;
 		list_del_init(&msm_obj->mm_list);
 		list_add_tail(&msm_obj->mm_list, &gpu->active_list);
+		mutex_unlock(&priv->mm_lock);
 	}
 }
 
@@ -783,12 +787,14 @@ void msm_gem_active_put(struct drm_gem_object *obj)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_drm_private *priv = obj->dev->dev_private;
 
-	WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
+	might_sleep();
 
 	if (!atomic_dec_return(&msm_obj->active_count)) {
+		mutex_lock(&priv->mm_lock);
 		msm_obj->gpu = NULL;
 		list_del_init(&msm_obj->mm_list);
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
+		mutex_unlock(&priv->mm_lock);
 	}
 }
 
@@ -943,13 +949,16 @@ static void free_object(struct msm_gem_object *msm_obj)
 {
 	struct drm_gem_object *obj = &msm_obj->base;
 	struct drm_device *dev = obj->dev;
+	struct msm_drm_private *priv = dev->dev_private;
 
 	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
 
 	/* object should not be on active list: */
 	WARN_ON(is_active(msm_obj));
 
+	mutex_lock(&priv->mm_lock);
 	list_del(&msm_obj->mm_list);
+	mutex_unlock(&priv->mm_lock);
 
 	msm_gem_lock(obj);
 
@@ -1123,14 +1132,9 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 		mapping_set_gfp_mask(obj->filp->f_mapping, GFP_HIGHUSER);
 	}
 
-	if (struct_mutex_locked) {
-		WARN_ON(!mutex_is_locked(&dev->struct_mutex));
-		list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
-	} else {
-		mutex_lock(&dev->struct_mutex);
-		list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
-		mutex_unlock(&dev->struct_mutex);
-	}
+	mutex_lock(&priv->mm_lock);
+	list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
+	mutex_unlock(&priv->mm_lock);
 
 	return obj;
 
@@ -1198,9 +1202,9 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 
 	msm_gem_unlock(obj);
 
-	mutex_lock(&dev->struct_mutex);
+	mutex_lock(&priv->mm_lock);
 	list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
-	mutex_unlock(&dev->struct_mutex);
+	mutex_unlock(&priv->mm_lock);
 
 	return obj;
 
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 2dc0ffa925b4..6be073b8ca08 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -51,6 +51,8 @@ msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 	if (!msm_gem_shrinker_lock(dev, &unlock))
 		return 0;
 
+	mutex_lock(&priv->mm_lock);
+
 	list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
 		if (!msm_gem_trylock(&msm_obj->base))
 			continue;
@@ -59,6 +61,8 @@ msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 		msm_gem_unlock(&msm_obj->base);
 	}
 
+	mutex_unlock(&priv->mm_lock);
+
 	if (unlock)
 		mutex_unlock(&dev->struct_mutex);
 
@@ -78,6 +82,8 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 	if (!msm_gem_shrinker_lock(dev, &unlock))
 		return SHRINK_STOP;
 
+	mutex_lock(&priv->mm_lock);
+
 	list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
 		if (freed >= sc->nr_to_scan)
 			break;
@@ -90,6 +96,8 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 		msm_gem_unlock(&msm_obj->base);
 	}
 
+	mutex_unlock(&priv->mm_lock);
+
 	if (unlock)
 		mutex_unlock(&dev->struct_mutex);
 
@@ -112,6 +120,8 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 	if (!msm_gem_shrinker_lock(dev, &unlock))
 		return NOTIFY_DONE;
 
+	mutex_lock(&priv->mm_lock);
+
 	list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
 		if (!msm_gem_trylock(&msm_obj->base))
 			continue;
@@ -129,6 +139,8 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 			break;
 	}
 
+	mutex_unlock(&priv->mm_lock);
+
 	if (unlock)
 		mutex_unlock(&dev->struct_mutex);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 6c9e1fdc1a76..1806e87600c0 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -94,7 +94,10 @@ struct msm_gpu {
 	struct msm_ringbuffer *rb[MSM_GPU_MAX_RINGS];
 	int nr_rings;
 
-	/* list of GEM active objects: */
+	/*
+	 * List of GEM active objects on this gpu.  Protected by
+	 * msm_drm_private::mm_lock
+	 */
 	struct list_head active_list;
 
 	/* does gpu need hw_init? */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
