Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74985233E0B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B856E9BD;
	Fri, 31 Jul 2020 04:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A056E9BD
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:07:22 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-jkiC6XTJMBWr0_5ZPPMXCw-1; Fri, 31 Jul 2020 00:06:04 -0400
X-MC-Unique: jkiC6XTJMBWr0_5ZPPMXCw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30D2318839C0;
 Fri, 31 Jul 2020 04:06:03 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B67A0100238C;
 Fri, 31 Jul 2020 04:06:01 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 16/49] drm/ttm: start allowing drivers to use new takedown path
Date: Fri, 31 Jul 2020 14:04:47 +1000
Message-Id: <20200731040520.3701599-17-airlied@gmail.com>
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

Allow the takedown path callback to be optional as well.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c         |  8 +++++---
 drivers/gpu/drm/ttm/ttm_bo_manager.c | 21 +++++++++++++++++++--
 include/drm/ttm/ttm_bo_driver.h      |  5 ++++-
 3 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index f584e5e94383..f0f0f3101bd1 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1401,8 +1401,8 @@ int ttm_bo_create(struct ttm_bo_device *bdev,
 }
 EXPORT_SYMBOL(ttm_bo_create);
 
-static int ttm_bo_force_list_clean(struct ttm_bo_device *bdev,
-				   struct ttm_mem_type_manager *man)
+int ttm_bo_force_list_clean(struct ttm_bo_device *bdev,
+			    struct ttm_mem_type_manager *man)
 {
 	struct ttm_operation_ctx ctx = {
 		.interruptible = false,
@@ -1444,6 +1444,7 @@ static int ttm_bo_force_list_clean(struct ttm_bo_device *bdev,
 
 	return 0;
 }
+EXPORT_SYMBOL(ttm_bo_force_list_clean);
 
 int ttm_bo_clean_mm(struct ttm_bo_device *bdev, unsigned mem_type)
 {
@@ -1472,7 +1473,8 @@ int ttm_bo_clean_mm(struct ttm_bo_device *bdev, unsigned mem_type)
 			return ret;
 		}
 
-		ret = (*man->func->takedown)(man);
+		if (man->func->takedown)
+			ret = (*man->func->takedown)(man);
 	}
 
 	ttm_bo_man_cleanup(man);
diff --git a/drivers/gpu/drm/ttm/ttm_bo_manager.c b/drivers/gpu/drm/ttm/ttm_bo_manager.c
index 1877425abdf0..1127868274b3 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_manager.c
@@ -129,7 +129,7 @@ int ttm_bo_man_init(struct ttm_bo_device *bdev,
 }
 EXPORT_SYMBOL(ttm_bo_man_init);
 
-static int ttm_bo_man_takedown(struct ttm_mem_type_manager *man)
+static int ttm_bo_man_takedown_private(struct ttm_mem_type_manager *man)
 {
 	struct ttm_range_manager *rman = (struct ttm_range_manager *) man->priv;
 	struct drm_mm *mm = &rman->mm;
@@ -146,6 +146,23 @@ static int ttm_bo_man_takedown(struct ttm_mem_type_manager *man)
 	return -EBUSY;
 }
 
+int ttm_bo_man_takedown(struct ttm_bo_device *bdev,
+			struct ttm_mem_type_manager *man)
+{
+	int ret;
+
+	ttm_bo_disable_mm(man);
+
+	ret = ttm_bo_force_list_clean(bdev, man);
+	if (ret)
+		return ret;
+
+	ttm_bo_man_takedown_private(man);
+	ttm_bo_man_cleanup(man);
+	return 0;
+}
+EXPORT_SYMBOL(ttm_bo_man_takedown);
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
index 92bb54cce633..2ef33b407167 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -683,6 +683,8 @@ static inline void ttm_bo_man_cleanup(struct ttm_mem_type_manager *man)
 	man->move = NULL;
 }
 
+int ttm_bo_force_list_clean(struct ttm_bo_device *bdev,
+			    struct ttm_mem_type_manager *man);
 /*
  * ttm_bo_util.c
  */
@@ -801,5 +803,6 @@ pgprot_t ttm_io_prot(uint32_t caching_flags, pgprot_t tmp);
 int ttm_bo_man_init(struct ttm_bo_device *bdev,
 		    struct ttm_mem_type_manager *man,
 		    unsigned long p_size);
-
+int ttm_bo_man_takedown(struct ttm_bo_device *bdev,
+			struct ttm_mem_type_manager *man);
 #endif
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
