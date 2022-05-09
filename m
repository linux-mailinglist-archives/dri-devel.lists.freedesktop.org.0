Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C10CB51FD9E
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 15:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7889410F175;
	Mon,  9 May 2022 13:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A9E10F185
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 13:10:01 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id e24so19391798wrc.9
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 06:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r7VxVBvOC94cVM2gquLnP1BAr+qI3xEHGhn2yzw1qu8=;
 b=ov/QDvgJeyN7EaT0OyLQThRuJyci6x/EVLAJPSCTLsVx57cTT2OuDQ5Xs/+mcZDpva
 N0MMbtmXHcEjdGLS/R8VGYw4BXfimL7r2QwEpZzXOjjtJDCypRXlAe3JBFOwCM3Stq39
 D6H9W9RJgjQF2ujJ55nE2USKzaiUTbw83m8pUmG+8Aoe1DtElBTxauypHDcnX2HV8OUX
 rfOMFXFq6Jsbj7q5dcgLSsz+80WuMxmwhMlqjUKZAZ3N6kbaLirWyyKKkikY8b6qaR86
 NidcnB+sprwqJ3CKdMiQIRbeH2dTVsYmlcr0Q/AnmKsc2Aa37p9HgcE1Ix0zTTn/B0nr
 Zdcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r7VxVBvOC94cVM2gquLnP1BAr+qI3xEHGhn2yzw1qu8=;
 b=BnIFLyE3O5RDJHOY5ymaYfrncyMD83kQ8d16jHdoBB099ajxeIXMSiTyUVHeVqhckc
 /UgpYq1PT93jEv2LNb2zSFE/xTv9oeUtQ5tFbyolns/8KxnFv6oCTV7wTbuX9XIveAsC
 jt21S2f26TWuzVu6StFsOGzJE6RayYVPiA2ZjjnbbkN/sqFWO9Ptynug5yZG6DuISNvp
 U/bg/hoUdEbES6+Zu8yqz7ZtYp509iXT4SnhQ3Fzj1twFzzBbDBzA5YPRCWlr3u20c3Z
 /oqkDvla2O8FniG0Ty4DXUaMzNm/Yrt2htSy9mpas773WjqpPMwhIIlaUd1heNvb7jKj
 0JVA==
X-Gm-Message-State: AOAM532BITiXi7ObxRnVtYPEpELCceajibq9Sv8eqqxGFvULXHgkjTAe
 3cNm6BQl//rOkAW5krpEprk=
X-Google-Smtp-Source: ABdhPJxmb8rGgufcdXj8fYl+QQ8x6JqtXjXJJ6bijD0SRj0scy4+uO3EWI7DpqHMI1G0DwYYJHwZWw==
X-Received: by 2002:a5d:5984:0:b0:20c:7de2:5416 with SMTP id
 n4-20020a5d5984000000b0020c7de25416mr13742935wri.30.1652101800265; 
 Mon, 09 May 2022 06:10:00 -0700 (PDT)
Received: from able.fritz.box (p57b0b3fd.dip0.t-ipconnect.de. [87.176.179.253])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a05600c2f9000b003942a244f50sm18683385wmn.41.2022.05.09.06.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 06:09:59 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bob.beckett@collabora.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch
Subject: [PATCH 05/11] drm/ttm: drop ttm_bo_init
Date: Mon,  9 May 2022 15:09:45 +0200
Message-Id: <20220509130951.486344-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509130951.486344-1-christian.koenig@amd.com>
References: <20220509130951.486344-1-christian.koenig@amd.com>
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

Not used any more.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 26 ---------------------
 include/drm/ttm/ttm_bo_api.h | 44 ------------------------------------
 2 files changed, 70 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 296af2b89951..e652055b5175 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -985,32 +985,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
 }
 EXPORT_SYMBOL(ttm_bo_init_reserved);
 
-int ttm_bo_init(struct ttm_device *bdev,
-		struct ttm_buffer_object *bo,
-		size_t size,
-		enum ttm_bo_type type,
-		struct ttm_placement *placement,
-		uint32_t page_alignment,
-		bool interruptible,
-		struct sg_table *sg,
-		struct dma_resv *resv,
-		void (*destroy) (struct ttm_buffer_object *))
-{
-	struct ttm_operation_ctx ctx = { interruptible, false };
-	int ret;
-
-	ret = ttm_bo_init_reserved(bdev, bo, size, type, placement,
-				   page_alignment, &ctx, sg, resv, destroy);
-	if (ret)
-		return ret;
-
-	if (!resv)
-		ttm_bo_unreserve(bo);
-
-	return 0;
-}
-EXPORT_SYMBOL(ttm_bo_init);
-
 /*
  * buffer object vm functions.
  */
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 2d524f8b0802..29384e2cb704 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -361,50 +361,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
 			 struct sg_table *sg, struct dma_resv *resv,
 			 void (*destroy) (struct ttm_buffer_object *));
 
-/**
- * ttm_bo_init
- *
- * @bdev: Pointer to a ttm_device struct.
- * @bo: Pointer to a ttm_buffer_object to be initialized.
- * @size: Requested size of buffer object.
- * @type: Requested type of buffer object.
- * @placement: Initial placement for buffer object.
- * @page_alignment: Data alignment in pages.
- * @interruptible: If needing to sleep to wait for GPU resources,
- * sleep interruptible.
- * pinned in physical memory. If this behaviour is not desired, this member
- * holds a pointer to a persistent shmem object. Typically, this would
- * point to the shmem object backing a GEM object if TTM is used to back a
- * GEM user interface.
- * @sg: Scatter-gather table.
- * @resv: Pointer to a dma_resv, or NULL to let ttm allocate one.
- * @destroy: Destroy function. Use NULL for kfree().
- *
- * This function initializes a pre-allocated struct ttm_buffer_object.
- * As this object may be part of a larger structure, this function,
- * together with the @destroy function,
- * enables driver-specific objects derived from a ttm_buffer_object.
- *
- * On successful return, the caller owns an object kref to @bo. The kref and
- * list_kref are usually set to 1, but note that in some situations, other
- * tasks may already be holding references to @bo as well.
- *
- * If a failure occurs, the function will call the @destroy function, or
- * kfree() if @destroy is NULL. Thus, after a failure, dereferencing @bo is
- * illegal and will likely cause memory corruption.
- *
- * Returns
- * -ENOMEM: Out of memory.
- * -EINVAL: Invalid placement flags.
- * -ERESTARTSYS: Interrupted by signal while sleeping waiting for resources.
- */
-int ttm_bo_init(struct ttm_device *bdev, struct ttm_buffer_object *bo,
-		size_t size, enum ttm_bo_type type,
-		struct ttm_placement *placement,
-		uint32_t page_alignment, bool interrubtible,
-		struct sg_table *sg, struct dma_resv *resv,
-		void (*destroy) (struct ttm_buffer_object *));
-
 /**
  * ttm_kmap_obj_virtual
  *
-- 
2.25.1

