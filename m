Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA9676DABB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 00:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8C310E585;
	Wed,  2 Aug 2023 22:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62AE710E155;
 Wed,  2 Aug 2023 22:22:38 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-267fc04ec74so176635a91.0; 
 Wed, 02 Aug 2023 15:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691014957; x=1691619757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QoWwCYroZJXIvjmkSmHJX1fmFqXQO62ltsaWob+YMtQ=;
 b=Dx+At3DfgX3ZLSNsf5DKk/o6ZtWRBmCZrbPFDLQ0GFeu0SywAz8YjWhgIzeYQ8fRtY
 bJKn6wzhbx55lplD87lFIm1pqB3NMlQ7HfQoizJKat4jzfzcNPXN7G5QRqFrQb+Hd35e
 IGSNmwQUk6DvAkl+mYw7yYy5vNuYoKebaGKR088jAUhTWs+ctwf+VXDRovGAWsSatIk9
 tXK9tEkNIcnAINJoWhDwTPaI7GCpLLBeo7K11fgtkVhCh9rfYmdw9W5LSOvqT06FT3ga
 QMg5MQN+i+mT1XqmrJ8hRcqWhZH+1UVZDPvEAO77YFRobyV5ltk56glM9gQJHrvFs4Gy
 0xtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691014957; x=1691619757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QoWwCYroZJXIvjmkSmHJX1fmFqXQO62ltsaWob+YMtQ=;
 b=dKWcruHexDRekRACfkej4w4Qf4v+DlXYgVT18YdMqG56ezLaLj+71X3yd/0vq0kj4u
 IO0PvpbCXSwdLmiYRaUNBKxIzrMcoj1xafk08rUBNWrrZ2aMfLGon/mw7LE1JpSo/ctq
 v3kZqD1hJNk18lKm25fgrhHuGGo2JG2C6Si+XmUgJG+jAhzFg+zWIkVMpdxJycM7A2GB
 0C1wE+oKDD3DdBCAbD/PoLX9L7hr6J+GYxrxdc4A+MpZxoAOuOzC0wzNLkz74zxHgC/K
 EXVwtvlQta76PURo5WSiF41P1A14y+hplgglSdLU1e/PAJfELGgrer4Ts2aqq52IGbh7
 rH1g==
X-Gm-Message-State: ABy/qLYQGTSNpMiVJKRLEkAsF4ozb6FNeZ5b38TDjRp8k09mf7hnAvVz
 qd3V6Tmt/LaWEDqhM+rn4BMV8smjeCA=
X-Google-Smtp-Source: APBJJlEbPmOAqUSgkRbwSYRcQftkhRpzDB0tkVHyNvDQy154/JfULi4jRdh2QchswO91ksJA/fxKmA==
X-Received: by 2002:a17:90a:6c22:b0:269:85d:2aef with SMTP id
 x31-20020a17090a6c2200b00269085d2aefmr1706833pjj.20.1691014957194; 
 Wed, 02 Aug 2023 15:22:37 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:33de:aac3:fe1d:788])
 by smtp.gmail.com with ESMTPSA id
 lt14-20020a17090b354e00b00263b9e75aecsm1498651pjb.41.2023.08.02.15.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 15:22:36 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/msm: Use drm_gem_object in submit bos table
