Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A48C123B2E6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 913BE6E398;
	Tue,  4 Aug 2020 02:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F996E398
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:57:08 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-C05zpU8tPwqGj_ml9exHZw-1; Mon, 03 Aug 2020 22:57:03 -0400
X-MC-Unique: C05zpU8tPwqGj_ml9exHZw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FC441005504;
 Tue,  4 Aug 2020 02:57:02 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5B6D90E68;
 Tue,  4 Aug 2020 02:57:00 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/59] drm/ttm: export memory type debug entrypoint.
Date: Tue,  4 Aug 2020 12:55:41 +1000
Message-Id: <20200804025632.3868079-9-airlied@gmail.com>
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

As suggested on review, just export the memory type debug for
drivers to use, while also making the debug callback optional
(don't need to test for system as it won't init it).

rename it to be more consistent with object name for now.
(we may rename all the objects later.)

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c    | 13 +++++++------
 include/drm/ttm/ttm_bo_driver.h |  8 ++++++++
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 2b49037231eb..2ac70ec1f37d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -77,26 +77,26 @@ static inline int ttm_mem_type_from_place(const struct ttm_place *place,
 	return 0;
 }
 
-static void ttm_mem_type_debug(struct ttm_bo_device *bdev, struct drm_printer *p,
-			       int mem_type)
+void ttm_mem_type_manager_debug(struct ttm_mem_type_manager *man,
+				struct drm_printer *p)
 {
-	struct ttm_mem_type_manager *man = &bdev->man[mem_type];
-
 	drm_printf(p, "    has_type: %d\n", man->has_type);
 	drm_printf(p, "    use_type: %d\n", man->use_type);
 	drm_printf(p, "    use_tt: %d\n", man->use_tt);
 	drm_printf(p, "    size: %llu\n", man->size);
 	drm_printf(p, "    available_caching: 0x%08X\n", man->available_caching);
 	drm_printf(p, "    default_caching: 0x%08X\n", man->default_caching);
-	if (mem_type != TTM_PL_SYSTEM)
+	if (man->func && man->func->debug)
 		(*man->func->debug)(man, p);
 }
+EXPORT_SYMBOL(ttm_mem_type_manager_debug);
 
 static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
 					struct ttm_placement *placement)
 {
 	struct drm_printer p = drm_debug_printer(TTM_PFX);
 	int i, ret, mem_type;
+	struct ttm_mem_type_manager *man;
 
 	drm_printf(&p, "No space for %p (%lu pages, %luK, %luM)\n",
 		   bo, bo->mem.num_pages, bo->mem.size >> 10,
@@ -108,7 +108,8 @@ static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
 			return;
 		drm_printf(&p, "  placement[%d]=0x%08X (%d)\n",
 			   i, placement->placement[i].flags, mem_type);
-		ttm_mem_type_debug(bo->bdev, &p, mem_type);
+		man = &bo->bdev->man[mem_type];
+		ttm_mem_type_manager_debug(man, &p);
 	}
 }
 
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 7958e411269a..73f5d9c766cc 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -795,4 +795,12 @@ pgprot_t ttm_io_prot(uint32_t caching_flags, pgprot_t tmp);
 
 extern const struct ttm_mem_type_manager_func ttm_bo_manager_func;
 
+/**
+ * ttm_mem_type_manager_debug
+ *
+ * @man: manager type to dump.
+ * @p: printer to use for debug.
+ */
+void ttm_mem_type_manager_debug(struct ttm_mem_type_manager *man,
+				struct drm_printer *p);
 #endif
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
