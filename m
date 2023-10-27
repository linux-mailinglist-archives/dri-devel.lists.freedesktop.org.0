Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C49ED7D9E61
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 18:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD90110EA19;
	Fri, 27 Oct 2023 16:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A35B10EA21;
 Fri, 27 Oct 2023 16:59:34 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1ca816f868fso18705255ad.1; 
 Fri, 27 Oct 2023 09:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698425973; x=1699030773; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lBQNNIt/vkL5JM4K598Nxz2cKMUcFsO25vk1EUXbR50=;
 b=aEV1LyDb/XygcDNbMtEHBDgMeu0IhIyzvmOq1ELZuiLNGbRORGYR5mZJaqmVg/ptok
 z9nKkW3mKLEELckxXiR1Pls4MpvmlEuWEqpRGVUJ9VLLzhsLFDw+GkLeVN0RxFUe7IIn
 QQ7HWisl37d7lA8OzbAGeKpMp44FOpyVE6V/LYg9TTCBTULAeov/pBD/rIxtD5q5802Z
 k2Dxgs4cDqgjCgpzZoh4D3O5UqN6JEOfFg/nuwz18MjIjn8pu8yXvy3+D7z2mixRn+2l
 tFMUTsoLTOtEBb3qH75YpqWd3tIR+q5esT5va9bSzSIZWBgMEMXdMD6usNU4VaHrg/7Y
 +/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698425973; x=1699030773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lBQNNIt/vkL5JM4K598Nxz2cKMUcFsO25vk1EUXbR50=;
 b=GmSoLi9BE0pAPyAk+aQ8ToAv11C0hmQh8ZM5vsienm3ROOfmJ800e8d7c5mVX2bTpp
 WGw65qEePLzdyZChy75nja5pY6KdSqDhqGwTxMD8SxcFXM7yRwFcRh+HgHjnp5rpY0Qs
 wFT7GUI2O447PoBz2wihbvlMjCkTE64UWcZt964zDWINAWStksURtzjjePOJ+Tv0aR64
 1cf7DGxyJyGv24HLFvOGvLWqydYlp/92Dnb/WPd5zVuvIwam40HUaXIaVvxRbtWzcxYW
 4hO76y3vkkCtkJRz0RFu5r/2hX8ycUM6UGxdsjKL8SmJlFEAh2i2s2i1eB7pAF/0QWxP
 DKcw==
X-Gm-Message-State: AOJu0Yzgb7GyvwGTd+NTf13lupOlo145cqRweq1c4/mN9dWgcZvYyX13
 WBeWhvjL1KNiBiLdAHrfK8z7jgKayv8=
X-Google-Smtp-Source: AGHT+IHBTm+5z/fHBWh00iOPRyv7KaJ98NHocJTvikC6+us105MrhdbrvmxsHi4kdGraKDPXyJ9M0w==
X-Received: by 2002:a17:903:110d:b0:1ca:d778:a9ce with SMTP id
 n13-20020a170903110d00b001cad778a9cemr4041902plh.38.1698425973365; 
 Fri, 27 Oct 2023 09:59:33 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a170902d2ce00b001c322a41188sm1801445plc.117.2023.10.27.09.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 09:59:32 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] drm/msm/gem: Convert to drm_exec
Date: Fri, 27 Oct 2023 09:58:41 -0700
Message-ID: <20231027165859.395638-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027165859.395638-1-robdclark@gmail.com>
References: <20231027165859.395638-1-robdclark@gmail.com>
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

Replace the ww_mutex locking dance with the drm_exec helper.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/Kconfig          |   1 +
 drivers/gpu/drm/msm/msm_gem.h        |   5 +-
 drivers/gpu/drm/msm/msm_gem_submit.c | 117 +++++----------------------
 3 files changed, 24 insertions(+), 99 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 6309a857ca31..f91d87afc0d3 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -16,6 +16,7 @@ config DRM_MSM
 	select DRM_DP_AUX_BUS
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HELPER
+	select DRM_EXEC
 	select DRM_KMS_HELPER
 	select DRM_PANEL
 	select DRM_BRIDGE
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index af884ced7a0d..7f34263048a3 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -9,6 +9,7 @@
 
 #include <linux/kref.h>
 #include <linux/dma-resv.h>
+#include "drm/drm_exec.h"
 #include "drm/gpu_scheduler.h"
 #include "msm_drv.h"
 
