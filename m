Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BAA1C93FA
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892FD6EA01;
	Thu,  7 May 2020 15:11:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3586EA00
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:07 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id g13so6817177wrb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ch7+I5HgvAwcVjkJeLcWdmYlbnNOrXiD6vQHU/9NW4k=;
 b=rG58Fd1jIicfhTgQB0qjTMdlst5xg6zH1uNdxs/N9FPfXb9jJU6Cgdz+YXz7HqoeBx
 TwkId3DW7KCVHi4cqfBLGI9NT00Mbyrtx673YXQDBLYduZGyTDX0XO2Ha3F4LE/bWPOD
 Cto1O+I7jwNIWkn+lTHHlgjvkOLfhWoHK867+K8iNhnyXHrY/8gIREoVI13LU5muhbN5
 3ode3Y96UAdKLoLULpXjYQUvCVJxmgVfHymf2EK3jiM1Ez6E8S1cuoymRIfiVeN7FI/3
 T3UH+8yupakTNt2AkYu5J2R36Emi8Zp/TJ4ziaJsYrqbFXWAd2cLcRYMm9Pf6qKwhkC7
 FeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ch7+I5HgvAwcVjkJeLcWdmYlbnNOrXiD6vQHU/9NW4k=;
 b=dYxB+FVpJGcwuQMt1REcYaTObxr84Vn87ROjjnDM6E9cZJJQ3nPqsITGHGFVgdmWqV
 N3i5/pwwmUS23chllObxqPggj5KoP39gcWdLV6B2A3yoBWaGlIXC5BUjT+J9Ovgs0oSy
 F9TRxhcoJBvlk9KxJjrg2T3YFKJH0A1nIZkZdd7ri6F4x/iEgHpLCLHojVPVpoyO1j92
 I9jKkf6HHA/FAFUXjqfZjLg/iIIphocRFsAhDsi3Ij6cW0XadHoNIvdHoZrgUDII2FT9
 SdudOcUwjmHyo0UHi39ZtLWfDFgFNxfVCvgFIQKqYE7TeOUjywgvo+ydubRgH3WswRBm
 ERdw==
X-Gm-Message-State: AGi0PuZkNJMLNyHvLNtKSPqDPN+64XsDt6ROSsQxor1XMMnp08MpzowY
 WBTikoBPOI1yFX+tb8EYUFymgr8f
X-Google-Smtp-Source: APiQypLzHIOWdCAoyzVC8IJy8vGuZYRf3QRWBtL1VQTajCMV7yaqhZl3iQYALBPsDCU6XTXtahrGjA==
X-Received: by 2002:adf:ee03:: with SMTP id y3mr15105127wrn.190.1588864265559; 
 Thu, 07 May 2020 08:11:05 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:04 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/36] drm/gem: add _locked suffix to drm_object_put
Date: Thu,  7 May 2020 16:07:56 +0100
Message-Id: <20200507150822.114464-11-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150822.114464-1-emil.l.velikov@gmail.com>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
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
Cc: Sean Paul <sean@poorly.run>, emil.l.velikov@gmail.com,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Vast majority of DRM (core and drivers) are struct_mutex free.

As such we have only a handful of cases where the locked helper should
be used. Make that stand out a little bit better.

Done via the following script:

__from=drm_gem_object_put
__to=drm_gem_object_put_locked

for __file in $(git grep --name-only --word-regexp $__from); do
  sed -i  "s/\<$__from\>/$__to/g" $__file;
done

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/drm_gem.c                 | 6 +++---
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c | 4 ++--
 drivers/gpu/drm/msm/msm_drv.c             | 2 +-
 drivers/gpu/drm/msm/msm_gem.c             | 6 +++---
 drivers/gpu/drm/msm/msm_gem_submit.c      | 2 +-
 drivers/gpu/drm/msm/msm_gpu.c             | 2 +-
 include/drm/drm_gem.h                     | 4 ++--
 7 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 599d5ff53b73..f21327ebc562 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -983,7 +983,7 @@ drm_gem_object_free(struct kref *kref)
 EXPORT_SYMBOL(drm_gem_object_free);
 
 /**
- * drm_gem_object_put - release a GEM buffer object reference
+ * drm_gem_object_put_locked - release a GEM buffer object reference
  * @obj: GEM buffer object
  *
  * This releases a reference to @obj. Callers must hold the
@@ -994,7 +994,7 @@ EXPORT_SYMBOL(drm_gem_object_free);
  * drm_gem_object_put_unlocked() instead.
  */
 void
