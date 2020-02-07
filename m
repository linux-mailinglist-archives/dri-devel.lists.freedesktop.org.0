Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C573F15607A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 22:08:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EB76FDAB;
	Fri,  7 Feb 2020 21:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905D46E0D3;
 Fri,  7 Feb 2020 21:07:52 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e3dd1990000>; Fri, 07 Feb 2020 13:07:37 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 07 Feb 2020 13:07:52 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 07 Feb 2020 13:07:52 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Feb
 2020 21:07:51 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Fri, 7 Feb 2020 21:07:51 +0000
Received: from jajones-aftershock.nvidia.com (Not Verified[172.20.40.104]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e3dd1a70000>; Fri, 07 Feb 2020 13:07:51 -0800
From: James Jones <jajones@nvidia.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH v4 3/3] drm/nouveau: Support NVIDIA format modifiers
Date: Fri, 7 Feb 2020 13:08:19 -0800
Message-ID: <20200207210819.15917-4-jajones@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200207210819.15917-1-jajones@nvidia.com>
References: <20200207210819.15917-1-jajones@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1581109658; bh=NlN6f7P18F65FqVHfGf/8HqRSXnxIUnkEwI05qeT6NI=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=dGg0eC9hvyCRROn48G9vAH8MVc+TTlDWzzwFHRudFaiQ8go2NoF/LK8AHMpCm9FCa
 dj3DgSv2ij/PvGxT1QF+JzkJj9eRDylB2ttKPg4/1U9XV7/+ExMpwnEgJ+xxSgBN3E
 A4Pbu68xWmas1FMsbzISG43fkXHWJJc9sQssmyEEiidqz2VLmo1DEFHZ3FYnhS+R8k
 66teX1XyAJ3uIBYzF7aTqcu8dGCOVrBF9qP2e/WmPeW+zXpAh2jtZq19ZhY1xEk8aO
 mXX/Av+9U+eIRot1951OD6qZAawHQK3SvTbY+kZz2N29BSkYDlH4VbeAG0BQHFhvPC
 SIvaQgxuQW1NQ==
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

Signed-off-by: James Jones <jajones@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c   | 18 +++--
 drivers/gpu/drm/nouveau/nouveau_display.c | 90 ++++++++++++++++++++++-
 drivers/gpu/drm/nouveau/nouveau_display.h |  4 +
 3 files changed, 105 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index a424ecfdf8e9..064e8825d451 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -43,8 +43,9 @@ nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct nouveau_framebuffer *fb)
 {
 	struct nouveau_drm *drm = nouveau_drm(fb->base.dev);
 	struct nv50_wndw_ctxdma *ctxdma;
-	const u8    kind = fb->nvbo->kind;
-	const u32 handle = 0xfb000000 | kind;
+	u32 handle;
+	u32 unused;
+	u8  kind;
 	struct {
 		struct nv_dma_v0 base;
 		union {
@@ -56,6 +57,9 @@ nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct nouveau_framebuffer *fb)
 	u32 argc = sizeof(args.base);
 	int ret;
 
+	nouveau_framebuffer_get_layout(&fb->base, &unused, &kind);
+	handle = 0xfb000000 | kind;
+
 	list_for_each_entry(ctxdma, &wndw->ctxdma.list, head) {
 		if (ctxdma->object.handle == handle)
 			return ctxdma;
@@ -236,14 +240,18 @@ nv50_wndw_atomic_check_acquire(struct nv50_wndw *wndw, bool modeset,
 {
 	struct nouveau_framebuffer *fb = nouveau_framebuffer(asyw->state.fb);
 	struct nouveau_drm *drm = nouveau_drm(wndw->plane.dev);
+	uint8_t kind;
+	uint32_t tile_mode;
 	int ret;
 
 	NV_ATOMIC(drm, "%s acquire\n", wndw->plane.name);
 
 	if (asyw->state.fb != armw->state.fb || !armw->visible || modeset) {
+		nouveau_framebuffer_get_layout(&fb->base, &tile_mode, &kind);
+
 		asyw->image.w = fb->base.width;
 		asyw->image.h = fb->base.height;
-		asyw->image.kind = fb->nvbo->kind;
+		asyw->image.kind = kind;
 
 		ret = nv50_wndw_atomic_check_acquire_rgb(asyw);
 		if (ret) {
@@ -255,9 +263,9 @@ nv50_wndw_atomic_check_acquire(struct nv50_wndw *wndw, bool modeset,
 		if (asyw->image.kind) {
 			asyw->image.layout = 0;
 			if (drm->client.device.info.chipset >= 0xc0)
-				asyw->image.blockh = fb->nvbo->mode >> 4;
+				asyw->image.blockh = tile_mode >> 4;
 			else
-				asyw->image.blockh = fb->nvbo->mode;
+				asyw->image.blockh = tile_mode;
 			asyw->image.blocks[0] = fb->base.pitches[0] / 64;
 			asyw->image.pitch[0] = 0;
 		} else {
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 4273d9387cda..da8319182cf0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -224,6 +224,76 @@ static const struct drm_framebuffer_funcs nouveau_framebuffer_funcs = {
 	.create_handle = nouveau_user_framebuffer_create_handle,
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
@@ -304,6 +374,8 @@ nouveau_framebuffer_new(struct drm_device *dev,
 	struct nouveau_framebuffer *fb;
 	const struct drm_format_info *info;
 	unsigned int width, height, i;
+	uint32_t tile_mode;
+	uint8_t kind;
 	int ret;
 
         /* YUV overlays have special requirements pre-NV50 */
@@ -326,6 +398,18 @@ nouveau_framebuffer_new(struct drm_device *dev,
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
@@ -336,11 +420,11 @@ nouveau_framebuffer_new(struct drm_device *dev,
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
@@ -356,6 +440,7 @@ nouveau_framebuffer_new(struct drm_device *dev,
 
 	drm_helper_mode_fill_fb_struct(dev, &fb->base, mode_cmd);
 	fb->nvbo = nvbo;
+	fb->base.obj[0] = &nvbo->bo.base;
 
 	ret = drm_framebuffer_init(dev, &fb->base, &nouveau_framebuffer_funcs);
 	if (ret)
@@ -632,6 +717,7 @@ nouveau_display_create(struct drm_device *dev)
 
 	dev->mode_config.preferred_depth = 24;
 	dev->mode_config.prefer_shadow = 1;
+	dev->mode_config.allow_fb_modifiers = true;
 
 	if (drm->client.device.info.chipset < 0x11)
 		dev->mode_config.async_page_flip = false;
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
index c54682f00b01..3051a6603653 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.h
+++ b/drivers/gpu/drm/nouveau/nouveau_display.h
@@ -76,6 +76,10 @@ int  nouveau_display_dumb_map_offset(struct drm_file *, struct drm_device *,
 
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
