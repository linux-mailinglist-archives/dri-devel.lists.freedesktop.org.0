Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAC2165CA0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 12:20:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB18F6ED32;
	Thu, 20 Feb 2020 11:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4E46ED32
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 11:20:37 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 19A20294D6A;
 Thu, 20 Feb 2020 11:20:36 +0000 (GMT)
Date: Thu, 20 Feb 2020 12:20:32 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv5 34/34] drm/rockchip: Add support for afbc
Message-ID: <20200220122032.76d9bd7e@collabora.com>
In-Reply-To: <20191217145020.14645-35-andrzej.p@collabora.com>
References: <20191213173350.GJ624164@phenom.ffwll.local>
 <20191217145020.14645-1-andrzej.p@collabora.com>
 <20191217145020.14645-35-andrzej.p@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: kernel@collabora.com, Mihail Atanassov <mihail.atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 James Wang <james.qian.wang@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 17 Dec 2019 15:50:20 +0100
Andrzej Pietrasiewicz <andrzej.p@collabora.com> wrote:

>  static const struct drm_mode_config_funcs rockchip_drm_mode_config_funcs = {
> -	.fb_create = drm_gem_fb_create_with_dirty,
> +	.fb_create = rockchip_fb_create,
>  	.output_poll_changed = drm_fb_helper_output_poll_changed,
>  	.atomic_check = drm_atomic_helper_check,
>  	.atomic_commit = drm_atomic_helper_commit,
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index d04b3492bdac..ffe1e4b9a9ca 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -91,9 +91,21 @@
>  #define VOP_WIN_TO_INDEX(vop_win) \
>  	((vop_win) - (vop_win)->vop->win)
>  
> +#define VOP_AFBC_SET(vop, name, v) \
> +	do { \
> +		if ((vop)->data->afbc) \
> +			vop_reg_set((vop), &(vop)->data->afbc->name, 0, ~0, v, #name); \
> +	} while (0)
> +
>  #define to_vop(x) container_of(x, struct vop, crtc)
>  #define to_vop_win(x) container_of(x, struct vop_win, base)
>  
> +#define AFBC_FMT_RGB565		0x0
> +#define AFBC_FMT_U8U8U8U8	0x5
> +#define AFBC_FMT_U8U8U8		0x4
> +
> +#define AFBC_TILE_16x16		BIT(4)
> +
>  /*
>   * The coefficients of the following matrix are all fixed points.
>   * The format is S2.10 for the 3x3 part of the matrix, and S9.12 for the offsets.
> @@ -166,6 +178,7 @@ struct vop {
>  	/* optional internal rgb encoder */
>  	struct rockchip_rgb *rgb;
>  
> +	struct vop_win *afbc_win;

Looks like something that should be in the VOP specialized crtc_state.
Also, do we really need a vop_win pointer or can it be replaced by an
index directly?

>  	struct vop_win win[];
>  };
>  
> @@ -274,6 +287,29 @@ static enum vop_data_format vop_convert_format(uint32_t format)
>  	}
>  }
>  
> +static int vop_convert_afbc_format(uint32_t format)
> +{
> +	switch (format) {
> +	case DRM_FORMAT_XRGB8888:
> +	case DRM_FORMAT_ARGB8888:
> +	case DRM_FORMAT_XBGR8888:
> +	case DRM_FORMAT_ABGR8888:
> +		return AFBC_FMT_U8U8U8U8;
> +	case DRM_FORMAT_RGB888:
> +	case DRM_FORMAT_BGR888:
> +		return AFBC_FMT_U8U8U8;
> +	case DRM_FORMAT_RGB565:
> +	case DRM_FORMAT_BGR565:
> +		return AFBC_FMT_RGB565;
> +	/* either of the below should not be reachable */
> +	default:
> +		DRM_WARN_ONCE("unsupported AFBC format[%08x]\n", format);
> +		return -EINVAL;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  static uint16_t scl_vop_cal_scale(enum scale_mode mode, uint32_t src,
>  				  uint32_t dst, bool is_horizontal,
>  				  int vsu_mode, int *vskiplines)
> @@ -598,6 +634,15 @@ static int vop_enable(struct drm_crtc *crtc, struct drm_crtc_state *old_state)
>  			vop_win_disable(vop, vop_win);
>  		}
>  	}
> +
> +	if (vop->data->afbc) {
> +		/*
> +		 * Disable AFBC and forget there was a vop window with AFBC
> +		 */
> +		VOP_AFBC_SET(vop, enable, 0);
> +		vop->afbc_win = NULL;
> +	}
> +
>  	spin_unlock(&vop->reg_lock);
>  
>  	vop_cfg_done(vop);
> @@ -710,6 +755,37 @@ static void vop_plane_destroy(struct drm_plane *plane)
>  	drm_plane_cleanup(plane);
>  }
>  
> +static bool rockchip_afbc(u64 modifier)
> +{
> +	return modifier == DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_16x16 | AFBC_FORMAT_MOD_SPARSE);
> +}
> +
> +static bool rockchip_mod_supported(struct drm_plane *plane,
> +				   u32 format, u64 modifier)
> +{
> +	const struct drm_format_info *info;
> +
> +	if (WARN_ON(modifier == DRM_FORMAT_MOD_INVALID))
> +		return false;
> +
> +	if (modifier == DRM_FORMAT_MOD_LINEAR)
> +		return true;
> +
> +	if (!rockchip_afbc(modifier)) {
> +		DRM_DEBUG_KMS("Unsupported format modifer 0x%llx\n", modifier);
> +
> +		return false;
> +	}
> +
> +	info = drm_format_info(format);
> +	if (info->num_planes != 1) {
> +		DRM_DEBUG_KMS("AFBC buffers expect one plane\n");
> +		return false;
> +	}

Should we have a call to vop_convert_afbc_format() to make sure AFBC
can be applied to this specific format?

> +
> +	return true;
> +}
> +
>  static int vop_plane_atomic_check(struct drm_plane *plane,
>  			   struct drm_plane_state *state)
>  {
> @@ -719,10 +795,8 @@ static int vop_plane_atomic_check(struct drm_plane *plane,
>  	struct vop_win *vop_win = to_vop_win(plane);
>  	const struct vop_win_data *win = vop_win->data;
>  	int ret;
> -	int min_scale = win->phy->scl ? FRAC_16_16(1, 8) :
> -					DRM_PLANE_HELPER_NO_SCALING;
> -	int max_scale = win->phy->scl ? FRAC_16_16(8, 1) :
> -					DRM_PLANE_HELPER_NO_SCALING;
> +	int min_scale = win->phy->scl ? FRAC_16_16(1, 8) : DRM_PLANE_HELPER_NO_SCALING;
> +	int max_scale = win->phy->scl ? FRAC_16_16(8, 1) : DRM_PLANE_HELPER_NO_SCALING;

Looks like those coding-style fixes have nothing to do in this patch :).

>  
>  	if (!crtc || !fb)
>  		return 0;
> @@ -731,9 +805,7 @@ static int vop_plane_atomic_check(struct drm_plane *plane,
>  	if (WARN_ON(!crtc_state))
>  		return -EINVAL;
>  
> -	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
> -						  min_scale, max_scale,
> -						  true, true);
> +	ret = drm_atomic_helper_check_plane_state(state, crtc_state, min_scale, max_scale, true, true);

Same here, plus, following the 80 char rule when it doesn't hurt
readability is a good thing I think.

>  	if (ret)
>  		return ret;
>  
> @@ -758,6 +830,31 @@ static int vop_plane_atomic_check(struct drm_plane *plane,
>  		return -EINVAL;
>  	}
>  
> +	if (rockchip_afbc(fb->modifier)) {
> +		struct vop *vop = to_vop(crtc);
> +
> +		if (!vop->data->afbc) {
> +			DRM_ERROR("vop does not support AFBC\n");
> +			return -EINVAL;
> +		}
> +
> +		ret = vop_convert_afbc_format(fb->format->format);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (state->src.x1 || state->src.y1) {
> +			DRM_ERROR("afbc does not support offset display\n");
> +			DRM_ERROR("xpos=%d, ypos=%d, offset=%d\n", state->src.x1, state->src.y1, fb->offsets[0]);

Why splitting that in 2 error messages?

> +			return -EINVAL;
> +		}
> +
> +		if (state->rotation && state->rotation != DRM_MODE_ROTATE_0) {
> +			DRM_ERROR("afbc does not support rotation\n");
> +			DRM_ERROR("rotation=%d\n", state->rotation);

Ditto.

> +			return -EINVAL;
> +		}
> +	}
> +
>  	return 0;
>  }
>  
> @@ -773,6 +870,11 @@ static void vop_plane_atomic_disable(struct drm_plane *plane,
>  	spin_lock(&vop->reg_lock);
>  
>  	vop_win_disable(vop, vop_win);
> +	/*
> +	 * Forget about the AFBC window if it is being disabled
> +	 */
> +	if (vop_win == vop->afbc_win)
> +		vop->afbc_win = NULL;
>  
>  	spin_unlock(&vop->reg_lock);
>  }
> @@ -812,6 +914,13 @@ static void vop_plane_atomic_update(struct drm_plane *plane,
>  	if (WARN_ON(!vop->is_enabled))
>  		return;
>  
> +	/*
> +	 * If updating the AFBC window then assume that
> +	 * after the update there will be no AFBC window.
> +	 */
> +	if (vop_win == vop->afbc_win)
> +		vop->afbc_win = NULL;
> +
>  	if (!state->visible) {
>  		vop_plane_atomic_disable(plane, old_state);
>  		return;
> @@ -846,6 +955,21 @@ static void vop_plane_atomic_update(struct drm_plane *plane,
>  
>  	spin_lock(&vop->reg_lock);
>  
> +	if (rockchip_afbc(fb->modifier)) {
> +		int afbc_format = vop_convert_afbc_format(fb->format->format);
> +
> +		VOP_AFBC_SET(vop, format, afbc_format | AFBC_TILE_16x16);
> +		VOP_AFBC_SET(vop, hreg_block_split, 0);
> +		VOP_AFBC_SET(vop, win_sel, VOP_WIN_TO_INDEX(vop_win));

IIUC, only one plane can use AFBC at a given time, but you don't seem
to check the value of vop->afbc_win in your atomic_check. What happens
if the user tries to enable this modifier on 2+ planes?

> +		VOP_AFBC_SET(vop, hdr_ptr, dma_addr);
> +		VOP_AFBC_SET(vop, pic_size, act_info);
> +
> +		/*
> +		 * The window being udated becomes the AFBC window
> +		 */
> +		vop->afbc_win = vop_win;
> +	}
> +
>  	VOP_WIN_SET(vop, win, format, format);
>  	VOP_WIN_SET(vop, win, yrgb_vir, DIV_ROUND_UP(fb->pitches[0], 4));
>  	VOP_WIN_SET(vop, win, yrgb_mst, dma_addr);
> @@ -1001,6 +1125,7 @@ static const struct drm_plane_funcs vop_plane_funcs = {
>  	.reset = drm_atomic_helper_plane_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> +	.format_mod_supported = rockchip_mod_supported,
>  };
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
