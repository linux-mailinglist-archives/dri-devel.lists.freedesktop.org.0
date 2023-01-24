Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1F46798B0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 13:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3022A10E674;
	Tue, 24 Jan 2023 12:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED6310E08F;
 Tue, 24 Jan 2023 12:57:30 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q5so9126936wrv.0;
 Tue, 24 Jan 2023 04:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WnDTolM8qBoIbUe7vHDdQk4YkkKNfOeAoa2vTaJSi/M=;
 b=DhfNXTcI2v2QHYxv9umiC/5D5n8A/je4MTy3mHE5KcltysHR7x2M0nBm9pmqKU/rdl
 rGgvf59qnPUWzqGgVy9Jiz4ziNpnR8SOJPbpE3AZ+09aSI9FSBQqvRKucsmt4gaUt3dg
 cZj2A97cwMQ7yxMkwRwtiBh1anG5M5inJiWaGBmzVKQyqybYnxkRRG+6b8VWrwKtvBiB
 eHyZAzGTNXScJLPpcs67FblN/jISmzpGApWYTlfLpMH+73ZwgHlMkaIs8iwf5BwUGrFB
 7+P5zADDLUX8O6AZ81Pn5uATRXAqvcgESimBDQnj46A4gjyyDpbmxSjiuKVBsbcstAa9
 gkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WnDTolM8qBoIbUe7vHDdQk4YkkKNfOeAoa2vTaJSi/M=;
 b=Fj+h5E7RxotAjeKMD+izjifRhwXJM9b9kz9I/vsnuHP4Ef5ajHIXdk3dwLHzow601g
 s8sR3iJrQCz3cf6oru9ptarsbOvrOYgKojEoHqNK4avqrBSkeqf7Naqo6grbDHqUUV2B
 fHfpbCvDWui9Xh7auJAoSYSHkZpIJCOIn3mQxqS0Np6aYr5PSCIA7RQrUJbeBHYuMlEv
 wmxHraqWnggDYPXfsRXjJxVg2X+HutqEGSXnSCXTIlspxZGSz4n532hL/Aja93Hs2UUd
 yon4+R/wo5Od9K9E6r+6eHV0WVDFmKFRv9VH+Okl0XdIxlwuScIHCvuxsrA6xqM+SjYv
 ioXg==
X-Gm-Message-State: AFqh2krhT8UP2oh2JCVqt9pZgJE3XTHpAhsuIwR9rQd5SBDwObARCu8e
 ROuq/Lve1fgM42Ipd00K58LA2DuMjTc=
X-Google-Smtp-Source: AMrXdXs0/lk+L5wTBOv7arfJMAncAUGNjBDlXTrVNGLoRSVPVfGsHoPrlh6Y0ITimsMk0vOg5nxWpA==
X-Received: by 2002:a05:6000:24e:b0:2be:4639:ee26 with SMTP id
 m14-20020a056000024e00b002be4639ee26mr14223674wrz.0.1674565050126; 
 Tue, 24 Jan 2023 04:57:30 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a056000111200b002366dd0e030sm1820927wrw.68.2023.01.24.04.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 04:57:29 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/5] drm/ttm: stop allocating a dummy resource for pipelined
 gutting
Date: Tue, 24 Jan 2023 13:57:24 +0100
Message-Id: <20230124125726.13323-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124125726.13323-1-christian.koenig@amd.com>
References: <20230124125726.13323-1-christian.koenig@amd.com>
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

That should not be necessary any more when drivers should at least be
able to handle a move without a resource.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 7635d7d6b13b..d9d2b0903b22 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -704,30 +704,23 @@ EXPORT_SYMBOL(ttm_bo_move_sync_cleanup);
  */
 int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 {
-	static const struct ttm_place sys_mem = { .mem_type = TTM_PL_SYSTEM };
 	struct ttm_buffer_object *ghost;
-	struct ttm_resource *sys_res;
 	struct ttm_tt *ttm;
 	int ret;
 
-	ret = ttm_resource_alloc(bo, &sys_mem, &sys_res);
-	if (ret)
-		return ret;
-
 	/* If already idle, no need for ghost object dance. */
 	if (dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP)) {
 		if (!bo->ttm) {
 			/* See comment below about clearing. */
 			ret = ttm_tt_create(bo, true);
 			if (ret)
-				goto error_free_sys_mem;
+				return ret;
 		} else {
 			ttm_tt_unpopulate(bo->bdev, bo->ttm);
 			if (bo->type == ttm_bo_type_device)
 				ttm_tt_mark_for_clear(bo->ttm);
 		}
 		ttm_resource_free(bo, &bo->resource);
-		ttm_bo_assign_mem(bo, sys_res);
 		return 0;
 	}
 
@@ -744,7 +737,7 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	ret = ttm_tt_create(bo, true);
 	swap(bo->ttm, ttm);
 	if (ret)
-		goto error_free_sys_mem;
+		return ret;
 
 	ret = ttm_buffer_object_transfer(bo, &ghost);
 	if (ret)
@@ -760,13 +753,9 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	dma_resv_unlock(&ghost->base._resv);
 	ttm_bo_put(ghost);
 	bo->ttm = ttm;
-	ttm_bo_assign_mem(bo, sys_res);
 	return 0;
 
 error_destroy_tt:
 	ttm_tt_destroy(bo->bdev, ttm);
-
-error_free_sys_mem:
-	ttm_resource_free(bo, &sys_res);
 	return ret;
 }
-- 
2.34.1

