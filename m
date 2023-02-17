Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC7A69AB49
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 13:22:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA8010EF92;
	Fri, 17 Feb 2023 12:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B7D10EF8F;
 Fri, 17 Feb 2023 12:22:27 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id l11so4064101edb.11;
 Fri, 17 Feb 2023 04:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=pQQFrBizUdFKPezAzjnBMsO4C0aui2hfp5xwGSsDpiM=;
 b=bwgEsbEctxvnItO7adzhlvFbTOMAEBmtSB4X3BC/XGqLr/UJq2bpB7YXYzrqioP4jY
 deVwq0mPWhzSYX9UHwzh+VNgracVkLlgBUpV5y4uHh4zY6OMCj0LKQ+Bt/vzlX+jqmIv
 ZPwEqZrNsKGJhn/1UpePh2kqNjwo2X+8qowUZ0ZetRX/hL2OjaI0kSWxy6NTO0iTLoxl
 UTQ3SSucHGi7PCxaQre4+7lgnry35zO3INfWFDW07YnoVj4dshrIA43IbsTemVPWuN67
 wng8E3BKUidyV+FTO7Bn1ptRHYu+N5hlW5RXKJPzYj9th88vjg/r/4qKqJZEVdzj2Ea/
 GHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pQQFrBizUdFKPezAzjnBMsO4C0aui2hfp5xwGSsDpiM=;
 b=ixOjQkpjgPLa741F8DGP+Z9eMYmmh6KhgiVPeJBAr1HUzeG7ksQfrqAClKRdcvPnq3
 bb0JAagPV1KyIjxioHj5gSZem6BhG6jMPQAU2r/hFR+N7mf4N01UOcHiMcN7sa4JzMLf
 whk95jeya1L4Sr+0pyr3sMKwYV1pNrbZGCLxMkLtrwtvovDLdYfXBrjZ3Oc6ZfEgeUjW
 GIyOd9WSp+hUYs/jgQKeEZ/XLGHjmOhRyTPvwm1a4HIxVi9+AtOG8XV78NQl22FT+7OU
 enRtKVSCbHLQc1RC28bLdZ+IcdHlqK7tqswcUcl3dXcpKeA8SJMJeFsvqHhijzWdxAye
 cXcg==
X-Gm-Message-State: AO0yUKWlhEh9C0xw/M+SJiOn1+QFIoBNj47QetLWLVFLjXqUeyk9+cAL
 hAHPd6aufKB37hN22Y+WFpQBZP7LKHI=
X-Google-Smtp-Source: AK7set+Cfrs/A2TiM08dBwxOxoRzTQxuOlxGdil1NeNpSwuk0wjr7IUEi93pHwJUk8UtaNU+j+Rs6Q==
X-Received: by 2002:a17:907:1701:b0:8aa:c038:974c with SMTP id
 le1-20020a170907170100b008aac038974cmr10538834ejc.54.1676636546227; 
 Fri, 17 Feb 2023 04:22:26 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a50c38a000000b004ad75c5c0fdsm1373472edf.18.2023.02.17.04.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 04:22:25 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] drm/amdgpu: use amdgpu_res_cursor in more places v2
Date: Fri, 17 Feb 2023 13:22:18 +0100
Message-Id: <20230217122224.29243-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of resource->start use the cursor to get this.

v2 (chk): remove changes to amdgpu_bo_gpu_offset_no_check(), that
	  won't work with the AGP aperture otherwise.

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c               | 8 ++++++--
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 6 +++++-
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 2cd081cbf706..f62e5398e620 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -845,6 +845,7 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
 	struct amdgpu_ttm_tt *gtt = ttm_to_amdgpu_ttm_tt(ttm);
+	struct amdgpu_res_cursor cursor;
 	uint64_t flags;
 	int r;
 
@@ -892,7 +893,8 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
 	flags = amdgpu_ttm_tt_pte_flags(adev, ttm, bo_mem);
 
 	/* bind pages into GART page tables */
-	gtt->offset = (u64)bo_mem->start << PAGE_SHIFT;
+	amdgpu_res_first(bo_mem, 0, bo_mem->size, &cursor);
+	gtt->offset = cursor.start;
 	amdgpu_gart_bind(adev, gtt->offset, ttm->num_pages,
 			 gtt->ttm.dma_address, flags);
 	gtt->bound = true;
@@ -912,6 +914,7 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
 	struct ttm_operation_ctx ctx = { false, false };
 	struct amdgpu_ttm_tt *gtt = ttm_to_amdgpu_ttm_tt(bo->ttm);
+	struct amdgpu_res_cursor cursor;
 	struct ttm_placement placement;
 	struct ttm_place placements;
 	struct ttm_resource *tmp;
@@ -945,7 +948,8 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
 	flags = amdgpu_ttm_tt_pte_flags(adev, bo->ttm, tmp);
 
 	/* Bind pages */
-	gtt->offset = (u64)tmp->start << PAGE_SHIFT;
+	amdgpu_res_first(tmp, 0, tmp->size, &cursor);
+	gtt->offset = cursor.start;
 	amdgpu_ttm_gart_bind(adev, bo, flags);
 	amdgpu_gart_invalidate_tlb(adev);
 	ttm_resource_free(bo, &bo->resource);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index c06ada0844ba..9114393d2ee6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -200,8 +200,12 @@ static int add_queue_mes(struct device_queue_manager *dqm, struct queue *q,
 	queue_input.wptr_addr = (uint64_t)q->properties.write_ptr;
 
 	if (q->wptr_bo) {
+		struct amdgpu_res_cursor cursor;
+
 		wptr_addr_off = (uint64_t)q->properties.write_ptr & (PAGE_SIZE - 1);
-		queue_input.wptr_mc_addr = ((uint64_t)q->wptr_bo->tbo.resource->start << PAGE_SHIFT) + wptr_addr_off;
+		amdgpu_res_first(q->wptr_bo->tbo.resource, 0,
+				 q->wptr_bo->tbo.resource->size, &cursor);
+		queue_input.wptr_mc_addr = cursor.start + wptr_addr_off;
 	}
 
 	queue_input.is_kfd_process = 1;
-- 
2.34.1

