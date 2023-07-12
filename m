Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AE07508A3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 14:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639D810E51C;
	Wed, 12 Jul 2023 12:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DFF10E517
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 12:47:14 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-31297125334so461414f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 05:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689166033; x=1691758033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yD3KxKBEcA4joV+km9J8x0kE8plOrThcT8QkdqJYGow=;
 b=GPVJPH0Z1Wa5KDMmIbRUkZJ1Yp2ZN4dRjvwuy1Kn1omKGAn7y6Gv11UIYpsY59tfIl
 oposggtZcf9C9B3UmZqR79aPON1t5OBW+grsLIniXo2YhhjjHCgTcpl+wuLxUMXZIvdy
 XwlGhgCiEvJ16dtGrBo8adcdIOTaBA18VCLjxPdLb9lywUdPowZbx4JQv139ds9l+ZLF
 H/nJq/Ievdk/S+2V/a2drJZn/BiD3iX22GRkqjHXC2kGmenSr3I6fF9bb+LTEImC5wsG
 tZUpQ3xwkkW6dyKVpKOJqvMrYM8h5HUAb3PWRQDh52rmqDQHmtO/ceCr6R+QGtgc0Csy
 7nxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689166033; x=1691758033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yD3KxKBEcA4joV+km9J8x0kE8plOrThcT8QkdqJYGow=;
 b=AHllZ7OHLnFf+9vVhBooKej44HnTY4LY/pNrUUMvLC+4JUwU7HWf1j1/GmjNAKKcP1
 kuWqhvljWkaVJIChkJcFD2vWrrqh6WeGgLNtAN4JiJKnMwTtrzU/WobuqImQKp7xkh3a
 FCGh9BEl22tjYz2Rj5fRN+JZ8QUR075+BB2jkXcZylukDsyAPykKosXQSAy5wcMi4FdT
 kctbuXDpkZbhmW+0hsUgEKYOcgxqZ6C4QyLYwQkL1d8rLXexFN4UCKpol98PshOYzBdk
 LkxKPPIeTBsmz5hjoDn4uge3ToVkiiJsIgJ017Ixsrks8EZ3QSmwp6j0hg3vp2JGofp1
 LC5w==
X-Gm-Message-State: ABy/qLbWnTw+S8nR2kML6cQArTtvnsLHCqGhNXXBWWAt2f229x24rCU+
 APCySyTg8rB8Z922+h2DmP1i7ca87vg=
X-Google-Smtp-Source: APBJJlGjpwQEpt6vpgDnJuO0ZRkdj8bOWKnNgAnButWgsiqY3NXqgStxbCTihUI4tLMK62wwFsO58Q==
X-Received: by 2002:a5d:6b45:0:b0:314:385d:3f32 with SMTP id
 x5-20020a5d6b45000000b00314385d3f32mr1676498wrw.29.1689166032789; 
 Wed, 12 Jul 2023 05:47:12 -0700 (PDT)
Received: from EliteBook.fritz.box ([2a00:e180:1557:4100:d4c4:2bb7:77d6:6d86])
 by smtp.gmail.com with ESMTPSA id
 j8-20020adfe508000000b0031424950a99sm4989225wrm.81.2023.07.12.05.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 05:47:12 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] drm: remove drm_gem_(un)lock_reservations
Date: Wed, 12 Jul 2023 14:47:04 +0200
Message-Id: <20230712124704.333004-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712124704.333004-1-christian.koenig@amd.com>
References: <20230712124704.333004-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not used any more.

Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem.c              | 78 --------------------------
 drivers/gpu/drm/scheduler/sched_main.c |  5 +-
 include/drm/drm_gem.h                  |  4 --
 3 files changed, 2 insertions(+), 85 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index c18686f434d4..2753926c74db 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1214,84 +1214,6 @@ void drm_gem_vunmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map)
 }
 EXPORT_SYMBOL(drm_gem_vunmap_unlocked);
 
-/**
- * drm_gem_lock_reservations - Sets up the ww context and acquires
- * the lock on an array of GEM objects.
- *
- * Once you've locked your reservations, you'll want to set up space
- * for your shared fences (if applicable), submit your job, then
- * drm_gem_unlock_reservations().
- *
- * @objs: drm_gem_objects to lock
- * @count: Number of objects in @objs
- * @acquire_ctx: struct ww_acquire_ctx that will be initialized as
- * part of tracking this set of locked reservations.
- */
-int
-drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
-			  struct ww_acquire_ctx *acquire_ctx)
-{
-	int contended = -1;
-	int i, ret;
-
-	ww_acquire_init(acquire_ctx, &reservation_ww_class);
-
-retry:
-	if (contended != -1) {
-		struct drm_gem_object *obj = objs[contended];
-
-		ret = dma_resv_lock_slow_interruptible(obj->resv,
-								 acquire_ctx);
-		if (ret) {
-			ww_acquire_fini(acquire_ctx);
-			return ret;
-		}
-	}
-
-	for (i = 0; i < count; i++) {
-		if (i == contended)
-			continue;
-
-		ret = dma_resv_lock_interruptible(objs[i]->resv,
-							    acquire_ctx);
-		if (ret) {
-			int j;
-
-			for (j = 0; j < i; j++)
-				dma_resv_unlock(objs[j]->resv);
-
-			if (contended != -1 && contended >= i)
-				dma_resv_unlock(objs[contended]->resv);
-
-			if (ret == -EDEADLK) {
-				contended = i;
-				goto retry;
-			}
-
-			ww_acquire_fini(acquire_ctx);
-			return ret;
-		}
-	}
-
-	ww_acquire_done(acquire_ctx);
-
-	return 0;
-}
-EXPORT_SYMBOL(drm_gem_lock_reservations);
-
-void
-drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
-			    struct ww_acquire_ctx *acquire_ctx)
-{
-	int i;
-
-	for (i = 0; i < count; i++)
-		dma_resv_unlock(objs[i]->resv);
-
-	ww_acquire_fini(acquire_ctx);
-}
-EXPORT_SYMBOL(drm_gem_unlock_reservations);
-
 /**
  * drm_gem_lru_init - initialize a LRU
  *
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7b2bfc10c1a5..335640369a0f 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -795,9 +795,8 @@ EXPORT_SYMBOL(drm_sched_job_add_resv_dependencies);
  * @write: whether the job might write the object (so we need to depend on
  * shared fences in the reservation object).
  *
- * This should be called after drm_gem_lock_reservations() on your array of
- * GEM objects used in the job but before updating the reservations with your
- * own fences.
+ * This should be called after locking your GEM objects used in the job but
+ * before updating the reservations with your own fences.
  *
  * Returns:
  * 0 on success, or an error on failing to expand the array.
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index bbc721870c13..35ffa5aa7b96 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -508,10 +508,6 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
 long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
 				    bool wait_all, unsigned long timeout);
-int drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
-			      struct ww_acquire_ctx *acquire_ctx);
-void drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
-				 struct ww_acquire_ctx *acquire_ctx);
 int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 			    u32 handle, u64 *offset);
 
-- 
2.34.1

