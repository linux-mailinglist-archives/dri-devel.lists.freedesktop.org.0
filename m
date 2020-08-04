Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 128B123B306
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411DD6E3E5;
	Tue,  4 Aug 2020 02:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4EA6E3EB
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:58:22 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-WVPKbmOcOKW2t5b1Qm7t_Q-1; Mon, 03 Aug 2020 22:58:19 -0400
X-MC-Unique: WVPKbmOcOKW2t5b1Qm7t_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 260ED18FF667;
 Tue,  4 Aug 2020 02:58:18 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B2DB8AD1C;
 Tue,  4 Aug 2020 02:58:16 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 39/59] drm/nouveau/ttm: use wrapper to access memory managers
Date: Tue,  4 Aug 2020 12:56:12 +1000
Message-Id: <20200804025632.3868079-40-airlied@gmail.com>
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
 drivers/gpu/drm/nouveau/nouveau_ttm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index bb310719e3f5..cc6cf04553dd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -156,7 +156,7 @@ nouveau_ttm_init_host(struct nouveau_drm *drm, u8 kind)
 static int
 nouveau_ttm_init_vram(struct nouveau_drm *drm)
 {
-	struct ttm_mem_type_manager *man = &drm->ttm.bdev.man[TTM_PL_VRAM];
+	struct ttm_mem_type_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
 	struct nvif_mmu *mmu = &drm->client.mmu;
 
 	man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
@@ -186,7 +186,7 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
 static void
 nouveau_ttm_fini_vram(struct nouveau_drm *drm)
 {
-	struct ttm_mem_type_manager *man = &drm->ttm.bdev.man[TTM_PL_VRAM];
+	struct ttm_mem_type_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
 
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
 		ttm_mem_type_manager_disable(man);
@@ -199,7 +199,7 @@ nouveau_ttm_fini_vram(struct nouveau_drm *drm)
 static int
 nouveau_ttm_init_gtt(struct nouveau_drm *drm)
 {
-	struct ttm_mem_type_manager *man = &drm->ttm.bdev.man[TTM_PL_TT];
+	struct ttm_mem_type_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_TT);
 	unsigned long size_pages = drm->gem.gart_available >> PAGE_SHIFT;
 	man->use_tt = true;
 	if (drm->agp.bridge) {
@@ -228,7 +228,7 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
 static void
 nouveau_ttm_fini_gtt(struct nouveau_drm *drm)
 {
-	struct ttm_mem_type_manager *man = &drm->ttm.bdev.man[TTM_PL_TT];
+	struct ttm_mem_type_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_TT);
 
 	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA &&
 	    drm->agp.bridge)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
