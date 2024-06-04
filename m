Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9184B8FB86A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 18:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6885510E025;
	Tue,  4 Jun 2024 16:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dKAvNy3w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C041C10E125;
 Tue,  4 Jun 2024 16:05:10 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-35dbdd76417so3228382f8f.3; 
 Tue, 04 Jun 2024 09:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717517109; x=1718121909; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NS4lNAUR2OyaP2CbEceClkz/2u+D/awRKCcKLFLpDtQ=;
 b=dKAvNy3wZ96le27s4Bv98JgnY86eGNafpxJh/zCaQAfkFJRY5aW79XtTk/UawzJWjp
 yD95+w3YIEvGcVRXVK+HDV9a3WxnRXtQAbFOkhI2wE8GhAJ3XKWYUJ973WpxlWlI1/6b
 JaBgKv8Jo9zx3OhvS909P3l5TJxYNAtr3NL/c3EohULXEELn4hKylVySJR0OF0tshS0d
 FOeBnDsBA2JBJmzq5niu0YKjxujtWAOGv1ZYYVumdAvZDosmMb7eM+u7mOWySOBqhBJS
 ePLTdG3qurxELkOUZDSQogUmdwuxvJTHYNSolRBPuJ1eiKuGjaQ+Vafz9FlT2Fez7Hek
 IrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717517109; x=1718121909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NS4lNAUR2OyaP2CbEceClkz/2u+D/awRKCcKLFLpDtQ=;
 b=Hu+/nLnfuzZ2fIrvcg0p5fk8Uw2xD0Xt70IvLIv+GUVM+NDz4zkvbviDwfqS3T7YwN
 5Zi6+ngCYn4BL5OGOHuhpYhkKVyfFRzhu5xshid1SMUXPFT77aAP1Qlp/E2bEJWUU/UY
 OMumqapsNno+aG379VvfRmCQBAX0fopRs+wOWe0LO6tqO8vttMa2Gr7GBLOJQtQmIGar
 HecSZvU7r1LHwq/EVugbXO93J/h87EEty9OvMF1IH/yIutuH4Nju3PbeOhVMZpe8D3UV
 jOdLZmNon0VSmyjZ5yeuemLxxUepZak5YCeNrfBB3CEtI4bGftHfDbo/MG82Of+HcGyv
 5YuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIkb2XdfFQ+gaoTNbj7/h0rMY5KA9sHNzA2c9/bTZ5z8YhnuFIWF+19pDLIC76UCnf2XbVauADUwwVbdEBmnMpROj96ExFBkQssGZwGw==
X-Gm-Message-State: AOJu0YztWyVR1YFJNaInXuBPnzdwZEIimFrT+7T2o1brCfKPBK58uLe0
 h3/hoxLS/Uk+QH48uK+gAc/D0DR2uY4w3nZX9Nw9GqreE3cW375Y
X-Google-Smtp-Source: AGHT+IGxh3IpWsZSHBMnc/PV8tDuIKc6x+5xfMtAIhIUDMOmZR1uROfDMPxmxDIjad2hi1MbMTTxVw==
X-Received: by 2002:adf:ec4a:0:b0:354:d098:8d67 with SMTP id
 ffacd0b85a97d-35e0f34ed07mr10943525f8f.57.1717517108860; 
 Tue, 04 Jun 2024 09:05:08 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:157b:4500:3a1f:103c:c5a9:7f90])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e7e07d7besm2388082f8f.18.2024.06.04.09.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 09:05:08 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: tursulin@ursulin.net,
	friedrich.vock@gmx.de
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/6] drm/ttm: add TTM_PL_FLAG_TRESHOLD
Date: Tue,  4 Jun 2024 18:04:59 +0200
Message-Id: <20240604160503.43359-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604160503.43359-1-christian.koenig@amd.com>
References: <20240604160503.43359-1-christian.koenig@amd.com>
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

This adds support to enable a placement only when a certain treshold of
moved bytes is reached. It's a context flag which will be handled
together with TTM_PL_FLAG_DESIRED and TTM_PL_FLAG_FALLBACK.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c       |  5 ++---
 drivers/gpu/drm/ttm/ttm_resource.c | 35 ++++++++++++++++++++++++++++--
 include/drm/ttm/ttm_bo.h           |  3 +++
 include/drm/ttm/ttm_placement.h    | 15 +++++++++++++
 include/drm/ttm/ttm_resource.h     |  2 ++
 5 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 6396dece0db1..6cd2e32bb5db 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -764,8 +764,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
 		if (!man || !ttm_resource_manager_used(man))
 			continue;
 
