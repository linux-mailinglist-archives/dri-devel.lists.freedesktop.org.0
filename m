Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C13274F63
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 05:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A626E41A;
	Wed, 23 Sep 2020 03:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517386E40A
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 03:05:16 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-PUja1lbnPXmCHnyEBAX23g-1; Tue, 22 Sep 2020 23:05:11 -0400
X-MC-Unique: PUja1lbnPXmCHnyEBAX23g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 401701091061;
 Wed, 23 Sep 2020 03:05:10 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4716317D04;
 Wed, 23 Sep 2020 03:05:09 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/10] drm/amdgpu/ttm: handle tt moves properly.
Date: Wed, 23 Sep 2020 13:04:51 +1000
Message-Id: <20200923030454.362731-8-airlied@gmail.com>
In-Reply-To: <20200923030454.362731-1-airlied@gmail.com>
References: <20200923030454.362731-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

The core move code currently handles use_tt moves, for amdgpu
this was being handled also in the driver, but not using the same
paths.

If moving between TT/SYSTEM (all the use_tt paths on amdgpu) use
the core move function.

Eventually the core will be flipped over to calling the driver.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index db5f761f37ec..d3bd2fd448be 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -671,14 +671,16 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 		ttm_bo_move_null(bo, new_mem);
 		return 0;
 	}
-	if ((old_mem->mem_type == TTM_PL_TT &&
-	     new_mem->mem_type == TTM_PL_SYSTEM) ||
-	    (old_mem->mem_type == TTM_PL_SYSTEM &&
-	     new_mem->mem_type == TTM_PL_TT)) {
-		/* bind is enough */
+	if (old_mem->mem_type == TTM_PL_SYSTEM &&
+	    new_mem->mem_type == TTM_PL_TT) {
 		ttm_bo_move_null(bo, new_mem);
 		return 0;
 	}
+
+	if (old_mem->mem_type == TTM_PL_TT &&
+	    new_mem->mem_type == TTM_PL_SYSTEM)
+		return ttm_bo_move_ttm(bo, ctx, new_mem);
+
 	if (old_mem->mem_type == AMDGPU_PL_GDS ||
 	    old_mem->mem_type == AMDGPU_PL_GWS ||
 	    old_mem->mem_type == AMDGPU_PL_OA ||
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
