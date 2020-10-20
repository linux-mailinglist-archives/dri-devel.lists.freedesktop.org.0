Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4BF293291
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 03:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCFB6EE54;
	Tue, 20 Oct 2020 01:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF566EE53
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 01:03:31 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-u1V50wp3O0qSuh8kP3HoMA-1; Mon, 19 Oct 2020 21:03:26 -0400
X-MC-Unique: u1V50wp3O0qSuh8kP3HoMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52EBD10E2183;
 Tue, 20 Oct 2020 01:03:25 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-180.bne.redhat.com
 [10.64.54.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C7AC55784;
 Tue, 20 Oct 2020 01:03:24 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/7] drm/ttm: minor cleanup to move to system
Date: Tue, 20 Oct 2020 11:03:14 +1000
Message-Id: <20201020010319.1692445-3-airlied@gmail.com>
In-Reply-To: <20201020010319.1692445-1-airlied@gmail.com>
References: <20201020010319.1692445-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

resource free already sets the domain to system, and old_mem
isn't really needed.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index c8ca6694cc1c..b730e624a220 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -68,10 +68,9 @@ int ttm_bo_move_to_new_tt_mem(struct ttm_buffer_object *bo,
 int ttm_bo_move_to_system(struct ttm_buffer_object *bo,
 			  struct ttm_operation_ctx *ctx)
 {
-	struct ttm_resource *old_mem = &bo->mem;
 	int ret;
 
-	if (old_mem->mem_type == TTM_PL_SYSTEM)
+	if (bo->mem.mem_type == TTM_PL_SYSTEM)
 		return 0;
 
 	ret = ttm_bo_wait_ctx(bo, ctx);
@@ -83,7 +82,6 @@ int ttm_bo_move_to_system(struct ttm_buffer_object *bo,
 
 	ttm_bo_tt_unbind(bo);
 	ttm_resource_free(bo, &bo->mem);
-	old_mem->mem_type = TTM_PL_SYSTEM;
 	return 0;
 }
 EXPORT_SYMBOL(ttm_bo_move_to_system);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
