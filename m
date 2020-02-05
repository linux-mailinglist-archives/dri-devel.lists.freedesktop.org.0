Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5031539EA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 22:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93366E9F8;
	Wed,  5 Feb 2020 21:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04876E248;
 Wed,  5 Feb 2020 21:05:47 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e3b2df10000>; Wed, 05 Feb 2020 13:04:49 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 05 Feb 2020 13:05:47 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 05 Feb 2020 13:05:47 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Feb
 2020 21:05:47 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 5 Feb 2020 21:05:47 +0000
Received: from jajones-aftershock.nvidia.com (Not Verified[172.20.42.103]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e3b2e2a0007>; Wed, 05 Feb 2020 13:05:46 -0800
From: James Jones <jajones@nvidia.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH v3 3/3] drm/nouveau: Support NVIDIA format modifiers
Date: Wed, 5 Feb 2020 13:06:13 -0800
Message-ID: <20200205210613.15658-4-jajones@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200205210613.15658-1-jajones@nvidia.com>
References: <20200205210613.15658-1-jajones@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580936689; bh=Wu2Xzt/CZGWKSMn0iwuWMcle3B2T15Xn/LWu45D/A0c=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=MZDac2lBIIGUMI/ghRZvGaqwb2D49CVfaeR9WfL4R4lcABzJNIMr6ugAvGL82nD2I
 abxCeeOJibfoexNNtI43g4RQCnjMJT/foifTXu1JyDk9BR4Wh7TwfNDHWZcEVbDKRU
 uSVoLyo9c/uzdVYKG1v+UYd5lqApzf9uHOq3egFnzjSuuAD3mrguRfbv3eYhAyUAZR
 Rxn1kye2vXPLMGovReULpZZ+tv4Tl4CAaXUP9T9sqhYUzjO7/Gf6IUFTV658TXBnYE
 Veu//oCCHzSRK0wbJZZssjNGVjhtJOccfgT7sEhRIcgi1Jo+wZV2P/OmqnO3LFmzj0
 26COoFHWrYiTg==
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
validated against he list of modifiers supported
by the target display hardware.

v2: Used Tesla family instead of NV50 chipset compare

Signed-off-by: James Jones <jajones@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c   |  8 +--
 drivers/gpu/drm/nouveau/nouveau_display.c | 65 ++++++++++++++++++++++-
 drivers/gpu/drm/nouveau/nouveau_display.h |  2 +
 3 files changed, 69 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index a424ecfdf8e9..0047ba710da0 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -43,7 +43,7 @@ nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct nouveau_framebuffer *fb)
 {
 	struct nouveau_drm *drm = nouveau_drm(fb->base.dev);
 	struct nv50_wndw_ctxdma *ctxdma;
-	const u8    kind = fb->nvbo->kind;
+	const u8    kind = fb->kind;
 	const u32 handle = 0xfb000000 | kind;
 	struct {
 		struct nv_dma_v0 base;
@@ -243,7 +243,7 @@ nv50_wndw_atomic_check_acquire(struct nv50_wndw *wndw, bool modeset,
 	if (asyw->state.fb != armw->state.fb || !armw->visible || modeset) {
 		asyw->image.w = fb->base.width;
 		asyw->image.h = fb->base.height;
-		asyw->image.kind = fb->nvbo->kind;
+		asyw->image.kind = fb->kind;
 
 		ret = nv50_wndw_atomic_check_acquire_rgb(asyw);
 		if (ret) {
@@ -255,9 +255,9 @@ nv50_wndw_atomic_check_acquire(struct nv50_wndw *wndw, bool modeset,
 		if (asyw->image.kind) {
 			asyw->image.layout = 0;
 			if (drm->client.device.info.chipset >= 0xc0)
-				asyw->image.blockh = fb->nvbo->mode >> 4;
+				asyw->image.blockh = fb->tile_mode >> 4;
 			else
-				asyw->image.blockh = fb->nvbo->mode;
+				asyw->image.blockh = fb->tile_mode;
 			asyw->image.blocks[0] = fb->base.pitches[0] / 64;
 			asyw->image.pitch[0] = 0;
 		} else {
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 4273d9387cda..05bb077a9dd9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -224,6 +224,50 @@ static const struct drm_framebuffer_funcs nouveau_framebuffer_funcs = {
 	.create_handle = nouveau_user_framebuffer_create_handle,
 };
 
+static int
+nouveau_decode_mod(struct nouveau_drm *drm,
+		   uint64_t modifier,
+		   uint32_t *tile_mode,
+		   uint8_t *kind)
+{
+	struct nouveau_display *disp = nouveau_display(drm->dev);
+	int mod;
+
+	BUG_ON(!tile_mode || !kind);
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
+
+	return 0;
+}
+
 static inline uint32_t
 nouveau_get_width_in_blocks(uint32_t stride)
 {
@@ -304,6 +348,8 @@ nouveau_framebuffer_new(struct drm_device *dev,
 	struct nouveau_framebuffer *fb;
 	const struct drm_format_info *info;
 	unsigned int width, height, i;
+	uint32_t tile_mode;
+	uint8_t kind;
 	int ret;
 
         /* YUV overlays have special requirements pre-NV50 */
@@ -326,6 +372,18 @@ nouveau_framebuffer_new(struct drm_device *dev,
 		return -EINVAL;
 	}
 
+	if (mode_cmd->flags & DRM_MODE_FB_MODIFIERS) {
+		if (nouveau_decode_mod(drm, mode_cmd->modifier[0], &tile_mode,
+				       &kind)) {
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
@@ -336,11 +394,11 @@ nouveau_framebuffer_new(struct drm_device *dev,
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
@@ -356,6 +414,8 @@ nouveau_framebuffer_new(struct drm_device *dev,
 
 	drm_helper_mode_fill_fb_struct(dev, &fb->base, mode_cmd);
 	fb->nvbo = nvbo;
+	fb->tile_mode = tile_mode;
+	fb->kind = kind;
 
 	ret = drm_framebuffer_init(dev, &fb->base, &nouveau_framebuffer_funcs);
 	if (ret)
@@ -632,6 +692,7 @@ nouveau_display_create(struct drm_device *dev)
 
 	dev->mode_config.preferred_depth = 24;
 	dev->mode_config.prefer_shadow = 1;
+	dev->mode_config.allow_fb_modifiers = true;
 
 	if (drm->client.device.info.chipset < 0x11)
 		dev->mode_config.async_page_flip = false;
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
index c54682f00b01..0dad57b21983 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.h
+++ b/drivers/gpu/drm/nouveau/nouveau_display.h
@@ -15,6 +15,8 @@ struct nouveau_framebuffer {
 	u32 r_handle;
 	u32 r_format;
 	u32 r_pitch;
+	u32 tile_mode;
+	u8 kind;
 	struct nvif_object h_base[4];
 	struct nvif_object h_core;
 };
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
