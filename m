Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A45F33FC5D7
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 13:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5636689A4B;
	Tue, 31 Aug 2021 11:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4A089A4B
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 11:21:20 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id n5so26986793wro.12
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 04:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v0HlrNi9oPXCwAEUrcpTpFvirJPRrXBu7hrCPkD865A=;
 b=fgm6fIoRJ8roVNnSOrHQARSb5HuQdqf6ZWcpgtA8XNk5rd4tTZjp/hzhHo0mr1OvdS
 kCpAUzchAwp099gHfOJSZljhCbP0saszWsFdnxXrdWescjieO9CHSf4JrKTCZ5azHNHp
 xEoV/k/lTXr19q5qf/C0VBX+2GOoUvDYeBH7pQlXOBgyIDo2h4I1quNLKR633CdlucG8
 yOAUuJkHOVx/nWsb445eWA5dj1OJ2UfOpvtonQQgF3T3qFC5KyYKfYD3UB3FOVWXdzT4
 eGVE70vyfLHd2bB8oLcqP4EJLodp81/o2Sf+THJBrF82e4ps9yEVvKaKAAMDUP48gU8L
 opKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v0HlrNi9oPXCwAEUrcpTpFvirJPRrXBu7hrCPkD865A=;
 b=MKjvRmXF+aayhPmna+DfeOX484+sqlyrsdidJhDMf27ZLAHiJqs49RM8AuRwOygV6a
 NZ1OlhWyYw1TEyFIIP2y0P6OGlMo/7xbr//aqwrGUN6K03g/E385S4f3/uaK5l9+myT8
 nB2lOZmXQCZU+wFnI1XVQyQU1dzbzUJ7491Yvn2+tVkXazqVsR44p+yRGkqtSE/Ae7Vs
 x8iIPkQHDb3YJxThrJksRj5xzbBRQQucLdV0KhzXQ1q3niR0ZV6FrCLVGYu9j6dV2MGi
 dHYd898+T0JjpB76UxMlBHeqOEMd1vtlBkU0RvOcVq4owEA5cx3+nuRZ1b5RbXZgrv7O
 wtzQ==
X-Gm-Message-State: AOAM5324LNoBjQNQFSGi7jz72dVa459SSWpEm+z3scmcELFbmM6fK0Kv
 1kaeLpSwVe3J+k9PGZ2Kmq7V+YyCiFW0Z1Bd
X-Google-Smtp-Source: ABdhPJzZlCIGIe68+HgRjh4Utrl0yOgi75SmE17LdNtWYx9VH4mzRUs8J5vaHU0s9/yFR7pHNSsExw==
X-Received: by 2002:adf:f490:: with SMTP id l16mr29955223wro.136.1630408878568; 
 Tue, 31 Aug 2021 04:21:18 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 g5sm18054957wrq.80.2021.08.31.04.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 04:21:17 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 ray.huang@amd.com
Subject: [PATCH 1/5] drm/ttm: cleanup ttm_resource_compat
Date: Tue, 31 Aug 2021 13:21:06 +0200
Message-Id: <20210831112110.113196-1-christian.koenig@amd.com>
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

Move that function into the resource handling and remove an unused parameter.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c       | 48 +----------------------------
 drivers/gpu/drm/ttm/ttm_resource.c | 49 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c | 15 ++++-----
 include/drm/ttm/ttm_bo_api.h       | 12 --------
 include/drm/ttm/ttm_resource.h     |  3 ++
 5 files changed, 59 insertions(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 3573f9e393be..0a3127436f61 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -924,57 +924,11 @@ static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
 	return ret;
 }
 
