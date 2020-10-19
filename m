Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA98C292FE3
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 22:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2226EAA7;
	Mon, 19 Oct 2020 20:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BFE36EAA7;
 Mon, 19 Oct 2020 20:46:18 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id hk7so473387pjb.2;
 Mon, 19 Oct 2020 13:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H6+sBeRhptapBUb8S8VOKmxlxCqweD+FvkkgvD/zDmU=;
 b=gsfijITFoKDCthWkpijN4xeAaLrn564jSmYZFjpeBoiq47kQM7s0bwWLNhfoZyDGgk
 BQSUmpckTpA9dkkYZXQIiXMpa01LnEQepytwc0LLJDM9eVFVMcYidiWz4PFMYOyk/Br7
 UiPY7Wlb79+QE1Zyib9KIENCI3Xnn5AHM1g4+yfgtEfS9hJNb/9K/UcNyp2RmGhyP+s/
 zR/uAcZ5fHOsFiplUH3WLp1c1cB/i2xpT/W4FO/euSmQUEsSbD0fF1uhabV4Yr7qWL1W
 iZzVR5TMrTF3DANC+MyE0ZMqoJL22HVzb/yIkDI74glAXpQ94o0ZnENAn2ZRyLASV/8w
 XUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H6+sBeRhptapBUb8S8VOKmxlxCqweD+FvkkgvD/zDmU=;
 b=JPSnqCpC2rpqE8D8eA0lryTCkQcalN6jRyIPrtYcoA8/MCNfpALnGtO6BQgjJYljh+
 IJ8HZlS2uaFHYR6oCL/lzIPv30JDzq148UIA/XuUyBP2OMXr0mMS5NhlYDixs/FI0EqH
 mEOJXk52t7yk02rk6Qf/5hKaij05NuKBMAJ2NhlaFRJuiJ7JpuziuAxyeJidqD92zEe/
 hiSsQj1hYKeIJiO1a+G4y3kyU82z32AwyEV6JapfCGt5vybu0BvG850GJ3NUgjqfObA/
 CWIBvMh7L6TKBMIO3uk7xlWJaQH3jt1Ir3efJ3/tXXiKbByas9AHKrOIguUJ8FQ1soEk
 T55Q==
X-Gm-Message-State: AOAM530DA/18VSQS5NltpgF6Zw5oBk5vhuUehECq5dINEADzDsoHnEtU
 vKXcQ6bpSaDgqQDrbjsLMKOlJJ8dZWnmPw==
X-Google-Smtp-Source: ABdhPJx+azay6jZ0FALaNW1mfwsshSz1cP+yEKa0SIK5foZIwDG66VXP4R70dUW6zO59EYMv3auEAQ==
X-Received: by 2002:a17:902:d896:b029:d2:288e:bafc with SMTP id
 b22-20020a170902d896b02900d2288ebafcmr1737571plz.43.1603140377045; 
 Mon, 19 Oct 2020 13:46:17 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 m22sm591316pfk.214.2020.10.19.13.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 13:46:16 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 20/23] drm/msm: Remove msm_gem_free_work
Date: Mon, 19 Oct 2020 13:46:21 -0700
Message-Id: <20201019204636.139997-21-robdclark@gmail.com>
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

Now that we don't need struct_mutex in the free path, we can get rid of
the asynchronous free altogether.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c |  3 ---
 drivers/gpu/drm/msm/msm_drv.h |  5 -----
 drivers/gpu/drm/msm/msm_gem.c | 27 ---------------------------
 drivers/gpu/drm/msm/msm_gem.h |  1 -
 4 files changed, 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 15c41786d018..ebcd8e827363 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -465,9 +465,6 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
 
 	priv->wq = alloc_ordered_workqueue("msm", 0);
 
-	INIT_WORK(&priv->free_work, msm_gem_free_work);
-	init_llist_head(&priv->free_list);
-
 	INIT_LIST_HEAD(&priv->inactive_list);
 	mutex_init(&priv->mm_lock);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 7e6fb4af4964..5308e636a90c 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -188,10 +188,6 @@ struct msm_drm_private {
 	struct list_head inactive_list;
 	struct mutex mm_lock;
 
-	/* worker for delayed free of objects: */
-	struct work_struct free_work;
-	struct llist_head free_list;
-
 	struct workqueue_struct *wq;
 
 	unsigned int num_planes;
@@ -291,7 +287,6 @@ struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 		struct dma_buf_attachment *attach, struct sg_table *sg);
 int msm_gem_prime_pin(struct drm_gem_object *obj);
 void msm_gem_prime_unpin(struct drm_gem_object *obj);
-void msm_gem_free_work(struct work_struct *work);
 
 int msm_framebuffer_prepare(struct drm_framebuffer *fb,
 		struct msm_gem_address_space *aspace);
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index af1abddca78e..827c7397ed12 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -939,16 +939,6 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 	struct drm_device *dev = obj->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 
-	if (llist_add(&msm_obj->freed, &priv->free_list))
-		queue_work(priv->wq, &priv->free_work);
-}
-
-static void free_object(struct msm_gem_object *msm_obj)
-{
-	struct drm_gem_object *obj = &msm_obj->base;
-	struct drm_device *dev = obj->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-
 	/* object should not be on active list: */
 	WARN_ON(is_active(msm_obj));
 
@@ -981,23 +971,6 @@ static void free_object(struct msm_gem_object *msm_obj)
 	kfree(msm_obj);
 }
 
-void msm_gem_free_work(struct work_struct *work)
-{
-	struct msm_drm_private *priv =
-		container_of(work, struct msm_drm_private, free_work);
-	struct llist_node *freed;
-	struct msm_gem_object *msm_obj, *next;
-
-	while ((freed = llist_del_all(&priv->free_list))) {
-		llist_for_each_entry_safe(msm_obj, next,
-					  freed, freed)
-			free_object(msm_obj);
-
-		if (need_resched())
-			break;
-	}
-}
-
 /* convenience method to construct a GEM buffer object, and userspace handle */
 int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 		uint32_t size, uint32_t flags, uint32_t *handle,
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index f4e73c6f07bf..ffa2130ee97d 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -204,7 +204,6 @@ static inline bool is_vunmapable(struct msm_gem_object *msm_obj)
 
 void msm_gem_purge(struct drm_gem_object *obj);
 void msm_gem_vunmap(struct drm_gem_object *obj);
-void msm_gem_free_work(struct work_struct *work);
 
 /* Created per submit-ioctl, to track bo's and cmdstream bufs, etc,
  * associated with the cmdstream submission for synchronization (and
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
