Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCAC28432A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 02:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FEA6E1C0;
	Tue,  6 Oct 2020 00:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2F96E1BD
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 00:07:02 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-9XAgkgi9PQCTrhCwdP5-2A-1; Mon, 05 Oct 2020 20:06:57 -0400
X-MC-Unique: 9XAgkgi9PQCTrhCwdP5-2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E16FF85C705;
 Tue,  6 Oct 2020 00:06:55 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E982D73687;
 Tue,  6 Oct 2020 00:06:54 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/ttm: make move callback compulstory
Date: Tue,  6 Oct 2020 10:06:44 +1000
Message-Id: <20201006000644.1005758-6-airlied@gmail.com>
In-Reply-To: <20201006000644.1005758-1-airlied@gmail.com>
References: <20201006000644.1005758-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: christian.koenig@amd.com, rscheidegger.oss@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

All drivers should have a move callback now so make it compulsory.

Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index e11e8eaa6602..88d215de9ae1 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -270,18 +270,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 	if (bdev->driver->move_notify)
 		bdev->driver->move_notify(bo, evict, mem);
 
-	if (old_man->use_tt && new_man->use_tt) {
-		if (bo->mem.mem_type == TTM_PL_SYSTEM) {
-			ttm_bo_assign_mem(bo, mem);
-			ret = 0;
-		} else
-			ret = ttm_bo_move_ttm(bo, ctx, mem);
-	} else if (bdev->driver->move) {
-		ret = bdev->driver->move(bo, evict, ctx, mem);
-	} else {
-		ret = ttm_bo_move_memcpy(bo, ctx, mem);
-	}
-
+	ret = bdev->driver->move(bo, evict, ctx, mem);
 	if (ret) {
 		if (bdev->driver->move_notify) {
 			swap(*mem, bo->mem);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
