Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC44A695ACB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 08:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA2310E806;
	Tue, 14 Feb 2023 07:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB01810E7F5;
 Tue, 14 Feb 2023 07:42:45 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id h16so14635417wrz.12;
 Mon, 13 Feb 2023 23:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vl6QLM1x3isIEMOBDRsDa+IoAX7OAxWOBdYcY3HFanc=;
 b=YzkGvnMNhBvPwrFQcHJlLJkipX1rYm3r0s7ONVNKJAruvG+loNznwD1v9vn7+MRO2q
 iJuiPSzr/5LFOk7+K/l+UlEBRGJYRowR33wmIzj4r9yvtE5nFBWbiNCKhtkfY4NQ/beA
 B3k/Y6gKJ0phlNkUn3k0GMV7/Bn739nyLQ5E6cvpa98BMwMiXlk3BwWhucC6/nYg443O
 0Yzaari823siCmILTvO/hmhXLtNjl3AF9c9m8+kbfID81LS4k2QsCESNc5IpZ6EX8lj9
 yjKCXXt7cc9dxH+CVOBoOe3ueT9Vk6WuCvJinVEfAybI/sEvlZOs8Y1uPSlOT7ZDUGnO
 vG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vl6QLM1x3isIEMOBDRsDa+IoAX7OAxWOBdYcY3HFanc=;
 b=w9h7ia+pX4rTIvJmvCd1CkgeVrHWyhRsJHYmCy5R/C6Pdf3OqhP9YjbFeYFeeuaeYM
 WaNRNpO/3aW2HiWcRUaovdIpmD8e/HHNxJ9tF9HpEThD+f5ESZ5bmULfu+o1UkxuaKE3
 X52AgZ3eKj+GTh4c/pGeLJkQ2cCsmacxPEeptW61TeFu9BcC+VZJwjh07n/LjyGNN5nG
 FMv6BpXARRbGXfBzCMUAr/Zow0zJp2PBaRVp/C4vC8OfYDMUD+SXPaUNtasvR3D21O3o
 EJ7E0YpnKwWe5gmwgBkKBltvjPL8c3AcmGT+rR4r4DpWo69DlL+yPZwzDVlTnemEOoX7
 7TXQ==
X-Gm-Message-State: AO0yUKUFbao1YUmN9NUtXA6r2kQwGbFY4eIy1yCgbCJGLXSNm37CWASP
 Wacc77v6TVAW44EhWjJF5BBlS3arwtQ=
X-Google-Smtp-Source: AK7set9pCgs5Mzg5mu14quXqpimkxQ1vvVRrR3EgnRAncBzkiA63MkdHUwqQiRRKut9sPY51WIhb/Q==
X-Received: by 2002:a5d:5407:0:b0:2c3:db9e:4aff with SMTP id
 g7-20020a5d5407000000b002c3db9e4affmr1174399wrv.45.1676360563958; 
 Mon, 13 Feb 2023 23:42:43 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a5d65ce000000b002c561805a4csm1679855wrw.45.2023.02.13.23.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 23:42:43 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/ttm: Change the meaning of the fields in the
 drm_mm_nodes structure from pfn to bytes v2
Date: Tue, 14 Feb 2023 08:42:38 +0100
Message-Id: <20230214074238.65865-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214074238.65865-1-christian.koenig@amd.com>
References: <20230214074238.65865-1-christian.koenig@amd.com>
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
Cc: Amaranath.Somalapuram@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>

Change the ttm_range_man_alloc() allocation from pages to size in bytes.
Fix the dependent drm_mm_nodes start and size from pages to bytes.

