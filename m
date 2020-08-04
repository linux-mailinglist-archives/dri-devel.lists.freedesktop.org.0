Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A380623B307
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C50B6E3EB;
	Tue,  4 Aug 2020 02:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205186E3E5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:58:22 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-HVM9c9Q7OpSVySYp6FpgcQ-1; Mon, 03 Aug 2020 22:58:17 -0400
X-MC-Unique: HVM9c9Q7OpSVySYp6FpgcQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BD8B800461;
 Tue,  4 Aug 2020 02:58:16 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65D7B90E68;
 Tue,  4 Aug 2020 02:58:11 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 38/59] drm/vram-helper: use wrapper to access memory managers
Date: Tue,  4 Aug 2020 12:56:11 +1000
Message-Id: <20200804025632.3868079-39-airlied@gmail.com>
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
 drivers/gpu/drm/drm_gem_vram_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 2099851c017e..a01768adb96d 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -1075,7 +1075,7 @@ static int drm_vram_mm_debugfs(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
 	struct drm_vram_mm *vmm = node->minor->dev->vram_mm;
-	struct ttm_mem_type_manager *man = &vmm->bdev.man[TTM_PL_VRAM];
+	struct ttm_mem_type_manager *man = ttm_manager_type(&vmm->bdev, TTM_PL_VRAM);
 	struct drm_printer p = drm_seq_file_printer(m);
 
 	ttm_mem_type_manager_debug(man, &p);
@@ -1103,7 +1103,7 @@ EXPORT_SYMBOL(drm_vram_mm_debugfs_init);
 static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
 			    uint64_t vram_base, size_t vram_size)
 {
-	struct ttm_mem_type_manager *man = &vmm->bdev.man[TTM_PL_VRAM];
+	struct ttm_mem_type_manager *man = ttm_manager_type(&vmm->bdev, TTM_PL_VRAM);
 	int ret;
 
 	vmm->vram_base = vram_base;
@@ -1127,7 +1127,7 @@ static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
 
 static void drm_vram_mm_cleanup(struct drm_vram_mm *vmm)
 {
-	ttm_range_man_fini(&vmm->bdev, &vmm->bdev.man[TTM_PL_VRAM]);
+	ttm_range_man_fini(&vmm->bdev, ttm_manager_type(&vmm->bdev, TTM_PL_VRAM));
 	ttm_bo_device_release(&vmm->bdev);
 }
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
