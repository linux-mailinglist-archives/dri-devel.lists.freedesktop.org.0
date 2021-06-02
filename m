Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB963985F9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 12:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6A36EC3E;
	Wed,  2 Jun 2021 10:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B64B6EC27
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 10:09:22 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id i13so2210940edb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 03:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9kVpvVLyhwVbnqliyoxOgazgDOeFeOyUUOa+njvh4HA=;
 b=B3b2Wvlr7r/n6Vgx4FeCwpgVn0ULdLOt07Zdxy0wBDCO1d5KeC4V7eo3cv0W7JQgTN
 1CikM/Qf28nvqJMYX4VXC3pfMf91BsGb+ol5b+4d/5uNg0YDKzwrxaRTwiut/BnS4mfF
 voyxL/5JkIuHgoOK3O3c5V4+B+YPKfv2Rw1NzHmjimsybQdVWELoYMOLwV4dFjkN23PD
 YU3CVHCTA5LNLyej3viiEoobyR3CAe0okcO4H4iSoboAiIYAbOpJ8m+2IjDChlrhMcR+
 0iof+Tin5n9pXZvkWnfNSjJO9l3TqFfVjJ2Dy+LQr/lQuXP8UIIQ7Va8hg0jw/zlI/rl
 I+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9kVpvVLyhwVbnqliyoxOgazgDOeFeOyUUOa+njvh4HA=;
 b=Cj7LSGsOtpE340rw8WbehlVuD0CNaD8Zu2yM8NkRWr8fxPbI2NEYxs4BmfI5y9byNV
 L/tXLczx9l9yXl2EZKvKowjulgnf/m5UgEs57Kl31aU/eCJodbr/O3yes0WFCXtROYbZ
 c3WahMXUotDvN52F+RZ1+xjNidXTyogLLc8vAz+plmTVL0xCepYERUgCuEu5VO72JyDa
 RFxuP1dFdVYIbUGfTZZ2vTYjUrqDeT1MrCZNtXo6mv7/y+gxnjIJO160bwQPxc7f+fIP
 nIc1l9eGqM10i9at7bVhXuRl40D2YssCfl8d165RK+IB9ffcshvU4BEOB8WPrEGzdGF2
 0apA==
X-Gm-Message-State: AOAM531bNHRiO7kH05lwf95dV2PoaWxvcbVVidjPQmnpc9CNmqGW4d6V
 Z4iGauKKpsGUb4RWmcfhdmE=
X-Google-Smtp-Source: ABdhPJx126uJ08+1SYtSC6pGB1P7Yn1iK1kvhBgI8awa4I+Elb5bNhiGpFTbHgiJCoSOAIf7Eg6DZQ==
X-Received: by 2002:a05:6402:1d8e:: with SMTP id
 dk14mr38050018edb.385.1622628561409; 
 Wed, 02 Jun 2021 03:09:21 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:e6a4:731d:6be0:e698])
 by smtp.gmail.com with ESMTPSA id g4sm1017468edw.8.2021.06.02.03.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 03:09:21 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.auld@intel.com, thomas_os@shipmail.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 09/10] drm/vmwgfx: switch the TTM backends to self alloc
Date: Wed,  2 Jun 2021 12:09:13 +0200
Message-Id: <20210602100914.46246-9-christian.koenig@amd.com>
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
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c | 18 +++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c           | 37 ++++++++++---------
 2 files changed, 31 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
