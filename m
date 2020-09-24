Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC14D276859
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153C06EA9E;
	Thu, 24 Sep 2020 05:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2570B6EA8A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:19:55 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-bRST97gGOmiHxAEb0yymnw-1; Thu, 24 Sep 2020 01:19:46 -0400
X-MC-Unique: bRST97gGOmiHxAEb0yymnw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E25A7800FFF;
 Thu, 24 Sep 2020 05:19:45 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9F4D19D7C;
 Thu, 24 Sep 2020 05:19:44 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 40/45] drm/amdgpu/ttm: use new ttm helper to create temp tt
Date: Thu, 24 Sep 2020 15:18:40 +1000
Message-Id: <20200924051845.397177-41-airlied@gmail.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 29 ++-----------------------
 1 file changed, 2 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index e1133acb8536..1fbcb16a3c24 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -526,22 +526,9 @@ static int amdgpu_move_vram_ram(struct ttm_buffer_object *bo, bool evict,
 {
 	struct ttm_resource *old_mem = &bo->mem;
 	struct ttm_resource tmp_mem;
-	struct ttm_place placements;
-	struct ttm_placement placement;
 	int r;
 
-	/* create space/pages for new_mem in GTT space */
-	tmp_mem = *new_mem;
-	tmp_mem.mm_node = NULL;
-	placement.num_placement = 1;
-	placement.placement = &placements;
-	placement.num_busy_placement = 1;
-	placement.busy_placement = &placements;
-	placements.fpfn = 0;
-	placements.lpfn = 0;
-	placements.mem_type = TTM_PL_TT;
-	placements.flags = TTM_PL_MASK_CACHING;
-	r = ttm_bo_mem_space(bo, &placement, &tmp_mem, ctx);
+	r = ttm_bo_create_tt_tmp(bo, ctx, new_mem, &tmp_mem);
 	if (unlikely(r)) {
 		pr_err("Failed to find GTT space for blit from VRAM\n");
 		return r;
@@ -597,22 +584,10 @@ static int amdgpu_move_ram_vram(struct ttm_buffer_object *bo, bool evict,
 {
 	struct ttm_resource *old_mem = &bo->mem;
 	struct ttm_resource tmp_mem;
-	struct ttm_placement placement;
-	struct ttm_place placements;
 	int r;
 
 	/* make space in GTT for old_mem buffer */
-	tmp_mem = *new_mem;
-	tmp_mem.mm_node = NULL;
-	placement.num_placement = 1;
-	placement.placement = &placements;
-	placement.num_busy_placement = 1;
-	placement.busy_placement = &placements;
-	placements.fpfn = 0;
-	placements.lpfn = 0;
-	placements.mem_type = TTM_PL_TT;
-	placements.flags = TTM_PL_MASK_CACHING;
-	r = ttm_bo_mem_space(bo, &placement, &tmp_mem, ctx);
+	r = ttm_bo_create_tt_tmp(bo, ctx, new_mem, &tmp_mem);
 	if (unlikely(r)) {
 		pr_err("Failed to find GTT space for blit to VRAM\n");
 		return r;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
