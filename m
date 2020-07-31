Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B51233DFC
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:06:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23CB26E9B4;
	Fri, 31 Jul 2020 04:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB366E9B2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:06:44 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-AJHOuCGbPoeUTfdc7WELGg-1; Fri, 31 Jul 2020 00:06:41 -0400
X-MC-Unique: AJHOuCGbPoeUTfdc7WELGg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BBB4800471;
 Fri, 31 Jul 2020 04:06:40 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFDD71001281;
 Fri, 31 Jul 2020 04:06:38 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 33/49] drm/ttm: rename manager variable to make sure wrapper
 is used.
Date: Fri, 31 Jul 2020 14:05:04 +1000
Message-Id: <20200731040520.3701599-34-airlied@gmail.com>
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

Other users of this should notice this change and switch to wrapper.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c    | 2 +-
 include/drm/ttm/ttm_bo_driver.h | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 7c6389ea067f..92de8a6d7647 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1610,7 +1610,7 @@ int ttm_bo_device_init(struct ttm_bo_device *bdev,
 
 	bdev->driver = driver;
 
-	memset(bdev->man, 0, sizeof(bdev->man));
+	memset(bdev->man_priv, 0, sizeof(bdev->man_priv));
 
 	ttm_bo_init_sysman(bdev);
 
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index ec25451b503f..419b088253cf 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -415,7 +415,10 @@ struct ttm_bo_device {
 	 */
 	struct list_head device_list;
 	struct ttm_bo_driver *driver;
-	struct ttm_mem_type_manager man[TTM_NUM_MEM_TYPES];
+	/*
+	 * access via ttm_manager_type.
+	 */
+	struct ttm_mem_type_manager man_priv[TTM_NUM_MEM_TYPES];
 
 	/*
 	 * Protected by internal locks.
@@ -447,7 +450,7 @@ struct ttm_bo_device {
 static inline struct ttm_mem_type_manager *ttm_manager_type(struct ttm_bo_device *bdev,
 							    int mem_type)
 {
-	return &bdev->man[mem_type];
+	return &bdev->man_priv[mem_type];
 }
 
 /**
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
