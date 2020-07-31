Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D46233E08
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3F96E9BA;
	Fri, 31 Jul 2020 04:07:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAE46E9B3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:06:41 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-iKBsP2kSO02l74nz4Twlqg-1; Fri, 31 Jul 2020 00:06:35 -0400
X-MC-Unique: iKBsP2kSO02l74nz4Twlqg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFDA957;
 Fri, 31 Jul 2020 04:06:34 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F338100EBA7;
 Fri, 31 Jul 2020 04:06:33 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 30/49] drm/qxl/ttm: use wrapper to access memory manager
Date: Fri, 31 Jul 2020 14:05:01 +1000
Message-Id: <20200731040520.3701599-31-airlied@gmail.com>
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

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_ttm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index acc4497887a6..9aea35a66e25 100644
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
@@ -266,8 +266,8 @@ int qxl_ttm_init(struct qxl_device *qdev)
 
 void qxl_ttm_fini(struct qxl_device *qdev)
 {
-	ttm_bo_man_takedown(&qdev->mman.bdev, &qdev->mman.bdev.man[TTM_PL_VRAM]);
-	ttm_bo_man_takedown(&qdev->mman.bdev, &qdev->mman.bdev.man[TTM_PL_PRIV]);
+	ttm_bo_man_takedown(&qdev->mman.bdev, ttm_manager_type(&qdev->mman.bdev, TTM_PL_VRAM));
+	ttm_bo_man_takedown(&qdev->mman.bdev, ttm_manager_type(&qdev->mman.bdev, TTM_PL_PRIV));
 	ttm_bo_device_release(&qdev->mman.bdev);
 	DRM_INFO("qxl: ttm finalized\n");
 }
@@ -302,9 +302,9 @@ void qxl_ttm_debugfs_init(struct qxl_device *qdev)
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
