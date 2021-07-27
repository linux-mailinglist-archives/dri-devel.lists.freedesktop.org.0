Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B243D7BD4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 19:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6E36EB6B;
	Tue, 27 Jul 2021 17:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5216EC3B;
 Tue, 27 Jul 2021 17:08:14 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id l19so254652pjz.0;
 Tue, 27 Jul 2021 10:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BVHgu7P3jLeGAr6c6jiQnBbjUeZUVb7sIei9a5S3h4I=;
 b=WlJF/vK63/XIsVPFZZbU8flmm44UA1jL314rnLW262EpDVoPB9cTQj6Z4RfXNNLhDh
 UfKVkUV/CYv+zSH/zFfA27/zxJu3yw5NSqyUZXoe5QMLRuA0ZHe18NHtxElNv0DnxPNO
 N2vPh0m0Br9AyEGzjZdMs6oZU6Dq5zPdnK2iONG0uy/89OmDWbzQUv11xpjddkqIa67C
 C07pXdBgccE246MVnZJGqbLi6t7lpMZWTg9bwBl3Et58UqCrPbv67UILbNN/iMxPfmDX
 IkhqJgV/qkoOPElbFvC/qJLQm2FLSpyZK8TQ0fKmrV6j1gDm37k9e3G4i3ekQCHIvTYS
 rM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BVHgu7P3jLeGAr6c6jiQnBbjUeZUVb7sIei9a5S3h4I=;
 b=gKyR4zaiTAX5rTJ/MCe0Av5+18pXhfvodTACjFKanuBON+jJUGSnOpvD9IHwB3cGWV
 jcX5dYVsTyVF3k3/5E042myBzQa+EnEwSR7WEx0qtCbkT7Mq5T6elWJsrw+PObqMidPI
 YX1uUBexQ2a2+DMZ1sgUK8xzFDKr5V99EKk2qlN+8XBatAzVJqrTr7Jg97NAiGKz3uS8
 3bSbsqg4WJAdqzJ7ipb8u6+cOOG8Ia2kW4x+xDJ0mKPaN8RGA08+auMKcQ5vvsYlFXZa
 4WDJ+clckwnTazXYuIIhdICVik9t4v/E9/vZ3d7dyCMF5RcHN6DGjtQbgzkrdlfn80T1
 UT2A==
X-Gm-Message-State: AOAM533TQc0jR+B9R+HC9QMylPuDV/Lez0SUlrYnjh9ioAcPj8ynutu4
 o3jnR8lxEDrnOP2S1zjyJePSE76CQVzhNw==
X-Google-Smtp-Source: ABdhPJwgh/neo2jmD1LpwIXqSJvOglGqEJmFMXn3xH8aasrwoX8uvjwSl79+t+wVSv7dm/Tr37MTng==
X-Received: by 2002:a17:90b:203:: with SMTP id
 fy3mr1447375pjb.115.1627405693767; 
 Tue, 27 Jul 2021 10:08:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id bj15sm3483420pjb.6.2021.07.27.10.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 10:08:12 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 13/13] drm/msm/gem: Mark active before pinning
Date: Tue, 27 Jul 2021 10:11:29 -0700
Message-Id: <20210727171143.2549475-14-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727171143.2549475-1-robdclark@gmail.com>
References: <20210727171143.2549475-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Mark all the bos in the submit as active, before pinning, to prevent
evicting a buffer in the same submit to make room for a buffer earlier
in the table.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c        |  2 --
 drivers/gpu/drm/msm/msm_gem_submit.c | 28 ++++++++++++++++++++--------
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index af199ef53d2f..15b1804fa64e 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -131,7 +131,6 @@ static struct page **get_pages(struct drm_gem_object *obj)
 		if (msm_obj->flags & (MSM_BO_WC|MSM_BO_UNCACHED))
 			sync_for_device(msm_obj);
 
-		GEM_WARN_ON(msm_obj->active_count);
 		update_inactive(msm_obj);
 	}
 
@@ -815,7 +814,6 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 	GEM_WARN_ON(!msm_gem_is_locked(obj));
 	GEM_WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED);
 	GEM_WARN_ON(msm_obj->dontneed);
-	GEM_WARN_ON(!msm_obj->sgt);
 
 	if (msm_obj->active_count++ == 0) {
 		mutex_lock(&priv->mm_lock);
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index c2ecec5b11c4..fc25a85eb1ca 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -24,7 +24,8 @@
 /* make sure these don't conflict w/ MSM_SUBMIT_BO_x */
 #define BO_VALID    0x8000   /* is current addr in cmdstream correct/valid? */
 #define BO_LOCKED   0x4000   /* obj lock is held */
-#define BO_PINNED   0x2000   /* obj is pinned and on active list */
+#define BO_ACTIVE   0x2000   /* active refcnt is held */
+#define BO_PINNED   0x1000   /* obj is pinned and on active list */
 
 static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		struct msm_gpu *gpu,
@@ -239,10 +240,11 @@ static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
 	struct drm_gem_object *obj = &submit->bos[i].obj->base;
 	unsigned flags = submit->bos[i].flags & cleanup_flags;
 
-	if (flags & BO_PINNED) {
+	if (flags & BO_PINNED)
 		msm_gem_unpin_iova_locked(obj, submit->aspace);
+
+	if (flags & BO_ACTIVE)
 		msm_gem_active_put(obj);
-	}
 
 	if (flags & BO_LOCKED)
 		dma_resv_unlock(obj->resv);
@@ -252,7 +254,7 @@ static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
 
 static void submit_unlock_unpin_bo(struct msm_gem_submit *submit, int i)
 {
-	submit_cleanup_bo(submit, i, BO_PINNED | BO_LOCKED);
+	submit_cleanup_bo(submit, i, BO_PINNED | BO_ACTIVE | BO_LOCKED);
 
 	if (!(submit->bos[i].flags & BO_VALID))
 		submit->bos[i].iova = 0;
@@ -356,6 +358,18 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 
 	submit->valid = true;
 
+	/*
+	 * Increment active_count first, so if under memory pressure, we
+	 * don't inadvertently evict a bo needed by the submit in order
+	 * to pin an earlier bo in the same submit.
+	 */
+	for (i = 0; i < submit->nr_bos; i++) {
+		struct drm_gem_object *obj = &submit->bos[i].obj->base;
+
+		msm_gem_active_get(obj, submit->gpu);
+		submit->bos[i].flags |= BO_ACTIVE;
+	}
+
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = &submit->bos[i].obj->base;
 		uint64_t iova;
@@ -367,8 +381,6 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 		if (ret)
 			break;
 
-		msm_gem_active_get(obj, submit->gpu);
-
 		submit->bos[i].flags |= BO_PINNED;
 
 		if (iova == submit->bos[i].iova) {
@@ -502,7 +514,7 @@ static void submit_cleanup(struct msm_gem_submit *submit, bool error)
 	unsigned i;
 
 	if (error)
-		cleanup_flags |= BO_PINNED;
+		cleanup_flags |= BO_PINNED | BO_ACTIVE;
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct msm_gem_object *msm_obj = submit->bos[i].obj;
@@ -520,7 +532,7 @@ void msm_submit_retire(struct msm_gem_submit *submit)
 		struct drm_gem_object *obj = &submit->bos[i].obj->base;
 
 		msm_gem_lock(obj);
-		submit_cleanup_bo(submit, i, BO_PINNED);
+		submit_cleanup_bo(submit, i, BO_PINNED | BO_ACTIVE);
 		msm_gem_unlock(obj);
 		drm_gem_object_put(obj);
 	}
-- 
2.31.1

