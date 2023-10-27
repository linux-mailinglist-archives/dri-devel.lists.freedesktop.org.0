Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2187D9E62
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 18:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D8810EA1B;
	Fri, 27 Oct 2023 16:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B55310EA1F;
 Fri, 27 Oct 2023 16:59:32 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6b201a93c9cso2188034b3a.0; 
 Fri, 27 Oct 2023 09:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698425971; x=1699030771; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q8RmDco3yC3v+3yvrh6eYN9grmgq77s+0DKqGNckmlM=;
 b=Gbep6wYJaxrb9wj+bsCTVpXjJtWLCDYK8P3k89UpAM03ThR/c8XseoCTBdR/yFPl5x
 MV/dMI27WLZjcEDt8eCyRdsh920aGnXDeLDRcJC6+3kpxICvfvQ3v3p2hosTm7c5D/ck
 1X6cyG+LPpan3LHjYD13J4OZHG5ItDntfYDFsFvpcBm3N+cArpn7CuTbmpo4c3oRr3uM
 TpBKbItSfRheMDQ8fvG8gXJp3aPVrlXbYyF4KNBE0HKWTveDW9k6R3qnS8Rljihwrmup
 YQvrXMRlFLjjnN8sRhnikklbG0d7/CSE872gJ0Y9HB5kUe5SLsAAhmA9iQvhjpPYAu5t
 Jw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698425971; x=1699030771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q8RmDco3yC3v+3yvrh6eYN9grmgq77s+0DKqGNckmlM=;
 b=uSVNQByHJtnYhKhmyeh4ch51iT2ldmme3pP4n2Hrto0+XE1k4evy1jDz/kGtWn2kWQ
 NA+dIpyRbvd5gOvhNjlkC1S5ue8gpkxvCx1CXZYv+Oo1ev8VUV8DBpoyNSnPF6DYP5FX
 XTyOfu/E8UH1kS/fHkEXtNPVFgvTelrY6YiSOCSCHSxXTomBpYTWxJUpE3zUvXvBFlbv
 QVPwHO00h0naOCeaeSA9xiqv4swkHYQOWPMz68u/kHUP2hCcJtDp6+C0PiM2tdGNTyD6
 w8VEAz1iXtEc5UdqTxQ8yfFwS3QjJSgK8KA2/Jd/xT8xcEE3aVqJueJbdFYYN+OrtI6L
 +SDQ==
X-Gm-Message-State: AOJu0YzJAld9c2dWv+JDmTStniWcCiYLcEuU7dPdD9DVSiuykaUWAHTz
 GZ69SesFMUcjWHdH2F14JEbPaoBqAcaIWg==
X-Google-Smtp-Source: AGHT+IGcCDjD1BW09esItqwaRO3LZ9+ZgRLPW1fpZoKAd4lXmN90PAUSB93jicmG79kEPwmifa05mw==
X-Received: by 2002:a05:6a00:2356:b0:6b1:bf32:4fb5 with SMTP id
 j22-20020a056a00235600b006b1bf324fb5mr3294581pfj.28.1698425971178; 
 Fri, 27 Oct 2023 09:59:31 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 r8-20020aa78b88000000b006b4ca26f3c9sm1605609pfd.74.2023.10.27.09.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 09:59:30 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/7] drm/exec: Pass in initial # of objects
Date: Fri, 27 Oct 2023 09:58:40 -0700
Message-ID: <20231027165859.395638-7-robdclark@gmail.com>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Karol Herbst <kherbst@redhat.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Mario Limonciello <mario.limonciello@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Rob Clark <robdclark@chromium.org>, Guchun Chen <guchun.chen@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Dong Chenchen <dongchenchen2@huawei.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>, Philip Yang <Philip.Yang@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Jonathan Kim <jonathan.kim@amd.com>, freedreno@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lang Yu <Lang.Yu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In cases where the # is known ahead of time, it is silly to do the table
resize dance.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c |  4 ++--
 drivers/gpu/drm/drm_exec.c              | 15 ++++++++++++---
 drivers/gpu/drm/nouveau/nouveau_exec.c  |  2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  |  2 +-
 include/drm/drm_exec.h                  |  2 +-
 8 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index efdb1c48f431..d27ca8f61929 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -65,7 +65,7 @@ static int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p,
 	}
 
 	amdgpu_sync_create(&p->sync);
-	drm_exec_init(&p->exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_init(&p->exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
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
index ca4d2d430e28..16f1715148ad 100644
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
index b6015157763a..3c351941701e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -1105,7 +1105,7 @@ int amdgpu_mes_ctx_map_meta_data(struct amdgpu_device *adev,
 
 	amdgpu_sync_create(&sync);
 
-	drm_exec_init(&exec, 0);
+	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
 		r = drm_exec_lock_obj(&exec,
 				      &ctx_data->meta_data_obj->tbo.base);
@@ -1176,7 +1176,7 @@ int amdgpu_mes_ctx_unmap_meta_data(struct amdgpu_device *adev,
 	struct drm_exec exec;
 	long r;
 
-	drm_exec_init(&exec, 0);
+	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
 		r = drm_exec_lock_obj(&exec,
 				      &ctx_data->meta_data_obj->tbo.base);
diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index 5d2809de4517..27d11c20d148 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -69,16 +69,25 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
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
+	size_t sz = PAGE_SIZE;
+
+	if (nr)
+		sz = (size_t)nr * sizeof(void *);
+
 	exec->flags = flags;
-	exec->objects = kmalloc(PAGE_SIZE, GFP_KERNEL);
+	exec->objects = kmalloc(sz, GFP_KERNEL);
 
 	/* If allocation here fails, just delay that till the first use */
-	exec->max_objects = exec->objects ? PAGE_SIZE / sizeof(void *) : 0;
+	exec->max_objects = exec->objects ? sz / sizeof(void *) : 0;
 	exec->num_objects = 0;
 	exec->contended = DRM_EXEC_DUMMY;
 	exec->prelocked = NULL;
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
index 19024ce21fbb..f5930cc0b3fb 100644
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
index aae780e4a4aa..3a9331a1c830 100644
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
2.41.0