Date: Wed,  2 Aug 2023 15:21:50 -0700
Message-ID: <20230802222158.11838-3-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Mukesh Ojha <quic_mojha@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Basically everywhere wants the base ptr type.  So store that instead of
msm_gem_object.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  6 ++--
 drivers/gpu/drm/msm/msm_gem.h         |  2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c  | 42 +++++++++++++--------------
 drivers/gpu/drm/msm/msm_gpu.c         | 20 ++++++-------
 drivers/gpu/drm/msm/msm_rd.c          |  8 ++---
 drivers/gpu/drm/msm/msm_ringbuffer.c  |  2 +-
 6 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index a98c97977e01..888f714ceccd 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -66,7 +66,7 @@ void a5xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 {
 	struct msm_ringbuffer *ring = submit->ring;
-	struct msm_gem_object *obj;
+	struct drm_gem_object *obj;
 	uint32_t *ptr, dwords;
 	unsigned int i;
 
@@ -83,7 +83,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
 			obj = submit->bos[submit->cmd[i].idx].obj;
 			dwords = submit->cmd[i].size;
 
-			ptr = msm_gem_get_vaddr(&obj->base);
+			ptr = msm_gem_get_vaddr(obj);
 
 			/* _get_vaddr() shouldn't fail at this point,
 			 * since we've already mapped it once in
@@ -103,7 +103,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
 				OUT_RING(ring, ptr[i]);
 			}
 
-			msm_gem_put_vaddr(&obj->base);
+			msm_gem_put_vaddr(obj);
 
 			break;
 		}
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 2bd6846c83a9..31b370474fa8 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -301,7 +301,7 @@ struct msm_gem_submit {
 #define BO_VMA_PINNED	0x1000	/* vma (virtual address) is pinned */
 		uint32_t flags;
 		union {
-			struct msm_gem_object *obj;
+			struct drm_gem_object *obj;
 			uint32_t handle;
 		};
 		uint64_t iova;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 3b908f9f5493..a03bdded1a15 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -165,7 +165,7 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 
 		drm_gem_object_get(obj);
 
-		submit->bos[i].obj = to_msm_bo(obj);
+		submit->bos[i].obj = obj;
 	}
 
 out_unlock:
