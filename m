Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C1A27E0B3
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 07:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3726E4DE;
	Wed, 30 Sep 2020 05:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B556E4DE
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 05:55:12 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-3zG36S5xONatEk4xpDf3vQ-1; Wed, 30 Sep 2020 01:55:06 -0400
X-MC-Unique: 3zG36S5xONatEk4xpDf3vQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 484661006701;
 Wed, 30 Sep 2020 05:55:05 +0000 (UTC)
Received: from dreadlord-bne-redhat-com.bne.redhat.com (unknown [10.64.32.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A94606198D;
 Wed, 30 Sep 2020 05:55:03 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/ttm: fix regression in ttm moves
Date: Wed, 30 Sep 2020 15:54:59 +1000
Message-Id: <20200930055459.31310-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This fixes a bug introduced in be1213a341a289afc51f89181c310e368fba0b66
drm/ttm: remove TTM_MEMTYPE_FLAG_FIXED v2

On vmwgfx this causes a Command buffer error WARN to trigger.

This is because the old code used to check if bo->ttm was true,
and the new code doesn't, fix it code to add back the check resolves
the issue.

Fixes: be1213a341a2 ("drm/ttm: remove TTM_MEMTYPE_FLAG_FIXED v2")
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 70b3bee27850..e8aa2fe8e9d1 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -251,9 +251,11 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 		/* Zero init the new TTM structure if the old location should
 		 * have used one as well.
 		 */
-		ret = ttm_tt_create(bo, old_man->use_tt);
-		if (ret)
-			goto out_err;
+		if (!bo->ttm) {
+			ret = ttm_tt_create(bo, old_man->use_tt);
+			if (ret)
+				goto out_err;
+		}
 
 		ret = ttm_tt_set_placement_caching(bo->ttm, mem->placement);
 		if (ret)
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
