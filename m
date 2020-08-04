Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E438D23B2FC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE23F6E3CE;
	Tue,  4 Aug 2020 02:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8E26E3CE
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:58:03 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-zfEo7J9qMSCTv7_IdlcvZQ-1; Mon, 03 Aug 2020 22:57:57 -0400
X-MC-Unique: zfEo7J9qMSCTv7_IdlcvZQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3C9A91270;
 Tue,  4 Aug 2020 02:57:56 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 462598AD1C;
 Tue,  4 Aug 2020 02:57:51 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 30/59] drm/nouveau: use new cleanup paths
Date: Tue,  4 Aug 2020 12:56:03 +1000
Message-Id: <20200804025632.3868079-31-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-1-airlied@gmail.com>
References: <20200804025632.3868079-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: sroland@vmware.com, christian.koenig@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_ttm.c | 41 ++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index cfcbecd332ef..bb310719e3f5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -31,12 +31,6 @@
 
 #include <core/tegra.h>
 
-static int
-nouveau_manager_fini(struct ttm_mem_type_manager *man)
-{
-	return 0;
-}
-
 static void
 nouveau_manager_del(struct ttm_mem_type_manager *man, struct ttm_mem_reg *reg)
 {
@@ -70,7 +64,6 @@ nouveau_vram_manager_new(struct ttm_mem_type_manager *man,
 }
 
 const struct ttm_mem_type_manager_func nouveau_vram_manager = {
-	.takedown = nouveau_manager_fini,
 	.get_node = nouveau_vram_manager_new,
 	.put_node = nouveau_manager_del,
 };
@@ -94,7 +87,6 @@ nouveau_gart_manager_new(struct ttm_mem_type_manager *man,
 }
 
 const struct ttm_mem_type_manager_func nouveau_gart_manager = {
-	.takedown = nouveau_manager_fini,
 	.get_node = nouveau_gart_manager_new,
 	.put_node = nouveau_manager_del,
 };
@@ -127,7 +119,6 @@ nv04_gart_manager_new(struct ttm_mem_type_manager *man,
 }
 
 const struct ttm_mem_type_manager_func nv04_gart_manager = {
-	.takedown = nouveau_manager_fini,
 	.get_node = nv04_gart_manager_new,
 	.put_node = nouveau_manager_del,
 };
@@ -192,6 +183,19 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
 	}
 }
 
+static void
+nouveau_ttm_fini_vram(struct nouveau_drm *drm)
+{
+	struct ttm_mem_type_manager *man = &drm->ttm.bdev.man[TTM_PL_VRAM];
+
+	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
+		ttm_mem_type_manager_disable(man);
+		ttm_mem_type_manager_force_list_clean(&drm->ttm.bdev, man);
+		ttm_mem_type_manager_cleanup(man);
+	} else
+		ttm_range_man_fini(&drm->ttm.bdev, man);
+}
+
 static int
 nouveau_ttm_init_gtt(struct nouveau_drm *drm)
 {
@@ -221,6 +225,21 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
 	return 0;
 }
 
+static void
+nouveau_ttm_fini_gtt(struct nouveau_drm *drm)
+{
+	struct ttm_mem_type_manager *man = &drm->ttm.bdev.man[TTM_PL_TT];
+
+	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA &&
+	    drm->agp.bridge)
+		ttm_range_man_fini(&drm->ttm.bdev, man);
+	else {
+		ttm_mem_type_manager_disable(man);
+		ttm_mem_type_manager_force_list_clean(&drm->ttm.bdev, man);
+		ttm_mem_type_manager_cleanup(man);
+	}
+}
+
 int
 nouveau_ttm_init(struct nouveau_drm *drm)
 {
@@ -310,8 +329,8 @@ nouveau_ttm_fini(struct nouveau_drm *drm)
 {
 	struct nvkm_device *device = nvxx_device(&drm->client.device);
 
-	ttm_bo_clean_mm(&drm->ttm.bdev, TTM_PL_VRAM);
-	ttm_bo_clean_mm(&drm->ttm.bdev, TTM_PL_TT);
+	nouveau_ttm_fini_vram(drm);
+	nouveau_ttm_fini_gtt(drm);
 
 	ttm_bo_device_release(&drm->ttm.bdev);
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
