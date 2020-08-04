Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5074E23B30F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05676E3FC;
	Tue,  4 Aug 2020 02:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7686F6E3F7
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:58:45 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-X7HqRbFiOmSzlR7wHXaAXQ-1; Mon, 03 Aug 2020 22:58:40 -0400
X-MC-Unique: X7HqRbFiOmSzlR7wHXaAXQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 740A98015F4;
 Tue,  4 Aug 2020 02:58:39 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CAE5190E68;
 Tue,  4 Aug 2020 02:58:37 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 48/59] drm/vmwgfx/ttm: move thp to driver managed
Date: Tue,  4 Aug 2020 12:56:21 +1000
Message-Id: <20200804025632.3868079-49-airlied@gmail.com>
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

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c | 32 +++++++++++++++++++----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
index 720a24214c74..1cefd9c1e8ea 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
@@ -16,10 +16,16 @@
  * @lock: Manager lock.
  */
 struct vmw_thp_manager {
+	struct ttm_mem_type_manager manager;
 	struct drm_mm mm;
 	spinlock_t lock;
 };
 
+static struct vmw_thp_manager *to_thp_manager(struct ttm_mem_type_manager *man)
+{
+	return container_of(man, struct vmw_thp_manager, manager);
+}
+
 static int vmw_thp_insert_aligned(struct drm_mm *mm, struct drm_mm_node *node,
 				  unsigned long align_pages,
 				  const struct ttm_place *place,
@@ -43,7 +49,7 @@ static int vmw_thp_get_node(struct ttm_mem_type_manager *man,
 			    const struct ttm_place *place,
 			    struct ttm_mem_reg *mem)
 {
-	struct vmw_thp_manager *rman = (struct vmw_thp_manager *) man->priv;
+	struct vmw_thp_manager *rman = to_thp_manager(man);
 	struct drm_mm *mm = &rman->mm;
 	struct drm_mm_node *node;
 	unsigned long align_pages;
@@ -103,7 +109,7 @@ static int vmw_thp_get_node(struct ttm_mem_type_manager *man,
 static void vmw_thp_put_node(struct ttm_mem_type_manager *man,
 			     struct ttm_mem_reg *mem)
 {
-	struct vmw_thp_manager *rman = (struct vmw_thp_manager *) man->priv;
+	struct vmw_thp_manager *rman = to_thp_manager(man);
 
 	if (mem->mm_node) {
 		spin_lock(&rman->lock);
@@ -117,20 +123,24 @@ static void vmw_thp_put_node(struct ttm_mem_type_manager *man,
 
 int vmw_thp_init(struct vmw_private *dev_priv)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
+	struct ttm_mem_type_manager *man;
 	struct vmw_thp_manager *rman;
+
+	rman = kzalloc(sizeof(*rman), GFP_KERNEL);
+	if (!rman)
+		return -ENOMEM;
+
+	man = &rman->manager;
 	man->available_caching = TTM_PL_FLAG_CACHED;
 	man->default_caching = TTM_PL_FLAG_CACHED;
 
 	ttm_mem_type_manager_init(&dev_priv->bdev, man,
 				  dev_priv->vram_size >> PAGE_SHIFT);
-	rman = kzalloc(sizeof(*rman), GFP_KERNEL);
-	if (!rman)
-		return -ENOMEM;
 
 	drm_mm_init(&rman->mm, 0, man->size);
 	spin_lock_init(&rman->lock);
-	man->priv = rman;
+
+	ttm_set_driver_manager(&dev_priv->bdev, TTM_PL_VRAM, &rman->manager);
 	ttm_mem_type_manager_set_used(man, true);
 	return 0;
 }
@@ -138,7 +148,7 @@ int vmw_thp_init(struct vmw_private *dev_priv)
 void vmw_thp_fini(struct vmw_private *dev_priv)
 {
 	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
-	struct vmw_thp_manager *rman = (struct vmw_thp_manager *) man->priv;
+	struct vmw_thp_manager *rman = to_thp_manager(man);
 	struct drm_mm *mm = &rman->mm;
 	int ret;
 
@@ -151,15 +161,15 @@ void vmw_thp_fini(struct vmw_private *dev_priv)
 	drm_mm_clean(mm);
 	drm_mm_takedown(mm);
 	spin_unlock(&rman->lock);
-	kfree(rman);
-	man->priv = NULL;
 	ttm_mem_type_manager_cleanup(man);
+	ttm_set_driver_manager(&dev_priv->bdev, TTM_PL_VRAM, NULL);
+	kfree(rman);
 }
 
 static void vmw_thp_debug(struct ttm_mem_type_manager *man,
 			  struct drm_printer *printer)
 {
-	struct vmw_thp_manager *rman = (struct vmw_thp_manager *) man->priv;
+	struct vmw_thp_manager *rman = to_thp_manager(man);
 
 	spin_lock(&rman->lock);
 	drm_mm_print(&rman->mm, printer);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
