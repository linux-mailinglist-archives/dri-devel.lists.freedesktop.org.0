Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A0E252517
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 03:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DFC6E9D6;
	Wed, 26 Aug 2020 01:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B997A6E9D6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 01:44:43 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-oE_urRzCMhSslwS0zvqmoA-1; Tue, 25 Aug 2020 21:44:40 -0400
X-MC-Unique: oE_urRzCMhSslwS0zvqmoA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54505801ADD;
 Wed, 26 Aug 2020 01:44:39 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-53.bne.redhat.com
 [10.64.54.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DACFB60C13;
 Wed, 26 Aug 2020 01:44:37 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/23] drm/amdgpu/ttm: remove unused parameter to move blit
Date: Wed, 26 Aug 2020 11:44:06 +1000
Message-Id: <20200826014428.828392-2-airlied@gmail.com>
In-Reply-To: <20200826014428.828392-1-airlied@gmail.com>
References: <20200826014428.828392-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
X-Mimecast-Spam-Score: 0.001
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
Cc: kraxel@redhat.com, sroland@vmware.com, bskeggs@redhat.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index d7f668dbc9e0..00b2c0359735 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -455,7 +455,7 @@ int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
  * help move buffers to and from VRAM.
  */
 static int amdgpu_move_blit(struct ttm_buffer_object *bo,
-			    bool evict, bool no_wait_gpu,
+			    bool evict,
 			    struct ttm_resource *new_mem,
 			    struct ttm_resource *old_mem)
 {
@@ -553,7 +553,7 @@ static int amdgpu_move_vram_ram(struct ttm_buffer_object *bo, bool evict,
 	}
 
 	/* blit VRAM to GTT */
-	r = amdgpu_move_blit(bo, evict, ctx->no_wait_gpu, &tmp_mem, old_mem);
+	r = amdgpu_move_blit(bo, evict, &tmp_mem, old_mem);
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
@@ -603,7 +603,7 @@ static int amdgpu_move_ram_vram(struct ttm_buffer_object *bo, bool evict,
 	}
 
 	/* copy to VRAM */
-	r = amdgpu_move_blit(bo, evict, ctx->no_wait_gpu, new_mem, old_mem);
+	r = amdgpu_move_blit(bo, evict, new_mem, old_mem);
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
@@ -692,7 +692,7 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 		   new_mem->mem_type == TTM_PL_VRAM) {
 		r = amdgpu_move_ram_vram(bo, evict, ctx, new_mem);
 	} else {
-		r = amdgpu_move_blit(bo, evict, ctx->no_wait_gpu,
+		r = amdgpu_move_blit(bo, evict,
 				     new_mem, old_mem);
 	}
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
