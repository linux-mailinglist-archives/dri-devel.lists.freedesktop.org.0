Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B08E11E760
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 17:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB856EAE4;
	Fri, 13 Dec 2019 16:00:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4206EA89
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:59:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 2544A292DC0
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv4 36/36] drm/rockchip: Add support for afbc
Date: Fri, 13 Dec 2019 16:59:07 +0100
Message-Id: <20191213155907.16581-37-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213155907.16581-1-andrzej.p@collabora.com>
References: <20191213155907.16581-1-andrzej.p@collabora.com>
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, kernel@collabora.com,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 James Wang <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds support for afbc handling. afbc is a compressed format
which reduces the necessary memory bandwidth.

Co-developed-by: Mark Yao <mark.yao@rock-chips.com>
Signed-off-by: Mark Yao <mark.yao@rock-chips.com>
Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c  | 100 +++++++++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 141 +++++++++++++++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h |  12 ++
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c |  84 +++++++++++-
 4 files changed, 331 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
index 28ce3a335798..0c4014763356 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
@@ -18,6 +18,7 @@
 #include "rockchip_drm_fb.h"
 #include "rockchip_drm_gem.h"
 
+#define ROCKCHIP_MAX_AFBC_WIDTH	2560
 
 static const struct drm_framebuffer_funcs rockchip_drm_fb_funcs = {
 	.destroy       = drm_gem_fb_destroy,
@@ -25,17 +26,60 @@ static const struct drm_framebuffer_funcs rockchip_drm_fb_funcs = {
 	.dirty	       = drm_atomic_helper_dirtyfb,
 };
 
+static int rockchip_afbc_post_check(struct drm_afbc *afbc)
+{
+	if (afbc->offset) {
+		DRM_WARN("AFBC plane offset must be zero!\n");
+		return -EINVAL;
+	}
+
+	if (afbc->block_width != 16 || afbc->block_height != 16) {
+		DRM_WARN("Unsupported AFBC block w/h [%d/%d]\n",
+			 afbc->block_width, afbc->block_height);
+		return -EINVAL;
+	}
+
+	if (afbc->aligned_width > ROCKCHIP_MAX_AFBC_WIDTH) {
+		DRM_WARN("Unsupported width %d>%d\n",
+			 afbc->aligned_width, ROCKCHIP_MAX_AFBC_WIDTH);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static struct drm_framebuffer *
 rockchip_fb_alloc(struct drm_device *dev, const struct drm_mode_fb_cmd2 *mode_cmd,
 		  struct drm_gem_object **obj, unsigned int num_planes)
 {
 	struct drm_framebuffer *fb;
+	struct drm_size_check check = { 0 };
 	int ret;
 
-	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
+	fb = drm_gem_fb_alloc_with_afbc();
 	if (!fb)
 		return ERR_PTR(-ENOMEM);
 
+	if (drm_is_afbc(mode_cmd->modifier[0])) {
+		const struct drm_format_info *info =
+			drm_get_format_info(dev, mode_cmd);
+
+		fb->afbc_info->bpp = info->cpp[0] * 8;
+		check.data = fb->afbc_info;
+	}
+
+	ret = drm_gem_fb_size_check_special(dev, mode_cmd, &check, obj);
+	if (ret) {
+		kfree(fb);
+		return ERR_PTR(ret);
+	}
+
+	if (drm_is_afbc(mode_cmd->modifier[0]))
+		if (rockchip_afbc_post_check(fb->afbc_info)) {
+			kfree(fb);
+			return ERR_PTR(-EINVAL);
+		}
+
 	ret = drm_gem_fb_init_with_funcs(fb, dev, mode_cmd, obj, num_planes,
 					 &rockchip_drm_fb_funcs);
 	if (ret) {
@@ -50,8 +94,60 @@ static const struct drm_mode_config_helper_funcs rockchip_mode_config_helpers =
 	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
 };
 
+
+static struct drm_framebuffer *
+rockchip_fb_create(struct drm_device *dev, struct drm_file *file,
+		   const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	struct drm_framebuffer *fb;
+	struct drm_size_check check = { 0 };
+	struct drm_gem_object *objs[4];
+	int ret, i, num_planes;
+
+	fb = drm_gem_fb_alloc_with_afbc();
+	if (!fb)
+		return ERR_PTR(-ENOMEM);
+
+	if (drm_is_afbc(mode_cmd->modifier[0])) {
+		const struct drm_format_info *info =
+			drm_get_format_info(dev, mode_cmd);
+
+		fb->afbc_info->bpp = info->cpp[0] * 8;
+		check.data = fb->afbc_info;
+	}
+
+	ret = drm_gem_fb_lookup(dev, file, mode_cmd, objs);
+	if (ret < 0)
+		goto err_free;
+	num_planes = ret;
+
+	ret = drm_gem_fb_size_check_special(dev, mode_cmd, &check, objs);
+	if (ret)
+		goto err_cleanup;
+
+	if (drm_is_afbc(mode_cmd->modifier[0]))
+		if (rockchip_afbc_post_check(fb->afbc_info)) {
+			ret = -EINVAL;
+			goto err_cleanup;
+		}
+
+	ret = drm_gem_fb_init_with_funcs(fb, dev, mode_cmd, objs, num_planes,
+					 &rockchip_drm_fb_funcs);
+	if (ret)
+		goto err_cleanup;
+
+	return fb;
+
+err_cleanup:
+	for (i = 0; i < num_planes; ++i)
+		drm_gem_object_put_unlocked(objs[i]);
+err_free:
+	kfree(fb);
+	return ERR_PTR(ret);
+}
+
 static const struct drm_mode_config_funcs rockchip_drm_mode_config_funcs = {
-	.fb_create = drm_gem_fb_create_with_dirty,
+	.fb_create = rockchip_fb_create,
 	.output_poll_changed = drm_fb_helper_output_poll_changed,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index d04b3492bdac..745d1e8e6d3c 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -91,9 +91,22 @@
 #define VOP_WIN_TO_INDEX(vop_win) \
 	((vop_win) - (vop_win)->vop->win)
 
+#define VOP_AFBC_SET(vop, name, v) \
+	do { \
+		if ((vop)->data->afbc) \
+			vop_reg_set((vop), &(vop)->data->afbc->name, \
+				0, ~0, v, #name); \
+	} while (0)
+
 #define to_vop(x) container_of(x, struct vop, crtc)
 #define to_vop_win(x) container_of(x, struct vop_win, base)
 
+#define AFBC_FMT_RGB565		0x0
+#define AFBC_FMT_U8U8U8U8	0x5
+#define AFBC_FMT_U8U8U8		0x4
+
+#define AFBC_TILE_16x16		BIT(4)
+
 /*
  * The coefficients of the following matrix are all fixed points.
  * The format is S2.10 for the 3x3 part of the matrix, and S9.12 for the offsets.
@@ -166,6 +179,7 @@ struct vop {
 	/* optional internal rgb encoder */
 	struct rockchip_rgb *rgb;
 
+	struct vop_win *afbc_win;
 	struct vop_win win[];
 };
 
@@ -274,6 +288,29 @@ static enum vop_data_format vop_convert_format(uint32_t format)
 	}
 }
 
+static int vop_convert_afbc_format(uint32_t format)
+{
+	switch (format) {
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ABGR8888:
+		return AFBC_FMT_U8U8U8U8;
+	case DRM_FORMAT_RGB888:
+	case DRM_FORMAT_BGR888:
+		return AFBC_FMT_U8U8U8;
+	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_BGR565:
+		return AFBC_FMT_RGB565;
+	/* either of the below should not be reachable */
+	default:
+		DRM_WARN_ONCE("unsupported AFBC format[%08x]\n", format);
+		return -EINVAL;
+	}
+
+	return -EINVAL;
+}
+
 static uint16_t scl_vop_cal_scale(enum scale_mode mode, uint32_t src,
 				  uint32_t dst, bool is_horizontal,
 				  int vsu_mode, int *vskiplines)
@@ -598,6 +635,15 @@ static int vop_enable(struct drm_crtc *crtc, struct drm_crtc_state *old_state)
 			vop_win_disable(vop, vop_win);
 		}
 	}
+
+	if (vop->data->afbc) {
+		/*
+		 * Disable AFBC and forget there was a vop window with AFBC
+		 */
+		VOP_AFBC_SET(vop, enable, 0);
+		vop->afbc_win = NULL;
+	}
+
 	spin_unlock(&vop->reg_lock);
 
 	vop_cfg_done(vop);
@@ -710,6 +756,39 @@ static void vop_plane_destroy(struct drm_plane *plane)
 	drm_plane_cleanup(plane);
 }
 
