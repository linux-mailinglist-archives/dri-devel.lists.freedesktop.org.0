Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E8E7F2260
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 01:40:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC63C10E20A;
	Tue, 21 Nov 2023 00:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6151610E012;
 Tue, 21 Nov 2023 00:40:31 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6cb55001124so1566494b3a.0; 
 Mon, 20 Nov 2023 16:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700527230; x=1701132030; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IqnPDeT1YoL9rNB4A1jsKDn6H/sLGf7y+LZ/0+TfYww=;
 b=Bds2ij9PBFUNlKFeeZR94E3OXbm7zAwOIMGkzJmWFlo4E9IqVbAgQaih+/EP356obC
 CYrlqc/SRV1RP08r5MmVAJd3891/bvMKbiot5u6ymniIQWOY95T3XrCXKk5VKhAc3y7D
 pVCftqnSRn1F3VR54QMEezbs0KTLMiuZfq+s2hPnXaem2w+Wn4/oRfE968XqfkRiv2ac
 uYB7x2PDAYJNq2LTA3qvzkyn2vDwsY0lU1Q80MZXRHmnx0PnSNeTvBOaV2juyQII7W5r
 y1fCbZnCaeGw6QUjlPze4+F8YsCRvn8O3j2ZG3pKddaND24kxCUUn+p8JuOg1DK0Vodo
 CEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700527230; x=1701132030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IqnPDeT1YoL9rNB4A1jsKDn6H/sLGf7y+LZ/0+TfYww=;
 b=jsWgWUrsEFD5o7COBCqwWHjEk2TnBhn31Qsa1kq97gRHcqGm2Bj4Gn4fkrivJYPuE/
 82u9i1ZB2lPtfs+f0V3PBQD8k9EACUFduWSxwC/2uSMHkcgux1+eoDqK+cXdTZYUxjzV
 GWbNYoeD6KSZyXh8nfq/Bh23GZVw+p43UydysokGfQRsiWTjeNVxCc4H0WKmXM0L94d+
 NBeZSWaRTI31LBSPSrxC85iNnVRsVz11DuO0dT7Pl7jI5gz+sAabJNndYHybe8SI53tO
 tZRNzAgexICIOVC5bOcFVQcj8VSseYJ5UvL8Ax0ZWyZnFIiBYrVY9qu3fPSPnbWJugC1
 B7pg==
X-Gm-Message-State: AOJu0YxLDaK+idNZVg9T99Jv4cAQ8HBLGlbWzYvKNCE8kd/SzkI98RuZ
 TIEnJz2NgYYzj+wTwcBWNE6PNsTbGjCK3A==
X-Google-Smtp-Source: AGHT+IEdMYmXseGPjw5igm2guOY42XEWsmT2PS9nDaTFF8MnEWea9REnHW9MVjovgwoeMbDg2kIzIQ==
X-Received: by 2002:a05:6a20:3d13:b0:187:962d:746b with SMTP id
 y19-20020a056a203d1300b00187962d746bmr1577161pzi.9.1700527229910; 
 Mon, 20 Nov 2023 16:40:29 -0800 (PST)
Received: from localhost ([47.215.232.245]) by smtp.gmail.com with ESMTPSA id
 fd26-20020a056a002e9a00b00688435a9915sm6659357pfb.189.2023.11.20.16.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 16:40:29 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/7] drm/exec: Pass in initial # of objects
Date: Mon, 20 Nov 2023 16:38:50 -0800
Message-ID: <20231121003935.5868-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121003935.5868-1-robdclark@gmail.com>
References: <20231121003935.5868-1-robdclark@gmail.com>
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
Cc: Karol Herbst <kherbst@redhat.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Lijo Lazar <lijo.lazar@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Arthur Grillo <arthurgrillo@riseup.net>, Rob Clark <robdclark@chromium.org>,
 Leo Liu <leo.liu@amd.com>, Guchun Chen <guchun.chen@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 "open list:AMD KFD" <amd-gfx@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Veerabadhran Gopalakrishnan <Veerabadhran.Gopalakrishnan@amd.com>,
 Philip Yang <Philip.Yang@amd.com>, linux-arm-msm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Jack Xiao <Jack.Xiao@amd.com>,
 Jonathan Kim <jonathan.kim@amd.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 freedreno@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Yang Li <yang.lee@linux.alibaba.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Lang Yu <Lang.Yu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In cases where the # is known ahead of time, it is silly to do the table
