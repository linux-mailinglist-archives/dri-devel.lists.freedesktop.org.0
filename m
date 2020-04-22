Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A531E1B4784
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 16:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A522689C52;
	Wed, 22 Apr 2020 14:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD2889F61
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 14:41:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CA212AD26;
 Wed, 22 Apr 2020 14:40:58 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
 christian.koenig@amd.com, kraxel@redhat.com
Subject: [PATCH 1/2] drm/vram-helper: Don't put new BOs into VRAM
Date: Wed, 22 Apr 2020 16:40:54 +0200
Message-Id: <20200422144055.27801-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200422144055.27801-1-tzimmermann@suse.de>
References: <20200422144055.27801-1-tzimmermann@suse.de>
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

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 8b2d5c945c95c..5d5bfb38bbed4 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -197,7 +197,7 @@ static int drm_gem_vram_init(struct drm_device *dev,
 	acc_size = ttm_bo_dma_acc_size(bdev, size, sizeof(*gbo));
 
 	gbo->bo.bdev = bdev;
-	drm_gem_vram_placement(gbo, TTM_PL_FLAG_VRAM | TTM_PL_FLAG_SYSTEM);
+	drm_gem_vram_placement(gbo, TTM_PL_FLAG_SYSTEM);
 
 	ret = ttm_bo_init(bdev, &gbo->bo, size, ttm_bo_type_device,
 			  &gbo->placement, pg_align, false, acc_size,
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