@@ -251,7 +251,7 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
 		unsigned cleanup_flags)
 {
-	struct drm_gem_object *obj = &submit->bos[i].obj->base;
+	struct drm_gem_object *obj = submit->bos[i].obj;
 	unsigned flags = submit->bos[i].flags & cleanup_flags;
 
 	/*
@@ -287,7 +287,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 
 retry:
 	for (i = 0; i < submit->nr_bos; i++) {
-		struct msm_gem_object *msm_obj = submit->bos[i].obj;
+		struct drm_gem_object *obj = submit->bos[i].obj;
 
 		if (slow_locked == i)
 			slow_locked = -1;
@@ -295,7 +295,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 		contended = i;
 
 		if (!(submit->bos[i].flags & BO_LOCKED)) {
-			ret = dma_resv_lock_interruptible(msm_obj->base.resv,
+			ret = dma_resv_lock_interruptible(obj->resv,
 							  &submit->ticket);
 			if (ret)
 				goto fail;
@@ -321,9 +321,9 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 		submit_unlock_unpin_bo(submit, slow_locked);
 
 	if (ret == -EDEADLK) {
-		struct msm_gem_object *msm_obj = submit->bos[contended].obj;
+		struct drm_gem_object *obj = submit->bos[contended].obj;
 		/* we lost out in a seqno race, lock and retry.. */
-		ret = dma_resv_lock_slow_interruptible(msm_obj->base.resv,
+		ret = dma_resv_lock_slow_interruptible(obj->resv,
 						       &submit->ticket);
 		if (!ret) {
 			submit->bos[contended].flags |= BO_LOCKED;
@@ -346,7 +346,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
 	int i, ret = 0;
 
 	for (i = 0; i < submit->nr_bos; i++) {
-		struct drm_gem_object *obj = &submit->bos[i].obj->base;
+		struct drm_gem_object *obj = submit->bos[i].obj;
 		bool write = submit->bos[i].flags & MSM_SUBMIT_BO_WRITE;
 
 		/* NOTE: _reserve_shared() must happen before
@@ -389,7 +389,7 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 	submit->valid = true;
 
 	for (i = 0; i < submit->nr_bos; i++) {
-		struct drm_gem_object *obj = &submit->bos[i].obj->base;
+		struct drm_gem_object *obj = submit->bos[i].obj;
 		struct msm_gem_vma *vma;
 
 		/* if locking succeeded, pin bo: */
@@ -424,7 +424,7 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
 	int i;
 
 	for (i = 0; i < submit->nr_bos; i++) {
-		struct drm_gem_object *obj = &submit->bos[i].obj->base;
+		struct drm_gem_object *obj = submit->bos[i].obj;
 
 		if (submit->bos[i].flags & MSM_SUBMIT_BO_WRITE)
 			dma_resv_add_fence(obj->resv, submit->user_fence,
@@ -436,7 +436,7 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
 }
 
 static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,
-		struct msm_gem_object **obj, uint64_t *iova, bool *valid)
+		struct drm_gem_object **obj, uint64_t *iova, bool *valid)
 {
 	if (idx >= submit->nr_bos) {
 		DRM_ERROR("invalid buffer index: %u (out of %u)\n",
@@ -455,7 +455,7 @@ static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,
 }
 
 /* process the reloc's and patch up the cmdstream as needed: */
-static int submit_reloc(struct msm_gem_submit *submit, struct msm_gem_object *obj,
+static int submit_reloc(struct msm_gem_submit *submit, struct drm_gem_object *obj,
 		uint32_t offset, uint32_t nr_relocs, struct drm_msm_gem_submit_reloc *relocs)
 {
 	uint32_t i, last_offset = 0;
@@ -473,7 +473,7 @@ static int submit_reloc(struct msm_gem_submit *submit, struct msm_gem_object *ob
 	/* For now, just map the entire thing.  Eventually we probably
 	 * to do it page-by-page, w/ kmap() if not vmap()d..
 	 */
-	ptr = msm_gem_get_vaddr_locked(&obj->base);
+	ptr = msm_gem_get_vaddr_locked(obj);
 
 	if (IS_ERR(ptr)) {
 		ret = PTR_ERR(ptr);
@@ -497,7 +497,7 @@ static int submit_reloc(struct msm_gem_submit *submit, struct msm_gem_object *ob
 		/* offset in dwords: */
 		off = submit_reloc.submit_offset / 4;
 
-		if ((off >= (obj->base.size / 4)) ||
+		if ((off >= (obj->size / 4)) ||
 				(off < last_offset)) {
 			DRM_ERROR("invalid offset %u at reloc %u\n", off, i);
 			ret = -EINVAL;
@@ -524,7 +524,7 @@ static int submit_reloc(struct msm_gem_submit *submit, struct msm_gem_object *ob
 	}
 
 out:
-	msm_gem_put_vaddr_locked(&obj->base);
+	msm_gem_put_vaddr_locked(obj);
 
 	return ret;
 }
@@ -542,10 +542,10 @@ static void submit_cleanup(struct msm_gem_submit *submit, bool error)
 		cleanup_flags |= BO_VMA_PINNED | BO_OBJ_PINNED;
 
 	for (i = 0; i < submit->nr_bos; i++) {
-		struct msm_gem_object *msm_obj = submit->bos[i].obj;
+		struct drm_gem_object *obj = submit->bos[i].obj;
 		submit_cleanup_bo(submit, i, cleanup_flags);
 		if (error)
-			drm_gem_object_put(&msm_obj->base);
+			drm_gem_object_put(obj);
 	}
 }
 
@@ -554,7 +554,7 @@ void msm_submit_retire(struct msm_gem_submit *submit)
 	int i;
 
 	for (i = 0; i < submit->nr_bos; i++) {
-		struct drm_gem_object *obj = &submit->bos[i].obj->base;
+		struct drm_gem_object *obj = submit->bos[i].obj;
 
 		drm_gem_object_put(obj);
 	}
@@ -861,17 +861,17 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		goto out;
 
 	for (i = 0; i < args->nr_cmds; i++) {
-		struct msm_gem_object *msm_obj;
+		struct drm_gem_object *obj;
 		uint64_t iova;
 
 		ret = submit_bo(submit, submit->cmd[i].idx,
-				&msm_obj, &iova, NULL);
+				&obj, &iova, NULL);
 		if (ret)
 			goto out;
 
 		if (!submit->cmd[i].size ||
 			((submit->cmd[i].size + submit->cmd[i].offset) >
-				msm_obj->base.size / 4)) {
+				obj->size / 4)) {
 			DRM_ERROR("invalid cmdstream size: %u\n", submit->cmd[i].size * 4);
 			ret = -EINVAL;
 			goto out;
@@ -892,7 +892,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 			continue;
 		}
 
-		ret = submit_reloc(submit, msm_obj, submit->cmd[i].offset * 4,
+		ret = submit_reloc(submit, obj, submit->cmd[i].offset * 4,
 				submit->cmd[i].nr_relocs, submit->cmd[i].relocs);
 		if (ret)
 			goto out;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 52db90e34ead..243f988c65b7 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -219,36 +219,36 @@ static void msm_gpu_devcoredump_free(void *data)
 }
 
 static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
-		struct msm_gem_object *obj, u64 iova, bool full)
+		struct drm_gem_object *obj, u64 iova, bool full)
 {
 	struct msm_gpu_state_bo *state_bo = &state->bos[state->nr_bos];
 
 	/* Don't record write only objects */
-	state_bo->size = obj->base.size;
+	state_bo->size = obj->size;
 	state_bo->iova = iova;
 
-	BUILD_BUG_ON(sizeof(state_bo->name) != sizeof(obj->name));
+	BUILD_BUG_ON(sizeof(state_bo->name) != sizeof(to_msm_bo(obj)->name));
 
-	memcpy(state_bo->name, obj->name, sizeof(state_bo->name));
+	memcpy(state_bo->name, to_msm_bo(obj)->name, sizeof(state_bo->name));
 
 	if (full) {
 		void *ptr;
 
-		state_bo->data = kvmalloc(obj->base.size, GFP_KERNEL);
+		state_bo->data = kvmalloc(obj->size, GFP_KERNEL);
 		if (!state_bo->data)
 			goto out;
 
-		msm_gem_lock(&obj->base);
-		ptr = msm_gem_get_vaddr_active(&obj->base);
-		msm_gem_unlock(&obj->base);
+		msm_gem_lock(obj);
+		ptr = msm_gem_get_vaddr_active(obj);
+		msm_gem_unlock(obj);
 		if (IS_ERR(ptr)) {
 			kvfree(state_bo->data);
 			state_bo->data = NULL;
 			goto out;
 		}
 
-		memcpy(state_bo->data, ptr, obj->base.size);
-		msm_gem_put_vaddr(&obj->base);
+		memcpy(state_bo->data, ptr, obj->size);
+		msm_gem_put_vaddr(obj);
 	}
 out:
 	state->nr_bos++;
diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index 8d5687d5ed78..5adc51f7ab59 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -310,7 +310,7 @@ static void snapshot_buf(struct msm_rd_state *rd,
 		struct msm_gem_submit *submit, int idx,
 		uint64_t iova, uint32_t size, bool full)
 {
-	struct msm_gem_object *obj = submit->bos[idx].obj;
+	struct drm_gem_object *obj = submit->bos[idx].obj;
 	unsigned offset = 0;
 	const char *buf;
 
@@ -318,7 +318,7 @@ static void snapshot_buf(struct msm_rd_state *rd,
 		offset = iova - submit->bos[idx].iova;
 	} else {
 		iova = submit->bos[idx].iova;
-		size = obj->base.size;
+		size = obj->size;
 	}
 
 	/*
@@ -335,7 +335,7 @@ static void snapshot_buf(struct msm_rd_state *rd,
 	if (!(submit->bos[idx].flags & MSM_SUBMIT_BO_READ))
 		return;
 
-	buf = msm_gem_get_vaddr_active(&obj->base);
+	buf = msm_gem_get_vaddr_active(obj);
 	if (IS_ERR(buf))
 		return;
 
@@ -343,7 +343,7 @@ static void snapshot_buf(struct msm_rd_state *rd,
 
 	rd_write_section(rd, RD_BUFFER_CONTENTS, buf, size);
 
-	msm_gem_put_vaddr_locked(&obj->base);
+	msm_gem_put_vaddr_locked(obj);
 }
 
 /* called under gpu->lock */
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 8b8353dcde9f..6fa427d2992e 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -24,7 +24,7 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 	mutex_lock(&priv->lru.lock);
 
 	for (i = 0; i < submit->nr_bos; i++) {
-		struct drm_gem_object *obj = &submit->bos[i].obj->base;
+		struct drm_gem_object *obj = submit->bos[i].obj;
 
 		msm_gem_vma_unpin_fenced(submit->bos[i].vma, fctx);
 		msm_gem_unpin_active(obj);
-- 
2.41.0

