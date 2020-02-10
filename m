Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3349B158612
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 00:15:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF8B6ED77;
	Mon, 10 Feb 2020 23:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020226EA0D;
 Mon, 10 Feb 2020 23:15:25 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e41e3ce0000>; Mon, 10 Feb 2020 15:14:22 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 10 Feb 2020 15:15:25 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 10 Feb 2020 15:15:25 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Feb
 2020 23:15:25 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 10 Feb 2020 23:15:25 +0000
Received: from jajones-aftershock.nvidia.com (Not Verified[172.20.40.102]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e41e40c0002>; Mon, 10 Feb 2020 15:15:24 -0800
From: James Jones <jajones@nvidia.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH v5 3/3] drm/nouveau: Support NVIDIA format modifiers
Date: Mon, 10 Feb 2020 15:15:55 -0800
Message-ID: <20200210231555.3316-4-jajones@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210231555.3316-1-jajones@nvidia.com>
References: <20200210231555.3316-1-jajones@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1581376462; bh=GPpZ3QctS+kMLPA7KNAGoenxgP5mXQsFsQnMd4cWjVQ=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=bOC+LwXXqGSMLTx1NatOnz+JEM+8zV1DXBCOHEOpMBrBHIoBUdSaQwOKAGOvuz7QD
 5n7/oiT/Iq006R0QsmAw2uYAlfUAK/G/0hAQbixqEo6pUfZGpvHj7+PHcWqsN+yNo/
 5zSvycFfJMVVh0YnmMAIx5i8IyYMt0w03RZMzvE+W/SGu+KeI7rHKIPidkm3QCetN3
 Pin02ZDT/ro9En7mnOBCPEKpTL65GszyRjOcKnz/2/NDz6JgGX/nznbd8AkjQyfGSy
 zgJoBHWlsLBnud+Vtif5cMK7NtAS4C3WYKU5ppOs0xKH8DeKllzkqI3+3qYaumyfZp
 REzA4hM1IxcUw==
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
Cc: nouveau@lists.freedesktop.org, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow setting the block layout of a nouveau FB
object using DRM format modifiers.  When
specified, the format modifier block layout and
kind overrides the GEM buffer's implicit layout
and kind.  The specified format modifier is
validated against the list of modifiers supported
by the target display hardware.

v2: Used Tesla family instead of NV50 chipset compare
v4: Do not cache kind, tile_mode in nouveau_framebuffer
v5: Resolved against nouveau_framebuffer cleanup

