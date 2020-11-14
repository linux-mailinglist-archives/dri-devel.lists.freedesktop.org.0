Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C61F62B3029
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 20:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F066E953;
	Sat, 14 Nov 2020 19:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A646E953;
 Sat, 14 Nov 2020 19:28:34 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id q10so10146984pfn.0;
 Sat, 14 Nov 2020 11:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CjOmYSFFYsasYX9Sq8MuBrH7p/CFaq4+YCq5TRyIrqw=;
 b=qTrp/L0r7cSYg6nAdz7tU34ktyvrLgWsW2SE+YBAtmUwyV0JywqFQjiWNXtg5IrVS5
 btrrG/lLaqrPeMS236r5oyMKtkOl+OERxtctWe3b5eLsjKDf468UKvgiIGG1VfE96ZVR
 5rhiPmTd4I7ZuCr9bDxfhAzbHh9GQOJ7hTluyMB/XXk1NeHw0ltyvhWaQwBHvAnlqjta
 GZcw5uywbJDz8FAI6KZyaN3sNWaecBYFNhoW1ZN0NbI56Ck3dbCzIZbamxmqmUAN8Dcw
 +nsGlU9cOKjL7GeAhhoCmbIG8Xmoh81j7I6BT58FEWGm2rnJWTCJilSDDhnm4mhI+2Wv
 KxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CjOmYSFFYsasYX9Sq8MuBrH7p/CFaq4+YCq5TRyIrqw=;
 b=OjCtdohyymsMV0zJYgvjRg7gk/H7UQJZrAxuGlDc81mO6LA5Aj2R3vHRlxKHLiv/+X
 HVW3sR38CoEsL8A4DXAJkjvg7j/d259jFrEXxM0RctZDbNTo0k74b7LKYq2Gmx+2oaBm
 uA53witAhvaXDB8T5M32MSN6ShFnfeJM478rs6hBMXf3etXDUJ9aWajABoMwuTyCVNU8
 3HLrhbjGEtEZc0+xfFeNPbyC4B4xTZdZSouSk07grmxSunQ8h+DU5kih0fvKFffA8zy5
 87gjsV1rstxllmzypm/3M2CCh2WMv51vsnkrj8oQZNMfnkIFuVAToIlR+1pE/HiciDCY
 gVQg==
X-Gm-Message-State: AOAM533xxcLzNzvgNuxd4c4f+jbvylBLWTj+6ETi7VjqFteEYgOYoC51
 cs6W5HhBMZz/CeBCvl9ZOu5nkenQJeI=
X-Google-Smtp-Source: ABdhPJyJfQEYepL8PyuaRVxEahLC2pXCHSM5KwJiRwsI2EOamwMmL1JTjjnfJqk9Rk6ERJK6Kijmgg==
X-Received: by 2002:a63:3150:: with SMTP id x77mr652816pgx.114.1605382112892; 
 Sat, 14 Nov 2020 11:28:32 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 g8sm2891778pgn.47.2020.11.14.11.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 11:28:31 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/msm: Protect obj->active_count under obj lock
Date: Sat, 14 Nov 2020 11:30:08 -0800
Message-Id: <20201114193010.753355-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201114193010.753355-1-robdclark@gmail.com>
References: <20201114193010.753355-1-robdclark@gmail.com>
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
 "Kristian H. Kristensen" <hoegsberg@google.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Previously we only held obj lock in the _active_get() path, and relied
on atomic_dec_return() to not be racy in the _active_put() path where
obj lock was not held.

But this is a false sense of security.  Unlike obj lifetime refcnt,
where you do not expect to *increase* the refcnt after the last put
(which would mean that something has gone horribly wrong with the
object liveness reference counting), the active_count can increase
again from zero.  Racing _active_put()s and _active_get()s could leave
the obj on the wrong mm list.

But in the retire path, immediately after the _active_put(), the
_unpin_iova() would acquire obj lock.  So just move the locking earlier
and rely on that to protect obj->active_count.

Fixes: c5c1643cef7a ("drm/msm: Drop struct_mutex from the retire path")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 11 ++++++-----
 drivers/gpu/drm/msm/msm_gem.h |  5 +++--
 drivers/gpu/drm/msm/msm_gpu.c | 10 ++++++----
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index a9a834bb7794..2795288b0a95 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -770,7 +770,7 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 	WARN_ON(!msm_gem_is_locked(obj));
 	WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED);
 
-	if (!atomic_fetch_inc(&msm_obj->active_count)) {
+	if (msm_obj->active_count++ == 0) {
 		mutex_lock(&priv->mm_lock);
 		list_del_init(&msm_obj->mm_list);
 		list_add_tail(&msm_obj->mm_list, &gpu->active_list);
@@ -784,8 +784,9 @@ void msm_gem_active_put(struct drm_gem_object *obj)
 	struct msm_drm_private *priv = obj->dev->dev_private;
 
 	might_sleep();
+	WARN_ON(!msm_gem_is_locked(obj));
 
-	if (!atomic_dec_return(&msm_obj->active_count)) {
+	if (--msm_obj->active_count == 0) {
 		mutex_lock(&priv->mm_lock);
 		list_del_init(&msm_obj->mm_list);
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
@@ -936,15 +937,15 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 	struct drm_device *dev = obj->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 
-	/* object should not be on active list: */
-	WARN_ON(is_active(msm_obj));
-
 	mutex_lock(&priv->mm_lock);
 	list_del(&msm_obj->mm_list);
 	mutex_unlock(&priv->mm_lock);
 
 	msm_gem_lock(obj);
 
+	/* object should not be on active list: */
+	WARN_ON(is_active(msm_obj));
+
 	put_iova(obj);
 
 	if (obj->import_attach) {
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index d79e7019cc88..3355a48a023b 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -87,7 +87,7 @@ struct msm_gem_object {
 
 	char name[32]; /* Identifier to print for the debugfs files */
 
-	atomic_t active_count;
+	int active_count;
 };
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
@@ -185,7 +185,8 @@ msm_gem_is_locked(struct drm_gem_object *obj)
 
 static inline bool is_active(struct msm_gem_object *msm_obj)
 {
-	return atomic_read(&msm_obj->active_count);
+	WARN_ON(!msm_gem_is_locked(&msm_obj->base));
+	return msm_obj->active_count;
 }
 
 static inline bool is_purgeable(struct msm_gem_object *msm_obj)
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index b597213a1890..04f7ab4d63ae 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -717,11 +717,13 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 		stats->alwayson_start, stats->alwayson_end);
 
 	for (i = 0; i < submit->nr_bos; i++) {
-		struct msm_gem_object *msm_obj = submit->bos[i].obj;
+		struct drm_gem_object *obj = &submit->bos[i].obj->base;
 
-		msm_gem_active_put(&msm_obj->base);
-		msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
-		drm_gem_object_put(&msm_obj->base);
+		msm_gem_lock(obj);
+		msm_gem_active_put(obj);
+		msm_gem_unpin_iova_locked(obj, submit->aspace);
+		msm_gem_unlock(obj);
+		drm_gem_object_put(obj);
 	}
 
 	pm_runtime_mark_last_busy(&gpu->pdev->dev);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
