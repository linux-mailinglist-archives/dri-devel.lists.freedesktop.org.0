Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A303CC61B
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 22:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A93B6EAC8;
	Sat, 17 Jul 2021 20:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00AD6EAC8;
 Sat, 17 Jul 2021 20:25:32 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id d9so1233432pfv.4;
 Sat, 17 Jul 2021 13:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mVZJ0etaH/8RWjxtSC+GZsd393iX/hyaj0of1q3zV+o=;
 b=sfNFPnGxWXCPWryoorV20znEf2jhO/+ZDFNKzJJ5hmp9jYU5T+vjrnBebPAuzox5qY
 IEjbKnrWboJxz+teTu4jM6rvgSYj5oCLg3CertAqnPqoSkFVlcAQkE9l1AgZkZzdPjZp
 RkIRho8Xft3ds9Hy0rOMbPdLcYLzUFdU/PzGZRLodAY5ddTB8gl4j/Dx2mb+V9Kk4Gbl
 LYNv5LGuFabS6H887tiwocvrf0+D1uwAvbY5NqffGGtxrjKhp2LwSYgElAC5pijdWlAB
 zOHnn99+Fgm+tCYCoy+wbNAr+Jh8T4zbbyyyEeVlcTLgsGdPl293dXEqL7Wen9HKem1W
 epwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mVZJ0etaH/8RWjxtSC+GZsd393iX/hyaj0of1q3zV+o=;
 b=e/xX4hu19visgpJq4U5bWc+LAzIVGJHD88YQ6XeYJCJhN/vhC1QEeM7GqyQa+OdDYm
 T9t0zVUtu5zMUueY8/s7fXvQ3FG4/xxznjE/bnroS8yxjGwN3y1D2WyA7ngCh3dqwZS4
 ejWjnAnBwTTFqtBk8PxytzgyWE1LDNefqUKE2h67A0uQJ+lIEmvFRRHKA6UVd9aj7chm
 FXgq4JFBQV0VjmQBYf8/mSgaGyETaLtXRAgJlqZvsZP0rC7HJ+8KUXkpgTA2LaxDrWSq
 B+RmGL4mzmarCC0Q2DvkLh7u8OHR0Mu5QPZO3B7Kyx54Thjai+e9drGasMR2K+8V5uhr
 DTFg==
X-Gm-Message-State: AOAM533Y04EYxSwdRkI9/NYwJi0RWdZ4dkPN03efst7P/omoQP/WpmjX
 MDG0rA+cr36hnOPqLwNbq3g2JlFnXXlSnA==
X-Google-Smtp-Source: ABdhPJyl/EdOxyejRKU2JnFbDftUzgR527w10s4Rb8bPwOXQCixiuIvsjDgxGG7qB8da6DRTRrfwqg==
X-Received: by 2002:a63:f108:: with SMTP id f8mr16578768pgi.109.1626553531687; 
 Sat, 17 Jul 2021 13:25:31 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 r10sm15795898pga.48.2021.07.17.13.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 13:25:31 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/11] drm/msm: drop drm_gem_object_put_locked()
Date: Sat, 17 Jul 2021 13:29:05 -0700
Message-Id: <20210717202924.987514-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210717202924.987514-1-robdclark@gmail.com>
References: <20210717202924.987514-1-robdclark@gmail.com>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lee Jones <lee.jones@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Bernard Zhao <bernard@vivo.com>,
 Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Douglas Anderson <dianders@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

No idea why we were still using this.  It certainly hasn't been needed
for some time.  So drop the pointless twin codepaths.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c   |  4 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |  6 +--
 drivers/gpu/drm/msm/adreno/a5xx_power.c     |  2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |  7 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       | 12 ++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  2 +-
 drivers/gpu/drm/msm/msm_gem.c               | 56 ++++-----------------
 drivers/gpu/drm/msm/msm_gem.h               |  7 +--
 drivers/gpu/drm/msm/msm_gem_submit.c        |  2 +-
 drivers/gpu/drm/msm/msm_gpu.c               |  4 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c        |  2 +-
 13 files changed, 33 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
