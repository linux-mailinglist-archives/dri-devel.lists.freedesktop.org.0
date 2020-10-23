Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B141A297521
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 18:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089766F8FD;
	Fri, 23 Oct 2020 16:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3363C6F900;
 Fri, 23 Oct 2020 16:51:07 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id v22so1202686ply.12;
 Fri, 23 Oct 2020 09:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+y45oOjahWFnPOijBG1RjZS6QNlundMFracTuBu5nFw=;
 b=uMQ6ut+28KSF/d2T/mMdJ9gJ+8d0lrPiTStP+3woilItyiOZZ+r8H/knJ9o7W3QXJR
 Vsm9yZ2ZQmpraVcnAgf15A6pDwhxpStJBm0KRI4pBiccBslqt6RTNXlSUVqv30AeGoL5
 gufnon++t2BS5uvWQeTO+uGtsObDF37a/ClsEQ99LVrkJm8P8t/Cc2QDlPRo16bY0jZq
 EeIHIXOgp9ynXWTHgHj7U0ujdPWiNC+eFwz7gryGWbgkQd51AnN7sPhPX3MCEUbkcTfs
 2SkqnXwqwP2AbeU5Jxmilvxx1PeLFmShMp480020rPQ67WZin0pPp9E/y2SAaA66jAwJ
 hkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+y45oOjahWFnPOijBG1RjZS6QNlundMFracTuBu5nFw=;
 b=lxIhRDKnXK3F+NRwCHiNdQtrsiSDLa8HJtTrjsaN2FbFDFAhoZcozD817TcFX8xuql
 oAdevxE/MP7s5M0bmf4l75wt/gCJkqJPgzv7BfAwMTA+EVLl303K3mNcNk93NXql/wYT
 AFL3Y/lY0w0o49bcotOFafVMA95P3K3/y2pResjkNIqEyv4bFaZ3o7MxpBmdOSbIDupq
 XrhrcthJKagIr5VZyiMEnGHUaDz/NWX7LBAxAqslI4/v9cV+9XoFKt0PBWHlYRzAlxDX
 hfwWYa7NBu2//osJx1gFc5K8MeInJk9hsuxS9EDRq/xGRiWzIL8QqNXpK9+TuhLDOZ0/
 rNjQ==
X-Gm-Message-State: AOAM530A2WLVQHRvhc/1iP5zwGEE5JZyTsk+7HL7aOJ6+w1U/aXI8ZAS
 /yadfbguMJFXBYacA5BMExQIEdNIBIcxRQ==
X-Google-Smtp-Source: ABdhPJzOrhH9Lf+kx9ky/4JoNzEVfS+XfiI/Gs5d2XPCWsxzUeVmUKjNOksMwmGIUuQhpinAivxxgA==
X-Received: by 2002:a17:902:a609:b029:d5:dde6:f135 with SMTP id
 u9-20020a170902a609b02900d5dde6f135mr3248918plq.75.1603471866097; 
 Fri, 23 Oct 2020 09:51:06 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 o13sm3023420pjq.19.2020.10.23.09.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 09:51:04 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 22/23] drm/msm: Drop struct_mutex in shrinker path
Date: Fri, 23 Oct 2020 09:51:23 -0700
Message-Id: <20201023165136.561680-23-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, "Kristian H . Kristensen" <hoegsberg@google.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Now that the inactive_list is protected by mm_lock, and everything
else on per-obj basis is protected by obj->lock, we no longer depend
on struct_mutex.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
---
 drivers/gpu/drm/msm/msm_gem.c          |  1 -
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 54 --------------------------
 2 files changed, 55 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 7f24a58c0390..a9a834bb7794 100644
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
