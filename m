Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF833FB2BF
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 10:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4264989CF4;
	Mon, 30 Aug 2021 08:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7458089C1F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 08:57:12 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id g18so13813978wrc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 01:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=y2mBcyi6G8qw3eNNRjd0aYmw0jGNBXwReTvxTXz1KpQ=;
 b=TBMhCEi6Iyjoe8q7vBT0ikppaGgayaHbiDsv2XiCFAzuSl2luymSb8WQj4k/izQhFJ
 eMOe8KFc41KzKFMZkkGNLBMxyzr5HnTbUAG22o6MfXiTOzy4K6Dxg+0reuwAksfs0GJ5
 LJVvvevNES7XUXZBOgCIa8Hz5yqbz7XNzZCKEFb1LiwSifHW5Mr5FkusRet2ia9munNI
 gpolTMBshNQ3dFS6kqSn0GQU+DhZl90NA8GgpbJ3aaB8oUJQcGxQmdL6ntw+qXO8NKyA
 4xTnMSoEb9y771bnRUxw2r9uMzY+mAmeIHkdA5EyNTLJvT2tILW8NZ5AT1E5YUBo7p2d
 rkzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y2mBcyi6G8qw3eNNRjd0aYmw0jGNBXwReTvxTXz1KpQ=;
 b=DTefoYEAth44BvjpBiu1YnrVgki0LMW2dmvVtBGkYpYgxrvFHyP6ik54rlk7jWaX84
 bzWVyZdh1QxALzUA/i6vx4YxILae/jiJN2of7BF05wuwdkkfOA7G8raetFNmk/hJCkye
 svK355fMIWB6ZnOtrYVRwHPi9vKhDttXt8FdS97giZ9JoFXYpSU/Pq0EnOBNgfOS8ENU
 iQdTwLwo7hbuNXTOx57TrErwxNFz8jLJQgP8y7oTiS9ooh458xtUMZFgsccHjBxYcUPS
 J2wJrrEAkvzJ1GP8VEiMqicTyr5v0ZaTO4SXdAR9zZ2hIUlgHgMgKOQm2DTMUg7O8Jr6
 9n1w==
X-Gm-Message-State: AOAM530Eq7wLdfNncVtm0oUdBR5wOZDFYj+RnhlgpKDCxNOf8rrkDtY6
 Sl58Y+NrlMzE34vszr4DVS4=
X-Google-Smtp-Source: ABdhPJyIMOGEmQe8mweJZ5jEpmV2FJ9OYKwTb43cnIWhs4qqdQkHeicE5gClwK9coeV+l/SMYZAL+Q==
X-Received: by 2002:adf:eb89:: with SMTP id t9mr25767152wrn.66.1630313830974; 
 Mon, 30 Aug 2021 01:57:10 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 u2sm8843245wmj.29.2021.08.30.01.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 01:57:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, dri-devel@lists.freedesktop.org,
 andrey.grodzovsky@amd.com
