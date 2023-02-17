Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EABA469AB59
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 13:23:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF9A10EFAB;
	Fri, 17 Feb 2023 12:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2C210EF8F;
 Fri, 17 Feb 2023 12:22:29 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id ee31so5079253edb.3;
 Fri, 17 Feb 2023 04:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ji8kYjHLz8PFnojbvPvCd/Vry5lhoqUD8IbEBbwgHho=;
 b=CeordHYeKOol8kxJbtH2r1TgFs/0pbe/ojiOqmX0oPXqCgGUKMfLnLTqO3Jc2FB3uA
 568LMwICuAL0O62tZaDMmW5xfoTvMmj13f+7qArC2As1U2N6VXPlOYDkaYt6ylb6nR8M
 xW7Vrd9FUtFQgUdWV+sFoTVTYp4MFjKhmb4Js0L9xeiS1cLvGHU8PWWuk0mJBME8Ty6Q
 2F8s7RjGWfM5jPNv9CrfUgUE0o9X4hOi/Nq3l8S27jS5sjsDfEv19ANcNRp4HvRo5l7Y
 yqHFGGJFXH9uXirWXsr8Ml7kEJm58rv63aLHheUS8VpAOeT+6Fy9sAW8OAesvw5ugCrb
 Vz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ji8kYjHLz8PFnojbvPvCd/Vry5lhoqUD8IbEBbwgHho=;
 b=LCdpoJA4v3VNmvtOEXk1dCsPEwS3Lhs0j1PCTbc81hygFsZ5uvCF015lYIyh90ZlBq
 SYuC4rduX1y+pVspKMopMQNcuF102Ym3xoo4xXM6VI4F1OZBlvXZ3uTMqj/Hat5RVdDa
 BRdjoMBIEp2H1+DjDnPkdnw0sJ9sqnfmjWdXTeeob+zDfM4UInR9ExSdM80NU3XbU+lg
 l5SGoMkkGgv9Gr2KblFtJcVdc1XOFS5gXQvOP/f2RTvgsei/kyZpFK6m9lgdMkAlhTdB
 ElxB48+73Ex5rh+H48zPdYkJ0mY9O/xGvoyfBWBGEMNIjiDd6FQaPkhrmswtM0gTNw6N
 k1QQ==
X-Gm-Message-State: AO0yUKUcCDTQxxFZl7MUbWwbGIkMWDhcipzM9kOBqXGUMpPb0gCpIyD6
 /237W4gh6rVsmAkuIN07iI0Tg/s8Srg=
X-Google-Smtp-Source: AK7set8QO2ooGdV3QI41Au4w6cIuq56LYXW5X+LThCoOWSZ6wfwEZf416YST+oXINHSALeUfNbL4Lw==
X-Received: by 2002:a17:906:ef8c:b0:8b1:806b:7dbb with SMTP id
 ze12-20020a170906ef8c00b008b1806b7dbbmr2496212ejb.51.1676636548109; 
 Fri, 17 Feb 2023 04:22:28 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a50c38a000000b004ad75c5c0fdsm1373472edf.18.2023.02.17.04.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 04:22:27 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/7] drm/ttm: Change the meaning of the fields in the
 drm_mm_nodes structure from pfn to bytes v3
Date: Fri, 17 Feb 2023 13:22:20 +0100
Message-Id: <20230217122224.29243-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230217122224.29243-1-christian.koenig@amd.com>
References: <20230217122224.29243-1-christian.koenig@amd.com>
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

From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>

Change the ttm_range_man_alloc() allocation from pages to size in bytes.
Fix the dependent drm_mm_nodes start and size from pages to bytes.

v2 (chk): Change the drm_mm_node usage in amdgpu as well. re-order the
          patch to be independent of the resource->start change.
v3 (chk): add some more missing u64 casts

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   | 15 ++++++------
 .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    |  8 +++----
 drivers/gpu/drm/i915/i915_scatterlist.c       |  6 ++---
 drivers/gpu/drm/ttm/ttm_range_manager.c       | 24 +++++++++----------
 4 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 44367f03316f..d66b5fcbadf2 100644
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
+						(u64)place->fpfn << PAGE_SHIFT,
+						(u64)place->lpfn << PAGE_SHIFT,
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
index 62fddcc59f02..b8cb72432a2a 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -64,10 +64,10 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
 	struct ttm_range_mgr_node *node;
 	struct drm_mm *mm = &rman->mm;
 	enum drm_mm_insert_mode mode;
-	unsigned long lpfn;
+	u64 lpfn;
 	int ret;
 
-	lpfn = place->lpfn;
+	lpfn = place->lpfn << PAGE_SHIFT;
 	if (!lpfn)
 		lpfn = man->size;
 
@@ -83,9 +83,10 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
 
 	spin_lock(&rman->lock);
 	ret = drm_mm_insert_node_in_range(mm, &node->mm_nodes[0],
-					  PFN_UP(node->base.size),
-					  bo->page_alignment, 0,
-					  place->fpfn, lpfn, mode);
+					  node->base.size,
+					  bo->page_alignment << PAGE_SHIFT, 0,
+					  (u64)place->fpfn << PAGE_SHIFT, lpfn,
+					  mode);
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
+	if (((u64)place->fpfn << PAGE_SHIFT) >= (node->start + size) ||
+	    (place->lpfn && ((u64)place->lpfn << PAGE_SHIFT) <= node->start))
 		return false;
 
 	return true;
@@ -135,10 +135,10 @@ static bool ttm_range_man_compatible(struct ttm_resource_manager *man,
 				     size_t size)
 {
 	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
-	u32 num_pages = PFN_UP(size);
 
-	if (node->start < place->fpfn ||
-	    (place->lpfn && (node->start + num_pages) > place->lpfn))
+	if (node->start < (u64)place->fpfn << PAGE_SHIFT ||
+	    (place->lpfn && (node->start + size) >
+	     (u64)place->lpfn << PAGE_SHIFT))
 		return false;
 
 	return true;
-- 
2.34.1

