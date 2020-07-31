Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3122233DF4
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8FD6E9A9;
	Fri, 31 Jul 2020 04:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D16E6E9AB
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:06:26 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-PuEIbH9wOkuHHuvBr59IYg-1; Fri, 31 Jul 2020 00:06:21 -0400
X-MC-Unique: PuEIbH9wOkuHHuvBr59IYg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAE1D106B244;
 Fri, 31 Jul 2020 04:06:20 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CD5E100238C;
 Fri, 31 Jul 2020 04:06:19 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 24/49] drm/ttm: remove range manager legacy takedown path
Date: Fri, 31 Jul 2020 14:04:55 +1000
Message-Id: <20200731040520.3701599-25-airlied@gmail.com>
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

Now no drivers have been converted, drop the non-driver path.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo_manager.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_manager.c b/drivers/gpu/drm/ttm/ttm_bo_manager.c
index 1127868274b3..f60a9a5d429d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_manager.c
@@ -129,26 +129,11 @@ int ttm_bo_man_init(struct ttm_bo_device *bdev,
 }
 EXPORT_SYMBOL(ttm_bo_man_init);
 
-static int ttm_bo_man_takedown_private(struct ttm_mem_type_manager *man)
-{
-	struct ttm_range_manager *rman = (struct ttm_range_manager *) man->priv;
-	struct drm_mm *mm = &rman->mm;
-
-	spin_lock(&rman->lock);
-	if (drm_mm_clean(mm)) {
-		drm_mm_takedown(mm);
-		spin_unlock(&rman->lock);
-		kfree(rman);
-		man->priv = NULL;
-		return 0;
-	}
-	spin_unlock(&rman->lock);
-	return -EBUSY;
-}
-
 int ttm_bo_man_takedown(struct ttm_bo_device *bdev,
 			struct ttm_mem_type_manager *man)
 {
+	struct ttm_range_manager *rman = (struct ttm_range_manager *) man->priv;
+	struct drm_mm *mm = &rman->mm;
 	int ret;
 
 	ttm_bo_disable_mm(man);
@@ -157,7 +142,13 @@ int ttm_bo_man_takedown(struct ttm_bo_device *bdev,
 	if (ret)
 		return ret;
 
-	ttm_bo_man_takedown_private(man);
+	spin_lock(&rman->lock);
+	drm_mm_clean(mm);
+	drm_mm_takedown(mm);
+	spin_unlock(&rman->lock);
+	kfree(rman);
+	man->priv = NULL;
+
 	ttm_bo_man_cleanup(man);
 	return 0;
 }
@@ -174,7 +165,6 @@ static void ttm_bo_man_debug(struct ttm_mem_type_manager *man,
 }
 
 static const struct ttm_mem_type_manager_func ttm_bo_manager_func = {
-	.takedown = ttm_bo_man_takedown_private,
 	.get_node = ttm_bo_man_get_node,
 	.put_node = ttm_bo_man_put_node,
 	.debug = ttm_bo_man_debug
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
