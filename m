Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F833A29DC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 13:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E5A6ECF9;
	Thu, 10 Jun 2021 11:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CFE6ECF7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 11:06:01 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id g204so5903025wmf.5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 04:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bdtBJHv3rRSwyww0weFWdpd3W/X4XU3qB1Cxrtz3AxI=;
 b=JimffJpIb+9AIh3qndD4s+1y9e7qMuGXy5lYG4pyXVpn0BoFQvQ/IUcDt5BySWlTSb
 mEAFVXqo8DizWwcr6qCRHyH82D1WDQXfTnu4i5VPV+PPU9yV3c1Px4Qq18XUaHFACeS2
 MRTD5BAEhz7cW8mAzhJc6E8nXy1O5wern1WM8NLvPzNf8l/1Br/YQEtzTJ7WJimFRH+d
 jmqjZcmOtl52SBYJ9Mco4DwEz0+ObzyLOPM19vPm99y/s3l5wwxDB4ExgnPfYMO/mjS6
 LEV6uB1gfXHbB+MXa9Han9GITjYf5O10/5XrvIt/lx51wj1A1DGvZ/Q/aHnHqGSxy69I
 +f1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bdtBJHv3rRSwyww0weFWdpd3W/X4XU3qB1Cxrtz3AxI=;
 b=ZBL+uKdGsgfg+UwWl3pQnYw0b5c8a81Trw4qG1N3/0QefKj5yVPiEyStdjTijwJyKP
 z3u9q/j2mf6znnoI1DrHxrg6RxBKw3Gihi7Ui1sw0am8vd83GNlczI/o+2/xh+BguQef
 rCxRQE9WhQEutw03fD5/Phgv5kVS23F7QKbU/MJmTYD32RROMQ73DPdPVzwVg+4fhgVs
 Hf1EADrM0CyFwSinSidK5gAtJwSisJJcUJfMCCQ48mZ/1PFP1soMz/3RNDLqbJrZK/wL
 pQOpHxtMXF9X9/Uh9nM24nANb3fGoDd9ivgbGOB8Ka2CGNko9mdVWBkYtCcqqg9/mFlh
 ZqhA==
X-Gm-Message-State: AOAM530l6S9BSpFznliraX6lGIVEMTe0e8HjI0XB2kPEKMA5N4yd3FQp
 AgsSXzwo/F2qugu1MTNBxUaDSX6Fies=
X-Google-Smtp-Source: ABdhPJxhkCAsUgxXInsmEEiOY+DGOZDv5YG+uI3aE7e4LuG++VKg0xJnb2AKwbht3rNrmp26r0bhfw==
X-Received: by 2002:a1c:a917:: with SMTP id s23mr4546830wme.55.1623323160559; 
 Thu, 10 Jun 2021 04:06:00 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:14a0:1c64:4cb2:9d16])
 by smtp.gmail.com with ESMTPSA id z12sm3234372wmc.5.2021.06.10.04.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 04:06:00 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas_os@shipmail.org, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/ttm: add a pointer to the allocating BO into
 ttm_resource
Date: Thu, 10 Jun 2021 13:05:56 +0200
Message-Id: <20210610110559.1758-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

We are going to need this for the next patch and it allows us to clean
up amdgpu as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 47 ++++++++-------------
 drivers/gpu/drm/ttm/ttm_resource.c          |  1 +
 include/drm/ttm/ttm_resource.h              |  1 +
 3 files changed, 19 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 194f9eecf89c..8e3f5da44e4f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -26,23 +26,12 @@
 
 #include "amdgpu.h"
 
-struct amdgpu_gtt_node {
-	struct ttm_buffer_object *tbo;
-	struct ttm_range_mgr_node base;
-};
-
 static inline struct amdgpu_gtt_mgr *
 to_gtt_mgr(struct ttm_resource_manager *man)
 {
 	return container_of(man, struct amdgpu_gtt_mgr, manager);
 }
 
