Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE03F23B2F6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F526E3C1;
	Tue,  4 Aug 2020 02:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CB36E3C1
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:57:48 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-BuCQbDE9N_GRSJLdu2amew-1; Mon, 03 Aug 2020 22:57:43 -0400
X-MC-Unique: BuCQbDE9N_GRSJLdu2amew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFD9618FF667;
 Tue,  4 Aug 2020 02:57:42 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 103CB8AD1C;
 Tue,  4 Aug 2020 02:57:40 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 25/59] drm/ttm: make some inline helper functions for cleanup
 paths. (v2)
Date: Tue,  4 Aug 2020 12:55:58 +1000
Message-Id: <20200804025632.3868079-26-airlied@gmail.com>
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

The disable path is just temporary for now, it will be dropped once has_type
is gone in a later patch.

v2: add docs.
rename to ttm_mem_type_manager namespace

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c    |  6 ++----
 include/drm/ttm/ttm_bo_driver.h | 26 ++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index af1b1c3f6ed2..127a0b62bf98 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1468,8 +1468,7 @@ int ttm_bo_clean_mm(struct ttm_bo_device *bdev, unsigned mem_type)
 		return ret;
 	}
 
-	man->use_type = false;
-	man->has_type = false;
+	ttm_mem_type_manager_disable(man);
 
 	ret = 0;
 	if (mem_type > 0) {
@@ -1482,8 +1481,7 @@ int ttm_bo_clean_mm(struct ttm_bo_device *bdev, unsigned mem_type)
 		ret = (*man->func->takedown)(man);
 	}
 
-	dma_fence_put(man->move);
-	man->move = NULL;
+	ttm_mem_type_manager_cleanup(man);
 
 	return ret;
 }
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 548c27294c64..41bfa514c29d 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -680,6 +680,32 @@ static inline void ttm_mem_type_manager_set_used(struct ttm_mem_type_manager *ma
 	man->use_type = used;
 }
 
+/**
+ * ttm_mem_type_manager_disable.
+ *
+ * @man: A memory manager object.
+ *
+ * Indicate the manager is not to be used and deregistered. (temporary during rework).
+ */
+static inline void ttm_mem_type_manager_disable(struct ttm_mem_type_manager *man)
+{
+	man->has_type = false;
+	man->use_type = false;
+}
+
+/**
+ * ttm_mem_type_manager_cleanup
+ *
+ * @man: A memory manager object.
+ *
+ * Cleanup the move fences from the memory manager object.
+ */
+static inline void ttm_mem_type_manager_cleanup(struct ttm_mem_type_manager *man)
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
