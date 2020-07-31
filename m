Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F120233DEC
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969FA6E9A4;
	Fri, 31 Jul 2020 04:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8646E9A1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:06:03 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-l2HgzxHcP_m2KOYyH8Eowg-1; Fri, 31 Jul 2020 00:06:00 -0400
X-MC-Unique: l2HgzxHcP_m2KOYyH8Eowg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80ABA805723;
 Fri, 31 Jul 2020 04:05:59 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1090F1001281;
 Fri, 31 Jul 2020 04:05:57 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 14/49] drm/ttm: pass man around instead of mem_type in some
 places
Date: Fri, 31 Jul 2020 14:04:45 +1000
Message-Id: <20200731040520.3701599-15-airlied@gmail.com>
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

This makes it easier to cleanup things

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 101a7910f9f7..84e399395e4f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -763,13 +763,12 @@ static int ttm_mem_evict_wait_busy(struct ttm_buffer_object *busy_bo,
 }
 
 static int ttm_mem_evict_first(struct ttm_bo_device *bdev,
-			       uint32_t mem_type,
+			       struct ttm_mem_type_manager *man,
 			       const struct ttm_place *place,
 			       struct ttm_operation_ctx *ctx,
 			       struct ww_acquire_ctx *ticket)
 {
 	struct ttm_buffer_object *bo = NULL, *busy_bo = NULL;
-	struct ttm_mem_type_manager *man = &bdev->man[mem_type];
 	bool locked = false;
 	unsigned i;
 	int ret;
@@ -918,7 +917,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
 			break;
 		if (unlikely(ret != -ENOSPC))
 			return ret;
-		ret = ttm_mem_evict_first(bdev, mem->mem_type, place, ctx,
+		ret = ttm_mem_evict_first(bdev, man, place, ctx,
 					  ticket);
 		if (unlikely(ret != 0))
 			return ret;
@@ -1403,14 +1402,13 @@ int ttm_bo_create(struct ttm_bo_device *bdev,
 EXPORT_SYMBOL(ttm_bo_create);
 
 static int ttm_bo_force_list_clean(struct ttm_bo_device *bdev,
-				   unsigned mem_type)
+				   struct ttm_mem_type_manager *man)
 {
 	struct ttm_operation_ctx ctx = {
 		.interruptible = false,
 		.no_wait_gpu = false,
 		.flags = TTM_OPT_FLAG_FORCE_ALLOC
 	};
-	struct ttm_mem_type_manager *man = &bdev->man[mem_type];
 	struct ttm_bo_global *glob = &ttm_bo_glob;
 	struct dma_fence *fence;
 	int ret;
@@ -1424,7 +1422,7 @@ static int ttm_bo_force_list_clean(struct ttm_bo_device *bdev,
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
 		while (!list_empty(&man->lru[i])) {
 			spin_unlock(&glob->lru_lock);
-			ret = ttm_mem_evict_first(bdev, mem_type, NULL, &ctx,
+			ret = ttm_mem_evict_first(bdev, man, NULL, &ctx,
 						  NULL);
 			if (ret)
 				return ret;
@@ -1469,7 +1467,7 @@ int ttm_bo_clean_mm(struct ttm_bo_device *bdev, unsigned mem_type)
 
 	ret = 0;
 	if (mem_type > 0) {
-		ret = ttm_bo_force_list_clean(bdev, mem_type);
+		ret = ttm_bo_force_list_clean(bdev, man);
 		if (ret) {
 			pr_err("Cleanup eviction failed\n");
 			return ret;
@@ -1499,7 +1497,7 @@ int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
 		return 0;
 	}
 
-	return ttm_bo_force_list_clean(bdev, mem_type);
+	return ttm_bo_force_list_clean(bdev, man);
 }
 EXPORT_SYMBOL(ttm_bo_evict_mm);
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
