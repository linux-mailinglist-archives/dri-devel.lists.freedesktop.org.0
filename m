Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC2169AB5D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 13:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D2B10EFA7;
	Fri, 17 Feb 2023 12:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634DF10EF9D;
 Fri, 17 Feb 2023 12:22:33 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id eg30so3345920edb.7;
 Fri, 17 Feb 2023 04:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7MGV4uOhAv7nUlPygyecvWiMFfXFksQYblobBmyBXSE=;
 b=DOG25/vIyy9JgVeRdRDVcTMDblKdRctpqnaoEGNntZaAEdX9rJ1lrKYMHkoqUhSf24
 f3LOAcLARZXMjKA/8eDFoqPouMiFf9tAz9q6kyISjH2US8GKbIFOKyRFAmSjChRKl/Dz
 Pd76idK2ipaFt62gql/BVFFltMZCVxms6R4ArjYgHFBzvuKE+Dwr0OHYzgdMolzH1dwG
 J1eyN1Fd6/+E1vOhL3+MxzDqq2JgtWppRaGHoycbcjsVm8XJw0hbAQzO5kZ9kNt6rfJT
 z0p8Wfpmc3DGZ7zi3Fpy05OBite1FjuEKTdl0zIjnbSo0f6HvUu0EHcFtUGqjoz0kWnX
 XjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7MGV4uOhAv7nUlPygyecvWiMFfXFksQYblobBmyBXSE=;
 b=zX59JTP2O2f+YAsm17JmvCkCRuNze3FPLY3AHZ9l15VKVTsU6cQxJQO40lc/z7dH7F
 dnSfXmy/K5m0he/l8aITdy8B7b3Hpt262L9qrJB8QTw+f41eFAqyVGemEe9Z9Sa85ubu
 pqrYG56wH8VMjhEn6kml55k4iZlJww6pmOysUxUGxxCzmEgL0jYP0zvE07s0PZLx+MB0
 ufq1MxGodPT7s8KOvgBLiCa7QzUWm6Soi/nRJ30tTM0Oi0z2o2kIkrYvTRn1VEc0H+ag
 vN6BzW3ULp+neQ43kQLoPdblzNjtHv7nEgon13TxbrsxCBiG6pxUaIbj1OBKrw/2neEx
 rlqg==
X-Gm-Message-State: AO0yUKU6jdHQjxAg739Nzbr4f7RSpCEb+H4/ijhb+adD0J9ax6FH8S3N
 /PruLyIGqIUxmNs3r6zaoh8ow8nYnPA=
X-Google-Smtp-Source: AK7set9/86wC9bqltH0q8Wetly6Ue9Yb04Rlh4awwHDw/L/UhEsF7YUKYUP6J6v7LKoMxe8tijqedQ==
X-Received: by 2002:a17:906:e10e:b0:8b1:7569:b51a with SMTP id
 gj14-20020a170906e10e00b008b17569b51amr4323657ejb.53.1676636551821; 
 Fri, 17 Feb 2023 04:22:31 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a50c38a000000b004ad75c5c0fdsm1373472edf.18.2023.02.17.04.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 04:22:31 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] drm/ttm: cleanup ttm_range_mgr_node
Date: Fri, 17 Feb 2023 13:22:24 +0100
Message-Id: <20230217122224.29243-7-christian.koenig@amd.com>
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

