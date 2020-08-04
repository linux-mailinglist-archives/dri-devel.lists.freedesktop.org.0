Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F33E623B317
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36C66E40A;
	Tue,  4 Aug 2020 02:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB926E40C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:59:04 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-KgaNQ3d6Nw69dogFUlvFpw-1; Mon, 03 Aug 2020 22:59:01 -0400
X-MC-Unique: KgaNQ3d6Nw69dogFUlvFpw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4F008005B0;
 Tue,  4 Aug 2020 02:59:00 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 033718AD1C;
 Tue,  4 Aug 2020 02:58:58 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 57/59] drm/ttm: rename bo manager to range manager.
Date: Tue,  4 Aug 2020 12:56:30 +1000
Message-Id: <20200804025632.3868079-58-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-1-airlied@gmail.com>
References: <20200804025632.3868079-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
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
Cc: sroland@vmware.com, christian.koenig@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

The generic manager is called the range manager now, rename
the file and some internals.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/Makefile                  |  2 +-
 .../{ttm_bo_manager.c => ttm_range_manager.c} | 26 +++++++++----------
 2 files changed, 14 insertions(+), 14 deletions(-)
 rename drivers/gpu/drm/ttm/{ttm_bo_manager.c => ttm_range_manager.c} (88%)

diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
index caea2a099496..e54326e6cea4 100644
--- a/drivers/gpu/drm/ttm/Makefile
+++ b/drivers/gpu/drm/ttm/Makefile
@@ -4,7 +4,7 @@
 
 ttm-y := ttm_memory.o ttm_tt.o ttm_bo.o \
 	ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
-	ttm_execbuf_util.o ttm_page_alloc.o ttm_bo_manager.o
+	ttm_execbuf_util.o ttm_page_alloc.o ttm_range_manager.o
 ttm-$(CONFIG_AGP) += ttm_agp_backend.o
 ttm-$(CONFIG_DRM_TTM_DMA_PAGE_POOL) += ttm_page_alloc_dma.o
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
similarity index 88%
rename from drivers/gpu/drm/ttm/ttm_bo_manager.c
rename to drivers/gpu/drm/ttm/ttm_range_manager.c
index 6679dc11934f..52d9a0ed7165 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -54,10 +54,10 @@ static inline struct ttm_range_manager *to_range_manager(struct ttm_mem_type_man
 	return container_of(man, struct ttm_range_manager, manager);
 }
 
-static int ttm_bo_man_get_node(struct ttm_mem_type_manager *man,
-			       struct ttm_buffer_object *bo,
-			       const struct ttm_place *place,
-			       struct ttm_mem_reg *mem)
+static int ttm_range_man_get_node(struct ttm_mem_type_manager *man,
+				  struct ttm_buffer_object *bo,
+				  const struct ttm_place *place,
+				  struct ttm_mem_reg *mem)
 {
 	struct ttm_range_manager *rman = to_range_manager(man);
 	struct drm_mm *mm = &rman->mm;
@@ -95,8 +95,8 @@ static int ttm_bo_man_get_node(struct ttm_mem_type_manager *man,
 	return ret;
 }
 
-static void ttm_bo_man_put_node(struct ttm_mem_type_manager *man,
-				struct ttm_mem_reg *mem)
+static void ttm_range_man_put_node(struct ttm_mem_type_manager *man,
+				   struct ttm_mem_reg *mem)
 {
 	struct ttm_range_manager *rman = to_range_manager(man);
 
@@ -110,7 +110,7 @@ static void ttm_bo_man_put_node(struct ttm_mem_type_manager *man,
 	}
 }
 
-static const struct ttm_mem_type_manager_func ttm_bo_manager_func;
+static const struct ttm_mem_type_manager_func ttm_range_manager_func;
 
 int ttm_range_man_init(struct ttm_bo_device *bdev,
 		       unsigned type,
@@ -131,7 +131,7 @@ int ttm_range_man_init(struct ttm_bo_device *bdev,
 	man->default_caching = default_caching;
 	man->use_tt = use_tt;
 
-	man->func = &ttm_bo_manager_func;
+	man->func = &ttm_range_manager_func;
 
 	ttm_mem_type_manager_init(man, p_size);
 
@@ -170,7 +170,7 @@ int ttm_range_man_fini(struct ttm_bo_device *bdev,
 }
 EXPORT_SYMBOL(ttm_range_man_fini);
 
-static void ttm_bo_man_debug(struct ttm_mem_type_manager *man,
+static void ttm_range_man_debug(struct ttm_mem_type_manager *man,
 			     struct drm_printer *printer)
 {
 	struct ttm_range_manager *rman = to_range_manager(man);
@@ -180,8 +180,8 @@ static void ttm_bo_man_debug(struct ttm_mem_type_manager *man,
 	spin_unlock(&rman->lock);
 }
 
-static const struct ttm_mem_type_manager_func ttm_bo_manager_func = {
-	.get_node = ttm_bo_man_get_node,
-	.put_node = ttm_bo_man_put_node,
-	.debug = ttm_bo_man_debug
+static const struct ttm_mem_type_manager_func ttm_range_manager_func = {
+	.get_node = ttm_range_man_get_node,
+	.put_node = ttm_range_man_put_node,
+	.debug = ttm_range_man_debug
 };
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
