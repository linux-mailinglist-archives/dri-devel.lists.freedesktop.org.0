Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E12304B465B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 10:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FA810E295;
	Mon, 14 Feb 2022 09:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CC210E281
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 09:34:48 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id jg20so11168755ejc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 01:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=H+j4UZIPmheSQp2UXtzhXXIQwoUoJl9FMKsqcxEdwtw=;
 b=Qrygp/yOSwIIbDaxr6MqCI8KZs9XtfRIn+uJMfkYHPAxmvoEQvgaJDOF7geajDe5mL
 u7xDaov+wqrzmsNr5DmsVCahob0s5fRT3Xy1NFu8Dgl7wA+JiM7c9JvkpH0+RamptN+x
 sOD7nHLgoeluBHdsyxu5uWiu8itzfKeaOdCkpoOhE/eux5MzmY2W9dRSjCREYnfO9r93
 DVKQdFDRsd4o306SI2b3DGSRv5BaoGNZcIZ7fEDERjVdtINY9hfvxLHE4eP1coKrmTRN
 mTPLCROh0STNUloePtCanJZmyei2ziF9FQJdy2Q5EmusdZmahwMyYTHbf2T43LtRFUVt
 Gi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H+j4UZIPmheSQp2UXtzhXXIQwoUoJl9FMKsqcxEdwtw=;
 b=wo27xu37T5SIgU1PYoME0/5JCRH+XgEXwp30hDbtmaeJS2ZllhiTZVsaUXMfG1dVLQ
 2fVYRzZfheSjVPtm6YZ63d3k2C9GHQvD4TJLa4dQIZK9WHy5+5D/n842z8j+3iz68A7I
 DNmBhfs8/hvd7D2cQLJw3LI9AvBXlnb4yvywefqyPFhor6zXuezyVJxlwyyT+z9JfOFr
 Jm0CDy94P0K5BcPPm/X/fWj6uk5xnkpB8JsRtbSsjWXMPFuFvEfdqG+IHBaevCQUbJZX
 63ZvSq13v9+5dJU4gFWBzErFSQt20UWCPl+GfK7/mcwuEHozGOCuGPWjF6ERx5tnytbv
 akrg==
X-Gm-Message-State: AOAM5326PQ6f0g+PpnA4dVr6PVk7IvDhV+bWww2ljiKVw0c2+8y2Rktu
 kMe5AP+pLT5ekWIrRgxQc2o=
X-Google-Smtp-Source: ABdhPJwCD9OR3QFZXMwkGyjcdHsqz1AGkTQykSG6x/v0RknFa33gVLOFMX6jcrwtR4hK2cYes+FI6w==
X-Received: by 2002:a17:906:748a:: with SMTP id
 e10mr7468217ejl.107.1644831287540; 
 Mon, 14 Feb 2022 01:34:47 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id y8sm4257940edc.41.2022.02.14.01.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 01:34:47 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.william.auld@gmail.com, daniel@ffwll.ch,
 thomas.hellstrom@linux.intel.com, felix.kuehling@amd.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 09/11] drm/amdgpu: drop amdgpu_gtt_node
Date: Mon, 14 Feb 2022 10:34:37 +0100
Message-Id: <20220214093439.2989-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214093439.2989-1-christian.koenig@amd.com>
References: <20220214093439.2989-1-christian.koenig@amd.com>
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

We have the BO pointer in the base structure now as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 49 ++++++++-------------
 include/drm/ttm/ttm_resource.h              |  8 ++++
 2 files changed, 26 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 3bcd27ae379d..68494b959116 100644
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
@@ -106,9 +95,9 @@ const struct attribute_group amdgpu_gtt_mgr_attr_group = {
  */
 bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_resource *res)
 {
-	struct amdgpu_gtt_node *node = to_amdgpu_gtt_node(res);
+	struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
 
-	return drm_mm_node_allocated(&node->base.mm_nodes[0]);
+	return drm_mm_node_allocated(&node->mm_nodes[0]);
 }
 
 /**
@@ -128,15 +117,14 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 {
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
 	uint32_t num_pages = PFN_UP(tbo->base.size);
-	struct amdgpu_gtt_node *node;
+	struct ttm_range_mgr_node *node;
 	int r;
 
-	node = kzalloc(struct_size(node, base.mm_nodes, 1), GFP_KERNEL);
+	node = kzalloc(struct_size(node, mm_nodes, 1), GFP_KERNEL);
 	if (!node)
 		return -ENOMEM;
 
-	node->tbo = tbo;
-	ttm_resource_init(tbo, place, &node->base.base);
+	ttm_resource_init(tbo, place, &node->base);
 	if (!(place->flags & TTM_PL_FLAG_TEMPORARY) &&
 	    ttm_resource_manager_usage(man) > man->size) {
 		r = -ENOSPC;
@@ -145,8 +133,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 
 	if (place->lpfn) {
 		spin_lock(&mgr->lock);
-		r = drm_mm_insert_node_in_range(&mgr->mm,
-						&node->base.mm_nodes[0],
+		r = drm_mm_insert_node_in_range(&mgr->mm, &node->mm_nodes[0],
 						num_pages, tbo->page_alignment,
 						0, place->fpfn, place->lpfn,
 						DRM_MM_INSERT_BEST);
@@ -154,18 +141,18 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
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
-	ttm_resource_fini(man, &node->base.base);
+	ttm_resource_fini(man, &node->base);
 	kfree(node);
 	return r;
 }
@@ -181,12 +168,12 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
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
 
 	ttm_resource_fini(man, res);
@@ -202,7 +189,7 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
  */
 int amdgpu_gtt_mgr_recover(struct amdgpu_gtt_mgr *mgr)
 {
-	struct amdgpu_gtt_node *node;
+	struct ttm_range_mgr_node *node;
 	struct drm_mm_node *mm_node;
 	struct amdgpu_device *adev;
 	int r = 0;
@@ -210,8 +197,8 @@ int amdgpu_gtt_mgr_recover(struct amdgpu_gtt_mgr *mgr)
 	adev = container_of(mgr, typeof(*adev), mman.gtt_mgr);
 	spin_lock(&mgr->lock);
 	drm_mm_for_each_node(mm_node, &mgr->mm) {
-		node = container_of(mm_node, typeof(*node), base.mm_nodes[0]);
-		r = amdgpu_ttm_recover_gart(node->tbo);
+		node = container_of(mm_node, typeof(*node), mm_nodes[0]);
+		r = amdgpu_ttm_recover_gart(node->base.bo);
 		if (r)
 			break;
 	}
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index ef0ec700e896..8a780a348025 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -347,6 +347,14 @@ ttm_resource_manager_next(struct ttm_resource_manager *man,
 			  struct ttm_resource_cursor *cursor,
 			  struct ttm_resource *res);
 
+/**
+ * ttm_resource_manager_for_each_res - iterate over all resources
+ * @man: the resource manager
+ * @cursor: struct ttm_resource_cursor for the current position
+ * @res: the current resource
+ *
+ * Iterate over all the evictable resources in a resource manager.
+ */
 #define ttm_resource_manager_for_each_res(man, cursor, res)		\
 	for (res = ttm_resource_manager_first(man, cursor); res;	\
 	     res = ttm_resource_manager_next(man, cursor, res))
-- 
2.25.1

