Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E00EF67B636
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 16:50:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB05E10E064;
	Wed, 25 Jan 2023 15:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC3210E064;
 Wed, 25 Jan 2023 15:50:27 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id hw16so48727537ejc.10;
 Wed, 25 Jan 2023 07:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d6nKsVQWYuLQ6aCS/WYm2KJtsO8lgj3Z2DbwICUXzAQ=;
 b=l+QSGaXY36Ke8A5CTfNbc3JmU3FDNzQ+hfoVXhrUjQld/5IagI4RvaurA3K/svdTF8
 Wgb3HIOzKqPHtD6KX3wtj53FYQMA9B3EFfuW8AsBzUeRh7e9vOw/s+QKKl+j+umf17Ck
 NiOkTFJ73dfufxU8R/0yPfUjx2rpR4HuGMThYgUf+xMrs6/j2Rt0XdleajQDqAzEu+NU
 rT7lWbDnKN73v+mfvpsPs8Or6emzo2zBRBanzU/UApBUKGOGuFqwhxqE6tBO+gYe2oWz
 QtqLRPDVBRV0MU0EMfQeO/fAyWueonBhBc5nG3WN7DimLMhsym9lobA8chSQLnSS/G0e
 me3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d6nKsVQWYuLQ6aCS/WYm2KJtsO8lgj3Z2DbwICUXzAQ=;
 b=lyzi9PZNDlGBLWf3KVUfty1W9N7AwfEPxKWh2ZD35RNhN0k2BTeJvKM5RZ4lxQUPzy
 xYKDNfKKflotEXpwT6p1BnJ0QL3LMuPx1bBMCS0R0PqFKMN62zALKofsIZ6qr4HkeIeQ
 wNncKo2O28mgdzm+iaJZH/9vDtIDhy0pTjvxi2eigC72K6xW360vBZanq/qzvwk8L5sP
 MtwIVSP5LX5WZALMqfJ8ihKUe+4AoxSP+7zE/88nyJQ+1UJDWsp14VfJtmEC6SFk2Bqs
 YOuIQqGTt3ZuO3PUU9IWOFMuBzXitg0AC0S9VX/vO8bBZ/klSqodZAL36XkBD0uWgXR+
 o4Yw==
X-Gm-Message-State: AFqh2kon5C4lxUKIXVcxkov3ndwqcukSxomyYK0a2qdpbEsSg6AI0pUa
 yQq/APGFd42YDxcYLhlx+CM=
X-Google-Smtp-Source: AMrXdXtlODrQbdt0785ntG+nwaNXkZw0lRt3fbEEssLxQjLRlw/uoFyrjYf5sScTYeyHDWIET90z+w==
X-Received: by 2002:a17:906:9f1c:b0:870:3c70:8c8d with SMTP id
 fy28-20020a1709069f1c00b008703c708c8dmr29109510ejc.17.1674661825746; 
 Wed, 25 Jan 2023 07:50:25 -0800 (PST)
Received: from EliteBook.fritz.box ([2a02:908:1256:79a0:180c:8737:8e57:6be7])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a1709063e8700b007ad69e9d34dsm2561609ejj.54.2023.01.25.07.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 07:50:25 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.william.auld@gmail.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/ttm: revert "stop allocating a dummy resource for
 pipelined gutting"
Date: Wed, 25 Jan 2023 16:50:22 +0100
Message-Id: <20230125155023.105584-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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

This reverts commit 4110872b8115aab2adb3a52149c144d8465440de.

This still seems to break i915.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 17330fb4480a..fca8b0e0e30a 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -704,23 +704,30 @@ EXPORT_SYMBOL(ttm_bo_move_sync_cleanup);
  */
 int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 {
+	static const struct ttm_place sys_mem = { .mem_type = TTM_PL_SYSTEM };
 	struct ttm_buffer_object *ghost;
+	struct ttm_resource *sys_res;
 	struct ttm_tt *ttm;
 	int ret;
 
+	ret = ttm_resource_alloc(bo, &sys_mem, &sys_res);
+	if (ret)
+		return ret;
+
 	/* If already idle, no need for ghost object dance. */
 	if (dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP)) {
 		if (!bo->ttm) {
 			/* See comment below about clearing. */
 			ret = ttm_tt_create(bo, true);
 			if (ret)
-				return ret;
+				goto error_free_sys_mem;
 		} else {
 			ttm_tt_unpopulate(bo->bdev, bo->ttm);
 			if (bo->type == ttm_bo_type_device)
 				ttm_tt_mark_for_clear(bo->ttm);
 		}
 		ttm_resource_free(bo, &bo->resource);
+		ttm_bo_assign_mem(bo, sys_res);
 		return 0;
 	}
 
@@ -737,7 +744,7 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	ret = ttm_tt_create(bo, true);
 	swap(bo->ttm, ttm);
 	if (ret)
-		return ret;
+		goto error_free_sys_mem;
 
 	ret = ttm_buffer_object_transfer(bo, &ghost);
 	if (ret)
@@ -753,9 +760,13 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	dma_resv_unlock(&ghost->base._resv);
 	ttm_bo_put(ghost);
 	bo->ttm = ttm;
+	ttm_bo_assign_mem(bo, sys_res);
 	return 0;
 
 error_destroy_tt:
 	ttm_tt_destroy(bo->bdev, ttm);
+
+error_free_sys_mem:
+	ttm_resource_free(bo, &sys_res);
 	return ret;
 }
-- 
2.34.1

