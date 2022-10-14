Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8794E5FEAE3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 10:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F8E10EAB8;
	Fri, 14 Oct 2022 08:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7357C10EA9C;
 Fri, 14 Oct 2022 08:46:55 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id a67so5866469edf.12;
 Fri, 14 Oct 2022 01:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N+fhjhNR5sjKd/t1mRZ3HvTFY2Se8EEvrqO/LVaiUTE=;
 b=nJ+odx2Vn2cZbOFQjVSEmJgG2T5zJG4id3EhP9FBLbiSSbfve4WgMCHCjohEy9dgaT
 KsbRkhlSnSb5ffQ1xihWSpximpM60bAYzLz7Ur5PG8Vb5bEayu7GO+DyzUCKNIu+sFOI
 yxO0bI6rSjJ50yw1mrLL5d8AbcFXfH935aZL63RgCzQgfEmqKRk0Szm8yWeg/w4crjEY
 QA9muddS7Y7j/9k4XyK2GxEECziaQcZ5XhgZA1d+B2Gmp0iPIbSFw1nfHu5vxJ9e0m7k
 0HjmD22+X7TbXKaTjYtqoIWSS8B9M+rGH+VNhCtoapteUH3BA8SuRzG/3YQ2JLL7xP67
 uKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N+fhjhNR5sjKd/t1mRZ3HvTFY2Se8EEvrqO/LVaiUTE=;
 b=Xa4ArmOFOjix9hUGMhhvCv74JfmsJZlKWCCZDwVjkTG3koe96GU5y2ilKa6Y3wIv0h
 Q9AL6msk5mZLWQeyK4dW5GXidAxV2mkG2I13L9F6xz8JWN52dv+WZA2R+ObLe9DxdxwQ
 Ma3magyOQ46yl2k0yMpex5hq7B//n5tbWgWz+hWFoAyZQ/y2bCDq6hVki5e8+9/GHdp/
 S+9GrksOzurhNC4IGe1Oikb1a6rPKZ0NHPA3jsHJ4xxOnq7LIEQNY9DH/AiQYdid+ERP
 TZ8554DtV0Po5wqRuxe2feMYzaPhFODvQL58So41e4eVeAG1XuweA5K6/AKYuJwOw7q/
 pbuw==
X-Gm-Message-State: ACrzQf0PdU9dArb1D5ksZ+YuA24eGYa9RuGGkJGtjvK7GqzS62ygaBgE
 eufNqlgZzdue9uzRo6s6PIQ=
X-Google-Smtp-Source: AMsMyM5ZEIoHr9RoQP2o7GcFQrzEHMrWwqjxQnMywDy5xkRtLGxkiCPYM3vKv2DWkwm7JMs222iAvA==
X-Received: by 2002:aa7:cd4f:0:b0:458:6077:c3ac with SMTP id
 v15-20020aa7cd4f000000b004586077c3acmr3443611edw.32.1665737213577; 
 Fri, 14 Oct 2022 01:46:53 -0700 (PDT)
Received: from able.fritz.box (p5b0eacfe.dip0.t-ipconnect.de. [91.14.172.254])
 by smtp.gmail.com with ESMTPSA id
 r26-20020aa7d59a000000b00457618d3409sm1379124edq.68.2022.10.14.01.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:46:53 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 08/13] drm/amdgpu: use scheduler depenencies for VM updates
Date: Fri, 14 Oct 2022 10:46:36 +0200
Message-Id: <20221014084641.128280-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221014084641.128280-1-christian.koenig@amd.com>
References: <20221014084641.128280-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of putting that into the job sync object.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c    | 56 +++++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h    |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 10 +++-
 3 files changed, 52 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index 090e66a1b284..bac7976975bd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -259,6 +259,14 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
 	return 0;
 }
 