-		if (place->flags & (force_space ? TTM_PL_FLAG_DESIRED :
-				    TTM_PL_FLAG_FALLBACK))
+		if (!ttm_place_applicable(place, ctx, force_space))
 			continue;
 
 		do {
@@ -864,7 +863,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 	do {
 		/* Check whether we need to move buffer. */
 		if (bo->resource &&
-		    ttm_resource_compatible(bo->resource, placement,
+		    ttm_resource_compatible(bo->resource, placement, ctx,
 					    force_space))
 			return 0;
 
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 4a66b851b67d..74a6bfc74dbe 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -292,6 +292,37 @@ bool ttm_resource_intersects(struct ttm_device *bdev,
 	return man->func->intersects(man, res, place, size);
 }
 
+/**
+ * ttm_place_applicable - check if place is applicable
+ *
+ * @place: place to check
+ * @ctx: the operation context
+ * @evicting: true if TTM is evicting resources
+ *
+ * Return true if the place is currently applicable.
+ */
+bool ttm_place_applicable(const struct ttm_place *place,
+			  struct ttm_operation_ctx *ctx,
+			  bool evicting)
+{
+
+	/* When no flag is given we always consider the place applicable */
+	if (!(place->flags & TTM_PL_FLAG_CTX_MASK))
+		return true;
+
+	if (place->flags & TTM_PL_FLAG_FALLBACK && evicting)
+		return true;
+
+	if (place->flags & TTM_PL_FLAG_DESIRED && !evicting)
+		return true;
+
+	if (place->flags & TTM_PL_FLAG_MOVE_THRESHOLD &&
+	    ctx->bytes_moved < ctx->move_threshold)
+		return true;
+
+	return false;
+}
+
 /**
  * ttm_resource_compatible - check if resource is compatible with placement
  *
@@ -303,6 +334,7 @@ bool ttm_resource_intersects(struct ttm_device *bdev,
  */
 bool ttm_resource_compatible(struct ttm_resource *res,
 			     struct ttm_placement *placement,
+			     struct ttm_operation_ctx *ctx,
 			     bool evicting)
 {
 	struct ttm_buffer_object *bo = res->bo;
@@ -319,8 +351,7 @@ bool ttm_resource_compatible(struct ttm_resource *res,
 		if (res->mem_type != place->mem_type)
 			continue;
 
-		if (place->flags & (evicting ? TTM_PL_FLAG_DESIRED :
-				    TTM_PL_FLAG_FALLBACK))
+		if (!ttm_place_applicable(place, ctx, evicting))
 			continue;
 
 		if (place->flags & TTM_PL_FLAG_CONTIGUOUS &&
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 6ccf96c91f3a..a85be2140970 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -176,6 +176,8 @@ struct ttm_bo_kmap_obj {
  * faults. Should only be used by TTM internally.
  * @resv: Reservation object to allow reserved evictions with.
  * @bytes_moved: Statistics on how many bytes have been moved.
+ * @move_threshold: When @bytes_moved >= @move_threshold placements with
+ * @TTM_PL_FLAG_MOVE_TRESHOLD are used as well.
  *
  * Context for TTM operations like changing buffer placement or general memory
  * allocation.
@@ -188,6 +190,7 @@ struct ttm_operation_ctx {
 	bool force_alloc;
 	struct dma_resv *resv;
 	uint64_t bytes_moved;
+	uint64_t move_threshold;
 };
 
 /**
diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
index b510a4812609..cf809749585d 100644
--- a/include/drm/ttm/ttm_placement.h
+++ b/include/drm/ttm/ttm_placement.h
@@ -48,6 +48,8 @@
  * placement that can handle such scenarios is a good idea.
  */
 
+struct ttm_operation_ctx;
+
 #define TTM_PL_SYSTEM           0
 #define TTM_PL_TT               1
 #define TTM_PL_VRAM             2
@@ -70,6 +72,15 @@
 /* Placement is only used during eviction */
 #define TTM_PL_FLAG_FALLBACK	(1 << 4)
 
+/* Placement can only be used if threshold of moved bytes is reached */
+#define TTM_PL_FLAG_MOVE_THRESHOLD	(1 << 5)
+
+/* Placement flags which depend on TTMs operation ctx. Fulfilling any flag is
+ * enough to consider the placement applicable.
+ */
+#define TTM_PL_FLAG_CTX_MASK	(TTM_PL_FLAG_DESIRED | TTM_PL_FLAG_FALLBACK | \
+				 TTM_PL_FLAG_MOVE_THRESHOLD)
+
 /**
  * struct ttm_place
  *
@@ -100,4 +111,8 @@ struct ttm_placement {
 	const struct ttm_place	*placement;
 };
 
+bool ttm_place_applicable(const struct ttm_place *place,
+			  struct ttm_operation_ctx *ctx,
+			  bool evicting);
+
 #endif
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 69769355139f..6ca6b7b82fb8 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -44,6 +44,7 @@ struct ttm_resource;
 struct ttm_place;
 struct ttm_buffer_object;
 struct ttm_placement;
+struct ttm_operation_ctx;
 struct iosys_map;
 struct io_mapping;
 struct sg_table;
@@ -370,6 +371,7 @@ bool ttm_resource_intersects(struct ttm_device *bdev,
 			     size_t size);
 bool ttm_resource_compatible(struct ttm_resource *res,
 			     struct ttm_placement *placement,
+			     struct ttm_operation_ctx *ctx,
 			     bool evicting);
 void ttm_resource_set_bo(struct ttm_resource *res,
 			 struct ttm_buffer_object *bo);
-- 
2.34.1

