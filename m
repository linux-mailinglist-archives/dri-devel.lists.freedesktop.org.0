Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD826E5664
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 03:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4B410E664;
	Tue, 18 Apr 2023 01:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1717B10E664
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 01:26:42 +0000 (UTC)
Received: from fews02-sea.riseup.net (unknown [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4Q0mV96sR0zDqBT;
 Tue, 18 Apr 2023 01:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1681781202; bh=/k3uHMSMc37Z5D4FrrF3sSlkIrsxaIyPtQ07VVzkDCI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sxjmY2Ly85KJkgx20C9B1hqgBOICadkzHdhzat0wY+PEyK2QNmma6C26bxYLNsyp6
 ZqED//eB/pTszLknvJkuSOq2eVbJBvucH/yfsRpcwNv43AnarNxHeMu0MhQPW6zHGc
 ITcNvb/un+F7kOPK7ELibnorbhHpivSAx9mw8VeI=
X-Riseup-User-ID: AFD48CF6BBE22807ADF7E141946395064539529E3777EE6AD905AD7C23BECF04
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4Q0mV56Y4mzFpmm;
 Tue, 18 Apr 2023 01:26:37 +0000 (UTC)
Message-ID: <e988b4e1-978d-286c-77f7-9affc1cf7a3d@riseup.net>
Date: Mon, 17 Apr 2023 22:26:34 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/6] drm/vkms: isolate pixel conversion functionality
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230417121056.63917-1-mcanal@igalia.com>
 <20230417121056.63917-2-mcanal@igalia.com>
From: Arthur Grillo Queiroz Cabral <arthurgrillo@riseup.net>
In-Reply-To: <20230417121056.63917-2-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17/04/23 09:10, Maíra Canal wrote:
> Currently, the pixel conversion functions repeat the same loop to
> iterate the rows. Instead of repeating the same code for each pixel
> format, create a function to wrap the loop and isolate the pixel
> conversion functionality.
> 
> Suggested-by: Arthur Grillo <arthurgrillo@riseup.net>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

I really liked how simple the conversion function turned out :-).

Reviewed-by: Arthur Grillo <arthurgrillo@riseup.net>

Regards,
~Arthur Grillo

