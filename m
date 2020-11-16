Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E5C2B4DE1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65EB76EA19;
	Mon, 16 Nov 2020 17:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AEDF6EA14;
 Mon, 16 Nov 2020 17:47:08 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id d17so7240274plr.5;
 Mon, 16 Nov 2020 09:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nyc6Vw30SJLc6DlOelCN1vi010c5NzXSzO7wNfG6Ujs=;
 b=a3oTaveaAhPJXT91daEnbooRS6IbuXh/Yrt8X71y7ZR449MeLSThllKjnkoRpgB5xp
 bcK4XUQMwcLKwlOc7wjT5V0tGBrbfpItcIE/nf6Tlyf2OSZTjeGWPim8HOCm0ZX/HzYU
 PS5rz+VJxDZo3rtQD3xVwZf73emnBPFqmPoRTNvji/kevgdGG3eTZbo9q6NxP5DA2gFT
 rSb+kwmnkI4ALlxYDjgPnVE18TNPmSpckstWIih37NpCnt7zuHj/RzHBY1eyUQESPAg8
 hYqdJd0y3vLOoKq2NlOmyO0lI+h0MZ1ll1xsOiYt75C7nQFmpHOEanoHAnaLOvKLyYlo
 1UlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nyc6Vw30SJLc6DlOelCN1vi010c5NzXSzO7wNfG6Ujs=;
 b=B+C9X8+Lmpw6FoolLROskwdDP1wgGqOFGY6cYb6oitOmUrEnumafgMhVLWC6Up5/9y
 +t8qWqUFWb+ZYGu0lGzsvuegzFUfXgpEtpD1/vWlVeYZrAXUKsoOiOgStrAek4cLjxXw
 G8VQf1izTqMz/gon5JiUpriR5VSZOC5xpeh158h4FCJG+RNsYlLaJ4o64ZrG3jgtQBOn
 +J2XuFk6D6soIRr38w5iFMny/MjXOywGx8YYm3wwuNkYZUuMA5AuETyFh7I920IikACZ
 GG7qE1XzpDisAg/roecAPtiQo1CSI3quGTCstQa06LW98PHZd4e3Wk9STbs9uSyTy4ny
 GwDQ==
X-Gm-Message-State: AOAM533gZP9AUfN0IBprsl9ij9AvovzkqZn5X1qja0CGWFO4PvIAZm77
 W1rQlNB1MrEhcXUJXPbZ5TgGFmy1wIc=
X-Google-Smtp-Source: ABdhPJxLTAZIdhvdvXTvtkmIMdbrHi2BaUQDgIlBLeI1KlW8+jMil/iZuJzLG0R7g1xO/sFEqV5ITg==
X-Received: by 2002:a17:902:6b84:b029:d8:d13d:14e with SMTP id
 p4-20020a1709026b84b02900d8d13d014emr14345881plk.29.1605548827237; 
 Mon, 16 Nov 2020 09:47:07 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id y9sm24969pjn.24.2020.11.16.09.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:47:06 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/msm/shrinker: Only iterate dontneed objs
Date: Mon, 16 Nov 2020 09:48:51 -0800
Message-Id: <20201116174851.878426-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201116174851.878426-1-robdclark@gmail.com>
References: <20201116174851.878426-1-robdclark@gmail.com>
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

In situations where the GPU is mostly idle, all or nearly all buffer
objects will be in the inactive list.  But if the system is under memory
pressure (from something other than GPU), we could still get a lot of
shrinker calls.  Which results in traversing a list of thousands of objs
and in the end finding nothing to shrink.  Which isn't so efficient.

Instead split the inactive_list into two lists, one inactive objs which
are shrinkable, and a second one for those that are not.  This way we
can avoid traversing objs which we know are not shrinker candidates.

v2: Fix inverted logic think-o

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_debugfs.c      |  3 ++-
 drivers/gpu/drm/msm/msm_drv.c          |  3 ++-
 drivers/gpu/drm/msm/msm_drv.h          |  8 +++---
 drivers/gpu/drm/msm/msm_gem.c          | 34 ++++++++++++++++++++------
 drivers/gpu/drm/msm/msm_gem_shrinker.c |  7 +++---
 5 files changed, 40 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 64afbed89821..85ad0babc326 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -124,7 +124,8 @@ static int msm_gem_show(struct drm_device *dev, struct seq_file *m)
 	}
 
 	seq_printf(m, "Inactive Objects:\n");
-	msm_gem_describe_objects(&priv->inactive_list, m);
+	msm_gem_describe_objects(&priv->inactive_dontneed, m);
+	msm_gem_describe_objects(&priv->inactive_willneed, m);
 
 	mutex_unlock(&priv->mm_lock);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 4d808769e6ed..39a54f364aa8 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -465,7 +465,8 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
 
 	priv->wq = alloc_ordered_workqueue("msm", 0);
 
