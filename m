Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2383376DABD
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 00:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5365610E584;
	Wed,  2 Aug 2023 22:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786B510E584;
 Wed,  2 Aug 2023 22:22:40 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-686b643df5dso239816b3a.1; 
 Wed, 02 Aug 2023 15:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691014959; x=1691619759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yd/VVNkbn8eRWa9AFb76TUL57WJCORlpU9228+xGrY0=;
 b=lPR/NrHwKF4JSBXUl3221/Iija3L2c/5nEIUUMS/H+X7JsDbCMvpayuW8B7Y+/lTy1
 ZD6nLyfNlIcOiOBkrYvnH0Q9L222DYucBCiXeOy8Z9t15l2y33Ur1IZVZGT0MKURLNnQ
 +QykUcT1k+Yf0YFv9WLq8ZiPaz7xJUVPsXYN44ICFBltcKAXnCoTDMhlIMB1U8V0ai3p
 DIOp/6aWskgGFbx/ZVj+XZC80t8OzoUlJ/9nyGlgQynoeK+tL3XzOHbMGo2QmHC438Pp
 6a9VtJQKAE6b6932LjVBoUOhr+Ak5eBpZZI5MYA5kCzxtWCc1Y841Z0g4CLIxlxXKrWm
 K3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691014959; x=1691619759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yd/VVNkbn8eRWa9AFb76TUL57WJCORlpU9228+xGrY0=;
 b=NuvRFRzL/JzgLZ+u3cudpMApbpi/hK/7J5aJmlq5fKNlTLSq3uli+GVWAWY2IDPigG
 UM2d6r/x7nPTQ1ibLhPjHPR4XpLXvYUjDHz3o+oucaJoDKlf8jMtDqgFjD1dFY7BLNHP
 DZ/voTOEBBn70SczM8aqLJ7TgHued4nXWHvbKs9j8qNZ+fVGf3c7WAMNmVn1q4ZnnnVt
 86MUDqNVp6sR60HVfjzMVi3yVj5Jr5ubcYyjx5w4MnDDOLh1PsJkeINvxMBqQ4GdtRwM
 b9axhg8867jg5n+8oGn8hvDAheIFHG6qmzRSYKoYWTF3fVD7D0alA63cdkMOsYQJBTlQ
 zohA==
X-Gm-Message-State: ABy/qLaJAmirab4l2M+lw6LCO5SAZ6K13vXPCGvp4JFeytKhdTDuW79j
 g7meKmIbS911XQg/tIib3KA2QGl6yd0=
X-Google-Smtp-Source: APBJJlHJkEwqGgqujsPSaKqsVyfQPzRFdYR9RXuxckgyFEPvA7z7f5rzzMZj9dZso+0o6j6apv27Og==
X-Received: by 2002:a05:6a00:1307:b0:681:d247:8987 with SMTP id
 j7-20020a056a00130700b00681d2478987mr16100440pfu.17.1691014959493; 
 Wed, 02 Aug 2023 15:22:39 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:33de:aac3:fe1d:788])
 by smtp.gmail.com with ESMTPSA id
 x18-20020aa793b2000000b0067a50223e3bsm11529646pff.111.2023.08.02.15.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 15:22:38 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/msm: Take lru lock once per submit_pin_objects()
Date: Wed,  2 Aug 2023 15:21:51 -0700
Message-ID: <20230802222158.11838-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802222158.11838-1-robdclark@gmail.com>
References: <20230802222158.11838-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Split out pin_count incrementing and lru updating into a separate loop
so we can take the lru lock only once for all objs.  Since we are still
holding the obj lock, it is safe to split this up.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c        | 45 ++++++++++++++++++----------
 drivers/gpu/drm/msm/msm_gem.h        |  1 +
 drivers/gpu/drm/msm/msm_gem_submit.c | 10 ++++++-
 3 files changed, 39 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 6d1dbffc3905..1c81ff6115ac 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -222,9 +222,7 @@ static void put_pages(struct drm_gem_object *obj)
 static struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj,
 					      unsigned madv)
 {
-	struct msm_drm_private *priv = obj->dev->dev_private;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct page **p;
 
 	msm_gem_assert_locked(obj);
 
@@ -234,16 +232,29 @@ static struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj,
 		return ERR_PTR(-EBUSY);
 	}
 
