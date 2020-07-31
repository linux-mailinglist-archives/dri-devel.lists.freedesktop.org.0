Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE9F233DE5
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C93E6E99B;
	Fri, 31 Jul 2020 04:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086846E99A
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:05:42 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-TgJYh5HKNIm0-cht0girwg-1; Fri, 31 Jul 2020 00:05:36 -0400
X-MC-Unique: TgJYh5HKNIm0-cht0girwg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCA8F8015CE;
 Fri, 31 Jul 2020 04:05:35 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DC3A1001281;
 Fri, 31 Jul 2020 04:05:34 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/49] drm/ttm: provide a driver-led init path for generic mm
 manager.
Date: Fri, 31 Jul 2020 14:04:35 +1000
Message-Id: <20200731040520.3701599-5-airlied@gmail.com>
In-Reply-To: <20200731040520.3701599-1-airlied@gmail.com>
References: <20200731040520.3701599-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
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

This lets the generic mm manager be initialised by the driver.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo_manager.c | 23 ++++++++++++++++++++---
 include/drm/ttm/ttm_bo_driver.h      |  3 +++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_manager.c b/drivers/gpu/drm/ttm/ttm_bo_manager.c
index facd3049c3aa..64234e5caee3 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_manager.c
@@ -104,8 +104,8 @@ static void ttm_bo_man_put_node(struct ttm_mem_type_manager *man,
 	}
 }
 
-static int ttm_bo_man_init(struct ttm_mem_type_manager *man,
-			   unsigned long p_size)
+static int ttm_bo_man_init_private(struct ttm_mem_type_manager *man,
+		    unsigned long p_size)
 {
 	struct ttm_range_manager *rman;
 
@@ -119,6 +119,23 @@ static int ttm_bo_man_init(struct ttm_mem_type_manager *man,
 	return 0;
 }
 
+int ttm_bo_man_init(struct ttm_bo_device *bdev,
+		    struct ttm_mem_type_manager *man,
+		    unsigned long p_size)
+{
+	int ret;
+
+	man->func = &ttm_bo_manager_func;
+
+	ttm_bo_init_mm_base(bdev, man, p_size);
+	ret = ttm_bo_man_init_private(man, p_size);
+	if (ret)
+		return ret;
+	ttm_bo_use_mm(man);
+	return 0;
+}
+EXPORT_SYMBOL(ttm_bo_man_init);
+
 static int ttm_bo_man_takedown(struct ttm_mem_type_manager *man)
 {
 	struct ttm_range_manager *rman = (struct ttm_range_manager *) man->priv;
@@ -147,7 +164,7 @@ static void ttm_bo_man_debug(struct ttm_mem_type_manager *man,
 }
 
 const struct ttm_mem_type_manager_func ttm_bo_manager_func = {
-	.init = ttm_bo_man_init,
+	.init = ttm_bo_man_init_private,
 	.takedown = ttm_bo_man_takedown,
 	.get_node = ttm_bo_man_get_node,
 	.put_node = ttm_bo_man_put_node,
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 68e75c3b8c7a..5c4ccefd5393 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -799,6 +799,9 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo);
  */
 pgprot_t ttm_io_prot(uint32_t caching_flags, pgprot_t tmp);
 
+int ttm_bo_man_init(struct ttm_bo_device *bdev,
+		    struct ttm_mem_type_manager *man,
+		    unsigned long p_size);
 extern const struct ttm_mem_type_manager_func ttm_bo_manager_func;
 
 #endif
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
