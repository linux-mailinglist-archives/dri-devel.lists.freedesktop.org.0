Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FB09C6FB4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 13:52:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E235410E335;
	Wed, 13 Nov 2024 12:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D1910E335;
 Wed, 13 Nov 2024 12:52:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3A935A40870;
 Wed, 13 Nov 2024 12:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B3CC4CEE0;
 Wed, 13 Nov 2024 12:52:15 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] drm/radeon: Use ttm_bo_move_null() in radeon_bo_move()
Date: Wed, 13 Nov 2024 20:51:58 +0800
Message-ID: <20241113125158.1959533-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.43.5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since ttm_bo_move_null() is exactly the same as ttm_resource_free() +
ttm_bo_assign_mem(), we use ttm_bo_move_null() for the GTT --> SYSTEM
move case too. Then the code is more consistent as the SYSTEM --> GTT
move case.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 69d0c12fa419..616d25c8c2de 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -219,8 +219,7 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 	if (old_mem->mem_type == TTM_PL_TT &&
 	    new_mem->mem_type == TTM_PL_SYSTEM) {
 		radeon_ttm_tt_unbind(bo->bdev, bo->ttm);
-		ttm_resource_free(bo, &bo->resource);
-		ttm_bo_assign_mem(bo, new_mem);
+		ttm_bo_move_null(bo, new_mem);
 		goto out;
 	}
 	if (rdev->ring[radeon_copy_ring_index(rdev)].ready &&
-- 
2.43.5