-	INIT_LIST_HEAD(&priv->inactive_list);
+	INIT_LIST_HEAD(&priv->inactive_willneed);
+	INIT_LIST_HEAD(&priv->inactive_dontneed);
 	mutex_init(&priv->mm_lock);
 
 	/* Teach lockdep about lock ordering wrt. shrinker: */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index f869ed67b5da..ed18c5bed10f 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -175,8 +175,9 @@ struct msm_drm_private {
 	struct msm_perf_state *perf;
 
 	/*
-	 * List of inactive GEM objects.  Every bo is either in the inactive_list
-	 * or gpu->active_list (for the gpu it is active on[1])
+	 * Lists of inactive GEM objects.  Every bo is either in one of the
+	 * inactive lists (depending on whether or not it is shrinkable) or
+	 * gpu->active_list (for the gpu it is active on[1])
 	 *
 	 * These lists are protected by mm_lock.  If struct_mutex is involved, it
 	 * should be aquired prior to mm_lock.  One should *not* hold mm_lock in
@@ -185,7 +186,8 @@ struct msm_drm_private {
 	 * [1] if someone ever added support for the old 2d cores, there could be
 	 *     more than one gpu object
 	 */
-	struct list_head inactive_list;
+	struct list_head inactive_willneed;  /* inactive + !shrinkable */
+	struct list_head inactive_dontneed;  /* inactive +  shrinkable */
 	struct mutex mm_lock;
 
 	struct workqueue_struct *wq;
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 2795288b0a95..318ccc2fae86 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -17,6 +17,7 @@
 #include "msm_gpu.h"
 #include "msm_mmu.h"
 
+static void update_inactive(struct msm_gem_object *msm_obj);
 
 static dma_addr_t physaddr(struct drm_gem_object *obj)
 {
@@ -678,6 +679,12 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
 
 	madv = msm_obj->madv;
 
+	/* If the obj is inactive, we might need to move it
+	 * between inactive lists
+	 */
+	if (msm_obj->active_count == 0)
+		update_inactive(msm_obj);
+
 	msm_gem_unlock(obj);
 
 	return (madv != __MSM_MADV_PURGED);
@@ -781,19 +788,31 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 void msm_gem_active_put(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_drm_private *priv = obj->dev->dev_private;
 
 	might_sleep();
 	WARN_ON(!msm_gem_is_locked(obj));
 
 	if (--msm_obj->active_count == 0) {
-		mutex_lock(&priv->mm_lock);
-		list_del_init(&msm_obj->mm_list);
-		list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
-		mutex_unlock(&priv->mm_lock);
+		update_inactive(msm_obj);
 	}
 }
 
+static void update_inactive(struct msm_gem_object *msm_obj)
+{
+	struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
+
+	mutex_lock(&priv->mm_lock);
+	WARN_ON(msm_obj->active_count != 0);
+
+	list_del_init(&msm_obj->mm_list);
+	if (msm_obj->madv == MSM_MADV_WILLNEED)
+		list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
+	else
+		list_add_tail(&msm_obj->mm_list, &priv->inactive_dontneed);
+
+	mutex_unlock(&priv->mm_lock);
+}
+
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
 {
 	bool write = !!(op & MSM_PREP_WRITE);
@@ -1099,7 +1118,8 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 	}
 
 	mutex_lock(&priv->mm_lock);
-	list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
+	/* Initially obj is idle, obj->madv == WILLNEED: */
+	list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
 	mutex_unlock(&priv->mm_lock);
 
 	return obj;
@@ -1169,7 +1189,7 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	msm_gem_unlock(obj);
 
 	mutex_lock(&priv->mm_lock);
-	list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
+	list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
 	mutex_unlock(&priv->mm_lock);
 
 	return obj;
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 9d51c1eb808d..81dfa57b6a0d 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -19,7 +19,7 @@ msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 
 	mutex_lock(&priv->mm_lock);
 
-	list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
+	list_for_each_entry(msm_obj, &priv->inactive_dontneed, mm_list) {
 		if (!msm_gem_trylock(&msm_obj->base))
 			continue;
 		if (is_purgeable(msm_obj))
@@ -42,7 +42,7 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 
 	mutex_lock(&priv->mm_lock);
 
-	list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
+	list_for_each_entry(msm_obj, &priv->inactive_dontneed, mm_list) {
 		if (freed >= sc->nr_to_scan)
 			break;
 		if (!msm_gem_trylock(&msm_obj->base))
@@ -96,7 +96,8 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 	struct msm_drm_private *priv =
 		container_of(nb, struct msm_drm_private, vmap_notifier);
 	struct list_head *mm_lists[] = {
-		&priv->inactive_list,
+		&priv->inactive_dontneed,
+		&priv->inactive_willneed,
 		priv->gpu ? &priv->gpu->active_list : NULL,
 		NULL,
 	};
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
