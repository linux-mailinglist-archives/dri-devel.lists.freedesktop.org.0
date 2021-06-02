Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BA03985F8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 12:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7856EC3D;
	Wed,  2 Jun 2021 10:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499216EC36
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 10:09:21 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id b17so2298803ede.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 03:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pYzga26EleHtyEFm+7zqHYCA4F+3Z3aq3AbyYg09v7M=;
 b=lcPBjxdsxgf9tE0QR4Gc7cUQQSUTpJA0xSP3UGiipsO3nBm302g6eTVHikLxd0J37v
 0Ps2UTHOeCxtS0ZN7ghIVzGG60WpbDYtGMBKJMXhNuGAcGBYPnFwKqrr8e0U6ZIkBG+g
 O8A4tz0D7oZUy9SuaQY4nRvUHIkwB8DLjA/TY+zpfb56OG8KCC62hztnpSTmFdzx6i9E
 fRV0R1OkIpirmrYWD3wAUDeIRDQ7z359wjpL7GItP2/r16M/JsaJf6hthXnV6Dj4cxtz
 RkPJDtlRLtgzoQ7Z1Q4U95k6pthcnwvN3/wK96vZ/45ndoWSHZ4M+G6GxrRZwontV6ZA
 XgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pYzga26EleHtyEFm+7zqHYCA4F+3Z3aq3AbyYg09v7M=;
 b=Mcl5d8IyLiaiYel3SNwI94LBcv/b2pos2c0U6XzGGzROn/XEEu8Bftt3fs8ux6te6p
 uCD0q/L+9rXzGjqWhV8TXChWvZmiPI4hMXjYaAOc53msBXTWD9C25c2sQTtHM71sNhgx
 6u7tjevThYz0HUvRic+tcBBXnXE4eMGB10FjbvPvtFDkpBzdLAxyYYABejDPr3kpiacX
 WTjON8g6QK9ol+7GqVw0KCRZphHfg0xLYmK5Db+FImgOQLLPrnnTI81AtyyMx1h4bqpo
 /SjFelIg1ge8IuQUwinnFVkNkJmQH/uXVaaqfFyoYYWv9n5j1Nf2FqwoIRSBH9nas9Q+
 GzLg==
X-Gm-Message-State: AOAM5300hWQYYQW6PEEMHOLJ3afCbBtO7u3YcpLCBUFpC4M32TR6T+AE
 xduLr0h/OhKAT/LL9E8qQVxB9yctklE=
X-Google-Smtp-Source: ABdhPJxqEugv6boLbQj7DINbrETtjq4k4yTciV/1Vz6nrKSjthcUqQUbzZIVRu+Xkk/MxPS8l6sJ9A==
X-Received: by 2002:a50:a6c2:: with SMTP id f2mr30717970edc.39.1622628560065; 
 Wed, 02 Jun 2021 03:09:20 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:e6a4:731d:6be0:e698])
 by smtp.gmail.com with ESMTPSA id g4sm1017468edw.8.2021.06.02.03.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 03:09:19 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.auld@intel.com, thomas_os@shipmail.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 07/10] drm/amdgpu: switch the VRAM backend to self alloc
Date: Wed,  2 Jun 2021 12:09:11 +0200
Message-Id: <20210602100914.46246-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210602100914.46246-1-christian.koenig@amd.com>
References: <20210602100914.46246-1-christian.koenig@amd.com>
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

Similar to the TTM range manager.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 51 ++++++++++++--------
 1 file changed, 30 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 525cabe6c47a..5ebfaed37e47 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -23,6 +23,8 @@
  */
 
 #include <linux/dma-mapping.h>
+#include <drm/ttm/ttm_range_manager.h>
+
 #include "amdgpu.h"
 #include "amdgpu_vm.h"
 #include "amdgpu_res_cursor.h"
@@ -371,9 +373,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
 	uint64_t vis_usage = 0, mem_bytes, max_bytes;
+	struct ttm_range_mgr_node *node;
 	struct drm_mm *mm = &mgr->mm;
 	enum drm_mm_insert_mode mode;
-	struct drm_mm_node *nodes;
 	unsigned i;
 	int r;
 