+static bool rockchip_afbc(u64 modifier)
+{
+	return modifier ==
+		DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_16x16 |
+		AFBC_FORMAT_MOD_SPARSE);
+}
+
+static bool rockchip_mod_supported(struct drm_plane *plane,
+				   u32 format, u64 modifier)
+{
+	const struct drm_format_info *info;
+
+	if (WARN_ON(modifier == DRM_FORMAT_MOD_INVALID))
+		return false;
+
+	if (modifier == DRM_FORMAT_MOD_LINEAR)
+		return true;
+
+	if (!rockchip_afbc(modifier)) {
+		DRM_DEBUG_KMS("Unsupported format modifer 0x%llx\n", modifier);
+
+		return false;
+	}
+
+	info = drm_format_info(format);
+	if (info->num_planes != 1) {
+		DRM_DEBUG_KMS("AFBC buffers expect one plane\n");
+		return false;
+	}
+
+	return true;
+}
+
 static int vop_plane_atomic_check(struct drm_plane *plane,
 			   struct drm_plane_state *state)
 {
@@ -758,6 +837,32 @@ static int vop_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
+	if (rockchip_afbc(fb->modifier)) {
+		struct vop *vop = to_vop(crtc);
+
+		if (!vop->data->afbc) {
+			DRM_ERROR("vop does not support AFBC\n");
+			return -EINVAL;
+		}
+
+		ret = vop_convert_afbc_format(fb->format->format);
+		if (ret < 0)
+			return ret;
+
+		if (state->src.x1 || state->src.y1) {
+			DRM_ERROR("afbc does not support offset display\n");
+			DRM_ERROR("xpos=%d, ypos=%d, offset=%d\n",
+				  state->src.x1, state->src.y1, fb->offsets[0]);
+			return -EINVAL;
+		}
+
+		if (state->rotation && state->rotation != DRM_MODE_ROTATE_0) {
+			DRM_ERROR("afbc does not support rotation\n");
+			DRM_ERROR("rotation=%d\n", state->rotation);
+			return -EINVAL;
+		}
+	}
+
 	return 0;
 }
 