index fc2c905b6c9e..c9d11d57aed6 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
@@ -117,13 +117,13 @@ reset_set(void *data, u64 val)
 
 	if (a5xx_gpu->pm4_bo) {
 		msm_gem_unpin_iova(a5xx_gpu->pm4_bo, gpu->aspace);
-		drm_gem_object_put_locked(a5xx_gpu->pm4_bo);
+		drm_gem_object_put(a5xx_gpu->pm4_bo);
 		a5xx_gpu->pm4_bo = NULL;
 	}
 
 	if (a5xx_gpu->pfp_bo) {
 		msm_gem_unpin_iova(a5xx_gpu->pfp_bo, gpu->aspace);
-		drm_gem_object_put_locked(a5xx_gpu->pfp_bo);
+		drm_gem_object_put(a5xx_gpu->pfp_bo);
 		a5xx_gpu->pfp_bo = NULL;
 	}
 
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 7a271de9a212..0a93ed1d6b06 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1415,7 +1415,7 @@ struct a5xx_gpu_state {
 static int a5xx_crashdumper_init(struct msm_gpu *gpu,
 		struct a5xx_crashdumper *dumper)
 {
-	dumper->ptr = msm_gem_kernel_new_locked(gpu->dev,
+	dumper->ptr = msm_gem_kernel_new(gpu->dev,
 		SZ_1M, MSM_BO_WC, gpu->aspace,
 		&dumper->bo, &dumper->iova);
 
@@ -1517,7 +1517,7 @@ static void a5xx_gpu_state_get_hlsq_regs(struct msm_gpu *gpu,
 
 	if (a5xx_crashdumper_run(gpu, &dumper)) {
 		kfree(a5xx_state->hlsqregs);
-		msm_gem_kernel_put(dumper.bo, gpu->aspace, true);
+		msm_gem_kernel_put(dumper.bo, gpu->aspace);
 		return;
 	}
 
@@ -1525,7 +1525,7 @@ static void a5xx_gpu_state_get_hlsq_regs(struct msm_gpu *gpu,
 	memcpy(a5xx_state->hlsqregs, dumper.ptr + (256 * SZ_1K),
 		count * sizeof(u32));
 
-	msm_gem_kernel_put(dumper.bo, gpu->aspace, true);
+	msm_gem_kernel_put(dumper.bo, gpu->aspace);
 }
 
 static struct msm_gpu_state *a5xx_gpu_state_get(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_power.c b/drivers/gpu/drm/msm/adreno/a5xx_power.c
index cdb165236a88..0e63a1429189 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_power.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_power.c
@@ -362,7 +362,7 @@ void a5xx_gpmu_ucode_init(struct msm_gpu *gpu)
 	 */
 	bosize = (cmds_size + (cmds_size / TYPE4_MAX_PAYLOAD) + 1) << 2;
 
-	ptr = msm_gem_kernel_new_locked(drm, bosize,
+	ptr = msm_gem_kernel_new(drm, bosize,
 		MSM_BO_WC | MSM_BO_GPU_READONLY, gpu->aspace,
 		&a5xx_gpu->gpmu_bo, &a5xx_gpu->gpmu_iova);
 	if (IS_ERR(ptr))
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index ee72510ff8ce..8abc9a2b114a 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -240,7 +240,7 @@ static int preempt_init_ring(struct a5xx_gpu *a5xx_gpu,
 		A5XX_PREEMPT_COUNTER_SIZE,
 		MSM_BO_WC, gpu->aspace, &counters_bo, &counters_iova);
 	if (IS_ERR(counters)) {
-		msm_gem_kernel_put(bo, gpu->aspace, true);
+		msm_gem_kernel_put(bo, gpu->aspace);
 		return PTR_ERR(counters);
 	}
 
@@ -272,9 +272,8 @@ void a5xx_preempt_fini(struct msm_gpu *gpu)
 	int i;
 
 	for (i = 0; i < gpu->nr_rings; i++) {
-		msm_gem_kernel_put(a5xx_gpu->preempt_bo[i], gpu->aspace, true);
-		msm_gem_kernel_put(a5xx_gpu->preempt_counters_bo[i],
-			gpu->aspace, true);
+		msm_gem_kernel_put(a5xx_gpu->preempt_bo[i], gpu->aspace);
+		msm_gem_kernel_put(a5xx_gpu->preempt_counters_bo[i], gpu->aspace);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index b349692219b7..d7cec7f0dde0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1129,12 +1129,12 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
 
 static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu)
 {
-	msm_gem_kernel_put(gmu->hfi.obj, gmu->aspace, false);
-	msm_gem_kernel_put(gmu->debug.obj, gmu->aspace, false);
-	msm_gem_kernel_put(gmu->icache.obj, gmu->aspace, false);
-	msm_gem_kernel_put(gmu->dcache.obj, gmu->aspace, false);
-	msm_gem_kernel_put(gmu->dummy.obj, gmu->aspace, false);
-	msm_gem_kernel_put(gmu->log.obj, gmu->aspace, false);
+	msm_gem_kernel_put(gmu->hfi.obj, gmu->aspace);
+	msm_gem_kernel_put(gmu->debug.obj, gmu->aspace);
+	msm_gem_kernel_put(gmu->icache.obj, gmu->aspace);
+	msm_gem_kernel_put(gmu->dcache.obj, gmu->aspace);
+	msm_gem_kernel_put(gmu->dummy.obj, gmu->aspace);
+	msm_gem_kernel_put(gmu->log.obj, gmu->aspace);
 
 	gmu->aspace->mmu->funcs->detach(gmu->aspace->mmu);
 	msm_gem_address_space_put(gmu->aspace);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 9db9f7847ea8..a7df02298479 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1035,7 +1035,7 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 
 	if (adreno_gpu->base.hw_apriv || a6xx_gpu->has_whereami) {
 		if (!a6xx_gpu->shadow_bo) {
-			a6xx_gpu->shadow = msm_gem_kernel_new_locked(gpu->dev,
+			a6xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
 				sizeof(u32) * gpu->nr_rings,
 				MSM_BO_WC | MSM_BO_MAP_PRIV,
 				gpu->aspace, &a6xx_gpu->shadow_bo,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index ad4ea0ed5d99..e8f65cd8eca6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -112,7 +112,7 @@ static void *state_kmemdup(struct a6xx_gpu_state *a6xx_state, void *src,
 static int a6xx_crashdumper_init(struct msm_gpu *gpu,
 		struct a6xx_crashdumper *dumper)
 {
-	dumper->ptr = msm_gem_kernel_new_locked(gpu->dev,
+	dumper->ptr = msm_gem_kernel_new(gpu->dev,
 		SZ_1M, MSM_BO_WC, gpu->aspace,
 		&dumper->bo, &dumper->iova);
 
@@ -961,7 +961,7 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 		a6xx_get_clusters(gpu, a6xx_state, dumper);
 		a6xx_get_dbgahb_clusters(gpu, a6xx_state, dumper);
 
-		msm_gem_kernel_put(dumper->bo, gpu->aspace, true);
+		msm_gem_kernel_put(dumper->bo, gpu->aspace);
 	}
 
 	if (snapshot_debugbus)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 9f5a30234b33..bad4809b68ef 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -390,7 +390,7 @@ struct drm_gem_object *adreno_fw_create_bo(struct msm_gpu *gpu,
 	struct drm_gem_object *bo;
 	void *ptr;
 
-	ptr = msm_gem_kernel_new_locked(gpu->dev, fw->size - 4,
+	ptr = msm_gem_kernel_new(gpu->dev, fw->size - 4,
 		MSM_BO_WC | MSM_BO_GPU_READONLY, gpu->aspace, &bo, iova);
 
 	if (IS_ERR(ptr))
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 4c942e248e34..e24e1591f811 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1064,7 +1064,7 @@ void msm_gem_describe_objects(struct list_head *list, struct seq_file *m)
 }
 #endif
 
-/* don't call directly!  Use drm_gem_object_put_locked() and friends */
+/* don't call directly!  Use drm_gem_object_put() */
 void msm_gem_free_object(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
@@ -1195,8 +1195,7 @@ static int msm_gem_new_impl(struct drm_device *dev,
 	return 0;
 }
 
-static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
-		uint32_t size, uint32_t flags, bool struct_mutex_locked)
+struct drm_gem_object *msm_gem_new(struct drm_device *dev, uint32_t size, uint32_t flags)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj;
@@ -1283,26 +1282,10 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 	return obj;
 
 fail:
-	if (struct_mutex_locked) {
-		drm_gem_object_put_locked(obj);
-	} else {
-		drm_gem_object_put(obj);
-	}
+	drm_gem_object_put(obj);
 	return ERR_PTR(ret);
 }
 
-struct drm_gem_object *msm_gem_new_locked(struct drm_device *dev,
-		uint32_t size, uint32_t flags)
-{
-	return _msm_gem_new(dev, size, flags, true);
-}
-
-struct drm_gem_object *msm_gem_new(struct drm_device *dev,
-		uint32_t size, uint32_t flags)
-{
-	return _msm_gem_new(dev, size, flags, false);
-}
-
 struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 		struct dma_buf *dmabuf, struct sg_table *sgt)
 {
@@ -1361,12 +1344,12 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	return ERR_PTR(ret);
 }
 
-static void *_msm_gem_kernel_new(struct drm_device *dev, uint32_t size,
+void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size,
 		uint32_t flags, struct msm_gem_address_space *aspace,
-		struct drm_gem_object **bo, uint64_t *iova, bool locked)
+		struct drm_gem_object **bo, uint64_t *iova)
 {
 	void *vaddr;
-	struct drm_gem_object *obj = _msm_gem_new(dev, size, flags, locked);
+	struct drm_gem_object *obj = msm_gem_new(dev, size, flags);
 	int ret;
 
 	if (IS_ERR(obj))
@@ -1390,42 +1373,21 @@ static void *_msm_gem_kernel_new(struct drm_device *dev, uint32_t size,
 
 	return vaddr;
 err:
-	if (locked)
-		drm_gem_object_put_locked(obj);
-	else
-		drm_gem_object_put(obj);
+	drm_gem_object_put(obj);
 
 	return ERR_PTR(ret);
 
 }
 
-void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size,
-		uint32_t flags, struct msm_gem_address_space *aspace,
-		struct drm_gem_object **bo, uint64_t *iova)
-{
-	return _msm_gem_kernel_new(dev, size, flags, aspace, bo, iova, false);
-}
-
-void *msm_gem_kernel_new_locked(struct drm_device *dev, uint32_t size,
-		uint32_t flags, struct msm_gem_address_space *aspace,
-		struct drm_gem_object **bo, uint64_t *iova)
-{
-	return _msm_gem_kernel_new(dev, size, flags, aspace, bo, iova, true);
-}
-
 void msm_gem_kernel_put(struct drm_gem_object *bo,
-		struct msm_gem_address_space *aspace, bool locked)
+		struct msm_gem_address_space *aspace)
 {
 	if (IS_ERR_OR_NULL(bo))
 		return;
 
 	msm_gem_put_vaddr(bo);
 	msm_gem_unpin_iova(bo, aspace);
-
-	if (locked)
-		drm_gem_object_put_locked(bo);
-	else
-		drm_gem_object_put(bo);
+	drm_gem_object_put(bo);
 }
 
 void msm_gem_object_set_name(struct drm_gem_object *bo, const char *fmt, ...)
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index d69fcb37ce17..71ccf87a646b 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -154,16 +154,11 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 		uint32_t size, uint32_t flags, uint32_t *handle, char *name);
 struct drm_gem_object *msm_gem_new(struct drm_device *dev,
 		uint32_t size, uint32_t flags);
-struct drm_gem_object *msm_gem_new_locked(struct drm_device *dev,
-		uint32_t size, uint32_t flags);
 void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size,
 		uint32_t flags, struct msm_gem_address_space *aspace,
 		struct drm_gem_object **bo, uint64_t *iova);
-void *msm_gem_kernel_new_locked(struct drm_device *dev, uint32_t size,
-		uint32_t flags, struct msm_gem_address_space *aspace,
-		struct drm_gem_object **bo, uint64_t *iova);
 void msm_gem_kernel_put(struct drm_gem_object *bo,
-		struct msm_gem_address_space *aspace, bool locked);
+		struct msm_gem_address_space *aspace);
 struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 		struct dma_buf *dmabuf, struct sg_table *sgt);
 __printf(2, 3)
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 6d46f9275a40..e789f68d5be1 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -452,7 +452,7 @@ static void submit_cleanup(struct msm_gem_submit *submit)
 		struct msm_gem_object *msm_obj = submit->bos[i].obj;
 		submit_unlock_unpin_bo(submit, i, false);
 		list_del_init(&msm_obj->submit_entry);
-		drm_gem_object_put_locked(&msm_obj->base);
+		drm_gem_object_put(&msm_obj->base);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 3814d5ba20f2..ea4b27916a15 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -1104,7 +1104,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		gpu->rb[i] = NULL;
 	}
 
-	msm_gem_kernel_put(gpu->memptrs_bo, gpu->aspace, false);
+	msm_gem_kernel_put(gpu->memptrs_bo, gpu->aspace);
 
 	platform_set_drvdata(pdev, NULL);
 	return ret;
@@ -1123,7 +1123,7 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
 		gpu->rb[i] = NULL;
 	}
 
-	msm_gem_kernel_put(gpu->memptrs_bo, gpu->aspace, false);
+	msm_gem_kernel_put(gpu->memptrs_bo, gpu->aspace);
 
 	if (!IS_ERR_OR_NULL(gpu->aspace)) {
 		gpu->aspace->mmu->funcs->detach(gpu->aspace->mmu);
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index b9b8a3b2547b..a577db054613 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -67,7 +67,7 @@ void msm_ringbuffer_destroy(struct msm_ringbuffer *ring)
 
 	msm_fence_context_free(ring->fctx);
 
-	msm_gem_kernel_put(ring->bo, ring->gpu->aspace, false);
+	msm_gem_kernel_put(ring->bo, ring->gpu->aspace);
 
 	kfree(ring);
 }
-- 
2.31.1

