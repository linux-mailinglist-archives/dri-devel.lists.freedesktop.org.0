Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4171B4785
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 16:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30666E3FE;
	Wed, 22 Apr 2020 14:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01366EA02
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 14:41:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C9FECAD0E;
 Wed, 22 Apr 2020 14:40:58 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
 christian.koenig@amd.com, kraxel@redhat.com
Subject: [PATCH 2/2] drm/vram-helper: Alternate between bottom-up and top-down
 placement
Date: Wed, 22 Apr 2020 16:40:55 +0200
Message-Id: <20200422144055.27801-3-tzimmermann@suse.de>
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

With limited VRAM available, fragmentation can lead to OOM errors.
Alternating between bottom-up and top-down placement keeps BOs near the
ends of the VRAM and the available pages consecutively near the middle.

A real-world example with 16 MiB of VRAM is shown below.

  > cat /sys/kernel/debug/dri/0/vram-mm
  0x0000000000000000-0x000000000000057f: 1407: free
  0x000000000000057f-0x0000000000000b5b: 1500: used
  0x0000000000000b5b-0x0000000000000ff0: 1173: free

The first free area was the location of the fbdev framebuffer. The used
area is Weston's current framebuffer of 1500 pages. Weston now cannot
do a pageflip to another 1500 page-wide framebuffer, even though enough
pages are available. The patch resolves this problem to

  > cat /sys/kernel/debug/dri/0/vram-mm
  0x0000000000000000-0x00000000000005dc: 1500: used
  0x00000000000005dc-0x0000000000000a14: 1080: free
  0x0000000000000a14-0x0000000000000ff0: 1500: used

with both of Weston's framebuffers located near the ends of the VRAM
memory.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 28 ++++++++++++++++++++++-----
 include/drm/drm_gem_vram_helper.h     | 10 ++++++----
 2 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 5d5bfb38bbed4..2d0b7474288de 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -146,15 +146,33 @@ static void drm_gem_vram_placement(struct drm_gem_vram_object *gbo,
 	unsigned int i;
 	unsigned int c = 0;
 	u32 invariant_flags = pl_flag & TTM_PL_FLAG_TOPDOWN;
+	struct drm_device *dev = gbo->bo.base.dev;
+	struct drm_vram_mm *vmm = dev->vram_mm;
 
 	gbo->placement.placement = gbo->placements;
 	gbo->placement.busy_placement = gbo->placements;
 
-	if (pl_flag & TTM_PL_FLAG_VRAM)
-		gbo->placements[c++].flags = TTM_PL_FLAG_WC |
-					     TTM_PL_FLAG_UNCACHED |
-					     TTM_PL_FLAG_VRAM |
-					     invariant_flags;
+	if (pl_flag & TTM_PL_FLAG_VRAM) {
+		/*
+		 * We usually have at most 2 pinned BOs during pageflips,
+		 * plus cursor BOs. Even with a significant number of free
+		 ' pages, always placing bottom-up can lead to fragmentation
+		 * and OOM situations. So if there's no explicit request for
+		 * top-down placement, we alternatingly place BOs bottom-up
+		 * and top-down. The placement strategy should help to keep
+		 * free VRAM pages available near the middle of the VRAM.
+		 */
+		gbo->placements[c].flags = TTM_PL_FLAG_WC |
+					   TTM_PL_FLAG_UNCACHED |
+					   TTM_PL_FLAG_VRAM |
+					   invariant_flags;
+		if (!(invariant_flags & TTM_PL_FLAG_TOPDOWN)) {
+			if (vmm->place_topdown)
+				gbo->placements[c].flags |= TTM_PL_FLAG_TOPDOWN;
+			vmm->place_topdown = !vmm->place_topdown;
+		}
+		++c;
+	}
 
 	if (pl_flag & TTM_PL_FLAG_SYSTEM)
 		gbo->placements[c++].flags = TTM_PL_MASK_CACHING |
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index b63bcd1b996da..04767d0ff23a6 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -165,10 +165,10 @@ void drm_gem_vram_simple_display_pipe_cleanup_fb(
 
 /**
  * struct drm_vram_mm - An instance of VRAM MM
- * @vram_base:	Base address of the managed video memory
- * @vram_size:	Size of the managed video memory in bytes
- * @bdev:	The TTM BO device.
- * @funcs:	TTM BO functions
+ * @vram_base:		Base address of the managed video memory
+ * @vram_size:		Size of the managed video memory in bytes
+ * @bdev:		The TTM BO device
+ * @place_topdown:	Flags the next BO to be placed at the VRAM's high end
  *
  * The fields &struct drm_vram_mm.vram_base and
  * &struct drm_vram_mm.vrm_size are managed by VRAM MM, but are
@@ -180,6 +180,8 @@ struct drm_vram_mm {
 	size_t vram_size;
 
 	struct ttm_bo_device bdev;
+
+	bool place_topdown;
 };
 
 /**
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