@@ -388,8 +390,8 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 	/* bail out quickly if there's likely not enough VRAM for this BO */
 	mem_bytes = (u64)mem->num_pages << PAGE_SHIFT;
 	if (atomic64_add_return(mem_bytes, &mgr->usage) > max_bytes) {
-		atomic64_sub(mem_bytes, &mgr->usage);
-		return -ENOSPC;
+		r = -ENOSPC;
+		goto error_sub;
 	}
 
 	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
@@ -407,13 +409,15 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 		num_nodes = DIV_ROUND_UP(mem->num_pages, pages_per_node);
 	}
 
-	nodes = kvmalloc_array((uint32_t)num_nodes, sizeof(*nodes),
-			       GFP_KERNEL | __GFP_ZERO);
-	if (!nodes) {
-		atomic64_sub(mem_bytes, &mgr->usage);
-		return -ENOMEM;
+	node = kvmalloc(struct_size(node, mm_nodes, num_nodes),
+			GFP_KERNEL | __GFP_ZERO);
+	if (!node) {
+		r = -ENOMEM;
+		goto error_sub;
 	}
 
+	ttm_resource_init(tbo, place, &node->base);
+
 	mode = DRM_MM_INSERT_BEST;
 	if (place->flags & TTM_PL_FLAG_TOPDOWN)
 		mode = DRM_MM_INSERT_HIGH;
@@ -432,8 +436,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 		if (pages >= pages_per_node)
 			alignment = pages_per_node;
 
-		r = drm_mm_insert_node_in_range(mm, &nodes[i], pages, alignment,
-						0, place->fpfn, lpfn, mode);
+		r = drm_mm_insert_node_in_range(mm, &node->mm_nodes[i], pages,
+						alignment, 0, place->fpfn,
+						lpfn, mode);
 		if (unlikely(r)) {
 			if (pages > pages_per_node) {
 				if (is_power_of_2(pages))
@@ -442,11 +447,11 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 					pages = rounddown_pow_of_two(pages);
 				continue;
 			}
-			goto error;
+			goto error_free;
 		}
 
-		vis_usage += amdgpu_vram_mgr_vis_size(adev, &nodes[i]);
-		amdgpu_vram_mgr_virt_start(mem, &nodes[i]);
+		vis_usage += amdgpu_vram_mgr_vis_size(adev, &node->mm_nodes[i]);
+		amdgpu_vram_mgr_virt_start(mem, &node->mm_nodes[i]);
 		pages_left -= pages;
 		++i;
 
@@ -459,16 +464,17 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 		mem->placement |= TTM_PL_FLAG_CONTIGUOUS;
 
 	atomic64_add(vis_usage, &mgr->vis_usage);
-	mem->mm_node = nodes;
+	mem->mm_node = &node->mm_nodes[0];
 	return 0;
 
-error:
+error_free:
 	while (i--)
-		drm_mm_remove_node(&nodes[i]);
+		drm_mm_remove_node(&node->mm_nodes[i]);
 	spin_unlock(&mgr->lock);
-	atomic64_sub(mem->num_pages << PAGE_SHIFT, &mgr->usage);
+	kvfree(node);
 
-	kvfree(nodes);
+error_sub:
+	atomic64_sub(mem_bytes, &mgr->usage);
 	return r;
 }
 
@@ -485,13 +491,17 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
 {
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
-	struct drm_mm_node *nodes = mem->mm_node;
+	struct ttm_range_mgr_node *node;
 	uint64_t usage = 0, vis_usage = 0;
 	unsigned pages = mem->num_pages;
+	struct drm_mm_node *nodes;
 
 	if (!mem->mm_node)
 		return;
 
+	node = to_ttm_range_mgr_node(mem);
+	nodes = &node->mm_nodes[0];
+
 	spin_lock(&mgr->lock);
 	while (pages) {
 		pages -= nodes->size;
@@ -506,8 +516,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
 	atomic64_sub(usage, &mgr->usage);
 	atomic64_sub(vis_usage, &mgr->vis_usage);
 
-	kvfree(mem->mm_node);
-	mem->mm_node = NULL;
+	kvfree(node);
 }
 
 /**
-- 
2.25.1

