Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949F12744D5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 16:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769E56E2A9;
	Tue, 22 Sep 2020 14:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57CC6E89C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 14:57:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6C8A7AD76;
 Tue, 22 Sep 2020 14:57:42 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@linux.ie
Subject: [PATCH 3/3] drm/vram-helper: Don't put new BOs into VRAM
Date: Tue, 22 Sep 2020 16:57:00 +0200
Message-Id: <20200922145700.25413-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922145700.25413-1-tzimmermann@suse.de>
References: <20200922145700.25413-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most drivers that use VRAM helpers have only a few MiB of framebuffer
memory available. To reduce fragmentation, new BOs are now put into
system memory by default. Only pin operations are allowed to move BOs
into VRAM.

v2:
	* rebased onto latest drm-tip

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 11315b9e8c03..9d85790e0c07 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -222,8 +222,7 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 	acc_size = ttm_bo_dma_acc_size(bdev, size, sizeof(*gbo));
 
 	gbo->bo.bdev = bdev;
-	drm_gem_vram_placement(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM |
-			       DRM_GEM_VRAM_PL_FLAG_SYSTEM);
+	drm_gem_vram_placement(gbo, DRM_GEM_VRAM_PL_FLAG_SYSTEM);
 
 	/*
 	 * A failing ttm_bo_init will call ttm_buffer_object_destroy
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
