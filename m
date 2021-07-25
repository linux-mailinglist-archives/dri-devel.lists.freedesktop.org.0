Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C253D4FB8
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 21:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C586E497;
	Sun, 25 Jul 2021 19:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0CE6E497
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 19:49:27 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 745913df-ed81-11eb-8d1a-0050568cd888;
 Sun, 25 Jul 2021 19:49:42 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id ABE99194B04;
 Sun, 25 Jul 2021 21:49:44 +0200 (CEST)
Date: Sun, 25 Jul 2021 21:49:23 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/5] drm: Define DRM_FORMAT_MAX_PLANES
Message-ID: <YP3AQ+llUEBW3JuN@ravnborg.org>
References: <20210725174438.24493-1-tzimmermann@suse.de>
 <20210725174438.24493-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210725174438.24493-2-tzimmermann@suse.de>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 melissa.srw@gmail.com, noralf@tronnes.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Sun, Jul 25, 2021 at 07:44:34PM +0200, Thomas Zimmermann wrote:
> DRM uses a magic number of 4 for the maximum number of planes per color
> format. Declare this constant via DRM_FORMAT_MAX_PLANES and update the
> related code. Some code depends on the length of arrays that are now
> declared with DRM_FORMAT_MAX_PLANES. Convert it from '4' to ARRAY_SIZE.
> 
> v2:
> 	* mention usage of ARRAY_SIZE() in the commit message (Maxime)
> 	* also fix error handling in drm_gem_fb_init_with_funcs()
> 	  (kernel test robot)
> 	* include <drm/drm_fourcc.h> for DRM_FORMAT_MAX_PLANES
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

