Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB53B233E0E
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76CD6E9C2;
	Fri, 31 Jul 2020 04:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05156E9BD
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:07:08 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315--rfiGSrcPNy_I8nWSvPbKQ-1; Fri, 31 Jul 2020 00:07:00 -0400
X-MC-Unique: -rfiGSrcPNy_I8nWSvPbKQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A33D6800471;
 Fri, 31 Jul 2020 04:06:59 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 349EB1001281;
 Fri, 31 Jul 2020 04:06:58 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 42/49] drm/vmwgfx/gmrid: convert to driver controlled
 allocation.
Date: Fri, 31 Jul 2020 14:05:13 +1000
Message-Id: <20200731040520.3701599-43-airlied@gmail.com>
In-Reply-To: <20200731040520.3701599-1-airlied@gmail.com>
References: <20200731040520.3701599-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: christian.koenig@amd.com, sroland@vmware.com, bskeggs@redhat.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c | 33 +++++++++++--------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
index 2db99f0449b0..14430c243ce5 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
@@ -37,6 +37,7 @@
 #include <linux/kernel.h>
 
 struct vmwgfx_gmrid_man {
+	struct ttm_mem_type_manager manager;
 	spinlock_t lock;
 	struct ida gmr_ida;
 	uint32_t max_gmr_ids;
@@ -44,13 +45,17 @@ struct vmwgfx_gmrid_man {
 	uint32_t used_gmr_pages;
 };
 
+static struct vmwgfx_gmrid_man *to_gmrid_manager(struct ttm_mem_type_manager *man)
+{
+	return container_of(man, struct vmwgfx_gmrid_man, manager);
+}
+
 static int vmw_gmrid_man_get_node(struct ttm_mem_type_manager *man,
 				  struct ttm_buffer_object *bo,
 				  const struct ttm_place *place,
 				  struct ttm_mem_reg *mem)
 {
-	struct vmwgfx_gmrid_man *gman =
-		(struct vmwgfx_gmrid_man *)man->priv;
+	struct vmwgfx_gmrid_man *gman = to_gmrid_manager(man);
 	int id;
 
 	id = ida_alloc_max(&gman->gmr_ida, gman->max_gmr_ids - 1, GFP_KERNEL);
@@ -82,8 +87,7 @@ static int vmw_gmrid_man_get_node(struct ttm_mem_type_manager *man,
 static void vmw_gmrid_man_put_node(struct ttm_mem_type_manager *man,
 				   struct ttm_mem_reg *mem)
 {
-	struct vmwgfx_gmrid_man *gman =
-		(struct vmwgfx_gmrid_man *)man->priv;
+	struct vmwgfx_gmrid_man *gman = to_gmrid_manager(man);
 
 	if (mem->mm_node) {
 		ida_free(&gman->gmr_ida, mem->start);
@@ -98,13 +102,15 @@ static const struct ttm_mem_type_manager_func vmw_gmrid_manager_func;
 
 int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, type);
+	struct ttm_mem_type_manager *man;
 	struct vmwgfx_gmrid_man *gman =
 		kzalloc(sizeof(*gman), GFP_KERNEL);
 
 	if (unlikely(!gman))
 		return -ENOMEM;
 
+	man = &gman->manager;
+
 	man->func = &vmw_gmrid_manager_func;
 	man->available_caching = TTM_PL_FLAG_CACHED;
 	man->default_caching = TTM_PL_FLAG_CACHED;
@@ -127,26 +133,27 @@ int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
 	default:
 		BUG();
 	}
-	man->priv = (void *) gman;
+
+	ttm_set_driver_manager(&dev_priv->bdev, type, &gman->manager);
+	ttm_bo_use_mm(man);
 	return 0;
 }
 
 void vmw_gmrid_man_takedown(struct vmw_private *dev_priv, int type)
 {
 	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, type);
-	struct vmwgfx_gmrid_man *gman =
-		(struct vmwgfx_gmrid_man *)man->priv;
+	struct vmwgfx_gmrid_man *gman = to_gmrid_manager(man);
 
 	ttm_bo_disable_mm(man);
 
 	ttm_bo_force_list_clean(&dev_priv->bdev, man);
 
-	if (gman) {
-		ida_destroy(&gman->gmr_ida);
-		kfree(gman);
-	}
-
 	ttm_bo_man_cleanup(man);
+
+	ttm_set_driver_manager(&dev_priv->bdev, type, NULL);
+	ida_destroy(&gman->gmr_ida);
+	kfree(gman);
+
 }
 
 static const struct ttm_mem_type_manager_func vmw_gmrid_manager_func = {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
