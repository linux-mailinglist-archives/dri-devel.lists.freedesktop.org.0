Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3CA23B315
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C7A6E408;
	Tue,  4 Aug 2020 02:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43B26E409
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:59:00 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-tvvLziGHMPO0HgI41LZCwQ-1; Mon, 03 Aug 2020 22:58:55 -0400
X-MC-Unique: tvvLziGHMPO0HgI41LZCwQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 832EC1005504;
 Tue,  4 Aug 2020 02:58:54 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 102098AD1C;
 Tue,  4 Aug 2020 02:58:49 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 54/59] drm/ttm: drop list of memory managers from device. (v2)
Date: Tue,  4 Aug 2020 12:56:27 +1000
Message-Id: <20200804025632.3868079-55-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-1-airlied@gmail.com>
References: <20200804025632.3868079-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: sroland@vmware.com, christian.koenig@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

The driver now controls these, the core just controls the system
memory one.

v2: init sysman explicitly and assign it as a driver manager
to simplify the lookup sequence.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c    | 6 +++---
 include/drm/ttm/ttm_bo_driver.h | 6 ++----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 78b72443a9ef..12abe46bfbc1 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1558,6 +1558,7 @@ int ttm_bo_device_release(struct ttm_bo_device *bdev)
 
 	man = ttm_manager_type(bdev, TTM_PL_SYSTEM);
 	ttm_mem_type_manager_disable(man);
+	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, NULL);
 
 	mutex_lock(&ttm_global_mutex);
 	list_del(&bdev->device_list);
@@ -1583,7 +1584,7 @@ EXPORT_SYMBOL(ttm_bo_device_release);
 
 static void ttm_bo_init_sysman(struct ttm_bo_device *bdev)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, TTM_PL_SYSTEM);
+	struct ttm_mem_type_manager *man = &bdev->sysman;
 
 	/*
 	 * Initialize the system memory buffer type.
@@ -1594,6 +1595,7 @@ static void ttm_bo_init_sysman(struct ttm_bo_device *bdev)
 	man->default_caching = TTM_PL_FLAG_CACHED;
 
 	ttm_mem_type_manager_init(man, 0);
+	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, man);
 	ttm_mem_type_manager_set_used(man, true);
 }
 
@@ -1615,8 +1617,6 @@ int ttm_bo_device_init(struct ttm_bo_device *bdev,
 
 	bdev->driver = driver;
 
-	memset(bdev->man_priv, 0, sizeof(bdev->man_priv));
-
 	ttm_bo_init_sysman(bdev);
 
 	bdev->vma_manager = vma_manager;
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index bfd19400372f..d5646d7cac60 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -414,7 +414,7 @@ struct ttm_bo_device {
 	/*
 	 * access via ttm_manager_type.
 	 */
-	struct ttm_mem_type_manager man_priv[TTM_NUM_MEM_TYPES];
+	struct ttm_mem_type_manager sysman;
 	struct ttm_mem_type_manager *man_drv[TTM_NUM_MEM_TYPES];
 	/*
 	 * Protected by internal locks.
@@ -446,9 +446,7 @@ struct ttm_bo_device {
 static inline struct ttm_mem_type_manager *ttm_manager_type(struct ttm_bo_device *bdev,
 							    int mem_type)
 {
-	if (bdev->man_drv[mem_type])
-		return bdev->man_drv[mem_type];
-	return &bdev->man_priv[mem_type];
+	return bdev->man_drv[mem_type];
 }
 
 static inline void ttm_set_driver_manager(struct ttm_bo_device *bdev,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