One nit below.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 19 +++++++++++--------
>  include/drm/drm_fourcc.h                     | 13 +++++++++----
>  include/drm/drm_framebuffer.h                |  8 ++++----
>  include/drm/drm_gem_atomic_helper.h          |  3 ++-
>  4 files changed, 26 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index 67bc9edc1d98..421e029a6b3e 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -48,7 +48,7 @@
>  struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
>  					  unsigned int plane)
>  {
> -	if (plane >= 4)
> +	if (plane >= ARRAY_SIZE(fb->obj))
>  		return NULL;
>  
>  	return fb->obj[plane];
> @@ -62,7 +62,8 @@ drm_gem_fb_init(struct drm_device *dev,
>  		 struct drm_gem_object **obj, unsigned int num_planes,
>  		 const struct drm_framebuffer_funcs *funcs)
>  {
> -	int ret, i;
> +	unsigned int i;
> +	int ret;
>  
>  	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
>
This change looks accidental/unrelated.
But I guess it is to be consistent in use of unsigned int when
iterating the array.

> @@ -86,9 +87,9 @@ drm_gem_fb_init(struct drm_device *dev,
>   */
>  void drm_gem_fb_destroy(struct drm_framebuffer *fb)
>  {
> -	int i;
> +	size_t i;
>  
> -	for (i = 0; i < 4; i++)
> +	for (i = 0; i < ARRAY_SIZE(fb->obj); i++)
>  		drm_gem_object_put(fb->obj[i]);
>  
>  	drm_framebuffer_cleanup(fb);
> @@ -145,8 +146,9 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>  			       const struct drm_framebuffer_funcs *funcs)
>  {
>  	const struct drm_format_info *info;
> -	struct drm_gem_object *objs[4];
> -	int ret, i;
> +	struct drm_gem_object *objs[DRM_FORMAT_MAX_PLANES];
> +	unsigned int i;
> +	int ret;
>  
>  	info = drm_get_format_info(dev, mode_cmd);
>  	if (!info) {
> @@ -187,9 +189,10 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>  	return 0;
>  
>  err_gem_object_put:
> -	for (i--; i >= 0; i--)
> +	while (i > 0) {
> +		--i;
>  		drm_gem_object_put(objs[i]);
> -
> +	}
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_fb_init_with_funcs);
> diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
> index 3b138d4ae67e..22aa64d07c79 100644
> --- a/include/drm/drm_fourcc.h
> +++ b/include/drm/drm_fourcc.h
> @@ -25,6 +25,11 @@
>  #include <linux/types.h>
>  #include <uapi/drm/drm_fourcc.h>
>  
> +/**
> + * DRM_FORMAT_MAX_PLANES - maximum number of planes a DRM format can have
> + */
> +#define DRM_FORMAT_MAX_PLANES	4u
> +
>  /*
>   * DRM formats are little endian.  Define host endian variants for the
>   * most common formats here, to reduce the #ifdefs needed in drivers.
> @@ -78,7 +83,7 @@ struct drm_format_info {
>  		 * triplet @char_per_block, @block_w, @block_h for better
>  		 * describing the pixel format.
>  		 */
> -		u8 cpp[4];
> +		u8 cpp[DRM_FORMAT_MAX_PLANES];
>  
>  		/**
>  		 * @char_per_block:
> @@ -104,7 +109,7 @@ struct drm_format_info {
>  		 * information from their drm_mode_config.get_format_info hook
>  		 * if they want the core to be validating the pitch.
>  		 */
> -		u8 char_per_block[4];
> +		u8 char_per_block[DRM_FORMAT_MAX_PLANES];
>  	};
>  
>  	/**
> @@ -113,7 +118,7 @@ struct drm_format_info {
>  	 * Block width in pixels, this is intended to be accessed through
>  	 * drm_format_info_block_width()
>  	 */
> -	u8 block_w[4];
> +	u8 block_w[DRM_FORMAT_MAX_PLANES];
>  
>  	/**
>  	 * @block_h:
> @@ -121,7 +126,7 @@ struct drm_format_info {
>  	 * Block height in pixels, this is intended to be accessed through
>  	 * drm_format_info_block_height()
>  	 */
> -	u8 block_h[4];
> +	u8 block_h[DRM_FORMAT_MAX_PLANES];
>  
>  	/** @hsub: Horizontal chroma subsampling factor */
>  	u8 hsub;
> diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
> index be658ebbec72..f67c5b7bcb68 100644
> --- a/include/drm/drm_framebuffer.h
> +++ b/include/drm/drm_framebuffer.h
> @@ -27,12 +27,12 @@
>  #include <linux/list.h>
>  #include <linux/sched.h>
>  
> +#include <drm/drm_fourcc.h>
>  #include <drm/drm_mode_object.h>
>  
>  struct drm_clip_rect;
>  struct drm_device;
>  struct drm_file;
> -struct drm_format_info;
>  struct drm_framebuffer;
>  struct drm_gem_object;
>  
> @@ -147,7 +147,7 @@ struct drm_framebuffer {
>  	 * @pitches: Line stride per buffer. For userspace created object this
>  	 * is copied from drm_mode_fb_cmd2.
>  	 */
> -	unsigned int pitches[4];
> +	unsigned int pitches[DRM_FORMAT_MAX_PLANES];
>  	/**
>  	 * @offsets: Offset from buffer start to the actual pixel data in bytes,
>  	 * per buffer. For userspace created object this is copied from
> @@ -165,7 +165,7 @@ struct drm_framebuffer {
>  	 * data (even for linear buffers). Specifying an x/y pixel offset is
>  	 * instead done through the source rectangle in &struct drm_plane_state.
>  	 */
> -	unsigned int offsets[4];
> +	unsigned int offsets[DRM_FORMAT_MAX_PLANES];
>  	/**
>  	 * @modifier: Data layout modifier. This is used to describe
>  	 * tiling, or also special layouts (like compression) of auxiliary
> @@ -210,7 +210,7 @@ struct drm_framebuffer {
>  	 * This is used by the GEM framebuffer helpers, see e.g.
>  	 * drm_gem_fb_create().
>  	 */
> -	struct drm_gem_object *obj[4];
> +	struct drm_gem_object *obj[DRM_FORMAT_MAX_PLANES];
>  };
>  
>  #define obj_to_fb(x) container_of(x, struct drm_framebuffer, base)
> diff --git a/include/drm/drm_gem_atomic_helper.h b/include/drm/drm_gem_atomic_helper.h
> index d82c23622156..f9f8b6f0494a 100644
> --- a/include/drm/drm_gem_atomic_helper.h
> +++ b/include/drm/drm_gem_atomic_helper.h
> @@ -5,6 +5,7 @@
>  
>  #include <linux/dma-buf-map.h>
>  
> +#include <drm/drm_fourcc.h>
>  #include <drm/drm_plane.h>
>  
>  struct drm_simple_display_pipe;
> @@ -40,7 +41,7 @@ struct drm_shadow_plane_state {
>  	 * The memory mappings stored in map should be established in the plane's
>  	 * prepare_fb callback and removed in the cleanup_fb callback.
>  	 */
> -	struct dma_buf_map map[4];
> +	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
>  };
>  
>  /**
> -- 
> 2.32.0
