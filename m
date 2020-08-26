Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C678425251B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 03:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034816E9DC;
	Wed, 26 Aug 2020 01:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE7A6E9DB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 01:44:54 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-femGtr6bNXeqiMGK86V3JA-1; Tue, 25 Aug 2020 21:44:49 -0400
X-MC-Unique: femGtr6bNXeqiMGK86V3JA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2B0D801AEA;
 Wed, 26 Aug 2020 01:44:48 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-53.bne.redhat.com
 [10.64.54.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 474DD60C13;
 Wed, 26 Aug 2020 01:44:47 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/23] drm/ttm/agp: export bind/unbind/destroy for drivers to
 use.
Date: Wed, 26 Aug 2020 11:44:11 +1000
Message-Id: <20200826014428.828392-7-airlied@gmail.com>
In-Reply-To: <20200826014428.828392-1-airlied@gmail.com>
References: <20200826014428.828392-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
X-Mimecast-Spam-Score: 0.001
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
Cc: kraxel@redhat.com, sroland@vmware.com, bskeggs@redhat.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_agp_backend.c | 15 +++++++++------
 include/drm/ttm/ttm_tt.h              |  6 ++++++
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_agp_backend.c b/drivers/gpu/drm/ttm/ttm_agp_backend.c
index 934a69491547..fbf98cd1a3e5 100644
--- a/drivers/gpu/drm/ttm/ttm_agp_backend.c
+++ b/drivers/gpu/drm/ttm/ttm_agp_backend.c
@@ -48,8 +48,8 @@ struct ttm_agp_backend {
 	struct agp_bridge_data *bridge;
 };
 
-static int ttm_agp_bind(struct ttm_bo_device *bdev,
-			struct ttm_tt *ttm, struct ttm_resource *bo_mem)
+int ttm_agp_bind(struct ttm_bo_device *bdev,
+		 struct ttm_tt *ttm, struct ttm_resource *bo_mem)
 {
 	struct ttm_agp_backend *agp_be = container_of(ttm, struct ttm_agp_backend, ttm);
 	struct page *dummy_read_page = ttm_bo_glob.dummy_read_page;
@@ -82,9 +82,10 @@ static int ttm_agp_bind(struct ttm_bo_device *bdev,
 
 	return ret;
 }
+EXPORT_SYMBOL(ttm_agp_bind);
 
-static void ttm_agp_unbind(struct ttm_bo_device *bdev,
-			   struct ttm_tt *ttm)
+void ttm_agp_unbind(struct ttm_bo_device *bdev,
+		    struct ttm_tt *ttm)
 {
 	struct ttm_agp_backend *agp_be = container_of(ttm, struct ttm_agp_backend, ttm);
 
@@ -97,9 +98,10 @@ static void ttm_agp_unbind(struct ttm_bo_device *bdev,
 		agp_be->mem = NULL;
 	}
 }
+EXPORT_SYMBOL(ttm_agp_unbind);
 
-static void ttm_agp_destroy(struct ttm_bo_device *bdev,
-			    struct ttm_tt *ttm)
+void ttm_agp_destroy(struct ttm_bo_device *bdev,
+		     struct ttm_tt *ttm)
 {
 	struct ttm_agp_backend *agp_be = container_of(ttm, struct ttm_agp_backend, ttm);
 
@@ -108,6 +110,7 @@ static void ttm_agp_destroy(struct ttm_bo_device *bdev,
 	ttm_tt_fini(ttm);
 	kfree(agp_be);
 }
+EXPORT_SYMBOL(ttm_agp_destroy);
 
 static struct ttm_backend_func ttm_agp_func = {
 	.bind = ttm_agp_bind,
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 6bda88f8da46..5a34f1640865 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -266,6 +266,12 @@ struct ttm_tt *ttm_agp_tt_create(struct ttm_buffer_object *bo,
 				 uint32_t page_flags);
 int ttm_agp_tt_populate(struct ttm_bo_device *bdev, struct ttm_tt *ttm, struct ttm_operation_ctx *ctx);
 void ttm_agp_tt_unpopulate(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
+int ttm_agp_bind(struct ttm_bo_device *bdev,
+		 struct ttm_tt *ttm, struct ttm_resource *bo_mem);
+void ttm_agp_unbind(struct ttm_bo_device *bdev,
+		    struct ttm_tt *ttm);
+void ttm_agp_destroy(struct ttm_bo_device *bdev,
+		     struct ttm_tt *ttm);
 #endif
 
 #endif
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
