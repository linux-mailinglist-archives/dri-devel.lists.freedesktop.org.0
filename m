Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E793D88D0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 09:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9B76E245;
	Wed, 28 Jul 2021 07:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534F16E245
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 07:29:11 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 83844690-ef75-11eb-9082-0050568c148b;
 Wed, 28 Jul 2021 07:29:16 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 27179194B0F;
 Wed, 28 Jul 2021 09:29:30 +0200 (CEST)
Date: Wed, 28 Jul 2021 09:29:07 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH 13/14] drm/kmb: Enable alpha blended second plane
Message-ID: <YQEHQ56Qwl0GzvKg@ravnborg.org>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
 <20210728003126.1425028-13-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728003126.1425028-13-anitha.chrisanthus@intel.com>
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
Cc: edmund.j.dea@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Anitha,
On Tue, Jul 27, 2021 at 05:31:25PM -0700, Anitha Chrisanthus wrote:
> From: Edmund Dea <edmund.j.dea@intel.com>
> 
> Enable one additional plane that is alpha blended on top
> of the primary plane.
> 
> Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>
Your s-o-b is missing.

With this fixed:
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/kmb/kmb_drv.c   |  8 ++--
>  drivers/gpu/drm/kmb/kmb_plane.c | 81 +++++++++++++++++++++++++++++----
>  drivers/gpu/drm/kmb/kmb_plane.h |  5 +-
>  drivers/gpu/drm/kmb/kmb_regs.h  |  3 ++
>  4 files changed, 82 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
> index 12f35c43d838..d0de1db03493 100644
> --- a/drivers/gpu/drm/kmb/kmb_drv.c
> +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> @@ -173,10 +173,10 @@ static int kmb_setup_mode_config(struct drm_device *drm)
>  	ret = drmm_mode_config_init(drm);
>  	if (ret)
>  		return ret;
> -	drm->mode_config.min_width = KMB_MIN_WIDTH;
> -	drm->mode_config.min_height = KMB_MIN_HEIGHT;
> -	drm->mode_config.max_width = KMB_MAX_WIDTH;
> -	drm->mode_config.max_height = KMB_MAX_HEIGHT;
> +	drm->mode_config.min_width = KMB_FB_MIN_WIDTH;
> +	drm->mode_config.min_height = KMB_FB_MIN_HEIGHT;
> +	drm->mode_config.max_width = KMB_FB_MAX_WIDTH;
> +	drm->mode_config.max_height = KMB_FB_MAX_HEIGHT;
>  	drm->mode_config.funcs = &kmb_mode_config_funcs;
>  
>  	ret = kmb_setup_crtc(drm);
> diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
> index 4523af949ea1..cbe4e981d73e 100644
> --- a/drivers/gpu/drm/kmb/kmb_plane.c
> +++ b/drivers/gpu/drm/kmb/kmb_plane.c
> @@ -118,9 +118,10 @@ static int kmb_plane_atomic_check(struct drm_plane *plane,
>  	if (ret)
>  		return ret;
>  
> -	if (new_plane_state->crtc_w > KMB_MAX_WIDTH || new_plane_state->crtc_h > KMB_MAX_HEIGHT)
> -		return -EINVAL;
> -	if (new_plane_state->crtc_w < KMB_MIN_WIDTH || new_plane_state->crtc_h < KMB_MIN_HEIGHT)
> +	if (new_plane_state->crtc_w > KMB_FB_MAX_WIDTH ||
> +	    new_plane_state->crtc_h > KMB_FB_MAX_HEIGHT ||
> +	    new_plane_state->crtc_w < KMB_FB_MIN_WIDTH ||
> +	    new_plane_state->crtc_h < KMB_FB_MIN_HEIGHT)
>  		return -EINVAL;
>  
>  	/* Due to HW limitations, changing plane height or width after
> @@ -311,6 +312,44 @@ static void config_csc(struct kmb_drm_private *kmb, int plane_id)
>  	kmb_write_lcd(kmb, LCD_LAYERn_CSC_OFF3(plane_id), csc_coef_lcd[11]);
>  }
>  
> +static void kmb_plane_set_alpha(struct kmb_drm_private *kmb,
> +				const struct drm_plane_state *state,
> +				unsigned char plane_id,
> +				unsigned int *val)
> +{
> +	u16 plane_alpha = state->alpha;
> +	u16 pixel_blend_mode = state->pixel_blend_mode;
> +	int has_alpha = state->fb->format->has_alpha;
> +
> +	if (plane_alpha != DRM_BLEND_ALPHA_OPAQUE)
> +		*val |= LCD_LAYER_ALPHA_STATIC;
> +
> +	if (has_alpha) {
> +		switch (pixel_blend_mode) {
> +		case DRM_MODE_BLEND_PIXEL_NONE:
> +			break;
> +		case DRM_MODE_BLEND_PREMULTI:
> +			*val |= LCD_LAYER_ALPHA_EMBED | LCD_LAYER_ALPHA_PREMULT;
> +			break;
> +		case DRM_MODE_BLEND_COVERAGE:
> +			*val |= LCD_LAYER_ALPHA_EMBED;
> +			break;
> +		default:
> +			DRM_DEBUG("Missing pixel blend mode case (%s == %ld)\n",
> +				  __stringify(pixel_blend_mode),
> +				  (long)pixel_blend_mode);
> +			break;
> +		}
> +	}
> +
> +	if (plane_alpha == DRM_BLEND_ALPHA_OPAQUE && !has_alpha) {
> +		*val &= LCD_LAYER_ALPHA_DISABLED;
> +		return;
> +	}
> +
> +	kmb_write_lcd(kmb, LCD_LAYERn_ALPHA(plane_id), plane_alpha);
> +}
> +
>  static void kmb_plane_atomic_update(struct drm_plane *plane,
>  				    struct drm_atomic_state *state)
>  {
> @@ -341,11 +380,12 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
>  	fb = new_plane_state->fb;
>  	if (!fb)
>  		return;
> +
>  	num_planes = fb->format->num_planes;
>  	kmb_plane = to_kmb_plane(plane);
> -	plane_id = kmb_plane->id;
>  
>  	kmb = to_kmb(plane->dev);
> +	plane_id = kmb_plane->id;
>  
>  	spin_lock_irq(&kmb->irq_lock);
>  	if (kmb->kmb_under_flow || kmb->kmb_flush_done) {
> @@ -467,20 +507,32 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
>  		config_csc(kmb, plane_id);
>  	}
>  
> +	kmb_plane_set_alpha(kmb, plane->state, plane_id, &val);
> +
>  	kmb_write_lcd(kmb, LCD_LAYERn_CFG(plane_id), val);
>  
> +	/* Configure LCD_CONTROL */
> +	ctrl = kmb_read_lcd(kmb, LCD_CONTROL);
> +
> +	/* Set layer blending config */
> +	ctrl &= ~LCD_CTRL_ALPHA_ALL;
> +	ctrl |= LCD_CTRL_ALPHA_BOTTOM_VL1 |
> +		LCD_CTRL_ALPHA_BLEND_VL2;
> +
> +	ctrl &= ~LCD_CTRL_ALPHA_BLEND_BKGND_DISABLE;
> +
>  	switch (plane_id) {
>  	case LAYER_0:
> -		ctrl = LCD_CTRL_VL1_ENABLE;
> +		ctrl |= LCD_CTRL_VL1_ENABLE;
>  		break;
>  	case LAYER_1:
> -		ctrl = LCD_CTRL_VL2_ENABLE;
> +		ctrl |= LCD_CTRL_VL2_ENABLE;
>  		break;
>  	case LAYER_2:
> -		ctrl = LCD_CTRL_GL1_ENABLE;
> +		ctrl |= LCD_CTRL_GL1_ENABLE;
>  		break;
>  	case LAYER_3:
> -		ctrl = LCD_CTRL_GL2_ENABLE;
> +		ctrl |= LCD_CTRL_GL2_ENABLE;
>  		break;
>  	}
>  
> @@ -492,7 +544,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
>  	 */
>  	ctrl |= LCD_CTRL_VHSYNC_IDLE_LVL;
>  
> -	kmb_set_bitmask_lcd(kmb, LCD_CONTROL, ctrl);
> +	kmb_write_lcd(kmb, LCD_CONTROL, ctrl);
>  
>  	/* Enable pipeline AXI read transactions for the DMA
>  	 * after setting graphics layers. This must be done
> @@ -567,6 +619,9 @@ struct kmb_plane *kmb_plane_init(struct drm_device *drm)
>  	enum drm_plane_type plane_type;
>  	const u32 *plane_formats;
>  	int num_plane_formats;
> +	unsigned int blend_caps = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> +				  BIT(DRM_MODE_BLEND_PREMULTI)   |
> +				  BIT(DRM_MODE_BLEND_COVERAGE);
>  
>  	for (i = 0; i < KMB_MAX_PLANES; i++) {
>  		plane = drmm_kzalloc(drm, sizeof(*plane), GFP_KERNEL);
> @@ -598,8 +653,16 @@ struct kmb_plane *kmb_plane_init(struct drm_device *drm)
>  		drm_dbg(drm, "%s : %d i=%d type=%d",
>  			__func__, __LINE__,
>  			  i, plane_type);
> +		drm_plane_create_alpha_property(&plane->base_plane);
> +
> +		drm_plane_create_blend_mode_property(&plane->base_plane,
> +						     blend_caps);
> +
> +		drm_plane_create_zpos_immutable_property(&plane->base_plane, i);
> +
>  		drm_plane_helper_add(&plane->base_plane,
>  				     &kmb_plane_helper_funcs);
> +
>  		if (plane_type == DRM_PLANE_TYPE_PRIMARY) {
>  			primary = plane;
>  			kmb->plane = plane;
> diff --git a/drivers/gpu/drm/kmb/kmb_plane.h b/drivers/gpu/drm/kmb/kmb_plane.h
> index 99207b35365c..b51144044fe8 100644
> --- a/drivers/gpu/drm/kmb/kmb_plane.h
> +++ b/drivers/gpu/drm/kmb/kmb_plane.h
> @@ -35,6 +35,9 @@
>  #define POSSIBLE_CRTCS 1
>  #define to_kmb_plane(x) container_of(x, struct kmb_plane, base_plane)
>  
> +#define POSSIBLE_CRTCS		1
> +#define KMB_MAX_PLANES		2
> +
>  enum layer_id {
>  	LAYER_0,
>  	LAYER_1,
> @@ -43,8 +46,6 @@ enum layer_id {
>  	/* KMB_MAX_PLANES */
>  };
>  
> -#define KMB_MAX_PLANES 1
> -
>  enum sub_plane_id {
>  	Y_PLANE,
>  	U_PLANE,
> diff --git a/drivers/gpu/drm/kmb/kmb_regs.h b/drivers/gpu/drm/kmb/kmb_regs.h
> index 48150569f702..9756101b0d32 100644
> --- a/drivers/gpu/drm/kmb/kmb_regs.h
> +++ b/drivers/gpu/drm/kmb/kmb_regs.h
> @@ -43,8 +43,10 @@
>  #define LCD_CTRL_OUTPUT_ENABLED			  BIT(19)
>  #define LCD_CTRL_BPORCH_ENABLE			  BIT(21)
>  #define LCD_CTRL_FPORCH_ENABLE			  BIT(22)
> +#define LCD_CTRL_ALPHA_BLEND_BKGND_DISABLE	  BIT(23)
>  #define LCD_CTRL_PIPELINE_DMA			  BIT(28)
>  #define LCD_CTRL_VHSYNC_IDLE_LVL		  BIT(31)
> +#define LCD_CTRL_ALPHA_ALL			  (0xff << 6)
>  
>  /* interrupts */
>  #define LCD_INT_STATUS				(0x4 * 0x001)
> @@ -115,6 +117,7 @@
>  #define LCD_LAYER_ALPHA_EMBED			BIT(5)
>  #define LCD_LAYER_ALPHA_COMBI			(LCD_LAYER_ALPHA_STATIC | \
>  						      LCD_LAYER_ALPHA_EMBED)
> +#define LCD_LAYER_ALPHA_DISABLED		~(LCD_LAYER_ALPHA_COMBI)
>  /* RGB multiplied with alpha */
>  #define LCD_LAYER_ALPHA_PREMULT			BIT(6)
>  #define LCD_LAYER_INVERT_COL			BIT(7)
> -- 
> 2.25.1
