Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A41B3276839
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1F06EA83;
	Thu, 24 Sep 2020 05:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBAD46EA7B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:19:19 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-hmQ75UhYNh-ZHXq7KqNIsA-1; Thu, 24 Sep 2020 01:19:16 -0400
X-MC-Unique: hmQ75UhYNh-ZHXq7KqNIsA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98C9A805EE8;
 Thu, 24 Sep 2020 05:19:15 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4951519930;
 Thu, 24 Sep 2020 05:19:14 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 19/45] drm/qxl/ttm: handle move notify inside move callback
Date: Thu, 24 Sep 2020 15:18:19 +1000
Message-Id: <20200924051845.397177-20-airlied@gmail.com>
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
 drivers/gpu/drm/qxl/qxl_ttm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 5738be300078..378b6827b7a3 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -151,6 +151,11 @@ static int qxl_bo_move(struct ttm_buffer_object *bo, bool evict,
 {
 	struct ttm_resource *old_mem = &bo->mem;
 	int ret;
+	struct qxl_bo *qbo = to_qxl_bo(bo);
+	struct qxl_device *qdev = to_qxl(qbo->tbo.base.dev);
+
+	if (bo->mem.mem_type == TTM_PL_PRIV && qbo->surface_id)
+		qxl_surface_evict(qdev, qbo, true);
 
 	ret = ttm_bo_wait_ctx(bo, ctx);
 	if (ret)
@@ -175,8 +180,8 @@ static void qxl_bo_move_notify(struct ttm_buffer_object *bo,
 	qbo = to_qxl_bo(bo);
 	qdev = to_qxl(qbo->tbo.base.dev);
 
-	if (bo->mem.mem_type == TTM_PL_PRIV && qbo->surface_id)
-		qxl_surface_evict(qdev, qbo, new_mem ? true : false);
+	if (!new_mem && bo->mem.mem_type == TTM_PL_PRIV && qbo->surface_id)
+		qxl_surface_evict(qdev, qbo, false);
 }
 
 static struct ttm_bo_driver qxl_bo_driver = {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