Subject: [PATCH 03/12] drm/ttm: add a weak BO reference to the resource v3
Date: Mon, 30 Aug 2021 10:56:58 +0200
Message-Id: <20210830085707.209508-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830085707.209508-1-christian.koenig@amd.com>
References: <20210830085707.209508-1-christian.koenig@amd.com>
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
v3: further document that this is protected by ttm_device::lru_lock and
    clarify the i915 workaround

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/intel_region_ttm.c | 22 ++++++++++++----------
 drivers/gpu/drm/ttm/ttm_bo_util.c       |  7 +++++--
 drivers/gpu/drm/ttm/ttm_resource.c      |  9 +++++++++
 include/drm/ttm/ttm_resource.h          |  4 ++++
 4 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index 27fe0668d094..1b2a61b085f7 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -75,24 +75,26 @@ intel_region_ttm_node_reserve(struct intel_memory_region *mem,
 	int ret;
 
 	/*
-	 * Having to use a mock_bo is unfortunate but stems from some
-	 * drivers having private managers that insist to know what the
-	 * allocate memory is intended for, using it to send private
-	 * data to the manager. Also recently the bo has been used to send
-	 * alignment info to the manager. Assume that apart from the latter,
-	 * none of the managers we use will ever access the buffer object
-	 * members, hoping we can pass the alignment info in the
-	 * struct ttm_place in the future.
+	 * This is essential an illegal use the of the TTM resource manager
+	 * backend and should be fixed in the future. For now work around by
+	 * using a mock_bo with at least the mandatory fields initialized.
+	 *
+	 * The resource should be ignored by TTM since it can't grab a
+	 * reference to the BO during eviction.
 	 */
 
 	place.fpfn = offset >> PAGE_SHIFT;
 	place.lpfn = place.fpfn + (size >> PAGE_SHIFT);
 	mock_bo.base.size = size;
+	mock_bo.bdev = &mem->i915->bdev;
 	ret = man->func->alloc(man, &mock_bo, &place, &res);
 	if (ret == -ENOSPC)
-		ret = -ENXIO;
+		return ERR_PTR(-ENXIO);
+	if (ret)
+		return ERR_PTR(ret);
 
-	return ret ? ERR_PTR(ret) : res;
+	res->bo = NULL;
+	return 0;
 }
 
 /**
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 763fa6f4e07d..c5d02edaefc0 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -242,6 +242,11 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 	if (bo->type != ttm_bo_type_sg)
 		fbo->base.base.resv = &fbo->base.base._resv;
 
+	if (fbo->base.resource) {
+		ttm_resource_set_bo(fbo->base.resource, &fbo->base);
+		bo->resource = NULL;
+	}
+
 	dma_resv_init(&fbo->base.base._resv);
 	fbo->base.base.dev = NULL;
 	ret = dma_resv_trylock(&fbo->base.base._resv);
@@ -510,7 +515,6 @@ static int ttm_bo_move_to_ghost(struct ttm_buffer_object *bo,
 		ghost_obj->ttm = NULL;
 	else
 		bo->ttm = NULL;
-	bo->resource = NULL;
 
 	dma_resv_unlock(&ghost_obj->base._resv);
 	ttm_bo_put(ghost_obj);
@@ -638,7 +642,6 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	dma_resv_unlock(&ghost->base._resv);
 	ttm_bo_put(ghost);
 	bo->ttm = ttm;
-	bo->resource = NULL;
 	ttm_bo_assign_mem(bo, sys_res);
 	return 0;
 
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 122f19e6968b..a4c495da0040 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -41,6 +41,7 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 	res->bus.offset = 0;
 	res->bus.is_iomem = false;
 	res->bus.caching = ttm_cached;
+	res->bo = bo;
 }
 EXPORT_SYMBOL(ttm_resource_init);
 
@@ -73,6 +74,14 @@ void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
 }
 EXPORT_SYMBOL(ttm_resource_free);
 
+void ttm_resource_set_bo(struct ttm_resource *res,
+			 struct ttm_buffer_object *bo)
+{
+	spin_lock(&bo->bdev->lru_lock);
+	res->bo = bo;
+	spin_unlock(&bo->bdev->lru_lock);
+}
+
 /**
  * ttm_resource_manager_init
  *
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index c004672789b6..e8080192cae4 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -160,6 +160,7 @@ struct ttm_bus_placement {
  * @mem_type: Resource type of the allocation.
  * @placement: Placement flags.
  * @bus: Placement on io bus accessible to the CPU
+ * @bo: weak reference to the BO, protected by ttm_device::lru_lock
  *
  * Structure indicating the placement and space resources used by a
  * buffer object.
@@ -170,6 +171,7 @@ struct ttm_resource {
 	uint32_t mem_type;
 	uint32_t placement;
 	struct ttm_bus_placement bus;
+	struct ttm_buffer_object *bo;
 };
 
 /**
@@ -268,6 +270,8 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
 		       const struct ttm_place *place,
 		       struct ttm_resource **res);
 void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res);
+void ttm_resource_set_bo(struct ttm_resource *res,
+			 struct ttm_buffer_object *bo);
 
 void ttm_resource_manager_init(struct ttm_resource_manager *man,
 			       struct ttm_device *bdev,
-- 
2.25.1