We don't need multiple drm_mm nodes any more. Clean that up and remove
the extra complexity.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c    | 18 +++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h |  2 +-
 drivers/gpu/drm/i915/intel_region_ttm.c        |  2 +-
 drivers/gpu/drm/ttm/ttm_range_manager.c        | 13 ++++++-------
 include/drm/ttm/ttm_range_manager.h            |  6 +++---
 5 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index a48ed9027fee..f128a886a89b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -97,7 +97,7 @@ bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_resource *res)
 {
 	struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
 
-	return drm_mm_node_allocated(&node->mm_nodes[0]);
+	return drm_mm_node_allocated(&node->mm_node);
 }
 
 /**
@@ -119,7 +119,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 	struct ttm_range_mgr_node *node;
 	int r;
 
-	node = kzalloc(struct_size(node, mm_nodes, 1), GFP_KERNEL);
+	node = kzalloc(sizeof(*node), GFP_KERNEL);
 	if (!node)
 		return -ENOMEM;
 
@@ -132,7 +132,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 
 	if (place->lpfn) {
 		spin_lock(&mgr->lock);
-		r = drm_mm_insert_node_in_range(&mgr->mm, &node->mm_nodes[0],
+		r = drm_mm_insert_node_in_range(&mgr->mm, &node->mm_node,
 						tbo->base.size,
 						tbo->page_alignment << PAGE_SHIFT, 0,
 						(u64)place->fpfn << PAGE_SHIFT,
@@ -142,10 +142,10 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 		if (unlikely(r))
 			goto err_free;
 
-		node->base.start = node->mm_nodes[0].start;
+		node->base.start = node->mm_node.start;
 	} else {
-		node->mm_nodes[0].start = 0;
-		node->mm_nodes[0].size = node->base.size;
+		node->mm_node.start = 0;
+		node->mm_node.size = node->base.size;
 		node->base.start = AMDGPU_BO_INVALID_OFFSET;
 	}
 
@@ -173,8 +173,8 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
 
 	spin_lock(&mgr->lock);
-	if (drm_mm_node_allocated(&node->mm_nodes[0]))
-		drm_mm_remove_node(&node->mm_nodes[0]);
+	if (drm_mm_node_allocated(&node->mm_node))
+		drm_mm_remove_node(&node->mm_node);
 	spin_unlock(&mgr->lock);
 
 	ttm_resource_fini(man, res);
@@ -197,7 +197,7 @@ void amdgpu_gtt_mgr_recover(struct amdgpu_gtt_mgr *mgr)
 	adev = container_of(mgr, typeof(*adev), mman.gtt_mgr);
 	spin_lock(&mgr->lock);
 	drm_mm_for_each_node(mm_node, &mgr->mm) {
-		node = container_of(mm_node, typeof(*node), mm_nodes[0]);
+		node = container_of(mm_node, typeof(*node), mm_node);
 		amdgpu_ttm_recover_gart(node->base.bo);
 	}
 	spin_unlock(&mgr->lock);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
index 5c78f0b09351..684cd8c0aa27 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
@@ -90,7 +90,7 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
 		cur->node = block;
 		break;
 	case TTM_PL_TT:
-		node = to_ttm_range_mgr_node(res)->mm_nodes;
+		node = &to_ttm_range_mgr_node(res)->mm_node;
 		while (start >= node->size << PAGE_SHIFT)
 			start -= node++->size << PAGE_SHIFT;
 
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index b7fbd5abb42a..057329d05d0d 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -168,7 +168,7 @@ intel_region_ttm_resource_to_rsgt(struct intel_memory_region *mem,
 		struct ttm_range_mgr_node *range_node =
 			to_ttm_range_mgr_node(res);
 
-		return i915_rsgt_from_mm_node(&range_node->mm_nodes[0],
+		return i915_rsgt_from_mm_node(&range_node->mm_node,
 					      mem->region.start,
 					      page_alignment);
 	} else {
diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index c3cd7c6dd816..62eb101e3d33 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -71,7 +71,7 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
 	if (!lpfn)
 		lpfn = man->size;
 
-	node = kzalloc(struct_size(node, mm_nodes, 1), GFP_KERNEL);
+	node = kzalloc(sizeof(*node), GFP_KERNEL);
 	if (!node)
 		return -ENOMEM;
 
@@ -82,8 +82,7 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
 	ttm_resource_init(bo, place, &node->base);
 
 	spin_lock(&rman->lock);
-	ret = drm_mm_insert_node_in_range(mm, &node->mm_nodes[0],
-					  node->base.size,
+	ret = drm_mm_insert_node_in_range(mm, &node->mm_node, node->base.size,
 					  bo->page_alignment << PAGE_SHIFT, 0,
 					  (u64)place->fpfn << PAGE_SHIFT, lpfn,
 					  mode);
@@ -95,7 +94,7 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
 		return ret;
 	}
 
-	node->base.start = node->mm_nodes[0].start;
+	node->base.start = node->mm_node.start;
 	*res = &node->base;
 	return 0;
 }
@@ -107,7 +106,7 @@ static void ttm_range_man_free(struct ttm_resource_manager *man,
 	struct ttm_range_manager *rman = to_range_manager(man);
 
 	spin_lock(&rman->lock);
-	drm_mm_remove_node(&node->mm_nodes[0]);
+	drm_mm_remove_node(&node->mm_node);
 	spin_unlock(&rman->lock);
 
 	ttm_resource_fini(man, res);
@@ -119,7 +118,7 @@ static bool ttm_range_man_intersects(struct ttm_resource_manager *man,
 				     const struct ttm_place *place,
 				     size_t size)
 {
-	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
+	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_node;
 
 	/* Don't evict BOs outside of the requested placement range */
 	if (((u64)place->fpfn << PAGE_SHIFT) >= (node->start + size) ||
@@ -134,7 +133,7 @@ static bool ttm_range_man_compatible(struct ttm_resource_manager *man,
 				     const struct ttm_place *place,
 				     size_t size)
 {
-	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
+	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_node;
 
 	if (node->start < (u64)place->fpfn << PAGE_SHIFT ||
 	    (place->lpfn && (node->start + size) >
diff --git a/include/drm/ttm/ttm_range_manager.h b/include/drm/ttm/ttm_range_manager.h
index 05bffded1b53..9dc76a51be1f 100644
--- a/include/drm/ttm/ttm_range_manager.h
+++ b/include/drm/ttm/ttm_range_manager.h
@@ -11,14 +11,14 @@
  * struct ttm_range_mgr_node
  *
  * @base: base clase we extend
- * @mm_nodes: MM nodes, usually 1
+ * @mm_node: MM node
  *
  * Extending the ttm_resource object to manage an address space allocation with
- * one or more drm_mm_nodes.
+ * a drm_mm_nodes.
  */
 struct ttm_range_mgr_node {
 	struct ttm_resource base;
-	struct drm_mm_node mm_nodes[];
+	struct drm_mm_node mm_node;
 };
 
 /**
-- 
2.34.1