-static bool ttm_bo_places_compat(const struct ttm_place *places,
-				 unsigned num_placement,
-				 struct ttm_resource *mem,
-				 uint32_t *new_flags)
-{
-	unsigned i;
-
-	if (mem->placement & TTM_PL_FLAG_TEMPORARY)
-		return false;
-
-	for (i = 0; i < num_placement; i++) {
-		const struct ttm_place *heap = &places[i];
-
-		if ((mem->start < heap->fpfn ||
-		     (heap->lpfn != 0 && (mem->start + mem->num_pages) > heap->lpfn)))
-			continue;
-
-		*new_flags = heap->flags;
-		if ((mem->mem_type == heap->mem_type) &&
-		    (!(*new_flags & TTM_PL_FLAG_CONTIGUOUS) ||
-		     (mem->placement & TTM_PL_FLAG_CONTIGUOUS)))
-			return true;
-	}
-	return false;
-}
-
-bool ttm_bo_mem_compat(struct ttm_placement *placement,
-		       struct ttm_resource *mem,
-		       uint32_t *new_flags)
-{
-	if (ttm_bo_places_compat(placement->placement, placement->num_placement,
-				 mem, new_flags))
-		return true;
-
-	if ((placement->busy_placement != placement->placement ||
-	     placement->num_busy_placement > placement->num_placement) &&
-	    ttm_bo_places_compat(placement->busy_placement,
-				 placement->num_busy_placement,
-				 mem, new_flags))
-		return true;
-
-	return false;
-}
-EXPORT_SYMBOL(ttm_bo_mem_compat);
-
 int ttm_bo_validate(struct ttm_buffer_object *bo,
 		    struct ttm_placement *placement,
 		    struct ttm_operation_ctx *ctx)
 {
 	int ret;
-	uint32_t new_flags;
 
 	dma_resv_assert_held(bo->base.resv);
 
@@ -987,7 +941,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 	/*
 	 * Check whether we need to move buffer.
 	 */
-	if (!ttm_bo_mem_compat(placement, bo->resource, &new_flags)) {
+	if (!ttm_resource_compat(bo->resource, placement)) {
 		ret = ttm_bo_move_buffer(bo, placement, ctx);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 2431717376e7..035d71332d18 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -67,6 +67,55 @@ void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
 }
 EXPORT_SYMBOL(ttm_resource_free);
 
+static bool ttm_resource_places_compat(struct ttm_resource *res,
+				       const struct ttm_place *places,
+				       unsigned num_placement)
+{
+	unsigned i;
+
+	if (res->placement & TTM_PL_FLAG_TEMPORARY)
+		return false;
+
+	for (i = 0; i < num_placement; i++) {
+		const struct ttm_place *heap = &places[i];
+
+		if (res->start < heap->fpfn || (heap->lpfn &&
+		    (res->start + res->num_pages) > heap->lpfn))
+			continue;
+
+		if ((res->mem_type == heap->mem_type) &&
+		    (!(heap->flags & TTM_PL_FLAG_CONTIGUOUS) ||
+		     (res->placement & TTM_PL_FLAG_CONTIGUOUS)))
+			return true;
+	}
+	return false;
+}
+
+/**
+ * ttm_resource_compat - check if resource is compatible with placement
+ *
+ * @res: the resource to check
+ * @placement: the placement to check against
+ *
+ * Returns true if the placement is compatible.
+ */
+bool ttm_resource_compat(struct ttm_resource *res,
+			 struct ttm_placement *placement)
+{
+	if (ttm_resource_places_compat(res, placement->placement,
+				       placement->num_placement))
+		return true;
+
+	if ((placement->busy_placement != placement->placement ||
+	     placement->num_busy_placement > placement->num_placement) &&
+	    ttm_resource_places_compat(res, placement->busy_placement,
+				       placement->num_busy_placement))
+		return true;
+
+	return false;
+}
+EXPORT_SYMBOL(ttm_resource_compat);
+
 /**
  * ttm_resource_manager_init
  *
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 9e3e1429db94..fd007f1c1776 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -94,7 +94,6 @@ int vmw_bo_pin_in_placement(struct vmw_private *dev_priv,
 	struct ttm_operation_ctx ctx = {interruptible, false };
 	struct ttm_buffer_object *bo = &buf->base;
 	int ret;
-	uint32_t new_flags;
 
 	vmw_execbuf_release_pinned_bo(dev_priv);
 
@@ -103,8 +102,8 @@ int vmw_bo_pin_in_placement(struct vmw_private *dev_priv,
 		goto err;
 
 	if (buf->base.pin_count > 0)
-		ret = ttm_bo_mem_compat(placement, bo->resource,
-					&new_flags) == true ? 0 : -EINVAL;
+		ret = ttm_resource_compat(bo->resource, placement)
+			? 0 : -EINVAL;
 	else
 		ret = ttm_bo_validate(bo, placement, &ctx);
 
@@ -136,7 +135,6 @@ int vmw_bo_pin_in_vram_or_gmr(struct vmw_private *dev_priv,
 	struct ttm_operation_ctx ctx = {interruptible, false };
 	struct ttm_buffer_object *bo = &buf->base;
 	int ret;
-	uint32_t new_flags;
 
 	vmw_execbuf_release_pinned_bo(dev_priv);
 
@@ -145,8 +143,8 @@ int vmw_bo_pin_in_vram_or_gmr(struct vmw_private *dev_priv,
 		goto err;
 
 	if (buf->base.pin_count > 0) {
-		ret = ttm_bo_mem_compat(&vmw_vram_gmr_placement, bo->resource,
-					&new_flags) == true ? 0 : -EINVAL;
+		ret = ttm_resource_compat(bo->resource, &vmw_vram_gmr_placement)
+			? 0 : -EINVAL;
 		goto out_unreserve;
 	}
 
@@ -208,7 +206,6 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *dev_priv,
 	struct ttm_placement placement;
 	struct ttm_place place;
 	int ret = 0;
-	uint32_t new_flags;
 
 	place = vmw_vram_placement.placement[0];
 	place.lpfn = bo->resource->num_pages;
@@ -236,8 +233,8 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *dev_priv,
 	}
 
 	if (buf->base.pin_count > 0)
-		ret = ttm_bo_mem_compat(&placement, bo->resource,
-					&new_flags) == true ? 0 : -EINVAL;
+		ret = ttm_resource_compat(bo->resource, &placement)
+			? 0 : -EINVAL;
 	else
 		ret = ttm_bo_validate(bo, &placement, &ctx);
 
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index f681bbdbc698..76d7c33884da 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -264,18 +264,6 @@ static inline int ttm_bo_wait_ctx(struct ttm_buffer_object *bo, struct ttm_opera
 	return ttm_bo_wait(bo, ctx->interruptible, ctx->no_wait_gpu);
 }
 
-/**
- * ttm_bo_mem_compat - Check if proposed placement is compatible with a bo
- *
- * @placement:  Return immediately if buffer is busy.
- * @mem:  The struct ttm_resource indicating the region where the bo resides
- * @new_flags: Describes compatible placement found
- *
- * Returns true if the placement is compatible
- */
-bool ttm_bo_mem_compat(struct ttm_placement *placement, struct ttm_resource *mem,
-		       uint32_t *new_flags);
-
 /**
  * ttm_bo_validate
  *
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 140b6b9a8bbe..32c5edd9e8b5 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -40,6 +40,7 @@ struct ttm_resource_manager;
 struct ttm_resource;
 struct ttm_place;
 struct ttm_buffer_object;
+struct ttm_placement;
 struct dma_buf_map;
 struct io_mapping;
 struct sg_table;
@@ -266,6 +267,8 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
 		       const struct ttm_place *place,
 		       struct ttm_resource **res);
 void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res);
+bool ttm_resource_compat(struct ttm_resource *res,
+			 struct ttm_placement *placement);
 
 void ttm_resource_manager_init(struct ttm_resource_manager *man,
 			       unsigned long p_size);
-- 
2.25.1

