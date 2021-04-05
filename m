Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2AA354620
	for <lists+dri-devel@lfdr.de>; Mon,  5 Apr 2021 19:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB79189E52;
	Mon,  5 Apr 2021 17:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E98589E52;
 Mon,  5 Apr 2021 17:42:08 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso6221145pjh.2; 
 Mon, 05 Apr 2021 10:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zBaXsiA2oySpJPeze7wcHI2Mi9Lcz4C4TmcNMn/xtO0=;
 b=uyJQWPueiEltFhEvEjzWwifN3QRFcQlsspa6NenC8r9nT5T9uoPwQEutg98y6hu+Uo
 VNI6dFxAqMx8SIXZ6NAqnVcIhuDEyUPv37+CRfOfbaE47cUV361W4q/f3NmtmdDGj6sz
 Q0SMFX1bZm8EqRpQpyvro7gXmVKQ5SvLKOSgTzrA7gXNUilf4NqydojM4RwOFIh6PpQM
 uOXX4Ftx836e/6eZdAzctmaQkkIZ4JpX7NmmPoCmBdz5l61oEuAOe+kKx6XV0uGZInJ9
 ZdKqXOi4Vo4n7y8RBl5meClP4yjZjg6S9BHjtAwourLAULV5pWz6wwR66La+ZJXRTQP7
 oLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zBaXsiA2oySpJPeze7wcHI2Mi9Lcz4C4TmcNMn/xtO0=;
 b=ONDnB8mIwmTiDQiKTdAihkDIKiw62fsTI/bP64R0XPuy/aBK2Igo8bQ8jESOwnm6Mo
 5MLwFs6fu1osTaQTajmnQP8djS4Z8UNXwNIooKZ99UBsIpwPq5e74LJV9jv1OFXJiGzA
 sL5oAse7RBByu5HR6Wj0QktCF53mRHO+o+GdWomhZpzQV8ctkpBhzo4l7Fvh4AXTA48Z
 QBa/NuCLsU8nUdwgd6C2iL9hfAKoNtjIXfdrxl53fnPDt25+HKWx/PBETmQMOSasF6rH
 JjlylAeMj5Uj6tmUpnSEaXEqke0axV7b6Cvg8jxv1EjTUfOlW5SWzM/lIOACpmjCzV5l
 3xpA==
X-Gm-Message-State: AOAM532oQ6keNMM0FTZGbLGLhrobsbnOkmZNWVAWzu8TKq9Hu1BKf2nw
 TsY7VlWBiB1d3dqSXdbQ58FYbbNABK14WA==
X-Google-Smtp-Source: ABdhPJwcR3M+lNIiugmaI3FIWyaKHmXcTa2wHQNoSe+k8kDZvIMsaKZHBNGk0/pKEKZomkqJaqRxsg==
X-Received: by 2002:a17:90a:b794:: with SMTP id
 m20mr255489pjr.152.1617644527380; 
 Mon, 05 Apr 2021 10:42:07 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 a144sm16268582pfd.200.2021.04.05.10.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 10:42:06 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/8] drm/msm: Reorganize msm_gem_shrinker_scan()
Date: Mon,  5 Apr 2021 10:45:25 -0700
Message-Id: <20210405174532.1441497-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405174532.1441497-1-robdclark@gmail.com>
References: <20210405174532.1441497-1-robdclark@gmail.com>
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
 open list <linux-kernel@vger.kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

So we don't have to duplicate the boilerplate for eviction.

This also lets us re-use the main scan loop for vmap shrinker.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 94 +++++++++++++-------------
 1 file changed, 46 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 33a49641ef30..38bf919f8508 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -17,21 +17,35 @@ msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 	return priv->shrinkable_count;
 }
 
+static bool
+purge(struct msm_gem_object *msm_obj)
+{
+	if (!is_purgeable(msm_obj))
+		return false;
+
+	/*
+	 * This will move the obj out of still_in_list to
+	 * the purged list
+	 */
+	msm_gem_purge(&msm_obj->base);
+
+	return true;
+}
+
 static unsigned long
-msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
+scan(struct msm_drm_private *priv, unsigned nr_to_scan, struct list_head *list,
+		bool (*shrink)(struct msm_gem_object *msm_obj))
 {
-	struct msm_drm_private *priv =
-		container_of(shrinker, struct msm_drm_private, shrinker);
+	unsigned freed = 0;
 	struct list_head still_in_list;
-	unsigned long freed = 0;
 
 	INIT_LIST_HEAD(&still_in_list);
 
 	mutex_lock(&priv->mm_lock);
 
-	while (freed < sc->nr_to_scan) {
+	while (freed < nr_to_scan) {
 		struct msm_gem_object *msm_obj = list_first_entry_or_null(
-				&priv->inactive_dontneed, typeof(*msm_obj), mm_list);
+				list, typeof(*msm_obj), mm_list);
 
 		if (!msm_obj)
 			break;
@@ -62,14 +76,9 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 		if (!msm_gem_trylock(&msm_obj->base))
 			goto tail;
 
-		if (is_purgeable(msm_obj)) {
-			/*
-			 * This will move the obj out of still_in_list to
-			 * the purged list
-			 */
-			msm_gem_purge(&msm_obj->base);
+		if (shrink(msm_obj))
 			freed += msm_obj->base.size >> PAGE_SHIFT;
-		}
+
 		msm_gem_unlock(&msm_obj->base);
 
 tail:
@@ -77,16 +86,25 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 		mutex_lock(&priv->mm_lock);
 	}
 
-	list_splice_tail(&still_in_list, &priv->inactive_dontneed);
+	list_splice_tail(&still_in_list, list);
 	mutex_unlock(&priv->mm_lock);
 
-	if (freed > 0) {
+	return freed;
+}
+
+static unsigned long
+msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
+{
+	struct msm_drm_private *priv =
+		container_of(shrinker, struct msm_drm_private, shrinker);
+	unsigned long freed;
+
+	freed = scan(priv, sc->nr_to_scan, &priv->inactive_dontneed, purge);
+
+	if (freed > 0)
 		trace_msm_gem_purge(freed << PAGE_SHIFT);
-	} else {
-		return SHRINK_STOP;
-	}
 
-	return freed;
+	return (freed > 0) ? freed : SHRINK_STOP;
 }
 
 /* since we don't know any better, lets bail after a few
@@ -95,29 +113,15 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
  */
 static const int vmap_shrink_limit = 15;
 
-static unsigned
-vmap_shrink(struct list_head *mm_list)
+static bool
+vmap_shrink(struct msm_gem_object *msm_obj)
 {
-	struct msm_gem_object *msm_obj;
-	unsigned unmapped = 0;
+	if (!is_vunmapable(msm_obj))
+		return false;
 
-	list_for_each_entry(msm_obj, mm_list, mm_list) {
-		/* Use trylock, because we cannot block on a obj that
-		 * might be trying to acquire mm_lock
-		 */
-		if (!msm_gem_trylock(&msm_obj->base))
-			continue;
-		if (is_vunmapable(msm_obj)) {
-			msm_gem_vunmap(&msm_obj->base);
-			unmapped++;
-		}
-		msm_gem_unlock(&msm_obj->base);
+	msm_gem_vunmap(&msm_obj->base);
 
-		if (++unmapped >= vmap_shrink_limit)
-			break;
-	}
-
-	return unmapped;
+	return true;
 }
 
 static int
@@ -133,17 +137,11 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 	};
 	unsigned idx, unmapped = 0;
 
-	mutex_lock(&priv->mm_lock);
-
-	for (idx = 0; mm_lists[idx]; idx++) {
-		unmapped += vmap_shrink(mm_lists[idx]);
-
-		if (unmapped >= vmap_shrink_limit)
-			break;
+	for (idx = 0; mm_lists[idx] && unmapped < vmap_shrink_limit; idx++) {
+		unmapped += scan(priv, vmap_shrink_limit - unmapped,
+				mm_lists[idx], vmap_shrink);
 	}
 
-	mutex_unlock(&priv->mm_lock);
-
 	*(unsigned long *)ptr += unmapped;
 
 	if (unmapped > 0)
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