index 1774960d1b89..82a5e6489810 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
@@ -57,6 +57,12 @@ static int vmw_gmrid_man_get_node(struct ttm_resource_manager *man,
 	struct vmwgfx_gmrid_man *gman = to_gmrid_manager(man);
 	int id;
 
+	mem->mm_node = kmalloc(sizeof(*mem), GFP_KERNEL);
+	if (!mem->mm_node)
+		return -ENOMEM;
+
+	ttm_resource_init(bo, place, mem->mm_node);
+
 	id = ida_alloc_max(&gman->gmr_ida, gman->max_gmr_ids - 1, GFP_KERNEL);
 	if (id < 0)
 		return id;
@@ -87,13 +93,11 @@ static void vmw_gmrid_man_put_node(struct ttm_resource_manager *man,
 {
 	struct vmwgfx_gmrid_man *gman = to_gmrid_manager(man);
 
-	if (mem->mm_node) {
-		ida_free(&gman->gmr_ida, mem->start);
-		spin_lock(&gman->lock);
-		gman->used_gmr_pages -= mem->num_pages;
-		spin_unlock(&gman->lock);
-		mem->mm_node = NULL;
-	}
+	ida_free(&gman->gmr_ida, mem->start);
+	spin_lock(&gman->lock);
+	gman->used_gmr_pages -= mem->num_pages;
+	spin_unlock(&gman->lock);
+	kfree(mem->mm_node);
 }
 
 static const struct ttm_resource_manager_func vmw_gmrid_manager_func;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
index 5ccc35b3194c..8765835696ac 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
@@ -7,6 +7,7 @@
 #include "vmwgfx_drv.h"
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
+#include <drm/ttm/ttm_range_manager.h>
 
 /**
  * struct vmw_thp_manager - Range manager implementing huge page alignment
@@ -54,16 +55,18 @@ static int vmw_thp_get_node(struct ttm_resource_manager *man,
 {
 	struct vmw_thp_manager *rman = to_thp_manager(man);
 	struct drm_mm *mm = &rman->mm;
-	struct drm_mm_node *node;
+	struct ttm_range_mgr_node *node;
 	unsigned long align_pages;
 	unsigned long lpfn;
 	enum drm_mm_insert_mode mode = DRM_MM_INSERT_BEST;
 	int ret;
 
-	node = kzalloc(sizeof(*node), GFP_KERNEL);
+	node = kzalloc(struct_size(node, mm_nodes, 1), GFP_KERNEL);
 	if (!node)
 		return -ENOMEM;
 
+	ttm_resource_init(bo, place, &node->base);
+
 	lpfn = place->lpfn;
 	if (!lpfn)
 		lpfn = man->size;
@@ -76,8 +79,9 @@ static int vmw_thp_get_node(struct ttm_resource_manager *man,
 	if (IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)) {
 		align_pages = (HPAGE_PUD_SIZE >> PAGE_SHIFT);
 		if (mem->num_pages >= align_pages) {
-			ret = vmw_thp_insert_aligned(bo, mm, node, align_pages,
-						     place, mem, lpfn, mode);
+			ret = vmw_thp_insert_aligned(bo, mm, &node->mm_nodes[0],
+						     align_pages, place, mem,
+						     lpfn, mode);
 			if (!ret)
 				goto found_unlock;
 		}
@@ -85,14 +89,15 @@ static int vmw_thp_get_node(struct ttm_resource_manager *man,
 
 	align_pages = (HPAGE_PMD_SIZE >> PAGE_SHIFT);
 	if (mem->num_pages >= align_pages) {
-		ret = vmw_thp_insert_aligned(bo, mm, node, align_pages, place,
-					     mem, lpfn, mode);
+		ret = vmw_thp_insert_aligned(bo, mm, &node->mm_nodes[0],
+					     align_pages, place, mem, lpfn,
+					     mode);
 		if (!ret)
 			goto found_unlock;
 	}
 
-	ret = drm_mm_insert_node_in_range(mm, node, mem->num_pages,
-					  bo->page_alignment, 0,
+	ret = drm_mm_insert_node_in_range(mm, &node->mm_nodes[0],
+					  mem->num_pages, bo->page_alignment, 0,
 					  place->fpfn, lpfn, mode);
 found_unlock:
 	spin_unlock(&rman->lock);
@@ -100,8 +105,8 @@ static int vmw_thp_get_node(struct ttm_resource_manager *man,
 	if (unlikely(ret)) {
 		kfree(node);
 	} else {
-		mem->mm_node = node;
-		mem->start = node->start;
+		mem->mm_node = &node->mm_nodes[0];
+		mem->start = node->mm_nodes[0].start;
 	}
 
 	return ret;
@@ -113,15 +118,13 @@ static void vmw_thp_put_node(struct ttm_resource_manager *man,
 			     struct ttm_resource *mem)
 {
 	struct vmw_thp_manager *rman = to_thp_manager(man);
+	struct ttm_range_mgr_node * node = mem->mm_node;
 
-	if (mem->mm_node) {
-		spin_lock(&rman->lock);
-		drm_mm_remove_node(mem->mm_node);
-		spin_unlock(&rman->lock);
+	spin_lock(&rman->lock);
+	drm_mm_remove_node(&node->mm_nodes[0]);
+	spin_unlock(&rman->lock);
 
-		kfree(mem->mm_node);
-		mem->mm_node = NULL;
-	}
+	kfree(node);
 }
 
 int vmw_thp_init(struct vmw_private *dev_priv)
-- 
2.25.1

