Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED344DE02C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 18:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145E110E1E9;
	Fri, 18 Mar 2022 17:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org
 [IPv6:2001:41c9:1:41e::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE38D10E181
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 17:43:46 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id B7D52289343;
 Fri, 18 Mar 2022 17:43:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1647625425; bh=xZYecm7whlHA1cSyTP6Wy/rczFEvGWoFOhEO8fWTu5E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DzTNyqT49l1qavriq4UGNqgHzngGno+d4adTks2G5wM0Cupl6NfzIMEzVICs/UKCz
 4jZhX5y/s4ieQNU9dcoWQVaKqkD6mhdbApLM5fnj4i7WB4f+JuD8LIzcWWrZYNNVfR
 KC2nN1n1YrH2zDbDMnAO22HPpXPAf8vbkXJe1IT5/fhJanARU2Jg/axQEYNh5ZRoAV
 9Pd95+zhIk1Ng5tsHvA0uG4spXSjEXh9KUQ6UnJXYXHFwokg1L3DPaaNCMuQpncEiE
 BKqyHB6YVL9h+ss32TWDor2PRpernhd9q6vTEAQRaXn55Ltv4MARm+EoG4Hyfqa1XW
 V61Lvq54PH0Cg==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/vmwgfx: Fix an invalid read
Date: Fri, 18 Mar 2022 13:43:28 -0400
Message-Id: <20220318174332.440068-2-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220318174332.440068-1-zack@kde.org>
References: <20220318174332.440068-1-zack@kde.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, Chuck Lever III <chuck.lever@oracle.com>,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

vmw_move assumed that buffers to be moved would always be
vmw_buffer_object's but after introduction of new placement for mob
pages that's no longer the case.
The resulting invalid read didn't have any practical consequences
because the memory isn't used unless the object actually is a
vmw_buffer_object.
Fix it by moving the cast to the spot where the results are used.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Fixes: f6be23264bba ("drm/vmwgfx: Introduce a new placement for MOB page tables")
Reported-by: Chuck Lever III <chuck.lever@oracle.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 708899ba2102..6542f1498651 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -859,22 +859,21 @@ void vmw_query_move_notify(struct ttm_buffer_object *bo,
 	struct ttm_device *bdev = bo->bdev;
 	struct vmw_private *dev_priv;
 
-
 	dev_priv = container_of(bdev, struct vmw_private, bdev);
 
 	mutex_lock(&dev_priv->binding_mutex);
 
-	dx_query_mob = container_of(bo, struct vmw_buffer_object, base);
-	if (!dx_query_mob || !dx_query_mob->dx_query_ctx) {
-		mutex_unlock(&dev_priv->binding_mutex);
-		return;
-	}
-
 	/* If BO is being moved from MOB to system memory */
 	if (new_mem->mem_type == TTM_PL_SYSTEM &&
 	    old_mem->mem_type == VMW_PL_MOB) {
 		struct vmw_fence_obj *fence;
 
+		dx_query_mob = container_of(bo, struct vmw_buffer_object, base);
+		if (!dx_query_mob || !dx_query_mob->dx_query_ctx) {
+			mutex_unlock(&dev_priv->binding_mutex);
+			return;
+		}
+
 		(void) vmw_query_readback_all(dx_query_mob);
 		mutex_unlock(&dev_priv->binding_mutex);
 
@@ -888,7 +887,6 @@ void vmw_query_move_notify(struct ttm_buffer_object *bo,
 		(void) ttm_bo_wait(bo, false, false);
 	} else
 		mutex_unlock(&dev_priv->binding_mutex);
-
 }
 
 /**
-- 
2.32.0

