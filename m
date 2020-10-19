Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A9D292FEC
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 22:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708286EAD0;
	Mon, 19 Oct 2020 20:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF8A6EAA8;
 Mon, 19 Oct 2020 20:46:22 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id 1so433782ple.2;
 Mon, 19 Oct 2020 13:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yl78H6FykXko61jjzuR6toYgoDz9Ij1D+rGGGstD6+I=;
 b=F5CqVaSem1fOWZA5kFYFpdHDdyUQH92ZzxvMdWgEeRr0j1hSLvi7REkQ2H1/SrRrrW
 KgeNr9xNNTBhK1rdaFEFdu2phRbBihVzFmNaDpYSs1no/enQRUezsEV4Oh4hUPkNqgDM
 R1uZgI37Tq3uXBU8V4PyWDy3kTpMmh/dj3sv5GkbDpFYNHetkcoXsEri7wURY/egO9iy
 678+fnyAGbFZ90kUqEcwWvfsh7VasPnESUrA4hZdiMZwe8qV2Go5KOPT6KRRCTtQ5R5U
 WJzgR8zQ+KeP8S1ve0vVwcXJ79OF4kYlsNGBmk3jY+YOB6eoreFSGqAKC+1HuGtEzBIM
 Q5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yl78H6FykXko61jjzuR6toYgoDz9Ij1D+rGGGstD6+I=;
 b=jdFdoPT99GyyFf0q3ysaTDXgDoAJzHo6VqjrAeUJ7ElAs1DjQJTVJmnrf9dLaz9dm+
 82+NaFgUjhsq+iCVhWa00l17s9OezwexvPxCXPu3U88OJX9U0rhwFP3SMqHLSzDDRHdt
 w3LrnqzRaHsh5IVYXwrXA76Q/77irMizWtMQx6xyAK870mFikh12lEayE4FCQOAnSo2w
 D7iTU4SwUVPjI/C2pOtHesQEjbJE3MT5YHmKLGul9ZUIe0UResuVkctPBLODmZG8b7hz
 1Te7Xh08X0wkCYSVin/Nb8v04CcWN7UQzM2FbMhUoEqR/gltBTry51q8SGl4+J9pDVTe
 w6Hw==
X-Gm-Message-State: AOAM530CRJUKPNIloHi5EPbct+Qd7MYgYZvbagG9KNX8Aj+QleVQsyyK
 /N/Wxnmqm8gJ1HZH11lbZNl+n8BfkpEASw==
X-Google-Smtp-Source: ABdhPJwo9Km9skGWUCMPtfCCtceQCR4T7n1x+Zh77CCB7Xk8unvv/syQMaCAKPt++G5LKzGMjPGRNQ==
X-Received: by 2002:a17:902:bf07:b029:d5:cdbc:cd8e with SMTP id
 bi7-20020a170902bf07b02900d5cdbccd8emr1687951plb.30.1603140381459; 
 Mon, 19 Oct 2020 13:46:21 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 f17sm615950pfq.141.2020.10.19.13.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 13:46:20 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 22/23] drm/msm: Drop struct_mutex in shrinker path
Date: Mon, 19 Oct 2020 13:46:23 -0700
Message-Id: <20201019204636.139997-23-robdclark@gmail.com>
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

Now that the inactive_list is protected by mm_lock, and everything
else on per-obj basis is protected by obj->lock, we no longer depend
on struct_mutex.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c          |  1 -
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 54 --------------------------
 2 files changed, 55 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index c39ba9030001..cf17c79d99ae 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -688,7 +688,6 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	struct drm_device *dev = obj->dev;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
-	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
 	WARN_ON(!is_purgeable(msm_obj));
 	WARN_ON(obj->import_attach);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 6be073b8ca08..6f4b1355725f 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -8,48 +8,13 @@
 #include "msm_gem.h"
 #include "msm_gpu_trace.h"
 
-static bool msm_gem_shrinker_lock(struct drm_device *dev, bool *unlock)
-{
-	/* NOTE: we are *closer* to being able to get rid of
-	 * mutex_trylock_recursive().. the msm_gem code itself does
-	 * not need struct_mutex, although codepaths that can trigger
-	 * shrinker are still called in code-paths that hold the
-	 * struct_mutex.
-	 *
-	 * Also, msm_obj->madv is protected by struct_mutex.
-	 *
-	 * The next step is probably split out a seperate lock for
-	 * protecting inactive_list, so that shrinker does not need
-	 * struct_mutex.
-	 */
-	switch (mutex_trylock_recursive(&dev->struct_mutex)) {
-	case MUTEX_TRYLOCK_FAILED:
-		return false;
-
-	case MUTEX_TRYLOCK_SUCCESS:
-		*unlock = true;
-		return true;
-
-	case MUTEX_TRYLOCK_RECURSIVE:
-		*unlock = false;
-		return true;
-	}
-
-	BUG();
-}
-
 static unsigned long
 msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 {
 	struct msm_drm_private *priv =
 		container_of(shrinker, struct msm_drm_private, shrinker);
-	struct drm_device *dev = priv->dev;
 	struct msm_gem_object *msm_obj;
 	unsigned long count = 0;
-	bool unlock;
-
-	if (!msm_gem_shrinker_lock(dev, &unlock))
-		return 0;
 
 	mutex_lock(&priv->mm_lock);
 
@@ -63,9 +28,6 @@ msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 
 	mutex_unlock(&priv->mm_lock);
 
-	if (unlock)
-		mutex_unlock(&dev->struct_mutex);
-
 	return count;
 }
 
@@ -74,13 +36,8 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 {
 	struct msm_drm_private *priv =
 		container_of(shrinker, struct msm_drm_private, shrinker);
-	struct drm_device *dev = priv->dev;
 	struct msm_gem_object *msm_obj;
 	unsigned long freed = 0;
-	bool unlock;
-
-	if (!msm_gem_shrinker_lock(dev, &unlock))
-		return SHRINK_STOP;
 
 	mutex_lock(&priv->mm_lock);
 
@@ -98,9 +55,6 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 
 	mutex_unlock(&priv->mm_lock);
 
-	if (unlock)
-		mutex_unlock(&dev->struct_mutex);
-
 	if (freed > 0)
 		trace_msm_gem_purge(freed << PAGE_SHIFT);
 
@@ -112,13 +66,8 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 {
 	struct msm_drm_private *priv =
 		container_of(nb, struct msm_drm_private, vmap_notifier);
-	struct drm_device *dev = priv->dev;
 	struct msm_gem_object *msm_obj;
 	unsigned unmapped = 0;
-	bool unlock;
-
-	if (!msm_gem_shrinker_lock(dev, &unlock))
-		return NOTIFY_DONE;
 
 	mutex_lock(&priv->mm_lock);
 
@@ -141,9 +90,6 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 
 	mutex_unlock(&priv->mm_lock);
 
-	if (unlock)
-		mutex_unlock(&dev->struct_mutex);
-
 	*(unsigned long *)ptr += unmapped;
 
 	if (unmapped > 0)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
