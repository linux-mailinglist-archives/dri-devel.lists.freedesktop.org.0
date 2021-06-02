Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D4E3985F5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 12:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D8E6EC37;
	Wed,  2 Jun 2021 10:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19226EC37
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 10:09:20 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id ba2so505300edb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 03:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aLgr9dubO6zjSqJN6PcNkA5F+adSJSYF13gyjml/SNA=;
 b=SCr4PXnGKICj8AnUSOvUIW8ulQKwjtN/rxkPvHp8ONYA6x4VDGaSkxMEoKNd7cYrRz
 9eQ6DwXZQp24a20Zy7f4vBD13v8p8DlUblk2bGnZNLSF6yiy2819y/Ky/ig8nOHiWPMU
 Yguvo6jT+ErNCh94FhzXiQrCFnYn4iqcuffXH60qhN8huYfyQaYXyITslA1tRUaJoL/A
 z3vmQkeemhGKJscRDl6qHR4ogCIal/cDNLkPPA5XXVzwnNC0399MICKZR+rnMykjvq/v
 AmGp/zHkaDPPUqQLFl8K8padVj9JUbJ6vIAti3CbHn2X6DkHzR7eozEYJ/9c776Cg5vx
 ytCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aLgr9dubO6zjSqJN6PcNkA5F+adSJSYF13gyjml/SNA=;
 b=bRsfIdcTPDdijBzkMEvkV2tRH96OPzMoOBBsAfO0rwRY4cXUEDdSpmU8M8XlVFipnA
 1EmBErm9wVwjr6ujgs8eN/o/+yIYKLU8imEcjGOIJ+NTg6vnwImkRkHqeqNdOZ4N19S0
 60rc7t/8CEwp+RIL9xxUql839M0V/qtZ/R151QmLswlx91lfc+2IXCOtezs2BqbDOJYk
 V169Kf+mA/BzG/QZcA6t3FvckVitvr2JIvT+akiJ5A7+PiMzmhGTRefCdjIlev+IYZMB
 ve//X6dsF8DsBvQ6n4oTdZrJi3VdEtEA57J+yxcTOZJAcZ9K5zl9Qsh37OeaQHAg//sQ
 vf2g==
X-Gm-Message-State: AOAM533gBv7s2e8digIiMKctP1QGRxEhZ1i3LU25Rbsjc+u1HzKxIiy3
 jYooLr/5tZM63MSjk6B8KPg=
X-Google-Smtp-Source: ABdhPJxqQYlaK1JIkUd7vhHQDcG5MExvl3LxH7QRJLPFm9JMC9Mbs8XSCnos8l9cnisHdyEv9j4Dww==
X-Received: by 2002:a05:6402:22f3:: with SMTP id
 dn19mr17562799edb.240.1622628559414; 
 Wed, 02 Jun 2021 03:09:19 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:e6a4:731d:6be0:e698])
 by smtp.gmail.com with ESMTPSA id g4sm1017468edw.8.2021.06.02.03.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 03:09:19 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.auld@intel.com, thomas_os@shipmail.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 06/10] drm/amdgpu: switch the GTT backend to self alloc
Date: Wed,  2 Jun 2021 12:09:10 +0200
Message-Id: <20210602100914.46246-6-christian.koenig@amd.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 36 +++++++++++++--------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index cd5c55cb38d1..29113f72bc39 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -22,11 +22,13 @@
  * Authors: Christian König
  */
 
+#include <drm/ttm/ttm_range_manager.h>
+
 #include "amdgpu.h"
 
 struct amdgpu_gtt_node {
-	struct drm_mm_node node;
 	struct ttm_buffer_object *tbo;
+	struct ttm_range_mgr_node base;
 };
 
 static inline struct amdgpu_gtt_mgr *
@@ -38,7 +40,8 @@ to_gtt_mgr(struct ttm_resource_manager *man)
 static inline struct amdgpu_gtt_node *
 to_amdgpu_gtt_node(struct ttm_resource *res)
 {
-	return container_of(res->mm_node, struct amdgpu_gtt_node, node);
+	return container_of(res->mm_node, struct amdgpu_gtt_node,
+			    base.mm_nodes[0]);
 }
 
 /**
@@ -107,7 +110,7 @@ bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_resource *mem)
 {
 	struct amdgpu_gtt_node *node = to_amdgpu_gtt_node(mem);
 
-	return drm_mm_node_allocated(&node->node);
+	return drm_mm_node_allocated(&node->base.mm_nodes[0]);
 }
 
 /**
@@ -138,16 +141,19 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 	atomic64_sub(mem->num_pages, &mgr->available);
 	spin_unlock(&mgr->lock);
 
-	node = kzalloc(sizeof(*node), GFP_KERNEL);
+	node = kzalloc(struct_size(node, base.mm_nodes, 1), GFP_KERNEL);
 	if (!node) {
 		r = -ENOMEM;
 		goto err_out;
 	}
 
 	node->tbo = tbo;
+	ttm_resource_init(tbo, place, &node->base.base);
+
 	if (place->lpfn) {
 		spin_lock(&mgr->lock);
-		r = drm_mm_insert_node_in_range(&mgr->mm, &node->node,
+		r = drm_mm_insert_node_in_range(&mgr->mm,
+						&node->base.mm_nodes[0],
 						mem->num_pages,
 						tbo->page_alignment, 0,
 						place->fpfn, place->lpfn,
@@ -156,14 +162,14 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 		if (unlikely(r))
 			goto err_free;
 
-		mem->start = node->node.start;
+		mem->start = node->base.mm_nodes[0].start;
 	} else {
-		node->node.start = 0;
-		node->node.size = mem->num_pages;
+		node->base.mm_nodes[0].start = 0;
+		node->base.mm_nodes[0].size = mem->num_pages;
 		mem->start = AMDGPU_BO_INVALID_OFFSET;
 	}
 
-	mem->mm_node = &node->node;
+	mem->mm_node = &node->base.mm_nodes[0];
 	return 0;
 
 err_free:
@@ -186,15 +192,17 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
 			       struct ttm_resource *mem)
 {
-	struct amdgpu_gtt_node *node = to_amdgpu_gtt_node(mem);
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
+	struct amdgpu_gtt_node *node;
 
-	if (!node)
+	if (!mem->mm_node)
 		return;
 
+	node = to_amdgpu_gtt_node(mem);
+
 	spin_lock(&mgr->lock);
-	if (drm_mm_node_allocated(&node->node))
-		drm_mm_remove_node(&node->node);
+	if (drm_mm_node_allocated(&node->base.mm_nodes[0]))
+		drm_mm_remove_node(&node->base.mm_nodes[0]);
 	spin_unlock(&mgr->lock);
 	atomic64_add(mem->num_pages, &mgr->available);
 
@@ -232,7 +240,7 @@ int amdgpu_gtt_mgr_recover(struct ttm_resource_manager *man)
 
 	spin_lock(&mgr->lock);
 	drm_mm_for_each_node(mm_node, &mgr->mm) {
-		node = container_of(mm_node, struct amdgpu_gtt_node, node);
+		node = container_of(mm_node, typeof(*node), base.mm_nodes[0]);
 		r = amdgpu_ttm_recover_gart(node->tbo);
 		if (r)
 			break;
-- 
2.25.1