-	p = get_pages(obj);
-	if (IS_ERR(p))
-		return p;
+	return get_pages(obj);
+}
+
+/*
+ * Update the pin count of the object, call under lru.lock
+ */
+void msm_gem_pin_obj_locked(struct drm_gem_object *obj)
+{
+	struct msm_drm_private *priv = obj->dev->dev_private;
+
+	msm_gem_assert_locked(obj);
+
+	to_msm_bo(obj)->pin_count++;
+	drm_gem_lru_move_tail_locked(&priv->lru.pinned, obj);
+}
+
+static void pin_obj_locked(struct drm_gem_object *obj)
+{
+	struct msm_drm_private *priv = obj->dev->dev_private;
 
 	mutex_lock(&priv->lru.lock);
-	msm_obj->pin_count++;
-	update_lru_locked(obj);
+	msm_gem_pin_obj_locked(obj);
 	mutex_unlock(&priv->lru.lock);
-
-	return p;
 }
 
 struct page **msm_gem_pin_pages(struct drm_gem_object *obj)
@@ -252,6 +263,8 @@ struct page **msm_gem_pin_pages(struct drm_gem_object *obj)
 
 	msm_gem_lock(obj);
 	p = msm_gem_pin_pages_locked(obj, MSM_MADV_WILLNEED);
+	if (!IS_ERR(p))
+		pin_obj_locked(obj);
 	msm_gem_unlock(obj);
 
 	return p;
@@ -463,7 +476,7 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct msm_gem_vma *vma)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct page **pages;
-	int ret, prot = IOMMU_READ;
+	int prot = IOMMU_READ;
 
 	if (!(msm_obj->flags & MSM_BO_GPU_READONLY))
 		prot |= IOMMU_WRITE;
@@ -480,11 +493,7 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct msm_gem_vma *vma)
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
 
-	ret = msm_gem_vma_map(vma, prot, msm_obj->sgt, obj->size);
-	if (ret)
-		msm_gem_unpin_locked(obj);
-
-	return ret;
+	return msm_gem_vma_map(vma, prot, msm_obj->sgt, obj->size);
 }
 
 void msm_gem_unpin_locked(struct drm_gem_object *obj)
@@ -536,8 +545,10 @@ static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
 		return PTR_ERR(vma);
 
 	ret = msm_gem_pin_vma_locked(obj, vma);
-	if (!ret)
+	if (!ret) {
 		*iova = vma->iova;
+		pin_obj_locked(obj);
+	}
 
 	return ret;
 }
@@ -700,6 +711,8 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 	if (IS_ERR(pages))
 		return ERR_CAST(pages);
 
+	pin_obj_locked(obj);
+
 	/* increment vmap_count *before* vmap() call, so shrinker can
 	 * check vmap_count (is_vunmapable()) outside of msm_obj lock.
 	 * This guarantees that we won't try to msm_gem_vunmap() this
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 31b370474fa8..2ddd896aac68 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -142,6 +142,7 @@ int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova);
 void msm_gem_unpin_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace);
+void msm_gem_pin_obj_locked(struct drm_gem_object *obj);
 struct page **msm_gem_pin_pages(struct drm_gem_object *obj);
 void msm_gem_unpin_pages(struct drm_gem_object *obj);
 int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index a03bdded1a15..b17561ebd518 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -384,6 +384,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
 
 static int submit_pin_objects(struct msm_gem_submit *submit)
 {
+	struct msm_drm_private *priv = submit->dev->dev_private;
 	int i, ret = 0;
 
 	submit->valid = true;
@@ -403,7 +404,7 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 		if (ret)
 			break;
 
-		submit->bos[i].flags |= BO_OBJ_PINNED | BO_VMA_PINNED;
+		submit->bos[i].flags |= BO_VMA_PINNED;
 		submit->bos[i].vma = vma;
 
 		if (vma->iova == submit->bos[i].iova) {
@@ -416,6 +417,13 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 		}
 	}
 
+	mutex_lock(&priv->lru.lock);
+	for (i = 0; i < submit->nr_bos; i++) {
+		msm_gem_pin_obj_locked(submit->bos[i].obj);
+		submit->bos[i].flags |= BO_OBJ_PINNED;
+	}
+	mutex_unlock(&priv->lru.lock);
+
 	return ret;
 }
 
-- 
2.41.0

