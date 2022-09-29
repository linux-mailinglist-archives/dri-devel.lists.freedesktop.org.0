Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C815EF64A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 15:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40F410EA58;
	Thu, 29 Sep 2022 13:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3820E10E61A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 13:21:47 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id r18so2725315eja.11
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 06:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=4ct5NI+KHGZM3NsYFSAfam6RWD9cCp2oRI3g1F2FtwA=;
 b=jEKJEfYZiCKVUbGZoPjCmKp7PaRZdJvNN0ux+WbjS0G41+z5qo9RUen9o6Cdbj1H29
 moWGwbtVWHyLJxdW+sTPVvRnpgE4/yXyhKlcBybRgxGyb5dlZShTtBRv3eI9tk2M4kQr
 WWG4Pq5EgJrLa0j9V4lHF1bVXk1ROkE0ASdhXbKrwOFyCE3HilMmMnjA5HXPhMCis8no
 eDd8PeTBcl0bcMD280nfI9fF6tG9uA1dDwptGQXyMwQXzt1heoJP+2a5eTTlUh9lkRms
 NSfX81NbRMN6ywjStckFoISpdeKmuhEmLB+dIeRO9lSCVI+w4Qb4JU6VPodSdKQWvVuK
 Gm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4ct5NI+KHGZM3NsYFSAfam6RWD9cCp2oRI3g1F2FtwA=;
 b=PWu0JkVUBe0Kmoye46VkiyYINUHhVdX2Il3pY0sqALFkQWwJZftYzh4JCvH42qthwQ
 kaGLfs/GdfNIV35BKrZtMzgujbaS1U6WcL99NSFbteM5NK/NU8mfkb7vogvgLQcfFEP1
 LhRXWHOUGU1LKDNbhdtFUua6Fdn4uxwoGtPKKN6fRuITBl/T1D+E9XGcf6rDk5msDc8B
 xTE2UUHTNOLXBvsqLnnDJtFlXzVuJJC5BffMyna27aTm1JHF/SljphF8sSO/QVh8pp/F
 pNIzdFS2XmdBz4eqra6EyEBkbUBPMUaGAmSIZs1+Ob35Si1hAHv1NufTVE+gDa0RRGnV
 3Zhg==
X-Gm-Message-State: ACrzQf2sGEKRxitJshXWvtA6t/5RWgJmM/ZbiaacFrRMgg0m3VmMoSR9
 WYLQ1trzgfpmAkMOdV18fLyeHA6TaA8=
X-Google-Smtp-Source: AMsMyM42c5w+y9rEOOLBSF1d3Ez/rF8Sk4dvO7QwZjo/mWpQdN4aSR0BqQbQX72xn7HhhecyWM4fbA==
X-Received: by 2002:a17:907:86ab:b0:781:f150:84e4 with SMTP id
 qa43-20020a17090786ab00b00781f15084e4mr2684651ejc.435.1664457705766; 
 Thu, 29 Sep 2022 06:21:45 -0700 (PDT)
Received: from able.fritz.box (p4fc20ebf.dip0.t-ipconnect.de. [79.194.14.191])
 by smtp.gmail.com with ESMTPSA id
 gx6-20020a1709068a4600b007836d075152sm3983807ejc.187.2022.09.29.06.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 06:21:45 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/13] drm/amdgpu: use scheduler depenencies for VM updates
Date: Thu, 29 Sep 2022 15:21:31 +0200
Message-Id: <20220929132136.1715-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220929132136.1715-1-christian.koenig@amd.com>
References: <20220929132136.1715-1-christian.koenig@amd.com>
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
Cc: shansheng.wang@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 luben.tuikov@amd.com, WenChieh.Chien@amd.com
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
index 6768af365f3b..df6fd6d6a82c 100644
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
@@ -225,7 +231,7 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
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