resize dance.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |  8 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c          |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c          |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c          |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c     |  4 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c             |  2 +-
 drivers/gpu/drm/drm_exec.c                       | 13 ++++++++++---
 drivers/gpu/drm/nouveau/nouveau_exec.c           |  2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c           |  2 +-
 drivers/gpu/drm/tests/drm_exec_test.c            | 16 ++++++++--------
 include/drm/drm_exec.h                           |  2 +-
 12 files changed, 35 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 41fbc4fd0fac..0bd3c4a6267a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1137,7 +1137,7 @@ static int reserve_bo_and_vm(struct kgd_mem *mem,
 
 	ctx->n_vms = 1;
 	ctx->sync = &mem->sync;
-	drm_exec_init(&ctx->exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_init(&ctx->exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
 	drm_exec_until_all_locked(&ctx->exec) {
 		ret = amdgpu_vm_lock_pd(vm, &ctx->exec, 2);
 		drm_exec_retry_on_contention(&ctx->exec);
@@ -1176,7 +1176,7 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
 	int ret;
 
 	ctx->sync = &mem->sync;
-	drm_exec_init(&ctx->exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_init(&ctx->exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
 	drm_exec_until_all_locked(&ctx->exec) {
 		ctx->n_vms = 0;
 		list_for_each_entry(entry, &mem->attachments, list) {
@@ -2552,7 +2552,7 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
 
 	amdgpu_sync_create(&sync);
 
-	drm_exec_init(&exec, 0);
+	drm_exec_init(&exec, 0, 0);
 	/* Reserve all BOs and page tables for validation */
 	drm_exec_until_all_locked(&exec) {
 		/* Reserve all the page directories */
@@ -2793,7 +2793,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 
 	mutex_lock(&process_info->lock);
 
-	drm_exec_init(&exec, 0);
+	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
 		list_for_each_entry(peer_vm, &process_info->vm_list_head,
 				    vm_list_node) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index df3ecfa9e13f..2464606494d4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -66,7 +66,7 @@ static int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p,
 
 	amdgpu_sync_create(&p->sync);
 	drm_exec_init(&p->exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
-		      DRM_EXEC_IGNORE_DUPLICATES);
+		      DRM_EXEC_IGNORE_DUPLICATES, 0);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
index 720011019741..796fa6f1420b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
@@ -70,7 +70,7 @@ int amdgpu_map_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	struct drm_exec exec;
 	int r;
 
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
 	drm_exec_until_all_locked(&exec) {
 		r = amdgpu_vm_lock_pd(vm, &exec, 0);
 		if (likely(!r))
@@ -110,7 +110,7 @@ int amdgpu_unmap_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	struct drm_exec exec;
 	int r;
 
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
 	drm_exec_until_all_locked(&exec) {
 		r = amdgpu_vm_lock_pd(vm, &exec, 0);
 		if (likely(!r))
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 84beeaa4d21c..49a5f1c73b3e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -203,7 +203,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
 	struct drm_exec exec;
 	long r;
 
-	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES);
+	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
 	drm_exec_until_all_locked(&exec) {
 		r = drm_exec_prepare_obj(&exec, &bo->tbo.base, 1);
 		drm_exec_retry_on_contention(&exec);
@@ -739,7 +739,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 	}
 
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
-		      DRM_EXEC_IGNORE_DUPLICATES);
+		      DRM_EXEC_IGNORE_DUPLICATES, 0);
 	drm_exec_until_all_locked(&exec) {
 		if (gobj) {
 			r = drm_exec_lock_obj(&exec, gobj);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index 9ddbf1494326..abd0b9763904 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -1122,7 +1122,7 @@ int amdgpu_mes_ctx_map_meta_data(struct amdgpu_device *adev,
 
 	amdgpu_sync_create(&sync);
 
-	drm_exec_init(&exec, 0);
+	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
 		r = drm_exec_lock_obj(&exec,
 				      &ctx_data->meta_data_obj->tbo.base);
@@ -1193,7 +1193,7 @@ int amdgpu_mes_ctx_unmap_meta_data(struct amdgpu_device *adev,
 	struct drm_exec exec;
 	long r;
 
-	drm_exec_init(&exec, 0);
+	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
 		r = drm_exec_lock_obj(&exec,
 				      &ctx_data->meta_data_obj->tbo.base);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
index ca45ba8ac171..bfbf59326ee1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
@@ -86,7 +86,7 @@ static int map_ring_data(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 
 	amdgpu_sync_create(&sync);
 
-	drm_exec_init(&exec, 0);
+	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
 		r = drm_exec_lock_obj(&exec, &bo->tbo.base);
 		drm_exec_retry_on_contention(&exec);
@@ -149,7 +149,7 @@ static int unmap_ring_data(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	struct drm_exec exec;
 	long r;
 
-	drm_exec_init(&exec, 0);
+	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
 		r = drm_exec_lock_obj(&exec, &bo->tbo.base);
 		drm_exec_retry_on_contention(&exec);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index f2f3c338fd94..76d9f14ccc7c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1529,7 +1529,7 @@ static int svm_range_reserve_bos(struct svm_validate_context *ctx, bool intr)
 	uint32_t gpuidx;
 	int r;
 
-	drm_exec_init(&ctx->exec, intr ? DRM_EXEC_INTERRUPTIBLE_WAIT: 0);
+	drm_exec_init(&ctx->exec, intr ? DRM_EXEC_INTERRUPTIBLE_WAIT: 0, 0);
 	drm_exec_until_all_locked(&ctx->exec) {
 		for_each_set_bit(gpuidx, ctx->bitmap, MAX_GPU_INSTANCE) {
 			pdd = kfd_process_device_from_gpuidx(ctx->process, gpuidx);
diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index 5d2809de4517..48ee851b61d9 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -69,16 +69,23 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
  * drm_exec_init - initialize a drm_exec object
  * @exec: the drm_exec object to initialize
  * @flags: controls locking behavior, see DRM_EXEC_* defines
+ * @nr: the initial # of objects
  *
  * Initialize the object and make sure that we can track locked objects.
+ *
+ * If nr is non-zero then it is used as the initial objects table size.
+ * In either case, the table will grow (be re-allocated) on demand.
  */
-void drm_exec_init(struct drm_exec *exec, uint32_t flags)
+void drm_exec_init(struct drm_exec *exec, uint32_t flags, unsigned nr)
 {
+	if (!nr)
+		nr = PAGE_SIZE / sizeof(void *);
+
 	exec->flags = flags;
-	exec->objects = kmalloc(PAGE_SIZE, GFP_KERNEL);
+	exec->objects = kvmalloc_array(nr, sizeof(void *), GFP_KERNEL);
 
 	/* If allocation here fails, just delay that till the first use */
-	exec->max_objects = exec->objects ? PAGE_SIZE / sizeof(void *) : 0;
+	exec->max_objects = exec->objects ? nr : 0;
 	exec->num_objects = 0;
 	exec->contended = DRM_EXEC_DUMMY;
 	exec->prelocked = NULL;
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
index 9a5ef574744b..769392276e4f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.c
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -103,7 +103,7 @@ nouveau_exec_job_submit(struct nouveau_job *job)
 
 	nouveau_uvmm_lock(uvmm);
 	drm_exec_init(exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
-			    DRM_EXEC_IGNORE_DUPLICATES);
+			    DRM_EXEC_IGNORE_DUPLICATES, 0);
 	drm_exec_until_all_locked(exec) {
 		struct drm_gpuva *va;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 5cf892c50f43..f93cfccc2c93 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1288,7 +1288,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 	}
 
 	drm_exec_init(exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
-			    DRM_EXEC_IGNORE_DUPLICATES);
+			    DRM_EXEC_IGNORE_DUPLICATES, 0);
 	drm_exec_until_all_locked(exec) {
 		list_for_each_op(op, &bind_job->ops) {
 			struct drm_gpuva_op *va_op;
diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
index 563949d777dd..81f928a429ba 100644
--- a/drivers/gpu/drm/tests/drm_exec_test.c
+++ b/drivers/gpu/drm/tests/drm_exec_test.c
@@ -46,7 +46,7 @@ static void sanitycheck(struct kunit *test)
 {
 	struct drm_exec exec;
 
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
 	drm_exec_fini(&exec);
 	KUNIT_SUCCEED(test);
 }
@@ -60,7 +60,7 @@ static void test_lock(struct kunit *test)
 
 	drm_gem_private_object_init(priv->drm, &gobj, PAGE_SIZE);
 
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
 	drm_exec_until_all_locked(&exec) {
 		ret = drm_exec_lock_obj(&exec, &gobj);
 		drm_exec_retry_on_contention(&exec);
@@ -80,7 +80,7 @@ static void test_lock_unlock(struct kunit *test)
 
 	drm_gem_private_object_init(priv->drm, &gobj, PAGE_SIZE);
 
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
 	drm_exec_until_all_locked(&exec) {
 		ret = drm_exec_lock_obj(&exec, &gobj);
 		drm_exec_retry_on_contention(&exec);
@@ -107,7 +107,7 @@ static void test_duplicates(struct kunit *test)
 
 	drm_gem_private_object_init(priv->drm, &gobj, PAGE_SIZE);
 
-	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES);
+	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
 	drm_exec_until_all_locked(&exec) {
 		ret = drm_exec_lock_obj(&exec, &gobj);
 		drm_exec_retry_on_contention(&exec);
@@ -134,7 +134,7 @@ static void test_prepare(struct kunit *test)
 
 	drm_gem_private_object_init(priv->drm, &gobj, PAGE_SIZE);
 
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
 	drm_exec_until_all_locked(&exec) {
 		ret = drm_exec_prepare_obj(&exec, &gobj, 1);
 		drm_exec_retry_on_contention(&exec);
@@ -159,7 +159,7 @@ static void test_prepare_array(struct kunit *test)
 	drm_gem_private_object_init(priv->drm, &gobj1, PAGE_SIZE);
 	drm_gem_private_object_init(priv->drm, &gobj2, PAGE_SIZE);
 
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
 	drm_exec_until_all_locked(&exec)
 		ret = drm_exec_prepare_array(&exec, array, ARRAY_SIZE(array),
 					     1);
@@ -174,14 +174,14 @@ static void test_multiple_loops(struct kunit *test)
 {
 	struct drm_exec exec;
 
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
 	drm_exec_until_all_locked(&exec)
 	{
 		break;
 	}
 	drm_exec_fini(&exec);
 
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
 	drm_exec_until_all_locked(&exec)
 	{
 		break;
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index b5bf0b6da791..f1a66c048721 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -135,7 +135,7 @@ static inline bool drm_exec_is_contended(struct drm_exec *exec)
 	return !!exec->contended;
 }
 
-void drm_exec_init(struct drm_exec *exec, uint32_t flags);
+void drm_exec_init(struct drm_exec *exec, uint32_t flags, unsigned nr);
 void drm_exec_fini(struct drm_exec *exec);
 bool drm_exec_cleanup(struct drm_exec *exec);
 int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj);
-- 
2.42.0

