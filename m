Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFEB276835
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0826EA7B;
	Thu, 24 Sep 2020 05:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E586EA70
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:19:04 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-MB82pMINPmG0rhauZcDExA-1; Thu, 24 Sep 2020 01:19:01 -0400
X-MC-Unique: MB82pMINPmG0rhauZcDExA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CBC6805EE5;
 Thu, 24 Sep 2020 05:19:00 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9389119D7C;
 Thu, 24 Sep 2020 05:18:59 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/45] drm/vram_helper: implement a ttm move callback.
Date: Thu, 24 Sep 2020 15:18:08 +1000
Message-Id: <20200924051845.397177-9-airlied@gmail.com>
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

This will always do memcpy moves.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 171ea57b0311..9fd80a3643f6 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -600,6 +600,14 @@ static void drm_gem_vram_bo_driver_move_notify(struct drm_gem_vram_object *gbo,
 	kmap->virtual = NULL;
 }
 
+static int drm_gem_vram_bo_driver_move(struct drm_gem_vram_object *gbo,
+				       bool evict,
+				       struct ttm_operation_ctx *ctx,
+				       struct ttm_resource *new_mem)
+{
+	return ttm_bo_move_memcpy(&gbo->bo, ctx, new_mem);
+}
+
 /*
  * Helpers for struct drm_gem_object_funcs
  */
@@ -962,6 +970,18 @@ static void bo_driver_move_notify(struct ttm_buffer_object *bo,
 	drm_gem_vram_bo_driver_move_notify(gbo, evict, new_mem);
 }
 
+static int bo_driver_move(struct ttm_buffer_object *bo,
+			  bool evict,
+			  struct ttm_operation_ctx *ctx,
+			  struct ttm_resource *new_mem)
+{
+	struct drm_gem_vram_object *gbo;
+
+	gbo = drm_gem_vram_of_bo(bo);
+
+	return drm_gem_vram_bo_driver_move(gbo, evict, ctx, new_mem);
+}
+
 static int bo_driver_io_mem_reserve(struct ttm_bo_device *bdev,
 				    struct ttm_resource *mem)
 {
@@ -986,6 +1006,7 @@ static struct ttm_bo_driver bo_driver = {
 	.ttm_tt_destroy = bo_driver_ttm_tt_destroy,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = bo_driver_evict_flags,
+	.move = bo_driver_move,
 	.move_notify = bo_driver_move_notify,
 	.io_mem_reserve = bo_driver_io_mem_reserve,
 };
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
