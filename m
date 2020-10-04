Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC801282D01
	for <lists+dri-devel@lfdr.de>; Sun,  4 Oct 2020 21:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4B889F0A;
	Sun,  4 Oct 2020 19:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84BED89F03;
 Sun,  4 Oct 2020 19:21:15 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id x16so4351469pgj.3;
 Sun, 04 Oct 2020 12:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KYSQFMpDpWuIvIHyRV7nPPvwBZW1+DAsFDfZZ6m9imY=;
 b=qRIlBOEuTfE5NzMn7o480jTfvwh+pcV3bOBLuGmghcQkPVPoqvuqMJ+EiOu0lESELv
 fau6Rpvndyavx+uZvDMeV3IzqirOtwEsvb8GWNH2bzJ2YXe6YPzUCUFO2JeiUqk+C6zI
 3ZB4Uc+m73tW/EzYxd/XGYldmFsBORbMHUenCqYF0nVvJ80BNtk6SCw3e1xF1IL3I560
 bBr6c+GuDm7Yn7fVy8U5Y0QctIbcOO0wbvFLbCWl8X5RwJsPDF0hs+agiJSUXIt6/s1v
 JJ8nJss2a6sFs0DkpmRIaWZEegaYP6zunXbd0oaYJix+OAeQO06H2Sh9LB1X4COSeUa/
 PRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KYSQFMpDpWuIvIHyRV7nPPvwBZW1+DAsFDfZZ6m9imY=;
 b=bwuJoLcc+XhuBXUeR07JglhOAoQaVybGiNYnlrZcVRCmeH1yGWU665JKQhNmSz2GKe
 R5beCT62hNW1aIQ7vdTMXApVDZRUF4LQp8OzfGjGPCMQM9/2Mk9Wsugprdq9j7bsXaut
 pYx4Y4OKIEHlJ55212rr4jYCJu3piyDtIfIEz0GrweBKAHto+BcDkWIPr+K1QN88vL1W
 ajkSxUd/EvQEGrgVZGK1tEs+SVsa5G6mfI9VwfxXcyN4/9O/ocjTG782ETV7YspgbWe8
 EJGo7Tvqt8fOKMbpRChB0ruC0Ap0sG2v+3ZTwBOPtfs6uFklkJ9H3E1dvHhaKHRRLTco
 rYaw==
X-Gm-Message-State: AOAM531SISnzAF635KPq9rp97Lyk7ztLbhpdzXpKlqrEARORJRu9pALR
 7cRMGn2wz7sYx7mlc71rH3awnAJ0eW959kBy
X-Google-Smtp-Source: ABdhPJxQmQbWPQJoDf+hHkXoXTmyy0giBgzDOiKG09Cvrj7sHeVN0u31JNZ0ZKo1uXlVf78tj90Q/A==
X-Received: by 2002:a05:6a00:1513:b029:142:2501:34de with SMTP id
 q19-20020a056a001513b0290142250134demr13102809pfu.55.1601839274467; 
 Sun, 04 Oct 2020 12:21:14 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 x22sm7300178pfp.181.2020.10.04.12.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 12:21:13 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/14] drm/msm: Add priv->mm_lock to protect active/inactive
 lists
Date: Sun,  4 Oct 2020 12:21:36 -0700
Message-Id: <20201004192152.3298573-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004192152.3298573-1-robdclark@gmail.com>
References: <20201004192152.3298573-1-robdclark@gmail.com>
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
---
 drivers/gpu/drm/msm/msm_debugfs.c      |  7 +++++++
 drivers/gpu/drm/msm/msm_drv.c          |  1 +
 drivers/gpu/drm/msm/msm_drv.h          | 13 +++++++++++-
 drivers/gpu/drm/msm/msm_gem.c          | 28 +++++++++++++++-----------
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 12 +++++++++++
 drivers/gpu/drm/msm/msm_gpu.h          |  5 ++++-
 6 files changed, 52 insertions(+), 14 deletions(-)

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
index 49685571dc0e..dc6efc089285 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -441,6 +441,7 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
 	init_llist_head(&priv->free_list);
 
 	INIT_LIST_HEAD(&priv->inactive_list);
+	mutex_init(&priv->mm_lock);
 
 	drm_mode_config_init(ddev);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index b9dd8f8f4887..50978e5db376 100644
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
index a870b3ad129d..b04ed8b52f9d 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -746,13 +746,17 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
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
 
@@ -761,12 +765,14 @@ void msm_gem_active_put(struct drm_gem_object *obj)
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
 
@@ -921,13 +927,16 @@ static void free_object(struct msm_gem_object *msm_obj)
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
 
 	mutex_lock(&msm_obj->lock);
 
@@ -1103,14 +1112,9 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
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
 
@@ -1178,9 +1182,9 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 
 	mutex_unlock(&msm_obj->lock);
 
-	mutex_lock(&dev->struct_mutex);
+	mutex_lock(&priv->mm_lock);
 	list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
-	mutex_unlock(&dev->struct_mutex);
+	mutex_unlock(&priv->mm_lock);
 
 	return obj;
 
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 482576d7a39a..c41b84a3a484 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -51,11 +51,15 @@ msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 	if (!msm_gem_shrinker_lock(dev, &unlock))
 		return 0;
 
+	mutex_lock(&priv->mm_lock);
+
 	list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
 		if (is_purgeable(msm_obj))
 			count += msm_obj->base.size >> PAGE_SHIFT;
 	}
 
+	mutex_unlock(&priv->mm_lock);
+
 	if (unlock)
 		mutex_unlock(&dev->struct_mutex);
 
@@ -75,6 +79,8 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 	if (!msm_gem_shrinker_lock(dev, &unlock))
 		return SHRINK_STOP;
 
+	mutex_lock(&priv->mm_lock);
+
 	list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
 		if (freed >= sc->nr_to_scan)
 			break;
@@ -84,6 +90,8 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 		}
 	}
 
+	mutex_unlock(&priv->mm_lock);
+
 	if (unlock)
 		mutex_unlock(&dev->struct_mutex);
 
@@ -106,6 +114,8 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 	if (!msm_gem_shrinker_lock(dev, &unlock))
 		return NOTIFY_DONE;
 
+	mutex_lock(&priv->mm_lock);
+
 	list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
 		if (is_vunmapable(msm_obj)) {
 			msm_gem_vunmap(&msm_obj->base, OBJ_LOCK_SHRINKER);
@@ -118,6 +128,8 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 		}
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