> ---
>  drivers/gpu/drm/vkms/vkms_composer.c |   4 +-
>  drivers/gpu/drm/vkms/vkms_drv.h      |   4 +-
>  drivers/gpu/drm/vkms/vkms_formats.c  | 125 +++++++++++----------------
>  drivers/gpu/drm/vkms/vkms_formats.h  |   2 +-
>  drivers/gpu/drm/vkms/vkms_plane.c    |   2 +-
>  5 files changed, 56 insertions(+), 81 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 8e53fa80742b..80164e79af00 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -99,7 +99,7 @@ static void blend(struct vkms_writeback_job *wb,
>  			if (!check_y_limit(plane[i]->frame_info, y))
>  				continue;
>  
> -			plane[i]->plane_read(stage_buffer, plane[i]->frame_info, y);
> +			vkms_compose_row(stage_buffer, plane[i], y);
>  			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
>  					    output_buffer);
>  		}
> @@ -118,7 +118,7 @@ static int check_format_funcs(struct vkms_crtc_state *crtc_state,
>  	u32 n_active_planes = crtc_state->num_active_planes;
>  
>  	for (size_t i = 0; i < n_active_planes; i++)
> -		if (!planes[i]->plane_read)
> +		if (!planes[i]->pixel_read)
>  			return -1;
>  
>  	if (active_wb && !active_wb->wb_write)
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 4a248567efb2..f152d54baf76 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -56,8 +56,7 @@ struct vkms_writeback_job {
>  struct vkms_plane_state {
>  	struct drm_shadow_plane_state base;
>  	struct vkms_frame_info *frame_info;
> -	void (*plane_read)(struct line_buffer *buffer,
> -			   const struct vkms_frame_info *frame_info, int y);
> +	void (*pixel_read)(u8 *src_buffer, struct pixel_argb_u16 *out_pixel);
>  };
>  
>  struct vkms_plane {
> @@ -155,6 +154,7 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
>  /* Composer Support */
>  void vkms_composer_worker(struct work_struct *work);
>  void vkms_set_composer(struct vkms_output *out, bool enabled);
> +void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y);
>  
>  /* Writeback */
>  int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index d4950688b3f1..bd542fd00698 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -42,100 +42,75 @@ static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y
>  	return packed_pixels_addr(frame_info, x_src, y_src);
>  }
>  
> -static void ARGB8888_to_argb_u16(struct line_buffer *stage_buffer,
> -				 const struct vkms_frame_info *frame_info, int y)
> +static void ARGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>  {
> -	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
> -	u8 *src_pixels = get_packed_src_addr(frame_info, y);
> -	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
> -			    stage_buffer->n_pixels);
> -
> -	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
> -		/*
> -		 * The 257 is the "conversion ratio". This number is obtained by the
> -		 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
> -		 * the best color value in a pixel format with more possibilities.
> -		 * A similar idea applies to others RGB color conversions.
> -		 */
> -		out_pixels[x].a = (u16)src_pixels[3] * 257;
> -		out_pixels[x].r = (u16)src_pixels[2] * 257;
> -		out_pixels[x].g = (u16)src_pixels[1] * 257;
> -		out_pixels[x].b = (u16)src_pixels[0] * 257;
> -	}
> +	/*
> +	 * The 257 is the "conversion ratio". This number is obtained by the
> +	 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
> +	 * the best color value in a pixel format with more possibilities.
> +	 * A similar idea applies to others RGB color conversions.
> +	 */
> +	out_pixel->a = (u16)src_pixels[3] * 257;
> +	out_pixel->r = (u16)src_pixels[2] * 257;
> +	out_pixel->g = (u16)src_pixels[1] * 257;
> +	out_pixel->b = (u16)src_pixels[0] * 257;
>  }
>  
> -static void XRGB8888_to_argb_u16(struct line_buffer *stage_buffer,
> -				 const struct vkms_frame_info *frame_info, int y)
> +static void XRGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>  {
> -	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
> -	u8 *src_pixels = get_packed_src_addr(frame_info, y);
> -	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
> -			    stage_buffer->n_pixels);
> -
> -	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
> -		out_pixels[x].a = (u16)0xffff;
> -		out_pixels[x].r = (u16)src_pixels[2] * 257;
> -		out_pixels[x].g = (u16)src_pixels[1] * 257;
> -		out_pixels[x].b = (u16)src_pixels[0] * 257;
> -	}
> +	out_pixel->a = (u16)0xffff;
> +	out_pixel->r = (u16)src_pixels[2] * 257;
> +	out_pixel->g = (u16)src_pixels[1] * 257;
> +	out_pixel->b = (u16)src_pixels[0] * 257;
>  }
>  
> -static void ARGB16161616_to_argb_u16(struct line_buffer *stage_buffer,
> -				     const struct vkms_frame_info *frame_info,
> -				     int y)
> +static void ARGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>  {
> -	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
> -	u16 *src_pixels = get_packed_src_addr(frame_info, y);
> -	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
> -			    stage_buffer->n_pixels);
> +	u16 *pixels = (u16 *)src_pixels;
>  
> -	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
> -		out_pixels[x].a = le16_to_cpu(src_pixels[3]);
> -		out_pixels[x].r = le16_to_cpu(src_pixels[2]);
> -		out_pixels[x].g = le16_to_cpu(src_pixels[1]);
> -		out_pixels[x].b = le16_to_cpu(src_pixels[0]);
> -	}
> +	out_pixel->a = le16_to_cpu(pixels[3]);
> +	out_pixel->r = le16_to_cpu(pixels[2]);
> +	out_pixel->g = le16_to_cpu(pixels[1]);
> +	out_pixel->b = le16_to_cpu(pixels[0]);
>  }
>  
> -static void XRGB16161616_to_argb_u16(struct line_buffer *stage_buffer,
> -				     const struct vkms_frame_info *frame_info,
> -				     int y)
> +static void XRGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>  {
> -	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
> -	u16 *src_pixels = get_packed_src_addr(frame_info, y);
> -	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
> -			    stage_buffer->n_pixels);
> +	u16 *pixels = (u16 *)src_pixels;
>  
> -	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
> -		out_pixels[x].a = (u16)0xffff;
> -		out_pixels[x].r = le16_to_cpu(src_pixels[2]);
> -		out_pixels[x].g = le16_to_cpu(src_pixels[1]);
> -		out_pixels[x].b = le16_to_cpu(src_pixels[0]);
> -	}
> +	out_pixel->a = (u16)0xffff;
> +	out_pixel->r = le16_to_cpu(pixels[2]);
> +	out_pixel->g = le16_to_cpu(pixels[1]);
> +	out_pixel->b = le16_to_cpu(pixels[0]);
>  }
>  
> -static void RGB565_to_argb_u16(struct line_buffer *stage_buffer,
> -			       const struct vkms_frame_info *frame_info, int y)
> +static void RGB565_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>  {
> -	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
> -	u16 *src_pixels = get_packed_src_addr(frame_info, y);
> -	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
> -			       stage_buffer->n_pixels);
> +	u16 *pixels = (u16 *)src_pixels;
>  
>  	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
>  	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
>  
> -	for (size_t x = 0; x < x_limit; x++, src_pixels++) {
> -		u16 rgb_565 = le16_to_cpu(*src_pixels);
> -		s64 fp_r = drm_int2fixp((rgb_565 >> 11) & 0x1f);
> -		s64 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
> -		s64 fp_b = drm_int2fixp(rgb_565 & 0x1f);
> +	u16 rgb_565 = le16_to_cpu(*pixels);
> +	s64 fp_r = drm_int2fixp((rgb_565 >> 11) & 0x1f);
> +	s64 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
> +	s64 fp_b = drm_int2fixp(rgb_565 & 0x1f);
>  
> -		out_pixels[x].a = (u16)0xffff;
> -		out_pixels[x].r = drm_fixp2int(drm_fixp_mul(fp_r, fp_rb_ratio));
> -		out_pixels[x].g = drm_fixp2int(drm_fixp_mul(fp_g, fp_g_ratio));
> -		out_pixels[x].b = drm_fixp2int(drm_fixp_mul(fp_b, fp_rb_ratio));
> -	}
> +	out_pixel->a = (u16)0xffff;
> +	out_pixel->r = drm_fixp2int(drm_fixp_mul(fp_r, fp_rb_ratio));
> +	out_pixel->g = drm_fixp2int(drm_fixp_mul(fp_g, fp_g_ratio));
> +	out_pixel->b = drm_fixp2int(drm_fixp_mul(fp_b, fp_rb_ratio));
> +}
> +
> +void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y)
> +{
> +	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
> +	u8 *src_pixels = get_packed_src_addr(plane->frame_info, y);
> +	int limit = min_t(size_t, drm_rect_width(&plane->frame_info->dst),
> +			  stage_buffer->n_pixels);
> +
> +	for (size_t x = 0; x < limit; x++, src_pixels += plane->frame_info->cpp)
> +		plane->pixel_read(src_pixels, &out_pixels[x]);
>  }
>  
>  /*
> @@ -249,7 +224,7 @@ static void argb_u16_to_RGB565(struct vkms_frame_info *frame_info,
>  	}
>  }
>  
> -void *get_frame_to_line_function(u32 format)
> +void *get_pixel_conversion_function(u32 format)
>  {
>  	switch (format) {
>  	case DRM_FORMAT_ARGB8888:
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
> index 43b7c1979018..c5b113495d0c 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.h
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -5,7 +5,7 @@
>  
>  #include "vkms_drv.h"
>  
> -void *get_frame_to_line_function(u32 format);
> +void *get_pixel_conversion_function(u32 format);
>  
>  void *get_line_to_frame_function(u32 format);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index c41cec7dcb70..0a23875900ec 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -123,7 +123,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
>  	frame_info->offset = fb->offsets[0];
>  	frame_info->pitch = fb->pitches[0];
>  	frame_info->cpp = fb->format->cpp[0];
> -	vkms_plane_state->plane_read = get_frame_to_line_function(fmt);
> +	vkms_plane_state->pixel_read = get_pixel_conversion_function(fmt);
>  }
>  
>  static int vkms_plane_atomic_check(struct drm_plane *plane,
