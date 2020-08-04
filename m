Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E25823B30A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C5B36E3EF;
	Tue,  4 Aug 2020 02:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3682F6E3EF
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:58:32 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-S_f7hVsAMIGrIsOxkvOg2Q-1; Mon, 03 Aug 2020 22:58:29 -0400
X-MC-Unique: S_f7hVsAMIGrIsOxkvOg2Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5913F8015F4;
 Tue,  4 Aug 2020 02:58:28 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE56F90E68;
 Tue,  4 Aug 2020 02:58:26 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 44/59] drm/ttm: allow drivers to provide their own manager
 subclasses
Date: Tue,  4 Aug 2020 12:56:17 +1000
Message-Id: <20200804025632.3868079-45-airlied@gmail.com>
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

This will get removed eventually and all drivers will use this.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 include/drm/ttm/ttm_bo_driver.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 03b253d14e6a..6940d85a531a 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -419,7 +419,7 @@ struct ttm_bo_device {
 	 * access via ttm_manager_type.
 	 */
 	struct ttm_mem_type_manager man_priv[TTM_NUM_MEM_TYPES];
-
+	struct ttm_mem_type_manager *man_drv[TTM_NUM_MEM_TYPES];
 	/*
 	 * Protected by internal locks.
 	 */
@@ -450,9 +450,18 @@ struct ttm_bo_device {
 static inline struct ttm_mem_type_manager *ttm_manager_type(struct ttm_bo_device *bdev,
 							    int mem_type)
 {
+	if (bdev->man_drv[mem_type])
+		return bdev->man_drv[mem_type];
 	return &bdev->man_priv[mem_type];
 }
 
+static inline void ttm_set_driver_manager(struct ttm_bo_device *bdev,
+					  int type,
+					  struct ttm_mem_type_manager *manager)
+{
+	bdev->man_drv[type] = manager;
+}
+
 /**
  * struct ttm_lru_bulk_move_pos
  *
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
