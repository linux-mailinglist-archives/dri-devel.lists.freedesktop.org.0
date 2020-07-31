Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD420233DEB
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA836E9A3;
	Fri, 31 Jul 2020 04:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3423F6E9A2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:06:04 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-5wq4EH1qNd-hAF1Nw1WGzg-1; Fri, 31 Jul 2020 00:05:56 -0400
X-MC-Unique: 5wq4EH1qNd-hAF1Nw1WGzg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAFA28015F3;
 Fri, 31 Jul 2020 04:05:55 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CEC6100238C;
 Fri, 31 Jul 2020 04:05:54 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 12/49] drm/ttm: convert system manager init to new code.
Date: Fri, 31 Jul 2020 14:04:43 +1000
Message-Id: <20200731040520.3701599-13-airlied@gmail.com>
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

Remove the exit path, since this can't fail now.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index a658fd584c6d..476e768c5bd2 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1644,6 +1644,22 @@ int ttm_bo_device_release(struct ttm_bo_device *bdev)
 }
 EXPORT_SYMBOL(ttm_bo_device_release);
 
+static void ttm_bo_init_sysman(struct ttm_bo_device *bdev)
+{
+	struct ttm_mem_type_manager *man = &bdev->man[TTM_PL_SYSTEM];
+
+	/*
+	 * Initialize the system memory buffer type.
+	 * Other types need to be driver / IOCTL initialized.
+	 */
+	man->use_tt = true;
+	man->available_caching = TTM_PL_MASK_CACHING;
+	man->default_caching = TTM_PL_FLAG_CACHED;
+
+	ttm_bo_init_mm_base(bdev, man, 0);
+	ttm_bo_use_mm(man);
+}
+
 int ttm_bo_device_init(struct ttm_bo_device *bdev,
 		       struct ttm_bo_driver *driver,
 		       struct address_space *mapping,
@@ -1664,16 +1680,7 @@ int ttm_bo_device_init(struct ttm_bo_device *bdev,
 
 	memset(bdev->man, 0, sizeof(bdev->man));
 
-	/*
-	 * Initialize the system memory buffer type.
-	 * Other types need to be driver / IOCTL initialized.
-	 */
-	bdev->man[TTM_PL_SYSTEM].use_tt = true;
-	bdev->man[TTM_PL_SYSTEM].available_caching = TTM_PL_MASK_CACHING;
-	bdev->man[TTM_PL_SYSTEM].default_caching = TTM_PL_FLAG_CACHED;
-	ret = ttm_bo_init_mm(bdev, TTM_PL_SYSTEM, 0);
-	if (unlikely(ret != 0))
-		goto out_no_sys;
+	ttm_bo_init_sysman(bdev);
 
 	bdev->vma_manager = vma_manager;
 	INIT_DELAYED_WORK(&bdev->wq, ttm_bo_delayed_workqueue);
@@ -1685,9 +1692,6 @@ int ttm_bo_device_init(struct ttm_bo_device *bdev,
 	mutex_unlock(&ttm_global_mutex);
 
 	return 0;
-out_no_sys:
-	ttm_bo_global_release();
-	return ret;
 }
 EXPORT_SYMBOL(ttm_bo_device_init);
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
