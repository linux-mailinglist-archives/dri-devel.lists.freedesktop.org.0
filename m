Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6700233DE2
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5F86E999;
	Fri, 31 Jul 2020 04:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BBE6E999
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:05:38 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-n27sVWY4MNyc1oXNOH3e4Q-1; Fri, 31 Jul 2020 00:05:31 -0400
X-MC-Unique: n27sVWY4MNyc1oXNOH3e4Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B9D58015CE;
 Fri, 31 Jul 2020 04:05:30 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2858100238C;
 Fri, 31 Jul 2020 04:05:28 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/49] drm/qxl/ttm: call ttm manager debug
Date: Fri, 31 Jul 2020 14:04:32 +1000
Message-Id: <20200731040520.3701599-2-airlied@gmail.com>
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

This code was poking inside a struct and assuming it was a drm_mm
at the start. Call the proper API.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_ttm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 759c9d601072..59478761efe8 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -279,12 +279,10 @@ void qxl_ttm_fini(struct qxl_device *qdev)
 static int qxl_mm_dump_table(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_mm *mm = (struct drm_mm *)node->info_ent->data;
+	struct ttm_mem_type_manager *man = (struct ttm_mem_type_manager *)node->info_ent->data;
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	spin_lock(&ttm_bo_glob.lru_lock);
-	drm_mm_print(mm, &p);
-	spin_unlock(&ttm_bo_glob.lru_lock);
+	man->func->debug(man, &p);
 	return 0;
 }
 #endif
@@ -305,9 +303,9 @@ void qxl_ttm_debugfs_init(struct qxl_device *qdev)
 		qxl_mem_types_list[i].show = &qxl_mm_dump_table;
 		qxl_mem_types_list[i].driver_features = 0;
 		if (i == 0)
-			qxl_mem_types_list[i].data = qdev->mman.bdev.man[TTM_PL_VRAM].priv;
+			qxl_mem_types_list[i].data = &qdev->mman.bdev.man[TTM_PL_VRAM];
 		else
-			qxl_mem_types_list[i].data = qdev->mman.bdev.man[TTM_PL_PRIV].priv;
+			qxl_mem_types_list[i].data = &qdev->mman.bdev.man[TTM_PL_PRIV];
 
 	}
 	qxl_debugfs_add_files(qdev, qxl_mem_types_list, i);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
