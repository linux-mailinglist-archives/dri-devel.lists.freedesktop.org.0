Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F39C580DB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:53:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63ABF10E83E;
	Thu, 13 Nov 2025 14:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ROnQjZM3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681D210E834
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:53:47 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b735ce67d1dso51368066b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763045626; x=1763650426; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BDmGhC4poHHOCVp4/+rZmG2NQB5w3fRb79F0uNoorl4=;
 b=ROnQjZM36APhj31RAnuy+SZJz9pEuaq32BD6AIX6rrf7sffvJFfThowicRrlNmQjsS
 NBrpHVfWyt6vGlj58JdIAxOTHGuUnu6i99SzYEYAq/EUZs7kby2J5cNv7/nnMguUvxYQ
 HlalbGshtkuvMqU6+nDu+2IDhNbNrMQi18qNMfaY87XWR/AnU3ml7CmK/iG4u2dHMOHy
 2T2YU4wDcLJvNTfAvkNlthAoIaXCJtuUNqNTH/VLS572KDTZdTOTwot2kmSEhbGWV074
 9N/nEbdp7lN245uAEr48vZFzIQ/2nUWNyj5a7c3bn2EGL1TMahiHm8g4BixaJhVIkjfD
 rnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763045626; x=1763650426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BDmGhC4poHHOCVp4/+rZmG2NQB5w3fRb79F0uNoorl4=;
 b=s73fYc2qANEkrFmBULL359VizO/PLKjlWerGDMls/INkk2KPf+CgFCcBsfr9ot9P4L
 J9mvsil2PB787dFGrJOT4o0BpmSH05CyAc2KvfwyEQNX6gRwSWByDbRTSqF+9hRcDyGA
 5Z4m64NdA/TMu47veN/Vd4997SmTSO6ZbSM3+8nrowhmrToZ9mjial5ruN/fE5FQDKKL
 uk8oQTN8AnOoYnZCIk46y19ywKXws+SB6V4DgrAqXwFWsboU9Ulx4DZz2juUmxoALNsC
 7lDRK0viDxcuxyFNjdQwouDcrHoTKZWmLW9IbffrqdlLTjdDIpv33cGCcF+h3M1Z6YRH
 JEMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/nROXarY1uq9aWnpTI0e050JVgd7V0QceNx9ZK4bwoEg+slkriW+meWtezOS/dYBuZmCKIuvjHSQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzg5JiPi4tD2BWBj42XMMvFhDR6hQEFRDZQ/Lna33DicFHKZ/AG
 bfIFmGutiZyT+QWbS4OVBxes959AQV1xkJvZW97lQvBCfKd3/Fgw49pP
X-Gm-Gg: ASbGncuZI945kpNpbzFYRLi8pkrWKHftfp/CT+30ujlvpf4Gb/BjlcHHUECSKRdK6Ea
 tyJoue5J0+d7EFcN9Cya0vL5pwf6KGnQGypZPDik94eCLNBPVPotwZQMvAvfclApVXVcYDVLHLJ
 oX/IWQr5yqb/S6A/LGBvvSY5LY9x03pXbrPNS6XrrORbZKls4EIKYDZGmwOjOhZi9cJ6BPO4Bv8
 GQmls2wVLOdKri6/Fa1eW3eGVc41O1R/YilwwUNfSiTl+symaO8IGKh4UzG5K0opSvVkmxvZaQG
 GTs1vXPjsPJodaJiYki1+K9MOHjwkoYg3mi4Z3YxdlUyC4aLEWdu+Yjim1OvlNjMQ+WEQ6rscZn
 KatGcn8r7lxHdDcpO22Kwr2NY8T9EnTMucVlc7mpPO0overWBsUIgrN2Oqz4ouYWd4H0pzdCjEF
 X56bXXVq3Lo/A=
X-Google-Smtp-Source: AGHT+IEHqf/W9Q9tHnOjUMme41DFJUZbZef46sbvtoKI6LdczIqJfDuJA/9Ol450qYhhIBwYOSiHvw==
X-Received: by 2002:a17:907:60d3:b0:b6d:7d46:52b2 with SMTP id
 a640c23a62f3a-b733197ed00mr714044566b.15.1763045625864; 
 Thu, 13 Nov 2025 06:53:45 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15aa:c600:cef:d94:436c:abc5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b73513b400fsm173747166b.1.2025.11.13.06.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 06:53:45 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
Subject: [PATCH 14/18] drm/amdgpu: independence for the amdgpu_userq__fence!
Date: Thu, 13 Nov 2025 15:51:51 +0100
Message-ID: <20251113145332.16805-15-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113145332.16805-1-christian.koenig@amd.com>
References: <20251113145332.16805-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This should allow amdgpu_userq_fences to outlive the amdgpu module.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 13 +----
 .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   | 54 ++++---------------
 .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.h   |  8 ---
 3 files changed, 11 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index cb522d6272d6..6431fb4a24c9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -3129,11 +3129,7 @@ static int __init amdgpu_init(void)
 
 	r = amdgpu_sync_init();
 	if (r)
-		goto error_sync;
-
-	r = amdgpu_userq_fence_slab_init();
-	if (r)
-		goto error_fence;
+		return r;
 
 	DRM_INFO("amdgpu kernel modesetting enabled.\n");
 	amdgpu_register_atpx_handler();
@@ -3150,12 +3146,6 @@ static int __init amdgpu_init(void)
 
 	/* let modprobe override vga console setting */
 	return pci_register_driver(&amdgpu_kms_pci_driver);
-
-error_fence:
-	amdgpu_sync_fini();
-
-error_sync:
-	return r;
 }
 
 static void __exit amdgpu_exit(void)
