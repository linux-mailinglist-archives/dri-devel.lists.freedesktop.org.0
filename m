Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC11123B308
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1606E3EC;
	Tue,  4 Aug 2020 02:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DA86E3EC
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:58:26 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-qrRDVCqFNQqfOf4wmSvzPg-1; Mon, 03 Aug 2020 22:58:21 -0400
X-MC-Unique: qrRDVCqFNQqfOf4wmSvzPg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DE2D100CD0B;
 Tue,  4 Aug 2020 02:58:20 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84FC590E68;
 Tue,  4 Aug 2020 02:58:18 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 40/59] drm/qxl/ttm: use wrapper to access memory manager
Date: Tue,  4 Aug 2020 12:56:13 +1000
Message-Id: <20200804025632.3868079-41-airlied@gmail.com>
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
 drivers/gpu/drm/qxl/qxl_ttm.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 0f7071829056..57c96f7271db 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -219,7 +219,7 @@ static int qxl_ttm_init_mem_type(struct qxl_device *qdev,
 				 unsigned int type,
 				 uint64_t size)
 {
-	struct ttm_mem_type_manager *man = &qdev->mman.bdev.man[type];
+	struct ttm_mem_type_manager *man = ttm_manager_type(&qdev->mman.bdev, type);
 
 	man->available_caching = TTM_PL_MASK_CACHING;
 	man->default_caching = TTM_PL_FLAG_CACHED;
@@ -266,8 +266,9 @@ int qxl_ttm_init(struct qxl_device *qdev)
 
 void qxl_ttm_fini(struct qxl_device *qdev)
 {
-	ttm_range_man_fini(&qdev->mman.bdev, &qdev->mman.bdev.man[TTM_PL_VRAM]);
-	ttm_range_man_fini(&qdev->mman.bdev, &qdev->mman.bdev.man[TTM_PL_PRIV]);
+
+	ttm_range_man_fini(&qdev->mman.bdev, ttm_manager_type(&qdev->mman.bdev, TTM_PL_VRAM));
+	ttm_range_man_fini(&qdev->mman.bdev, ttm_manager_type(&qdev->mman.bdev, TTM_PL_PRIV));
 	ttm_bo_device_release(&qdev->mman.bdev);
 	DRM_INFO("qxl: ttm finalized\n");
 }
@@ -302,9 +303,9 @@ void qxl_ttm_debugfs_init(struct qxl_device *qdev)
 		qxl_mem_types_list[i].show = &qxl_mm_dump_table;
 		qxl_mem_types_list[i].driver_features = 0;
 		if (i == 0)
-			qxl_mem_types_list[i].data = &qdev->mman.bdev.man[TTM_PL_VRAM];
+			qxl_mem_types_list[i].data = ttm_manager_type(&qdev->mman.bdev, TTM_PL_VRAM);
 		else
-			qxl_mem_types_list[i].data = &qdev->mman.bdev.man[TTM_PL_PRIV];
+			qxl_mem_types_list[i].data = ttm_manager_type(&qdev->mman.bdev, TTM_PL_PRIV);
 
 	}
 	qxl_debugfs_add_files(qdev, qxl_mem_types_list, i);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