-drm_gem_object_put(struct drm_gem_object *obj)
+drm_gem_object_put_locked(struct drm_gem_object *obj)
 {
 	if (obj) {
 		WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
@@ -1002,7 +1002,7 @@ drm_gem_object_put(struct drm_gem_object *obj)
 		kref_put(&obj->refcount, drm_gem_object_free);
 	}
 }
-EXPORT_SYMBOL(drm_gem_object_put);
+EXPORT_SYMBOL(drm_gem_object_put_locked);
 
 /**
  * drm_gem_vm_open - vma->ops->open implementation for GEM
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
index 8cae2ca4af6b..68eddac7771c 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
@@ -124,13 +124,13 @@ reset_set(void *data, u64 val)
 
 	if (a5xx_gpu->pm4_bo) {
 		msm_gem_unpin_iova(a5xx_gpu->pm4_bo, gpu->aspace);
-		drm_gem_object_put(a5xx_gpu->pm4_bo);
+		drm_gem_object_put_locked(a5xx_gpu->pm4_bo);
 		a5xx_gpu->pm4_bo = NULL;
 	}
 
 	if (a5xx_gpu->pfp_bo) {
 		msm_gem_unpin_iova(a5xx_gpu->pfp_bo, gpu->aspace);
-		drm_gem_object_put(a5xx_gpu->pfp_bo);
+		drm_gem_object_put_locked(a5xx_gpu->pfp_bo);
 		a5xx_gpu->pfp_bo = NULL;
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 29295dee2a2e..6baed5b43ea3 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -932,7 +932,7 @@ static int msm_ioctl_gem_madvise(struct drm_device *dev, void *data,
 		ret = 0;
 	}
 
-	drm_gem_object_put(obj);
+	drm_gem_object_put_locked(obj);
 
 unlock:
 	mutex_unlock(&dev->struct_mutex);
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 5a6a79fbc9d6..8696c405f709 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -879,7 +879,7 @@ void msm_gem_describe_objects(struct list_head *list, struct seq_file *m)
 }
 #endif
 
-/* don't call directly!  Use drm_gem_object_put() and friends */
+/* don't call directly!  Use drm_gem_object_put_locked() and friends */
 void msm_gem_free_object(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
@@ -1183,7 +1183,7 @@ static void *_msm_gem_kernel_new(struct drm_device *dev, uint32_t size,
 	return vaddr;
 err:
 	if (locked)
-		drm_gem_object_put(obj);
+		drm_gem_object_put_locked(obj);
 	else
 		drm_gem_object_put_unlocked(obj);
 
@@ -1215,7 +1215,7 @@ void msm_gem_kernel_put(struct drm_gem_object *bo,
 	msm_gem_unpin_iova(bo, aspace);
 
 	if (locked)
-		drm_gem_object_put(bo);
+		drm_gem_object_put_locked(bo);
 	else
 		drm_gem_object_put_unlocked(bo);
 }
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 385d4965a8d0..8f450a245cfb 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -387,7 +387,7 @@ static void submit_cleanup(struct msm_gem_submit *submit)
 		struct msm_gem_object *msm_obj = submit->bos[i].obj;
 		submit_unlock_unpin_bo(submit, i, false);
 		list_del_init(&msm_obj->submit_entry);
-		drm_gem_object_put(&msm_obj->base);
+		drm_gem_object_put_locked(&msm_obj->base);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 615c5cda5389..86a68f96c48d 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -694,7 +694,7 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 		/* move to inactive: */
 		msm_gem_move_to_inactive(&msm_obj->base);
 		msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
-		drm_gem_object_put(&msm_obj->base);
+		drm_gem_object_put_locked(&msm_obj->base);
 	}
 
 	pm_runtime_mark_last_busy(&gpu->pdev->dev);
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 7c877bea7b3a..0f22f3320dcb 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -187,7 +187,7 @@ struct drm_gem_object {
 	 *
 	 * Reference count of this object
 	 *
-	 * Please use drm_gem_object_get() to acquire and drm_gem_object_put()
+	 * Please use drm_gem_object_get() to acquire and drm_gem_object_put_locked()
 	 * or drm_gem_object_put_unlocked() to release a reference to a GEM
 	 * buffer object.
 	 */
@@ -376,7 +376,7 @@ drm_gem_object_put_unlocked(struct drm_gem_object *obj)
 	kref_put(&obj->refcount, drm_gem_object_free);
 }
 
-void drm_gem_object_put(struct drm_gem_object *obj);
+void drm_gem_object_put_locked(struct drm_gem_object *obj);
 
 int drm_gem_handle_create(struct drm_file *file_priv,
 			  struct drm_gem_object *obj,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
