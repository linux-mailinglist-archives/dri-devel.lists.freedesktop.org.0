Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE383CD427
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 13:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D216E064;
	Mon, 19 Jul 2021 11:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EB26E064
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 11:51:48 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so10315674wmc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 04:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ghoVNwvsrr9T33USohPlLcZV++g7cgeRTTFhGrVS6Qs=;
 b=cMVcAbo9fuxcZSaxq/fFLZzd+ZxveB2GiiDHP09ORGt6vY5wuy31bi681+tc7bnKV4
 sfloZdwI5pWnmGDuiaHaaU5f2Tg+A3nR8VVYQNn0mslXN3BSXH5RPAC0W/TBChLDCcOD
 YRprgY9nPbHLgz9AIIz9eZb4zcQ8OOl4wKO13b1O2wqogYtFNuoeRGeZGI38vHNY0bn4
 UBvNtmzMr4TUTAsI8pxYV9+7vKAt1zzxBNh9tke2cLDxkfw3iSa8L1oUi8Qj8NCb7ay0
 HilrpHKS4vGkL3N5wHknvYfXWc/Px0Q8EejKgJY+NRAVbHK5r4qVilv1S1o1PxyKEK21
 NllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ghoVNwvsrr9T33USohPlLcZV++g7cgeRTTFhGrVS6Qs=;
 b=W+mX8K/kOmljiH5iraL3m1l28WnkYZZqK2VZl3aA2FRUMmb31BkH9+v30krKNeRGdy
 TizJs5kaHUHpxwV0VoaMkWu3C/lrADjHT4yZUwMU39ii5HRJlQekTfReAuzVsLomZHoy
 RUqBtT7CcxiR7jQpSL8OY9Dt1H8Q7qq+OCFsGSaLp4XJW0htXW5yhiETq7w21pqJwPHn
 LvW+ff9hBNSc3So1VRtw96QUU7Hk/PJR/zflm/jY1hlAZ49CQVa7HeN6L08aaXpHDi1H
 LKdfQW/+a28O0o8CGoIMcZJoIXQ9H9tPTKp2AP21v8dPcxLzQJnkCM85qreRPVU5olBT
 TiAw==
X-Gm-Message-State: AOAM531XFZEEvFPVMoffRLs8Krk8/e2qS3EvWNm531bXEjP35uNqZ4tR
 7Nqbk2POOkmk0qY1Aqg2D8NvC4vpHfo=
X-Google-Smtp-Source: ABdhPJwOOcjPmQjwKavgeSHHmPFpn9dC4LTcl5XYtkdlVz3wxtkhQdb6IJxLxUrAc5vZXvKHipj56Q==
X-Received: by 2002:a1c:7918:: with SMTP id l24mr25648934wme.107.1626695506993; 
 Mon, 19 Jul 2021 04:51:46 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:bb37:8df9:3c3c:217f])
 by smtp.gmail.com with ESMTPSA id p5sm16034104wme.2.2021.07.19.04.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 04:51:46 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/ttm: add a weak BO reference to the resource v2
Date: Mon, 19 Jul 2021 13:51:41 +0200
Message-Id: <20210719115145.1260-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

Keep track for which BO a resource was allocated.
This is necessary to move the LRU handling into the resources.

A bit problematic is i915 since it tries to use the resource
interface without a BO which is illegal from the conceptional
point of view.

v2: Document that this is a weak reference and add a workaround for i915

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/intel_region_ttm.c | 5 +++++
 drivers/gpu/drm/ttm/ttm_bo_util.c       | 7 +++++--
 drivers/gpu/drm/ttm/ttm_resource.c      | 1 +
 include/drm/ttm/ttm_resource.h          | 2 ++
 4 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index 27fe0668d094..980b10a7debf 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -88,6 +88,7 @@ intel_region_ttm_node_reserve(struct intel_memory_region *mem,
 	place.fpfn = offset >> PAGE_SHIFT;
 	place.lpfn = place.fpfn + (size >> PAGE_SHIFT);
 	mock_bo.base.size = size;
+	mock_bo.bdev = &mem->i915->bdev;
 	ret = man->func->alloc(man, &mock_bo, &place, &res);
 	if (ret == -ENOSPC)
 		ret = -ENXIO;
@@ -104,7 +105,11 @@ void intel_region_ttm_node_free(struct intel_memory_region *mem,
 				struct ttm_resource *res)
 {
 	struct ttm_resource_manager *man = mem->region_private;
+	struct ttm_buffer_object mock_bo = {};
 
+	mock_bo.base.size = res->num_pages * PAGE_SIZE;
+	mock_bo.bdev = &mem->i915->bdev;
+	res->bo = &mock_bo;
 	man->func->free(man, res);
 }
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 2f57f824e6db..a1570aa8ff56 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -239,6 +239,11 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 	if (bo->type != ttm_bo_type_sg)
 		fbo->base.base.resv = &fbo->base.base._resv;
 
+	if (fbo->base.resource) {
+		fbo->base.resource->bo = &fbo->base;
+		bo->resource = NULL;
+	}
+
 	dma_resv_init(&fbo->base.base._resv);
 	fbo->base.base.dev = NULL;
 	ret = dma_resv_trylock(&fbo->base.base._resv);
@@ -507,7 +512,6 @@ static int ttm_bo_move_to_ghost(struct ttm_buffer_object *bo,
 		ghost_obj->ttm = NULL;
 	else
 		bo->ttm = NULL;
-	bo->resource = NULL;
 
 	dma_resv_unlock(&ghost_obj->base._resv);
 	ttm_bo_put(ghost_obj);
@@ -635,7 +639,6 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	dma_resv_unlock(&ghost->base._resv);
 	ttm_bo_put(ghost);
 	bo->ttm = ttm;
-	bo->resource = NULL;
 	ttm_bo_assign_mem(bo, sys_res);
 	return 0;
 
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 2431717376e7..7ff6194154fe 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -41,6 +41,7 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 	res->bus.offset = 0;
 	res->bus.is_iomem = false;
 	res->bus.caching = ttm_cached;
+	res->bo = bo;
 }
 EXPORT_SYMBOL(ttm_resource_init);
 
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 140b6b9a8bbe..c73b35fb7d42 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -161,6 +161,7 @@ struct ttm_bus_placement {
  * @mem_type: Resource type of the allocation.
  * @placement: Placement flags.
  * @bus: Placement on io bus accessible to the CPU
+ * @bo: weak reference to the BO using this resource
  *
  * Structure indicating the placement and space resources used by a
  * buffer object.
@@ -171,6 +172,7 @@ struct ttm_resource {
 	uint32_t mem_type;
 	uint32_t placement;
 	struct ttm_bus_placement bus;
+	struct ttm_buffer_object *bo;
 };
 
 /**
-- 
2.25.1

