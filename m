Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D963E666248
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 18:50:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E5FC10E7D1;
	Wed, 11 Jan 2023 17:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE4C10E7D1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 17:50:26 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 308AD33F326;
 Wed, 11 Jan 2023 17:50:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1673459424; bh=aK5KJQ9Nw7v7qyH659mF6AvhUERGuDuiygjbdOXDmJs=;
 h=From:To:Cc:Subject:Date:From;
 b=E6mhfvfQw6MCN0L0EmrVeLbH7MAApriDF5mfZCMcr/E4xhZvDRw+8vgmqSRIj4noT
 1VmHHSR0mvx3X8EEVOjw5tgEt7EZKXAZxkS5AFwP5U6IXk2BZtVY8q/EqJYcj9WjhC
 D5dS5wSXTHcupGRDfQ8D7PYpMGqKXOwMDtDKDxME+emm1R5+mrR5yfAByq25PB/8+S
 AqjXNcphU1St4ceAdf3y8wdkQ0B8B6xrQlcvY00iM1U1PCDeseWokoI9gswjzC0bcw
 wj4L9bxfrte50Yrz4EOzt6Ro7+hKX2lzahJgJuBIatuoQO0UtKlNzxIevj2i0f4tH3
 PCwDtnfZXl1NQ==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: Fix a regression causing kernel oops'es
Date: Wed, 11 Jan 2023 12:50:15 -0500
Message-Id: <20230111175015.1134923-1-zack@kde.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, banackm@vmware.com,
 krastevm@vmware.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

The branch is explicitly taken if ttm == NULL which means that to avoid
a null pointer reference the ttm object can not be used inside. Switch
back to dst_mem to avoid kernel oops'es.

This fixes kernel oops'es with any buffer objects which don't have ttm_tt,
e.g. with vram based screen objects on vmwgfx.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Fixes: e3c92eb4a84f ("drm/ttm: rework on ttm_resource to use size_t type")
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index fee7c20775c0..12017ec24d9f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -183,7 +183,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 
 	clear = src_iter->ops->maps_tt && (!ttm || !ttm_tt_is_populated(ttm));
 	if (!(clear && ttm && !(ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC)))
-		ttm_move_memcpy(clear, ttm->num_pages, dst_iter, src_iter);
+		ttm_move_memcpy(clear, PFN_UP(dst_mem->size), dst_iter, src_iter);
 
 	if (!src_iter->ops->maps_tt)
 		ttm_kmap_iter_linear_io_fini(&_src_iter.io, bdev, src_mem);
-- 
2.37.2