@@ -3165,7 +3155,6 @@ static void __exit amdgpu_exit(void)
 	amdgpu_unregister_atpx_handler();
 	amdgpu_acpi_release();
 	amdgpu_sync_fini();
-	amdgpu_userq_fence_slab_fini();
 	mmu_notifier_synchronize();
 	amdgpu_xcp_drv_release();
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index 99ae1d19b751..08c3da86b36d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -33,26 +33,6 @@
 #include "amdgpu_userq_fence.h"
 
 static const struct dma_fence_ops amdgpu_userq_fence_ops;
-static struct kmem_cache *amdgpu_userq_fence_slab;
-
-int amdgpu_userq_fence_slab_init(void)
-{
-	amdgpu_userq_fence_slab = kmem_cache_create("amdgpu_userq_fence",
-						    sizeof(struct amdgpu_userq_fence),
-						    0,
-						    SLAB_HWCACHE_ALIGN,
-						    NULL);
-	if (!amdgpu_userq_fence_slab)
-		return -ENOMEM;
-
-	return 0;
-}
-
-void amdgpu_userq_fence_slab_fini(void)
-{
-	rcu_barrier();
-	kmem_cache_destroy(amdgpu_userq_fence_slab);
-}
 
 static inline struct amdgpu_userq_fence *to_amdgpu_userq_fence(struct dma_fence *f)
 {
@@ -226,7 +206,7 @@ void amdgpu_userq_fence_driver_put(struct amdgpu_userq_fence_driver *fence_drv)
 
 static int amdgpu_userq_fence_alloc(struct amdgpu_userq_fence **userq_fence)
 {
-	*userq_fence = kmem_cache_alloc(amdgpu_userq_fence_slab, GFP_ATOMIC);
+	*userq_fence = kmalloc(sizeof(**userq_fence), GFP_ATOMIC);
 	return *userq_fence ? 0 : -ENOMEM;
 }
 
@@ -242,12 +222,11 @@ static int amdgpu_userq_fence_create(struct amdgpu_usermode_queue *userq,
 	if (!fence_drv)
 		return -EINVAL;
 
-	spin_lock_init(&userq_fence->lock);
 	INIT_LIST_HEAD(&userq_fence->link);
 	fence = &userq_fence->base;
 	userq_fence->fence_drv = fence_drv;
 
-	dma_fence_init64(fence, &amdgpu_userq_fence_ops, &userq_fence->lock,
+	dma_fence_init64(fence, &amdgpu_userq_fence_ops, NULL,
 			 fence_drv->context, seq);
 
 	amdgpu_userq_fence_driver_get(fence_drv);
@@ -317,35 +296,22 @@ static bool amdgpu_userq_fence_signaled(struct dma_fence *f)
 	rptr = amdgpu_userq_fence_read(fence_drv);
 	wptr = fence->base.seqno;
 
-	if (rptr >= wptr)
+	if (rptr >= wptr) {
+		amdgpu_userq_fence_driver_put(fence->fence_drv);
+		fence->fence_drv = NULL;
+
+		kvfree(fence->fence_drv_array);
+		fence->fence_drv_array = NULL;
 		return true;
+	}
 
 	return false;
 }
 
-static void amdgpu_userq_fence_free(struct rcu_head *rcu)
-{
-	struct dma_fence *fence = container_of(rcu, struct dma_fence, rcu);
-	struct amdgpu_userq_fence *userq_fence = to_amdgpu_userq_fence(fence);
-	struct amdgpu_userq_fence_driver *fence_drv = userq_fence->fence_drv;
-
-	/* Release the fence driver reference */
-	amdgpu_userq_fence_driver_put(fence_drv);
-
-	kvfree(userq_fence->fence_drv_array);
-	kmem_cache_free(amdgpu_userq_fence_slab, userq_fence);
-}
-
-static void amdgpu_userq_fence_release(struct dma_fence *f)
-{
-	call_rcu(&f->rcu, amdgpu_userq_fence_free);
-}
-
 static const struct dma_fence_ops amdgpu_userq_fence_ops = {
 	.get_driver_name = amdgpu_userq_fence_get_driver_name,
 	.get_timeline_name = amdgpu_userq_fence_get_timeline_name,
 	.signaled = amdgpu_userq_fence_signaled,
-	.release = amdgpu_userq_fence_release,
 };
 
 /**
@@ -559,7 +525,7 @@ int amdgpu_userq_signal_ioctl(struct drm_device *dev, void *data,
 	r = amdgpu_userq_fence_create(queue, userq_fence, wptr, &fence);
 	if (r) {
 		mutex_unlock(&userq_mgr->userq_mutex);
-		kmem_cache_free(amdgpu_userq_fence_slab, userq_fence);
+		kfree(userq_fence);
 		goto put_gobj_write;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h
index d76add2afc77..6f04782f3ea9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h
@@ -31,11 +31,6 @@
 
 struct amdgpu_userq_fence {
 	struct dma_fence base;
-	/*
-	 * This lock is necessary to synchronize the
-	 * userqueue dma fence operations.
-	 */
-	spinlock_t lock;
 	struct list_head link;
 	unsigned long fence_drv_array_count;
 	struct amdgpu_userq_fence_driver *fence_drv;
@@ -58,9 +53,6 @@ struct amdgpu_userq_fence_driver {
 	char timeline_name[TASK_COMM_LEN];
 };
 
-int amdgpu_userq_fence_slab_init(void);
-void amdgpu_userq_fence_slab_fini(void);
-
 void amdgpu_userq_fence_driver_get(struct amdgpu_userq_fence_driver *fence_drv);
 void amdgpu_userq_fence_driver_put(struct amdgpu_userq_fence_driver *fence_drv);
 int amdgpu_userq_fence_driver_alloc(struct amdgpu_device *adev,
-- 
2.43.0

