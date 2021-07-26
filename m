Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C97E73D5C73
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 16:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B726E81F;
	Mon, 26 Jul 2021 14:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C153C6FCD1;
 Mon, 26 Jul 2021 14:57:04 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id f13so1426172plj.2;
 Mon, 26 Jul 2021 07:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SFRuGXrGOpAPjCK+7vKN6XnQginWoujNICp+8vwYNFs=;
 b=JlhiO5ALgwrt1CFDuiRxQOtRB3QSBL6dVCkV5B6/RGA8NB8Vkf/GK+0Sm0gofnWPos
 XB4bIqf6DESoZF2aN4/KL+JOSZFzhjmMDWkoF0w68PmHe6/rGROgw7EgDfnI/kj+5y3k
 QQW89IhzK680UkPQ721nEhx8NYeLbg9evzK59q9AS/Rv+EjJ81Q3QQUYwevwx4WYU4iJ
 D28eLS/j0VaHjdrSTeBvijV+l3UkqgIjigz4d7c+zhFWq43I2+oGljc5Jj+Ke+7NEEnq
 nHIWerN8XoWrEFx9akuI8BpeAFVy8Fss6hDbv9EGpV9warOs1abbK98Ww2d3RkM5dJuA
 WM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SFRuGXrGOpAPjCK+7vKN6XnQginWoujNICp+8vwYNFs=;
 b=hRMEm9cN81bG5WfMwdcAGkeov/ShG1uZIrpzx7QEcZRmpz71gxPmNUQj2k+hbvApsS
 opzyeiDR+5KNb5WeRmNqNONqP6OT3XMiNtKxC6XesGVxYHfXYbaDtJ39RvixmwNHALyW
 0szjOZwxzWTJh5MoZ94OGG+XovBSPBrPthdvDkDZZmN8vYZYBuqre9paeoGEUEhxVdIE
 9L6r90XTFb7yZDplVzvfsSO19s6ucQNK8vPHzIRLiJkq97ivgr/ZKQ18cpddC3ZEwifT
 b4I+rXz//maASluCqc1uLfTBTkKpbxpLKHINftWfd/SxVNTK7W9gwlOS8GcuYf20gP8M
 Z7bA==
X-Gm-Message-State: AOAM532CHoG1kpGbXm+rsNr+QMeKd/nJW1Ha8Y1upTe8nfJkoH85B7+k
 uf9jjUy+lcMSnD+lmTZu4wRZv1qJYSm1+Q==
X-Google-Smtp-Source: ABdhPJzOPJTI+oyi3WcfVqmdygPk7dQVn/5qqLC14Zox9OSvb4i0Vhi1+jYoSmwysi7hCJLDjMCdJg==
X-Received: by 2002:a17:902:e843:b029:12b:2260:b634 with SMTP id
 t3-20020a170902e843b029012b2260b634mr14621213plg.27.1627311423790; 
 Mon, 26 Jul 2021 07:57:03 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id b3sm14140511pju.47.2021.07.26.07.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:57:02 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 12/12] drm/msm/gem: Mark active before pinning
Date: Mon, 26 Jul 2021 08:00:26 -0700
Message-Id: <20210726150038.2187631-13-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726150038.2187631-1-robdclark@gmail.com>
References: <20210726150038.2187631-1-robdclark@gmail.com>
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
index 41a111c49cc7..71a589fd4ba8 100644
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
index b60c3f7ed551..2615a4b3a2e9 100644
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
@@ -252,10 +253,11 @@ static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
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
@@ -265,7 +267,7 @@ static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
 
 static void submit_unlock_unpin_bo(struct msm_gem_submit *submit, int i)
 {
-	submit_cleanup_bo(submit, i, BO_PINNED | BO_LOCKED);
+	submit_cleanup_bo(submit, i, BO_PINNED | BO_ACTIVE | BO_LOCKED);
 
 	if (!(submit->bos[i].flags & BO_VALID))
 		submit->bos[i].iova = 0;
@@ -357,6 +359,18 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 
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
@@ -368,8 +382,6 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 		if (ret)
 			break;
 
-		msm_gem_active_get(obj, submit->gpu);
-
 		submit->bos[i].flags |= BO_PINNED;
 
 		if (iova == submit->bos[i].iova) {
@@ -503,7 +515,7 @@ static void submit_cleanup(struct msm_gem_submit *submit, bool error)
 	unsigned i;
 
 	if (error)
-		cleanup_flags |= BO_PINNED;
+		cleanup_flags |= BO_PINNED | BO_ACTIVE;
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct msm_gem_object *msm_obj = submit->bos[i].obj;
@@ -522,7 +534,7 @@ void msm_submit_retire(struct msm_gem_submit *submit)
 		struct drm_gem_object *obj = &submit->bos[i].obj->base;
 
 		msm_gem_lock(obj);
-		submit_cleanup_bo(submit, i, BO_PINNED);
+		submit_cleanup_bo(submit, i, BO_PINNED | BO_ACTIVE);
 		msm_gem_unlock(obj);
 		drm_gem_object_put(obj);
 	}
-- 
2.31.1