Signed-off-by: James Jones <jajones@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c   | 20 +++--
 drivers/gpu/drm/nouveau/nouveau_display.c | 89 ++++++++++++++++++++++-
 drivers/gpu/drm/nouveau/nouveau_display.h |  4 +
 3 files changed, 104 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 8d6ef70602e1..6821195d65b7 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -44,9 +44,9 @@ nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct drm_framebuffer *fb)
 {
 	struct nouveau_drm *drm = nouveau_drm(fb->dev);
 	struct nv50_wndw_ctxdma *ctxdma;
-	struct nouveau_bo *nvbo = nouveau_gem_object(fb->obj[0]);
-	const u8    kind = nvbo->kind;
-	const u32 handle = 0xfb000000 | kind;
+	u32 handle;
+	u32 unused;
+	u8  kind;
 	struct {
 		struct nv_dma_v0 base;
 		union {
@@ -58,6 +58,9 @@ nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct drm_framebuffer *fb)
 	u32 argc = sizeof(args.base);
 	int ret;
 
+	nouveau_framebuffer_get_layout(fb, &unused, &kind);
+	handle = 0xfb000000 | kind;
+
 	list_for_each_entry(ctxdma, &wndw->ctxdma.list, head) {
 		if (ctxdma->object.handle == handle)
 			return ctxdma;
@@ -238,15 +241,18 @@ nv50_wndw_atomic_check_acquire(struct nv50_wndw *wndw, bool modeset,
 {
 	struct drm_framebuffer *fb = asyw->state.fb;
 	struct nouveau_drm *drm = nouveau_drm(wndw->plane.dev);
-	struct nouveau_bo *nvbo = nouveau_gem_object(fb->obj[0]);
+	uint8_t kind;
+	uint32_t tile_mode;
 	int ret;
 
 	NV_ATOMIC(drm, "%s acquire\n", wndw->plane.name);
 
 	if (fb != armw->state.fb || !armw->visible || modeset) {
+		nouveau_framebuffer_get_layout(fb, &tile_mode, &kind);
+
 		asyw->image.w = fb->width;
 		asyw->image.h = fb->height;
-		asyw->image.kind = nvbo->kind;
+		asyw->image.kind = kind;
 
 		ret = nv50_wndw_atomic_check_acquire_rgb(asyw);
 		if (ret) {
@@ -258,9 +264,9 @@ nv50_wndw_atomic_check_acquire(struct nv50_wndw *wndw, bool modeset,
 		if (asyw->image.kind) {
 			asyw->image.layout = 0;
 			if (drm->client.device.info.chipset >= 0xc0)
-				asyw->image.blockh = nvbo->mode >> 4;
+				asyw->image.blockh = tile_mode >> 4;
 			else
-				asyw->image.blockh = nvbo->mode;
+				asyw->image.blockh = tile_mode;
 			asyw->image.blocks[0] = fb->pitches[0] / 64;
 			asyw->image.pitch[0] = 0;
 		} else {
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 3048a43a8d36..616c9e486efb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -203,6 +203,76 @@ static const struct drm_framebuffer_funcs nouveau_framebuffer_funcs = {
 	.create_handle = drm_gem_fb_create_handle,
 };
 
+static void
+nouveau_decode_mod(struct nouveau_drm *drm,
+		   uint64_t modifier,
+		   uint32_t *tile_mode,
+		   uint8_t *kind)
+{
+	BUG_ON(!tile_mode || !kind);
+
+	if (modifier == DRM_FORMAT_MOD_LINEAR) {
+		/* tile_mode will not be used in this case */
+		*tile_mode = 0;
+		*kind = 0;
+	} else {
+		/*
+		 * Extract the block height and kind from the corresponding
+		 * modifier fields.  See drm_fourcc.h for details.
+		 */
+		*tile_mode = (uint32_t)(modifier & 0xF);
+		*kind = (uint8_t)((modifier >> 12) & 0xFF);
+
+		if (drm->client.device.info.chipset >= 0xc0)
+			*tile_mode <<= 4;
+	}
+}
+
+void
+nouveau_framebuffer_get_layout(struct drm_framebuffer *fb,
+			       uint32_t *tile_mode,
+			       uint8_t *kind)
+{
+	if (fb->flags & DRM_MODE_FB_MODIFIERS) {
+		struct nouveau_drm *drm = nouveau_drm(fb->dev);
+
+		nouveau_decode_mod(drm, fb->modifier, tile_mode, kind);
+	} else {
+		const struct nouveau_bo *nvbo = nouveau_gem_object(fb->obj[0]);
+
+		*tile_mode = nvbo->mode;
+		*kind = nvbo->kind;
+	}
+}
+
+static int
+nouveau_validate_decode_mod(struct nouveau_drm *drm,
+			    uint64_t modifier,
+			    uint32_t *tile_mode,
+			    uint8_t *kind)
+{
+	struct nouveau_display *disp = nouveau_display(drm->dev);
+	int mod;
+
+	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
+		return -EINVAL;
+	}
+
+	BUG_ON(!disp->format_modifiers);
+
+	for (mod = 0;
+	     (disp->format_modifiers[mod] != DRM_FORMAT_MOD_INVALID) &&
+	     (disp->format_modifiers[mod] != modifier);
+	     mod++);
+
+	if (disp->format_modifiers[mod] == DRM_FORMAT_MOD_INVALID)
+		return -EINVAL;
+
+	nouveau_decode_mod(drm, modifier, tile_mode, kind);
+
+	return 0;
+}
+
 static inline uint32_t
 nouveau_get_width_in_blocks(uint32_t stride)
 {
@@ -284,6 +354,8 @@ nouveau_framebuffer_new(struct drm_device *dev,
 	struct drm_framebuffer *fb;
 	const struct drm_format_info *info;
 	unsigned int width, height, i;
+	uint32_t tile_mode;
+	uint8_t kind;
 	int ret;
 
         /* YUV overlays have special requirements pre-NV50 */
@@ -306,6 +378,18 @@ nouveau_framebuffer_new(struct drm_device *dev,
 		return -EINVAL;
 	}
 
+	if (mode_cmd->flags & DRM_MODE_FB_MODIFIERS) {
+		if (nouveau_validate_decode_mod(drm, mode_cmd->modifier[0],
+						&tile_mode, &kind)) {
+			DRM_DEBUG_KMS("Unsupported modifier: 0x%llx\n",
+				      mode_cmd->modifier[0]);
+			return -EINVAL;
+		}
+	} else {
+		tile_mode = nvbo->mode;
+		kind = nvbo->kind;
+	}
+
 	info = drm_get_format_info(dev, mode_cmd);
 
 	for (i = 0; i < info->num_planes; i++) {
@@ -316,11 +400,11 @@ nouveau_framebuffer_new(struct drm_device *dev,
 						      mode_cmd->height,
 						      i);
 
-		if (nvbo->kind) {
+		if (kind) {
 			ret = nouveau_check_bl_size(drm, nvbo,
 						    mode_cmd->offsets[i],
 						    mode_cmd->pitches[i],
-						    height, nvbo->mode);
+						    height, tile_mode);
 			if (ret)
 				return ret;
 		} else {
@@ -610,6 +694,7 @@ nouveau_display_create(struct drm_device *dev)
 
 	dev->mode_config.preferred_depth = 24;
 	dev->mode_config.prefer_shadow = 1;
+	dev->mode_config.allow_fb_modifiers = true;
 
 	if (drm->client.device.info.chipset < 0x11)
 		dev->mode_config.async_page_flip = false;
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
index fb21822f54fa..b59d8b689f53 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.h
+++ b/drivers/gpu/drm/nouveau/nouveau_display.h
@@ -61,6 +61,10 @@ int  nouveau_display_dumb_map_offset(struct drm_file *, struct drm_device *,
 
 void nouveau_hdmi_mode_set(struct drm_encoder *, struct drm_display_mode *);
 
+void
+nouveau_framebuffer_get_layout(struct drm_framebuffer *fb, uint32_t *tile_mode,
+			       uint8_t *kind);
+
 struct drm_framebuffer *
 nouveau_user_framebuffer_create(struct drm_device *, struct drm_file *,
 				const struct drm_mode_fb_cmd2 *);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