+/* Free the entry back to the slab */
+static void amdgpu_sync_entry_free(struct amdgpu_sync_entry *e)
+{
+	hash_del(&e->node);
+	dma_fence_put(e->fence);
+	kmem_cache_free(amdgpu_sync_slab, e);
+}
+
 /**
  * amdgpu_sync_peek_fence - get the next fence not signaled yet
  *
@@ -280,9 +288,7 @@ struct dma_fence *amdgpu_sync_peek_fence(struct amdgpu_sync *sync,
 		struct drm_sched_fence *s_fence = to_drm_sched_fence(f);
 
 		if (dma_fence_is_signaled(f)) {
-			hash_del(&e->node);
-			dma_fence_put(f);
-			kmem_cache_free(amdgpu_sync_slab, e);
+			amdgpu_sync_entry_free(e);
 			continue;
 		}
 		if (ring && s_fence) {
@@ -355,15 +361,42 @@ int amdgpu_sync_clone(struct amdgpu_sync *source, struct amdgpu_sync *clone)
 			if (r)
 				return r;
 		} else {
-			hash_del(&e->node);
-			dma_fence_put(f);
-			kmem_cache_free(amdgpu_sync_slab, e);
+			amdgpu_sync_entry_free(e);
 		}
 	}
 
 	return 0;
 }
 
+/**
+ * amdgpu_sync_push_to_job - push fences into job
+ * @sync: sync object to get the fences from
+ * @job: job to push the fences into
+ *
+ * Add all unsignaled fences from sync to job.
+ */
+int amdgpu_sync_push_to_job(struct amdgpu_sync *sync, struct amdgpu_job *job)
+{
+	struct amdgpu_sync_entry *e;
+	struct hlist_node *tmp;
+	struct dma_fence *f;
+	int i, r;
+
+	hash_for_each_safe(sync->fences, i, tmp, e, node) {
+		f = e->fence;
+		if (dma_fence_is_signaled(f)) {
+			amdgpu_sync_entry_free(e);
+			continue;
+		}
+
+		dma_fence_get(f);
+		r = drm_sched_job_add_dependency(&job->base, f);
+		if (r)
+			return r;
+	}
+	return 0;
+}
+
 int amdgpu_sync_wait(struct amdgpu_sync *sync, bool intr)
 {
 	struct amdgpu_sync_entry *e;
@@ -375,9 +408,7 @@ int amdgpu_sync_wait(struct amdgpu_sync *sync, bool intr)
 		if (r)
 			return r;
 
-		hash_del(&e->node);
-		dma_fence_put(e->fence);
-		kmem_cache_free(amdgpu_sync_slab, e);
+		amdgpu_sync_entry_free(e);
 	}
 
 	return 0;
@@ -396,11 +427,8 @@ void amdgpu_sync_free(struct amdgpu_sync *sync)
 	struct hlist_node *tmp;
 	unsigned int i;
 
-	hash_for_each_safe(sync->fences, i, tmp, e, node) {
-		hash_del(&e->node);
-		dma_fence_put(e->fence);
-		kmem_cache_free(amdgpu_sync_slab, e);
-	}
+	hash_for_each_safe(sync->fences, i, tmp, e, node)
+		amdgpu_sync_entry_free(e);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h
index 2d5c613cda10..cf1e9e858efd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h
@@ -30,6 +30,7 @@ struct dma_fence;
 struct dma_resv;
 struct amdgpu_device;
 struct amdgpu_ring;
+struct amdgpu_job;
 
 enum amdgpu_sync_mode {
 	AMDGPU_SYNC_ALWAYS,
@@ -54,6 +55,7 @@ struct dma_fence *amdgpu_sync_peek_fence(struct amdgpu_sync *sync,
 				     struct amdgpu_ring *ring);
 struct dma_fence *amdgpu_sync_get_fence(struct amdgpu_sync *sync);
 int amdgpu_sync_clone(struct amdgpu_sync *source, struct amdgpu_sync *clone);
+int amdgpu_sync_push_to_job(struct amdgpu_sync *sync, struct amdgpu_job *job);
 int amdgpu_sync_wait(struct amdgpu_sync *sync, bool intr);
 void amdgpu_sync_free(struct amdgpu_sync *sync);
 int amdgpu_sync_init(void);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index 126364882d09..59cf64216fbb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -87,6 +87,7 @@ static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
 				  struct dma_resv *resv,
 				  enum amdgpu_sync_mode sync_mode)
 {
+	struct amdgpu_sync sync;
 	int r;
 
 	r = amdgpu_vm_sdma_alloc_job(p, 0);
@@ -96,7 +97,12 @@ static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
 	if (!resv)
 		return 0;
 
-	return amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode, p->vm);
+	amdgpu_sync_create(&sync);
+	r = amdgpu_sync_resv(p->adev, &sync, resv, sync_mode, p->vm);
+	if (!r)
+		r = amdgpu_sync_push_to_job(&sync, p->job);
+	amdgpu_sync_free(&sync);
+	return r;
 }
 
 /**
@@ -232,7 +238,7 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
 	/* Wait for PD/PT moves to be completed */
 	dma_resv_iter_begin(&cursor, bo->tbo.base.resv, DMA_RESV_USAGE_KERNEL);
 	dma_resv_for_each_fence_unlocked(&cursor, fence) {
-		r = amdgpu_sync_fence(&p->job->sync, fence);
+		r = drm_sched_job_add_dependency(&p->job->base, fence);
 		if (r) {
 			dma_resv_iter_end(&cursor);
 			return r;
-- 
2.25.1

