Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A35B3AF005F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 18:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F96D10E5D5;
	Tue,  1 Jul 2025 16:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0526610E5D5
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 16:45:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 651182B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 09:45:42 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 733553F58B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 09:45:57 -0700 (PDT)
Date: Tue, 1 Jul 2025 17:45:55 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 06/19] drm/malidp: Pass along the format info from
 .fb_create() malidp_verify_afbc_framebuffer_size()
Message-ID: <aGQQwzHCsolkmrDN@e110455-lin.cambridge.arm.com>
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
 <20250701090722.13645-7-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250701090722.13645-7-ville.syrjala@linux.intel.com>
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

On Tue, Jul 01, 2025 at 12:07:09PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Plumb the format info from .fb_create() all the way to
> malidp_verify_afbc_framebuffer_size() to avoid the
> redundant lookup.
> 
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/malidp_drv.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
> index 8b920566f2e8..bc5f5e9798c3 100644
> --- a/drivers/gpu/drm/arm/malidp_drv.c
> +++ b/drivers/gpu/drm/arm/malidp_drv.c
> @@ -306,10 +306,10 @@ malidp_verify_afbc_framebuffer_caps(struct drm_device *dev,
>  static bool
>  malidp_verify_afbc_framebuffer_size(struct drm_device *dev,
>  				    struct drm_file *file,
> +				    const struct drm_format_info *info,
>  				    const struct drm_mode_fb_cmd2 *mode_cmd)
>  {
>  	int n_superblocks = 0;
> -	const struct drm_format_info *info;
>  	struct drm_gem_object *objs = NULL;
>  	u32 afbc_superblock_size = 0, afbc_superblock_height = 0;
>  	u32 afbc_superblock_width = 0, afbc_size = 0;
> @@ -325,9 +325,6 @@ malidp_verify_afbc_framebuffer_size(struct drm_device *dev,
>  		return false;
>  	}
>  
> -	info = drm_get_format_info(dev, mode_cmd->pixel_format,
> -				   mode_cmd->modifier[0]);
> -
>  	n_superblocks = (mode_cmd->width / afbc_superblock_width) *
>  		(mode_cmd->height / afbc_superblock_height);
>  
> @@ -367,10 +364,11 @@ malidp_verify_afbc_framebuffer_size(struct drm_device *dev,
>  
>  static bool
>  malidp_verify_afbc_framebuffer(struct drm_device *dev, struct drm_file *file,
> +			       const struct drm_format_info *info,
>  			       const struct drm_mode_fb_cmd2 *mode_cmd)
>  {
>  	if (malidp_verify_afbc_framebuffer_caps(dev, mode_cmd))
> -		return malidp_verify_afbc_framebuffer_size(dev, file, mode_cmd);
> +		return malidp_verify_afbc_framebuffer_size(dev, file, info, mode_cmd);
>  
>  	return false;
>  }
> @@ -381,7 +379,7 @@ malidp_fb_create(struct drm_device *dev, struct drm_file *file,
>  		 const struct drm_mode_fb_cmd2 *mode_cmd)
>  {
>  	if (mode_cmd->modifier[0]) {
> -		if (!malidp_verify_afbc_framebuffer(dev, file, mode_cmd))
> +		if (!malidp_verify_afbc_framebuffer(dev, file, info, mode_cmd))
>  			return ERR_PTR(-EINVAL);
>  	}
>  
> -- 
> 2.49.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