@@ -254,7 +255,7 @@ struct msm_gem_submit {
 	struct msm_gpu *gpu;
 	struct msm_gem_address_space *aspace;
 	struct list_head node;   /* node in ring submit list */
-	struct ww_acquire_ctx ticket;
+	struct drm_exec exec;
 	uint32_t seqno;		/* Sequence number of the submit on the ring */
 
 	/* Hw fence, which is created when the scheduler executes the job, and
@@ -287,8 +288,6 @@ struct msm_gem_submit {
 		struct drm_msm_gem_submit_reloc *relocs;
 	} *cmd;  /* array of size nr_cmds */
 	struct {
-/* make sure these don't conflict w/ MSM_SUBMIT_BO_x */
-#define BO_LOCKED	0x4000	/* obj lock is held */
 		uint32_t flags;
 		union {
 			struct drm_gem_object *obj;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 603f04d851d9..f8d14d4ccfef 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -248,85 +248,31 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 	return ret;
 }
 
-static void submit_unlock_bo(struct msm_gem_submit *submit, int i)
-{
-	struct drm_gem_object *obj = submit->bos[i].obj;
-	unsigned cleanup_flags = BO_LOCKED;
-	unsigned flags = submit->bos[i].flags & cleanup_flags;
-
-	/*
-	 * Clear flags bit before dropping lock, so that the msm_job_run()
-	 * path isn't racing with submit_cleanup() (ie. the read/modify/
-	 * write is protected by the obj lock in all paths)
-	 */
-	submit->bos[i].flags &= ~cleanup_flags;
-
-	if (flags & BO_LOCKED)
-		dma_resv_unlock(obj->resv);
-}
-
 /* This is where we make sure all the bo's are reserved and pin'd: */
 static int submit_lock_objects(struct msm_gem_submit *submit)
 {
-	int contended, slow_locked = -1, i, ret = 0;
-
-retry:
-	for (i = 0; i < submit->nr_bos; i++) {
-		struct drm_gem_object *obj = submit->bos[i].obj;
-
-		if (slow_locked == i)
-			slow_locked = -1;
+	int ret;
 
-		contended = i;
+	drm_exec_init(&submit->exec, DRM_EXEC_INTERRUPTIBLE_WAIT, submit->nr_bos);
 
-		if (!(submit->bos[i].flags & BO_LOCKED)) {
-			ret = dma_resv_lock_interruptible(obj->resv,
-							  &submit->ticket);
+	drm_exec_until_all_locked (&submit->exec) {
+		for (unsigned i = 0; i < submit->nr_bos; i++) {
+			struct drm_gem_object *obj = submit->bos[i].obj;
+			ret = drm_exec_prepare_obj(&submit->exec, obj, 1);
+			drm_exec_retry_on_contention(&submit->exec);
 			if (ret)
-				goto fail;
-			submit->bos[i].flags |= BO_LOCKED;
+				goto error;
 		}
 	}
 
-	ww_acquire_done(&submit->ticket);
-
 	return 0;
 
-fail:
-	if (ret == -EALREADY) {
-		SUBMIT_ERROR(submit, "handle %u at index %u already on submit list\n",
-			     submit->bos[i].handle, i);
-		ret = -EINVAL;
-	}
-
-	for (; i >= 0; i--)
-		submit_unlock_bo(submit, i);
-
-	if (slow_locked > 0)
-		submit_unlock_bo(submit, slow_locked);
-
-	if (ret == -EDEADLK) {
-		struct drm_gem_object *obj = submit->bos[contended].obj;
-		/* we lost out in a seqno race, lock and retry.. */
-		ret = dma_resv_lock_slow_interruptible(obj->resv,
-						       &submit->ticket);
-		if (!ret) {
-			submit->bos[contended].flags |= BO_LOCKED;
-			slow_locked = contended;
-			goto retry;
-		}
-
-		/* Not expecting -EALREADY here, if the bo was already
-		 * locked, we should have gotten -EALREADY already from
-		 * the dma_resv_lock_interruptable() call.
-		 */
-		WARN_ON_ONCE(ret == -EALREADY);
-	}
-
+error:
+	drm_exec_fini(&submit->exec);
 	return ret;
 }
 
-static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
+static int submit_fence_sync(struct msm_gem_submit *submit)
 {
 	int i, ret = 0;
 
@@ -334,22 +280,6 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
 		struct drm_gem_object *obj = submit->bos[i].obj;
 		bool write = submit->bos[i].flags & MSM_SUBMIT_BO_WRITE;
 
-		/* NOTE: _reserve_shared() must happen before
-		 * _add_shared_fence(), which makes this a slightly
-		 * strange place to call it.  OTOH this is a
-		 * convenient can-fail point to hook it in.
-		 */
-		ret = dma_resv_reserve_fences(obj->resv, 1);
-		if (ret)
-			return ret;
-
-		/* If userspace has determined that explicit fencing is
-		 * used, it can disable implicit sync on the entire
-		 * submit:
-		 */
-		if (no_implicit)
-			continue;
-
 		/* Otherwise userspace can ask for implicit sync to be
 		 * disabled on specific buffers.  This is useful for internal
 		 * usermode driver managed buffers, suballocation, etc.
@@ -531,15 +461,13 @@ static void submit_cleanup(struct msm_gem_submit *submit, bool error)
 {
 	unsigned i;
 
-	if (error)
+	if (error) {
 		submit_unpin_objects(submit);
-
-	for (i = 0; i < submit->nr_bos; i++) {
-		struct drm_gem_object *obj = submit->bos[i].obj;
-		submit_unlock_bo(submit, i);
-		if (error)
-			drm_gem_object_put(obj);
+		/* job wasn't enqueued to scheduler, so early retirement: */
+		msm_submit_retire(submit);
 	}
+
+	drm_exec_fini(&submit->exec);
 }
 
 void msm_submit_retire(struct msm_gem_submit *submit)
@@ -733,7 +661,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_submit_post_dep *post_deps = NULL;
 	struct drm_syncobj **syncobjs_to_reset = NULL;
 	int out_fence_fd = -1;
-	bool has_ww_ticket = false;
 	unsigned i;
 	int ret;
 
@@ -839,15 +766,15 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		goto out;
 
 	/* copy_*_user while holding a ww ticket upsets lockdep */
-	ww_acquire_init(&submit->ticket, &reservation_ww_class);
-	has_ww_ticket = true;
 	ret = submit_lock_objects(submit);
 	if (ret)
 		goto out;
 
-	ret = submit_fence_sync(submit, !!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
-	if (ret)
-		goto out;
+	if (!(args->flags & MSM_SUBMIT_NO_IMPLICIT)) {
+		ret = submit_fence_sync(submit);
+		if (ret)
+			goto out;
+	}
 
 	ret = submit_pin_objects(submit);
 	if (ret)
@@ -978,8 +905,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 out:
 	submit_cleanup(submit, !!ret);
-	if (has_ww_ticket)
-		ww_acquire_fini(&submit->ticket);
 out_unlock:
 	mutex_unlock(&queue->lock);
 out_post_unlock:
-- 
2.41.0

