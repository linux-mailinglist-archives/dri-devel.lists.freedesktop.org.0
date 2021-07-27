Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA82D3D7BA9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 19:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA88A6EB9E;
	Tue, 27 Jul 2021 17:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F98E6EB6B;
 Tue, 27 Jul 2021 17:07:48 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id b6so132666pji.4;
 Tue, 27 Jul 2021 10:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uO2HYOoAAJy6NDFhObwqMaYdR8fEVEI5qdx4UYizLzE=;
 b=Ck5x1aBEemGn+JqFD9ar8IfK2SvYR52Jp1IDUsNzXvP46T5Tu9l6ZD3k5STjUKtqtI
 B0rgApyFf9rnN9uwZ/LrwyLfP/QPm3DL1jhFZt8BuFErAVe5gcwZDff4OhWQFIzQj6yy
 qMx4bNwzliSHnnUg2mUleHTivqlAP01BIC1UI3S/4uYBP6pBgmXJMs/keBODDPTjd0p4
 Jezdn1OXciipDsVeB2X3l2Y10BeEMNTbmDrVsbMDfnVlJTWvbK7LjMLeSrm+NcgBdo4G
 SQ9yZ+phVv6gGmAu0XIY8V9sjj/PB5nz3FvBSTZOgGCLEL1wZl+k08n/hxgB/XFxpvUY
 Ctlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uO2HYOoAAJy6NDFhObwqMaYdR8fEVEI5qdx4UYizLzE=;
 b=H4IEcBbZDhToY4rqJXhUdwZhi+rhAyHL54QG75by/7WigL1q5sSIqxdp+mTgYVGcik
 ctFpIPPIVPjbt71k8g43u7i953gmsbz0tgiDylLZNZwHQgAytJkTEFGt9HBip3cwedfq
 O992YAMloZbyHApH0V7NQKaLfh3jx8l2yan3XHUcA1Hyr480fc8YOftu48AmJBLku7DC
 wCDOVpwL6KZC3o3Ub7ncGfeBhbU7sw4Ry9zY6dnTKElDtP6zZHJ2UEDE7l8wPFp5P1al
 kCNAOyXkqtEpJZv4AaOEDyrBZC2cLhqAVSvsyFWhf5J3wkQKsrlRul4OhOyxO8oz2qzo
 Ahbg==
X-Gm-Message-State: AOAM530WZm5MMNg20+7C53mfLxSWBzjAzrx5a9C5Vd60mWtXYxStimI5
 pPQv0pz2cSWbeok7nsyzmqr4LsT3n9cQJhlZ
X-Google-Smtp-Source: ABdhPJwfyYweNdYHOk6J5RSmFPv7xNBIUJn1zSYbEq7wCX0Vq2lGAyrkMYTf4+123qUJlBMUaPXMfg==
X-Received: by 2002:a62:7c16:0:b029:329:8d4c:d12d with SMTP id
 x22-20020a627c160000b02903298d4cd12dmr24236612pfc.47.1627405667562; 
 Tue, 27 Jul 2021 10:07:47 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id g5sm4122306pfj.212.2021.07.27.10.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 10:07:46 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 03/13] drm/msm: drop drm_gem_object_put_locked()
Date: Tue, 27 Jul 2021 10:11:19 -0700
Message-Id: <20210727171143.2549475-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727171143.2549475-1-robdclark@gmail.com>
References: <20210727171143.2549475-1-robdclark@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Eric Anholt <eric@anholt.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lee Jones <lee.jones@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Bernard Zhao <bernard@vivo.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>, Sean Paul <sean@poorly.run>,
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

No idea why we were still using this.  It certainly hasn't been needed
for some time.  So drop the pointless twin codepaths.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Christian König <christian.koenig@amd.com>
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
index 91f637b908f4..55ea136b8933 100644
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
index 5b665ed8a605..4e99c448b83a 100644
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
index c4ed8694f721..a0589666b1a3 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -992,7 +992,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		gpu->rb[i] = NULL;
 	}
 
-	msm_gem_kernel_put(gpu->memptrs_bo, gpu->aspace, false);
+	msm_gem_kernel_put(gpu->memptrs_bo, gpu->aspace);
 
 	platform_set_drvdata(pdev, NULL);
 	return ret;
@@ -1011,7 +1011,7 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
 		gpu->rb[i] = NULL;
 	}
 
-	msm_gem_kernel_put(gpu->memptrs_bo, gpu->aspace, false);
+	msm_gem_kernel_put(gpu->memptrs_bo, gpu->aspace);
 
 	if (!IS_ERR_OR_NULL(gpu->aspace)) {
 		gpu->aspace->mmu->funcs->detach(gpu->aspace->mmu);
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 054461662af5..437cca57d005 100644
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