v2 (chk): Change the drm_mm_node usage in amdgpu as well. re-order the
          patch to be independent of the resource->start change.

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c    | 15 ++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h |  8 ++++----
 drivers/gpu/drm/i915/i915_scatterlist.c        |  6 +++---
 drivers/gpu/drm/ttm/ttm_range_manager.c        | 17 ++++++++---------
 4 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 44367f03316f..c90423cd1292 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -116,7 +116,6 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 			      struct ttm_resource **res)
 {
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
-	uint32_t num_pages = PFN_UP(tbo->base.size);
 	struct ttm_range_mgr_node *node;
 	int r;
 
@@ -134,17 +133,19 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 	if (place->lpfn) {
 		spin_lock(&mgr->lock);
 		r = drm_mm_insert_node_in_range(&mgr->mm, &node->mm_nodes[0],
-						num_pages, tbo->page_alignment,
-						0, place->fpfn, place->lpfn,
+						tbo->base.size,
+						tbo->page_alignment << PAGE_SHIFT, 0,
+						place->fpfn << PAGE_SHIFT,
+						place->lpfn << PAGE_SHIFT,
 						DRM_MM_INSERT_BEST);
 		spin_unlock(&mgr->lock);
 		if (unlikely(r))
 			goto err_free;
 
-		node->base.start = node->mm_nodes[0].start;
+		node->base.start = node->mm_nodes[0].start >> PAGE_SHIFT;
 	} else {
 		node->mm_nodes[0].start = 0;
-		node->mm_nodes[0].size = PFN_UP(node->base.size);
+		node->mm_nodes[0].size = node->base.size;
 		node->base.start = AMDGPU_BO_INVALID_OFFSET;
 	}
 
@@ -285,8 +286,8 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 
 	ttm_resource_manager_init(man, &adev->mman.bdev, gtt_size);
 
-	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
-	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
+	start = (AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS) << PAGE_SHIFT;
+	size = adev->gmc.gart_size - start;
 	drm_mm_init(&mgr->mm, start, size);
 	spin_lock_init(&mgr->lock);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
index 5c4f93ee0c57..5c78f0b09351 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
@@ -94,8 +94,8 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
 		while (start >= node->size << PAGE_SHIFT)
 			start -= node++->size << PAGE_SHIFT;
 
-		cur->start = (node->start << PAGE_SHIFT) + start;
-		cur->size = min((node->size << PAGE_SHIFT) - start, size);
+		cur->start = node->start + start;
+		cur->size = min(node->size - start, size);
 		cur->remaining = size;
 		cur->node = node;
 		break;
@@ -155,8 +155,8 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
 		node = cur->node;
 
 		cur->node = ++node;
-		cur->start = node->start << PAGE_SHIFT;
-		cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
+		cur->start = node->start;
+		cur->size = min(node->size, cur->remaining);
 		break;
 	default:
 		return;
diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
index 756289e43dff..7defda1219d0 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.c
+++ b/drivers/gpu/drm/i915/i915_scatterlist.c
@@ -94,7 +94,7 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
 	if (!rsgt)
 		return ERR_PTR(-ENOMEM);
 
-	i915_refct_sgt_init(rsgt, node->size << PAGE_SHIFT);
+	i915_refct_sgt_init(rsgt, node->size);
 	st = &rsgt->table;
 	/* restricted by sg_alloc_table */
 	if (WARN_ON(overflows_type(DIV_ROUND_UP_ULL(node->size, segment_pages),
@@ -110,8 +110,8 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
 	sg = st->sgl;
 	st->nents = 0;
 	prev_end = (resource_size_t)-1;
-	block_size = node->size << PAGE_SHIFT;
-	offset = node->start << PAGE_SHIFT;
+	block_size = node->size;
+	offset = node->start;
 
 	while (block_size) {
 		u64 len;
diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index 62fddcc59f02..9da6054f2955 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -83,9 +83,10 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
 
 	spin_lock(&rman->lock);
 	ret = drm_mm_insert_node_in_range(mm, &node->mm_nodes[0],
-					  PFN_UP(node->base.size),
-					  bo->page_alignment, 0,
-					  place->fpfn, lpfn, mode);
+					  node->base.size,
+					  bo->page_alignment << PAGE_SHIFT, 0,
+					  place->fpfn << PAGE_SHIFT,
+					  lpfn << PAGE_SHIFT, mode);
 	spin_unlock(&rman->lock);
 
 	if (unlikely(ret)) {
@@ -94,7 +95,7 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
 		return ret;
 	}
 
-	node->base.start = node->mm_nodes[0].start;
+	node->base.start = node->mm_nodes[0].start >> PAGE_SHIFT;
 	*res = &node->base;
 	return 0;
 }
@@ -119,11 +120,10 @@ static bool ttm_range_man_intersects(struct ttm_resource_manager *man,
 				     size_t size)
 {
 	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
-	u32 num_pages = PFN_UP(size);
 
 	/* Don't evict BOs outside of the requested placement range */
-	if (place->fpfn >= (node->start + num_pages) ||
-	    (place->lpfn && place->lpfn <= node->start))
+	if ((place->fpfn << PAGE_SHIFT) >= (node->start + size) ||
+	    (place->lpfn && (place->lpfn << PAGE_SHIFT) <= node->start))
 		return false;
 
 	return true;
@@ -135,10 +135,9 @@ static bool ttm_range_man_compatible(struct ttm_resource_manager *man,
 				     size_t size)
 {
 	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
-	u32 num_pages = PFN_UP(size);
 
 	if (node->start < place->fpfn ||
-	    (place->lpfn && (node->start + num_pages) > place->lpfn))
+	    (place->lpfn && (node->start + size) > place->lpfn << PAGE_SHIFT))
 		return false;
 
 	return true;
-- 
2.34.1

