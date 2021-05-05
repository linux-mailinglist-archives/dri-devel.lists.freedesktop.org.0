Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D3D373415
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 05:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F856E417;
	Wed,  5 May 2021 03:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229F76E40A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 03:57:44 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 4 May 2021 20:57:41 -0700
Received: from vertex.localdomain (unknown [10.21.250.233])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 19F5F20486;
 Tue,  4 May 2021 20:57:43 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/6] drm/vmwgfx: Fix cpu updates of coherent multisample
 surfaces
Date: Tue, 4 May 2021 23:57:37 -0400
Message-ID: <20210505035740.286923-4-zackr@vmware.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505035740.286923-1-zackr@vmware.com>
References: <20210505035740.286923-1-zackr@vmware.com>
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-002.vmware.com: zackr@vmware.com does not
 designate permitted sender hosts)
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
Cc: krastevm@vmware.com, sroland@vmware.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Hellstrom <thellstrom@vmware.com>

In cases where the dirty linear memory range spans multiple sample sheets
in a surface, the dirty surface region is incorrectly computed.
To do this correctly and in an optimized fashion  we would have to compute
the dirty region of each sample sheet and compute the union of those
regions.

But assuming that cpu writing to a multisample surface is rather a corner
case than a common case, just set the dirty region to the full surface.

This fixes OpenGL piglit errors with SVGA_FORCE_COHERENT=1
and the piglit test:

fbo-depthstencil blit default_fb -samples=2 -auto

Fixes: 9ca7d19ff8ba ("drm/vmwgfx: Add surface dirty-tracking callbacks")
Signed-off-by: Thomas Hellstrom <thellstrom@vmware.com>
Reviewed-by: Charmaine Lee <charmainel@vmware.com>
Reviewed-by: Roland Scheidegger <sroland@vmware.com>
Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 .../drm/vmwgfx/device_include/svga3d_surfacedefs.h  |  8 ++++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c             | 13 +++++++++++++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/device_include/svga3d_surfacedefs.h b/drivers/gpu/drm/vmwgfx/device_include/svga3d_surfacedefs.h
index 4db25bd9fa22..127eaf0a0a58 100644
--- a/drivers/gpu/drm/vmwgfx/device_include/svga3d_surfacedefs.h
+++ b/drivers/gpu/drm/vmwgfx/device_include/svga3d_surfacedefs.h
@@ -1467,6 +1467,7 @@ struct svga3dsurface_cache {
 
 /**
  * struct svga3dsurface_loc - Surface location
+ * @sheet: The multisample sheet.
  * @sub_resource: Surface subresource. Defined as layer * num_mip_levels +
  * mip_level.
  * @x: X coordinate.
@@ -1474,6 +1475,7 @@ struct svga3dsurface_cache {
  * @z: Z coordinate.
  */
 struct svga3dsurface_loc {
+	u32 sheet;
 	u32 sub_resource;
 	u32 x, y, z;
 };
@@ -1566,8 +1568,8 @@ svga3dsurface_get_loc(const struct svga3dsurface_cache *cache,
 	u32 layer;
 	int i;
 
-	if (offset >= cache->sheet_bytes)
-		offset %= cache->sheet_bytes;
+	loc->sheet = offset / cache->sheet_bytes;
+	offset -= loc->sheet * cache->sheet_bytes;
 
 	layer = offset / cache->mip_chain_bytes;
 	offset -= layer * cache->mip_chain_bytes;
@@ -1631,6 +1633,7 @@ svga3dsurface_min_loc(const struct svga3dsurface_cache *cache,
 		      u32 sub_resource,
 		      struct svga3dsurface_loc *loc)
 {
+	loc->sheet = 0;
 	loc->sub_resource = sub_resource;
 	loc->x = loc->y = loc->z = 0;
 }
@@ -1652,6 +1655,7 @@ svga3dsurface_max_loc(const struct svga3dsurface_cache *cache,
 	const struct drm_vmw_size *size;
 	u32 mip;
 
+	loc->sheet = 0;
 	loc->sub_resource = sub_resource + 1;
 	mip = sub_resource % cache->num_mip_levels;
 	size = &cache->mip[mip].size;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index c3e55c1376eb..beab3e19d8e2 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -1804,6 +1804,19 @@ static void vmw_surface_tex_dirty_range_add(struct vmw_resource *res,
 	svga3dsurface_get_loc(cache, &loc2, end - 1);
 	svga3dsurface_inc_loc(cache, &loc2);
 
+	if (loc1.sheet != loc2.sheet) {
+		u32 sub_res;
+
+		/*
+		 * Multiple multisample sheets. To do this in an optimized
+		 * fashion, compute the dirty region for each sheet and the
+		 * resulting union. Since this is not a common case, just dirty
+		 * the whole surface.
+		 */
+		for (sub_res = 0; sub_res < dirty->num_subres; ++sub_res)
+			vmw_subres_dirty_full(dirty, sub_res);
+		return;
+	}
 	if (loc1.sub_resource + 1 == loc2.sub_resource) {
 		/* Dirty range covers a single sub-resource */
 		vmw_subres_dirty_add(dirty, &loc1, &loc2);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