@@ -773,6 +878,11 @@ static void vop_plane_atomic_disable(struct drm_plane *plane,
 	spin_lock(&vop->reg_lock);
 
 	vop_win_disable(vop, vop_win);
+	/*
+	 * Forget about the AFBC window if it is being disabled
+	 */
+	if (vop_win == vop->afbc_win)
+		vop->afbc_win = NULL;
 
 	spin_unlock(&vop->reg_lock);
 }
@@ -812,6 +922,13 @@ static void vop_plane_atomic_update(struct drm_plane *plane,
 	if (WARN_ON(!vop->is_enabled))
 		return;
 
+	/*
+	 * If updating the AFBC window then assume that
+	 * after the update there will be no AFBC window.
+	 */
+	if (vop_win == vop->afbc_win)
+		vop->afbc_win = NULL;
+
 	if (!state->visible) {
 		vop_plane_atomic_disable(plane, old_state);
 		return;
@@ -846,6 +963,21 @@ static void vop_plane_atomic_update(struct drm_plane *plane,
 
 	spin_lock(&vop->reg_lock);
 
+	if (rockchip_afbc(fb->modifier)) {
+		int afbc_format = vop_convert_afbc_format(fb->format->format);
+
+		VOP_AFBC_SET(vop, format, afbc_format | AFBC_TILE_16x16);
+		VOP_AFBC_SET(vop, hreg_block_split, 0);
+		VOP_AFBC_SET(vop, win_sel, VOP_WIN_TO_INDEX(vop_win));
+		VOP_AFBC_SET(vop, hdr_ptr, dma_addr);
+		VOP_AFBC_SET(vop, pic_size, act_info);
+
+		/*
+		 * The window being udated becomes the AFBC window
+		 */
+		vop->afbc_win = vop_win;
+	}
+
 	VOP_WIN_SET(vop, win, format, format);
 	VOP_WIN_SET(vop, win, yrgb_vir, DIV_ROUND_UP(fb->pitches[0], 4));
 	VOP_WIN_SET(vop, win, yrgb_mst, dma_addr);
@@ -1001,6 +1133,7 @@ static const struct drm_plane_funcs vop_plane_funcs = {
 	.reset = drm_atomic_helper_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
+	.format_mod_supported = rockchip_mod_supported,
 };
 
 static int vop_crtc_enable_vblank(struct drm_crtc *crtc)
@@ -1340,6 +1473,8 @@ static void vop_crtc_atomic_flush(struct drm_crtc *crtc,
 
 	spin_lock(&vop->reg_lock);
 
+	/* Enable AFBC if there is some AFBC window, disable otherwise. */
+	VOP_AFBC_SET(vop, enable, vop->afbc_win != NULL);
 	vop_cfg_done(vop);
 
 	spin_unlock(&vop->reg_lock);
@@ -1634,7 +1769,8 @@ static int vop_create_crtc(struct vop *vop)
 					       0, &vop_plane_funcs,
 					       win_data->phy->data_formats,
 					       win_data->phy->nformats,
-					       NULL, win_data->type, NULL);
+					       win_data->phy->format_modifiers,
+					       win_data->type, NULL);
 		if (ret) {
 			DRM_DEV_ERROR(vop->dev, "failed to init plane %d\n",
 				      ret);
@@ -1678,7 +1814,8 @@ static int vop_create_crtc(struct vop *vop)
 					       &vop_plane_funcs,
 					       win_data->phy->data_formats,
 					       win_data->phy->nformats,
-					       NULL, win_data->type, NULL);
+					       win_data->phy->format_modifiers,
+					       win_data->type, NULL);
 		if (ret) {
 			DRM_DEV_ERROR(vop->dev, "failed to init overlay %d\n",
 				      ret);
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
index 0b3d18c457b2..3f4e88a783d2 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
@@ -34,6 +34,16 @@ struct vop_reg {
 	bool relaxed;
 };
 
+struct vop_afbc {
+	struct vop_reg enable;
+	struct vop_reg win_sel;
+	struct vop_reg format;
+	struct vop_reg hreg_block_split;
+	struct vop_reg pic_size;
+	struct vop_reg hdr_ptr;
+	struct vop_reg rstn;
+};
+
 struct vop_modeset {
 	struct vop_reg htotal_pw;
 	struct vop_reg hact_st_end;
@@ -134,6 +144,7 @@ struct vop_win_phy {
 	const struct vop_scl_regs *scl;
 	const uint32_t *data_formats;
 	uint32_t nformats;
+	const uint64_t *format_modifiers;
 
 	struct vop_reg enable;
 	struct vop_reg gate;
@@ -173,6 +184,7 @@ struct vop_data {
 	const struct vop_misc *misc;
 	const struct vop_modeset *modeset;
 	const struct vop_output *output;
+	const struct vop_afbc *afbc;
 	const struct vop_win_yuv2yuv_data *win_yuv2yuv;
 	const struct vop_win_data *win;
 	unsigned int win_size;
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index 7a9d979c8d5d..f0cf1b04591d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -50,6 +50,18 @@ static const uint32_t formats_win_full[] = {
 	DRM_FORMAT_NV24,
 };
 
+static const uint64_t format_modifiers_win_full[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID,
+};
+
+static const uint64_t format_modifiers_win_full_afbc[] = {
+	DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_16x16 |
+				AFBC_FORMAT_MOD_SPARSE),
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID,
+};
+
 static const uint32_t formats_win_lite[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
@@ -61,6 +73,11 @@ static const uint32_t formats_win_lite[] = {
 	DRM_FORMAT_BGR565,
 };
 
+static const uint64_t format_modifiers_win_lite[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID,
+};
+
 static const struct vop_scl_regs rk3036_win_scl = {
 	.scale_yrgb_x = VOP_REG(RK3036_WIN0_SCL_FACTOR_YRGB, 0xffff, 0x0),
 	.scale_yrgb_y = VOP_REG(RK3036_WIN0_SCL_FACTOR_YRGB, 0xffff, 16),
@@ -72,6 +89,7 @@ static const struct vop_win_phy rk3036_win0_data = {
 	.scl = &rk3036_win_scl,
 	.data_formats = formats_win_full,
 	.nformats = ARRAY_SIZE(formats_win_full),
+	.format_modifiers = format_modifiers_win_full,
 	.enable = VOP_REG(RK3036_SYS_CTRL, 0x1, 0),
 	.format = VOP_REG(RK3036_SYS_CTRL, 0x7, 3),
 	.rb_swap = VOP_REG(RK3036_SYS_CTRL, 0x1, 15),
@@ -87,6 +105,7 @@ static const struct vop_win_phy rk3036_win0_data = {
 static const struct vop_win_phy rk3036_win1_data = {
 	.data_formats = formats_win_lite,
 	.nformats = ARRAY_SIZE(formats_win_lite),
+	.format_modifiers = format_modifiers_win_lite,
 	.enable = VOP_REG(RK3036_SYS_CTRL, 0x1, 1),
 	.format = VOP_REG(RK3036_SYS_CTRL, 0x7, 6),
 	.rb_swap = VOP_REG(RK3036_SYS_CTRL, 0x1, 19),
@@ -153,6 +172,7 @@ static const struct vop_data rk3036_vop = {
 static const struct vop_win_phy rk3126_win1_data = {
 	.data_formats = formats_win_lite,
 	.nformats = ARRAY_SIZE(formats_win_lite),
+	.format_modifiers = format_modifiers_win_lite,
 	.enable = VOP_REG(RK3036_SYS_CTRL, 0x1, 1),
 	.format = VOP_REG(RK3036_SYS_CTRL, 0x7, 6),
 	.rb_swap = VOP_REG(RK3036_SYS_CTRL, 0x1, 19),
@@ -234,6 +254,7 @@ static const struct vop_win_phy px30_win0_data = {
 	.scl = &px30_win_scl,
 	.data_formats = formats_win_full,
 	.nformats = ARRAY_SIZE(formats_win_full),
+	.format_modifiers = format_modifiers_win_full,
 	.enable = VOP_REG(PX30_WIN0_CTRL0, 0x1, 0),
 	.format = VOP_REG(PX30_WIN0_CTRL0, 0x7, 1),
 	.rb_swap = VOP_REG(PX30_WIN0_CTRL0, 0x1, 12),
@@ -249,6 +270,7 @@ static const struct vop_win_phy px30_win0_data = {
 static const struct vop_win_phy px30_win1_data = {
 	.data_formats = formats_win_lite,
 	.nformats = ARRAY_SIZE(formats_win_lite),
+	.format_modifiers = format_modifiers_win_lite,
 	.enable = VOP_REG(PX30_WIN1_CTRL0, 0x1, 0),
 	.format = VOP_REG(PX30_WIN1_CTRL0, 0x7, 4),
 	.rb_swap = VOP_REG(PX30_WIN1_CTRL0, 0x1, 12),
@@ -261,6 +283,7 @@ static const struct vop_win_phy px30_win1_data = {
 static const struct vop_win_phy px30_win2_data = {
 	.data_formats = formats_win_lite,
 	.nformats = ARRAY_SIZE(formats_win_lite),
+	.format_modifiers = format_modifiers_win_lite,
 	.gate = VOP_REG(PX30_WIN2_CTRL0, 0x1, 4),
 	.enable = VOP_REG(PX30_WIN2_CTRL0, 0x1, 0),
 	.format = VOP_REG(PX30_WIN2_CTRL0, 0x3, 5),
@@ -316,6 +339,7 @@ static const struct vop_win_phy rk3066_win0_data = {
 	.scl = &rk3066_win_scl,
 	.data_formats = formats_win_full,
 	.nformats = ARRAY_SIZE(formats_win_full),
+	.format_modifiers = format_modifiers_win_full,
 	.enable = VOP_REG(RK3066_SYS_CTRL1, 0x1, 0),
 	.format = VOP_REG(RK3066_SYS_CTRL0, 0x7, 4),
 	.rb_swap = VOP_REG(RK3066_SYS_CTRL0, 0x1, 19),
@@ -332,6 +356,7 @@ static const struct vop_win_phy rk3066_win1_data = {
 	.scl = &rk3066_win_scl,
 	.data_formats = formats_win_full,
 	.nformats = ARRAY_SIZE(formats_win_full),
+	.format_modifiers = format_modifiers_win_full,
 	.enable = VOP_REG(RK3066_SYS_CTRL1, 0x1, 1),
 	.format = VOP_REG(RK3066_SYS_CTRL0, 0x7, 7),
 	.rb_swap = VOP_REG(RK3066_SYS_CTRL0, 0x1, 23),
@@ -347,6 +372,7 @@ static const struct vop_win_phy rk3066_win1_data = {
 static const struct vop_win_phy rk3066_win2_data = {
 	.data_formats = formats_win_lite,
 	.nformats = ARRAY_SIZE(formats_win_lite),
+	.format_modifiers = format_modifiers_win_lite,
 	.enable = VOP_REG(RK3066_SYS_CTRL1, 0x1, 2),
 	.format = VOP_REG(RK3066_SYS_CTRL0, 0x7, 10),
 	.rb_swap = VOP_REG(RK3066_SYS_CTRL0, 0x1, 27),
@@ -426,6 +452,7 @@ static const struct vop_win_phy rk3188_win0_data = {
 	.scl = &rk3188_win_scl,
 	.data_formats = formats_win_full,
 	.nformats = ARRAY_SIZE(formats_win_full),
+	.format_modifiers = format_modifiers_win_full,
 	.enable = VOP_REG(RK3188_SYS_CTRL, 0x1, 0),
 	.format = VOP_REG(RK3188_SYS_CTRL, 0x7, 3),
 	.rb_swap = VOP_REG(RK3188_SYS_CTRL, 0x1, 15),
@@ -440,6 +467,7 @@ static const struct vop_win_phy rk3188_win0_data = {
 static const struct vop_win_phy rk3188_win1_data = {
 	.data_formats = formats_win_lite,
 	.nformats = ARRAY_SIZE(formats_win_lite),
+	.format_modifiers = format_modifiers_win_lite,
 	.enable = VOP_REG(RK3188_SYS_CTRL, 0x1, 1),
 	.format = VOP_REG(RK3188_SYS_CTRL, 0x7, 6),
 	.rb_swap = VOP_REG(RK3188_SYS_CTRL, 0x1, 19),
@@ -545,6 +573,7 @@ static const struct vop_win_phy rk3288_win01_data = {
 	.scl = &rk3288_win_full_scl,
 	.data_formats = formats_win_full,
 	.nformats = ARRAY_SIZE(formats_win_full),
+	.format_modifiers = format_modifiers_win_full,
 	.enable = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 0),
 	.format = VOP_REG(RK3288_WIN0_CTRL0, 0x7, 1),
 	.rb_swap = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 12),
@@ -563,6 +592,7 @@ static const struct vop_win_phy rk3288_win01_data = {
 static const struct vop_win_phy rk3288_win23_data = {
 	.data_formats = formats_win_lite,
 	.nformats = ARRAY_SIZE(formats_win_lite),
+	.format_modifiers = format_modifiers_win_lite,
 	.enable = VOP_REG(RK3288_WIN2_CTRL0, 0x1, 4),
 	.gate = VOP_REG(RK3288_WIN2_CTRL0, 0x1, 0),
 	.format = VOP_REG(RK3288_WIN2_CTRL0, 0x7, 1),
@@ -677,6 +707,7 @@ static const struct vop_win_phy rk3368_win01_data = {
 	.scl = &rk3288_win_full_scl,
 	.data_formats = formats_win_full,
 	.nformats = ARRAY_SIZE(formats_win_full),
+	.format_modifiers = format_modifiers_win_full,
 	.enable = VOP_REG(RK3368_WIN0_CTRL0, 0x1, 0),
 	.format = VOP_REG(RK3368_WIN0_CTRL0, 0x7, 1),
 	.rb_swap = VOP_REG(RK3368_WIN0_CTRL0, 0x1, 12),
@@ -697,6 +728,7 @@ static const struct vop_win_phy rk3368_win01_data = {
 static const struct vop_win_phy rk3368_win23_data = {
 	.data_formats = formats_win_lite,
 	.nformats = ARRAY_SIZE(formats_win_lite),
+	.format_modifiers = format_modifiers_win_lite,
 	.gate = VOP_REG(RK3368_WIN2_CTRL0, 0x1, 0),
 	.enable = VOP_REG(RK3368_WIN2_CTRL0, 0x1, 4),
 	.format = VOP_REG(RK3368_WIN2_CTRL0, 0x3, 5),
@@ -817,6 +849,53 @@ static const struct vop_win_yuv2yuv_data rk3399_vop_big_win_yuv2yuv_data[] = {
 	  .y2r_en = VOP_REG(RK3399_YUV2YUV_WIN, 0x1, 9) },
 	{ .base = 0xC0, .phy = &rk3399_yuv2yuv_win23_data },
 	{ .base = 0x120, .phy = &rk3399_yuv2yuv_win23_data },
+
+};
+
+static const struct vop_win_phy rk3399_win01_data = {
+	.scl = &rk3288_win_full_scl,
+	.data_formats = formats_win_full,
+	.nformats = ARRAY_SIZE(formats_win_full),
+	.format_modifiers = format_modifiers_win_full_afbc,
+	.enable = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 0),
+	.format = VOP_REG(RK3288_WIN0_CTRL0, 0x7, 1),
+	.rb_swap = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 12),
+	.y_mir_en = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 22),
+	.act_info = VOP_REG(RK3288_WIN0_ACT_INFO, 0x1fff1fff, 0),
+	.dsp_info = VOP_REG(RK3288_WIN0_DSP_INFO, 0x0fff0fff, 0),
+	.dsp_st = VOP_REG(RK3288_WIN0_DSP_ST, 0x1fff1fff, 0),
+	.yrgb_mst = VOP_REG(RK3288_WIN0_YRGB_MST, 0xffffffff, 0),
+	.uv_mst = VOP_REG(RK3288_WIN0_CBR_MST, 0xffffffff, 0),
+	.yrgb_vir = VOP_REG(RK3288_WIN0_VIR, 0x3fff, 0),
+	.uv_vir = VOP_REG(RK3288_WIN0_VIR, 0x3fff, 16),
+	.src_alpha_ctl = VOP_REG(RK3288_WIN0_SRC_ALPHA_CTRL, 0xff, 0),
+	.dst_alpha_ctl = VOP_REG(RK3288_WIN0_DST_ALPHA_CTRL, 0xff, 0),
+};
+
+/*
+ * rk3399 vop big windows register layout is same as rk3288, but we
+ * have a separate rk3399 win data array here so that we can advertise
+ * AFBC on the primary plane.
+ */
+static const struct vop_win_data rk3399_vop_win_data[] = {
+	{ .base = 0x00, .phy = &rk3399_win01_data,
+	  .type = DRM_PLANE_TYPE_PRIMARY },
+	{ .base = 0x40, .phy = &rk3288_win01_data,
+	  .type = DRM_PLANE_TYPE_OVERLAY },
+	{ .base = 0x00, .phy = &rk3288_win23_data,
+	  .type = DRM_PLANE_TYPE_OVERLAY },
+	{ .base = 0x50, .phy = &rk3288_win23_data,
+	  .type = DRM_PLANE_TYPE_CURSOR },
+};
+
+static const struct vop_afbc rk3399_vop_afbc = {
+	.rstn = VOP_REG(RK3399_AFBCD0_CTRL, 0x1, 3),
+	.enable = VOP_REG(RK3399_AFBCD0_CTRL, 0x1, 0),
+	.win_sel = VOP_REG(RK3399_AFBCD0_CTRL, 0x3, 1),
+	.format = VOP_REG(RK3399_AFBCD0_CTRL, 0x1f, 16),
+	.hreg_block_split = VOP_REG(RK3399_AFBCD0_CTRL, 0x1, 21),
+	.hdr_ptr = VOP_REG(RK3399_AFBCD0_HDR_PTR, 0xffffffff, 0),
+	.pic_size = VOP_REG(RK3399_AFBCD0_PIC_SIZE, 0xffffffff, 0),
 };
 
 static const struct vop_data rk3399_vop_big = {
@@ -826,9 +905,10 @@ static const struct vop_data rk3399_vop_big = {
 	.common = &rk3288_common,
 	.modeset = &rk3288_modeset,
 	.output = &rk3399_output,
+	.afbc = &rk3399_vop_afbc,
 	.misc = &rk3368_misc,
-	.win = rk3368_vop_win_data,
-	.win_size = ARRAY_SIZE(rk3368_vop_win_data),
+	.win = rk3399_vop_win_data,
+	.win_size = ARRAY_SIZE(rk3399_vop_win_data),
 	.win_yuv2yuv = rk3399_vop_big_win_yuv2yuv_data,
 };
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
