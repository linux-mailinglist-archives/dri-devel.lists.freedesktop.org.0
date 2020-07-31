Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7E8233E02
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B468F6E9B7;
	Fri, 31 Jul 2020 04:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22FD6E9A2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:07:03 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-rvVL-GUnNYy9RO776ftsyg-1; Fri, 31 Jul 2020 00:06:57 -0400
X-MC-Unique: rvVL-GUnNYy9RO776ftsyg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF7E480046A;
 Fri, 31 Jul 2020 04:06:55 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F55A100238C;
 Fri, 31 Jul 2020 04:06:54 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 40/49] drm/ttm: move range manager to subclassed driver
 allocation
Date: Fri, 31 Jul 2020 14:05:11 +1000
Message-Id: <20200731040520.3701599-41-airlied@gmail.com>
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
 drivers/gpu/drm/ttm/ttm_bo_manager.c | 32 +++++++++++++++++-----------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_manager.c b/drivers/gpu/drm/ttm/ttm_bo_manager.c
index 2f5fa44b6474..2782ccff9b66 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_manager.c
@@ -44,16 +44,22 @@
  */
 
 struct ttm_range_manager {
+	struct ttm_mem_type_manager manager;
 	struct drm_mm mm;
 	spinlock_t lock;
 };
 
+static inline struct ttm_range_manager *to_range_manager(struct ttm_mem_type_manager *man)
+{
+	return container_of(man, struct ttm_range_manager, manager);
+}
+
 static int ttm_bo_man_get_node(struct ttm_mem_type_manager *man,
 			       struct ttm_buffer_object *bo,
 			       const struct ttm_place *place,
 			       struct ttm_mem_reg *mem)
 {
-	struct ttm_range_manager *rman = (struct ttm_range_manager *) man->priv;
+	struct ttm_range_manager *rman = to_range_manager(man);
 	struct drm_mm *mm = &rman->mm;
 	struct drm_mm_node *node;
 	enum drm_mm_insert_mode mode;
@@ -92,7 +98,7 @@ static int ttm_bo_man_get_node(struct ttm_mem_type_manager *man,
 static void ttm_bo_man_put_node(struct ttm_mem_type_manager *man,
 				struct ttm_mem_reg *mem)
 {
-	struct ttm_range_manager *rman = (struct ttm_range_manager *) man->priv;
+	struct ttm_range_manager *rman = to_range_manager(man);
 
 	if (mem->mm_node) {
 		spin_lock(&rman->lock);
@@ -113,25 +119,26 @@ int ttm_bo_man_init(struct ttm_bo_device *bdev,
 		    bool use_tt,
 		    unsigned long p_size)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, type);
+	struct ttm_mem_type_manager *man;
 	struct ttm_range_manager *rman;
 
-	man->available_caching = available_caching;
-	man->default_caching = default_caching;
-	man->use_tt = use_tt;
-
 	rman = kzalloc(sizeof(*rman), GFP_KERNEL);
 	if (!rman)
 		return -ENOMEM;
 
+	man = &rman->manager;
+	man->available_caching = available_caching;
+	man->default_caching = default_caching;
+	man->use_tt = use_tt;
+
 	man->func = &ttm_bo_manager_func;
 
 	ttm_bo_init_mm_base(bdev, man, p_size);
 
 	drm_mm_init(&rman->mm, 0, p_size);
 	spin_lock_init(&rman->lock);
-	man->priv = rman;
 
+	ttm_set_driver_manager(bdev, type, &rman->manager);
 	ttm_bo_use_mm(man);
 	return 0;
 }
@@ -141,7 +148,7 @@ int ttm_bo_man_takedown(struct ttm_bo_device *bdev,
 			unsigned type)
 {
 	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, type);
-	struct ttm_range_manager *rman = (struct ttm_range_manager *) man->priv;
+	struct ttm_range_manager *rman = to_range_manager(man);
 	struct drm_mm *mm = &rman->mm;
 	int ret;
 
@@ -155,10 +162,11 @@ int ttm_bo_man_takedown(struct ttm_bo_device *bdev,
 	drm_mm_clean(mm);
 	drm_mm_takedown(mm);
 	spin_unlock(&rman->lock);
-	kfree(rman);
-	man->priv = NULL;
 
 	ttm_bo_man_cleanup(man);
+	ttm_set_driver_manager(bdev, type, NULL);
+	kfree(rman);
+
 	return 0;
 }
 EXPORT_SYMBOL(ttm_bo_man_takedown);
@@ -166,7 +174,7 @@ EXPORT_SYMBOL(ttm_bo_man_takedown);
 static void ttm_bo_man_debug(struct ttm_mem_type_manager *man,
 			     struct drm_printer *printer)
 {
-	struct ttm_range_manager *rman = (struct ttm_range_manager *) man->priv;
+	struct ttm_range_manager *rman = to_range_manager(man);
 
 	spin_lock(&rman->lock);
 	drm_mm_print(&rman->mm, printer);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
