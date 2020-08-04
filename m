Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D80B023B2F8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B5E6E3C6;
	Tue,  4 Aug 2020 02:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4FD6E3C6
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:57:50 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-BaVn1HTLN4WHt9T1ZItI3Q-1; Mon, 03 Aug 2020 22:57:45 -0400
X-MC-Unique: BaVn1HTLN4WHt9T1ZItI3Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA3EB8005B0;
 Tue,  4 Aug 2020 02:57:44 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1ACDB8AD1C;
 Tue,  4 Aug 2020 02:57:42 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 26/59] drm/ttm: start allowing drivers to use new takedown
 path (v2)
Date: Tue,  4 Aug 2020 12:55:59 +1000
Message-Id: <20200804025632.3868079-27-airlied@gmail.com>
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

Allow the takedown path callback to be optional as well.

v2: use fini for range manager
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c         | 12 +++++++-----
 drivers/gpu/drm/ttm/ttm_bo_manager.c | 21 +++++++++++++++++++--
 include/drm/ttm/ttm_bo_driver.h      | 24 ++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 127a0b62bf98..a45038c74de6 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1407,8 +1407,8 @@ int ttm_bo_create(struct ttm_bo_device *bdev,
 }
 EXPORT_SYMBOL(ttm_bo_create);
 
-static int ttm_bo_force_list_clean(struct ttm_bo_device *bdev,
-				   struct ttm_mem_type_manager *man)
+int ttm_mem_type_manager_force_list_clean(struct ttm_bo_device *bdev,
+					  struct ttm_mem_type_manager *man)
 {
 	struct ttm_operation_ctx ctx = {
 		.interruptible = false,
@@ -1450,6 +1450,7 @@ static int ttm_bo_force_list_clean(struct ttm_bo_device *bdev,
 
 	return 0;
 }
+EXPORT_SYMBOL(ttm_mem_type_manager_force_list_clean);
 
 int ttm_bo_clean_mm(struct ttm_bo_device *bdev, unsigned mem_type)
 {
@@ -1472,13 +1473,14 @@ int ttm_bo_clean_mm(struct ttm_bo_device *bdev, unsigned mem_type)
 
 	ret = 0;
 	if (mem_type > 0) {
-		ret = ttm_bo_force_list_clean(bdev, man);
+		ret = ttm_mem_type_manager_force_list_clean(bdev, man);
 		if (ret) {
 			pr_err("Cleanup eviction failed\n");
 			return ret;
 		}
 
-		ret = (*man->func->takedown)(man);
+		if (man->func->takedown)
+			ret = (*man->func->takedown)(man);
 	}
 
 	ttm_mem_type_manager_cleanup(man);
@@ -1501,7 +1503,7 @@ int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
 		return 0;
 	}
 
-	return ttm_bo_force_list_clean(bdev, man);
+	return ttm_mem_type_manager_force_list_clean(bdev, man);
 }
 EXPORT_SYMBOL(ttm_bo_evict_mm);
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_manager.c b/drivers/gpu/drm/ttm/ttm_bo_manager.c
index b56c6961b278..96da22be672b 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_manager.c
@@ -129,7 +129,7 @@ int ttm_range_man_init(struct ttm_bo_device *bdev,
 }
 EXPORT_SYMBOL(ttm_range_man_init);
 
-static int ttm_bo_man_takedown(struct ttm_mem_type_manager *man)
+static int ttm_bo_man_takedown_private(struct ttm_mem_type_manager *man)
 {
 	struct ttm_range_manager *rman = (struct ttm_range_manager *) man->priv;
 	struct drm_mm *mm = &rman->mm;
@@ -146,6 +146,23 @@ static int ttm_bo_man_takedown(struct ttm_mem_type_manager *man)
 	return -EBUSY;
 }
 
+int ttm_range_man_fini(struct ttm_bo_device *bdev,
+		       struct ttm_mem_type_manager *man)
+{
+	int ret;
+
+	ttm_mem_type_manager_disable(man);
+
+	ret = ttm_mem_type_manager_force_list_clean(bdev, man);
+	if (ret)
+		return ret;
+
+	ttm_bo_man_takedown_private(man);
+	ttm_mem_type_manager_cleanup(man);
+	return 0;
+}
+EXPORT_SYMBOL(ttm_range_man_fini);
+
 static void ttm_bo_man_debug(struct ttm_mem_type_manager *man,
 			     struct drm_printer *printer)
 {
@@ -157,7 +174,7 @@ static void ttm_bo_man_debug(struct ttm_mem_type_manager *man,
 }
 
 static const struct ttm_mem_type_manager_func ttm_bo_manager_func = {
-	.takedown = ttm_bo_man_takedown,
+	.takedown = ttm_bo_man_takedown_private,
 	.get_node = ttm_bo_man_get_node,
 	.put_node = ttm_bo_man_put_node,
 	.debug = ttm_bo_man_debug
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 41bfa514c29d..9b4c22abc22c 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -706,6 +706,18 @@ static inline void ttm_mem_type_manager_cleanup(struct ttm_mem_type_manager *man
 	man->move = NULL;
 }
 
+/*
+ * ttm_mem_type_manager_force_list_clean
+ *
+ * @bdev - device to use
+ * @man - manager to use
+ *
+ * Force all the objects out of a memory manager until clean.
+ * Part of memory manager cleanup sequence.
+ */
+int ttm_mem_type_manager_force_list_clean(struct ttm_bo_device *bdev,
+					  struct ttm_mem_type_manager *man);
+
 /*
  * ttm_bo_util.c
  */
@@ -835,6 +847,17 @@ int ttm_range_man_init(struct ttm_bo_device *bdev,
 		       struct ttm_mem_type_manager *man,
 		       unsigned long p_size);
 
+/**
+ * ttm_range_man_fini
+ *
+ * @bdev: ttm device
+ * @type: memory manager type
+ *
+ * Remove the generic range manager from a slot and tear it down.
+ */
+int ttm_range_man_fini(struct ttm_bo_device *bdev,
+		       struct ttm_mem_type_manager *man);
+
 /**
  * ttm_mem_type_manager_debug
  *
@@ -843,4 +866,5 @@ int ttm_range_man_init(struct ttm_bo_device *bdev,
  */
 void ttm_mem_type_manager_debug(struct ttm_mem_type_manager *man,
 				struct drm_printer *p);
+
 #endif
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
