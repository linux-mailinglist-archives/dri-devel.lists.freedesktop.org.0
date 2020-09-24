Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E54C727682B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65026EA6A;
	Thu, 24 Sep 2020 05:18:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA23F6EA6A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:18:55 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-NBDocCc2NJi1vNG3q0Ov5w-1; Thu, 24 Sep 2020 01:18:51 -0400
X-MC-Unique: NBDocCc2NJi1vNG3q0Ov5w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A324C80734F;
 Thu, 24 Sep 2020 05:18:50 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A95C019930;
 Thu, 24 Sep 2020 05:18:49 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/45] drm/qxl: drop unused code
Date: Thu, 24 Sep 2020 15:18:01 +1000
Message-Id: <20200924051845.397177-2-airlied@gmail.com>
In-Reply-To: <20200924051845.397177-1-airlied@gmail.com>
References: <20200924051845.397177-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_ttm.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 2c35ca4270c6..5738be300078 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -100,17 +100,12 @@ int qxl_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
  */
 struct qxl_ttm_tt {
 	struct ttm_tt		        ttm;
-	struct qxl_device		*qdev;
-	u64				offset;
 };
 
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
@@ -138,14 +133,11 @@ static void qxl_ttm_backend_destroy(struct ttm_bo_device *bdev,
 static struct ttm_tt *qxl_ttm_tt_create(struct ttm_buffer_object *bo,
 					uint32_t page_flags)
 {
-	struct qxl_device *qdev;
 	struct qxl_ttm_tt *gtt;
 
-	qdev = qxl_get_qdev(bo->bdev);
 	gtt = kzalloc(sizeof(struct qxl_ttm_tt), GFP_KERNEL);
 	if (gtt == NULL)
 		return NULL;
-	gtt->qdev = qdev;
 	if (ttm_tt_init(&gtt->ttm, bo, page_flags)) {
 		kfree(gtt);
 		return NULL;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
