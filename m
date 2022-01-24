Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 566D9497F5B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 13:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC6F10E99E;
	Mon, 24 Jan 2022 12:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA7410E8BC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 12:25:20 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id w11so1102374wra.4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 04:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=W/9N9xYoKgiFtiQW+jzimeQXI12uRru2/HMWPIJw1Tg=;
 b=LEheQgAOuvDUXTvYv2R9Ie9Blh07LSwR6Uxp3gOaxU/OOq6Lzewc3y+X57ECPxpnoS
 NVcJCoq4oaEJBwmv3XIhdYVAuX2ngzbFwEa57pbK1X4dxydIA0zjEb5raX8AYyI329bC
 XXXsmtBAbo/pzunRJU3tsRFKt0hnNhAkd9tzRqzCNNxJh9FjuimWznK+8KFDy4B4Gm8J
 qNka6m57a6VlbJMZNJjSy+O3t0xzZ8C+8tSlJtxXHeXfnbAowDxxnycuRntDsDrLK6bJ
 LE8t3dBkrk3dOEBf5qXVodLtO5hdi4HHAnyOv71D+ojqZFuTzbR1wof+iugyrJleB3hL
 eL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W/9N9xYoKgiFtiQW+jzimeQXI12uRru2/HMWPIJw1Tg=;
 b=NtAI6EBMqe6ONvJRzaeD5uwLAclqcldTwNRklUXlQDoiyytYds2CQun5/TgWZkfqgw
 p1yPxkFK+xKk3cY5hS3lvSKf/6taxRmJEx2RPTlmgK/5wYn5mcOYgr8oJknPAfTCaHCd
 lyUNZtNSR00hqRQrkvY8TeXjDsc66bcj08AL1yjgw/0W+8DKjL4B5qDMn4FKgS6v2XMm
 g/KVn2qmcQ9/+VQ8VGGP9812lGSW1MQ99f0HqHP7ZnhSanDjFLJF3QgWKaFVuYHyWukH
 MKyHmeB3OYGi7W2rr8j6up0xQVp35ptK9MK3l13XIBQSZFI8X+PbEWLqw1lWfwQ08jE4
 3jeA==
X-Gm-Message-State: AOAM533qcVIgnbviRjSdXCVgAZO+viYO/GR7+AZRPardPEdbjJQ8eDBQ
 +XRyvRmSPBGkINSElZvB+1Q=
X-Google-Smtp-Source: ABdhPJwvpsp+qLJU0cBQyK4b8tB3CQwhdhA9HD9uE8XXnxn1J98iqbqfCCKLPdDpFX1/K0zuJPI9Zw==
X-Received: by 2002:adf:80f1:: with SMTP id 104mr14210804wrl.200.1643027118747; 
 Mon, 24 Jan 2022 04:25:18 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id 1sm12830516wmo.37.2022.01.24.04.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 04:25:18 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ray.huang@amd.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org, bas@basnieuwenhuizen.nl
Subject: [PATCH 03/12] drm/ttm: add a weak BO reference to the resource v3
Date: Mon, 24 Jan 2022 13:25:05 +0100
Message-Id: <20220124122514.1832-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124122514.1832-1-christian.koenig@amd.com>
References: <20220124122514.1832-1-christian.koenig@amd.com>
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
Acked-by: Huang Rui <ray.huang@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c  | 7 +++++--
 drivers/gpu/drm/ttm/ttm_resource.c | 9 +++++++++
 include/drm/ttm/ttm_resource.h     | 4 ++++
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 72a94301bc95..544a84fa6589 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -241,6 +241,11 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
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
@@ -509,7 +514,6 @@ static int ttm_bo_move_to_ghost(struct ttm_buffer_object *bo,
 		ghost_obj->ttm = NULL;
 	else
 		bo->ttm = NULL;
-	bo->resource = NULL;
 
 	dma_resv_unlock(&ghost_obj->base._resv);
 	ttm_bo_put(ghost_obj);
@@ -637,7 +641,6 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	dma_resv_unlock(&ghost->base._resv);
 	ttm_bo_put(ghost);
 	bo->ttm = ttm;
-	bo->resource = NULL;
 	ttm_bo_assign_mem(bo, sys_res);
 	return 0;
 
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 41e7bf195168..7fdd58b53c61 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -41,6 +41,7 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 	res->bus.offset = 0;
 	res->bus.is_iomem = false;
 	res->bus.caching = ttm_cached;
+	res->bo = bo;
 }
 EXPORT_SYMBOL(ttm_resource_init);
 
@@ -122,6 +123,14 @@ bool ttm_resource_compat(struct ttm_resource *res,
 }
 EXPORT_SYMBOL(ttm_resource_compat);
 
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
index 6bf37383002b..69eea9d6399b 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -161,6 +161,7 @@ struct ttm_bus_placement {
  * @mem_type: Resource type of the allocation.
  * @placement: Placement flags.
  * @bus: Placement on io bus accessible to the CPU
+ * @bo: weak reference to the BO, protected by ttm_device::lru_lock
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
@@ -271,6 +273,8 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
 void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res);
 bool ttm_resource_compat(struct ttm_resource *res,
 			 struct ttm_placement *placement);
+void ttm_resource_set_bo(struct ttm_resource *res,
+			 struct ttm_buffer_object *bo);
 
 void ttm_resource_manager_init(struct ttm_resource_manager *man,
 			       struct ttm_device *bdev,
-- 
2.25.1

