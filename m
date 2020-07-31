Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95270233DEE
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838BD6E9A5;
	Fri, 31 Jul 2020 04:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53606E9A5
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:06:07 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-Hd5Qud8hMl-Jpd6hs-lseQ-1; Fri, 31 Jul 2020 00:06:02 -0400
X-MC-Unique: Hd5Qud8hMl-Jpd6hs-lseQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57AD91005510;
 Fri, 31 Jul 2020 04:06:01 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF2A0100238C;
 Fri, 31 Jul 2020 04:05:59 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 15/49] drm/ttm: make some inline helper functions for cleanup
 paths.
Date: Fri, 31 Jul 2020 14:04:46 +1000
Message-Id: <20200731040520.3701599-16-airlied@gmail.com>
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

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c    |  6 ++----
 include/drm/ttm/ttm_bo_driver.h | 12 ++++++++++++
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 84e399395e4f..f584e5e94383 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1462,8 +1462,7 @@ int ttm_bo_clean_mm(struct ttm_bo_device *bdev, unsigned mem_type)
 		return ret;
 	}
 
-	man->use_type = false;
-	man->has_type = false;
+	ttm_bo_disable_mm(man);
 
 	ret = 0;
 	if (mem_type > 0) {
@@ -1476,8 +1475,7 @@ int ttm_bo_clean_mm(struct ttm_bo_device *bdev, unsigned mem_type)
 		ret = (*man->func->takedown)(man);
 	}
 
-	dma_fence_put(man->move);
-	man->move = NULL;
+	ttm_bo_man_cleanup(man);
 
 	return ret;
 }
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index d0f1a6cdfba7..92bb54cce633 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -671,6 +671,18 @@ static inline void ttm_bo_use_mm(struct ttm_mem_type_manager *man)
 	man->use_type = true;
 }
 
+static inline void ttm_bo_disable_mm(struct ttm_mem_type_manager *man)
+{
+	man->has_type = false;
+	man->use_type = false;
+}
+
+static inline void ttm_bo_man_cleanup(struct ttm_mem_type_manager *man)
+{
+	dma_fence_put(man->move);
+	man->move = NULL;
+}
+
 /*
  * ttm_bo_util.c
  */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
