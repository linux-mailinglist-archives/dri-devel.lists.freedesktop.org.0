Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 270D2233E01
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8643E6E9AD;
	Fri, 31 Jul 2020 04:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B4E6E9A2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:06:55 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-dNmFyYFHNuqlQJq1MHcY2w-1; Fri, 31 Jul 2020 00:06:47 -0400
X-MC-Unique: dNmFyYFHNuqlQJq1MHcY2w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA22410059A7;
 Fri, 31 Jul 2020 04:06:46 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8389D100238C;
 Fri, 31 Jul 2020 04:06:42 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 35/49] drm/nouveau/ttm: don't fill in blank ttm debug callback
Date: Fri, 31 Jul 2020 14:05:06 +1000
Message-Id: <20200731040520.3701599-36-airlied@gmail.com>
In-Reply-To: <20200731040520.3701599-1-airlied@gmail.com>
References: <20200731040520.3701599-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: christian.koenig@amd.com, sroland@vmware.com, bskeggs@redhat.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_ttm.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index ed651d7679fe..1b9d9362132d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -37,12 +37,6 @@ nouveau_manager_del(struct ttm_mem_type_manager *man, struct ttm_mem_reg *reg)
 	nouveau_mem_del(reg);
 }
 
-static void
-nouveau_manager_debug(struct ttm_mem_type_manager *man,
-		      struct drm_printer *printer)
-{
-}
-
 static int
 nouveau_vram_manager_new(struct ttm_mem_type_manager *man,
 			 struct ttm_buffer_object *bo,
@@ -72,7 +66,6 @@ nouveau_vram_manager_new(struct ttm_mem_type_manager *man,
 const struct ttm_mem_type_manager_func nouveau_vram_manager = {
 	.get_node = nouveau_vram_manager_new,
 	.put_node = nouveau_manager_del,
-	.debug = nouveau_manager_debug,
 };
 
 static int
@@ -96,7 +89,6 @@ nouveau_gart_manager_new(struct ttm_mem_type_manager *man,
 const struct ttm_mem_type_manager_func nouveau_gart_manager = {
 	.get_node = nouveau_gart_manager_new,
 	.put_node = nouveau_manager_del,
-	.debug = nouveau_manager_debug
 };
 
 static int
@@ -129,7 +121,6 @@ nv04_gart_manager_new(struct ttm_mem_type_manager *man,
 const struct ttm_mem_type_manager_func nv04_gart_manager = {
 	.get_node = nv04_gart_manager_new,
 	.put_node = nouveau_manager_del,
-	.debug = nouveau_manager_debug
 };
 
 int
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