-static inline struct amdgpu_gtt_node *
-to_amdgpu_gtt_node(struct ttm_resource *res)
-{
-	return container_of(res, struct amdgpu_gtt_node, base.base);
-}
-
 /**
  * DOC: mem_info_gtt_total
  *
@@ -107,9 +96,9 @@ const struct attribute_group amdgpu_gtt_mgr_attr_group = {
  */
 bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_resource *res)
 {
-	struct amdgpu_gtt_node *node = to_amdgpu_gtt_node(res);
+	struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
 
-	return drm_mm_node_allocated(&node->base.mm_nodes[0]);
+	return drm_mm_node_allocated(&node->mm_nodes[0]);
 }
 
 /**
@@ -129,7 +118,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 {
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
 	uint32_t num_pages = PFN_UP(tbo->base.size);
-	struct amdgpu_gtt_node *node;
+	struct ttm_range_mgr_node *node;
 	int r;
 
 	spin_lock(&mgr->lock);
@@ -141,19 +130,17 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 	atomic64_sub(num_pages, &mgr->available);
 	spin_unlock(&mgr->lock);
 
-	node = kzalloc(struct_size(node, base.mm_nodes, 1), GFP_KERNEL);
+	node = kzalloc(struct_size(node, mm_nodes, 1), GFP_KERNEL);
 	if (!node) {
 		r = -ENOMEM;
 		goto err_out;
 	}
 
-	node->tbo = tbo;
-	ttm_resource_init(tbo, place, &node->base.base);
-
+	ttm_resource_init(tbo, place, &node->base);
 	if (place->lpfn) {
 		spin_lock(&mgr->lock);
 		r = drm_mm_insert_node_in_range(&mgr->mm,
-						&node->base.mm_nodes[0],
+						&node->mm_nodes[0],
 						num_pages, tbo->page_alignment,
 						0, place->fpfn, place->lpfn,
 						DRM_MM_INSERT_BEST);
@@ -161,14 +148,14 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 		if (unlikely(r))
 			goto err_free;
 
-		node->base.base.start = node->base.mm_nodes[0].start;
+		node->base.start = node->mm_nodes[0].start;
 	} else {
-		node->base.mm_nodes[0].start = 0;
-		node->base.mm_nodes[0].size = node->base.base.num_pages;
-		node->base.base.start = AMDGPU_BO_INVALID_OFFSET;
+		node->mm_nodes[0].start = 0;
+		node->mm_nodes[0].size = node->base.num_pages;
+		node->base.start = AMDGPU_BO_INVALID_OFFSET;
 	}
 
-	*res = &node->base.base;
+	*res = &node->base;
 	return 0;
 
 err_free:
@@ -191,12 +178,12 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
 			       struct ttm_resource *res)
 {
-	struct amdgpu_gtt_node *node = to_amdgpu_gtt_node(res);
+	struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
 
 	spin_lock(&mgr->lock);
-	if (drm_mm_node_allocated(&node->base.mm_nodes[0]))
-		drm_mm_remove_node(&node->base.mm_nodes[0]);
+	if (drm_mm_node_allocated(&node->mm_nodes[0]))
+		drm_mm_remove_node(&node->mm_nodes[0]);
 	spin_unlock(&mgr->lock);
 	atomic64_add(res->num_pages, &mgr->available);
 
@@ -228,14 +215,14 @@ uint64_t amdgpu_gtt_mgr_usage(struct ttm_resource_manager *man)
 int amdgpu_gtt_mgr_recover(struct ttm_resource_manager *man)
 {
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
-	struct amdgpu_gtt_node *node;
+	struct ttm_range_mgr_node *node;
 	struct drm_mm_node *mm_node;
 	int r = 0;
 
 	spin_lock(&mgr->lock);
 	drm_mm_for_each_node(mm_node, &mgr->mm) {
-		node = container_of(mm_node, typeof(*node), base.mm_nodes[0]);
-		r = amdgpu_ttm_recover_gart(node->tbo);
+		node = container_of(mm_node, typeof(*node), mm_nodes[0]);
+		r = amdgpu_ttm_recover_gart(node->base.bo);
 		if (r)
 			break;
 	}
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 2431717376e7..7ff6194154fe 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -41,6 +41,7 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 	res->bus.offset = 0;
 	res->bus.is_iomem = false;
 	res->bus.caching = ttm_cached;
+	res->bo = bo;
 }
 EXPORT_SYMBOL(ttm_resource_init);
 
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 140b6b9a8bbe..6d0b7a6d2169 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -171,6 +171,7 @@ struct ttm_resource {
 	uint32_t mem_type;
 	uint32_t placement;
 	struct ttm_bus_placement bus;
+	struct ttm_buffer_object *bo;
 };
 
 /**
-- 
2.25.1

