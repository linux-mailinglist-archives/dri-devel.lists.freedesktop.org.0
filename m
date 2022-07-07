Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B674569FBC
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 12:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDB414A770;
	Thu,  7 Jul 2022 10:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C998011AD40;
 Thu,  7 Jul 2022 10:25:02 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id bk26so10569360wrb.11;
 Thu, 07 Jul 2022 03:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=usDZmjkmEfluB9frIFbXe3z+5i0BaeA3pCEa9QLSNlA=;
 b=PANhHQEh/d6Ob8/cAqLsOZdnQzL3C8j7T64OSsuRB0ikOhLkpbXfMIvZzGO10liwIG
 w7kv/RleGQGAFPbVlnI+Q0p/5/0xEl7JHJWHu8xu5gZmWok36R4O37OcAj3pMnCBupDT
 Dkt37nnzxJmro+824B5lT4GuKibZ7F2mtGAWer0KUiThgvWHt8yOABJyPGtUClcw9tHL
 p3jVTER5VewnT+F4WYCP+JDP8hZr9c0BcXUUd6sc9Sj8VsEruNModyQtG9cGTxY2vosn
 xuNUUrUBN64otsp7p0kidC5ylizFD++ttlOmFaiGFhiB/Vh6tFH8KRmNHI0VGzDYe8Oz
 MnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=usDZmjkmEfluB9frIFbXe3z+5i0BaeA3pCEa9QLSNlA=;
 b=l79X3dDefiB1g0qD5N1FcVrvApRN4kBF8/SlG8pS0AONkoz2e3I8LGwC22ivif/3nK
 nWVd/hjkZIkvhWQwjHcSc/4s+lM5zmxG2erPblDsBbWk7x/Auuz0UszmTtna8t6o+r1u
 QRziTVA8Tnh/K1EUNxbVRvpw+tknrOh+kVoyTRPfmZFAviTZ/RX53MkRAf1256TvwVCk
 MTfnD1WCu+HqX32FiE35URDRJmjmfEnIm9RWqWHpYqR36qN7OJyfVwmGpXPYHTOjaMbr
 kcHLUte5h9Gz9ScQDUfzeN1JPcl87B7UBGZSilti5ud/KzClhPyldCKzS6v9HwRGWLRZ
 YofQ==
X-Gm-Message-State: AJIora+zh/BjURLFNqpETnZ+9WpeV1eAXsZ9+EwsLRfcC1ICVq491UPH
 FcYujMcUqs4JL1oWBm7zwJ0G0s5aIKg=
X-Google-Smtp-Source: AGRyM1uusddGwqgryRkgzo4AZU4WrJ+Z4qvz1gRuTojusvGe6M0JP3igsNMiNupzEfqc/V5OEZJ4ew==
X-Received: by 2002:a5d:5a9d:0:b0:21b:8247:7ec4 with SMTP id
 bp29-20020a5d5a9d000000b0021b82477ec4mr40392291wrb.561.1657189499706; 
 Thu, 07 Jul 2022 03:24:59 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a05600c4e4a00b00397402ae674sm20091950wmq.11.2022.07.07.03.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 03:24:59 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/6] drm/ttm: audit bo->resource usage v2
Date: Thu,  7 Jul 2022 12:24:51 +0200
Message-Id: <20220707102453.3633-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707102453.3633-1-christian.koenig@amd.com>
References: <20220707102453.3633-1-christian.koenig@amd.com>
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

Allow BOs to exist without backing store.

v2: handle ttm_bo_move_memcpy as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c      | 16 ++++++++--------
 drivers/gpu/drm/ttm/ttm_bo_util.c |  7 +++++--
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 984535d6a2d0..a2f49bdda8a1 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -117,12 +117,13 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 				  struct ttm_operation_ctx *ctx,
 				  struct ttm_place *hop)
 {
-	struct ttm_resource_manager *old_man, *new_man;
 	struct ttm_device *bdev = bo->bdev;
+	bool old_use_tt, new_use_tt;
 	int ret;
 
-	old_man = ttm_manager_type(bdev, bo->resource->mem_type);
-	new_man = ttm_manager_type(bdev, mem->mem_type);
+	old_use_tt = bo->resource &&
+		ttm_manager_type(bdev, bo->resource->mem_type)->use_tt;
+	new_use_tt = ttm_manager_type(bdev, mem->mem_type)->use_tt;
 
 	ttm_bo_unmap_virtual(bo);
 
@@ -130,11 +131,11 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 	 * Create and bind a ttm if required.
 	 */
 
-	if (new_man->use_tt) {
+	if (new_use_tt) {
 		/* Zero init the new TTM structure if the old location should
 		 * have used one as well.
 		 */
-		ret = ttm_tt_create(bo, old_man->use_tt);
+		ret = ttm_tt_create(bo, old_use_tt);
 		if (ret)
 			goto out_err;
 
@@ -160,8 +161,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 	return 0;
 
 out_err:
-	new_man = ttm_manager_type(bdev, bo->resource->mem_type);
-	if (!new_man->use_tt)
+	if (!old_use_tt)
 		ttm_bo_tt_destroy(bo);
 
 	return ret;
@@ -904,7 +904,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 	/*
 	 * Check whether we need to move buffer.
 	 */
-	if (!ttm_resource_compat(bo->resource, placement)) {
+	if (!bo->resource || !ttm_resource_compat(bo->resource, placement)) {
 		ret = ttm_bo_move_buffer(bo, placement, ctx);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 1cbfb00c1d65..1530982338e9 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -137,8 +137,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 		ttm_manager_type(bo->bdev, dst_mem->mem_type);
 	struct ttm_tt *ttm = bo->ttm;
 	struct ttm_resource *src_mem = bo->resource;
-	struct ttm_resource_manager *src_man =
-		ttm_manager_type(bdev, src_mem->mem_type);
+	struct ttm_resource_manager *src_man;
 	union {
 		struct ttm_kmap_iter_tt tt;
 		struct ttm_kmap_iter_linear_io io;
@@ -147,6 +146,10 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 	bool clear;
 	int ret = 0;
 
+	if (!src_mem)
+		return 0;
+
+	src_man = ttm_manager_type(bdev, src_mem->mem_type);
 	if (ttm && ((ttm->page_flags & TTM_TT_FLAG_SWAPPED) ||
 		    dst_man->use_tt)) {
 		ret = ttm_tt_populate(bdev, ttm, ctx);
-- 
2.25.1

