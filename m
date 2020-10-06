Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBBB284327
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 02:07:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB22A6E1BB;
	Tue,  6 Oct 2020 00:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3704D6E1BB
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 00:06:59 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-SD9KypNWMW-4otyGzjV6Lw-1; Mon, 05 Oct 2020 20:06:51 -0400
X-MC-Unique: SD9KypNWMW-4otyGzjV6Lw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96F96925C32;
 Tue,  6 Oct 2020 00:06:50 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 923367BE42;
 Tue,  6 Oct 2020 00:06:49 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/qxl: drop unused code (v2)
Date: Tue,  6 Oct 2020 10:06:40 +1000
Message-Id: <20201006000644.1005758-2-airlied@gmail.com>
In-Reply-To: <20201006000644.1005758-1-airlied@gmail.com>
References: <20201006000644.1005758-1-airlied@gmail.com>
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
Cc: christian.koenig@amd.com, rscheidegger.oss@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

v2: drop the wrapper struct
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_ttm.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 2c35ca4270c6..669bceb58205 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -98,19 +98,11 @@ int qxl_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
 /*
  * TTM backend functions.
  */
-struct qxl_ttm_tt {
-	struct ttm_tt		        ttm;
-	struct qxl_device		*qdev;
-	u64				offset;
-};
 
 static int qxl_ttm_backend_bind(struct ttm_bo_device *bdev,
 				struct ttm_tt *ttm,
 				struct ttm_resource *bo_mem)
 {
-	struct qxl_ttm_tt *gtt = (void *)ttm;
-
-	gtt->offset = (unsigned long)(bo_mem->start << PAGE_SHIFT);
 	if (!ttm->num_pages) {
 		WARN(1, "nothing to bind %lu pages for mreg %p back %p!\n",
 		     ttm->num_pages, bo_mem, ttm);
@@ -128,29 +120,24 @@ static void qxl_ttm_backend_unbind(struct ttm_bo_device *bdev,
 static void qxl_ttm_backend_destroy(struct ttm_bo_device *bdev,
 				    struct ttm_tt *ttm)
 {
-	struct qxl_ttm_tt *gtt = (void *)ttm;
-
 	ttm_tt_destroy_common(bdev, ttm);
-	ttm_tt_fini(&gtt->ttm);
-	kfree(gtt);
+	ttm_tt_fini(ttm);
+	kfree(ttm);
 }
 
 static struct ttm_tt *qxl_ttm_tt_create(struct ttm_buffer_object *bo,
 					uint32_t page_flags)
 {
-	struct qxl_device *qdev;
-	struct qxl_ttm_tt *gtt;
+	struct ttm_tt *ttm;
 
-	qdev = qxl_get_qdev(bo->bdev);
-	gtt = kzalloc(sizeof(struct qxl_ttm_tt), GFP_KERNEL);
-	if (gtt == NULL)
+	ttm = kzalloc(sizeof(struct ttm_tt), GFP_KERNEL);
+	if (ttm == NULL)
 		return NULL;
-	gtt->qdev = qdev;
-	if (ttm_tt_init(&gtt->ttm, bo, page_flags)) {
-		kfree(gtt);
+	if (ttm_tt_init(ttm, bo, page_flags)) {
+		kfree(ttm);
 		return NULL;
 	}
-	return &gtt->ttm;
+	return ttm;
 }
 
 static int qxl_bo_move(struct ttm_buffer_object *bo, bool evict,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
