Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D55CAF0398
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 21:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5DB110E644;
	Tue,  1 Jul 2025 19:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dXme7YXs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2627810E5FE;
 Tue,  1 Jul 2025 19:21:03 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5074C778;
 Tue,  1 Jul 2025 21:20:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1751397639;
 bh=7v+aPLcSt17X4u2LNmWrGBlNpKMSI1a1PMj7/xXhurY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dXme7YXsJxn+GUVHRLDTNqA6HkmazAmGRVa00oenY/lbM2R4Oih8FdjKYayzQj5Bb
 iNMm0C4WSEfQqYQxVgd14bnhxfkE0V/BGwor4+QdsQXqCAEB2vyFk2HtiT4ZB9INR7
 oB5HUAz4aJHtZmnMWtsM1Sx627pqgZctgxr+CYGk=
Date: Tue, 1 Jul 2025 22:20:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 07/19] drm/gem: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Message-ID: <20250701192035.GB17819@pendragon.ideasonboard.com>
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
 <20250701090722.13645-8-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250701090722.13645-8-ville.syrjala@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 01, 2025 at 12:07:10PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Pass along the format info from .fb_create() to aliminate the

s/aliminate/eliminate/

> redundant drm_get_format_info() calls from the gem fb code.
> 
> v2: Fix kernel docs (Laurent)
> 
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko Stübner" <heiko@sntech.de>
> Cc: Andy Yan <andy.yan@rock-chips.com>
> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: virtualization@lists.linux.dev
> Cc: spice-devel@lists.freedesktop.org
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 23 +++++++++-----------
>  drivers/gpu/drm/qxl/qxl_display.c            |  2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.c   |  3 ++-
>  drivers/gpu/drm/xen/xen_drm_front_kms.c      |  2 +-
>  include/drm/drm_gem_framebuffer_helper.h     |  2 ++
>  5 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index 6fe4094bd0fe..1d58b0259df4 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -68,6 +68,7 @@ EXPORT_SYMBOL_GPL(drm_gem_fb_get_obj);
>  static int
>  drm_gem_fb_init(struct drm_device *dev,
>  		 struct drm_framebuffer *fb,
> +		 const struct drm_format_info *info,
>  		 const struct drm_mode_fb_cmd2 *mode_cmd,
>  		 struct drm_gem_object **obj, unsigned int num_planes,
>  		 const struct drm_framebuffer_funcs *funcs)
> @@ -75,7 +76,7 @@ drm_gem_fb_init(struct drm_device *dev,
>  	unsigned int i;
>  	int ret;
>  
> -	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
> +	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
>  
>  	for (i = 0; i < num_planes; i++)
>  		fb->obj[i] = obj[i];
> @@ -136,6 +137,7 @@ EXPORT_SYMBOL(drm_gem_fb_create_handle);
>   * @dev: DRM device
>   * @fb: framebuffer object
>   * @file: DRM file that holds the GEM handle(s) backing the framebuffer
> + * @info: pixel format information
>   * @mode_cmd: Metadata from the userspace framebuffer creation request
>   * @funcs: vtable to be used for the new framebuffer object
>   *
> @@ -152,21 +154,14 @@ EXPORT_SYMBOL(drm_gem_fb_create_handle);
>  int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>  			       struct drm_framebuffer *fb,
>  			       struct drm_file *file,
> +			       const struct drm_format_info *info,
>  			       const struct drm_mode_fb_cmd2 *mode_cmd,
>  			       const struct drm_framebuffer_funcs *funcs)
>  {
> -	const struct drm_format_info *info;
>  	struct drm_gem_object *objs[DRM_FORMAT_MAX_PLANES];
>  	unsigned int i;
>  	int ret;
>  
> -	info = drm_get_format_info(dev, mode_cmd->pixel_format,
> -				   mode_cmd->modifier[0]);
> -	if (!info) {
> -		drm_dbg_kms(dev, "Failed to get FB format info\n");
> -		return -EINVAL;
> -	}
> -
>  	if (drm_drv_uses_atomic_modeset(dev) &&
>  	    !drm_any_plane_has_format(dev, mode_cmd->pixel_format,
>  				      mode_cmd->modifier[0])) {
> @@ -201,7 +196,7 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>  		}
>  	}
>  
> -	ret = drm_gem_fb_init(dev, fb, mode_cmd, objs, i, funcs);
> +	ret = drm_gem_fb_init(dev, fb, info, mode_cmd, objs, i, funcs);
>  	if (ret)
>  		goto err_gem_object_put;
>  
> @@ -222,6 +217,7 @@ EXPORT_SYMBOL_GPL(drm_gem_fb_init_with_funcs);
>   *                                  callback
>   * @dev: DRM device
>   * @file: DRM file that holds the GEM handle(s) backing the framebuffer
> + * @info: pixel format information
>   * @mode_cmd: Metadata from the userspace framebuffer creation request
>   * @funcs: vtable to be used for the new framebuffer object
>   *
> @@ -234,6 +230,7 @@ EXPORT_SYMBOL_GPL(drm_gem_fb_init_with_funcs);
>   */
>  struct drm_framebuffer *
>  drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
> +			     const struct drm_format_info *info,
>  			     const struct drm_mode_fb_cmd2 *mode_cmd,
>  			     const struct drm_framebuffer_funcs *funcs)
>  {
> @@ -244,7 +241,7 @@ drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
>  	if (!fb)
>  		return ERR_PTR(-ENOMEM);
>  
> -	ret = drm_gem_fb_init_with_funcs(dev, fb, file, mode_cmd, funcs);
> +	ret = drm_gem_fb_init_with_funcs(dev, fb, file, info, mode_cmd, funcs);
>  	if (ret) {
>  		kfree(fb);
>  		return ERR_PTR(ret);
> @@ -287,7 +284,7 @@ drm_gem_fb_create(struct drm_device *dev, struct drm_file *file,
>  		  const struct drm_format_info *info,
>  		  const struct drm_mode_fb_cmd2 *mode_cmd)
>  {
> -	return drm_gem_fb_create_with_funcs(dev, file, mode_cmd,
> +	return drm_gem_fb_create_with_funcs(dev, file, info, mode_cmd,
>  					    &drm_gem_fb_funcs);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_fb_create);
> @@ -327,7 +324,7 @@ drm_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
>  			     const struct drm_format_info *info,
>  			     const struct drm_mode_fb_cmd2 *mode_cmd)
>  {
> -	return drm_gem_fb_create_with_funcs(dev, file, mode_cmd,
> +	return drm_gem_fb_create_with_funcs(dev, file, info, mode_cmd,
>  					    &drm_gem_fb_funcs_dirtyfb);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_dirty);
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
> index f7bc83f2d489..ae7e572b1b4a 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -1179,7 +1179,7 @@ qxl_user_framebuffer_create(struct drm_device *dev,
>  			    const struct drm_format_info *info,
>  			    const struct drm_mode_fb_cmd2 *mode_cmd)
>  {
> -	return drm_gem_fb_create_with_funcs(dev, file_priv, mode_cmd,
> +	return drm_gem_fb_create_with_funcs(dev, file_priv, info, mode_cmd,
>  					    &qxl_fb_funcs);
>  }
>  
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> index f19113e5ae8f..d496ac0feb08 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> @@ -40,7 +40,8 @@ rockchip_fb_create(struct drm_device *dev, struct drm_file *file,
>  	if (!afbc_fb)
>  		return ERR_PTR(-ENOMEM);
>  
> -	ret = drm_gem_fb_init_with_funcs(dev, &afbc_fb->base, file, mode_cmd,
> +	ret = drm_gem_fb_init_with_funcs(dev, &afbc_fb->base,
> +					 file, info, mode_cmd,
>  					 &rockchip_drm_fb_funcs);
>  	if (ret) {
>  		kfree(afbc_fb);
> diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
> index a360003bee47..806ec66ee7f7 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
> @@ -62,7 +62,7 @@ fb_create(struct drm_device *dev, struct drm_file *filp,
>  	struct drm_gem_object *gem_obj;
>  	int ret;
>  
> -	fb = drm_gem_fb_create_with_funcs(dev, filp, mode_cmd, &fb_funcs);
> +	fb = drm_gem_fb_create_with_funcs(dev, filp, info, mode_cmd, &fb_funcs);
>  	if (IS_ERR(fb))
>  		return fb;
>  
> diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
> index 4fdf9d3d1863..971d266ab1ba 100644
> --- a/include/drm/drm_gem_framebuffer_helper.h
> +++ b/include/drm/drm_gem_framebuffer_helper.h
> @@ -25,10 +25,12 @@ int drm_gem_fb_create_handle(struct drm_framebuffer *fb, struct drm_file *file,
>  int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>  			       struct drm_framebuffer *fb,
>  			       struct drm_file *file,
> +			       const struct drm_format_info *info,
>  			       const struct drm_mode_fb_cmd2 *mode_cmd,
>  			       const struct drm_framebuffer_funcs *funcs);
>  struct drm_framebuffer *
>  drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
> +			     const struct drm_format_info *info,
>  			     const struct drm_mode_fb_cmd2 *mode_cmd,
>  			     const struct drm_framebuffer_funcs *funcs);
>  struct drm_framebuffer *

-- 
Regards,

Laurent Pinchart
